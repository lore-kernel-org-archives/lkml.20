Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601304F30C4;
	Wed, 30 Sep 2026 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785574; cv=none; b=GBRqz2xL7/f4BQ5CaqcKqh13PNxNt7r7V4UYy2HL8/zjzy+XVQPS5urNNe9Jk05xQZf0nvPT9iCNbE5ReM6Vl2QRyCzUTQjxpxGBUpeoDvA1Dh3eP2Uc2oF5IcveDpngq0TERvI2vWdCtMd0/4ffT3y8KaP+LMwR/p+FFhi0rYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785574; c=relaxed/simple;
	bh=X2rGw+kSX9T0rD9VFedQTCO5J0zKnzpowQmRpS2MaFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhW4gwPkm8jQUZ96yOmeDRtDAEtQFJXJUtzOgSXC1ZyBYlvnp12o9sZnmifvb6YiI2VE9Oyu0rRN3Gfm5BzRGggT8+T1Cwz5s5uNK4bjdQCXUkAIEa9MoqVC3lowuxP4M2+HeZNxYwmBJuwmCsRPxOWf+XOsAEuudfEGlehtILM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=AJb2YSPu; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="AJb2YSPu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=4S4Ky9H6NIrDlJuACD42DZExJrayfct7UMHssAIDYYg=; b=AJb2YSPuw7wtv4lkmK3uAK72s1
	juNhAS6pj1bKUB/xj9E0hcOOFuas8ZYh1KyOS7wK591AxijFqMepwBtU1cCIbC8D2gup+djNLc4WZ
	Bqx7D12iS5vxXEkTMbWhKsQ9eGpi7lb7c9A73a4jFbTByNFLnqVot7XgpfWl80o3PFR4+oQsJjO2Z
	zse8Arb1xRB7LR/BKAPAz8UX5wvqDsDM72LmNOsizfBcMUhfeX/ti6QLlOGEX9FSAYeDHi/PlGuPt
	nO0eKNyWHuU/nIvyynSTbrw8DkKePkUTdWJTAQlkQ3UkQOuPIdURta3RyTiXoSJptIN1Hpv23iWJu
	MGl5Xv9g==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	damon.ding@rock-chips.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v5 2/2] arm64: dts: rockchip: add RK3588 DP carrier from Theobroma Systems
Date: Wed, 30 Sep 2026 18:25:44 +0200
Message-ID: <20260930162545.2357505-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930162545.2357505-1-heiko@sntech.de>
References: <20260930162545.2357505-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The DisplayPort carrier is a very simple baseboard only providing serial,
ethernet and a displayport output.

But its main functionality is that it routes the Analogix eDP controller
to this DisplayPort output, which allows to test that controller simply
by hooking it up to a suitable monitor.

The Analogix-DP controller supports eDP 1.3 and DP 1.2, so can drive
both eDP displays as well as full DP monitors. It does not support DP+
so passive DP-to-HDMI adapters won't work.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rk3588-tiger-displayport-carrier.dts      | 113 ++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 2edc9c0aceb5..bf80afba2351 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -217,6 +217,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus-radxa-cam4k-cam0.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus-radxa-cam4k-cam1.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5t.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-displayport-carrier.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-video-demo.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts b/arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts
new file mode 100644
index 000000000000..f6e95047fd5f
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2024 Cherry Embedded Solutions GmbH
+ */
+
+/dts-v1/;
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include "rk3588-tiger.dtsi"
+
+/ {
+	model = "Theobroma Systems RK3588-Q7 SoM on Tiger Displayport Carrier v1";
+	compatible = "tsd,rk3588-tiger-displayport-carrier", "tsd,rk3588-tiger", "rockchip,rk3588";
+
+	aliases {
+		ethernet0 = &gmac0;
+	};
+
+	chosen {
+		stdout-path = "serial2:115200n8";
+	};
+
+	dp-connector {
+		compatible = "dp-connector";
+		dp-pwr-supply = <&vcc3v3_baseboard>;
+		/* Q7_DP_HPD# but Q7_HDMI_HPD# could be used too */
+		hpd-gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
+		label = "dp0";
+		pinctrl-0 = <&edp0_hpd_l>;
+		pinctrl-names = "default";
+		type = "full-size";
+
+		port {
+			dp_con_in: endpoint {
+				remote-endpoint = <&edp0_out_con>;
+			};
+		};
+	};
+
+	vcc3v3_baseboard: regulator-vcc3v3-baseboard {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_baseboard";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_baseboard>;
+	};
+
+	vcc5v0_baseboard: regulator-vcc5v0-baseboard {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_baseboard";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+};
+
+&edp0 {
+	status = "okay";
+};
+
+&edp0_in {
+	edp0_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_edp0>;
+	};
+};
+
+&edp0_out {
+	edp0_out_con: endpoint {
+		remote-endpoint = <&dp_con_in>;
+	};
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&hdptxphy0 {
+	status = "okay";
+};
+
+&mmu600_pcie {
+	status = "disabled";
+};
+
+&pinctrl {
+	edp0 {
+		edp0_hpd_l: edp0-hpd-l-pin {
+			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2m2_xfer>;
+	status = "okay";
+};
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp2 {
+	vp2_out_edp0: endpoint@ROCKCHIP_VOP2_EP_EDP0 {
+		reg = <ROCKCHIP_VOP2_EP_EDP0>;
+		remote-endpoint = <&edp0_in_vp2>;
+	};
+};
-- 
2.47.3

