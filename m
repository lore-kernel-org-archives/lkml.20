Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880689;
	b=VGFAmV9fzh/UFPxcQ4y6YGMThcwrrP691ZrQ7DftdhL+pV6f5oJ20mQZGSxG2ZCCUNHQ
	 dseSmY3kxf8aJD4osB1IvGVB/ylWUn9YS+1KtdR3Ox8w5crFwJbW0x08NwU9Y8X4XZTZX
	 NAvh0SHkvW17gVzGd8M7QAzvg5EvJNv6ITT14cDVt4u6pUgNS7zrQUzn1FY00c7+vphus
	 Xll6FYcmowwh6KwoHBd2jBNPSSIwqtdmPvOnscnNoFGFG2406JnmOfQQvE6OoXfvG/uYU
	 eBiODqqrl3vpZoVLRzc9Q3XMc7Kq5QNkqrbPgu581a1Qv/e5iOXX9WHI4Ok20hp7IjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
	b=I48k2pfjThPueZSfsO81yM74cQrLHTZG0Rxa7BZWpbbm3WUti76y462Ow81+vwXFuO7+
	 P6Ap8rXQEl88dxrDTUrWVzZHNk6slF4QWhxH/5URFFO9YO6IiTgUwN8dhqi+r5CrNpj+u
	 HNYnzcZAJyEH9FGRfAfv9TxQgnwgbNYer5TnX/xMDiCmFrBuq0kcv+yZycDujJS42jbEC
	 z4C+VtSzhTkCgqEOpT+jOSV20ExVOXJoW+Msm/PN6rsqfcQ28ZcDRp4xbKMlST9Yk9eVa
	 6NrHzD8ibQ/YwkFvFZb/GtA8vbvgxhMnMI7IFRTsq93qKAbJWcJDhHjL3W+5aFCWvlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TmXZNG6g;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0558606EE9E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0558606EE9E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TmXZNG6g
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so16156535e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880687; x=1794485487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=TmXZNG6ghQYIwS8rLb6UXuIOgAX41WufUyU5O4906YvMWU2VO7I9LZCawzVsJi7QVM
         s5R9sjUeo1pl1ba8iTIDNoSUV/J9xo3UHIOqHj8z6PP41JhlB8TOH7Woz3c66VI2k0fF
         iLZqiGNezOOyKJhUktDjTqbfA9C8KPquuzSELgJzVJZmTrGGzKwshu6Ob2IPWTf3BoxF
         WfAlqeDCOSff54ElpzpTVtmbaXb+MRIai8JpxU4MRHgfttVYI3R01l9s5MslzMFiSbVZ
         TLYnOfi5ysE/cP9ZBqoj23wf7Qe6loWoz/SM9yHiO0okrwTuUgM62DXkxnCAkELNHnDM
         fBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880687; x=1794485487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=bupWxl9O+JiuEGkglqRKk6PlnEfolgX58RdEDB0uRVhnPjH+YLwsb5+Z+HNAd4fiN6
         l1O+AGegtLYAt04eyIX01vlH3MlJJd9oYnLhJ9T+A3B8wcYxgHnmzTaxZmNEXUcxWDYf
         FkSa8g4xfd+AEtEV0MmmwVAJJyWdw0L5Gj114dx9L0M12u8pJNEn34njon0/aqHLGjpa
         XG1TwVyyY+3dYQcRRY4LgY/GX8FvfHG+KxUZmq8klhiZauk+cBExPl52iZXJCGkgK9h6
         pjxf7PLrScnMuO+wChWx7nOkXCrE3w2Kd4eTflLDQN11QUTmrIJz+jDfgWs1XpdE6VMU
         LBfQ==
X-Forwarded-Encrypted: i=1; AKwUvByC3pjVAD0C/JE4BxP5PrW4sXLbnzc5cBVgWycYdUf3yW7RfII1JewGATcBs4lXmFiQQQfRNoWldBFWceQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rJSGfnAzqfIRKMB+yGxIH5ZjBbKNe+mmpLQUIxwvOTe1kNvkB
	O/jPlrJ5bPVNj2oRqKK2YQYJ36ruBWDMtIRwJsKsKKvfGhNx8apn3/aF
X-Gm-Gg: AYBFou1uK1PAwdCgbHwMtI7SUPjmSj4yHcbdPeuZ0OVRtp8b7uAY59iHwElLQ8vTEB/
	yw2HbjbCV3SijTVp26F/eqeApkzzvB42yY2sAn/fvcMdsqYxJIqPGKWxkeo3GSuC3ySqM4rK9Yl
	94WxKDHQ3bef5zgBD9565ME2PWhjjmiTUxNwJAyK7yw3P/v88pziCEc3KgxMhxUDblrEVgk7/vG
	f5uMm26MJHbP46Xk7E198tD1lt3bqEfF+IRcp0s5BpBM2lpyBnvfV6Ga0yf2IrB4krqcCvIoBsC
	5au2AZs7LLK6yOkAYHnjFXMvaOkXsD4mNoyYBeLSz4PeSqovhXw5bmdy3CSWWhhzDt4pbTgiKYh
	d90iIeVCtcr/FCDtcUMKF9z7MqSRnq6pWCC0tvqwM42UEpgSOqH3dUY95RYi7i/iBgAMsOuRVu2
	ltV4NAXsnSeFbectq7AGCqs3J5KZ+Qa9wGsaGf/G9yfehnOZgoRG9JqLVBLtVHXgO+v1cmr7tEk
	MUKfGdXPQ/XashjHShmolY4ItmgdcgIBwbJVPc7NaweWu/lkkfvoIhz9qJkB3+3vVF0eMVuDxXd
	kNRajrYsgfqWMJ3GiUZ3J7II4XYY2SH8VsY+jBlEhgQ/G6stp2VJknm7fDX5gm/f727RFKkgQEW
	tm/9z2G3HSvvwamCD6VXbqBns
X-Received: by 2002:a05:600c:8b04:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4ac150b2044mr412102875e9.2.1793880687317;
        Thu, 05 Nov 2026 04:11:27 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm58869885e9.7.2026.11.05.04.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:11:26 -0800 (PST)
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
Subject: [PATCH v10 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Thu,  5 Nov 2026 13:10:55 +0100
Message-ID: <20261105121059.11201-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105121059.11201-1-ansuelsmth@gmail.com>
References: <20261105121059.11201-1-ansuelsmth@gmail.com>
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

Use devm variant for clk_hw_register and clk_hw_register_fixed_rate
to correctly unregister the clocks on probe fails.

This should never happen under normal condition but it's better to
handle these cleanup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..2baec734df9f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -651,7 +651,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
+	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
 
 	return &cg->hw;
@@ -708,7 +708,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		val = readl(base + reg);
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -770,7 +770,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		}
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -1105,7 +1105,7 @@ static void en751221_try_register_clk(struct device *dev, int key,
 	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
 		return;
 
-	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 	if (IS_ERR(hw))
 		pr_err("Failed to register clk %s: %pe\n", name, hw);
 	else
-- 
2.55.0

