<?php

namespace App\Admin\Forms;

use App\Models\Category;
use App\Models\Scene;
use App\Models\ScenePage;
use Encore\Admin\Widgets\Form;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\GuzzleException;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class SceneCrawl extends Form
{
    /**
     * The form title.
     *
     * @var string
     */
    public $title = '模板采集';

    /**
     * Handle the form request.
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\RedirectResponse
     * @throws GuzzleException
     */
    public function handle(Request $request)
    {
        $code = $request->input('code');
        $mainClassId = $request->input('mainClassId');
        $subClassId = $request->input('subClassId');

        if (Scene::query()->where('source_code', $code)->exists()) {
            admin_error('模板[' . $code . ']已存在');
            return back();
        }

        /**
         * @var Scene $sceneModel
         * @var ScenePage[] $scenePageModelList
         */
        list($id, $sceneModel) = $this->getSceneModel($code, $mainClassId, $subClassId);
        $scenePageModelList = $this->getScenePageList($id);

        DB::transaction(function () use ($sceneModel, $scenePageModelList) {
            $sceneModel->save();
            $sceneId = $sceneModel->id;
            foreach ($scenePageModelList as $page) {
                $page->scene_id = $sceneId;
                $page->save();
            }
        });

        admin_success('模板[' . $code . ']采集成功');
        return back();
    }

    private function getSceneModel($code, $mainClassId, $subClassId)
    {
        $client = new Client();
        $url = 'http://m.kameimei.cn/v/' . $code . '?b=1';
        $response = $client->request('GET', $url);
        $response = $response->getBody()->getContents();
        $matches = [];
        preg_match('/var scene = (.+?);<\/script>/', $response, $matches);
        $sceneData = json_decode(trim($matches[1]), true);
        if (empty($sceneData) || empty($sceneData['id'])) {
            admin_error('获取卡美美[' . $code . ']模板信息失败，请确认后重试');
            return back();
        }

        $id = $sceneData['id'];
        $cover = $sceneData['cover'];
        $sceneData['cover'] = storeFile($cover, 'scene');
        $musicUrl = $sceneData['bgAudio']['url'] ?? '';
        if (!empty($musicUrl)) {
            $sceneData['bgAudio']['url'] = storeFile($musicUrl, 'scene');
        }
        $sceneData['main_class_id'] = $mainClassId;
        $sceneData['sub_class_id'] = $subClassId;

        $attrs = Arr::only($sceneData, [
            'name',
            'description',
            'cover',
            'is_luckmoney',
            'is_gift',
            'is_wish',
            'price',
            'main_class_id',
            'sub_class_id',
            'is_show_btn',
            'is_show_preview',
            'is_show_guide',
            'is_wish_h5',
            'barrage_text',
            'end_page'
        ]);
        foreach ($attrs as $key => $val) {
            if ($val === null) {
                $attrs[$key] = '';
            }
        }
        if (empty($sceneData['property'])) {
            $sceneData['property'] = [
                'wxCount' => 0,
                'autoFlipTime' => 3,
                'yqcAd' => false,
                'autoFlip' => false,
                'slideNumber' => true,
                'triggerLoop' => true,
                'forbidHandFlip' => false,
                'shareDes' => [
                    'title' => $sceneData['name'],
                    'description' => $sceneData['description'],
                ],
                'wxClickFarmerCount' => 0,
                'editorModel' => 1,
            ];
        }
        $attrs = array_merge($attrs, [
            'code' => $this->generateSceneCode(),
            'source_code' => $sceneData['code'],
            'property' => json_encode($sceneData['property']),
            'music_url' => $sceneData['bgAudio']['url'],
        ]);
        return [$id, new Scene($attrs)];
    }

    private function generateSceneCode()
    {
        $tryCount = 0;
        while ($tryCount < 5) {
            $code = strtoupper(uniqid('DXT'));
            if (!Scene::query()->where('code', $code)->exists()) {
                return $code;
            }
            $tryCount++;
        }
        admin_error('生成模板编号失败，请重试');
        return back();
    }

    private function getScenePageList($id)
    {
        $result = [];
        $client = new Client();
        $url = 'http://m.kameimei.cn/h5/view/info?id=' . $id;
        $response = $client->request('GET', $url);
        $response = $response->getBody()->getContents();
        $pageResponse = json_decode($response, true);
        $srcFields = ['src', 'originSrc', 'svgSrc', 'maskSrc', 'imgSrc'];
        foreach ($pageResponse['data']['list'] as $pageItem) {
            $property = $pageItem['properties'];
            $extend = $pageItem['extend'];
            $content = $pageItem['elements'];
            $num = $pageItem['num'];
            foreach ($content as &$element) {
                foreach ($srcFields as $field) {
                    $src = $element['properties'][$field] ?? '';
                    if (!empty($src)) {
                        $element['properties'][$field] = $this->storeSrcFile($src);
                    }
                }
            }
            if (!empty($property['thumbSrc'])) {
                $property['thumbSrc'] = $this->storeSrcFile($property['thumbSrc']);
            }
            $result[] = new ScenePage([
                'num' => $num,
                'content' => $content,
                'extend' => $extend,
                'property' => $property
            ]);
        }
        return $result;
    }

    private function storeSrcFile($src)
    {
        if (empty($src)) {
            return '';
        }
        if (strpos($src, '.cn') === false) {
            $src = 'http://album.h5.kameimei.cn/' . ltrim($src, '/');
        }
        return storeFile($src, 'scene');
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $this->text('code', '卡美美模板编码')->rules('required');
        $topCategoryList = Category::query()
            ->where('type', 1)
            ->where('pid', 0)
            ->orderBy('sort')
            ->pluck('name', 'id')->toArray();
        $this->select('mainClassId', '一级品类')->options($topCategoryList)
            ->load('subClassId', '/admin/category/subCategory')->rules('required');
        $this->select('subClassId', '二级品类')->rules('required');
    }

    public static function recentlyCrawlSceneList()
    {
        $dbSceneList = Scene::query()
            ->with(['mainClass', 'subClass'])
            ->where('user_id', 0)
            ->limit(5)
            ->orderByDesc('id')
            ->get();
        $sceneList = [];
        foreach ($dbSceneList as $scene) {
            $sceneList[] = [
                'name' => $scene['name'],
                'code' => $scene['source_code'],
                'link' => '/v/' . $scene['code'],
                'cover' => Storage::disk('scene')->url($scene['cover']),
                'create_time' => $scene['create_time'],
                'category' => $scene->mainClass->name . '-' . $scene->subClass->name,
            ];
        }
        return view('admin.recently_crawl', compact('sceneList'));
    }


}
