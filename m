Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136607;
	b=U2fa5TfWC/xTB9+7F/UhWs+0geJhi6T6RguZGLnWTWlahGoMvIVMm0RvFa+OiwVIW7yo
	 5EOeVollo/RPazTW6WNfFM1ITvuNUs+uT7QETW4vbuTKeU1C+UUnmj3TX4nUWDW9aUAgm
	 f8eQEMuDARpolqEt7NcdShZeeoHwMAHHdhrPAUdlovBzfr8hXZ4NrUO6aDpT222DUXbN5
	 3XheRYQDaVQfe11HRuBoYcGJOSt2rKjC/LfVhEonrdpajfR3zNoFFmPJHwtDrOyr6i8R2
	 /m1TreJPp5dDofXpzyxrtqaqKftaPt4tirbi5lvqlpUgrcKZND+m+gjK4s+atnqNJkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OiJECdRwrBggLX0qC5GoLm74oh31RZcT2ypnA2Xk9xY=;
	b=HclTaASIG/zGZ4ib5vV28UuOkcVeCADHgGEfJQ+Leim1TWwyLm5lAM5itwFNwP9o+x2X
	 tg2Ye3eGXozL4XFIUebWoOT78yoH+zAFOXa+f9g7S9YhOuylei6ne2iyAnBpmnrj6I79P
	 KDlyrEwCQY9g6Mu0OKlZcmgyRy5DSAL6dIclFtua9C0KnM7BBxSeClwabIuL0Qw0ZT5xX
	 TIhEBiMx5FOhEZb7E4XJBmJmUh7uahPpxc5nZ4pvD6PhCcBdORY37MCTSAMAIuFcvOcOv
	 ytZVlb+dyjNR89fwWQfe1Cqw484CS01a0BHBkXGYWGtuVbzCkvB6Pwq7+z+Hx4KjtVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dHG7Pmec;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA270606A333
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA270606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dHG7Pmec
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-188406bb948so252454c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136606; x=1793741406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiJECdRwrBggLX0qC5GoLm74oh31RZcT2ypnA2Xk9xY=;
        b=dHG7PmecE16x/RcVjLseOKKCtgaHBa2if6/USFFopGtvDk4YtOlweEuZGK67QVEshx
         IHfenRRtxKW8gga1r3GzsxR9cvvks1X4EaGGhljcjMQg+1G8s/dEx1pppjNH5a2A8XjX
         fj4Ndm5ij8sRuU/goam05fnC7qwQOaQ08js2WJttdem9dCxEVyVlDmEUdIPavHh3UKzB
         TPiFzhKEl35B/Yzb62Jzar7s72XmQsOAozrmNsqfdgpQzhYO15+9tKYc7JEAG/9PVSZU
         WZISR5NLziJMUKlX2opgIxmmOLiGHTjfjkAgNDbfnLxspuR/0ik7JPV5NSu/EUiLR8GG
         XTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136606; x=1793741406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OiJECdRwrBggLX0qC5GoLm74oh31RZcT2ypnA2Xk9xY=;
        b=NLVNTfiu057Unt+ydUfXGBxgBynReWTRpVucPezshEBdVHKBuYW2bfRG80bXh9s1hd
         ZPxVLLWjcfbCDO8+KN6JtnPwlIDce7cKkyIVYAZmUPszgQTMJSfmr8qX1ULZ1DnjpTOb
         Yf6cX0mtQJjAY9YELm3d+WS0mbF0JCHOYKd+slmM/xmR+6aCVkdrWNwK9oDB/VWXp9BO
         mzsNcbrGPuDS0bxTLlrzMdpX0iSxOTkFz5HWA2quCGmzrErSrSr84zTxEJQoNFJyDVlF
         5R9fnloeqoAFdwBkBomoXCbAfdKx4o0faD5bhkyf2dE4097GxolUTjEpvW/56YdY/sxP
         GkQQ==
X-Forwarded-Encrypted: i=1; AKwUvBz46cAuSVFaIjOz9cFp/CDpfnTPRQtwilSdcWov5F5dK/7/XlGXvBDNmrVkYt/O2FdC4xyAxIRxNsZR1y8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJn7Df3m9F0J/t5WxTQaLGpDXHlbwmLzJJJ218IsZwpAJBgA0l8
	Farm2DrlIbMtqtwXRtL2F15yv5/WPiG28E+t0t0gJPJRO7uL9AAw3LkF
X-Gm-Gg: AYBFou1ZPIVM3yVv4Q2614xy6Z2AuZGa6xb3HgIbB7oF7skQw8MaFvStNHJLScPRs2L
	d8e4jPn/xSMGnxOfLp+YSs9nMkm9hfD3kNNZbIha6QQ+RjNO1+mV1QKeLuNDIfxoXcD95svdyw6
	em/xHvkFSTJDuSlyfUcxij4KnGgRYqz/swuP1rQSNVsB3/N4afZf1LdGu8S53gqtp27u58Dp9vg
	vCVNiYLnWy1vEtBFVln2/ItyA6QgWELDHYfZ8sdyqm2EVMEqwfKmGaQfMXqsOt7JJOwrXMUh7yc
	algKgvJ5kb5zDeKkBAJRio05suP7cI+Wy1LeXmEKemLa/0bg7eB9nv0bntQHbhn28KPzeebGT9N
	OgYncLHLIapKxKMt+y6CdagCxno+eWfMHyfOksTA+XZTDKlFzEIpNni/UvyMYdiNQbMEj4LyrxH
	BpSFdZ+G0AWfaBsP07IOy2MqNKE+8KvwIZiaKBipbVxX9TRmBlXt40tfNwpMEW5N55yYUvQj/am
	8/vScKkExBJOlc1qcECfuvSB3VosCm25AEpMCQA0MmKu6C7YchM2HzAlsZDRNWxhEIE4QSMXYur
	FBpsNGWHmsK7M7cb9OsdjJEwmtuclhvSU7X0d2dOsr8A
X-Received: by 2002:a05:701b:250e:b0:15d:f053:18b6 with SMTP id a92af1059eb24-1a6cd77ed7fmr527467c88.9.1793136605933;
        Tue, 27 Oct 2026 14:30:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d7ed488fsm723725c88.7.2026.10.27.14.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:30:05 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 27 Oct 2026 14:29:56 -0700
Subject: [PATCH 2/4] ARM: s3c: crag6410: drop unused CODEC_GPIO_BASE
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-crag6410-module-swnode-v1-2-2f885799b6ad@gmail.com>
References: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
In-Reply-To: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

No consumer references codec GPIOs by global GPIO number anymore.
Remove .gpio_base initializers from wm8994_pdata, wm5102_reva_pdata,
and wm5102_pdata so gpio-wm8994 and gpio-arizona use dynamic GPIO
base allocation (-1), and drop the now-unused CODEC_GPIO_BASE macro
from crag6410.h.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/crag6410.h             | 1 -
 arch/arm/mach-s3c/mach-crag6410-module.c | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/mach-s3c/crag6410.h b/arch/arm/mach-s3c/crag6410.h
index f39ea2ca7a75..1fc7a8598c76 100644
--- a/arch/arm/mach-s3c/crag6410.h
+++ b/arch/arm/mach-s3c/crag6410.h
@@ -14,7 +14,6 @@
 #define BANFF_PMIC_IRQ_BASE		(IRQ_BOARD_START + 64)
 
 #define PCA935X_GPIO_BASE		GPIO_BOARD_START
-#define CODEC_GPIO_BASE			(GPIO_BOARD_START + 8)
 #define GLENFARCLAS_PMIC_GPIO_BASE	(GPIO_BOARD_START + 32)
 #define BANFF_PMIC_GPIO_BASE		(GPIO_BOARD_START + 64)
 #define MMGPIO_GPIO_BASE		(GPIO_BOARD_START + 96)
diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 471a1ea967e6..6443c816d111 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -217,7 +217,6 @@ static struct regulator_init_data wm8994_ldo2 = {
 };
 
 static struct wm8994_pdata wm8994_pdata = {
-	.gpio_base = CODEC_GPIO_BASE,
 	.micb2_delay = 150,
 	.gpio_defaults = {
 		0x3,          /* IRQ out, active high, CMOS */
@@ -249,7 +248,6 @@ static const struct i2c_board_info wm1277_devs[] = {
 };
 
 static struct arizona_pdata wm5102_reva_pdata = {
-	.gpio_base = CODEC_GPIO_BASE,
 	.irq_flags = IRQF_TRIGGER_HIGH,
 	.micd_rate = 6,
 	.gpio_defaults = {
@@ -287,7 +285,6 @@ static struct spi_board_info wm5102_reva_spi_devs[] = {
 };
 
 static struct arizona_pdata wm5102_pdata = {
-	.gpio_base = CODEC_GPIO_BASE,
 	.irq_flags = IRQF_TRIGGER_HIGH,
 	.gpio_defaults = {
 		[2] = 0x10000, /* AIF3TXLRCLK */

-- 
2.56.0.307.g5fe7bd680c-goog

