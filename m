Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032195;
	b=JfPvXwuKfLeKOhh5XojmyttwZCE3f+oWXIehWwi9d626Xt8AVWl+e0HaJFM/VypkuS2V
	 7SHl8jiPnXcvjCiwUHNDRPdm2+EJELY7d2oTBi4fmCHzNuDctBE411Huq8Q7z33MVD68E
	 X//CguyzbrPojK8o2kl+rq/P3rxH33ftn1pM+rLbE2Bfm88mnJI/X0Jju1XlopSQE5PTi
	 SU4JEL60ACsSZUOK5uiA480jg8zzNqXlGB2rBWDR+kGmGUHsmuSYbL8cFTguYpVmHloGR
	 vvkPtVTZwJCISOcglr497100wNB0ewtgzyixesVs3JqVcDuvP5V9W8hl3I4IsTx76Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=I9rh3Te2xYwf0xNAqLGtoJ0ZzJXpFdRlQePYZj4wULs=;
	b=PwNQfaYX+emfOrIgLLof1z3ISQ9JgTTHnM3oYoboahnSgkdKkavtBpcPLr+7ELRqp23s
	 Z6VZuZcgTiSnMmXogi0UWy+kmbdVGFQw5Q5JplNZoaTziW2NCinXOAdgHLNK0YURU7lxP
	 B9u/SByVTd/zH5MFrO8jrQr2Mm2Gq+vW1qXXd3oPDgWnUskraVzPKwl8gwCzAB5wcjzvJ
	 YM3hQX2gUHzToevcm2QcbYoHZuoiiNOOOGFoMQFg3jp2Y7MTqX0Ihd9HPzUFzEog44OGy
	 i70jn9MmGvHarYGeR+zXs834DeCPB3YE98mQ7VPJZaqolnorpw8VZQ8R57pIGTK5JIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eY8xR61K;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011EF60A381A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 011EF60A381A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eY8xR61K
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so15532635e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032193; x=1793636993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I9rh3Te2xYwf0xNAqLGtoJ0ZzJXpFdRlQePYZj4wULs=;
        b=eY8xR61KDfHeA+ze3MHE7QekDkIqvCuAV3DpRYNmrOzTT6Zs08+zxWUs265lqeoPdu
         x36P/BEKlumjAkYwtlbU95PniBd5f9pbQvKRZuE7Iva1KtF9zHdDQXHvb3W83uLllm1G
         SUA3SV8/jbjoMBcOjo8OLiqHOpWy4D2nPWrooEsvH6XyNlgLa2KFfrQTTxrWmMrxNTYJ
         OK6fni3f/dwaslWFTjav4fXhvVjMZ5fGTVadq46BtP1pi8bLXzmByqf9CljBsHpantHH
         8js83ZWMMyv94cozdeI/9GaKfJXe/KaGGGWDx9Lj0s8VGkTrqPmkWRi4TWWHXhPVhi7H
         aXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032193; x=1793636993;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9rh3Te2xYwf0xNAqLGtoJ0ZzJXpFdRlQePYZj4wULs=;
        b=hsuIAfrmehQ/BiNJlce3OlbwRp+THphwn1zTmCWuF16cFh6SgZMid03LAJCahx1igm
         5kJPhy1E6DZSt5AsE6kuu/p4HTqK/6VjnLtdK+jkItKSMNMJEQX2BwnJB6KUc3Xh3OwT
         lxI1F+uzUHxPm427E6EXkc7zjXLHDNXuQGtsx9rNVx+m7DHEUtx+4g4xt7CHYWALyhqC
         e4YFK/qhKsC9Gk2sLHuskO0xw4lzsR8l4O7y2PY/29L6G+zf7ordDeQq+ZmyMjBQab/j
         fHBSbCRvvttEQ9KHCy2OOVaSyg3yvGVixY4CGpOFB81TNwFDjaLW9Ge2j86yf7Dvbies
         fryA==
X-Forwarded-Encrypted: i=1; AKwUvBxveFo+O9FCDH6M6cnQ8WadoT62zkvhfH/n1SCDKNhBD9a8MLBAE+8rSE5sBz5X/zVR/eyWMgcC3USHr30=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFKruCvMWPBQ82YojyrFDaTasBZgHAz4T4HxK1NZjsiHB3nYRI
	awA8yEPi3F6ADvWiPrLBJoaOEtFaOzgoji0qGwFtozJZOtEu6IfU6nm8/NWSZ1FlzqE=
X-Gm-Gg: AYBFou3FuDBGmj29AbV59ghSceiO10ksRTteFonHLRawWaq7VwLu46WcnJLkgcwn/hd
	LVq96RnT+XGIRDlNYDPRCzxLb9khSrP0FyW7LPm37n0V0K1u2yMOubDEz5lPQHCGtbVfafDp8hP
	s6GckBggWKRr21lKsruerr2CM0A8TAHTIQiQlWX1Cy4Pz4dnCE+x1hnmZTFm9mvKagiGGuWk8qs
	drehy/mDZR9iBxgD133KnBWMABUu3qAEZQOrzgDQQUBEhZ8ky4t3XKHBv1/APoZtMaOjvgwYvbz
	Dep7Z2LB9euXQizTSeEHIt83QXcsSOK0Nno8eJEIEgtAotQ3oVNrn4MNjxKtcPb96FJax+okwNj
	DP5TO28wEZyLRSpykRsfpO9JbzudBZti4WPdmIqcx5gtZFgIx0REYm2rmd5akw++ESLITV7Tkb1
	Qq0vvvLPbTHiLFkG+ZYxCEalrbYZbUGNXTsN8qA4+CzG8T7KwhbkPrlV7Y4Keew2s6vh+wd33f0
	MoM+KCJnoNRwlHX3Z0SBrYOgUEHnqtsHqUY1IsEGDGR9OCMsUZk2zMmPpPnHg0F3k9xCCdU7WsC
	5+QAEPiNrV/stlDAfj6/YKHLQytUOgaLV5iC4HFr5IL6BEl6ytDqf0r4OhvsaiUm
X-Received: by 2002:a05:600c:37c4:b0:4a2:ebb:397b with SMTP id 5b1f17b1804b1-4a35ac7f0e8mr126746175e9.11.1793032193405;
        Mon, 26 Oct 2026 09:29:53 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a2d9280sm202733125e9.13.2026.10.26.09.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:52 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/22] gpio: Use named initializers for spi_device_id array
Date: Mon, 26 Oct 2026 17:28:26 +0100
Message-ID:  <3c503f198cba5db5992b7c0650cb39283f6ade6f.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=uNWJjvjByUSk/Alx6uwMJrOimvtVntzmd6YoLQUBMo4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33/BJ7vysswRUgQj4jFDGgUwv/6TJ2eFSz7ZA 24d/SxdtqqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/wQAKCRCPgPtYfRL+ TkB+CACQ9wyQjITvcsbe3/7Qm1bMtK8J/L+ndadXn4xssvYdKohEcktS2rj2JvqFv1SWQdzQ7SP /1U56RleGxawx7r6tNKk6h9QGbB9nLwi63YsvTwBuvRUdbqUMgqBG+TB9FCyYn7QfGU2ha/ZeAV ex3N0o51LRKimCKKcT8/q3C7L8MtfKUZgESQKyYZyvIhsoJK2OD/JAZ/uGEjgnbYGwy7/baTvtI J455enrf9NSEY6TsVxeKXNpGMkDmNmj1CJXityWSd97PwILSyTTXewx5GPXPjM5E5gohSMN2gpy Y3tTdPeTquVlYaGeBk26W5KL2mYJoDAtN2bNvGvO6tQmDdiO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
spi_device_id that replaces .driver_data by an anonymous union (though
none of these drivers uses .driver_data, so this patch isn't strictly
necessary for the plan, but still ok for consistency).

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max3191x.c | 12 ++++++------
 drivers/gpio/gpio-max7301.c  |  2 +-
 drivers/gpio/gpio-pisosr.c   |  2 +-
 drivers/gpio/gpio-xra1403.c  |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
index 6e6504ab740a..b06fecc98633 100644
--- a/drivers/gpio/gpio-max3191x.c
+++ b/drivers/gpio/gpio-max3191x.c
@@ -449,12 +449,12 @@ static const struct of_device_id max3191x_of_id[] = {
 MODULE_DEVICE_TABLE(of, max3191x_of_id);
 
 static const struct spi_device_id max3191x_spi_id[] = {
-	{ "max31910" },
-	{ "max31911" },
-	{ "max31912" },
-	{ "max31913" },
-	{ "max31953" },
-	{ "max31963" },
+	{ .name = "max31910" },
+	{ .name = "max31911" },
+	{ .name = "max31912" },
+	{ .name = "max31913" },
+	{ .name = "max31953" },
+	{ .name = "max31963" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max3191x_spi_id);
diff --git a/drivers/gpio/gpio-max7301.c b/drivers/gpio/gpio-max7301.c
index c8bf6a9c3de0..9db20c22ba9f 100644
--- a/drivers/gpio/gpio-max7301.c
+++ b/drivers/gpio/gpio-max7301.c
@@ -70,7 +70,7 @@ static void max7301_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id max7301_id[] = {
-	{ "max7301" },
+	{ .name = "max7301" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max7301_id);
diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index 2732ea8c16b7..75a8f3efaf94 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -150,7 +150,7 @@ static int pisosr_gpio_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id pisosr_gpio_id_table[] = {
-	{ "pisosr-gpio", },
+	{ .name = "pisosr-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, pisosr_gpio_id_table);
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index fe0fba6ea902..3713475bdb75 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -185,7 +185,7 @@ static int xra1403_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id xra1403_ids[] = {
-	{ "xra1403" },
+	{ .name = "xra1403" },
 	{},
 };
 MODULE_DEVICE_TABLE(spi, xra1403_ids);
-- 
2.56.0.rc1

