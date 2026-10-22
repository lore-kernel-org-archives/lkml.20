Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648338;
	b=KZJBP+zHMTaZ+melso4AM8ti5X39nlOIGQhNlanKbZZYT/xgTsecYPgihBxR2jwxbPhn
	 fg/HA7VxppGlwst1j17j9ts1zxELOrADZQ4qXrO+keuGefYGkny2PMgXA1UCr6Tp3e9+h
	 eZJznb4m3QC+lcfkyeHxazpJNv4753AknV1hRdBLOU0a/4s/hYwV+Aq9VX0PA5IvpeXyg
	 kvw61WuUW0RKnvY4F2NR7Te3CtFBJ9J4ZgdzDxBN7sJvY7ELWofapzJoxs+/W3+EohTbZ
	 F88VGWZpr/uwdHODf2ja/GIBheI910tUVVdFtCLX6g0/9TRlnInn+2Ba1QWeCdQ0Ivw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K2tWmEOG35vkyGU1OZ0Xjhu69P/i4beeqfklVuj2BQQ=;
	b=qeBRqTviyjwAeQFZGaeHKD9LdwYxCXd0L/KXjmTkef6FklHHOOKJbwC2xW/FDpgus83Z
	 GTHAbUsqalz7hEuY+8kKNHq8z0aCWI3iVezIYO/PQbNjF1BvAS5yVVlBiRAhaOqH+2dOk
	 lgU6iFwm4het8cHMAyHjMDBTFT8ciIZBCYoBUHFaVItSc9Sxq+yxUOvNnN6ixtM+v9MjE
	 IXrYE/ni2pSZW06i2geLkRHbtecrN518aMqiuZAgDJwutY1Cmz/fwaGFZloYbjWPVeLdU
	 rfOn71nhZiKa7/Nl4NwYFMJRFxp5WZzDKdvYjWoklpnNsJmLs6QbH/G9GFK/9VEh/fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lQRJrQ8o;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5000B606A331
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5000B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lQRJrQ8o
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so5546015e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792648336; x=1793253136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2tWmEOG35vkyGU1OZ0Xjhu69P/i4beeqfklVuj2BQQ=;
        b=lQRJrQ8oSQIwG/TXADRZHwRmstT2q0TjO16z5OTT96fmiSQTd6o12ffxSGR9Qm068g
         pzhv7cqhlV9Tm6x6a+mTnPC9xRfu5h4TzAjEzHY8703+lU+B+7qeggJFI1clDAyeY0Ol
         ANVMXtQYhkuh2vlxoDnD7BQ1ZQzv4vG4iXoZ3wWz2mcEUob133f+4o5Y4kIl+v0ky83m
         eq++273wj+UbHBLwRnP4bh/ClwzKslu5w4QY5DF5ZNER68EBHe/mgcYTjGoMCC9rC/tX
         A+nWzqak3oSm77fUD4DsbcSu9m3zTtzMpRUvntZ5hcgMrXCe6TkubULCoXce8uf1SzuM
         cxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648336; x=1793253136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2tWmEOG35vkyGU1OZ0Xjhu69P/i4beeqfklVuj2BQQ=;
        b=XtKxkgPueBDXufvdum+w8cUbLXlIanf6e7rUSVmLjWjwXGNKsP1wL5lf8D+BwagHhr
         NEU5ofqD3F2CaQXR0BA2aNDQvXV0/X/9Gqn+pLvehXIYm1Nd148QZqANzqxrhWk114o7
         3X3jUSoRVIJGdSDPopYy+l6lE56do4r5dM1gf/VBiPXQu1y7bzizZmOfZkbfy6Iv+RTC
         OBCLmCE5HaTavLsH9NlVYtiEakqjEBEKxayPJi/zhjg4aCY0BD3LSfv1qFrYr+4x7+fM
         2SoirhCxG62jjtlrI3EaamrMhpfugilpOMkiK+Y/6p8VJr4x3rKNkba4ALpAJiN/62Kx
         14FA==
X-Forwarded-Encrypted: i=1; AKwUvBxXEPF9LVq0P3HT1xl2v2GGxplnpyduNjDWkEo5RVALiqaSWKlsxI4uJP7h5qFPXWslaUmgsFS9tUZvjm4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaMjvG19My6oxLOUj3e0gy2P/ngawcLRHIAkKhaJFglSBJKnFF
	5BSDj52nmChOUX59lFfuawyxWCf3urlEpHVP3lXm4fRE1urTa7sJIv4zEWqbOqbG
X-Gm-Gg: AYBFou3Mt+iL8Q8mYQmxZOUYPuJIXWmbD4KggJhhxzbD9xYvz7KXSuAduQdQcfLkdd7
	fAXx/mvgnxN1MP73/0QY+LHJa+3ITQyEGmAeXBD5w2SbnIYzTSg/of7X+QND646ZXHXGCVdLh7p
	CY0kZMOsFvaUJGFP7xhe/2irlhNTfABbKC/TU+8GQUR8ABq6erP3BFBB3iO4753JZXI8xWZWEe4
	x2vs9PPKevTDR1s62Ok0TQyYaHL7YpB0DTjhnrOolejx+1Dp4xsnMNcqWZKkYAaDSGnyUdv2NLw
	10rxw9VgV1hdLjujv6sl3CkNFIAcIk61ENz96CIBJaAYxc/Q3hD/ha2el0JhQ4BT+lZHF5u6NPd
	Aw2IbdmDcrQbK4fYjgxYGlnfQXAEHNv970VWPlJQcxhgPSxrfrKX3iS4LJ3J65LYghI2iteCKxE
	lb8Mb3eB9U6aozQp26nrNV30pby+EiqS1dJYzpjFw8wHNF/BLlMvNEjwLQZtUHWl7CekS3nwyb1
	j5OpFpHhZN97qA1xZFdxNSJ1YvJwBBdd7BGK3gNPPNuifMoIwIJE13jnldFgyb6AiWs3Vqwkdj6
	FE3MIKnGLRL5YKh1ld2+Fz/fEbrib9didiDURyFpkMILObbin0wVXSw57HKBhJN91nyj7X6r2Xy
	RC//aQ/CefDHRtHAyC5n/Hxqn5hndgZRLFVfLR/GqXa6bSyKrfVFHBnAW4GVxKF9Wd4R6UFyIOw
	ML5M6V
X-Received: by 2002:a05:600c:a49:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a204b20321mr25966005e9.11.1792648335601;
        Wed, 21 Oct 2026 22:52:15 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-a0a3-b57b-feb7-50dc.ipv6.o2.cz. [2a00:1028:8388:a84e:a0a3:b57b:feb7:50dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm41312875e9.0.2026.10.21.22.52.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:52:14 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
Date: Thu, 22 Oct 2026 07:52:08 +0200
Message-ID: <20261022055208.17746-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
References: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
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

ODROID-U2 is a single board computer from Hardkernel based on the
Samsung Exynos4412 Prime SoC with 2 GB of LPDDR2 RAM. It is the
predecessor of the ODROID-U3 and shares most of its design:
- microSD card slot and eMMC module socket
- SMSC LAN9730 10/100 Ethernet on HSIC0
- SMSC USB3503A hub on HSIC1 with two USB 2.0 host ports
- micro-HDMI port with CEC
- MAX98090 audio codec with a 3.5 mm headphone jack and an on-board
  digital microphone
- MAX77686 PMIC
- 2-pin header for an optional PWM controlled cooling fan
- blue heartbeat LED

Unlike the ODROID-U3, the micro-USB port has no VBUS supply switch, so
it can only work in peripheral mode, and there is no expansion header
with SPI. The 3.5 mm jack is headphone only and the speaker outputs of
the codec are not connected.

Add a device tree for the board that includes the ODROID-U3 one and
describes only these differences, as the ODROID-X2 does with the
ODROID-X, and update the comments in the common dtsi, as the LDO22 and
BUCK8 constraints are now also used by the ODROID-U2.

Also route "HiFi Capture" to "Mixer DAI RX", as on the ODROID-XU3. The
odroid sound card driver adds only the playback routes for boards with
a single CPU DAI, so without it the DPCM capture path to the I2S
back-end is incomplete and recording from the digital microphone fails
with "no backend DAIs enabled for Primary".

Link: https://www.hardkernel.com/shop/odroid-u2/
Link: https://www.hardkernel.com/blog-2/odroid-u2-u-schematics/
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 42 +++++++++++++++++++
 3 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts

diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
index e0143ee8c82d..2a173e4b3e1a 100644
--- a/arch/arm/boot/dts/samsung/Makefile
+++ b/arch/arm/boot/dts/samsung/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
 	exynos4412-i9305.dtb \
 	exynos4412-itop-elite.dtb \
 	exynos4412-n710x.dtb \
+	exynos4412-odroidu2.dtb \
 	exynos4412-odroidu3.dtb \
 	exynos4412-odroidx.dtb \
 	exynos4412-odroidx2.dtb \
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
index 93ddbd4b0a18..b56b92c78c1d 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
@@ -414,8 +414,8 @@ ldo21_reg: LDO21 {
 
 			ldo22_reg: LDO22 {
 				/*
-				 * Only U3 uses it, so let it define the
-				 * constraints
+				 * Only U2 and U3 use it, so let them define
+				 * the constraints
 				 */
 				regulator-name = "LDO22";
 				regulator-boot-on;
@@ -486,7 +486,7 @@ buck7_reg: BUCK7 {
 			buck8_reg: BUCK8 {
 				/*
 				 * Constraints set by specific board: X,
-				 * X2 and U3.
+				 * X2, U2 and U3.
 				 */
 				regulator-name = "BUCK8_2.8V";
 			};
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
new file mode 100644
index 000000000000..bc14df9be9f7
--- /dev/null
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardkernel's Exynos4412 based ODROID-U2 board device tree source
+ *
+ * Copyright (c) 2026 Josef Schlehofer <pepe.schlehofer@gmail.com>
+ *
+ * Device tree source file for Hardkernel's ODROID-U2 board which is based
+ * on Samsung's Exynos4412 SoC. The board is the predecessor of the
+ * ODROID-U3, so only the differences from it are described here.
+ */
+
+#include "exynos4412-odroidu3.dts"
+
+/ {
+	model = "Hardkernel ODROID-U2 board based on Exynos4412";
+	compatible = "hardkernel,odroid-u2", "samsung,exynos4412", "samsung,exynos4";
+};
+
+/* No VBUS supply switch on the micro-USB port */
+/delete-node/ &vbus_otg_reg;
+
+&hsotg {
+	dr_mode = "peripheral";
+	/delete-property/ vbus-supply;
+};
+
+&sound {
+	model = "Odroid-U2";
+	audio-routing = "Headphone Jack", "HPL",
+			"Headphone Jack", "HPR",
+			"DMICL", "DMIC",
+			"DMICR", "DMIC",
+			"Mixer DAI RX", "HiFi Capture";
+	samsung,audio-widgets =
+		"Headphone", "Headphone Jack",
+		"Microphone", "DMIC";
+};
+
+/* No expansion header with SPI */
+&spi_1 {
+	status = "disabled";
+};
-- 
2.54.0 (Apple Git-157)

