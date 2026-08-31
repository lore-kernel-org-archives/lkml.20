Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D52E3ACA7C;
	Mon, 31 Aug 2026 06:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159132; cv=none; b=o9/35YRdf/e1LfWk0dBYQgtx+rXFH+0sU3KUCVMT91uxcHvdtM+EV3hxDljGao+BCw/qcUdh0mUd1rDM21bvrmlx+AXmymas9wXgIYzUjcBHHjZVVUhY0yyJP2uuRBOrV3poCP/jSGzlf2S6lhHS3zDY9FGgL/NTSdDw9EwrW3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159132; c=relaxed/simple;
	bh=30XfblXiQ8Zqhfg1HJUgZ1c2zN58moikfo/u9eBO1FI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XFoDJzmS5quiWtwhOHV37gPsF/KOJ4dLmBgCn1kru905daOzo/EuTioSUuk274OiUZ0pHNfwfBAlDSDLr7BdlVrOJWJdZcaVWbplXBHD4dKIZF1rqoqLy1TErS8YxTqbR7tgWfZpewQ32OzqQQKiecCq98v60ZRxI80YHSzILVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/Pl7RtP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/Pl7RtP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10165C2BCFD;
	Mon, 31 Aug 2026 06:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788159131;
	bh=30XfblXiQ8Zqhfg1HJUgZ1c2zN58moikfo/u9eBO1FI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M/Pl7RtPbHpXUUK5i7a9rNvCUfqayp8/XgWPPCrXIqF1KqVdLOAU9rhYU2dW1ohP0
	 Kw9eLdevtQ2Qze0s+Ejcezu8vD2RvBRe99ysuuxeXtjqBETaIfcP2TW/W7yBqzlAj+
	 /3YKc9grU2mzx2w7XpR8fuJzWPh6nuAtv98j+97WaUTSzyvt8bUyhDZHvVHr1slfzQ
	 6x9+IG7H8yK5RK2nqLX6fPwfr3a12ZWOoX1tFjyWR1ehD5LZBxybljoFs3aEltXR7v
	 EF9blPVNs1PHXqiCX2lbzq8NHTgUgjL5rVuSIeGcZKyppMn8cVq09quRncoQTPqS1G
	 udvMopzZqhFGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E526BC624C2;
	Mon, 31 Aug 2026 06:52:10 +0000 (UTC)
From: Congcong Yao via B4 Relay <devnull+congcong.yao.mediatek.com@kernel.org>
Date: Mon, 31 Aug 2026 14:52:07 +0800
Subject: [PATCH v4 2/2] memory: mtk-smi: Add MT8189 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-8189-smi-support-v4-2-8ae66dd3eeed@mediatek.com>
References: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
In-Reply-To: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Congcong Yao <congcong.yao@mediatek.com>, 
 Zhengnan Chen <zhengnan.chen@mediatek.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788159129; l=4600;
 i=congcong.yao@mediatek.com; s=20260722; h=from:subject:message-id;
 bh=7az4Dgk3CXFVdlAoxr6OTNIBaBixjBIVkNdiyT0OpGA=;
 b=7LVFR45UNQ9UzEL7SqZVZ0eq6zimK7axUTNrz6xTswY9mxWDD6vec7IEIXQuqUyUJKMBnXMWH
 wLzJoC+nF49ACS+Bkzrja75h1kmEDkK6BwbYGc6Si6MxD80YvXPmV2C
X-Developer-Key: i=congcong.yao@mediatek.com; a=ed25519;
 pk=tIrmGxKQQxnfyb48iCCd19063tppPj89U3nupGYAIxg=
X-Endpoint-Received: by B4 Relay for congcong.yao@mediatek.com/20260722
 with auth_id=889
X-Original-From: Congcong Yao <congcong.yao@mediatek.com>
Reply-To: congcong.yao@mediatek.com

From: Zhengnan Chen <zhengnan.chen@mediatek.com>

Add the MT8189 SMI common, sub-common and LARB platform data.

Enable the GALS clock for the MT8189 SMI sub-common.

Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
Signed-off-by: Congcong Yao <congcong.yao@mediatek.com>
---
 drivers/memory/mtk-smi.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index aaeba8ab211e..8c4606cbd73d 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -401,6 +401,30 @@ static const u8 mtk_smi_larb_mt8188_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[25] = {0x01},
 };
 
+static const u8 mtk_smi_larb_mt8189_ostd[][SMI_LARB_PORT_NR_MAX] = {
+	[0] = {0x8, 0x20, 0x20, 0x20, 0x20, 0x20, 0x10,},
+	[1] = {0x8, 0x20, 0x20, 0x20, 0x20, 0x20, 0x10,},
+	[2] = {0x7, 0x7, 0x4, 0x4, 0x1, 0x1, 0x2, 0x2, 0x7, 0x7,},
+	[4] = {0x2f, 0x1e, 0x9, 0x1, 0x1, 0x1, 0x1, 0x2, 0x2, 0x5, 0x1, 0x17,},
+	[7] = {0x20, 0x2, 0x1, 0x1, 0x1, 0x4, 0x2, 0x1, 0x1, 0x2, 0x3, 0x2,
+	       0xa, 0xf, 0x4, 0x6, 0x5, 0x1,},
+	[9] = {0x6, 0x3, 0xc, 0x6, 0x1, 0x4, 0x3, 0x1, 0x2, 0x4, 0x5, 0x2,
+	       0x4, 0x2, 0x3, 0xb, 0x1, 0x4, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+	       0x1, 0x1,},
+	[11] = {0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+		0x1, 0x1, 0x1, 0xb, 0x1, 0x4, 0x6, 0x5, 0x6, 0x1, 0x5, 0x2,
+		0x9, 0x5,},
+	[13] = {0x2, 0x8, 0x8, 0x8, 0x4, 0x4, 0x4, 0x4, 0x4, 0xe, 0x4, 0x1,
+		0x6, 0x6, 0x2,},
+	[14] = {0x1, 0x1, 0x1, 0x20, 0xe, 0x4, 0x8, 0x8, 0x6, 0x4,},
+	[16] = {0x1e, 0xc, 0x2, 0x8, 0xe, 0x2, 0x1e, 0x10, 0x4, 0x2, 0x2, 0x2,
+		0x2, 0x2, 0x4, 0x2, 0x4,},
+	[17] = {0x1e, 0xc, 0x2, 0x8, 0xe, 0x2, 0x1e, 0x10, 0x4, 0x2, 0x2, 0x2,
+		0x2, 0x2, 0x4, 0x2, 0x4,},
+	[19] = {0x2, 0x1, 0x3, 0x1,},
+	[20] = {0x7, 0x7, 0x3, 0x3, 0x1, 0x1,},
+};
+
 static const u8 mtk_smi_larb_mt8192_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[0] = {0x2, 0x2, 0x28, 0xa, 0xc, 0x28,},
 	[1] = {0x2, 0x2, 0x18, 0x18, 0x18, 0xa, 0xc, 0x28,},
@@ -533,6 +557,13 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8188 = {
 	.ostd		            = mtk_smi_larb_mt8188_ostd,
 };
 
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt8189 = {
+	.config_port                = mtk_smi_larb_config_port_gen2_general,
+	.flags_general	            = MTK_SMI_FLAG_THRT_UPDATE | MTK_SMI_FLAG_SW_FLAG |
+				      MTK_SMI_FLAG_SLEEP_CTL | MTK_SMI_FLAG_CFG_PORT_SEC_CTL,
+	.ostd		            = mtk_smi_larb_mt8189_ostd,
+};
+
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
 	.config_port                = mtk_smi_larb_config_port_gen2_general,
 	.ostd			    = mtk_smi_larb_mt8192_ostd,
@@ -556,6 +587,7 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt8183-smi-larb", .data = &mtk_smi_larb_mt8183},
 	{.compatible = "mediatek,mt8186-smi-larb", .data = &mtk_smi_larb_mt8186},
 	{.compatible = "mediatek,mt8188-smi-larb", .data = &mtk_smi_larb_mt8188},
+	{.compatible = "mediatek,mt8189-smi-larb", .data = &mtk_smi_larb_mt8189},
 	{.compatible = "mediatek,mt8192-smi-larb", .data = &mtk_smi_larb_mt8192},
 	{.compatible = "mediatek,mt8195-smi-larb", .data = &mtk_smi_larb_mt8195},
 	{}
@@ -808,6 +840,17 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8188_vpp = {
 	.init     = mtk_smi_common_mt8195_init,
 };
 
+static const struct mtk_smi_common_plat mtk_smi_common_mt8189 = {
+	.type     = MTK_SMI_GEN2,
+	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(3) | F_MMU1_LARB(5) |
+		    F_MMU1_LARB(7),
+};
+
+static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8189 = {
+	.type     = MTK_SMI_GEN2_SUB_COMM,
+	.has_gals = true,
+};
+
 static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
 	.type     = MTK_SMI_GEN2,
 	.has_gals = true,
@@ -852,6 +895,8 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt8186-smi-common", .data = &mtk_smi_common_mt8186},
 	{.compatible = "mediatek,mt8188-smi-common-vdo", .data = &mtk_smi_common_mt8188_vdo},
 	{.compatible = "mediatek,mt8188-smi-common-vpp", .data = &mtk_smi_common_mt8188_vpp},
+	{.compatible = "mediatek,mt8189-smi-common",     .data = &mtk_smi_common_mt8189},
+	{.compatible = "mediatek,mt8189-smi-sub-common", .data = &mtk_smi_sub_common_mt8189},
 	{.compatible = "mediatek,mt8192-smi-common", .data = &mtk_smi_common_mt8192},
 	{.compatible = "mediatek,mt8195-smi-common-vdo", .data = &mtk_smi_common_mt8195_vdo},
 	{.compatible = "mediatek,mt8195-smi-common-vpp", .data = &mtk_smi_common_mt8195_vpp},

-- 
2.43.0


