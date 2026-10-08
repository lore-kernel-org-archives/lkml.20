Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5CD3C3F4E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791441815; cv=none; b=JsHf3iz5MualFsBJuwClndmsV07ZzWs6aEhkQcCCSlWcZ1xHKjgW1J0kI+O5kTl4rftyHNQqCvddZYp5qFW8lebX+akppTlgxi/3Z98n50tEL2ClXT1LC54uhS3mOf1vLuhEbk0T4xyd4uI7ahbrkUtBHZhbK/HOiDcOktv1Q2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791441815; c=relaxed/simple;
	bh=HnGgah0wBuNiHykmKHpREb3aXBADRquza6/DXRMn7Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pi5+d5h1bHDnIA8pU+VsNVykqVGbYOlJoglf2C+UxGW0G88mUYoe89rVx9iauvth96c+Xlnc3K6MaILDDYe+gN6j0uotCBoCY+1cfDfAIxDCzCSxia2FEDVmYTvckS9GOqMaMSxB4k0eQodNb7pc0tqjL+3FlTM+coVXOXCF1F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ut1bfziO; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ut1bfziO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e541dc9cb9so13404255ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791441812; x=1792046612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAIjG4ZIMr61qlNuyGnhP301Ha6G3tgAGGAQLhPz8L4=;
        b=Ut1bfziOWOfNYQDjhwkMVuftq3E6WaBvKLA99+FEGa/qPOvofNGWdKO+jrUD/xvreQ
         HfU7BqDyIdDX/ihBIAHkwThOhlnXKcwMa4agONtO+xxFxQaSaVVbJKk03cEqD1DJhDWz
         ZstyP/ISYYBZHKe4cKpRPMESkDbNarCd9zBZEcHthO6/e1t1qosVDEL6BDtd3qkx2noF
         N3bxEw+AKDUt6QctLNfeNQ6xOfL2pactr/SV54W7GCrvXFRfXeXGquap8D6gwNDPpU9/
         h16aq7pbJHvYWecuCfJ2SBXeZgPVS3flZejl6AeS3xDqYyAygU9zMjDZ30xdPUfWKqJO
         Dyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791441812; x=1792046612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAIjG4ZIMr61qlNuyGnhP301Ha6G3tgAGGAQLhPz8L4=;
        b=PYG9Sinw18Ewy8huMMkU24lN9z/Yw+iITRRCuBbVjhy2aLsFDe3VFcuEelZeSOtfI1
         u8PF7a9PHiIrRQ7IvRyO2TmFi91pMG/yb1HsP0Oa8jnh9IWP71vMVCmTbrsGPT9KqXaA
         It40NhnPi8POm4mej+5R0n3mFVGGtIjrdLMIc1fGM9tLPw4TNzvSZFpCf242vztpNdED
         AQdOhHdf4mzcZFei8Km7+9Fx0JpEAZupFz7gfXTxnPNh5Hiorx6OlZTmF2s1wtTqvk1c
         Zal6jkX83pM8CYcZ4mO926Zd3Uxjz+5/kyi7Pn0jj6OXW1jgIZ6HY0DXTp6GbkP1Z6Pb
         jxjw==
X-Forwarded-Encrypted: i=1; AKwUvBw8HqUd0OuznSbXwSJlMxSZvY761iYdX5YD/EP/a+nubDY7vbQF8hwunC/yDtxmfAob5JDpdTsem/jRkTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJL4nXb4zoSm0dl/4VoRulZIdvBrP/bqTWgr6TYWGm+aEKpwixp
	BrRzgSbYkbPr+wCZ8DBSJI0KDpE6ZIUO4Jdreqfxb8ChSh8sc6rlztk1
X-Gm-Gg: AYBFou1BA9crWYQkPvtZmv74fjozKT101NlnNSm2hdbeRX2O64jzE+yYpzXkzQW0fN1
	5Ow5Arfrgj3jjSy4DMZNrMx/u4PYybyxqCwFu0HU7RcixhTihfDuHBs49jM0HhZOBmkjf6UDvyk
	tAKqxbrvjFgSHOK8YaHJbzFX6rJGtyIKm+QF46nzrEEZmWteH3BbnW/iG5SzdG/ZIJy9OTjKNL6
	gcbLX8utdt8DC6zzrNAkkjinwag1xYeu0hBZe8OzqlPs8FQHb6hSYxLYx8q2/3m4Kkaq3klRxCo
	0U5WirJe9R7pkCUtEazM4sWVIWr4ynpJrTKWVBjDdgN6ZC8H3xmVZ973SLHADio5/IJ8ra615IG
	Wj+Tvjg8D29RffGy6fmk5H5oVP0+o27ePpH2epEDZVWwOr6WjMcMK8Wa2oUUDF0T4oxcz+GBshH
	vb7hSOMYosy0imaoKlwbiVPrHeLyZ6sjXYFDsBLrAdu0/Tq4nwSUzRa9gTLGXBCWX5UStOIsa8E
	IUs6uiA/yuJOwXQY5NfbzZ7B8eA3SudzWVUjNR/lZqoKEGKMitDaOR+gkbdfnA=
X-Received: by 2002:a17:903:3c6e:b0:2e5:3451:565 with SMTP id d9443c01a7336-2e6004e63e6mr38271205ad.33.1791441811505;
        Wed, 07 Oct 2026 23:43:31 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046feacdsm19997845ad.18.2026.10.07.23.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:43:31 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 1/1] clk: nuvoton: ma35d1-divider: use direct formula instead of divider table
Date: Thu,  8 Oct 2026 14:43:07 +0800
Message-ID: <20261008064307.2757324-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008064307.2757324-1-a0987203069@gmail.com>
References: <20261008064307.2757324-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADC clock divider register implements rate = parent_rate / (2 * (N + 1)),
which was previously modeled by building a clk_div_table with one entry per
possible divider value (up to 2^width entries) and feeding it through the
generic divider_recalc_rate()/divider_determine_rate()/divider_get_val()
helpers. That is unnecessary overhead (a large table allocation and a
linear scan on every rate lookup) for a relationship with a simple
closed-form expression, so compute the rate directly instead.

Drop the mask_bit/mask mechanism as well. The previous code unconditionally
OR'd an arbitrary bit into the divider register on every set_rate() call,
and the one existing caller passed mask_bit as a bitmask value (0x1ffff)
rather than a bit index, so BIT() shifted by an out-of-range amount, which
is undefined behavior. The divider field write already clears and rewrites
only its own bits, so no extra forced bit is needed.

Select the divider with a single helper shared by determine_rate() and
set_rate(), using closest rounding as before, so the rate promised by
determine_rate() is the rate that set_rate() programs. The helper clamps
the divider to the valid range and avoids overflowing 2 * rate for very
large requested rates, which would otherwise lead to a division by zero.
Reject a rate of 0 with -EINVAL.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 79 ++++++++++++------------
 drivers/clk/nuvoton/clk-ma35d1.c         |  2 +-
 drivers/clk/nuvoton/clk-ma35d1.h         |  2 +-
 3 files changed, 42 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e992e7c303419..12a946c989e97 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -16,8 +16,6 @@ struct ma35d1_adc_clk_div {
 	void __iomem *reg;
 	u8 shift;
 	u8 width;
-	u32 mask;
-	const struct clk_div_table *table;
 	/* protects concurrent access to clock divider registers */
 	spinlock_t *lock;
 };
@@ -29,44 +27,66 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
 
 static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
-	unsigned int val;
 	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
+	unsigned int val;
 
 	val = readl_relaxed(dclk->reg) >> dclk->shift;
 	val &= clk_div_mask(dclk->width);
-	val += 1;
-	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
-				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * (val + 1));
+}
+
+static unsigned int ma35d1_clkdiv_get_val(struct ma35d1_adc_clk_div *dclk,
+					  unsigned long parent_rate,
+					  unsigned long rate)
+{
+	unsigned long max = clk_div_mask(dclk->width) + 1;
+	unsigned long val;
+
+	if (rate > parent_rate / 2)
+		return 1;
+
+	val = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * rate);
+
+	return clamp(val, 1UL, max);
 }
 
 static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
 					struct clk_rate_request *req)
 {
 	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
+	unsigned int val;
 
-	return divider_determine_rate(hw, req, dclk->table, dclk->width,
-				      CLK_DIVIDER_ROUND_CLOSEST);
+	if (!req->rate)
+		return -EINVAL;
+
+	val = ma35d1_clkdiv_get_val(dclk, req->best_parent_rate, req->rate);
+	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2 * val);
+
+	return 0;
 }
 
 static int ma35d1_clkdiv_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
 {
-	int value;
-	unsigned long flags = 0;
-	u32 data;
 	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
+	unsigned long flags;
+	unsigned int val;
+	u32 data;
 
-	value = divider_get_val(rate, parent_rate, dclk->table,
-				dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
+	if (!rate)
+		return -EINVAL;
+
+	val = ma35d1_clkdiv_get_val(dclk, parent_rate, rate);
 
 	spin_lock_irqsave(dclk->lock, flags);
 
 	data = readl_relaxed(dclk->reg);
 	data &= ~(clk_div_mask(dclk->width) << dclk->shift);
-	data |= (value - 1) << dclk->shift;
-	data |= dclk->mask;
+	data |= (val - 1) << dclk->shift;
 	writel_relaxed(data, dclk->reg);
 
 	spin_unlock_irqrestore(dclk->lock, flags);
+
 	return 0;
 }
 
@@ -79,39 +99,21 @@ static const struct clk_ops ma35d1_adc_clkdiv_ops = {
 struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 				     struct clk_hw *parent_hw, spinlock_t *lock,
 				     unsigned long flags, void __iomem *reg,
-				     u8 shift, u8 width, u32 mask_bit)
+				     u8 shift, u8 width)
 {
-	struct ma35d1_adc_clk_div *div;
-	struct clk_init_data init;
-	struct clk_div_table *table;
 	struct clk_parent_data pdata = { .index = 0 };
-	u32 max_div, min_div;
+	struct ma35d1_adc_clk_div *div;
+	struct clk_init_data init = {};
 	struct clk_hw *hw;
 	int ret;
-	int i;
 
 	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
 	if (!div)
 		return ERR_PTR(-ENOMEM);
 
-	max_div = clk_div_mask(width) + 1;
-	min_div = 1;
-
-	table = devm_kcalloc(dev, max_div + 1, sizeof(*table), GFP_KERNEL);
-	if (!table)
-		return ERR_PTR(-ENOMEM);
-
-	for (i = 0; i < max_div; i++) {
-		table[i].val = min_div + i;
-		table[i].div = 2 * table[i].val;
-	}
-	table[max_div].val = 0;
-	table[max_div].div = 0;
-
-	memset(&init, 0, sizeof(init));
 	init.name = name;
 	init.ops = &ma35d1_adc_clkdiv_ops;
-	init.flags |= flags;
+	init.flags = flags;
 	pdata.hw = parent_hw;
 	init.parent_data = &pdata;
 	init.num_parents = 1;
@@ -119,15 +121,14 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 	div->reg = reg;
 	div->shift = shift;
 	div->width = width;
-	div->mask = mask_bit ? BIT(mask_bit) : 0;
 	div->lock = lock;
 	div->hw.init = &init;
-	div->table = table;
 
 	hw = &div->hw;
 	ret = devm_clk_hw_register(dev, hw);
 	if (ret)
 		return ERR_PTR(ret);
+
 	return hw;
 }
 EXPORT_SYMBOL_GPL(ma35d1_reg_adc_clkdiv);
diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 9f65d0623517a..f91a8369a2bc7 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -1017,7 +1017,7 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[ADC_DIV] = ma35d1_reg_adc_clkdiv(dev, "adc_div", hws[PCLK0],
 					     &ma35d1_lock, 0,
 					     clk_base + REG_CLK_CLKDIV4,
-					     4, 17, 0x1ffff);
+					     4, 17);
 	hws[ADC_GATE] = ma35d1_clk_gate(dev, "adc_gate", "adc_div",
 					clk_base + REG_CLK_APBCLK2, 24);
 
diff --git a/drivers/clk/nuvoton/clk-ma35d1.h b/drivers/clk/nuvoton/clk-ma35d1.h
index 3adee440f60a3..1fdcd4658b5ff 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.h
+++ b/drivers/clk/nuvoton/clk-ma35d1.h
@@ -13,6 +13,6 @@ struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const c
 struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 				     struct clk_hw *parent_hw, spinlock_t *lock,
 				     unsigned long flags, void __iomem *reg,
-				     u8 shift, u8 width, u32 mask_bit);
+				     u8 shift, u8 width);
 
 #endif /* __DRV_CLK_NUVOTON_MA35D1_H */
-- 
2.43.0

