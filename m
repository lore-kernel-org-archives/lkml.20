Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022135.outbound.protection.outlook.com [40.107.75.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2450B36A363;
	Tue, 29 Sep 2026 06:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790663018; cv=fail; b=cHyRKJ7G/ysTdhq1A2nlyOf6phBpfcIHK6XPTsGpzO41l0bSiTd5xkcvfNrmTPUxVukcAJdSZpWix8p330vqv6n8V9qP6tSafihacLthNhaeyOkGJEpxmATl/5oo1s/5SeS5nE0mz6gseXBmUTrz1A+Ypzyackxe5K94GU2Ayps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790663018; c=relaxed/simple;
	bh=jpiVqFws4jirgE7zWZ+7bmyMjDhu6Y2Ll0jPWkRgR8E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sa7CVlhpUtt4zx727nnhAvQ16yj9V3sdpJIDvHd2VEPuwmRKQ4ew5zQbFAmIRJWG/9zw/F0R7R6wEcELEVAi/y1kf8rUls72qVg+wNk/76NGDhqvOahiE71cxuWLWrpP+smM70pCBp7xILgjtyhEh4j+3sQj98MfD1eaCGUTdxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=ImkQsMJZ; arc=fail smtp.client-ip=40.107.75.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="ImkQsMJZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXZ/Njk4x+XUbQpeTRaSN7QHxwUTRoDUWqIjSxM4Jk8AOoghZqEAVWc+fI9bCotSTNgpbF/gG966iQ+Aw/3HNMJfuxwVbv7yeIw9aAoRq100b7Jf7JhOxJ/GY9rsh77b9uW5gD9slDdacZ++4XY1hybso4/uhmKu7ZOTdoDAL8kh67s8uqOInFXnevpnwq4QcSZgGQJyFAG0Vlmbl8vIOCKpdMDOhkx6JF3yLJU+tgKuDaIAE/u5B+3lI7bjxWCPya1xsh6qGzfYj3dWJJaKM9dqr483/B/jPmIFPfA6p0DrZhqnwIDo7hifkl6WVpp0znbdKKQclCTh8ONXFy45fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVItQ7EpBEcXIyxrf9jc1MiWuvsuSobhZRlgmLBJiBU=;
 b=P44GLdckxcVjVl42I+5gksAIeuHmsY7/VWJd51QvqZSg65TUwk/c2C/knJvg+RHHTHHzantSMN97sfv3CwZR1wpcVolSKy1kOm+cusB1s+hbg0VnNSiL0fYz/C287ZK3TVoFOw0iwNXgYunZbM19Fz8HMuaJBhTK6eq/1pr410lpJBpJ0cWvjxhGh4TQ8SJilKQNTVsx7lnWJD0SKZ5qWA7pAXEHXw6Gb0KPKYLDaib1g0buEu1cLdqEcoFmIF+/QrrGe+0WRLP6t0iTFp456Ua6fJkZDuIC2jUr2p/pDT+N2EOXz0crbkymNugXJx/gA4iVpp/lEwBNmW0HTlrnaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVItQ7EpBEcXIyxrf9jc1MiWuvsuSobhZRlgmLBJiBU=;
 b=ImkQsMJZ52hK6Hp4tok4PIkwOGux3NN4cBEVizk1duuF0i7GBKIW9RhVoMJMKUO8XUEcs8+FNF6+3/TuPXW9WYis2JRliH4w3Vfj6Gz+UrvNgtTeUGTmwOTicArP15Ceri++XrqZyLRBB4IZIjv6EbCvTvpdtyM1ggvskzyfjHNyGRWoOrOLu09wwozMs+viO9htMgzfR0DKi7x/lL4kA3JASIYPLLq6SOQs84tcTkNxFE1ZTjsVUEd9qmt3k2IBC03uoddRwxFsirKwpdnlsVHyrFnKGgKatbJhAct0NBMfXiKZBi8UdrDV6Y4jd+EQSuIfhypciOHtw87haZP8Gg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by TYZPR03MB7289.apcprd03.prod.outlook.com (2603:1096:400:41f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 06:23:34 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 06:23:34 +0000
Message-ID: <ab0e83e6-c0a1-4c8d-847d-81628c49a436@amlogic.com>
Date: Tue, 29 Sep 2026 14:23:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
 <20260924-b4-s4-vdec-upstream-v10-3-1289303a58a4@amlogic.com>
 <20260928-efficient-secret-manatee-2fcca6@quoll>
 <7fe35ef7-e894-4137-975a-9a5f621a8156@amlogic.com>
 <33499600-5df7-48fb-a2ac-5a703df8dc2d@kernel.org>
 <59541a34-eba9-4699-ba19-69e7b5b1525a@amlogic.com>
 <3b1e23f0-76d5-489c-a5eb-0774a21b0f63@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <3b1e23f0-76d5-489c-a5eb-0774a21b0f63@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0019.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::15) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|TYZPR03MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ba645f-7b89-416f-68e7-08df1df23050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|23010399003|10067099003|56012099006|11063799006|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IW8IRDN2T9YhdvDzF25Uv+cjbesyGerLV20+7TgeUqvr0/WQfzXB+Uc4pzelCb1dW6JZy9Bdesmi+LMgbsajEhrjIjAbii8GTCTfqHScASHqxFuUmojUbeJPu1UqFzzPuxwb+S2DKAvWAVL/S9iWhVeR964KiEiRgRrnmOxHRkTs7tk/5C0wBel9W57q1dKibh6Z0p2n60Ij0i/iaBCZ+xvG8+j7oOXOiwBOY+QYEgBDYN+bWiGk+GeSZCSTtkZeLX0NQLoMr4zNYO8jYiy5JeRnv89lWnTq/xDmESqK3G66mdDlU8VMTvFiTcfgZGWpmc+UPhgWW24ItLzJXairHrsSiEhVR4wavasRWb80YSJXPNYxEOCIDsaNEzhiRSSIdWV3FIU1i9rjMKFITjibfJai50IHWW6v/oYc5hU1nbW4Mk4rFrc/gfMYp1vXOCyXIOB/xNBiSM++gRDxquzfoGbMaAHVY+I1XHAhwgnzlmNVHDbVF8aXLn837Ov3zGOkqFXZz5M1q6s94KQfTCHCO9ho+Y+WE1C/NYcaye4AgKvXIqTwZxhIGkwAfS8nosZg6Y6zUim+XEJJNdDymKAXuHRVGaCWYXzFZjDUNL296oc/nWqcX5+1uljHKOnLYgO0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVBlVkdzNm5NdkwyVGNUZDkrTnVvMW0vaHlvMTNrVU5nbUkvMFQ1dDdSUkFa?=
 =?utf-8?B?WmVVbmNuOE9DOCsrV1ZGUjZGSGNYL2ZIaFQ5MjN4UW5ybU5iT1VKbUlmMEsx?=
 =?utf-8?B?T2kweFJ3ZzJwZmJPdklBcGh0ZlZpZWtBODNkSDh5ZDVaT25DUEQ4Zk82NDBU?=
 =?utf-8?B?bnM4UmRHZVdPK1RhMkNyTEp1Z1Vsb1FxM1EyVVNiek1DcXVPWGVTR2xQL1U1?=
 =?utf-8?B?L0dLMitDMkYzcGYzNWowdWZseklyelVReC9ibkxjbjNZazA1cWc3V3NIWGpR?=
 =?utf-8?B?TDE1Sjc0NlVqdnFESlhQQXVHdk9WZkFuSFpuVHpDR2xDblY5VGhqdWhmY0dO?=
 =?utf-8?B?VlgwL08vUFIwYW10cjNUeGN0WTUzWGdjb1dpVlZuZFFaUG8wYVV3SnNiTzZz?=
 =?utf-8?B?dG9ZbnlrZWU4QTg2WWxlSEVPZ05LMW5lbWFRQTJka2preTlIbitkcElJMFNP?=
 =?utf-8?B?UCs2TzJrZk93TjZ6cXovSVMvZm0ySnRkc1FVMHZTWWtLZHlIOEcrN0dSbTl4?=
 =?utf-8?B?eS9odTJNR3E3UUhjWWE3RkNZUjhySEVXSE9iLzlqV3ZTb3RwRURrUURtT2ha?=
 =?utf-8?B?QysyTFFISWd4azBhcW9yQWJyTjArTkppdVlrcFVwRW9LTUFnamZlZlhFa1ow?=
 =?utf-8?B?cjhBbnY3bW9COFRnUzBhOTA4cnY1eHRYeVVzaXVFQW8xNkRBR2ptUU9qRjkr?=
 =?utf-8?B?bGFIK1ZWQTJJSm1nTFZjckxXMVU4bnpoZWhXS0FRSi84VDJzdzFKa3kwVi9L?=
 =?utf-8?B?aUVCWm5vTDRrTzBjZkpzKzBnRUlQTHFQRDZ0ZWhscHpQUjl3bFM4VW1SZGZU?=
 =?utf-8?B?SFZURnZqRTMrb0M4bVgwS1I4blh2Y00wWUVlYi8vK1k2N1JUZnNibUkvTGlr?=
 =?utf-8?B?N3FUa0NobStMbVk1azd0NjNrWTdTYnlQUzU4QU5KMk1BY1R6aVNIcW9aOUdI?=
 =?utf-8?B?T2tPN0pBcHZLamxpWkV5WW5HVTlLbHFoVGU1SEw5NjMzNUFuV0FHRWNncDJL?=
 =?utf-8?B?WndnZW4yYUhSckl6dVBCOE92UERSaHV1aWVTS0ZOZ1kvRUdxRWhqMDJsQkVn?=
 =?utf-8?B?SkdlVFlDK3dnZUFXMHZJZVh1UkpwZzVVQ3ZnR3cyUm5TNDR1dHV5UWUyOERH?=
 =?utf-8?B?MHpWMzYyMG9YektMZ2lDbDlqZy9obzVJOGhoOUFDcGlvcTMzdDhHd082QjVi?=
 =?utf-8?B?V3A0Tmx4ajlzVUN2TWtBMmJuWVY2VkZON0FoSURZTFRMem16emNTcXdXWGJm?=
 =?utf-8?B?Mlc5TE9zaC9aRitpUktTckZJVDRYeTFnT3Vpc05aQjcyQmtoR3R0R0tNaW9k?=
 =?utf-8?B?TW5LSU1oWENoQnM0bjl5VW96TEJTZ2hKVFV3YnJRLzJxeHdxUm9hMUdPbERj?=
 =?utf-8?B?dFAvVDN5SnRrM2F4eS9GUFJURnFqRXZsYzd0bGQzQVhrUW5QbE83QUE0aVlB?=
 =?utf-8?B?aFFsL3p6NWdwcklPa1lJdWJsVytpYXI3NlA0c2VtNlZTK1cvT2Ruci9FbXJW?=
 =?utf-8?B?MDVtZHdid2V1bDJEL08xaVRNQlFtbW1ZWHdYVmdhR282aXZwVERuajE0WGN3?=
 =?utf-8?B?RGpMSnBLUDBzWkZ2Si9yOEUwRHk0MGs5OUpBTzJtZDNDZWFicUswR2hWdVNG?=
 =?utf-8?B?V3lLMDFtODJ6cEJqZUNVRi9XM1pOU0JQSHV3RStrL09mZCsvcE1mS2NtN0Ru?=
 =?utf-8?B?RkpESEF0OHdMZFVmMzhOOXZQUE1icTJJc05rRDh3emZmMVQyay8yR3dXOE9x?=
 =?utf-8?B?RE1QdjNlRTRqSWdza3daY2tKRFQvakF6SjZ6K1JFQ1lJT1BaS041c3JsbVBw?=
 =?utf-8?B?VFVjTGRackVjRWppQm50T255TG9Oa2dCOHJJaEZ4Zjcrd2RBRnVwMGhqQkJU?=
 =?utf-8?B?aGNjYVBualp3OXVJazd5QlVaMUc1clFaOCtHWUVtOGJmdURzNzdtVmk3cGZj?=
 =?utf-8?B?QkVxNjhJNzRqVC9FanltekNQaU1jN3ZPTWNJMzVLNEQxcGNKQ0hjeUp3T01y?=
 =?utf-8?B?VWJIVGw2M1IwcnN1ZC8zblhWcFJsMUlydUZEYnExcGlkK2FudVNTT1ZjQUtH?=
 =?utf-8?B?Sld6bktWZVFQUUs1eEQvUkdhZG5udjc2UEJlM01JbmFFWVBxQkNCTEc4UUZ6?=
 =?utf-8?B?cWZMVExTeG10eUdWZ3YxV3U4ZTNjQkVtMlh3bUNwVXhNNlI1aGttaDd3dkov?=
 =?utf-8?B?TndMVWMrb3VkYUFDMEZGTCt1TjYwVks5MFpzWnY4bkFvb3JkakNPMW1vcUg4?=
 =?utf-8?B?TDAzUkRudXFQYnY0dmhkRWt0c3EyMXdjTTVwSk1RTGdNL0J5ZHg3RkVYb0l0?=
 =?utf-8?B?eC9EaEdubmh4NzJab01WTXkrZTJVRk9VdHFLZnJlUDJiVmFkUENUUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ba645f-7b89-416f-68e7-08df1df23050
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 06:23:34.1282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ywM6OHsZ7xJ2t/lWrRnDmCr2wYKE7eW38BYyLrhzEjgQWh7LmGSDUdpgW11Ehxfn9+Ic4fal1gzyFIqLCVRwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7289


> On 29/09/2026 07:57, Zhentao Guo wrote:
>> Hi Krzysztof,
>>> On 29/09/2026 04:59, Zhentao Guo wrote:
>>>> Hi Krzysztof,
>>>>
>>>>> On Thu, Sep 24, 2026 at 03:55:10PM +0800, Zhentao Guo wrote:
>>>>>> Add bindings for Amlogic hardware decoder accelerator.
>>>>>>
>>>>>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>>>>>> ---
>>>>>>     .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
>>>>>>     1 file changed, 114 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..751043c3d9cc
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>>>>>> @@ -0,0 +1,114 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Amlogic Video Decode Accelerator
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Zhentao Guo <zhentao.guo@amlogic.com>
>>>>>> +
>>>>>> +description:
>>>>>> +  The Video Decoder Accelerator present on Amlogic SOCs.
>>>>>> +  It supports stateless h264 decoding.
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: amlogic,s4-vdec
>>>>>> +
>>>>>> +  reg:
>>>>>> +    minItems: 2
>>>>> What is happening here? Previous version was different.
>>>> maxItems: 2 implies that a single items is also allowed,but the hardware actually requires at least two register regions (dos
>>> Since when?
>> It should have been minItems:2 ever since v1,I must admit that this is a
>> long-standing mistake.
> No. Since when 1 item is allowed?

A single item was never allowed. The hardware has always required both 
the dos and dmc register regions to work (the same applies to the 
power-domain and interrupts) . In the previous version of this patch, 
allowing one entry was simply a mistake, not an option we ever supported.

No existing device tree relies on having only a single entry either.

> Best regards,
> Krzysztof

Best regards,

Zhentao

