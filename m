Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300319;
	b=g4qWAquPjkQOnglNVO8iO9BBzAQ7Vcuwbo0M1VtLxggkY7soJPc7sq47uyZOV9kIz2Lu
	 ZkRny6MotGN/6jOBr5jHSD5AcwHI65M8BTPak9VVajYrbHLeubXWuhIOM1IFoR/q6HU8U
	 zv3BsG8aoT19/bgk3zY6TEt6PrM/VeuhWvh3f5nFtbSPcf0+DbC61qQAzVAqWZf8I8hRT
	 GTBQCoYfXhivsQhFJFPId8YpbylW8r0ireCLcdyMBjaHVprP3zNLVUVUIIeKp2QNWL3LI
	 8v/Xix2Onx4IEQuAPYjPBnRBGk0hgcpskc22ZUrUcbmnJyUo5gxCpHfkkEln0mX7Z/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9tJApL13jYD80pBp1MzydfMpvJBp4BlcldlOMSU105M=;
	b=0srHgsMCXidbDsnURRLClWGD/xPvkSG6/0vaSLINlIJBMFPeSrJJoOgtMlooHHQsVv4u
	 kRFyz9XRj0yO6U1frA14TPaTW2qTQJ3M9Wt73zHZ3SqmxFc63Zqsq6TvnMGq2svBM+hK3
	 33GikWYHVfgVGa7wO7j+1wcLZEh8w1emL/OcVbTzf3Rnyin+z+XOear0Ot+jeyAdGktCS
	 khrAzcxUi9v/NwiVuULJqfpwfXqOGOuWg8qz0p205424rftL9YfzkmhNpIbMdLLTxi2AJ
	 bNr/he68zPpWWpTyEXX/AH1Uo4WbacM+Glu+xmqfZPkXLpQgGoBPaNe/haidL7j0zoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROAa1Dd0;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77706606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77706606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROAa1Dd0
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso23314765e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300313; x=1793905113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tJApL13jYD80pBp1MzydfMpvJBp4BlcldlOMSU105M=;
        b=ROAa1Dd045ooc7vRm7+fs8AEm4NbqvkKt7xrNMxkXeL5nrPzcY9TL2+t1ItP41Bj1h
         Gj0Yw+2kJ8l+kNSemYW2kESFfoEU8UMMacjqSSIW0bRFCNfz+Lg97csRo9ivybDKCx6b
         cpbEwu0jXyZr8ncG/j/5+cnp2WBt+SllE1qPUvK8h2/pez0d2nC/ltA0Fzb4kJ4coydJ
         PtGenoP6nkCrUHXTffi0WTzrtc4jcqZTiYNy9Wt8Pq5vm2GDHA99cb6G+ciEU108Ua7M
         /EkqG2KUYwMMnVXEb/aZ/6F3jJD+2ZTqNtV7cNmVggCU99JqaA8ai/SvML8G+PW4/+Ld
         VPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300313; x=1793905113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tJApL13jYD80pBp1MzydfMpvJBp4BlcldlOMSU105M=;
        b=cqf87/IZRcqf3ZOlk8E9FQoItu+KGJhUcxDTnKUZL7a6xj1CG8D0JSGI4i8HsOKLJk
         /OOFIq3HWlsoAPvnMq5yjjRMaqjfhsmpEXtbAJ86xU5k3jzOpDkQ9TtHlebM/cE2c6ez
         dkLgavVkgHhKelg97Mz4TUDMeI60zppedArBw4ehQisk/fZBAjMToiD/Dp4NRMAwm2py
         OAQr29iG3mGdYk4n2h1+Ih1rF9SzWx+FS2P04gDGnk/4MJkmtdgNY+EtEOSOznZs9K8z
         zkDqd5ZZV+PbuAvNhITvdA58LT5EFc7YYIWJ1FJcVx0gjoQ3gOp7XyoQhJnZypgqnT1A
         YfYQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6oBWrjRe0tOOFfptLaVw8Bo3PB3eCUvPC7A8rLJuMsCq4bbyjhHJTkQXIxpfDossztD8zyFHUCwqMP5U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUsklUGZirs64SCYvu7LDTbJKnG7MGo0CCnG0v96jLbDUKNM2U
	EC/wdeocdk5bjzUJact8856+YuKmy09/WQN81wEtijxX/XqZEptwxqbX
X-Gm-Gg: AYBFou3nD7Mmhagrze3kXnNzei8jxfSHkggDt2a7eMiAh+hhqCqo0d8v8fIcPL5owFL
	MyanI2fB4W3bjXbrOCXs3FG8lm4n0NI9/BR7zYWbP7Ic82TRkSvgXnHDR+xKDkOBV/nRLfsVXgH
	ATEu6jbthl3Ol42G9RlKor+9iGtCZEq7rtMhpek2u1cTCeF/awKZb6o20ZJaHDSDJGYQYN/Qci6
	6gWJnARLunejyTvDkihBotyNI0+4Wa7uzIZOwcIyfq7TXxdn1OSVXioxnNEAKWcTYaRtOVlOaOq
	YIIX/HQEPB1dfUaxkufalIc0bYZKoVeUPB1+LasWx20Cr4tinmVhNrKYVy1Ckxt14r3qO5Y6G88
	A8rL3xL/xSdNTHBX+hknqDVaEIcgBG7uJMvwvXVXrxGF9zPKXUGQiGSFfeLYr0X1gK892/6l6gs
	B2XbTFMgUbL0GoUVnh3ECkdKMtdy8z3f9MbcDQQPWVjaxFAWGcnBlRjdxlzKcMFZu8SGSPo7Dfk
	8mq2StE+Qev8+KfyYJ8kZynF5qwMSb61nGRps1WyxHiBfkNM4WulkO8l4EZ+TsZlbjd6HjwKh/d
	r3Z4yDicqLuoiePJeYib6MqRl51PXlxvPCe6Koc/fC77eLK5Jnii/iyoNP3zAjkb4JnDXUZTeDM
	8hif/Bc1y5p4=
X-Received: by 2002:a05:600c:8183:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4a9677c92d0mr123815985e9.35.1793300312779;
        Thu, 29 Oct 2026 11:58:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:eafc:6fb2:6c68:5ae0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm94291535e9.10.2026.10.29.11.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:58:32 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 29 Oct 2026 18:58:28 +0000
Subject: [PATCH v9 7/7] pwm: rzg2l-gpt: Add RZ/G3E support
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261029-gpt_rzg3e-v9-7-f3a5520388d3@bp.renesas.com>
References: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
In-Reply-To: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793300303; l=5197;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=rMti4nVWaXcqMBwGhXa7IT8v4yzgTB4dEpyc6qkRjiM=;
 b=MPzAnHk+d4TjXb6vN0vwjaqQCFI08wtO+hhJ/GBLBNIu4YFoESZUfTHGDuJ8KuU5HgAzDQTtj
 VL0IZpo1idQAMsc+lcltoqN5JKsbqXl5cxXaThMr+PUwBuPuYMHS08Z
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add RZ/G3E GPT support. It has multiple clocks and resets compared to
RZ/G2L. Also prescale field width and factor for calculating prescale
are different.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * Updated a comment in limitation section '8 Channels'->'8 channels'.
v7->v8:
 * Updated rzg3e_gpt_calculate_prescale() with >= 64.
v6->v7:
 * No change.
v5->v6:
 * Updated rzg3e_gpt_calculate_prescale().
 * Updated comment in rzg2l_gpt_calculate_period_or_duty().
v4->v5:
 * No change.
v3->v4:
 * Added RZG3E_GTCR_TPCS bit definition for RZ/G3E and added to
   rzg3e_data.
v2->v3:
 * No change.
v1->v2:
 * Added link to hardware manual
 * Updated limitation section
 * Collected tag
---
 drivers/pwm/pwm-rzg2l-gpt.c | 45 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 488839e99464..5ce662559263 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -6,15 +6,21 @@
  *
  * Hardware manual for this IP can be found here
  * https://www.renesas.com/eu/en/document/mah/rzg2l-group-rzg2lc-group-users-manual-hardware-0?language=en
+ * https://www.renesas.com/en/document/mah/rzg3e-group-users-manual-hardware
  *
  * Limitations:
  * - Counter must be stopped before modifying Mode and Prescaler.
  * - When PWM is disabled, the output is driven to inactive.
  * - While the hardware supports both polarities, the driver (for now)
  *   only handles normal polarity.
- * - General PWM Timer (GPT) has 8 HW channels for PWM operations and
- *   each HW channel have 2 IOs.
+ * - For RZ/G2L, the General PWM Timer (GPT) has 8 HW channels for PWM
+     operations and each HW channel have 2 IOs (GTIOCn{A, B}).
  * - Each IO is modelled as an independent PWM channel.
+ * - For RZ/G3E, the General PWM Timer (GPT) has 16 HW channels for PWM
+     operations (GPT0: 8 channels, GPT1: 8 channels) and each HW channel
+     have 4 IOs (GTIOCn{A,AN,B,BN}). The 2 extra IOs GTIOCnAN and GTIOCnBN
+     in RZ/G3E are anti-phase signals of GTIOCnA and GTIOCnB. The
+     anti-phase signals of RZ/G3E are not modelled as PWM channel.
  * - When both channels are used, disabling the channel on one stops the
  *   other.
  * - When both channels are used, the period of both IOs in the HW channel
@@ -47,6 +53,7 @@
 #define RZG2L_GTCR_CST		BIT(0)
 #define RZG2L_GTCR_MD		GENMASK(18, 16)
 #define RZG2L_GTCR_TPCS		GENMASK(26, 24)
+#define RZG3E_GTCR_TPCS		GENMASK(26, 23)
 
 #define RZG2L_GTCR_MD_SAW_WAVE_PWM_MODE	FIELD_PREP(RZG2L_GTCR_MD, 0)
 
@@ -147,6 +154,22 @@ static u8 rzg2l_gpt_calculate_prescale(u64 period_ticks)
 	return prescale;
 }
 
+static u8 rzg3e_gpt_calculate_prescale(u64 period_ticks)
+{
+	u32 prescaled_period_ticks;
+	u8 prescale;
+
+	prescaled_period_ticks = period_ticks >> 32;
+	if (prescaled_period_ticks >= 64 && prescaled_period_ticks < 256)
+		prescale = 8;
+	else if (prescaled_period_ticks >= 256)
+		prescale = 10;
+	else
+		prescale = fls(prescaled_period_ticks);
+
+	return prescale;
+}
+
 static int rzg2l_gpt_request(struct pwm_chip *chip, struct pwm_device *pwm)
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
@@ -228,7 +251,8 @@ static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 
 	/*
 	 * The calculation doesn't overflow a u64 because,
-	 * prescale ≤ 5 for info->prescale_mult = 2 and so
+	 * prescale ≤ 5 for info->prescale_mult = 2,
+	 * prescale ≤ 10 for info->prescale_mult = 1, and so
 	 * tmp = val << (info->prescale_mult * prescale) * NSEC_PER_MSEC
 	 *     < 2^32 * 2^10 * 10^6
 	 *     < 2^32 * 2^10 * 2^20
@@ -482,6 +506,14 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	if (IS_ERR(rstc))
 		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert reset control\n");
 
+	rstc = devm_reset_control_get_optional_exclusive_deasserted(dev, "rst_s");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert rst_s reset\n");
+
+	clk = devm_clk_get_optional_enabled(dev, "bus");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Cannot get bus clock\n");
+
 	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "Cannot get clock\n");
@@ -520,6 +552,12 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct rzg2l_gpt_info rzg3e_data = {
+	.calculate_prescale = rzg3e_gpt_calculate_prescale,
+	.gtcr_tpcs = RZG3E_GTCR_TPCS,
+	.prescale_mult = 1,
+};
+
 static const struct rzg2l_gpt_info rzg2l_data = {
 	.calculate_prescale = rzg2l_gpt_calculate_prescale,
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
@@ -527,6 +565,7 @@ static const struct rzg2l_gpt_info rzg2l_data = {
 };
 
 static const struct of_device_id rzg2l_gpt_of_table[] = {
+	{ .compatible = "renesas,r9a09g047-gpt", .data = &rzg3e_data },
 	{ .compatible = "renesas,rzg2l-gpt", .data = &rzg2l_data },
 	{ /* Sentinel */ }
 };

-- 
2.43.0

