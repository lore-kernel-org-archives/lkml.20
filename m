Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792492636;
	b=1fVSLAHa9sx+mdkrZ/frUlwv3NH/dCq5wge7GN7qdw0Y7D2wLrMu8mGsFGWxRJDM9gd3
	 dUIKNTJknCbYvc082hrLdDjtxP3AiEY74uQOp8J4/SJPuXDB4IcLdmDhUb6mVNw4IPWGe
	 gYmK6nwUSOX9RC0vX7WrHUMueyGT5LGElCBJ7Lr26/wh2TtdcYEpOyRALh3ePNVRIXIdn
	 igDpM/gYsbTHBnKoZXHuSUsJZvwxCzez7FMuJocCSim25BIe3gRMqnkGRkMJCml/optnF
	 5ksMejd3u9o1WV5yYfoLYBskQMN7OavFS/2l38Dx3XNdj5XO4sQvENQk4eL3QoVE3/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492636;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=1hXlWdCSNAi6T2UP6f2RZ6D+J1WIbfS8Q+v6Wg8Zmys=;
	b=nAN8b/XLBvKsg6BqxlCC2B97Wtshiw87otPUMeRPU45gf+ohYTX+I1NF4E+5Te/sUREe
	 dvDIajBk3m7+bmo+FV2jDEGv7JByj17wqRoyqWmyHKB/EKD6/GatSuu/fwaL4ZdJkXBRP
	 mgvjmUU1MlHX9Twnl79QHNDs2ss+Gjmpbm9YfITTLVAGqVCsWepHep7H/6gqPxt7ZCtTn
	 LTet9Tm++MG0jV/O0cYFahxoaTWag09QNPs3gZiWC4+dHOQ7sLsP7/q0/LZyDN0mA2I4D
	 7+Dkedh+Wn9o2cvfoU24XvZ+s0JB8dSsyPlCgm4pOTlM8N7ZwH+UYSY0nNn1qs1Pz8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vsn0b98g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.56
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011056.outbound.protection.outlook.com [40.107.130.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FE7606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59FE7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vsn0b98g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ema4IwjRRRzHWGjwbBLwvQUFKtB1oU9Cay6COXFC874MzSns6aSkbXNp5yh5tqsJc7yVdJN2tG7Z0uVQfMl74ODrbxoaXTlc7yWmU6kakLTrSsytThLetwtnujKPImydwcFevsS4R2swY4KGWX/d+nyuuULQAhkO0A+lwJX3JU560bXxTFawxJevOdGLFKjuSY6vE/cYZiZlkjiZZxXvTImcIVG+9P65SEuJiIZ7/64LCeoww7KcWY1g74EDhvxaPl5C0Ba6TDab5IGcSXDJyCxp2hN5i2ufqY0o1nHNpPdP68fnVKjX5FJfmL4odAIBaouHnyowgAXT/mov7JZY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hXlWdCSNAi6T2UP6f2RZ6D+J1WIbfS8Q+v6Wg8Zmys=;
 b=vwU6ZKSn5Y1X4Tsdsk9o8oUYMb9aJeLjsLlVPbIPZ72ayIML8/Rh8LX7JSn2qxhYOWjCWpTMugASHDCPleEEWdIiNnV2PE+mK13kDgxorivuZI/p4UeO0c8YrYz3RmDrP2lX8O8V/S8wP2w1I7PkWFDonBkggDeqKbV3TkvaIqyzzk3zlh70sUWIYBjZJ5DPu+pLoXvgPJPNz1TOEdgpJTIEbO4WZu9SK8HNB14+GXe49xPnO0Sjv6yzex3PtdqkI+OamGlSbF34Ko0hSeSu31PyGmVCw8A0lF/yZARdauGvQte3vj6xCvsWHiNW5/dxLnmP7vlmLqYkfYJpchq2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hXlWdCSNAi6T2UP6f2RZ6D+J1WIbfS8Q+v6Wg8Zmys=;
 b=vsn0b98gu2Rb6iWEhHxw6UD3TDS1kHAXmV1aoqIb2We/uGtDlntQkRv+12biuC6NYit+AlT2d7ikI2yS5BLEiDm6ssCJtLRo0u1BX1Ga19rf02aRZFWhD87FsPOOUuvkryp7DO2tlH9VLwtLH4rDG2Z9pzJU0XwK7+stpkk2iMWUqeCxIzq6U4+7SVGecz4FGfg8bZhCjpV+VBILKePjQejxoOmX8RIKhIhSoaCJaMGi4FNOdSXXXBFk5Z4qbBb2D7McW5qOhUybrbvPxVa/D+LazhSlbk7a2liTkcKtGCK5auxigIZiqdbLRKaWWTOI6FVq9+4XsMjtSGijHTfZiQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by DU6PR04MB11136.eurprd04.prod.outlook.com
 (2603:10a6:10:5c0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 10:37:12 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 10:37:12 +0000
Date: Tue, 20 Oct 2026 18:41:52 +0800
From: Bough Chen <haibo.chen@oss.nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"michael@walle.cc" <michael@walle.cc>,
	Bough Chen <haibo.chen@nxp.com>,
	"open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
Message-ID: <20261020104152.l2qsutq66fwdrw7t@shlinux89>
References: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
 <87zex05uvn.fsf@bootlin.com>
 <AS8PR04MB8820E136E7257FC5A02F1A3E908C2@AS8PR04MB8820.eurprd04.prod.outlook.com>
 <20261015031017.pdqnv2bp5627bhed@shlinux89>
 <87zewfuus5.fsf@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zewfuus5.fsf@bootlin.com>
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
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
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|DU6PR04MB11136:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d922695-d39a-4a11-30a3-08df2e961980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|19092799006|366016|56012099006|4143699003|11063799006|5023799004|261009221227099003|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	5iVlE42xjCm4cAir48VyOa67MXr131AUTfGK4IS97NtWrp1AHgfWJlLbCLN8pvE6Kc9I1LusiAGKJUPGF1Uf4+ysGT8JWdJ9NWi7Ik61H1ew4lpDsTvDyHVqEVNaD5hwIMgmVophxQephV4NV8piSTMST0M27wWQfLqOTYOg8EaodsU1s83avGpRCuHnyd1wvgGpWfGv125wTZ97buQaGXoVT5Kca7Gdn47ff4PSh1+jbirVr6YHKJhEVt7BvttIKX/nO87ykeV/SkAn/cFYHMSqOxEE5IygN6uuuQN1KPKZaZsxW87qJUfNG9cdFsEzY4YQDoqIfK9VS9cdUwv410ecARnsqS9mRGBtY0M41+00FsAYE+gwF8cGZLJxby1i6QGAJbHsozHc/l/wWHqkhlPya8py8cW5d8rXtXPBZqCUGuHownUFZrX2EXAzryfk5JLXy2uK+mI1iNLNJURto8rxjOFjbe5H8uRomtxCTklO52Z4tOLTaaqz1Q1Gp9QeCs+7MRvxfmuR3mDksls10umRuc99awzVO0MxYlu6DPTxvQwCMpctGfL2xOzybm44PryWXhS5ikV0aMuFopx/bR8BT2wwnr2TZFWY/4Y3ngZ/T+vr3ZXkdOQpwwq/hVDF80gdtk/0KLzrN6V9WBIKKUG3bHkX4W9n/jVX4cv42mw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(19092799006)(366016)(56012099006)(4143699003)(11063799006)(5023799004)(261009221227099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWh3d3UxZ0ZVbjM5OTZocWZsKzNFWGozV00wVXBLalNRT1ZtZS8zT0drbWEy?=
 =?utf-8?B?K3VKemVnd3AxYnIyS0J5TUNTZkNaMVhOUmZMUVFFbXZTa3lDWkREMGJNZmhW?=
 =?utf-8?B?MUZFb2YvVnFjVDBKZUQxOTlHYklnTXVDL2IxdmxBUEdCRHBDMkhOUmo3WmFE?=
 =?utf-8?B?T2c4TG05REFPRTNabWhxNmtMb2d2bDBVcUVlQkpvd1QvUUdIK3puc2pwNXlu?=
 =?utf-8?B?S2hpam9IY01HZ1p1OEREUlZkd0gva2R2elBWZWtmbElJYVZDZXZpMjIyVUZJ?=
 =?utf-8?B?NThBRzZtL3M5RlZhK1NVbHdXRTVTdFJnbGNkQ1VXcG1hUnEwcEFhZk9aZHpL?=
 =?utf-8?B?bndCWDlyKytSaDU0T2ZMOWFydXViWlV6bU5jQlZBdHJ0dFU2MHdONW5hSXJk?=
 =?utf-8?B?Yy82STR3MThRSzN2ZVZkaE1FaWhNYTNhUG9mV0hBSEZlcVdvenN3U3BYK3NV?=
 =?utf-8?B?Sjh0TjRnNThWMjA4cVZBVzc1ZFk2ODF5QVNxTUh2c2ZWcnFVQXNjWk9JMzVo?=
 =?utf-8?B?d01qVzJVcGtyTU8ya3ZiN3RDSlpzOFY2VGF3aVNPWmh3VjlnMXZ4WE1IcXdT?=
 =?utf-8?B?ZUhBTEp6TkR4QTdHQlZROUREUXdwYm5aa0xRaWcwT1FjTUVLRW44TzRXZW05?=
 =?utf-8?B?a2ZIbFpqNVRDdzBDVVBHWm0wbENwbnBUbFk5d0l5ZEpCaENxRDlxb2hFR29w?=
 =?utf-8?B?OTdyWXFTdk9ZZTdQVlV0TkoxS1BSUzFuZXNqYko1K3hsYjdDV0wySy9FWUFE?=
 =?utf-8?B?MjhLUENsQ2VBS1c5emVIZmRBVUtKNzV2UnliNEJydm9PNERTbU1lNEU1Q0FD?=
 =?utf-8?B?MUk1WXJIeFkvcnlNZnB3VHhzNVA4Rlk3elpmL1NwcXpoTnFiVTBkUy9yR2JF?=
 =?utf-8?B?dnlsWHJ1WWxzU3pWM2RYaGhnaFNnMUJtWk56dXp0UVlBT2hqZllGMjIybW9i?=
 =?utf-8?B?SFNlZ0t1U3FJUFFWUWtIRWptSzlTTUl4emhFUW9XdDFsTGZ1bFJDd1hESFpJ?=
 =?utf-8?B?MC85ZW9NdDRGK25XeWFtTGMvVnhNMU5CM2tzVkhuRE44VjhONWVtNDlLZ3oy?=
 =?utf-8?B?b2tGRzB4cURGVmJnQjFVN28weHliQXVnZC9ReGE4NHpKbnNaUitnbGF5eklp?=
 =?utf-8?B?T0RpQW9paXhzc2Q0ZXBEUUZzbVNxeWRCM0RkeFMrQ0N0dTVQbmg1a3crVjVn?=
 =?utf-8?B?K2RicE1VNlU1TVpvQmd6S2kvWnAxWWYvcDlIUXhoc0VkMmhCN0JCNGFETUJC?=
 =?utf-8?B?YUd4STJmYnUwbWhWS1lzUFFsVCtzcER5ZVhaZG5YaVYrZTQ4c3licVFURk9w?=
 =?utf-8?B?T3p3K1ZPc1o0VlU0V0VKbE9VMTNGbXZLYlhTR0JXMEYyVXBoMEVJeFN3NEcw?=
 =?utf-8?B?YlloaVpycFpsdUdnTWpGVGlNR08rNXR6OEkwV3FBUE1CQWRmMVpwMFdNQzJk?=
 =?utf-8?B?OURpQ3lOcFU4Q3RNdmJSRHl3ZE4rdHQ0aWVmbFNvcWJrcVFHaE1iTmp4czlK?=
 =?utf-8?B?U3FUV3lyN25LTnVYdE1pMkd5R0JwcGI1VkUwOGN4bEJ5NGpyaklpekdSWkZt?=
 =?utf-8?B?d2FpcXRHcTNsWktwci80Nk1ucm5YaEVUbnlGOHc3ejgzMFZacnV1NmpBdFgy?=
 =?utf-8?B?bkZlTCtQN05KSWVTUmdDN3dPdmhQVGZtQWFWM2c1TlVLS2N6ektqcVVOMStJ?=
 =?utf-8?B?MWpNTlFjT0hHNDliMTZGWlRtWGREck1meWwycGplT0dOZDZjZExrM2Z0VFo1?=
 =?utf-8?B?V1F2ckdFMlluNTlPR2F6MzZTcnhsUUdtWkFObG1udnVaM3N0cU4rcmEySVV2?=
 =?utf-8?B?Ymd3L2RJWTdPMFB2QU45bEFjWW1rZ1l3eTBDc3pabnVNTDhsY0F1UnZ0OHNJ?=
 =?utf-8?B?aG44dmJ0Z2VuUVVRRi84akRKT0pJUGpQTHk4WWc2cGJjZlRicVEvNmhQTmpK?=
 =?utf-8?B?V3BIK2M0TDk1bm9GTHovc0ZOdmRjUWRuZEdhVWp6NzhzL3gwaTlJelZYejlR?=
 =?utf-8?B?MTZQQmtWWEkwM0hiZVh3T1NSK2sxdGQxdjh4N0s2TE0vaXp2dzBXcW5NWUpF?=
 =?utf-8?B?b0JmTVlrczFHT1YyL2ZWcnYwaFlvYnZKQmx0WmRMTnpmYlk3aWFGWllTZkk4?=
 =?utf-8?B?djkwSGlZb005ODYvZStTU2I5d0dma2pyeWxRbjVDSU1Nc3lkR0s4WjBtODEr?=
 =?utf-8?B?NjhJSG5Qb0lMNVY1VUIyQk9tellvaTJRRXNveDZqeTRkYzA0TFd3L1pDMklM?=
 =?utf-8?B?YmpZSlkxNU1jbElKbkl2Z29GU1VVWmgzU094K3ZWZnZLK2FieWlMUE9PZ01N?=
 =?utf-8?B?ZjcxeDdYYzlhUlhPMm5QaDFUN2ZWYlNQYlBudGpQYkJhdS9Rb0YrbjZNL2xm?=
 =?utf-8?Q?4523+P8kwDCKLFuaOFi9NL3RGnhOSl2bm7D3j?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d922695-d39a-4a11-30a3-08df2e961980
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 10:37:12.2130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLXb2OyweV8pEJxYGgAT6oeHBfCllGZiNMpuIf8jQfog99Nzdym3TIKjt9q875a+yJN05lXXuqmjDWTEdTUkn59ayEED39+9SthEfvgP+l3OiV77f9200vd/89EAFjxk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11136

On Thu, Oct 15, 2026 at 12:23:38PM +0200, Miquel Raynal wrote:
> On 15/10/2026 at 11:10:17 +08, Bough Chen <haibo.chen@oss.nxp.com> wrote:
> 
> > On Tue, Sep 29, 2026 at 09:10:37AM +0000, Bough Chen (OSS) wrote:
> >> > -----Original Message-----
> >> > From: Miquel Raynal <miquel.raynal@bootlin.com>
> >> > Sent: Tuesday, September 29, 2026 4:23 PM
> >> > To: Bough Chen (OSS) <haibo.chen@oss.nxp.com>
> >> > Cc: Pratyush Yadav <pratyush@kernel.org>; Michael Walle
> >> > <mwalle@kernel.org>; Takahiro Kuwano <takahiro.kuwano@infineon.com>;
> >> > Richard Weinberger <richard@nod.at>; Vignesh Raghavendra
> >> > <vigneshr@ti.com>; linux-mtd@lists.infradead.org; linux-
> >> > kernel@vger.kernel.org; michael@walle.cc; Bough Chen
> >> > <haibo.chen@nxp.com>
> >> > Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
> >> > entering Octal DTR
> >> > 
> >> > On 29/09/2026 at 14:53:07 +08, haibo.chen@oss.nxp.com wrote:
> >> > 
> >> > > From: Haibo Chen <haibo.chen@nxp.com>
> >> > >
> >> > > The core defaults opcodes.read_sr2 to the legacy RDCR opcode (0x35).
> >> > > In 8D-8D-8D mode the opcode is extended to two bytes per cmd_ext_type,
> >> > > but the resulting command is not a valid SR2 read for these flashes,
> >> > > which access their status/config registers through a vendor-specific
> >> > > indirect register space. Since spi_nor_cache_sr_lock_bits() now reads
> >> > > SR2 during init, i.e. after the switch to Octal DTR, the extended RDCR
> >> > > gets no data back and the read times out (on i.MX FlexSPI: -ETIMEDOUT
> >> > > and a controller
> >> > > WARN() during probe with Micron MT35xU and Macronix octal parts).
> >> > >
> >> > > Clear read_sr2 when the switch to Octal DTR actually succeeds, so the
> >> > > SR2 read is skipped (a cleared opcode already means "unsupported").
> >> > > Doing it in spi_nor_set_octal_dtr() keys off the real runtime
> >> > > protocol: a flash that advertises Octal DTR but runs in (x)STR because
> >> > > the host lacks support keeps its usable RDCR.
> >> > >
> >> > > Assisted-by: LLM
> >> > > Fixes: b7b63475903c ("mtd: spi-nor: Create a local SR cache")
> >> > > Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status
> >> > > support")
> >> > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> >> > > ---
> >> > > Changes in v2:
> >> > > - Rework the fix following review: instead of guarding the read at runtime
> >> > >   in spi_nor_read_sr2(), clear the default RDCR opcode.read_sr2 once, at the
> >> > >   point the switch to Octal DTR succeeds (spi_nor_set_octal_dtr()).
> >> > 
> >> > I don't get that choice. Why switching when Octal DTR succeeds only? SR2 is
> >> > either supported or not supported, I don't think it is anyway different when
> >> > entering octal DTR mode, is it? So I would expect SR2 to be cleared earlier than
> >> > that, once we know the chip is octal DTR capable. And this must be early
> >> > enough so that manufacturer drivers can still set their own value.
> >> > 
> >> > I am wondering whether we should simply drop sr2 opcode in the QER SFDP
> >> > parsing entirely for octal DTR devices (Michael?).
> >> 
> >> The reason I clear it at the point Octal DTR actually succeeds rather than
> >>  "once the chip is octal-DTR-capable" is that capability != running mode: 
> >> a chip can advertise Octal DTR while still running in (x)STR because the host 
> >> controller does not support 8D (see reply below). In that (x)STR case RDCR is
> >>  valid and needed, so keying off capability alone would wrongly drop a usable
> >>  SR2 read.
> >> 
> >> That said, I agree the current spot is awkward and does not let manufacturer 
> >> drivers override the value. I'm happy to move it earlier. Two options:
> >> 1, Clear it during SFDP QER parsing (as you suggest) for octal-DTR-capable devices.
> >>      This is the natural place next to the existing read_sr2 = 0 QER cases, and it runs 
> >>       before the manufacturer late_init/fixups, so a driver can still install its own SR2
> >>       opcode afterwards. 
> >>      My only concern is the capability-vs-running-mode point above — we'd be 
> >>      clearing based on advertised 8D capability, not on whether 8D is actually entered.
> >> 
> >> 2, Clear it in spi_nor_late_init_params() after the manufacturer hooks, gated on 
> >>      octal-DTR capability, so vendor values set in their late_init are preserved.
> >> 
> >> If the capability-based approach is acceptable (i.e. we accept that a chip advertising
> >>  8D but forced to STR by the host loses its RDCR), I'll go with dropping it in the QER SFDP
> >>  parsing. Michael, do you have a preference?
> >
> > Hi Miquel,
> >
> > Any suggestion?
> >
> > Regards
> > Haibo Chen
> >
> >> > 
> >> > 
> >> > > - Key the clear off the real runtime protocol so a flash that advertises
> >> > >   Octal DTR but runs in (x)STR (host without 8D support) keeps its
> >> > >   RDCR.
> >> > 
> >> > Are you sure this is a valid case?
> >> 
> >> Yes. spi_nor_setup() computes shared_mask = hwcaps->mask & params->hwcaps.mask, 
> >> i.e. the intersection of flash and controller capabilities. If the host does not support 8D, 
> >> SNOR_HWCAPS_READ_8_8_8_DTR is not in shared_mask, spi_nor_select_read() picks a 
> >> non-8D read_proto/write_proto, and spi_nor_set_octal_dtr() bails out early at:
> >> 
> >> if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
> >>       nor->write_proto == SNOR_PROTO_8_8_8_DTR))
> >> 	return 0;
> >> 
> >> So the chip stays in (x)STR with reg_proto == SNOR_PROTO_1_1_1, and RDCR is still a valid 
> >> single-byte SR2 read there. That is the case I wanted to avoid breaking by keying the clear
> >>  off the negotiated runtime protocol rather than the advertised capability. If we move the 
> >> clear to capability-based SFDP/late_init as discussed, this is exactly the scenario we need to 
> >> be comfortable regressing (an 8D-capable part on a non-8D host would lose its RDCR read of SR2).
> 
> I am sorry but I failed to find devices acting like you describe. Your
> commit log mentions Micron MT35X and Macronix devices. I checked the
> datasheets:
> - Micron octal devices do not seem to use SR2 at all, they have a flag
>   register, but that's something else (like Winbond) and they have
>   similar support for it both in ODTR and in SSDR mode.
> - Macronix octal products feature several SR/CR. The sr1_and_sr2 opcode
>   exist but I would like to stop using it since there is no more need
>   for it and it just complexifies everything for no good reason. There
>   is no difference between the SSDR and the ODTR instruction sets, they
>   both support the same opcodes for reading and writing those registers
>   (with the subtlety that the repeated opcode should be a bitwise
>   complement).
> 
> Which device do you use exactly? Why is it not working? Are you sure it
> is not a problem with your controller or the SFDP tables instead?

Hi Miquel,

The device is a Micron MT35XU01GBBA (JEDEC 2c 5b 1b) on an i.MX95 EVK, and
a Macronix MX25UW51345G(JEDEC c2 84 3a) on an i.MX8ULP EVK.

In 8D mode RDID (9f) and RDSR1 (05) are read back fine. Only RDSR2 (0x35, 
extended to 0x3535 or 0x35ca) times out. So the controller and the 8D sampling
are OK — the flash simply does not answer a 0x35 in 8D mode.

Root cause is in the core, not the SFDP/controller: spi_nor_init_default_params()
sets opcodes.read_sr2 = RDCR (0x35) unconditionally, the Micron driver never touches
it, and spi_nor_cache_sr_lock_bits() then reads SR2 during init, after the switch
to 8D. As you noted, Micron octal parts have no SR2 (they use the flag register),
so 0x35 is simply not a valid command there. Same for Macronix, 0x35 is not valid
in 8D mode.

For spi-nor device which support 8D, it should contain the xSPI Profile 1.0 table,
And Profile 1.0 does not describe any SR2/RDCR read. Per your suggestion, I can
clear opcodes.read_sr2 in spi_nor_parse_profile1(). It runs for octal-capable
parts and before the manufacturer late_init, so a driver can still install its
own SR2 opcode afterwards. I test this method, it can works, but I have some concern: 
though flexspi(controller) and spi-nor device both support 8D mode, but user
still can force the mode to 1s-1s-1s mode by setting the spi-t(or r)x-bus-width=1
in dts. Like the Macronix on i.MX8ULP, in 1s-1s-1s mode, it dose issue 0x35, but
it has no HAS_SR2_CMP_BIT6 flag, so cmp_mask is 0 and the SR2 value is discarded
anyway — clearing read_sr2 causes no regression there. 
But if an 8D-capable part declared SPI_NOR_HAS_CMP in the kernel and were restricted
to (x)STR by the host, clearing read_sr2 by capability in Profile 1.0 parsing would
drop its usable SR2-CMP read in STR mode. This is my concern. So I switch to the
runtime mode, clear the SR2 only when mode actually in 8D mode.
I'm not sure whether such device really exist.

Which method do you prefer? If you prefer clear SR2 in spi_nor_parse_profile1(), I
can send V3 patch.


In the end of this reply, I list the SFDP of these two spi-nor devices. 

Micron:
root@imx95evk:/sys/bus/spi/devices/spi1.0/spi-nor# hexdump -C sfdp
00000000  53 46 44 50 0a 01 03 ff  00 08 01 17 30 00 00 ff  |SFDP........0...|
00000010  84 00 01 02 90 00 00 ff  05 01 01 06 a0 00 00 ff  |................|
00000020  0a 00 01 08 b0 00 00 ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 8a ff ff ff ff 3f  00 00 00 00 00 00 00 00  |. .....?........|
00000040  ee ff ff ff ff ff 00 00  ff ff 00 00 0c 20 11 d8  |............. ..|
00000050  0f 52 00 00 39 61 99 00  87 8e 03 d3 ac a1 27 3d  |.R..9a........'=|
00000060  7a 75 7a 75 fb bd d5 5c  00 00 70 ff 81 50 f8 a1  |zuzu...\..p..P..|
00000070  2f cb 27 8b 00 00 04 01  00 06 01 00 ff ff ff 8e  |/.'.............|
00000080  00 00 00 00 00 00 00 00  00 00 00 00 ff ff ff ff  |................|
00000090  43 0e ff ff 21 dc 5c ff  ff ff ff ff ff ff ff ff  |C...!.\.........|
000000a0  00 0b 80 9e b1 81 b5 85  00 f0 ff 9f 00 0a 00 00  |................|
000000b0  00 0a 1a 88 10 00 00 00  ff ff ff ff ff ff ff ff  |................|
000000c0  00 00 06 01 00 00 00 00  14 01 81 03 00 00 00 00  |................|
000000d0
root@imx95evk:/sys/bus/spi/devices/spi1.0/spi-nor# ls
jedec_id  manufacturer  sfdp
root@imx95evk:/sys/bus/spi/devices/spi1.0/spi-nor# cat jedec_id
2c5b1b
root@imx95evk:/sys/bus/spi/devices/spi1.0/spi-nor# cat manufacturer
micron
root@imx95evk:/sys/kernel/debug/spi-nor/spi1.0# cat params
name            (null)
id              2c 5b 1b 10 41 00
size            128 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | HAS_LOCK | IO_MODE_EN_VOLATILE | SOFT_RESET

opcodes
 read           0xfd
   dummy cycles  20
 erase          0x21
 program        0x12
 SR1 read       0x05
 SR2 read       0x35
 SR1 write      0x01
 SR1+SR2 write  0x01
 8D extension   repeat

protocols
 read           8D-8D-8D
 write          8D-8D-8D
 register       8D-8D-8D

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (128 KiB) [3]
 c4 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-07ffffff |     [ 1  ] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 64

root@imx95evk:/sys/kernel/debug/spi-nor/spi1.0# cat capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-8S
  opcode        0x7c
  mode cycles   1
  dummy cycles  7
 1S-8S-8S
  opcode        0xcc
  mode cycles   1
  dummy cycles  15
 8D-8D-8D
  opcode        0xfd
  mode cycles   0
  dummy cycles  20

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 1S-1S-8S
  opcode        0x84
 1S-8S-8S
  opcode        0x8e
 8D-8D-8D
  opcode        0x12

Macronix:
root@imx8ulpevk:/sys/bus/spi/devices/spi2.0/spi-nor# ls
jedec_id  manufacturer  sfdp
root@imx8ulpevk:/sys/bus/spi/devices/spi2.0/spi-nor# cat jedec_id
c2
root@imx8ulpevk:/sys/bus/spi/devices/spi2.0/spi-nor# cat manufacturer
macronix
root@imx8ulpevk:/sys/bus/spi/devices/spi2.0/spi-nor# hexdump -C sfdp
00000000  53 46 44 50 08 01 04 fd  00 07 01 14 40 00 00 ff  |SFDP........@...|
00000010  87 01 01 1c 90 00 00 ff  0a 00 01 08 00 01 00 ff  |................|
00000020  05 00 01 05 20 01 00 ff  84 00 01 02 34 01 00 ff  |.... .......4...|
00000030  00 00 00 00 00 00 00 00  ff ff ff ff ff ff ff ff  |................|
00000040  e5 20 8a ff ff ff ff 1f  00 ff 00 ff 00 ff 00 ff  |. ..............|
00000050  ee ff ff ff ff ff 00 ff  ff ff 00 ff 0c 20 10 d8  |............. ..|
00000060  00 ff 00 ff 87 79 01 00  84 12 00 e2 cc 04 67 46  |.....y........gF|
00000070  30 b0 30 b0 f4 bd d5 5c  00 00 00 ff 10 10 00 20  |0.0....\....... |
00000080  00 00 00 00 00 00 7c 23  48 00 00 00 00 00 88 88  |......|#H.......|
00000090  00 00 00 00 00 00 00 40  0f d1 ff f3 0f d1 ff f3  |.......@........|
000000a0  00 05 00 90 00 05 00 b1  00 2b 00 95 00 2b 00 96  |.........+...+..|
000000b0  72 71 03 b8 72 71 03 b8  00 00 00 00 90 a3 18 82  |rq..rq..........|
000000c0  00 c0 69 96 00 00 00 00  00 00 00 00 72 71 00 98  |..i.........rq..|
000000d0  72 71 00 b8 72 71 00 99  00 00 00 00 72 71 00 98  |rq..rq......rq..|
000000e0  72 71 00 f8 72 71 00 99  72 71 00 f9 00 00 00 00  |rq..rq..rq......|
000000f0  00 00 00 00 01 15 01 d0  72 71 06 d8 00 00 86 50  |........rq.....P|
00000100  00 00 06 01 00 00 00 00  02 00 01 03 00 02 00 00  |................|
00000110  00 00 06 01 00 00 00 00  00 00 72 06 00 02 00 00  |..........r.....|
00000120  00 ee c0 69 72 72 71 71  00 d8 f7 f6 00 0a 00 00  |...irrqq........|
00000130  14 45 98 80 43 06 0f 00  21 dc ff ff              |.E..C...!...|
0000013c

root@imx8ulpevk:/sys/kernel/debug/spi-nor/spi2.0# cat params
name            (null)
id              c2 84 3a c2 84 3a
size            64.0 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | IO_MODE_EN_VOLATILE | SOFT_RESET

opcodes
 read           0xee
  dummy cycles  20
 erase          0x21
 program        0x12
 SR1 read       0x05
 SR2 read       0x35
 SR1 write      0x01
 SR1+SR2 write  0x01
 8D extension   invert

protocols
 read           8D-8D-8D
 write          8D-8D-8D
 register       8D-8D-8D

erase commands
 21 (4.00 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-03ffffff |     [  2 ] | no

root@imx8ulpevk:/sys/kernel/debug/spi-nor/spi2.0# cat capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 8D-8D-8D
  opcode        0xee
  mode cycles   0
  dummy cycles  20

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 8D-8D-8D
  opcode        0x12

Regards
Haibo Chen
> 
> Thanks,
> Miquèl
