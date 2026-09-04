Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF89F4570FD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516781; cv=none; b=t7n/zbAXRuVH2fgcIzzZlgw4EoTfHllu5M80+LnZsUcgTLM9dOS6ag6rLgpPC8Ds5WWfvSVfu9HERa8cUhwyG+Ekh7XHtxrJrlL8sDZ/U1aEFbMeAaLwBvwFwam9qNMR74mL3dC09pxpY20aaCPEGEubRjmTkI+lS6/kO5fpyeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516781; c=relaxed/simple;
	bh=4DxJyEuA+T0h7/bpEIXzn7e/8Z/b3XxwkEaB7qbGt10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pNVpFlUdWXnUkIydsM3JurSpZcS1Ehh4yYYdupAA1QzxpmVmhJOk3Ri72KHAYIRKCzW3AJmQAdWOhAYjYN/LWmmqV+0xaVUmn6h3RHQANrFTxhrKnbbRwuvhN76gkwD9/e1rVKJPXI5C/o9El6eOimDPC8r6RfG3d/f0zq+pIYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=EAT9PjnZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="EAT9PjnZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso6855275e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788516777; x=1789121577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWVY1uMj4PCC62NWVYIfzX5Mbc8Yyn+zUzGlrLMkZwU=;
        b=EAT9PjnZ4sXey1wMqnFBV52H3I5CcprIwv6RHm7rk1O+YBZYEymVoR9zm6kUgBH4gm
         zO39nA37/GbvVKDT7q0TWARcDtV+sx6xJNNELbMSbtOKruP+Jd4jAEneL65kr56Fvxln
         WgfzVLvBlZMsoldQF+kMfCqzx5wWti9J4OnyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516777; x=1789121577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hWVY1uMj4PCC62NWVYIfzX5Mbc8Yyn+zUzGlrLMkZwU=;
        b=emKWvglPqUEEAeoUJFUf8sMN+moxyTWvXwCRQQrAUpPT2ff1JGP88Ol+9t9HDO1O5j
         YstvihhEoqpOCDmiY8sDY3VnfEpI4/xgnW6OMx+/DsB8qbkXCgtPNwFwfllhb6nCZknu
         YKRFxNLxBFk22nm51x6tgNpeLvArqHvME9b6tBcIVWwyn8W81/jWrISpJUIksQ56Wrp7
         oz1Pi3ojNo2ao9IK4KVPj+TWNYfFUvCvlQC22o52JV/7QkxiLPO1hFG226svnrOs0Bxh
         o1LfO29aE9xe8GWxjKqIB0ZOQHttdXamKrzkVQaRrMcgpXubUU0lgtNU6zMUV/EtxZmg
         L4wQ==
X-Gm-Message-State: AFuF++k1otyh8GF2ybAvIWpbcF/LO3XPu1EDHwO212WwqgtYmXhXRGBJ
	4TdmCjqHGqrDwWqiIiU+dpOt0CSIQlCug0bXvrf5uoWVtmuWJUVVG3mi5QgEw8w/zsZFP9e8dfq
	xxLBWSLo=
X-Gm-Gg: AYBFou3tqHwN67cSzkX6uz2lEJy/RQk0YFwnfV5UF+MFr/SjgoOzhZilDaxA+e/t3JQ
	EAW7u0s1mJglJt+wUcipITfw3tJ099MYWgvKiEYLhsmS7DQF2RKmvRvTgWgTIWvRSoCrQlmBbOr
	LjkuTlHu8UWmYLcsmtzK8qY3akcDEEyYzR3TaF4jq8wDsVn0qa35/4MYaaRdahqK8917JRQj0Bv
	Jcl/N8I0BmF/PsNxdG5W8WHBukOzjWUZZhSC86SssLSBWku5Zq0s+Z5QVYSIvkIZdCrBqJlYn1O
	50OQ29pmOEyGB963PgXWvRz7fiX5uSQedF1xWJgYNHk29X2GVbWB85PfrYD7jBO11VsNpQlpGUv
	LNq0MXbE5qWcam2xATqG1S8MCZOZiKqbupzTWTdNoOQxbn5u0UkYpMk6RWWEUtUiCz4B9QSM4iS
	iZTGHr2vpBu3VbTceaCEo1+8n6N8xcPK4gFFVyBzqy+84BaNDlL1DKtgX/+qz1r2Xy2U1PVzKcG
	b6dTq5658ZxigzdnCTLZ5an/sE+fuuD+9jEKgfHTkp37NBrdewDbZb2bSqy18CrK9mWS48s2clu
	wzCTvwXMLmqYaRUfW54NfcpsY4iMwOxahLY2TnNFxqxnmlI/GAmJfjo=
X-Received: by 2002:a05:600c:37c8:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49cf826c4e2mr44990695e9.16.1788516776720;
        Fri, 04 Sep 2026 03:12:56 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm5317990f8f.7.2026.09.04.03.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:12:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v14 4/4] clk: imx: pll14xx: support spread spectrum clock generation
Date: Fri,  4 Sep 2026 12:06:33 +0200
Message-ID: <20260904101243.412006-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
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

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v14:
 - Rate limit the warnings on out of range SSC parameters, as they are
   re-evaluated on every rate change.
 - Add a comment on why the mrr computation cannot overflow.
 - Add Reviewed-by of Peng Fan.

Changes in v12:
 - Apply the SSC settings also from the set_spread_spectrum() callback
   to handle the case the clock framework skips set_rate() if the
   requested rate is unchanged.

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

 drivers/clk/imx/clk-pll14xx.c | 103 ++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index b6f1cc9f5700..84e081193f24 100644
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
@@ -366,6 +377,62 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
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
+	if (!conf->modfreq_hz || !parent_rate || !pdiv)
+		goto out;
+
+	mfr = div64_u64(parent_rate, (u64)conf->modfreq_hz * pdiv * BIT(5));
+	if (!mfr || mfr > FIELD_MAX(MFREQ_CTL_MASK)) {
+		pr_warn_ratelimited("%s: SSC disabled, modulation frequency (%u Hz) out of range\n",
+				    clk_hw_get_name(hw), conf->modfreq_hz);
+		goto out;
+	}
+
+	/*
+	 * No overflow: the core limits spread_bp to 10000 and mdiv is a 10-bit
+	 * field, so the product is at most 10000 * 1023 * 64 < 2^32.
+	 */
+	mrr = (conf->spread_bp * mdiv * BIT(6)) / (10000 * mfr);
+	if (!mrr || mrr > FIELD_MAX(MRAT_CTL_MASK)) {
+		pr_warn_ratelimited("%s: SSC disabled, spread (%u permyriad) out of range\n",
+				    clk_hw_get_name(hw), conf->spread_bp);
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
@@ -390,6 +457,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv,
+						   rate.mdiv);
+
 		spin_unlock_irqrestore(&pll->lock, flags);
 
 		return 0;
@@ -411,6 +481,8 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
 
+	__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv, rate.mdiv);
+
 	spin_unlock_irqrestore(&pll->lock, flags);
 
 	/*
@@ -437,6 +509,36 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
+					    const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+	unsigned long parent_rate = parent ? clk_hw_get_rate(parent) : 0;
+	unsigned long flags;
+	u32 div_ctl0;
+
+	spin_lock_irqsave(&pll->lock, flags);
+
+	pll->ss_conf = *ss_conf;
+
+	/*
+	 * Apply the configuration to the hardware right away, using the
+	 * current PLL dividers: the clock framework does not call set_rate()
+	 * if the requested rate is unchanged, so relying on it would leave
+	 * the SSC settings unapplied when the PLL is already at the target
+	 * rate (e.g. configured by the bootloader).
+	 */
+	div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
+	__clk_pll1443x_set_spread_spectrum(hw, parent_rate,
+					   FIELD_GET(PDIV_MASK, div_ctl0),
+					   FIELD_GET(MDIV_MASK, div_ctl0));
+
+	spin_unlock_irqrestore(&pll->lock, flags);
+
+	return 0;
+}
+
 static int clk_pll14xx_prepare(struct clk_hw *hw)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
@@ -509,6 +611,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.recalc_rate	= clk_pll14xx_recalc_rate,
 	.determine_rate = clk_pll1443x_determine_rate,
 	.set_rate	= clk_pll1443x_set_rate,
+	.set_spread_spectrum = clk_pll1443x_set_spread_spectrum,
 };
 
 struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
-- 
2.43.0

