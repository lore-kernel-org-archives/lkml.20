Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794220888;
	b=3JarEowV7UAGfba9VlkaBV9+HzNPfnmIA1SsFOX65MylCUmiG+yl7Rxw6LLX93D3+/JI
	 IHmAEHlCnB+Y6b0QGnMX02m69SpYpp04wbnlieLe2bKdL7V7cA5fovFnbzljzc2vSN0F9
	 l4T4KO3fkVMbcCjkaWAA5a7zRbaODMzbJRjFilsVh8Cxc7n/CH8OaysWjV+LMWw/+8n4Q
	 8FIdwzWDs6E+M0YYvab23GUecgDuOYH30DMDvsgXcemlxtSZUhjtG27V6juyMPH+crflJ
	 81JnftekQlmyXjsuKQcllRjGUsDuGnsTUHPtz/mPiMWKLF3bqngGJMGJLXLLgXCtv7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220888;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=W28HontvBSgr3DnfpJOuCXFwb4mRPPg2MCEjraXIUtg=;
	b=I4Iya4YVK01rfoHdV4iQpykJJyk3DS/7jP6GYqg2Ag55gUdy60kB9ZSJiTUD0ZX9gf/H
	 GIygqKSwDce5J6F3uvuv7r+9+jWnt4QZuV0xz2gLyZf0k04vp/zaUFk1yqHyI8kzTFrJH
	 dZxRwyRA9b4zi0Xe1R/gdNTNFYLdalC6LmRQeehmlqMF5lnYte6+K8tdmV5eB7P9/SzOj
	 vCdXiOXZCdPntlOAiuEWUcDrfVGcqBYgvbKi8uje8lK/BqR7tUCm544mfDsBfMF6cn5CK
	 bGzFa3TvAbfeKNk8iIutZxdgpZXRqdDoN+9slD824Oo93+PP5CVVM8c/WpD2dflPivQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fFQIEPTQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.60
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013060.outbound.protection.outlook.com [52.101.83.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E688A606A31C;
	Mon,  9 Nov 2026 10:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E688A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fFQIEPTQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzWysOMubq+rNaimIHh0vEUHRev+qtSVjdOOtu8CjdBsxchmimwqmKNi5gVe9URrAsbpOVia+MIPtYFrN2UnFcM1FaJ244klbWHyX8hD7c2n6JM7PfmmVvYTcTxDwqpYaZ1/0StqnhUyW3tqBwsiPpmNdaTojcaCtShiENO7TTgQqf+Pm7lMQYO0SALodqQts5DyD52XUnQBcWYA1iRI7oNuyiC+udKNcU0BaZGu1AGXMvjP1iLH6P0F1tffG5WlnOlRDgQOmcJl37+QflTzj5FPEMzrDNULj18WpqVdpZoD0lAsONAwXANLW6HFgbDm48Slt3fNMz/ybuPQxSinSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W28HontvBSgr3DnfpJOuCXFwb4mRPPg2MCEjraXIUtg=;
 b=tjC4aVhHKccThIeg1lHP6tO4qTo14s5Ngs5ypQMDwsknjJSQDXjiPEoPeMcOdYTtOxO6ysAn/b7quv1UGA2PUyjpH/a4vo7fk0EeAC8fY4LtbHIvPes1P1h91ou18t/h8Vgcnm1OJc/VsJX1NyCgZvMUxdmLkUBl2qoj5AjVzZN1OUpAVGFP9zAhrw1Y3fhW5p/Z4CVNeIME+0s24jId0w7da7WH2V2IaIIFNZ/+8XHQUCx8ftwHAHnEfd1rgDIkyGEdRBKSDN4hzMZFP8IgSuB2ah+bUlTBitg39N6UOpcOHIUi3x32pxYz5P1mMDhYF00yGiKb7WmlEchZ18P5Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W28HontvBSgr3DnfpJOuCXFwb4mRPPg2MCEjraXIUtg=;
 b=fFQIEPTQeO2gJYT2zsl5YK0ecWaBT1czgXMEeJ/M7vB80IJnQvHsPD51RBl0Y6+0eTXIp1nXT2+4MuIunGvWgfRw8Nenzd32/e88ukQg90WjSJGyHobAUujVD60UA3N22Or0/LwWXUApSxIjNHHCBeFdWsrVA9Lj6fPEsMAvW9p6ODqRcttkU3ol5dXoSbe+DBX78Fe4IyqW2c1A249PsW+YwM/wAxrBusm2XCxPl88Yrbya2SksL04USxYknvRUzBBeNoFUt+NHCJ7XZge2zi46+nVef6F/OVVzymaRuckcPJR/fXn1cbdzsZlxjAgFns7bsXOnf028Ivk2nly9HQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8364.eurprd04.prod.outlook.com (2603:10a6:10:24c::17)
 by AM0PR04MB11879.eurprd04.prod.outlook.com (2603:10a6:20b:6f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Mon, 9 Nov
 2026 10:41:24 +0000
Received: from DB9PR04MB8364.eurprd04.prod.outlook.com
 ([fe80::9f8f:d501:88da:538c]) by DB9PR04MB8364.eurprd04.prod.outlook.com
 ([fe80::9f8f:d501:88da:538c%7]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 10:41:24 +0000
Message-ID: <6cc41a88-b349-43a9-b90e-cf95183355c1@oss.nxp.com>
Date: Mon, 9 Nov 2026 18:41:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: fix error handling for DMA channel
 retrieval
To: Mark Brown <broonie@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20261028025921.4155551-1-shengjiu.wang@oss.nxp.com>
 <11ef44f7-e268-438f-8a42-c3bb89e42cfc@oss.nxp.com>
 <7a9ae82c-838a-4543-91f6-e4f6397c4e91@sirena.org.uk>
Content-Language: en-US
From: Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <7a9ae82c-838a-4543-91f6-e4f6397c4e91@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To DB9PR04MB8364.eurprd04.prod.outlook.com
 (2603:10a6:10:24c::17)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8364:EE_|AM0PR04MB11879:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c4d87d5-2bfc-4608-ce48-08df3e4e0012
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|7416014|366016|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006|261026140227099003|261028144727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	Hxurh8HBKIZBAJ/jr6FHlGtgbJSL/8zpbKlS5ThQQC770rhPgbOQ+QIQjdJk1tM+odLPB+ufxOkULilGb1cDVPViyREkBOZte6ynD08pDixRI6+RRtksWGRspwirXLlGuKiJHmvRPLPs57SCdhXfFHIep6F36tP3roTkf6QJ7dSvuOhgj/hRDKNNIiRuLRn+HuuOigG1nMeTxJnWJgdMnWSyRBpRJJXf1jOwalBhDPyLJ7EFsDNqSISzP/OXVDkzcFmTldzK/AD0WBFoWVwFkeu16Shu/719IqUc0EIhXpClicL8+dxFEYfWnxV75AhqpXRi18B7vsctBsqyqOrn3FTFV+jkTtFJd0GckaahMwkupbcUoe7i19SM7LA6VlDxrZqrr+6rhkOeR+IuPBVbayLHHsjW3mmM2g1CDB8R1iNehnGMFwZwf6RuljPT7H/IZ29kOU2e0FjP9rVJx7b/VCxIM7N2JYFfF2Lyj7oDEiJw9qcpPg5R7k3d94K4sSHJ9rSwbYHmxk1hzNFgL+FWUpkVtdDExNhadx+KW4U6IClTEuQATJdJWolyvklqeb6wGa0ix2v4uJqudq44Z56iY8PT8X7rPqnIgqiGeRHlvWyZePbdXwFExsfvOGHUkljGCnbaLCRy370EJGpsJ5pKOVe7xxuvFE8cuIBxegXv48c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8364.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(7416014)(366016)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czd6ODNKQkcrSUg4dGxHd0pVTFRDSlVLNElHMWVrNFFISFdrSlE1QUxBZXpZ?=
 =?utf-8?B?bjh4K2pjTjhDbytleEx0NC8vSm1CaWhxVVNCS0hLVzZ4K293dm8zaGYyQkps?=
 =?utf-8?B?Q3hwNm9aZ2lJNENJaTFsL1NmZVE0V3NMemE2bGpqL29ick1VZ0pKSHR4STY3?=
 =?utf-8?B?R1FPbnJVUEVWbHRtVnRkV1kwWUhOanhvRE5PdkJ3b3g4WGZlK0NXc3VGMFFZ?=
 =?utf-8?B?VWFNZVljTlhzOUFUYTAxV1BZd0k4eUFkZGptaHhyQW5uTzcrbC9JS1hoSlJZ?=
 =?utf-8?B?UkxNUGcvRjVhTi80bGxkV3lDUythcWlBMFVJWFZFdVhxRzRkR1o5YWY2ZTY1?=
 =?utf-8?B?MkNtYU51UmFReUlhVDdPR0J4TmNRNW9mNWtqTlRxUUJvaTgvU1RIQ2pXVG1t?=
 =?utf-8?B?V3c5RHU1U3pVT3JWMnNxSDYrdllUWUErdWlCS1czY3NsUDdQU3Npak1ra2Fo?=
 =?utf-8?B?emJQK1d5R2ZWcnlhM1JmSHRtZ2JvNStzSDlGbU11aGN6aVlhcFlNTjBuUFJh?=
 =?utf-8?B?ZmEzYVhXQXRhZEQxK1Z5aUttQWtlY0NYUkNaM1VzbHZYOUlJVytzWGgyVUtq?=
 =?utf-8?B?QUx1VE96S1BDVFg3cmNWMXJ1ZU5nNTlRdCt6OXdSRFc2UHEvd1FoNUppV0NL?=
 =?utf-8?B?SlQxSHBxdmJrSGxyUm02anRCc2FCcFJOcEVnL2xkL2NKczhhdFBjekkyTzBC?=
 =?utf-8?B?OVd4U2tqNGZFRzIvWVdrYVRWcTNyMThQd3N5UEhRUDg3U09iZFdpR015Wjll?=
 =?utf-8?B?ZU5kcG8wZWx3TWhUWmN6M1hFN0xJT2I5NU9wUE5XNHAvMmV1Mm9xT1RrdVln?=
 =?utf-8?B?NVdnOXBlZjg4VWRMZUpXbHNRN2tJckUvTm9aTnF3RkEzd3JoeXkvdGVHbito?=
 =?utf-8?B?bEpOR3dlSHdSVlQ3NVB2azhhcHJUdDZxeE5DV2l2byswU0Y3K0RvdG9CM0E0?=
 =?utf-8?B?SVBudDl0MndiNDZvcUFIaGg0TzVUSnVUcFFNMjVMTTVTWnlVRFAyS2Q2UFJ1?=
 =?utf-8?B?NXkvZ2UvbG0wZkdHVk5BQUhEcU10a0VrYjdGQUtZT3dRTFNuamhsY0g1MWxq?=
 =?utf-8?B?aFdjZnZrNDJjcldKNEhnYUlXQkVQQVduY2F1cHVjVzE4bWlkUUVHcitnWEQ0?=
 =?utf-8?B?OW55SUxiS2VYN0ozY3dEZnR5N0dhMTYrdkVEOTdoaVBrSCtkWXdpeVJJYzVs?=
 =?utf-8?B?cmxqL2o1U0g2ZVZlR2VGWTN3em5yTEQwaDVrTEVYbkEydnJZQTdhYThJOVRn?=
 =?utf-8?B?MWRHNGpFNHZYd1pDNElTMjV1djc1Q1pCZnI1Z3Y0UWprdkdpcFRKWWUvMi9t?=
 =?utf-8?B?ZlVjajhsZnFmc2VKcnU1RklVTUwvNGR3MUI1dUt4ZEt4djI2QlFodzcwTG5L?=
 =?utf-8?B?SnUyQ0ViVkRLOGlhZktjaC9mK1BSS2cxdG1IZE8wcDRacWJNTmFrMUxXK3JT?=
 =?utf-8?B?SVRUbVMxTnhOZU5LVDJFeE0zMlhiU1pkR1Q2YlNPVElMamFjYXFMN1I0bWNY?=
 =?utf-8?B?S0Ntek1uZDZtejQ4OHZWaStNQmtwby9DRmNNNDdzTk5oSDZ1bUFrZjJicW95?=
 =?utf-8?B?clpzdmdhc1puTGJpeW5SSHQ4Q1pmdDlyRUo2VXhMM2RSYndVVHB6VUx1TlZG?=
 =?utf-8?B?MUQxVUZrbUxkd1dPZU1saWs2aGRyTTIybmNzV2k5MmlHcGU0OFBvM0Y0WU1u?=
 =?utf-8?B?SnlUTGc1d1dIeXQwZFU5SUR3Und3a0Q2OGo0SVZWNzdtVHltbXBFbFNxOS9I?=
 =?utf-8?B?SjArR2F6eUxVQVcyaU9Fd3U4Z2FaZVhxbU9Tb3lINXR5NDBzQTYzajR0VmNQ?=
 =?utf-8?B?bC82RUFLK2thenBoQWpxSTFZUFVJSmlqbGVrSDJFeEtLZ1pjYnZDelMveWtj?=
 =?utf-8?B?UzJYVlgvV2hnN29PTWh5S00wTkpmSWNmTytTbGMxUDRiNFlDdm5sTE5IY25D?=
 =?utf-8?B?RlhPV2U3OXZ5QTFkKzF5aVVXeWhUamdlRlJkbFRhSnIzcUVpRW01aGdCRURq?=
 =?utf-8?B?eDkyaU5YeEV2dyt5Y3E4SXN5L2lsemNsNzFDbE50eXNJQXJCZGFwMmt2b0hS?=
 =?utf-8?B?UmtKbHJ3OEVTKzByK3V6YVVSWUJuTGlja0FWTTlFSTV5NlJSTkpNczg3YWxo?=
 =?utf-8?B?WDlHcytZWUlPL1lPVGd6NWFicUtSN1E0MEhLTHFHZE8wMmFqNmpqejZRN2hn?=
 =?utf-8?B?bUVJVDI0dHZBUEJHTHh3bDJ2WXpSM0p2M0ppMktsR0p5NjJrMFMxUnhyMVVG?=
 =?utf-8?B?RDhEVXQxbVY1ZnQrMW5QVFBNUUEzcG96WUlibUloZEpHbjFjWDVacjY1VzVC?=
 =?utf-8?B?L0d6S1prWEorcTZPekVYUFd0VEc3NzJQVWdheU13d01aRGd2b2dDQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4d87d5-2bfc-4608-ce48-08df3e4e0012
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8364.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 10:41:24.4453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMyGmVW8BiPCD6Klpu3qrflTYrZm8U1Nq/zezfdWerZj4r9fOJymxBPjFqJwo+/sbV6IqfBG9aU6BjUUi49cDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11879

On 11/8/2026 12:00 AM, Mark Brown wrote:
> On Fri, Nov 06, 2026 at 01:50:46PM +0800, Chancel Liu wrote:
>> On 10/28/2026 10:59 AM, shengjiu.wang@oss.nxp.com wrote:
>>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>>>
>>> The original check used `if (!tmp_chan)`, which only catches NULL pointers.
>>> However `asrc->get_dma_channel()` returns an error pointer. The NULL check
>>> will always succeed, so replace it with `IS_ERR(tmp_chan)` to correctly
>>> detect errors.
>>>
>>> Fixes: b4136c0d69ea ("ASoC: fsl_asrc: check the second front-end DMA channel")
>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>
>> Reviewed-by: Chancel Liu <chancel.liu@gmail.com>
> 
> Note that if you send from an address other than the one you're using
> for your R-b it'll be ignored by the tooling.

Oh, I never knew that. Thanks for the reminder!

Regards,
Chancel Liu

