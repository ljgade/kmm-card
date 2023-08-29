<?php
/*
 * Copyright (c) 2017-2018 THL A29 Limited, a Tencent company. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
namespace TencentCloud\Vod\V20180717\Models;
use TencentCloud\Common\AbstractModel;

/**
 * 视频画面质量评价的控制参数。
 *
 * @method string getSwitch() 获取视频画面质量评价检测开关，可选值：
<li>ON：开启；</li>
<li>OFF：关闭。</li>
 * @method void setSwitch(string $Switch) 设置视频画面质量评价检测开关，可选值：
<li>ON：开启；</li>
<li>OFF：关闭。</li>
 * @method integer getScore() 获取视频画面质量评价过滤阈值，结果只返回低于该值的时间段，默认值为 60。
 * @method void setScore(integer $Score) 设置视频画面质量评价过滤阈值，结果只返回低于该值的时间段，默认值为 60。
 */
class QualityEvaluationConfigureInfo extends AbstractModel
{
    /**
     * @var string 视频画面质量评价检测开关，可选值：
<li>ON：开启；</li>
<li>OFF：关闭。</li>
     */
    public $Switch;

    /**
     * @var integer 视频画面质量评价过滤阈值，结果只返回低于该值的时间段，默认值为 60。
     */
    public $Score;

    /**
     * @param string $Switch 视频画面质量评价检测开关，可选值：
<li>ON：开启；</li>
<li>OFF：关闭。</li>
     * @param integer $Score 视频画面质量评价过滤阈值，结果只返回低于该值的时间段，默认值为 60。
     */
    function __construct()
    {

    }

    /**
     * For internal only. DO NOT USE IT.
     */
    public function deserialize($param)
    {
        if ($param === null) {
            return;
        }
        if (array_key_exists("Switch",$param) and $param["Switch"] !== null) {
            $this->Switch = $param["Switch"];
        }

        if (array_key_exists("Score",$param) and $param["Score"] !== null) {
            $this->Score = $param["Score"];
        }
    }
}
