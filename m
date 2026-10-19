Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013018.outbound.protection.outlook.com [52.101.72.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11450349CFC;
	Mon, 19 Oct 2026 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403355; cv=fail; b=sR0PejC1FpO+IOyhW3ehR3Novowe66RoJ6KxUzGU6RWb29z7dhgj24TKeqbsJ8+sB2VWpnST3eoJc6mdkOIPTbam6XpOpEDbnKjJgdO/QhsShkxP1YzcV00O69Zf1QiRsluQEt/ob6M2xDqPMLhgJ+sUkYQkRlZ6NWaoNmm7WbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403355; c=relaxed/simple;
	bh=23DHOUAQnaCL0ZhN9hXOAlYLVkQ5Ni31IMPWYwAoz90=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FSgDl/DmbtYxf/EeXEcyN8LNRgJIUD0MDWWtssy6Efr8tQLElSpR+Ar8zShsVQO4Ju2e3B2vr1FdGheMhn7+nWtoqpTf/CdeydrpFq9s0digqfxWDPzodF6iKmq5q02vNN4sK3D3IRrx9EIs34Qkqan76jTLqJWJWDFOd19z46Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oTbuLeoB; arc=fail smtp.client-ip=52.101.72.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oTbuLeoB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgqGC7TKcil1MUB7ArJm1YDxYshcjHC1zJ6/wrXXat/CKVFPm9F5Xojn08g0DlxSTkrX0hQhKMqOgNGJpBs05WjMw7JbSgaHjOs3oc0dGV3VVh8GB9QY2KMQKiTgkJniXi8/oUCGsq+pDkV2Xn0S5DCu/xjkPmkj1DqqGWu63Hk26S2DAr6whQKMnS8fSP2BWhFnv9h/0HDsx58ejvRZGXfL5jTGiRQKZ4RoKWUdk4zFd95oFzlzy/B05DKvGe5hwMRSWX/gjqNUbJQI4ENFR/xkMRdVRaq5wdBHo1KjiraOCXwxR/5oKl0SJUJ9JuLxauYsam9/9vvzLVJRdRH3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQq/slcQaFKKGga24/UH4BgdRBeX//rBZrmtpja4jGQ=;
 b=NmoWw2sAXlgnB1eq0PvmEJDIjuDaYtohOwMziXkFT4pgKh+MjoISHKM6oT/2m7zals7KzF3ILK1S3KmDNJ0u3nnafmR59Es1pXItC4j6fojwCunzYsmUpSyU2nwhjsaUDB7zN2Wau5S4GS9DdS7WEqLOxe7kcR7wyf8wZPYTjS6soPe/idgTtoGrbvo+MnFj8FHCXK7Wy1evLz5VmL23RcRgNAkhpwoE1SZ1mP8hdca1kS3Q9VOBeSSQLsmN7prY+mx1oZX4j31eCp55dcslRh5TDQhu9G4ZCTJMpo+wz4FfTqvRu3eZx0pRFgg0s3avUP9NErazsQmCex6gQK2zGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQq/slcQaFKKGga24/UH4BgdRBeX//rBZrmtpja4jGQ=;
 b=oTbuLeoBQ+smFmhZRdPC1J9xvg4Ey9J420mXNfajqs5AAJVKbC0fDZ1OgzswW4L6/giaELrKvaYiXzPIDAmynUwiJ90PviRevsQHl7vUe9DwRm6d7EHqCtgy5TC8Lat3p7c4I56yD+iZtbVSUN2q80U6g/Wi3kegUpiX5DoUTpUMz3CGOSrrtvoQTXVogqGMZO6tghSzjbD3BB94FRjkVA3w+2/1JxmK3f6+rZEVWFFM7n481CJVrnqeAWCzOPojM6voJzkyE1wEHTwobTZT9LuEqy0Oi3WHrE1EHA5Xtm5yi+f3/Rii8w0ZtKsnsiYKYILpMn35cOiU11pUutIyPQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com (2603:10a6:290:c0::7)
 by MMZPR04MB696060.eurprd04.prod.outlook.com (2603:10a6:190:4c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 09:49:09 +0000
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151]) by MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 09:49:09 +0000
Message-ID: <26f655c8-211b-41a3-bfa4-584bd53a4ca5@nxp.com>
Date: Mon, 19 Oct 2026 17:50:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: imx8qxp: Add display controller
 subsystem
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-3-alexander.stein@ew.tq-group.com>
 <atBLglf0gSLS7XkW@raspi> <atD9yeOeHZiKzhZD@SMW015318>
 <atH5htXNBjFYq6wn@raspi> <atIyHjPaKLlfdv5W@SMW015318>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <atIyHjPaKLlfdv5W@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:4:197::9) To MI9PR04MB350878.eurprd04.prod.outlook.com
 (2603:10a6:290:c0::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB350878:EE_|MMZPR04MB696060:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b962e9-6a06-4ce7-a33b-08df2dc63901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|19092799006|23010399003|56012099006|10067099003|4143699003|11063799006|5023799004|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AvVdmkCVYslz3yZZRbGJosnr+ZQKYcxK4RtsUlVDXOprsrFR3+pPc+qAdhri0IHc99wAkylwNqsWPBwb63k8GDzjVWZNRSh1J+E54TlZKzryPXkhUpMDq5V4qwb+9t6TqqvOk01bxjB7o3jlB4kPEk6EHiigGGJfxwvv9frfd7GcCvEsiej8j/6HUjXzfoC3SQSmRWbKoJh3zmxE59rnp5AyBYThZ/iSquP6/NzvwaPqdirk2i1Q6PxBGHtjwSrO7uyYNH56ALNKAsC4mAmx4lIyvYYr+VbUiRZCJQ5QR7VkS8omBuDNwHaoY2BnxC5HqorkHvpi0mr61NfaIQjml5xiKnJLzO6fcMAz/f1jobS+5VaBorff5aMXoIL1R33Sep24ztM6tpjANhCdJohokat44bOj8r216ONLF4shzmIAzb29rTGkOUWKJv8nUIjN0CgnFAtN+9mPbfJWi++l0zSaTKOAGQUScnttDlbDAt/8VwF0pfuN4nj0tbsAScTi9kkkyn0gu/cA0UJzHYlbpDqnoyVl3/CNNHhbSbiPGMwi+T8m+9tv641X9pHsq8OpMz2Z2XR9Jq3XzgFwsFYgO1d3bgB5FpJH5vzKFAVQhRBIOngdLpx6t+gM9BSBH6l+fPsRYhfmPVWDZf/3ErmWdvonPWu9peKPK+P/FadpnHA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB350878.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(19092799006)(23010399003)(56012099006)(10067099003)(4143699003)(11063799006)(5023799004)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTBxQVZMcStIY2ZJQnhVdXZoZVo1aWlMRUNveVVPSTJ5QjdvODhvZi8wSXZ0?=
 =?utf-8?B?eUVueGF4RURaOVBFQktuOC9QZm90Q09WVUxDVS9JVGZIY3JoeVBBQ0g2VTNX?=
 =?utf-8?B?OW1ITkRva1orUWxra1ZlYVJjUStuSVdoODZ2andKOTdjTXlTSWg4dlZrYzND?=
 =?utf-8?B?VktnS1FuN1ZNWWRIZHJzNUcvSUM3V2Q1YnVtR0ltb0JRTDlTT1dQSWNPandE?=
 =?utf-8?B?cDNsaWozbnk5d2pkK3VDN3M5RUVZK0c2WkFxY0VPM1lsZXU4anJqbzdTZGpn?=
 =?utf-8?B?OTR6Q0hBTnlha3g1VWV5TVZRMWM3bGNoWmZCTjg4dGtCUmVacE1zd2NrVVFD?=
 =?utf-8?B?RHdkb1o3em16Q2FpWkVhMFFxUWc5bjM4bWNrN3YydmtVUURlNVV0VUFOMUh6?=
 =?utf-8?B?V05kMEhxR3pIOEVqOGE3NUt3WHBBTisxYmZleUpOb09rVFVlVUVZUkNQRUM5?=
 =?utf-8?B?cnhkNHRsa1k1bkRBaU5sT1BjTStxYmIwUm9zeDBsQ3IyUVQxNGM5VlEzcy8w?=
 =?utf-8?B?eGVVa20ydjdORTVteXRrTHkwc3h4b01sU1RKOWhLZkRaWCtBQ0pGb2VMbUl0?=
 =?utf-8?B?YXVGYm5CQm5icGVNRjFkU0dHbSt1OUpTbmREYUhrRGVzdzExbHVSbnA5MUkr?=
 =?utf-8?B?Q01jdGZqM3NaZzU1ZS9TRG5vR0dWOE5NNmtXK0dvNlFicDB4QlpFU1g2a3E0?=
 =?utf-8?B?SzE1ZE4xNFRyQXc0N0Z1L09OLzJhekdkVHRRN2xUWFp5bTZLaFdwblR2K0hV?=
 =?utf-8?B?TTVJSWdLQ0lZYW9zVW5nR0dZaDh5dEFicEJhUlowaE9yOHJvQXJ2Ui9xSlJT?=
 =?utf-8?B?ZHlGd29SNFVSZWZGa0xhNE1XS0ttN0JQcmZrWkwvVnJQWTB1SitNRmhFd09U?=
 =?utf-8?B?Y1VEa29EUHBOeFlUeDN0SUZtclVNZ0xOTGRVSy9WSUV0R3VUdlQva0hSbXpM?=
 =?utf-8?B?QmkrclVtYWRwZGMyQlVJck9IWFpjT3p4SUZKNHowUFRUQzdtK1ZlbnlZQlky?=
 =?utf-8?B?SnU1WnYyRW55UWxISGxVdWZWWFo0Y0FCb2Zwa3hjaWFRTTducXIvK3FvK3dV?=
 =?utf-8?B?K3M3NUVwajU2eWRubDE4LzV2eGlEYTZ1N1RWNkJhMExnM29NUDFndE1Pc2xE?=
 =?utf-8?B?cktlQW5XbHVYZG1tNzd1Z2I1TVQ1eVRNaDlQTjhvUUlhLzZmTS9jODB2TFpZ?=
 =?utf-8?B?T1FiR1FFYkYvZEtwMmhoRUhIZ1pwNHl6bTRFVFFoV2dCQ2RXQ0pFUHdXbGZI?=
 =?utf-8?B?WmhBaGF6cGprdmxYVktTUUlMeTEwZ05vNGZLSU1OZE5IWlVDVEI3N2R0cDV6?=
 =?utf-8?B?ZndDTzVOQUZ1cVVZV0xQaWU4WC9pMUlwR1dlYVdzZ1lkSFpiTWxLa2VRcWdQ?=
 =?utf-8?B?bVlMZW1sSVFuZFkvaTc0cmhyNWl3WTVXYW8zNytMbWo4WndVYTJydkduR2J2?=
 =?utf-8?B?WkFSajRwNWlzd21OV1o5Rnp2T0ZDbmR4STBCS05GcU5sK0UyKzI0VExhb3ds?=
 =?utf-8?B?L3BQb1RtUEhrVXlmdkF3OGlEWGJpbHhnMUptVVJsMzltekV1VGtnNVQwUGN6?=
 =?utf-8?B?d1k5NWpQOGM3Z3Y3Sk5vZnM2TjNYRmxRd2t3SERIeEViMENjRk1oeStZS2Jv?=
 =?utf-8?B?R3VkWi9yWXVuQXUxdlhwd3lhL3BZdkkvbjNiOWIxQkpidmxBRUFENHFJNk1h?=
 =?utf-8?B?MmdBT2M4NnlhdFBpVnRFNk5XNHdoTTk3RFpjSGdobVlwYVJ6NDc2c0J5VnYw?=
 =?utf-8?B?WlJBVmN2RjlzRTRGU1Uxd1RIdmRZL05DYmp5WmFHeEthV0lSVTJSUkVXLzIw?=
 =?utf-8?B?M3Z6N2tIVTBCR1dRQUVSdVFxdFc0QmlRL2hnSGFJSlc2NXdIMTh0K2h4Tmxq?=
 =?utf-8?B?c2R2THhhd2hEb2QvWDBscDhXR1lqbW1xQVBHNEpOT3EwMHdvQnhyMG1zUWdW?=
 =?utf-8?B?c0tQR0svUWlVZncxaUVOKzdYRko5MjJZdnBoWSs0eEUwRFpRNEg5ci9GSzhq?=
 =?utf-8?B?VmRPUU0yWUx5ZUp1dGNwSEh2ZGRVU0VQYWgzTWZCU285UEZZNkNqamUzMDYw?=
 =?utf-8?B?VElnR0lSampTMnEvb05DaHVkUVN3WFBrS2FRbXBBOTM1bW9yL0VudSt0UmdK?=
 =?utf-8?B?aTRtM1NOcHlWVDA4Ty9vWWNHa3o2cER6Uk05d3VkZ1ZGcVg3SUkycVJxanhX?=
 =?utf-8?B?K1pibTUxNTgwRmI2WStTbStESFdZcUE5dWdwMmVtMUEybVMyYVFWWFdDUWNF?=
 =?utf-8?B?dDFGL1E2MXRrYXZ1UkxqS3A2eGRxclN4VzVNNjBXS2htaVdjZVpOWEwxWjl6?=
 =?utf-8?B?S2NGNElMcDNDVVd1RkpIWTEzQmFPdkNIWEFlaUZ2aVNiakZJZU9TUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b962e9-6a06-4ce7-a33b-08df2dc63901
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB350878.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 09:49:09.5586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eetc9tT7ZxsZzUPQhGqP7FVfdtmCgqTIzyqZrov/i3bp9D7ti92FEkv/GutdfL4nBu3AzM5SPNQlPBMuhTfNoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB696060



On Fri, Oct 16, 2026 at 09:18:06AM -0500, Frank Li wrote:
> On Fri, Oct 16, 2026 at 06:16:38PM +0800, Liu Ying wrote:
>> On Thu, Oct 15, 2026 at 11:22:33AM -0500, Frank Li wrote:
>>> On Thu, Oct 15, 2026 at 11:41:54AM +0800, Liu Ying wrote:
>>>> Hi Alexander,
>>>>
>>>> On Wed, Oct 14, 2026 at 09:16:46AM +0200, Alexander Stein wrote:
>>>>
>>>> [...]
>>>>
>>> ...
>>>>> +
>>>>> +			dc0_framegen1: framegen@5618d400 {
>>>>> +				reg = <0x5618d400 0x98>;
>>>>> +				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_1>;
>>>>> +				interrupt-parent = <&dc0_intc>;
>>>>> +				interrupts = <28>, <29>, <30>, <31>,
>>>>> +					     <45>, <46>, <47>, <48>;
>>>>> +				interrupt-names = "int0", "int1", "int2", "int3",
>>>>> +						  "primsync_on", "primsync_off",
>>>>> +						  "secsync_on", "secsync_off";
>>>>> +			};
>>>>> +
>>>>> +			dc0_tcon1: tcon@5618e400 {
>>>>> +				reg = <0x5618e400 0x588>;
>>>>> +
>>>>> +				port {
>>>>> +					dc0_disp1_dc0_pixel_combiner_ch1: endpoint {
>>>>> +						remote-endpoint = <&dc0_pixel_combiner_ch1_dc0_disp1>;
>>>>> +					};
>>>>> +				};
>>>>> +			};
>>>>> +		};
>>>>> +	};
>>>>
>>>> I'm thinking that it would be good to have a complete display controller
>>>> DT node in the first place, including those prefetch engines attached to
>>>> fetchunits through the fsl,prg property.
>>>
>>> what's current prefetch engines status?
>>
>> I need to address quite a few comments on v6.
>> Some are difficult.
> 
> If needn't big change when add prefetch engines, should it be fine add this
> part firstly? It'd better than nothings.

Prefetch engine support impacts imx8-dc driver a lot.  I hope we don't need
to support the case where prefetch engines are bypassed.   Adding this part
first means that prefetch engines are bypassed in some device trees.

> 
> Frank
> 
>>
>>> Is it possible merge at v7.5 ?
>>
>> Not sure.
>>
>>>
>>> Frank
>>>
>>>>  In this way, display controller
>>>> driver's life would be easier - all child/grandchild devices are always
>>>> available.  I'm considering to adding a check to the Linux display controller
>>>> driver to ensure the availability(at least for critical child/grandchild
>>>> devices).
>>>>
>>>> --
>>>> Regards,
>>>> Liu Ying
>>>>
>>
>> --
>> Regards,
>> Liu Ying

-- 
Regards,
Liu Ying
