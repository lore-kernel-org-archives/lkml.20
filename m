Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5436E59E327;
	Tue,  8 Sep 2026 22:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788907724; cv=none; b=F6gUjeJ2Oz8NglJlfy+npN3wNQit2+fSI1a4cBzeN4wHo/hIrHYVJOnT7Y8E1o2Qi4CYI01USk3QIVvZ6bZTQyyqlbS6OVwZNU+gGwOF+1D8ZbVMy+PzCPAS3zqyliBrAEoVXN6TWE4DtRK62XW2lbaARuk21iF9pmlPrajfYho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788907724; c=relaxed/simple;
	bh=i7/DN1bY2NaG9X1nEt6ydSmCRPP2qVqDXB1S3XGqCeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qz6UByjR0EmfM5yITMQ+UO5jkf8zq1qxUGI0pZ9EDMhEKJ4YmARfmH8tZHE7jPGCwWVcONbRVyY4ZbTpK7mnbA1XhHjpKk61txRHtzpGK4p1nEs3ySKidhH6/B4W6MjRJYWETBWtDZFhE1Lbt0FMOKBTgycaKVupePW59asxowc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=h21o8jm5; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="h21o8jm5"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD630101937;
	Wed, 09 Sep 2026 00:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788907704; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=TjvAglz62cqGysOs7dyk3tIIzkYqhCxUU0IB4oFccn8=;
	b=h21o8jm5sBLAMvQEW+Q0r99XYlMiBr6mlFw6cbv3uRKNh1hV1XUAtrgGEKAhACBWaP+Ijr
	ifesugz5RrYcvj1bfohFTPrMqoLIiNDO64Du/TlrsKS8WjOtRTanS8klnEQe2tifB4E000
	IIHN3tLQS8VTYLKJuDKGtn4KSZElTcWeAyYjXLN2uUg7HmCE1yJg0W2NiS/HdtekqtHRpf
	wYnFdjA1MkS320FSyYyL4n04Pyo6btAw1/FVg3ECMHWmBzrAQAQCRk8M+8H1Nfwka4Pcs1
	/f6h8HliMRW2ddEqDPN/FUPqv9YUn4oBrJJUBiURxisCwtel87wRN260Dy/FyQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Fedor Ross <fedor.ross@ifm.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: imx8mn: Add display DT overlays for the ifm VHIP4 EvalBoard
Date: Wed,  9 Sep 2026 00:48:12 +0200
Message-ID: <20260908224821.42973-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Fedor Ross <fedor.ross@ifm.com>

Add display DT overlays for the ifm VHIP4 EvalBoard v1. This
includes two expansion modules, one populated with Displaytech
DT050BTFT-PTS panel, and the NXP ADV7533 DSI-to-HDMI adapter.
The Displaytech DT050BTFT-PTS is configured in three different
DSI lane counts to allow testing all possible DSI lane count
configurations of the VHIP4 EvalBoard.

Signed-off-by: Fedor Ross <fedor.ross@ifm.com>
Co-developed-by: Marek Vasut <marex@nabladev.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: - Fix ADV-1V8 voltage constraints
    - Fix missing CEC clock phandle
---
 arch/arm64/boot/dts/freescale/Makefile        |  16 ++
 ...-evalboard-v1-overlay-dt050btft-1lane.dtso |  16 ++
 ...-evalboard-v1-overlay-dt050btft-2lane.dtso |  16 ++
 ...-evalboard-v1-overlay-dt050btft-4lane.dtso |  16 ++
 ...evalboard-v1-overlay-dt050btft-common.dtsi | 155 ++++++++++++++++++
 ...evalboard-v1-overlay-nxp-adv7533-hdmi.dtso | 106 ++++++++++++
 6 files changed, 325 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-1lane.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-2lane.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-4lane.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-nxp-adv7533-hdmi.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 984642146dd91..1cbf7205d577c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -319,6 +319,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony-legacy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-venice-gw7902.dtb
 
+imx8mn-vhip4-evalboard-v1-overlay-dt050btft-1lane-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
+							  imx8mn-vhip4-evalboard-v1-overlay-dt050btft-1lane.dtbo
+imx8mn-vhip4-evalboard-v1-overlay-dt050btft-2lane-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
+							  imx8mn-vhip4-evalboard-v1-overlay-dt050btft-2lane.dtbo
+imx8mn-vhip4-evalboard-v1-overlay-dt050btft-4lane-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
+							  imx8mn-vhip4-evalboard-v1-overlay-dt050btft-4lane.dtbo
 imx8mn-vhip4-evalboard-v1-overlay-eeprom-1000-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
 						      imx8mn-vhip4-overlay-eeprom-1000.dtbo
 imx8mn-vhip4-evalboard-v1-overlay-eeprom-1100-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
@@ -327,6 +333,8 @@ imx8mn-vhip4-evalboard-v1-overlay-ksz8794-dtbs := imx8mn-vhip4-evalboard-v1.dtb
 						  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtbo
 imx8mn-vhip4-evalboard-v1-overlay-ksz9031-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
 						  imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtbo
+imx8mn-vhip4-evalboard-v1-overlay-nxp-adv7533-hdmi-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
+							   imx8mn-vhip4-evalboard-v1-overlay-nxp-adv7533-hdmi.dtbo
 imx8mn-vhip4-evalboard-v2-overlay-adin1300-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
 						   imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtbo
 imx8mn-vhip4-evalboard-v2-overlay-eeprom-1100-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
@@ -336,12 +344,20 @@ imx8mn-vhip4-evalboard-v2-overlay-eeprom-2000-dtbs := imx8mn-vhip4-evalboard-v2.
 imx8mn-vhip4-evalboard-v2-overlay-ksz8794-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
 						  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-vhip4-evalboard-v1.dtb \
+			  imx8mn-vhip4-evalboard-v1-overlay-dt050btft-1lane.dtb \
+			  imx8mn-vhip4-evalboard-v1-overlay-dt050btft-1lane.dtbo \
+			  imx8mn-vhip4-evalboard-v1-overlay-dt050btft-2lane.dtb \
+			  imx8mn-vhip4-evalboard-v1-overlay-dt050btft-2lane.dtbo \
+			  imx8mn-vhip4-evalboard-v1-overlay-dt050btft-4lane.dtb \
+			  imx8mn-vhip4-evalboard-v1-overlay-dt050btft-4lane.dtbo \
 			  imx8mn-vhip4-evalboard-v1-overlay-eeprom-1000.dtb \
 			  imx8mn-vhip4-evalboard-v1-overlay-eeprom-1100.dtb \
 			  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtb \
 			  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtbo \
 			  imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtb \
 			  imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtbo \
+			  imx8mn-vhip4-evalboard-v1-overlay-nxp-adv7533-hdmi.dtb \
+			  imx8mn-vhip4-evalboard-v1-overlay-nxp-adv7533-hdmi.dtbo \
 			  imx8mn-vhip4-evalboard-v2.dtb \
 			  imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtb \
 			  imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtbo \
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-1lane.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-1lane.dtso
new file mode 100644
index 0000000000000..4151765743265
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-1lane.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2021-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mn-vhip4-evalboard-v1-overlay-dt050btft-common.dtsi"
+
+&sn65dsi83_in {
+	data-lanes = <1>;
+};
+
+&mipi_dsi_bridge1_out {
+	data-lanes = <1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-2lane.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-2lane.dtso
new file mode 100644
index 0000000000000..7b1bd925f53f6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-2lane.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2021-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mn-vhip4-evalboard-v1-overlay-dt050btft-common.dtsi"
+
+&sn65dsi83_in {
+	data-lanes = <1 2>;
+};
+
+&mipi_dsi_bridge1_out {
+	data-lanes = <1 2>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-4lane.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-4lane.dtso
new file mode 100644
index 0000000000000..300d5e9536102
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-4lane.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2021-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mn-vhip4-evalboard-v1-overlay-dt050btft-common.dtsi"
+
+&sn65dsi83_in {
+	data-lanes = <1 2 3 4>;
+};
+
+&mipi_dsi_bridge1_out {
+	data-lanes = <1 2 3 4>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-common.dtsi
new file mode 100644
index 0000000000000..c82cc2eef8532
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-dt050btft-common.dtsi
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2021-2026 Marek Vasut
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx8mn-pinfunc.h"
+
+&{/} {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		/* FIXME: 200 Hz, since DT050BTFT-PTS datasheet does not say */
+		pwms = <&pwm4 0 5000000 0>;
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <75>;
+	};
+
+	lvds-decoder {
+		compatible = "ti,sn65lvds822", "lvds-decoder";
+		powerdown-gpios = <&gpio5 19 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_bridge>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_dpi_bridge_in: endpoint {
+					data-mapping = "vesa-24";
+					remote-endpoint = <&sn65dsi83_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lvds_bridge_out: endpoint {
+					remote-endpoint = <&lvds_panel_in>;
+				};
+			};
+		};
+	};
+
+	panel {
+		compatible = "displaytech,dt050btft-pts";
+		backlight = <&backlight>;
+		power-supply = <&reg_panel_3v3>;
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds_bridge_out>;
+			};
+		};
+	};
+
+	reg_panel_3v3: regulator-panel-3v3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "VCC_DISPL";
+	};
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	bridge@2d {
+		compatible = "ti,sn65dsi83";
+		enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dsi_bridge>;
+		reg = <0x2d>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi83_in: endpoint {
+					data-lanes = <1>;
+					remote-endpoint = <&mipi_dsi_bridge1_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				sn65dsi83_out: endpoint {
+					remote-endpoint = <&lvds_dpi_bridge_in>;
+				};
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_dsi_bridge: dsibridge-grp {
+		fsl,pins = <
+			/* nRESET_BRIDGE */
+			MX8MN_IOMUXC_SD1_CMD_GPIO2_IO1                  0x100
+		>;
+	};
+
+	pinctrl_lvds_bridge: lvdsbridge-grp {
+		fsl,pins = <
+			/* LVDS_RGB_SHTDN_n */
+			MX8MN_IOMUXC_I2C3_SDA_GPIO5_IO19                0x100
+		>;
+	};
+
+	pinctrl_pwm4: pwm4-grp {
+		fsl,pins = <
+			/* LCD PWM */
+			MX8MN_IOMUXC_I2C3_SCL_PWM4_OUT			0x0116
+		>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <891000000>;
+	samsung,esc-clock-frequency = <10000000>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			mipi_dsi_bridge1_out: endpoint {
+				data-lanes = <1>;
+				remote-endpoint = <&sn65dsi83_in>;
+			};
+		};
+	};
+};
+
+&pwm4 {	/* LCD backlight PWM */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm4>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-nxp-adv7533-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-nxp-adv7533-hdmi.dtso
new file mode 100644
index 0000000000000..ec093c3e079e2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-nxp-adv7533-hdmi.dtso
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2021-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	cec_clock: clk-cec-fixed {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&adv7513_out>;
+			};
+		};
+	};
+
+
+	reg_adv_1v8: regulator-adv-1v8 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "ADV-1V8";
+	};
+
+	reg_adv_3v3: regulator-adv-3v3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "ADV-3V3";
+	};
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hdmi-transmitter@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x3e>, <0x3c>, <0x3f>;
+		reg-names = "main", "edid", "cec", "packet";
+		clocks = <&cec_clock>;
+		clock-names = "cec";
+		a2vdd-supply = <&reg_adv_1v8>;
+		adi,dsi-lanes = <4>;
+		avdd-supply = <&reg_adv_1v8>;
+		dvdd-supply = <&reg_adv_1v8>;
+		pvdd-supply = <&reg_adv_1v8>;
+		v3p3-supply = <&reg_adv_3v3>;
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&mipi_dsi_bridge1_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7513_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <891000000>;
+	samsung,esc-clock-frequency = <10000000>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			mipi_dsi_bridge1_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7535_in>;
+			};
+		};
+	};
+};
-- 
2.53.0

