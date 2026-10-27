Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098235;
	b=q4/JS/KiR5UG7RyfbjUOC9XDlROclquhI9wV6fRzkpJarpyAa+enqriPj2nn44erXk3k
	 CUYYlZ8SmI4eLBrZwJ2XETU/xRp995VJoYGf2D9jXEQQGhHhEWAejd4OSIOZiwI7o8IkH
	 EDhbpw5MOLkXmMWoCcjuqDWUTvfSq28vQJRLk26MclrIvkxEc8ZVls+AXoRzEDexqeEOs
	 SkP1CCWerG8k5oaLzvHCMMBc8EDnjG12/UuRfYaH64bJigaUVVnSkyQ8sFe8aDJTEHXso
	 3BTrhq6hy9zWtLfpWB9OQUsM3ZpoGsLmtDuh4cDUa4po/yMMlKUsNbJPEFcZYrLUj0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=4adVsWvCwnIpJJt93PRS5T7YpoxyqUlIHXUw1J57LTk=;
	b=vSzno/2GAFgiG96fg6CtdYni+NH6nhkSIqeGj19Eu1eqABfRbYzz2zyVA0oxlgK9U5hh
	 Sqnei6h17gF9Dilb3zDlCReHMpZ+v0yXxBnrJ0sRVhujnwj0ZQIkRqiVlYQhAZXC+a8Hh
	 fueqW4XxItu+9+CypS24biFtRMMLDP+651R89aZzHlf+4NbXU2vXgUrs5BLMTvYuadJp7
	 ne2+FYjNsutZpCusdTxfYAMQW38GmduegLTkuKdtgELYbVNp3JWwQ0Km1IbFU4iUxfM+h
	 s7rmGJvrWg/z4exeSeZMZGIZNRroEt02VaVUDTAgEPvWgBUz5BnTGLGm3+9FvQ2s+Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b9gfoB+o;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F22606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97F22606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b9gfoB+o
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso30505205e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098233; x=1793703033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4adVsWvCwnIpJJt93PRS5T7YpoxyqUlIHXUw1J57LTk=;
        b=b9gfoB+o7VWJCqCJ+NdolLm3Sp7t6MwNXHwJ1ky8eo0yrJqzwMUxvf2v3A8T82RnqU
         KhjA53zMCe9uVGqjlnulcEuBK9Kd4eQZpxf3CMZcJhBQP8FaNSR8zE2OkpUAJ7Cb6gE/
         aCAU5UQT52KUIZiQ006KR0CTX9zfAQrB3D04P69fepaBtY9EC0ppy8vuUyJ1DIcBN1bg
         sZp2h7eZ/RnRSz8LLmpqKhPhezAj5wufTRF0yruG5iMkzU1NvXcL8TFQQvrkrjHScj2L
         C+rGmwOXf2lzTiCF9qviB8cLYYv2lj8bHUYvITMIQ+xvWb0shOwgQUghjKUXzNFrsH5K
         X1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098233; x=1793703033;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4adVsWvCwnIpJJt93PRS5T7YpoxyqUlIHXUw1J57LTk=;
        b=TXKAVmjCyIuGPCLKbRKUbMbyeTwTMqmVr8DjjoBKT1Jz4rxJ/oR9nB7pbgVDUitx83
         c1YnrwTpywFeyD+6W0LBdUSO5sTo3iKIV3P47ndmVMi1YyLCEyp7hdSxVCXoKX8AHD2B
         LyC/1D5y6QehaZ8SEZ0DYVC/GSnwlzO+SVcdWoQCK5/AWZYQTPfgxBFAMjlNjfklm0d0
         MDM+AwM+bxFlVGbrotQFkFYCYBfgOa8ZoMWN1/Q6bpC4+RLCZbvuArEj2Ot0ys23QL8K
         ACAiHAKParFCG2A8k/SadspHkBfQ/BaGEiekIXPHFHr9HQQg+kZl8SYiDLq4THF5WnQb
         fB0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxeoFid3dWUCKA5okGlPA7puhIUcdshyiR8wEL9IBWdUYRAgWIAD/1dm4dwedv9Lg2u4J7PpbxtdfcomwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV/hMoJaP7gP+3ccWnDeVWAnH+/UdOxNRSKfCek5A1hUoDsgL2
	4UNJi0QmKphJ6qe7BMiReXDJH1tscT7Flw4Usj2yr0Q1VBnbMBJpGPET0P6bLSD8PVI=
X-Gm-Gg: AYBFou0VJtp4E6fCC73zHOmy1QFR6qv9or+PhDnO0spV3ciKzFlA4eYHAPX/XupGqxY
	a0pjLLEG1Gs7UiJRBKH6b4N0D8ITzHzagvJHFdQsxLCrKrLu2wa++nTFL/llwm2dfWcrK2Ipgoz
	Vh3ChRrMTwVkr/UkCMBW9up3tXmQU36I0AGt2C/O4Ih7oqv22d+B5Inv8QXFkiLAP0I3GoUqhvf
	KXI8mQECzBd5LkhX49j5Cprvybrclu1geZ1kwXdBbOigh6rkCpFbd7/7JIs9If7w2mU8rZecYzc
	/X0wArJQFEVP3I5Ko9uCcLRYUi9tnz5NHLm3jjv/sCiCl6b5QhB/P9xvuTLJh/TWsZAPsgG4vOC
	/u6gVBRgL5qqOAIt+r3wmaStXZXhnK3K0marGKeD4bUcJo3fkeN1saOB3Stb45wpXFX6tr5kthq
	SSiJgyEU7Ueq4SdkKqlobqUSaeHamZVnfgdLG6WdFhaNmayB1bpIP82PGDYk8qXYHzpYoA1IaH9
	8qm4f9Yt7hZYopm3R8D4dDZ2mHO9py9Q+9F6LEZ/kZqHArMNoZdwUeX1xfnYr+8E4WUCxh2tlV5
	GFCZ+EdLTi+xC+itpjwtOkvHVOhJbF9Jo12ZrY1zNDI=
X-Received: by 2002:a05:600c:1c2a:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4a35ac3a7d9mr227019265e9.4.1793098232940;
        Tue, 27 Oct 2026 03:50:32 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a59d998sm268125005e9.15.2026.10.27.03.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:31 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Imre Kaloz <kaloz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 09/23] gpio: Add missing OF module annotations
Date: Tue, 27 Oct 2026 11:48:46 +0100
Message-ID:  <b6c43016f56d02e677882593fe65299e1e9eafc0.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8374; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=b5pi5xl+kxvGrrMo0xf3jv+6NH1f6TudTfZTf7EULKw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGs3OjUKwA8bEe0X0CflQEKKzapR85yUOxWH v4WAYS3rJmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBrAAKCRCPgPtYfRL+ Tk8yB/4hS+qKvfkDuAtfIpGNtQCETOAx5U80IQ1TuEJcChZWIuuLnf7Mw5RV1wHKxMrYkbwQEp3 NIOycahH+Z55MZ7GTt//gDepz5DBOVbq3huGmSb1Vkiv9OCT4hBx42tN1XO6yRg/+/oJRI4l5au NhwQ2tfL4vD+wV656OATjpt9egJidyAEu7sM3cuzB1H1ZZeRsLrXeXDAZ9uC5vfYE27FCeIyVcu GR+OUkybujhuIAeJPjccBx6sW73vwE+2jQfPgKwNNV153JsdHLE1xzymaoXKzLZftAYPQUngWsz weCSYWoTQpAHdXgxaVSyqO7UWyI2K+bb4GuZVNw0uYEwzWIB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using an of device id table is supposed
to declare that in the module's metadata. Add this information for
several drivers that failed to declare these.

Acked-by: Daniel Palmer <daniel@thingy.jp>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-bcm-kona.c    | 1 +
 drivers/gpio/gpio-creg-snps.c   | 1 +
 drivers/gpio/gpio-ep93xx.c      | 1 +
 drivers/gpio/gpio-ftgpio010.c   | 1 +
 drivers/gpio/gpio-imx-scu.c     | 1 +
 drivers/gpio/gpio-ixp4xx.c      | 2 +-
 drivers/gpio/gpio-mpc5200.c     | 2 ++
 drivers/gpio/gpio-mpc8xxx.c     | 1 +
 drivers/gpio/gpio-mpfs.c        | 1 +
 drivers/gpio/gpio-msc313.c      | 1 +
 drivers/gpio/gpio-mvebu.c       | 1 +
 drivers/gpio/gpio-nomadik.c     | 1 +
 drivers/gpio/gpio-pxa.c         | 1 +
 drivers/gpio/gpio-spear-spics.c | 1 +
 drivers/gpio/gpio-xgene.c       | 1 +
 drivers/gpio/gpio-zevio.c       | 1 +
 16 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index b0beffe48b7d..9bcbee25f685 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -522,6 +522,7 @@ static struct of_device_id const bcm_kona_gpio_of_match[] = {
 	{ .compatible = "brcm,kona-gpio" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, bcm_kona_gpio_of_match);
 
 /*
  * This lock class tells lockdep that GPIO irqs are in a different
diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index 157ab90f5ba8..2e159ea41791 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -131,6 +131,7 @@ static const struct of_device_id creg_gpio_ids[] = {
 		.data = &hsdk_cs_ctl
 	}, { /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, creg_gpio_ids);
 
 static int creg_gpio_probe(struct platform_device *pdev)
 {
diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 8784e433e1ff..278b1093dd22 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -377,6 +377,7 @@ static const struct of_device_id ep93xx_gpio_match[] = {
 	{ .compatible = "cirrus,ep9301-gpio" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, ep93xx_gpio_match);
 
 static struct platform_driver ep93xx_gpio_driver = {
 	.driver		= {
diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 11e6907c3b54..e29df8d5e571 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -323,6 +323,7 @@ static const struct of_device_id ftgpio_gpio_of_match[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(of, ftgpio_gpio_of_match);
 
 static struct platform_driver ftgpio_gpio_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index 0a75afecf9f8..3ebd3d73ed58 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -114,6 +114,7 @@ static const struct of_device_id imx_scu_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx8qxp-sc-gpio" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx_scu_gpio_dt_ids);
 
 static struct platform_driver imx_scu_gpio_driver = {
 	.driver	= {
diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 669b139cd499..88d48cfc9017 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -341,7 +341,7 @@ static const struct of_device_id ixp4xx_gpio_of_match[] = {
 	},
 	{},
 };
-
+MODULE_DEVICE_TABLE(of, ixp4xx_gpio_of_match);
 
 static struct platform_driver ixp4xx_gpio_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
index 00f209157fd0..192b3e63ea3b 100644
--- a/drivers/gpio/gpio-mpc5200.c
+++ b/drivers/gpio/gpio-mpc5200.c
@@ -180,6 +180,7 @@ static const struct of_device_id mpc52xx_wkup_gpiochip_match[] = {
 	{ .compatible = "fsl,mpc5200-gpio-wkup", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mpc52xx_wkup_gpiochip_match);
 
 static struct platform_driver mpc52xx_wkup_gpiochip_driver = {
 	.driver = {
@@ -342,6 +343,7 @@ static const struct of_device_id mpc52xx_simple_gpiochip_match[] = {
 	{ .compatible = "fsl,mpc5200-gpio", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mpc52xx_simple_gpiochip_match);
 
 static struct platform_driver mpc52xx_simple_gpiochip_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index a6868f673831..ee35da06cbc7 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -318,6 +318,7 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 	{ .compatible = "fsl,qoriq-gpio",   },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mpc8xxx_gpio_ids);
 
 static int mpc8xxx_probe(struct platform_device *pdev)
 {
diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 7f0751d7b1c4..1078b3018970 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -295,6 +295,7 @@ static const struct of_device_id mpfs_gpio_of_ids[] = {
 	},
 	{ /* end of list */ }
 };
+MODULE_DEVICE_TABLE(of, mpfs_gpio_of_ids);
 
 static struct platform_driver mpfs_gpio_driver = {
 	.probe = mpfs_gpio_probe,
diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index 7345afdc78de..38932986dc36 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -688,6 +688,7 @@ static const struct of_device_id msc313_gpio_of_match[] = {
 #endif
 	{ }
 };
+MODULE_DEVICE_TABLE(of, msc313_gpio_of_match);
 
 /*
  * The GPIO controller loses the state of the registers when the
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 267e6d5bacd0..d433b8a9e230 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -993,6 +993,7 @@ static const struct of_device_id mvebu_gpio_of_match[] = {
 		/* sentinel */
 	},
 };
+MODULE_DEVICE_TABLE(of, mvebu_gpio_of_match);
 
 static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 {
diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 208fed631975..90293329b40b 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -719,6 +719,7 @@ static const struct of_device_id nmk_gpio_match[] = {
 	{ .compatible = "mobileye,eyeq5-gpio", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, nmk_gpio_match);
 
 static struct platform_driver nmk_gpio_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 3ff21e899278..fa2087acc025 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -583,6 +583,7 @@ static const struct of_device_id pxa_gpio_dt_ids[] = {
 	{ .compatible = "marvell,pxa1928-gpio",	.data = &pxa1928_id, },
 	{}
 };
+MODULE_DEVICE_TABLE(of, pxa_gpio_dt_ids);
 
 static int pxa_gpio_probe_dt(struct platform_device *pdev,
 			     struct pxa_gpio_chip *pchip)
diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 96a0e1211500..3099deb2b290 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -157,6 +157,7 @@ static const struct of_device_id spics_gpio_of_match[] = {
 	{ .compatible = "st,spear-spics-gpio" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, spics_gpio_of_match);
 
 static struct platform_driver spics_gpio_driver = {
 	.probe = spics_gpio_probe,
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index ad0f1551c271..b34b0c58b67c 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -191,6 +191,7 @@ static const struct of_device_id xgene_gpio_of_match[] = {
 	{ .compatible = "apm,xgene-gpio", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, xgene_gpio_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_gpio_acpi_match[] = {
diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index 288a86c8294a..f1c5c6a20673 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -213,6 +213,7 @@ static const struct of_device_id zevio_gpio_of_match[] = {
 	{ .compatible = "lsi,zevio-gpio", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, zevio_gpio_of_match);
 
 static struct platform_driver zevio_gpio_driver = {
 	.driver		= {
-- 
2.56.0.rc1

