Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639524EA367
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449944; cv=none; b=iAR7ylvLa604UBcyg/2guPLvYcE5waB40wy0qZ8iLZRoH8sI/TjGHTONA4S68VQhJvyDfUWFvZAI41oA//NOBTwH6IVVZHbaLkS8pmIUlerWoJdvr2R5lKRAKMnxrEY2TichlLhheb0zRv8zshSlVGO+J93if4ocmhI+D0fsikc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449944; c=relaxed/simple;
	bh=5VcRoJMWHY4qVgnecHiIGpAC6SQWrjspNdzORitn378=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMQPbmfA2PLCC0Qb9dHgTqGJYNfJjwdjCbnlN1XNcW7jE4DA6N9/hMTzv5pMeVIRCOrXVlKoNiFOfbg0hC1k5l832G5bcnGDZE6ZFT0T3snWDKlIdCsOlKT3dAvU9+4rbj+msYfpcuKVZvWw+L6YnoBFtKJpeWFUPSXmR+5EZBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=RPZ0qdM0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="RPZ0qdM0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441a2ba14so7601f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788449940; x=1789054740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cm4uXra2L9WOBsP9ackTlqi/Ub+9G7ZP+SENv4y3Q0o=;
        b=RPZ0qdM0ADegwUVmfNDD/y0tiBym8CzDqc253AecJBQFIM81AUcj5GzJ1ImJtaELJb
         v4a4DLNn8tS6ksroetUOQlYOsgzOn+c63zNRcGyiev9WmtGkz3oRGDv6CbSN5PmHAbJ9
         3G6XAVCChPgWP4xebVfks7lVLH21XdGGMD7/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449940; x=1789054740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cm4uXra2L9WOBsP9ackTlqi/Ub+9G7ZP+SENv4y3Q0o=;
        b=KmsgLeWoHvFkYWzFohDbcox0Xi+BJS/TkrpdLhOyJnSmNEK1creAc5PP8bPXGlmrR+
         nmJPdzcqnq7odlSwadk9ork/A9U675sr3gMl0QFyb567KBUKPjZsGYX8kd4EjmtqJPs1
         ukZWOagSsaQCDjjWSE1nq5KOUWT1y1ncWTvdhbJ6q2nwPPnUU9xDaucRIb7imga4AyYK
         Ap64qkTcqij1pRpD7nmmPt9lzxABn547t+tSFnPEqdwztrw0704JnX97Q0UO6+FG5x+v
         iVeAZGgsKFdmMPMcXkRohXJj2IRCGKAkPX2XKCJzrx5nE6n1QFfNfCwf9COnETjhSrot
         okYw==
X-Gm-Message-State: AFuF++mNhjR7qBnop4TD2dNRyalzU2q6cCDSqe/eNexhkqsNUCO/wsRO
	2tIEson0JGmPoQaUcUsJ8+HnEMxMq7DwKR+lggxagcTqCnt0WFnUuohkP6Vnca8YVPB8EvddvBu
	HQngG7SI=
X-Gm-Gg: AYBFou17Jd+0B5PuqX3Va4ZWIPB6qyy6btMorWGYq5Etl5IBz2RPvCpDb5W4aNS0S0t
	jn58UCUR93rLpSMagNHcFp9M3QFrAT05fciM6wuXEH9x4AAF5JiaEDC8ThA4MDEsD3F1HajyQff
	gK3Xj3LZtO4+dm3JodsEmr+m+JPyyfUq2MNX8BFjDfVKyxyA7GuadH+6kezMVXb+EdENY02kJAJ
	D1ONDK+kXMCjbvA3nk50uBS1SIc+BYoFE1L6w8laJAWlgYoL9Igcinccr+m4x+I3L17bXFyFWkK
	MEhmrM22nbRH5bM+JynUdyUt1N3/b7o4zTIAeFprP22n7eFOPCX7fGf2YyzBw0BXXL7ezjz7ACU
	TMYtgXCgGKRu22lUawGkWOzG9QX40Xsd/JmKc+Hd9vXTWTtbao5uA/VhY9uu8DzV/fTiEnuf4KV
	vFNfiasQN3IFMi5R4VrMidC7kGpS5WXRL+nItHISC/rHt0uEt4DQZ4ZVwzuC7aYgXEWs9xiNz/9
	mbnwGZYZ+HJXwzOdohTOaK4R+h75RJSnc4huPEBtW4qi9VhHP4i4aQRHkBGuMOXqtHpndxpN+ZM
	/xD8VvMEgMs31OwJ+jZ6uTJ/RYc9r600em+M3T66B0QIIODmZ3cACmkvgXqFfiLTqUY=
X-Received: by 2002:a05:6000:2210:b0:47f:ec8a:214f with SMTP id ffacd0b85a97d-48488f0f6c6mr22597779f8f.15.1788449940413;
        Thu, 03 Sep 2026 08:39:00 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72df2sm15366301f8f.1.2026.09.03.08.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v13 4/4] clk: imx: pll14xx: support spread spectrum clock generation
Date: Thu,  3 Sep 2026 17:32:16 +0200
Message-ID: <20260903153836.373267-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
References: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v12)

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

 drivers/clk/imx/clk-pll14xx.c | 99 +++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index b6f1cc9f5700..5b187101c558 100644
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
+	if (!conf->modfreq_hz || !parent_rate || !pdiv)
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
@@ -437,6 +505,36 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
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
@@ -509,6 +607,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.recalc_rate	= clk_pll14xx_recalc_rate,
 	.determine_rate = clk_pll1443x_determine_rate,
 	.set_rate	= clk_pll1443x_set_rate,
+	.set_spread_spectrum = clk_pll1443x_set_spread_spectrum,
 };
 
 struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
-- 
2.43.0

