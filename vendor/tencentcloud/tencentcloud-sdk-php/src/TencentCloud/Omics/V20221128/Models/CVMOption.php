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
namespace TencentCloud\Omics\V20221128\Models;
use TencentCloud\Common\AbstractModel;

/**
 * 云服务器配置。
 *
 * @method string getZone() 获取云服务器可用区。
 * @method void setZone(string $Zone) 设置云服务器可用区。
 * @method string getInstanceType() 获取云服务器实例规格。
 * @method void setInstanceType(string $InstanceType) 设置云服务器实例规格。
 */
class CVMOption extends AbstractModel
{
    /**
     * @var string 云服务器可用区。
     */
    public $Zone;

    /**
     * @var string 云服务器实例规格。
     */
    public $InstanceType;

    /**
     * @param string $Zone 云服务器可用区。
     * @param string $InstanceType 云服务器实例规格。
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
        if (array_key_exists("Zone",$param) and $param["Zone"] !== null) {
            $this->Zone = $param["Zone"];
        }

        if (array_key_exists("InstanceType",$param) and $param["InstanceType"] !== null) {
            $this->InstanceType = $param["InstanceType"];
        }
    }
}
