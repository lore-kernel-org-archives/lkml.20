Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794847471;
	b=q17w55wt/nUy0bUHliKd467uQkhp3xNbrOJgBt8MNIGwbfqV5v55RCkN1FVapap2PmOT
	 WhHk7dQXWYX0xiuH8i73woxVUCb9t3Nc14w1hNOpM/AUSGN4LlKrCbX8lrBe9Wpac3y7d
	 KHgMuXsJbsHn7ODlz04GmSPIsz8Y95nYABdIpAkTqzjl0ZqxYlPTjI347TGewZ1GhdmQM
	 Lp0mpoVadoCmBZ1y/uO6cM4DSh5i1EJhPpfk6lMY3ePsH4OkPUEPX2vvALJKiHHIw8R56
	 VBMSt57sosjR6hQg1uOk7vunJ7yfCmTT4HYYZxO9zOnhyP4SJC620l/AWupYEKQDagA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847471;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=R6UJEDH5g29NKeQsGzbhKpCZfezzH4/X/Ykrb8VC1R4=;
	b=rDUa7jABKlMl2JiV+9xdq9SVEszWOKOxb3ywcTReX+AAwqKrW4F0BLbetQzirmpNnvi7
	 4KGRG/Ol/pvRFdDTN71N1C+S/Kkc3Wy1oUXfurj6VO4nnma0MvzLuWgZyyGm138NvM/1l
	 +tIPGMhT+syscbpMo0IquI+TgQ+erGEhqwXeRP1xuQuxj+URpgNooKWuWnVnZF6WO0Unc
	 S5EXPujaRWONcTBpLcz9QAlHsvQnstnowZjXbVEM1/iVsJWnZHWKWbbhf/a2N6p1K5uok
	 rv8lAIzJHTOvNb8cg1xcy3UME92bZgDtx/2aRqumyWV+4TD1ZN9EicJr4jFLlcVHmXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KR6iLRuO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD750606A336;
	Mon, 16 Nov 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KR6iLRuO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794847471;
	b=JJYlCEr6NtbkfUtv9lPlyhpHmLSGIRLDvklrWQfhLiW7sxsmSwVt3qMx1jZzIVKLvn9m
	 G6rjwJKkHXTWasTdEh9MjHR2448Vv2l7Qp7v6REnItHXfnTFuNY/UxNrJavZYPp0VyvLX
	 WenmAS9ROI3mcuxTxKP0co1hjJxg+URWalWSmP4qy8Zj4hr9ulDQp+ajtOVc6f4sm4ZJg
	 hF9bk/ODYVPhzIGo3/gD2uAXdUUPT/DYaItEErT82I6MliJregcQNY++e1vHkPlIw+tJZ
	 SXR9Zr7CP+amZRV/iZ10OdRozTIKtpKaWBGZfMVdWJW2WapktAl4VrTR18h8EpTn42Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794847471;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=R6UJEDH5g29NKeQsGzbhKpCZfezzH4/X/Ykrb8VC1R4=;
	b=Qijv1qZW+65VjpaBQarA7Pt8TZmwDV60g6bgSKCmgX7VqozQ0pk1I3Z/fag/rQkAf69f
	 TrQVGLmbX2rthxvtINRZN3zSgJe+WBnjy9RD4w+nmE4dQh1fu1maUJ9fQIgCQC1OtWtjE
	 bSDDs6+XME2u5lP8ZF1c9yavCoJUCM4/Ne1Tks3ObdsCe286F7PQMhqnOdxu0aJcMt2ih
	 pnf6z3mIibrKyd9ZqPTbwL3NsMEWG+32wZtUUcW5wktCOc3VGTV5Xx0RmWYGA4enllEFu
	 VdLJ1Xh43KoOVRLtU8LKtpAnQleG/RumvX94V07Xv4C5rHDzJnb3d4m0hIWVy3xLcSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8AF8C1F000CE;
	Mon, 16 Nov 2026 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794847471;
	bh=R6UJEDH5g29NKeQsGzbhKpCZfezzH4/X/Ykrb8VC1R4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KR6iLRuO3LrvmuxYK6d69Yn/qOS6Tcn1JYD0qcritWNhT2E9Fg/mzGpx8Jfids++h
	 1F5egkRg3dXNKrvmdijIq4BlAmyjGoASvglfymdXJmX7YHPu14TvnzAVlkOadJzjnb
	 3B3Cd4Cqg7HeZ3BNKg/6oEBpRDMJsHAVuYs+e4Q3ujrNXE1lrK/ja3H7ktSGrVamc/
	 DV0vy1cJR+LZab7adNGlOLkjEEpkJyYDrx5x1M2kV84v4OWkWLswCXTxD6pYbhhkZD
	 EmhYoVJTNAuOOC8fzcCTfVVqlFilpxy4mWsHFkVUgXu2aio3lFvgQ6OZJ01EKr8ohf
	 bu2HCFDyS3KJw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 15DF94A52A;
	Mon, 16 Nov 2026 16:44:30 +0000 (UTC)
From: Cristian Filipescu via B4 Relay <devnull+filipescu.cristian.gmail.com@kernel.org>
Date: Mon, 16 Nov 2026 16:44:31 +0000
Subject: [PATCH v5 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
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
Message-Id: <20261116-sunxi-orangepi-3-lts-v5-2-979cf5474913@gmail.com>
References: <20261116-sunxi-orangepi-3-lts-v5-0-979cf5474913@gmail.com>
In-Reply-To: <20261116-sunxi-orangepi-3-lts-v5-0-979cf5474913@gmail.com>
To: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, 
 Cristian Filipescu <filipescu.cristian@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794847469; l=5799;
 i=filipescu.cristian@gmail.com; s=uboot-20261021;
 h=from:subject:message-id;
 bh=LaxsdgCto8Iw/LV/2gy1jzXSKmMNoqirf/zKIZsGW50=;
 b=P4FCZd+wqibX8QPxT/rLOssAM4qmYq6KTHAcNqxuqhxjCRk6BsVNlhEFR/4PLVbanLqO1blIy
 yQDbSRJjovIBmVG8PZiNoalq5UONEDD4K0QVQtCArWCU9C+A36GSy1M
X-Developer-Key: i=filipescu.cristian@gmail.com; a=ed25519;
 pk=o7Ui0tU3x+X/6Pq6PZHmd2KFtOdPWttoPuNFOvdD8t0=
X-Endpoint-Received: by B4 Relay for
 filipescu.cristian@gmail.com/uboot-20261021 with auth_id=1255
X-Original-From: Cristian Filipescu <filipescu.cristian@gmail.com>
Reply-To: filipescu.cristian@gmail.com

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Add the board description for the Allwinner H6-based Orange Pi 3 LTS,
using the common Orange Pi H6 description for shared hardware.
Describe the LTS regulators, storage, Motorcomm YT8531C Ethernet PHY,
wireless module supplies, LEDs and USB ports.

Reset the sole Ethernet PHY at MDIO bus registration and keep reset
outside interface detach so its configured 125 MHz output is retained.
Use generic Clause 22 discovery and PHY-internal RGMII delays.

Inherit the schematic LED roles and defaults: red power on and green
status off. Select the weakest GPIO drive level for both LEDs and enable
1.8 V eMMC DDR52 and HS200 modes while retaining the H6 maximum frequency
of 150 MHz. Inherit the CPU/GPU OPP tables, CPU supply and regulator ramp
delays from the common include. Remove inherited USB ID detection for
fixed host mode.

Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-jernej.skrabec@gmail.com/
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 164 +++++++++++++++++++++
 2 files changed, 165 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d1f768dd6..da39f0225 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -42,6 +42,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-zero-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-zero-plus2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-beelink-gs1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-3.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-3-lts.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-lite2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-one-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
new file mode 100644
index 000000000..6dbdba4a8
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
+// Based on sun50i-h6-orangepi-3.dts, which is:
+// Copyright (C) 2019 Ondřej Jirman <megous@megous.com>
+
+#include "sun50i-h6-orangepi.dtsi"
+
+/ {
+	model = "OrangePi 3 LTS";
+	compatible = "xunlong,orangepi-3-lts", "allwinner,sun50i-h6";
+
+	aliases {
+		ethernet0 = &emac;
+		ethernet1 = &aw859a;
+	};
+
+	leds {
+		led-0 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&led_red_pin>;
+		};
+
+		led-1 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&led_green_pin>;
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
+&axp805 {
+	/* ALDO3 is shorted to CLDO1; both inherit regulator-always-on. */
+	regulators {
+		cldo2 {
+			/* unused */
+			/delete-property/ regulator-min-microvolt;
+			/delete-property/ regulator-max-microvolt;
+		};
+
+		cldo3 {
+			/* unused */
+			/delete-property/ regulator-min-microvolt;
+			/delete-property/ regulator-max-microvolt;
+		};
+
+		/* DCDCB is polyphased with DCDCA. */
+		dcdca {
+			regulator-min-microvolt = <800000>;
+		};
+	};
+};
+
+&dwc3 {
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
+&hdmi {
+	hvcc-supply = <&reg_bldo2>;
+};
+
+&mdio {
+	reset-gpios = <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
+	reset-delay-us = <15000>;
+	reset-post-delay-us = <100000>;
+
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+
+		motorcomm,clk-out-frequency-hz = <125000000>;
+		rx-internal-delay-ps = <1950>;
+		tx-internal-delay-ps = <1950>;
+	};
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
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	cap-mmc-hw-reset;
+	non-removable;
+	bus-width = <8>;
+	status = "okay";
+};
+
+&pio {
+	vcc-pg-supply = <&reg_bldo3>;
+};
+
+&r_pio {
+	led_green_pin: led-green-pin {
+		pins = "PL7";
+		function = "gpio_out";
+		drive-strength = <10>;
+	};
+
+	led_red_pin: led-red-pin {
+		pins = "PL4";
+		function = "gpio_out";
+		drive-strength = <10>;
+	};
+};
+
+&usb2phy {
+	/delete-property/ usb0_id_det-gpios;
+};
+
+&usb3phy {
+	status = "okay";
+};

-- 
2.47.3


