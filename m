Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5124C48B374;
	Fri, 11 Sep 2026 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134519; cv=none; b=geS0IsnrUuqv9GGFlRxpXiv/bM4UFe7YV0eSktjH8VNi3kZthV21CUyQ+dNkkCZlEsrNC4wZcxAtwqYkydlSbxrNfAWR4KjU4pcdf99gOkHrbDrFBHIU4+JGoGEimqskAKOeRR0ZuzP7EqXPfNyn6hmkYLmkNnd7KXEhRygkvtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134519; c=relaxed/simple;
	bh=tulnxXakhEvI3g5k/yLOSZrE9UGWRTbi4d1ayAbuimc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KZW2YGVW+A3eBY6xjTsYQw2wIUFIEj8KS/0lh32j2IXeU4Sqx50ezypFTs9Zq5/QaSVqZBLjqmNDpWPdIdaK3v4I7pL/zld9IpwGT0kNhmvfgqU3ngDcTRW4km+8c/ZE2u8Gj+WFN4t/4MbqeLMNJadYWVb5x0lzqYO9YG9y6a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ibfw6sCE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ibfw6sCE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5CB6C2BCFC;
	Fri, 11 Sep 2026 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789134517;
	bh=tulnxXakhEvI3g5k/yLOSZrE9UGWRTbi4d1ayAbuimc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ibfw6sCEX7pQUGic5W8HwAnFFiOL/fRPQask7LeNXCtsOgjBK5j8cy843IAspts2Y
	 hg4TwQVjmgq5yy0d40FzmjJyHyXgHTvE4r6ZysZF070rANxWR089FyM4/yPbLuo6SE
	 Lf20yLZ8I+IXL6xtyJjwWoBQZuP6/pNQHGVIawKtBfpZFxFIzHl3RpHIASho5Aq8jR
	 fTNl3IfP6O5rcbCrkacuDeiawrJdI9DaqPv+chydsOyxHv7guPQWJIQD6Z9dke+89V
	 jpYJz2FkUIvBxF0CHcWPUvTPjDlCMRFiBgyUOex8N3DVT0jb5HOr52u/2sBksz56A3
	 6T2QWCy/Qey/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9781C88E58;
	Fri, 11 Sep 2026 13:48:37 +0000 (UTC)
From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado_via_B4_Relay?= <devnull+jcarlosgl96.proton.me@kernel.org>
Date: Fri, 11 Sep 2026 15:48:38 +0200
Subject: [PATCH v2 2/2] arm64: dts: allwinner: Add SPC Glee 10.1 A64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-b4-spc-glee-a64-v1-v2-2-ed0b7ff02e0b@proton.me>
References: <20260911-b4-spc-glee-a64-v1-v2-0-ed0b7ff02e0b@proton.me>
In-Reply-To: <20260911-b4-spc-glee-a64-v1-v2-0-ed0b7ff02e0b@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789134516; l=4667;
 i=jcarlosgl96@proton.me; s=20260906; h=from:subject:message-id;
 bh=v/cawxXxdXZKjcweHZdbEFDgYMy+E7V99spb2yKbGds=;
 b=qsQtxz4gxmaInXq9SaLSqSixivQFR9Vp5n5x39Jxmc0a9q2MJrOs1N2YSbX4JQdj+4UE5oZBK
 abHmHNMNhAsD1nDs069CTcr/5ds4yp0Lw6SdV3ID0lqYqoVTnhtjJmF
X-Developer-Key: i=jcarlosgl96@proton.me; a=ed25519;
 pk=2/GzZfrbHAiuUrsA5A4A9ixfHKnypfDfzyE+fToY4Io=
X-Endpoint-Received: by B4 Relay for jcarlosgl96@proton.me/20260906 with
 auth_id=1008
X-Original-From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
Reply-To: jcarlosgl96@proton.me

From: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>

Add support for the SPC Glee 10.1 tablet based on the Allwinner A64.
Describe the 2 GiB DRAM configuration, AXP803 PMIC, essential supplies,
microSD, UART, battery monitoring and USB peripheral port. Leave eMMC
and unverified peripherals disabled.

Include CPU operating points for frequency scaling and thermal cooling.
Enable the PMIC USB supply and connect it to the PHY for VBUS detection.
Keep the ALDO2 VCC-PL and ALDO3 VCC-PLL/AVCC supplies enabled, matching
the stock firmware and the measured 1.8 V and 3.0 V baseline settings.

Tested with kexec into Linux 7.3.0-rc1 without regulator_ignore_unused:
CPU frequency transitions, CPU cooling frequency cap, and USB supply
unplug/replug detection with SSH reconnection. Cold-boot validation of
this revision remains pending.

Signed-off-by: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>
---
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-a64-spc-glee.dts     | 143 +++++++++++++++++++++
 2 files changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index aa21f58a4..cc6687b39 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -21,6 +21,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab-early-adopter.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-spc-glee.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts
new file mode 100644
index 000000000..0f8f37b14
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 SPC Glee A64 Linux contributors
+ */
+
+/dts-v1/;
+
+#include "sun50i-a64.dtsi"
+#include "sun50i-a64-cpu-opp.dtsi"
+
+/ {
+	model = "SPC Glee 10.1 A64";
+	compatible = "onspc,glee-10-1-a64", "allwinner,sun50i-a64";
+	chassis-type = "tablet";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x80000000>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins>;
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_dcdc1>;
+	broken-cd;
+	bus-width = <4>;
+	max-frequency = <25000000>;
+	status = "okay";
+};
+
+&r_rsb {
+	status = "okay";
+
+	axp803: pmic@3a3 {
+		compatible = "x-powers,axp803";
+		reg = <0x3a3>;
+		interrupt-parent = <&r_intc>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+#include "axp803.dtsi"
+
+&axp_adc {
+	status = "okay";
+};
+
+&battery_power_supply {
+	status = "okay";
+};
+
+&reg_aldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-pl";
+};
+
+&reg_aldo3 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "vcc-pll-avcc";
+};
+
+&reg_dcdc1 {
+	regulator-always-on;
+	regulator-name = "vcc-3v3";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1300000>;
+	regulator-name = "vdd-cpux";
+};
+
+&reg_dcdc5 {
+	regulator-always-on;
+	regulator-min-microvolt = <1500000>;
+	regulator-max-microvolt = <1500000>;
+	regulator-name = "vcc-dram";
+};
+
+&reg_dcdc6 {
+	regulator-always-on;
+	regulator-min-microvolt = <1100000>;
+	regulator-max-microvolt = <1100000>;
+	regulator-name = "vdd-sys";
+};
+
+&reg_fldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1100000>;
+	regulator-max-microvolt = <1100000>;
+	regulator-name = "vdd-cpus";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usb_power_supply {
+	status = "okay";
+};
+
+&usbphy {
+	usb0_vbus_power-supply = <&usb_power_supply>;
+	status = "okay";
+};

-- 
2.55.0


