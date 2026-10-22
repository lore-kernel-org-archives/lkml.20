Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702597;
	b=fcBDvwkPoLsRUILkGI1s5y5qCBOZi/d1GqoNXHs29sVf7ruoz5rDs04Xtm6592RbhsQI
	 SA2ji/uEEOVfrqeR6rHpqMagXvE6YoeI1rtn+kEzB9U7aW7eQpkDi+2b5GudmDB2mcs6z
	 wcglU0Hv1ghkq2/DZQnom5d8Alt4H5OT/fxmm28Zj6Wn2sWc80tEL9yKBDxbJIWnSP1N8
	 ANE4SnTXsmZ5Y3mKUkDojf+1NcKNq9sMEbKdPE4j3ld8IpylQ7CkIucdim0ypNvSaR43i
	 PiEcgeuyUpLUks205+MTZCdqyJ7xcD1w0mVrestB0ECNLv1CK02/eHXn+JyvmTBG92g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ShBYTnOsDYO99yTK6UtsudX5SewhFVhrgvpTMb1gDM4=;
	b=l2nw1BGlQAi1mAZB3x9VaChxY/Sw+KRteis7sssETzexFdRLwfUD/pCqfdIzb395qWM5
	 hIiYisSkukYir6ES7AqO2oMttE+WcbuVjvbJHXLwbuM3NxgOnObh8a+5Z5G7NMrPwpv9g
	 kxOuyxBWb2OSx0YAeDlBPOagOfKvgd3FiSpO+uhGQY4CKhzVYM/KSBV+4eev7wmEfsDX5
	 9C9FVYJYg1no75R9QG/+U5fSuukPjFEduKGvJwoxAMACWTSwZAi2B3fO+ontN4GywgGFB
	 5Nos5E/q1uv+qdIh63ETpm/jt9UzLXl7EE3nYXrabw4YLMNlnHccfVa5sMwmFcwQqzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M8GYWX4p;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAA8606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BAA8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M8GYWX4p
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e04773687so62857f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702596; x=1793307396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShBYTnOsDYO99yTK6UtsudX5SewhFVhrgvpTMb1gDM4=;
        b=M8GYWX4plRYySW0lJSNyXmBdwKXow3X+a1uH8e4DSzBnzVFshp2oXCZHNpLtp7fyGA
         tQe/TkDeMhjyvIkUblEr7UFpMtXfwN3P2ERR3CstehRY5jsDu9+Mwz37TNRMLQP2SgBp
         yRatBytyxMfAVaMiX3jAxcAcneXipSI98r2FycDI40+iRlGMoiAfvPCqbcOspgUQPSGM
         QE1taWXGVdIeIuLHc/E2IwpIZWtYbLAVflwSc6j5p58F7gmRlbzmjjyqB5inCezFTAs8
         ZhY5U2vs7IpwkEROJhK01utwZomdX9Kz2o6cDLYxms6dUmvVgVu6yfzwjOuTJYk+q8GB
         VZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702596; x=1793307396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ShBYTnOsDYO99yTK6UtsudX5SewhFVhrgvpTMb1gDM4=;
        b=CLsXz/uALBjhtD0Ce8MPg+Lkt/bApakqSz8EUQwjXWcXd2Fisf7bVH5f+M+cZINf7O
         NM8suUTZYgbkkqZ76i+/i37m8x3gc4ttGqVRwskbfW/ixcG+1WPVWjjSTVY1Lxo/wVkQ
         eE64qM0JZGBwf+11W64A27H742RmqVmxcglTPYOk4O2oYxWFBvv1fF342zpVpsJFMT6j
         9CEt33tXsovy6Z/sYaXZXa3hhZVPyBK51w8kxNBmaLmwjz31PeMOkC5hQh37V51LrDhT
         KavL1Bsr+5y4AdRCcWhh3rtgM4ifVQFeq4bhMtOfqgQxdlBF2LT5QIsyakQT/aQ/Urx0
         Pehw==
X-Forwarded-Encrypted: i=1; AKwUvBzr2vRZhjgqW0Jg4e+2pQRinHUHx1ZEBiTViS1p91xEo3ZW3RTOhgPMJiDevOXEUPFhohV6w/xqg+0SqpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvMRfrOfNydIfDPg3cGuxoeH6tXZH1yP4mmVMBwq5n27dTxSyi
	s9qNvoVAvTjLkOpefzrv7U7goPq3MBmlrKkvZPdYHQR3Ux8Bl5xxPCki
X-Gm-Gg: AYBFou0JYAJOSzZ5P58VzoaEjzDvZPBSi2fIuIRtjHzJh4vKxHlMGvqBucURR2XEZbR
	ac9uSdlYP7qBXBJS1Ggf1EP2KH4QNHbduI60diEuMNvMxWYuxq8Uz90mRjDkWlhEQQJufj+Ivk2
	0XjODFkz3hGv/VLYwSOQ50ZyAh/DLclzrktlLDjyT0wdgnoYc85OTzRPzA8dOZ9BGo68TmgAdln
	y90doppzuMilews4FfWxu7y0OnF3Qc6JdkokcaQpjL9GrF7zvenfbZ2jQOLtd6Ml52v/ZNdWkwX
	ecP7MMraSouE9Ft7QGgSvxqCB3O3uMRVMYpi6O+iqsFRQL5oLnVIByFX/PVAaKHqvAq3VotHnCU
	9PXfntCw88TArcvUA4OJ/05QPgEWAOxDcwLU8tjOUQcvZW2PFVvxFa74+zK+pntRhjA87Q8pXMQ
	9/LA3DG/1RYNAR6C/NIYu1JeaJ0GsGQNz7CEVqbUFW1nRftZMg4IFVJlr/9Y4uokkou2eXaWVnj
	eyf6rdlTtCI41XUJNaFrNYDgFMgt2ZTL9+mW0uytEusKrMa2fV8+Xa7wJchov5Z1fdEd6cvTmkA
	R0dxSlUVZyPvr142/cT6d/NCO5yK/CvKeO+d3ac2KVfY5tN47jMu2vK/WUfd
X-Received: by 2002:adf:fd0b:0:b0:48b:59f:db9c with SMTP id ffacd0b85a97d-48e385cb1admr27371f8f.53.1792702595465;
        Thu, 22 Oct 2026 13:56:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e38025c67sm394006f8f.20.2026.10.22.13.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:56:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] clk: en7523: convert to full clk_hw implementation for en7581
Date: Thu, 22 Oct 2026 22:55:33 +0200
Message-ID: <20261022205535.688352-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022205535.688352-1-ansuelsmth@gmail.com>
References: <20261022205535.688352-1-ansuelsmth@gmail.com>
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

In preparation for support of .set_rate, convert the clock register
logic from fixed clock implementation to full clk_hw implementation with
dedicated OPs for Airoha EN7581 SoC.

This is just a rework and no behaviour change is expected.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 86 +++++++++++++++++++++++++++++-----------
 1 file changed, 62 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..2f203c94f87e 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -126,6 +126,12 @@ struct en_clk_gate {
 	struct clk_hw hw;
 };
 
+struct en_clk {
+	struct regmap *map;
+	const struct en_clk_desc *desc;
+	struct clk_hw hw;
+};
+
 struct en_rst_data {
 	const u16 *bank_ofs;
 	const u16 *idx_map;
@@ -742,46 +748,76 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 				     en7581_rst_ofs);
 }
 
-static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-				   struct regmap *map, void __iomem *base)
+static unsigned long en7581_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
 {
-	struct clk_hw *hw;
+	struct en_clk *c = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = c->desc;
+	struct regmap *map = c->map;
+	u32 val, reg;
 	u32 rate;
+	int err;
+
+	err = regmap_read(map, desc->base_reg, &val);
+	if (err) {
+		pr_err("Failed reading fixed clk rate %s: %d\n",
+		       desc->name, err);
+		return err;
+	}
+	rate = en7523_get_base_rate(desc, val);
+
+	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+	err = regmap_read(map, reg, &val);
+	if (err) {
+		pr_err("Failed reading fixed clk div %s: %d\n",
+		       desc->name, err);
+		return err;
+	}
+
+	return rate / en7523_get_div(desc, val);
+}
+
+static const struct clk_ops en7581_clk_ops = {
+	.recalc_rate = en7581_recalc_rate,
+};
+
+static int en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
+				  struct regmap *map, void __iomem *base)
+{
+	struct clk_hw *hw;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
 		const struct en_clk_desc *desc = &en7581_base_clks[i];
-		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+		struct clk_init_data init = {
+			.ops = &en7581_clk_ops,
+		};
+		struct en_clk *en_clk;
 		int err;
 
-		err = regmap_read(map, desc->base_reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk rate %s: %d\n",
-			       desc->name, err);
-			continue;
-		}
-		rate = en7523_get_base_rate(desc, val);
+		en_clk = devm_kzalloc(dev, sizeof(*en_clk), GFP_KERNEL);
+		if (!en_clk)
+			return -ENOMEM;
 
-		err = regmap_read(map, reg, &val);
+		init.name = desc->name;
+		en_clk->map = map;
+		en_clk->desc = desc;
+		en_clk->hw.init = &init;
+
+		err = devm_clk_hw_register(dev, &en_clk->hw);
 		if (err) {
-			pr_err("Failed reading fixed clk div %s: %d\n",
+			pr_err("Failed to register clk %s: %d\n",
 			       desc->name, err);
-			continue;
-		}
-		rate /= en7523_get_div(desc, val);
-
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
-			continue;
+			return err;
 		}
 
-		clk_data->hws[desc->id] = hw;
+		clk_data->hws[desc->id] = &en_clk->hw;
 	}
 
 	hw = en7523_register_pcie_clk(dev, base);
 	clk_data->hws[EN7523_CLK_PCIE] = hw;
+
+	return 0;
 }
 
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
@@ -1062,7 +1098,9 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 
 	priv->base = base;
 
-	en7581_register_clocks(&pdev->dev, clk_data, map, base);
+	ret = en7581_register_clocks(&pdev->dev, clk_data, map, base);
+	if (ret)
+		return ret;
 
 	val = readl(base + REG_NP_SCU_SSTR);
 	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
-- 
2.55.0

