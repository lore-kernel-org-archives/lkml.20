Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384795;
	b=xj/kynNMh8FqIMJl3fZNbXyYjebISbnmPI5/Q4Su+nCRJWXhKWct843vyn9oZ5wHhPMN
	 nB8hkFgHgcy/btxul+9w46fjiASpkaX7naZcOjqCF2zzSIgbKrZj3KeV6qfrA/4UsxAVy
	 5dfayP5s6fq7ZpI4ZQSPX4FLgu9OeB+Tq57grt1s43RqTLTgw+rzJL5PNzeabXLGwve4S
	 rySNan7JNmbLNelBPnTmvEKbZ7cPoNIe/4OFjPDLiDRY7goVsiJL1Dcaz+0k4S9AsfUkO
	 TUoF0Q9499icoYaowP0jYDDPN+Qnl74cXbj/TzAnwNHBv8hPOGXmeIiO6Oq07HMSZlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9YStaXLmZqq8Mk73jV98wX9vee9O4AJUr3rQ079g0/w=;
	b=KvadaJvTnPf4OW3G1FQzoPYe1t+SRRVcf/75rFFoOjPipIaumMiDyH1WYn8MeTI/yHpi
	 4d1xx4APrighoJjJHaTxS5Cpu1fhf5SzZiUHzlNde6VK1WGBHRa/pjUIi/BOND2K4jKJx
	 URvrpKRMYPIT+qKl9cr7zbLXizaJG8fbTMzbbL6g2NVfq7iFgSTyb1z3dt47X2W74Wxb3
	 yvdgehVKGOEf8Fh3LNnPrxbf1CIyAVUladZ2gWGHFYx68HLOqdOR3LyqO2xugeywoheh/
	 o1CLxVH7AieV7/qnNteUClkVtBk7eT+WpPAnPw8juN9DgwtygMoumdtrs9Yfn8xU+SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aT1Jicm3;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E2A60A380B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E2A60A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aT1Jicm3
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so26103575e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384793; x=1794989593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YStaXLmZqq8Mk73jV98wX9vee9O4AJUr3rQ079g0/w=;
        b=aT1Jicm3sHzTX8p1TOELgrXLYpjd4evTQuBc/SYETNH20j8pmfU3DM0SA1QRI/X00j
         LcquPfxozYMnUc/ltRb4aJn/bjqZtBVel6YCYZRQjQcoKD+olfEjxv9hu9eGSd2xjMGl
         EuOeehPbjXmMEC0rEGwuvx2Sm3mkFXk+rruwTi8tJEIH2m0GXIMUoT/RxQJEw4n/mGEX
         GRqWMiOinTdFLQOLeaZ7nbgbbbnxm3qhCazTDyOrdXO3HGVT4vOJtKWBEbpGgA6hEehn
         TRsK2lP+O5cvDYrN0NFdj6O+FDZPs9zPt4IdNl70e1muLgss4psGsg9R77lGvjXLRToT
         zbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384793; x=1794989593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YStaXLmZqq8Mk73jV98wX9vee9O4AJUr3rQ079g0/w=;
        b=tdpT8iO7gFTSAzi5ovG2dziPdld1rb8ZM5sl3SesDWHDg+rSTnmRiqDU8w0IlVVhHG
         VTI4mc6K//PCMY5NbHxEXPb5p/rMtTor3sEQbWZkBSiSrEMr74lj+rAR7OJYdolERurH
         /xK6/N1tc01UACnAc36qjTfD7rh5B0pi7VLvln4vx90heWSeayBSQSS0yHsNvdF4KSoN
         B0ADW8fgun6FYmXVnlM+XnHwSzXuQpZhlruSqQkGc0rka+zx4PrnJPLwaFERRK3IncLk
         xwJbJ5q1NfHkjezrNTv4bpsmSdRhFszOBrIx9FkK+7G+k+CdS5B3tAAy0eP/0pjzpdYB
         toRw==
X-Forwarded-Encrypted: i=1; AL+hErEkKl8qoIudzm3u5jTa4rfSZYBTEruznG1wVUEyhoTFBwkuFFKO6C0NSDOkmHb4+64u9MdLIInhCdaCPgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LtXL4NM8P7dU59XKlGx07wE0nI7mXQ0aLuy9WPCyGrqLN6koT
	HR7ekvzM6ZdpU8jKYNiTnKW/X66QtvrGL90s5Aw+/pUattnt3oDRc+QXMwvVG7+lmfY=
X-Gm-Gg: AYBFou0YAnseh4/z8Xl4eESfRRYE0cIMqwPG9FWRnkItYlEuGdLe0urtUZeAvSxTiiR
	LI42cnE6HHozl7QbM9wsk4Ct9Sb5gwdierlk8JcfzFGvBQ0kG8KoJCNboZ4I273UlKqck+1FqDY
	RZwVUcTOcLUKx4EYkrKbJYVQYfJV1b82u3NAc+vqya4NXwk9aZn2vgVmrBV0kiQBhVnfut4jWkn
	ytmNksh6BOoXNeCAvA3x5EUs0FCXClwGwHSvuOHGEEC5hKD7Ka0tU9ys0x4v4IseLddJW9fXGD8
	Q+lilaUzB/J16iYdjd3mqDDjgn+1fCPMnwdxSnya47sLV7tqxx5tFiItiFEJ5eWPSCmwx5f7RsL
	tp/PTR4WhI3y5neHzkKnMlIGDkg3a3Ttj8TGdRNm/Htm2Q6GW7xkbWg+HhfdLU1kHo/EzclyPk2
	FjoD/HnCS4vue5FGHg0G8LwnUgVpES6ijD+J16IiteXetBLeINA9ikGaVqvwQGRmsO0GkOR8+sQ
	WmBp5F9KQGgGko8sRTf+vpXQWpX+aIco9N0/pSINRwiXyCNfWmRG7ce3do2KBsFZAL+1ScH7qqR
	cOxURmgz6aITqqyR8zi5+OSd1yFZ/KZbR17ucolL0LyraSlIY0tL/zjvSpLcddcB+IKz1P4if7C
	1qKveDeikig==
X-Received: by 2002:a05:600c:1f93:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ba0938124fmr32566665e9.16.1794384793014;
        Wed, 11 Nov 2026 00:13:13 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:12 -0800 (PST)
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
Subject: [PATCH v2 5/5] arm64: dts: freescale: Add support for bytesatwork i.MX93
Date: Wed, 11 Nov 2026 09:11:50 +0100
Message-ID: <20261111081150.950272-6-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
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

Add support for the bytesatwork i.MX93 byteENGINE OSM module
placed on the byteDEVKIT.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx93-bytedevkit.dts   | 449 ++++++++++++++++++
 .../boot/dts/freescale/imx93-byteengine.dtsi  | 199 ++++++++
 4 files changed, 656 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..ba51f625ddad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5877,6 +5877,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
 F:	drivers/net/can/bxcan.c
 
+BYTESATWORK MODULES AND BOARDS
+M:	Alexander Forsch <alexander.forsch@bytesatwork.ch>
+M:	Frank Obergfell <frank.obergfell@bytesatwork.ch>
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts
+F:	arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi
+
 C-MEDIA CMI8788 DRIVER
 M:	Clemens Ladisch <clemens@ladisch.de>
 L:	linux-sound@vger.kernel.org
diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..0a7eb69ef76e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -898,6 +898,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
 imx93-14x14-evk-mqs-dtbs += imx93-14x14-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk-mqs.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-bytedevkit.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dev.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts b/arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts
new file mode 100644
index 000000000000..cb5d17c8444c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts
@@ -0,0 +1,449 @@
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
+	model = "bytesatwork byteDEVKIT i.MX93";
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
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usb2>;
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
+		ethphy_qos: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			enet-phy-lane-no-swap;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
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
+		ethphy_fec: ethernet-phy@c {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0xc>;
+			enet-phy-lane-no-swap;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
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
+		irq-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
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
+		irq-gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
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
+	dr_mode = "host";
+	vbus-supply = <&reg_usb2_vbus>;
+	disable-over-current;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	disable-over-current;
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
+		compatible = "youritech,et050fw01-kt", "ilitek,ili9806e";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_reset>;
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
+	pinctrl_lvds_backlight: lvds-backlight-grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO26__GPIO2_IO26		0x31e	/* LVDS Backlight */
+		>;
+	};
+
+	pinctrl_lvds_touch: lvds-touch-grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO20__GPIO2_IO20		0x31e	/* LVDS Touch INT */
+			MX93_PAD_GPIO_IO21__GPIO2_IO21		0x31e	/* LVDS Touch RST */
+		>;
+	};
+
+	pinctrl_mipi_touch: mipi-touch-grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO21__GPIO2_IO21		0x31e	/* MIPI Touch INT */
+			MX93_PAD_GPIO_IO20__GPIO2_IO20		0x31e	/* MIPI Touch RST */
+		>;
+	};
+
+	pinctrl_panel_reset: panel-reset-grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO10__GPIO2_IO10		0x31e	/* MIPI Reset */
+		>;
+	};
+
+	pinctrl_mipi_backlight: mipi-backlight-grp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e	/* MIPI Backlight */
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi b/arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi
new file mode 100644
index 000000000000..b97e9d508897
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
+	tca6418e: gpio@34 {
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

