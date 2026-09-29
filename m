Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF324CDDCE;
	Tue, 29 Sep 2026 08:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671747; cv=fail; b=X/PA4YSrW+DMqpnhpOKEW8BMyIZ2tfHpE2DtYivUmH4VTvdqJ6SLOL5IEobcd3l8ENGbavbvMJ9CtqCLp6OC2DNPQlv1vmEoOhl0VKVtUw7OOj/q0sNxtoRL3A7yFrHUun3OXIOUhLv7RX6EzrUlF9BzNPztwiizPOaMWlSGB3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671747; c=relaxed/simple;
	bh=8SFhofZWJ4jN8PWnhi/quLseYVMmU5E7RdJI0Voojr8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ABE+yrbe55YPDCJrZrazq6UR5Sgz/aZ9ANWOEPQBZyMDgO4VQcyUGkjUIe1DmJwlekvPDy7hRYl8jrE+LQf2uL05mF43PZmv7m6FQr+wk/xRiDoVsZrm9mVIAUtdwAPpb6Is/pV+gT6QdnGAXEfT3dRR7bXI/puwJLkne3CDM2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HcnWSTa3; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HcnWSTa3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqg8bHqFzZ75/WYFHFEbelpwzsVM5a518O+h6xLfHQaoj8nvjqTuwrs8H71jLFlGwpXnmsmrB0/5W7A2Jmt2tpWTiLTOKr5+iWjtuhIDQzrrzvoLKPBMXrXVdSENkTDAk8EnD+flvZDg2JbA6omwdf5amudRyNDvIjAMpennWEc1DdWqBWWbTWyEe19WOoS8P7NtLIqcD6JRMtKiIOubO22ji1t/vTJMB4pA5nhIQc4DNrmm350I/JnjL3B2Y/L7Uwq/uJv3PppNRU6K4Pd42tisPdPX0vy5OzF+2yfyqmxr8e3VheKDHTRLSILZI/cADKWsmi3pVtYSBeXYdZpeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oeyltPOAwUK19A521tLWDn4dQJLYRrlrHw3RP2SX2k=;
 b=sTU3GArMjfS7KcS+WRlo2JdvgCOK9FUeDAGXA23AliKgFwtY/9QEXF5iMEuyQ09a+A4T+e0Lh6j6P1nHitKQ9bfYemR5Gfn1l324XUp8UAudbFCVUVK0mcJXsg/QdkXhp4QO2bAAQ5YcbwmIYKZ1/L9axVFlqdFLupb/jwQTSUg4BwPayJ77fMA1o1nt0cU8ekmkR3y7L/yOAGdNP6pzL9Lj+PJd32EIcFAgdUXtpc7IOeu1DRCZUWHyMI92bdzGAXNZLZoUYds4sMu3cWsjPoes3XTx6s2E5Pwphz9ZAkRuUo/pINs6fBSiUA601xaOZrBW3HHgJIvEm8jBnxeWFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oeyltPOAwUK19A521tLWDn4dQJLYRrlrHw3RP2SX2k=;
 b=HcnWSTa3Ndg6yuchEuO5k1PHzmFCJs4w5J37lYbRYTLirJlDfy/dlVfn6i/kes0OsKwLvyGbU5NQaAVdLfrTLI8KngDf1W4bTqMvmrxJaDTq8JG5V+gtFKyRWa4bKPXIrzllCi8viCmZw3YEa/njkf//EbwDEtok7a32FeJ3lpwxWOUaUQH3TDh8M7bJvrvXWeuB6SHRHYst/Pq/n9Z5A8sBrvcsqlTHnd1JCYoJ/2UqbLhw0rgRiJimod77B9euVHPlBmbkXse/vK7/4NxTaGh+XIRARNUKyWDWn1Nevtv8PJVc/zUyOhm8HWs0LF7fW7R7DNE/xrdgOHcbTjYdMQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:48:50 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:48:50 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 29 Sep 2026 16:52:28 +0800
Subject: [PATCH v4 07/11] media: imx8-isi: Select MSB-aligned RAW input
 from pixel link on i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-isi_imx952-v4-7-e69f89c7c651@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790671948; l=3074;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=8SFhofZWJ4jN8PWnhi/quLseYVMmU5E7RdJI0Voojr8=;
 b=EkLmWrBROai4MD7TJ3VcpFhg+j4AmNGmN5L1O/ZIGEcYzSJH8riPtHNkS9xDo3pAVBN5fCuxg
 mBufttuD+9ADWFClEqCVEPQPEVBAALXlBa8XgtJgXpDlsSLTSz5C2a3
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0131.apcprd02.prod.outlook.com
 (2603:1096:4:188::6) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 831b7e44-c200-4001-2908-08df1e067be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|10067099003|11063799006|56012099006|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4YjFkyVG3GzvXqipZZTlIM6a69PA7MO5FjpYp8reptnjh1STjCmMqCWLmwURukV/4IdvHvm0rKxsr7KqNhClUP9Shvsu7szer38s4DRz0q3JPZ7GdzNhN6XfXaBGWmOd3eOdKmFmGWVNo8MJe14BbFUoehPyNzj7LjgYkc0psDyinVqqM8qrd7rYGza6ASQ8xfTKMTtaNyAKG3kiHWm2slORN2ZmHUs1CWHUOhHmTj7yW+PWHRGzrrGWaBu0FO8iTk3c6C4MixoRbninb1tqm4yjyh21wMhiSiv3AoONLHSqYVt0cdHOcUeDT4OAD6c6bZbFtQYm0nY1+E3iITI0M1T9rBrFfx3BW/7H0jxaFTck7m/tcYdF+p1rYsTFUoAI+uCgAmZ3l+XHYC2eMHJ7op+iM5Gbwy+IWDZMz8wfrceNOjvsDcmQPz6HHkuQZ1P95MkJfHc7yZMHbgIr3XFBRsCOxqQZvIZFRW+lV1DMjHAaMoF36yfAfM+rH3zsU3uR47gvQvhN4klbilqgt0TeOzWjZSS87N+3Wu8S9KHK7qYGNzXlmOOpsBqvYtju/r8TgJKo9nKvsVPAOKVMHXdhbPQgFpihAs9O8Wu1d5Gfd6Kg3CxOScr7dPvhMX7/yVQY5loWStgA7hcaR9O4d97P+kXlfqO+vZGfu2pE5h8WLoP0gp/0N4V3v5UWKmZS49yZpTJq23ZVdxud4YcOihUuaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(11063799006)(56012099006)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXBqbEJnSGhyM2VJSXZKMlJDS3ZaZ2luTmdQRDBDSFozYXVxZ08wTXlwMFNk?=
 =?utf-8?B?OXNvRzU2U0dWUDlLR1BMTnRiTEtjZFAwbUxMNWNDaWxPSHYyeWxBZ2lQcEtk?=
 =?utf-8?B?TjJvRWxDSUlTY0RNUFMxdFFqTkpuc20vZkZWQW1uOC82UVhHQTFxREt6ckR2?=
 =?utf-8?B?RXpSam9TSENRTW1sdWhkdUZRMjF1U1NyTE9Vcjh0MGdINmVEUEhCaGRoaTNn?=
 =?utf-8?B?bFI1ZmN5dnZYNGkvamZUdGFQVUtnbGppQ2ZiOTYvVGczNHM3cnpENGgyMzdT?=
 =?utf-8?B?UzU1L1pjTW10b0ROTDI0QmZwQTRvcHNLU2dMWTVaem9VWG4yeGlET3NCcFAv?=
 =?utf-8?B?SDNDN1NUTHlzSkpPZmcralhwWjlybVR5d3lCQ2pmdzBMS2kwTUlLd3BFZFdF?=
 =?utf-8?B?YXEwTmU5RHhsMFRkOHFReDRSZGdHdWdRNVNmcVRvbHlUaThIbDkrbWIyRE1L?=
 =?utf-8?B?cGFVcmVaaFdjTWZ1d0xQaFVaeE1GZHNuWHZPd2FYWVdXWXlIbnRMMnkxYUNq?=
 =?utf-8?B?c2VZcTFINEllb1RtWm9hSmpkT2NCdld6WG1LbnRFS0ZLOVdBVDBUZlhlL3VU?=
 =?utf-8?B?K0UvQko5cVcyQ29rMXpoc0t6M3V0eHhqRGtKeU1wNG1iYWQ1ZHI4RTRpT05V?=
 =?utf-8?B?WHU4VC9TeVNETCtzSE1mSDNidEdRL1FIdFF3L1FwOFBESzM2bVNwUHJJbUZB?=
 =?utf-8?B?TEhEdng0NzVZWURvQm0vaWZnRm1DdjNYR1ZJbVhCTjlubEt4aUVualNYdTdz?=
 =?utf-8?B?b1NZV04rNkNUOHZibU0rbFN2am5GRCsyZGUxamY4YjVKdDZ2c2dDNEhPMEQy?=
 =?utf-8?B?OTBRWnNtOUIrMWVCY2IxdVVmNXhyaHBocFJHYlBNSWZnMHdaWE9HM0ZpYWFl?=
 =?utf-8?B?d2d5QjlFUVE2VUJjQWhMeVRnQ2hyNFVObWl4am1LdkR3b0RKTzVpZnFQRlBn?=
 =?utf-8?B?dHBuOXV1WjNlbU92VGJaZVR2ckdkSHYwZ21xNlJ5ek5kTWg1TUtSUXdGVmYv?=
 =?utf-8?B?a3F1bTZSZVpWam1HN203bFlDRlpyaFpjenpYbTdjTmpHQ3AzYU5TeTFrbHJJ?=
 =?utf-8?B?QTJYY1hER2JjVXRQanVVODhDOUxmemVGbEpBQ3pUU01nRkxEdEdOaHRweG1Z?=
 =?utf-8?B?aG5aYWV2dkNUdWhyZ3pXaDlGUlNXZTRDSTVLcnRDZFRVb3lacmdqNElXSytC?=
 =?utf-8?B?U3dxWmVyR0NBdVl6VE5zRlBnNGU3N3ZkL1h4T2pXZUEzR2VZOXVzNER0ekRx?=
 =?utf-8?B?ZU0xaTlwUENIeHA1VGJjVWVnNkI0UzMwV1V1ckFNcFpYM0FsSkhUdU8vTUVW?=
 =?utf-8?B?bEp6K25wOTgrQlh3SVlxZ3FjcmxmdDhEYS85eEI0MXd5YTVLVGZDaFpuOXZl?=
 =?utf-8?B?QndoUERuZGIzYWZYdzI1b0RYTE5KZFdRQ0FnVWlFdzJLdkMzdmdENmM1a09J?=
 =?utf-8?B?aWJnMnpQaGhCelJYOExzQ242OEN6TXhhVmovQUU2dVc0MjRpbUtOdFdUbU1j?=
 =?utf-8?B?Q0libkF2K2pKTkZJSHVaUVdPa1ZSUS9ya1NnU09JWjJjOWtWOVhiMnpYUGM0?=
 =?utf-8?B?eEp4R0NmWkhEK0xaQUpES0FSRVB2OEVHeXJHcFgza3dpNEZBalZFMGt0emM3?=
 =?utf-8?B?UnBoRlZOM2VBUHdTMURURmkyY2V1VU1LM0JZdjJpcHNsaVdFQnROd2FSN0tD?=
 =?utf-8?B?enFrbTd2b01GWFJhaEZVc2xHSUNhNitTZFlDTmRCL0ZxSnpSTmNmS2kzY1ZN?=
 =?utf-8?B?WXRIODVvK0oxT0VzSFZpRVRlZGxWd2JJb1ZZN05JZUZ2d3pzYlNXS3pYU1Ny?=
 =?utf-8?B?SVR4T0pVWkVFV3d3QWNJWnROekRwZW9VUmZSOTJhK3NKeGYxVVpMVFc0ME8y?=
 =?utf-8?B?cnlham5Nd0dRK0hXT3ZsYS8zbG9NSUpGQVNBeWpwaVBid25jYlBDUU1wWi9w?=
 =?utf-8?B?S25wbnROM0xUSDJMaWFtZXo2Y2ZVN0k5dkI0RDhRTk5hS3VGSXFlTjlhNmFl?=
 =?utf-8?B?YURPSEJXTzBaOFZZV3BpUTFjd2ZUOWs1VndQbzJzekl1ZEpSbGJNRjhTNmVO?=
 =?utf-8?B?THd4WXpYRitRaXpvVnhJWjFzVFY4bHlrb1E3c2V0ME4zLzFBRzBxeVpMdnJo?=
 =?utf-8?B?L05rdlhrYUV2bkRqUjhZL0QrWld1SDhXczZiSCtuam5vVEFXZ09vZWJHY0R0?=
 =?utf-8?B?YklXblZJeEVUeDM0YlhrTStHUHJoY09XTDV3NmRGZTUvNkpoalZzclIydlIz?=
 =?utf-8?B?SHRrbnNqNm1lWmE3TGR1QnRSWEpnSUM0Wm5YVFpQRTlTUExwTTB0Lzd1RjBk?=
 =?utf-8?B?VVRncEw5L2gzOHE0SjF1ZlQvMldvdHNhVVRNRHJNWDdtc1JnM3pFSjlSclVV?=
 =?utf-8?Q?82Ov2L+iU8dSBx1KA4l61Sr9Ba1KocmKPYlwp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831b7e44-c200-4001-2908-08df1e067be3
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:48:50.8094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VbOOUUsfcB/vTTMUC0eQBj05di2tjjTiickQbRhix/6Q0o4Pz8z02u9sEE32AEouAv1FRemq+pvhPPr2CGQEiUDNv5VkvW+RP/HyGFdaWTUZudCSGRsB+CKx68YQ7peK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

The ISI receives RAW data from the Pixel Link, whose alignment is
determined by the SoC integration. Before i.MX93, the Pixel Link
provides LSB-aligned RAW data to the ISI. Starting with i.MX93, both
LSB and MSB alignment are supported and can be selected via
CHNL_CTRL_RAW_IN_MSB_ALIGN, with the default keeping LSB alignment
for backward compatibility. From i.MX95 onwards, the CSI formatter
replaces the gasket and only provides MSB-aligned RAW data.

Set CHNL_CTRL_RAW_IN_MSB_ALIGN on i.MX95 so the ISI selects RAW
samples from the high bits of the Pixel Link bus.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- New patch
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   | 20 ++++++++++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index cc52a90c2477..b3f32b9796d5 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -303,6 +303,22 @@ static void mxc_isi_channel_set_panic_threshold(struct mxc_isi_pipe *pipe)
 	mxc_isi_write(pipe, CHNL_OUT_BUF_CTRL, val);
 }
 
+/*
+ * The ISI receives RAW data from the Pixel Link, whose alignment is
+ * determined by the SoC integration. It originally selected RAW samples
+ * from the low bits of the Pixel Link bus. Starting with i.MX93,
+ * CHNL_CTRL_RAW_IN_MSB_ALIGN was introduced to allow the ISI to select
+ * RAW samples from either the high or low bits, as both LSB and MSB
+ * alignment can be selected in the gasket.
+ *
+ * On i.MX95, the CSI formatter provides MSB-aligned RAW data, so the ISI
+ * must select RAW samples from the high bits of the Pixel Link bus.
+ */
+static bool isi_raw_in_msb(const struct mxc_isi_plat_data *pdata)
+{
+	return pdata->model == MXC_ISI_IMX95;
+}
+
 static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 					enum mxc_isi_input_id input,
 					unsigned int vc,
@@ -357,6 +373,10 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 			val |= CHNL_CTRL_VC_ID_1(vc >> 2);
 	}
 
+	/* Select MSB-aligned RAW data from the Pixel Link when needed. */
+	if (isi_raw_in_msb(pipe->isi->pdata))
+		val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
+
 	mxc_isi_write(pipe, CHNL_CTRL, val);
 
 	mutex_unlock(&pipe->lock);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 5f66b7c9cd1c..35438abf3172 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -20,6 +20,7 @@
 #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
 #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
 #define CHNL_CTRL_SW_RST					BIT(24)
+#define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95} */
 /*
  * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
  * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only

-- 
2.34.1

