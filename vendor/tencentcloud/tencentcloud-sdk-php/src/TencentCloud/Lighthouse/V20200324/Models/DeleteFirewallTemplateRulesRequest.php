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
namespace TencentCloud\Lighthouse\V20200324\Models;
use TencentCloud\Common\AbstractModel;

/**
 * DeleteFirewallTemplateRules请求参数结构体
 *
 * @method string getTemplateId() 获取防火墙模板ID。
 * @method void setTemplateId(string $TemplateId) 设置防火墙模板ID。
 * @method array getTemplateRuleIds() 获取防火墙模板规则ID列表。
 * @method void setTemplateRuleIds(array $TemplateRuleIds) 设置防火墙模板规则ID列表。
 */
class DeleteFirewallTemplateRulesRequest extends AbstractModel
{
    /**
     * @var string 防火墙模板ID。
     */
    public $TemplateId;

    /**
     * @var array 防火墙模板规则ID列表。
     */
    public $TemplateRuleIds;

    /**
     * @param string $TemplateId 防火墙模板ID。
     * @param array $TemplateRuleIds 防火墙模板规则ID列表。
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
        if (array_key_exists("TemplateId",$param) and $param["TemplateId"] !== null) {
            $this->TemplateId = $param["TemplateId"];
        }

        if (array_key_exists("TemplateRuleIds",$param) and $param["TemplateRuleIds"] !== null) {
            $this->TemplateRuleIds = $param["TemplateRuleIds"];
        }
    }
}
