Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651477;
	b=OVz3JnqVZ0FP2Pm5WOOiqwMp7/NJ+fPX6ehWoS08BWVn+a8cGxJPGpH6BEwc57jj8EKL
	 L0S/2a2cA6RVmCm/vojjKlFSd2OpYoqgYeJeCt3jloqORWNjKkEti44biqB1EoRE2JZW5
	 PO5lmu/Qp7Nev5jc1w/gBifrk4hZgw4fBk6PvG7zb4E0DE8DhVcCUQF5uk8WY7/OKk130
	 Ql78rc1JvDsDkYuk/SsGTG4Idl8m5xXhoSnz1ClTA6Vuv7+uSMYhNd/4OAyMTygPlNdHL
	 mKT05EPEXd2CU1kc6SATFLI1kHatJ+7rjv7uoUC0WUcb+QUyo6s08OIHeLaKfeeKLpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Infomaniak-Routing;
	bh=VG6hicc+0VfqQQZx1rVXD/wUDBIyLNCpFPB73SSluZs=;
	b=jv6l9r2fTqYufQHVIZjE/9Y0b2EWs268fNMvOUzS76y9OStOJmGQBf9224SIcUP8ekxf
	 wYHn1D0UGFbCg/eteqHiZv4Kfmvaf13yilOdvXEycHZ8sYy2niseEnkyQnRzx0vJpW0B5
	 Ispki7rj9hzi9eGcVBXhk95M6LrWjXs2wRekkUw96NMb9aot2BHI3yJvXzZoC4vTaJXHV
	 Jj+wz06pGC3ZpfARqxTGtTQgFhFg1HbTMMgknNSlHNwU4exQkd5tKvQC3HiXRBL41S6xh
	 HSDeBNNvStDZXDXPu94/53GZjW7JYt6ZPWSmIA38cy6DnFJsDGYx9ZQpRRWhjH+7R9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=0leil.net;
	spf=pass smtp.mailfrom=0leil.net;
	dkim=pass header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=faaHP7cK;
	arc=none smtp.remote-ip=45.157.188.8
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A657606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A657606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=faaHP7cK
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJNdT4Jd7z1qR;
	Mon,  2 Nov 2026 21:31:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1793651469;
	bh=VG6hicc+0VfqQQZx1rVXD/wUDBIyLNCpFPB73SSluZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=faaHP7cKbmxJySGJcI9JMDPl5NdFj2+L+Ngn9AhDGXYibxGr0UgPEYNLMRrAsi29a
	 YSglPwNaoSFC58ymOUrJacZxOXYhhek5xipoNU1Qf63vGnx00G0S4tX126MOAh+TlY
	 H82ZRQW80ys+b6Ky21sndFvmHaHLSv+R4D36YhVu4c1L+u1zF7eAfGpEuAVr00JI9x
	 y92tGalUuyY03sMESvnwk+cZ3FLBT0re1uAEaLusBa0L/EgPl1QurFYU8P3nHUN5pd
	 TgLznOQJvSp3QtKH1PxQcgRQDoSCuC3E42DD1R0v8FatSgITfSxX/U4M5g6MmS7b8p
	 SbSfT1PZ07lMQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJNdS5y1nzwN;
	Mon,  2 Nov 2026 21:31:08 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 02 Nov 2026 21:30:50 +0100
Subject: [PATCH 1/2] arm64: dts: rockchip: enable OV9281 CAM0 P14 on RK3588
 Jaguar
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
Message-Id: <20261102-jaguar-cam0-cam1-v1-1-c3aafcdab5dd@cherry.de>
References: <20261102-jaguar-cam0-cam1-v1-0-c3aafcdab5dd@cherry.de>
In-Reply-To: <20261102-jaguar-cam0-cam1-v1-0-c3aafcdab5dd@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

RK3588 Jaguar has two proprietary camera connectors, P14 and P15. This
adds support for the only camera module we currently have for this
connector, on P14.

The camera module has a 2-lane OV9281 camera sensor, an IMU, a
magnetometer and an EEPROM.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 .../dts/rockchip/rk3588-jaguar-p14-ov9281.dtso     | 113 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  36 ++++++-
 3 files changed, 153 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 442d322a20cf7..cf977e883c374 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -204,6 +204,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-h96-max-v58.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-can1-can2-uart4.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtbo
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-p14-ov9281.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-lubancat-5io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-mnt-reform2.dtb
@@ -336,6 +337,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-can1-can2-uart4.dtb
 rk3588-jaguar-can1-can2-uart4-dtbs := rk3588-jaguar.dtb \
 	rk3588-jaguar-can1-can2-uart4.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-p14-ov9281-p15-ov9281.dtb
+rk3588-jaguar-p14-ov9281-p15-ov9281-dtbs := rk3588-jaguar.dtb \
+	rk3588-jaguar-p14-ov9281.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtb
 rk3588-jaguar-ethernet-switch-dtbs := rk3588-jaguar.dtb \
 	rk3588-jaguar-ethernet-switch.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p14-ov9281.dtso b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p14-ov9281.dtso
new file mode 100644
index 0000000000000..155101c8497de
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p14-ov9281.dtso
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Cherry Embedded Solutions GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/rockchip,rk3588-cru.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&csi_dphy0 {
+	status = "okay";
+};
+
+&csi2 {
+	status = "okay";
+};
+
+&csi2_in {
+	csi2_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		data-lanes = <1 2>;
+		link-frequencies = /bits/ 64 <400000000>;
+		remote-endpoint = <&cam0_output>;
+	};
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	clock-frequency = <400000>;
+	#size-cells = <0>;
+	status = "okay";
+
+	magnetometer@1e {
+		compatible = "st,lis2mdl";
+		reg = <0x1e>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PC7 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-0 = <&cam0_imu_int3>;
+		pinctrl-names = "default";
+		vdd-supply = <&vcc_2v8_imu>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+
+	eeprom@50 {
+		compatible = "st,24c64", "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+		vcc-supply = <&vcc_1v8_s3>;
+	};
+
+	camera@60 {
+		compatible = "ovti,ov9281";
+		reg = <0x60>;
+		assigned-clocks = <&cru CLK_MIPI_CAMARAOUT_M1>;
+		assigned-clock-rates = <24000000>;
+		avdd-supply = <&vcc_2v8_cam>;
+		clocks = <&cru CLK_MIPI_CAMARAOUT_M1>;
+		dovdd-supply = <&vcc_1v8_s3>;
+		dvdd-supply = <&cam_vcc_1v2>;
+		pinctrl-0 = <&cam0_rst &mipim0_camera1_clk>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio0 RK_PB0 GPIO_ACTIVE_HIGH>;
+
+		port {
+			cam0_output: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csi2_input>;
+			};
+		};
+	};
+
+	imu@6a {
+		compatible = "st,lsm6dsr";
+		reg = <0x6a>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PC0 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-0 = <&csi0_imu_int1>;
+		pinctrl-names = "default";
+		vdd-supply = <&vcc_2v8_imu>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+};
+
+&pinctrl {
+	cam0_p14 {
+		cam0_imu_int3: cam0-imu-int3 {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		cam0_rst: cam0-reset {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		csi0_imu_int1: csi0-imu-int1 {
+			rockchip,pins = <1 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&vicap {
+	status = "okay";
+};
+
+&vicap_mmu {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 0446834e84d5d..99baf89167d35 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -40,6 +40,16 @@ aliases {
 		rtc0 = &rtc_twi;
 	};
 
+	cam_vcc_1v2: regulator-cam-vcc-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_vcc_1v2";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vcc_1v2_s3>;
+	};
+
 	chosen {
 		stdout-path = "serial2:115200n8";
 	};
@@ -123,7 +133,26 @@ vcc_1v2_s3: regulator-vcc-1v2-s3 {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
-	/* Exposed on P14 and P15 */
+	vcc_2v8_cam: regulator-vcc-2v8-cam {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_2v8_cam";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vcc_2v8_s3>;
+	};
+
+	vcc_2v8_imu: regulator-vcc-2v8-imu {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_2v8_imu";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vcc_2v8_s3>;
+	};
+
 	vcc_2v8_s3: regulator-vcc-2v8-s3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_2v8_s3";
@@ -437,6 +466,11 @@ &i2c1 {
 	pinctrl-names = "default";
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2m3_xfer>;
+	pinctrl-names = "default";
+};
+
 &i2c6 {
 	pinctrl-0 = <&i2c6m4_xfer>;
 	pinctrl-names = "default";

-- 
2.56.0

