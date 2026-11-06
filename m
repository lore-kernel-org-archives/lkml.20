Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964758;
	b=wyGd8hu1115/en62jsaxpQbR4vNUSUC0uU8kyc1MkMxwYfHDrFIIt1z2ngu9cG44iLiD
	 e/UF+LH/iOs2tx5i+vgrn8jknUeuam/LYhId+SkFkDC+sdPsAWhPoUxUaPkwB/VLllknu
	 GpyUCiTHGMabhbRVBbvskY6Zs4jVdTHNUukzBkUnEpijKQmI7Z9FQYeJ8tJW9CCk0+Tqz
	 j+/NFbN+srZR3AOIvXJtRTH2NwhMfX9gmYqs6qcsMZf3cYWh5xI7wwradkhzH0IhSmxWh
	 WI6UxbYmcqJVHcIEM+Bm2eL84gBGTDXPBwkhpb6yZbsK8leJMB1/9MWvrEHkYnEfRYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qQ6dPOK097pgvu31x83awoqREmNw4NrpdSa+JAb8QvY=;
	b=Asf3GD6xyniPewEIYut+fBKFu3kH5wMFb1l6SnZTjlb747SzwZhPpZCf1uN/AxRdv/Up
	 FKVGLGWuANbZSQol8YNXVFgVfLo1dSdi8KkwJIfcUVfdbm7/7iTfZjYNtIgWrvAJaxU3t
	 GRMFjvJNYT75t1X/sOu1nfQlMraL+3iKILYlVOId1dGyiNoTjgEhk7fTmkfc1gQ7Uw+Tq
	 ux+yQ37ZAzuumsYG2YjSJy3XBQD8/Ru13oYqsOMzySw9qQPewVRPyn/D3qeyWb9Av41FY
	 1qhaXUysU56NLT9I1Pncoj11UeMUdRefJpOhvxIY8cZtyV1ZEBSPljQIpd5uKbWw/Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WE6CcHFz;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BE0606A90B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4BE0606A90B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WE6CcHFz
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso250487f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964756; x=1794569556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQ6dPOK097pgvu31x83awoqREmNw4NrpdSa+JAb8QvY=;
        b=WE6CcHFzOVQzbA+mUD4qQNTJMKjQRW5CJzplWTyz2Msv5pvp3YPupn8DzIfuW5RVTs
         bkmEGYBiMuNuTSJZkxCDUrCnv5SMxd/V5sGCM8ZCqLmFPFsPa7Qh2XVPsHc37I/7i6+l
         EcOIesGMaRFasy+8tM/fFw93Icrj8sW6LOf11IFcjwl0iZyJiuUgWF4oXnXG2G0bNbfJ
         4N8BMJsymqzP5V8h6Pktoi6cPLSTRTjGXaNZrHx2Dgvi4lRH5F5qFm8XqNetbmCAZfMI
         hPgYsKcVS79sduOMIqlr+ryh8dJeEZw5BvIfr4iYDuy97e1AogrSLEpRYSlGg4TpBD0W
         fwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964756; x=1794569556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQ6dPOK097pgvu31x83awoqREmNw4NrpdSa+JAb8QvY=;
        b=yBjUcomtn1PW2DTILvBoG2wCVYE5cz0yDu2bh1ZrdO+DVK2E1qsKiIb31JnbfcJuqM
         Er9W3lH2I/3xfOirQBxx15B8COHBY4qTVdHn3WUCOvrBuIB4LighKK9eXJy2rhSWQAVP
         FjPKmlq3M+r4YIeWJQpx41vo0SvGrTWgz80GN+CG3Q6eIJ3MsZ05S+KpZdqVkuRvZq+Q
         ycw6I+32QBHiyHUGyZYm5sxqxD8JaElYnZnhHN/dahXVBBwfYv1PdKSav7EHbLVwQetP
         xUHCV83DjroA4LYd/DavvPcZNpPQgFt92H1XCPam07lZPXnnZaOJFzO1DTT9rProkYI+
         nIUA==
X-Forwarded-Encrypted: i=1; AL+hErFOOQ8vx5ug+OprmpUTYJXcbprpg8pvs9iXy37mSzfZqROAGbSz5Tiotzqo5TDBcU9pzbasYj/FB2P4YsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ohNCWqj0gpFPBCEzzW223rlUkWDb/p0wjdvNPbIYiyV4ryVuj
	UrK2TDYYxyfwD+QNtmA3DNKZ8M63VtxdhqIQ+xIZG/BLZFeQFmglrtW4
X-Gm-Gg: AYBFou2DKDrR/B7SqDLTHZ90u7/hq7QT0SQJvD2fHxvMmFPmqatZ0XwR1j430miSW1t
	gIO7UaiUK4H1iJhtzpOe+pkzV0NzykofeMvRD/Y19cSpGuRejPfKrye/zaBJdmdi06YYLiOMpa8
	s8QIKYGP5bJN3U+xkBOHLfUlNFvSPl32vlrTBZgXfKQRx0cdDXDHdIwpJC6NXuV72lnfUcXEvfc
	APKLiNemciphcczBSHzDlUmckp1wMhH3OtNTkFY7lI0wYz7vEy72Sdoi7wav/CPBy71s1ilCggR
	ywluFIWpUS/k260ZnL72C9yQc0PHEfwvus8LlCF0Sd+QRUFVLHf5B/dYcR/ED1NgjL2j1mPZtZn
	NBUDFE9e/ys9XBnIZGyrT8KJNwGXK0m2ns0CDv90RvlvcZ4eqw29f7aOo4D0BN1KtB6I85vopJ7
	e7vsmOC428PgL9ldWzwnCuDNiRPgtmjJZ7MyLSWe8sU7iHIWnIvYtJr4ABLlZhYCrWtBg7dDtK0
	7eRTomp+jHyPEWOouPuPjmPcn43tvVsnR0lzkB1lzDRfmkZ5VDtW6r8uAe9wFXP3xZ7I7bQuZNF
	hiMbNIsRU6SbqoBxjCcOJMRaO25iDaVcPWFRG88fiUcSU2gnq5AXSLUE4rd2M8YTGhOH1LAez+y
	X7ZZOlqAf8YK0Y8CezEx3ryg559S9jWJZow==
X-Received: by 2002:a05:6000:47:b0:490:2d81:ccbb with SMTP id ffacd0b85a97d-4927845510emr3645571f8f.52.1793964756021;
        Fri, 06 Nov 2026 03:32:36 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-492d72333f9sm3254280f8f.29.2026.11.06.03.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:35 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v4 2/2] clk: en7523: add support for .set_rate for en7581
Date: Fri,  6 Nov 2026 12:32:25 +0100
Message-ID: <20261106113227.182324-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106113227.182324-1-ansuelsmth@gmail.com>
References: <20261106113227.182324-1-ansuelsmth@gmail.com>
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
index 6640e814d36a..db7447be31c3 100644
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
+	if (!desc->base_bits && !desc->div_bits)
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

