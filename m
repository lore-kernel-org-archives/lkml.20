Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F8E2F60CC;
	Sat, 19 Sep 2026 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789813705; cv=none; b=cAs22PJuTb3tembsDzDtfNXLbDEEeY3XXGYaoxAY0goS3tuJzTMuHBA6abwjFXUSjfzOFsKsenf5z0/gt+XLCHrLCUygPG8421swxf5CEyXtFy7n2dkoL1uZbFyOmNbZ4SzPYio84IqwI0IPPXN56iTLdXvNKd5UDvHSli2uDI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789813705; c=relaxed/simple;
	bh=4xyy6NrJdiBNfkE7H63oBX0hpY5sXGuE/HGHGvQygkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NQb3i5beH8g/Yv036M0YoTCzLHAIXuo/fdbD6ygWB4/pgAkTD2k/2dMneol/VaxFw0/3sV5sR7jYy8RHk+LO1xsj7qAS2+xs3Opo1O7lBrUqI3+9eg+o65KCSrVGRI0mEVsPrEbiZYuUleYILQtAFK3aoWG/kgpDKgfP0M/i6DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6UrPncW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6UrPncW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70EE8C2BCFB;
	Sat, 19 Sep 2026 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789813705;
	bh=4xyy6NrJdiBNfkE7H63oBX0hpY5sXGuE/HGHGvQygkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=m6UrPncWcutPaC/aA0yIxH9fax80yaAC4ClT4eoUbOrn6o41hehlZcl9uWMElmqBo
	 gsCJUv2sRl6zWDfdkHGFSSrrRwu1kJwlXW9QKqHuwqBu1ZwG6BGiLlPIwpi9TBeDaf
	 sQnXhwMdtigDNul/9FwVY1a//5YVj+dvw6GbO6B1DGT5o5WUI9CeqHY113k3W6RTis
	 WXCvUW9oVItEJw5miKrwUCUeuFqNOxPvwcEFi4NpBbddi2HotlLq43d8EZiTyitANE
	 yqmYe8JjFfMM2O6NWe9PlJGg/0armj/LPMo3cpQa1OpSI7/ALVfQ58dSYUFNG55R8l
	 /OlWTwFr7RTsg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D4AC982D7;
	Sat, 19 Sep 2026 10:28:25 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Sat, 19 Sep 2026 18:28:19 +0800
Subject: [PATCH v7 3/3] arm64: dts: rockchip: Add devicetree for the
 FriendlyElec NanoPi R28S
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260919-r28s-upstream-v7-3-e80a6f8ef521@proton.me>
References: <20260919-r28s-upstream-v7-0-e80a6f8ef521@proton.me>
In-Reply-To: <20260919-r28s-upstream-v7-0-e80a6f8ef521@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>, 
 jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5467;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=NuAc4jMDfk/Tx8+/OfV/iX5ruACbgsmXbYkj7OTFAfs=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqx1yceXr2ayXmq7evK12Getv6IOS7/RWDCr5tS/nrtyH
 +Yk1S9z7ihlYRDjYpAVU2SR3VQdKbQqemYRi9RxmDmsTCBDGLg4BWAihW8YGS5WrotmfXCFa8GR
 Oyopu0Kfah5es3NNpzn7309rdkxYlW7DyLD1uCPzZPa0hdkMVhIbjvdZnbpvwLkgednNhqZ/7KL
 5zxkB
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
- AICSemi AIC8800D80 SDIO WiFi + Bluetooth
- 3x LEDs (SYS, LAN, WAN)
- 1x USB 2.0 Type-C OTG, shared with the 5V power input
- User and MaskROM buttons
- Haoyu HYM8563 RTC
- 1x USB Type-C debug UART (onboard WCH CH340E)

The AIC8800D80 has no upstream driver yet, so only the SDIO and UART
controllers it hangs off are enabled, along with the WiFi and Bluetooth
wake and power pins taken from the schematics.

Assisted-by: LLM
Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 160 +++++++++++++++++++++
 2 files changed, 161 insertions(+)

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
index 0000000000..294b66f60e
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2026 FriendlyElec Computer Tech. Co., Ltd.
+ * Copyright (c) 2026 安容 <HystericalDragons@proton.me>
+ */
+
+/dts-v1/;
+
+#include "rk3528-nanopi.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPi R28S";
+	compatible = "friendlyarm,nanopi-r28s", "rockchip,rk3528";
+
+	aliases {
+		mmc2 = &sdio0;
+		serial2 = &uart2;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio4_b2_usr_btn>;
+
+		button-user {
+			debounce-interval = <50>;
+			gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
+			label = "USER";
+			linux,code = <BTN_1>;
+			wakeup-source;
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwr_wf>;
+		post-power-on-delay-ms = <100>;
+		reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&combphy {
+	status = "okay";
+};
+
+&led1 {
+	default-state = "off";
+	function = LED_FUNCTION_WAN;
+	linux,default-trigger = "netdev";
+};
+
+&leds {
+	pinctrl-names = "default";
+	pinctrl-0 = <&led_sys_pin>, <&led1_pin>, <&led2_pin>;
+
+	led-2 {
+		color = <LED_COLOR_ID_GREEN>;
+		default-state = "off";
+		function = LED_FUNCTION_LAN;
+		gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
+		linux,default-trigger = "netdev";
+	};
+};
+
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_eth_perstb>;
+	reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&pinctrl {
+	bluetooth {
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <1 RK_PB5 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		host_wake_bt: host-wake-bt {
+			rockchip,pins = <1 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	gpio-keys {
+		gpio4_b2_usr_btn: gpio4-b2-usr-btn {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	leds {
+		led2_pin: led2-pin {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
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
+		host_wake_wl: host-wake-wl {
+			rockchip,pins = <1 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pwr_wf: pwr-wf {
+			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wl_wake_host: wl-wake-host {
+			rockchip,pins = <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_down>;
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
+	no-mmc;
+	no-sd;
+	non-removable;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&uart2 {
+	dma-names = "tx", "rx";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2m1_xfer>, <&uart2m1_ctsn>, <&uart2m1_rtsn>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usb_host0_xhci {
+	/*
+	 * The Type-C port is also the 5V power input, so it comes up as a
+	 * device, but host mode works with an externally powered hub.
+	 */
+	extcon = <&usb2phy>;
+	maximum-speed = "high-speed";
+	phys = <&usb2phy_otg>;
+	phy-names = "usb2-phy";
+	status = "okay";
+};
+
+&usb2phy {
+	status = "okay";
+};
+
+&usb2phy_otg {
+	status = "okay";
+};

-- 
2.55.0


