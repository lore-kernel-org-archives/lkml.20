Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D602E33F59E;
	Wed, 23 Sep 2026 08:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151798; cv=fail; b=n2asDOcEvhsjGmJXzNqV73E2KYbqoCnsO1LerKocmK0USofxgcXaMovR+O2/Ac/xaL4hoO0BcmHMenxgTG1tpAHHFyuFBb5dB6LoMgyktxT/bophrNZyI2cHyK/J8XXKQRj4QVrfKJTvsq1QqLviLgMfpT+2FF7myE+pJslkPks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151798; c=relaxed/simple;
	bh=/Gj7DBd33db65eb3ULIbRWef+GrrFltVWb0UizUFQB0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kc0o7/Yn/LUu9zE+4CXdrNSM97Xwh1c89FD89ANub14DXmwzC/79iYdyJSQR4Ko68IAt4UX5ZdaBZC16Y5U0cb6StTjs7bbKz2c1VBwMMC3EAkflq8OKLp/vOYsNkqdvVNkRTZ+8k22CSsSAzxMMhEDi7eCGxlQHU2Nu6k7KRDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nFb3erXo; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nFb3erXo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrL7DzYr1KVMX2Nuv8jcm4AjA7OyIfdjiXcIGPRCFoEz/2TTn9f3Hv7te8fSIWfYatgvAziGGFgHvi09P1ssRDOHZdGCcsnw0dzFcYncOir+lCg6Dpu4qIilDREMLcyr+75zvclTrmuXEYkV2bVpItzA0Jp6bgmr0ozoUh32AHPOvKepmQXotnnYLu6fXlbfOqvbsrWhVRVixtJCOCS19rtGutIXiyw1VlRMVzAefg9F0g35cUlxNTmd6eStIHMfHKE0Ij6D1CEDb9PS2iczSYowSd9gh/ccaN3nIzr0PGGYvWAEzS5u34bZRb8vwkLtlsTeS+mjb2B7Wd4xKSn8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gx2L/zjd0Wk6vipv0iORdoh87ieK4UjhVw9gERuADFk=;
 b=YpCS21Vkh8pPfC9Y9VTGE3YT0+othJnvq0chK5/kVHwu6VAiFy7CbUnuGkiDthX8ffUJhWj4REno6wVUiI5sEIc28h4c/K79/gtg++dGv8nqDlHYtclMajk2es6Gf3z0BvleNu1EXPEsfmX4oU5CtM4hW+ak1wF5P+93CqgHEqHzGDlD+GJ0fWmqPExzr1lPbOJl59EoxOmQb3p7b5SF5BHs/juQ4axkiMtM77vUe3bFYCSQUrnClMq602hTvp2lknQ8QpKtDmClRD94ZTWfr/7LG/vEeHf2qFydJ+D/vBZ5ZFMayKaduTuJCbjrTkDYJ8JXZwBSRc8DvTcGoZCHhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gx2L/zjd0Wk6vipv0iORdoh87ieK4UjhVw9gERuADFk=;
 b=nFb3erXoJQy8HcRSL9taWV2CqskomMtRy3QlwTwlV+XFjKI0UgmRE+rZJ393/aNbHWtzRqV8jCjoc5ayO+TErE4jkCPh+PqGLKyHzh1hJyhk6uXgMplVxw76aLLawgPeK979gqiQqPkOPNfhYxE33QyNhJ370gXiz7HPkjAjF1qSbniI6ieXHuKy5ts3MXQuFKrTu29vbyHOb1mkMP+XHgCO8xhJDBYXZI6FaxwIsujT3Y4ySYWcrDQV5i/EXD/gsa20wPmNPqVX7LK5bLy29RuP27ApCnVP3q5iX9fr3IXFuSrntYrwVSZqtEnpOLdhC9Af2vh9M8QCBLvyg6qD9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS1PR04MB9559.eurprd04.prod.outlook.com (2603:10a6:20b:483::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 08:23:11 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%3]) with mapi id 15.21.0451.012; Wed, 23 Sep 2026
 08:23:11 +0000
Message-ID: <da815d65-335f-4a5b-b62b-3a64eef5a845@oss.nxp.com>
Date: Wed, 23 Sep 2026 16:22:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] ASoC: codecs: rt5640: Move mclk acquisition to
 the i2c probe
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Oder Chiou <oder_chiou@realtek.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
 <20260923061305.4041197-10-chancel.liu@oss.nxp.com>
 <1690dddf-02ba-4a30-b490-d9e317303b6f@intel.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <1690dddf-02ba-4a30-b490-d9e317303b6f@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY8P220CA0048.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:47::25) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AS1PR04MB9559:EE_
X-MS-Office365-Filtering-Correlation-Id: 540cfce3-5c8b-4c84-bc8b-08df194be5e5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|7416014|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	POQLj8R1qQ9wVuuZIyAfRgUAgbyT+w89hEjsyUNrwSh6F8e9yDNzM/9Rq5XzE+1o0pfxXgZwBuyYElC0K1CFnwJopGW7vVA5eTju/4grnMknPT05k6z2lOBhNozCY628ko++iZ9pGPs9csJuG7RyG9K1ntFJDgGxXFt8SEwKHpp3VYHCWH9mYQG7poxZ3QK3HtVohWnO8/K/6yLE0omTrWHYTNiC02maKcRIMX/q91LcYLkNhoyQnwat6Qqy4eww0GoCQde5ezGvS82xLaV4V48sUgrDIBV14XK5dcrYwayPc+l808om1VmwEgUedkw0PhITIhGX0q743qwXTYDOW//TQQs9J6ipHBwuGJ7MYhrUiqrHpZ2UFqwCsWJNw8CuVsO0AavDAaKQ5UaPlMaRInDpWHkVzqWnc6KVXKkNT/EiYQcw/3A1FnKQJ0/UlC3Gbb94jI4rM+9Sfjlqb1fRuPjxSqwuUaj3mVJBn3EcZVjYGHut8ErCzBt1OF0nZkQsasN3qEHShuSQ/z8IlQ5a3FQAOHXH8Ybj+UrKbd87bnGpyIK32sLtxBqWPxRiMi6Hd6XSib8u+Kg/CCMQltK+hwu13Au6FVWTAownuOjTmHi1Zc+Q0udxH50i312LXndcxiBc/w5OGEpS3eHnIdp7tdfd0G1DPBgY7Y+kMqA8zLU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(7416014)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djZVMldDOXFsUXhQYmRrVnNtUVdGdWFlOTNBUU1pcUZLcUFMejhwNEl5NUZ3?=
 =?utf-8?B?blMwVGdzS3Q1Y3FKSFlFNXlzY1Q4YUF6Z1djNitPZ0JOL0JjaTIwZ2s0ckNJ?=
 =?utf-8?B?bEFvbUFqcFVNYkpCRUtqL01tVHRVcUgrOVQ0Q0pkM21rMEhnanFuQktPSXFj?=
 =?utf-8?B?NTBFVThQd2tFWVNpeDlueDE1d204eDlCNjFldGIxUERrRDJheTY0ZEhVV2tm?=
 =?utf-8?B?S2I0ZGdxS0JnY0dSWlU0MzArd3pSaTNicUprZjZUbXNhbG9OZ1hGYTdUcWdB?=
 =?utf-8?B?eXlDM3ZtcWdQZGl0Wk5RTGpLMmZCNys3elNaWEFEeGhpeFlUdmI3UWJ3ZHhp?=
 =?utf-8?B?TlUwQ2pRSTBvLzVCZzZtRmIzbVpxLzJVZkJsNzQ5Wlc1VW55QUdXSzFLQUFz?=
 =?utf-8?B?ODhod3kyQWxtVEV1TmhabzZ1cXV4YXcyTjA2OUxxVWhyY0JOV0duYVcwRkRY?=
 =?utf-8?B?SE1wbzMwMHZrRjY5d1BMK3RoL1Bvc3NMWDVOaU9CWWJMd2l2aUdGdzNXVjd6?=
 =?utf-8?B?YjJMcnpjOGJvTEVJTnZ1dWo3cEFnR2VMQUtDOWt5a2VRSm9tRWlNT2pRNnRE?=
 =?utf-8?B?bDJKd0JXV2dGWngrWWZZQWEzemxzUGdIeDJjWm1GSXJzVkdnMmd1MTQ4ZjYw?=
 =?utf-8?B?Tm41bSttckd4OURlbW9PNk9QOVdqQ1R1R2tWeVRJalRySW9MRVFKOEdBMXhV?=
 =?utf-8?B?TjNSdnBIQnM4R0tnaitPUjh3emRmUjVIdE56RTl0MmVQb0NIUWNaVjVvTUVF?=
 =?utf-8?B?ZTk1MXJ5bXA4ckh3V2czMXNad3FzcTdpVzBRMVRxUlZ2cE5mUlBaV3pSVkgy?=
 =?utf-8?B?eUQrSVRsV2JhQUQxMlZEUmVsRXJid29oaWhQbVZsMlhPdnBUVVJNZ29vY1gw?=
 =?utf-8?B?UU90ODVnaXR4WDg0YkJtdmZrcVNhczVoU0RrMTB5SXd1cUhKdEVqQTVHcExX?=
 =?utf-8?B?disxTFg2bzRpdHlOTjkrTjQ0Nytjak45YUF6Q2lUY2xMNDlFWW9TUXRZTjVz?=
 =?utf-8?B?YkJxL1ZQUGJMdGZBck1PVVVxRWFESlBVUUJlSG5QYm1aVjZQbWFjendCN3ds?=
 =?utf-8?B?U0t0cUtIRy9EaDhpbDVYWVA3YXVrRlRBU2VBRFhYT3drVWg0SHh0M3g5Qyt0?=
 =?utf-8?B?R2xOS3ZYUXRZSW9JVmRVcGxBQTR3dDZQTzhFUWxUN2JTVEJOdWJDekF6djRG?=
 =?utf-8?B?Vy8wcHZaakNXRkx3aWwybVZ5bW1SNkV4dnJ2L1dyU2NBOUFCN3dlT1Fhd2w1?=
 =?utf-8?B?Ty9HKzJ4TUtlbVNyYlJmbm1DcVc0Qllpa0czaEhlZDdrajEzMk5WWFdUTEdO?=
 =?utf-8?B?OHBPSDVKd1FKTnFzYU5Gd0VFeFc5SHZCUXNPdFNKN3J4Rk1vTWlYY0lST0Vn?=
 =?utf-8?B?RExrREtqeFcvSnlOLzg0akdBSm85NG9IZjhEWkFIUWYxY1ZNSGZwN0c0Yk5G?=
 =?utf-8?B?a2l0eEI4SHZGSlJxUkNFaXdtU3Fab05PU05ROEl0c3J4U0xnNmtZbkhSK09X?=
 =?utf-8?B?dU5CSHBJN1k0cmU4UmNKbVZ3bmI5dUtOaXVUd0hHdFRjelllMUVpam9uSmRn?=
 =?utf-8?B?SFNFek5tektLbStyRVFRMGN5YzM0VEhRTUN2em1rME45ODNyMmFRVGt4R0Rk?=
 =?utf-8?B?U0ZTTlFNdnlyc0FJeHdLMCsxMDFqcVZuVUpyZWpaMVFJQjBZOW0zRUpuUlh5?=
 =?utf-8?B?eDh4Rm13QjNNeVpPaTN0Rk16VTh3dklZSnZ3Y25YdGFRRU1RcHRtT3lEQ1M3?=
 =?utf-8?B?Y0NEQVNBY1JYMFhnYVp0VitLMzU0dzNCUkxYNDk0azlpTk43QmNUT0hkME9P?=
 =?utf-8?B?K0tKZjhIa1pHWHVLUG9pOUVvblU3MVlCeTBDY1JEWGtKN3BaSUxzcXAxRm0r?=
 =?utf-8?B?aFZldkw0WTRIUFdwVXBQcTBBQWw5M0EyQ3p0UGNNRkk2UmFxR1d0bHNMNnlI?=
 =?utf-8?B?SGdPZy9RNEY5VXJxQy80M2w2VkdpeGRhRDBrZ3J0VGNJb0RScjJvaHJiblBV?=
 =?utf-8?B?dGFDUjVnN3BiQWdIWm1aNHhVT3lWOHpPNTZKcEtiYTFiaDdrdkU4Y0lTZFlM?=
 =?utf-8?B?ZWRqZmxYdVF5YnEyTk1ncUNqRWlMbTRiNjRkNWhWVVlVYnY3Yk5jVmY2ZCtH?=
 =?utf-8?B?bDArcXhxeTVqSlRtem9kdlNybkUvN3hVRDVnQlphdnFvbDBrR1ovQ3hnNjdQ?=
 =?utf-8?B?aEdPcjMwVVoxQXFHWGhPSzU1RitUU2RLWTlHbW1jVEN6TEJ6cEZsb2N6U0V3?=
 =?utf-8?B?ZDYvZzlOcDYvdTM4VC9HWWo5UXRUT3RrcTR4Z1JqWTJDcHg5NlgyYXdQY1Qr?=
 =?utf-8?B?UC9SYnZ6MStEM1J0SGxLVE1EbVV3UzFqeUxBQmNDUTY2dWhmejhWdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540cfce3-5c8b-4c84-bc8b-08df194be5e5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:23:11.6211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvJ7S8Huvj2IhlqpFb8eBS9LRKFzPz8qpUBIYcS919iNPE5nTlBjmVLn5dE501tOW+/nW+5fSblB53ruk6WmCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9559

On 9/23/2026 4:16 PM, Cezary Rojewski wrote:
> On 9/23/2026 8:12 AM, Chancel Liu wrote:
>> From: Chancel Liu <chancel.liu@nxp.com>
>>
>> component->dev is the underlying i2c device whose devres is only
>> released on physical device removal, not on ASoC card unbind. Getting
>> the codec clock with devm_clk_get_optional(component->dev, ...) in the
>> component probe therefore leaks a clk reference on every card
>> bind/unbind cycle.
>>
>> Move the devm_clk_get_optional() to rt5640_i2c_probe() so the clk
>> reference is tied to the physical device lifetime.
>>
>> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> I see no reason why my tag was removed. Nonetheless:
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Thanks, and sorry for not noting it in the changelog. I dropped it only
because v2 change this patch slightly (acquiring the mclk earlier in the
probe), so I wasn't sure you'd still be happy with it. Glad it's still fine.

Regards,
Chancel Liu

