Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023096.outbound.protection.outlook.com [40.107.44.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409F3419304;
	Thu, 17 Sep 2026 06:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625270; cv=fail; b=sRdyUc0KFE2zFVBZANz7Afwaqso7HO3We7Jbet0Q+NWEINvMWkAP1ABDOPvwmDT8BEsj/ntnkALL77szXYKmqqQQmfDh1E1DpfTcKRxUezc8La/xC1kVxXqRE+Plm+bYQBnqxAt3mrjHwCd7Duj6qg5QUGkWux2CWSHyihaKfN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625270; c=relaxed/simple;
	bh=OOf2kLI6KtR1ueq5gKMNiN7Sv6HinQHnwdsXTDbQS3Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JVqBhLoNx4ETSZeAqiAF+U0ffbJTFwdgGK0gVhUd+zpF5tmuvazkPpk7++r+GbCELigNTRWXQOdcweIt057vZmLJVsOPgKUJS6dFK9Ma9aTmqoNiBd51+WLc7HY0OJYeWTsLcRPgSHhX35tjtaohXuR19KP6IU9FxoWthtdFWHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=C5KzEO6C; arc=fail smtp.client-ip=40.107.44.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="C5KzEO6C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8AYptPE5yGo9mVcxvxKqxPtsnBHcQbgeAMQ4i5F460Ew6agWXMYE7W8OSac2ZRA9Kf0ivtqYu+FZL7FcHKYjYEG+tZKBWfVOkJ6Zy0UwxnArKkjCQ2ExduDPN0M8voC94O+HOKgzNqYST0/wBebZcBW7qLIEZXbI5jlgnftzb6nI0yCVU2OqQS6OLgWoK5Oz4+o06CH9cogUrmna8pZ0X2l8QINc5SyQLMGm0k25f23vB4dUEnXwNFiD5EOCmJ+iPlsp5IJhvJwWHuUd/+UMnZJZN1VL+IExmtFT5WUjf2/D7RW45TYZhEHf5DtGTH/ef3FVrhXTBTKdKvSpqKW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WGWVZIJTN73nnAt2fmct3ewzAbNCg3VBnXJnDiYAtg=;
 b=wZo4mpT8fyzpiCLHHDyhu8dYPg9qR2pUl+kHTNpZE0oklNdkRn9X0L08gb9RScuVViyn0UQAqwvvgcNjukDN4cD5b5UI2uLAmyZdsCH8RMIXRp9mcNDjJl5QUQcI+C54p9zGqLTN6a5esDeHkup1XNivYGoX0rxBYSMwO8KBzgRvJHBQz3KsP8GWp+AbSt9C76hqrNBJ8G8dtmu5biVNHcG3cSz67g5DAjECjYqIFZlEiEF+9kObU7E7b7UVbs4HnmDiLqyV6KQnm+dMbtSfkzF7U156QGm/DvZXsJuF9pzmf5OZACJ19rg66f2Ei5k+UhXlpy6jU58hEN6YLbwHSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WGWVZIJTN73nnAt2fmct3ewzAbNCg3VBnXJnDiYAtg=;
 b=C5KzEO6C2dN7GLpDCCt4lmyy/WMa0evRxLk1QMw394scukkJKFtHqBDI9gb08zkLafgYXOL9cjYMum7VIEeI7UJqI/8XSh5LiMW53tAL3cK9kCcd9LBe9fLkVMOY/qRLZApa4GDcN6pP2gxthXh4u9rJbZGn7kh4plyeqKj5Qrg3kSuSDxw5jYvL+2qYabw7E8KgYBJmCdEkQxGxGiE6ygumi+p8dtpyv/3fqkpxJVdAC/jDnUdGsruSAiBwR37Cf0Y8VEgBspXfmm+/GHSHT/IPs1k6pS9wsuhmm0to+wU2M85C83iJ9NwAolYWzaVrJfbxs8sAov4M+ABdomhi3A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SEYPR03MB8226.apcprd03.prod.outlook.com (2603:1096:101:1a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 06:07:42 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 06:07:42 +0000
Message-ID: <7afbc566-ba8a-4b73-831b-7c596c95ea90@amlogic.com>
Date: Thu, 17 Sep 2026 14:07:38 +0800
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
 <37bbcf5c-644a-4388-ba8b-11608f444ae3@amlogic.com>
 <05189f26-1d24-47a7-abef-ea4c25d2964f@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <05189f26-1d24-47a7-abef-ea4c25d2964f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0118.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::16) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SEYPR03MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: f35e8e1d-aceb-4313-c4db-08df1481fbed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|22082099003|18002099003|3023799007|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	lxdjPyx8aUB5nYtvumhy4EC1d5xBPcJEsGr3iQD7LrKAFPyEQhPFvKJYhb3IQoxMhDUVu05zoavqQb7jM2mf3v43DzDENu2bWS1pS+SME7PtUbIHnE4sWDZNsfVoXPZvy0zpTFBCWEFpRsBDe5KWg4H934g3lG8CwVl1hMdQRXGkviXQ+e1wjaypgdH2S9wN0ADMYT22m3Hxb/X1UMc3o96h+uJEYGguoS9lV5+onrBCh9TLAQMlwZjAnh9o9hk+K8T+YiUP0b3qswX0m9EBuNk7PCTk6dnVLR+h7FGjkaVA/yDy7saFrc0uivzHr0UBo8qrjGKw0/upBmbwbfbty+7CfmxFAqwVZUibTLQ88vwWoEmoo0JMFNJah1pH793mHSnOzsJktA6spx36e0+FAHEtiqtywqhIUmhEqt6qi6pxe8YjTlNh1dxUHGn+5ptvtryLrvH5Of/vsUl5gM1Ez/+X5S3o64xXhIvwagCZ+Pw0Zd76pQ3+zIw8FMXTiVHf0Qb4UsQnmsQJ2KczugGVu/s9+zSgfLgm05fdOEgUY0AOX2QMaVH46zNi4MAuLxgiddpue9lo4B218JRazbyl3XTQFCvT6NyF5KdQgvYCfBYK2QMv46LhN6KkJrJWOEih
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUtnamtOS1drZWJ4cmNkUjQydittaS84YWl3N0Fzd2l6NFhpZ3RScTdsckJM?=
 =?utf-8?B?RmRseDJTU0kyWCtjZlpjZTNNTDk1L0FZNkhycTQyMGhMMFNJd0M3bkt1L3dW?=
 =?utf-8?B?dTBKSjNoSTA2Q0FPTm9hbDlQdXh3ZmJRT1FzQTdjeVJka3hsSUFsYjBiQjdv?=
 =?utf-8?B?UWFjeVkwS3dXU081Snp2alA0Q0xLS2xlVG9ickFLd3Q1Lzh1Qkd6REJNLzJF?=
 =?utf-8?B?VTV3dy9CWG9MWFJra3pQY3NjN2xYaWpLdkNDOHppVGhDc1JxZFJ5Ymc4bkF0?=
 =?utf-8?B?eTltb0pNempqUmdFeXl6YjE5eitVZnZaS0hOZE56Y0twMSs3clVLeG1QSTZi?=
 =?utf-8?B?TWlHRWo5KzRXUkRiMW9CV1dBRDBJOTRIQXNOd0Q2R1NoMGNFdWtxdVRIbzkv?=
 =?utf-8?B?bVRaL0NORTdVQkczWHZJWXNQY2daWUEvWHVySXVBWG5JL0x3MmpycVo3WC80?=
 =?utf-8?B?Z2RRdXI2Um80YXNtQ0RJeWV5V1EvWXdpWjM1a3c0MlgwU015S0Q2dUdkL1Fr?=
 =?utf-8?B?dmpPd2pGVkhGZXlhWWJzMW1wdlpWU0lxZnhIMGZEa1lheStsRW40dU5pNjFu?=
 =?utf-8?B?YUpvam5FWnliRjhJY2ZtT0RZbEVTZmRiSmlCVzV6dUpmRGtISy9waUh3UDgx?=
 =?utf-8?B?b0U2a2ZnMHB4QnduWU8wVHlxS1hPMTk5YWlXUGw3bUtPQjY2Q3d2SC9nMVp0?=
 =?utf-8?B?QjNsUVJGWUg5VHdsZDJrelFQZnBad20zT0lSbUhKeU5SczhYS1QxTWVKUEJK?=
 =?utf-8?B?MW9TZDU1RzRPZ0x4SkhzS0ZmbXR3ZTd6WXZFb3B3WXVJWjN1VGxYNHpkMTBF?=
 =?utf-8?B?cVdCTkVhZ0FXREZoem9aM3BLQkxJWWh5eU5mTDhRSFJieGczMU1NaUw4RFJs?=
 =?utf-8?B?eXZadE05NGZPNjRSTktuQnZhOHdPdGhLdGk0clBaWkFjbmJzTkpQcFQ2c2ZK?=
 =?utf-8?B?TkFiZDNzM2JwWS9vNy96WGdReVQ5QUlRU2tKTnhvK2kvOVZ3R2o1dlYxQTZL?=
 =?utf-8?B?YW9sS2pyc1RPRzIvQ0JlTnNpMW1aOWc5ck9jSWtXdnhlM20yNzJoa2c0dlYw?=
 =?utf-8?B?cDdlQ2NkdC96Z0F5VWtZZFZGNnRlMTdtUEZGT3BPUHVOVzlWcGJnanJDb2N2?=
 =?utf-8?B?N1JxeG1jM0hjSXZFV2ZXRmZpZ2xQdVpjK1pPcHk5bVFDYkNnTzV4OVZWRmxr?=
 =?utf-8?B?VlpjY2g1SEpZUlhEaW9BUndhR0RMQkpPSENRZTVKT29Tdkkyc0tVTWd2OVF6?=
 =?utf-8?B?L3VVVXEwSERYQ0dZQU15K2dKVHM3ZmJpMnpJWEwrNllSb1NxK25BdHVUR2ZU?=
 =?utf-8?B?dUZKWVJPb0RjcE9LYVMzTS8zd2xYQ3JSVDlNdm1LN0o5VmtkRkRpM3VSbDJy?=
 =?utf-8?B?UzNyTnh6TUlzdERPVml0cGRBUkZQZEpuZEdTclpuNVlVcmpLTitJbzNpeWZw?=
 =?utf-8?B?M2VBNTlPUDhZeGhOcElBUnlaRk1BdE54YUNaZzlxeDdEanVFaXNGaVhqNFlF?=
 =?utf-8?B?TkJTcFNxNXZlV0psY1lWQkQyVUk5UFZSYSs1U0dVRWdTd2x2QXZiNTRxbFJF?=
 =?utf-8?B?TExSZnpCZ0N0bmUxVUdremZQVzhITW5kNWhGaDBNMDF3S2J5ejd1cDAyQWky?=
 =?utf-8?B?azZUSk1yUS9EOVVzNUNTRzcwOUNQU1RHK3VCdkdJc1B5bjN0OGcwdVN4aDFS?=
 =?utf-8?B?S1JnS1pnUGtXY1JRWk52TW5ObndwMTZDRXVXWkNDSWhWMjE5RFM1U3FBUEU5?=
 =?utf-8?B?dDRybjI5UnNZdS9TRHc2U01rV1l6d2NBNTA3Rzh6K0g3bm1BRDhhQ0xGZ05n?=
 =?utf-8?B?emxkb2JxS0N2WVh3d0JMcGtLdnliTU5LdUlXYk9pTlRTV2tsaFArZzRDR1h4?=
 =?utf-8?B?bHJpZjU3T3M2TDN5ZExReStLeTlXUG80VHVyUVRLSWhoTHN1UnZLQ1JlUlNQ?=
 =?utf-8?B?UjIxVmhoMnRRcklBTUl1SUY2dSsvQ1VUZUFHcldCSlpONTY1NFZmUXJQSmdY?=
 =?utf-8?B?RlNYRVJ5NUhZYnlhaDhPZGQ0MTRXU2RqSXhKdkhneEorK2JNZmVNN2pVODZC?=
 =?utf-8?B?NUV2THYvcHd3a1ZFeEVlVG0xcVJIU3lnMWpRam44bUp6VzBmemc5ZzBvRW1Z?=
 =?utf-8?B?UndDS2JUdnA5S28rMENJSTlZaElvRmFsdzFDWHpjd2hBTS9zWXdpRnN0RzFI?=
 =?utf-8?B?Q3ppempYcEZIdXpiYkxwQTFBUHhxMGRaVGZOTGUxQUV2MVYzUEQvOXp6eUJh?=
 =?utf-8?B?ZW96VDhGOU9nVzE0UnozWXZJS0haci81Q2x6SE95K0Y0eHo2VUZEY2F4VTcw?=
 =?utf-8?B?bGxXTW9sV3dmL2d3bm9GRXN6WVNiRUIxYklGT2dGR1J3YmowNU0wdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35e8e1d-aceb-4313-c4db-08df1481fbed
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 06:07:42.3190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAued8UDzdPh7pzkpUPVtwL16fv95sjStpT2HHfQWl+/enZt4yJll1ixE349ig9w9V4GXL+B66PKR9fHDQyZ3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8226


> On 17/09/2026 05:07, Zhentao Guo wrote:
>> Hi Krzysztof,
>>
>>> On Mon, Sep 14, 2026 at 04:10:20PM +0800, Zhentao Guo wrote:
>>>> Describe the initial support for the V4L2 stateless video decoder
>>>> driver used with the Amlogic S4 (S805X2) platform.
>>> Drop driver. Describe the hardware instead.
>> OK，got it.
>>>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>>>> ---
>>>>    .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
>>>>    1 file changed, 114 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>>>> new file mode 100644
>>>> index 000000000000..d350b3e68a38
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>>>> @@ -0,0 +1,114 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Amlogic Video Decode Accelerator
>>>> +
>>>> +maintainers:
>>>> +  - Zhentao Guo <zhentao.guo@amlogic.com>
>>>> +
>>>> +description:
>>>> +  The Video Decoder Accelerator present on Amlogic SOCs.
>>>> +  It supports stateless h264 decoding.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: amlogic,s4-vdec
>>>> +
>>>> +  reg:
>>>> +    maxItems: 2
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: dos
>>>> +      - const: dmc
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 2
>>>> +
>>>> +  interrupt-names:
>>>> +    items:
>>>> +      - const: core_hvdec
>>>> +      - const: core_vdec
>>> Drop "core_" from both... or rather some consistency would be more
>>> useful. Below you call them core_v and core_h, but there is also:
>>>
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: Clock for dos core
>>> core dos?
>> To explain this, I would like to show you the structure diagram of the
>> Amlogic hardware decoder IP:
>>
>> +-----------+------------------------+
>> |           |                        |
>> |           |        vdec            |
>> |           |                        |
>> |    dos    +------------------------+
>> |           |                        |
>> |           |        hvdec           |
>> |           |                        |
>> +-----------+------------------------+
>>
>> The IP consists of three cores. Dos core is in the front of the IP,
>> which controls the rest two cores. The actual hardware decoding is
>> handled by the two cores vdec and hvdec.
>>
>> Each of the three cores has its own independent clock source.
> So everything could be called consistently "dos", "vdec" and "hvdec" in
> all properties (clocks, interrupts etC).
Got it, thanks!
>
> Best regards,
> Krzysztof

BRs

Zhentao

