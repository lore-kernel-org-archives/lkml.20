Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E996D374A0E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330239; cv=none; b=maKyzfFDPezI6BppP8UOyhXKh61XzBkqxXic3tBUlj02RYOGOayQ4/C+qe5GVuBJUr+PP/hh5dmGcXuZOgHefd7iwxwBFKjTpoUOJOf4e4pytscXQ5S0TVwB0w9yfB/1serwEgTr2WU7D2aYwtWAdeKMmrJQTJ/VYj+BgmnkoIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330239; c=relaxed/simple;
	bh=HMnn5aVJ48OtNSiTS+brlOGFOOU4wR55y7WucMsEbHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjLuYe8YgkMzp2VZyGHt3OIDV6Cbl8d3H8Zd5GoRqRUBHRJrNE7VO+X+pT4uISrAqSQsYsTo2WayyGub7nB0VHGRLBc9ACT14SW8KwkKjNessAfJNZWqh+AdGhPKvtGkKEVl0RRXiX28LZw5OhpkVqHRtOsIbUKjT3+MOQm6nVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=md5v9B9/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="md5v9B9/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49557167508so6314185e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330236; x=1788935036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHOxVIY41WkMlz245AOFHdi0BnFepDxV94FL1AiaZ/8=;
        b=md5v9B9/6rxyypeKiKXThJpR7D7n7GPHt6OpKP9wGHl1axadAoBRIkHWXj5JJra+uu
         gFeDhgfLzd9fute7JT+Go2+k20s6l4hYMg/E3izdh9QKIWwcVKY2EmTWAgagq6zXqKfH
         AT7VkSOhWVrmCPTxLkQlwZ8xY8WTnziO5l4p06yws8+7pxlGMxwxR7iqxINciyyRjU9Y
         uF7MrXSkkWHA0p+MuyZbivjYRsBTNNz9o8sjFuCrrDipPvzLNchQn1a6zDTEyAhDzIr4
         sLK6YrmgdTHFrxMs7t+radMq7YptjBnjjTFC+5ODBRTljWzU2BEqnXkKPD0OpvsGu1IJ
         AHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330236; x=1788935036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHOxVIY41WkMlz245AOFHdi0BnFepDxV94FL1AiaZ/8=;
        b=PjMbYi/OX7YHNVlHYR5HzycJUywmvJMr4trKAJHoJw2ouSEOq/MufefOUDQAim/0GR
         7QuIx4O8IqGblmqVuP4zKZucDpHZR7IlLheDl79d0NfDpnYSWxjdPazO/Uq3KZM2h1aT
         Q+pCt2UGIWKRJn+5iNkqHe6AuogdH9wteSQag9R5jxoWWrIy5OgffrATgrwG0JcRENE1
         iD6x6hATHKpQ4O1ZYH900dYsKuQvr8q4lJcKRXonY5/LTUCdyVJi1p+0nVwYksWkEKUD
         UPj9O6+K+9S76079TeKj8peDwBoRBwJHnq7cbtYef6ti1z9wzjdvD7J4pyrB9Id28yE8
         DZ3w==
X-Forwarded-Encrypted: i=1; AHgh+RpGN2+okjbZjta9+XmsACa0BiHXAMR4zHYkqg6viarvEvEZeP6bykSxgKkUqY4uUgDtf3QVRKw6V6L8OP4=@vger.kernel.org
X-Gm-Message-State: AFuF++nR/q1MpKmovlLWoqktTxAEL0S/GUyrKLAyBNb1/lL9Eq+wvTFJ
	OkLSbgSzNr2E/7VW7L4DAchYG0CPB3VTSVMtkMtRIpkF1dtyDKC5vkR9
X-Gm-Gg: AR+sD10nkDv+WNmXLHy33maWPnrYOLxAVgwt8sFugYM4V/jyMo1pyba7ogF9jfiHNUp
	c0J+M9kTU0ATZ/MuVNyaKSO6I3BIbDYbJg0Vy8pOSSOHZrudgkD1msVl7Kp1ONBHRomMXUq+hC2
	GEPBArl/EL+bAOclYdXQs08D3XQqy7HP8toBuwvg/f64Tm56B0fDqSREUGODlPAScry+X+kBCGV
	jx1xH6cQsls7VQqZ297Cu6/77EjPQi0NhR9jAO8S8XSDsRW4P7jx445zdo9TDL8wMfiZGBlawkt
	S39IBux5qYW8eaENYniFsWe6pXau4ht0jCXXGx/kulLpL0ia2Mcc4kvSrM3YPfBVHJR0/1k1vmJ
	dds/zOoQf3DJ0MDM/kTHC10yJRPCw+OA1cA9FbgbBKKp3CK93FEb2SeQzrDeUTHb1eEwmkFM9i8
	frPJaZ5RhxzYy0XJqp9E2g9YW0kZyfhFCuv4ZhI3Bhi3DimbXgRUuzeWo0qIkjWt+64g==
X-Received: by 2002:a05:600c:1d14:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49ce583e94cmr33712895e9.10.1788330236108;
        Tue, 01 Sep 2026 23:23:56 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4776131sm49735335e9.11.2026.09.01.23.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:23:55 -0700 (PDT)
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
Subject: [PATCH 2/2] gpio: mmio: get the direction from pinctrl when there are no direction registers
Date: Wed,  2 Sep 2026 08:23:52 +0200
Message-ID: <20260902062352.3600368-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902062352.3600368-1-mehmet.fide@gmail.com>
References: <20260902062352.3600368-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A generic chip with GPIO_GENERIC_PINCTRL_BACKEND and no direction
registers already sets the direction through pinctrl, but leaves
gc->get_direction unset, so every gpiod_get_direction() call trips the
WARN in gpiolib and the initial line state is guessed. On a Vybrid
Colibri module that is 21 backtraces per boot.

Install a get_direction callback for that combination which asks the
pinctrl backend for PIN_CONFIG_OUTPUT_ENABLE, the same way
gpio-by-pinctrl does it and mirroring how the direction setters are
forwarded. Pins the pin controller cannot answer for report -ENOTSUPP;
gpiolib ignores that when requesting a line and in the debugfs dump, and
such pins cannot change direction through this chip either, as the
setters fail for them too. The one caller that does not ignore it is
gpiochip_lock_as_irq(), which now refuses such a pin as an interrupt
where it previously had nothing to check against.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/gpio/gpio-mmio.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7e4b3e8d609f..b2aa74a734e4 100644
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
@@ -365,6 +366,28 @@ static int gpio_mmio_dir_return(struct gpio_chip *gc, unsigned int gpio,
 		return pinctrl_gpio_direction_input(gc, gpio);
 }
 
+/*
+ * Without direction registers the direction lives in the pin controller
+ * (Vybrid: the OBE bit in the iomuxc pad), so ask pinctrl.
+ */
+static int gpio_mmio_pinctrl_get_dir(struct gpio_chip *gc, unsigned int gpio)
+{
+	unsigned long config;
+	int ret;
+
+#ifdef CONFIG_PINCTRL
+	if (list_empty(&gc->gpiodev->pin_ranges))
+		return -EOPNOTSUPP;
+#endif
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	ret = pinctrl_gpio_get_config(gc, gpio, &config);
+	if (ret)
+		return ret;
+
+	return config ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int gpio_mmio_dir_in_err(struct gpio_chip *gc, unsigned int gpio)
 {
 	return -EINVAL;
@@ -601,6 +624,10 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
 			gc->direction_input = gpio_mmio_dir_in_err;
 		else
 			gc->direction_input = gpio_mmio_simple_dir_in;
+
+		if (IS_ENABLED(CONFIG_PINCTRL) &&
+		    cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND)
+			gc->get_direction = gpio_mmio_pinctrl_get_dir;
 	}
 
 	return 0;
-- 
2.54.0

