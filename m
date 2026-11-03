Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739314;
	b=sMFekO4N25q9uodccvOLSyGewb2XBwG4MF7SKYc7EFU5ZaxpfKTO/Jl/ERglZ28BWZFE
	 y9k3IEvHRTKKnW2ZI6+316DQ89D+EMghgNEmCu6wJxW+cIQBXbCkOXeFexqpJSKoWnrP6
	 h2XVlgq3Hh/5qFGAK2OCl0wGslseHFOKXFBLsDCTUv/9fXOOm9Wy9Gy6x6cQDZcz+7gGt
	 1RfpxH8bKdhOmT5QGMNrOwuU4NeXf9AVcLBVNHOWfobxhIP97gcXjqYsjScASWSzsSf3M
	 8DnZCBjlV+aNCD2oQxEbotGgye5HtHpdgkiFMhf81z+zW8DOBUTNtaRsVcHq9Vo4mOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nf2yMpKn1Z1zm6frphQUZrg8gSNSO8xY6SuMqmnwBa0=;
	b=Ab8YJpQ3G+NozrA7ydAg1gVIbRWbh+jjW/t3e3MMCbGLSP1Fi3MGu5j7R+v6ra1RdqI+
	 FsodBjPB+yKvN77/IZylEzo7MjDsmF35DE3VvgNJv9mo60DS2KM775G6wkSKDp7jMD8o8
	 zlzxbfagRH1ewTXAdRApm+6H7MCqSewZG9P7dMyw6qTyNNyFsga2rdr5sszykz4W0sWvV
	 b8rc97M4SWUONYF7mRFAUuDBO2ZNQCo/PcSGo9bnMdk07yC9aSKJ3NIpEUQCGbeeEIkYz
	 a+uXU2T5wdTKR0lnzHVJ6KH44lFfH9hPY524hNSmWdMdAdQ9n5TbBoG1PzSiyCJ5fLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sY4IcfsB;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6A8606A337
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E6A8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sY4IcfsB
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e10a70540so13272f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739312; x=1794344112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nf2yMpKn1Z1zm6frphQUZrg8gSNSO8xY6SuMqmnwBa0=;
        b=sY4IcfsBXTw69SETUqmkjjk/MlBqQhS8WKpzAvEo0nzQM1i684VL9S2FtMaqWVbv2j
         7B/ZN0JZG6Mq17DeMofRPnSj0kpPCofzoTsu0B74vR73SqtnEBxq3ewYYl1yRk7aWCqB
         HV5ggmk7fW8eURcHRreENMOEy19ikVtdFv8fCev8pRe9tprx1sxPRpKoAD0S00DD+fOX
         cdPBvXKtTyEyh/P2nyS3qyxu9JW2Elu2pwRzfxEWV4rYsKLhcuWGHIg3xxWZD16C8cvW
         b3t+mK6ytmMUfDmNMhKAZKQ21FYIEsGfTry39owWV6UIA+SnWmm9sz0vo3wHfSbNEpQq
         MZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739312; x=1794344112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nf2yMpKn1Z1zm6frphQUZrg8gSNSO8xY6SuMqmnwBa0=;
        b=DOBpJoIQagswYYiSoXimuvz2hXYP6BddL8251+hyzCZE6GBNTZQdgamkd2Vywrg+Xm
         PMXzYlYXedbbESdKfx/GBuLNR1j6AEqS1dMGr1uTD0bu4lnRVR/jw+FMwwq0fF0fxqWb
         JJGX7Ukgsyw3uKnr9J6UUfgN+0QxnxP6tlx3H6gsTeEDmTNIe2/z7fK0giglc7Qxs0pT
         Kx6pOGUV63RgH07lI1TOmlUDJZ15DLvGulJCLGUyRvnoeplUvaLvkQv7ggfw4h2IGyeD
         ngAdFO+il2IpNhE2zQKBa4h9doZOW1Ey4VdXraO5a6BHi4U4B5oqFbQpxmRLbujZy8Ng
         MQag==
X-Forwarded-Encrypted: i=1; AKwUvBwvQThoPsVkco0tsPjM/zdsWlEPFqKmTRjiTZ7q5ssiodm0At1iTNHpgejeZto72sTjAVUPvle7B8zZFIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6/72qjWexIt6RzxHYb5aRVIw+7DRbwc80ikE669OYEVsyHKAE
	OKlmNxYzFEmVbZp78SZbZea9vqX9L73PsQsb444WsvVqd2bNj/FriwkO
X-Gm-Gg: AYBFou0l09J0gQgspSxgDjKXLB8eCJ0S9rfR2JvGjluZ/qQ+xLMBi+2kqct69/4F62r
	2MRkpYcuVA7xJOP0AwYR0s5mkr5XcRBClcXo/aBZvJRBbLA5b2AJQVTFfZNooy2zQOjia6p0cT+
	PsmZZNxBfG+/LXn0bWFLyYypo+osNOjOBMI0XsH4pXzlKaBXvXJL1URTnHKJZL6xhDwXNj7aWEt
	utziNYC8dNZ0mF+b9+FpE7sY0H6IrxNAt5nHUOoNHvcCrSUO0qh0DQN6e8q6IxketX04bCts62n
	yD+zKm5Rea0tUeS8qyd9Sg3Cq2T48wqPycCH8mdRemPXNrs4Zxq/AJADlZjgKKqQyFWNKB3p/UH
	n2Dkwl+SQrN041+MiMCuFYJsKULMKC7/o0j1D/BjrC7H4ylHsDYcXK28SGvMJYLdh0QgBzo2dK7
	WDZUc/UMLno1UlpXMaG1GXgTjNtZTOfeFG/eD7E/FOTivlgValRdvvaoIaclWHo5m6SaaDXprYz
	rBo7RSNKX/GC1MZQGTXde5QLeqHpBNxrGvS2GC8vnX0udLsXjSEdGePylAp/q/SV+Ih/uXURetB
	IEflWbdjcz4+nRRo4yq1uWjLRYYtoO5sPgPOcUNQOUFSfXo4teWJiGutHBSADHj8/KmNzsv4Csi
	ASIC2NTMbPZMNCS6GyyUFcAQ4o0gSsRprFw==
X-Received: by 2002:a05:600c:a4c:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ac1765d7d7mr327762065e9.20.1793739312460;
        Tue, 03 Nov 2026 12:55:12 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b43457595asm1140405e9.4.2026.11.03.12.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:55:11 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/2] clk: en7523: add support for .set_rate for en7581
Date: Tue,  3 Nov 2026 21:54:20 +0100
Message-ID: <20261103205500.14974-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103205500.14974-1-ansuelsmth@gmail.com>
References: <20261103205500.14974-1-ansuelsmth@gmail.com>
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 136 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index aab4306ae037..5ce4dc692ab2 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -777,8 +777,144 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
 	return rate / en7523_get_div(desc, val);
 }
 
+static int en7581_get_base_val_for_rate(const struct en_clk_desc *desc,
+					int div, unsigned long rate)
+{
+	int i;
+
+	/* Single base rate */
+	if (!desc->base_bits) {
+		if (rate != desc->base_value / div)
+			goto err;
+
+		return 0;
+	}
+
+	/* Check every base rate with provided divisor */
+	for (i = 0; i < desc->n_base_values; i++)
+		if (rate == desc->base_values[i] / div)
+			return i;
+
+err:
+	return -EINVAL;
+}
+
+static int en7581_get_vals_for_rate(const struct en_clk_desc *desc,
+				    unsigned long rate,
+				    u32 *base_val, u32 *div_val)
+{
+	int tmp_base_val = 0;
+	int tmp_div_val = 0;
+
+	if (!desc->base_bits && !desc->div_bits)
+		return -EINVAL;
+
+	/* Divisor not supported, just search in base rate */
+	if (!desc->div_bits) {
+		tmp_base_val = en7581_get_base_val_for_rate(desc, 1, rate);
+		if (tmp_base_val < 0) {
+			pr_err("Invalid rate for clock %s\n",
+			       desc->name);
+			return -EINVAL;
+		}
+
+		goto exit;
+	}
+
+	/* Check if div0 satisfy the request */
+	if (desc->div_val0) {
+		tmp_base_val = en7581_get_base_val_for_rate(desc,
+							    desc->div_val0,
+							    rate);
+		if (tmp_base_val >= 0)
+			goto exit;
+
+		/* Skip checking first divisor val */
+		tmp_div_val = 1;
+	}
+
+	/* Simulate rate with every divisor supported */
+	for (; tmp_div_val < BIT(desc->div_bits); tmp_div_val++) {
+		int div = (tmp_div_val + desc->div_offset) * desc->div_step;
+
+		tmp_base_val = en7581_get_base_val_for_rate(desc, div,
+							    rate);
+		if (tmp_base_val >= 0)
+			goto exit;
+	}
+
+	if (tmp_div_val == BIT(desc->div_bits)) {
+		pr_err("Invalid rate for clock %s\n",
+		       desc->name);
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
+	return en7581_get_vals_for_rate(en_clk->desc, req->rate,
+					&base_val, &div_val);
+}
+
+static int en7581_set_rate(struct clk_hw *hw, unsigned long rate,
+			   unsigned long parent_rate)
+{
+	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = en_clk->desc;
+	struct regmap *map = en_clk->map;
+	u32 base_val, div_val;
+	u32 reg, val, mask;
+	int err;
+
+	err = en7581_get_vals_for_rate(en_clk->desc, rate,
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
+		if (err) {
+			pr_err("Failed to update div reg for clock %s\n",
+			       desc->name);
+			return -EINVAL;
+		}
+	}
+
+	if (desc->base_bits) {
+		mask = (BIT(desc->base_bits) - 1) << desc->base_shift;
+		val = base_val << desc->base_shift;
+
+		err = regmap_update_bits(map, desc->base_reg, mask, val);
+		if (err) {
+			pr_err("Failed to update reg for clock %s\n",
+			       desc->name);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static const struct clk_ops en7581_clk_ops = {
 	.recalc_rate = en7581_recalc_rate,
+	.determine_rate = en7581_determine_rate,
+	.set_rate = en7581_set_rate,
 };
 
 static int en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-- 
2.55.0

