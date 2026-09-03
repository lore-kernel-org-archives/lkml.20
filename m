Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0933A3E7E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422397; cv=none; b=eVwdoXQ8TV/ihFhSOtaBzV8mkHWy9gB+5OgoqUuxcaUM6itZz1cWCktXklPd6znDYtSXi76JKzMgD2lXSgr+hHE6zM0QXd+co72ODHCDuxuta8/w1rVyVkns1qtVRTbCyNdPexv1UUMWD/hqYYAin+5I+IgYla7u9XqBYRqw/f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422397; c=relaxed/simple;
	bh=HO1YpOsp7AAqKVPegRZIkVg5ChPOPjxhcr+CFObZK4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhNvQ69qw0o4kmkhU6xkOPxL2vhswK7TxhLEro+qklCEU3dP4hM/7DX2+6jPCyGFQDmozGSAymerPwK74Pih5btRnxNaSBHV6H2iU+uKWhMHk5JgyvUSi1vC/FTPhVH2lIuDtTnCxhKxzf9aUFFh2e4xjWcotc55sPf92Nby5iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPH8m/r9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPH8m/r9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48444eff835so520609f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422394; x=1789027194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGVy22n2k2x8Vmi+YjiPo8Onst4nWhBMCSM53hHrhOk=;
        b=GPH8m/r9a6LdXc4HoKkdURGiP1TZbVE0H4PiVDrEB9D7u9GOrJj7aDYLrJiRzF9bY+
         d/gDhJdYNZjAQYLKVcs4C8UKQsot0rbUHhVLGxkFBYqI6EfAKabbxqAp+v1+BW8dCkPK
         c3VMbxHlYKY4Xf4/0ihppQpxI1s0s7vwnsvPa1o3PZSnipGr7qziCSrqSxK121alqZ1x
         vVNfAepaS4Krz3GIsPSGriawZufV5/SVS6BL8qYCZ6fcau2K6+uF4Kl9LAS24pu8SxkK
         e2ZNYPuuifvIteg4wdTC1upRhE+2lkkxxSQEMDNxr6nEBTyU8ME82ENCSWe171yKaXcy
         caHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422394; x=1789027194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGVy22n2k2x8Vmi+YjiPo8Onst4nWhBMCSM53hHrhOk=;
        b=XGRL4nn7JaIcB831xmQraIn6BSVoOLvG6ypaQ9zKOSmmJs+9KexfWEeouk5mZVjUrc
         dnNa5vAa1bE6LF3rBUv59kGOdIdMTa5kJS2WiAWgn+H+0lKO94UNMDEwSV/aEmgxkNlD
         t5K+i5gVSzeWs3WIhdr0zx8X7RHxKiBPohplzNHa7CqovEiR69jkQ26jS4H1rJXVXxxD
         2uD/+ONP9/IjYQL7fpJhT4BXQG9jP7/+qOvz2Z2IW9UiO35gt8eDVLikoj6l8+Xp4eho
         RXRwj+12i97jJru7M2p3a1pUILZMZehIJR4wPCsBIEB4+ehpS7usInRF/wv0PYkzaf3q
         78bg==
X-Forwarded-Encrypted: i=1; AKwUvBx+XNtVsUvbFWaiMeWpE8on5P+qj7MqQgoJGO9jptgad0gpQFLTo4fcKzh4j72ma03qc3AVt6r+/6rMRmE=@vger.kernel.org
X-Gm-Message-State: AFuF++lQU61vMtlEZH9OtGlXe4KmGHxvXyu+1aWGmZWypjKlmQHgBN3C
	j4ZROOIaYGFKUr87olTdT06wSCcCaxX3aJogWfCjAn5O5zyidokkUD00
X-Gm-Gg: AYBFou3f3WnhotZGwgEJgyU5kA5RGzi8oYnxbnzR7EOTyW7Q6FsWeAavmfWbZkKzyRR
	q6SgAHnBC5HC0pnbHGRGc442v3vIkZPtD6cP1uR0t8AHf66kqAlgOeHqHWi3pnQC+Lm7sk0KzYj
	fjaNoymKVbt9xVtesDsKksvdVIQ0SjHAAd0QgPFYv/2tm/mJj1eqj4blCD+MOoZtd/mZl37rKYx
	jYkhdExeJnB08EwvxKrwS4P2bTcKNdOitatzYKRUW9+G7vvZUgMHAg8I2pIaBHSG+suQw3L3ZId
	tbbLsJluIojEGet6YqiX7k0EwNcsXWz6ByLDNUibDgGTusDIyjHhhVGdbJnaR5s2g8AUm+rOQJm
	ri/WJM+QB3yJd9PzFE0ZpnKxM8iSORy+OkhGR5CembVrFo8rChMp+/2fmcCCTWqjXOMsv6zUMBF
	xrYT/s+m3a1crSIvK3EJPuA6dQaBuOVAJehVQbNRu59uRiwIEVyl1GQacpvk/NRrogUw==
X-Received: by 2002:a05:600c:621b:b0:499:dbae:86be with SMTP id 5b1f17b1804b1-49ce58352ccmr202005745e9.14.1788422385163;
        Thu, 03 Sep 2026 00:59:45 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee3b0af8sm52373275e9.0.2026.09.03.00.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:44 -0700 (PDT)
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
Subject: [PATCH v5 3/3] gpio: mmio: track the direction of chips without direction registers
Date: Thu,  3 Sep 2026 09:59:40 +0200
Message-ID: <20260903075940.2089367-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903075940.2089367-1-mehmet.fide@gmail.com>
References: <20260903075940.2089367-1-mehmet.fide@gmail.com>
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

