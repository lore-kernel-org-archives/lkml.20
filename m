Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378161;
	b=ygD+tZ2pM6AlzsrBEdZb3c+rkAu7uYwUW/WPwsAXjP7o02BW4amMd/pBj24j9juKxFW2
	 83TrcMxlgO3YnuPCsUDZozrPTfbYfQn8ebljmhPrdqEsnpMgADSj+YukyIScN4qdpVVpy
	 lJbWp+lxV0OeMCnGPtVLnR9F7sGZrW7VF2TfkzxGLFlA4jZmnsYsvsoeMv7bPNhObsFvg
	 4uy3uRkOngzZ04PR2hnd4VXrmNGziQkNteW5lJeuhIGwXcBJtCxd81q/BMPaGBEeOrnXa
	 t8XwJrqx7xyv+BHrnlU6jA8Mn6V7frc69ux5oJFZk/3TkTWFvK86GVOHYCuNaTGLpqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z35yEEi9TZLdCD1HTNmsvOHqwJ3ebC3waffosyNXYts=;
	b=VHNNRv51M44bE4KuGf9RJV+ECIS+tGMAixxzdMsNtw+g+9DZJUd4GcjrgrLBAXWvxs/W
	 dCukgU8g52sYuL3L4DjxxG/dyo7lnw+YFXkQDoioGIEPz+r3vXty8KfOGRQ2g8nKcIUdm
	 JwnVI0vfxrNfT47kUt9ArqtA8RBj5SH8t1kiT8Bi8yxp2BCUficlet7aSrJVUbIR/DSkh
	 vrR4LJiyDaHeaqq1m/izjl4H1WLS07WwkYN8ncF6Quwd7jFm7ebOgdttey7rZJ4Qfqj1y
	 dj1dSMXSH+l7Pc8iDHuqZ7dvIK9VTRQvu6yNg7hcOsTsa9sNY3u1fclyjrZ61eEgTCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ic4Lkxi3;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E73606A329
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E73606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ic4Lkxi3
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so5752435e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378159; x=1793982959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z35yEEi9TZLdCD1HTNmsvOHqwJ3ebC3waffosyNXYts=;
        b=ic4Lkxi3utc+GIcfBeUXcYcc6N52EQuzHV8WF4YzRvpImZi9SQQ6VKRJgU0Vwf7Nup
         RPRM682vaWNWfLNrKEDhT4UWylFdpVEpnYv8dObGM7ayQyMXU+aHV7EjBWErD7EkJN3M
         jclabqmLej4weDe1lPhN+LcejEb6QQNrOG2ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378159; x=1793982959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z35yEEi9TZLdCD1HTNmsvOHqwJ3ebC3waffosyNXYts=;
        b=e6nVY+80xwtGmYucnqqBLzqDqTut+i5Po50HAmSZqsOoUOadUNRNO+sLs3LKn9dfs+
         rfDKWLeZJayRzys1dflFHJdBEKPIfHulU9BryMyti+ghobC4Cf0F8OEwxUWpEvNa84E6
         xdU3UzwP8PxfXESsqAv7DZZfMXprmqjI2vMTGEfoq7f1DMXy1b3F+QcBL/qRF549kOyx
         JJnD1wBuDb/SqHa4EL+/H0amsYVwUJYXRXK3ODCG+wSZSu++00y1RbzB6tTW7n53fpwS
         JJLkMlR3wbIjPq3uVaHIoBtzggGQk5QRX6ATWFqJuFnKRexCekcAxgiS4UvH495UiYbR
         1Hcw==
X-Gm-Message-State: AFq9FYI6hYLAStmFdvOSSzEPgNpTOukEEIu+VFpzuaVVA+Oet8SmGWJu
	pkU/ySmFi++6gC0vhQbFsZlM7/qJQE1E9U8CyVjjAQ91ohpOPJoCM+TcWoUB78epnqxAp/TlvH1
	E2JOk
X-Gm-Gg: AYBFou3ut1aqDX/7IZoamo4V2N3tHYZ8vti0jiRs0ultT4I+0naPjudKLbh670VXZSD
	Mr1jMdi3QqoQemqh2fUAMVpFrAklT9iB4jdF0WpphUycvp2HJOxdtpEC0FuirTYuKn0nmciLQbb
	zY5eC/BjwJ6GNXdoSUtDubtokiSXDbauT+nSqOa6ygINSIojSuhoiCqDHRmIB2RWYQh2riHTljU
	d+G5V2flFYLSlH2DXGcWL+wkLIEQB3Ce1EthdnvtgpKc3G/E9AqaL/wQQvH+TSy9aJZj7sW/0iH
	MLOCsgZyqesp4ndYcCMFF4RnEkj+xQiyahTf2PhpqOCUPhNraPYg+sQZJJ1tqqTGzF+q5wmrLei
	XB+ZcyLZk+Qv9nKl4pVzxBQbFTOsOfms8oCIJOUG8zZaK04fcKTpgh/A5fVJ3BGlxB8jpUraDKf
	qrPWWC4Sx+79OeazsdY/mqQ9NuvNAzl1WHybIwRkDOgg1bo55JNUZyjrIG6am7ocrMLkNc0X26R
	fmPfYbeTN8IqbymV2eKv2Mkkbvzn8c0dWjalY59AfDJ5CUvZVGRibbLOLsW3Dz81ayvXk+w+9oY
	ImNWI752S1SDqzWjzOjzPLl83JAHByICoYjai4ksxMuGxlAIWZ1lW0D3ypBwAOgTnU/qMG1hr42
	TUUU61zHRWlCUkhjXikhv5BGnuSe9//atz6ipzfQoyBSTnGiuK2KEEgX/usycqIn+GKlod91rP6
	rtsdJ5uPNLB51+Wj5d6omAGDYo9Q==
X-Received: by 2002:a05:600c:6095:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4ac18b7e1c1mr61761445e9.23.1793378158975;
        Fri, 30 Oct 2026 09:35:58 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/5] arm64: dts: freescale: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0 board
Date: Fri, 30 Oct 2026 17:35:43 +0100
Message-ID: <20261030163547.2682583-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
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

Support Engicam i.Core MX8M Plus Fast Ethernet C.TOUCH 2.0 board with:

 - 10/100 Ethernet
 - CAN
 - RTC
 - USB host, through an on-board hub
 - USB OTG, device only
 - Micro SD card connector
 - LVDS display connector

The C.TOUCH 2.0 carrier board is described in a separate dtsi, so that
it can be shared with the other i.Core MX8M Plus SoMs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../freescale/imx8mp-icore-mx8mp-ctouch2.dtsi | 166 ++++++++++++++++++
 .../imx8mp-icore-mx8mp-fe-ctouch2.dts         |  17 ++
 3 files changed, 184 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..bf324cdec879 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -655,6 +655,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
 DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-fe-ctouch2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi
new file mode 100644
index 000000000000..5338aeb6ec92
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ *
+ * Engicam C.TOUCH 2.0 carrier board for i.Core MX8M Plus SoMs.
+ */
+
+/ {
+	aliases {
+		rtc0 = &pcf8563;
+		rtc1 = &snvs_rtc;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm2 0 100000 0>;
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <80>;
+	};
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	pcf8563: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2>;
+	status = "okay";
+};
+
+/* console */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+/* USB OTG, device only */
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+/* USB host, through the on-board hub */
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+/* micro SD */
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX		0x154
+			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX		0x154
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c2
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001c2
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO11__PWM2_OUT	0x116
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x40
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x40
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts
new file mode 100644
index 000000000000..c4271cffca9a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ */
+
+/dts-v1/;
+
+#include "imx8mp.dtsi"
+#include "imx8mp-icore-mx8mp-fe.dtsi"
+#include "imx8mp-icore-mx8mp-ctouch2.dtsi"
+
+/ {
+	model = "Engicam i.Core MX8M Plus Fast Ethernet C.TOUCH 2.0";
+	compatible = "engicam,icore-mx8mp-fe-ctouch2", "engicam,icore-mx8mp-fe",
+		     "fsl,imx8mp";
+};
-- 
2.43.0

