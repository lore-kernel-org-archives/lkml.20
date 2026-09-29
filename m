Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165714C6526;
	Tue, 29 Sep 2026 08:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671741; cv=fail; b=ljoh3e3haWTwQCvmi3/n85cgkXxzIZfeh/HuyuQdieY8sTPgDKVtWaI9qyRnIox4G6HMzWOgCGRyfSUwU5ohDQSiUbSDZHF2rAYDHXzSBiXpiID+yYcyiJNxP3eNILV1u0mNzoX7Qsu8tDwo7V+wGEduzsrPE8ua39vXvbs5sR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671741; c=relaxed/simple;
	bh=wdOiqrF1X43oiBwIbfof/EatI6Sfq0gOhaWygbF/Uys=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=id1f0yWHnmxxoZ0KHFUg3fU9rkg2N+0nfeXi0284US8dOi6f9Hrs46E1WQLfk677A7J2+/2PGcV4cpvyY4vN4mAcCtLmVzrrubNvpScyRDvpGUhfUuVkQtK/LxHGlBlfLUfhxbQ2c176zImgMMR2FDIjxV7DjF9bcyWhliKWBRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bWPkWRIb; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bWPkWRIb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwKN9HkVoPdTRr9B9OWytkwWxi6B3RiWQeFxBcaGSnZEsaRzTkU8hgkvAqEcV1AhucUqtmZMCYG0kdH6n1clR6aE1nU8PGKCHVdRBZANvg1gP8jD9CkIthVgXqGZ9l5xIm7qweHyxzRTG7tZgQwN8DgHQ/I842CbpxHZpBnL3xNbQCcjt9SalfCMdRnveKZ3KAdwOSaYw9GyfLDk/AGdCnpE8LoMUYY+/NYGwMLn5cFYPl1tnQ3uaIbnR4Ck7DZ0KY8hA7wium1DGaxTehV21PEMs/QGu1pDflmUJz4cJKyoDdYHJCektLBhs2mzNdIjEVq08tvFtIE/JMRKCoCacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TzJSlGBBT5pNKKTB7YG/R5hSjJpR1x3miUqYmi5+Fo=;
 b=bIwthtjwsZBi5R0QgEygIL5ujdXCAu8fMmfIYbsbvraaz3cX4E/kIzmrKNtkfKgr/TUEvS8kZ8/buQVapDXa19JjaMm+RrQdLSAhp04HkLIinsq5ddW/ShTTLSUljA/2AZZhOBoLYzC9shKlrpqgeS9j93e+hY96sEuikTy8b+IqAgr3qzOOEuNoYR+47c7Cocv5iTG5emQ5hE1pFSLWXC+p8bifGhOyUgyVZh1DEQplKTQaRHPl+Q2seFr2NVWVnhyFP5p81mca1Suj7FA4E4ApDrUVRs44IZv2WOiVJEjImMZAWnQe/ENgMbz/ID46U+aJGZUVIstnMltNjN6rQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TzJSlGBBT5pNKKTB7YG/R5hSjJpR1x3miUqYmi5+Fo=;
 b=bWPkWRIbe24H/a4OMkgsiKhiX1h74de1NF6h1frnVUvxt9PnUVz3mXgTOO74tsNaqH/Q7FLVbfpDjk+Pcnep3UswufwuaIz9UmfjsxDY/ttwGg7K9uB9YAD9HSx/jz/g265LojBTnmxYJ+JccBbBFSiZidl8+oK3oTIVy1G1om1gKK9ME+SGq4Ea1+9m1gqtx8QKWJ9qvYW9QzKuuA6aay9daFfFxoMdJEhervkh7O3IdkDAV825OTCJI4d7A4kk4vGkB+9q7n5zw61UlzeOYa3EJ01uUFSFnUfs3l5hJsBgT2rJ8WrT9skhE3HUVHBgALbUaJIu4PzJ+09LXQvXrQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:48:44 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:48:44 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 29 Sep 2026 16:52:27 +0800
Subject: [PATCH v4 06/11] media: imx8-isi: Add RAW14 output format support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-isi_imx952-v4-6-e69f89c7c651@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790671948; l=3683;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=wdOiqrF1X43oiBwIbfof/EatI6Sfq0gOhaWygbF/Uys=;
 b=4I3kuxri8HrUmTgZGGVne1vhEUe6ehIXGC0kubruUGsBN2GY3HC2qHQ0R/kCur8xin1YQ2jk8
 OfkXLc8utjnAzJn2zEQxEeqoGR28GdQFnhMA1EX4rf/eGTPeWuoMUMq
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0114.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::11) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 0728bf1d-92ef-407d-3e5e-08df1e0677ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|10067099003|11063799006|56012099006|921020|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IzLQ3vFXW/7JQdyYE1My2HukmSwgbpTGpXZR8iOEhd6PBvrBQ+noxZl0xGKc9LTFEVSWMDFWit1WKuzOHxj3ZZhet9Y+eRy8lrHHatzf2CffCDeWbCTG5sgHwEIXsQ9iDkede11g/vQTLnQeB26Ef6ko/Vu3wjX83+UQpaUJaylKm8hxPeSQj8W4Wb0vBkl37LQOqK7c3wryACFjGglihubjabKv+wru8UyJdOB/JCuVU8UcgAHikzbTSwu6OrAYlavHM9K1mGjj68b0o2aYaYgTHm/f9o2dbpwF9tcfwerke+1XuaxDcyiK3BdxybBEU/cFO/zvursXqyv4BTISr6xyG2ieHeM+ZdtWclixGZ10Pevw0b4kjXkAXj1+6XKuaDB4TF4oES1RmyW0BwSW0yajhc8zpGBbTxSzy7Lo496A/QF6zZZJ/H3+8EWnJeLoihbxHj5Y4pIJnziVN4dfGyC9+67u5Nx7W34oai2XQ3YJMI3SpFSt9UaiRMMLwEmM0RgfRbwuguZ98io9PLCodB8lNZHaoXjTxz0R1bzPxnjmTlNKykgtQy6qw/vPqTYvgmRtGuSWnQPbTXX5I/NP/6QE2eD9S8wszZF/MiATxu4QRM7ltRsf9yyrGP7E7WoXpnlbgGOPVaBchfZ650xw1X4Dre8jiytTk6nizf2lborS/qfmM2CFrL6u2GHaBYVuKBVKPesU6fnRxkFYYBNKWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(11063799006)(56012099006)(921020)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2hqWFU1d3Z1Tm9GL2hqMkdTV3o1TWZ2TVRSN1RCRFFpVVR0ZkxuS0xtS3ov?=
 =?utf-8?B?V1BiaDEvYTZkSE44MndTcGlPV05FYUxtUUVtMU52TU9JUXRQYU1mcHIxQ2xK?=
 =?utf-8?B?QkkxOVlsV2l6Nmd4eitpQjlpVjFxd3VBUlBpWkRtYlpCMVlTVWtxNHdzVm9v?=
 =?utf-8?B?US8wektxZGR2V1U5TCtHQkNsbVVYR1FseUpXRTN3R1U3ZXlRT09hTnROeDZY?=
 =?utf-8?B?R201N2kxUkRyNU9aYkpXclBaMjRIZUNXYzlsU3pYQ3luUnZBZElxZ29EUUJF?=
 =?utf-8?B?cTlNcUJidFlrckdmK3VLSElnU09pYUhnVU5HWDEwU2FkczlLZHJ3RnB2T2p5?=
 =?utf-8?B?eVNOSksyTEJNK1crdWR6dGxvcy9qN1V2M082T0RRNHlGdUhnZG1MN0RrTXEx?=
 =?utf-8?B?eE9SRTh2UkYzSS94ektwSnJGTk5DeEVveUNCaGt3OTQvYjNyUDIwWmdBaysy?=
 =?utf-8?B?MlF2cm1MU3hDMUYwQzZIZXlXMzJvYUFpc2FHU25IWFpDWjBXOWdpUTJ3bjh1?=
 =?utf-8?B?a3JPNkNKSlRLb0pBZXNzaHh0L3VDWk9CQ0J0RFJYREd5VHo2ajhEbHZTNUp0?=
 =?utf-8?B?REpHekxUWjdUbzdLMWgydGpXMU1PRWRqM3NNMjdDUGJMclljM05FN2hpTGFr?=
 =?utf-8?B?c01COXVpMHhpZTl6YldLc2FJcWpMVGNwL285Mng5aVVxT2w5d2lLLzJBU2Iz?=
 =?utf-8?B?aDBLeVdGSnRSUmNsZWNQMW9NWk8zTERmb2h1Q2FkMFN6eXhwSU4vRzh1ejQy?=
 =?utf-8?B?L09OK0J1R0pzMTRBeE5QQThrREI1RmM3YlZBQllVYlRndDJLVVlLZWNodGgz?=
 =?utf-8?B?NEZ5eEp5OGJWYUJ4L0xUUDMzR01ST3hmOTVmZHlpZ0YrQllzK0Z5SEl2Uzkw?=
 =?utf-8?B?SUgvMWw1a0pYNnkyR0tBNHlpZ1YwL0owTFBWM0NiSGp0aEJTcVpQOC84dUI0?=
 =?utf-8?B?VUpTUi9LZEwrbnRmRTdyRG9PRW55MHZyV0tEckFRQi91SkR3dTIwVmtHZVN6?=
 =?utf-8?B?YlNCQUNDT1BwRmhaRGkvaDNuUk9YTzlrd1dxTkZ4bGNCTm15OTB5RVQ3MnZJ?=
 =?utf-8?B?S2pKNXpyU2RwRGhNQUtQb2ZQOG9DSWRSUUphS1Q3Z0hZaTZVaDlaSUVOTlp3?=
 =?utf-8?B?N0U3cXZPVnhkWGtWcitDQ3loV2ZOVXRqa3RrR1U2ZnNPaFVSUDhVSGUvRUVa?=
 =?utf-8?B?UTY0VjlBL1l4cDNmQ042RW9EQXpYSVJmQnc4SWZLRmh4V3dWalp0WWphZHNa?=
 =?utf-8?B?cnRkaDY3YnovUGpPL2VJRG1BZ2g1c21VREJZaWZZS0oreVRlZEQwaEV4cnhZ?=
 =?utf-8?B?YWZSa1F5OEJNV0VSS1pZSjh4SEFaNTVsWWpWblMzaG04d093Z0hOd2QwQ091?=
 =?utf-8?B?QXRDNXpQdG5WbHZ4b05zbW1CV3NPMklOSmpvSENXcmIxNlZtdTJIa1hITitS?=
 =?utf-8?B?T3V4dER0NHlRYjY2cUwxdHYvVjNlMlJ5ZGtUemhGN3NSbXNMNXVrbGVRV0FO?=
 =?utf-8?B?UjFUY1UrcU44M2tSbVRFaUFqVGFsV3laWTJLV2ZZcnZkVnpUaTRmOXU5MlVh?=
 =?utf-8?B?N1BlNGJoYzBNVGMzbVV1YTExYVY3VDJXNWV1WTFRZUZyMFowNC9hbWlCaHJC?=
 =?utf-8?B?SGxpU2lybjFnMUhLQ0U2TW5sYzJUU3l4eDV1ZjdSeUp3TUgwc1o2ZUhRU1l1?=
 =?utf-8?B?VWE2ckphSUhHbk9IcWNmVlF5cktoeFJNSUdaSjc4TjhpYmdYNmFmUjJzb1BD?=
 =?utf-8?B?bFMrZEUzOTZsd2RqOExuQmVCNTNpU2h5RUE0c2RyYUZXQWRHdEtldFBGQk1P?=
 =?utf-8?B?bzI1NGlqcWpoUlJBRndoc2I0RUhLaDNhKzc5ZWwyVnd6dG5malNUQTlBZzdr?=
 =?utf-8?B?M0xsa3h5ZXZDRGgzRjV3RjR2a0pFVTVrOUVNdTNvNEhodnViQzRRTGNBbEpw?=
 =?utf-8?B?ekhnK09sRG1pdnpJUDlXNXBwZkF0a0xwYTNSS3hGbzVDZ0cwSUtFdXJxenQz?=
 =?utf-8?B?VC9sVmJUeU43cE1ua1VabjJMU1RHYVE2eFBVUTBjMnB1Y1YzbW14dTEwaGVC?=
 =?utf-8?B?cHYxNjI5dG1tRDE5eUtrQTJmcGFVR0NvNnBxZGtTU2pNSlZsUGQrQzRDbUFK?=
 =?utf-8?B?V1A2cmVXeFJLL3M0YWxUVndnai9FdGhWNkVyai9nL3pTR1E5MUt2eUMrbWtn?=
 =?utf-8?B?SWtFQWFOeTZ0b3BsT2d6akw2dXFIa1d0R1ZtVFMwN2JoUnU2SGhUNmpZK3VF?=
 =?utf-8?B?ckxQT1VaN3hwb3dXN01FeUtpSTgreVJyU1RJdThXQ1Y5NUl0NmdzbWlvdmxN?=
 =?utf-8?B?V1NVWHBmYXpUTHgwbmZzeTBIWExFOTNBS2dKbExlMVg1bXhBNTVRZ2NPZTlh?=
 =?utf-8?Q?vMZdXLA1s8QsQrllf+VbExnIBGD6fQx8hu9v8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0728bf1d-92ef-407d-3e5e-08df1e0677ef
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:48:44.3101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYqVkcjTEYOgNuDjat8Az6lC2IiOrOBDUqhX8Iw3wu3hcC7nY3X64BpZmXAGar0j+0QDwKDXSmQDB3VQV52XlWPzUePq+IOScbh7YZou/3i9yx07rEu7T2L5Cg3zHZmC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

From i.MX8ULP onwards, the ISI added RAW14 output format. Add its
register definition and use it for all 14-bit RAW formats in the format
table instead of RAW16.

Include RAW14 in isi_out_raw_shifted() so the RAW16 workaround covers
it on platforms that lack LSB-aligned RAW output.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- New patch
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h  |  5 ++++-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 10 +++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 0f3ada30e71e..5f66b7c9cd1c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -89,6 +89,8 @@
 #define CHNL_IMG_CTRL_FORMAT_YUV420_3P10P			0x3a
 #define CHNL_IMG_CTRL_FORMAT_YUV420_2P12			0x3d
 #define CHNL_IMG_CTRL_FORMAT_YUV420_3P12			0x3e
+#define CHNL_IMG_CTRL_FORMAT_RAW14				0x41	/* i.MX{8ULP,91,93,95} */
+
 #define CHNL_IMG_CTRL_GBL_ALPHA_VAL(n)				((n) << 16)
 #define CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK			GENMASK(23, 16)
 #define CHNL_IMG_CTRL_GBL_ALPHA_EN				BIT(15)
@@ -431,7 +433,8 @@
 static inline bool isi_out_raw_shifted(u32 format)
 {
 	return format == CHNL_IMG_CTRL_FORMAT_RAW10 ||
-	       format == CHNL_IMG_CTRL_FORMAT_RAW12;
+	       format == CHNL_IMG_CTRL_FORMAT_RAW12 ||
+	       format == CHNL_IMG_CTRL_FORMAT_RAW14;
 }
 
 #endif /* __IMX8_ISI_REGS_H__ */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 365057db47bd..feef79b1b718 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -250,7 +250,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y14_1X14,
 		.fourcc		= V4L2_PIX_FMT_Y14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -376,7 +376,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SBGGR14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -385,7 +385,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SGBRG14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -394,7 +394,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SGRBG14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -403,7 +403,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SRGGB14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },

-- 
2.34.1

