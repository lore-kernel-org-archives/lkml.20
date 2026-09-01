Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E47477980
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253780; cv=none; b=ObvqBwXLNX0TulNPI6GnbTTkt56tW4D+X4hIdkHgqex511ee/ELJOQEsMgzMoDOoJWKL+/Luz5O/Mda+bqBBwk0ttv3wl2h5zdhJszeCQ+cYOEhD1JVasYBlAAXW53tjCZ/FTa3XJYFFKt+eh0t8PCEJQ/WvEvf1sjY4OLlx+kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253780; c=relaxed/simple;
	bh=e3RnKQxvSBBwrBU/uS1PB5FHAGGn080Zg3kehKoxACc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pt6cLQer1nVE0A2hbI1ZxYEzvVqhJTtCjlidTJ2DvJAedw4y24OPQwcAw0ZBdsj4CE5NSHrio3vtK5O10EgG1r79Up6glCv9sKq6FlWI2S0u2xjOJC/Z75t4Vpyir4kNDWF1xI3mSAaRImrs301/JVDQ9AjqhahRkshLRhQGFNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XyoU5rZa; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XyoU5rZa"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4843f205a5bso928943f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788253771; x=1788858571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awL7EJRIIWZmZbuML6Yj4uYN8A8XYeaOTFa5cFWKueY=;
        b=XyoU5rZaN8DrLnoHg7O0uShD5n0JbSMPhWCwfM8jt4cIwcfljbTH1K3afb0N5Qo3d9
         f0+HMoNtBd8eKwwFHzfVhS/H3GdJZq6bv1bR82Kaj1MLTFTVallEJDrkTUvjJfGSob6k
         +nTPpq7akidGBKRMVxFJKnCEmwURBS2EVbUnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253771; x=1788858571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=awL7EJRIIWZmZbuML6Yj4uYN8A8XYeaOTFa5cFWKueY=;
        b=L/HJ9HRIgQK2e2yaxlrDupPgLsU4rO4CFXGAWyA6w7DvOm/5JOSQ763Jf0Bc0+4Ubk
         v3a/5l0FPEXjcc/dtZN8Rnr2hzn1Mrl1mkB+kktTPdMwuyIS3NSnKbJIF5eOetp+Qqmc
         D3tb/SuxQlY0InQYXMXzdexqDEOr0IAveP90yAd9uYSPX6rgmrSyp27bAonDpYSjpUwn
         N+8AQtAjF4/1k0MXsQyJ6KujcWBBvB4Rnbkp3bQ9/C3FjqA9Gx6AXgdUlc9sen64piJs
         7KA3Ba1GrAo0cebucao6TPxJXflrA8M/VL4YrPBbVKoWQ5TU3SjKhdzqLG2mcINJRuuk
         gZWQ==
X-Gm-Message-State: AFuF++ky4Ofv1ZVQB6xZwpuFbv6FiFHG489kEcbr/PH9E00pUmryTTHs
	bDYB73GkpebBOInmyjsPx75ZYkX6MB53gjpu47SpfTWq//dqsr6kuJfs3GTBqRLGB7cfxjuX0JS
	NG9TdYyY=
X-Gm-Gg: AR+sD10pWjUdEzXk8Jh42iy4QeHWtiHyUSAMDUex0jhcMa7vSwK/t7K2MiGKXLInP8/
	USATfONZmo/DCyJVw3oeIbpJdztA4HZQteWEPsUoWbY+Mdu9e9vqpo7YXZTO45dzhAVMpMzqPlr
	coq/eq2jQnfSuZrBm1v/QypNXFwu/1HH3oJNOYGG1uwoIKTuiaR1phhOVo9O0zJQCW1g2yR2fOj
	Ov/XlmaG5/eQLGJ6nDSgYNjZG746ZD3EhxL8w9v3OpA/D6r4RuVcR2dHm7ySHVMwp4ijiSZB0DT
	ub8P4YC2GLHb2BVlT3Tk9PvgAobGEB1RcdVhjEUrH4YzXIY3hmXN6pN1BUXSLDrQnzcitjtxvJV
	Ia6uVZcn+/1m3HwqvY9zP24GuTs+3COl9rmeuGKy/YObV1NwZRBfDGl943HxTtRoInKPbAguqgl
	lZ5uf2Ig09NICMX/DQnvapTXMlLfbLYxDgXQyBefAMGa+kdqPCseeWij8OTXPfP4TxxaXMJhbp1
	d87NfPFGZdB/t0uQYFtFu9O5muXvFHRhdFiEtrk1m5oWxanlzUrGdA+ZoRgjLGgx2YOg1SKeID4
	l1YWZxnUkL6PyuSSeYxSoVMu6bSR636Gcx71d2R00zGK6K496Shl/20=
X-Received: by 2002:a05:600c:19c8:b0:49b:c8e:a211 with SMTP id 5b1f17b1804b1-49b91c20bfamr497636215e9.5.1788253771241;
        Tue, 01 Sep 2026 02:09:31 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c425cesm3825273f8f.6.2026.09.01.02.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:09:30 -0700 (PDT)
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
Subject: [PATCH v11 2/2] clk: imx: pll14xx: support spread spectrum clock generation
Date: Tue,  1 Sep 2026 11:05:18 +0200
Message-ID: <20260901090912.585681-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
References: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
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

Changes in v11:
 - Drop the dt-bindings/clock/clock.h include and use the enum
   clk_ssc_method values from clk-provider.h, as clk-scmi-oem.c does.
 - Disable SSC and clear the modulation fields in SSCG_CTRL when no
   spread method is configured, so that a setup left enabled by the
   bootloader is not kept active.
 - Skip the SSC setup instead of dividing by zero when modfreq_hz is
   zero or mfr truncates to zero.
 - Reject mfr and mrr values that do not fit the MFREQ_CTL and MRAT_CTL
   register fields instead of letting FIELD_PREP silently truncate
   them. This also prevents the 10000 * mfr multiplication from
   overflowing.
 - Compute the mfr divisor in 64-bit arithmetic, as the 32-bit product
   could wrap with out of range modfreq_hz values.

Changes in v10:
- Drop 'Reviewed-by' tag of Peng Fan.
- Adapt the driver to the new infrastructure. Implement the
  set_spread_spectrum() and get the modulation parameters from
  struct clk_spread_spectrum.

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan.

 drivers/clk/imx/clk-pll14xx.c | 79 +++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index b6f1cc9f5700..0c2b812ba20c 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -13,6 +13,7 @@
 #include <linux/export.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/jiffies.h>
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
@@ -366,6 +377,58 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
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
+	sscg_ctrl = readl_relaxed(pll->base + SSCG_CTRL);
+	sscg_ctrl &= ~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_MASK);
+
+	switch (conf->method) {
+	case CLK_SPREAD_CENTER:
+		sel_pf = SEL_PF_CENTER_SPREAD;
+		break;
+	case CLK_SPREAD_UP:
+		sel_pf = SEL_PF_UP_SPREAD;
+		break;
+	case CLK_SPREAD_DOWN:
+		sel_pf = SEL_PF_DOWN_SPREAD;
+		break;
+	default:
+		/* No spread: disable modulation and clear any stale state */
+		goto out;
+	}
+
+	if (!conf->modfreq_hz)
+		goto out;
+
+	mfr = div64_u64(parent_rate, (u64)conf->modfreq_hz * pdiv * BIT(5));
+	if (!mfr || mfr > FIELD_MAX(MFREQ_CTL_MASK)) {
+		pr_warn("%s: SSC disabled, modulation frequency (%u Hz) out of range\n",
+			clk_hw_get_name(hw), conf->modfreq_hz);
+		goto out;
+	}
+
+	mrr = (conf->spread_bp * mdiv * BIT(6)) / (10000 * mfr);
+	if (!mrr || mrr > FIELD_MAX(MRAT_CTL_MASK)) {
+		pr_warn("%s: SSC disabled, spread (%u permyriad) out of range\n",
+			clk_hw_get_name(hw), conf->spread_bp);
+		goto out;
+	}
+
+	sscg_ctrl |= SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
+		FIELD_PREP(MRAT_CTL_MASK, mrr) |
+		FIELD_PREP(SEL_PF_MASK, sel_pf);
+
+out:
+	writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
+}
+
 static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
@@ -390,6 +453,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv,
+						   rate.mdiv);
+
 		spin_unlock_irqrestore(&pll->lock, flags);
 
 		return 0;
@@ -411,6 +477,8 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
 
+	__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv, rate.mdiv);
+
 	spin_unlock_irqrestore(&pll->lock, flags);
 
 	/*
@@ -437,6 +505,16 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
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
@@ -509,6 +587,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.recalc_rate	= clk_pll14xx_recalc_rate,
 	.determine_rate = clk_pll1443x_determine_rate,
 	.set_rate	= clk_pll1443x_set_rate,
+	.set_spread_spectrum = clk_pll1443x_set_spread_spectrum,
 };
 
 struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
-- 
2.43.0

