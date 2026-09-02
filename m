Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED84547F79B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363937; cv=none; b=Q0P44NqMm4wSKvgPdQEXUGQUrZJG8vLCE2g9sL3lb+mxktcBhVMFGFsftAY4g4ebBPTvhn9dCutTj7HD0XVu1NC8PrEbci6ctePSXNNlYUJ88ZjodFx9o2wJq69oUYqsS04Ggb0OwdHrofdMtHQ60/Jtu+6Cki+TjCSpX6NdAHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363937; c=relaxed/simple;
	bh=2cVQm2hyDOussy9LNB0Uh8MJoeGRDGhTixY4iyHbvQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vbt2CMsQ0MXZRA+bXa+HxiyntPDoAqkmxbhR8zHf0Nf7+Sth5Wru6SA7bMhWtILIiPnKATtctL4ky7V9ew9g7Bsl5H0kPfGCtisWIBdcifhJ9LqtJhcN1IC0jvXlRxPQ52MZGZ+n2HGtJXUL4xzLLnNsUrgnjgDV9aP5BSSGu00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAbEWnLZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAbEWnLZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so12844835e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363930; x=1788968730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABWq6yl6RmD8WKfldYZOiTpcwQ6GawnJnekuHKy7JS0=;
        b=dAbEWnLZSmibOtOTHf0dCYfaC/xLGBDCFU4zaKfh7wLwLKSRXq9L/91gkHag1H2Yyt
         /YkxdX7iTvR5qDul6g7m+2jCloEQz//xtMd052f5pEM3jtsxqG5pKlsSOjWv/1+z13K7
         IrlYcYeJXb5+cKugPOrR8L96+VuO8nPuU9Zb82STWUeg165UgzGFegnsAaPUJTOIefbi
         ZXbPEaWKmHZkdKedmiuetNZqc5KYVpFxrXGQpT+AmyCFITOSZLsRiyBxHSrxrlaaBZ5L
         XZOF/EDmdn/Hns1HToKW5ueq1pCGhbTWZSPcBW6wpAUsT/URZl2jjSazSnT0oov71p7e
         3hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363930; x=1788968730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ABWq6yl6RmD8WKfldYZOiTpcwQ6GawnJnekuHKy7JS0=;
        b=gTbmdOhcWnZpj6aTIMaHeSkBFQQAFZyA2bKEMaG43zxWV2l/eEn9sBy79dLZtTW805
         TWm/c7cUPbwEr312rHkt0D1Ko0F4TQU4BEnQO9Kffo3IBvv3MKpEAsj23x5QpnPuCzzD
         NJR/yvRFGbHnPaD6a0+2gjsk6KUVZss3F0z4XF3hHK2su0fFYMEx5KAHwloEApSiHi6J
         62W1iJ8TPedtJlOfEiIKW/9a/r/Q74/e4zuqqTJdBaVp+DmRoA+Uf081KF4Q5xsR2lNs
         RF24hw16iXYIp1RwtWVUYvCRqQZ2fCSuNEgP53bdUDfUfgWHWD75ggE93q18RcE4VBJ2
         3x9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqG+J6T0LiZLa6W2DBu5u3G6KqPq8J1ru0ZKfRmtmr/NNLc9EO5LT6avb3N7ESJ8sPTWo1xHV4HPd44t6o=@vger.kernel.org
X-Gm-Message-State: AFuF++k30OjEtlU2rK8w01wNO4TXCDH9tdDyggqFPnsWsl+HMvd3EiJI
	MR7WWCB4Cg5tXFHR12jjngiT5Iqtg0h+tWsTrfpkDRi17ABXmimh4NQb
X-Gm-Gg: AR+sD12ttMnYzp5fTcAklJq3uXi912PitqBRMuRJtw1k1Hk3H0nLIFFJFLSdPPMkgEf
	8wIgyeRjDFt17roacJxr6lXdwmjp8Y76gdpsrh9thHKH9fmLba+8l1q4EejwLmRSTy+g5h1WSUC
	BDNvAwmmByLhPW6dG/dxmn/G4PTTk6Aun2FgYrSWgr4SHrXSYuwsvr0jv2g7Q1fXVo/OtD9JXRV
	SdZ445yCOF0Z+gUtrLs1066ZmCuTROrj6prcdgWeWe1I77rmgSKKUe1/PCbc48UXmna82I0lrD3
	iLBSteZYKvQtJ07c0nVB1nDoM7aW9SY/ZxobL791Nm/+gPdqPk1wBJXRwxJH62a+s37077tfNEf
	JmMBr2ud/FQS/rOsHe0jpmTzkSBikC8GtKXuDtWzu+PJ0Q3+2l2LRvEC6OMRXLyg+br/T3oa73g
	baCepJmb6m9Iyf82stlXPWuoH4p7K9qy1SmHNZ5gbGBFUpp0oae2jkW3hOCi91U3RA9iw=
X-Received: by 2002:a05:600c:6296:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49ce581635bmr118401635e9.3.1788363929530;
        Wed, 02 Sep 2026 08:45:29 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e686fsm530655e9.15.2026.09.02.08.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:45:29 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 2/2] gpio: mmio: track the direction of chips without direction registers
Date: Wed,  2 Sep 2026 17:45:25 +0200
Message-ID: <20260902154525.4090276-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902154525.4090276-1-mehmet.fide@gmail.com>
References: <20260902154525.4090276-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A generic chip with GPIO_GENERIC_PINCTRL_BACKEND and no direction
registers sets the direction through pinctrl but has no get_direction
callback, so every gpiod_get_direction() call trips the WARN in gpiolib
and the direction gpiolib reports is whatever it assumed. On a Vybrid
Colibri module that is 21 backtraces per boot.

Keep the direction of such a chip in the existing shadow: the direction
setters update sdir under the chip lock, and get_direction() is the
shadow-reading path already used for unreadable direction registers.
That keeps the callback usable in atomic context, which it has to be:
gpiochip_lock_as_irq() calls it for !can_sleep chips from
gpiochip_irq_domain_activate(), under the irq descriptor lock.

The pad's actual state is read once, in process context, when a line is
requested: gpiolib calls request() right before get_direction() for a
new line, so the shadow is seeded from PIN_CONFIG_OUTPUT_ENABLE there and
the line reports what the pin controller says. Lines pinctrl cannot
answer for keep the input default, which is what gpiolib assumed before.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/gpio/gpio-mmio.c | 59 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7e4b3e8d609f..987285c33f45 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -49,6 +49,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/spinlock.h>
@@ -372,7 +373,17 @@ static int gpio_mmio_dir_in_err(struct gpio_chip *gc, unsigned int gpio)
 
 static int gpio_mmio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	return gpio_mmio_dir_return(gc, gpio, false);
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
+
+	ret = gpio_mmio_dir_return(gc, gpio, false);
+	if (ret)
+		return ret;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
+
+	return 0;
 }
 
 static int gpio_mmio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
@@ -384,9 +395,19 @@ static int gpio_mmio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
 static int gpio_mmio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 				    int val)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
+
 	gc->set(gc, gpio, val);
 
-	return gpio_mmio_dir_return(gc, gpio, true);
+	ret = gpio_mmio_dir_return(gc, gpio, true);
+	if (ret)
+		return ret;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	chip->sdir |= gpio_mmio_line2mask(gc, gpio);
+
+	return 0;
 }
 
 static int gpio_mmio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -601,20 +622,50 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
 			gc->direction_input = gpio_mmio_dir_in_err;
 		else
 			gc->direction_input = gpio_mmio_simple_dir_in;
+
+		if (cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND) {
+			chip->dir_unreadable = true;
+			gc->get_direction = gpio_mmio_get_dir;
+		}
 	}
 
 	return 0;
 }
 
+static void gpio_mmio_seed_dir_from_pinctrl(struct gpio_chip *gc,
+					    unsigned int gpio)
+{
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	unsigned long config;
+
+	if (!IS_ENABLED(CONFIG_PINCTRL) || chip->reg_dir_out || chip->reg_dir_in)
+		return;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	if (pinctrl_gpio_get_config(gc, gpio, &config))
+		return;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	if (config)
+		chip->sdir |= gpio_mmio_line2mask(gc, gpio);
+	else
+		chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
+}
+
 static int gpio_mmio_request(struct gpio_chip *gc, unsigned int gpio_pin)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
 
 	if (gpio_pin >= gc->ngpio)
 		return -EINVAL;
 
-	if (chip->pinctrl)
-		return gpiochip_generic_request(gc, gpio_pin);
+	if (chip->pinctrl) {
+		ret = gpiochip_generic_request(gc, gpio_pin);
+		if (ret)
+			return ret;
+		gpio_mmio_seed_dir_from_pinctrl(gc, gpio_pin);
+	}
 
 	return 0;
 }
-- 
2.54.0

