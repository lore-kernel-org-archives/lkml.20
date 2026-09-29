Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5039C3A3822
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666476; cv=none; b=nPJAeSttnph9SZtZldddLyG95cS8n4C+I9FRjmC7GAL7JCgBimZWxhYLyUJYur5IntMF76bX3LqnqIff6bygaJyEx42Wdt0ybeB3l8EN+xQL/j740rU2whlYMqY4JyoDMZBNNW9fnIJz3PB18ar6MpNOmqztJh7Dq7Hp0ZebMzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666476; c=relaxed/simple;
	bh=OYCwksel1DhV5q6JuxlvmZYKTbMblYIfFGnSw87ESZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHn/CuZCpFgOST+8kpekMaLn/ZzDbfXEPp+vceH6EwI81PhclJebk5f2T1PRBt6qC+2a2uCXiC5Nw6iBakNNrM5ZmnUFV0DDL8OLykU9CXZ3WJgDUUHI00SqR9wy3Ke5PwRT1q1/lu0MyrhPsHC0EMQJZ8+pkn7I03YAdMjpiE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohVmYPkv; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohVmYPkv"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a4805e15cfso812274a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666475; x=1791271275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJ5b28oMDQ1JFt7ArCRl+jwTwYnaX4rf00YVBlonXGs=;
        b=ohVmYPkvPOlduxiJu6cz035Y/PZqKgZT/K/qnerttNqCCWLzC1QaG1FHHw2DMO2xVo
         gnHDsRY9Op4+9E3K4FU9Y4rsWLbYfxg4IP1ncKpmJ9M5ExumjaW/p3WSo5WrdBhscsH2
         KyODucGZ9HM0K3E03VMMuqstBlOLGUoNhBZCaWQfy03/uv0WaHHnegLd5/8esuxyHfLD
         HW9mGfg79aHObG7l0KWsqbn3hd2thWhZnz3vbWMmZjKNSpUNWBhbmjoV3I40HadKXeqL
         a9ebCqNWh2OQvGtBnroCXFOCBifhZubz0aNNUk6N0xzvf2gYr5sS9wtfi9jTrgd3lmUN
         aBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666475; x=1791271275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJ5b28oMDQ1JFt7ArCRl+jwTwYnaX4rf00YVBlonXGs=;
        b=tyQgYPZXiYjfzui8n1m1/DSTt6aV87pg7VjzDCYNBRCrAL6MvaMaszdh+5qaDa5jJS
         oDcDexoHVgyX0sRHyGaC7/PQDZCtYRWydUSo0DMHDCvg0zizdKN2GYVTip4jeqFj1Q08
         lm6dbSnN+PqEr70Yfaa5XQZ2NvyexBwJ2fGQ5b5tPCpcdPP4PvYLgsCiECJTncSDpIUK
         FCAnViYC3pfaKmxz//4vGmoVVBQX4xXfI1ypTj2DNUbKYF+OoLur9ZKLhpxvWVcYY4jk
         gWIqU/Ws0S0kpsmIe62fQSJZLqwHD9bsnQLuoUFCr6LcovryTfYdYwyXhQ/qaxo6co+X
         Jflw==
X-Forwarded-Encrypted: i=1; AKwUvBzZ55sNUJGrUsNs32T88f75bDyF6mVV+u8Ceyc5WnNWoch6GJTc3rRUor48mGJkhR93dttpHmI5IreXQwc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKniPHv0zK1fVBT5d3DbXbOAtJRhch1DpYCBRmSRzwAVcARN+vu
	3P6+rUsU2IYpD3vFQ4p9uMdjqz636cqwbGjeAzJCeScgMoYJWd6uuHNy
X-Gm-Gg: AYBFou2hDGZxhxQldJHj8Uxs/4Kh/flCdRTzc4/5YifTtpEC3/zVmKpVi1hHqOF0Ari
	JuIC7li7Gi3kuO61E7gGmBH09PiWMFdQdWjyfdDRTL/r9aQgRS7kf0IfL0MjlDpNyf51VcmiIBn
	urMMmVQUP3e3SoAD3Q1ogwnhT4YCXbVFFahS618xDLmSeHbND5agACoDfLkWilyBXZERRTCYY5c
	de0nbHLfOpE97FOYmKJIqTUt61c2uYccN9079b223jOPPb1kbADFQKF+0Lrx/MnXizo9gvxSiNN
	G49IS1lRpyapsm8o3Imr3HGnQh4kqy4M+0ndL7k7umyBxwQKoH+w90cD2xLi7ywlw3cm/hXHL2w
	yiWlnVm7rjQjX5qAjOgIGYQ6kGpClRgjl4yxmDg7F1TdTLUFj+NRHfsTKYkxZyjhDlK8xLr5A4b
	TN+id/IZg+dL1S96L9wav84o/acTUrW2iRgGi49keiX7nmP3ixAhD26TcYFb8eDlPHJrx26vINN
	hZNLO/0BZ7pUxmmO/syB9hSeE4w7N3z5R/ac7+vvp9oveYdIRNLdSs8VmsNIx8=
X-Received: by 2002:a17:90b:2247:b0:3a0:ca03:3e1f with SMTP id 98e67ed59e1d1-3a0ca03447amr7882860a91.32.1790666474523;
        Tue, 29 Sep 2026 00:21:14 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497edd76dsm3833931a91.7.2026.09.29.00.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:21:14 -0700 (PDT)
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
Subject: [PATCH 1/1] clk: nuvoton: ma35d1-divider: use direct formula instead of divider table
Date: Tue, 29 Sep 2026 15:21:06 +0800
Message-ID: <20260929072106.175202-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929072106.175202-1-a0987203069@gmail.com>
References: <20260929072106.175202-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADC clock divider register implements a simple closed-form relation,
rate = parent_rate / (2 * (N + 1)), but it was previously modeled by
building a clk_div_table with one entry per possible divider value (up
to 2^width entries) and feeding it through the generic
divider_recalc_rate()/divider_determine_rate()/divider_get_val() helpers.
This is unnecessarily expensive (a large table allocation and a linear
scan on every rate lookup) for what is just a closed-form expression.

Also drop the mask_bit/mask mechanism: the previous code unconditionally
OR'd an arbitrary bit into the divider register on every set_rate() call.
The one existing caller passed mask_bit as a bitmask value (0x1ffff)
rather than a bit index, which BIT() then shifted by an out-of-range
amount, undefined behavior. Since the divider field write already clears
and rewrites only its own bits, no extra forced bit is required, so the
parameter is removed entirely.

Compute the divisor directly in recalc_rate()/determine_rate()/set_rate()
instead, with explicit range clamping and a rate == 0 guard.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 73 +++++++++++-------------
 drivers/clk/nuvoton/clk-ma35d1.c         |  2 +-
 drivers/clk/nuvoton/clk-ma35d1.h         |  2 +-
 3 files changed, 36 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e992e7c30341..03fcf87caae1 100644
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
@@ -29,44 +27,60 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
 
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
 }
 
 static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
 					struct clk_rate_request *req)
 {
 	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
+	unsigned int val;
+
+	if (!req->rate)
+		return -EINVAL;
 
-	return divider_determine_rate(hw, req, dclk->table, dclk->width,
-				      CLK_DIVIDER_ROUND_CLOSEST);
+	val = DIV_ROUND_UP(req->best_parent_rate, 2 * req->rate);
+	if (val == 0)
+		val = 1;
+	if (val > (unsigned int)clk_div_mask(dclk->width) + 1)
+		val = clk_div_mask(dclk->width) + 1;
+
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
+
+	if (!rate)
+		return -EINVAL;
 
-	value = divider_get_val(rate, parent_rate, dclk->table,
-				dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
+	val = DIV_ROUND_UP(parent_rate, 2 * rate);
+	if (val == 0)
+		val = 1;
+	if (val > (unsigned int)clk_div_mask(dclk->width) + 1)
+		val = clk_div_mask(dclk->width) + 1;
 
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
 
@@ -79,39 +93,21 @@ static const struct clk_ops ma35d1_adc_clkdiv_ops = {
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
@@ -119,15 +115,14 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
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
index 9f65d0623517..f91a8369a2bc 100644
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
index 3adee440f60a..1fdcd4658b5f 100644
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

