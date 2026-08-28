Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FF544A416;
	Fri, 28 Aug 2026 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919800; cv=fail; b=rTmQGoGjdHHqni7o0eRz/CUtvX7w9IgVlFMwfgJjtNSu4zDgrOd0odxTF1tlDHweA8UzyZwor9GH6C+b4/WPsubYFSnX3KaCs72YfbsWbRz4cFfkWLIjz53jSLcahnq6Ig9/r+ePmxoX3Z5ygg2EihABpC+pKsaW7VhZsURMmL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919800; c=relaxed/simple;
	bh=JhRQB05zK6yc5rFyqjJorB3+xJKBpn0DE+yDm9bBmhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uiH+uUs2g/CtxJOR8MtqGD28sZJg57US7XsSKcq4k0ZnaYPoh4iSKTt1ncXcvNYcUCdgw79uzN1K5cGTc1JHXjGZR77W8fd9nF05G7ReIkXpezE502fQSIc5M8q8lM6tlWr7lYtW/2qxjbCiBMzwPS9v5/LEpH3ZDihXYO7VybQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=s+Mqg+RB; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="s+Mqg+RB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDCd6qzV2oVWgFlFDoKEUryZfQdGEYSRJTv5D2v37pZXsPEy5TvW7iKKAT1j8KQvfpRVjqy7YwzLK7rJH64CyJPOI7lyRPtdENyEqxqXJB0RZaqbins/w0nIqLayL4Qzw76Lg3JTIMG/HYoAFDA079z5MOTfdX1P85qsYFlvrCMACyxI3znWVVYB6uFHb36P/AFzjZ88iF3ak3NduRRBcc3iYa4z+aKnvqd7NO420MnoMikqEKeiTCOTIYUMYYBGmYbSVO5NT7wa0Wcsk4MI1+VXRS3U1DfnrdlmEH6vCiAMR3v9ClQQlAAQpAkIyewjPSoqrHz1wArCHprwPq1PTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k80q7/sR4lCa67DKtN5EQw3FWsjfwoAymTUH4Ym8+ag=;
 b=ElqyvQowkD2ZK4u0w+QwEfaVyn5Du7+BFU+PqMe6GXwfyVq3ywPXbyaxDOBbeAzeuR67rkQVAiH/kC/sgFlDNVvSs14k1sJyMFUd4UoRBunGwKHT9AmCC8vQaT8CCaHi3cpMYOCjritXvBIPtmsemwdUOU+quQO8322tKY3uk9tkwRLONby/0I0D8j0FhZ9/RAFvjzWEtRtS4mQKHsacI9nBWQUt3IqPpoHYsunIKMujhS56C63HvNYjGUBwi38QQvbgQwSZ9P8I5vN+UVNYXTCEHBNxrXxGeHzzn962LkKMZl0bi/s9GsfxsVTpgcmwnRkfvr4nB7/WXl3kqpv15Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k80q7/sR4lCa67DKtN5EQw3FWsjfwoAymTUH4Ym8+ag=;
 b=s+Mqg+RBULl4tSom9wIC5x4lMpTdpn50EUf2F2ULsRGAwfn3I8tzOZJkmhVQQB8CX5FcP87MjQwn4R+YDk0+AIG94cjjoLm3KFV19HTw1fsm/Td93L9vJdLJ8Pw0D+PuufT2G837Z2DmaWuEWNNJdDPtCHIkhNDUqADG5Me6V+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY6PR01MB17444.jpnprd01.prod.outlook.com (2603:1096:405:360::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 12:22:45 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 12:22:45 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 8/9] drm: renesas: rz-du: Add RZ/G3E (R9A09G047) DU support
Date: Fri, 28 Aug 2026 14:21:11 +0200
Message-ID: <20260828122113.1426778-9-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260828122113.1426778-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260828122113.1426778-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0311.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::16) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY6PR01MB17444:EE_
X-MS-Office365-Filtering-Correlation-Id: fef01b20-0b43-409a-ac81-08df04ff106d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|52116014|376014|1800799024|366016|22082099003|18002099003|5023799004|56012099006|11063799006|3023799007|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	2r9U+z6vBw5dlgIoAxA5FudWxZ91hx5giq794t1EoEToMIe+xfLaoE4Ec6mcRP8VYTzgKwzSY/lXfMo/EdFvVcNi4C9EqMbKLHCPaliwXtRg0HnlXgcN6iG9b+ZhGcoV37iEMejxsDlDmVq3ZxFg+Q4mds3xRrVpV0aTPWRFi0vE0/8bl2S2z6DU+H0RG+l9QL3pn0fCaVaIpuKymSH1tJP/tX6vd03bccU0EOaOSdxzrtaxq+I+i4OwDevu+tV2RZ8vn3DWnY+BNRdq7wD4wamRtfcOysocSdCwZ8VU83dbwaTsSl+yHJFfgk80+SNQFXMwfuyo4h/Jt5RTvGRzVo/im6XZmNGhUq42b6GMZzi8AmcMjwbUIPBioSpaQf5wIfj8s1kWjGXDiDweqvlIGPLuxw7cw6JQu4lIW+dU9AosH/MY+1/nBcBnYp+T8KhMWKTumVq/6xq/g6/zUCk5t3HwOwmDhHyWBGXRBpf+uReP5ku7TYnoEgKRCyBmnb2DEU320/Ql3i+BtehFylZArTyNKRJCQOxhcfNTKp9FmbwvWMvv2xCpoK0dc0xV50WOJShELT6n3EgCMaElucjFdjhJgVdieyEfVFT+wWI9IKLiAbAJUaxuR4sSWaGF6yOj9lwBIxOZZZ79G0tvjKOv1Bfikm/wYpY1WsJxqiiVyWV+0I5hFkAzAbuCuxGlocnsOdbeCcUtZ8ANCvFSoBGU9abxk8K7OSC9CoGRW6DsRG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006)(3023799007)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tJtmtPCYyfX0uDEy8mF7Yw8mLbpcuKjjw8tgkdZx4BfzpDkyosuh9Cho0+gx?=
 =?us-ascii?Q?OtT9E3nfRfKePlH20ZtBkxGdf3K7PRQrpQWO8KDQw1m52StkNG2ONGXAVGms?=
 =?us-ascii?Q?INIksW8bfWJnPlplWdKCuOs5VbFL4LLbjxcAmRCJu/FeXxKGfhZzr32jaar1?=
 =?us-ascii?Q?mUPr8FHz5X5FxLHuSeWUz2+BO5jNMwJAhTd3dtYWAZGkBlm2ueBNVo1S3xZS?=
 =?us-ascii?Q?nPm9dinidv4Yoi3rlrNjlObOcDXuzBAQracMrQ3IUhQzyk8CK6anUY82pqov?=
 =?us-ascii?Q?BXtLjego0MsS2lh3FpcCYkJxhOXlRPMcG4vdgSrFPH6pYBvhB7WtpdSvBffr?=
 =?us-ascii?Q?FFcVs2yE4YIKyp6EWlQTvYAAPsLFtWQJf/6SUGHK7OTXU1FJuM3m68FNjfhu?=
 =?us-ascii?Q?1S5cBsP4VeLZ6fKeZ/h81n/RBuzgSPwiizaW+J38nHsu6JazVKKZu7pzK6/v?=
 =?us-ascii?Q?wAui1SwOmXcI8cvsBa3uui9LN1T+QdNAmJMwQ9q+mIWszrmzDo3YRJQP1Fvg?=
 =?us-ascii?Q?umClVXW93cL60HmBeW9JLc/jx7K3jWcxJJ/gsyQ4L+tR4Gth7SFcMl9qYS2O?=
 =?us-ascii?Q?VFs0KT2+VYkcjXxUgvIXAKKGZNxm15KwIV496Dm+hAtWcQST0BrYzEEcF+Gx?=
 =?us-ascii?Q?zfeCL1YDVSoPWy13InvQWi345jJj22/Jb6u3tfGZ9ihAp7qJEhg5Q6LmFcBd?=
 =?us-ascii?Q?Ftuq5RweBMWNYJkicZ4QjiwaLdDdAAGO5vmZL0w0NblTjWkkSGU8slL/1vPn?=
 =?us-ascii?Q?NI43Ipc0WqKObocG1hDQNOSrXn+nT5ls9BZgJ+AYKh8a7RDBHgVxIjwRxnhP?=
 =?us-ascii?Q?ep4Emeh0TN2JtV1JcsTY6navN20aHK6Wysq5kzQIuWj1k+YQzwpX5AeDZ1qb?=
 =?us-ascii?Q?fsIFTfd9ZnsokLgZiYUYvq05P4B9CTnO+y6ZLZE3kqWBMV+C33nNFFRcApqd?=
 =?us-ascii?Q?ZIFBX2eULDmaeTebSX00GfFna/fPzAKDRy0qU8DhjgtS8lr53/8R2fCfbAsB?=
 =?us-ascii?Q?4ky3vsBn1tfuwC4xF0Jz9pVIYbD0kMh9hzZ+eXq5KL2VTjscjfnzG2y12fI1?=
 =?us-ascii?Q?zvDSWQ7/FcMgtSOQL30qIBkMF/scGAy1dZsURRZ9sJntyg7Qk+EuUnYdIqoZ?=
 =?us-ascii?Q?EhcXmn8uhcd2JTFPpdQ6wDgfL5UKgAXf6uX4mQREDTT9H24AWyS4IQcoA7gA?=
 =?us-ascii?Q?JLQU7o+tRF5S+pwWjqSepm/UzRFk1KJiVGmUpLb+kZey9DH43VWOcd6+eI8D?=
 =?us-ascii?Q?BmhP6wiJTVpTvyR6hDa4zv0fWXvK5TrEE8F3pGupCvi2/YhgxSYGYO9D2Cc3?=
 =?us-ascii?Q?CY5D+apnmmtmYLL5BcPimQRdbDIoBccJd0sVE8Os2SC7KpgA5FjkYm/pAVm6?=
 =?us-ascii?Q?5YNk9ZAOY9aTnKflvBwFR5ow6OTP2FHLYIMqJ2NehsXjRavFvjidWH/LGjPf?=
 =?us-ascii?Q?mV8N74G1LOydUl+q0uAR9vpeFsq1sBj/dith8C9wWGqkBIxpvAhzG1gB8QiT?=
 =?us-ascii?Q?Ff3ErFcWbmFR/fIBPm6zM2b3G/VbvQr2rom1qBKLxEJ+CkAbZDWK3ZUneTN+?=
 =?us-ascii?Q?ueMoyk9zKsESd/yVp6LpimHzUcVLVy4WgNnYFGNqE3/+7sGwSANQfkuGf4Nr?=
 =?us-ascii?Q?nMhP3OC2DnxgnUx0gUR4GP53BRkMzyRQR95SGgV3ivJhxWCa5XGThkTo+II7?=
 =?us-ascii?Q?PFO2b/GI5PatrCa/1mXDS7352/7rRryHEsuwAq8oXVYGAevP20wRqiWIq9FZ?=
 =?us-ascii?Q?MTM25V7vZx9BZCkbUrLYQUp9klpE0jJE/vVGFDHvNGa9DmBwihXs?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef01b20-0b43-409a-ac81-08df04ff106d
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 12:22:45.0020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kTZcae+kIpxOYEw6KoC23oMN62jetV9LOfWjWV4IJ6/7ZuYtLQxQmP/ZkNuckE9ExaKlNDkHraqFkhfeNxH17A0cF4j56A5QmCBKH3/+nNPgZb7IYIDxicshE3MKtEG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17444

Add Display Unit driver support for the Renesas RZ/G3E SoC (R9A09G047).
Unlike the other SoCs, it has two DU channels: channel 0 drives the
LVDS encoder in single or dual channel mode and the DSI encoder, while
channel 1 drives the LVDS encoder in single channel mode, the DSI
encoder and the parallel interface.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v7->v8
 - Modelled using ports/port instead of port/ep.
 - Rebased on top of RZ/G3L du support [1]
   [1] https://lore.kernel.org/all/20260826174854.199139-1-biju.das.jz@bp.renesas.com/
 - Added mode_clock_min, mode_clock_max for parallel output.
 - Improved commit msg and commit body.

v6->v7:
 - Removed feature flag usage, rebased on top of T2H/N2H LCDC series [1]
   [1] https://patchwork.global.renesas.com/project/spl2-reviews/list/?series=694&state=%2A&archive=both
 - Reworked commit body as now outputs routing is based on endpoint id
   instead of port number.
 - Fixed rzg2l_du_r9a09g047_info instead of rzg2l_du_r9a09g047_du_info.
 - Added bump of RZG2L_DU_MAX_CRTCS and RZG2L_DU_MAX_VSPS to 2.

v5->v6:
 - Aligned ports numbering with the bindings changes.

v4->v5:
 - Fixed RG2L_DU_FEATURE_SMUX2_DSI_CLK to RZG2L_DU_FEATURE_SMUX2_DSI_CLK,
   update commit body accordingly.
 - Added features field documentation.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Instead of using clk-provider API to select the right parent clock,
   based on the outputs. Just set the correct duty cycle based on the
   output, this reflects at CPG lvl to select the right parent.
 - Updated commit message accordingly.

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 29 ++++++++++++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  3 +-
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  3 +-
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 0c08701b1502..8143929ed401 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -75,6 +75,31 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a08g046_info = {
 	.mode_clock_max = 87000,
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_info = {
+	.features = RZG2L_DU_FEATURE_CHANNEL_RES,
+	.channels_mask = BIT(0) | BIT(1),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_crtcs = BIT(0) | BIT(1),
+			.port = 0,
+		},
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_crtcs = BIT(1),
+			.port = 1,
+		},
+		[RZG2L_DU_OUTPUT_LVDS0] = {
+			.possible_crtcs = BIT(0),
+			.port = 2,
+		},
+		[RZG2L_DU_OUTPUT_LVDS1] = {
+			.possible_crtcs = BIT(0) | BIT(1),
+			.port = 3,
+		},
+	},
+	.mode_clock_min = 5400,
+	.mode_clock_max = 87000,
+};
+
 static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 	.channels_mask = BIT(0),
 	.routes = {
@@ -102,6 +127,7 @@ static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
 	{ .compatible = "renesas,r9a08g046-du", .data = &rzg2l_du_r9a08g046_info },
+	{ .compatible = "renesas,r9a09g047-du", .data = &rzg2l_du_r9a09g047_info },
 	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ .compatible = "renesas,r9a09g077-du", .data = &rzg2l_du_r9a09g077_info },
 	{ /* sentinel */ }
@@ -114,7 +140,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)
 	static const char * const names[] = {
 		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
 		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0",
-		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0"
+		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0",
+		[RZG2L_DU_OUTPUT_LVDS1] = "LVDS1",
 	};
 
 	if (output >= ARRAY_SIZE(names))
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 66ebcbaf0687..326293cf9787 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -27,6 +27,7 @@ enum rzg2l_du_output {
 	RZG2L_DU_OUTPUT_DSI0,
 	RZG2L_DU_OUTPUT_DPAD0,
 	RZG2L_DU_OUTPUT_LVDS0,
+	RZG2L_DU_OUTPUT_LVDS1,
 	RZG2L_DU_OUTPUT_MAX,
 };
 
@@ -35,7 +36,7 @@ enum rzg2l_du_output {
  * @possible_crtcs: bitmask of possible CRTCs for the output
  * @port: device tree port number corresponding to this output route
  *
- * The DU has 3 possible outputs (DPAD0, DSI0, LVDS0). Output routing data
+ * The DU has 4 possible outputs (DPAD0, DSI0, LVDS0/1). Output routing data
  * specify the valid SoC outputs, which CRTC can drive the output, and the type
  * of in-SoC encoder for the output.
  */
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index a1b48973aa8e..ff3e70227d2a 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -81,7 +81,8 @@ static void rzg2l_du_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	 * - LVDS path has DUTY H/L=4/3, 4/7 duty cycle.
 	 * - DSI/RGB path has symmetric 50% duty cycle.
 	 */
-	if (renc->output == RZG2L_DU_OUTPUT_LVDS0)
+	if (renc->output == RZG2L_DU_OUTPUT_LVDS0 ||
+	    renc->output == RZG2L_DU_OUTPUT_LVDS1)
 		clk_set_duty_cycle(clk_parent, 4, 7);
 	else
 		clk_set_duty_cycle(clk_parent, 1, 2);
-- 
2.54.0

