Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C0732ED54;
	Tue, 29 Sep 2026 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671715; cv=fail; b=bg5AyKgOwECZQNfskzDxd5xzsA7Qd6dCgp36gIuJASJfJdzZpe3Ghw9acxP64O0HcTqIhQOqZaZ9TeGOFn8GTZqTMguF1U3xqES0auZVJmAdwN49KkC3eawSMN6nR7QLOQRpj+N7AtHRLrgwkVyzs0IrAaSlcsSQcS5wSnt5tWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671715; c=relaxed/simple;
	bh=h3nyW3GckQuuE5MT6CW5cIkuPaUi/eOdxUmfQX7M8D8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Z7xf1MztVtxQvKY3A3G7ipyKLH+9fyVZVjHwiNYDBXCG85q+c3l2ro1A8W1oJQoxfhIvuEy8f3l+xmT1Gl4W7JZkmH8LIMd7PFPlotLyrVCEcUSqu0bqt1kDQd+XJztvzIn4jc3s7RJFO0HwypuhGB9hpFIgVg/24DkzpSa6Hjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cK68QMbj; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cK68QMbj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcsGJCybW6/QHIS4CruieY2j4w+VrCqzX7EvdkGLDKlH4WS3uAYbdUh2yrVYbdtY7nBzNS3y0v1aGiIYgIU2DpjcPKXsuFM7/y89kU3o+Gu7cqi2BAIyrmn07o7LukcJNFF5TX/lY/qA7eCFHe1lRHg97qKDT+u3chguj0Qp5lNKBOhTuJyzPUDr8CHzMCH4oy3YnGq9XolVkGah7HogX528myMCi8QWFx6uPNzBOEpImYObMhxsFD8EHy0Sn0qg3RS2o37ChM+Igu0ueZZZc4Gs5p+Q8DLUp6vPdvsfLnPI+dzff5Aai9s+z9dtEebRMOdSOdTl5pObFM16zHQppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNlE6efg7Z5nRM6vpUCGQWOL5sKbyOGKV9XRRQ2w2Wo=;
 b=fygxu4hn4orc+ixx/X7RRnQgN/zE+1i807e/u9H8HNVnv1fb6cRLDGiLGM6Qi47WbV0RiA3u/+Wxu0VXvTbY/HuXdT9Vg2VbjGFr+Jk6uhzBW7V0/HTqxQXFmAgR2Z4WQKhASmfHtJV1CPvsXw6+7U0h1MLpaKAyThPZ6NG9iSUARD47AGblK6Xwk8hd8QmFJ8qHcCBMjdosZVBFKg+1kzF8zEWukBXVhpthmdMmVtWHmop70jHDiNk/Yl6dSQ4WLGsrbPo8xMDHMoEh7hXJg9Cb+QvRv6IyWM8GtS+wQZ3Z43fxN+yb+Vix6NtcF80mXbmqTfiplm5fL/SYzfcG0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNlE6efg7Z5nRM6vpUCGQWOL5sKbyOGKV9XRRQ2w2Wo=;
 b=cK68QMbjJ2SkMB1lH8mgg/6PxjcQ1MVTZUNnp/lC7wvz1ZHf3sv57yaNS4MJZjkzW7lgye/PcgvNxj/fZmXNjv9zyrWdtXaombEmHU0vZ9bOTaNMHO3ljCxYchbIuxRCp83auCe8rCA5m9NboxLWFYonVeEYLvxFXZG9QsEvCbQ8dSvn7CdaueHUj23r/Hk4CrloYfk4yKABCjYs/5SWvi2YPRUhO5lkZYTqVZnf9phL05gKrjgyJJYO3edsXcL45JiBsuENK9bBnaRa+BiJqnot80IRFIlY83BkBgYtwiaPcJfnfc1k3iNhXn51h2RagM+I11F2kwKXg21nm2Josw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:48:24 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:48:24 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 29 Sep 2026 16:52:24 +0800
Subject: [PATCH v4 03/11] media: imx8-isi: Support mbus_code filtering in
 format enumeration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-isi_imx952-v4-3-e69f89c7c651@oss.nxp.com>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
In-Reply-To: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790671948; l=3053;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=h3nyW3GckQuuE5MT6CW5cIkuPaUi/eOdxUmfQX7M8D8=;
 b=FRAIlPt8vrddJ4BZRJv7+MKOjhDZKtDgRcDfKlj+IQpYPAG24WstfXJwM64/HpiSQ0ar33Hlo
 JX4F3yj37EODUJ5WF6PPkWd6lVoLAa6nJ9BsosMD6Ul4eYrK+KsKfQy
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0143.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::10) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 01524767-1d4e-437a-f39b-08df1e066c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|10067099003|11063799006|56012099006|921020|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GO7uhBdY5y+dlT/tgKv13ngjsS0JeowpHSlJqsWtJPN0F/By8smANTmxkJP+kHHD8i2p1cFlfMnFvSefd0TANIq9ESbyuh97IA7OVopcGGk29okOzJ5XXyMTZkXtOAnAJ+DnBdwOD1GGqJLrp5io9u2dvtwnCV0dVxqXw6Q4T8JBGh6JHIAiZBcyWSvW77+RFb5jwOE2a1GYV8IXx42ITQEtzXsMzGhJtmyj8VjUL0YzDzUT+4qb/AtXu1xoM4c2NQB22Kxi/hT2Zaxnh2zlzVCnkk9hdjstXTF0zAUX9jFEg5SR1u3MOvmgPdHsAyTDkZdNtS2VFe2D9qcktpVQzyNWTDy+386vsaNgD/ifMWWOuPJSAGZ+5y/hrgdI3CwX4Q5cBxhC8/J09D8bRGYXR3vLxC2p/SaE15g7E94bnSm+h4L+yES5865kI9mqHE0PnLlEskXqIA8GMTe+yjSnuJSdVzEmd5qUwl23/rjnNA+5AI3Gr17VYF83m5JQYJVPbhcoSpwFTW8m25+22cpwSCriGSoml/aBBqOmG0PPNd/mI9On+Hh3T5u6Xyle2wo2pLLyV3q/GRa9QgK+Y5LOXJHcccnRCbA0WNUiMmP00VvdVAbdMgIsPzvWNfYXfzrxviPRaWfA3npre/JqNIJyDruXRCkaLytBkalf4eQSeuvdF4PAL5o7RYmxINr85eazbmmYKs41lP8ShhIjhQ3ZMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(11063799006)(56012099006)(921020)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUZqZG9mNzMrajhOeCtsWDVod3lxc1V2THBqVGJjeGlqeEtvbmh5YVZvdW1j?=
 =?utf-8?B?QkNFRVdJZFZDT1M2QlBKeTFDQ0Jad2tEdHdQM1Z4cTV6aUhoNnhyc1ZwRk1J?=
 =?utf-8?B?WjgyV0xOWS9vMTJhT1hqS0l2dUZsenU3UHdCM21aVWdUN0VwTHdNeDBaWWFS?=
 =?utf-8?B?c3E4TnZxOGtOc1JLSVdTOEJOanppUnRVTkl4K0dmWlJINjNYaElMSHF5TVQ2?=
 =?utf-8?B?YzM5N2ViT0NEOXl3UWQyZWRVZ3kwMVd5OG1nSnNpZkk2cjNiRXZGL1RDdmxx?=
 =?utf-8?B?anc0N3gyZWVFM3Bwc1dhM1Z0WnhpUmNUdzNORFlJOXNMdW5jc25NMk5OSVJL?=
 =?utf-8?B?YlY3d2ltKzBMdHZTbi82Q1RpaHczOE1GYWZta09uZjBSL1pRMldJYm1ydVNK?=
 =?utf-8?B?THBZSkVVVVlqdWIvMk95T3pUK2I2MGRVL29FOC9YT00vVWI5MVFnbHUwMTQw?=
 =?utf-8?B?ZVcvSFIwSUtTNEQ0U2k4eXY5bmlaOG1pSEJhcGdhNGlQOGhubDBuai9lYXVY?=
 =?utf-8?B?QWpyR2k0bURYd2QwSUF5MENLNHFFQ1d3SVBSa3pPTXo4LzZYYWdhRkZ5aDVh?=
 =?utf-8?B?cndOL21ISHo0YUczMDQxUTZxSjQ2anpqSzQyNVdJWlAzdlNiQ1BLbW1mSW52?=
 =?utf-8?B?bnU2bEl2akI2cHZqaklFNlNZOWJrMVlEN2Ficy9yVkE0dHZ6dWJXemJRd3kz?=
 =?utf-8?B?SVRQaHFzbHFSM1dVWk02UUU5cm5tL1lJTzFrVi9UK3VIZmhoSzBpcTloN0di?=
 =?utf-8?B?WEc4b1BHYmhVNWt4U210eUdiTUlySHE1UDJiTFBpU2RVWjg4MWpSbXQyTFVj?=
 =?utf-8?B?bmhYL05nZEhjaWRvZFBaOWRhMDc0MmF1Y3V4UUR5V1dLRjAzOEVlUUk1Y1hy?=
 =?utf-8?B?ZXhzQThrRXlZaXBUbVVJTTBiOHJmTHVGYk9Jb0hzYXZrWmNwdVFMbjFIaTRr?=
 =?utf-8?B?L2FLMU9UMkE3dHJlTjltMjI2WWtxL0wwMXhLbUJucjhweWpPNUE5QlZFL2R6?=
 =?utf-8?B?WFhmSTdYdXZCWkZwY0JvL1N6NDh6Wk1kYXZqKysySmpjaE5JV0J0Qk42UzJD?=
 =?utf-8?B?MEZiS0VQQzVkbWZpb2hhUjVrdVlNYzkyMUoyWTVodHYybFBXY3FGRW1kdFNU?=
 =?utf-8?B?R2FhbHo5TU1MRm1nbW56STMvYXFpZlExZ0FGNDk1SllJMmd0NHhXZ3R0QlpT?=
 =?utf-8?B?U25IWW5BUUplOU1sRW5VeVZLUXIzZEM4WDlZb3hiSUhjT2lWdzUrSERTWEVx?=
 =?utf-8?B?UEpEeWN0Y0tPVWtTVnRBa3MzbVV2WVZYNEZZdFRCZDhKbCtEL0U2M1BBZ0dO?=
 =?utf-8?B?cENQNWhTaEpXb0pZaE1MUWhHcExBeE8zakVkWnJSazFWRU9pNTJMSkxKWTRM?=
 =?utf-8?B?MlVpOU9KdENnYys5RDcrVnErS0lkNzVFV0QxNGFxQmRxdTkyQzNoYi83bDNv?=
 =?utf-8?B?bUtaNmRxNFZNMnlrL2lHRWNvbVcwT0I3UnZNNWdYcmZEK3NMUmR2MU01RU9Y?=
 =?utf-8?B?TWhqSC9OVGlTSmJLVnpwOE5lREIwTjRXck9RNGxnT2R3Q2ZXM0FTUytNeVUw?=
 =?utf-8?B?d2Yyak41b0doSXF2VGs3M21PK2JEc2UyQXkvTGJWcS9yMFpnMkFwa2YzdnRX?=
 =?utf-8?B?K3BxdVRONUNLc3o0R1llT2JZUmpGZG0yUEJCM2VaMUhxYzVsVUp3c0s3U2h2?=
 =?utf-8?B?QU14Wm5wL2U3L2UzNTI2TG03WkNScUViaW1yUHRnR1pLMUZGakptSjJya3h1?=
 =?utf-8?B?Z0tack5QZm95VnRjU3A0SVpHQ0Z2OXYxdUltak9iYWFaVjdkM21xTEJzbGQ0?=
 =?utf-8?B?N0ZFS1NCU3RJR2RsL2YyVWtsMi9Ca0REOWdUZGRPNTF3OEhvM1FMUWJvU3Zk?=
 =?utf-8?B?S2U1M2E3ckUzVG1TNjZwOVArUVZJVGxtajRrRzFqc3BFekdoa21DcWljaU1H?=
 =?utf-8?B?eGZKT2JhRXFRTnVFMnVaa3ZweEt4c2ZrZnQxUkdXYVZ2dEFOazhlZXdkUEtH?=
 =?utf-8?B?OVhUaUlLOVNqZ3kycmtQdGJpV0tCQ2dTdTQ1UWM5aGFqeVk2VFBsVUJZdDFC?=
 =?utf-8?B?OWVMU2ZKeWQzWUdzL0hrRXcrbWpCWFZmMUtzQXVMcTlCaCtqMXIvZVZSYjI1?=
 =?utf-8?B?RnM5SW1CeW9hblQ1RC85TDNydmFVdndWdFRSYUQvRFpIazVLNlpQYkYwSFhQ?=
 =?utf-8?B?M0x1YUhaNW51MHlPcUs4YmN4M3BsU3JXZWM2Q0czWmIrL2VOVzBDS0RFcTB3?=
 =?utf-8?B?clJ3QkxQcGlzTVlneTBHd25XamhDNWsvejlHSmJYQUUvdHhjdkdKdnJ1ZE1M?=
 =?utf-8?B?TTVLenA2MUYzczZMUERYbG8wVEJhUFBZeTdMYmoraXYzeGVDUHBHbklHdW81?=
 =?utf-8?Q?JLp2xEXRkDbS+VgjErWP6n7BOIGsfXtXd69No?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01524767-1d4e-437a-f39b-08df1e066c4c
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:48:24.6484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9J4AZasPO8sMNCC0UnMR1HgG6QBPLqrQ4yMV3zFbsGviUhWCf65EI/dxuBfh6D7gzV+5w11WcQgD4hZVZMa4uUVESP+yvBFyf/a/df7hrLnLQHnTDS2F9IRu+rpgJer
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

Extend mxc_isi_format_enum() to accept a v4l2_fmtdesc pointer instead
of a plain index, so it can filter formats by mbus_code when set. This
is used by the capture path to enumerate only formats compatible with
the connected subdev output.

For the M2M device, the V4L2 framework clears mbus_code to 0 for
devices without V4L2_CAP_IO_MC (v4l2-ioctl.c), so this change has no
effect on M2M format enumeration.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- New patch
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h  | 2 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c   | 2 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 6 +++++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 58b47335afc7..a30633a7e2e9 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -322,7 +322,7 @@ mxc_isi_bus_format_by_index(unsigned int index, unsigned int pad);
 const struct mxc_isi_format_info *
 mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type);
 const struct mxc_isi_format_info *
-mxc_isi_format_enum(unsigned int index, enum mxc_isi_video_type type);
+mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type);
 const struct mxc_isi_format_info *
 mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix,
 		   enum mxc_isi_video_type type);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index b729eecad0fe..1178947bb548 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -492,7 +492,7 @@ static int mxc_isi_m2m_enum_fmt_vid(struct file *file, void *fh,
 		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
 	const struct mxc_isi_format_info *info;
 
-	info = mxc_isi_format_enum(f->index, type);
+	info = mxc_isi_format_enum(f, type);
 	if (!info)
 		return -EINVAL;
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index f45c2aae59ce..0d87a1082727 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -482,13 +482,17 @@ mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type)
 }
 
 const struct mxc_isi_format_info *
-mxc_isi_format_enum(unsigned int index, enum mxc_isi_video_type type)
+mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
 {
+	unsigned int index = f->index;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
 		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
 
+		if (f->mbus_code && fmt->mbus_code != f->mbus_code)
+			continue;
+
 		if (!(fmt->type & type))
 			continue;
 

-- 
2.34.1

