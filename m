Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022119.outbound.protection.outlook.com [40.107.75.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3082296BCF;
	Thu, 17 Sep 2026 03:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614449; cv=fail; b=PkhoJJr7Z0yzDZE2uWF/BtLxtsmuenbaFsM5PND+/o46X1FazIu6d4jWo8tkWUsiJOj4CzTFDd3GT8ASOjZD5SlXMrHqEEooAA6ZcHmgkYwjdA+PVdw5HrBR0OmAeQEbhyfsP1PDuueJpRDENG1EUpZUREHMg92t/ZRGMu3+h2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614449; c=relaxed/simple;
	bh=oR1eot1zSxhvkxG4nh2IFXgAJ3EDz4ahx4HeyFxNsY8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l42rZOWaS02Ad27mqYW/lulB54wmhCNJjgBkgeiVpDH5zwRP/gn3B67s2q8o+FtEFw9FrU5FocaC9tee9uAP4Mkr5pAGsiptJmfow8weQP+n5vm3dVLk0xJXprPG5qHLux3TJ4qXx8nUXNQ2Ib8oboChga3cUUtFHnL2/dlOvNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=fOh1M8xu; arc=fail smtp.client-ip=40.107.75.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="fOh1M8xu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcnip0W/pDzoRD/TXGCRm4ieIEkRTdLhVcybq2r2r0u58aZaZL7g2Iz2Q40RzeZVU5lT4ILAwR1/ZurlT7YLk4APS8RvRXjp6h6S0Ed+JoPXU3Bg1TfvfD3gcvS1oeeWgLo/eW9VJZIcWIWe7EJV0ZoQcRMADP2wndYv4f2qBuYYcBz8xUQW0WAXtMLTtTRPr11eY6JIVHofuTxmKU45KATn+bK5acEi2d0FDTo7fNPIF/+m4TixWXXiA17CS9z9cOCClupNM+UE47Kp1OLgzYzpW9Sq0iqeakPwbYeVQZEHwZbZbE4rqU3ZcVNv1W1yKXHJpN80R6zIRrDhF7yXWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/Br1j44rWw4aWXxj20HxUCf8rvxxOPSrGp031/z63o=;
 b=myoofK/fbNzWYwd8a6Us6bReK2+YPG0T7ZzY/PEM7Bkqj9aV4Dt4lM7SHcBL3pbqTqOVa0XgLp8t1RecZ01yj7NHR2jEvfwBYb25znhwa66OBzrQZezfevuRZA8NhmhXxQphZBCyfJaridgfP5y9rAJOFqmawPym7q8XlCZUW8eqeBSisggh+xdpp+kp9HyHikZ+Ll+SsDC+8aaZdwxLtLQpao4e603V6i26SMDlOqK901L94rBa2C5N3dijdCQlB0vXufB+YmJ5QER2kgcrMzZVOTbvmupoDAIcESd9ZP11SdvIOf/h7Ctf+Z7Z6IpcC/sqSJE383VHQLJuTkVO6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/Br1j44rWw4aWXxj20HxUCf8rvxxOPSrGp031/z63o=;
 b=fOh1M8xuAJ64DyMGyui0plFxxKu2ibI+Hqg0kiTRaqYa6tLd3aXN/ZAiMU0MSJniWX7xrDl/PIbjOm2x75jt5PBonDpsOEh7BmPxNZCP+++bbSOhz4MdY1qVh1AlTCzkD53v6MnJbmPxw2Lr6BSaYOcQs3w8XHuOfT/+zUkHCiDzpk+WV9moxh9QMzbkVJhrhYJP2YxxcImzMJx/mu/4iKOPEkxBLvZAdyhQBWI+z6993gRqYbJRLPRXJrM8CmVpGY3ORaNYGx8lyGLFTBVjv9Z0CBovzz7IRqffoggrm9tQzMj1iT/2xBTh9Xl4uf2kTZAnPwqTj2eU/VKJqzrz0A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SEYPR03MB6628.apcprd03.prod.outlook.com (2603:1096:101:81::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 03:07:15 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 03:07:15 +0000
Message-ID: <37bbcf5c-644a-4388-ba8b-11608f444ae3@amlogic.com>
Date: Thu, 17 Sep 2026 11:07:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
 <20260914-b4-s4-vdec-upstream-v9-3-72fdb0d71b02@amlogic.com>
 <20260916-fat-enthusiastic-termite-44b2e2@quoll>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <20260916-fat-enthusiastic-termite-44b2e2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0089.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::15) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SEYPR03MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0ac331-2330-43c7-a711-08df1468c6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|4143699003|3023799007|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ZQMhwo/irEERRfV8w857VXmy28Lumlo/mKBm3n1k8ePcweYpDQTXW98cHYCxgHZ5AWzuXARwnjGBqJdWceUNQQdKvLojUnMFq100B8+BMtrgiVI8CoKaDt+f04CDvZL+9CIUEBCD0sJlKJvHE48WcYEAtQHS46lKQh7nn6DG8XVyWYx14qcRLr/3Do1Py1jcSkx3uZcPL6BKCXqV0xKPLQ37XKeyaVS4yiArAmDc2wiOf8q4ZEgc2D+BFzh8MuxlFOsUxIriwtoEeqfq3+Co3oRN5bVujsYgGGnyaIim5PkZSAlwwO59PFM598jNKSV2mXRceTix+UydwdDCCQyWSV1ZW4eQkuuQB1xGhU70TpSmiVOfDcpj4YGmleiOZjZ4maNU2Xt9cDTACrbQYt7ZzxmK+tqrWkrkBgBfSR1IdooCVDBNO+iWpj2ZUWZWsHUIYrFQyj7HLo0Z94Y62iFHJ2riyUHT6SzgheBZTMFZBnt/IFUmdbloqUMga21eAFhWUrehjAhpWDS5sF+ya0dOtPAGWv6KwhGc34dS1UCDABSXRKkuYaEBUXyaSrp3FZSg0trUaQVQB96uyuJYuCXvzIfKbb1+7UzG/nYjnDWY7mfdReqFDz/SfA3PnOpXJ4UR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(4143699003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDRHSHROTmR2YUVic1Nzc3BiLzl0K29SdzhGSnNDbHNDRTdIQ042VjdiNTNt?=
 =?utf-8?B?NU4rRVM2QUZhSFp4RlRWMlExaSswQmNtdDZkRnA1Sm0rUVdHQStydGFEcXR1?=
 =?utf-8?B?VmViN2E2TTNsa3ZQQi9oWkQwcWEyR3FEamF0YVJseHdrOWwzRTlETHJnMnBW?=
 =?utf-8?B?N1lTMFI4U1Z3WFVoeXBYU1RnNlZ5bno3M1hvRjdzcGxJMDRqeUhQNjVyODBR?=
 =?utf-8?B?akNpbjBkdWNJRHo0am82aGVwbUV2aUl1S2syQ0dPcUpLK1RiM1JuaGs5VWtR?=
 =?utf-8?B?QUptdlhJZzZHazBCWC9Ca1JYR0pSSkd3UWNYbHFUSkh0SjZYQnlXNTdDUTcz?=
 =?utf-8?B?OUMxcmVhQ3FVdnBTaUR2YkdkaU10N2JzdkNOMGtieFU3WGs2UWxib2tEMjlB?=
 =?utf-8?B?NmMxdysrTmhpdFdiZGEySFlpNkNyRTcya3UzajRmTlR6a0E4SEpEbVBPL0ZO?=
 =?utf-8?B?TlI2ZzVqQUJidEJFbHlsb09tZkNMVk5vbmsvY0ZqUDQwa254WjJManIvb3Z4?=
 =?utf-8?B?SUhFcnpzSkJjSkQ0ZnN0V2trQ2hOVnZ0azd0aHltRUhGR2srNy91a1J2QnRu?=
 =?utf-8?B?ZWNjc3F3RGtZMVl2QXJtcnJUMm0xaG1ZcDJHTWtwOWhId2s2NDZxVmpBT0dw?=
 =?utf-8?B?VkJyaU9WMEpMbnRtaGcxRlp4L29SbnZ0Ly9sclFmanpZSjloY2xHR3VHelhB?=
 =?utf-8?B?dlpYRE5oTGNCSmRrRU8va0NqNU9OMFk0bVFiS2UzMFYweVpVTm9HY0R5OS8y?=
 =?utf-8?B?ZW1Gd3UzRWQ4VjdUSkU0SHNhYmJlcklLNHBKMWs1UFdWeEpCV0xLTnV2RW5H?=
 =?utf-8?B?WEZjd3pKd0ZsWit4V0pkdkkyeWFrVWk3ajB4T0pNaGhxamRkaDE5ZjIwVVVy?=
 =?utf-8?B?SnY1WThpZkZWVnFrMyt6SjdvYnpDckZXUFh0QmJKN2tSamlySXJ3QXQzbDNs?=
 =?utf-8?B?blk5YjZqTzFEazVhaTNqMExURk9IS0JsTXZCMXJHMEJ3MnQwSnpaeVl4dWkv?=
 =?utf-8?B?Yk5ob0FkNlVQTDRndXhrQjlnOHdYMFJTejBBRVNxaGRDTjBkZ1B2QjZoUmlk?=
 =?utf-8?B?dFNVVk55ZFo1L2o4TTVVRHNjbU9KVEs4RC9YdlJsQmlSTWl2RVhjdWY0eFh5?=
 =?utf-8?B?YWowR2t6RE83R0E0UFZPVld4bGZsRXNlRzdGWWsyanY4WnRrNmEvdzdrR2xR?=
 =?utf-8?B?ZmRwN0IrMWwwSkNEYTgrek42VmpXSVo4cmQ0Mm1zN0xWNUZ0dWQ2dlpiTnFZ?=
 =?utf-8?B?c0o5N0x4T1FGcTBSL3ExS3UyNFRKcDhTRGhhYU5jMVl2ZSt0citRNTNyTmlW?=
 =?utf-8?B?citTZk5DZHFDSDJkVDNIODhsV0E5MHA3ZTdRU3Y3OW11cnVuMGZYL0xqcGNk?=
 =?utf-8?B?ZEZaSU4zZW5ENTBGb0l0a0NUMm42SmNNRkRucXVyMEVDbTdNeVlNdXdlUCtL?=
 =?utf-8?B?RTVDOGN0Y29QekswVCtWSStvK0d3Tkswb1QzU0tja0RxeWh2MXV2cmExT01U?=
 =?utf-8?B?dXR4TmJVNGxUR3pZWmlmTVVoL2lNMUo1eXlsdEgzNGRDWmxTMm9jbTFJK25m?=
 =?utf-8?B?LzYvYUV3UGJKL0RoMEoyQ05QWXdsOEpGVFZBSXVyRzRUeXZEaWw1VGp3a0Np?=
 =?utf-8?B?amdETWZ6ZHZvUmM0SUVHWklkbEFpRWhXa095eEQxR2dJT1NaMllCZmcrZzZL?=
 =?utf-8?B?RHEweWpaNlhkM2ZJY3pueWE0dXpzY3RJOU9ZTTJSNEQ5alYvZXp4U2ozMEhu?=
 =?utf-8?B?L2l1cDdRU2tDZzdMV0ZrbEV4MXBkeVdmQ2lOZ0gwbnp6UlpHM3NyZjdPUncy?=
 =?utf-8?B?Z21yZGQ3YmVXY0toY2JSWFFWSi90M2tkK2Ewc3VJMjB0M0xYTVRDdHh4NGxD?=
 =?utf-8?B?OXQrTk54N211R0VZQmI5ekJKYUlCbHUxNmEyeWNYZUYxN2FFWjBPMnJ4bFM0?=
 =?utf-8?B?ZEZUYzFTaUhpbUgzV2c5Zi9iVlhKbTFRNENudW1CaUdPaWV1SHBuaGhxbUI0?=
 =?utf-8?B?UE5hT1ZCMXB4K0tEejJJNEQ5c3craWozVVJjdlZnY1lGTzIxb0pvaTdVSWNI?=
 =?utf-8?B?WHJZV2RvMlJGOU1SK2JMOGZQdEU0dDk0MWlTY0tUZURvQ1NkTmU1enVLclV4?=
 =?utf-8?B?ckJIYVJYRzl4QVo2TDB5eWxYZTRyWTk3UEpEYlJjSjg4Z3ZYQk1RODFQd2hI?=
 =?utf-8?B?dU04ZllWQnFlR25RN3VDVkJoSlV4WGM3dFN3UjBZdjFyR0s4Q3F2a0hGZHNt?=
 =?utf-8?B?QXZMbWlVWVd0d2xXWWFGdWdXcy9PS1JPRWJQOEd4amRPTzhTSTJLY3FMemQy?=
 =?utf-8?B?OTNCVmNWeS9oMTZob0ZHSnBGL1lOVGY3Q2xycU1JSEJ5UVdBbGJVQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0ac331-2330-43c7-a711-08df1468c6cb
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 03:07:15.5887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+GGjPVcR8qQE+tp55ZDpHaq7QTmMHZOXCFYU6vpRIaSuFJyz3Fqs51Z++t0D67xmSdJBXDpFeLxhDB6lhBhNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6628

Hi Krzysztof,

> On Mon, Sep 14, 2026 at 04:10:20PM +0800, Zhentao Guo wrote:
>> Describe the initial support for the V4L2 stateless video decoder
>> driver used with the Amlogic S4 (S805X2) platform.
> Drop driver. Describe the hardware instead.
OK，got it.
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>>   .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
>>   1 file changed, 114 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>> new file mode 100644
>> index 000000000000..d350b3e68a38
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>> @@ -0,0 +1,114 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Video Decode Accelerator
>> +
>> +maintainers:
>> +  - Zhentao Guo <zhentao.guo@amlogic.com>
>> +
>> +description:
>> +  The Video Decoder Accelerator present on Amlogic SOCs.
>> +  It supports stateless h264 decoding.
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,s4-vdec
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dos
>> +      - const: dmc
>> +
>> +  interrupts:
>> +    maxItems: 2
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: core_hvdec
>> +      - const: core_vdec
> Drop "core_" from both... or rather some consistency would be more
> useful. Below you call them core_v and core_h, but there is also:
>
>> +
>> +  clocks:
>> +    items:
>> +      - description: Clock for dos core
> core dos?

To explain this, I would like to show you the structure diagram of the 
Amlogic hardware decoder IP:

+-----------+------------------------+
|           |                        |
|           |        vdec            |
|           |                        |
|    dos    +------------------------+
|           |                        |
|           |        hvdec           |
|           |                        |
+-----------+------------------------+

The IP consists of three cores. Dos core is in the front of the IP, 
which controls the rest two cores. The actual hardware decoding is 
handled by the two cores vdec and hvdec.

Each of the three cores has its own independent clock source.

>> +      - description: Clock for vdec core
>> +      - description: Clock for hvdec core
>> +
>> +  clock-names:
>> +    items:
>> +      - const: dos
>> +      - const: core_v
> hvdec?
>
>> +      - const: core_h
> vdec? to keep the naming and order of interrupts?
Actually, in the interrupt vector table they are arranged exactly this 
way: hvdec comes first, followed by vdec. This is indeed the reverse of 
the order used for clk and power-domain.
>> +
>> +  power-domains:
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: dos_v
>> +      - const: dos_h
> So there is also dos variant v and h?
>
> Pretty confusing.

That is indeed a bit odd, I'll give them new names.

Also, I'd like to ask your advice on these names. I remember that in 
your review comments on v7, you mentioned that having "vdec" as the 
module name and then reusing it for the clock/interrupt/power-domain 
name felt repetitive. But as shown in the diagram above, the decoder 
hardware does have a sub-core called vdec, so do you think it is 
appropriate if I'm also using "vdec" to name its clock, power-domain, 
and interrupt, to indicate that these all used by vdec core? I would be 
grateful for your feedback on this.
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  amlogic,canvas:
>> +    description: Canvas maintains an index-to-physical-address
>> +     mapping table that allows the 16-bit AMRISC decoder core
>> +     to access 32-bit or 64-bit physical address.
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  amlogic,secure-monitor:
>> +    description: Used to decrypt and load the signed decoder
>> +     firmware through ARM SMC (Secure Monitor Call).
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - power-domains
>> +  - power-domain-names
>> +  - resets
>> +  - amlogic,canvas
>> +  - amlogic,secure-monitor
>> +
>> +additionalProperties: false
> Best regards,
> Krzysztof

BRs

Zhentao

