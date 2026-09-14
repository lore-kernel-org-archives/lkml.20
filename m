Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023143.outbound.protection.outlook.com [40.107.159.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74DE442B0B;
	Mon, 14 Sep 2026 10:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382764; cv=fail; b=s/xBxK9WBE+SDknSCS+bVejs7CVVmi1lJ8Ra6R+KwKHTWlPvSRO9TS/qMz7WNSyMQC2qBBdFGn9+FX8kfgQq3DSObBs9j0QlbnoUrMxifH/m/QD1bcbl42L2WeoQgmS+Tj/xa/Uc2SRYPku2vaXWHV6HKOfmN/BTtjaFUmpVgsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382764; c=relaxed/simple;
	bh=ytuupqL/e2BsgVh6DbDtr63u+5VlaFo2AJeDP2qv3vk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YhPEcAmqT64NOw0utnUYgBkCBQ9+I2FbOgL4ql/TZk8sp5Jlgm0HLDYgRhJda6VKQJ+tolpe1JJ3GfbYEIx6orCVsq/tYNfSVNBKzAgRLdXjKoKCqwdWFTBfxdEZ8muAGCEHloejnRxaF3SuhtxflReKSDoSlG/graMWzkyBQyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=ZhbQBz9/; arc=fail smtp.client-ip=40.107.159.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="ZhbQBz9/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJD7HuVLMGSHMUFWO7NFIK9gBdwdQsDA7szHcs7Tzyr38kUnmVY00cMsKjowpebn/tEzRN4HOjx7EAESqa2QzVDCFB7UklX8gg9QCgoHwQU+FLbk+dAbX/AlGh2WiSPgvJasECcAU03SLEGnsUbYWCGj/YKXiB3F3isoOs3cloMrGDAfMx3myw4s/b5pYJpNdxNIBxWnotTWJ9jQOWUMve9Cn6vq55VoXBXwvj3b+SE9zO4nUAnUVchXi0SLDvqSRFOuZvTtE+pycAU/RM9ENt94Ae5uoCIFr3B1i5zgYMnOIYBVIiRIngaUoST5myYChLN7HsFg7Duj7Js8vW7I0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aA7IkSg7qZMurtT4nHi8s65NMPNq/lTZcFHsq+6jjiw=;
 b=SHaoE8Af3BKBDFUGNdFLEaLmEV79x+OkovPel0XYUepCSLOKQ5IIqW1I8x0TfF15ZI5ni2WZWO9BY0xKE28XyBK48gvjGK61d0Bbk4MyIdJSLdtL0SCu8+OAznyjCNkYSfTxk3zuWR3o9DySJmgmEB1pu6GU7+E2tmC30bTPwIaK883ceCSbNhgdYRz0EZG7ITTkCkz4/KRICinqGjTxJznx2jZuwiqvJc1NtxLeUfLMRRqN2uI0kBWMkRlGkZGOFOoR8vDD+F52SIWPb9eKo1MrrsVqzlI11JIm0TLM3KhbmRT68nA86+l1AK574uIN55tztd2VwW4Y7P16Kdx0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aA7IkSg7qZMurtT4nHi8s65NMPNq/lTZcFHsq+6jjiw=;
 b=ZhbQBz9/uzHHYRwvJFs1JPWWVV322+e+HXpKILBMB5/3nRsSxfeRZK7X0yvKRtts8E+x1dC7TbTguLNKNDo4PE7tt0amuW5nhhxM9oZG+SdksU2Tyi4DmxGluGWuCVWx12L8paO2RQ4Lptz/T7r3El/ZQ6TNO3fRBKAr9Htti+CEmdRPi2YtIqNpTOzwDu/fr9shiife4rkyJCAl9W6gQA3ie/ZuQhD7eWBSpwWCiUpPXCOSVro8Ops/azvNm6xiuC21WHQ4qqGCll1uIC6PAO29TkeemrACGmNKZc9mw9wqDT2xDuITvq9dTUicUwtHTCdZGJm8tqqLiPmtr/Ollg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AM0PR10MB3553.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 10:45:44 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 10:45:44 +0000
Message-ID: <2062655f-886d-4194-b7bf-3048b7139c7f@kontron.de>
Date: Mon, 14 Sep 2026 12:45:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v50 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
To: pankaj.gupta@oss.nxp.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
 <20260912-imx-se-if-v50-3-80834ef510d3@nxp.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20260912-imx-se-if-v50-3-80834ef510d3@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0322.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::15) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AM0PR10MB3553:EE_
X-MS-Office365-Filtering-Correlation-Id: 9929c58b-71bb-4afc-3976-08df124d544b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|921020|56012099006|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	HFEYKXLwj027pRpZi3TDC3jb/rv5Nh/zK1lFzUEEGDLy/d0O4dhvl39Ph2ojBxQGLmmnjLP+D4qJGDNmg6tklseN6okSyRcZWFMEuYDYCJaOW83Hrd59fxQcNcB/2c+NV+uQYBLtxKoCw0XZ/yP3S5qwfE7WbQwDS7Q4al+WaPjPkgTaqQnYN68Sej2Df3DdYp/JbiBTcQMFrXElBuCWMdSKaoJcvlI1ID1k5HNi2zbmKEga9rUXrTrZ4PiINVWhldjBwMlla3V9ZzVp0F0iGpStVMYKoZvEKZVl9EOZOS/uubZoo8d26RB8uUwE65XiYpgVKgfm690Hm7QoLKMjcjPu1mbmTvUH90G62lO59DYfQWWYEn5K9mzSP5QaFgtqdoqPXepVwbgCBWB0CSesC0fSbm6SBfZK5yZ+4Mr1oZT/R/WZ+ay5uxhhlwT/mYm6H6VClO8jmcpduY5c4zuX17K5hsGNOVWBBkEZBBlu0RShGz20G65KrV4HavM3uk8Qab1N1tYFaVoL21qcmv1S+bq/tON90poJB5XmE9csr3UPUUSflRbO71GmDWoFbKHNkI3OEwUGNn2jPXck9SghXq5VdOXM9h83XjNYIcOBtHzULVyAiHPpZl3POOqsqzlGPPFVo0CLSRHo6nU9ZQrxqYBfAmlKHxpKKBHOzwHdvramOKHy/k0a78k9KWRJj57siyAQZdavWoaGF1IuH9hC1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnQxTG02V1BxTC9sOGw1ZWVKK01lV05LT29ITjhNd0ZUVkEweDZKTU45OWxy?=
 =?utf-8?B?ZFM5MHptTXNWZ254bDZVZlF0V1JNVUZ6SktGeFNIdG1OU1R5UlZOaDZsWkdh?=
 =?utf-8?B?czNWWDRzZEMrL2FaR3l0b0FJMTN6L1hiY3Z1Y0dJU0YxZi9PdmtiWGN2UERq?=
 =?utf-8?B?Tk01aUdhUUN3eHN1REFtVlNxNURMbWgzakduOGg5bEczRWJCTXVaNlZ3T1pC?=
 =?utf-8?B?SHR0aENhSU0yc3BhK2xhUk5mVkU5NzlzWkU2WDRuc1k0dko2cEM2WWtGWVZz?=
 =?utf-8?B?UGJQSFBxMnNmTFhVMnN4aEVnSnY3c1JRb3FwRTg3Q09DQ2l6WHhEbkVxYnhY?=
 =?utf-8?B?cjBEQXgvY3BYUzZUZXdWdi9LUW9CT0d2UE4zaUNMcXBVWUIvUDEzVy9HcG1Z?=
 =?utf-8?B?K0YzL0NuS3p3dFR0dkQyM0xDYWRXV1drN0NBNlRIMlQ4NnFrajN2L1VqOGFy?=
 =?utf-8?B?Z2JNS0d3c3dzWXUwNzNjY0l1c1RGanlCNktyN1IrU3VrcWhpSFcyQjQzb3Ur?=
 =?utf-8?B?alNROC82SDYxYm9jT0Q5MEdXVFYxY0ErQ3NlaDV6LzV1d0dlY0VEbEVaTnRy?=
 =?utf-8?B?M21FcGFaTTBoaDdjYm4vSCtPS0xvd25vSHNDMkx3ODJXYWxZSitKemJoVVp4?=
 =?utf-8?B?bFlDT1hTQkppYlNlblBpVDNPSTI4dlk5NWtVR3RmNjRHR2lsZWMzYWVkRkZJ?=
 =?utf-8?B?OFRPK0JlT3VEcHR1MFZKS3pOYUZUMUlKWjZxUjdwY1p6U3hhYUFrKzJRbzJu?=
 =?utf-8?B?bVdrSThld09LYWZTV1pUUzJJOU8vbDV5M2YwcUNWVFc2SUpYYWthYXBuU1dH?=
 =?utf-8?B?M3RZNkgzKzB3YktlWktsUlZ3L2kvTGVGZ2R2THE1OE1hOC9sUXQ0Q1lJT245?=
 =?utf-8?B?Q0Rhb3Qyc1RXUTlnUTBveCtBdlVUcVd5cTIrOHJNSFNUbk5mWE0vaDdJWk5o?=
 =?utf-8?B?S1UyUlJuQnk2T01CV01NaWRwM0NHVU9NS3VOQVFibmdaanVFMnM5dEI5dlp6?=
 =?utf-8?B?RDFVQkRRdmVTSTVUZmE1MjNSSnJvZDZZRWpRc1FFWXBJVTZVZjNaVGtuM3Zv?=
 =?utf-8?B?OG1QTkJaT3lGeUpnL2c0dU9WbVVZbFhPNVdUeUUwaHdUNld1Q1FzWVZoc0gr?=
 =?utf-8?B?d0RQdFJrazBqa0pVNFBRcnBiT3BrcVR3c1Vsek5LT2h6ZStxN2QrQWpaelFp?=
 =?utf-8?B?OWR3SEU1MXMzdUsyUXAxSThHdjIzZk9rTnFPYi9BRUtJWHRJTXBUZ3R1ZW1L?=
 =?utf-8?B?b3dkQ3JHVW4ySkgySWxKbVV6SkxhNmt2WHd6TytKK0dMbnlaaWpmSDBadkh0?=
 =?utf-8?B?QVVtOWpvM0hWbVRvaC8zNGpLRnpWSlF3aTh0WU10VndMMWJFNWFwV3cvaEJW?=
 =?utf-8?B?TEppK0I5b05Bcmo2Zk1rdW4wWW5iL2NFYTdkaENGUXkrZExlU0RMa2Z2dHpq?=
 =?utf-8?B?QUkrck9BNllEclVDeWNnUWdweGx2ZFdUeWtQSkF1ejhINTc1Vm4vS25tTm5I?=
 =?utf-8?B?VGFBNHNPbVhQVEk5VkFYbFFENDFmdUI3cExoc1d0M2s5OHlZd1N6SGEzOEs1?=
 =?utf-8?B?SFlEejhHWWxYYXVDU2E1WTlyYXpCaEN2MktoU2ttWEFEQkROWi9kMk5IMWJJ?=
 =?utf-8?B?dXFua085alUybDFKVGU4NzRyZkY3elp5YkhCcWNWSXAyanA0RmduZEVZMzA0?=
 =?utf-8?B?NmtMRE5OSVJXeWl1NEdWS0x6Vm5yUEV6N3U4cUZ3MHlodEJxbHZya3ZrWVF2?=
 =?utf-8?B?ZEpweWJld0psNGk3Z01rb0l3eEJZMUZwUTExak92SXAvMVRha2NWaGIvaU1M?=
 =?utf-8?B?VGRZc0ZnVDB5b21qQ1NlUFJLSDVsNnJtYVVsVTlVamx1NENxSW85TElSWHdH?=
 =?utf-8?B?VTF2VGhLVWQyQmEwcVRRci9uc0U4R1B2bWR0akt2NFM3Ymt0KzA2eXNFQStO?=
 =?utf-8?B?cHhsNDJJWVVHWnVvUTBDdjZkYTR5WlBZdlJRVHpiRHFoZ2Q4SmJnUGFSd1dU?=
 =?utf-8?B?ekh5Ny9SekdSWFhNODdQa1V5V2NHUGcxVUU3aFFWUnB5MEc5Q1NtcFk5TGlQ?=
 =?utf-8?B?VXhCYUZYSk1DTURDWGNhTnAwdVhSWldFbkxDa01QbU9KWDNETWlNR3l1QUg5?=
 =?utf-8?B?WkZJZXNqVDFMbDZoNzZmWUlnMzljMThLZ2gwTGFFeFk3RXB0WmRhOXd2akcz?=
 =?utf-8?B?amtCOUYxNlJzMWdtUC9CNUJlOUpzQUE1UklUS3ZGWktuNmZtU2xLVytSdDZr?=
 =?utf-8?B?Nk9BWGxLZ0xBUlJTM0lJekhkZ2EzdkNzbm0wYTg1eFpiMWRBQVZQQVlJVmRD?=
 =?utf-8?B?WC91NmxiRDlHSzZDeWNiUGlkeEhnOGIzenFpSTFscU5qYmtaK2haTVVDQysw?=
 =?utf-8?Q?21Mb2VUZq0B1KBFA=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9929c58b-71bb-4afc-3976-08df124d544b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 10:45:44.8123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjsTeBCTYgDg81BS5WBmo061N2URkRZ7oxwlc+NgTq6vHs2XK/7jfyay7lKFAQO8r2YLD2HK44cXXzqR29CJvH50+IHfr/wOjZ35MwuRDaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3553

On 12.09.26 19:03, pankaj.gupta@oss.nxp.com wrote:
> From: Pankaj Gupta <pankaj.gupta@nxp.com>
> 
> Add MU-based communication interface for secure enclave.
> 
> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
> embedded in the SoC to support the features like HSM, SHE & V2X, using
> message based communication interface.
> 
> The secure enclave FW communicates with Linux over single or multiple
> dedicated messaging unit(MU) based interface(s).
> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
> 
> For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
> world - Linux(one or more) and OPTEE-OS (one or more).
> 
> Other dependent kernel drivers will be:
> - NVMEM: that supports non-volatile devices like EFUSES,
>   managed by NXP's secure-enclave.
> 
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>

My review was for v25, my test was valid for v29. We are now at v50, so
please, as requested before, drop the tags as I don't think they can be
considered to be still valid with all these changes.

Thanks!
