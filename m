Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C600D49483D;
	Mon, 19 Oct 2026 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396531; cv=none; b=pVc0r4vwBflIuKfdtVAOuKsim/sp/REEcLQhpcavlwoUxw+DIY7mkYYgB0uKorwu7sAjwhhgEzbC8KjDE6N7o8e8thO1nr+22IL78g6vS/NzxeuWalelWiOfAAOBjIVVwYudHh8sOZ+x3qPL2YUxaz79FV6INsg+P35ps5b2+Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396531; c=relaxed/simple;
	bh=O+mRZyhd1UHc0xkANFE4G3Z7wEfuWF6F4O3e1Oh0El0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ipYoJ72JHcMSlOoEy3GqridlqVMgmsH8iRV0UJXIAKPVeY8U5k6pH6Dsaziv8Jo4VJx0KhIXibrWzCCfIxH06U5R/f8QfdnyMgSMUvi1Z9G2qdRZTaCNIyblBCkEWRDMNDKlWcaBZjhOHQ+so0tKzjPlMbWPnu4n+IzFH1rQPyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLNseuLT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLNseuLT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50AE3C4AF0D;
	Mon, 19 Oct 2026 07:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792396531;
	bh=O+mRZyhd1UHc0xkANFE4G3Z7wEfuWF6F4O3e1Oh0El0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JLNseuLTjV486ji8Y2VC5z/er2jEP1mJDUh46RtGHEngr91EB5fxDyTHY9FlMl+uY
	 VEXh12KqAwiu9BLcu3Ybd1K1a+euw0pY0rc9GJXE5+rHcZdNXLCyc9IF/Wl26ieuzD
	 o4aUJ4OfMcZS7sHRfSsY3Yx5yYvFsKEz0WloGTmJxUaHPb738lVR/+PIwkKlIR14+u
	 WrphbVKKVboih0HvLox9qLvdHaxa3zQ7G3bsjtzeRdVg8XXyzrgnh4iRut8/ukzNpk
	 EqWhdGecZIxFG7k4bI9nS5ilMBI1kaqK/N4VMMtSgwnR/It+z0q/kLKIoEVIuElm1g
	 X6urwczbkOIMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCA0CCF2DB;
	Mon, 19 Oct 2026 07:55:31 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Mon, 19 Oct 2026 15:55:30 +0800
Subject: [PATCH v4 6/7] riscv: dts: ultrarisc: Add Shenzhen Rongda M0 board
 device tree
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-ultrarisc-dts-v4-6-3979747cda2e@ultrarisc.com>
References: <20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com>
In-Reply-To: <20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792396528; l=6533;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=FLco8EKil9coXfOOohEgx8XQNQE43bTkwaWzTcrXeQk=;
 b=ehmGScVe+6czV6XIXqXzNj4QQj6lKNroiaQoIgW6En4BydAKRwbUOkEyAckl3SFS+tBSAtWth
 gwse1HB0NXiCj5JclN7AZupDGytEXhbQn2pqiiuUQeh5pw8y/eUV8Cz
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Shenzhen Rongda M0 is an mATX motherboard based on the UltraRISC DP1000
SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/ultrarisc/Makefile             |   2 +
 arch/riscv/boot/dts/ultrarisc/dp1000-pinctrl.h     |  63 ++++++++++++
 .../ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi    |  79 ++++++++++++++
 .../boot/dts/ultrarisc/dp1000-shenrongda-m0.dts    | 113 +++++++++++++++++++++
 5 files changed, 258 insertions(+)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 69d8751fb17c..702882974251 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -12,3 +12,4 @@ subdir-y += spacemit
 subdir-y += starfive
 subdir-y += tenstorrent
 subdir-y += thead
+subdir-y += ultrarisc
diff --git a/arch/riscv/boot/dts/ultrarisc/Makefile b/arch/riscv/boot/dts/ultrarisc/Makefile
new file mode 100644
index 000000000000..454d849a6ce4
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_ULTRARISC) += dp1000-shenrongda-m0.dtb
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-pinctrl.h b/arch/riscv/boot/dts/ultrarisc/dp1000-pinctrl.h
new file mode 100644
index 000000000000..4668e45d2335
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000-pinctrl.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+#ifndef _DP1000_PINCTRL_H
+#define _DP1000_PINCTRL_H
+
+#define PA0		0
+#define PA1		1
+#define PA2		2
+#define PA3		3
+#define PA4		4
+#define PA5		5
+#define PA6		6
+#define PA7		7
+#define PA8		8
+#define PA9		9
+#define PA10		10
+#define PA11		11
+#define PA12		12
+#define PA13		13
+#define PA14		14
+#define PA15		15
+#define PB0		16
+#define PB1		17
+#define PB2		18
+#define PB3		19
+#define PB4		20
+#define PB5		21
+#define PB6		22
+#define PB7		23
+#define PC0		24
+#define PC1		25
+#define PC2		26
+#define PC3		27
+#define PC4		28
+#define PC5		29
+#define PC6		30
+#define PC7		31
+#define PD0		32
+#define PD1		33
+#define PD2		34
+#define PD3		35
+#define PD4		36
+#define PD5		37
+#define PD6		38
+#define PD7		39
+#define LPC0		40
+#define LPC1		41
+#define LPC2		42
+#define LPC3		43
+#define LPC4		44
+#define LPC5		45
+#define LPC6		46
+#define LPC7		47
+#define LPC8		48
+#define LPC9		49
+#define LPC10		50
+#define LPC11		51
+#define LPC12		52
+
+#endif /* _DP1000_PINCTRL_H */
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi
new file mode 100644
index 000000000000..ab927c6cd614
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+#include "dp1000.dtsi"
+#include "dp1000-pinctrl.h"
+
+&pinctrl {
+	i2c0_pins: i2c0-pins {
+		pins = <PA12 PA13>;
+		function = "i2c";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	i2c1_pins: i2c1-pins {
+		pins = <PB6 PB7>;
+		function = "i2c";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	i2c2_pins: i2c2-pins {
+		pins = <PC0 PC1>;
+		function = "i2c";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	i2c3_pins: i2c3-pins {
+		pins = <PC2 PC3>;
+		function = "i2c";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	spi0_pins: spi0-pins {
+		pins = <PD0 PD1 PD2 PD3 PD4 PD5 PD6 PD7>;
+		function = "spi";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	spi1_pins: spi1-pins {
+		pins = <PA0 PA1 PA2 PA3>;
+		function = "spi";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart0_pins: uart0-pins {
+		pins = <PA8 PA9>;
+		function = "uart";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart1_pins: uart1-pins {
+		pins = <PB4 PB5>;
+		function = "uart";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart2_pins: uart2-pins {
+		pins = <PC4 PC5>;
+		function = "uart";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart3_pins: uart3-pins {
+		pins = <PC6 PC7>;
+		function = "uart";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+};
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts
new file mode 100644
index 000000000000..43f713bcea25
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+#include "dp1000-shenrongda-m0-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Shenzhen Rongda M0 Board";
+	compatible = "shenrongda,m0", "ultrarisc,dp1000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+
+	rtc@32 {
+		compatible = "whwave,sd3078";
+		reg = <0x32>;
+	};
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins>;
+};
+
+&spi1 {
+	num-cs = <1>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_pins>;
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+};
+
+&pcie_x16 {
+	status = "okay";
+};
+
+&pcie_x4a {
+	status = "okay";
+};
+
+&pcie_x4b {
+	status = "okay";
+};
+
+&ethernet {
+	phy-handle = <&phy0>;
+	/*
+	 * The PCB does not add RGMII TX or RX clock delays. The DP1000
+	 * integration adds fixed delays in both directions.
+	 */
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: phy@0 {
+			reg = <0>;
+		};
+	};
+};

-- 
2.34.1


