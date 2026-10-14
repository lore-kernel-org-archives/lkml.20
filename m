Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D632D41A55C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959586; cv=none; b=EQOTU1xjmEq9bHT912AxyTcKccea88Wr6oARqg8gF8WyRLibTZBGQ16xeOel5eRkDitYB/jReJoARTtgp33rFXsTAvKuY/G7KaTAwa/hc6Nrw6WKOnSTRoMn3HeO5OLnXUu85Wnk2n50CHRoHazszRtfKPuaPTpgk9WedDvePv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959586; c=relaxed/simple;
	bh=xxVW7N8Ua3Mc+UaVlqa96Hyoh5+xLewb+9Uj7IaPfzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnAo31bCQFIbivGR3xKL9EsIn0b9sU3UGCgkN1TsWq6zHWZwpn1QeovU0GgrvydMCjs+IEtevENkUMlC2+N3sLJ9OqbMdC38iyvvijz/EZceskQ5nX5t6OyQf62oOUxyMYqp0K4xof8w3jwzv7jnYOs6XsEDDlsqg07/AaSMaSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=artyRKt3; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="artyRKt3"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so29301a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959577; x=1792564377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWRCVZZ720VVLLC7FnNB4vKZ7B0W9tQEirvbm+Acavk=;
        b=artyRKt3QbLQaZwX5i9I3uoyQ3AAiPeFiOUEM4gzrl/rxPWdu6HIFpYCvM1/kbSlob
         w0KrSYEaM4BXkSgTXEcafAhwv0+GGG1YpkdpKdXcMLHEtscfR0wYzDrV2rptBnyY9Vr6
         Gk1+WQZBRHvXti4j/E7gpp56zYBWCNl/5C8xjl6PxGTscCGm6nstfBwQKtp9jlfF3Pzv
         xvDcR0SEuNBvpAHDu1/EeFYzrnR78ajjJMDi0rV0+Ij/M8KYzyTYUv/xZO4GPbVcCo/+
         N2Y0eMQUoo2RqcmaOHx1bjHst9Ad0aV3cWorhXJfiDaZ9WK1VCr3b/NIhOmheDLKMd0e
         lo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959577; x=1792564377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LWRCVZZ720VVLLC7FnNB4vKZ7B0W9tQEirvbm+Acavk=;
        b=zX8nppUPdBgoiZMh8Rm/XrTUyJMp/KAPARccZxxC3NamjOpgmpcyh1Qu7vPVYlWQFA
         v2zKhISprfPlRVQSUb8Dz5Yr78K2pylyhfl9GpCeHhMRBSxvWb6hAsXUWmd5Ieh535so
         VvxugQHWOdL0Fy+AHuIuMOBDfBDWGBlK6rHn/wWhNstc2E3dy2hVZDecq0nZf6t8wo2A
         FUAMyas/XtPrIjrSf1QDlUFcU0nUZTWJYbbrv1Q3igRlmtGH6u88EKNE/lxYWIlNUC0f
         //sh2olUQxN9xLT4ehsZ5LTb5r7pJjYRdDJ3T3ofl81T5YTmxs+IHppO/eLL+l34rsaf
         jbXg==
X-Forwarded-Encrypted: i=1; AKwUvBwYmyiTIKYavFwiY4MX6g327A9WxGkgc5SoIZ0m32DOMomCntBrDmeswUGaimGGwxDTzAnYFJIEqrpSiGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe2wMJ5C+5PCy1k8wK9c2QLWfP02drFdndolYxP7ZHa0i6Bf+6
	WOuaXP7/0fc+lxHmSuQV87qHMr4AwJyI5d5LAS+uz1k9dm3hP1frw/XY
X-Gm-Gg: AYBFou1L3gSUKEvTSS5fX25AO9dkNOfCHBp/+MoslQTRBEwmExf+RgVbEsasnjTh5rN
	g0hjfJpiR5RAHP5cyw9rBn7RXzQRfFoGxDNwoD7pkR6tDP//Xr7tB4EYVRgGYW4lXGHpmbhVFmw
	GN52rGN+kVBj+FkbJS7vaMVppcGd+CDWjYfEw15cNqp4658fcEh4AhgHrKsUT5FAsPQtID+gJuB
	V6YMPq6QMZ/1a3TS8j8WUgHLJGVuDQ3dwDeeQAxMYvJ7uiNGH/cdc27RjoyB3VzBux9mX0isFh9
	952YTECp8GIyNEE1kvI6wNDmDNcIVygp4s/AG+kvo8i6C5OBP7BMhuF6jputoln+Qi/f7cXJoPn
	+1mmJIJ0C3yKb2Bt6zaYNxAB1AOT4E6Ppl+uO7U4izQOXAnPn1KXOvYbrx0vQLZQiirkXKKLuyr
	YHUU0QvZH5t+8DinOJ3QMeJllzuz/hd5xsg/8lkf0K1NHBiPHa3vDxfmLHJhz7LvJLjhFw5M+j1
	V7JAsFcgfq4R5INpAnNv9P9uHlNeOJ1u/obKBx88ozn+sY35Vv2VdtG7PgOaKksdxdN0xAk9Ug=
X-Received: by 2002:a17:90b:2681:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3ab3a9127f1mr11592708a91.20.1791959576587;
        Tue, 13 Oct 2026 23:32:56 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:32:56 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] ASoC: codecs: wm8991: Fix definition of LOMIX AINLMUX Bypass Volume control
Date: Wed, 14 Oct 2026 15:32:31 +0900
Message-ID: <c6e230b0e7d7e3db2136cc751e0b563030dbc16d.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LOMIX AINLMUX bypass volume (LLBLOVOL) is at bits 2:0 of Output
Mixer5, not at bits 5:3, which hold the AINRMUX bypass volume
(LRBLOVOL).

Fixes: 203db220718c ("ASoC: WM8991: Add initial WM8991 driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8991.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index 157b48f02451..471310257123 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -184,7 +184,7 @@ static const struct snd_kcontrol_new wm8991_snd_controls[] = {
 	SOC_SINGLE_TLV("LOMIX AINRMUX Bypass Volume", WM8991_OUTPUT_MIXER5,
 		WM8991_LRBLOVOL_SHIFT, WM8991_LRBLOVOL_MASK, 1, out_mix_tlv),
 	SOC_SINGLE_TLV("LOMIX AINLMUX Bypass Volume", WM8991_OUTPUT_MIXER5,
-		WM8991_LRBLOVOL_SHIFT, WM8991_LRBLOVOL_MASK, 1, out_mix_tlv),
+		WM8991_LLBLOVOL_SHIFT, WM8991_LLBLOVOL_MASK, 1, out_mix_tlv),
 
 	/* ROMIX */
 	SOC_SINGLE_TLV("ROMIX RIN3 Bypass Volume", WM8991_OUTPUT_MIXER4,
-- 
2.43.0

