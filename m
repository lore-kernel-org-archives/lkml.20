Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309135908B9;
	Wed,  9 Sep 2026 14:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964436; cv=none; b=CS4vFJTjblIvDI51yzidIFg+lriIC/eU4LXEIl6Lqibet+ClmKmsrv33tYTmkLFj1DJ5menGeqjcL3dxKLqMceDVsIzdsSCjeJ8fP0RTSk23epeYGtQr17U1t2lB9ExJJVpUMM0h2xDJ4uFwcmbF92Gh78AS5epf4CuysajVZUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964436; c=relaxed/simple;
	bh=FgYAt4FdKYRaHvN/Jovmu1CGu4q+km/qUNCr8TO8xwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGpSQzcfnu0KQ5BTOBXPZnh8nwUXHynNCtxbPY0YGt0ZkrSePeGX84uZV5tt6lCegGZK/uftNzy9mRevOp5Bjfb3xoK+wVqrVv2gCG07/EG/RwfCSxDifbrT+LnXwT5a+d2Pe2OMIaBj/Bn10QSdvBJ08mQCzyBFOZcbsIf1EaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSDSqR9N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSDSqR9N"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF5CBC2BCFB;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788964435;
	bh=FgYAt4FdKYRaHvN/Jovmu1CGu4q+km/qUNCr8TO8xwE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dSDSqR9NYHZPXJdLKkHQZSfdvCQUzG6w9qXm7qH34YR0/ODBkPFJ4kkwD4uT5UaKT
	 /Ycjuw8ArmuMvoET1oNSpr2dwe1cIV9VKyfYFoE8rnF2yv1ZjTO8cyzDUxhTEcGXar
	 hYKgy4Z8zb3azsOLEzJTrA68QlHj/2srEFDIQfGRy/kl7ch84qcThAjA9WE0DMdtD7
	 XDxPIbw0D8YrnzColj3cBktajy2mtF0qoWjOde2otC2sv7YfPZxWSkcjfdIdvpzFrX
	 6vWanek3cwHyBlUglaWX0hRkagI92lVNLpNgWfpHSwbdE3snMd4/p81jTLbR0283ns
	 F9Cv4xvlYbZdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD068C79FBB;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Wed, 09 Sep 2026 22:33:26 +0800
Subject: [PATCH v3 5/5] arm64: dts: rockchip: Follow the DTS coding style
 in the NanoPi RK3528 devicetrees
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-r28s-upstream-v3-5-ee3e1a34a353@proton.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4985;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=Dx8JcLzyZT+3t40Yo8VLHukY1rcwOrhijfk5CDwzcYM=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqyFeYE7JdWva/W4qp3d+23SVVPXZafqJcsLzBN33Zij9
 7zK9mJQRykLgxgXg6yYIovspupIoVXRM4tYpI7DzGFlAhnCwMUpABPZZcfwm82k4GDV/Emnb8i8
 nLFiVVn0j+zz0WdEazScD7FsUP92zI+R4eaXS3cN3RfbX3Z2tN3bHW41r/GnWYewgeLUidfPJzE
 U8gMA
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Reply-To: HystericalDragons@proton.me

From: 安容 <HystericalDragons@proton.me>

scripts/dtc/dt-check-style --mode=strict reports two deviations from
Documentation/devicetree/bindings/dts-coding-style.rst in the shared
NanoPi RK3528 devicetree and in the NanoPi Zero2 board devicetree:
"pinctrl-0" has to sort before "pinctrl-names", and "status" has to be
preceded by a blank line when the node has content before it.

Sort the properties and add the missing blank lines. The generated
devicetree blobs are unchanged.

The remaining findings of the tool are left alone, as they contradict
the established practice in arch/arm64/boot/dts/rockchip: "model"
before "compatible", "regulator-name" before the other regulator
properties, "regulator-min-microvolt" before "regulator-max-microvolt",
"pwms" before "pwm-supply" and "linux,code" before "wakeup-source" or
"press-threshold-microvolt".

Suggested-by: Diederik de Haas <diederik@cknow-tech.com>
Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      |  5 +++--
 arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 26 +++++++++++++++-------
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
index 48e4273872..96c537da6a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
@@ -25,8 +25,8 @@ button-recovery {
 
 	leds {
 		compatible = "gpio-leds";
-		pinctrl-names = "default";
 		pinctrl-0 = <&led1>, <&led_sys>;
+		pinctrl-names = "default";
 
 		led-0 {
 			color = <LED_COLOR_ID_RED>;
@@ -59,8 +59,8 @@ usb2_host_5v: regulator-5v0-usb2-host {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&usb20_host1_pwren>;
+		pinctrl-names = "default";
 		regulator-name = "usb2_host_5v";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -96,5 +96,6 @@ &usb_host0_ohci {
 
 &usb2phy_host {
 	phy-supply = <&usb2_host_5v>;
+
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi
index 1980d14d6f..45e31b90a7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi
@@ -77,8 +77,8 @@ vcc_3v3: regulator-3v3-vcc {
 	vcc3v3_sd: regulator-3v3-vcc-sd {
 		compatible = "regulator-fixed";
 		gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_LOW>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&sdmmc_pwren_l>;
+		pinctrl-names = "default";
 		regulator-name = "vcc3v3_sd";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -97,8 +97,8 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
 	vccio_sd: regulator-vccio-sd {
 		compatible = "regulator-gpio";
 		gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&sdmmc_vol_ctrl_h>;
+		pinctrl-names = "default";
 		regulator-name = "vccio_sd";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
@@ -152,20 +152,23 @@ &gmac1 {
 	phy-handle = <&rgmii_phy>;
 	phy-mode = "rgmii-id";
 	phy-supply = <&vcc_3v3>;
-	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
 		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>, <&gmac1_rstn_l>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
 &gpu {
 	mali-supply = <&vdd_logic>;
+
 	status = "okay";
 };
 
 &i2c1 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1m0_xfer>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	hym8563: rtc@51 {
@@ -174,8 +177,8 @@ hym8563: rtc@51 {
 		#clock-cells = <0>;
 		interrupt-parent = <&gpio4>;
 		interrupts = <RK_PC1 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&rtc_int_l>;
+		pinctrl-names = "default";
 		wakeup-source;
 	};
 };
@@ -216,19 +219,22 @@ sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
 };
 
 &pwm1 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&pwm1m0_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
 &pwm2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&pwm2m0_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
 &saradc {
 	vref-supply = <&vcc_1v8>;
+
 	status = "okay";
 };
 
@@ -241,6 +247,7 @@ &sdhci {
 	non-removable;
 	vmmc-supply = <&vcc_3v3>;
 	vqmmc-supply = <&vcc_1v8>;
+
 	status = "okay";
 };
 
@@ -252,12 +259,14 @@ &sdmmc {
 	sd-uhs-sdr104;
 	vmmc-supply = <&vcc3v3_sd>;
 	vqmmc-supply = <&vccio_sd>;
+
 	status = "okay";
 };
 
 &uart0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&uart0m0_xfer>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
@@ -266,6 +275,7 @@ &usb_host0_xhci {
 	maximum-speed = "high-speed";
 	phys = <&usb2phy_otg>;
 	phy-names = "usb2-phy";
+
 	status = "okay";
 };
 

-- 
2.55.0


