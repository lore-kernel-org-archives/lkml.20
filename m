Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6094D09FD;
	Tue, 29 Sep 2026 08:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671770; cv=fail; b=AU/f57WId5lASl45OTzKL2bTXQQhx2OXz8M7/pLW2SV+5x/TrjHFr8iHk3jcHnesj3bPGFcSpGcuH/lM0NT8FT1Ep4STYjFqETVel5BsEOMrNTn2o5PlFlERJyG8oBuaIEQb9X1Cg+RAwGIMCJ6u1JF6fP8gbhz84AcNNWUK+vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671770; c=relaxed/simple;
	bh=1MRqb1YiaHge5H0wv8+yp1JocKEDGEtajiMoYv2c8QA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FzD9jeuQvhGPDfvYr29LS7m1voqBOFExS1BFlV8v3WJbjD1y8imZd8Z9uwspR4Fu+JNIdFluFK0o7OfhE2SlbmGnwUoY9hQC0dkgLshjnZoSbZ6gsNfzwIikKKODbvlad8Qxw0teMjiZZQ11DHY84QyMYeEdKCTZGvENy0aVzew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fVxVfja/; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fVxVfja/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEe2Xka5yz5xbhU9G+TgEQdfMWnwuLCkEdkqoaDFK6Enfw+IJcyEh6+S0FnTZx3wv7mvt97LZQ+QIqi96/t7095hn5Xysl/t6qcZMBbAaSojFRwrv44Ej7/NiWY+JnjpwJk/KkXsMw36atmOKVzR4oWCu4VAim7CXj1u5yejxn5zdKsEEBHFSd7U+rC8cVx4Pit8JvPRnnMrbiMgv45JMn6Le8THW04gXKyRs+eQllKcl7I5/+O5Ddd0o0+NO9H/WYs8fyQ2aLHXBpzMF2YOwlNCk1NFRXZMDIT5YDmkfh/VxBgijlH/v646kEh+vWK/qzzcROpoRmGnncwRtrLemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTM2ml87GANpH1InxOPaKgm8p6p7ffmZA4E57DYrb3M=;
 b=XSzXk0m6BpMTqG7vrpClb3AWV+ioRE33diu2HJp0Yk5Aekx77VeD7mf0bcb4i3QU9KPDV3fBZWb85hFUVd2Y7TNzvl2p6n0GBHUhl1j11es/ImmUDUUOe+KqCxc55rm9AAbUxmM/o0i4ofWK8mJy47T8coySTFKoOPzrGPdsro/zxBR73e9+AWhXI17foOfTGlF8DJUoJNZTGo6taCS0N7EUYlfQUJkBJyCUuRZSYklHZdvOujCYjJaHjJD775wQ8NkTHOIjHoOkNhgQMvdTYwuNuBdaNlAWWvQXJtdIdvO9VE59K0bN3+uVkTV9xK8V8L+VdvpDuFjF1kluFCAePA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTM2ml87GANpH1InxOPaKgm8p6p7ffmZA4E57DYrb3M=;
 b=fVxVfja/ykkg9vPaaiIHVdOdRZKOxfSz3ieSyRZvw6HkHVDMFX2bgDzNQciGJAKvNfx6qxB9FBZS5A6Gb6sQU2f4cj6mHxY8eiTVP7bX9qhDGXQgYXqsIuMstattW2xhLRS5+9f/90L1JWNeR23er0OQM6FoZTgKOhBdBqRoVvZYSsxz/kuEG3ZNmTKrNeor9u/LXMMMPtwJ1h9php1kwr9qrUWxyRh/LFJ/edgwbDB+se8TuzcsgP5WZyYp/d2/PmtjY4riqzgQHZ+F8DmtrJUbsbOvidGeuo64i+ZrNaSQUnRPQn/MDtbFLm0mqbZdxqB5TzqWg9CuA+CYxUKOHg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:49:09 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:49:09 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 29 Sep 2026 16:52:31 +0800
Subject: [PATCH v4 10/11] media: imx8-isi: Add i.MX952 ISI support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-isi_imx952-v4-10-e69f89c7c651@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790671948; l=2995;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=1MRqb1YiaHge5H0wv8+yp1JocKEDGEtajiMoYv2c8QA=;
 b=XwTGqtIL6+eW1XLquZfkhuCtpeVNtE1z7g4/xaqNsMtxTRFrmmL/peG0zHfaTKl1VdDKT/Ul/
 VL48kkETyzAD4B/I0oFQH33mgkfotK5tRQvePqcbcSgdouEo60DAAEP
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 7906eae1-c631-4846-4207-08df1e0686d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|10067099003|11063799006|56012099006|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8OqgE4dkVxmkc6PT0ZUp2+4JLpD2+nUmtto9HSSPRfDsEX8V3AqaRlFdUmk/HqrRj+EM/OuMRBHA6RPVn4OY0IpMUAF2MD/+L1aC3uj19IGxYi4geWj5V7y5pduvIkecY+CHXX10on2C0OpDRfYYCVaHtvr9mNgpIJUfAaZM98iPPJTB2jPp8dumDxWZyQ+bEb1EoiEym0Jjx5rGq839QdFpI/Okvayl6MQN6VLsteNdH/ct9ekisA+dNo1o55aiiZOFZmvpJ8sP14sU44r84LJAV86Z12uuyYPWpudILS88a1luKtvRpBc47+2vgMvwjNjG1FaQfSmlwWui+us+n1eQFZIni2vY+o+ZoSU/PHgnaWX7yX8JzvL57wE25BZzTCecoij0GJMULeeRWWq/CSHoHnZFlE5l9zx+LQaT/uPvVZ6OYZG5+SbI0mkjO4oqfw/W82D0JbIDU8hF7TM5dH0puvjMOJ/4R8Pwd2+CSshKCglodffHPZpq8ce+g2dcG0S8m/oFZSkHfPhPdzyP7h2NSw8oX8QJZ34NuFSXRn2QgjNl2xm1aA+JHPr9+vasrBnrTEVehryoRskokjO+tkdvLZ5oytpf7lqj2dWvrtB9BmL8uzuTlNBb9hElgX2y+IprTJGrsxrqgT8jgGdlIcxwZf4i2/7ysVTYT8f/EfYJPa+882YFV8WKrt92KaZr4qrU37nL0xxUP6H6cSztJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(11063799006)(56012099006)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RURoTFhrYlNLNjRpS3owalVDL3JvQmgrOW5XV1ZIYkN6Qm84UXIwREMyK28z?=
 =?utf-8?B?TWNodDltRXAyU0dMeGRzbTJiMUR3a0psMVhReDdiSUFua1lEUEpyTWVQT3lN?=
 =?utf-8?B?YS9paDVIUGJtSzZhUHd6UXptQkFxU3ZESEk3ZkFsNEt0TkR6Y3Q5NWtiTVNP?=
 =?utf-8?B?a2pBb0ZhaVU2Rmx6WEw2cUo2NHNRczFldWc3SWpnb2ZhQlVXU293dTNZQmxF?=
 =?utf-8?B?UmRnQzkxQ2lxTmNoTWt2TE4zUVVoU3VmUkxxcHI1NDFYMkRyNUpuYVhOVnJX?=
 =?utf-8?B?SmdraEQ4ZG4zRHlWMDZaVFA5M0V3N0ZLK01nNkR5dkRYZ0lJU1dzYzJENW5H?=
 =?utf-8?B?cG5lTGZMdUh1bFZ1WTVxeHlOU0E0a05pazFnbkhKVVRjaGRSeUt6TTh3WWx6?=
 =?utf-8?B?WElzcG81ODJsV0hhbWU2REZoMkRicWp3ZEJlWUc0c2pXTzJ5SFlmZGpKa3Bk?=
 =?utf-8?B?S3BsRWF3RHQyZlE4YlV2dUNYRlRzaVJqMU9yTHpMQlc1cG9tTkVVbFZSbWhz?=
 =?utf-8?B?ajRQKzl3ZmovZWpnMjVGemwrMWpLSlFoNGMyZURqdVhIaExIeVJHSmZraElq?=
 =?utf-8?B?bmQ0OUNvQXMyTURLTS80ZytPc3JwMXZ0bVZxMFlDcHNUeDJLWFpld1hreWR6?=
 =?utf-8?B?VXJjQkgzRVMxM015S0R4QmRiRkZNMXVudXV3RTQ0Vm1vTTF0WWlqbUFPbmZM?=
 =?utf-8?B?OGhIdE9kZ25RWjhaM0o1a0VGczR2aUZxZFNzZjRvK2tVdlNoSzFCQS95RmUw?=
 =?utf-8?B?d3g1WDJvWkpiL0kxTldYSnpPVDF1UERpZkRJU1FteSsvd3hJTncvUTdPU1Rt?=
 =?utf-8?B?c3lNd1JreXAwc2p0K3FqOWphQk9COEtsYXJ4TnkrcTZzUXFYL29peEpBb2l4?=
 =?utf-8?B?M3dZU0NxQVYwSE9zS0pHdTZSUXpXT3ZxQ1I4dnR0Y2Y3NktwTDVkOEFKVlNS?=
 =?utf-8?B?QjFYZUNzN055ajlXQjZTcGtIdmVtdm1lOUlUN3prd3J3NnI1anNDbGdMdXJs?=
 =?utf-8?B?YVowUU1XZVhDNTNBbkJFQzVqS2FWL3U3TklrempXMkhOT1BUVWFaaHhTenBy?=
 =?utf-8?B?OVlmMFAzcy9NZnkvTTM0UUdqZjNucGtoYUFueTNZem5sU3R6cEVsUEUwa2FB?=
 =?utf-8?B?NU1UczRlNlJKQ0xCNStpUUY0UmhuV2V3NkR1SDVlbjU4UC9OT1JsTHhlR2tz?=
 =?utf-8?B?d3dlSnd6RzMxa3hyZnh0ZmNTeVF1RVZ2MldmR1pZY1NLV2hPYVFWeFAycUlK?=
 =?utf-8?B?MVNpNkZPSHp2M0hkMFhmdGxtc2taNEovNHpYVWU3d3RZYzFqcFF1TU9yRkJl?=
 =?utf-8?B?V0NNQ09lZzRmdUxBb2VtRGdiVkc0dlFlWW94QTZDcTUzbDJDSllNdnhObnMy?=
 =?utf-8?B?UjRWeko2K2lVNzFNK3dYWmk3ZzJObE1raUI0T2NJTmFuOTkxamZyRmNMUEZa?=
 =?utf-8?B?a0VRQzV5UjR2dmM0ZmhvbVRDT1Q4L09zNURyYjhhOFViNjA5ZldoMGhQb2w1?=
 =?utf-8?B?MTVBTWczNnp0RE9yL2w0dUx6dzhUSzJBajVJQ0J5emtOZmJNSEJGMVhTbmZK?=
 =?utf-8?B?VTM4WWdkVXFHeE1FdDdDeDk0YjRjTHUwcGxRL2dsdERvRkd0SnJCYitPT0tS?=
 =?utf-8?B?OHpFdGFVajI5WE5JeHpUWUlETGpuZFB4YkRMemViaVJsMU8zdHZhb3RweVFz?=
 =?utf-8?B?cTF2d0FMaEFVb01UWXd5T3p3ZjY3WmcyL2F0WDRGaHV3MWxnaDRqNFFIWFlS?=
 =?utf-8?B?L25GbnVQMjZNdHh4VGt6UzlwbEFGYjR6S3c0S3dFUGVtVEw3L01oeGcrNlI0?=
 =?utf-8?B?azYvZzMySHJhV1huN0lGZ2tTWUsvZnJWYnora3VQOHVCc2VETVlQZWxBVHRn?=
 =?utf-8?B?ZE9KWkx2TGRTZlBGWENBeHZha2lSMTMxMHNPNDNDR0NnSHJmaVRqZmp6TERv?=
 =?utf-8?B?NXV3c2NQdVFtZVZmcC9uK1ZVNmwzZXRibGoreHlUL2dqdGRDOXFGOVVtVy9C?=
 =?utf-8?B?eTY1dXdFTkVjMzhSdmd0RmF5cWYvSEhjbUxBTGwvc2lYSUJ5MmVHMi80ZldW?=
 =?utf-8?B?Ny9JL21JU1A0M2dOSkRhVGJPNk1nemx6TmFYMUJrc0JneEtTdzRvSnZTTU8w?=
 =?utf-8?B?MFZRajM3em5SNHhrZUwwRWdyeEczTldzK21zd2puZFJwN3hydXNDU3BDYzM2?=
 =?utf-8?B?U2R4d2phY24ybG40dTBkMUxTOURmNkk1dklSR0l0dmdBSUJzYm10MGVoMnpB?=
 =?utf-8?B?dUlZa0orR2pvSW5BdjgxUjlYN0lGQ1pmM1dKWXBzbkVuVTRwODlQQWs2Siti?=
 =?utf-8?B?NjRGa014SUVjSnRJcGZUa2RQdnVMbk1CeSs5QkZTMEpQK0lPbTd0RlpsN1Vl?=
 =?utf-8?Q?XaJhYjREVkMezI3C47pWXUKrzHOEU2S4zwMzf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7906eae1-c631-4846-4207-08df1e0686d2
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:49:09.1623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ke6kInws4aDFWvjNyGaQ9ePMBf4r9OdfTk4RrfYAfZhfx2YddWSxMDpPfKiGpNgBSexKFNHQG7/2F0iPJGxUsB2y0wYbaIYburgFr97iqrIXjVJDO6322l2k2adEoEdL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

The i.MX952 ISI is reused from the i.MX95 ISI with a minor silicon
revision. It can process up to 8 image sources simultaneously and
obtain image data from up to 4 pixel link sources.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Extend mask globally instead of per-platform (Laurent)
- Add Reviewed-by tag from Frank
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 13 +++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index f2a8eb82fbfd..bedf8515b1e7 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -384,6 +384,18 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
 	.has_36bit_dma		= true,
 };
 
+static const struct mxc_isi_plat_data mxc_imx952_data = {
+	.model			= MXC_ISI_IMX952,
+	.num_ports		= 4,
+	.num_channels		= 8,
+	.num_vc			= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= true,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */
@@ -574,6 +586,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx91-isi", .data = &mxc_imx91_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ .compatible = "fsl,imx95-isi", .data = &mxc_imx95_data },
+	{ .compatible = "fsl,imx952-isi", .data = &mxc_imx952_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index ba0d6df98fd4..64e6961a4ea4 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -164,6 +164,7 @@ enum model {
 	MXC_ISI_IMX91,
 	MXC_ISI_IMX93,
 	MXC_ISI_IMX95,
+	MXC_ISI_IMX952,
 };
 
 struct mxc_isi_plat_data {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index b83a25a58ebe..d2b8a26b7c21 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -23,7 +23,7 @@
 #define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95} */
 /*
  * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
- * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
+ * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
  */
 #define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))
 #define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))

-- 
2.34.1

