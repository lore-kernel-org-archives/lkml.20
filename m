Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFC737646E;
	Thu,  1 Oct 2026 17:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876995; cv=none; b=hedDEZJaLo6+zaGpUMSX5bYnmZCL4Xk9jyfiH6HWyZWAyaT5fqIpyJJtoR5/VrFTKFX/qatxvfBw2fzB/dCjEcVKTwcDOkG4ntr5pWl9i0P/I+CHxNZL5B7oi0wTJTB8RfX4T73Hi7GtzWuLzNp0GALetg+zrbpNVB1sJAu2E80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876995; c=relaxed/simple;
	bh=aJuu6oZimDQgHfnWh6s213yJHPdqpC6i8kZ9W3n4ue0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9B48ohcoom+jpZ7EhjZllomD0JFnnQJid1AxBKbNFXxY0x/YLaaUxRgyqN/RyMYd955CoWUHhVOHTRuAqa9qKpJQhYwtunSsXPtZlfD6AE78FquNsiFkbBJ0MPGFsxH0F5lfXAsvSDauXRsR2ySyYnSGf0glDXnVISj9M6wuP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Az21ypb2; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Az21ypb2"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 985DB2039F;
	Thu,  1 Oct 2026 19:49:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790876976;
	bh=TpovwenXPDOa/CzlL9Tb6pvO6bb3yMG0I4srjw+nzys=; h=From:To:Subject;
	b=Az21ypb2ppPYsw7tCj0wC3qzExydj67M83JxIZ5X5MnuG3W8z4yhdKDgOUpQhU+Rh
	 XKcuTKYJNLFr25o/1OTtoXX+QjY80n7S5hCnUhapChLZef34pmFGISdMsf4YLFcrPi
	 9BZdsvSrz1TEFh4XnCPV9SLIi8b1up/q9sDIrqLnQPYYkEqiVqJZJf/4SbjXP032v3
	 /SM8Gf/MaGAFSMoydXbubqpukR6Ol8Hz8rrWOIH/5dA9TdB/Kgda4OGPSORlh7RNE7
	 Wk3bGcFOctVTlu3Wknkt2xsm6CScTFRM/YrUcHMObUbZDoDKa7b9hJJxytSXjx4ycy
	 BNVxWDzArxcvQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/7] ARM: dts: imx6ull-colibri-emmc: Add VGA overlay
Date: Thu,  1 Oct 2026 19:49:16 +0200
Message-ID: <20261001174924.3831455-8-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001174924.3831455-1-francesco@dolcini.it>
References: <20261001174924.3831455-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add a device tree overlay for the VGA output on the Colibri iMX6ULL eMMC
parallel RGB LCD interface. The VGA output is driven through a
non-programmable video DAC without VESA DDC I2C signals to a DVI
connector. The DAC power-save input is driven by the BL_ON signal on
SODIMM 71, like on the Colibri iMX7.

The overlay content is identical to the Colibri iMX7 eMMC one, only the
GPIO driving the DAC power-save input is SoC specific. To avoid
duplicating it, rework the Colibri iMX7 eMMC overlay moving the common
part to a new dtsi shared between the two modules, and include it from
both overlays.

The overlay is also combined with the Aster, Evaluation Board v3, Iris
and Iris v2 carrier board device trees to provide ready-to-use DTBs.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 21 +++++++
 .../dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso | 24 ++++++++
 .../dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi | 61 +++++++++++++++++++
 .../dts/nxp/imx/imx7d-colibri-emmc-vga.dtso   | 52 ++--------------
 4 files changed, 112 insertions(+), 46 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 83f65b031e55..fa2a6dd82385 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -369,6 +369,22 @@ imx6ull-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
 	imx6ull-colibri-emmc-eval-v3.dtb \
 	imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtbo
 
+imx6ull-colibri-emmc-aster-vga-dtbs := \
+	imx6ull-colibri-emmc-aster.dtb \
+	imx6ull-colibri-emmc-vga.dtbo
+
+imx6ull-colibri-emmc-eval-v3-vga-dtbs := \
+	imx6ull-colibri-emmc-eval-v3.dtb \
+	imx6ull-colibri-emmc-vga.dtbo
+
+imx6ull-colibri-emmc-iris-vga-dtbs := \
+	imx6ull-colibri-emmc-iris.dtb \
+	imx6ull-colibri-emmc-vga.dtbo
+
+imx6ull-colibri-emmc-iris-v2-vga-dtbs := \
+	imx6ull-colibri-emmc-iris-v2.dtb \
+	imx6ull-colibri-emmc-vga.dtbo
+
 dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-14x14-evk.dtb \
 	imx6ul-ccimx6ulsbcexpress.dtb \
@@ -398,15 +414,20 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-colibri-aster.dtb \
 	imx6ull-colibri-emmc-aster.dtb \
 	imx6ull-colibri-emmc-aster-panel-cap-touch-7inch-parallel.dtb \
+	imx6ull-colibri-emmc-aster-vga.dtb \
 	imx6ull-colibri-emmc-eval-v3.dtb \
 	imx6ull-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6ull-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel.dtb \
+	imx6ull-colibri-emmc-eval-v3-vga.dtb \
 	imx6ull-colibri-emmc-iris.dtb \
+	imx6ull-colibri-emmc-iris-vga.dtb \
 	imx6ull-colibri-emmc-iris-v2.dtb \
 	imx6ull-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
+	imx6ull-colibri-emmc-iris-v2-vga.dtb \
 	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
 	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
 	imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtbo \
+	imx6ull-colibri-emmc-vga.dtbo \
 	imx6ull-colibri-eval-v3.dtb \
 	imx6ull-colibri-iris.dtb \
 	imx6ull-colibri-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso
new file mode 100644
index 000000000000..4ecf221de27e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to the Colibri parallel RGB LCD interface through a
+ * non-programmable video DAC with a DVI connector.
+ *
+ * The VGA output is available on multiple carrier boards (including Iris,
+ * Eval, Aster) without VESA DDC I2C signals.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx6ull-imx7-colibri-vga.dtsi"
+
+&vga_encoder {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_bl_on>;
+	/* SODIMM 71 / BL_ON */
+	enable-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi
new file mode 100644
index 000000000000..7e323698f338
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to the Colibri parallel RGB LCD interface through a
+ * non-programmable video DAC with a DVI connector, shared by the Colibri
+ * iMX6ULL eMMC and Colibri iMX7 eMMC overlays.
+ *
+ * The VGA output is available on multiple carrier boards (including Iris,
+ * Eval, Aster) without VESA DDC I2C signals.
+ *
+ * The DAC power-save input is driven by the BL_ON signal on SODIMM 71, the
+ * SoC specific pinctrl and GPIO are described by the overlay including this
+ * file.
+ */
+
+&{/} {
+	vga_encoder: vga-encoder {
+		compatible = "dumb-vga-dac";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					remote-endpoint = <&lcdif_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_enc_out: endpoint {
+					remote-endpoint = <&dvi_connector_in>;
+				};
+			};
+		};
+	};
+
+	dvi-connector {
+		compatible = "dvi-connector";
+		analog;
+
+		port {
+			dvi_connector_in: endpoint {
+				remote-endpoint = <&vga_enc_out>;
+			};
+		};
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lcdif_out {
+	remote-endpoint = <&vga_enc_in>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
index 363c0c2cc43e..ae3d8da02e67 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
@@ -14,51 +14,11 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
-&{/} {
-	vga-encoder {
-		compatible = "dumb-vga-dac";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_bl_on>;
-		enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+#include "imx6ull-imx7-colibri-vga.dtsi"
 
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				vga_enc_in: endpoint {
-					remote-endpoint = <&lcdif_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				vga_enc_out: endpoint {
-					remote-endpoint = <&dvi_connector_in>;
-				};
-			};
-		};
-	};
-
-	dvi-connector {
-		compatible = "dvi-connector";
-		analog;
-
-		port {
-			dvi_connector_in: endpoint {
-				remote-endpoint = <&vga_enc_out>;
-			};
-		};
-	};
-};
-
-&lcdif {
-	status = "okay";
-};
-
-&lcdif_out {
-	remote-endpoint = <&vga_enc_in>;
+&vga_encoder {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_bl_on>;
+	/* SODIMM 71 / BL_ON */
+	enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
 };
-- 
2.47.3

