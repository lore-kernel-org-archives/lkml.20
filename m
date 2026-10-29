Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300308;
	b=OcwEyyMGx5hkgIfUYLRLwwHBQBJ6EkuXOShdOyjadi1nfD9s44EMf9Dogl2TDnhompNN
	 i4LsT8+Q0d3WdPD5g+E7YlPXWpdA3bApCU/DEbdOYXLKYpVRu+J4HMOC+eL5+UC1CWd22
	 YuyAyvI+nUAJnJ0XQMSHHly2FueOgQ/rzf39pZRSJiU4ODPrs/Klkxado+Njk5j7AD39/
	 DEyoCtzrIpZkvcuFGmhc6jRO6DMCbmOAtJ3YtsK6y4pmk/nVd1lOal8nsWXLYhpf66K2n
	 Vmubf4eywFyeLwy4TqFU6cR/HnQ2Bltiu9d3hxLzLNs6Lo0rV2jluYnFoqmgzVkBNuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ttAFEn+rtoPJmo/PrIZYDo9pnhtVsoutuS9qQ/v2fuI=;
	b=bc3RdCyyRK22SZXPOJIRBGbEnvSdxrUi0h8Io89VBqt6g0pGxDtBuXg1aNVIOg5XHEc+
	 Hjbb1508pAmgEJQB7HkmL0+WPJUeyccjSk8ZsQzvzeWMzDdwA9AuV8FpEpSzlU/VcC6Ft
	 IrHyOONIOWsJMojnYDqhXZywjeE3Y1fdRNEezvnlO+C0U8Mjzrvi99nzFYHzfqsVJ7g0N
	 XYQW/2phwNHdVc9tarXW15GNtYy21Y4eh4JdAtEA6aiulUKYdkZbsxPxIszK66smpm9Ol
	 trXqYs3YzBQvt0cFt0SwhDwtESpIlJ5ejKfyM7oIZR5V+dABWuXLIcPV4FHe2RNH2Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TV/vTGGO";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972B6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 972B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TV/vTGGO
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214af2076so21164295e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300306; x=1793905106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttAFEn+rtoPJmo/PrIZYDo9pnhtVsoutuS9qQ/v2fuI=;
        b=TV/vTGGOstd22JNi+XZy5ZyO/VglSYY1PcHwLCZU7JXszjXWAMmrGN1AU7U/g174G1
         ZoTocD4mLiM/kAwdDedfLXCggHPkqJlgrcz1L6SBKfzN7OlndquSs4i0MdiUVtH0HiYB
         cpL8n0h9qYX6JfY7E97Rkea0NKN73L3lhUL1SeX28UQ8FZDX4G9Ucawjc5v+21zdh2qW
         4Y67DSPr2e/4PjV8KwtUVooXpW9hWNCtT42Zb3i3NFUh9yUfHGt+a9dISyJS1BeW1caq
         3vJYxUOC0hNkTwyXGziakzbLOhJbMS58s0zUrz2FtqjzobxIdpKEzcyraYVADp+af41g
         L4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300306; x=1793905106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ttAFEn+rtoPJmo/PrIZYDo9pnhtVsoutuS9qQ/v2fuI=;
        b=lcZbJUbu64hKVTaeUooK72PZO53QAiqli5BMFP4dXTJxUaD3zo9x+ebwAMNFIotvrC
         4w95f6ZYh/D5HstPbXWh6VMX1A1ehxrt5DdWNmVURm3vntYKQTAjgGncAo6Dms3+9Kav
         lSlYJep6nkwlMXzMpQHTvvI4iQvJhTQMgYI4ic/vNRkILaffsyUoxwxbRFzUovcsNQZz
         O2rFKN2tS6HKipcueOS4NMwdkHOaqYqHjuPGO1wsbohynKOhF45hDfi9gQjLaFLAETLO
         4C7fYNMeOcI9Kp8CSZ8Er7P/iVV3RjvKY+I2Lka1w+6rxTq2kMTiFYFKNBeEqtbHOLtb
         F+2w==
X-Forwarded-Encrypted: i=1; AKwUvBwMDdBtThyHcaf/gc35EpbZYYU/pBYBNcVcW7lzIs/QQPnvcSwOVjuVnCZ5rxoE36KzoJpWbTxhC/T4ZPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwBgel30sJSLSS2waXibCNtjIT2vcI82q3h+XGff8sk59LhTyM
	PuxXcV3ImtHBydjHs+X8/U3HtzCi0LHypOHEoDFOW3siANjlghb+jm2X
X-Gm-Gg: AYBFou05G6HGFmzM3AbrkZ7WnzZ2Vjs3sVgQZvDnngx1+pyzpJl1CK2AUpd3ewS8gDA
	EDptHpYxxL+Ody3pmAvYKXL2tj0ZvdHrUu1YlsLdh6x73VMUFL4fnJVQRYSaNsR9MXeYwVzg5fN
	my6xjggZ581YHE/197EKWtQ5/8r9JIMoJOJ8FVX8GAagrbcjD1tVpnM4wAFfCFTNHNL4thqUM5s
	Q7zA5XBHDws5jhSZ3gvFuwKgdHpjdBKEWM5j3qfaHeVVnUY4grznflxTqQLEzSiq3N54XzEQRsq
	au3Sj6RAJYUKP3SCnBO0NXqrZtmy3iu6WpikvZ1TihZ/NLD8DS0duR8yH7SACVfHnxWDcQr8VYu
	YM06SsePLq2NejR66PIs82VZuwC9zhX5aQlaxNsBc29CafzCo+lr+ffgaa0JcM3VsnHoj93j+/D
	8iP+7lqRcG6msv7hSKprFPCrKXdvryQUoPKlp48WPvzWQWssr0mMTMvLO3JAYbtVrS7X0Q/pUky
	IuklMASthOlfJ0/VW54FGxxOZ7Fy7VBWX354HnKEqezB8U73KIReCzBVTXpWYlGRb2UisBFqqFw
	hK86ywo2ttrAeSYJNKDXljW/AV2qfd4LZ4r7S8eMS7gSFkDY0JG4/QoG5Ch9MndvXA==
X-Received: by 2002:a05:600c:a117:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4a9672f93d3mr115987285e9.32.1793300305935;
        Thu, 29 Oct 2026 11:58:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:eafc:6fb2:6c68:5ae0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm94291535e9.10.2026.10.29.11.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:58:25 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 29 Oct 2026 18:58:22 +0000
Subject: [PATCH v9 1/7] pwm: rzg2l-gpt: Update macro used for period/duty
 cycle conversion
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
Message-Id: <20261029-gpt_rzg3e-v9-1-f3a5520388d3@bp.renesas.com>
References: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
In-Reply-To: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793300303; l=2552;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=HAxHMX8kKpEO0nGsxRfolxnfmZwWa8sxppL9xeoqPRU=;
 b=ztJxoP306mi752bvcCsH/DuoHpOMDk0/8Fnbefo5G3q5ChO0cHBc3Sm4YBcxS5zoWweibbXrS
 LU2e9kCH5mADM0XAKB+JpaJJEIK3wdzee3VVJGbhfGUmY+xYmyxX5jA
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

The driver converts state->period and state->duty_cycle (both in
nanoseconds) into timer ticks by multiplying with rate_khz and
dividing by USEC_PER_SEC. Since rate_khz is expressed in kHz
(cycles per millisecond), the correct divisor is NSEC_PER_MSEC,
not USEC_PER_SEC. Both constants evaluate to 1000000, so this is
a readability/correctness fix with no functional change, and it
keeps the calculation's units self-consistent with the comment
describing the overflow bound.

Update rzg2l_gpt_calculate_period_or_duty() and rzg2l_gpt_config()
accordingly.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * Updated commit header
 * Dropped fixes tag as there is no functional change.
v7->v8:
 * No change.
v7:
 * New patch.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 1569f3ba8c53..108fa99f832d 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -208,13 +208,13 @@ static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 
 	/*
 	 * The calculation doesn't overflow an u64 because prescale ≤ 5 and so
-	 * tmp = val << (2 * prescale) * USEC_PER_SEC
+	 * tmp = val << (2 * prescale) * NSEC_PER_MSEC
 	 *     < 2^32 * 2^10 * 10^6
 	 *     < 2^32 * 2^10 * 2^20
 	 *     = 2^62
 	 */
 	tmp = (u64)val << (2 * prescale);
-	tmp *= USEC_PER_SEC;
+	tmp *= NSEC_PER_MSEC;
 
 	return DIV64_U64_ROUND_UP(tmp, rzg2l_gpt->rate_khz);
 }
@@ -266,7 +266,7 @@ static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	u8 prescale;
 
 	/* Limit period/duty cycle to max value supported by the HW */
-	period_ticks = mul_u64_u64_div_u64(state->period, rzg2l_gpt->rate_khz, USEC_PER_SEC);
+	period_ticks = mul_u64_u64_div_u64(state->period, rzg2l_gpt->rate_khz, NSEC_PER_MSEC);
 	if (period_ticks > RZG2L_MAX_TICKS)
 		period_ticks = RZG2L_MAX_TICKS;
 	/*
@@ -288,7 +288,7 @@ static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	prescale = rzg2l_gpt_calculate_prescale(period_ticks);
 	pv = rzg2l_gpt_calculate_pv_or_dc(period_ticks, prescale);
 
-	duty_ticks = mul_u64_u64_div_u64(state->duty_cycle, rzg2l_gpt->rate_khz, USEC_PER_SEC);
+	duty_ticks = mul_u64_u64_div_u64(state->duty_cycle, rzg2l_gpt->rate_khz, NSEC_PER_MSEC);
 	if (duty_ticks > period_ticks)
 		duty_ticks = period_ticks;
 	dc = rzg2l_gpt_calculate_pv_or_dc(duty_ticks, prescale);

-- 
2.43.0

