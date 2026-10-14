Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98DC1DDC38;
	Wed, 14 Oct 2026 07:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962227; cv=none; b=NSUZulbeR376FG11l+4XnZH663Mo0QOg4rIUaDaFZDpGO5lTUWhEKzD2wnBOrrXdYbM2Bd28LoB4Ctb9fQ+kElap6xpjjT0hW0YTdRwMAel04MXqsa7WzexQMNfH2it9NtALlXp6ERdiKFrOvvQj0e4U5HUnFb5uX8VWFA4pUNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962227; c=relaxed/simple;
	bh=ETjOENsIvQNsoyaJp7UAFPj8SqXo0wg+O0IUo8sasJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqcYFusCb0lfowt0ldL8d1LH0cedzKQZMur8qwGm13MsGZuyZ/OaEMVTSImMyLV8HbNlkbcBA/m1R16D/eGdjWIsC4De9fHMnopuXSlgaUQIaa7bwdOT7GVvLy6Kqq4pix74JapleDy2yBVXxDmOWM0kqvZcPk0dWGRDu47YgL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Ku9WPBpG; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ku9WPBpG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=iLFW+9/LKmQm/cq/lvIlI4rgdCkxLtd3p9vRwVaO8Vc=; b=Ku9WPBpGY3OqrLTBMIRYPC5yvb
	aNa00oyTxssS/KYWk9fm+BO7mSha79nV5ICs+E/SPQxn0Dc7fyLLlH0Cfh9FX4AL9oY81hiZFOWqJ
	JzWHtsnXHZvJkB6oJZKbTl+2sokSjLlTjiZLhV+lVna2NzhLbNIMXXmfXCiuq9/8WDusbduo0pJ6u
	vHwj1iqz1VTuAiptfelhwJ5NGJzS3PQTUQJgSIdTHUhWCLVJCrjUuRATshiRZ3OWyy/xc8hw08klR
	t5gv8KAFLBulQnnTMCUq54uWSxTCNch2ecC79eET2AYrZ7bEnt5C/6Diphdt512f7JfLTdsLA8p3T
	l7klZHFw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGtEV-000GFx-2o;
	Wed, 14 Oct 2026 09:17:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGtEV-000AF0-0j;
	Wed, 14 Oct 2026 09:17:03 +0200
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
Subject: [PATCH v2 5/5] arm64: dts: freescale: Add dual-channel LVDS overlay for TQMa8Xx
Date: Wed, 14 Oct 2026 09:16:49 +0200
Message-ID: <20261014071657.118378-6-alexander.stein@ew.tq-group.com>
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

Add an overlay for the supported LVDS display AUO G133HAN01 on connector
X14 (+ control on X22).
The corresponding display controller PLL is configured with 10x the
pixelclock.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../dts/freescale/mba8xx-lvds-g133han01.dtso  | 160 ++++++++++++++++++
 2 files changed, 162 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds-g133han01.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 84aeff0e78cf2..3b3b1c51fcd6a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -846,8 +846,10 @@ dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 
+imx8qxp-tqma8xqp-mba8xx-lvds-g133han01-dtbs += imx8qxp-tqma8xqp-mba8xx.dtb mba8xx-lvds-g133han01.dtbo
 imx8qxp-tqma8xqp-mba8xx-lvds0-tm070jvhg33-dtbs += imx8qxp-tqma8xqp-mba8xx.dtb mba8xx-lvds0-tm070jvhg33.dtbo
 imx8qxp-tqma8xqp-mba8xx-lvds1-tm070jvhg33-dtbs += imx8qxp-tqma8xqp-mba8xx.dtb mba8xx-lvds1-tm070jvhg33.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx-lvds-g133han01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx-lvds0-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx-lvds1-tm070jvhg33.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/mba8xx-lvds-g133han01.dtso b/arch/arm64/boot/dts/freescale/mba8xx-lvds-g133han01.dtso
new file mode 100644
index 0000000000000..acade7c01da83
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/mba8xx-lvds-g133han01.dtso
@@ -0,0 +1,160 @@
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
+	assigned-clock-rates = <1412000000>;
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
+	fsl,companion-ldb = <&mipi_lvds_1_ldb>;
+	status = "okay";
+
+	channel@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+		status = "okay";
+
+		port@1 {
+			reg = <1>;
+
+			lvds_ch0_out: endpoint {
+				remote-endpoint = <&panel_lvds0_in>;
+			};
+		};
+	};
+};
+
+&mipi_lvds_0_phy {
+	status = "okay";
+};
+
+&mipi_lvds_0_pxl2dpi {
+	fsl,companion-pxl2dpi = <&mipi_lvds_1_pxl2dpi>;
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
+&mipi_lvds_1_ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+		status = "okay";
+
+		port@1 {
+			reg = <1>;
+
+			lvds_ch1_out: endpoint {
+				remote-endpoint = <&panel_lvds1_in>;
+			};
+		};
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
+&mipi_lvds_1_pxl2dpi_dc0_pixel_link0 {
+	status = "okay";
+};
+
+&mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch1 {
+	status = "okay";
+};
+
+&panel_lvds0 {
+	compatible = "auo,g133han01";
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dual-lvds-odd-pixels;
+
+			panel_lvds0_in: endpoint {
+				remote-endpoint = <&lvds_ch0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-even-pixels;
+
+			panel_lvds1_in: endpoint {
+				remote-endpoint = <&lvds_ch1_out>;
+			};
+		};
+	};
+};
-- 
2.55.0

