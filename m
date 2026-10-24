Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792834096;
	b=WDvKn3snIEKiUserTWbHmtDOTJHvZy05V3/ojmr6NiJ6dl1yeprZyHrwz9b/yr9BsHfi
	 0IY2DUaN2lUTPCrq66qzvKl5tG0u4K/Yd/TspVj/i4WiKO7xvPuDRYw4dRUpdd15imr8D
	 0JDb5Xax+FS6PQsS31oprvznR/ECDjY1PHAjP2yNOqWMoUZ31O6V6FY57XVkd4Vp8v2rr
	 QOydTL6dSEe1mJfizxmFsS3wMkX8Kc895X15TuyhoX2P7C0/ShJj+fJag4hUHXbpgusqE
	 2D0fkPvfsILGF/7/S188NpAWNnpuickdTTmdc/qEBFdJ0hNUTlPRGlSJVD+pX557TZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834096;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=sA9NrF57wXefuVdwuE8J8LtPsGWkgUPuXqVuimGggaA=;
	b=CLKCq4hiVzTmFwCix5iEfnlDrWwrLrt9I+DNUQ5Unq8Ht2s0wPOyvy4sd2ZcgYzarQvL
	 3mWmF7V2GIAkZH3gARwJLWVt2DwZmvsSoOSRVNt0uCg+bXgIT6nEihrplgeHVuctSvStS
	 2zeXbPvlTIlSlgw/iSwUX9YfgxYs5H4ri65NN+oFTHcZO3eVYylnfsiSK28VMrGTYBRdS
	 9XzoWmGFCwDnR4S9danP7aX4PoIQ2b5StRHXuWoJBcq81z/73hkWHoCMyb9l/VwVk6QUS
	 FsF80tQkJkcCw7SzQZCHuSVeEVBwGXpPuFfvl6aidkRNecG7MzZTN2nHYWNnEsRQrUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nTy96DZH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631B2606AC3C;
	Sat, 24 Oct 2026 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nTy96DZH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792834096;
	b=K9JzXlR3W7VwaVQ8l1XVBSq9mLGa+imyf/rwaSxWy9DVRRYI7ENNmj9GoC0wHIMLUDZD
	 hvF3C3mWoqhuTmxpjBhLwh8MVKr3ebD1XnuuwWDeFCYDHQ+t9Vhm1dPKIFI4teu/F/tZo
	 zD3ePQN2mJZNYMK764siIN0GKk2A7mA1NrermpMey8JJ8F0osk9GFChMCnY5MpdSHy2ST
	 iEpHKET5PHEoZ8wg//7qNvydOkqOcx1oZCdokN6GiRVPPAXF+JS+I7ZG4vSVzv+5ZDeDW
	 obmksGf8OQrMRe495544U9JzEatKCUVzazCez+XZCdZosBAKSvh4IKDnh8gzdrRpcJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792834096;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=sA9NrF57wXefuVdwuE8J8LtPsGWkgUPuXqVuimGggaA=;
	b=ZTZzvFFFanxt4LKM0xoXOO13osnmDpbwxKjeFUFew9sJmR6xwmaPaRW0ZKWXS75iW6tV
	 1n7GqkVhQiFKqNjIrDeZU0dL5xHNwiOqrZTW3NsEyK12uWudZsFJrsy4FStlcLgRIfjbk
	 tNjrDw3aYBNWnPOUyduSTArj8D9n3uRT92f2sWdyS2Bfq09nggShuMTyR6h7k/3ltZE+a
	 i2b0oTSJjYeKjkIundDIwJUJzrmV0S7NTHMiAtMFgU7/4T5p5+DrTwp9Lpjv+h2WlexaU
	 0tlOsi5K3rmhEYc7ZLnh91hxw7b2i0T2oHqUHgT4coEpIeRKDms5APKSLC8534OGGrA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E37AE1F031E0;
	Sat, 24 Oct 2026 09:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792834096;
	bh=sA9NrF57wXefuVdwuE8J8LtPsGWkgUPuXqVuimGggaA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nTy96DZHiFtZwBuJpKn8p3FnaM3euBNSfF0FB0lzTKfAtSj5KaVHjbsuSS5Z17xDd
	 v7n7RfBwRzfXRDcqAm9EM+JP9JnUjj6B2vlUDxYDM0fEuPgKBJrA+EgdMJDaIiHLlz
	 zO7txDKzX/bfDnDA6BbIrosQ/hAa0YW/2C3z+vXyhW9GJPtNBYLvjuMY2wMQBHoF0/
	 82EB981M0fvztllllcPy4tzJhXgiFymRFPE1+B9ffKsDQfNhLElGQ2VzhLBcAWo/8K
	 mH7YaKySiE6BhEoldrSo5cgGGJfBU2vknhSMW7dUuLrjSOEB+RpRw+R876/cV+KAE+
	 QICL75WC2RgXw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DC2CA44792;
	Sat, 24 Oct 2026 09:28:10 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Sat, 24 Oct 2026 17:27:57 +0800
Subject: [PATCH v6 7/7] riscv: dts: ultrarisc: Add Milk-V Titan board
 device tree
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-ultrarisc-dts-v6-7-c62994d8a114@ultrarisc.com>
References: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
In-Reply-To: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792834086; l=7807;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=SByuMay1i9EDHMw+1UNcfjKWxQwvz7yfWXdi3K55pew=;
 b=AqG3GH7KeAKO+T4ynpB95x4ekiGqpqUSEfFsZsaeeVhYNajqGnjdWXAAE8MnawA392dG3a0pg
 5IOIWdNG9ITCJg4hsThfvlUM8d5suuwX8aU+72bG9S+IQfPzVCuPcGx
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Milk-V Titan is an ITX motherboard based on the UltraRISC DP1000 SoC.

Link: https://milkv.io/docs/titan/overview
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 arch/riscv/boot/dts/ultrarisc/Makefile             |   1 +
 .../dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi  | 108 +++++++++++
 .../boot/dts/ultrarisc/dp1000-milkv-titan.dts      | 201 +++++++++++++++++++++
 .../boot/dts/ultrarisc/dp1000-shenrongda-m0.dts    |   2 +-
 4 files changed, 311 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/ultrarisc/Makefile b/arch/riscv/boot/dts/ultrarisc/Makefile
index 454d849a6ce4..dfd15c064d07 100644
--- a/arch/riscv/boot/dts/ultrarisc/Makefile
+++ b/arch/riscv/boot/dts/ultrarisc/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_ULTRARISC) += dp1000-milkv-titan.dtb
 dtb-$(CONFIG_ARCH_ULTRARISC) += dp1000-shenrongda-m0.dtb
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi
new file mode 100644
index 000000000000..7a812e40a249
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi
@@ -0,0 +1,108 @@
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
+	io_pins: io-pins {
+		pins = <PA10 PA15 PB0 PB1 PB2 PD6 PD7>;
+		function = "gpio";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	gpio_keys_pins: gpio-keys-pins {
+		pins = <PA4 PA11 PA14>;
+		function = "gpio";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	mux_dcdc_i2c_pins: mux-dcdc-i2c-pins {
+		pins = <PA5>;
+		function = "gpio";
+	};
+
+	mux_i2c3_pins: mux-i2c3-pins {
+		pins = <PA6>;
+		function = "gpio";
+	};
+
+	mux_uart0_pins: mux-uart0-pins {
+		pins = <PA7>;
+		function = "gpio";
+	};
+
+	spi0_pins: spi0-pins {
+		pins = <PD0 PD1 PD2 PD3 PD4 PD5>;
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
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
new file mode 100644
index 000000000000..89c41b382942
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+#include "dp1000-milkv-titan-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Milk-V Titan";
+	compatible = "milkv,titan", "ultrarisc,dp1000";
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
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_pins>;
+
+		key-wakeup-0 {
+			label = "Wake-Up";
+			gpios = <&gpio_a 14 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_WAKEUP>;
+			linux,input-type = <EV_KEY>;
+			debounce-interval = <10>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+		};
+
+		key-wakeup-1 {
+			label = "Power";
+			gpios = <&gpio_a 11 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			linux,input-type = <EV_KEY>;
+			debounce-interval = <10>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+		};
+
+		key-wakeup-2 {
+			label = "Wake-Up-by-USB";
+			interrupts-extended = <&gpio_a 4 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_WAKEUP>;
+			linux,input-type = <EV_KEY>;
+			debounce-interval = <10>;
+			wakeup-source;
+		};
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
+	rtc@68 {
+		compatible = "st,m41t11";
+		reg = <0x68>;
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
+&gpio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&io_pins &mux_dcdc_i2c_pins &mux_i2c3_pins &mux_uart0_pins>;
+};
+
+&gpio_a {
+	dcdc-i2c-mux-hog {
+		gpio-hog;
+		gpios = <5 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "dcdc-i2c-mux";
+	};
+
+	i2c3-mux-hog {
+		gpio-hog;
+		gpios = <6 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "i2c3-mux";
+	};
+
+	uart0-mux-hog {
+		gpio-hog;
+		gpios = <7 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "uart0-mux";
+	};
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
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_INDICATOR;
+					default-state = "keep";
+					linux,default-trigger = "netdev";
+				};
+
+				led@2 {
+					reg = <2>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_ACTIVITY;
+					default-state = "keep";
+					linux,default-trigger = "netdev";
+				};
+			};
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts
index 43f713bcea25..b6027420175c 100644
--- a/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts
@@ -106,7 +106,7 @@ mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		phy0: phy@0 {
+		phy0: ethernet-phy@0 {
 			reg = <0>;
 		};
 	};

-- 
2.34.1


