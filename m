Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC8C3F4DE2;
	Mon, 14 Sep 2026 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374257; cv=none; b=jZOF8xuc3H/VUKByNIVkQrsaq8FYdHhJbnWTTdYRMQBoqXVS+cWcQybxY7m3Mtxe22dsUwCra+MZwD6f/jrvaUNnc0gpdj1bU+vWDW2TW70JklUzGYzqCh9hR5FhfPpfQmLdrJPSVpuRX4BkkGJ1xraKuF9SlNySBnkfRLqQrwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374257; c=relaxed/simple;
	bh=Kmzg1hLY7k2PqqnnJPw4xAFnJIs4MxWG1yajjZhsdWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=COVdCD7zdXv6hVxGg1k1768Ypg3WiXumc5ZO62j/LgvO+S2M9zBxVu1FK+DIUMwowfk3monc3qOahq2u8lyAflz/HmRF1v8uDn+XSLhwv1FG7Gfzm/ysNrwKRLs1brXE2thg2TAX9AhNXZzP4bH5G7kTEUlIgNu2mJ6QeCNmdoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IiO5y3dP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IiO5y3dP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EE70C2BCFB;
	Mon, 14 Sep 2026 08:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789374257;
	bh=Kmzg1hLY7k2PqqnnJPw4xAFnJIs4MxWG1yajjZhsdWU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IiO5y3dPQKm24jLWwAXVpfEZgkqwB9/KSDqOyiWH52WNY+oqcLHySKJLXhmAFfu6d
	 /zyd0gcqiSIRw2O2kn6KV6+IjUMDcJc5YgX0ZkNEu4ML2ixoqkF4beS2gauzFYRVkN
	 iosRj94Z9CXqZ4zEYAAgrbmhkG/GjbOC/XkRHPxRwsCigtR4BYsLmrAcnOYPb7mvep
	 K0rHNaCfA3xM1Up9La45gC13mS3ySESdav0UmxX0UW/BVviwi6KScnnoyVKHuGL7vw
	 JNlxiCPaI2mO7Df1/udeRFh4j5YsG0He0PSTI4M6wiHO5BQJ8RKk5UANcFb/LmjYeb
	 omlgQQgonPq7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12435C88E6E;
	Mon, 14 Sep 2026 08:24:17 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Mon, 14 Sep 2026 16:24:09 +0800
Subject: [PATCH v5 3/4] arm64: dts: rockchip: Add devicetree for the
 FriendlyElec NanoPi R28S
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-r28s-upstream-v5-3-7409c498e8dc@proton.me>
References: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me>
In-Reply-To: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4506;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=YeTn1EqtodMCk/Sr4EeoKVVQbqIxuHoF6Z4x3WjihKs=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqzl6/WVtupU87/x1eO7v8C8MFSrsLr3YXuJ6Zbyo6XRs
 /qtrrt3lLIwiHExyIopsshuqo4UWhU9s4hF6jjMHFYmkCEMXJwCMJF1DQz/00LkOPv4Fu2/Ltu8
 aFqyivOhIxOtzt9Ze4DhXi3LtYneNowMlza/35V+/g+/QKRu7DRmxjP1cQLq1YwPmqcaZnyJL7v
 DAAA=
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
 .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 127 +++++++++++++++++++++
 2 files changed, 128 insertions(+)

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
index 0000000000..0b7bbc0122
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
@@ -0,0 +1,127 @@
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
+		pinctrl-names = "default";
+		pinctrl-0 = <&usr_btn>;
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
+&leds {
+	pinctrl-0 = <&led1>, <&led2>, <&led_sys>;
+
+	led-1 {
+		color = <LED_COLOR_ID_GREEN>;
+		default-state = "off";
+		function = LED_FUNCTION_WAN;
+		gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
+		linux,default-trigger = "netdev";
+	};
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
+		led2: led2 {
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2m1_xfer>, <&uart2m1_ctsn>, <&uart2m1_rtsn>;
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


