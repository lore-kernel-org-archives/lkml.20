Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022137.outbound.protection.outlook.com [52.101.126.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E644396D36;
	Tue, 29 Sep 2026 02:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790650779; cv=fail; b=BdgPq0TdQIv8kjI3vb5DbbmoVrzvqP+u0Q2fV7XZOS6RWndZ77QAJqjWK3gcmF+N6BQUARsN7L9NfoMaP68gqGkcUNSylbnaQb1JHxZ3bLicOtDsas0LheuE+kTslesozEtfKtAMXDpb4ol/HCp4tzcsJ2U2b1R0Ex59zI0lmLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790650779; c=relaxed/simple;
	bh=AiQh+Nl5YOknwusH+/x12ey06Qkmncv45KHRQomtbOY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M5DikALh10NdavEAlwKs46R176B+VUQVdgwi7t/hkkOkCKD3jbKoq8TdB5X5TIexuoew0HI8Sf1eZvzDG2Qu++1MfsMReHF8kSfZpBZhSlLblZj4Tf7M6EtcXNwoiw+ixWgV8eJuW+PKYaHxDsKyhTPLvyOWHWYPiJpDqVaPKAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=kNVTP3+C; arc=fail smtp.client-ip=52.101.126.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="kNVTP3+C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDwYSIknUwsCUnw5X55p+7pRHwfALHvI9Hmg4oxJMsKjiqTa4i89wS8ib1F8aoWeFv69bvMrtSsvmg2LxcVHuPx3FeK6l3fOa8vuCFCcL6ItzhwiPX78ifrF+uErQHdcoT678LcYgoHnR29xWyqWr5zkyMMHYB/OdlNovtLi9n6O50qjAzmC3w8W/fUq+3Rs20vo8/TgzT+WeclsA63fVWwoLRm8KrD+UCPB8GGfedP1X6wq6rQ4Ty6HwlAfm9a/0+QZB63oqpf/pO/u9p2mKzP030k4d5KNuxUgBqXwPdXPzV6r0mx+7ZWRr6TFSsX4a5scKaqQ85JpY/4aMDbxNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsbcHVia1hxStiuTeGCUCg09j6EKpDAowVYIdUerERM=;
 b=rNOR7sHk56hWzGV957YPMj/akK56f72/UaMzJ/+CM2eAepPC7b6u3jqHeOAy4MOYvAtmukNTLcvhZ3qtztJiPe1+/EDxUbrD/O+XsXdhTg/pjYYdU+qT4MAggF0CaZQRRALW5s6ZZ5XXTGqsLSy31s/IDdfSLDdNq4nZG7NJ+vOAzJusVzie+ILz6ES6kNLLfUihxFyVSlPhWy/HZc/WP7opW14hKajRPpmeQwlnVi5ciWN9Y5duKb4VoLtRhEtKjbmsyRTIIPelVaz9x109EjQ7bzlCnjhLhf2UStVhAE3GeJl0oQqup1w+K1Alxacc86Fpro7J0jRxWfwKrucmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsbcHVia1hxStiuTeGCUCg09j6EKpDAowVYIdUerERM=;
 b=kNVTP3+ConzAOAZ40q6HNGbwen2K62RkN73ZQBp/Z6LznVnUX/ZxvulhyCAECThhYfp3wIzm5pCwm06Tn3qOzI08oPzxm1iPACi6Tm0r7Q4Pdje9DNa/qXvnIwdC+dP2okVj8884DaxMWC7VyWKW9tvvomPWFmWqcy8p9PLsxM8ulD25JxgV6hS4hN6t1TeeVezXsZPbmya6yIkP7ojx1evl/hkRHwzvRh6RyQHYTUpD1a7nLVRZaS99oIG2UPSSdRmFarRMUHfwZx7TeyE2FMJMMkWQtDSQdR5Ba89Et52BKBCpZqZE4He5MRwQy+Xemm65rdX3u7zua1VuJsWDyA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by TYZPR03MB7460.apcprd03.prod.outlook.com (2603:1096:400:427::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 02:59:31 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 02:59:31 +0000
Message-ID: <7fe35ef7-e894-4137-975a-9a5f621a8156@amlogic.com>
Date: Tue, 29 Sep 2026 10:59:29 +0800
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
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <20260928-efficient-secret-manatee-2fcca6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|TYZPR03MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f5d16d-0d63-46f6-8dc1-08df1dd5aedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|23010399003|10067099003|56012099006|11063799006|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sBgRjFkaRAu1cMNXU7oX3fsFhL5CljWH8E85DdPdaQMvdHQ46EoRFAdSHDQEh0nUZEXAeBjMpRu+xCNSuvUeU+2fIc12DUrYB5S2fDRU4H4lo8j2Bfis4Jghy74Mc8VMy9Zp+exZlGm/DjCdawyz90Ohd2xLLyyyMnMecjtxPBEDMsu4RX5UjhJkthF89uBryuNUyA9b11R0x9S1bTjtvarMkbFI/b9GxznzorM61G1S1K6N2woh/4omn7kZUozyp0Frp4dsgFszb3MzsCdM8kvL/IDwE6R1d+PomBwA0qtL0W8iB2AFfOlxv+jAfk0llGM79dBG/w77mPW4/EBMuUqg0Y4gT1li10pksdo8YOjI2pPWFl6C9AoMjTjNRPsBhRVle7dH903OVVMY7C88xGKLvKk02yxMRNyItRIvMI7e5VmAbYQb4HrLdh5IVt1macdHTcOpR+6FTIao9WH6kaDExirdbARQnbBweRuT8uBEAdzeiBwhBNN/X5C6OnKnxgTuUbuHUh7zIi+NF6HUErV3Iqyn9v8Hyc7eS0Pf67vuq7+XUwVPm+N3TTmQzJvd8K9Slyw8Oz/UkXNXddcQZsN3p5oceSehSJVRqDkJUbIG/XTcGRwXMUgaOa57LR86
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0VvNHArQ2NiN0VwQmRjTFZQVmRmc1ByQTA1UFVHMjdRbDB0cW1hN1pIUHA4?=
 =?utf-8?B?MktscGdMdi9vVWY2QXA1ME9Yb1J4ODZQMHR0c0ZlMi9oZ2grYk1OUjFRRVA3?=
 =?utf-8?B?ZUdJWXVvUnJiVkVGcjl2eDJ2SlJ0TnU1THZlRTFLMVhPbnIvalN1dnN1TTlj?=
 =?utf-8?B?L2c1VzEvYjZHOTBZblo1c2Q5MkJNUU1vaGMyaWt3MmtYOE9ieXZlVlVCbWFP?=
 =?utf-8?B?UkNESWpqRUk2aEpUMVFwY1IrN2ZyVjFibzVuY2hyWnp4cGJEUTRmYnFxRVh0?=
 =?utf-8?B?TGpsNUhkUXA2Nmx4TUQyZGdCUDQ2cFF5VE9UbWc1WDdyem9KdnEwVytteHEx?=
 =?utf-8?B?ZDBDMXBxZVlDaFh4N2ZkRHhoVmxiN1BvbkZYU2JIYVIyQVR4Mjlld2pReFBu?=
 =?utf-8?B?RGMwbEJFcHhJN29KaUlNUlpCSTUxczZLODJSWmNyRUlnUmZwZjNVTUdkbDdu?=
 =?utf-8?B?Snl3eW4rMG5NUmsraHpGeW5Hb3VVbXFISVdpWSthVUVSVE1EYWpGUzhZNzQ5?=
 =?utf-8?B?QjQ2YXJob0RrdWR4YW1aOXNFbEpDRVl6MmQ3SEJXeG4zTHNkTFlxTWNvRW1y?=
 =?utf-8?B?L1dRdUFrRGFnbUVyUDIxV05BeDBUZG4zQU9Jc3U0VCsvTEFRTy8xbkpCVVVF?=
 =?utf-8?B?ZVBZcmNTYjNhMGFTQ3M0SzNEeFJQYVhDTENpQ1ZHVnZ0TEEwMEhBNTdoK1Iv?=
 =?utf-8?B?dnppckVrVkZjQnp6UUZDZlBXN090bmFHZ1ZMcS9wWTNGcTNGZDgyNW9nQTE1?=
 =?utf-8?B?MnFwWE5vemFqblc1cndXR08yWEZtb3pYN1JIa1FpVlphL3pGaVBaWUVBdnY3?=
 =?utf-8?B?ZzEwNzhWMU03OVVNUG92R2xqQWZ2S0g0OFgrb2tBM0hSeHBnUTUyVDhRemlL?=
 =?utf-8?B?NWorRjltNHNGTVcxbGxWaHdFeGs4TjJiUVNvYUZWczh3MEw0dTd3b0lNYlRD?=
 =?utf-8?B?Wjh4TFVoaFlENEhnMjFMakdpYXhFWHZNaWZSOVpKR3A4ei91ZkNoOHRUSnc4?=
 =?utf-8?B?dTZVQU9Fa2V6NmhkdjAxTHRPVTJsQ2o5TER0anZyc3NnZUYxY09mMTBTT3A2?=
 =?utf-8?B?U0MrUFJoQlhPSWhmandEK1dyU3RrSks2bE5DYUN4Wi8wSStKYTVIV1I2VC9Z?=
 =?utf-8?B?NFRxMFBMOTd1ZHlpaUxzUjJrRERId3pHZkhNSG5JSk05bU5iLys0M3pJLzlD?=
 =?utf-8?B?R29PUUJSU0hVL0pYS1RoWVdjeThoNzlKajVSYVFPUDUrN1ZlczZHQjgwQ1pG?=
 =?utf-8?B?RGxRTmRoZXlMbGl1MGMzQ3BYWnN1bnFCdlhLY3UwQ3R6TXYzdXYrWnc4K25v?=
 =?utf-8?B?Q1VjbzVYZkU4NVM2SHI2SlFiUDFDYWZWTjhKSjN3bU5HUHJGWGY4U3ZadWtU?=
 =?utf-8?B?Y25ockR3dm9PeG9jbzZTQTZzQWZDM1dlZFFLQU1GS1VaV1FkMDNDT05sY3Fa?=
 =?utf-8?B?Wm1IN21sS0d6UzZoZEVUVldwa01MZ3kxQjZQc1Z2QSs3aWlSeXJIOUpUdjNm?=
 =?utf-8?B?VTU1cTlaTVRvME94czVpVzU5NFBONEk4OFpGdisySGcyNWlhdGgzSHZxUUt2?=
 =?utf-8?B?Sk9ieFRIOUFtVmZaUnJydGcxTmJqWmJJeXZndGRCUlB4YW1ZeXRhZko0TkV2?=
 =?utf-8?B?b01Rb2FDQ2ZuV3RsWHUvaVZpeVNJc0hwMmRla05yN1pnZnRiQWNQS3ZwYjJR?=
 =?utf-8?B?UWlFQTlMdDROVy9BMmpXV2graElyNitXeXBtNGcrZ3FodTlhZ1BjaDlHSFp1?=
 =?utf-8?B?Y25PK2RUMWlPTjMvaFlEam1KNnpkUkw1NmNSVC9jU0xnK3RlV2FKbWUzZnJD?=
 =?utf-8?B?RDM4M0VlWGpjcmZkWEd1bXFzeVdpTUIreDc0aW1BbXZKTkpzWkpEYzVaU2Ex?=
 =?utf-8?B?TUdxTkpKaVBxNzRLR1d6RVFtbXZYc3BUbGlFWmE0Qk5QK0diaytac1hrWWsr?=
 =?utf-8?B?US9McmtDZ3lsTC9vRUVEZGRMYlk0Z3F2Wko1aVVQTGRCTCtyaVlDNkhHc2d4?=
 =?utf-8?B?TFZ4TURTS2lXWjc1S1dZSFJZcG5HcFZEakJuT0pFWVlKL1RZQjNjRmdwMnNm?=
 =?utf-8?B?ZHZXYnluVjVabjY0Nko4YlYwT2ZHVVViR2VoN0NMUlZydTJvMHRvdjZmajR5?=
 =?utf-8?B?T3lIdlNtYjlLUlhsODlJdEF1K3FIZkdXbStHajVIRmd4SjFGdHVSYVcwUTdU?=
 =?utf-8?B?UHppMjA3L3FSZHRJN1pXQkRGRm5saHcxNjhrVmVNSXN0VFYvTEowV0RrV1Nm?=
 =?utf-8?B?dFdmNmpFaTBsMjJiMUQwYUhrdXgrVWhBTDdiUmZJdTBZaUJmRnBnN1RuZjA0?=
 =?utf-8?B?a2VNMzlUZDdFb3lvZlc4dmUzTDBmcktvU3ZjSGZyZEFLaEtHZlBCQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f5d16d-0d63-46f6-8dc1-08df1dd5aedc
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 02:59:31.1992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRG6uCZy5Z465s5l/cTqG0oZWIrxBss14ERMMy4RJAPsdoyqLpaTqxB/sD2R69mPlwXAM77o+3xGLLRuCoebGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7460

Hi Krzysztof,

> On Thu, Sep 24, 2026 at 03:55:10PM +0800, Zhentao Guo wrote:
>> Add bindings for Amlogic hardware decoder accelerator.
>>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>>   .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
>>   1 file changed, 114 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>> new file mode 100644
>> index 000000000000..751043c3d9cc
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
>> +    minItems: 2
> What is happening here? Previous version was different.

maxItems: 2 implies that a single items is also allowed,but the hardware actually requires at least two register regions (dos 
and dmc) to work, so minItems:2 makes sense here.

The same applies to |power-domain| and |interrupts| below. At least 2 
power-domains to make the hardware work, and at least 2 interrupts 
needed for the two sub-cores.

>
> Best regards,
> Krzysztof

Best regards,

Zhentao

