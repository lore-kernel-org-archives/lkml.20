Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5FB502778
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584731; cv=none; b=sczeogk6fyAlktGig3fP5rQQNQptM45KvayyMXtNXNtlYXeRzODPQ9gMwiEnO6cOBh3ECpqjKVNcVdsYOHID2dSoR5g3yd/FPMGExV/4tSrUeppduIypNVqderd5pDCIYltTuXTLB0beEWIQoBHZuKxmLtj29Q1MHDr3D8hxXtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584731; c=relaxed/simple;
	bh=jUd/+/k4h1QZfn+wNfl2mCGSZV0u2nb6Q3ARq4TL40c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VTZZhw/BfPVeshyoqZC93h3U0AovccbKQmqPZ5h6jff1eiHjZO7lyDR+QhmkPhIg10qCSGLN4OYy4PrxMJ45yVxmi5QYE0COssPheyNY3lHRNuUDRJrufXKqcwnajCI/m0cJ2f+EW/hdRvDwPMoaV/EHhSXgSgR68blDINJ9dgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SKcZ+I+0; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SKcZ+I+0"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-98ff1011195so69913241.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791584729; x=1792189529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayrCXEongRg2jGcqgMG/03RMEMFpz4scTwkDmHSxrBc=;
        b=SKcZ+I+035VA1ZS7eSxc/8GnU6MpGh+/DS6Qkid5JZCY8e4e8pX2Yv5pPVXs2T86mC
         5FHOL1NdwxsSk+y+hiMZToFryTkwXoVClqZTJl6Ewv7eYZNtn5v4xZOdoScucq6h6Fif
         NRDjnA+7OvbT2z0z/MgUr/34vCAkKUETDjv1Ft0o0Qx76We4lsIFzymD22W4xYLgrmpw
         Wh3JPEmBu7LDfm15zGhI+VcsDeIcb6L0QYsmASNqtyxKIFj1v/B88o8xnKhv/0fgDCqo
         vcS+z7tyMOXhdjhToDQjGyI9nH9l/xF/xrZgFiPojd1/pnw9U3BdToVGYPbn7M9ZesMZ
         4OjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584729; x=1792189529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayrCXEongRg2jGcqgMG/03RMEMFpz4scTwkDmHSxrBc=;
        b=GHpOThOkV0g29GIajj/ov1DNwQI4ck1BCtoQhOqipBxlJFdZxn+77W1hcvb1oVkLso
         xmBf8kmwebJpc3vzlELBs8gttkVutDpTERwDOBZ7f7JSFAJP+R5rOOW4pwaD+5Oi5BsE
         PgpLYnP6XD5R52Ze3B91pTENAojqvVrUKx8pAHwAKcZn/q32JPQprc6CRAe0JpLSExwK
         Mg0xDOM/DMc0v+TxsAeXkJ+9WuAzRSE6+l5NnMRDjITHU2Uiu/0A0Evsob9YHJjfuuyx
         iz/l+VoKKSPxdWLg1z1wPVxVaDfcOeg1A+uLi6jL/biKxbYkcqiVDB73mxif5Fxn6sXG
         EM0w==
X-Forwarded-Encrypted: i=1; AKwUvBxOzMFo8+HvTHZ3AIAqVHrrCyPFeRoqXqJC35KiGzWsF364TKohftvtfZrMiR6whhL6HSS7lbzrVfC/Rkw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5hKd5XybrFMRDrTCQgiEeU7Ex/D7EvWXODeRzqR45ajl+ELJt
	HGbJf7poPFneJZF7+r3fsb6L6bxfW5i+ot6Ws1EqOmNmiZXNmw0jfWc9ghjLWMapkOI=
X-Gm-Gg: AYBFou08CLSSJjktodaMdfDBrChAmTtsSSZCPWn5S6TNMZzVodL8Oxr2haWGu4tpp3n
	zpQRIwEH0cklR+ShsyFgLqDwCiuXgLOmMX8SsPCi5cZUARO9L/PU+hnLcT81hu4Jcvf8YvWe3NO
	O3x/v7OgBQyOuL7WJdvlYDgbbKNEkIGlExPIVqMeukAZe2bmYnoQ9nTljEqtiTvS8dBAEwHBdgj
	nU1nxR59xO/dcSUJvHMmCPftcZzF2GolyuuZEY0Y0WmGDLhZo+LziChdOqJLaITDyxU3IgdMl9p
	w0AF4HX+KaxYMzmo7gkRM7hkARy4TiobBRgK8PT1A+Unfw2YIqGKn3G9NjnVT/7qKTFGvPhCFnn
	AHQIV/ijZIPPVrgATX6WLp3C2Lyz7xKQ+Xqgm8wj7JEEn1Y/6VE0G4/8M71KYL3trNINl9HaaU9
	h7o3T25qD3FZ/eahBV5gRCgNSCiqmKXmPzE4Fl/OrZ+JaZ70If4yWJXmXTuwU1wcehoVPyhHV6/
	kU=
X-Received: by 2002:a05:6102:390d:b0:7a7:198b:6747 with SMTP id ada2fe7eead31-7cb37359378mr1300373137.28.1791584729147;
        Fri, 09 Oct 2026 15:25:29 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:29bd:56f6:5ae7:35d2])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99007c130efsm2125418241.12.2026.10.09.15.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:25:28 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Fri, 09 Oct 2026 17:24:58 -0500
Subject: [PATCH v2 2/2] iio: adc: ti-ads112c14: fix settlingtime creep on
 write back
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-iio-adc-ti-ads112c14-fix-settlingtime-sign-v2-2-6b54a7378101@baylibre.com>
References: <20261009-iio-adc-ti-ads112c14-fix-settlingtime-sign-v2-0-6b54a7378101@baylibre.com>
In-Reply-To: <20261009-iio-adc-ti-ads112c14-fix-settlingtime-sign-v2-0-6b54a7378101@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "David Lechner (TI)" <dlechner@baylibre.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=jUd/+/k4h1QZfn+wNfl2mCGSZV0u2nb6Q3ARq4TL40c=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqyWnL0Zca4RdfhAKJatSffm80KF9sSsdXQZzS/
 cXNt6PRfy+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaslpywAKCRDCzCAB/wGP
 wGInCACKTmBGLApKO+42TwCsoJ0pjjKLnjr80UNuh1dXgxUVHbkptQMMvZZGsxHHL/F3cYRwyON
 6bvLR4qNe5omy9JIOEAPAexkOVxprs6bgiB/kbvsmc2UXwYqamHRYR4+lE58jDufykNJYB6CQEv
 aIwXFh6/T+t6nstjndoqBJ+UZTqE8AFY/dpnz8jFGyBHRoTEXctWt/EpDROvU2W3ay8g+4kP76g
 muRjW74aXMetRvuPv3F9HAkhyUg/2wISae6wiye/Pqw1oo6hQxEz364mhz9Yz0uS8a9dGS9j+4E
 GDwp5C5vYvsLdiF+VeNdzifc9Q3CVpMUWsHH7BQv7hmgyBp0
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Fix the settlingtime attribute so that writing back the value that was
read does not change the setting.

Reading the attribute rounds the total settling time down to the nearest
microsecond. Writing it subtracted the fixed latency (also rounded down
to the nearest microsecond) and then rounded the remaining delay up to
the next tmod period. These don't agree, so writing back the value just
read could select the next higher DELAY value, causing the settling time
to creep up on each write.

Instead, convert the requested total settling time to tmod periods
(rounding up) and compare that against the fixed latency plus delay in
tmod periods. This picks the smallest DELAY value that reads back as
greater than or equal to the requested value.

Fixes: 839cbb1e2331 ("iio: adc: ti-ads112c14: add settlingtime attribute")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260910-iio-adc-ti-ads112c14-filter-support-v3-9-e5a9b27ddb1a%40baylibre.com
Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads112c14.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
index d8fa8d413e87..c0374bd8d001 100644
--- a/drivers/iio/adc/ti-ads112c14.c
+++ b/drivers/iio/adc/ti-ads112c14.c
@@ -655,29 +655,22 @@ static int ads112c14_find_delay_for_settling_time_us(struct ads112c14_data *data
 						     struct ads112c14_channel_state *channel_state,
 						     u64 settling_time_us, u8 *delay)
 {
-	u64 delay_us, delay_tmod_needed;
-	u32 fixed_latency_us;
-	int ret, fmod_Hz;
+	int latency_tmod, fmod_Hz;
+	u64 total_tmod_needed;
 	u8 i;
 
-	ret = ads112c14_get_settling_time_us(data, channel_state, 0, &fixed_latency_us);
-	if (ret)
-		return ret;
-
-	if (settling_time_us <= fixed_latency_us) {
-		*delay = 0;
-		return 0;
-	}
-
 	fmod_Hz = ads112c14_get_fmod_Hz(data, channel_state);
 	if (fmod_Hz <= 0)
 		return -EINVAL;
 
-	delay_us = settling_time_us - fixed_latency_us;
-	delay_tmod_needed = DIV_ROUND_UP_ULL(delay_us * fmod_Hz, USEC_PER_SEC);
+	latency_tmod = ads112c14_get_latency_tmod(channel_state);
+	if (latency_tmod < 0)
+		return latency_tmod;
+
+	total_tmod_needed = DIV_ROUND_UP_ULL(settling_time_us * fmod_Hz, USEC_PER_SEC);
 
-	for (i = 1; i < ADS112C14_DELAY_MAX; i++) {
-		if (ads112c14_delay_to_tmod(i) >= delay_tmod_needed)
+	for (i = 0; i < ADS112C14_DELAY_MAX; i++) {
+		if (latency_tmod + ads112c14_delay_to_tmod(i) >= total_tmod_needed)
 			break;
 	}
 

-- 
2.53.0

