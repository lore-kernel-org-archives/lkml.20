Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717E63F3297;
	Wed, 14 Oct 2026 07:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962227; cv=none; b=BLfc6OVhxQPO5TWbkSIhSzffH0UDlvNp10Mf1VZrWi5Jw2mHAQXDsVGfMYJ5kybt0qxvZcqQxDYZIEg+NxPjTybbjSwbATcFY+AaAgdbArNZnbj9kLzKTXAhBmX209ooMkUueMeESTjSGqUc5UdlFqocXj0yDWz3mMGALt76u9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962227; c=relaxed/simple;
	bh=/XyofsnggIevSg+u5QGPHDJ0LqMRg18FtpjeNEOtUoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GreJ9SLLQSIeqEh57QUNJtxqnUNOpO0D78yTJkJI+qMkqjTmADr+vUhHX7Zkp6orrGFbC+B68vHniwKZf9iUrm2rVKxD/FP5uWIioxWoI+tpOPKQQe5NB3QYKpui3dH2PZ/aaLFpm7c+dis9uo9poe/Xz9da5nzYuq14iJ++mg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=CqMAADJN; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="CqMAADJN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DYl8wmk7D4k4k2nm9c6RwZ9lG54OdzU1lxAQYote2iU=; b=CqMAADJNq7+zkvJFHqb2xV2z7Z
	TPo+ieodKAXBZvRwMMe45vc0xX6X+SuS+B3p6RYPbAQOzOe6JEz3XRr5tpGEOUT0JnmCmYG0x7CmN
	25Lp27Fb8WN9grPFZ0EiXHLuEJGLmCFl3PngvTMRqwo3S7QR9yreJfIT8T1mSE8c/LGptMgWptZId
	VeDTnNQBEbdO45Y5YsV2ayguwKXUNynO4Tb8BkKgoGLbxb6kgi1Ym3mPhWlseTE2dkrlbX7Yoi7ZP
	XkZ9T/pzwCWIT1k4Ad3XPT+LPT4B+Ix8LdGqnlDIAmJP9bSOdV3nQ4uS25iJmamOnoJojdsTHlGKq
	ydNqK8jg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGtEV-000GDb-1P;
	Wed, 14 Oct 2026 09:17:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGtEU-000AF0-2Z;
	Wed, 14 Oct 2026 09:17:02 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v2 4/5] arm64: dts: freescale: Add LVDS overlays for TQMa8Xx
Date: Wed, 14 Oct 2026 09:16:48 +0200
Message-ID: <20261014071657.118378-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28152/Tue Oct 13 08:26:14 2026)

Add overlays for the supported LVDS display tianma tm070jvhg33 on both
LVDS0 and LVDS1 channels on connector X14 (+ control on X22).
The corresponding display controller PLL is configured with 10x the
pixelclock.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Fix channel1 'reg' property in dc0_pc node for LVDS overlay

 arch/arm64/boot/dts/freescale/Makefile        | 12 +++
 .../freescale/mba8xx-lvds0-tm070jvhg33.dtso   | 88 +++++++++++++++++++
 .../freescale/mba8xx-lvds1-tm070jvhg33.dtso   | 88 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/mba8xx.dtsi     | 58 +++++++++++-
 4 files changed, 243 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds0-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb56..84aeff0e78cf2 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -120,6 +120,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxl-hummingboard-telematics.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
+
+imx8dxp-tqma8xdp-mba8xx-lvds0-tm070jvhg33-dtbs += imx8dxp-tqma8xdp-mba8xx.dtb mba8xx-lvds0-tm070jvhg33.dtbo
+imx8dxp-tqma8xdp-mba8xx-lvds1-tm070jvhg33-dtbs += imx8dxp-tqma8xdp-mba8xx.dtb mba8xx-lvds1-tm070jvhg33.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx-lvds0-tm070jvhg33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx-lvds1-tm070jvhg33.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 
 imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
@@ -839,6 +845,12 @@ dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
+
+imx8qxp-tqma8xqp-mba8xx-lvds0-tm070jvhg33-dtbs += imx8qxp-tqma8xqp-mba8xx.dtb mba8xx-lvds0-tm070jvhg33.dtbo
+imx8qxp-tqma8xqp-mba8xx-lvds1-tm070jvhg33-dtbs += imx8qxp-tqma8xqp-mba8xx.dtb mba8xx-lvds1-tm070jvhg33.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx-lvds0-tm070jvhg33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx-lvds1-tm070jvhg33.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb.dtb
diff --git a/arch/arm64/boot/dts/freescale/mba8xx-lvds0-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/mba8xx-lvds0-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..3bff1c4ca0b73
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/mba8xx-lvds0-tm070jvhg33.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2021-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+&adma_pwm {
+	status = "okay";
+};
+
+&backlight_lvds {
+	status = "okay";
+};
+
+&dc0_framegen0 {
+	assigned-clocks = <&clk IMX_SC_R_DC_0_PLL_0 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC0>;
+	assigned-clock-parents = <0>,
+				 <&clk IMX_SC_R_DC_0_PLL_0 IMX_SC_PM_CLK_PLL>;
+	assigned-clock-rates = <682000000>;
+};
+
+&dc0_pc {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@0 {
+		reg = <0>;
+		status = "okay";
+	};
+};
+
+&dc0_pixel_link0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			status = "okay";
+		};
+	};
+};
+
+&dc0 {
+	status = "okay";
+};
+
+&mipi_lvds_0_ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@0 {
+		reg = <0>;
+		status = "okay";
+	};
+};
+
+&mipi_lvds_0_phy {
+	status = "okay";
+};
+
+&mipi_lvds_0_pxl2dpi {
+	status = "okay";
+};
+
+&mipi_lvds_0_pxl2dpi_dc0_pixel_link0 {
+	status = "okay";
+};
+
+&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0 {
+	status = "okay";
+};
+
+&panel_lvds0 {
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..76520ca4138cc
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2021-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+&adma_pwm {
+	status = "okay";
+};
+
+&backlight_lvds {
+	status = "okay";
+};
+
+&dc0_framegen1 {
+	assigned-clocks = <&clk IMX_SC_R_DC_0_PLL_1 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC1>;
+	assigned-clock-parents = <0>,
+				 <&clk IMX_SC_R_DC_0_PLL_1 IMX_SC_PM_CLK_PLL>;
+	assigned-clock-rates = <682000000>;
+};
+
+&dc0_pc {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@1 {
+		reg = <1>;
+		status = "okay";
+	};
+};
+
+&dc0_pixel_link1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			status = "okay";
+		};
+	};
+};
+
+&dc0 {
+	status = "okay";
+};
+
+&mipi_lvds_1_ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@0 {
+		reg = <0>;
+		status = "okay";
+	};
+};
+
+&mipi_lvds_1_phy {
+	status = "okay";
+};
+
+&mipi_lvds_1_pxl2dpi {
+	status = "okay";
+};
+
+&mipi_lvds_1_pxl2dpi_dc0_pixel_link1 {
+	status = "okay";
+};
+
+&mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch0 {
+	status = "okay";
+};
+
+&panel_lvds1 {
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
index e32519b156d93..a94594db34d56 100644
--- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
@@ -80,7 +80,37 @@ led2 {
 		};
 	};
 
-	/* TODO LVDS panels */
+	panel_lvds0: panel-lvds0 {
+		/*
+		 * Display is not fixed, so compatible has to be added from
+		 * DT
+		 */
+		backlight = <&backlight_lvds>;
+		power-supply = <&reg_3v3>;
+		status = "disabled";
+
+		port {
+			panel_in_lvds0: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+
+	panel_lvds1: panel-lvds1 {
+		/*
+		 * Display is not fixed, so compatible has to be added from
+		 * DT
+		 */
+		backlight = <&backlight_lvds>;
+		power-supply = <&reg_3v3>;
+		status = "disabled";
+
+		port {
+			panel_in_lvds1: endpoint {
+				remote-endpoint = <&lvds1_out>;
+			};
+		};
+	};
 
 	reg_12v0: regulator-12v0 {
 		compatible = "regulator-fixed";
@@ -280,8 +310,6 @@ &i2c2 {
 	status = "okay";
 };
 
-/* TODO LDB */
-
 &lpspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spi1>;
@@ -329,6 +357,30 @@ &lsio_gpio3 {
 			  "", "", "", "";
 };
 
+&mipi_lvds_0_ldb {
+	channel@0 {
+		port@1 {
+			reg = <1>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&panel_in_lvds0>;
+			};
+		};
+	};
+};
+
+&mipi_lvds_1_ldb {
+	channel@0 {
+		port@1 {
+			reg = <1>;
+
+			lvds1_out: endpoint {
+				remote-endpoint = <&panel_in_lvds1>;
+			};
+		};
+	};
+};
+
 &pcieb {
 	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
 	phy-names = "pcie-phy";
-- 
2.55.0

