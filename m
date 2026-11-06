Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953838;
	b=QD4EnXREyIgbM5Q7foqotVQoYIgaxOcpaPzwD/g+0+5EeKS+L97qSlSvUFlmS+fgXK7d
	 tzNGm+keuioRTTMsx/SElvmXn4pI3LZPCyYt/V6D5Nfeg87w6MuaI4TnhiHCLp2zahy/a
	 9tIO9+cJGs1u2oSxJgc6xeRVrcbn8g0/m0/lAULyPLnpu33y3oItujcvbDfIDNmqSJ//6
	 IiXKLXJUb2Mipp1vTTehNL0HoeEo1dt82DDag89fO9+mYybiR8dH6bD+HqBVkG21LaR/e
	 Iqes1AHAKa3BLUq3ZVj5ibbVs5BnubtlzDZG+b+0/7kw5O7ZEENlObU2Ve8ToQJ5kEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=z5PBEnq7VF6lYD89KsFrntzTjwO4LYAxU3lHBv/vL7c=;
	b=ISFJXHGYFXED7wfEgBQaJX6KSYm5eKKbYKNEyKprDD9DfWFdDzzk4HbRrY6lMUoEEQKX
	 Xok98L1A/Uo5Up3aJIGbAhQr3B6+LfmgxG6wkPdFmECmo/YSpvUfD1adl8xXPPTQNr2cD
	 RmxLLN/8MtDX1SEjUjlEVCm0UhJcWYW8Xc/EMbbMcRHoNM3UWWDo4g8+/BN/U4TA/o42a
	 KPE2uowfPb45ZYelPvLtTipeTkPubd7MJWLolczmgMe9GIT3MrA8htRTLIxkZrIS5jj5Z
	 TBwL9C4LG7OlLqiatwQ8Me6EG9oxMwL1nhGYjSsC0h+8g6O3L4XGfVAlnq18Rb1yiIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=N6MSp7+V;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECC0606D81D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ECC0606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=N6MSp7+V
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492f0a1b685so170570f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953836; x=1794558636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5PBEnq7VF6lYD89KsFrntzTjwO4LYAxU3lHBv/vL7c=;
        b=N6MSp7+V8HPEY6Bt8+49slpA+THfhpi4GFCegpfPQB1BwD6XA+2XV6jk7jfCQT6GE+
         XWkjn27k5eNayKlwF5LkRZQoyrT7VkNE9uF3NGP9eLJWffeUlKyYsI7ghz4U/ziWHPR/
         Raq8TnQXGg7gFPb1seUKNycA6taol9D0mZeyH0lJSef//OG66qDH1ffptAis12J2ao9g
         s8K24obObXIjdgCrAIf/OFlb+KcFQsAbPl5vqVineDW9wGoDZoacfUabloLJnS8HKPYk
         VgTsLPCbWiYUDXwaI3DDmTY4nnKwYs59VcAcj8AI+46bxla4+nHLy5KUvEhedVS6nw6L
         x3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953836; x=1794558636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5PBEnq7VF6lYD89KsFrntzTjwO4LYAxU3lHBv/vL7c=;
        b=CoyzXPsSG7nIWDJpeOUvdSgjIuRQoHk9J4/ZsfZFfBLb2Nu7kibYtgS9AxLgkI8lS9
         nr+eWu7dxtXiUYjOGKNXtTQhJI9CLGyBoU1hw/62mwHTQYH3QjkYBj3q6NnpQXRl0+Ij
         SF4vRu8QO5CGIfuE7/XweE3fS6CQWZIdnKIWtXTZJuM2nbLmbnfPuSkrsbTIRFprFzpy
         hlNVu+cYKaYXys4af8IqKQpJEkCQkDU2evNChDJEz52HVUY3r0XLGPj8m9IJYAINaRIu
         8G+ozgQzUivr3YYx2vySZNOTupxyIbW/CZE+eCXuFrl6ZRlWjZ7VkONCL0sWilyTLT/D
         Y2UQ==
X-Forwarded-Encrypted: i=1; AL+hErG+4+yRPt1fakNcxpkud1+xs+hKGhtQOtWucN1R4mkoOXytmzQkO5jglgYjRvatGGFy6sKN53kO3bTgTmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lCWtmYDZnn+ok4NBW1jFaHysA7Iqnk/fKk9mNqa+OJ2HCipI9
	5WAqqF6I+6GO0Kt7CATjgWNwaHdxrWZH0cly1YAlpTYEvrc6RCWWOuVeqr6rop/WpPg=
X-Gm-Gg: AYBFou1YVd2rkEBOyJFwZqKbemf7dmJWXiU3z9dVl3fs3KLj8XNoED545IHUKjXOeeF
	pwiGahfHQgl7YniVl+LrjsCXJ8VzAJpQsa/UFjorTfU8SWOW44YRvQenQpe7e4Sm83JJ70e6ag9
	mYfqt6j81wwVd2BPrhB2X+bAOayPYBmKPQdkqN9qk3MoLXzpnQ35yXt6A7A5O9dfssO1aWtTKnY
	bYAoiSKIQMwrQXvnGNiF8LbLFNyGIAG4wEQBqK+7K03odBgD1Eg7V2wO0ZRgPIGGDqTIn5WRJ2T
	BKSd6RC3qFhXW/XfVD3xBLkb8jLL52hlL41iPCtBVID6R7jvTOMhC+t2LoTlTWYtBUHx7M3oq4/
	LZ9YiXD/sNSNFZrleIpaEJQBE1u62a922nIwBM2Y2SHnHDEjbXDGdb/bsDpCnEzLRfFKQFYNTus
	dlu9ilXE0OboyEUPipkgWbHX73lDpWQcstj7TTrWmGUg9WcDtvEVKayhlVi/WsV+ZF9aZC60Zny
	WjGs/nUPX+xGPAKxcafzFAEppFNOinFkkD4mcDRtVBQkXY9gpi36qc/qgDzNUnnhk0DY6uA9exa
	vLx9cHOtUNy9T93oK0OEPbOMaFXKpO/fgvqZxkT834DV/qwviRCaVUWHS9P6yDQn1Wq3Al20oun
	tMPAxZDaaVjuqdLXxeCS1NqUaOx6/mGwckjhh7RDIMGskNQ==
X-Received: by 2002:a05:6000:1882:b0:487:27f9:834 with SMTP id ffacd0b85a97d-492778d1739mr3822099f8f.41.1793953835726;
        Fri, 06 Nov 2026 00:30:35 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:35 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:26 +0100
Subject: [PATCH 3/7] clk: meson: pll: Support active-low resets
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-upstream-s7-clk-v1-3-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The common PLL code assumes that the reset of a PLL is active high. The
S7 HDMI PLL has an active-low reset, and its lock flag only rises
reliably when the PLL goes through it.

Add a flag for PLLs with an active-low reset so this PLL can use the
common implementation.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 43 +++++++++++++++++++++++++++++++------------
 drivers/clk/meson/clk-pll.h |  1 +
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 44b33051405f..4ac5e45c1e9b 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -293,13 +293,37 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
 	return -ETIMEDOUT;
 }
 
+static bool meson_clk_pll_in_reset(struct clk_regmap *clk,
+				   struct meson_clk_pll_data *pll)
+{
+	unsigned int rst;
+
+	if (!MESON_PARM_APPLICABLE(&pll->rst))
+		return false;
+
+	rst = meson_parm_read(clk->map, &pll->rst);
+
+	return pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW ? !rst : rst;
+}
+
+static void meson_clk_pll_reset(struct clk_regmap *clk,
+				struct meson_clk_pll_data *pll, bool reset)
+{
+	if (!MESON_PARM_APPLICABLE(&pll->rst))
+		return;
+
+	if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
+		reset = !reset;
+
+	meson_parm_write(clk->map, &pll->rst, reset);
+}
+
 static int meson_clk_pll_is_enabled(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
-	if (MESON_PARM_APPLICABLE(&pll->rst) &&
-	    meson_parm_read(clk->map, &pll->rst))
+	if (meson_clk_pll_in_reset(clk, pll))
 		return 0;
 
 	if (!meson_parm_read(clk->map, &pll->en) ||
@@ -328,14 +352,12 @@ static int meson_clk_pll_init(struct clk_hw *hw)
 		return 0;
 
 	if (pll->init_count) {
-		if (MESON_PARM_APPLICABLE(&pll->rst))
-			meson_parm_write(clk->map, &pll->rst, 1);
+		meson_clk_pll_reset(clk, pll, true);
 
 		regmap_multi_reg_write(clk->map, pll->init_regs,
 				       pll->init_count);
 
-		if (MESON_PARM_APPLICABLE(&pll->rst))
-			meson_parm_write(clk->map, &pll->rst, 0);
+		meson_clk_pll_reset(clk, pll, false);
 	}
 
 	return 0;
@@ -365,15 +387,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 		return 0;
 
 	/* Make sure the pll is in reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 1);
+	meson_clk_pll_reset(clk, pll, true);
 
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
 
 	/* Take the pll out reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 0);
+	meson_clk_pll_reset(clk, pll, false);
 
 	/*
 	 * Compared with the previous SoCs, self-adaption current module
@@ -406,8 +426,7 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
 	/* Put the pll is in reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 1);
+	meson_clk_pll_reset(clk, pll, true);
 
 	/* Disable the pll */
 	meson_parm_write(clk->map, &pll->en, 0);
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 949157fb7bf5..8384b75ae38d 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -29,6 +29,7 @@ struct pll_mult_range {
 
 #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
 #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
+#define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(2)
 
 struct meson_clk_pll_data {
 	struct parm en;

-- 
2.56.0

