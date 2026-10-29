Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270193;
	b=jFw8JP/xkcV0NWBmTZ8nYyyHTlleEvXYupXKcm1YRkKaIrLI2tExyYOzRozhfHJVZXeY
	 QYHM1SZ6zQ1pImWDAgDAA6aShNXkZKE4qxGSXM1qviZR18l35yRbDDcJS16LRa+zB2ccF
	 BoaImTJwHb9J3lg4qE1+Lsao6bCrCRLwe5jg/iySQ8ji5AYSUI22rm4eihxvRiuWKuhG+
	 3SUnIj68+VQuoMIFLn9ikak7/GVWiZgc/AK0wsgFhpvlnzUzP6PNPFhAD9ocqa2enHP7S
	 5NuGQVxt3NUzHgFLrUKnzWTePtc9nKSAf8YSBG4z7ncG5ThunP9pa5QOBGpsCKjBtfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jehMkVEgMGBUzExRW4jLTeS4kpPNr3py8r2FnDt6bfI=;
	b=WLIYygnDCoPSdfsXWYQEapK5ePDvFYYa12HwZvNvqsN3EitXEHkLC1ddUI1CgcdHk6yo
	 WO2BO5Yg51FvR7Btq2qnwIAzQP+iJsPXVf2GwWanH7LjVA1jGyFQ0gayzUl6aEbBvOE8u
	 JJWxqA1eIfi/xvhmuY8KitVLTKuaKNxpng09eKLXFKRC1+06R3PvJUwTus+a/1n0p9L0U
	 y6USfQELMaapIn+iYJaMiPA9tiqBx1eb2bE+qPwtSbBnyoshIVgVCdJolsYJVHEUGL4gA
	 7fMqwF0u2j/TpAxedI7zHDMpvQNOW+/+uwEA4H9mLs7gRCyrfmjSsgPq6YfrKwtYSZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gd4GPgsj;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2122606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2122606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gd4GPgsj
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1604021f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270191; x=1793874991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jehMkVEgMGBUzExRW4jLTeS4kpPNr3py8r2FnDt6bfI=;
        b=gd4GPgsjVo6GcYklyr1/n1T+RIm/k3Kyr0LN0pHHmi0WpE+3LYFksPgqRfLZhxpWO8
         rTEQYvkf30gK2Jc+/VGp6ld4qZD8LMdn6EvRJMwNI6DswMMb5bRJ2fs1Zk1rEQM5CK+m
         3EshKbyw2XIgoDPG0+ldJGles3WBcJP2sZpWBkTsJZWnvwseD9CKkN1sE7waoSOPhZK4
         5BSUusbSKU3UIxWNCEkHPn76dxUwcvsa4/yCRj0YRxxrYSns18l+eQxWh6xDts8bLhK1
         HNK7rckLaQfqeHOgye/wqpFNdh23bS5dOk/EbYM7qonlCOq02rMf6bNh16lMaca32bKY
         Cgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270191; x=1793874991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jehMkVEgMGBUzExRW4jLTeS4kpPNr3py8r2FnDt6bfI=;
        b=dgHz1omQHlVE3gU0TgJKXOogAjacmOtaCfJsl5oluBhdUg7ddyth15BKB5GPL2bbFP
         mFFUebcIPdD7LtElz8ZmSvD2dszWgpCEC5oxG71H7+jcFD52VfFaMXYvOlHb3kWbhC/3
         x8yL4sjD78ICam2aF9fr3kQHmhVHIDCN3hiEGhDcCYe5bcOrq/tbVWYzcyxCdyPyl89L
         O05tKjo/efjYDBU1qtnSaLC///8t4ph/Z8E4TS5eRQeMQR30XNug5q/VGCtRDO9sKEvW
         qbaB9SbYm8f45yYsu7Cns6q/sGlIoRil+4SjYtOo1pKFV7NsACph3TnO/+BuOgKk/WHe
         CGRg==
X-Forwarded-Encrypted: i=1; AKwUvByVxXnKvniNDKqMPR5IZJh1hJYI94sYwtds6VXUvuaUZ954UVVCFOIr0HPlDeJv//rVqncHG7iGHyXtV/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwV0M8xII83cR02RWBakWzDvVZbmWf2NuW902QFdi+Ay+g5LhP
	Lm8LyN5JGAbnsnAWpQFCz9+1ImAHIMwMNTIe2KyrDTIOEEf9Y2MhRbj0MaH0ZE7Yw85naQ==
X-Gm-Gg: AYBFou2ChCjL9bP+iXfLJ5IUbB/u18fajRCbxS4swg1nM2RHMRZ19CO198M1I9PWXGJ
	lwvfbT4UeAiaXfFm+DUKX6Ja1UeBU4/lM6fcHqmzopA40JdwpxOcfH0HQcs+vKJzTwdqfWZ9m+B
	E6MKqzh4rZfyr4Jvx9EwfAiq6In5oExKRLlCxJGCviR7rkJknQbGL9UuTe/Ajha8Wmr0hKneTtd
	eEQeWgWjN4penNVaN8OvUFtfow9Q7UO/P0+XN6Mu6HozPL9d3f6A/0umbjvAj9v9GhUNA0I6msO
	7vycV142DGIPiJr5lh6pfhWwKfRHgTTcVry9FiC25swvLUkhSxlyB4OzpswQZRe5gUeNcIbwPr6
	g5gw3u9rDEfm+wNO7+lw5Skwfb3UwW7M417n/X2AWeXoX0lVsUdJXwBc2qy7oLZDXpM5ke8bW+H
	nLVNCOzcvAW/Zxwap9sGcq074P5Uqr5OpNmTDLHcZIeZijWCkYVU4gHb7LH8bxg78EL6N1WBJHe
	4w0tRRQmM/zpQEvT7YaqC5YjogjUiymHfUzFdmeIARHcZB96nd8wl0JjPTs+qJS4uhS5I43brOb
	aZ04r4i0VVF9e4FsupOr1/ljciDcLXH8SRwbaBFjaVc8gdj/flEM7RrFZw==
X-Received: by 2002:adf:e283:0:b0:48e:1299:c00f with SMTP id ffacd0b85a97d-48e5d288c04mr9053525f8f.3.1793270190865;
        Thu, 29 Oct 2026 03:36:30 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4778:c500:4cef:6e83:1a47:83fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7easm33914037f8f.52.2026.10.29.03.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:36:30 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] gpio: omap: Propagate runtime PM failures in probe and request
Date: Thu, 29 Oct 2026 12:36:26 +0200
Message-ID: <20261029103626.1527919-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

pm_runtime_get_sync() can fail when the OMAP PM domain cannot
resume a GPIO controller, but omap_gpio_probe() and
omap_gpio_request() ignore its return value.

Consequently, probe can register a GPIO controller despite a failed
resume, while a GPIO request can report success and modify GPIO
state even though runtime-PM acquisition failed.

Use pm_runtime_resume_and_get() in both paths and propagate
resume errors. On probe failure, disable runtime PM and unprepare
the debounce clock when applicable.

Reproduced both failures on QEMU N800 by injecting -EIO from the
OMAP PM-domain resume callback. The original driver continues
probe and accepts the GPIO request - while the patched driver
rejects both operations with -EIO. Normal GPIO controller
registration continues to work without fault injection.

Fixes: 77640aabd755 ("OMAP: GPIO: Implement GPIO as a platform device")
Fixes: 55b93c32520d ("gpio/omap: use pm-runtime framework")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

Related/similar upstream GPIO runtime-PM commits:

  e9438ab5328a (gpio: zynq: fix runtime PM leak on request error path)
  ff82fc3a4a1d (gpio: xilinx: fix runtime PM leak on request error path)

Both use pm_runtime_resume_and_get() to avoid retaining a PM usage
reference when acquisition fails.

 drivers/gpio/gpio-omap.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index a9b9a3d9631e..31525a8eedf5 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -813,8 +813,11 @@ static int omap_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned long flags;
+	int ret;
 
-	pm_runtime_get_sync(chip->parent);
+	ret = pm_runtime_resume_and_get(chip->parent);
+	if (ret < 0)
+		return ret;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	omap_enable_gpio_module(bank, offset);
@@ -1459,7 +1462,13 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, bank);
 
 	pm_runtime_enable(dev);
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		pm_runtime_disable(dev);
+		if (bank->dbck_flag)
+			clk_unprepare(bank->dbck);
+		return ret;
+	}
 
 	if (bank->is_mpuio)
 		omap_mpuio_init(bank);
-- 
2.43.0

