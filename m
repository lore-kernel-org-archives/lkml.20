Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9F02F9C37;
	Sun,  6 Sep 2026 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788710760; cv=none; b=DlMzmR1HtE4FIOH5E03LfHaVVkOLNyUZnvv4Iq3R1hnneic48OORWbuLnAWqoDvXJpYB4/9Hf1U9hZsEv0GzRACwBBwJ9vk1f5Qv2ILaDuc2tzIrGFsOemPI18Ivu7MPlFN2lQMTWjEo2M84/ZOKDwd6N45A6VRyyJROJtRocbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788710760; c=relaxed/simple;
	bh=5SJsPBbTPs2WnulpeeDxwt9+wMcyzsKk9EE8/ifoDP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqgmr9YHK5PpMnaqVN9QImzxh7rYiBr9Aa2OmmnH9ftlJ7FtglaSd2sJWO2Ynb5/MZVXV1VSP+qRZf7XQJC9xGtRwomJ/5xnsX6WnaZNMmoHExyjL7M5QAIIuI/wHZEEh7Zp4VQyacbXLeSD2zpDfAVMUUnc5a9SCywipxEQs4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uj4RXKWr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uj4RXKWr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D6F3C4AF09;
	Sun,  6 Sep 2026 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788710760;
	bh=5SJsPBbTPs2WnulpeeDxwt9+wMcyzsKk9EE8/ifoDP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Uj4RXKWrcFGYPayDgIJ808wIhl6aJ7Vg6lrsbh2aFApyVhlRenALMfOceLI2pAZAI
	 JpTAn2ZFYpKUbPlLod/1DyLJxxSrMxhrEorblRwkG2GtYLR+kgwyB7+B4iaHBYovXj
	 tQ01Ho9463ap4YpG6c3Ki7WF+FtrI4C+2/rGcrlDxdCB5Yr5EgtJ1dgWukzocNEm1o
	 wC5eU3zypDiF069tHcLK+uYkmOrqLuU+ZAuRbn1lR+Lh5EpvwHMDQPOMuRvZk7hk3R
	 mnBxlHEDkyAfSg725v5dKgPN90qfsbx9haLl8BzjyqwHAUOwCR4X9IfV753ll9bsFf
	 5fJtXJyB3g39w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0952C79F9F;
	Sun,  6 Sep 2026 16:05:59 +0000 (UTC)
From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado_via_B4_Relay?= <devnull+jcarlosgl96.proton.me@kernel.org>
Date: Sun, 06 Sep 2026 16:05:50 +0000
Subject: [PATCH 2/2] arm64: dts: allwinner: Add SPC Glee 10.1 A64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260906-b4-spc-glee-a64-v1-v1-2-621df2155e31@proton.me>
References: <20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me>
In-Reply-To: <20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788710758; l=3793;
 i=jcarlosgl96@proton.me; s=20260906; h=from:subject:message-id;
 bh=smg8un4L1xfda+TiUSf/I6igSw+M5PMAvgVUP5GsAX4=;
 b=6To9yA903C/qhWOwfY4AboqPIGjL4R1bzuOfPc8ax19LpI8BLtSIK+1fZfMWTJa684fCIlk35
 zsIBdS33m+zAE0Pa75gzrlolBPTOipOWvjZ6+EXixTKnzF8vGVePC//
X-Developer-Key: i=jcarlosgl96@proton.me; a=ed25519;
 pk=2/GzZfrbHAiuUrsA5A4A9ixfHKnypfDfzyE+fToY4Io=
X-Endpoint-Received: by B4 Relay for jcarlosgl96@proton.me/20260906 with
 auth_id=1008
X-Original-From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
Reply-To: jcarlosgl96@proton.me

From: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>

Add support for the SPC Glee 10.1 tablet based on the Allwinner
A64. Describe the 2 GiB of DRAM, AXP803 PMIC, essential CPU and
system rails, microSD slot, UART console, battery monitoring and USB
peripheral port. Leave eMMC and unverified peripherals disabled.

This configuration was boot-tested from microSD to Arch Linux ARM
userspace without regulator_ignore_unused.

Signed-off-by: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>
---
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-a64-spc-glee.dts     | 123 +++++++++++++++++++++
 2 files changed, 124 insertions(+)

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
index 000000000..1ca7c36de
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 SPC Glee A64 Linux contributors
+ */
+
+/dts-v1/;
+
+#include "sun50i-a64.dtsi"
+
+/ {
+	model = "SPC Glee 10.1 A64";
+	compatible = "spc,glee-10-1-a64", "allwinner,sun50i-a64";
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
+&usbphy {
+	status = "okay";
+};

-- 
2.55.0


