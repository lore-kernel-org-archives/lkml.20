Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300310;
	b=kK3sLxrr0b+Ah5LH/FqA7AjOQwtmIlCVuXL7yJkvhNGg5tslO66P43U095sOxMH2bc2v
	 GH3hIHQ5wTjGxoG7akvUixOLCLvE6KtKusbdcyK15hLjsqqJcQ65RLg95RFHsA7/Tz5g0
	 KE4cvke6nqcZhDjLStBbi9JaXY2IulQNljqdScT5ant6HAg/nkOSYrD8kjN/yup53MYHe
	 dVmAbzaMsi6bKdfgQX1YU3i+geNGT0KI/EEeFZiGEbGWT/GH3eIWKZWa1PWGp2cUIVHnU
	 gE3T1DkIvEQL5OkLA4b4neofEaySiv0Jndnhkad0TbCD0n4dHwV2YebM9CJIEq49mRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rbI9RqX3ttU/XFS7d9UXMiiXZOo1/l4f7kQVLIvsA8Y=;
	b=qyBTtd1TjwSqI31ZZoTz2Vv/sOjAVsd4K2oRSKU/3TWy25jfMj3r/mP94rg9BTC+PXCl
	 SioCyMx7iwAiAaoxDF7GZKVexTkRT5UHuqoj+qrI+PONSmqD+GK7glUDGjgcemn1wwEbE
	 P7Txk88lYUVcF8oUlg6An8oe2kIunJn9CtYGVvMRPf4nYMS5M5Pno/alRgVp6HvUrK2cY
	 Bop/5FF03RYUgyPAVNuI0eEP7KVGkQMNopuDKKbsiIHThsXHijR2u8rmEcIv+p/pjpHjW
	 uP2qLapQ7L1sMXsD5Rk4PlgEsaf1NYG0yrJOEvmUy1CzEqEefhpuLl+WIRHZHfUWERw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZlehwPUe;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B6E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B6E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZlehwPUe
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso21587675e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300308; x=1793905108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbI9RqX3ttU/XFS7d9UXMiiXZOo1/l4f7kQVLIvsA8Y=;
        b=ZlehwPUeWHIvJWMcOwcjPrBaEC0p8+PXvLWZ5BlMXt9Yrm1F7U84ZptR4LD2AvWsh2
         fbFUe1BaDtlDa4LbzxhpKaaz/RUKjVnk/5IErpzjuX3072kFaUm/6oiYNGQDX1A0Lgr9
         PuZ7GMqIZ1pEnGcTeb3sGrtg90MzHxqdFBR/7GqDb6m41Erku9A8j5BLOCJXN1iDPkiD
         S0owNGf/Dr3meNUIs9c3Nx5qA7gENrdbs9KCKKONf4BSpqoUnmV7J3z4wTKYGPpa6oR0
         Z2yUDEsWWPEIzWT1+fq1Wc+v8ZLR2BnpqpOh2A4BqKrmevb8Y3y7y8TbTqAke1ZWtpOf
         E11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300308; x=1793905108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbI9RqX3ttU/XFS7d9UXMiiXZOo1/l4f7kQVLIvsA8Y=;
        b=PsGnCJIKes6VeaMWznLfcagBZhGQ6/ae1fyYxvnezcL1N47nt4QlmCftyi+d+G3bL4
         FQt+kFPBARFQiPu3E4lCmX6zYjyBRoXA2wcefOyV3WM8NlvS5vPYTBtv3IPRU/qeD+wd
         Cz/qxq/aRFF/KlvxlG3Z0lSWLPcYehu6KDOw5v8D0/XhS4drS1ULTYPqdOfszwLjRmjv
         PWZXNiAZwlGhXH9UGmRgqJKcpOzluQ3Kh1CiKenF3ob3n2NE2CxMbG564YB1m7zvjH7F
         mXGlZAo6shL3rKrxjo+0qQaTZ3T1Jy7bXxFBFVg4DGlXGKzUr/jh1duBYgiik24oNnUe
         r7Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxPBC7Zwm+S2LA9yc36NNCEiTMnW40sqp3vFzr7diusZ4u3nku6jXMJDugXnDGOPwSwsHG7yHlHOYiVeLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZq2n/eqDGhd3YRJ/VxnlQqVgkEx8vOBQPy0JB4fi9HRoSTeTw
	qLjj1eM/Ot2kVp9/nN4PO1ODJEmYjjU+q/EDtjdmcJRWpuKUloPsW4/7
X-Gm-Gg: AYBFou3lUIH9Mu9sb8ji2DBZAIBPLQOt0ol2vquy+26OGxXBSFpPzacT3c/qtBJJBN9
	FXVVseflMSgqIm/Rx+MTaY/iomxyDsMpKiruSqQJvAmILPXG5Pn0Zjfc7XJ3vL84Yx+Sx4p5Q2d
	zpzT/lYl9uVqGc6Nn9E+hpMKL0eofmf/N5rEfduaEQI5xYF0VtFtR/dguA2U6rd37QP38CNrbmc
	ILfSzkk+Xc4axgAM+XOdPBNPsajJpShsaCF1ku4NLTCsTguQi6q270fxdzBwAcGXGlxHwR2X1N3
	FA+lYDozrqFTN+lZ16OxCj0JqvNQlSPkjpP/rLEnXCMkX36UoNkJLc6IWAtsfgdrRYdNCnspWkp
	87ddLRXXMFzY5qstnKKfaQunatqNqdNrqOKrY57Wh/Rg4Xr6BeCc4DgutGSfn/D41Gm0u6GqtZX
	zWm+lepZCLmf+NAj4Kg4NEPBxFdGlmVWw7yWpqTfe67VNolcRzplVct2XDmUca2MqLseX8IPGTz
	UhYYtwcIED+cgkLOzhbXScHIqrdz2svu0zL/+Ho9IWV2HEjvN2f/1Q8qOy+alIMv8gU45Q62h16
	QsKcwjszBaRcdIeGQrHqfK5k18moxgguG7Hauiysnxz2uwlnz5mXfoame5aOOgtOiQ==
X-Received: by 2002:a05:600c:1909:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4a9675dc5cfmr143215595e9.28.1793300307987;
        Thu, 29 Oct 2026 11:58:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:eafc:6fb2:6c68:5ae0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm94291535e9.10.2026.10.29.11.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:58:27 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 29 Oct 2026 18:58:24 +0000
Subject: [PATCH v9 3/7] pwm: rzg2l-gpt: Add info variable to struct
 rzg2l_gpt_chip
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
Message-Id: <20261029-gpt_rzg3e-v9-3-f3a5520388d3@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793300303; l=4115;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=W3HtKW2QA823TNPg23+hej8R42an2z8h/hfkwkyGKfE=;
 b=9YzfOW/+tKP8tDj+Zedv6ZVcDku3/TDeIW3JRhb7HthEutiuPhOn55NVnQVSBqMNORlIPE1+r
 NR39N39iZ9hA92nVWK2djU+Dn51FiwKW5c3GUTZXO5iQ4tAoYiJ497M
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Introduce struct rzg2l_gpt_info to capture SoC-specific hardware
differences, starting with the gtcr_tpcs field mask for the prescaler
bitfield in GTCR. This is needed because the RZ/G3E GPT has a 4-bit
prescaler field versus the 3-bit field on RZ/G2L.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
v7->v8:
 * No change.
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * Updated commit description.
v3->v4:
 * Dropped field_{get,prep} as mainline now support it.
 * Updated commit description.
 * Retained RZG2L_GTCR_TPCS bit definitons
 * Replaced gtcr_tpcs_mask->gtcr_tpcs
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index e9ba0f3bdeb1..19476fe7f5a8 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -77,9 +77,14 @@
 #define RZG2L_MAX_SCALE_FACTOR	1024
 #define RZG2L_MAX_TICKS		((u64)U32_MAX * RZG2L_MAX_SCALE_FACTOR)
 
+struct rzg2l_gpt_info {
+	u32 gtcr_tpcs;
+};
+
 struct rzg2l_gpt_chip {
 	void __iomem *mmio;
 	struct mutex lock; /* lock to protect shared channel resources */
+	const struct rzg2l_gpt_info *info;
 	unsigned long rate_khz;
 	u64 period_ticks[RZG2L_MAX_HW_CHANNELS];
 	u32 channel_request_count[RZG2L_MAX_HW_CHANNELS];
@@ -324,7 +329,7 @@ static int rzg2l_gpt_read_waveform(struct pwm_chip *chip,
 
 	guard(mutex)(&rzg2l_gpt->lock);
 	if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, &gtcr)) {
-		wfhw->prescale = FIELD_GET(RZG2L_GTCR_TPCS, gtcr);
+		wfhw->prescale = field_get(rzg2l_gpt->info->gtcr_tpcs, gtcr);
 		wfhw->gtpr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch));
 		wfhw->gtccr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch));
 		if (wfhw->gtccr > wfhw->gtpr)
@@ -346,6 +351,7 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 				    const void *_wfhw)
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	const struct rzg2l_gpt_waveform *wfhw = _wfhw;
 	u8 sibling_ch = rzg2l_gpt_sibling(pwm->hwpwm);
 	u8 sub_ch = rzg2l_gpt_subchannel(pwm->hwpwm);
@@ -373,7 +379,7 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 		 * that the lock is held again, that the values computed by
 		 * round_waveform_tohw() still match the running configuration.
 		 */
-		if (FIELD_GET(RZG2L_GTCR_TPCS, gtcr) != wfhw->prescale ||
+		if (field_get(info->gtcr_tpcs, gtcr) != wfhw->prescale ||
 		    rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch)) != wfhw->gtpr)
 			return -EBUSY;
 
@@ -401,8 +407,8 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 	rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTUDDTYC(ch), RZG2L_GTUDDTYC_UP_COUNTING);
 
 	/* Select count clock */
-	rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), RZG2L_GTCR_TPCS,
-			 FIELD_PREP(RZG2L_GTCR_TPCS, wfhw->prescale));
+	rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), info->gtcr_tpcs,
+			 field_prep(info->gtcr_tpcs, wfhw->prescale));
 
 	/* Set period */
 	rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTPR(ch), wfhw->gtpr);
@@ -460,6 +466,8 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	if (IS_ERR(rzg2l_gpt->mmio))
 		return PTR_ERR(rzg2l_gpt->mmio);
 
+	rzg2l_gpt->info = of_device_get_match_data(dev);
+
 	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert reset control\n");
@@ -502,8 +510,12 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct rzg2l_gpt_info rzg2l_data = {
+	.gtcr_tpcs = RZG2L_GTCR_TPCS,
+};
+
 static const struct of_device_id rzg2l_gpt_of_table[] = {
-	{ .compatible = "renesas,rzg2l-gpt" },
+	{ .compatible = "renesas,rzg2l-gpt", .data = &rzg2l_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_gpt_of_table);

-- 
2.43.0

