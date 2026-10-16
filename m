Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9D941DE0A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792188984; cv=none; b=qJR/+A4n0kdb5dnd90ue9L782/U59ysZ4SdorLBLdalwBX9+OFsfkIX5lJaZFeCj5nFxE238itjb6KtdQvUDygxQMkAigNMbW54i8BpcMRjM5iDQKFGLXJIvFaWxRfJFS8VjL+nb7T17Q9/xuGeGRyVFbhCGWaoRg6ecROD91w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792188984; c=relaxed/simple;
	bh=F5rwnE+TarX3Uu1jbAXzL1o9rcgu7FuxAMhEFAkxA5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y9F+vIssIL9MdtTbeabw+CPfi0twL5XdlRqIrBJN6CSuYEN43ruKQIVqwKPBr430f4la0XbhLZEGGlLXGDewWpVo6VfqcCnKW2CiH26dA5i1ZUWS248NCRc8tICC0JY2JuuZfBdWg4NneL/Bkx5SZCugj1bqS0CexwO+6UA4g2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fr182G+s; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fr182G+s"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-170135e43c7so251817c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792188982; x=1792793782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAJ5TtwW+qsqI5u2ZCLK61rBpDAhHmzAtC4VpXZeDfM=;
        b=fr182G+sFNo9SIEVI9oIgyNgcARtionZP5sOA3FG4c/0QWMRw6PAb5stDN0vHTQa5c
         iMNquurhQoeN1h/hJ80gq0h5aW4dls2rdnGuNzhpYiglT4fNVD/QbRzySrfKfZAtktPk
         uH+1vqtPVIH9hPAUIEDZBbEF14lxrQDcW8VtngRpHEIL7X7C6LsEy9qHhu5s1osPXm7Z
         sdTYVfdDATc7WBO7FvV8iK0eVCf4EXABz398XPzYUenbLfKRV5cFucxI3Wjw85qjkh4d
         Y4TgUIoEhJb0/OfULOnfNfYyusBMgoO6CWpmVSTV6SqHnsj2xSlbzzIOtwTqeJcwhdPH
         zC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792188982; x=1792793782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hAJ5TtwW+qsqI5u2ZCLK61rBpDAhHmzAtC4VpXZeDfM=;
        b=Jg5OvQUNWNnmmLXbsqC7ESpLYLrSVbg2xHN243bJp7a3w8JKWgql/czGkFbyTMDj4W
         U9VG+0OILb42vof1sbYjXu86ch3Sq1i1QIm7RAetstDilKYrwksKNxmhQ+/X4lABbqaB
         P1+xLI5tNZ87VFFrhaeEFqk6GwLCNiYwx4nbD6ePPNNzqCGa7DgEaAEMYWboP5xrOjsx
         LwLH7Z0Ossf/F37n3YuoMuDAZ9GJvYsuFAX/7+q5Vjk96mJsfNOyAtQbI1V7gjqYtBGi
         MjGin1qXyZp+PnRhIV8LZ4iYZ8q2LHdCpni2rMlp39a/ZKgB7e3dc7hfUDG2ceTjMP7P
         3ClA==
X-Forwarded-Encrypted: i=1; AKwUvBwR7VmDO5N/ABPDJ2k3mRLrMlAoyz+WfKqxCY4EhCPOp24EmDyUqdOZQEWpgelslUbbfCvOV9h1+g37trY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXNgMwmadzCWivXLAd1hICsG/LETMeh8+m8qj+XM5xofopPy6G
	xk/qyJbbRmV5lpBlZGkVHhhy051YGrWFI3WoEJ7CJiF4hhY5iD93mhi0
X-Gm-Gg: AYBFou1HfjJmeRODYWNKy9e7ngrGiEo+PO9N1qhWNEKSA1u4AzqndgFt0Rwj+MqZ4ku
	d3u6QajMEVD/vhtuC2veavDSLdIgjDKhaSYY+viwiX9Rd2tgdNuwPW6P1Ct6hTP755ehTQzWwjM
	SvmvRPGnJvHi7yCpNcO7JwTbO0kb+kSGdfagZ+nWbRKfK3RruO9r4qTYeq+XYAEdKjjxOok8eW7
	ke5RcT+NmieLe0FbqYL5Fe9/Gg7L5BmU8HHAZJasWrSGlHwRwgX2ZAS72Y/74BQUJkadWkx/IL7
	UyoLmS2yPhSeWIS5fVPmGTZJTkvFb2b9++Op1H6WoKf9wATSmDa8d54wHm8DhBAqlwk5FDKSPOm
	OS86yIyc5Qm9JS+EbImUNIYdNRoDvfdVU9m5gF7nWsmUmQfvYOPaIbgEe4kZlXZ6UzEAnBVXxC1
	jvWg01/Pju19hM9VSXeh2ugD1KwmaBTCEtAM+Q4S2RsHl6OQ7cWBDXBw9mtzYQvo6rXm1W8uE=
X-Received: by 2002:a05:701b:4584:b0:158:1ed2:cb58 with SMTP id a92af1059eb24-18514634414mr1389008c88.39.1792188982207;
        Fri, 16 Oct 2026 15:16:22 -0700 (PDT)
Received: from eldorado ([2600:8802:b00:1f84:d294:66ff:fe95:a98e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fc14sm10480863c88.6.2026.10.16.15.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:16:21 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	manuel.lauss@gmail.com
Subject: [PATCH 1/5] watchdog: gpio: Allow devices described by software nodes
Date: Fri, 16 Oct 2026 15:16:13 -0700
Message-ID: <20261016221617.2223004-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016221617.2223004-1-f.fainelli@gmail.com>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver reads its configuration through device properties and obtains
its GPIO with the descriptor API. Neither operation requires ACPI or OF,
so allow the driver to be selected on platforms using software nodes.

Add a platform module alias so a non-OF platform device can also load the
driver when it is built as a module.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/watchdog/Kconfig    | 2 +-
 drivers/watchdog/gpio_wdt.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f7d0a0c2c0ef..f50709c635e5 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -267,7 +267,7 @@ config DA9062_WATCHDOG
 
 config GPIO_WATCHDOG
 	tristate "Watchdog device controlled through GPIO-line"
-	depends on GPIOLIB && (ACPI || OF)
+	depends on GPIOLIB
 	select WATCHDOG_CORE
 	help
 	  If you say yes here you get support for watchdog device
diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
index 1abc7d0b78a6..ff323d6e692e 100644
--- a/drivers/watchdog/gpio_wdt.c
+++ b/drivers/watchdog/gpio_wdt.c
@@ -191,3 +191,4 @@ module_platform_driver(gpio_wdt_driver);
 MODULE_AUTHOR("Alexander Shiyan <shc_work@mail.ru>");
 MODULE_DESCRIPTION("GPIO Watchdog");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:gpio-wdt");
-- 
2.53.0

