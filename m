Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794431725;
	b=RZEAmCiFBEsXpuO0vwhpKIjy9Zy2RRwuWwQGwbdxCqTXaGSl2tVtgaBktFBeDzGPqrpW
	 XjEtMryk3A93KlzDu+YGFI+eWRvTKYAnVOl11y5y+Fri5n2//+ALBqwaUqPmwdrqSvxoB
	 3TUvGVoNnL8G1aQxRNDGFEMwskS2UOJklUpeNIbWuZtADhqqDLIhyRJiYGc3RNj8qimzd
	 PHa/VKWaIzU+RkWNK2sJ7IoJLpiIdI8mrMYiOGv2GDWHIOYlvzu9AwjRWyDIr8vC85cDl
	 WeTATZBQ07iyozj2Z2wJqMfgfrhKhsYgDEburgN2nQH98mBabShSxxDzo54sd7lBi1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794431725;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lP9NV1481u3nE0LGJ5nsUAgRBn7RmfKlpFxU7rVbmkQ=;
	b=FBKQkwOaJRRtyd1eIjHvKmu2r6wRBQtBDIYhCD+xwAWTBWeaqDTAG+fp4B9GroXu9TPc
	 HoXvZvLvuBqYLuMqqnBHCea4usxJ7QjZzNdiaV5OYafCNvsGf6lSLadRRwuqbcXIpMKdb
	 I+V484ZOnGxxn7sad/UpDbCLsGihlzwgo2hYOxhiLh9LtyBDYWTy2HhAmlCDOrWh5hj2R
	 mAjyI9Jv/+l3TWhs6nZln9TWdG+BRm5DCL9hvXbmKOzvCwwkxW88MBpYyDktHqLBHFqaC
	 Or8FH+/m+/wM2Efvq8i1MQLS2ZuaJ5EBW2V8vYH53Ro+vGP9pF0WZTTh0dRnzb2HmuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=T7hdtVjq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.7
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB96606A31C;
	Wed, 11 Nov 2026 21:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB96606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=T7hdtVjq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ky2y15P1UrXSkM/0fySIkHIQGaRq2AT+BQh5bR34pUssZjQGcWX4nD4+WW4wLSBfXBYPE6+0X5wSqMpLPVZqO2DjtynSTCblyErLosF+FJvqNK53hdvakhi9JCF3D3Wr5oxWkyVFk38QIK6hlI4XUo1Iu3KUP9iajQ9VZx3QeRw5MPxW8LYfkXiM/BDIj01lUH5QJUznUed/5sNLzlRP2xS2nzfq3F+rLHrsTyIaKg+nCVIoEz1+MBufcJcY2MXvvtcCkqGmEWfyG/jlu1851+MSe0F3w8SfGgTi3B2Lne9YdFiEWildROIFCsNmdOFmHBQX1BpbjbICWAkblUmKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lP9NV1481u3nE0LGJ5nsUAgRBn7RmfKlpFxU7rVbmkQ=;
 b=fO+W0ot3IyLYwQNo+yS5tQPSF+BmUErZwHI5hl37byiMfqEtcChHHiB0mBTUEBw/HiAogSvsM2yfP5jNGYpRy0VKpHzppp+GWZeWikiaeeJ2HX4JPI2l4rFNhA5MOv4bvMsvq71CEmMiJC8fa3hjBi46ddbOHmdkPGnJv88KG0cgBxEZC9Rl/oUyFII5iLpmcD8feK9dyGdlBRAYP0NxqzMHxjh3il7yTHCMUmBJpv8m3w37rcG1Uw8kz7AOvQ954Ut9MFwWpJGf9ISO/3AEpd3DYXlPfXAP0Z2qro6b9BXkm9tngRt7mL5MiWxvXt67E0jXBGoGWPXytGTl97sbzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lP9NV1481u3nE0LGJ5nsUAgRBn7RmfKlpFxU7rVbmkQ=;
 b=T7hdtVjqC0GRkBL0l5gqzm24iEllv3pRIJHak/7tN7M3s8yZn63n7WnsI2G6TnT92b19vp2ZGR5BilCO653ijHN9uhYKAMhr5YTYdyOHeUDc+Et4W10Mp93OJ6P7ltykrwc6M8wsxuKjYagvbYhC3wKlmBWqLMLkxovr8c+t9pl7tKzaYpPEWps58XVOtzOdJSd0scnbuX0zfklqddEqIYr1eSOnILUeKx5sFW4sFx7LtRGoejvAyC/+J0r96t/MsLECSKS+8Q6U2fp5d733CxnOYCHjio3zwjir5ZxHZndTnB+PaeYc2DbQBsKDrVpY2kVBc/tXLlNkYSzK6aaInw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI6PPF55290046A.eurprd04.prod.outlook.com (2603:10a6:808:1::3cc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 21:15:21 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 21:15:21 +0000
From: Frank.Li@oss.nxp.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	guoniu.zhou@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH] media: imx-mipi-csis: add support for MEDIA_BUS_FMT_YUYV8_1X16
Date: Wed, 11 Nov 2026 16:15:09 -0500
Message-ID: <179443170878.3989516.10436477074407728108.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>
References: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0124.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI6PPF55290046A:EE_
X-MS-Office365-Filtering-Correlation-Id: 1098cebb-6a9c-4658-052a-08df4038e4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|23010399003|18002099003|22082099003|261009223027099003|3023799007|921020|11063799006|261102123227099003|261021121427099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	FDyJ9/GMnsu41BeTRaODLieGgVnLK/GaGYOn1yLIKkyIWEj46k0XAyn+XzWgf9mtmK69LgW+wyVV565NB8a5usU45rsmeRDqKTGMKW6dG58D69KpKWSABO4D/vEIxSuCkHcPM/HKaW+3U7rjgDgdkh00GHLkjFckLnHvvMYl3LKT+K24rrHF2b0S7lmNTuXfrV1ohUrAOZymgr9XAfe1i+RGty401wEq/p63F/9q1TDj1Qslpo+yN4KbSBH17P9/eZEoRLMhcTKNaIac5Vyjdgqh8fDlB6mAV0szJ71jpDWHnFr3SA5XAVj5ddIMgLqvLqOa+qyX6opzxjTM6xgiUe+wGbTjptZ6BH3/TIdThv2bK91u4sFFfqwuA4sWyzGv0MzNatOWcTguYPhjXzlqLd/bBkbClNjdNYKAiuv6eYT5KWFwxhU0aHNYErQmemrJKu5PVHCwnbTFtJxN+UH06x24VpciGcMjyoA1A/BrMtTUbKYJ+HGWT9TjewBNUv5opkseTwNk4Of+/i1S3LnfoAH9aM94492WszjQ/iCLvm9y1RbN89KAjUKPJn58byTVofiLoPl1n0NCl0vqoxNZYDbiJ51zGBtxB31fOynxF5Hrz9gwCt2O1keCPf+ngO1mA6rghGW6e1kuzqduJOYF4mD8Rcw1Zrog78jciRdwu2//w8fMlLCw5+TMSUR8Lo04xI88JgzD8j2QqNHkZgaHSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(3023799007)(921020)(11063799006)(261102123227099003)(261021121427099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1JyWVAxNFIxd2lrRUE1c2JqaC8rb3duT2ticmFEc0hIUlRFOEhJdTk5dzhW?=
 =?utf-8?B?emphaWxhdWxtZ1MzVTlsT2gvVURxQnE5Slgzc3RmVTh0d0NjaWNYRUF6eVBi?=
 =?utf-8?B?WkhoUkYrekt6K1ZsbEl0ZXJDWjljaVozcmQ4ZnhUMXZ3YnJGbkVQTnVKdnhH?=
 =?utf-8?B?K2VkVFV2VXFDSVVoYkxIQ1pkRmVOM3lxamgrdG5aMlQ0ZCtLMjMyNXlyQzFw?=
 =?utf-8?B?WkxMeFdONWZ6UTh0Q3BZd2RKaGdVRDF4Yk9BdC80Vzh1dFVIb0RuaW9pVDBO?=
 =?utf-8?B?cUZEcFBHUzA4WUdHUWFKWS9WSkVScFNBNlBVb3pUckJ1UjhQaUJEdmp6ZmlB?=
 =?utf-8?B?aEVxRGNSTG1TTEJMRFFuY3BZR0UxZXE0c203VFJuMlNmTjQzRFVYZlpwUmRj?=
 =?utf-8?B?QUwxL2tMdExXYUQ5K3c5VEM1M1ZiU3dKa1lmK1Y2a1gxYzlGTFNsMmpkR1lI?=
 =?utf-8?B?ZHcwdklEbnNGbUNoRGh4THNDMVltNlhWZWU2Wm0vQUNRUUdzM3VZMUFOb0dy?=
 =?utf-8?B?Z1NiakdWVy9BOUxNUFZ4VlNPMUpmUzloZVdNNkQxOG1BRy9yajlHRGROYU56?=
 =?utf-8?B?SFQveDlwQ0VKVVJuaEJmUHcwSkZDbGxMaGVsWnhSZVNtTmc4NkMrcmtQOTBm?=
 =?utf-8?B?U2dzWEdsV0VZNlArNzZicGpkODl2eWNsRG56RnMrNVVHYndIbFZCVTBzTjRr?=
 =?utf-8?B?RksycFRPcGlWQ3BRSjc3ZzJmSmcvMjgxb0ovWGx2cEdVQzlBcjloT3NBWG1h?=
 =?utf-8?B?dVRKL0cwMU4waGNTRnBGcmxXdHZjQnZZYVpuQmhrdEIrK1VRL2xWdk9haG9t?=
 =?utf-8?B?SXBTNWoxalFOU3Q5NkRzcXhLY0lJT01jODVKaUp5UDVBdFp0TU5UcHk5emRp?=
 =?utf-8?B?VE0xY0ExUWcwb0FWTmg2bTcwQlVTU2x5djhZRTJyWVFBcEJHaGJsQ016dVVj?=
 =?utf-8?B?OXZKaHpXUzdIVUhoTFN5RVZxbC85VWhLNmVvMWJUaUhUYWR6WmNtaUI1a0Fp?=
 =?utf-8?B?cURCK2pmZkI3dy93RG9MeHhBck9sQm9qMUFvTGpHeng5TG0zank3K0pScUts?=
 =?utf-8?B?bFhWQ1FLTWdKbi8yaTQybElzS1ZqRThPNnhGM1h6MjFiQ0FZcW82NjZucjBQ?=
 =?utf-8?B?L2syZEduRzZmNytzT1ZEei92SFNWWHRWKzRZQmlsUHhybEoyM1JUbkJ2bnBR?=
 =?utf-8?B?SFNLQllSbGk5bUF6TzFPSGZhL2l3eFd3U2ozM2lsR0wzc2p0M0ZtY1NLRkF6?=
 =?utf-8?B?UjNUM1lmdit2RjM1cDY3Zk50NTRVT0JxSHVBQktId3N4S3JIcEFJNUJnMUVo?=
 =?utf-8?B?RklReVEvcDhPSFphSS8vYXQ4RFdLU2d0S2JNaDh4bjA1UENlSmpLRUZsUDQ2?=
 =?utf-8?B?aFhvYVJySzd4SUhaY0RWbHAzcE1GaGNlNWoyWHpaNm9EMnZSRWM0ZEpDQnZK?=
 =?utf-8?B?US9WSHRWNWlZa2pmSTVYTzZDV3RqMmVwNzBKaEZrZGNxMTNNS0ZkS0lsTU9m?=
 =?utf-8?B?NU0ySzUzMElrVXI0Q1o5bWtSNFhZMzNMSGh1bVJuNHdBNGR3WkkvSVhIREta?=
 =?utf-8?B?cHdGWEhxVmVWSU0yOHZsTFV4bzhhQU1tYmt5c0lvSGlIMmU0TG9Xbys5Z2th?=
 =?utf-8?B?Yk9EMnh6cUlHMG1NVUNPNUMySFIxT2JxVS9nbXB2VGZzUldlQXIyeERMNzBM?=
 =?utf-8?B?enU2THV3ZjlKUVl2dUYwWXJ0anhmM29WRGNTdllNZEV0M09udGMzWmx0SmFu?=
 =?utf-8?B?RExzcGM1dGFoNUJuc0FBeUovZTFTOW1VcWdva3dKWUpiZkhteGRablM2S0Fa?=
 =?utf-8?B?Qy9FSEhiQ0Zrb2FWWE8rTlY5MzdDQXpzZ1pmMW9OL1Y3VG5WY2xLT2hXMUFP?=
 =?utf-8?B?Rzc1OURIdUdCWm9lQ3ltaDZjMUkrL3I0a09ocmtTemN4TlJQL0NoUkNROVhS?=
 =?utf-8?B?TW5DRzhqNTNWMGVhZXdwSEZIc2dKLzVoRERBMFJXa1dBRmpDRnNBRHdlU3ZD?=
 =?utf-8?B?THY1dzh4MnJDbUNIalpuQmFuQ0RjNU9IT1pzbk5IclAvb0JtOE9xTXdvRENy?=
 =?utf-8?B?T2JLb2VYODZmbVh6bStxaEVySnNackFGa0ZjZkhyaDFnZHlQRHk5N3h5R2lt?=
 =?utf-8?B?T0pDbmd3M1NqMGR6QnZ6RVIzbTk3Nnl4NFNiR1Q2YkxqVXoxd09qem5NcHpV?=
 =?utf-8?B?UlV1YkZ5OUdXckdZOTRLOHkxMm1QSENUa1o0TitBRVpLa2ZkbXNtK2xPWVpJ?=
 =?utf-8?B?ZDBjcVNPK0dLOEI1MisyNUk4cnA5WldFM0h4MFdiT2FzZXlHL3lJQlUrTnA5?=
 =?utf-8?B?a1BNZXl1V2RCNkJ1cjR3UFhDdW9YeEpiOTBrU3NmeFJkTysweWQxZ0t5MmFC?=
 =?utf-8?Q?a4D/tEq1Yer68T2rHyjC3BY6NCbna23ETrnO0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1098cebb-6a9c-4658-052a-08df4038e4c3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 21:15:21.0920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJVTWiLRi0d7ppsttnPPiGzW1wK36vacwdLNNUHxW029WZV37Th7c1MwHTarDrbKMT3bEBHr8cktUE4dV26KmTWU0cxAdQZH4VbzCBtlIl0CospDoxCAzcgf+GRmeff6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF55290046A

From: Frank Li <Frank.Li@nxp.com>


On Fri, 09 Oct 2026 18:58:41 +0800, guoniu.zhou@oss.nxp.com wrote:
> Add MEDIA_BUS_FMT_YUYV8_1X16 to the list of supported bus formats.
> 
> The format uses the same CSI-2 YUV422 8-bit data type and 16-bit
> parallel bus width as MEDIA_BUS_FMT_UYVY8_1X16, but with a different
> component ordering. Supporting YUYV allows sensors and bridge devices
> that output YUYV formatted YUV422 data to be used with the i.MX MIPI
> CSIS driver without requiring format conversion.
> 
> [...]

Applied, thanks!

[1/1] media: imx-mipi-csis: add support for MEDIA_BUS_FMT_YUYV8_1X16
      commit: 3fccdc8f246af658716b8b64393253b28838f355

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
