Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DA458596D;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964436; cv=none; b=ICpVmJJhB8W7jLoQSteMwEWa5xGJH5DsJhGksmDFLf4zl9UiOrA186iXCpjayoze7pc/Rzrq3InPIJyH1TJbWHcZuSSaLFUAB2Ck2DC9hb7JRm4FOaZmytlU5WyvvBm3yFe3MLg5N4cE1aGq9qKH0jFDiG7IeK6WHTNLfhouPGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964436; c=relaxed/simple;
	bh=2KNTYkdkwbMyC1miCU9A7MtRFj+4xeC0pWYwDxENZQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MEec7FNEeOhCwqG50UKtZmq4BWtAdNrtVxwzjFH3NFWE4xFyeI1lM+EYa0u0/2xTFOpcAc+toQb1njfHNN8gg61f8KmirRVl3SKviIBOSE9FGNGe8jKWJdBpqbcTOMZ1TCwINdoSz1XtBxG0W0RgbiMcz65U0dGq19emSDoeUZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oz3i4Hy4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oz3i4Hy4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA8FBC4AF0D;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788964435;
	bh=2KNTYkdkwbMyC1miCU9A7MtRFj+4xeC0pWYwDxENZQo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oz3i4Hy4MxqfHG40aMZRWtFC+MKnKwWxgIXGATtuZ0QmaI1y2sN2MSVjlHvZ9fny+
	 M9Rfm5qYmQM0l4oggzyHjwoaKWdw2BkQW5PcmmdZ6KUHlImT4pjcmzw4InRAgvlVDB
	 mS4CQ8jQ0kWc1ZY0UgNanTJQgrLkxgzGZ+FOLA18rBYpJLFl6J+G/2PMGHcNo0K7mG
	 EQN0Rgwp2AhnQm3GgyBqqHZMK0Bc65Hd4VvhlwUBcpGm98txB24sHO0RGYllUgRMwG
	 +7NMZqYtA0LBOycoTkuznzQU8Xxx3+1Vj2KRZfbIcd0ZHMCy5oGQsExeExcfuF4gJn
	 BRIR7MiKYq59A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E9EC79FB7;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Wed, 09 Sep 2026 22:33:25 +0800
Subject: [PATCH v3 4/5] arm64: dts: rockchip: Add devicetree for the
 FriendlyElec NanoPi R28S
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-r28s-upstream-v3-4-ee3e1a34a353@proton.me>
References: <20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me>
In-Reply-To: <20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4990;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=j++VVr66sof9dIz+MZMFxHmP6yNpmBPeXTV3BFcBNuk=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqyFeYFpdgJvgzkVfHkSaphMf5c+XPAqzua2ydYfu1dna
 yxZNXF5RykLgxgXg6yYIovspupIoVXRM4tYpI7DzGFlAhnCwMUpABN5oMDI8FLqW9TGacvqDbxd
 P6r8ZszlKQg5Gvae/TTXJ97zhScDlzMyTKwXft9qNFtC8VbX/L2sN8/+MXaL5+bLzkuJm6T94N0
 FLgA=
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Reply-To: HystericalDragons@proton.me

From: 安容 <HystericalDragons@proton.me>

The NanoPi R28S is a dual gigabit Ethernet router board based on the
Rockchip RK3528 SoC, designed and developed by FriendlyElec. It shares
most of its design with the NanoPi Zero2, so it builds on the common
rk3528-nanopi.dtsi.

Specification:
- Rockchip RK3528
- 1GB RAM
- eMMC socket (optional)
- MicroSD slot
- 1x 1000Base-T (GMAC1, Realtek RTL8211F)
- 1x 1000Base-T (PCIe, Realtek RTL8111H)
- AICSemi AIC8800D80 SDIO WiFi
- 3x LEDs (SYS, LAN, WAN)
- 1x USB 2.0 Type-C, peripheral only, shared with the 5V power input
- User and MaskROM buttons
- Haoyu HYM8563 RTC
- 1x USB Type-C debug UART (onboard WCH CH340E)

Assisted-by: LLM
Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 145 +++++++++++++++++++++
 2 files changed, 146 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index b677914cd3..51a9889088 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -94,6 +94,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-vicharak-vaaman.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-hinlink-h28k.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-r28s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2a.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
new file mode 100644
index 0000000000..6ad45d91cb
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2026 FriendlyElec Computer Tech. Co., Ltd.
+ * Copyright (c) 2026 安容 <HystericalDragons@proton.me>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include "rk3528-nanopi.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPi R28S";
+	compatible = "friendlyarm,nanopi-r28s", "rockchip,rk3528";
+
+	aliases {
+		mmc2 = &sdio0;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&usr_btn>;
+		pinctrl-names = "default";
+
+		button-user {
+			debounce-interval = <50>;
+			gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
+			label = "USER";
+			linux,code = <KEY_RESTART>;
+			wakeup-source;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&led1>, <&led2>, <&led_sys>;
+		pinctrl-names = "default";
+
+		led-lan {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "netdev";
+		};
+
+		led-sys {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-wan {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_WAN;
+			gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "netdev";
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-0 = <&pwr_wf>;
+		pinctrl-names = "default";
+		post-power-on-delay-ms = <100>;
+		reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&combphy {
+	status = "okay";
+};
+
+&pcie {
+	pinctrl-0 = <&pcie_eth_perstb>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc_3v3>;
+
+	status = "okay";
+};
+
+&pinctrl {
+	gpio-keys {
+		usr_btn: usr-btn {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	leds {
+		led1: led1 {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		led2: led2 {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		led_sys: led-sys {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie {
+		pcie_eth_perstb: pcie-eth-perstb {
+			rockchip,pins = <4 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wifi {
+		pwr_wf: pwr-wf {
+			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&sdio0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	sd-uhs-sdr104;
+	vqmmc-supply = <&vcc_1v8>;
+
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2m1_xfer>, <&uart2m1_ctsn>, <&uart2m1_rtsn>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	status = "okay";
+};
+
+&usb_host0_xhci {
+	/* Type-C port, shared with the 5V power input */
+	dr_mode = "peripheral";
+};

-- 
2.55.0


