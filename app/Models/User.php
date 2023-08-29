<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    public const GROUP_NORMAL = 1;
    public const GROUP_VIP = 2;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $guarded = [];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
    ];

    public static function updateOrCreate($name, $openid, $avatar)
    {
        $user = self::query()
            ->where('wx_openid', $openid)
            ->first();
        if (!$user) {
            $user = new self([
               'name' => $name,
               'avatar' => $avatar,
               'password' => bcrypt(uniqid()),
               'wx_openid' => $openid
            ]);
            $user->save();
        } else {
            $user->update([
                'name' => $name,
                'avatar' => $avatar,
                'wx_openid' => $openid
            ]);
        }
        return $user;

    }

    public function isVIP()
    {
        return !empty($this->group) && !empty($this->end_time)
            && $this->group == self::GROUP_VIP && $this->end_time >= date('Y-m-d');
    }
}
