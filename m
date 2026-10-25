Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792944721;
	b=Vi0UanBcxrPECTiVBRfG2C26On0z51lgkVZoAoVWxNSrPwe2cU0nVtPhoZHHLNdwgNiE
	 FIJU3uEriGjWamDWJUsAywCeHCAYK9MWpEPFoWPkA1SoJVG2ZbhhK/qk6lNdkR3FPMwIm
	 HSEV0T65N3EUJMFF9/WXqOVyeGzaVg1mXEsimYlEoU+VR8/A3pq07SyI71DdaNlax6wri
	 wSEf9ygZ2z0oTFyTfRz5EMHED7e4VTFuuAcowj1iJEiqaPZxxdgSzN0GiCGyaHG2WixDM
	 YqHm1r/NYOcdr8yFyvwkNervkMTMQTT6xDD+Gjhhw8gGVb3JB3OZgobi28Z7m2rsfnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792944721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rxJIZi5PWXRxChbJYcfw6NCe9gvx2dJ63g5LLmwA/KM=;
	b=jTDGj6In6FlnNNyfluiEfV7+LUmFO80L7aEtaEzdunos4Xl2lPWolPzJeMS+6m0rweQT
	 q2JXu05/0cNHoB9up19QNyqKxgQs0iRx1s5uU4QQHVzCtGrgh8GCNUUAY0dLhr6L/iijJ
	 KDPLcmGEhG+9Ab5v28uc/e/Z7BqUhr14DMcFa3RYgmi7RdB7AfYt9dgez+A+GYHd1tnzE
	 GIZxlOJJFWU6YhHiwnRrFwX+Tj7ZnBUFSIdHKFmW6R+VcznSy2Kckgr64WXurcoEf1Wp1
	 8vM7YG5C9IWjfY5ziab0lMjKvBxE01WQOCghPKXF0Z7WXl3GlvgDw/uB+Wr5Z6cn3Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EWgR4x+x;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD18606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD18606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EWgR4x+x
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso724251b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792944720; x=1793549520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxJIZi5PWXRxChbJYcfw6NCe9gvx2dJ63g5LLmwA/KM=;
        b=EWgR4x+x7nvd7VMDWpjTIUb+mXEffwOo0lgMC1PMyE7ZYGwlLbREoDNSkO2HCyZuBC
         HKWmyFR+9Ly0Y3mOz5RsgyWDCVATVA+7c2XsV88yG+HdAYFnhQ6ksPgrfmVXCqsR9V85
         4ESsDrLrLmkYqZ2sXPoc1m54aA2JmnIil11kt96I5aJ2Goa1aceMB2NXcHUGJaLRmeml
         iIIjYLxEu9Ypzti6mWnS2WTdrDadVZyA6DqMFImZUv6vAHGfXKL98EZrw2vKz4nAIRn+
         TD4iJeGkOgYiOYBnBnQyctyND9zLfN80woH93WeXLlmmMvzeU7g+vutilAhuQHt2Ev+D
         fsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792944720; x=1793549520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxJIZi5PWXRxChbJYcfw6NCe9gvx2dJ63g5LLmwA/KM=;
        b=hG8wSgZnHh5egu3iAlbzlSe5quSwVEZy0ekK2uc8TrU9cYNNmEGHrij/qVc2uRNxJ1
         TsGk5M9Wr9s0UvppBqIZaq0l57sQJnjFmOPEZAvDAPEf3YJ8ix2yESdw+dHnYpLWAxmq
         DhwoFOBNWGbuimbKHdsjZRUSDq/WS7rPrsMGZSRS/Gs4pvP1BBdqloWF5A/jft8xJvh+
         9w/9Zmak32HUsfjiwEZn/e2DeFsqsCPLfXKFUqgOd5t3Qox5j6wswZhR8mkX1aXQaTIk
         dV62sFzXlXmSuVM1SamoRF3+FUSnUnHBJjmmOXH+TSlb0/tmNSFpml7S+O58zREGye9z
         9V/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwDOeLpD2BZWs1Vro0sNBU1Us7b6hS5lgJTKexrEIlJY8g1ppsboF5xZk6J83tTX6+HaKEqjN/aQgVqhI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUfpUkJy85z4Cot9aPVcMW9O3202rqX+zMUotD0LctChtIYZTC
	b2QSfeM1BPtqK3hcIOYeQZ5Hz27hWSpneHPsrNwYlS+tisDa6hfJetXRRmRZyg==
X-Gm-Gg: AYBFou1RiabQ47RvGdNLBSDX8iIBAxnCnze5imTpARO/mkZRPlZO7pSgYQit9ao/1Da
	ur4KW3mnQ5Lk7tJtonNVhfVth7Bvrt1IQHQFMRzd+HwtVvtSgA+ciy5uvayTjZ8P/SyuFlF1H6i
	C51hBAa+mWY8Sp0WC8HjQ1D54DYb/NrdLFy2h4ugB2dFqyBvy/7KXEDJ6yVgdrBoicGwk8ZlwmN
	M7fU8t+ZM1dvzZioZVQSb32ycw4m9LhQfBGW5FsJCXp7u+Oe+y8jklEW73vk7EfMOTcb2YSl3IU
	0aZ1gOcuDYyVhfa0G+Hm/6dh0C0VVt9RxUlx2p44iak1bEQ60Oh3+Kz8hgwB7bx487qe68PmfO0
	zliSvQTvXqIettSocyWFNqD6HhzQMl1yvlbEr7oOhDV9MEtnBMA7R5ScQypiDaBqhCt5DAl6owW
	1gU6rHG//0s/0u0/Abl3fM8W+ft+LPBnu6ZsrgMuLpG8OlUqsWXHU1f3f32FmdNeGhfXeo2B9yv
	e5cCiWl52QyeHNnYTNSANcH/hqCai3hh6EpIxE7nd9NgnipOoR1O7eC00C7lSj6DwwoE8Kt+aXC
	739DtPT4HPDWs5hYL0p3Z6YOMqtcg/nN
X-Received: by 2002:a05:6a00:92a3:b0:8a0:70ff:ab27 with SMTP id d2e1a72fcca58-8a3681f00d1mr3448798b3a.28.1792944720395;
        Sun, 25 Oct 2026 09:12:00 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8a368d85e51sm718049b3a.6.2026.10.25.09.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:11:59 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH wireless] wifi: rt2x00: retry RF3053 VCO calibration with higher bias
Date: Mon, 26 Oct 2026 00:11:40 +0800
Message-ID: <20261025161140.66990-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
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

VCO calibration with the default RF3053 VCO IC can cause
RFCSR 4, the result register to saturate at 0x7f on 2.4 GHz,
leaving lower channels unusable.

When calibration fails, retry the calibration with a higher VCO_IC
for RT3593. This should allow existing devices to work as before,
while allowing devices with the VCO calibration failure to work
successfully.

Hardware: Netgear WNDA4100 (USB 0846:9013, RT3593 rev 0402, RF3053)

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../net/wireless/ralink/rt2x00/rt2800lib.c    | 66 ++++++++++++-------
 1 file changed, 44 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
index 2e2e382b62475..68755e388fd59 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
@@ -2794,6 +2794,44 @@ static void rt2800_config_channel_rf3052(struct rt2x00_dev *rt2x00dev,
 	rt2800_rfcsr_write(rt2x00dev, 7, rfcsr);
 }
 
+static void rt2800_set_vco_ic_rf3053(struct rt2x00_dev *rt2x00dev,
+				     struct rf_channel *rf,
+				     unsigned int attempt)
+{
+	u8 rfcsr;
+
+	rfcsr = rt2800_rfcsr_read(rt2x00dev, 6);
+	if (rf->channel >= 1 && rf->channel <= 14)
+		rt2x00_set_field8(&rfcsr, RFCSR6_VCO_IC, 1 + attempt);
+	else if (rf->channel >= 36 && rf->channel <= 64)
+		rt2x00_set_field8(&rfcsr, RFCSR6_VCO_IC, 2);
+	else if (rf->channel >= 100 && rf->channel <= 128)
+		rt2x00_set_field8(&rfcsr, RFCSR6_VCO_IC, 2);
+	else
+		rt2x00_set_field8(&rfcsr, RFCSR6_VCO_IC, 1);
+	rt2800_rfcsr_write(rt2x00dev, 6, rfcsr);
+}
+
+static void rt2800_vco_calibrate_rf3053(struct rt2x00_dev *rt2x00dev,
+					struct rf_channel *rf)
+{
+	u8 rfcsr;
+
+	/* Initiate VCO calibration */
+	rfcsr = rt2800_rfcsr_read(rt2x00dev, 3);
+	if (rf->channel <= 14) {
+		rt2x00_set_field8(&rfcsr, RFCSR3_VCOCAL_EN, 1);
+	} else {
+		rt2x00_set_field8(&rfcsr, RFCSR3_BIT1, 1);
+		rt2x00_set_field8(&rfcsr, RFCSR3_BIT2, 1);
+		rt2x00_set_field8(&rfcsr, RFCSR3_BIT3, 1);
+		rt2x00_set_field8(&rfcsr, RFCSR3_BIT4, 1);
+		rt2x00_set_field8(&rfcsr, RFCSR3_BIT5, 1);
+		rt2x00_set_field8(&rfcsr, RFCSR3_VCOCAL_EN, 1);
+	}
+	rt2800_rfcsr_write(rt2x00dev, 3, rfcsr);
+}
+
 static void rt2800_config_channel_rf3053(struct rt2x00_dev *rt2x00dev,
 					 struct ieee80211_conf *conf,
 					 struct rf_channel *rf,
@@ -2977,16 +3015,7 @@ static void rt2800_config_channel_rf3053(struct rt2x00_dev *rt2x00dev,
 		rfcsr = 0x12;
 	rt2800_rfcsr_write(rt2x00dev, 12, rfcsr);
 
-	rfcsr = rt2800_rfcsr_read(rt2x00dev, 6);
-	if (rf->channel >= 1 && rf->channel <= 14)
-		rt2x00_set_field8(&rfcsr, RFCSR6_VCO_IC, 1);
-	else if (rf->channel >= 36 && rf->channel <= 64)
-		rt2x00_set_field8(&rfcsr, RFCSR6_VCO_IC, 2);
-	else if (rf->channel >= 100 && rf->channel <= 128)
-		rt2x00_set_field8(&rfcsr, RFCSR6_VCO_IC, 2);
-	else
-		rt2x00_set_field8(&rfcsr, RFCSR6_VCO_IC, 1);
-	rt2800_rfcsr_write(rt2x00dev, 6, rfcsr);
+	rt2800_set_vco_ic_rf3053(rt2x00dev, rf, 0);
 
 	rfcsr = rt2800_rfcsr_read(rt2x00dev, 30);
 	rt2x00_set_field8(&rfcsr, RFCSR30_RX_VCM, 2);
@@ -3046,19 +3075,12 @@ static void rt2800_config_channel_rf3053(struct rt2x00_dev *rt2x00dev,
 		rt2800_rfcsr_write(rt2x00dev, 52, 0x05);
 	}
 
-	/* Initiate VCO calibration */
-	rfcsr = rt2800_rfcsr_read(rt2x00dev, 3);
-	if (rf->channel <= 14) {
-		rt2x00_set_field8(&rfcsr, RFCSR3_VCOCAL_EN, 1);
-	} else {
-		rt2x00_set_field8(&rfcsr, RFCSR3_BIT1, 1);
-		rt2x00_set_field8(&rfcsr, RFCSR3_BIT2, 1);
-		rt2x00_set_field8(&rfcsr, RFCSR3_BIT3, 1);
-		rt2x00_set_field8(&rfcsr, RFCSR3_BIT4, 1);
-		rt2x00_set_field8(&rfcsr, RFCSR3_BIT5, 1);
-		rt2x00_set_field8(&rfcsr, RFCSR3_VCOCAL_EN, 1);
+	rt2800_vco_calibrate_rf3053(rt2x00dev, rf);
+	usleep_range(1000, 2000);
+	if (rt2800_rfcsr_read(rt2x00dev, 4) == 0x7f) {
+		rt2800_set_vco_ic_rf3053(rt2x00dev, rf, 1);
+		rt2800_vco_calibrate_rf3053(rt2x00dev, rf);
 	}
-	rt2800_rfcsr_write(rt2x00dev, 3, rfcsr);
 
 	if (rf->channel >= 1 && rf->channel <= 14) {
 		rfcsr = 0x23;

base-commit: 9d8ec0b5b5295bd23d979d1b2b905de25c36fff2
-- 
2.55.0

