Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962048;
	b=H9Kw4n2jZ7VuCKrgank47UCnQFeYaq6AL7F5WVvTGyHcgUtzWNH4J3E9Q9OU4QjlO9of
	 q3OC8SAQJRjXYYQzjq0tpTr2gIENvniOmXQYfCJpScsMHRbpu8dgpFaaTzQwYP693NZD5
	 S/tqZcaRakrbxVOx5Sfu6lgAfuvSGw/5EPTE7o2MXGV0sTxcVdZpe0ni3Bt9upVfO6SWt
	 Vdehgm/KM2Rtuk03M/7wFpGMy0p5lXQnxQ5iO/YCn8N2jtQF+nBlyMLqWtaMPkeaeFg/z
	 vPXfmD1AvNtfHeKpPBNiFrscfyGf0sRrf8OAa6IvlJc17jXCoVQiV/c6tPLSRci16fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962048;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=aDLD52qaM3Fh625QgHrVjo+tYa81+ewXx2Mla/ADdcw=;
	b=ydMLLf8DDl6OpdiVBeWD1zFl8XmyKIGDHHkBgFZ8R3H+SbECRVnwlWtnVfEWdRaJAoLm
	 V0XBxX/mCoTHm36vu5/DxVjCngA4cXfLzYiqeiwqsnVtoTVqfP0snAlX4Ok6pbvxhVN7P
	 67UHSELgL+9T5Aai5FONnuyPQKtnI6xBBXEVSgd7dlYrbq8bw+iZJVGf5Z8yorD2whRSo
	 Apa09K/u+loMpISYLOezxad7j9h5DU/QTAI3dNeosPN+6myvCnJxi/9mFzHXXz7Ot33B4
	 paF8QemLvg02BdClnDC0/3wdc0ZQtFHiO1dbl1JG575+wyNlI5Urh4varo+Q0A1EM7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=VeSm6fep;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AE5606EEAA;
	Fri,  6 Nov 2026 10:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6AE5606EEAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=VeSm6fep
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07P1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:14 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07P1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962035;
	bh=aDLD52qaM3Fh625QgHrVjo+tYa81+ewXx2Mla/ADdcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VeSm6fep+uTL8Y//cVW8wf8r//+twNGA4Wulyvv8Nkd85E5VTBWE0fmxDLOO2kmpW
	 PewmPmw4O1Fx2RlxWfxbuvPpsEsBpJIGiM+KERpILbR8tPP5V7OV/675tX9jqY3Aha
	 AVcZRltn+5RsXR5kmYde8nPwGBYsYLgrF/eig6IE=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 10/10] arm64: dts: amlogic: add the Amediatech X98Q
Date: Fri,  6 Nov 2026 11:46:59 +0100
Message-ID: <20261106104659.54656-11-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
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
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The Amediatech X98Q is a TV box with an Amlogic S905W2, eMMC, an SD
slot, Fast Ethernet, two USB2 host ports, HDMI, a power LED, an IR
receiver and an Amlogic W1 Wi-Fi/Bluetooth combo chip.

Supported:
 - serial console, eMMC, SD card, Ethernet, USB host
 - Mali GPU, GE2D, thermal throttling of the GPU
 - IR remote, also as a wakeup source
 - Bluetooth

The CPU supply is described, but CPU frequency scaling and the video
decoder are left for later, as their drivers are not upstream yet.
The SDIO bus for the W1 Wi-Fi is described, but there is no mainline
driver for it yet.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 310 ++++++++++++++++++
 2 files changed, 311 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa55c..4e85c5227b7c 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -86,6 +86,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-ugoos-am3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-s4-s905w2-x98q.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-s4-s905y4-khadas-vim1s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
new file mode 100644
index 000000000000..388198756a3a
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Christian Stefan Kövér-Draxl <ckoever@outlook.de>
+ * Based on meson-s4-s905y4-khadas-vim1s.dts:
+ *  - Copyright (c) 2026 Khadas Technology Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+#include "meson-s4.dtsi"
+
+/ {
+	model = "Shenzhen Amediatech Technology Co., Ltd X98Q";
+	compatible = "amediatech,x98q", "amlogic,s905w2", "amlogic,s4";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		mmc0 = &emmc;
+		mmc1 = &sd;
+		mmc2 = &sdio;
+		serial0 = &uart_b;
+		serial1 = &uart_a;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 52 MiB reserved for ARM Trusted Firmware */
+		secmon_reserved: secmon@5000000 {
+			reg = <0x0 0x05000000 0x0 0x3400000>;
+			no-map;
+		};
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1710000>;
+
+		button-function {
+			label = "Function";
+			linux,code = <KEY_POWER>;
+			press-threshold-microvolt = <35000>;
+		};
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio GPIOB_9 GPIO_ACTIVE_LOW>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-power {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+	};
+
+	main_5v: regulator-main-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	sd_3v3: regulator-sd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "SD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio GPIOD_4 GPIO_ACTIVE_LOW>;
+		regulator-always-on;
+	};
+
+	vddao_3v3: regulator-vddao-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&main_5v>;
+		regulator-always-on;
+	};
+
+	/* SY8120B1ABC DC/DC regulator behind an RC filter */
+	vddcpu: regulator-vddcpu {
+		compatible = "pwm-regulator";
+		regulator-name = "VDDCPU";
+		regulator-min-microvolt = <689000>;
+		regulator-max-microvolt = <1049000>;
+		vin-supply = <&main_5v>;
+		pwms = <&pwm_ij 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		/*
+		 * A duty cycle change takes a while to show on the filtered
+		 * rail; without this the CPU is clocked up while the voltage
+		 * is still ramping.
+		 */
+		regulator-settling-time-up-us = <3000>;
+		regulator-boot-on;
+		regulator-always-on;
+		/* Voltage Duty-Cycle */
+		voltage-table = <1049000 0>,
+				<1039000 3>,
+				<1029000 6>,
+				<1019000 9>,
+				<1009000 12>,
+				<999000 14>,
+				<989000 17>,
+				<979000 20>,
+				<969000 23>,
+				<959000 26>,
+				<949000 29>,
+				<939000 31>,
+				<929000 34>,
+				<919000 37>,
+				<909000 40>,
+				<899000 43>,
+				<889000 45>,
+				<879000 48>,
+				<869000 51>,
+				<859000 54>,
+				<849000 56>,
+				<839000 59>,
+				<829000 62>,
+				<819000 65>,
+				<809000 68>,
+				<799000 70>,
+				<789000 73>,
+				<779000 76>,
+				<769000 79>,
+				<759000 81>,
+				<749000 84>,
+				<739000 87>,
+				<729000 89>,
+				<719000 92>,
+				<709000 95>,
+				<699000 98>,
+				<689000 100>;
+	};
+
+	vddio_ao1v8: regulator-vddio-ao1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	sdio_32k: sdio-32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		clocks = <&sdio_32k>;
+		clock-names = "ext_clock";
+	};
+};
+
+&emmc {
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	max-frequency = <200000000>;
+	non-removable;
+	disable-wp;
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_ao1v8>;
+	status = "okay";
+};
+
+&ethmac {
+	phy-handle = <&internal_ephy>;
+	phy-mode = "rmii";
+	status = "okay";
+};
+
+&ge2d {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&ir {
+	pinctrl-0 = <&remote_pins>;
+	pinctrl-names = "default";
+	linux,rc-map-name = "rc-x98q";
+	wakeup-source;
+	status = "okay";
+};
+
+&pwm_ef {
+	pinctrl-0 = <&pwm_e_pins1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm_ij {
+	pinctrl-0 = <&pwm_j_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vddio_ao1v8>;
+	status = "okay";
+};
+
+&sd {
+	pinctrl-0 = <&sdcard_pins>;
+	pinctrl-1 = <&sdcard_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	bus-width = <4>;
+	cap-sd-highspeed;
+	/* Fails CRC at 50 MHz with the default 180 degree phase */
+	amlogic,core-phase-degrees = <270>;
+	max-frequency = <50000000>;
+	disable-wp;
+	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddao_3v3>;
+	status = "okay";
+};
+
+/* Wi-Fi half of the Amlogic W1 combo chip */
+&sdio {
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	bus-width = <4>;
+	cap-sd-highspeed;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	max-frequency = <200000000>;
+	non-removable;
+	disable-wp;
+	no-sd;
+	no-mmc;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_ao1v8>;
+	status = "okay";
+};
+
+&uart_a {
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	/* Bluetooth half of the Amlogic W1 combo chip */
+	bluetooth {
+		compatible = "amlogic,w155s2-bt";
+		clocks = <&sdio_32k>;
+		enable-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		vddio-supply = <&vddio_ao1v8>;
+		firmware-name = "amlogic/aml_w1_bt_uart.bin";
+		amlogic,shared-antenna;
+	};
+};
+
+&uart_b {
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&usb2_phy0 {
+	status = "okay";
+};
+
+&usb2_phy1 {
+	status = "okay";
+};
-- 
2.56.0

