Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBE7370AFC
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791706864; cv=none; b=n5HSq1M5HDSAtxGb44J9e7pB/xvevoFYMmA7ICFkKDiBUO4V6EGEyg9qo5CmG5NIOLwSvYGz/macxjIwmrkMhYbIbYREZBFvqAoqxKIigJlzCV49SsUZ2IZjasFPMZUZJpruPR3wuC919oBHVhNMtlgvrE1tCEYEsbVoBYjl+IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791706864; c=relaxed/simple;
	bh=Yh8Jarw7vhpkp+YGJ3kF3wGv57jcyrYcTSNjoijp1lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ICLFhVkE79kxy9zhTJZRk25Cga1qhcAXxar0NYbMfTjEPrZW9/ZAeda7A/ZqbZsg8n+NA6peswSL/LEzV4KhCYYHrZ9l0Q6ubtWS5Xd+c+5qDW9TSZCYrWcdLFQBPHKERhdzvLjgAf6o0ppbnKsr8XSG+eb62dBxdWKhJXSKII8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDDZGDHs; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDDZGDHs"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4be28b82so861662f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791706860; x=1792311660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0F/fOD9X2vfCYs8KWMLmkYqVPfwtj1SZybfaFCE9X0=;
        b=WDDZGDHsUqL8/G8jLk8onw+BU+6MmXYiT/Yw+7O4L2rhq3uVaE4wKRC6ls4YWzzKqc
         DkOxYbyWcvoMQKwhfIXP/7hnbF7lwYDD48SvX2MExmJ6TkHVfv/wYdDbYC1NcmLfc33x
         z0N9yyunG73XhXDYfe8cwIqhJ/ewjCUSR8oIitgfJbAPZReqlEjiGKCfC7AeIXisN/Tu
         3hYBu6N28c8RFPk4NKV814fwWamECO0wI0Jck5vfT6oRZwd5UNP7jZQd2UiV++j99VCK
         uqsV/Jb71ClXo1rnN3TQr30auPN37+vt/I9U6zEYke2KbV8V4z0g6UX/S0hyRzQA+8xT
         mjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791706860; x=1792311660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0F/fOD9X2vfCYs8KWMLmkYqVPfwtj1SZybfaFCE9X0=;
        b=ILpW+2P2y96DC582Z4Obko8Rb+MtFC14c/rpy2Olz3m1Q89kDOfYUMCSWYM3X14vVY
         FPGA8iukZ/ix/Is6+T7WQoFcnh+SY2J7zcfvZ3j8+Yxae4oeRkJTsg2gmDxoOJ6yNWQ0
         8Yk28HYzFwsqupLKxsJVDM3/u6vDbRd3Q6zcL3mxfkO2z/PW9wn6TEfWHAWydunPSlgO
         EXr62cgOqYpSIaaR7Fzs0227UC+TFiYGlgv1yttCblEoCjl5Op5oW8sXqtfBUaRqZ9k/
         e9xt8nDUkjQhK04Uq3dBnRazw8JMwdHmgZ7uXxwbpfQ6+GSRuU6AbzG3Bc18V1E7flqV
         qslw==
X-Forwarded-Encrypted: i=1; AKwUvBxVP/a00L9LKFnpPztirYtYo2Xke2iJhkGjf0wZWcT5evh9vO677nWm91UI6T2GyDb3+SU00fh+12mCLrs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMnpsTvVz42t2TYptx0rnWu/G1M314pxmjO9sk+e6eBrc2u3IO
	lATKkK8reHEH7/skOJzv+LBZV6tCWe5KbEQqpRWo2V9FDGas/Nx9kld0
X-Gm-Gg: AYBFou1SMD1/tslMrzdA9zF+Zq6SqtPRlUshdmpvemG3jKX9tkOJk9dQn+lR4N3k+lG
	k8ZxakiOnberAbF4x9t5Dg/skBXQDQgaOaCPiFo6HmDHV1xcue65J8cG5ww7T+ZIsOVUWkEwuuU
	Fnh+fZRHtDfKfswNI6wAJLyWD74s2ew5ONLksZQZVqoNYLrD1VfTclFLqjn+GHO9VnRf8e0adXw
	1S+FeoNDrBoab5813xwO4Ge9Q4tZs1jmjTOkQ7h1FKpk1DMOfHQM7hhbji0pPPUSGjLuh1EvxxH
	THoSVcSqw4H3xVlvk3j9q1TXK70TgUTLmVP8wkf2UaqtST+0PSvXOuhHXdX/JR243rnKFMQr1uw
	qoeDk23YxsH7zujVqrG53Ehsum3HkAI0EOaJFYOuIWkXCruV/T7ayNYBKg3pFZZRdZuMpSUOMRB
	ecUqiSPIRS5zw3ZIjD13Wg/Hxd+pL8lIwkbIRE+hR5ECWHXlb5CiKvDcrK21QgrXFCAQ==
X-Received: by 2002:a05:600c:1909:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a18e4a3f5amr131601715e9.23.1791706859790;
        Sun, 11 Oct 2026 01:20:59 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a195002123sm152063175e9.1.2026.10.11.01.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:20:59 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] phy: mediatek: phy-mtk-hdmi: Use regmap to manipulate hdmi registers
Date: Sun, 11 Oct 2026 10:20:31 +0200
Message-ID: <20261011082042.348422-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011082042.348422-1-l.scorcia@gmail.com>
References: <20261011082042.348422-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the regmap primitives to manipulate HDMI registers instead of custom
helpers from phy-mtk-io.h. No functional changes.

This avoids the following issue with mt8167:

hdmi-phy: error -EBUSY: can't request region for resource
[mem 0x10018300-0x1001831f]

due to the fact that HDMI PHY registers are actually mapped inside the
apmixedsys memory space.

The same situation is present on mt8173 too but this SoC does not exhibit
the issue as its apmixedsys driver uses of_iomap instead of
devm_platform_ioremap_resource to map its memory space, just like regmap
does.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 145 ++++++++--------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 133 +++++++--------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 185 ++++++++++-----------
 drivers/phy/mediatek/phy-mtk-hdmi.c        |   2 +-
 drivers/phy/mediatek/phy-mtk-hdmi.h        |   3 +-
 5 files changed, 235 insertions(+), 233 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index c9a1f20e939b..7fcf9116a0a9 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -5,7 +5,13 @@
  */
 
 #include "phy-mtk-hdmi.h"
-#include "phy-mtk-io.h"
+
+/* field @mask shall be constant and continuous */
+#define mtk_phy_update_regmap_field(regmap, reg, mask, val) \
+({ \
+	BUILD_BUG_ON_MSG(!__builtin_constant_p(mask), "mask is not constant"); \
+	regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
+})
 
 #define HDMI_CON0	0x00
 #define RG_HDMITX_DRV_IBIAS_MASK	GENMASK(5, 0)
@@ -50,21 +56,20 @@
 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-	void __iomem *base = hdmi_phy->regs;
 
-	mtk_phy_set_bits(base + HDMI_CON7, RG_HTPLL_AUTOK_EN);
-	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_RLH_EN);
-	mtk_phy_set_bits(base + HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_phy_set_bits(base + HDMI_CON2, RG_HDMITX_EN_MBIAS);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON7, RG_HTPLL_AUTOK_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_RLH_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_MBIAS);
 	usleep_range(80, 100);
-	mtk_phy_set_bits(base + HDMI_CON6, RG_HTPLL_EN);
-	mtk_phy_set_bits(base + HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
-	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
 	usleep_range(80, 100);
-	mtk_phy_set_bits(base + HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
-	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_SER_MASK);
-	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
-	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
 	usleep_range(80, 100);
 	return 0;
 }
@@ -72,21 +77,20 @@ static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-	void __iomem *base = hdmi_phy->regs;
 
-	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
-	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
-	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_SER_MASK);
-	mtk_phy_clear_bits(base + HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
 	usleep_range(80, 100);
-	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
-	mtk_phy_clear_bits(base + HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
-	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_EN);
 	usleep_range(80, 100);
-	mtk_phy_clear_bits(base + HDMI_CON2, RG_HDMITX_EN_MBIAS);
-	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_RLH_EN);
-	mtk_phy_clear_bits(base + HDMI_CON7, RG_HTPLL_AUTOK_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_MBIAS);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_RLH_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON7, RG_HTPLL_AUTOK_EN);
 	usleep_range(80, 100);
 }
 
@@ -94,7 +98,6 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				 unsigned long parent_rate)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-	void __iomem *base = hdmi_phy->regs;
 	u32 pos_div;
 
 	if (rate <= 64000000)
@@ -104,25 +107,25 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		pos_div = 1;
 
-	mtk_phy_set_bits(base + HDMI_CON6, RG_HTPLL_PREDIV_MASK);
-	mtk_phy_set_bits(base + HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_phy_set_bits(base + HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
-	mtk_phy_update_field(base + HDMI_CON6, RG_HTPLL_IC_MASK, 0x1);
-	mtk_phy_update_field(base + HDMI_CON6, RG_HTPLL_IR_MASK, 0x1);
-	mtk_phy_update_field(base + HDMI_CON2, RG_HDMITX_TX_POSDIV_MASK, pos_div);
-	mtk_phy_update_field(base + HDMI_CON6, RG_HTPLL_FBKSEL_MASK, 1);
-	mtk_phy_update_field(base + HDMI_CON6, RG_HTPLL_FBKDIV_MASK, 19);
-	mtk_phy_update_field(base + HDMI_CON7, RG_HTPLL_DIVEN_MASK, 0x2);
-	mtk_phy_update_field(base + HDMI_CON6, RG_HTPLL_BP_MASK, 0xc);
-	mtk_phy_update_field(base + HDMI_CON6, RG_HTPLL_BC_MASK, 0x2);
-	mtk_phy_update_field(base + HDMI_CON6, RG_HTPLL_BR_MASK, 0x1);
-
-	mtk_phy_clear_bits(base + HDMI_CON1, RG_HDMITX_PRED_IMP);
-	mtk_phy_update_field(base + HDMI_CON1, RG_HDMITX_PRED_IBIAS_MASK, 0x3);
-	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_IMP_MASK);
-	mtk_phy_update_field(base + HDMI_CON1, RG_HDMITX_DRV_IMP_MASK, 0x28);
-	mtk_phy_update_field(base + HDMI_CON4, RG_HDMITX_RESERVE_MASK, 0x28);
-	mtk_phy_update_field(base + HDMI_CON0, RG_HDMITX_DRV_IBIAS_MASK, 0xa);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_PREDIV_MASK);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_IC_MASK, 0x1);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_IR_MASK, 0x1);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_TX_POSDIV_MASK, pos_div);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_FBKSEL_MASK, 1);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_FBKDIV_MASK, 19);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON7, RG_HTPLL_DIVEN_MASK, 0x2);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_BP_MASK, 0xc);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_BC_MASK, 0x2);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_BR_MASK, 0x1);
+
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PRED_IMP);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PRED_IBIAS_MASK, 0x3);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_IMP_MASK);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_DRV_IMP_MASK, 0x28);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON4, RG_HDMITX_RESERVE_MASK, 0x28);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_DRV_IBIAS_MASK, 0xa);
 	return 0;
 }
 
@@ -133,7 +136,7 @@ static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
 	unsigned long out_rate, val;
 	u32 tmp;
 
-	tmp = readl(hdmi_phy->regs + HDMI_CON6);
+	regmap_read(hdmi_phy->regs, HDMI_CON6, &tmp);
 	val = FIELD_GET(RG_HTPLL_PREDIV_MASK, tmp);
 	switch (val) {
 	case 0x00:
@@ -150,7 +153,7 @@ static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
 	val = FIELD_GET(RG_HTPLL_FBKDIV_MASK, tmp);
 	out_rate *= (val + 1) * 2;
 
-	tmp = readl(hdmi_phy->regs + HDMI_CON2);
+	regmap_read(hdmi_phy->regs, HDMI_CON2, &tmp);
 	val = FIELD_GET(RG_HDMITX_TX_POSDIV_MASK, tmp);
 	out_rate >>= val;
 
@@ -170,41 +173,37 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 
 static void mtk_hdmi_phy_enable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 {
-	void __iomem *base = hdmi_phy->regs;
-
-	mtk_phy_set_bits(base + HDMI_CON7, RG_HTPLL_AUTOK_EN);
-	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_RLH_EN);
-	mtk_phy_set_bits(base + HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_phy_set_bits(base + HDMI_CON2, RG_HDMITX_EN_MBIAS);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON7, RG_HTPLL_AUTOK_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_RLH_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_MBIAS);
 	usleep_range(80, 100);
-	mtk_phy_set_bits(base + HDMI_CON6, RG_HTPLL_EN);
-	mtk_phy_set_bits(base + HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
-	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
 	usleep_range(80, 100);
-	mtk_phy_set_bits(base + HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
-	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_SER_MASK);
-	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
-	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
 	usleep_range(80, 100);
 }
 
 static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 {
-	void __iomem *base = hdmi_phy->regs;
-
-	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
-	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
-	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_SER_MASK);
-	mtk_phy_clear_bits(base + HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
 	usleep_range(80, 100);
-	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
-	mtk_phy_clear_bits(base + HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
-	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_EN);
 	usleep_range(80, 100);
-	mtk_phy_clear_bits(base + HDMI_CON2, RG_HDMITX_EN_MBIAS);
-	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_RLH_EN);
-	mtk_phy_clear_bits(base + HDMI_CON7, RG_HTPLL_AUTOK_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_MBIAS);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_RLH_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON7, RG_HTPLL_AUTOK_EN);
 	usleep_range(80, 100);
 }
 
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index 58c6596c8c20..6df997ff74c9 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -5,7 +5,13 @@
  */
 
 #include "phy-mtk-hdmi.h"
-#include "phy-mtk-io.h"
+
+/* field @mask shall be constant and continuous */
+#define mtk_phy_update_regmap_field(regmap, reg, mask, val) \
+({ \
+	BUILD_BUG_ON_MSG(!__builtin_constant_p(mask), "mask is not constant"); \
+	regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
+})
 
 #define HDMI_CON0		0x00
 #define RG_HDMITX_PLL_EN		BIT(31)
@@ -87,17 +93,16 @@
 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-	void __iomem *base = hdmi_phy->regs;
 
-	mtk_phy_set_bits(base + HDMI_CON1, RG_HDMITX_PLL_AUTOK_EN);
-	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_PLL_POSDIV);
-	mtk_phy_clear_bits(base + HDMI_CON3, RG_HDMITX_MHLCK_EN);
-	mtk_phy_set_bits(base + HDMI_CON1, RG_HDMITX_PLL_BIAS_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PLL_AUTOK_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_PLL_POSDIV);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON3, RG_HDMITX_MHLCK_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PLL_BIAS_EN);
 	usleep_range(100, 150);
-	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_PLL_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_PLL_EN);
 	usleep_range(100, 150);
-	mtk_phy_set_bits(base + HDMI_CON1, RG_HDMITX_PLL_BIAS_LPF_EN);
-	mtk_phy_set_bits(base + HDMI_CON1, RG_HDMITX_PLL_TXDIV_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PLL_BIAS_LPF_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PLL_TXDIV_EN);
 
 	return 0;
 }
@@ -105,16 +110,15 @@ static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-	void __iomem *base = hdmi_phy->regs;
 
-	mtk_phy_clear_bits(base + HDMI_CON1, RG_HDMITX_PLL_TXDIV_EN);
-	mtk_phy_clear_bits(base + HDMI_CON1, RG_HDMITX_PLL_BIAS_LPF_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PLL_TXDIV_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PLL_BIAS_LPF_EN);
 	usleep_range(100, 150);
-	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_PLL_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_PLL_EN);
 	usleep_range(100, 150);
-	mtk_phy_clear_bits(base + HDMI_CON1, RG_HDMITX_PLL_BIAS_EN);
-	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_PLL_POSDIV);
-	mtk_phy_clear_bits(base + HDMI_CON1, RG_HDMITX_PLL_AUTOK_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PLL_BIAS_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_PLL_POSDIV);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PLL_AUTOK_EN);
 	usleep_range(100, 150);
 }
 
@@ -136,7 +140,6 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				 unsigned long parent_rate)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-	void __iomem *base = hdmi_phy->regs;
 	unsigned int pre_div;
 	unsigned int div;
 	unsigned int pre_ibias;
@@ -157,57 +160,57 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		div = 1;
 	}
 
-	mtk_phy_update_field(base + HDMI_CON0, RG_HDMITX_PLL_PREDIV, pre_div);
-	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_PLL_POSDIV);
-	mtk_phy_update_bits(base + HDMI_CON0,
-			    RG_HDMITX_PLL_IC | RG_HDMITX_PLL_IR,
-			    FIELD_PREP(RG_HDMITX_PLL_IC, 0x1) |
-			    FIELD_PREP(RG_HDMITX_PLL_IR, 0x1));
-	mtk_phy_update_field(base + HDMI_CON1, RG_HDMITX_PLL_TXDIV, div);
-	mtk_phy_update_bits(base + HDMI_CON0,
-			    RG_HDMITX_PLL_FBKSEL | RG_HDMITX_PLL_FBKDIV,
-			    FIELD_PREP(RG_HDMITX_PLL_FBKSEL, 0x1) |
-			    FIELD_PREP(RG_HDMITX_PLL_FBKDIV, 19));
-	mtk_phy_update_field(base + HDMI_CON1, RG_HDMITX_PLL_DIVEN, 0x2);
-	mtk_phy_update_bits(base + HDMI_CON0,
-			    RG_HDMITX_PLL_BP | RG_HDMITX_PLL_BC |
-			    RG_HDMITX_PLL_BR,
-			    FIELD_PREP(RG_HDMITX_PLL_BP, 0xc) |
-			    FIELD_PREP(RG_HDMITX_PLL_BC, 0x2) |
-			    FIELD_PREP(RG_HDMITX_PLL_BR, 0x1));
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_PLL_PREDIV, pre_div);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_PLL_POSDIV);
+	regmap_update_bits(hdmi_phy->regs, HDMI_CON0,
+			   RG_HDMITX_PLL_IC | RG_HDMITX_PLL_IR,
+			   FIELD_PREP(RG_HDMITX_PLL_IC, 0x1) |
+			   FIELD_PREP(RG_HDMITX_PLL_IR, 0x1));
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PLL_TXDIV, div);
+	regmap_update_bits(hdmi_phy->regs, HDMI_CON0,
+			   RG_HDMITX_PLL_FBKSEL | RG_HDMITX_PLL_FBKDIV,
+			   FIELD_PREP(RG_HDMITX_PLL_FBKSEL, 0x1) |
+			   FIELD_PREP(RG_HDMITX_PLL_FBKDIV, 19));
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PLL_DIVEN, 0x2);
+	regmap_update_bits(hdmi_phy->regs, HDMI_CON0,
+			   RG_HDMITX_PLL_BP | RG_HDMITX_PLL_BC |
+			   RG_HDMITX_PLL_BR,
+			   FIELD_PREP(RG_HDMITX_PLL_BP, 0xc) |
+			   FIELD_PREP(RG_HDMITX_PLL_BC, 0x2) |
+			   FIELD_PREP(RG_HDMITX_PLL_BR, 0x1));
 	if (rate < 165000000) {
-		mtk_phy_clear_bits(base + HDMI_CON3, RG_HDMITX_PRD_IMP_EN);
+		regmap_clear_bits(hdmi_phy->regs, HDMI_CON3, RG_HDMITX_PRD_IMP_EN);
 		pre_ibias = 0x3;
 		imp_en = 0x0;
 		hdmi_ibias = hdmi_phy->ibias;
 	} else {
-		mtk_phy_set_bits(base + HDMI_CON3, RG_HDMITX_PRD_IMP_EN);
+		regmap_set_bits(hdmi_phy->regs, HDMI_CON3, RG_HDMITX_PRD_IMP_EN);
 		pre_ibias = 0x6;
 		imp_en = 0xf;
 		hdmi_ibias = hdmi_phy->ibias_up;
 	}
-	mtk_phy_update_bits(base + HDMI_CON4,
-			    RG_HDMITX_PRD_IBIAS_CLK | RG_HDMITX_PRD_IBIAS_D2 |
-			    RG_HDMITX_PRD_IBIAS_D1 | RG_HDMITX_PRD_IBIAS_D0,
-			    FIELD_PREP(RG_HDMITX_PRD_IBIAS_CLK, pre_ibias) |
-			    FIELD_PREP(RG_HDMITX_PRD_IBIAS_D2, pre_ibias) |
-			    FIELD_PREP(RG_HDMITX_PRD_IBIAS_D1, pre_ibias) |
-			    FIELD_PREP(RG_HDMITX_PRD_IBIAS_D0, pre_ibias));
-	mtk_phy_update_field(base + HDMI_CON3, RG_HDMITX_DRV_IMP_EN, imp_en);
-	mtk_phy_update_bits(base + HDMI_CON6,
-			    RG_HDMITX_DRV_IMP_CLK | RG_HDMITX_DRV_IMP_D2 |
-			    RG_HDMITX_DRV_IMP_D1 | RG_HDMITX_DRV_IMP_D0,
-			    FIELD_PREP(RG_HDMITX_DRV_IMP_CLK, hdmi_phy->drv_imp_clk) |
-			    FIELD_PREP(RG_HDMITX_DRV_IMP_D2, hdmi_phy->drv_imp_d2) |
-			    FIELD_PREP(RG_HDMITX_DRV_IMP_D1, hdmi_phy->drv_imp_d1) |
-			    FIELD_PREP(RG_HDMITX_DRV_IMP_D0, hdmi_phy->drv_imp_d0));
-	mtk_phy_update_bits(base + HDMI_CON5,
-			    RG_HDMITX_DRV_IBIAS_CLK | RG_HDMITX_DRV_IBIAS_D2 |
-			    RG_HDMITX_DRV_IBIAS_D1 | RG_HDMITX_DRV_IBIAS_D0,
-			    FIELD_PREP(RG_HDMITX_DRV_IBIAS_CLK, hdmi_ibias) |
-			    FIELD_PREP(RG_HDMITX_DRV_IBIAS_D2, hdmi_ibias) |
-			    FIELD_PREP(RG_HDMITX_DRV_IBIAS_D1, hdmi_ibias) |
-			    FIELD_PREP(RG_HDMITX_DRV_IBIAS_D0, hdmi_ibias));
+	regmap_update_bits(hdmi_phy->regs, HDMI_CON4,
+			   RG_HDMITX_PRD_IBIAS_CLK | RG_HDMITX_PRD_IBIAS_D2 |
+			   RG_HDMITX_PRD_IBIAS_D1 | RG_HDMITX_PRD_IBIAS_D0,
+			   FIELD_PREP(RG_HDMITX_PRD_IBIAS_CLK, pre_ibias) |
+			   FIELD_PREP(RG_HDMITX_PRD_IBIAS_D2, pre_ibias) |
+			   FIELD_PREP(RG_HDMITX_PRD_IBIAS_D1, pre_ibias) |
+			   FIELD_PREP(RG_HDMITX_PRD_IBIAS_D0, pre_ibias));
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON3, RG_HDMITX_DRV_IMP_EN, imp_en);
+	regmap_update_bits(hdmi_phy->regs, HDMI_CON6,
+			   RG_HDMITX_DRV_IMP_CLK | RG_HDMITX_DRV_IMP_D2 |
+			   RG_HDMITX_DRV_IMP_D1 | RG_HDMITX_DRV_IMP_D0,
+			   FIELD_PREP(RG_HDMITX_DRV_IMP_CLK, hdmi_phy->drv_imp_clk) |
+			   FIELD_PREP(RG_HDMITX_DRV_IMP_D2, hdmi_phy->drv_imp_d2) |
+			   FIELD_PREP(RG_HDMITX_DRV_IMP_D1, hdmi_phy->drv_imp_d1) |
+			   FIELD_PREP(RG_HDMITX_DRV_IMP_D0, hdmi_phy->drv_imp_d0));
+	regmap_update_bits(hdmi_phy->regs, HDMI_CON5,
+			   RG_HDMITX_DRV_IBIAS_CLK | RG_HDMITX_DRV_IBIAS_D2 |
+			   RG_HDMITX_DRV_IBIAS_D1 | RG_HDMITX_DRV_IBIAS_D0,
+			   FIELD_PREP(RG_HDMITX_DRV_IBIAS_CLK, hdmi_ibias) |
+			   FIELD_PREP(RG_HDMITX_DRV_IBIAS_D2, hdmi_ibias) |
+			   FIELD_PREP(RG_HDMITX_DRV_IBIAS_D1, hdmi_ibias) |
+			   FIELD_PREP(RG_HDMITX_DRV_IBIAS_D0, hdmi_ibias));
 	return 0;
 }
 
@@ -229,17 +232,17 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 
 static void mtk_hdmi_phy_enable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 {
-	mtk_phy_set_bits(hdmi_phy->regs + HDMI_CON3,
-			 RG_HDMITX_SER_EN | RG_HDMITX_PRD_EN |
-			 RG_HDMITX_DRV_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CON3,
+			RG_HDMITX_SER_EN | RG_HDMITX_PRD_EN |
+			RG_HDMITX_DRV_EN);
 	usleep_range(100, 150);
 }
 
 static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 {
-	mtk_phy_clear_bits(hdmi_phy->regs + HDMI_CON3,
-			   RG_HDMITX_DRV_EN | RG_HDMITX_PRD_EN |
-			   RG_HDMITX_SER_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CON3,
+			  RG_HDMITX_DRV_EN | RG_HDMITX_PRD_EN |
+			  RG_HDMITX_SER_EN);
 }
 
 struct mtk_hdmi_phy_conf mtk_hdmi_phy_8173_conf = {
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index a4bc1268946d..5d6122277725 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -15,62 +15,64 @@
 #include <linux/units.h>
 #include <linux/nvmem-consumer.h>
 
-#include "phy-mtk-io.h"
 #include "phy-mtk-hdmi.h"
 #include "phy-mtk-hdmi-mt8195.h"
 
+/* field @mask shall be constant and continuous */
+#define mtk_phy_update_regmap_field(regmap, reg, mask, val) \
+({ \
+	BUILD_BUG_ON_MSG(!__builtin_constant_p(mask), "mask is not constant"); \
+	regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
+})
+
 static void mtk_hdmi_ana_fifo_en(struct mtk_hdmi_phy *hdmi_phy)
 {
 	/* make data fifo writable for hdmi2.0 */
-	mtk_phy_set_bits(hdmi_phy->regs + HDMI_ANA_CTL, REG_ANA_HDMI20_FIFO_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_ANA_CTL, REG_ANA_HDMI20_FIFO_EN);
 }
 
 static void
 mtk_phy_tmds_clk_ratio(struct mtk_hdmi_phy *hdmi_phy, bool enable)
 {
-	void __iomem *regs = hdmi_phy->regs;
-
 	mtk_hdmi_ana_fifo_en(hdmi_phy);
 
 	/* HDMI 2.0 specification, 3.4Gbps <= TMDS Bit Rate <= 6G,
 	 * clock bit ratio 1:40, under 3.4Gbps, clock bit ratio 1:10
 	 */
 	if (enable)
-		mtk_phy_update_field(regs + HDMI20_CLK_CFG, REG_TXC_DIV, VAL_TXC_DIV4);
+		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI20_CLK_CFG, REG_TXC_DIV, VAL_TXC_DIV4);
 	else
-		mtk_phy_clear_bits(regs + HDMI20_CLK_CFG, REG_TXC_DIV);
+		regmap_clear_bits(hdmi_phy->regs, HDMI20_CLK_CFG, REG_TXC_DIV);
 }
 
 static void mtk_hdmi_pll_sel_src(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-	void __iomem *regs = hdmi_phy->regs;
 
-	mtk_phy_clear_bits(regs + HDMI_CTL_3, REG_HDMITX_REF_XTAL_SEL);
-	mtk_phy_clear_bits(regs + HDMI_CTL_3, REG_HDMITX_REF_RESPLL_SEL);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CTL_3, REG_HDMITX_REF_XTAL_SEL);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CTL_3, REG_HDMITX_REF_RESPLL_SEL);
 
 	/* DA_HDMITX21_REF_CK for TXPLL input source */
-	mtk_phy_clear_bits(regs + HDMI_1_CFG_10, RG_HDMITXPLL_REF_CK_SEL);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_CFG_10, RG_HDMITXPLL_REF_CK_SEL);
 }
 
 static void mtk_hdmi_pll_perf(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-	void __iomem *regs = hdmi_phy->regs;
-
-	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_0, RG_HDMITXPLL_BP2);
-	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_BC);
-	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_IC, 0x1);
-	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_BR, 0x2);
-	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_IR, 0x2);
-	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_BP);
-	mtk_phy_clear_bits(regs + HDMI_1_PLL_CFG_0, RG_HDMITXPLL_IBAND_FIX_EN);
-	mtk_phy_clear_bits(regs + HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT14);
-	mtk_phy_clear_bits(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_HIKVCO);
-	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_0, RG_HDMITXPLL_HREN, 0x1);
-	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_0, RG_HDMITXPLL_LVR_SEL, 0x1);
-	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT12_11);
-	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_0, RG_HDMITXPLL_TCL_EN);
+
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_0, RG_HDMITXPLL_BP2);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_2, RG_HDMITXPLL_BC);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_2, RG_HDMITXPLL_IC, 0x1);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_2, RG_HDMITXPLL_BR, 0x2);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_2, RG_HDMITXPLL_IR, 0x2);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_2, RG_HDMITXPLL_BP);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_0, RG_HDMITXPLL_IBAND_FIX_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT14);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_2, RG_HDMITXPLL_HIKVCO);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_0, RG_HDMITXPLL_HREN, 0x1);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_0, RG_HDMITXPLL_LVR_SEL, 0x1);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT12_11);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_0, RG_HDMITXPLL_TCL_EN);
 }
 
 static int mtk_hdmi_pll_set_hw(struct clk_hw *hw, u8 prediv,
@@ -89,26 +91,25 @@ static int mtk_hdmi_pll_set_hw(struct clk_hw *hw, u8 prediv,
 	u8 prediv_value;
 	u8 reserve13_value;
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-	void __iomem *regs = hdmi_phy->regs;
 
 	mtk_hdmi_pll_sel_src(hw);
 
 	mtk_hdmi_pll_perf(hw);
 
-	mtk_phy_update_field(regs + HDMI_1_CFG_10, RG_HDMITX21_BIAS_PE_BG_VREF_SEL, 0x2);
-	mtk_phy_clear_bits(regs + HDMI_1_CFG_10, RG_HDMITX21_VREF_SEL);
-	mtk_phy_update_field(regs + HDMI_1_CFG_9, RG_HDMITX21_SLDO_VREF_SEL, 0x2);
-	mtk_phy_clear_bits(regs + HDMI_1_CFG_10, RG_HDMITX21_BIAS_PE_VREF_SELB);
-	mtk_phy_set_bits(regs + HDMI_1_CFG_3, RG_HDMITX21_SLDOLPF_EN);
-	mtk_phy_update_field(regs + HDMI_1_CFG_6, RG_HDMITX21_INTR_CAL, 0x11);
-	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_PWD);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_10, RG_HDMITX21_BIAS_PE_BG_VREF_SEL, 0x2);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_CFG_10, RG_HDMITX21_VREF_SEL);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_9, RG_HDMITX21_SLDO_VREF_SEL, 0x2);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_CFG_10, RG_HDMITX21_BIAS_PE_VREF_SELB);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_CFG_3, RG_HDMITX21_SLDOLPF_EN);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_INTR_CAL, 0x11);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_2, RG_HDMITXPLL_PWD);
 
 	/* TXPOSDIV */
 	txposdiv_value = ilog2(txposdiv);
 
-	mtk_phy_update_field(regs + HDMI_1_CFG_6, RG_HDMITX21_TX_POSDIV, txposdiv_value);
-	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_TX_POSDIV_EN);
-	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_FRL_EN);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_TX_POSDIV, txposdiv_value);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_TX_POSDIV_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_FRL_EN);
 
 	/* TXPREDIV */
 	switch (txprediv) {
@@ -132,8 +133,8 @@ static int mtk_hdmi_pll_set_hw(struct clk_hw *hw, u8 prediv,
 		return -EINVAL;
 	}
 
-	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_4, RG_HDMITXPLL_POSDIV_DIV3_CTRL, div3_ctrl_value);
-	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_4, RG_HDMITXPLL_POSDIV, posdiv_vallue);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_4, RG_HDMITXPLL_POSDIV_DIV3_CTRL, div3_ctrl_value);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_4, RG_HDMITXPLL_POSDIV, posdiv_vallue);
 
 	/* POSDIV1 */
 	switch (posdiv1) {
@@ -153,10 +154,10 @@ static int mtk_hdmi_pll_set_hw(struct clk_hw *hw, u8 prediv,
 		return -EINVAL;
 	}
 
-	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_4, RG_HDMITXPLL_DIV_CTRL, div_ctrl_value);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_4, RG_HDMITXPLL_DIV_CTRL, div_ctrl_value);
 
 	/* DE add new setting */
-	mtk_phy_clear_bits(regs + HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT14);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT14);
 
 	/* POSDIV2 */
 	switch (posdiv2) {
@@ -176,33 +177,33 @@ static int mtk_hdmi_pll_set_hw(struct clk_hw *hw, u8 prediv,
 		return -EINVAL;
 	}
 
-	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT3_2, reserve_3_2_value);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT3_2, reserve_3_2_value);
 
 	/* DE add new setting */
-	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT1_0, 0x2);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT1_0, 0x2);
 
 	/* PREDIV */
 	prediv_value = ilog2(prediv);
 
-	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_4, RG_HDMITXPLL_PREDIV, prediv_value);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_4, RG_HDMITXPLL_PREDIV, prediv_value);
 
 	/* FBKDIV_HS3 */
 	reserve13_value = ilog2(fbkdiv_hs3);
 
-	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT13, reserve13_value);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT13, reserve13_value);
 
 	/* FBDIV */
-	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_4, RG_HDMITXPLL_FBKDIV_HIGH, fbkdiv_high);
-	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_3, RG_HDMITXPLL_FBKDIV_LOW, fbkdiv_low);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_4, RG_HDMITXPLL_FBKDIV_HIGH, fbkdiv_high);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_3, RG_HDMITXPLL_FBKDIV_LOW, fbkdiv_low);
 
 	/* Digital DIVIDER */
-	mtk_phy_clear_bits(regs + HDMI_CTL_3, REG_PIXEL_CLOCK_SEL);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CTL_3, REG_PIXEL_CLOCK_SEL);
 
 	if (digital_div == 1) {
-		mtk_phy_clear_bits(regs + HDMI_CTL_3, REG_HDMITX_PIXEL_CLOCK);
+		regmap_clear_bits(hdmi_phy->regs, HDMI_CTL_3, REG_HDMITX_PIXEL_CLOCK);
 	} else {
-		mtk_phy_set_bits(regs + HDMI_CTL_3, REG_HDMITX_PIXEL_CLOCK);
-		mtk_phy_update_field(regs + HDMI_CTL_3, REG_HDMITXPLL_DIV, digital_div - 1);
+		regmap_set_bits(hdmi_phy->regs, HDMI_CTL_3, REG_HDMITX_PIXEL_CLOCK);
+		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CTL_3, REG_HDMITXPLL_DIV, digital_div - 1);
 	}
 
 	return 0;
@@ -302,7 +303,6 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-	void __iomem *regs = hdmi_phy->regs;
 	u8 data_channel_bias, clk_channel_bias;
 	u8 impedance, impedance_en;
 	u32 tmds_clk;
@@ -341,17 +341,17 @@ static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
 	}
 
 	/* bias */
-	mtk_phy_update_field(regs + HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D0, data_channel_bias);
-	mtk_phy_update_field(regs + HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D1, data_channel_bias);
-	mtk_phy_update_field(regs + HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D2, data_channel_bias);
-	mtk_phy_update_field(regs + HDMI_1_CFG_0, RG_HDMITX21_DRV_IBIAS_CLK, clk_channel_bias);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D0, data_channel_bias);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D1, data_channel_bias);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D2, data_channel_bias);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_0, RG_HDMITX21_DRV_IBIAS_CLK, clk_channel_bias);
 
 	/* impedance */
-	mtk_phy_update_field(regs + HDMI_1_CFG_0, RG_HDMITX21_DRV_IMP_EN, impedance_en);
-	mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D0_EN1, impedance);
-	mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D1_EN1, impedance);
-	mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D2_EN1, impedance);
-	mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_CLK_EN1, impedance);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_0, RG_HDMITX21_DRV_IMP_EN, impedance_en);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D0_EN1, impedance);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D1_EN1, impedance);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D2_EN1, impedance);
+	mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_CLK_EN1, impedance);
 
 	return 0;
 }
@@ -359,33 +359,32 @@ static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-	void __iomem *regs = hdmi_phy->regs;
 
-	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_TX_POSDIV_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_TX_POSDIV_EN);
 
-	mtk_phy_set_bits(regs + HDMI_1_CFG_0, RG_HDMITX21_SER_EN);
-	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_D0_DRV_OP_EN);
-	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_D1_DRV_OP_EN);
-	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_D2_DRV_OP_EN);
-	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_CK_DRV_OP_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_CFG_0, RG_HDMITX21_SER_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_D0_DRV_OP_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_D1_DRV_OP_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_D2_DRV_OP_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_CK_DRV_OP_EN);
 
-	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_FRL_D0_EN);
-	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_FRL_D1_EN);
-	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_FRL_D2_EN);
-	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_FRL_CK_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_FRL_D0_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_FRL_D1_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_FRL_D2_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_FRL_CK_EN);
 
 	mtk_hdmi_pll_drv_setting(hw);
 
-	mtk_phy_clear_bits(regs + HDMI_1_CFG_10, RG_HDMITX21_BG_PWD);
-	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_BIAS_EN);
-	mtk_phy_set_bits(regs + HDMI_1_CFG_3, RG_HDMITX21_CKLDO_EN);
-	mtk_phy_set_bits(regs + HDMI_1_CFG_3, RG_HDMITX21_SLDO_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_CFG_10, RG_HDMITX21_BG_PWD);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_BIAS_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_CFG_3, RG_HDMITX21_CKLDO_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_CFG_3, RG_HDMITX21_SLDO_EN);
 
-	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_4, DA_HDMITXPLL_PWR_ON);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_4, DA_HDMITXPLL_PWR_ON);
 	usleep_range(5, 10);
-	mtk_phy_clear_bits(regs + HDMI_1_PLL_CFG_4, DA_HDMITXPLL_ISO_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_4, DA_HDMITXPLL_ISO_EN);
 	usleep_range(5, 10);
-	mtk_phy_clear_bits(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_PWD);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_2, RG_HDMITXPLL_PWD);
 	usleep_range(30, 50);
 	return 0;
 }
@@ -393,18 +392,17 @@ static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-	void __iomem *regs = hdmi_phy->regs;
 
-	mtk_phy_set_bits(regs + HDMI_1_CFG_10, RG_HDMITX21_BG_PWD);
-	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_BIAS_EN);
-	mtk_phy_clear_bits(regs + HDMI_1_CFG_3, RG_HDMITX21_CKLDO_EN);
-	mtk_phy_clear_bits(regs + HDMI_1_CFG_3, RG_HDMITX21_SLDO_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_CFG_10, RG_HDMITX21_BG_PWD);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_BIAS_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_CFG_3, RG_HDMITX21_CKLDO_EN);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_CFG_3, RG_HDMITX21_SLDO_EN);
 
-	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_PWD);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_2, RG_HDMITXPLL_PWD);
 	usleep_range(10, 20);
-	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_4, DA_HDMITXPLL_ISO_EN);
+	regmap_set_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_4, DA_HDMITXPLL_ISO_EN);
 	usleep_range(10, 20);
-	mtk_phy_clear_bits(regs + HDMI_1_PLL_CFG_4, DA_HDMITXPLL_PWR_ON);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_1_PLL_CFG_4, DA_HDMITXPLL_PWR_ON);
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -445,12 +443,10 @@ static const struct clk_ops mtk_hdmi_pll_ops = {
 
 static void vtx_signal_en(struct mtk_hdmi_phy *hdmi_phy, bool on)
 {
-	void __iomem *regs = hdmi_phy->regs;
-
 	if (on)
-		mtk_phy_set_bits(regs + HDMI_1_CFG_0, RG_HDMITX21_DRV_EN);
+		regmap_set_bits(hdmi_phy->regs, HDMI_1_CFG_0, RG_HDMITX21_DRV_EN);
 	else
-		mtk_phy_clear_bits(regs + HDMI_1_CFG_0, RG_HDMITX21_DRV_EN);
+		regmap_clear_bits(hdmi_phy->regs, HDMI_1_CFG_0, RG_HDMITX21_DRV_EN);
 }
 
 static void mtk_hdmi_phy_enable_tmds(struct mtk_hdmi_phy *hdmi_phy)
@@ -484,7 +480,7 @@ static int mtk_hdmi_phy_pwr5v_enable(struct regulator_dev *rdev)
 {
 	struct mtk_hdmi_phy *hdmi_phy = rdev_get_drvdata(rdev);
 
-	mtk_phy_set_bits(hdmi_phy->regs + HDMI_CTL_1, RG_HDMITX_PWR5V_O);
+	regmap_set_bits(hdmi_phy->regs, HDMI_CTL_1, RG_HDMITX_PWR5V_O);
 
 	return 0;
 }
@@ -493,7 +489,7 @@ static int mtk_hdmi_phy_pwr5v_disable(struct regulator_dev *rdev)
 {
 	struct mtk_hdmi_phy *hdmi_phy = rdev_get_drvdata(rdev);
 
-	mtk_phy_clear_bits(hdmi_phy->regs + HDMI_CTL_1, RG_HDMITX_PWR5V_O);
+	regmap_clear_bits(hdmi_phy->regs, HDMI_CTL_1, RG_HDMITX_PWR5V_O);
 
 	return 0;
 }
@@ -501,8 +497,11 @@ static int mtk_hdmi_phy_pwr5v_disable(struct regulator_dev *rdev)
 static int mtk_hdmi_phy_pwr5v_is_enabled(struct regulator_dev *rdev)
 {
 	struct mtk_hdmi_phy *hdmi_phy = rdev_get_drvdata(rdev);
+	u32 tmp;
+
+	regmap_read(hdmi_phy->regs, HDMI_CTL_1, &tmp);
 
-	return !!(readl(hdmi_phy->regs + HDMI_CTL_1) & RG_HDMITX_PWR5V_O);
+	return !!(tmp & RG_HDMITX_PWR5V_O);
 }
 
 static const struct regulator_ops mtk_hdmi_pwr5v_regulator_ops = {
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index 4e167a421f0e..0450cb6288ec 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -116,7 +116,7 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 	if (!hdmi_phy)
 		return -ENOMEM;
 
-	hdmi_phy->regs = devm_platform_ioremap_resource(pdev, 0);
+	hdmi_phy->regs = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(hdmi_phy->regs))
 		return PTR_ERR(hdmi_phy->regs);
 
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index 5137d1c3345b..63ec39a343cc 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/types.h>
@@ -30,7 +31,7 @@ struct mtk_hdmi_phy_conf {
 };
 
 struct mtk_hdmi_phy {
-	void __iomem *regs;
+	struct regmap *regs;
 	struct device *dev;
 	struct mtk_hdmi_phy_conf *conf;
 	struct clk *pll;
-- 
2.43.0

