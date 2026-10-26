Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021397;
	b=ubIWt0T2L1RWNaX2lCJpLkEEIiombZXFHqfnAr1vawcHTqo5n6cQy7xRTyr2Zeua+j7p
	 Fkt5ISaj3ZQbjbBUbOKGrUgIeIEYkuCrZHsIVtUDLMbgdhGpL07zFFJ/EadjG2a83AoHW
	 yfsKLbe8VnGe1Ha+BBOYPnDPt2BiJAPiQGdQHlppkgrpywQ/HNGHEZb0JrMBwYEWXum1g
	 b656IAlbB5MyyH0OXkt0Y1S5mDmAHZHwtPGdOszbWVywPlvnpE0lKtY9RZYYtriKoz7AR
	 hdX2UBrPuglfyZMVl9+F5Uv8lmBA3VRpVUGhWli7vUAhTASd0pQBaVu03XYRCC+O0+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BO6aaS6rcK9WalnH265ep27g6d3OOM+TLOjjpCjcQ0M=;
	b=VZyPG+b/zsbBwVPNTYwmQO2O5OLy6aTcFPUyikKoF49lK1nS8I6qxXsrKD3JkKE7sgan
	 s/BpkhOCNKd4Gr4Dd8D8MYhyRfZ015iWQGSnIbtPNt9cLXUfebpdZC08jBTuk7cVCHTdT
	 7v8HgYP74jCcpcWv7o5YW96ht8c6gqb4Qo+ssqz1+wIaSD1qmpdMWttyc5BeYtQKTg13a
	 RUfA/qA/x6LCXyxYELMsBRswKd61jFCNVL+Bbsehp8DD5FLeJLIVecFUlpQrNt2qXRJGo
	 e48dAd6UMQu8We5Cn/jIk0k9NgZKD+IVlAhofv/2QPuVLcj6ndloZ0hTAZC9yT7fH4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="K2Nb+/ko";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C23E606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C23E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K2Nb+/ko
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2652940f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793021395; x=1793626195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BO6aaS6rcK9WalnH265ep27g6d3OOM+TLOjjpCjcQ0M=;
        b=K2Nb+/koCRWjz5rN4BYYi0gp4TsWWbH/KnKT+9vScxxIHTLUl/nEEeYLXNqkY5aPsv
         ORsx2QDYuqnw0GsuQwNQiWFgdMhqCp0m/iAYysrO7DD8fNVipuQYh6o+Cd+y7Zx1Kh7j
         UFXKPimfTcBzqpDohvjFNIM37x5IpC4fDDcG63DSMr5zZH7zhAE7NtDuKkMfPevreoX0
         DPKVtZvxHlVriABDVqRfFLSnkTxGW5ynNkGOJkt2jUcCzHPZEh8G5A0ZuUBLeJSrPbA2
         AvHZCWAEA/tZjH3rIAXOsvtLCn+KuC+sQz5i0RxlvAIBfUClGfKlbqYKvhkKu5kMTU46
         +oEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021395; x=1793626195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BO6aaS6rcK9WalnH265ep27g6d3OOM+TLOjjpCjcQ0M=;
        b=NoroNen4YNqlNRrNOtDs/5qJvTbVm7Tvbjmaw8PCjEm/DVrz0ubuekeHz0Ctbu+qik
         cgAMuBfigQRLWRVTg+OrrS8Vxse3DgfP6X30wvUjiie551mPsn1gPNNMFlnCyR2mnIgf
         KEo4DDvQZARsB8ky+mdsYZJx8DkGHs0o+LOW1QBp3LyeOe1r+0q7spsGaGX/6cJTi9Ph
         3jiBQGLAx014dObfhZ13/RKlHdj7m2b2wYQx6Qn5273od6FoE9EqkMrSwsii5vztQzFK
         WIHWdEdDYmUCAuaUSJPJ6mzuNJBoq03Ex4PsZZJspigRsikJLm16bnRkrjXOfoAZHfdP
         GwAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpnUq+yB94TGTakRGwEwdnocainOO+GTMd4eNdJgJQMKloYP4w/Fp88QEoKC7ByKcXZpb4L2UemMi9aks=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2qkcRGN8R8gduwhWA0YwukWpicwaXnr4DmkQTtTL08A4XnKOU
	/s3hctP7yvINJJLbb2nDPtmQothkxdqP2e1O9829z7R9+YTWKIClbcyivIm1Cur4WpM=
X-Gm-Gg: AYBFou3c58xIWiPZg912afMTn1YXaMwX9w6we/QMkAcC4F3u/eBCidrbNF0jDklxQXc
	1/N+Cm8ub5UkkBE1V+VD7HX+skNM3Ja1xDsmfN/nEJImlqmAzeHlBGHPmcnJRLfVP765Crl8ntE
	u//HP8PS5UB6f1iLnJhqBI7rwfZs9nTBFaRpxPrH6KGJVFm4vGno64MtZrFWnfocbPFMgZGzAvk
	L+qMYbJzg6p6PABhKVDSNZf7G0miKLZ1v2Tsv53XnN05pTMiooS5k5+0wQomNetBinWcYdB9cJY
	Gc36NALVEqTRTIt4HH7z4OClPUdo9YcH+CLBjEMYskTKL4pih+R/yglHmuIvBFi3SKfXS8ec+ku
	St5CVtolfcobJr+fzC1xTyaKXXA9KwV+FK9Un8dThX7qnNmMcXkBz4R+hWkgB34e/h3qfnNKDWk
	gAIW7wx9T3lL0lHtgrSYym0+oyvhK2YIWPNK8C0Wc0QfKN0WEI++vXHawqBnCC6mcRDDKbxD6pg
	9Cn2JMmw1uhuvVvntfBYo+3iWhXGSwl92IVZspDNndk+hgdlAMA7tyfD+VWA+fA7nVITWY/qdr8
	8XEOnI2me9qNg8IKyG31B8NUgmWN0bCMcA3gt+JHx7Ny+P2XCXnyjsABKBg2NvlHP8vI30i6
X-Received: by 2002:a05:600c:3e10:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a35acba868mr111743135e9.29.1793021395526;
        Mon, 26 Oct 2026 06:29:55 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm194507095e9.0.2026.10.26.06.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:29:54 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 26 Oct 2026 14:29:45 +0100
Subject: [PATCH 2/2] clk: meson: regmap: use the current divisor for
 read-only clocks
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
Message-Id: <20261026-upstream-clk-regmap-ro-divider-v1-2-c8216b0fb93a@baylibre.com>
References: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
In-Reply-To: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

None of the Meson clocks using clk_regmap_divider_ro_ops set
CLK_DIVIDER_READ_ONLY. Without that flag, the shared rounding callback
can choose a new divisor even though these ops cannot program it. The
clock core may then adjust child clocks using the wrong parent rate.

Make the read-only ops always round using the current hardware divisor.
Parent rate changes remain allowed with CLK_SET_RATE_PARENT.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-regmap.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
index 1ed56fe63cae..002e16865109 100644
--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -120,26 +120,34 @@ static unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
 				   div->width);
 }
 
-static int clk_regmap_div_determine_rate(struct clk_hw *hw,
-					 struct clk_rate_request *req)
+static int clk_regmap_div_ro_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
 	unsigned int val;
 	int ret;
 
-	/* if read only, just return current value */
-	if (div->flags & CLK_DIVIDER_READ_ONLY) {
-		ret = regmap_read(clk->map, div->offset, &val);
-		if (ret)
-			return ret;
+	ret = regmap_read(clk->map, div->offset, &val);
+	if (ret)
+		return ret;
 
-		val >>= div->shift;
-		val &= clk_div_mask(div->width);
+	val >>= div->shift;
+	val &= clk_div_mask(div->width);
 
-		return divider_ro_determine_rate(hw, req, div->table,
-						 div->width, div->flags, val);
-	}
+	return divider_ro_determine_rate(hw, req, div->table, div->width,
+					 div->flags, val);
+}
+
+static int clk_regmap_div_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
+
+	/* if read only, just return current value */
+	if (div->flags & CLK_DIVIDER_READ_ONLY)
+		return clk_regmap_div_ro_determine_rate(hw, req);
 
 	return divider_determine_rate(hw, req, div->table, div->width,
 				      div->flags);
@@ -176,7 +184,7 @@ EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, "CLK_MESON");
 const struct clk_ops clk_regmap_divider_ro_ops = {
 	.init = clk_regmap_init,
 	.recalc_rate = clk_regmap_div_recalc_rate,
-	.determine_rate = clk_regmap_div_determine_rate,
+	.determine_rate = clk_regmap_div_ro_determine_rate,
 };
 EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ro_ops, "CLK_MESON");
 

-- 
2.56.0

