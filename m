Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794436016;
	b=VbQlUcFgxEbeOzWzLAeqXLgqFMoPaZZNPxy77kts0JH9oUQqAOfKANBFCNP/FGQiEJYE
	 fnjf2VasYaF2xKz3/HY8BLVAASPvl4w9Wl1LkH8T8gvyVH+cTJIGdwYQpmxb1eMGgcabS
	 MEUnB83vWppyiszFF96dp5MAfB4cJ2z1mu4+4TA60DMCg/jSqeJX+h9loJbyyBe2TIYwW
	 6/aqFAerSYk2AGJ+KCgswGFenpk4YodSRFAWhLc6t03flrPBfUGgP1wtq+jyxZtK6f4fA
	 aX7qjiTJe0d0cviGqcvjZ/+RZrdEc2AyDNA8rDityLV+JP43FaPKKU8+2YMVbGwW8Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436016;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=h9EptMgSb3aM7VkG+B4vfEt6I2Qf/NFiEbJ+pf0nYXw=;
	b=dEEd+WjMFsK4Cn8qsQEVMjNZlofvFJ/tOWKNyGuYSjDNKRBi9UzH84MviEWudz/aLkQi
	 tefLXlXCTdQAj+buUFWHJ8QH8aKotekMhww8WhJXv1i5XWw2NP8J6spQ633adlDn12RgQ
	 t1a5aQoIoFB2nCRDWXcp+1fKVTCiAYFQSxv/dr2XTaXt8GBO8vnKMzkRyJTvNF00iVJUL
	 6Hop8vFPyhwap+nRWdMlulCfV4edsqkURx4pSGVfrk76r3mZX7BmtLZ5LqHWXnDZdQ5/w
	 4x396nEeB9InwLUS77o4E0Esk130o5TuFOMVAY+y1z21buT86AkCPd97mMpb43BJKGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VGLYcpsP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.64
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1382E606A327;
	Wed, 11 Nov 2026 22:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1382E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VGLYcpsP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZC2anHEj7MgFpiFengg86oXRUsBEE5HVX2TFLKeFW/kJ9dLKBI3QbHk6vay4/i9igwfAVnspapYQDZ6dntxQ/TZkMMSIZFMZ7X3pI4L7iRI509lO3BbfkGOaAw93fthcqvqwBnK06COJY7DoB9wXKONlC/ExuubxWBOPznmVTMGw3yP98+BPG5HUu96OgzQgYXh/W8kpgk88ZlF5WHZ2b62Q3XSN4VHnKQOR9CVtsrP8lL5KN8hAUCUPba5cY+rTmyiZ3pHHLnyh+7+RKJoUH4E4+vN67FTLIYWhEMf7e9Yvay6sfC/IWQOAFYCeaRPp8E7gGciSV7P3DFDsovKILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9EptMgSb3aM7VkG+B4vfEt6I2Qf/NFiEbJ+pf0nYXw=;
 b=CTLBthww5bPDuMidMUkMyKZbO29XOggQUl8GJOA/thOUZ++3wdg46FOMhYHpNW4rUUefh6BwpmttHyvSrZ8GThGFKAJg+EbIRDzcSaaksUmf8k9TMXfLZHNQ/bXrZy6H8kQn/f5fZaBemifZp0DUQFxknMGsp979th5GG/5yTImfarOaM6AbzDem165UZ1qEq2apCp0H5dLquD+oQXF96cSJS51J9uDb/H82YGQjSOX5wcIH43CzOit9KeZ5oWhFVzuEU0LfHJTycgxZLVpLZTC92rZFc3+Y/0SwEn3AeD6TSGpsAO0xe9VAwyTobrqQ6XyCfvYsy1WwwI+KxIR/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9EptMgSb3aM7VkG+B4vfEt6I2Qf/NFiEbJ+pf0nYXw=;
 b=VGLYcpsPGmNEz7yrJqeiOOKvCeiNc0UL7e5xbviuw3xnLeykdYImF9X7VzJXoLq5c1nHs6drTAoCFimb4ob+aATK9cQpz21Sk8Z2ERgGGitnZP1Bvws/EDPzcys0GttmjD7cRzNsInP+7p3CfDiN8gwDkiSOJRyH6EpR7nEz6SF4CGPr5em8VbGDQJMaSsyyj+KaLXyCLbBQhNhdaywM561GQMACu4PlRp1B52s9WQHUMEbz/NskKigSrvwgTfPQYZRaFBRUQ2VKw8OCAD65k4Et6OXj9N9jEfecj0QeBZO/B92oBxXuqwmmT0yiD1XOdOw+valUCDNrJ1FvwbVJLw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DUYPR04MB12644.eurprd04.prod.outlook.com (2603:10a6:10:660::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 22:26:52 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 22:26:52 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Antoine Gouby <antoine.gouby@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Antoine Gouby <antoine.gouby@toradex.com>
Subject: Re: [PATCH v2 0/6] ARM: dts: Add Colibri iMX6 overlays
Date: Wed, 11 Nov 2026 17:26:44 -0500
Message-ID: <179443316007.4030747.8750857671592857065.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
References: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0097.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DUYPR04MB12644:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff09a53-661e-4d2c-6301-08df4042e24d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|19092799006|10067099003|11063799006|56012099006|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	d/isjNd3UMoBSo0Z5FM5dHDyQHeIHv/5WLzxzcprHT56q+SQI9KREXz+T2GcZY8OJSWM1EXCAdCbb7OSZ3Rek1+5BTHAZAnVSYdHJk1pSz0+nNz2YPu15QXCQ61e7Xu7ABGuZIMNO+3Ca35rX3oeLpWdsKINIwKnN7HFRyVrQ+eHJbcBVnHVuC2kTel3Hr/mwM1MX5lHck3CMIcq0QLsNMd9mUfPS2IccbRnqXdmCwFRgXdcJw77LL2QYxO+VSpHhnzX0KJZJ2XmiPz3pbVeuUvsgNIZhpPumF15rU2vPtd3wgT6ASnINaPn+jyfInuEN6ZIRNWmvo0TSicopeJqouMROH0Xn9uLsQ6xTfYq7UYuPPQRGeynYdVRwCxe/PCgRGbGAPxjpYjt6HWC3qP9rGaLTIi7SCGvTG4skKbJaBpTqZP+Ge035bV+FIG1uOT/EIqoC4NPomf3pvBU/E0oQ0h1hUxotSVZn9oNvr5nPEt3CdAN8G46uZj9+stUwyEGZVjMt5jSbiYs1Pa2+pbuiVKoH8d1qq4Cw9mo+kU7OapIGjbpMs4eOnfmAHaYPc0xpBSW1Vl3de5mgSLSvCeGlOsjhUKtXR+BBwo2p8OA/hYFuAEKP65jejjO4ff7jEsQ5iIGNiEGxgiFyL9SD7BNklGu2gLnkvls3CV4BHgtW04=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(19092799006)(10067099003)(11063799006)(56012099006)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VktQa3d4T1BPVSs4VU42Vk1uRlVEWGpLUDB0OVNoOVBjRDVsN0FVOUNUdVpD?=
 =?utf-8?B?b3BicFZUTnNuN3JkMjU5dE5RVEZjTzJzcmdUOTZ3NGNSYW1CaVllM0t6VXQy?=
 =?utf-8?B?TmlldjQ5dWszOVR1dEZQbk9sUUU4TkFtOENHSFc4L2dXSVBoV1EvN2NOcGNk?=
 =?utf-8?B?c1N4dDBRNkgvMXJudERKVElGNFY1VWJDaVZRWnI0bllSN1J2bEE3QU1YbVBK?=
 =?utf-8?B?dHNEWEt1dis3cmE4aisvNHBNRU9LWUZNWElVU2h3NVJNS0Fjc3ZXcHJMR3c2?=
 =?utf-8?B?azE0VG1NNWJQVGYvOEhWMUszMXdUdXV2bmkyS3NJVnkwQVd0NXJIcWR3L3lw?=
 =?utf-8?B?RHBSQ0FYT0NKTXlVY21pZCs5Z3BRYkd1M1ZJK0E1cEI3WHJQREZOU0ppY2x4?=
 =?utf-8?B?ay9kaExDWjNLRlJiTjEwQTNMSjNlVW5DK0t3dnNJZ1pHaXo5cWN4WG5LSG9p?=
 =?utf-8?B?UHUzZ1J4MXdSUyt5d1ZpTTF4RWV0SjZiQ0FZN0dZQlpYT25KbDVUc2xPL2pY?=
 =?utf-8?B?M204amo0S2hLR3pZa0lkV0xmZ2ZUZys2d21RdDBtQ1dML0tBa1c0Z3FISzAz?=
 =?utf-8?B?L1hvWFR2aGlWVTVNek5lTG5RM1NMS1dpSm9VeU1LRzM4RUc3T0tveC9sQ1ND?=
 =?utf-8?B?UkN2ZGU1TFh2OVgrNkZJQVkzdSs3RXZTUXF5WHJBRUpvU2NaS3NDdG5TWVFF?=
 =?utf-8?B?WG5DcHJ2c3VYZmdyaEF3MlRhSXZxcnhrTjJReE1EalUrNWw1Z09QcTY3dXdv?=
 =?utf-8?B?NUVPSisxTU1TT1d1V0JLZy8rcTd5N3VSc2Y0MEV3K2hLLzFic3JXa3FTVSta?=
 =?utf-8?B?dGZJUTVXYlJIYzdWaERjNm0xTCtBZVNMeVloWXEvdGM0NDB1aGhxQmtZUWMv?=
 =?utf-8?B?QXNzSE1ybjA1bWhFWWkwajNXY2FKUlR0OFdrNUU3SXhIVzduQU5VODU1dUNs?=
 =?utf-8?B?eUpOVS9HeDljY1NWRFpqVDJ5NFd1Wk1sZWNKMUFJTmNUbU5mb21TZmQyY1p0?=
 =?utf-8?B?czN6dWdlazdldFhxMTlpckEzZ0xMZENOR21Dajg5MkN2Z0t3aW14Q3ZsVWFC?=
 =?utf-8?B?ajZ4TDVEZllQZlhtcDRQQXcvSUJSNk9jTzNVUVJTMU9vVFl3bFNzaUF4UU1w?=
 =?utf-8?B?VzFJeU1QWVNGUjV6aFdubVA4MFlBNWJ1YkErZi9VT2dIa2Nkc25jTHRaeW52?=
 =?utf-8?B?Rm1WdnFXWTh1emp3SWM4ZjFjTHIyZEM4QWN3K0EySWxLeEErUUtlS3pRcmZa?=
 =?utf-8?B?RXZrZmRtc3dLYTJ4Sy9LanNrZmdkd245K2U2NTY0S3JjMm1kTllZZjZUb2Fy?=
 =?utf-8?B?dEpxZVBKbjJDcGhpT2pEUXhwWVdpUUhiTExDQUptbW1zaFJpUEQzclFTSGZZ?=
 =?utf-8?B?WFhadVpxUHhOcjFLMmoxSzk3aVQvNFQ0OVhqSzB4QXptYndQUGF3bFdqMUdX?=
 =?utf-8?B?MzVsU3FUZTFyTi9VMEJQNmpmVGpPeHk2SzdIMnhOT1h4UExDalNYQjVyckJN?=
 =?utf-8?B?WStEandmb3VmTEMvdTE0YXovN3hKUVJMVjRZSS9hT2hHMktBa0F4K2t5UVVH?=
 =?utf-8?B?amxrcWt4MkZBQjBySkxla2d3UGNQdnhMMmx4TjA5Z3ZzZGNVb2k1R01GL2du?=
 =?utf-8?B?Q2I3VTV2b2J6YlNWZkMyQVZreDNJbEttc3Fkbk4yQytkWG0wNFZUVnlSSzlo?=
 =?utf-8?B?TXZJM3huUmNyaDEvZTFZUnVjUUFDSnJEYWRkT2N5VGVIK1lNSjdoM2JtZGN3?=
 =?utf-8?B?OFdsM2xxYUlxTlI2MWt4SS9iaXljUWUzRE5adTB0d1hjaEJXaklIbGxrNFIy?=
 =?utf-8?B?K0JLRHo0alJHckh0a1phRUl3V0xlZFE5VThNY1lVdXI0SGZFZHhrWDNqQlVj?=
 =?utf-8?B?Znd1Q0dkV3BHVzlvY3UvN0FsTDgzNVNBVFRVL3VmeENxTG5jZWQvaS9lY0ls?=
 =?utf-8?B?MkNsZmF2WGw3RjdGSzc1NkRrVnVySW10VDBIS0pkVmJtNW91UXhDUzhnZFVK?=
 =?utf-8?B?akhZUEVVTmpTM0hkSWtONUtCT2xkYWoxTG0xWDU3RkljMXZXTHhNWDBwSitv?=
 =?utf-8?B?aCt5V0E4cERkaG9paUVRZG9wUFA5blJDa3EzSmExZHl4b0ZObHREVjZQbUFC?=
 =?utf-8?B?YVJRNlRIZEtNK1hGSnZQQjBiVVlBQmdjRzVwTHBUNjd4TGQ2OTJKMzQyMEhw?=
 =?utf-8?B?Y0U0RFNkQ1ZYSmdjZUxxZEZuNDM1bmpkaTNxUUNiQjVYQ3dyTUc0bWNvOUFt?=
 =?utf-8?B?ZmlLUkhzYSt5RVh6U1k0MGpTZVh5Wjl0eUZXcmZlQzh2T0FjTmhxeEV4eUF0?=
 =?utf-8?B?SVZPMTYyZThUUFh2anFWUm5BRDdtTE9TcTgyS1Q0dXB0MUFhemlxT2k1OFZl?=
 =?utf-8?Q?9oVsQc8VeOKlSl2hfv2a2+T5t3p/CJAvr3K98?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff09a53-661e-4d2c-6301-08df4042e24d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:26:51.9337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRYpHuYpOiI6WunNMwWkRpZoHdAyVknZ18FnXfnk8ZO80gr0BfqKONxH8EujbH6Ic8fkZcVw1nYxUBeu/HyRD1yVsholAQ5OMLM57Cz3s0taQiX2CkLzYqFASIpbxxes
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR04MB12644

From: Frank Li <Frank.Li@nxp.com>


On Tue, 10 Nov 2026 11:59:12 +0100, Antoine Gouby wrote:
> This series adds device tree overlays for the Colibri iMX6 SoM. The
> overlays cover HDMI, VGA and parallel displays.
> 
> The series adds support for:
> 
> - HDMI Displays, through a generic i.MX6QDL HDMI overlay
> - Toradex Capacitive and Resistive Touch 7" Parallel Displays
> - VGA Displays
> 
> [...]

Applied, thanks!

[1/6] ARM: dts: imx: Add generic HDMI overlay
      commit: bd0b8c65b8641b5a6d30f9f9545bcc3fca1f25ca
[2/6] ARM: dts: imx6dl-colibri: Add HDMI DTBs
      commit: 49aae2cfa76b3d1e5f6890b00c5ef854cd716d30
[3/6] ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel
      commit: 23a58c96f34723f44335b2f6b3217ea73ba67b32
[4/6] ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter
      commit: 45247546093121a5a5d0d7ed2020bc481b8082b7
[5/6] ARM: dts: imx6dl-colibri: Add Toradex Resistive Touch Display 7" Parallel
      commit: 0d1f6216f1749dbba9e768219300a030f7024442
[6/6] ARM: dts: imx6dl-colibri: Add VGA overlay
      commit: e2ca020156c83ee9d39b93b05bc38153519f0fe6

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
