<?php

use App\Models\Scene;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Storage;

function getDomain(): string
{
    return rtrim(env('APP_URL', 'https://m.daxitie.com/'), '/') . '/';
}

function getDomainArr(): array
{
    return [
        'editor_domain' => getDomain(),
        'api_domain' => getDomain(),
        'preview_domain' => getDomain(),
        'api_host' => $_SERVER['HTTP_HOST'],
        'upload_api' => parse_url(getDomain(), PHP_URL_HOST) . parse_url(route('api.upload'), PHP_URL_PATH)
    ];
}

/**
 * @throws \GuzzleHttp\Exception\GuzzleException
 */
function storeFile($path, $disk = 'scene'): string
{
    $fileName = getFileMd5($path);
    $extension = pathinfo($path)['extension'] ?? '';
    $fullName = $fileName . (!empty($extension) ? ('.' . $extension) : '');
    $query = parse_url($path, PHP_URL_QUERY);
    if (!Storage::disk($disk)->exists($fullName)) {
        try {
            if (strpos($path, '/tmp/') !== false) {
                $contents = file_get_contents($path);
            } else {
                $contents = (new Client(['verify' => false]))->request('GET', $path)->getBody()->getContents();
            }
            Storage::disk($disk)->put($fullName, $contents);
        } catch (\Exception $e) {
        }
    }
    if (!empty($query)) {
        return $fullName . '?' . $query;
    }
    return $fullName;
}

function getFileMd5($file)
{
    try {
        return md5_file($file);
    } catch (\Exception $e) {
        return md5($file);
    }
}

function generateSceneCode()
{
    $tryCount = 0;
    while($tryCount < 5) {
        $code = strtoupper(uniqid('DXT'));
        if (!Scene::query()->where('code', $code)->exists()) {
            return $code;
        }
        $tryCount++;
    }
    admin_error('生成模板编号失败，请重试');
    return back();
}


