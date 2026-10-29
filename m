Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300311;
	b=dTozFLOwYZQEQnBA2zdoJzpwk6W1LIGsEiQV4/WdWlyxG4V6W3DEI3sDUqYBRUC82rYE
	 1bHIohH1IlioAn6mG+L/8/nGs3lbkEEE8FcPSak90Td8aZrwyafPJhjkorZHP6AV83EL8
	 Bu2SHp72WQ94e2Bay5AFKFkhbXGqfoY9Kkc8nVHBnfzaP8jcD8Qvp7uV2Zj5ExOQUZ+aF
	 JTmERZOKxSipf9FBafRF/DTN9uiLa7Kwc5iGSiC9YNpLOL+j0IQPulw+3FdqNedC1N9u4
	 l1nssZl5MTBxn5Rkqn0jm5Dpc49T5jFplrBufCuBOEdt15QdvhT+dstCe5iHCNATqMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/3cpml9Pc1g8jQBDVdNVjYO6TxS6Y7Xs2MJBw9yVEuU=;
	b=h2zV199u0Z98+4YrQbuX8uNZrZkUzTPgls6aCUu/CMBQnJgID5IWuMnEPt3bNRSMa3JR
	 YGeSzYT+OV4UDV/wdSFYwYoQYVNcKTSZ3RjrO+yA0z8DukKvX/si6gug9gyGucNEuSbLQ
	 4JNEqPG4YOR+Kzc0nbqHrmNFbwRhmU3ZukOLWd+ABU6yKI1gi05WNdUwqQDpPIofZeaK/
	 An8NEYQ8pDvyR+yVCKPldM7faMpGOj45EL/r+3z+u+wtb06XMMIimw2TaRAR2ASpenmKd
	 RDYcLxpte7LmIzsV9Ed4w5pBsigYSvsfwfP3jzciNT9YwnF8SGAnVnPRdAlOxGfkdCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GODsjS/e";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB06660A2601
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB06660A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GODsjS/e
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so21094955e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300309; x=1793905109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3cpml9Pc1g8jQBDVdNVjYO6TxS6Y7Xs2MJBw9yVEuU=;
        b=GODsjS/epBzhJZ/rA0H1h0T0Lei1OUo0AJDlwOAe7hATL1Il1+XePMNk2HuqClK95A
         r1+M3nchGLCFhVE6PZOpfSOndpBs6wlcVOfe2To+1wD4WzzE85X8vYFN1s0FKYfAVZwu
         XOHYdaYoEXKaGxEIWdwh2qdg2IhVhRwMki/tD/tmzdvt5k8CRlElbffjS4T6lT9nyc7y
         T6WZPzTLYqQMfJ9Tb9/IpF+W3X06SC+SIocAZhAddS7KZcAoKPPNXG4Mhw+YlY+uXtlL
         53ybI0VKT/7oODek8LjrdD2uD9s24L/SzVFL7sk3CnP85OgYCAYVz2p+/liPYPnCHU2f
         MQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300309; x=1793905109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3cpml9Pc1g8jQBDVdNVjYO6TxS6Y7Xs2MJBw9yVEuU=;
        b=VFUuqA8x9zcMjTBpPTwxCS8U3rZJL20KxfEbE+hkgFnnNdRqUK4QJb2Y37J2NrVc7d
         oBBg0BaFXffrnkAyqv0stqh/ZdQJqEjp98uYC5zWnqfZyBngPNYfA0LFfSpj9+udMp/D
         b3GSAdnUTndInhWgWLLp+i5B42HkQbwyu9+1fVbp4X1g0TpGQxVrHFuHvSb1ybIaPTvi
         wd9ZdMn75y+4WrjPGvMgvdrZHCe+GAn0kTnMLu2kjRdtnGFMDTsEXlyJqBvb2DY2aQg2
         dAcR9qKmAezwPfnunqFQsxHC91/8WSs1YGexgcF7ZxoZ0VxCW4lHeeGeVHfmY6NSNBDi
         5Bfg==
X-Forwarded-Encrypted: i=1; AKwUvBwTNFsxUv0cBTKgxYBphAyHomGlky7jVaoLvLZLGQshbXeoKysJI6Jltc5Qg+JxbgXNaCWfsTQ7rJK9va4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYK41JRC8/28tIGrpJLQcjcmG2BLEQT3CdRpHhigJL/vZjY5c2
	e9WPX7Gl4M3UhFDKwqlzzv243GQ6gp8ixYPjL8+HzC0IHJY17TTj7RA3
X-Gm-Gg: AYBFou3yeShCiTAMqs2Lh9E7cKonQKYHKf5sjDC9ieWJsR3UIFgC1kTTaURXFiaFLuw
	AKX/D1MIRRe+o9MRMgxuDlP2ByWFEGvwZEqkSpLztHmmKjCi6wTr0vIBVQ1U5eve0za0ZipIdWW
	KmZdPO9/gV2t1V7J5B4oLFRf2jGpMJMjBxnWkSEOGFZggXo+ZF/hwria4NkBdqH4xyqrg8eEt3C
	+DCThK/kS/s+JuCuvPt/9tSxnG3Q6BxJTcQA8yUdYa9QPUX8OCcEnswG0yJoYJOZ4gcynxJkFHJ
	lafoLgzQ8ugu3g/C/I1o9tQym6hz6itn+n5/nN+UClVFZ8ues3WKC07fI6B340kSt2wJx57iv0V
	xB0TGPq02gsH+vFtd5aKjNm1pdjjHdeChMXQRAk08mRZcyPCO5EXnU3sNL9uVdIGua0VJxudTIC
	BacRxJ69c6wXgf5kD4DHPLLQ2d6zJCGxOHvVsmRml49atVy7CZQR+f/ln5VStkUdcM4BoQk0+Px
	hpb3SGZiOeVQg1xjyYC6XBuXZOkt5+4C0kdB/cV6MLXByFFaZ6K7bD0DBxEAJyztkMtGE4JTw95
	lFFZ6nbk+8RFlydWXJrC2O2RCMhD+mwyE58SPqos6FNJfBgovNxFdFNwoFflfBqAhg==
X-Received: by 2002:a05:600c:810c:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4a967e8d6e2mr145816455e9.28.1793300308984;
        Thu, 29 Oct 2026 11:58:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:eafc:6fb2:6c68:5ae0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm94291535e9.10.2026.10.29.11.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:58:28 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 29 Oct 2026 18:58:25 +0000
Subject: [PATCH v9 4/7] pwm: rzg2l-gpt: Add prescale_mult variable to
 struct rzg2l_gpt_info
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
Message-Id: <20261029-gpt_rzg3e-v9-4-f3a5520388d3@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793300303; l=4750;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=NpPvKrzan/qb6oitOeMNUNw9qpWtqwTnPp49VEqMmN8=;
 b=n6odhvn1R9QObGKqKJ/VHUiG6LXCq3AHEGXYkufRPSyMSuyPOIfW/HDM1SvpaI8fqpR9KQLPW
 dz9U43m1KI5DXC3rhrUEOg/+tshEMrXOM66j1Qt5dKeIrVmCC1RhcNJ
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3E GPT IP has prescale factor power of 2 where as that of RZ/G2L is 4.
Add prescale_mult variable to struct rzg2l_gpt_info for handling this
difference.

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
 * Dropped extra parameter rzg2l_gpt from rzg2l_gpt_calculate_prescale()
   in rzg2l_gpt_round_waveform_tohw().
 * Updated comment in rzg2l_gpt_calculate_period_or_duty().
v4->v5:
 * No change.
v3->v4:
 * Updated commit header and description
 * Renamed prescale_pow_of_two_mult_factor->prescale_mult
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 19476fe7f5a8..414aa5db4c4b 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -79,6 +79,7 @@
 
 struct rzg2l_gpt_info {
 	u32 gtcr_tpcs;
+	u8 prescale_mult;
 };
 
 struct rzg2l_gpt_chip {
@@ -221,24 +222,29 @@ static void rzg2l_gpt_disable(struct rzg2l_gpt_chip *rzg2l_gpt,
 static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 					      u32 val, u8 prescale)
 {
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	u64 tmp;
 
 	/*
-	 * The calculation doesn't overflow an u64 because prescale ≤ 5 and so
-	 * tmp = val << (2 * prescale) * NSEC_PER_MSEC
+	 * The calculation doesn't overflow a u64 because,
+	 * prescale ≤ 5 for info->prescale_mult = 2 and so
+	 * tmp = val << (info->prescale_mult * prescale) * NSEC_PER_MSEC
 	 *     < 2^32 * 2^10 * 10^6
 	 *     < 2^32 * 2^10 * 2^20
 	 *     = 2^62
 	 */
-	tmp = (u64)val << (2 * prescale);
+	tmp = (u64)val << (info->prescale_mult * prescale);
 	tmp *= NSEC_PER_MSEC;
 
 	return DIV64_U64_ROUND_UP(tmp, rzg2l_gpt->rate_khz);
 }
 
-static u32 rzg2l_gpt_calculate_pv_or_dc(u64 period_or_duty_cycle, u8 prescale)
+static u32 rzg2l_gpt_calculate_pv_or_dc(const struct rzg2l_gpt_info *info,
+					u64 period_or_duty_cycle, u8 prescale)
 {
-	return min_t(u64, DIV_ROUND_DOWN_ULL(period_or_duty_cycle, 1 << (2 * prescale)),
+	return min_t(u64,
+		     DIV_ROUND_DOWN_ULL(period_or_duty_cycle,
+					1 << (info->prescale_mult * prescale)),
 		     U32_MAX);
 }
 
@@ -248,6 +254,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 					 void *_wfhw)
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	struct rzg2l_gpt_waveform *wfhw = _wfhw;
 	bool is_small_second_period = false;
 	u8 ch = RZG2L_GET_CH(pwm->hwpwm);
@@ -286,7 +293,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 		wfhw->prescale = rzg2l_gpt_calculate_prescale(period_ticks);
 	}
 
-	wfhw->gtpr = rzg2l_gpt_calculate_pv_or_dc(period_ticks, wfhw->prescale);
+	wfhw->gtpr = rzg2l_gpt_calculate_pv_or_dc(info, period_ticks, wfhw->prescale);
 	if (is_small_second_period) {
 		wfhw->gtccr = 0;
 		return 1;
@@ -295,7 +302,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, rzg2l_gpt->rate_khz, NSEC_PER_MSEC);
 	if (duty_ticks > period_ticks)
 		duty_ticks = period_ticks;
-	wfhw->gtccr = rzg2l_gpt_calculate_pv_or_dc(duty_ticks, wfhw->prescale);
+	wfhw->gtccr = rzg2l_gpt_calculate_pv_or_dc(info, duty_ticks, wfhw->prescale);
 
 	return 0;
 }
@@ -341,9 +348,9 @@ static int rzg2l_gpt_read_waveform(struct pwm_chip *chip,
 	return 0;
 }
 
-static u64 rzg2l_gpt_calculate_cycles(u32 value, u8 prescale)
+static u64 rzg2l_gpt_calculate_cycles(u32 value, u8 mult, u8 prescale)
 {
-	return (u64)value << (2 * prescale);
+	return (u64)value << (mult * prescale);
 }
 
 static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
@@ -423,7 +430,9 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 	rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTBER(ch), 0);
 
 	/* Cache period and prescale used by the sibling IO */
-	rzg2l_gpt->period_ticks[ch] = rzg2l_gpt_calculate_cycles(wfhw->gtpr, wfhw->prescale);
+	rzg2l_gpt->period_ticks[ch] = rzg2l_gpt_calculate_cycles(wfhw->gtpr,
+								 info->prescale_mult,
+								 wfhw->prescale);
 	rzg2l_gpt->prescale[ch] = wfhw->prescale;
 
 	if (self_enabled)
@@ -512,6 +521,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 
 static const struct rzg2l_gpt_info rzg2l_data = {
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
+	.prescale_mult = 2,
 };
 
 static const struct of_device_id rzg2l_gpt_of_table[] = {

-- 
2.43.0

