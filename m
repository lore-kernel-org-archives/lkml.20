Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895466;
	b=PixXDkSzkdnmsbJR7sLZgiTxIaImW/8Di1rY3Sk38d0QLbuZ8RrPoKTNSwfbY+OlEnxL
	 LkPGyidarhAh83sOk/c/+zueToq7gqFH0iOIqAB6xc3+x9giitTRshJOQWbiRhuOCFztQ
	 2KXAT5DSZnC6dEKg203gLbrrGBx+EkFJ6RVm2Qqn8+GG9vr3laYAE6rNnxM8IKub6Y7A6
	 noVibAaayU+V+zd8bWm6mefbRvzVQQlwAKjJOFNf53R4/ixjVca52EyCIxTYXu6L/73+J
	 I6tffhB4YGY9Z6EVXgGMyEfrDK69HZXnYc4/7LwMhTjD1pXszilHq/rp6Y6dPbu/SpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=60pAZiAwQCzHUcxyBUKUfUivWpho27k1oX14E4OKOD8=;
	b=wHMTKGPLJlfLV+5y6BEqq9SICqVW9RJgiNVREFVU8p6kYsiLswsmb381mj1K97EhJoNs
	 mWllvdmIk9Wf1GVWiAGVJG2w8HEZgxoLATd2QkTbS7WVo21hVa0K9NKw3rUcR6zCzwBEw
	 DwzIt8+bLJ/kuN5pEDWO6NvsAbpAzEd3v8QwCCXlkxXVDzF8G+hm+8LUxvnE85wgZgdhH
	 +30hSXrdaxV5KXBaBciVyikPTTdxelW8xaCTs1R5AKkPI9XTDk5r0CwAkPShMgQHeDmvM
	 SNUef/6G474J30Hu/WRZHuXiWoQGZfI/x8caOeXqf4yEthADt4rGYdupUaBKorAvFiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dYrR/Nni";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E62C606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E62C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dYrR/Nni
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1433163a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895466; x=1794500266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60pAZiAwQCzHUcxyBUKUfUivWpho27k1oX14E4OKOD8=;
        b=dYrR/NniIM9HtE+9ALPn337XnCJ9i+sSbPAbcgNznre6ZwbCoiDc0yePavAwudcfpl
         4bHc8Oj4SM+pXWlTZbWI2dYJW95nnShyxSFZGzssLyODC/Sd3tN2l1yZ/CztP+SMnaFl
         UHH65TGof98/fmcX0oJoczZm7wpQFCnJPOpvzC3miczuThs8sSxAU529wROLYzAeaqJD
         nWCDPYImH3Sirrgb4w1oaLZ4ElTgxzoVb5e9jVUCo6YRkP+nN3aejt0VcAtcD/+X3B4T
         CZCoRmQjF+mbisvE7FYPzN5vlZQ4LNyferUPfhNfw25rTLJdfpn7G0AlCFvW7JUEGRN7
         if1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895466; x=1794500266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=60pAZiAwQCzHUcxyBUKUfUivWpho27k1oX14E4OKOD8=;
        b=wJrUxPlTK5suXAoBg6Ml3lRnIxmAARL5K58OI3QdtlFbbzz8x9L4cW1ZXbZKO0nMQr
         WKpiYjL+tGFQpgalvbVWQN1DxmDmld2EtNxv9sD39Zin4gRvTJAnf0YlXqMaahaaNTeJ
         Pl0WwkgGsATDEu0dDteh/exuICO1Ty1KFQFXHvwKgheGlrdraMOv1XZoQrAr7NVqs85e
         0sIgN4Py1uq4SbjQuRYtI18Bex3KcJ5uhVmxiVjaNt3V4qkEuSc/87AkHahitvdA+XJv
         DoFYwEeYz68LTqvjRUrh06A5OXxX8zpQXEtcWDebeZ49UXQAcptS/Vaj2Uq6enkCqayZ
         wP2A==
X-Forwarded-Encrypted: i=1; AKwUvBzChqKKuOG7Qw10tzwDzPmgl9aDXEPn6hbOJNIz4TOttU6M3oHYX1v7g1zKZAkeOnGPmZgBoAeAHZK8CaM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ry1J3u+n/EQr/r5eVCXWKyu5o1VnlY3MPhtogIPe7yJo2yf79
	0hbCl925rF1zTKnhzy/4KXZd64b9ORiln6wAyIknKCF2sKiNVrC45mNz
X-Gm-Gg: AYBFou1BU4bDobnaLfIqcL+ff1n0NhKJSl5OXxfX24SmB/i96ti3i2j/4tRIhaAI1sp
	6EE5wWBoNAs86V4fw7e5xvGUoX2qYnTT+NnK7UKD6G1fEiLHTNGsGoTIZCdbPnpxx72x5cjkY5F
	IShHLzAh5JDFJQFqJOoTlQxDZwXOk4LcTSq8rhDkbfDUUShkvS6wNBXSU+3WhMeYbYeiRDK+7CY
	Py4zEy6YAN5uxtmiHVg1U/tBbiHBOIuOs5X+GxJzu7IuNfR7xYdlEXErdDojPq/mmSfJjQTvT9y
	sPkxSgNg/NhAsYXtfx5XnGmNLpNj0uKnyvQDfwkGLItSIM2FMI2SGFUSoYLxFTp/UKNtwcHEBrr
	1gMrfHtrvu6t6/gMUKjh+13HBp27jdy9t1YyxBPHmwlDmazydBxLcl5cIl1SubMjbSoargME9ul
	RCDCR7dzMmAWfAkfCq9RGD9f1MoU8ZTgktM4KW950CxX9Ih9kR2jJfZ2aMDM/pZWiW3b37qnszb
	G+KyumI6V06hgw3aeiifyd3j0Dy9TD+8aaSlKmiEE6M/HLrIMIsZtpwXZH7zEXfHoQ0Df7lzEam
	1nAzpZhh1uVLCeePYtvc85aj6LrzXdt8p67aA/mqYaWQjTQQCFT1QkGNVuonRUIYkz1AE5EVUy1
	Hka2AbM223lzo4/sEpL8/PRw=
X-Received: by 2002:a17:90b:17d1:b0:3b0:9941:8d41 with SMTP id 98e67ed59e1d1-3b09941917emr5299410a91.28.1793895465780;
        Thu, 05 Nov 2026 08:17:45 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:45 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 3/8] clocksource/drivers/timer-goldfish: Fix resource leaks in init
Date: Thu,  5 Nov 2026 16:16:57 +0000
Message-ID: <20261105161702.3515900-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
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

goldfish_timer_init() ignores the return value of
clocksource_register_hz() and fails to release allocated resources when
initialization fails.

Check the return value of clocksource_register_hz() and clean up
allocated resources on error.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index b1dc8b388470..8c312c3a64a6 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -131,7 +131,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	ret = request_resource(&iomem_resource, &timerdrv->res);
 	if (ret) {
 		pr_err("Cannot allocate '%s' resource\n", timerdrv->res.name);
-		return ret;
+		goto err_free;
 	}
 
 	timerdrv->cs = (struct clocksource){
@@ -143,17 +143,29 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.max_idle_ns	= LONG_MAX,
 	};
 
-	clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
+	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
+	if (ret) {
+		pr_err("Couldn't register goldfish-timer clocksource\n");
+		goto err_release_res;
+	}
 
 	ret = request_irq(irq, goldfish_timer_irq, IRQF_TIMER,
 			  "goldfish_timer", timerdrv);
 	if (ret) {
 		pr_err("Couldn't register goldfish-timer interrupt\n");
-		return ret;
+		goto err_unregister_cs;
 	}
 
 	clockevents_config_and_register(&timerdrv->ced, NSEC_PER_SEC,
 					1, 0xffffffff);
 
 	return 0;
+
+err_unregister_cs:
+	clocksource_unregister(&timerdrv->cs);
+err_release_res:
+	release_resource(&timerdrv->res);
+err_free:
+	kfree(timerdrv);
+	return ret;
 }
-- 
2.56.0.398.g882cbad275-goog

