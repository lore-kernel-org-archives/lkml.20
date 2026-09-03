Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755AD430CF8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420715; cv=none; b=q9cKQEmiWklMyWy9s1Q5o9Cisz2Rd54JCSq9znOC8Ew/KGn8vN3/Gr2A6uZxPrKrjMZoT08R7qT7g97GbGRhpOKbrtKzfJlQiZUQN1o+j3lYQOrjjAnHaH8Q4Onh7FjWXeFn4ic5pxWw8Hdpu53SL2+tvuMns/HkjmDEfc+SkNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420715; c=relaxed/simple;
	bh=HO1YpOsp7AAqKVPegRZIkVg5ChPOPjxhcr+CFObZK4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GrAXPQrFc2l6O/Htrny22rodjxik4FtbZ1YKZWcLJBbd84oYdI8bhkH3p94126A25LAeFAigWGxpUVgWh8BovasbXM2woQwq/cmm2T1JW1oSpQc4YCC5CP6DEF+u1jPB7lTmyAWvvo/Nm7FAcW/sltrp6pNlQXQ3VOlLCytYjLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uv4iOdqb; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uv4iOdqb"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48431648f33so453837f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420709; x=1789025509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGVy22n2k2x8Vmi+YjiPo8Onst4nWhBMCSM53hHrhOk=;
        b=Uv4iOdqbdE7Rkc/n0DeJNIZ4ZC9bY/FQQBfwG4L+UDw/s7iJo6YJNQIRGS356uj4o1
         dpZOzjJPW9YJUqKN0Xf/8UsFjav9IllHPVYInQD/tM2fMSjxsrOn6VfyXIFOiC+a1nlJ
         hC61OO6r0W+uzUXgEva92mRTCgQd6cQOtcLwnV68te460qY4J31c8d8bxN6ObsJcHtKq
         jb4ckwvsjab7u3X+IgmjWSYyl/HLDG5py8FWFM4M1jX9lzrOh3cMPzIs6cQ7x76E4qPK
         FTx2HlXUhr5PgE/B5OsABtHWoDhN24e50Cltiu8hHw9t3hifaYnKBknM5+P3UVGn0cvO
         MKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420709; x=1789025509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGVy22n2k2x8Vmi+YjiPo8Onst4nWhBMCSM53hHrhOk=;
        b=eDY82ddNHWJe01jyknRm6fUl8jC2rs2GhPtc47fQu6FJd53L5O1dXumVX5y7ee+ZSH
         UKxY9f9leOCzuZLUmLF8yOe8XCux4I80ZwR5it7ovXmkydV93PkXFsGAVC3MUTzPxlMm
         Bg4bAKaOZVZqzLNgCLGHXpJgBWEanqGdbv/1GgH1ZyuLoz1rqxAlkVPhQ6SmsHAlaAMl
         7fgdLh/Lh2TrSJK9NueDpyFYOuEAlbtU6dkeB18klkADx144JF8dg2e5N02BqzUXFJWG
         9RAcBA91m1KYl7uRLmmJX6FyxbHvc5/hrGGV1YglvklzIQlXoKa/6x3IPheMbm0aY2p2
         nIIQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2uDhKqidWkYQ2ign/DclXb2W51VB/8p8wCzES37C/KVJuRWdDgrtJYcOiS7giQTSo0m4xUXwYnxVcBbY=@vger.kernel.org
X-Gm-Message-State: AFuF++n7mrWpxUgEfDOmwE+yAEA4ZsSQClAGTJwRjNKuMGzkk6BHqbaV
	9+eAd3cRMHNT/FIU1kBEG51cZ8qdkmS4uW0rOi15+NJ5OVFS+isAdlx1
X-Gm-Gg: AYBFou0dbSjF8OlwM7EOY7I1vOQb+4ill/8iXqpfTHwdiPAZQcFvJ/EPYv/xbqPJl7x
	oN/KmrFHDnwLPL/n4/RBUyOT63tlPu0tJmi58EzupNt9PWGdiPn3bY/TyfpQLY14PbJojvw9eHK
	S9oULkdrrp7X8BRGFeaYu/icz458KKK6kqks9waFjGmDc7+fEMJJO0vE7s/MRiZdMLwyDoSS9uy
	8Rj/63uEmulUaTEVH+SsoP5SLu1H0YXG6Z/IOszJmAaHgGynDLOq0JtaQfiTi7zwFMe2xhqbQL5
	wuLR4Erx5ZjcQMyIDQR0nWBGwp0xPKMm3byWWtonxB58kX+RXSlP5nSKOqAYWlvPcnMtDlyiWSN
	nOM1/TZQ9VESE3eAmsh0yxRuxv1fsNwtmEp014e6lVCBHLTAd0qc/0QkN1AG0tI78n06wVLFncJ
	FPFUBUwTgCbkd337JIbooJWIqojRSWVToQVjI5n3GlhoHLwsmGq5TMiPwFCD4VqJ4nlg==
X-Received: by 2002:a05:600c:348a:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49cf15a3672mr17202235e9.10.1788420709205;
        Thu, 03 Sep 2026 00:31:49 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm69369455e9.2.2026.09.03.00.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:31:48 -0700 (PDT)
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
Subject: [PATCH v4 3/3] gpio: mmio: track the direction of chips without direction registers
Date: Thu,  3 Sep 2026 09:31:43 +0200
Message-ID: <20260903073143.2068494-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903073143.2068494-1-mehmet.fide@gmail.com>
References: <20260903073143.2068494-1-mehmet.fide@gmail.com>
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
new line, so the shadow is seeded there from PIN_CONFIG_OUTPUT_ENABLE
through the chip's get_config(), which is gpiochip_generic_get_config()
for the pinctrl backend, and the line reports what the pin controller
says. Lines pinctrl cannot answer for keep the input default, which is
what gpiolib assumed before.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/gpio/gpio-mmio.c | 60 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7e4b3e8d609f..0709ffaab4de 100644
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
@@ -601,20 +622,51 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
 			gc->direction_input = gpio_mmio_dir_in_err;
 		else
 			gc->direction_input = gpio_mmio_simple_dir_in;
+
+		if (cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND) {
+			chip->dir_unreadable = true;
+			gc->get_direction = gpio_mmio_get_dir;
+			gc->get_config = gpiochip_generic_get_config;
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
+	if (!gc->get_config || chip->reg_dir_out || chip->reg_dir_in)
+		return;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	if (gc->get_config(gc, gpio, &config))
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

