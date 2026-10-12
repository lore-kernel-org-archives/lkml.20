Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F7444A3FA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806409; cv=none; b=oWRVbPtTEz2alRbEvMEolzG0yDE0k0u8keAob91rbq/w1hfKUleQ2PyHgh2Qh+9iXfp0qQABq5nDGvZOANSI8J81swJXg9sJGYzMlXMZNsg4DQg14ZMPGMQL5pfO5aXNW1ihdTit4iWzDi3ZDemu/aLQqsonkMfJBMXG+pmsZqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806409; c=relaxed/simple;
	bh=bfo/wMXS8Sq9s+eS6QMWg+YQ7MUmVwvDGopoTJGqgOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLxkMUVeNW++FNYhtEejhx0XgnKtxNdoYR9xujWZwKMRLdtQ5Z6HsRRWwcTdMmxYOo0rSbJCAnWQ2x/yCmyG2fnph/OpnkQ8+bDM3OCVRpv14odmNtYzX7oj8X632elnsKHFW5leZezgqHOBkKlUlz7YYJJWdefVHX5BXn/3pnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnWYnHTL; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnWYnHTL"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afbd2c386so879736f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806404; x=1792411204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHR1jDnXcixHLFQi9FmQqLQBMNLNa+/soRRZWs2b6JE=;
        b=DnWYnHTL6YoT5MuVJVVqsvH1H59BXGPOkczHSPV0C/sSny3nQBW5x9oh+sx2mcGydo
         c/gQtqmBqyk3VEW22SruTCraadK0OKsZc6c+hSGl3gaShni2Nkwvx8kvpVLyFrAN7cvM
         +tAjYO5+3YVsTHUGMDy+6gVUlEGi3IVgAwynPWCaAgBpnk+kPr2G7XlfuaUmzrATokXn
         JRrE/UgW4X6+G2wpFr1BPQ1h3tmKkyOe1szZ8eF+6dh0BWLCv5QPZje7eHCC2Qv/N07L
         5A4wBVlXGhxdGafJO0PrS3C1sAFb7FGMy1hDQcN1Jpkpkgm4Wo8nACrYeqbTY9p3AotC
         DBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806404; x=1792411204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHR1jDnXcixHLFQi9FmQqLQBMNLNa+/soRRZWs2b6JE=;
        b=cNpg8K1pSZyZto+HeduihZJTlmYQy4CZFGFVcOsR5c2v6I7uaxUX2fS0twGheziCW0
         Nfh+TFQL+/pHB88vcA/kgg575hfCMBC24oqDD9c8IhqkQ9YXEXC3arnZMwfEpqe8kxxc
         cP12QJImELsbngb/BTroA2vKJ6cLRkHS3oWien0eCSV/YDHSEjV5lj/pi0saTQ8bjZE9
         rfAWg/mxZEm0IRGde6qHTgHIZGXJjY+p66Tm+edjngpNayVLeeseoxQhrnOEhkvHPZX4
         lCEEIw8kK1J9zI0rtKF6laSKjUNrHtpctzI1xpmkcejX16F5/SwvkcjdOxTDr1Zghbvo
         h/Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwmp3LdarQOpkMxb7ksY8k2stc/mt1h39ivzxIRs4B7ckCZmllqGtTjlFuLw8fYyIyrgT2h8JL95ahhfyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIE1rzigEOXs0YZA+nKcmKNB36g7RGAtW//ELm7+rt+BLRtcJew
	gxlG4FyPneFwEmOCNK40pDLli8TRM73EH2kOmBy2agLbpW9/Z2MXgdCP
X-Gm-Gg: AYBFou1Yv8dSKGch3UFJVp+NQOvQ2zBDjKdkHyj73Z5vfQUNScCFCweFSHCs1GUltn7
	7wjtz0+XM7AaxWiKSlep4d3ZAdkk4PXPvDPHw+HD+6r4oXgHXNEtzzAX8BU+xp0u7eiHw0zuOUc
	7eGPea/yNAr0HstXZS/zlRLwjLmSnF/BuhPJjUWZmfDNy4LvQix6nqryDRUz76FHwl2a72NebiE
	63xw6hyndCsKX8ZmD7Csz3O+q7h9Tm5usHTiV+bjwog/NRvkQ78lm9vGrRS8nOAivQyu4Yf3/YT
	is7Mw/d6Bva2Y/iMKw51GldcT9EpvkFaHPd+T6NCzLSqgvaKfUyj1h0BBvseEgCLWIwF5hlxULi
	u+WsXhFOqEQPboh+PdQMQChoFtTZDGfqfZ8tD+l2AIPeVRKpSc5GntWRpvSfvz4dUluU8kSA84Q
	MQnZcHKvW4Dr6IeGMFSKZsXbFR+B/OXX0VAPb1NOJvR6SmP0gS1rKa1RKy+vCFzhtC3FATJIzCU
	Bn5xvz4rhVzIEfQpwe/MIdP6rYedkwvbkLVaKi9zRjrG535qDC2uyUtKYKFO/o5hX1+rYrQ2jm2
	+dJcgO5EEf+PnI/NkyvgO5g=
X-Received: by 2002:a05:6000:27c6:b0:48b:11a5:d42 with SMTP id ffacd0b85a97d-48dbacfc1demr10357286f8f.30.1791806404238;
        Mon, 12 Oct 2026 05:00:04 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20234313f8f.9.2026.10.12.05.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:00:03 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v9 2/3] clk: en7523: generalize register clocks function
Date: Mon, 12 Oct 2026 13:59:52 +0200
Message-ID: <20261012115954.92718-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012115954.92718-1-ansuelsmth@gmail.com>
References: <20261012115954.92718-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..ec66a504d4c5 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -745,12 +746,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
 {
+	const struct en_clk_soc_data *soc_data;
 	struct clk_hw *hw;
 	u32 rate;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
+	soc_data = device_get_match_data(dev);
+
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -1226,6 +1230,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

