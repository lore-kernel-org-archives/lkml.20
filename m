Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269500;
	b=o26WGNeNhLxpdxBDlBdDfhwrbmc/eET4V/z3DjWblOs+jv1zFDJWqjbBXI0otue/gIBm
	 zUdntzc94eTtkuR0fJlp1sG+cGmTW+kLr9v1AOnwxniRpZZg8ZybrvYtob2DQmKZ1ymRD
	 ZAyreXmYAhZFC9ycZaiSpcknS0V02JXBAOhwnTgyBNYFBx8i4gS5YI1YWBGxuHLEbkgnZ
	 XC1b7MvcJ2bNqnpsZmHFa7qN9I807dhiJLddEnjEkL7EqVMCXAAzsIVZ9tHbgCAq4dLAK
	 J7dq1JrVoMcu4Xve6XujiFNe9p01vctCgUtYgiChy8eWzgohPmLxl0e/zMVBTpm/KFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WhfC9zLe5HZoGXWudWFtnEm8q0utD3cNm8ZYGhH+ONg=;
	b=GEuKyEyABv7wBQaB+2g7+cRNlR1/aB51QXAd6Zk7J/HWQtY+J7wrV4QtQj3td85tOcq8
	 6MFGvD6wJES1yLk//Aiz68BIJTlSqPB86Yypl/21y883JtkVnSEkmEm0LJWg37qDfpfde
	 RoZCCAwpHGMYmvIiXjTomkmrNCrRufVZnKzW+v/R/ATg6X+f2oOiYo39FTwiRUJCo/KSS
	 g+EVIY9HqeIgukOEQ/q5aVAf4gug231m5pY+0Lz6tT80KFPx9ZDPh7W555GO6ySNmRN+T
	 fNKJc8CGMU+DB8MVDAQpPwEJlsPZIf6DTNB3dlasw+r1426FdqrRhEiaIYWxlTna9uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ryaoZYZ;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10D760A2601
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10D760A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ryaoZYZ
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e09aa5264so842493f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269498; x=1794874298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhfC9zLe5HZoGXWudWFtnEm8q0utD3cNm8ZYGhH+ONg=;
        b=0ryaoZYZO76rs+nkoNW8Vyy8na1ii1EZ79AC9v/cHDQGiLWztsFXo4QBiE6trf6NEi
         UEcMUhUs8zqJa7IB4/eEBXbmYXcUoE8MEh38erix/CELtdhm7PyMthJgJWGQei0zYaJP
         vFgR4NLvlsnMvmNvrXs/1CKsmidFbnkT5z5LqY16aFjY/7XeIGMUv9pPF7/h4040wrT/
         OAshmsqCwnWJdq57GXzFeSrrJXTeVTjaiAuCAcZJy/udtKuFy9ORTPTL4NSc92s0rLIi
         NZUkB27ojw8m3NHg71utQfDJ7KUix6j2y4dHhJvd29pwhTMm0wjt7fb8Gt0ueb1kip76
         fW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269498; x=1794874298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhfC9zLe5HZoGXWudWFtnEm8q0utD3cNm8ZYGhH+ONg=;
        b=MqKVxipBOVEkyTw8RoxSlptmeuTwvVB1tvktCj0pJvJI/fUbn4De6kiIKN3UazTYiz
         T7fyqOZ6IyfjMvAZbk4JhX8JQUZJ7jwIjm0OX7ZmGj82MPXCKL6qyJJ5+hRCBudYm8Vr
         LQ9u9hlvFXgGX2889QdMmsL/hK1C+nX6t/OFfKVn1KB9dyFyfROQkMHj9mVIQJkgFg5O
         0k4r1COovs6nIuse72pogHPNtEM4Fn7SrHqjF5J8/uEGBgkJus+I+QCwoXoink8bKqey
         JddvHXFu5ttFS4EBplnUKZM9nUMGdTvfnEM124q7wLfUWTSdF7zxBcRj988fJd4npLcB
         sMig==
X-Forwarded-Encrypted: i=1; AL+hErEFfK3Lqdh0Zlozp4eUSmG2jVHB821lC7pLoH0Vf5RcADEdF1CRacRmfhQkPd0TriD4uSaEG8bpM07Bahg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3nnh86j9/DWd89hJ6pUvQLu9iMP4Kt+C0qhiEvfLLzJN5SnHu
	gkCoXQiuDlGCj/GIpvAT5a6fSJYVerTkPQzU2O7+A88arNXtS93r5qkZ
X-Gm-Gg: AYBFou0AulLvqd4/tPOAz2cL25nW/aBvhhPFSjibPahawQZcgBD928tiqbNIFwK0v3h
	xQPgOek8urRL9qDH4diqpkOvfNHjyRtGP+NhqBn2p6ft6JZ66yAFcwbC9mt8Ss56H5B/FIKtKRY
	RvVy4c7hlMTBjgIIB91KPPwrYDoaRtL821CfK5DwNhAWcFoYhHKBWbKYfF2xNARa7QTF+TbRMDu
	NkYKIgqPtWdl/IcBaPhiAg4VD/PI5F1Bx51eTUbXuuv3qd6A7xJbI0/sP1c9urLHfpckMw0DFVG
	bHNgRGVCKwuXVEo9KLIX4y74adbrvm5Z/51g7gMFnaw7E+qD0NXI4zyQTTkrsr7sHUl7FI/5ToQ
	xyXT/RZDidf15JJum3EBl/1WIqCXKn8HsxjOTDwopQUOLhMRykHPHlOlmYtY19QyId0OsjJrPbV
	s9aRpGvVeKDN/pVG3TaF6GKO0T+MbJJKCIaOt8acuGVCCP2wS6ZUSmBVqVbz1QtNYnMHVU7EUBF
	8y6eAJMBDUBhMynnGCRYu2h6Q7WMHi8XL6u9hvsV/LGo34inasKFW9rHAJHy1VHUvPE1lw1CQY/
	DG/RYXsUL1oWCXjvCowNN4M4Vxid31spnEOfJjCQahvBZCp8qFInFPG5+F36sDmRjspyNGbJnJb
	41r9fOuoQpPWHP+yrWFPflXpIOTnvCCMi5X+KK5Cil8GtcgtwIbE=
X-Received: by 2002:a05:6000:2c13:b0:491:286f:8e56 with SMTP id ffacd0b85a97d-49830b979e6mr1412170f8f.33.1794269498133;
        Mon, 09 Nov 2026 16:11:38 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm1779366f8f.22.2026.11.09.16.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:11:37 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 1/2] clk: en7523: convert to full clk_hw implementation for en7581
Date: Tue, 10 Nov 2026 01:11:26 +0100
Message-ID: <20261110001128.1041-2-ansuelsmth@gmail.com>
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

In preparation for support of .set_rate, convert the clock register
logic from fixed clock implementation to full clk_hw implementation with
dedicated OPs for Airoha EN7581 SoC.

This is just a rework and no behaviour change is expected.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 75 +++++++++++++++++++++++++++++-----------
 1 file changed, 55 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..6640e814d36a 100644
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
@@ -742,42 +748,71 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 				     en7581_rst_ofs);
 }
 
+static unsigned long en7581_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	struct en_clk *c = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = c->desc;
+	struct device *dev = clk_hw_get_dev(hw);
+	struct regmap *map = c->map;
+	u32 val, reg;
+	u32 rate;
+	int err;
+
+	err = regmap_read(map, desc->base_reg, &val);
+	if (err) {
+		dev_err(dev, "Failed reading fixed clk rate %s: %d\n",
+			desc->name, err);
+		return 0;
+	}
+	rate = en7523_get_base_rate(desc, val);
+
+	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+	err = regmap_read(map, reg, &val);
+	if (err) {
+		dev_err(dev, "Failed reading fixed clk div %s: %d\n",
+			desc->name, err);
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
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
 {
 	struct clk_hw *hw;
-	u32 rate;
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
+		en_clk = devm_kzalloc_obj(dev, *en_clk);
+		if (!en_clk)
 			continue;
-		}
-		rate = en7523_get_base_rate(desc, val);
 
-		err = regmap_read(map, reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk div %s: %d\n",
-			       desc->name, err);
-			continue;
-		}
-		rate /= en7523_get_div(desc, val);
+		init.name = desc->name;
+		en_clk->map = map;
+		en_clk->desc = desc;
+		en_clk->hw.init = &init;
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
+		err = devm_clk_hw_register(dev, &en_clk->hw);
+		if (err) {
+			dev_err_probe(dev, err, "Failed to register clk %s\n",
+				      desc->name);
 			continue;
 		}
 
-		clk_data->hws[desc->id] = hw;
+		clk_data->hws[desc->id] = &en_clk->hw;
 	}
 
 	hw = en7523_register_pcie_clk(dev, base);
-- 
2.55.0

