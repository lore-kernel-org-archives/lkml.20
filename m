Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023101.outbound.protection.outlook.com [52.101.127.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD422DEA68;
	Tue, 29 Sep 2026 05:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661487; cv=fail; b=Z/knyDBmy1VmXb877XZ3B4aEsRnK4rp1+x9Z/uqfLnx36ZwG+hgtliOHw66GVVk4Vbqg8ocXzwz8NmNZrrdwnlBtSn+6OS9rfAERvrsH3YrDiz1rV4ubjlnCTFxz9EwAUTcvtKKf9Z0WdLgfarX4lfm1D0NCqxJJ0pIBOUxYAf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661487; c=relaxed/simple;
	bh=x9QXiCQu9/eFU7IAafYTyEB6YtMuUWUNclxvy73uy+g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KyHQ7BjDB+f7Er4NyM5JxdDPuyzguvbUrgyiRnoVygwzuAGBcV3Z+cz7FiP4YfC0nohS9DZaadEFnIzSTNQqsrk3SZt3d8aE5akStXUt32fF2e/IuY7WPYeXHnE3OyIc2W0Lzq2xTg7nD3i0SVPK9y0vkw6D4keoLW0lJgD5fs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=xsQZIPKl; arc=fail smtp.client-ip=52.101.127.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="xsQZIPKl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuU6/Sx+PjoxbqGtE0uQcZ6F2Eq4TGqJdD8ViPKUCyYXD29rAX3fXPYWJFcMFtg/e2vp+JDK34QQL4ve0om0gC00+eaYzfE6c3P+/l17Fx6tJqEaJnUi5gBLcaexHwn9UZmJ+C+SeJ1QbH7eXH6DGiMlKuZqG4A0JnM87mPJ1wi1/zj/H1a+4IrGmxwPtsK8C3u5gJLP15f7E+4l2anUjkT8EicxWjYwNz1buRcgU7xhhDcQUQh4QOW0HFQ+aMZU1pp6rQIvCpbwO5oxDee2+EK7z8vSgcWRsFihCQRvhaKnK5GAcbbBgHv3Fi0Mj2mzRjWl5FBQ38uoOU8AmysoIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Lh8BeN+/KqmxEd2b3ZzVTXo92SpPK4fOtDMDxMjE1U=;
 b=Bm6ZhAgSoFsnjC7KiCewP+wnRRO8R8RsrCBttHuNrUvUuAvFY5Hp2++BkijIU3y1D1aU44+vkEv9Qwlgu/L/+CIwM/u36mZ8Pf3iyTR7v5oC/RpGVsQuJ5MvG74aVOosmiNtQEdtNtLQOqsby5RcFHE2UFYAQP4u8Hf5hNyZSCjCKGcP5TI0zbPL1dddNS+Z2g9D0NH+c8thcUiIGoFHB35MawrHsgtD2gFZ4Yhvg6SY4YHVSf/EE272wY+OO8bYcKP72MpdUqp8CGi5kRx5+xty/vAZAet8JgrNqmhVfzBeiLviQSI/+1Cjn41LZkROHtOxv3LisOGtEyAllLugeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Lh8BeN+/KqmxEd2b3ZzVTXo92SpPK4fOtDMDxMjE1U=;
 b=xsQZIPKl7qIm7P42LbD3JW0PulH7vL02yWxaj4g5Xre0A1CWwVHfZH52Xqk8U/O7XHEU/+8a9p0mCz+FixGkpezisifi0ExGbJodTyonlztgzWNn6oi6jLBs0UaS/cpRZJVtW/dpA/ZM/m+IRCvLutcthwREhSmla7GNGZvQcxUwrPKDMDlVrqWLGwHmbQjAqGm4E4Kq7TPVagvodmDHbBVeeyK4rM1qpDvglcZap2RNnJbH0ClGwM2eZBPWJDNzeCrmpvOvGeQhRmGtQQdZNIowxEpkGEhuBmw3e2k1W04QnRnXjc+kZPTgLbvNlAXMiHcs4nNwIxe6RXL2meuNxQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SI6PR03MB8707.apcprd03.prod.outlook.com (2603:1096:4:253::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:58:00 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:58:00 +0000
Message-ID: <59541a34-eba9-4699-ba19-69e7b5b1525a@amlogic.com>
Date: Tue, 29 Sep 2026 13:57:56 +0800
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
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <33499600-5df7-48fb-a2ac-5a703df8dc2d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0051.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::12) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SI6PR03MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: d78a7dbc-3707-4b2d-b811-08df1dee9e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|10067099003|56012099006|11063799006|3023799007|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RjTAxHG00cApzJnzBX8DEmQH8S4oGzKVJvdX0OjxFkAGboDRLMwRdyJWYpn3pFiRNttPk7yBa6JpB18tjjn3Jj68VOtonF9poGL5DKXrRauLG9VsfwNyMS6pvXPGRPidSJ/OXBk7tgz7XtZn17vWDonpzGbeeJADMnvsKMVriI4MEN7ewY2cUMSqobvB+nJ7P+e/34DB0ZoXJBoeQ4osgoCLTd/WlfMJ3FZOuMwzUpJLfHfxEHSCamKMGuksubUMRTuoecaG0W0G+DOjJ8Gvk0We0R7KOwKcnt+2WzE5WBAkT/tNna4DZFEFx2JdXnKvdXXlrb2Qlq9JZDBwKICc9YgdUSS7ZMhY+PV+oRWogy0anIdEN0vLou3BBI/3DRJqvPq5uYkLW81RCDuCf4WmKFjWzUpdr7RwHfvrNBGxqElh4OrfM06ho/2/jCYXe3/3De0BHc6tRfn1w4lCHRIJOFYle7FRZa7AY8Qf3SWihZWkLOAV2ktsNRIAe4RERUHbZFVDAuttrmx8XZYDuD2HUb8LK+CEhWYIkx05w+oi/jnx+UsTqwVpPF+8afQ9zfUhxDW2tAQFEEu5liM5+GCkkRupLTL6xsPjtKHw95ErFSfwCXE1DBOF7yQgN/ft0n3p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(3023799007)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3NNeUUxQ2Y1ZTZkUUN4a2hLeGp5QlpyR1lSaFU0VGZUWkU1Z25Nb0c2dlJq?=
 =?utf-8?B?a1VLWXFUZkJIYVViKy9pWFdJK1E4UTcwMUlHTk1teFh1Z0tBZ0ZBSmRxd2dn?=
 =?utf-8?B?bVhPWWNZT1NPNldud1FBaTdYU1hqMHV5MGhST3dBZWY2YnJ3YjJjV0FIRDRp?=
 =?utf-8?B?cHc0MG1seUU1eFJXMC82SVBRc3M2RllvUU16YXJSWVRnNXFSbTR2U3RDVW4z?=
 =?utf-8?B?UXBzalBOYzI5RTNtQ1RZUU1tL2tsL3NIcktsZko3MTNEVFp1ZXBCaFRVNmoz?=
 =?utf-8?B?V3h1NTd3TWZuL2laMG4xS0wzbm9GSktrd082d1VrdDJBMFNSRG5RM1M3UE44?=
 =?utf-8?B?NmQ0dENlcDYzemcxdTZNdUdBeUw5Y1Nud29YY21tZnBHdlYyRVovZ2o2bXht?=
 =?utf-8?B?K2pGSEFBa3N5KzhqdlBBMlZVc2ozT2dOQ0swR2xCOG5oSGFkSVlCZVkvM2dt?=
 =?utf-8?B?Njk1dkxzZDJuT2VoZDRZeWFoaytockdQcFFlcHlJT0VUODZSWWRoMHdmaUY4?=
 =?utf-8?B?aXlTbFBETTVKYmN2OVl2QWtoVlZrYXdqNXZqODYwWUd2TEN5VVZOa1RNQ3Q1?=
 =?utf-8?B?djl4UjNMUTlUd1hEc25FOHNlTmRzbExIanZPaTdDUlhWdUFYeGtYcExuSjh1?=
 =?utf-8?B?WjZxNzhENmkwVjBRT2k4cDBPNmpoa25sNmxPMDlpRzRCRlhSZlp3WG5wWm9S?=
 =?utf-8?B?YTNsejUxb0tOOGx5b29MUzF1Y1l1c0UwK0VXRktFMVgwOCtKaUU2OTN0NzY5?=
 =?utf-8?B?dXFIVGhRQ1lLT1QzQXA5YlhlOGJoODYxaEpBRG4vNUJFWWZvTHpLeFZvNXg5?=
 =?utf-8?B?em9JL3ZjenNpdTJkR1BWRWl0RWVZNUNXeE9FTkRZbGpSdjA4T3R4UmUxT1Rl?=
 =?utf-8?B?b1o1WVJSeE5hMUNHSElTWThIZTc2ZjlnSFdzY2VjZEFEQVA0M1lTSlIvdVZF?=
 =?utf-8?B?cFd2YXkza2NoTCszNzBrVXlUNG4zZlFIR1JzSTJySGtMTXdHeXFCQW4vdXUy?=
 =?utf-8?B?NmJzcC9DZWJDKzU3Q1BTU0dkSU13T3FUVzhWSmxMaHR6d1k0TWlqcEJGcjJN?=
 =?utf-8?B?UHU4dVRJNWNEZVU1KzJ5S0VHVFZIL3JXMHJaQVNRSmpVc3orU1N3cmxjdWtk?=
 =?utf-8?B?ckR5c0hZNVBESFBMYmFVZ21OSERMbmFqUEpHcnppd0FWZGhJWjkrNE1USUcv?=
 =?utf-8?B?ZFNvcmZKcy91ZUVqM0M5UGhMeDdUaHFvUTRmOHZqVDZCVFdqRkVkQUxpdW96?=
 =?utf-8?B?b25SVmMyLzBqZThrRGhROEZwam5nTmswUnhBUXJQMDNYYUoxMnErZ1Z6cUIv?=
 =?utf-8?B?c0wvMUpieUt1QUJLVEJseklTdlZHNzZXRmRieDRCTWJmeTE2MVphWktKMkM4?=
 =?utf-8?B?VU5obmIrYW9odjdJV25ycU9WOXlDYmE1R3VPWHRqUUxielAybkNPbEI1T1di?=
 =?utf-8?B?UGJyalZlNmt3R2lSSXlOOFJFd2NVNWIyMkJBSXJJb0xsV05DN2dYM2hXZWtv?=
 =?utf-8?B?bnU5bmV3YjY4QXlpcFlRbENVQnRTV0RSTWhhRS9vUllnV081aXc4bkZEOXNW?=
 =?utf-8?B?SGUvSFZSeWVmOWs5TU9JTk95SGQrTk1QNUljTldDVC9MNk4yVEtiWmJDN0V4?=
 =?utf-8?B?ckNvZzdRbjN5OURkQ1pWTHhyTU5KY005em5uVFFqODgxYjdWNjl1a01mcTZM?=
 =?utf-8?B?blUwYVdYdlFxU0xQd0VIMEdmN3FTdzZ0V3o0NUhxUHB2TmYydHF1akRUQXFO?=
 =?utf-8?B?SkVIV1FhcXJVR3NZZTlhV2p1TGJ1Y1IrSmRlR1o2Mk15VWZSYjAxbitKMndj?=
 =?utf-8?B?a2R6emd5d0NFc21BMHo2eTJ6VktNT1JzY3FLREFuRGhVZkJLZ0FheFQ2cHcr?=
 =?utf-8?B?TlAvQ21mZCtHVCtXQS9GQjhkdkFwZXZtWnUrbUNuNUw4a2I1T1hSQjR2a0V5?=
 =?utf-8?B?MGR5NDVJM1p4TTA1Tjg4WjdHekRZWFlPSHZiV0tFUWNWOWlhWnhuVCtGWUJG?=
 =?utf-8?B?NTZ1b2dhTmtjUm9RSXJldERLN2dHVVhuNmUrTXFUcnJ2RnV3dHl3amJneGFa?=
 =?utf-8?B?WmxMWFFmaWVHU3pQenRqbFZhQWUxTzVLMXpvMFd4amNIOVJEZlNoaUl6a05S?=
 =?utf-8?B?dUt6M0VWTGpHMW9aY3E3UVZ5MHhzWTh1dHcwWFl5WE0rUlNoU2toRm1ja01W?=
 =?utf-8?B?ejQzS1FWTzNJUjI0MG1GSlNOSmswd29HRk5YbGpic2hybWgxVmw5VzZCcjNT?=
 =?utf-8?B?ajlMQkZvZDlSUjVDckFDUEdETVBuN1pKZGJEMVJLUW04bzlZMHcvWnNQNlB3?=
 =?utf-8?B?OE9RZ2Yxei9hVEx2ZHErNlNUY3hsN1lvWFRWaUtLQWNlazNnZ0k1Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d78a7dbc-3707-4b2d-b811-08df1dee9e01
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:58:00.2541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viOLgm7UqRmUyAOljVYEapBn925bLdIYE/SUxxfAuDa55MYmoss7Ouwhps4irAAtZNiPezzDY1CzFtx7aQgUzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR03MB8707

Hi Krzysztof,
> On 29/09/2026 04:59, Zhentao Guo wrote:
>> Hi Krzysztof,
>>
>>> On Thu, Sep 24, 2026 at 03:55:10PM +0800, Zhentao Guo wrote:
>>>> Add bindings for Amlogic hardware decoder accelerator.
>>>>
>>>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>>>> ---
>>>>    .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
>>>>    1 file changed, 114 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>>>> new file mode 100644
>>>> index 000000000000..751043c3d9cc
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
>>>> +    minItems: 2
>>> What is happening here? Previous version was different.
>> maxItems: 2 implies that a single items is also allowed,but the hardware actually requires at least two register regions (dos
> Since when?
It should have been minItems:2 ever since v1,I must admit that this is a 
long-standing mistake.
>> and dmc) to work, so minItems:2 makes sense here.
>>
>> The same applies to |power-domain| and |interrupts| below. At least 2
>> power-domains to make the hardware work, and at least 2 interrupts
>> needed for the two sub-cores.
>
> Best regards,
> Krzysztof

Best regards,

Zhentao

