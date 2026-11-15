Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794786654;
	b=wp8Gy6T7HLgr5HnhZ0Oz4kVxu0l7lV90m+qPpkoCkZ4p9DV5HXP+TFyOg/1lDCX0htHf
	 lfq3poqwGEFdj4GhbUgFoEIJ9TL8fJ3z60Mfs2ybQ33clA0pLijB/pesspc3mINUynl+8
	 9oxI9uPgq12HlQ2ltWzo0gJ6z3CtchWa5llo+oZL9QwCj+2Y1ugzh5pmcTv4POTnDhkiK
	 6cma6rSQdXmOOa6V8jmsAh8K9xo94Y08hh3skrnUshBBLKeD+hYr38Cd003tfEKXYK5tN
	 dS/z15OffHdmsuF+swemCQ8E8p+eLO7URDheYE7msX1SdnstJGu4DHnoSXhxKiI7/3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794786654;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=UrdB96UuIeFkD6j1AErw+PlgWigfyIVge/jVwF3TrpA=;
	b=XnZszENw2/JW6B53qnTbZwFbx3mMQHfetzVtJxqGwRjnDYXYKj/Xgfm+YtLsBbI/b3Yq
	 a5RIrQqUDWE4kiEsK/MnPZAeNlq0sS7hVyJ/l5fuPluJ75N7n/ICCP/lJhqzkeEqU9YiQ
	 rRwL2ccghPRfHGTghOOg6SWLj369PrksC1VJVrrEFa1NkTE9uOWS6a10ehQbRute+Agyp
	 r+wrLBO1iyd9ky24niG11Pz6lHMpVfJ8dR7Djhx9ksPEGmYqIk/4PpyOSwj3V+vdQl2CU
	 e+b78NKt6Pm0YBlMGI9XUanpM+GLpxMVVUlWQRF2A1emQUuev/rfMf3ROTkT/Al4T/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FzGMSSU1;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A803606A323;
	Sun, 15 Nov 2026 23:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FzGMSSU1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794786654;
	b=CFqwPmckfdVTuTqzzusDxhFLKdgT8oQva9KYxD/eDrHlDiqZIat5vQgAea4kFASWPQlY
	 AI1xWBtK9SPWHj8OWjmgnehY/nUFYCnhA7HW/DPnamXzh1xoo0Lp4EMUF/+lo6SRZcqzf
	 bgzzELFv7RBHIc4hqv3WSXbdZNHaYJ0YtGdHnzEoYaT+fQlVB9sLwhvCITE/Tr/QHyAXx
	 wX0y8m5rsfiFeh86XVPlJ0ib6NkSBP59ZL/ReezkT2u9P/ztg+qXuD51eg4UpjQLZrXzM
	 ob+J5n0gBTedpYfAbdYkEf3KNXdSwGWXGkcYUdCr/II24dUqFE9HCneVqCLKCW3i9iA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794786654;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=UrdB96UuIeFkD6j1AErw+PlgWigfyIVge/jVwF3TrpA=;
	b=DRixVeSpyB9vTobCBAfmD2MQZYLJ++JHjuOQxdncEnsxDy2Nb/4SM98TnvWqOcpZU5bY
	 Gm/YJUyGA8hfUh1CNv7KS1Dg9BYbaCrc0pMQH7P/oAuJ8RwbTeEZCm6Pvd2HfXZ1p4T3C
	 w+BOgm/cmgps98eLfoFXCJGPqCPwkUqb7vRXKt98+SUc3UUU8buDfV2x4aCGoLu15FWot
	 g4S3CgcO4eqHMJnaH+lRjnFKPMqi2d9JuvuBZ5yOCDgyBolnixuqAZMGsesT6yvV3u8cq
	 laEwkxZ2F1E0K847tQUYLLWQXRZre6RNui0ZlP2FCU+KpoZYPmXPUQg15V0Q0y4ShDQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7364E1F000C6;
	Sun, 15 Nov 2026 23:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794786654;
	bh=UrdB96UuIeFkD6j1AErw+PlgWigfyIVge/jVwF3TrpA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FzGMSSU1ye1b8Kz7UTHXRJ51hf32HnBizj3QE5JbLJxDgkSX1kj6rkxg880H++rZb
	 D8TIEu1QqvCaoHOKEkrLWMGMQ77hzUlvm6nmWFoG7Nn1/1oNphua7KIE2MFmWEpRH3
	 NxOD25oz5vju/9suPHTvO2vdqB+9vCKpXi2bQnVj/p1eLViNsztWp5y/DOIN/9mSNx
	 qcgNUTJpFdLGD0eMJQ/AUhbMi3hrl3WavtuxSSRoPG1iqWLPfzXtazjJGP9FqQbe6Q
	 70HuddYLBEz9zOXOUHetFx5kdSw7FO/c46IHJzBV6ryCR9CTlQdWLqEsFsNg2dKkgs
	 ngeQBlvQcDq7g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F15A04A280;
	Sun, 15 Nov 2026 23:50:52 +0000 (UTC)
From: Cristian Filipescu via B4 Relay <devnull+filipescu.cristian.gmail.com@kernel.org>
Date: Sun, 15 Nov 2026 23:50:54 +0000
Subject: [PATCH v4 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
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
Message-Id: <20261115-sunxi-orangepi-3-lts-v4-2-7749b448a4dd@gmail.com>
References: <20261115-sunxi-orangepi-3-lts-v4-0-7749b448a4dd@gmail.com>
In-Reply-To: <20261115-sunxi-orangepi-3-lts-v4-0-7749b448a4dd@gmail.com>
To: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, 
 Cristian Filipescu <filipescu.cristian@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794786652; l=6155;
 i=filipescu.cristian@gmail.com; s=uboot-20261021;
 h=from:subject:message-id;
 bh=So5UOb6lKk1fkokNpBGT/4HDC7UsiTD0P9j7b/a7Mss=;
 b=G5VZsXTnJVr1NF340ZRZGGA9BrWAZy3OxXebePMfSitw/QsP1sKjNb1NZU4VrLLQV0vykfvEV
 KIE5gYUVQryBpooiEGMB5xDXebiRgJhVueRvrXKwDGJAcMB/tfxQjli
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
status off. Select the weakest GPIO drive level for both LEDs, describe
the shared CPU supply on all four cores, and enable 1.8 V eMMC DDR52 and
HS200 modes while retaining the H6 maximum frequency of 150 MHz.
Remove inherited USB ID detection for fixed host mode.

Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-jernej.skrabec@gmail.com/
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 188 +++++++++++++++++++++
 2 files changed, 189 insertions(+)

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
index 000000000..d3ea73e1d
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
+// Based on sun50i-h6-orangepi-3.dts, which is:
+// Copyright (C) 2019 Ondřej Jirman <megous@megous.com>
+
+#include "sun50i-h6-orangepi.dtsi"
+#include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
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
+			regulator-max-microvolt = <1160000>;
+			regulator-ramp-delay = <2500>;
+		};
+
+		dcdcc {
+			regulator-ramp-delay = <2500>;
+		};
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdca>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdca>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdca>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdca>;
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


