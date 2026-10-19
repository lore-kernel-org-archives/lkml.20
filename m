Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792434408;
	b=DeoedK2N4uNJ3j0NL8dxlNAkmwVoatq7tOjuKlp9yooW4DTwbRnz4KFNbRfv3bZl9qbJ
	 8w4GzVZWxva5dhOYe5qe17c1ExCK7q2KLqxgBfUXT1BCa1osy4f/D670+YYLOXbYzdbK8
	 MemweNCCpMJPLuDYdSZR+lE9lsWKhTv5bevlsu41KHUfYVaDp+CmgV74DfXOgrOel/zqh
	 6S0r9r7TgzJc1a9zTRqJpYw+LI569zdeMm0g4719OP3NmuVVSXiZl72CBHRwvJSzduRkq
	 nYrz/vsAAfCBSJZTXWh0DlFImcklV+/FC3JHi6fGY1xkxEYKiSJqlV1+1lLGs36ZcUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434408;
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
	bh=JKJZm6l1Dl+4FczBOaToXFKmX1nLaB6tX+FDeAhZ9E4=;
	b=Q9VLDRvCYDavczR5G3oG2DdiV9u/maO+tGxiJWchI4rbq1Ahl7bPD+MrTNVGnNey+bed
	 QQfPUe+fzo7TnpKHaX49d0QuAJAUgp0CylZw0fv/x0bhNTSyRAAzYbSPYXEnwsiDHJZSw
	 HwGvCseFHr/xJ/nhe4DUqAzSI7lrOKzHdUEeliBJqootcm35lCLGiRzis/qyCVzXpuCCD
	 Nz1vJAUFIiVRcGqqsDksakD+XXyVqYtPewwo90Iccy1LQ+s29yhr6QChCANK4Gs4Q6I+k
	 AAOO+vwl+fmMnUSwPNhzYb6fj4VTajy1tD6JL6cMYQa0OGBI7Mf1+CdwH3NA54X2n+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ExVgae8G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.59
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011059.outbound.protection.outlook.com [52.101.70.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7586B606A329;
	Mon, 19 Oct 2026 18:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7586B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ExVgae8G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sg4wLqK66pI6WJpmVzbGGUaM0WHx86qmqwzIJvU0rpcb4cRS7CQvAvFFko2w3V5TD8OvYQXp4oMZADyng058Q4S0jw1rXfhPkpSclV3M4tRl86eK3YLqQe4fbaiVNYSvdGW2T3wH6xNCeBSLfAhOjYKYqA1DTX7DWbQc0vcw3x+kV6B6xtc4H6LVcM6xfwefEJUh/wPuJ8c/NoqaWV3aggygLwnikcSCH/DVI2uargNRPuND8nEslx46L2/oOI90kLwcFUH6GcbIvS4Bj3XKjErLGEMCPgw9/K46IXFyiRUeTpXUyXvIhIXslrnafKUMVftt1DRDnXm7G4WAROFFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKJZm6l1Dl+4FczBOaToXFKmX1nLaB6tX+FDeAhZ9E4=;
 b=V13Qs1tvJZI5+85PZVycBEvDgljxDFkk6WvAq7BCPi3UAM3e27N5G9Dzb85jr9BoJgW81cxM0EwsAurZJTGtM0ouP/DjkBUdeA6GS183dsd7UZLF66SvGxM9Xs3Z4ybW7gLWI4RqvBu4qICPjgw0uYSbhuXgqSD2WAQxneKFnBwNybcdIwoenNNDJtPSdgktwQUJXQp6iJhYx5TkFYO6krLNDGjobuFgN6uneia85RPUYgZyxj5mT410wh3msGBETLYltK8s6e9K7Ihr5vyMLE2I0wmvuDBv2Rb+8xbmi0aQIMRYGav6+a5mLYZycpoA9DfXDRxluKiTgFfxH1bImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKJZm6l1Dl+4FczBOaToXFKmX1nLaB6tX+FDeAhZ9E4=;
 b=ExVgae8GjtQ3MAuTVFztmm9pGnp5YZdiPC975sqr8p73xSvJ1jMFsxIzAvTewZRNd+RXjjSC0BuurrfyhmgpmjLRxYee3gN2B5+Q3TYe0k7dzFz5+RqlBIx3Fuk6GArX0qzviie1BeyPFF9vaPDPfSFOTXScwtKzC8OxLSMydz7F76xYskioOl7wsOCsLdJ/g0GvWadOIkfIjLyrbh7NIT23lWaL1H0ecq+j+l4e08KaLCB2Q4OGJlv6g4GqJoclZjNB6vol+P6sveiHNEn4Ma2d5SvnTrzBpotnWGpvY5TZiIPtaegaRxREP8f88lGROd4FlqdeiMxlHgy8jdN9Ug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB11557.eurprd04.prod.outlook.com (2603:10a6:10:607::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Mon, 19 Oct
 2026 18:26:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:26:45 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:26:20 -0400
Subject: [PATCH v2 05/13] ARM: dts: imx6dl-prtmvt: remove redundant panel
 compatible fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm_dts_cleanup2-v2-5-dcdcbe6389c1@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=1011;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=z+blePyaflTzhKBkmlGQpnlni1nm7PW4kfJohFG0pBM=;
 b=d/GD3kL2Nu2p/Nhgpc6fcGX8Eg4+6HRtkc3t1aYfuNmU/fr9pUT/z7stBlaotbNd7mxugf3uD
 BGW6Fh17gFUAScK1LRjQzskpudXMTfgC40DCg/zK6ALqhr0ldXUgq7J
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7P220CA0105.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:25d::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 9af7a50e-3a03-410e-a5f6-08df2e0e87b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|23010399003|18002099003|22082099003|3023799007|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Rb5s4dpd15XFOyGzcCf3B6BVTxuUTZcHC6Ch3VW/dMoa9BJHCI5TgXneW7YimJoN85QKfkLm39IHyqnXp4aWEuKd69yyDY/gaja/ZmBI3NZhhjVH5ktPBSPaF0qjqwM+Xft9Fow0CM69SspoU/AB9mnO74MO7WyFGIofSIQCFn0wGg0UBVjSNvoN7X2CyIeUZrKSiYY/+4eHx4KbAZuafqLM8HFfZg1xzZVDud2nbhggBumm3NdG9ISxOFGC+4Q27NGQ1wE0SzrO9nEshLBq4RFq8jiKdRTvKQyeAqiQB75L6b8Jq91CrkwGIYtOMIqMuBNmP4u7Gykw10AlyAOcnMhitV+p4t0o46hjedzNIYB1xO2O+Bne2EdHbHKJnlXp5D352zJIeJjemMJd8+UuqrvhWApaAylQx7pz6yYsBad3WnvTC6Tvb5I/GszSCUMiQXrg8THmWWsG8NQTSSjdCaqeg6j1McJJdr8nw5TFHqqGY0olRjlzZCLPFNaaqUzjdi/ZBWw7lCjcFXYGVKHgrkdzC4078a1EQ1kgwv1BK08rs5kCw6fx3prmF/MvL2sDZfeU0bYvHcxn7/1dDKDGqfABgzdtLm/PNIHcoTvWGKjPtZEJswo/XcPYKslQezDa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE1sNStueDdEdWFWNEpaZXdNRUIrY0Z6VXJJWEVTclVaTDJ0K0tiWWY1OGxl?=
 =?utf-8?B?SzFNZVd2S1YzQlRLb3laRTNGRXVTQXFTeVZqazl4SzUwYVRVRE9OeEc4WHlT?=
 =?utf-8?B?UWZJcTJCMWFFdlBYOXg5MHI3c3YyRmlMMlJQM3FlWTBUQys5TUJYRzFLRXJX?=
 =?utf-8?B?UGdOa09ZREwwUzBsSlE4bEQrZ2U2UVN3SjVlbVNtZ0p0THh1K0VQQy82cUN3?=
 =?utf-8?B?ZTl0SDEzNS9Ic0R4YWFxNFRKenBXVHZMMXBZTkdGK1YvZFFTekVxdUU2anpO?=
 =?utf-8?B?bUdkcm1jSmFycDZHVlNKcmFpWEhJOUQzd2JsMllLenZiWUo0ZVFrNTBSYkZp?=
 =?utf-8?B?cllhMWRnSDJob25zcWVvRTJnWWJROTlnMm10d3liVDJlQ3VMdEFVd2JEbFlM?=
 =?utf-8?B?K25ETGZXNFlRdHMweTdtMy9KMzFZcmZlRlFDbXRxajlFUFZyVDIxWExQaFdK?=
 =?utf-8?B?WTllU3QvTXhGVzlQZXhhRkpReVhYVzNjSkUrZ0Z4aVRFVDdFbVZIbk1WOFNV?=
 =?utf-8?B?RE1tUnJjVTMrYWh4U25uZ1lHcUVGT2NZa1dLWVhHZWJvQjZPZEgrYTRNR1Qz?=
 =?utf-8?B?TndUcU1raXAyUDBqOEYrbVlBVjdPSUs1cm5PN25jeUlPYXk4M0dyZUdIendP?=
 =?utf-8?B?V3BOdC8wNnRWZDlYN2d3VHBxelRmbXlkVy96RUNZWm9yRVE2Vk9GTy92RW9T?=
 =?utf-8?B?Zk05a0xwZVBDRDJaTjNiU3pUWERkc2wzL1VPV0dRTnVzeHdDYTdPN0QxdXRY?=
 =?utf-8?B?TlREVEtRTWtBUGF3b1orcHdtN1hZanpicGNheko5bmZlVnl6Z2Q5Mk15R0tL?=
 =?utf-8?B?ZTYwbElvQy9mWTRJeGFFdEhmMHhQZUJjSEV6WlgwMkJycElpbkt0b1FwZlB5?=
 =?utf-8?B?Q1ZXMVRyaHlsemZ6NFp6aDkxUTg2R082SzAzWWZUOUZ1OFd4bWVkdlFPVW9D?=
 =?utf-8?B?WmR3dkg4OVJJL1AwV2d4c0Iydm95WnVLSU5TU1AvOTc3WFd0eUM4NzFtZjcr?=
 =?utf-8?B?NHN4ME95NnQ0SFZrSCt4WFpYYVBrT09KMGdGQ1VjMHl0QWJYc0VpMmFMWXlm?=
 =?utf-8?B?eG5KRDl1Q242ZEpocVpUQkFocUh1akZmN0hSYnQ4QkFsUHZLUTNJS3dBMXFq?=
 =?utf-8?B?NHcweFhhUXgwcHUwSUV0UmViNTlOVWwvM2tYcDQxNkQzNTkxYnV1S2k2c2Ft?=
 =?utf-8?B?YmRJRnRLR2xqYnhlTWlGRFZnMGRUQUI5S0R6elVRUlhRc3ExV2hlWURibWpN?=
 =?utf-8?B?SkFZMGNFUCt4bG9aRG9IeDJ0RXRHTlNxKzYwcnpoU09tUiswWjFqSG5hYTV4?=
 =?utf-8?B?Uy9VZG9vamxiS3hsMFVrMG9kYXJhRXBpQkg0bW5zL2xWYnA0SzlkaVRxWWFw?=
 =?utf-8?B?Znl6Zm80Mk5DTXR2L2RRSG1mcC9KZjZoRkJiN3ZPZnJoajdQRFNMSkZCdmlZ?=
 =?utf-8?B?QjViWmd3ZHFmRCtTajRLcmNtNlZVN1BiUFVXUVNiUG5mTURBOGd1NjdJaTVE?=
 =?utf-8?B?VjNJc21ycm5LRTErN3d5U2thc0NnYXh0QW56VkdWbFpwZ2MvMGVZQ2QrZDdk?=
 =?utf-8?B?aEtvbVJabzZDdFdUcWR6VjVOK2R3L1pYSWFCVGNSbXJsVmlhak1xT3NVcGUy?=
 =?utf-8?B?SjdmMXo5TnRJQmFpNVdidkVQTW1QV3haVUhjQk5Gb1FoT0lmSXhENlpCa01M?=
 =?utf-8?B?UlpMTlFqU2d2d2xxbklxZnMrK0Zna3BxNGNzUkVPb0dKVVVXeDdwczE5L3Z3?=
 =?utf-8?B?YUhpa29UcnlSc2dodjM5WldtdHQ5UldRZUhsS1lOY3NDVmh3bUN4TFNhMWlj?=
 =?utf-8?B?YkFWUkdITUhLcy9ZL1UwS0pmVzFkcXlNdGxwRDd0R1pWTHRkY3htZ3FwVHNG?=
 =?utf-8?B?S01YRlVTaXBGaFJQRnh0L1BySXNHNUZyUGllR3RCU2E2NkV1bHZNYWVpWXJD?=
 =?utf-8?B?M3dET0ZJOUZ6ZTI2UlAycXhrZ3RpbU5qSE04OUlrK3pkaVExelEyYW00djZJ?=
 =?utf-8?B?YURycnBaWnJQeXFzUWNET2FqWE1tME92dEFzczZUQm0yd2p3SVBZTC9qT1p3?=
 =?utf-8?B?a0w1akFsRllsZVBtWldaS2tZcDYybFJTNHFwcHkvZGk5a0MyUzBKWGozOFBr?=
 =?utf-8?B?TDFJMXBzR0g4MUwvYVdNbmtNaGJON0RoVm9TOWQydUJMVE5ibXowZXZvOHJB?=
 =?utf-8?B?dUZxeFFVK2dnczIrbnFObGpTWTR0Skd1VzVWci9nUTBVeVJWa0JCZ1FDcGhy?=
 =?utf-8?B?WktZRXVUZHhPemNPZUVMbUhURDBKWjYzYTE3aGlPTTN3UEV4SnZIeW5EQlpX?=
 =?utf-8?B?WmE3RGZrWXoycDF6OG1lTEtmak4zSU9kakJJcmV6b2FaNXc1WHZnZDFJS0JC?=
 =?utf-8?Q?9M2EMFgUP+eQzgF3EiddQXXyRrdo83SFF0wR/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af7a50e-3a03-410e-a5f6-08df2e0e87b4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:26:45.1707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dl8DDJiVQtSPs7v71tCvlrk/1IXYP0+NJoj71VTKSEwKyHGkiKLWvGZRQKUGizilCfWqyluhfqkInw/Kd6NL4wYJvGIYjh0DLmzZerNlbTpl/qh7UuTcDbl9Uxmdfjz3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11557

From: Frank Li <Frank.Li@nxp.com>

The panel-simple schema allows only a single compatible string. Drop the
spurious 'lg,lb070wv8' fallback from the kyo,tcg070wvlq panel node.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dtb: panel (kyo,tcg070wvlq): compatible: ['kyo,tcg070wvlq', 'lg,lb070wv8'] is too long
        from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
index dcd5a4099c602..4896cd3deaa98 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
@@ -178,7 +178,7 @@ led-2 {
 	};
 
 	panel {
-		compatible = "kyo,tcg070wvlq", "lg,lb070wv8";
+		compatible = "kyo,tcg070wvlq";
 		backlight = <&backlight>;
 		power-supply = <&reg_3v3>;
 

-- 
2.43.0

