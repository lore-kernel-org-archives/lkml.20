Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227049;
	b=HxESYjs6HR/pxPyHHrVl+VWepyKWKYkNJBoEWp4xag2o4SHKQS108X4GbTUq0Kz46QqS
	 QPp7Q8gLLEM6LTJODZlhiBIBvhBlVtUnwgTEHnBwAYqWp+5U8SBZ5336Zc17/pu2ZM6YC
	 Mr3hH1ahxhJMzodS2QllZuzUCun8Ali4HBoc8f+LLA/d7WMvFJFCrsQxmLZy1P5ehYKIF
	 byzadtMZ1nn6vch41s7r5nhjqD9jEx35vyEk6HJd7/WPg5yOfcSWplT/RUstFMjcxdSf8
	 xwn6TZKdNUA9ek4qXfucY5o4drkCeO6i9vgjryKK8qnu3BCVJhwk5nuihlaODz8xRhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4iHyBTTpbQDhVDFeJs7B5+X2IdCf8N9zZuEfxpcqmNs=;
	b=jvfrETapnPRkFwoUJRt5twP9b8OBWstA5fe2irvwOB1D/X+WRzy9iQUYljd99Bgfpw3E
	 o/JSmm1LQFg5h9Lbon3x/oxqGl7B9h743U1Lc1R9jshvlTL+nByCNMf/LeOONFlWwoB9N
	 F6uI/vWTS2HUii1RYhg5BWsXNZKfYfYJHfMrbZc39+sUYwdhCa4jZVS9uTaT28hsOpUr4
	 9sL5X+cBZqx03IMS3kV/7ksQ3g6ibxyaBNXnPLEnhzeDAADp0RcVtX55mxSfwMxLBEw+u
	 3FumMNbaEQ/mxrpKGqKBXHbS5lYqXvMQl5CvZ9GCOptdo1nBd7RE7LE+cqXs+i4Hvrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B8Ll9gCL;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368886083631
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 368886083631
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B8Ll9gCL
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so6613455e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227046; x=1794831846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iHyBTTpbQDhVDFeJs7B5+X2IdCf8N9zZuEfxpcqmNs=;
        b=B8Ll9gCLS7+gfW00IzhzVXMQlBAuKusojGaopE0hAaHyr6yNRaFhkV7KOzdN9lan4x
         PSK5NYl4U0yuKpBemF6hadh5sGsoWQhr4wiC6p8uCV3arFfsXHDQMYrHzDqsOrawrcwh
         cR0cwjyUXNgOUnsElQ5dOY1oDc+nxy+welrAivCV7+PKU3+OTbt/dZq9oPVg+J2h4qNk
         fqyoVP1yiMIODQJWZNETnwLAQWqztT7wSEY8mXNXCY6gsRt05A9TlyTNT59imzVyzPy1
         yT43DiTGgS3hsGF3u/LTlk2Y94e4DAFv6S7D4YNZoF9jbojq4SsFXgT/LlAqBjX4t6kF
         Di5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227046; x=1794831846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iHyBTTpbQDhVDFeJs7B5+X2IdCf8N9zZuEfxpcqmNs=;
        b=RWuQ0OTLxbrCAoZ61T8ZQIEgI7gKMztGUzHXJgFqGp9l9iXlGKYr4wwJc6epTppB61
         i3OaWUQa6z4dfPYQcCdfL2NlYkIGuOmRKt3lCEPzW81idescKlBtmfeAUPyl/4Av6wRP
         Mq7fK2dH3c8aijDfizuUckcRUzT+j4iNdfFK7O6fgcqIKlY+1R7BGlBYs5lO0aviztz8
         0O8oUt8zsS0p+koDLUuQuBiIKMiQEhhq7EA56wNWbMnyQtxSttb+VLTEWyYWTzbDmdi+
         ggwurpGn7apOZEdRvpzsKpzD9k6TxyYccm+MeUr/Oiuv7Sl++shsoHGeMJkayDrTLAXP
         m13w==
X-Forwarded-Encrypted: i=1; AL+hErG7ki7cOJzfYqR5mxU7ssqpurHvvcP5+f4S+f/5/tAAUgM9CaIlNG3i3Yr6Guc62twTYl+NFtGGS8WPbWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M6Q0nvV/UbX2jlVlga+aQwtQkWNdpgq+7sYOsKduw+gX5WEbf
	XEPXNLBT1Tl0jp2it1ol6f7eptF4d2I924iWgrFrCl6yyoS+RZFlDa3KFPU2EQtAm8c=
X-Gm-Gg: AYBFou3H6X1zh50vOrAQfM22lW/9YywbCSKCErtu1LmJw//iR0S+XR/jXRFS4DErnKQ
	XU+nVJkFs71byX8I6zhCkGpuO0MOpfgVPeaWXn6Zlg7lNI4X5evo38RTEujmmMqiF5b/saooUyy
	sZZtRGwuR33WDAa3upvSlZ+rnNm2//tT9AKjRNs4ehxeQwADiue8IDY3YbDfCHvx+fIzBJadMid
	dYE/G1+mZD7+DmxxXgQ6A+kE4hXaZF87eos75nBvoVDQlIWZ2JyIjPkkvh+rBEzQ/aYEcYXQhMm
	O6X7pKWn6z6UZmJD1GespD/LT5vifdqRu70+/YgkJDRrF8A2M7IQaz5ESegunjsAhVgZRJtHFyu
	4Q/X5WW4q++vRNPBj3p25iddY8AqsyWzSPhp8h5exjNMpiCjm9xsaTJEUipMbk5mG/0/iZUH0gq
	8H1UY6X0/basO+4TY1vr4EJit0pVNzQj8omjj6+SPXD34zrtYTKb7ahc4o1byMSB43ykDd550aF
	jXznyQbTEN7Vh9wfJQXfzkWnsXFpb1dNgfmmqsTyrIsU7YfL2zJjWOTEsz+t+JazO1nTv+4sLTT
	eoJkOIfYN4DaC6xRp9YJBvMDFwrcgs+49Qoa/hY6lLN5Q7/Zwv5Oee3nTO/FXL/W3X5elBhR1bO
	mZnKhhxOsxQ==
X-Received: by 2002:a05:600c:34cc:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4b960da49admr71698395e9.6.1794227046530;
        Mon, 09 Nov 2026 04:24:06 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:24:05 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 5/5] arm64: dts: freescale: Add support for bytesatwork i.MX93
Date: Mon,  9 Nov 2026 13:22:50 +0100
Message-ID: <20261109122250.720757-6-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
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

Add support for the bytesatwork i.MX93 byteengine placed on the
bytedevkit v1 and bytedevkit v2

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../dts/freescale/imx93-bytedevkit-v1-0.dts   | 457 ++++++++++++++++++
 .../dts/freescale/imx93-bytedevkit-v2-0.dts   | 439 +++++++++++++++++
 .../boot/dts/freescale/imx93-byteengine.dtsi  | 199 ++++++++
 5 files changed, 1105 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..566ee0a52182 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5877,6 +5877,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
 F:	drivers/net/can/bxcan.c
 
+BYTESATWORK MODULES AND BOARDS
+M:	Alexander Forsch <alexander.forsch@bytesatwork.ch>
+M:	Frank Obergfell <frank.obergfell@bytesatwork.ch>
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts
+F:	arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts
+F:	arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi
+
 C-MEDIA CMI8788 DRIVER
 M:	Clemens Ladisch <clemens@ladisch.de>
 L:	linux-sound@vger.kernel.org
diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..323e3c3dc7ae 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -898,6 +898,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
 imx93-14x14-evk-mqs-dtbs += imx93-14x14-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk-mqs.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-bytedevkit-v1-0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-bytedevkit-v2-0.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dev.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts b/arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts
new file mode 100644
index 000000000000..9662dd2c38e6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts
@@ -0,0 +1,457 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 bytesatwork AG
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/net/ti-dp83867.h>
+#include "imx93-byteengine.dtsi"
+
+/ {
+	model = "bytesatwork byteDEVKIT OSM V1.0 i.MX93";
+	compatible = "bytesatwork,bytedevkit-imx93", "bytesatwork,byteengine-imx93", "fsl,imx93";
+
+	aliases {
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_vdd_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_vdd_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "vref_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		off-on-delay-us = <12000>;
+		enable-active-high;
+	};
+
+	reg_usb_otg1_vbus: regulator-otg {
+		compatible = "regulator-fixed";
+		regulator-name = "USB1_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usb2_vbus: regulator-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB2_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio2 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	lcd_bl: backlight-lvds {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_backlight>;
+		compatible = "gpio-backlight";
+		gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+		default-on;
+	};
+
+	mipi_bl: backlight-mipi {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mipi_backlight>;
+		compatible = "gpio-backlight";
+		gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>;
+		default-on;
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+&eqos {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-1 = <&pinctrl_eqos_sleep>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy_qos>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy_qos: ethernet-phyqos@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			enet-phy-lane-no-swap;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,dp83867-rxctrl-strap-quirk;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		};
+	};
+};
+
+&fec {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_fec>;
+	pinctrl-1 = <&pinctrl_fec_sleep>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy_fec>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy_fec: ethernet-phyfec@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			enet-phy-lane-no-swap;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,dp83867-rxctrl-strap-quirk;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		};
+	};
+};
+
+&lpi2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	pinctrl-1 = <&pinctrl_lpi2c1>;
+	status = "disabled";
+
+	/* LVDS Touch */
+	touchscreen@5d {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_touch>;
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio2 20 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio2 21 GPIO_ACTIVE_LOW>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+	};
+};
+
+&lpi2c2 {
+	/* Mipi Touch */
+	touchscreen@5d {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mipi_touch>;
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio2 21 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio2 20 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lpuart1 { /* console */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&media_blk_ctrl {
+	status = "okay";
+};
+
+&usbotg2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb2>;
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbotg1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb1>;
+	dr_mode = "otg";
+	vbus-supply = <&reg_usb_otg1_vbus>;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+	no-sdio;
+	no-mmc;
+};
+
+&dsi {
+	status = "okay";
+
+	panel@0 {
+		compatible = "youritech,ili9806e", "ilitek,ili9806e";
+		reg = <0>;
+		backlight = <&mipi_bl>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_vdd_3v3>;
+		vccio-supply = <&reg_vdd_1v8>;
+
+		port {
+			panel_mipi_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
+&dsi_out_port {
+	dsi_out: endpoint {
+		remote-endpoint = <&panel_mipi_in>;
+	};
+};
+
+&iomuxc {
+	pinctrl_eqos: eqos-grp {
+		fsl,pins = <
+			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
+			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
+			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
+			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
+			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
+			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
+			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x5fe
+			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
+			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
+			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
+			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
+			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
+			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
+			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
+		>;
+	};
+
+	pinctrl_eqos_sleep: eqossleep-grp {
+		fsl,pins = <
+			MX93_PAD_ENET1_MDC__GPIO4_IO00			0x31e
+			MX93_PAD_ENET1_MDIO__GPIO4_IO01			0x31e
+			MX93_PAD_ENET1_RD0__GPIO4_IO10			0x31e
+			MX93_PAD_ENET1_RD1__GPIO4_IO11			0x31e
+			MX93_PAD_ENET1_RD2__GPIO4_IO12			0x31e
+			MX93_PAD_ENET1_RD3__GPIO4_IO13			0x31e
+			MX93_PAD_ENET1_RXC__GPIO4_IO09			0x31e
+			MX93_PAD_ENET1_RX_CTL__GPIO4_IO08		0x31e
+			MX93_PAD_ENET1_TD0__GPIO4_IO05			0x31e
+			MX93_PAD_ENET1_TD1__GPIO4_IO04			0x31e
+			MX93_PAD_ENET1_TD2__GPIO4_IO03			0x31e
+			MX93_PAD_ENET1_TD3__GPIO4_IO02			0x31e
+			MX93_PAD_ENET1_TXC__GPIO4_IO07			0x31e
+			MX93_PAD_ENET1_TX_CTL__GPIO4_IO06		0x31e
+		>;
+	};
+
+	pinctrl_fec: fec-grp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDC__ENET1_MDC			0x57e
+			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x57e
+			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
+			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
+			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
+			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x57e
+			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x5fe
+			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
+			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
+			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
+			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
+			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
+			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x5fe
+			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
+		>;
+	};
+
+	pinctrl_fec_sleep: fecsleep-grp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDC__GPIO4_IO14			0x51e
+			MX93_PAD_ENET2_MDIO__GPIO4_IO15			0x51e
+			MX93_PAD_ENET2_RD0__GPIO4_IO24			0x51e
+			MX93_PAD_ENET2_RD1__GPIO4_IO25			0x51e
+			MX93_PAD_ENET2_RD2__GPIO4_IO26			0x51e
+			MX93_PAD_ENET2_RD3__GPIO4_IO27			0x51e
+			MX93_PAD_ENET2_RXC__GPIO4_IO23			0x51e
+			MX93_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
+			MX93_PAD_ENET2_TD0__GPIO4_IO19			0x51e
+			MX93_PAD_ENET2_TD1__GPIO4_IO18			0x51e
+			MX93_PAD_ENET2_TD2__GPIO4_IO17			0x51e
+			MX93_PAD_ENET2_TD3__GPIO4_IO16			0x51e
+			MX93_PAD_ENET2_TXC__GPIO4_IO21			0x51e
+			MX93_PAD_ENET2_TX_CTL__GPIO4_IO20		0x51e
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1-grp {
+		fsl,pins = <
+			MX93_PAD_I2C1_SCL__LPI2C1_SCL		0x40000b9e
+			MX93_PAD_I2C1_SDA__LPI2C1_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_uart1: uart1-grp {
+		fsl,pins = <
+			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
+			MX93_PAD_UART1_TXD__LPUART1_TX		0x31e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmc-grp {
+		fsl,pins = <
+			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpio-grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleep-grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2: usdhc2-grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x1582
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x40001382
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x40001382
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x40001382
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x40001382
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x40001382
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2_100mhz: usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000138e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000138e
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2_200mhz: usdhc2-200mhz-grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x15fe
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x400013fe
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x400013fe
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x400013fe
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x400013fe
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_sleep: usdhc2sleep-grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__GPIO3_IO01		0x51e
+			MX93_PAD_SD2_CMD__GPIO3_IO02		0x51e
+			MX93_PAD_SD2_DATA0__GPIO3_IO03		0x51e
+			MX93_PAD_SD2_DATA1__GPIO3_IO04		0x51e
+			MX93_PAD_SD2_DATA2__GPIO3_IO05		0x51e
+			MX93_PAD_SD2_DATA3__GPIO3_IO06		0x51e
+			MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
+		>;
+	};
+
+	pinctrl_usb1: usb1-grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO11__GPIO2_IO11		0x31e
+		>;
+	};
+
+	pinctrl_usb2: usb2-grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO18__GPIO2_IO18		0x31e
+		>;
+	};
+
+	pinctrl_lvds_backlight: lvds_backlight-grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO26__GPIO2_IO26		0x31e	/* LVDS Backlight */
+		>;
+	};
+
+	pinctrl_lvds_touch: lvds_touch-grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO20__GPIO2_IO20		0x31e	/* LVDS Touch INT */
+			MX93_PAD_GPIO_IO21__GPIO2_IO21		0x31e	/* LVDS Touch RST */
+		>;
+	};
+
+	pinctrl_mipi_touch: mipi_touch-grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO21__GPIO2_IO21		0x31e	/* MIPI Touch INT */
+			MX93_PAD_GPIO_IO20__GPIO2_IO20		0x31e	/* MIPI Touch RST */
+		>;
+	};
+
+	pinctrl_mipi_backlight: mipi_bl-grp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e	/* MIPI Backlight */
+			MX93_PAD_GPIO_IO10__GPIO2_IO10		0x31e	/* MIPI Reset */
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts b/arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts
new file mode 100644
index 000000000000..52b38edfe5b6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts
@@ -0,0 +1,439 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 bytesatwork AG
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/net/ti-dp83867.h>
+#include "imx93-byteengine.dtsi"
+
+/ {
+	model = "bytesatwork byteDEVKIT OSM V2.0 i.MX93";
+	compatible = "bytesatwork,bytedevkit-imx93", "bytesatwork,byteengine-imx93", "fsl,imx93";
+
+	aliases {
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_vdd_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_vdd_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "vref_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		off-on-delay-us = <12000>;
+		enable-active-high;
+	};
+
+	reg_usb2_vbus: regulator-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB2_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio2 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	lcd_bl: backlight-lvds {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_backlight>;
+		compatible = "gpio-backlight";
+		gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+		default-on;
+	};
+
+	mipi_bl: backlight-mipi {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mipi_backlight>;
+		compatible = "gpio-backlight";
+		gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>;
+		default-on;
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+&eqos {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-1 = <&pinctrl_eqos_sleep>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy_qos>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy_qos: ethernet-phyqos@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			enet-phy-lane-no-swap;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,dp83867-rxctrl-strap-quirk;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		};
+	};
+};
+
+&fec {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_fec>;
+	pinctrl-1 = <&pinctrl_fec_sleep>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy_fec>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy_fec: ethernet-phyfec@c {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0xc>;
+			enet-phy-lane-no-swap;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,dp83867-rxctrl-strap-quirk;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		};
+	};
+};
+
+&lpi2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	pinctrl-1 = <&pinctrl_lpi2c1>;
+	status = "disabled";
+
+	/* LVDS Touch */
+	touchscreen@5d {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_touch>;
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio2 20 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio2 21 GPIO_ACTIVE_LOW>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+	};
+};
+
+&lpi2c2 {
+	/* Mipi Touch */
+	touchscreen@5d {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mipi_touch>;
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio2 21 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio2 20 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lpuart1 { /* console */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&media_blk_ctrl {
+	status = "okay";
+};
+
+&usbotg2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb2>;
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+	no-sdio;
+	no-mmc;
+};
+
+&dsi {
+	status = "okay";
+
+	panel@0 {
+		compatible = "youritech,ili9806e", "ilitek,ili9806e";
+		reg = <0>;
+		backlight = <&mipi_bl>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_vdd_3v3>;
+		vccio-supply = <&reg_vdd_1v8>;
+
+		port {
+			panel_mipi_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
+&dsi_out_port {
+	dsi_out: endpoint {
+		remote-endpoint = <&panel_mipi_in>;
+	};
+};
+
+&iomuxc {
+	pinctrl_eqos: eqos-grp {
+		fsl,pins = <
+			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
+			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
+			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
+			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
+			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
+			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
+			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x5fe
+			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
+			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
+			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
+			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
+			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
+			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
+			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
+		>;
+	};
+
+	pinctrl_eqos_sleep: eqosgrpsleep-grp {
+		fsl,pins = <
+			MX93_PAD_ENET1_MDC__GPIO4_IO00			0x31e
+			MX93_PAD_ENET1_MDIO__GPIO4_IO01			0x31e
+			MX93_PAD_ENET1_RD0__GPIO4_IO10			0x31e
+			MX93_PAD_ENET1_RD1__GPIO4_IO11			0x31e
+			MX93_PAD_ENET1_RD2__GPIO4_IO12			0x31e
+			MX93_PAD_ENET1_RD3__GPIO4_IO13			0x31e
+			MX93_PAD_ENET1_RXC__GPIO4_IO09			0x31e
+			MX93_PAD_ENET1_RX_CTL__GPIO4_IO08		0x31e
+			MX93_PAD_ENET1_TD0__GPIO4_IO05			0x31e
+			MX93_PAD_ENET1_TD1__GPIO4_IO04			0x31e
+			MX93_PAD_ENET1_TD2__GPIO4_IO03			0x31e
+			MX93_PAD_ENET1_TD3__GPIO4_IO02			0x31e
+			MX93_PAD_ENET1_TXC__GPIO4_IO07			0x31e
+			MX93_PAD_ENET1_TX_CTL__GPIO4_IO06		0x31e
+		>;
+	};
+
+	pinctrl_fec: fec-grp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDC__ENET1_MDC			0x57e
+			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x57e
+			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
+			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
+			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
+			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x57e
+			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x5fe
+			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
+			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
+			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
+			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
+			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
+			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x5fe
+			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
+		>;
+	};
+
+	pinctrl_fec_sleep: fecsleep-grp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDC__GPIO4_IO14			0x51e
+			MX93_PAD_ENET2_MDIO__GPIO4_IO15			0x51e
+			MX93_PAD_ENET2_RD0__GPIO4_IO24			0x51e
+			MX93_PAD_ENET2_RD1__GPIO4_IO25			0x51e
+			MX93_PAD_ENET2_RD2__GPIO4_IO26			0x51e
+			MX93_PAD_ENET2_RD3__GPIO4_IO27			0x51e
+			MX93_PAD_ENET2_RXC__GPIO4_IO23			0x51e
+			MX93_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
+			MX93_PAD_ENET2_TD0__GPIO4_IO19			0x51e
+			MX93_PAD_ENET2_TD1__GPIO4_IO18			0x51e
+			MX93_PAD_ENET2_TD2__GPIO4_IO17			0x51e
+			MX93_PAD_ENET2_TD3__GPIO4_IO16			0x51e
+			MX93_PAD_ENET2_TXC__GPIO4_IO21			0x51e
+			MX93_PAD_ENET2_TX_CTL__GPIO4_IO20		0x51e
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1-grp {
+		fsl,pins = <
+			MX93_PAD_I2C1_SCL__LPI2C1_SCL		0x40000b9e
+			MX93_PAD_I2C1_SDA__LPI2C1_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_uart1: uart1-grp {
+		fsl,pins = <
+			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
+			MX93_PAD_UART1_TXD__LPUART1_TX		0x31e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmc-grp {
+		fsl,pins = <
+			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpio-grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleep-grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2: usdhc2-grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x1582
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x40001382
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x40001382
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x40001382
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x40001382
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x40001382
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2_100mhz: usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000138e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000138e
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2_200mhz: usdhc2-200mhz-grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x15fe
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x400013fe
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x400013fe
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x400013fe
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x400013fe
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_sleep: usdhc2sleep-grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__GPIO3_IO01		0x51e
+			MX93_PAD_SD2_CMD__GPIO3_IO02		0x51e
+			MX93_PAD_SD2_DATA0__GPIO3_IO03		0x51e
+			MX93_PAD_SD2_DATA1__GPIO3_IO04		0x51e
+			MX93_PAD_SD2_DATA2__GPIO3_IO05		0x51e
+			MX93_PAD_SD2_DATA3__GPIO3_IO06		0x51e
+			MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
+		>;
+	};
+
+	pinctrl_usb2: usb2-grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO18__GPIO2_IO18		0x31e
+		>;
+	};
+
+	pinctrl_lvds_backlight: lvds_backlight-grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO26__GPIO2_IO26		0x31e	/* LVDS Backlight */
+		>;
+	};
+
+	pinctrl_lvds_touch: lvds_touch_grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO20__GPIO2_IO20		0x31e	/* LVDS Touch INT */
+			MX93_PAD_GPIO_IO21__GPIO2_IO21		0x31e	/* LVDS Touch RST */
+		>;
+	};
+
+	pinctrl_mipi_touch: mipi_touch-grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO21__GPIO2_IO21		0x31e	/* MIPI Touch INT */
+			MX93_PAD_GPIO_IO20__GPIO2_IO20		0x31e	/* MIPI Touch RST */
+		>;
+	};
+
+	pinctrl_mipi_backlight: mipi_bl-grp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e	/* MIPI Backlight */
+			MX93_PAD_GPIO_IO10__GPIO2_IO10		0x31e	/* MIPI Reset */
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi b/arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi
new file mode 100644
index 000000000000..774d08db5135
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 bytesatwork AG
+ */
+
+#include "imx93.dtsi"
+
+/ {
+	model = "bytesatwork byteENGINE i.MX93";
+	compatible = "bytesatwork,byteengine-imx93", "fsl,imx93";
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_reserved: ele-reserved@a4120000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0xa4120000 0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&mu1 {
+	status = "okay";
+};
+
+&mu2 {
+	status = "okay";
+};
+
+&lpi2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	pinctrl-1 = <&pinctrl_lpi2c2>;
+	status = "okay";
+
+	pmic@25 {
+		compatible = "nxp,pca9451a";
+		reg = <0x25>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <650000>;
+				regulator-max-microvolt = <2237500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <2187500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck4: BUCK4 {
+				regulator-name = "BUCK4";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5: BUCK5 {
+				regulator-name = "BUCK5";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6: BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+
+	/* I2C IOexpander */
+	tca6418e: tca6418e@34 {
+		compatible = "ti,tca6418";
+		reg = <0x34>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&wdog3 {
+	status = "okay";
+};
+
+&iomuxc {
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x1582
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001382
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x40001382
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001382
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x40001382
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001382
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001382
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001382
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001382
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001382
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1582
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x158e
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000138e
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000138e
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000138e
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000138e
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000138e
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000138e
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000138e
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400013fe
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x400013fe
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013fe
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013fe
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013fe
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013fe
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013fe
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013fe
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013fe
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
+		>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			MX93_PAD_I2C2_SCL__LPI2C2_SCL		0x40000b9e
+			MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
+			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10	0x1280
+		>;
+	};
+};
-- 
2.47.3

