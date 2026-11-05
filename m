Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890946;
	b=FLqCadBuGaL/t1q7a15TJkcy+0//4QTBGsPKrpPDbs3Aw3ntKtjhDZkBEnJJRq8XEGch
	 er0npV/efbH0nqqRQsUlP15rJn3zHfOGsHJI9n2blWeElamb2CYxkZZDSBYGFgQm3kzxy
	 rwPheoUZnnphqARu0Z980oMkFEpiDtmHjusIh8oggTWkKnKyh/9uREcgzRDIdbg87YqoT
	 Dzq4bhqbizYI70eGHF4uQrtELC//cIElUa+PA7TNqB3Z5smk43Rknmka8y4RSPacL4tYX
	 RZMafQC35yZ6+W0NArtmE0qxKdTcmLvBb7GKDTgGe6mQgoqpfTtKCSRBE3L5DHFsTEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U8zcyQ2GM9ihw29A2+FiybNq7yl1znKX6rbpGcxvkTE=;
	b=mXsdqDOG8e7a1IlfUOFx1VssPgBWIiAvbEn1GGYzhu/EMwLzrWYKJGwVb5qxu8hQ8alR
	 DZEav7pWz3wUSN3JK+UfC5XVwzO7tmm0Gx4DkNkoBAhp9Dhztdi9iOH/zQz4TYwdNkqm6
	 o5aXS8WK+NAUr32AkZzNwEeLygFxjbwt9jvrlKUMimu6pDO+8MiJPJ1L373hxH6G+Gh1I
	 K6qI+I0MWxeOxeWWb2BaVafhkR+KNGEnsUN6iGhWNlMwFVhcwadfRw5zdWFboCz+89P+7
	 DKl7S/25OJsk4HqRxPNNmyMNJRVP1N1dU3UbC50Z8MPRbQRd1zFRLvgruDgBJ8ZLoqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYL6NyFx;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ED4606D834
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9ED4606D834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYL6NyFx
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso1461247a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890944; x=1794495744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8zcyQ2GM9ihw29A2+FiybNq7yl1znKX6rbpGcxvkTE=;
        b=gYL6NyFxmYLKmrX3srb2LFckyhDDL1TF8EH4DCvoWpL/WURfcgyN1RUmewLj42P+ZS
         Ge3Mha6vfG4Ij12pRjkwW9HufEqwnh7IGEcBTDO7jfS5huc09aI4Q7vdy06jKdRWCbXI
         W2bJ4Lbp1fedJ1g6QQg22vYgThBM+aYFgJYTVfLlK9rqDo0CQVT4ED0wjsp0ouTdsMXv
         /2e62FiUrekYa5sFS0otdPuFdCVBXBt/0ZZANYv6EKIFIRQ2VLo8n4HFs8tFRXS5UkLu
         qVeOhRygqz2TTA5T3LFkgJUwnvTHXhw/We2z7TEqwDqU/2DF1kk5bPUAza7Fb2itLmgT
         /nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890944; x=1794495744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8zcyQ2GM9ihw29A2+FiybNq7yl1znKX6rbpGcxvkTE=;
        b=E+r5rvVax433nSEZ04os4NSneafdcRclsGrpFPPO1hBXRnRQBK4wFjDBFUe06WXcuK
         +kWlY5RdM32yXoko/IGedBraGIx8HfneZfTcJukpmO/nZAc+ye0PoonqStkUay49yr0W
         9cfGv9gIJJ+1weMe+jPhm4L6F3jQ3GVbWnT/OtRWGckgB/JksSaMOHhMEJtxdjTrzXeg
         yuU88p2JKzeeEl/lKxLRBuOLBlxgBrRG8QxytRCIhCL4NQN6ETf/tjfGugDUwD+x31+m
         YCNiYSzwLYsVWHC0EIViPhIIbqpOAJeD+F7rwFezE6Crh5l/hE1h2nFjeVTLZWjt+o9N
         uVIg==
X-Forwarded-Encrypted: i=1; AKwUvBwrVAXkKS+LpP7Co7jbe/45RBCIFsgNrI4buFCYyxI9fwBwKdb0KLwHnRiqzPfNQcScv7mtuBpBfJo7O8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xyhPlrDUf0r1soHgQxqGh2W5UGpV/KCq97DTr6FXsurWrFEqi
	5ss2s4JjBIjzqpyHolUAjKsCtz3Fs+9jYn6gvExKeDT0+f3YixvjZND8IQsE8Q==
X-Gm-Gg: AYBFou11FWfP0Gw+fSI4PgyeB1hS0M8SJzTk4BuKCd+HONLXPhyEb2RwjrrsMTwIHhV
	fV49OXcGKZscwWmma5/Mk5SI6r0IObZa0kZqzC4esx1ALswjX6YdLWr94/Pyvs0M9sHxZsjybj0
	CnbT85OeIUqfGGDkxGPK+noMy0qbzBXN3ESe05y2WX5kFMWNNU79gmOk3ZUHHZArq/Ee3vWqYNR
	FUizhQVlzje4TzutKHMoJU2vUz635sfDU8Ia6i1mtpTPzrix9gdX/fa5H2ZTXnS3MNXIoj7EYFO
	rMCIk1cbCJQktdNOv/jiycxA8p3L0tV5eJV1nDsDoNgePnnPBNDfr5JI0ATb32X5X3RUVtVwtJc
	HmhH4lKi8dIPusCG8tuhdealJHBdkGTo6DizFBObcjkvSwq9fpqk9mglKxkJWXmCR2l2qrsoGqg
	EohwE5X/Tk30BPjLuD7wI9JmAj3PUTYOUcZhPupKTHTOVExsnzz7aF1GuO3dqlEfsNISfdvQK9N
	BSq2ymooAWtTJtM/DBkzVL0+bGhRu3zrI5cnQwCzVt2dG79kCROccBO3ab4JWg1VYR5at6PZo2f
	qTchzOGe6IyIacBjguN1LBjBkRX+y2zV5MAO5WTegnyhUY0vXN3Vi9Jx1MS+M1BVSUbW6mQiJd7
	WN32Ac+CXEvz77tauA9QAYDfzwy2ypvksvA4aj1crgu+cXw==
X-Received: by 2002:a05:6402:5009:b0:6b4:d731:4bf3 with SMTP id 4fb4d7f45d1cf-6b4d7315217mr16010214a12.41.1793890942614;
        Thu, 05 Nov 2026 07:02:22 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fed552aaesm11042960f8f.40.2026.11.05.07.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:02:21 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 2/2] clk: en7523: add support for .set_rate for en7581
Date: Thu,  5 Nov 2026 16:02:06 +0100
Message-ID: <20261105150207.23023-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105150207.23023-1-ansuelsmth@gmail.com>
References: <20261105150207.23023-1-ansuelsmth@gmail.com>
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
 drivers/clk/clk-en7523.c | 207 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 206 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 6640e814d36a..cf0b6ccacede 100644
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
@@ -775,11 +864,127 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
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
+static int en7581_get_vals_for_rate(struct clk_hw *hw,
+				    const struct en_clk_desc *desc,
+				    unsigned long rate,
+				    u32 *base_val, u32 *div_val)
+{
+	struct device *dev = clk_hw_get_dev(hw);
+	int tmp_base_val = 0;
+	int tmp_div_val = 0;
+
+	if (!desc->base_bits && !desc->div_bits)
+		return -EINVAL;
+
+	/* Search requested rate with every matching base rate + divisor */
+	for (; tmp_base_val < desc->n_base_values; tmp_base_val++) {
+		unsigned long parent_rate = desc->base_values[tmp_base_val];
+		unsigned long tmp_rate = parent_rate;
+
+		/*
+		 * Simulate rate with every divisor supported
+		 * 1. Search the divisor for the requested rate
+		 * 2. Simulate the final rate with the new divisor
+		 */
+		if (desc->div_bits) {
+			tmp_div_val = divider_get_val(rate, parent_rate,
+						      desc->div_table,
+						      desc->div_bits,
+						      desc->div_flags);
+			tmp_rate = divider_recalc_rate(hw, parent_rate,
+						       tmp_div_val,
+						       desc->div_table,
+						       desc->div_flags,
+						       desc->div_bits);
+		}
+
+		/* Matching clock found */
+		if (tmp_rate == rate)
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

