Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895491;
	b=AvRXTkWeS+PN8wRGHTA1W7vIpHx9ba4CdIGabUR9IEI4e88YpFNedLOFNJvx91D5hTRJ
	 iKQW0BXcFGUq1OMSE359vYsQGnpMUYLaEhbkM4AgR0cKqtjZ8hXwI3UWcTTx3JgZk8a6K
	 lzUGsnb4pDI5n2qHLbx7IDTXzEQpRiQJMxM3R5OTgldwaiHdHdavKwje325j7XKivKvbz
	 64a+btkHUqZP4j/3HSXVBrbhND3IsxMjubF3x28SnwIURm1nTJ5Bj7gs9hrS+tQlWdrr8
	 xL6ozYrwCKB6uHvd/bUzOxk5hQ8/Ha87Y10Ji5alubyr4NRVQTjTN3s/xj6OQGQ/8lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p6xbLk8s6rCDjjBqfhBuH/lvaFd3o0UZuWtoGiq0X/8=;
	b=FolLoE9cfAO9xidb3yttqOSKy3xvyTKHJnnFjSiu19psDE9PDfM5RYarsWoxSHInC3CA
	 aMdV0cTcf8VUUfut0VgbQEhcDomxgJMPZ13eyl9lFUzwHOa5F/ApqRf8FZYjo9QxwiSRJ
	 fXCqpnKL/Sw4yP+uo6KYAhMzUSWcSyhoHZYOY+Jey/i4+NZ4feW15uVTq4B7a8611PedK
	 qXpdoVmx3io7OWbUcMFNMuWwucjaCQKAMv2SZ92bWfOr/P4JM+R6ltNGTZPJIXRF/CgP0
	 RDilQsBwe65iBXT7df2NLt1PZ4/CxezrSuH1RJQd8WNdhgfQkDIZZv/o7NRKzkfqt/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMK5Ms68;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE7A606D81F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE7A606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMK5Ms68
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso1087233a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895490; x=1794500290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6xbLk8s6rCDjjBqfhBuH/lvaFd3o0UZuWtoGiq0X/8=;
        b=hMK5Ms68B859MfZIrQ6WNWjNW10KBcK47iKeYZ11GWhxvxPZp2/1JfzltE6XofqDOW
         h0ykBuPPPN+6Ma7KEvioTBWxW391zxNfOqUrtR/nBXvvYu/sNjm5+G5ylB0DB0lPkUM7
         j2yluQkZcdyCM+q7AESxJdBkOJ5OJpJoNzzi8wkIKo3OBdUapI4VvL6j77UNrEwsu/0H
         mgeiVDJaDSLoE8vARMPO0SYWZs5LTB0tyArDr4vw6zW7ApPcfRDVufoY8PWHiGfzYCxf
         FH93rjHSIn9111o6MxMYwkLq1PPguyjilmRwY2Qb1o33VIYOlUvA463BcPEp8a++IoSN
         2fjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895490; x=1794500290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6xbLk8s6rCDjjBqfhBuH/lvaFd3o0UZuWtoGiq0X/8=;
        b=wGpQc0mfTIc28+3zAUjHmpovopUt/EFmVzzPbVD9MwM2flD8+CdrrCB/iclzQ132Tr
         QkTROCwbSa86vr5vqj+q6DTYPuEOZIdq5qHAkqZKcbobTWX1Pb8Ve7T0diZODBXn0InO
         pn1oq8U0CVlQE693j611QhB/BVvwF9+BsH2Tb3IpdbfTVsWahhuwC1diJbJUA/5hNlqS
         Qd3BDjdcem08PP71tMZdGQNT2inOlnoMHR2HeVZ5wsd1k//5xVjwfMA/sLROOSGJ/++D
         OvOUQIeyTcbF+ufVAQyM07p7CBchdSR7eZIyZIzzVVkBNHtJ+V1TFmBHcdNLhwAmCXjb
         87jg==
X-Forwarded-Encrypted: i=1; AKwUvBwLaQD+V2SNyp1O9lsWEZNMXdRjJhgt2dFLtsEREKwvPnTi4Z2JVmeUpGBbQt0AwwGaqEqTqSxoq9fTqSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q1jq7ijncI4UfWNeCIwq8SH11Sv59P9y2ho7ayAeDITsloV/P
	yZe0CW+ZI3KmyvKE+VFxvzMlbfajgop8ZSqH7jQk3LfkqHkdblna/26Y
X-Gm-Gg: AYBFou1p3VMGSZivcpfauvgP3Rfkgt2YCP69aybnjQS9+FEvHF+2MTrRxHUmK0S1hQo
	S9nD+CWeSs0EO/aa/ZX705t6AfZO8nTQo6s+a06rLVzbIscOLAr42J5uYy86o8vP3a6zBKnTPnJ
	S9nkyDbodMm2VhlvjiRD8NvIr93djtObxXjn5aadclqnYAtRyf3FcXzB45EX8/omXG4g6SduA4U
	s2BasJnT/a3/WiwXKmfOzpoyKseXMUpluA/Rju20Y4oHujSUUP1BrCWhfiehkEHshtQmH1KwjpC
	pzP7oIQm86pEDf3TfIGg6XTqAy9NgCcaDQob4JmHUhqTH9Pfp1oZcpjs54533bAKqeuXbDb7uHp
	g/WGUdhHVm2A1jllJfv48HKtFtogwI4Z7Lxa958wu0iDJvVDlYYqV0ogG5J5Gmeq/CfbB+xuKmr
	NRmfGvTW7Pi3NRBO/nq3ZcDWPhYghzAxG1Gc9mOsAC+kpiDRjgYvgC7crnBJ1UrgngTyfKw7LpM
	h2uhBN2UP38CTV6qH5jLPi6VvOGSKS+PYlFhrnpzWiygUjRV2CRgyM7Bc78oUWIdC/w3DgxnvIn
	cnnajRqxrdb9Yc043xyj7b1BlxZFLWGyw3+D+0p7VIGiIvTXtTc5Er+L0cYxdGh1f6qJGQOwKyz
	JQXu07B+2j42W67d/Ht8NzpE=
X-Received: by 2002:a17:90b:3b46:b0:3ad:d4aa:8559 with SMTP id 98e67ed59e1d1-3ae896f8266mr15023561a91.17.1793895490199;
        Thu, 05 Nov 2026 08:18:10 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:18:09 -0800 (PST)
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
Subject: [PATCH 7/8] clocksource/drivers/timer-goldfish: Add device tree probing support
Date: Thu,  5 Nov 2026 16:17:01 +0000
Message-ID: <20261105161702.3515900-8-visitorckw@gmail.com>
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

The driver currently only supports board-level initialization via
goldfish_timer_init() on m68k virt.

Register a platform driver matching "google,goldfish-rtc" so device
tree platforms can also probe the timer. Since DT platforms typically
expose a single goldfish-rtc device that cannot be bound by both
drivers at once, depend on M68K || !RTC_DRV_GOLDFISH in Kconfig to
avoid conflicting with rtc-goldfish.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/Kconfig          |  5 +-
 drivers/clocksource/timer-goldfish.c | 93 +++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 24 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index da83483296d5..3a94feb377a5 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -760,8 +760,9 @@ config MICROCHIP_PIT64B
 
 config GOLDFISH_TIMER
 	bool "Clocksource using goldfish-rtc"
-	depends on M68K || COMPILE_TEST
-	depends on RTC_DRV_GOLDFISH
+	depends on M68K || OF || COMPILE_TEST
+	depends on M68K || !RTC_DRV_GOLDFISH
+	depends on HAS_IOMEM
 	help
 	  Support for the timer/counter of goldfish-rtc
 
diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 208b80c46193..563390012b89 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -5,6 +5,8 @@
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/goldfish.h>
@@ -102,15 +104,11 @@ static irqreturn_t goldfish_timer_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-int __init goldfish_timer_init(int irq, void __iomem *base)
+static int goldfish_timer_common_init(struct goldfish_timer *timerdrv,
+				      int irq, void __iomem *base)
 {
-	struct goldfish_timer *timerdrv;
 	int ret;
 
-	timerdrv = kzalloc_obj(*timerdrv);
-	if (!timerdrv)
-		return -ENOMEM;
-
 	timerdrv->base = base;
 	raw_spin_lock_init(&timerdrv->lock);
 
@@ -123,18 +121,6 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.set_next_event		= goldfish_timer_next_event,
 	};
 
-	timerdrv->res = (struct resource){
-		.name  = "goldfish_timer",
-		.start = (unsigned long)base,
-		.end   = (unsigned long)base + 0xfff,
-	};
-
-	ret = request_resource(&iomem_resource, &timerdrv->res);
-	if (ret) {
-		pr_err("Cannot allocate '%s' resource\n", timerdrv->res.name);
-		goto err_free;
-	}
-
 	timerdrv->cs = (struct clocksource){
 		.name		= "goldfish_timer",
 		.rating		= 400,
@@ -146,26 +132,89 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
 	if (ret) {
 		pr_err("Couldn't register goldfish-timer clocksource\n");
-		goto err_release_res;
+		return ret;
 	}
 
 	ret = request_irq(irq, goldfish_timer_irq, IRQF_TIMER,
 			  "goldfish_timer", timerdrv);
 	if (ret) {
 		pr_err("Couldn't register goldfish-timer interrupt\n");
-		goto err_unregister_cs;
+		clocksource_unregister(&timerdrv->cs);
+		return ret;
 	}
 
 	clockevents_config_and_register(&timerdrv->ced, NSEC_PER_SEC,
 					1, 0xffffffff);
 
 	return 0;
+}
+
+int __init goldfish_timer_init(int irq, void __iomem *base)
+{
+	struct goldfish_timer *timerdrv;
+	int ret;
+
+	timerdrv = kzalloc_obj(*timerdrv);
+	if (!timerdrv)
+		return -ENOMEM;
+
+	timerdrv->res = (struct resource){
+		.name  = "goldfish_timer",
+		.start = (unsigned long)base,
+		.end   = (unsigned long)base + 0xfff,
+	};
+
+	ret = request_resource(&iomem_resource, &timerdrv->res);
+	if (ret) {
+		pr_err("Cannot allocate '%s' resource\n", timerdrv->res.name);
+		goto err_free;
+	}
+
+	ret = goldfish_timer_common_init(timerdrv, irq, base);
+	if (ret)
+		goto err_release_res;
+
+	return 0;
 
-err_unregister_cs:
-	clocksource_unregister(&timerdrv->cs);
 err_release_res:
 	release_resource(&timerdrv->res);
 err_free:
 	kfree(timerdrv);
 	return ret;
 }
+
+static int goldfish_timer_probe(struct platform_device *pdev)
+{
+	struct goldfish_timer *timerdrv;
+	void __iomem *base;
+	int irq;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	timerdrv = devm_kzalloc(&pdev->dev, sizeof(*timerdrv), GFP_KERNEL);
+	if (!timerdrv)
+		return -ENOMEM;
+
+	return goldfish_timer_common_init(timerdrv, irq, base);
+}
+
+static const struct of_device_id goldfish_timer_of_match[] = {
+	{ .compatible = "google,goldfish-rtc", },
+	{},
+};
+
+static struct platform_driver goldfish_timer_driver = {
+	.probe = goldfish_timer_probe,
+	.driver = {
+		.name = "goldfish_timer",
+		.of_match_table = goldfish_timer_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(goldfish_timer_driver);
-- 
2.56.0.398.g882cbad275-goog

