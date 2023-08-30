<?php

namespace App\Http\Controllers;

use App\Models\User;
use EasyWeChat\OpenPlatform\Application;
use EasyWeChatComposer\EasyWeChat;
use GuzzleHttp\Exception\GuzzleException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Jenssegers\Agent\Agent;

class AuthController extends Controller
{
    public function wxOpenVerify(Request $request)
    {
        $echoStr = $request->input('echostr');
        $signature = $request->input('signature');
        $timestamp = $request->input('timestamp');
        $nonce = $request->input('nonce');
        $token = config('wechat.open_platform.default.token');
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode($tmpArr);
        $tmpStr = sha1($tmpStr);
        if ($tmpStr == $signature) {
            exit($echoStr);
        } else {
            exit('failed');
        }
    }

    /**
     * @throws GuzzleException
     */
    public function wx_auth(Request $request)
    {
        if (Auth::hasUser()) {
            return redirect()->away(route('view.home'));
        }
        $wechat = session('wechat.oauth_user.default');
        $openid = $wechat['id'];
        $nickName = $wechat['nickname'];
        $avatar = $wechat['avatar'];
        $avatar = storeFile($avatar, 'scene');
        $user = User::updateOrCreate($nickName, $openid, $avatar);
        Auth::loginUsingId($user->id);
        $request->session()->regenerate();
        return redirect()->away(route('view.home'));
    }

    public function wx_open_auth(Request $request)
    {
        if (Auth::hasUser()) {
            return redirect()->away(route('view.home'));
        }
        /**
         * @var $openPlatform Application
         */
        $openPlatform = app('wechat.open_platform');
        $authCode = md5(uniqid());
        $request->session()->put('authCode', $authCode);
        return redirect()->away($openPlatform->getPreAuthorizationUrl(route('api.wxOpenLogin')));
    }

    public function wx_open_login(Request $request)
    {
        /**
         * @var $openPlatform Application
         */
        $openPlatform = app('wechat.open_platform');
        $user = $openPlatform->oauth->user();
        $unionid = $user['original']['unionid'];
        $openid = $user['original']['openid'];
    }

    public function phone_auth(Request $request)
    {
        $phone = $request->input('username');
        $password = $request->input('password');
        $user = User::query()->where('phone', $phone)->first();
        if (empty($user)) {
            return $this->error('手机号不存在');
        }
        if (decrypt($user->password) != $password) {
            return $this->error('密码不正确');
        }
        Auth::loginUsingId($user->id);
        return $this->success();
    }

    public function login()
    {
        $agent = new Agent();
        $loginUrl = 'javascript:;';
        if ($agent->isWeChat()) {
            $loginUrl = route('api.wxAuth');
        } elseif (!$agent->isMobile() && !$agent->isTablet()) {
            $loginUrl = route('api.wxOpenAuth');
        }
        return view('login', ['loginUrl' => $loginUrl]);
    }

    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return $this->successMsg('已成功退出');
    }
}
