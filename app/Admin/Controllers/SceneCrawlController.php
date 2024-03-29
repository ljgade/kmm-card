<?php

namespace App\Admin\Controllers;

use App\Admin\Forms\SceneCrawl;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;

class SceneCrawlController extends AdminController
{
    public function index(Content $content)
    {
        $crawlForm = new SceneCrawl();
        return $content
            ->title('模板采集')
            ->description('本采集功能目前仅支持卡美美模板采集')
            ->row(function (Row $row) use ($crawlForm) {

                $row->column(7, function (Column $column) use ($crawlForm) {
                    $column->append($crawlForm->render());
                });

                $row->column(5, function (Column $column) {
                    $column->append(SceneCrawl::recentlyCrawlSceneList());
                });
            });
    }
}
