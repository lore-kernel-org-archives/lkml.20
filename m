Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792434391;
	b=4f3vybjuJrh81jPtuxZZV3qz5ixMr0+rpamW0mFH3NBrLuUsN3JSUQY8mAhEKq+GYvX/
	 nabHPuGniK+NzGcZZLfAR5TS/Vm+WrDxfvLFbLVoHWbcKA53zLZQ/Fm3H+doV6uIsp+EY
	 yVfTsn3a6mvvK2aPU9pT1bfZ6d2buwpPFRmqq+u54PgJwtKrjvQ1YWDckVPTK9uRPxoaF
	 bFKrqq9POvKq7ts6Ex9z0Vlo1cRCyvWwDT9FLr0vJE8ywXKKcUYOTycNnjfMsWyI4AEsH
	 aFr3m28byvFyRv69qr6EsFhZvoCiQCT3JK0s/E07o+2V3MVi9JgPGD3JHXm4fFUh44w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434391;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=TFg2rU68tA2UcEctW1PdrGrP3H1THO+/cLSHvMb2DK0=;
	b=TOe4hwJysZzCAzb8Xm1zyvLam4623Wq4IRTJ2XaAmglG6vJMBkPvAOUxu2pkvO6gX0oJ
	 bZVrvJ/50uEiReLu6Sapd5Iu6GRXXrakxpqUWctPLSyb/UwXSTw9EJLN71imdDUkdfLyV
	 fjSLmea5gyTiFkt/OEA92X3VO7wLRUBVAQpTXPtqbvO5MK1bVKiAEC/DPJe/tMHXzDd5N
	 WyLTO57JKRYct9DRpzOyKKcwEfZtjwbbDVzBoMP4F0XRyNsJlBZuDwa1YO68O2tWAPBUq
	 h4rcUqhaXqsbU4r5+WZzsgWCsn6qP6lwwPajy4O73tGGV+SyyDXnnFuZTgZxzQnEHIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JG7HvPI9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.65
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB4760A260B;
	Mon, 19 Oct 2026 18:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB4760A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JG7HvPI9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5meSxm7XFdjqWp6bZNWLAYqWqC1+CZp+J4+SqfnQjHMDts3bb4WwwdRECPfPjR4d/+9UToTkV4IS3727CCP5tbiFPqPoesMSmeGx7nQr7JkZFFouY6ZM2ffWGCquSOdmBsPfJsPxVMKQLKqvZgNILA9jVJ1lzxwFGXOa9nXzCTGghwjtpyY9naGZ3EafTVd1lCI+r6HAEzn1YjJIMUtSE2r9gwIjZrHzcVhcPM/0s8rbYVnxJRqGiEpGTesT/5VBUh5/oI/lG/Ydq9ShpY6KujzYoLP18ZdOijcWwfTshwR1qUf6To0GpvCac2sndnrVLipyeYpm4PhPvfCujMDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFg2rU68tA2UcEctW1PdrGrP3H1THO+/cLSHvMb2DK0=;
 b=A0guntQyCq1vcFitScBcyLtlmpdutTmeKQ+ZnCoYjzXd0AFI0SXACkajeuHV5yVl/y8BJL50aP02CN3D5Dh4emV1tDbfXRS4trecV2I1/rdBKAjMKiQ23gUXRv8veYHpdhKovoIEE9GBEi/J8nH5jmWF8Ag2ZJuCk0p6TEC6mqsLrp3jFytY576zkCVy8bKad1MWb3DP0M8RgBYZQNS2FeVtAV8iIaIyLDJxQUPYD6J95w5PPyjIF39OwStlvYpDe17SRkV9wrAGTkefZW8gAT4g0FEPbBponEfCnxElxVptnWwn8N9Ss2Xh0NisbjXjPc8Pa70RRuRIGXJIu7CNYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFg2rU68tA2UcEctW1PdrGrP3H1THO+/cLSHvMb2DK0=;
 b=JG7HvPI9qsTogMwq1t504dQFejteevEIzJSOeOZqnwl/tb44rY9CpdxYvPM9TBcROKk4q3e+Uui2Q5qTTexvswhUTI2lF3XxYge3CUVknquVFMea8bpA+QIuIH8fusKOJe1uT/bog7zN3N7H1YNR/tizjWuMP5crJV/Xt5OkqUJDc9cDZ1Tmtan5Pjjuxq+Cz02HcWVHEyRP1k7PCIPPpgDLqNKgLZuTq8UO/aa4yhsFax6r98yOUekH/NRYenLEauWJjaWPvNkQxeAzcwDwc3Ot2UodIAlVOA+q3n1GVPPojnnhQ56CtgtP6YAzhuHC+7W41kdPgfDvsg5G6jzpCw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB11557.eurprd04.prod.outlook.com (2603:10a6:10:607::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Mon, 19 Oct
 2026 18:26:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:26:28 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:26:16 -0400
Subject: [PATCH v2 01/13] ARM: dts: imx6q-dms-ba16: remove undocumented
 property fsl,receive-dpll-mode
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm_dts_cleanup2-v2-1-dcdcbe6389c1@nxp.com>
References: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
In-Reply-To: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=998;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=7o3YrIQ8lxAz3Z8buXp5Q/WrWjZcgI9ir2do6blqL3w=;
 b=KQDFU7tt9MWsVZJIbBSgeN+ZQHCkuJwGHCzWAU7qI+XQQWXVGZg65x/ukwxNhb5FmBDIJF/ud
 Eyr5NBUG371CeibWUUtw26fSNX3rZVUqvH09GsSLFI5nLDFYaNCpc+V
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS1P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:8:44b::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fabd48f-bcf0-4f38-0636-08df2e0e7da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|23010399003|18002099003|22082099003|3023799007|11063799006|261009221727099003|261009220027099003|10067099003|261009223327099003|261009223027099003|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	GIRAViLGzyOAlMKjqEa1lA0/3IXxT1nr0w0mJnTG7MpaSPE0/WZ2gdAJizPq/bfp+GZQ9Wvw8XjenXNA85uHAFMAPPMnM2T0VXQ2Bgd1iCl8zxwRgOQOLQQ1H9Y5w4GrbzgbsklyfKSpNy2HYUDLIA1+rPOzJpDDXFzbbjMueLqXWU2Tf6DUU08za1JBFAvQD2fXCyBeG4I3ZsiAp9UXdSRNyYEup960ohdfsK3qGfiubtc8Npn52eA0DyuIW9n/8dA5xgzRYVC+vFNPeszBwj4HvDD1d0oxxQLXvZOv7HyZ7FaaDEAiTlZUHuYwaVr2vVKM3fQliQvg7LzTo5QTK7WUaAe8B6G8+2WjAyVkVuzU567ZE9bOOyna5XP547UyquRaNMkI1Au+h+uQQeQU5MOYr5BJYa/2JO8GESUFZWR6uDy5gm14n2J5sPYYkY9SNtAG6GKWJnzZztlBApa3fU/PpR5Cx4iKwy2+tzt63npeE2OFwSCYAKGGYceXQBPy/pclO1WGGtqlEdZOeTCsHuwDwBq3I4c0y7FC8DifvzNqMvE31D2YGmIglAEZf8EqhB4z99n3dUGkutUX0d9nZ0XVcLOgMmVJP8Dla4V+7rsKyNjQr2gqJrICJus5D2ha
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(261009221727099003)(261009220027099003)(10067099003)(261009223327099003)(261009223027099003)(261009221227099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEM4SXVpVDV4NUVKa3k5dzVBMGJIazJjOW1JTFlvd0ZMQ05TQ1I5UndOV1Uw?=
 =?utf-8?B?Z2F6VEpIejJ1eXRXb3pSRXdKUEQ2Mk5rL3B4VEJqYnB5ZHk1ZHE2QzBhc3Z3?=
 =?utf-8?B?TVBXZ2swVEM4WnFVd09uWkZtQmNtNVlhRjQ3UDlPN2F1bjVTWUxOeldLNGVh?=
 =?utf-8?B?MVpRUE5mYkQ1dkQ0M0w4UVBid0l6TlF3MlRER2lkK21hRGh5aFlyeGM5bm1Q?=
 =?utf-8?B?UCsxeit2TXpGSmRLcURlYjExeHFsY2FEQU1OS1RETCtxUWhvV2w3ZldESlFp?=
 =?utf-8?B?SjVTYmdrbC8wZ3pPek5GOUZaZEZhcDlNKzhjaFdZOXlCWlJ2K2FwZFl6Yk5Z?=
 =?utf-8?B?bVVpLzR1WGpLSTlvREFHVHduWXNqSkxSeWZsVnViNEpza0xueDlxZ0FCNWZZ?=
 =?utf-8?B?a1VqZDVFOHEwbTFoSXlnOGNQK1F6Q01qWHIyUFBGRzZnWUpHTnhyUmpYb0sz?=
 =?utf-8?B?Z3hpS2tzWFRYOUIvTGMweHNTcFR2Q1lCV3V0aXFkNE5Ha2RVclRTVzJrV2Fs?=
 =?utf-8?B?NnZOYUJ1TDBvMkgyTnYvNExmb2V4SmErNnlBR3FwUlc5RXlFMVJFbHJQOElw?=
 =?utf-8?B?blVITjRad3JSbWllczBqeC9GakowNmd6WEU1REFOdVVrUDFmQVZLS3lkWnBz?=
 =?utf-8?B?WVlNNlJLNFpLMkV1UklsbHU2cjZ2R2FoQnpJMG1sK2Z0R0p0blNSZzZmWFVF?=
 =?utf-8?B?RmF3a1lFZHRXUnVYUWoyR0QvcERqYW9TeVJSUWVUSFFqYW1hM2J3cHJHNkVZ?=
 =?utf-8?B?eDArZGFhZ3IwVTR0eHduck9TZXp4Z3VxME9FUTJ4RkJhZFgrQU14RElJbTM2?=
 =?utf-8?B?L25JcjA0NS83T1FiRkxDQVJTeHBiWkp3ZU1saGsrWFovN0grc1pDZ0UzeWd4?=
 =?utf-8?B?VXAyYTZnM2JRcTB6Q0gyRzJjenNGTXoxYXI0V2ZoSlVVKzF0bHVmZ2JaUTQz?=
 =?utf-8?B?amdLNzdKbEE5dXp5Z0I5VmlrUU1OaTZ3c0daN3JaUnlneVVrVmR4YzNab2sw?=
 =?utf-8?B?VVFDRFdsOHdJdjN4VUphUkN6eVRDd2VMQWQwcVIyV3R1TTVYLzZrVmdxYXJq?=
 =?utf-8?B?Qm50WmtwUlhDc3ZiTzJUTjFjcHpmSVBNNElTa1NGTnd5OG8yRGVUYkw1U1ZD?=
 =?utf-8?B?ZXE3Z3pPdkVkek1CYURuYWpiQzlaWTV2MHIrWkMwa0FJcU9rM1FCemFwTmdD?=
 =?utf-8?B?ZUd5ZFpoWXFncTdscm1FZFhCVVBhUkJWcURKLzlLcGdXTWttSkcrc0N1QUlV?=
 =?utf-8?B?bVFNbEg4elNiMlN4VXpqKzFoM1RhL3poV2UyYStobCtXUUJxS29RbXltei9n?=
 =?utf-8?B?TDBPUjQrcHBwTFZGWlBQbnQrVHEwV0czZXNDemd2cmNIS3BXaWtWc29zcmdF?=
 =?utf-8?B?bk1LVjllMTdDTWt3UjNEaUV5aW5xdVR1dkcyYkpsMEEwa2NqbTh6L2tSdk04?=
 =?utf-8?B?TDJuOVdhWjNzUXhYQWwrRWxQQXMvdHNOQUk5OFJEeXBGQUF5UUVnMThVUE1p?=
 =?utf-8?B?eEpxRU1XU2RTdHpuRzBXNmhPNzNiM2dQU2YvVmxvdDZPWnNkQW5ITWpvTDlV?=
 =?utf-8?B?czJDZXFDWlZBa0tFMTArOXdkVElmbFdnUllKWjNOSUZzdDkya1hjRnhWdVVZ?=
 =?utf-8?B?bStSNVB0NEpTLzJHRkpwZG54ci9KdEFhaTh4YkdRSkJBY1g0TDIvV29BSUtm?=
 =?utf-8?B?V2FSKzcxa0hmSEh2dTEwQ2FnanZ6cldEWFhmK1dNUkhGbi9TSnJhci9hRlp4?=
 =?utf-8?B?NDZCOENCaURWV3YwS0RGYzJlekdXdVIyem9YZ1JlS0tMVjZNVHV0VWtqajI3?=
 =?utf-8?B?Z3BOckFsSmFUMkpFU21mSU1yMUtsU3kxQVg2ZjFiaHIvNnNqWnFBTmNCQ3B2?=
 =?utf-8?B?YzB0YnUvRWo0aFBVNWZqSDNsTmRGV2phNy90VDY4VXVrZVpOVENtUlpIcW5T?=
 =?utf-8?B?dS9sZTg4NHJIUm96UnpuKzI2N0pDUC8xRXhFNUpRenpqMjk5aDExRENDSE1X?=
 =?utf-8?B?L3NOdlJ3MUxPUm9wQjlpdC9WM2trSldaaTZJSnVqY2hlVFhmUDlUTllwNG5E?=
 =?utf-8?B?ZVNBU0NZa1ByM3FFNkZBem9NU3lwcC9tbmo3eE90STk5KzBFaVNTZWJhbGN5?=
 =?utf-8?B?WGJIazcxWm1UUlVDUi81TWU5MUlTVE5OZWNFdEZFRDNOYUJaUUV2UkVRSTZt?=
 =?utf-8?B?L29FdTFXWVc5YUYwbzJHMXhVdjYyaVBNdmFKcHZwYWNBcDN2WWdCWFlEUWtr?=
 =?utf-8?B?SnBLVDlGbXB2NWxlVjVSYzdQYlNWcUl1RVQzdTh1emZDMzZGRmgxcFY5YWYv?=
 =?utf-8?B?SEhGeUxEdTQzaW9Yd0RpTDMyODdwQXZjaDJTRjZoaVdQTkZLVUJPNFZLSENt?=
 =?utf-8?Q?cv9b+xqSFReCwW9fvxZyjQD5ysBQERCz5FXx9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fabd48f-bcf0-4f38-0636-08df2e0e7da6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:26:28.2971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LB5YaSreNsAFR0L9XUzEwhqnAI7+VVuP2hIO+3Kvp8Fs+AwaMSfMht1gc21fqMS6ayIOcsVWggKQoxtXyq6g03VNi3BU0i7LVYezUdToo+pQ+jW59FLT5jrmtveON4DT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11557

From: Frank Li <Frank.Li@nxp.com>

fsl,receive-dpll-mode is never documented and used in kernel tree. And also
not used by known user, such as uboot.

Remove it to fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dtb: sata@2200000 (fsl,imx6q-ahci): 'fsl,receive-dpll-mode' does not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts b/arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts
index 484a60892229d..766cd50390bc0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts
@@ -115,7 +115,6 @@ &sata {
 	fsl,transmit-atten-16ths = <12>;
 	fsl,transmit-boost-mdB = <3330>;
 	fsl,transmit-level-mV = <1133>;
-	fsl,receive-dpll-mode = <1>;
 	status = "okay";
 };
 

-- 
2.43.0

