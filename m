Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269503;
	b=F9NcDjarocBx1rPPqYTghJQMgTzeAMBS470U1QrR+R/MwLL+0a94DaZGZvU+CiNj65IH
	 FlykIKHce2eousx5OqbcagUqWTDamWtLHGue/uaNCk2/MLG5Q2SAIKljr65B5/FmWyWpm
	 BfuwPoF3U9QbQptTmy9btUmZQI2j0X8KE8Vw3Z/WxOtZyMekLqPrHWun1BDHbSnjiq/+3
	 dj9BklUA6j0pNrqc6nIUHYH7Af39rC0dlYhmSqLgdcw1NkFMYBFPgc9Y4sX1t5AmkT2aR
	 weY6C0WzBgYETLQsdgo9VJcPFPsKL4d55tQF43A6iIH37e/wL0Zm/1hC5/S3NC209Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9dWII4XJ1ye21F+US8gSUbGsAHaHhkJUFF5U2yG/Pl8=;
	b=0Hlei/iP4r3iRTib/b60NjlWxfFLNnu0QNTlsx7eQ70ClO84FiaY2/nEuIds8+3WhQs4
	 xCi3ln/elMSuruoHOLVuMUnBGOdr/3RsLA205VMmWMXe9zCXZEMfcW0nnL7cqHTsMbRFx
	 X2Dz+g8lgd/e/fOSxGm6NzngID8hyfO/jZGtmVGTb+UXDLFnlORf65+a7dlRkZC4HQ9pf
	 pYhCDEuoz2ns53ejUflgxQu0hLTB7d4hdfxqvsvTg384bdmcvqLV4clXRQyBuLcpAFozU
	 eTuLRYYJ04V5kcQdyQVhGoa/MnB6ai5oryN/dN8zhm6cV4d2HDwmHdpxOsrCfQTv9rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q7m5m8Kg;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1F0606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E1F0606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q7m5m8Kg
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49465892f7bso979456f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269501; x=1794874301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9dWII4XJ1ye21F+US8gSUbGsAHaHhkJUFF5U2yG/Pl8=;
        b=Q7m5m8KgSU3i4RW1WUn6q0dHP6yRS9ZnS+8Yb8la0ehR1YN9pp9scdrZ3Xz30wITys
         Uh6LVdwdFFYaUaR+AXbwuCFWZNgcxGmn6iNNdRQ+5gbCulJVxmBWyE5vFnsB9CQkFAE6
         Gdg1i6tatkyFo6C5I7y8Ft2Nv5CM1b0ONKbu7VLTIuinyvzAMmQ5N7FqZdPikTv/V/CO
         IMlPmpYolzhewSn9k9oF5BaSoYs8s3lQ7+Yh/6T7YF5aujJ6pNebaqAbvoTXISy8X+dD
         hbYe0Xzdlc/ROJBx3tfhWPu5JoHmNvQY7j5unaM4pntP/Uw7IcQ4+bEOn59QCsmkmJmv
         BROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269501; x=1794874301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9dWII4XJ1ye21F+US8gSUbGsAHaHhkJUFF5U2yG/Pl8=;
        b=W8ahizP9fVpUlolpwIbN+HuUgTkoFS6c7PB8k+ylC2az64yV4RBP2o0AinRwI3jAMq
         wD47OEdSfANXUf4vDwzv7+rwG6xy3f01AA7HQO42izmRhlA1Cfl5/YpzOsRdDqeVv+gx
         qrsbkf3Ni1p6SzpYYkS1ZP7HHPnGbN4kxM7wpmO5utYVYFmu3uMoy3Uj+CV/5o+ZALVP
         g/X7rjrO9LyyuVJav17Qt4Gb0qdvbcwLi4RuUNAi6wWvqdiuUcrJn+q5Ab1qV+gHluB3
         JnM1wOubmUQTFpdKZCpxZLxiA4DCpQA5yDW2tTcUkKaYMe4KjrqDTILSBGh6CeTocLQ2
         9IYQ==
X-Forwarded-Encrypted: i=1; AL+hErEkkFRsY/P3UwyobgY2BTeLfyuNo9G5EOFXukXvjxdnnxgMp7TY0O6Kgsr1NT/fWluo4rNvmD8TD2b2joQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dq6jtGec3LxM1wzS/M9slwyZu/iewXLt5L4qVTtp/kW1HtuRe
	CcdWluWcDcL9vmLutPSAc7RphLsej56biuc5kbh4VGCjS/n0ZJnvkz5W
X-Gm-Gg: AYBFou1K+dQ1BiZSaAcY4+/7EeIABhsMnDkledvDY+y2PNdQm9BEZ29EbwrhTwePfRv
	VCoYATCC95Er0HVkBPXhBYLZELJ+tktKbGmiVCGWYOovAujJmiCy1nAnxHVODEhpwgxbx4ti8Hb
	o/hCHwo0hV1dk9vbXkqWFT+QLjyP6kxVn5TQsFtYErn0XywTfANb9gk/FG11QHqLfIVFqrJ+sC/
	jsXcNiazohJ/QaoM3hkEb1J07m5bARXJWUGDdQBXxOCj+eQo1kYWkslJgtffFx+FUGgWE4QwPYR
	fe0jHF5Us9LvCDU/qyONpusjJ8TPznHhtZLYt0WCy38Qgf4c6SpL2FYzqauOPy2AxgB1xXCPjpC
	Hhr5L1WgLFL7/6MmWVHW2iU29GUR+dNN3+O+SOjzaQKk84dmIwLvwN8uUhdas8Xq/TXqCR+bdZy
	8iFa4aZJE8Ou8TLjXU7bcu6WmH3g/pNMcfNGG9gpca+S0Kl1B2+pDuJuK2NxTKk3AbVgMWK2VMx
	FMKYfcoE3bEKzmhx95qVavcQS49Tn3kODrHjro+oLvdPdKgOVARJf20CYI2aJ+8PRn54stoJ7GJ
	TwgBwv1sitGzrRwoSmyrBkElZZiHXkFrdi2Qz2r4Ulm+YX+I5KFJKPfQQQcE7mh2yKMgdD7qMUY
	9sbPHVXwLxWZxcFtihjnrNYQoYPpoNxKPYYA1g0skRJe1goqS8iA=
X-Received: by 2002:a05:6000:2913:b0:48c:571a:a1aa with SMTP id ffacd0b85a97d-4982ecf6001mr1745976f8f.19.1794269500632;
        Mon, 09 Nov 2026 16:11:40 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm1779366f8f.22.2026.11.09.16.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:11:39 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 2/2] clk: en7523: add support for .set_rate for en7581
Date: Tue, 10 Nov 2026 01:11:27 +0100
Message-ID: <20261110001128.1041-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110001128.1041-1-ansuelsmth@gmail.com>
References: <20261110001128.1041-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for EN7523 driver to configure rate for Airoha EN7581 SoC.
The SoC expose both base clock selector and clock divisor hence it's
possible to change the rate.

This will be especially needed for new SoC AN7583 that require changes
for the MDIO and the eMMC.

The clock were assumed correctly configured by the bootloader but this
goes against the rule of "kernel should not depend on external
configuration".

To support the use of standard clock divider API, clock_div_table are added
where needed (BUS, SPI and SLIC) in additionl to the previous info to
derive and simulate the clock from the divisor registers.

Recalc rate for Airoha EN7581 is updated to use the divider_recalc_rate API
for consistency with .set_rate and .determine_rate.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 228 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 227 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 6640e814d36a..b0aed88528c5 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -119,6 +119,8 @@ struct en_clk_desc {
 	u16 div_val0;
 	u8 div_step;
 	u8 div_offset;
+	unsigned long div_flags;
+	const struct clk_div_table *div_table;
 };
 
 struct en_clk_gate {
@@ -161,7 +163,88 @@ struct en_clk_soc_data {
 static const u32 gsw_base[] = { 400000000, 500000000 };
 static const u32 emi_base[] = { 333000000, 400000000 };
 static const u32 bus_base[] = { 500000000, 540000000 };
+/* From documentation divisor 1 is n/a */
+static const struct clk_div_table bus_div[] = {
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 3 },
+	{ .val = 3, .div = 4 },
+	{ .val = 4, .div = 5 },
+	{ .val = 5, .div = 6 },
+	{ .val = 6, .div = 7 },
+	{ .val = 7, .div = 8 },
+	{ /* sentinel */ }
+};
 static const u32 slic_base[] = { 100000000, 3125000 };
+static const struct clk_div_table slic_div[] = {
+	{ .val = 0, .div = 20 },
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 6 },
+	{ .val = 4, .div = 8 },
+	{ .val = 5, .div = 10 },
+	{ .val = 6, .div = 12 },
+	{ .val = 7, .div = 14 },
+	{ .val = 8, .div = 16 },
+	{ .val = 9, .div = 18 },
+	{ .val = 10, .div = 20 },
+	{ .val = 11, .div = 22 },
+	{ .val = 12, .div = 24 },
+	{ .val = 13, .div = 26 },
+	{ .val = 14, .div = 28 },
+	{ .val = 15, .div = 30 },
+	{ .val = 16, .div = 32 },
+	{ .val = 17, .div = 34 },
+	{ .val = 18, .div = 36 },
+	{ .val = 19, .div = 38 },
+	{ .val = 20, .div = 40 },
+	{ .val = 21, .div = 42 },
+	{ .val = 22, .div = 44 },
+	{ .val = 23, .div = 46 },
+	{ .val = 24, .div = 48 },
+	{ .val = 25, .div = 50 },
+	{ .val = 26, .div = 52 },
+	{ .val = 27, .div = 54 },
+	{ .val = 28, .div = 56 },
+	{ .val = 29, .div = 58 },
+	{ .val = 30, .div = 60 },
+	{ .val = 31, .div = 62 },
+	{ /* sentinel */ }
+};
+static const struct clk_div_table spi_div[] = {
+	{ .val = 0, .div = 40 },
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 6 },
+	{ .val = 4, .div = 8 },
+	{ .val = 5, .div = 10 },
+	{ .val = 6, .div = 12 },
+	{ .val = 7, .div = 14 },
+	{ .val = 8, .div = 16 },
+	{ .val = 9, .div = 18 },
+	{ .val = 10, .div = 20 },
+	{ .val = 11, .div = 22 },
+	{ .val = 12, .div = 24 },
+	{ .val = 13, .div = 26 },
+	{ .val = 14, .div = 28 },
+	{ .val = 15, .div = 30 },
+	{ .val = 16, .div = 32 },
+	{ .val = 17, .div = 34 },
+	{ .val = 18, .div = 36 },
+	{ .val = 19, .div = 38 },
+	{ .val = 20, .div = 40 },
+	{ .val = 21, .div = 42 },
+	{ .val = 22, .div = 44 },
+	{ .val = 23, .div = 46 },
+	{ .val = 24, .div = 48 },
+	{ .val = 25, .div = 50 },
+	{ .val = 26, .div = 52 },
+	{ .val = 27, .div = 54 },
+	{ .val = 28, .div = 56 },
+	{ .val = 29, .div = 58 },
+	{ .val = 30, .div = 60 },
+	{ .val = 31, .div = 62 },
+	{ /* sentinel */ }
+};
 static const u32 npu_base[] = { 333000000, 400000000, 500000000 };
 /* EN7581 */
 static const u32 emi7581_base[] = { 540000000, 480000000, 400000000, 300000000 };
@@ -215,6 +298,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
 		.div_shift = 0,
 		.div_step = 1,
 		.div_offset = 1,
+		.div_table = bus_div,
 	}, {
 		.id = EN7523_CLK_SLIC,
 		.name = "slic",
@@ -230,6 +314,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
 		.div_shift = 24,
 		.div_val0 = 20,
 		.div_step = 2,
+		.div_table = slic_div,
 	}, {
 		.id = EN7523_CLK_SPI,
 		.name = "spi",
@@ -242,6 +327,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
 		.div_shift = 8,
 		.div_val0 = 40,
 		.div_step = 2,
+		.div_table = spi_div,
 	}, {
 		.id = EN7523_CLK_NPU,
 		.name = "npu",
@@ -311,6 +397,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.div_shift = 0,
 		.div_step = 1,
 		.div_offset = 1,
+		.div_table = bus_div,
 	}, {
 		.id = EN7523_CLK_SLIC,
 		.name = "slic",
@@ -326,6 +413,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.div_shift = 24,
 		.div_val0 = 20,
 		.div_step = 2,
+		.div_table = slic_div,
 	}, {
 		.id = EN7523_CLK_SPI,
 		.name = "spi",
@@ -338,6 +426,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.div_shift = 8,
 		.div_val0 = 40,
 		.div_step = 2,
+		.div_table = spi_div,
 	}, {
 		.id = EN7523_CLK_NPU,
 		.name = "npu",
@@ -775,11 +864,148 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
 		return 0;
 	}
 
-	return rate / en7523_get_div(desc, val);
+	if (desc->div_bits) {
+		val >>= desc->div_shift;
+		val &= (1 << desc->div_bits) - 1;
+
+		rate = divider_recalc_rate(hw, rate, val,
+					   desc->div_table,
+					   desc->div_flags,
+					   desc->div_bits);
+	}
+
+	return rate;
+}
+
+/*
+ * Simulate rate with every divisor supported
+ * 1. Search the divisor for the requested rate
+ * 2. Simulate the final rate with the new divisor
+ */
+static unsigned long en7581_get_div_for_rate(struct clk_hw *hw,
+					     unsigned long rate,
+					     unsigned long parent_rate,
+					     const struct en_clk_desc *desc,
+					     int *div_val)
+{
+	*div_val = divider_get_val(rate, parent_rate, desc->div_table,
+				   desc->div_bits, desc->div_flags);
+	if (*div_val < 0)
+		return 0;
+
+	return divider_recalc_rate(hw, parent_rate, *div_val,
+				   desc->div_table, desc->div_flags,
+				   desc->div_bits);
+}
+
+static int en7581_get_vals_for_rate(struct clk_hw *hw,
+				    const struct en_clk_desc *desc,
+				    unsigned long rate,
+				    u32 *base_val, u32 *div_val)
+{
+	struct device *dev = clk_hw_get_dev(hw);
+	unsigned long parent_rate, tmp_rate;
+	int tmp_base_val = 0;
+	int tmp_div_val = 0;
+
+	if (!rate || (!desc->base_bits && !desc->div_bits))
+		return -EINVAL;
+
+	if (!desc->base_bits) {
+		parent_rate = desc->base_value;
+
+		tmp_rate = en7581_get_div_for_rate(hw, rate, parent_rate,
+						   desc, &tmp_div_val);
+
+		/* Matching clock found */
+		if (tmp_rate && tmp_rate == rate)
+			goto exit;
+	}
+
+	/* Search requested rate with every matching base rate + divisor */
+	for (; tmp_base_val < desc->n_base_values; tmp_base_val++) {
+		parent_rate = desc->base_values[tmp_base_val];
+		tmp_rate = parent_rate;
+
+		if (desc->div_bits)
+			tmp_rate = en7581_get_div_for_rate(hw, rate, parent_rate,
+							   desc, &tmp_div_val);
+
+		/* Matching clock found */
+		if (tmp_rate && tmp_rate == rate)
+			break;
+	}
+
+	/* Failed to found matching clock, return error */
+	if (tmp_base_val >= desc->n_base_values) {
+		dev_err(dev, "Invalid rate for clock %s\n",
+			desc->name);
+		return -EINVAL;
+	}
+
+exit:
+	*base_val = tmp_base_val;
+	*div_val = tmp_div_val;
+
+	return 0;
+}
+
+static int en7581_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
+{
+	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
+	u32 div_val, base_val;
+
+	/* Just check if the rate is possible */
+	return en7581_get_vals_for_rate(hw, en_clk->desc, req->rate,
+					&base_val, &div_val);
+}
+
+static int en7581_set_rate(struct clk_hw *hw, unsigned long rate,
+			   unsigned long parent_rate)
+{
+	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = en_clk->desc;
+	struct device *dev = clk_hw_get_dev(hw);
+	struct regmap *map = en_clk->map;
+	u32 base_val, div_val;
+	u32 reg, val, mask;
+	int err;
+
+	err = en7581_get_vals_for_rate(hw, en_clk->desc, rate,
+				       &base_val, &div_val);
+	if (err)
+		return err;
+
+	if (desc->div_bits) {
+		reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+
+		mask = (BIT(desc->div_bits) - 1) << desc->div_shift;
+		val = div_val << desc->div_shift;
+
+		err = regmap_update_bits(map, reg, mask, val);
+		if (err)
+			return dev_err_probe(dev, err, "Failed to update div reg for clock %s\n",
+					     desc->name);
+	}
+
+	if (desc->base_bits) {
+		mask = (BIT(desc->base_bits) - 1) << desc->base_shift;
+		val = base_val << desc->base_shift;
+
+		err = regmap_update_bits(map, desc->base_reg, mask, val);
+		if (err)
+			return dev_err_probe(dev, err, "Failed to update reg for clock %s\n",
+					     desc->name);
+	}
+
+	return 0;
 }
 
 static const struct clk_ops en7581_clk_ops = {
 	.recalc_rate = en7581_recalc_rate,
+	.determine_rate = en7581_determine_rate,
+	.set_rate = en7581_set_rate,
 };
 
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-- 
2.55.0

