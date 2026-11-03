Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739314;
	b=zuPpl1p1Pdj3kw7LN6/KyolOs4zLM+ACObyEIBWx7VErtBOfTUV2ad/tmNjswKYitmCY
	 EfZz1VHqLDdYGJdEneLGToM0RS6pXq+cqAwg85l+G7vqEFosMcoeo8bJuR5AEa+L/IWUT
	 nO2rVpkEuBIpg20jG8qFGKVFJOBoQslHltLxN+GX/KuraKRHgNgwyrOYtt/mEUSsz3XVh
	 Ov/Ib4zL2qjKU5L4KtUR/SHnBRqwwdGCIy46P12J1se2NJBXAJvPJMx3+VIggF30pVtQz
	 BKfChoJ9MCO70r6Ijl1jRSWlxfUsqgi1SAQbxJqnvTwRyJRo4Q7c5yQo5XNeyODDeGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6kYjp/c/VLGWhL+j1GfkH8g34hTaPrX0tCHpRbxJcD0=;
	b=ty8nRkZYw3yG1kLWgzHK2BAjNJPyDnKvPOfwrMjtk4MZo1EJYST7tEoaTu1eh9BRBwCG
	 c/Wvi7vsupXFp9qzZ3lS8jHY0pJyVBOKwkif9hw6zTTBMnP+VbiDRlBWO7RQW9Ei694EE
	 WUTkh9t7RB3ANpwh6N/HbDolL8OdMonFf//ahZgYTY8AyO8BqaLCM4aB8ehRgGAJdupoJ
	 rsHwTD+mL7g0wsAHcDx3TBdGAdJ39y4Ww1X1rYKNjYVMiDN0BaNmC/8TS9jisxzfrBQ1X
	 FQT+5DFCHuNGzhrnrwh+p6/W9gCG23tVPP4k3Clh2NHNYLKqmT4DoSNiozm9hLknH5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XTife1AU;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B40D606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B40D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XTife1AU
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so31832265e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739311; x=1794344111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kYjp/c/VLGWhL+j1GfkH8g34hTaPrX0tCHpRbxJcD0=;
        b=XTife1AUuSmUXnRTDoeyTTj0VZ5OMWHc7vqW0h5XEuzBDSdW8dVj5dfLIKCNi83WMO
         TN25pqdXU82AyOX2vZSbg/0xkrSYB5FNLMjm2zaYSJGhLxFBTStqrbwYMALVBT8Vf8sF
         CIWHBRkDQ+JL5Nryy9hi+8gt6NpiAZ5TIuTl4Vix6qfm/195UpaJkulMz5fB35IPOBYD
         0rWKapYvuyYQaZaxLRSKVfdEC7XJrPi742XeA8YgfI/2Ae16CBD03rBWsUrg82aFrsh8
         Zxx0PYeNR9SEe96NarnYx5wQuqta/pFaCeYqUWywobf8AZZo0E6d0e/fyRq2GtfTvuFY
         2kAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739311; x=1794344111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6kYjp/c/VLGWhL+j1GfkH8g34hTaPrX0tCHpRbxJcD0=;
        b=PdvAVofpEdU1ngZeVbgiFwN+A03OoTt1qwTcEJy2Vm+V85FPYa8F3slj5Cs8S3ZfcO
         eRmYxa6x2RsnCf9zpRRZgHAbWZhGL5YeMD/EWC0TRzvG9mEklp0K4ZWP4c8WKEgSOyfR
         D58lmoXGtdjuQBflIxEliTVrmG0fDGSdwv8MDY0lEG4DUOe4YfwOic57cF0h/fMYKMwQ
         a3I8W5BJdDHWLF+s0BgSYAz74kjUyFpCf6dNTb9CR1g7ZbB/EgWndG6Ifcop1vvEPujZ
         V83TVgZoIQv+zdlynxciT3tQLven1MlUN4oGz1ehQvxaHOaiUwvRLGGIFyDH6GDwUVCd
         JdPg==
X-Forwarded-Encrypted: i=1; AKwUvBxm8QPYprrIpJFg2nzrf1JKMvwSOFXqK4IucGd5jKk3cN6j37KgYLLpUCD5fRzRKtAHXrqWVEzrvq0GANE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pRkWTWCMFRJDAJLj9xTSkz4WnJWWiIx5RX8JTwSd0XvHj5Hd0
	PCy8wSSeQyIjrKAZtEyCs6fRcpVK/zMT16ookTP4RAHL6O06zmgcAn3e
X-Gm-Gg: AYBFou3O3KTD1AqCQ0XloPhldGgHHzNsC2AvQ5fUGNwbCuUfgM2cVXilU+f9+eyJtDF
	e7TnqcvYpXRlrHmmkHAf90+cqgXFN5nypAG99jvSbDbXPQ465p5s54k5sERe7a+Sc7yRhgmZKNb
	N0GP8jzN9Qy+U2Xqkt32x6CvQPWsppXKdeQKi4pjlUulNcbf+iNWD4/LZI05MdSB9f7+SGnpWEf
	dPFr0yv/6iA8ioy8CLiPk+0fExJsTTri04Hb5X+USR8KNQJ3T0bmZIUusj7qlaBFmNMGzoGWegx
	21plTgivQaAY9F659GT8fr8Ea0ykpt1hs1nocn82hGLe9v3oDHISh7AqWK0HGwI7MOAcBp9nGS3
	EKXetMMOrVwgwdHLcjxH3cxfVeCDBSVSgcyFqmyh3eJIweZFVEMrIlg530PjBdKSSW94Li70PX3
	nfn+o8C0XG9+UstFYD49hlSik1IFpldfZPxe0FO/6DTmM+MHlLgv/5rp9SsrIQJpu+Lx7kKQ611
	r0NCaNjh1C88JXI9ELnyVVsOn2EeroEQXfMaLtyHbdnPZXe6AABhkO7Fc4N0xsLaudhclNQuWRP
	EfvNz8kJ1WPCCR2uhxAUXErKUBnQV05p7/HUy395KsdBjhdAdLVb0NcrZGDMmvRrQpG2vx55j/b
	CdBD5y+jpXSBmJM4n2HlcJiFScPvBDgeUUQ==
X-Received: by 2002:a05:600c:34d1:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4ac12475a61mr331900865e9.0.1793739311446;
        Tue, 03 Nov 2026 12:55:11 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b43457595asm1140405e9.4.2026.11.03.12.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:55:11 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/2] clk: en7523: convert to full clk_hw implementation for en7581
Date: Tue,  3 Nov 2026 21:54:19 +0100
Message-ID: <20261103205500.14974-2-ansuelsmth@gmail.com>
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

In preparation for support of .set_rate, convert the clock register
logic from fixed clock implementation to full clk_hw implementation with
dedicated OPs for Airoha EN7581 SoC.

This is just a rework and no behaviour change is expected.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 86 +++++++++++++++++++++++++++++-----------
 1 file changed, 62 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..aab4306ae037 100644
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
+		return 0;
+	}
+	rate = en7523_get_base_rate(desc, val);
+
+	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+	err = regmap_read(map, reg, &val);
+	if (err) {
+		pr_err("Failed reading fixed clk div %s: %d\n",
+		       desc->name, err);
+		return 0;
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
+			return err;
 		}
-		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
-			continue;
-		}
-
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

