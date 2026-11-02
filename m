Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651478;
	b=AMGJSV0JFGZMOxiCKnC/Kmsd8+vVn6+CRKWHgdqM4nr3AFdIc1b9BKMv+sA7epvN+oId
	 2C4IKJft4qektkQXtRxOCg6aeQjYTyneNTzh2Wsb5YBPkJGAjCILPdivLzgie8OyzFQnA
	 qRjsvNVDldFanwHqR3qang+bRNCsVfKHXghqMExXQGd2hbw32fTxOg5HnbwDsEsng9ivg
	 kzyOfEOt5+5cC122srKNFyGii3ba5EoMLuQNsK3uNnv1iIBFuKsaFDi7B/I2RwvqU4lKY
	 AXTDUfI+6LKSKEH5t3sKIU2PTuJ7DChwxtNjw6fsE9z1h1C0EnefSWb54Cz1L4doe6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Infomaniak-Routing;
	bh=idKzcjTBT+XjUpCOB5lj/EsKFEpg/iNtWZ9TOL8TpKA=;
	b=pt7k3RFweJoR5ar/n8M62blXaAJvYP+6FWXfG99VVvlFQY9QjRP8uWytI5a+RQ0JDYWy
	 FDSD4k6FcPFa2zyLt1MYINDKEIXMjWj0IuDbg1zkf4Xq3VqbYCONJewIFxlzRnb57ph8Q
	 gCPrZ+MzLXulsmlk5rG/4zwwvfRRmvZPV9xEbo+IWKMXsvY/lYXu1X6I5oCBDbGUI9tsG
	 M4K4BItELpKu1EjN1p0wsvOT9+vLbWNvmw9iMgs6POQzaxJwD8hjXsPNcYlPIlRtdAKNH
	 jO/takRAf3Bb/AnG/kto8gpls2KmYqter3ijYpTKu/GrPvJ4hEJqBBrAqfL8Mvep4xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=0leil.net;
	spf=pass smtp.mailfrom=0leil.net;
	dkim=pass header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=USbkMKoS;
	arc=none smtp.remote-ip=45.157.188.8
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287EE606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 287EE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=USbkMKoS
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJNdV1kt9z2j4;
	Mon,  2 Nov 2026 21:31:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1793651469;
	bh=idKzcjTBT+XjUpCOB5lj/EsKFEpg/iNtWZ9TOL8TpKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=USbkMKoSyvMY7kMIPjV89ErHeiGk0gaAllog+tCec8XEFstxLQxbESQLNWIgkjT4q
	 NROIurzBKNzjvs6jKfMvttZ1KOwmIpi5cQRC+M6YoNoYFxnCZ/d7TlG2uRprRgbaE2
	 Jr+UZmnZDxtOsMo5S42m/aNJUsSrBHCEOdacRQYdpIBSV1ftC+1HUB+EtcAYnsgXZF
	 sqAQBIHbq1ffAL2tDRnmVCI3IDAcflJ4djGbxp9t+SmSxC3fEflzl8MS4uwNt1DFQ/
	 D+5RM/QzjYJipgPh0cdPL3uYWXSY8n5P5BUjX425NdJJyZk1z+YOIULrbzYW/NfXN0
	 0piPiaciF6V3g==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJNdT3HLDzb2;
	Mon,  2 Nov 2026 21:31:09 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 02 Nov 2026 21:30:51 +0100
Subject: [PATCH 2/2] arm64: dts: rockchip: enable OV9281 CAM1 P15 on RK3588
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
Message-Id: <20261102-jaguar-cam0-cam1-v1-2-c3aafcdab5dd@cherry.de>
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
connector, on P15.

The camera module has a 2-lane OV9281 camera sensor, an IMU, a
magnetometer and an EEPROM.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   4 +-
 .../dts/rockchip/rk3588-jaguar-p15-ov9281.dtso     | 112 +++++++++++++++++++++
 2 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index cf977e883c374..e89e3123cb719 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -205,6 +205,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-can1-can2-uart4.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-p14-ov9281.dtbo
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-p15-ov9281.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-lubancat-5io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-mnt-reform2.dtb
@@ -339,7 +340,8 @@ rk3588-jaguar-can1-can2-uart4-dtbs := rk3588-jaguar.dtb \
 
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-p14-ov9281-p15-ov9281.dtb
 rk3588-jaguar-p14-ov9281-p15-ov9281-dtbs := rk3588-jaguar.dtb \
-	rk3588-jaguar-p14-ov9281.dtbo
+	rk3588-jaguar-p14-ov9281.dtbo \
+	rk3588-jaguar-p15-ov9281.dtbo
 
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtb
 rk3588-jaguar-ethernet-switch-dtbs := rk3588-jaguar.dtb \
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p15-ov9281.dtso b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p15-ov9281.dtso
new file mode 100644
index 0000000000000..051a5f9a7d4e2
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p15-ov9281.dtso
@@ -0,0 +1,112 @@
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
+&csi_dphy1 {
+	status = "okay";
+};
+
+&csi4 {
+	status = "okay";
+};
+
+&csi4_in {
+	csi4_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		data-lanes = <1 2>;
+		link-frequencies = /bits/ 64 <400000000>;
+		remote-endpoint = <&cam1_output>;
+	};
+};
+
+&i2c7 {
+	#address-cells = <1>;
+	clock-frequency = <400000>;
+	#size-cells = <0>;
+
+	magnetometer@1e {
+		compatible = "st,lis2mdl";
+		reg = <0x1e>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PB0 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-0 = <&cam1_imu_int3>;
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
+		assigned-clocks = <&cru CLK_MIPI_CAMARAOUT_M2>;
+		assigned-clock-rates = <24000000>;
+		avdd-supply = <&vcc_2v8_cam>;
+		clocks = <&cru CLK_MIPI_CAMARAOUT_M2>;
+		dovdd-supply = <&vcc_1v8_s3>;
+		dvdd-supply = <&cam_vcc_1v2>;
+		pinctrl-0 = <&cam1_rst &mipim0_camera2_clk>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+
+		port {
+			cam1_output: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csi4_input>;
+			};
+		};
+	};
+
+	imu@6a {
+		compatible = "st,lsm6dsr";
+		reg = <0x6a>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <RK_PC4 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-0 = <&csi1_imu_int1>;
+		pinctrl-names = "default";
+		vdd-supply = <&vcc_2v8_imu>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+};
+
+&pinctrl {
+	cam1_p15 {
+		cam1_imu_int3: cam1-imu-int3 {
+			rockchip,pins = <1 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		cam1_rst: cam1-reset {
+			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		csi1_imu_int1: csi1-imu-int1 {
+			rockchip,pins = <2 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
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

-- 
2.56.0

