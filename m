Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581572;
	b=kJqhMmITpDTzz+LYV9q6Nf+sJ6aMmMjttAxJS9WIwRoLNvjMH9v1wWK4LFUVmFYK41hd
	 BM+i7QqNEc9EsvDb53E8vF7B265iS/T99wPwhtVttgQCyH6yMDvQ8DBfe7zW3d62xqpF7
	 6Aro90hVvH/7MGSOyP0PAbpSb8ljGBz8WUqXWF295fWPc07qyBnY40PP1USt5yMVMHkH2
	 JDPEbKiw/KUMUVsOxBg3a3vMuPhqZwSxX0V1ALN7umoWtK+4FZdaOruTF+Un1dt5IdjO9
	 rrRR6gsS7yw5uDWdyIvzqbWjoND6EAMsZJKNQgCcnR163oTrzd3zlaOM2Y501T47zCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Infomaniak-Routing;
	bh=x15c4RWQyZd3P3XWS5iWIOHM9youpfWPrHBtj/xpwJs=;
	b=w20KC/XMAnoMrNFNZfIocbbZoVx4LtRU3075rVyAQRpf6HtMXCLv8giA0Rxgpg4KZcK2
	 eGtN/gxeZTfMLbCRDL6KZYMxYyIWmhc4MyyyTvwTjC+OuKXb4SLDZCVqjd3NlhHWucUme
	 kXpgbF0oOcel5EUEj4b/98NXvm8GdYDiLsM/3syJbBoNDFuhC7hSt5ICvXEZ39kknUoZk
	 vYMv8GP7IMSOBjRcINdljgqiAUhCYoqY+qOs/HSXL0odFUrcEKJvtPpCKhZtUBeKQN4Qz
	 rD2LTTxltmbbQirwWdkkcDg8bYPIpfgFHOUW6/VoQsJoFrIVPk9oNwDA6W0msckW7zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=0leil.net;
	spf=pass smtp.mailfrom=0leil.net;
	dkim=pass header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=ZQuENgGV;
	arc=none smtp.remote-ip=84.16.66.174
Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch [84.16.66.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3EB606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D3EB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=ZQuENgGV
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jR0c11csJzG96;
	Fri, 13 Nov 2026 15:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1794581568;
	bh=x15c4RWQyZd3P3XWS5iWIOHM9youpfWPrHBtj/xpwJs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZQuENgGVmSOmWaut1R7uWdqbIQ6qVS/7CNF/69Uy4+rkSNiDf2doV3KumepG6sRNO
	 euH0vFObNVUPQCsnp3UWGH9hZbXgqEtylrFFsgvE9uEkT8LFS4RL4c+H6OV1EHiGyp
	 lj2TEyD1N9tKiB+/KFd6MqRc50FvEghF8t6FFOJ4Gg3vrDQa4j8/VJVoIVJd8/IQ7E
	 k3CQZD3tKyxAysjRcbukO8pwVsRlxUwa07MC9jjcUpDzOQdkL7v2vkQVLwOB8bJSQn
	 KLE/lzBsd6hw42SLXZOjVPWeM+aiQvWx0UmHnDk89OscoyS1LcRh+SfLj0GquTl4Vg
	 m5G0tDvaxRE/g==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jR0bz6QKHzmtk;
	Fri, 13 Nov 2026 15:52:47 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 13 Nov 2026 15:52:24 +0100
Subject: [PATCH v2 2/2] arm64: dts: rockchip: enable OV9281 CAM1 P15 on
 RK3588 Jaguar
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
Message-Id: <20261113-jaguar-cam0-cam1-v2-2-3e9377e3c882@cherry.de>
References: <20261113-jaguar-cam0-cam1-v2-0-3e9377e3c882@cherry.de>
In-Reply-To: <20261113-jaguar-cam0-cam1-v2-0-3e9377e3c882@cherry.de>
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
 .../dts/rockchip/rk3588-jaguar-p15-ov9281.dtso     | 119 +++++++++++++++++++++
 2 files changed, 122 insertions(+), 1 deletion(-)

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
index 0000000000000..507fca0948243
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-p15-ov9281.dtso
@@ -0,0 +1,119 @@
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
+		pinctrl-0 = <&csi1_imu_int1 &cam1_imu_cs &cam1_imu_sa0>;
+		pinctrl-names = "default";
+		vdd-supply = <&vcc_2v8_imu>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+};
+
+&pinctrl {
+	cam1-p15 {
+		cam1_imu_cs: cam1-imu-cs {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_output_high>;
+		};
+
+		cam1_imu_int3: cam1-imu-int3 {
+			rockchip,pins = <1 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		cam1_imu_sa0: cam1-imu-sa0 {
+			rockchip,pins = <2 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
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
2.56.1

