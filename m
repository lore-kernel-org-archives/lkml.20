Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278472;
	b=kPQnop0ckhlgEVsNxPxkbQ73VSGJGFh/V03JfXQH1cIDyqIeUUmgblUqDrbZAjJAfYqH
	 Zjo+EbjEwkFv3yEWmydiWhkKPSdvUWN209T53+zIvs6m5HWVzLWgpt2Sa8pLWlPIsKHRD
	 5MUd0wUJkDpyGHnJrx0hP4Ib8PgW9y4Hdi4NHOIA5LX1UlxVzUih+2qFQx3wUUEKNrlbg
	 BJ2zeNQisnIZJsJB2+AI6DMhYO+jpJGjhU1IvdXtzXeDw8unbITFrtO36fI9+4QSNq7/r
	 vR0HvjkSVD6gHHZLdPRbcPCzsm+3SqwWmqGfmnB660FWgIdom8q2CwpeG74LRtgli0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=MlnO/XQNGCl3Ib1nyxoNZ+8myRyO4vnZro6S1iLdVc4=;
	b=vTOsi8WQFzvZ/Sdl54kopwdYBUiO5xXpLmYVRYpyAlh49tvnTcA/UvhWeQUi9I1BcuM1
	 HBYw73tx3bVhpMkrEjw5fFIo0tIIc1A+r16mmEO4W4zUi8ES9SgYnZHjco2inMe0gxArz
	 ExStzaa8EdN47yW/EgjYvb0ldgAE/D7KVJafQ80oEIRpTH8AKcCXicwMoW3YG02+J7eba
	 XJhkczXLbXWRdjEBc29XMTvF6ePyuW+U2PqktwriJMvWqC/m2pPs0c7QX2J28M77d+vme
	 a/OapJMefjEgqG+dPExZO9r+bzwzFBNrujEhPKmbSW1ddx2lKQwpUXHxg/NRj0TT2AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bJJhj76E;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9AF606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A9AF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bJJhj76E
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so21508045e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793278470; x=1793883270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlnO/XQNGCl3Ib1nyxoNZ+8myRyO4vnZro6S1iLdVc4=;
        b=bJJhj76EIaQw+OBumHCnSnRaYtBXaK1DSRXb/r/grQwZ1utoTKdSq8NiUr2WfgkrAP
         gphHcNLr9Xy5nlxomkmpqSSoKnkRHiG7cVpUL6XsuTLS5KbZxuZe2onTyKWp9o2Gr3CI
         eOAz7wg4lIQtTbjMynRODrxgZdLgXJdT8qIpRpBlieP3SfPbZyR8Ug/b5r+tiFdvFCaZ
         OAzUMRtEuNR8+xfRTdXHEFoeqnM/ctiJEzGdFSGrR0AU0j/TFGuE9w0mmm+Y6WLEadAC
         CXrKbKMF9OZ7NRAozHHg9yJPbrFiCz9JH7YmqWxpJDMWnH1xBA+jPGd2mC8ckafhZ7nk
         1J5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278470; x=1793883270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlnO/XQNGCl3Ib1nyxoNZ+8myRyO4vnZro6S1iLdVc4=;
        b=WGHyp5WMLrZsKvbPulcNpk3GYvdCdWFVVJBwUlN6L+hHChMc2jQ1oh6UxWuOTlEAA+
         FY+45jgIG7xMTIHLEM+5LkMv5FzIasqa47hbC3sXImb2yO0koXFIpqgglzejz1Mgof1v
         Lf0fw3tocIpMWqNrhMJzK+Qt6gZxjEZGLiQfiPW9bySKfXN/HDh/O28sC2+x4pK65U9U
         I90JFImghc2nmu1k3pv06wGZrI0IfysmZb3vgPYPbXnDG+MSDswCRBxZlG/rXMJhtw10
         yGZGwqlGjjOTamMvCxDIn2+7E8bzptkomt4k0D+bEj0pxTzW/Xw5RDeY4uMklHMkmpIi
         k+nA==
X-Forwarded-Encrypted: i=1; AKwUvBy/FNZYQ3ar74U/UiXmqYjd8CIhtiACwLF8HMkBf2XRnaki5rlX2pp9pRdqB8QQQUDTR/b2Z/1LgtTfePo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIie/PXJial+YJQudGx9JoJaF2qqlcVjBUGVTZL7Xguxp+EplpP
	l2/1/23LK+BkE7H3oSKdJfVcRPl2hNClVPEoSTUU7yYi5rQllfVrACOviyVJVmd/rzI=
X-Gm-Gg: AYBFou2zeCdcfz287Of0CoBmyRrDF/oST3Owg7cZAhbt9DyVsLbPpvOr1THk8CoGR1n
	1SkYfPAakYDIAhaSEuz0sSh41C+qYUEMHppntEfZAEbLgx8qe9uzq/GkPPFywBdrH4l6In89A2g
	QBFa6GCxeyFGYgNVT+x8NBJdWBizSz8NX/X2n4HGYdrsvkjpvoj1VWLhtEWprJY0YWNsosWAczR
	kzeXSfejO22z+TcbiZrPJusKRigADmipF08hjEbyfStyJl9mHdMQKZp4VDRVhWdI0BWREqcEzVt
	X/M6pB+Bj+COc5FlD8NkMsRJI+QblxUnFGWvnfEhSQcBdFQS0isNbz4oQxHDJHC12fApSak9ToU
	2yUJBR5fbfNokmalIpCV3HWPL71ZtccdqgGalLlcuUZfbM5hruuadhJSQQ0E2Z5d90gnWmgJIEz
	RKrQ3EMohGCUjdDmGBplgXsV9WETXiJ78XVmUZcMsPc0Fy2Bd9AGyQKThh8HLsAJv874MHO/jjf
	Cf02YHtl/a41ej7hIpLbdsPIZcWewkAbxxdsLbsM+ggxBWYhs8+Cl+sSifX4QJUjZMpKhF063zJ
	vNIJlLkuupVGkiIZK5JaSj0qxVcY+gH/Kis38NnsLG+BRsCRqw85o1rXbSUEozKCfSW+AvG6yI6
	E+PGSM6kct5JpzHU+tFySZILsreC+5SigtvxQgYcgEfK3KQ==
X-Received: by 2002:a05:600c:6095:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4a9643d51aamr113545565e9.2.1793278470416;
        Thu, 29 Oct 2026 05:54:30 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm35034622f8f.11.2026.10.29.05.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:54:29 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 13:54:21 +0100
Subject: [PATCH v2 3/3] clk: meson: regmap: use the current divisor for
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
Message-Id: <20261029-upstream-clk-regmap-ro-divider-v2-3-7a375fd8f88e@baylibre.com>
References: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
In-Reply-To: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
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

Fixes: ea11dda9e091 ("clk: meson: add regmap clocks")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
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

