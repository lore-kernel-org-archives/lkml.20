Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047320;
	b=iyvWh51rHBHteHVk7EDfAp/nxHTXC+UWoILru9bFvSjRydxLZSNjWzyU71wNGQEFigFH
	 mgVYDqRSyFpQRgtwo/We0peJePs8g2VVRO33JNTmKD9hVqYOLIPMlZSHOoeGgYplsoSv+
	 E/Zrc0gb5kQtFkcGpLCzXwAmexx87XCyTvZES0PwfvpXTTx8EUlHyd/MPrJAN6POTqDvV
	 EVczgVpnmgL5uKDvWG2431QBcroWq9goRdWsbpIwa8ezGlYIZBWdovpNxH3LwYGmY6HTF
	 jsB3ewjJxxiDe63Prp+vxA58H/W/P1XKLItvisZCh8EaIrr87t5Gql6sI13XX6gl1jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uNPrYlA+DnonfWUvT/WXv31GUY54FKsXFffmLPGjc3U=;
	b=JpuzZOC6nqNjVL/H5dXG0s6nCE4P4BLUrWXx3Sp/bdpYe50hVEDowTc4fqY5Kko6yLRU
	 vgkT5/a1BwEZvA6lgLnn79YAc6l7GOldOCkcWG8GclGlvuOyXk1dwD3cup16E3rfyWUJE
	 IL90u8sNaQjWd8Be4zYMlr7CGeoo/wFS2wNKQ0DGh962n8X9xDIbFM/HWJxkJPjA4sG7O
	 B/CWn3LBuFQgddjsDN25sQanjUdYWtdzAKQJyICxPuBBqqieevg6b5YZpqolMwewv0HIT
	 UjyqluvDvklRFtgCxic77tI0o1rmlBkRuol7+ks/4f8QSGYJdyHE1D92sW+CVO6adYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D2u1l+51;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9758606A333
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9758606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D2u1l+51
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3214837f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047318; x=1793652118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNPrYlA+DnonfWUvT/WXv31GUY54FKsXFffmLPGjc3U=;
        b=D2u1l+51ww8RaMZptAI7B2SQPsbabz0R1hDbaoLcihdpMnClUig+O2jy2SiOn6eCJy
         JP0e/6Y8IEo/e6RUNAR5tjAWURStvxGEa4z/0tw6qzs1npH1Oac7ytoJwqXL64BQOHZ5
         eXjxwfgAztA1AqLXQypQ96peyGJb+MBQhTCDHmUZfWXT5IcMmtlIlx1vmH2qfFdHEfgJ
         uj59hHB7bYa9KpH08mXvwZi7Y6sCqk0LWrOry9IUWjW4edsqo/avSYZ0pMS06WjSmUbp
         1lXiuqrDhTiatpBYX9dANzQ4xNyajc8C2+bgRsJE/6IKDJi3DdtJLqWeonuvPpgw8Gzl
         u5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047318; x=1793652118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNPrYlA+DnonfWUvT/WXv31GUY54FKsXFffmLPGjc3U=;
        b=raOHIEecmsWBysbrJ90j0vetgG/e/0h+OmM7isN5fEyCPCphtsSvNezYVigwv43jww
         k7X+ygtGHL/RUhwQjWvxkBn+CeEIITuk82PjCW+RGRxZ7GkDcHHk5Fs36ZN035zqQghr
         ukrv1f8/UA+Fv/jovAw/YQhrgNgKmck6TiJsOeUyHr/x0QabiBfhADbxwzVnVmc1SzNP
         W18cel6gv2a/KeHNdfNt63J1KRVG9/1q+e1RNtq1mG2ftS4V7rh1kwZgRbiDqpbvYOqT
         lIMFuuRJz1qmpqz29+mHvusrUd7YQDWheDNlyA9R6v5HC9V1ChuwjT11XQa04lddD1JB
         Kmig==
X-Forwarded-Encrypted: i=1; AKwUvBwfja43bRn1W14YX7BjwxQtV7t+jtCZdZD8E3+8/GERU4S3CLVzV/Jsjxf7EYSCsVc8TqVISed5zvUiKbA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN+RDRjWIj8yXltMLdip+J8S7U8FCiQWj+bxNFuMfX7+DTuU9l
	goRB5DHMrTWfUIdFy3hnZoMdzpJv2LXOrAM+XTJLIyf+48NqwRgvOZcg
X-Gm-Gg: AYBFou0LhyoJQi/qA8R9RfYZQ8uFaOqp/y42l8zrDPDz3E4mihKBL0JrInmhUyKMrZy
	iDNuuM2l/j3WVa/J2kLEUZhscV9cyIkXXJMcZb4CwFLDsfxB33OlBDHXb85NWuZW2vZoSAJfUJV
	pSAcSlmwQU3+oqDZjzIJuD5xXzeSrzCrRpdlFdwBVKIJGIYNZqXtm6YlBPP6WsMOSCA1D5s7FwC
	fH2elV+EXmICjhySZQ0GpNpv8dLVeHixOVBhsz5+sR3qbIGYreJ4OYBQwDundDlKJi2WXvCcGmQ
	3z2342TV1WEWSB7aKIz7sXPH1IK4I7MubnjSMPphCkWkouI8zvtqIUmYgEaKcwBRWw9UAv7TPoa
	450S3pxsuuOHknZn5ux9l8Xfb3ApOSCG5S8o0n7oAowwCo9F+0hoqjfESW560AcCI6r8wAd5792
	Zs/5Jra+bts1bHaN5ZV/k2/dD0Kl8y2dV1I1tvr0Drly41HprZLycf/mBic6aq7rBhResD2iXPA
	oT3acs16Ag25XrzXpJvcHnVGCQ1rbj0j6jl1crQtZa6mYo6FzRZ/AtGwonoitxXP8EetAm4EcL6
	afjyrnL4YMG4UiS9C9kfS4XhC9nY3+bROePu8OuHSENrHQys5vf74kk1EB3F3LOVYwosO6xikgo
	UnPKU3LZOkO2DckZXvcolMpv24e3s6NRXoLvphrEMzCJfnBtKtZMgBEO9o6EnrTGQiyoxE1IHt4
	Osf6pv
X-Received: by 2002:adf:f284:0:b0:48e:2980:d396 with SMTP id ffacd0b85a97d-48e3eb8d6a5mr12409485f8f.37.1793047318143;
        Mon, 26 Oct 2026 13:41:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm19053152f8f.10.2026.10.26.13.41.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 13:41:57 -0700 (PDT)
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
Subject: [PATCH v3 2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
Date: Mon, 26 Oct 2026 21:41:54 +0100
Message-ID: <20261026204154.26378-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
References: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
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
Reviewed-by: Henrik Grimler <henrik@grimler.se>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 41 +++++++++++++++++++
 3 files changed, 45 insertions(+), 3 deletions(-)
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
index 000000000000..8a18e65de30c
--- /dev/null
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
@@ -0,0 +1,41 @@
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
+	samsung,audio-widgets = "Headphone", "Headphone Jack",
+				"Microphone", "DMIC";
+};
+
+/* No expansion header with SPI */
+&spi_1 {
+	status = "disabled";
+};
-- 
2.54.0 (Apple Git-157)

