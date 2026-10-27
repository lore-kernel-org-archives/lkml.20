Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098248;
	b=3q5j6p6RGf989LRdt9Ttd9HVLmQJ06M0WYVUjkzYjl8TTb0i85+IRzUianiYMbN7Sf73
	 rlNf1LGMwmqfjljWmVDaYqQZAXXHILinqX41b86kskspoGdd1/0OcUVd9AhAXAlmD9oeV
	 6L2kQErW4AfaiisaZeyvpfv/7HlhpXvvRbU409Dw468nn6xCEvPRm2RRrG0Peyu+EhG7L
	 /25wMgJOWdNRqrGK3uV4RSOWz49ikJ+uErG+LGD01sObvkL0Pbg0udzr+qTIwOrfm+dQy
	 8+CHgoUsr5xXP5YgNNqGkdntoj14vFlfTK6sapcIvgGDTR8R29TtN0gEAwrRG7mai0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=I9rh3Te2xYwf0xNAqLGtoJ0ZzJXpFdRlQePYZj4wULs=;
	b=5ldPR8hJnOuAWfxvtZ9Qws4MKJMcpuFu1hYjALEjQiPLYjbJUoOzL8UnEXVqjgjax/Bi
	 7VT0DROhWko5GoJuvn1EHL16qO4v2Oa9q/RCJQuoL9DyNr9dV7soXDZJyFQED/UKYjLFv
	 kWwZsORT7MD1fv6snwo5WlQ7iTV7254Ps3mj2BLyHIGMczRfSaY+/5p8G91sWI2eUlZpq
	 W7DkCyrl2vNHzk0Sck0PxiMhGnetI/GddSmC/aLay62wo79SZRfVTaYILQM/uOrDb0b86
	 tZjq6n8rwhR7XH4WLr4AtlrlshWMA/NFt7D8VYc0ejl7V7I0RjEfYzAVtyb4kaGBAAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PWA0E6pf;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C1B606ADF7
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56C1B606ADF7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PWA0E6pf
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4649b35bso4018655f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098247; x=1793703047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I9rh3Te2xYwf0xNAqLGtoJ0ZzJXpFdRlQePYZj4wULs=;
        b=PWA0E6pfguevg4TX/fCH4G1cUCChZGK9BFBwhZFZpHL7/dK8WwnARewBJCjN5Fxmca
         /CLnoG1GRH4kD/KtMqzppV/N9uUT+vHlOiUT+YmsIArh2yD38iJgF4kh1NyxNtEXumL0
         IanYQbEW0WMr1oRXAfKwuOj9FAiEwzd9it/rzPk6f5POzYV6wNVqsZL1HoZ+PKPMS/Ij
         KjqAeyWajRnmsei4ZVh/yhtiGe8zw2qxCl4Dhp+3Qh80qblQvdwOXzwVphsKJlbn9d25
         IHd+o/7iCLHqrZTLRQpbHwTpkfZBfKxD3D1OVFmE8HChpjGyPQg3rKOQCpAwiXIwbW9S
         K7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098247; x=1793703047;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9rh3Te2xYwf0xNAqLGtoJ0ZzJXpFdRlQePYZj4wULs=;
        b=yI5A8xYnh+jDNq3y1evhCSwkVNejHg3PuvqtcgMqWRGFHErkS0217FxONXlqZEH0RG
         vwI3KiWttuqNrhB2D3suFVfHtiOqWuV8S7qZRtoAKiAg3Ynsj5SBOOF8bGxWU/PgxjN+
         UP1GGEG3Ik+61mn/2ZzMgASKb1wafZ6Hlv0O7jEi969+yqVkKv5rFO5o8xKSKGdD2jGQ
         LIDs21djYIQ/LxkcArSskU54UXDsyBuYzf4yeY+zVIt9nkMwzQMZEDwhIjqjCP+S76nO
         rSp12o3VCTrNMMXlzj3sUkmFVELjzdG3aPBnthcmP7rlqZD4JMTJh+kfrxSYeW+7JvU3
         tylw==
X-Forwarded-Encrypted: i=1; AKwUvByb0c8VEw7u/adehQUnTary9usqFBJ3vvWv5L33aQf8R3aLUZ0scG5BDAObrjUsr8YQ+uEYiBgVK7y18SE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjh2Xu4RJnEmys7gTcrdfxKvhijrbWBmQ8AXN3UpgsDvUjJMSb
	o47A9z+gUJEJmQfgN3M7RxhjmOmSYImdfsznYXsf51XtZsTQ9344ZssgDZwDKaV97aQ=
X-Gm-Gg: AYBFou2rfde572KPRn+BgZqulfeH8Kue1F1q6nGeXMHD3KvkJ/ezUZYL+HldGs9FaFw
	5kJwarKhLCRWQOFJeaDEZVlVW0N6Dk0MRxGPhdKg+rpuC1s54hRsjMntXNsp8sSykNgyn4BwQag
	71DloobL1XeWBT+tQpkLXAniKWXAAOPqq1WRDw/nHQ8Rktj9vH155WV1YZTAc3QOMMmBj/R1qU8
	TbbnMsE8LfUjhgaYjQFRuxqIlv2l1GdWEK6eKdFWBsSt2S6vqRE0yFFTCVhSd7jxK4xkfD83HRh
	6v9PnsNnXghtXwElBaOw1D3DTa5kJc0Axt3YaJwcB1TpA0Ov0r2jgejJVQXr4I9W5OpXAmKxrgN
	uAtd1qrE24SjJIbYLK4wxu7UFU4ubyYj+Nkfdgfqsdjzv2PPVzOv2swbu+9XsmAv/XPfKJuIt0V
	+cdYy2Ep1zYmcxcONoDMdqMMRbG2NLbRdh2Ju0gC0NeYgY2mgzWGqbNp2FaS3w5Sizhr+sQKqV9
	xhKTsivrYoKfiH59rCtzHGNzeaUbhuOMQ0Spfr1yE0Ct4g085qTjbPcLKHhnqtrGev/WqmuzuGy
	WCjhptsa9vIcWMnXkCXEUW2PytuLEAPf34CW5NyFtC8=
X-Received: by 2002:a05:6000:2206:b0:48e:b1a:fa3 with SMTP id ffacd0b85a97d-48e54a0a7f2mr5629085f8f.35.1793098246696;
        Tue, 27 Oct 2026 03:50:46 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ece5e4asm21603671f8f.59.2026.10.27.03.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:46 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/23] gpio: Use named initializers for spi_device_id array
Date: Tue, 27 Oct 2026 11:48:53 +0100
Message-ID:  <11fe7ed408b5c4f8b9e67208363108d192d5acf2.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=uNWJjvjByUSk/Alx6uwMJrOimvtVntzmd6YoLQUBMo4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IHHIPl67+WUpoSrkDzCHbqDUyo2BVaVgefq8 AD7aObIeaGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBxwAKCRCPgPtYfRL+ TkgKB/0SfJ8fTC61IW0Yk+XPjTjoN5MZCzoJEO3QepOvDaZacI+LXqNwm+2rV0/6L2SjwEcdwsu WiTM4MiH/ttnsc2gkH0q5pCNclz9WhNX7TW5gf0XpfIqcEfZhVQ5efaDL/Rqz0aOXqW+7j/nxkB U4LGvGNU9mR2rEiszaxK8IjA6+2N3dJitrY+Xv7VM5sRzDW8Jl+oc28AmwkHTqT49knGsFvOwN9 WXHucYE3zuy2v+6vAje9QwoicbbeHuNT4t3QdSIAFz2JFxfhEsIfp5qM4waqI4aHWtjuUmdr6g1 dFOXjtPGOrD0YAc3M8zKNonm82Pgvi28oV2xWuQWDLo+fy2+
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

