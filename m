Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792648802;
	b=PGoF5yo2uarpgz2+lDlZjZjPyttejyxewNQcm97tMb2n9G/lTbbReTOHPYvtU7xxCsEq
	 2lB9ZKFdc5fDxiwuTjxHPAHX1yTm3O2tpkdlOBPkRfupJbrax7N1ge0lSpwmcexOCcIyf
	 UZyp/38k7gBp2g9x68vlv6KepX4eEJW2WBSPhhwPZxpdLpCBMpb+aGS2hUUWErCBVJaaT
	 aaqsvzmJntNuVqfAQozrfECPaZoFd6wmEjbLECwUergme64nIGj8IVWKTEdKYqNBaY0Gp
	 bBla7coBM+GBhFoPQ0PdXQheaRAKoVMligwoGFes7UpVI+z0c/wh5JP4eerlqU7T1Fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648802;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=mNwhUNJ6NbHnmW9eroChIkDqjRa9tSE5HayqmaMCqaE=;
	b=H+WzR3r6jWY+mN+n4ppw0itaS0RXyoEn2Myh60vMoqV+4tsNrQMxk1PuD55rB70/PGv1
	 dYVBJGXRZjOvF5DoH/L/qV1JTVGODH81EQq9ZzaHGYPCjPjpimv+nQwhDdAespDe/ClYs
	 dY/dMFkwgtRLmnwCcLisTtsm9Y8xMpYepiyoh8oMvPqlzAAztyGcBn4krTfavDlXS8jLD
	 iIKf16fC5l0xqr67XlsPn8lbv/j6KnjZk0kPmh5hodk7wgnE15hS1nyVRXPcyfUjr30Gn
	 iJ0rDPfItDEzG5pk2wv0sMcGUI6mdD8I6OmZB+dfn2lJCDQl6RQNrunoPvIN+taN2Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVLJmGqF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C1A606A324;
	Thu, 22 Oct 2026 06:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVLJmGqF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792648802;
	b=cNx8wTg9JCVy4Sm1Wkp2Mj+kI0Xzt1n/WTeZYqNnIfzPBVD95XeA0ZMAD1KCKGM6aWz9
	 UctfcV++eZ/n1ho/9iduUN+zWTg1Uf32A+grzlpkjg37cenZzsAhy+WUhMpkaXCggRtPx
	 zlvURNVJJ/BNpbyzt6sBB0Gg4qb/OtxlUvCuUnvJAbjD1ps/bO1lbdYfrP5V2rmJVKfIR
	 zSgzr7hT30IY1BddjbDWYdZLXR0CbSRmFWGQ2OX/T0QRcUcTWnmqN81Hvsu5NdVLawy9e
	 WswkBFfoGTwLetTPm5QTCw8bgvLat6gJyCormkpz1f5fLBKwFKNAd9vUHv3UQbJ/npg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792648802;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=mNwhUNJ6NbHnmW9eroChIkDqjRa9tSE5HayqmaMCqaE=;
	b=Cn+GxhDCGO7WOgf0WI54Oa8CZ9Zbc418hOV48OIHj2tNn4rWxSQH1qpPSHMWleLQGesw
	 oMdiXBYnYVQDRpNGg0Tg4vdqUYDlLrSVGudstehmHHgFAihJFUHfzeb4lMxkL+lTKN7wN
	 N+XOvG7YhzbNjYnUbKy7KxSp0bnw3c3ROxb+5H2siPbhqzUVfa4EnrnhIlPODlbtYhX99
	 P4hY6yOW0VXvRDKxHv6HbIQ8H749ybneivfIvjU0p66vLTVLxkC/tr32JkldhOyw8Lqyt
	 JC7e8ogXzr03qo7BMXhGts865rch81Gs2geRJs3rxWPngPYAEts7EpFc8IuI6lzjjAQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CC0E1F000C7;
	Thu, 22 Oct 2026 06:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792648802;
	bh=mNwhUNJ6NbHnmW9eroChIkDqjRa9tSE5HayqmaMCqaE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JVLJmGqFHq1ZqlZT3sLQMgIutSqHxKMKMD+x+1eIVBdJDA0EPqu30/vpUpL/j4im9
	 +imOEZbZgqoWcMHCj24ic7wPGKo/T/fTeCWbFDknndPJYV36I81fqa/CIvAKSvYF9c
	 V+gE8WJMvRc7eVOpwiiLuERVZFLWnSHXMlh1A2hWaxbFN9EkMxpQT9F0pKpShaMv7b
	 qMFIOgaYNQmssdhnzVlTBEl37N6KE2FLcIUh4+acoJK2gctWqE6oNrpeWcCK7wLluV
	 OjoP4cWdkENkxTBWkrzKHKdPUls8b7cpnYliHse5uCcGzO0/EXxuPHF27iFwuLyV3w
	 Hv34Y6UmC9gHA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DB0B543512;
	Thu, 22 Oct 2026 05:59:59 +0000 (UTC)
From: Cristian Filipescu via B4 Relay <devnull+filipescu.cristian.gmail.com@kernel.org>
Date: Thu, 22 Oct 2026 05:56:06 +0000
Subject: [PATCH v2 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261022-sunxi-orangepi-3-lts-v2-2-70b899252c6a@gmail.com>
References: <20261022-sunxi-orangepi-3-lts-v2-0-70b899252c6a@gmail.com>
In-Reply-To: <20261022-sunxi-orangepi-3-lts-v2-0-70b899252c6a@gmail.com>
To: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, 
 Cristian Filipescu <filipescu.cristian@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792648566; l=10117;
 i=filipescu.cristian@gmail.com; s=uboot-20261021;
 h=from:subject:message-id;
 bh=IBFabbtkqBUs3c2Tsd0mS+77eP3x3i5ddI1Z/54003I=;
 b=E53DkHNzc20xSVKIGoXkqKM6or80xWdzVluBKs8XzJov/fiumWiY+atyeQnjetNJpaEGfdY12
 b0GHGM6qKyYDbuKsPofWGvWN1BIENgUU0abGIiC/NOtT8oLzt0g5vC6
X-Developer-Key: i=filipescu.cristian@gmail.com; a=ed25519;
 pk=o7Ui0tU3x+X/6Pq6PZHmd2KFtOdPWttoPuNFOvdD8t0=
X-Endpoint-Received: by B4 Relay for
 filipescu.cristian@gmail.com/uboot-20261021 with auth_id=1255
X-Original-From: Cristian Filipescu <filipescu.cristian@gmail.com>
Reply-To: filipescu.cristian@gmail.com

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Add a device tree for the Orange Pi 3 LTS, an Allwinner H6 board with
2 GiB LPDDR3, 8 GiB eMMC, a Motorcomm YT8531C Gigabit Ethernet PHY,
AW859A wireless module, USB 2.0/3.0 host ports and HDMI.

Describe the board-specific Ethernet power and reset wiring, wireless
supplies, storage and regulators. Include the review corrections from
the original submission: oscillator naming, symbolic RTC clock ID,
regulator supply chaining, BLDO3 always-on and DCDCA/DCDCB polyphase
annotation. Describe the PM bank supply and use the green PL7 LED as
the power indicator.

Configure the RGMII delays in the PHY with zero MAC delays, as proposed
during the Ethernet review. This setup was exercised in U-Boot on the
board; Linux runtime testing remains to be performed.

Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-jernej.skrabec@gmail.com/
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 362 +++++++++++++++++++++
 2 files changed, 363 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index aa21f58a4..7ea136380 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-zero-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-zero-plus2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-beelink-gs1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-3.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-3-lts.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-lite2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-one-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
new file mode 100644
index 000000000..e6aa0b2e1
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
+// Based on sun50i-h6-orangepi-3.dts, which is:
+// Copyright (C) 2019 Ondřej Jirman <megous@megous.com>
+
+/dts-v1/;
+
+#include "sun50i-h6.dtsi"
+#include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "OrangePi 3 LTS";
+	compatible = "xunlong,orangepi-3-lts", "allwinner,sun50i-h6";
+
+	aliases {
+		ethernet0 = &emac;
+		ethernet1 = &aw859a;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	connector {
+		compatible = "hdmi-connector";
+		ddc-en-gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	ext_osc32k: ext-osc32k-clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "ext-osc32k";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
+			default-state = "on";
+		};
+
+		led-1 {
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
+			default-state = "off";
+		};
+	};
+
+	reg_gmac_3v3: gmac-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "gmac-3v3";
+		vin-supply = <&reg_vcc5v>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <150000>;
+		enable-active-high;
+		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
+	};
+
+	reg_vcc5v: vcc5v {
+		/* board wide 5V supply directly from the DC jack */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_wifi_3v3: wifi-3v3 {
+		/* 3.3V regulator for WiFi and BT */
+		compatible = "regulator-fixed";
+		regulator-name = "wifi-3v3";
+		vin-supply = <&reg_vcc5v>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "ext_clock";
+		reset-gpios = <&r_pio 1 3 GPIO_ACTIVE_LOW>; /* PM3 */
+		post-power-on-delay-ms = <200>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdca>;
+};
+
+&de {
+	status = "okay";
+};
+
+&dwc3 {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci3 {
+	status = "okay";
+};
+
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ext_rgmii_pins>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ext_rgmii_phy>;
+	phy-supply = <&reg_gmac_3v3>;
+	allwinner,rx-delay-ps = <0>;
+	allwinner,tx-delay-ps = <0>;
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&reg_dcdcc>;
+	status = "okay";
+};
+
+&hdmi {
+	hvcc-supply = <&reg_bldo2>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&mdio {
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+
+		motorcomm,clk-out-frequency-hz = <125000000>;
+		rx-internal-delay-ps = <1950>;
+		tx-internal-delay-ps = <1950>;
+
+		reset-gpios = <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
+		reset-assert-us = <15000>;
+		reset-deassert-us = <100000>;
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_cldo1>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	disable-wp;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&mmc1 {
+	vmmc-supply = <&reg_wifi_3v3>;
+	vqmmc-supply = <&reg_bldo3>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	aw859a: wifi@1 {
+		reg = <1>;
+	};
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_cldo1>;
+	vqmmc-supply = <&reg_bldo2>;
+	cap-mmc-hw-reset;
+	non-removable;
+	bus-width = <8>;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci3 {
+	status = "okay";
+};
+
+&pio {
+	vcc-pc-supply = <&reg_bldo2>;
+	vcc-pd-supply = <&reg_cldo1>;
+	vcc-pg-supply = <&reg_bldo3>;
+};
+
+&r_ir {
+	status = "okay";
+};
+
+&r_pio {
+	vcc-pm-supply = <&reg_bldo3>;
+};
+
+&r_i2c {
+	status = "okay";
+
+	axp805: pmic@36 {
+		compatible = "x-powers,axp805", "x-powers,axp806";
+		reg = <0x36>;
+		interrupt-parent = <&r_intc>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		x-powers,self-working-mode;
+		vina-supply = <&reg_vcc5v>;
+		vinb-supply = <&reg_vcc5v>;
+		vinc-supply = <&reg_vcc5v>;
+		vind-supply = <&reg_vcc5v>;
+		vine-supply = <&reg_vcc5v>;
+		aldoin-supply = <&reg_vcc5v>;
+		bldoin-supply = <&reg_vcc5v>;
+		cldoin-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_aldo1: aldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-pl-led-ir";
+			};
+
+			reg_aldo2: aldo2 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc33-audio-tv-ephy-mac";
+			};
+
+			/* ALDO3 is shorted to CLDO1 */
+			reg_aldo3: aldo3 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc33-io-pd-emmc-sd-usb-uart-1";
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc18-dram-bias-pll";
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-efuse-pcie-hdmi-pc";
+			};
+
+			reg_bldo3: bldo3 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-pm-pg-dcxoio-wifi";
+			};
+
+			bldo4 {
+				/* unused */
+			};
+
+			reg_cldo1: cldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc33-io-pd-emmc-sd-usb-uart-2";
+			};
+
+			cldo2 {
+				/* unused */
+			};
+
+			cldo3 {
+				/* unused */
+			};
+
+			/* DCDCB is polyphased with DCDCA. */
+			reg_dcdca: dcdca {
+				regulator-always-on;
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1160000>;
+				regulator-ramp-delay = <2500>;
+				regulator-name = "vdd-cpu";
+			};
+
+			reg_dcdcc: dcdcc {
+				regulator-enable-ramp-delay = <32000>;
+				regulator-min-microvolt = <810000>;
+				regulator-max-microvolt = <1080000>;
+				regulator-ramp-delay = <2500>;
+				regulator-name = "vdd-gpu";
+			};
+
+			reg_dcdcd: dcdcd {
+				regulator-always-on;
+				regulator-min-microvolt = <960000>;
+				regulator-max-microvolt = <960000>;
+				regulator-name = "vdd-sys";
+			};
+
+			reg_dcdce: dcdce {
+				regulator-always-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "vcc-dram";
+			};
+
+			sw {
+				/* unused */
+			};
+		};
+	};
+};
+
+&rtc {
+	clocks = <&ext_osc32k>;
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_ph_pins>;
+	status = "okay";
+};
+
+&usb2otg {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb2phy {
+	usb0_id_det-gpios = <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC15 */
+	usb0_vbus-supply = <&reg_vcc5v>;
+	usb3_vbus-supply = <&reg_vcc5v>;
+	status = "okay";
+};
+
+&usb3phy {
+	status = "okay";
+};

-- 
2.47.3


