Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1416D4B146C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191297; cv=none; b=ITVHYbgdD1N2ubfHf/0OTth0gcfbX06IrVCwNHUPvxj3nKRbLFY0oQFT2bo4jH54HWe8gtEiM6YuBIMDX23SIqLCMiSzyJDV6ID+kHGeReCOvsXxGIvWLwA1YJyAXE+Ursdn2ULi07ZDqbL7jdf9L0pWrtooDh1vSg5uheyyWjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191297; c=relaxed/simple;
	bh=nlCxMmVRBCR3ngQYUpa889Txd4ozU/oUdzTV9qa2+co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pr/U3TCrlNcvsItLEvfOIJqGRYE3Vc7cMhRzdheQxavSc0wCnS7M9SR2kl+mDpFvVa+0UZ2KzzORft1S1rHUf93fRZKq3JO+LJyAGwb4SzFmtmZrcPEvoQ24j9Jd+0aYngzAB6ofSEIkPNv4g3aNxx97ugUooZGhsnLF4d56M9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Qw646jz+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Qw646jz+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b965570d7so34168255e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788191293; x=1788796093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/h+0+I7fXQ52AgonO29/UsUwGiBzhMLYBL0Aiheh2c=;
        b=Qw646jz+crJXQ6yvrlj4JposB8/HeHVHfrDVxra1ACErzPvEHogqmurN0nYWpxFTe5
         eMPNOaCN1ODkhN0rYTPGiMDfe5/K32YrvGc2Qdf3xPLc9ILkea5BTBaidAcrJe42w6c8
         qCSdl/sUehz+j36hFGbtwJEi1n3/+MTYTdffM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191293; x=1788796093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N/h+0+I7fXQ52AgonO29/UsUwGiBzhMLYBL0Aiheh2c=;
        b=V0nf2/gSyNCcM9/8RBE4i67khQVUvehykIz6HnAe61NyDg4kFt8sznJoBufrUDfKFQ
         OSKltBzvAMnd7cJNXBSaVSfINOnsAK8V378pkl/8cqXS4R/bfBcPVySlvaS7N4RZmoq8
         SrSMhoix0+7ercCL8oLufQPgFav/K31Xjy+hWkKvHZye7Og6qqVBq5gW+YzNuJ7XZFC9
         GRM0GFxPQ2pbj7CbdytVaIlw1yrKKQ/3w5hRCEIYBGlcfkRgXyK/P9ilA/vl0wMZhdPL
         0rI4ewDxqp6Q7Cj2MsHtjGOI01+foCcZXVu4eony4f3UkUjcq4Bg7dckyAayHiSYwU/0
         ZIYA==
X-Gm-Message-State: AFuF++lF6M6diUTAHFhqTKU+DyL62frb66o/PLe6JoyRUW7qLJLtqmfY
	hievGgN+Q0d0h6xTDalbD0TG1I5dFBrVXbbvXeKnTlE4FtXjxCmGAOvrR3edN06+Ev68k4J6TGl
	A9oBFeD0=
X-Gm-Gg: AR+sD10Z9vGk6o4mfQM+iK4YVOXJTCSKmOkKuTX+TX1zQK1U4nV3saPWV4iCPYRR5Og
	w06XWOiDx4Bqi5iYC7Ab9Hgfo59cd3Tses1NVLp7H68FwM2cSqQgjQl1SHQRf4rXRpL+dpKzyZP
	MFhbLUYirpI6c/rBJw5sKsxsaiq6OsuQ+LqLmTStlNTG54uDoZoWeemX1jekfScGndFF6K5stbm
	QUhx1zhT2vUP6rXyMfJ1GkDKYmtIfPOyPLYOg2rV4Tm6JNNdM/hrcr56j/AUr7Hx7xAh3/LdcWp
	NKLq0SEz8h3waepWED5vqqEFZhMtPnwAaHWHpSyQDlkB4zVemJ8Xiz4GNi+T6LKSbF+5FGy8TYb
	FoJL5WSrNlRsBftSkQVHauLmnYL8JlmSfk9pZqLzHjNwsfVfeeZ3PiasgbP7aq7KsgNI87JVJy2
	neiUAvKH5zOQGVh+ooZHgvidksAIL8Xp30EJqS8Pe0JSWNS5l8aH7IxIbAjNdHWj7mVR74x0HrS
	bT8VA6DSQpduYRBlsgLC3j1I1l+TQRPEdVu3sSZigJT8Z+z5YDkQRB+c2X1tgn2HOvXMwm73Y5o
	lELMMi4/Z8l6rHL2QYIOc5YWQEf+D5iznEwEojozAsws8LaP/767N0pJ4Sj+
X-Received: by 2002:a05:600c:4e01:b0:49c:cedc:768a with SMTP id 5b1f17b1804b1-49ccedc76a1mr324658675e9.16.1788191293295;
        Mon, 31 Aug 2026 08:48:13 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9269f1b6sm220191845e9.4.2026.08.31.08.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:48:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 1/1] clk: imx: pll14xx: support spread spectrum clock generation
Date: Mon, 31 Aug 2026 17:27:01 +0200
Message-ID: <20260831154752.15401-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831154752.15401-1-dario.binacchi@amarulasolutions.com>
References: <20260831154752.15401-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for spread spectrum clock (SSC) generation to the pll14xx
driver.

Tested on the video PLL of i.MX8MN and i.MX8MP based boards.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v10:
- Drop 'Reviewed-by' tag of Peng Fan.
- Adapt the driver to the new infrastructure. Implement the
  set_spread_spectrum() and get the modulation parameters from
  struct clk_spread_spectrum.

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan.

 drivers/clk/imx/clk-pll14xx.c | 58 +++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index b6f1cc9f5700..27a637847f57 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt) "pll14xx: " fmt
 
+#include <dt-bindings/clock/clock.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
@@ -22,6 +23,8 @@
 #define GNRL_CTL	0x0
 #define DIV_CTL0	0x4
 #define DIV_CTL1	0x8
+#define SSCG_CTRL	0xc
+
 #define LOCK_STATUS	BIT(31)
 #define LOCK_SEL_MASK	BIT(29)
 #define CLKE_MASK	BIT(11)
@@ -33,6 +36,13 @@
 #define KDIV_MASK	GENMASK(15, 0)
 #define KDIV_MIN	SHRT_MIN
 #define KDIV_MAX	SHRT_MAX
+#define SSCG_ENABLE	BIT(31)
+#define MFREQ_CTL_MASK	GENMASK(19, 12)
+#define MRAT_CTL_MASK	GENMASK(9, 4)
+#define SEL_PF_DOWN_SPREAD	0
+#define SEL_PF_UP_SPREAD	1
+#define SEL_PF_CENTER_SPREAD	2
+#define SEL_PF_MASK	GENMASK(1, 0)
 
 #define LOCK_TIMEOUT_US		10000
 
@@ -44,6 +54,7 @@ struct clk_pll14xx {
 	int rate_count;
 	s16 delta_k;
 	spinlock_t lock;
+	struct clk_spread_spectrum ss_conf;
 };
 
 #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
@@ -366,6 +377,37 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static void __clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
+					       unsigned long parent_rate,
+					       unsigned int pdiv,
+					       unsigned int mdiv)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct clk_spread_spectrum *conf = &pll->ss_conf;
+	u32 sscg_ctrl, mfr, mrr, sel_pf;
+
+	if (conf->method == CLK_SSC_CENTER_SPREAD)
+		sel_pf = SEL_PF_CENTER_SPREAD;
+	else if (conf->method == CLK_SSC_UP_SPREAD)
+		sel_pf = SEL_PF_UP_SPREAD;
+	else if (conf->method == CLK_SSC_DOWN_SPREAD)
+		sel_pf = SEL_PF_DOWN_SPREAD;
+	else
+		return;
+
+	sscg_ctrl = readl_relaxed(pll->base + SSCG_CTRL);
+	sscg_ctrl &= ~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_MASK);
+
+	mfr = parent_rate / (conf->modfreq_hz * pdiv * BIT(5));
+	mrr = (conf->spread_bp * mdiv * BIT(6)) / (10000 * mfr);
+
+	sscg_ctrl |= SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
+		FIELD_PREP(MRAT_CTL_MASK, mrr) |
+		FIELD_PREP(SEL_PF_MASK, sel_pf);
+
+	writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
+}
+
 static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
@@ -390,6 +432,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv,
+						   rate.mdiv);
+
 		spin_unlock_irqrestore(&pll->lock, flags);
 
 		return 0;
@@ -411,6 +456,8 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
 
+	__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv, rate.mdiv);
+
 	spin_unlock_irqrestore(&pll->lock, flags);
 
 	/*
@@ -437,6 +484,16 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
+					    const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+
+	memcpy(&pll->ss_conf, ss_conf, sizeof(pll->ss_conf));
+
+	return 0;
+}
+
 static int clk_pll14xx_prepare(struct clk_hw *hw)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
@@ -509,6 +566,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.recalc_rate	= clk_pll14xx_recalc_rate,
 	.determine_rate = clk_pll1443x_determine_rate,
 	.set_rate	= clk_pll1443x_set_rate,
+	.set_spread_spectrum = clk_pll1443x_set_spread_spectrum,
 };
 
 struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
-- 
2.43.0

