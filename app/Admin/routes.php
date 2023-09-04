<?php

//use App\Admin\Controllers\SceneCategoryController;
//use App\Admin\Controllers\MusicCategoryController;
//use App\Admin\Controllers\UserController;
use Encore\Admin\Facades\Admin;
use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', [\App\Admin\Controllers\HomeController::class, 'index'])->name('home');
    $router->get('scene/crawl', [\App\Admin\Controllers\SceneCrawlController::class, 'index']);
    $router->resource('user', UserController::class);
    $router->resource('scene', SceneController::class);
    $router->resource('category/scene', SceneCategoryController::class);
    $router->resource('category/music', MusicCategoryController::class);
    $router->any('category/subCategory', [\App\Admin\Controllers\SceneCategoryController::class, 'getSubCategoryList']);
});
