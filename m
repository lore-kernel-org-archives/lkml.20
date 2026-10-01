Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6448C52ED39;
	Thu,  1 Oct 2026 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866669; cv=fail; b=peuLl93N/DCNRiQ1CK2SDuy7Hcp7ayxx0LxiQWb1yyqyg12WTwpLxQrVJxaJNqUL5pkqwLJ14oe3RDt5PXVJoH/bW9lCPfLJfuVOg0DuoPNjI3YGFat6OBoGuSIkMWIwzrbTphZ+FgEQ/SQcqd98a5RWLDOqTPY6LKVWGopz2ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866669; c=relaxed/simple;
	bh=y/nDgvBmiJ5lGDiWlW6+1BMo/eZ6H/UC3H1smNEMRDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y64S+DOI8CnffqAubkGBeVHnLKuldhWZwp7NuqiEf5W4WexbiOHL8wOpxL+tAbA0UQ1cvX2SUZw5bZBl2SBjWeD6CSUO1Iid9V+dF145xW+mZpAs+SOdddoqayI6VE/DbIOLWUjmtTtELMVYTttHrHY2bqUHDQgc7iX5m1HRGqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tFtKMzV1; arc=fail smtp.client-ip=52.101.69.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tFtKMzV1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXH4psja3yter1yQZLCaPHGL82ZGLJhQwyS3B46vD/ZYUsZ4P5Yn9WRq2WNPnj0viu9rrmLVqYTRZtANwIPMcQhrwqyQdYf4yPrApE2qPOchcu9Ebr8Vj1kuNso9lm3CTgrGCOS5eq6jG1KxphCzwXMUvkc+CrN6jZVvTCJJplZeFwVcn3NArPnTDBTP/ObGX/INE8WAMp59AAjg6HkOtmY0+KDlFeG03Jm9jaMhLiQFxHmreiL7Rfm0YtmXbUTG3OjDArl6mqbftSbBw0+ch2JWD3p9tj0tW/pT7X+KlQTgjC4p0jDiEhgOgtVGLlR2gHIGQfo/QbKaJnioqLmwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snNvl4T8BhT1IzTpdLrr/w2Nzv5n6Nza+LCPF/m3XS8=;
 b=PvAPvK6hjNiCcjDTgD90ZmPrWscG6+Um0x6RdiSvlcsCeyc9W0SH7/PEfouA2YUWrikwZz4P5krMMPgEjtEmXmoZ4QOaOs/RCrR21vNigQr47/zhAnM/9EyNULSNmq1mWcIxT6KoBHtr1w3iOc9M//WAWBOc/FLF9121z+gb9i84RWibr4DLA/O3/ue94t/jX+VIocr8IZCSG29eydW2ab/SVur9h6uFVRjqYqpQMH1rJp4WYTj+YYvghzwJD4hlT7ZnoMs1bcbhtcN1ghToo7M1wuc9J4coWqMqJNUQvQDe8+A6zRqfs/ifkcYcl1OTV6ohXYlW/oZwx88Kte7XDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snNvl4T8BhT1IzTpdLrr/w2Nzv5n6Nza+LCPF/m3XS8=;
 b=tFtKMzV1pZ3SkTDw2oFkebdsdpGfUTAK+2uYcy2UkCQjLNvIhp6sIqT8CCq+Fajtbrg4FCN0LJQ/Z1UiC+9HsjY9+FnvV2333VntD0dgZZ5638iWvMIycOl2ct1x4HT7ejyBYPbsuWCmytX8RUKRwBMDwFsQAJaTY3PK/i0tzTRfjMeKY511va6TUs3/YcKv6x83mlc+yQE5JQnV4kTdjXLiB8f70LDEuPxRW71XYDrvYzg6djBofxjjiYprzx+ZyZIHmYz+ZiSP+jiQpv9Axu3ZxL1r6n1sChnIIwTsdlplmFrxYK6aTk1FXT0MNiCXQkVLN4IHbtjTy6Ky5DNcMA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10927.eurprd04.prod.outlook.com (2603:10a6:800:265::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 14:57:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 14:57:43 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de,
	Yunus Bas <y.bas@phytec.de>
Subject: Re: [PATCH 0/2] ARM: dts: phyCORE-i.MX6 custom OPP table
Date: Thu,  1 Oct 2026 10:57:36 -0400
Message-ID: <179086665044.2214513.936581075433795034.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923070505.494949-1-primoz.fiser@norik.com>
References: <20260923070505.494949-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10927:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1e4ba5-c827-457a-3b01-08df1fcc58ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|19092799006|1800799024|23010399003|376014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EP1oKDNSlam+grrWWs7akoaUEW8deNXsfGfQxQxtqxlI43Z7UZeVM8QqZw/2V980oQWUpil1ALbHih0k3D3Kj+2L+sUi9lcFZ8eExZEc0DewJkuEI3py1fcHGE+4vAEMQ4pR4mUnDxvVARK5e5pEPxJepa8IJoiHHkqwneJDkw7gIRMA0P4od9+QA5axxtm46FbcZ2b61w/YwN9+RnFMGr9YOUnFT+rPK4LXvLGCtEv2A0h1XnA5DSRVJgM49WZ9rOJS8smjcSQ89modfCI7ULcIYxY2RgQKMwkWjGMSpgVHx/fOsu9v5R06nWA94X0RrEUnCyDNTvcWYspH57AEJnKAn+eYXUJRdUzSBPJhAqS1EI5TjEjBHskH/Q8pPuGUZ41jE9pvxjgb9ps75ChOn8cWpS28ZICBSy3cGdUxtbCizWrimjsXeOQ25FfekaVuRq6i7f3x2ig0hR1LmWZTXLW97e/5M6yS+ZCUeNKAKcjXke6V+fShxXkVmBZEiWSwzf8W5idxIDmOqm+IO7ytlwZJ5ttONOrf34FvwouKf5rCkioJ01WVfBDd+pXNicVOK9Dp/j6NNYQTzMfNDfmZMOi3vCDIundhRDZb2ZLDEv9BvfBwoVhLCZhP5LUD3A82/QfiqiSh9bTk9hw6D3H8+rcUF537/RVFZ4kdQ1FnNcE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVdDU3VFT3JRWkwzUFN6K2s3SXU2V1ZRei9Ic05nVlJBL1V5Vmk3NWNVY2RE?=
 =?utf-8?B?T1ZIN0NRN0J2UG9RN0dKSUtsUDZHU25pcTB6WHZWVGVsZ3kwUWhPcXliajlE?=
 =?utf-8?B?L2NERk1XYUs1Z2R5SEhZVUg0SmNyWmFHZHp1U082WXJLdTJLU3lxN0k2Wlpx?=
 =?utf-8?B?eVZucUcvUTJhMmwrTy9INDBaUEN2NlZqV1d5alBKSE9tTk5DbUlGNlREd25K?=
 =?utf-8?B?YUhxZm93Nk5CNVRMbU15ZVJkMGVHWkxOM3NrQ2hpRHlaa3VRbVQ3aXVhbDVa?=
 =?utf-8?B?STZTU3JZVmxuMU5tSTJ4Wnp0OTNmR3hHRDlOWm5hOTNNM0dWeTMzbk1rc3Ez?=
 =?utf-8?B?M3FaRG9aaWFOTTBCR0J1TlVzT1dDd2xZSHhmRjhwQTFheFhNOE1Eb1dEYVlR?=
 =?utf-8?B?dkY3Y0tZZTV3UWpyOHVxVkY1QXlabkRIVUlJTk9hSkR3amVKWnJqeUd5QUx6?=
 =?utf-8?B?STRUZmxiWEJxeThoM1BCcHpMY2ovOVpXKzNSZFN0b0RFNlhZdWE5TWhWQ09h?=
 =?utf-8?B?WnJSRVRpbkJtdmx5NGlQQWMyZm16bXJBTURQbkVhY2JyQ3ZIRU1kU0N2QVI1?=
 =?utf-8?B?SmNxUVVrSmtxbEloYXlxNXc3R3ovdWVHVTMwUEx1REFMUkpvYWswTndySGQ0?=
 =?utf-8?B?NUV2RnBkc3FSUkYweTNvK0RQdFArcVNwMElGNEpkV0Nha01KTldvcjdNVXFW?=
 =?utf-8?B?b3dPaTFQellkOCs0L09yMlV0ZTAralo3bk1NdWxxTU1jMWJVS1d4L1pSV21J?=
 =?utf-8?B?ZGpyb2JjL0pwRll5a0NZUzBvTUI1YWMxaWh3WncyMHg4ejRSTTEyQnkvZTJ2?=
 =?utf-8?B?TjJIaTNOaWhmajd0MVdTSS93MS9GV3JhZUgvSHM0bEplK0M5Vm5wUEhhN2Zy?=
 =?utf-8?B?RTl2MGwxVHdUejJSOFI5dDlXVmhsNTQvUWszWFBPOWJtdXN6ZVU0TEVxbXd5?=
 =?utf-8?B?cG9mWlN0NUNhOFFBWHJHNVFSamh2bWY4cytkVFRQS0pUbVJYdHdpRXdIVTNG?=
 =?utf-8?B?ZTRkUzd5N3Bsckl5ZVNlN2tnbVFzUTNJTlZZVXliM2dPMWx2VEtpVTZTYkNY?=
 =?utf-8?B?SjJsOUJ2L205SUJaUUc4Tis4ZlhRcmRJQjJ4QVMrSE4wT2I1dWlYTU9sckFY?=
 =?utf-8?B?bW1FeHhXVGZnbEhCK1VENzluVWRDWFpzRGh2UVVkbE1BZHJMRFNyVk1iREx0?=
 =?utf-8?B?cDlDaWhwNXptTTNXbnVtdy9mbTE0Rys3cUZkN21QVXRMUGs3NU9QOW4rVnNk?=
 =?utf-8?B?Ti82OHZOdXZNZkYyL2tQRndyVkR2Rm1oUTVYSGp4TnhTY1A4YUZXSXZ4Z0RS?=
 =?utf-8?B?WW15b0pzeWl5ZWRFVmpSRk1TS3AxK201S0FHTWxrdjhIV3o5SGtHeXh5WFV5?=
 =?utf-8?B?M2RwQmowZktERXhkSGdTbFViSEQzTmJHNHFNTUpNVTFESnJGeXhUNk1DY01m?=
 =?utf-8?B?WTZ3REt6QzZ6THB3Uzg2OXc5bENNSmNla3p5Z0R2Q09oKy9jSWFKNUYySmtp?=
 =?utf-8?B?NTIxUVBlTU5nVjJtT2Y1UGwwdE12V2gvaDRuY2dvL2RaY1AvNU9peXhrenRr?=
 =?utf-8?B?clZyblJKOFFIaDJkRk5tbDc5ejZNa1M2WHk2ejNkR0RVbVN2UHArY3ppbHZj?=
 =?utf-8?B?NHVWU3psNnlReVRNMUVUUzAyWWMyMGtUWHk3SHk5SnE2cXdjaEcrVi9Ja2VO?=
 =?utf-8?B?QzZHd2dvS0ZDYVpKNHY3VldqWm9pMnRmQVMyZ1FiQ2dML0p3TEFWNHNrMDFW?=
 =?utf-8?B?RWtWY251MUlONVhaV2lRT2lpcUo5YzQwMkpmVXk2RnZTWkc4VTRpUHV6NzhT?=
 =?utf-8?B?bk85ZTdwRDBvNnpuMHhueU1YcFNscC9qMUNEbmhKeEs4emNCT3N3VXpQV0xr?=
 =?utf-8?B?T3V4d2Q3Y0NYMkZDOG5hVWhzSFFiZmpqN1gxMDArRXdwYXl5VWsrcTJBdEVr?=
 =?utf-8?B?MnNmTGN0N3NGSWZHdG1XdHA5SWJYNmIraGU5T3lSU1VMRjF4YXMyMlFFaHBY?=
 =?utf-8?B?SjlrdWpQWU81V091M0d3SCtlQldnNnV5Qk05dFlRRThpeEhxUmVmTkwwdXUv?=
 =?utf-8?B?ai9JdEJvQitHcDF5QXFWbHVsdSs1RU44RllLd3kwQ3o1a0NOamluR25SN0t4?=
 =?utf-8?B?RCt6UzhqWGU1Q2hIRHhsOHRCQzZ6dWh3NzBwZUlSU0h3bGtjYllkUnZrZEJX?=
 =?utf-8?B?N3BQM0lnYVJmMS9MVXJCTy80VFc5MlQ4NmpVN2hGSVFwaTV6OWVtSUhIM1I0?=
 =?utf-8?B?V0FzeHdUSmdkaDM2alRVMjFvTGszUTRDWWdtY3NQZmR1ZHRtSEJ3enptQnRm?=
 =?utf-8?B?eDh6aS9Ob3o4RDV2MUxvWWZaWGpZVU43SU5CWE9vNkM3TDlRV2M1N2JBcUJL?=
 =?utf-8?Q?U1sEUcHLgF0ofJPqBQrD5rByZI/adiDl0Xt+u?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1e4ba5-c827-457a-3b01-08df1fcc58ab
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:57:43.4978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6zdNcTlz4azBWf5bighu2jPoXOEwHUGWyeY1kH8k4qbd9utiG2SSyGicItC2PU8XHdVGiW4K4jNIWiyEaoATaBWZ9O5qkO/T5CxRWSap+uaWEmbX+8yPW0I25LkOYuZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10927

From: Frank Li <Frank.Li@nxp.com>


On Wed, 23 Sep 2026 09:05:03 +0200, Primoz Fiser wrote:
> This is a revival of a series originally posted by Yunus Bas in
> February 2022 [1][2]. It adds a label to the imx6dl cpu1 node and
> introduces phyCORE-i.MX6 SOM specific operating-points tables, since
> the phyCORE modules run at slightly different voltage/frequency values
> than the generic i.MX6Q/DL tables.
> 
> [1] https://lore.kernel.org/all/20220209223258.1672425-1-y.bas@phytec.de/
> [2] https://lore.kernel.org/all/20220209223258.1672425-2-y.bas@phytec.de/
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: imx6dl: Add a label to cpu1 node
      commit: dcbe9b512afacb9a6ee8966b8129861e02256a8f
[2/2] ARM: dts: imx6qdl: phycore-som: Add custom volt/freq table
      commit: bf2f5dba1ff19d575eb9917c7722bf095724f4a6

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
