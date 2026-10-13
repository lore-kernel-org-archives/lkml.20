Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90BB4EB857;
	Tue, 13 Oct 2026 11:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890273; cv=none; b=qxdjUXb9OMRPtjBsRAN3Wfolujf8Mfh3j0p8Ytz6yVf/CmClfbyd0gHxRHyxMh+3rfeSK83hjBIyW5pre0M2efgjVvsP9sry+YHXyCw1kuVWLLKAr0TH1aYSwZdH7d7aELUfN3HkEKkg5Hp8+NLS9rkZGFR7Bk0SUdDmLDqArzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890273; c=relaxed/simple;
	bh=owCvKpg2dHa4qPzpabiNW5YK9IcNlqML9LFnaGUeBho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCIlUwcSUyiUja2SyGxVGaRkmxu/6eGn6bxuhGZsum8qC8CHasvMrTsEbdVtH9kHP042WuGwvLIGZmVs6t8NtsQRYWIgJimcWU4rzfNsvT04SkjDz2+ElBb7sYx7K+kF0pl44RFZnuHWQlyP9u0WmJFpevWhCFRQU5IAnX0Rob0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=TUagxCEs; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="TUagxCEs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=T29bt3OudAnGl9w7ks3IdYRY9dtkMxKvfmXuRr5KxkU=; b=TUagxCEsweqT+H+taA60AYAgsW
	a8EbMm5jso/ZhufidBg7QMBSW+NRfqZ8eFpYoeRleEncw+jIH5CDO/P0zeCoA0GiU/FnHpQWsuAqR
	p2tuoqyRzceMU4QAsd20VYF5EvtQFAsGvU5JJeSNPZgZabHz4C+Fc5zYY1Hfj0JMjxa94WiHB0tvn
	Dm/hLSMGiQ+jlPYafHw48F1kCOjWp+YGAUP72qjaLJ4L1N4x5VxT+Amxn7+zoOS2T7IdlAcB1zuA9
	R0kWIDZ4a1+tFwWhGT3StpmFxknG9i8vsM62/1yaBVrCk3fQ8hCcaDiLh7y/xAxoE60H4evQAMOzE
	JBOMNJ6Q==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGaVr-000OCJ-1N;
	Tue, 13 Oct 2026 13:17:43 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGaVq-0005it-2i;
	Tue, 13 Oct 2026 13:17:42 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>
Cc: Liu Ying <victor.liu@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 2/5] arm64: dts: imx8qxp: Add display controller subsystem
Date: Tue, 13 Oct 2026 13:17:26 +0200
Message-ID: <20261013111737.998282-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013111737.998282-1-alexander.stein@ew.tq-group.com>
References: <20261013111737.998282-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28152/Tue Oct 13 08:26:14 2026)

From: Liu Ying <victor.liu@nxp.com>

Add display controller subsystem in i.MX8qxp SoC.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 408 ++++++++++++++++++
 .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 236 ++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   4 +-
 3 files changed, 647 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
new file mode 100644
index 0000000000000..0db345204b89b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/firmware/imx/rsrc.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+dc0_axi_ext_clk: clock-dc0-axi-ext {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <800000000>;
+	clock-output-names = "dc0_axi_ext_clk";
+};
+
+dc0_axi_int_clk: clock-dc0-axi-int {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <400000000>;
+	clock-output-names = "dc0_axi_int_clk";
+};
+
+dc0_cfg_clk: clock-dc0-cfg {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <100000000>;
+	clock-output-names = "dc0_cfg_clk";
+};
+
+dc0_subsys: bus@56000000 {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0x56000000 0x0 0x56000000 0x1000000>;
+
+	dc0_irqsteer: interrupt-controller@56000000 {
+		compatible = "fsl,imx-irqsteer";
+		reg = <0x56000000 0x1000>;
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		#interrupt-cells = <1>;
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&dc0_lis_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+		fsl,channel = <0>;
+		fsl,num-irqs = <512>;
+	};
+
+	dc0_disp_lpcg: clock-controller@56010000 {
+		reg = <0x56010000 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC0>,
+			 <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC1>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>;
+		clock-output-names = "dc0_disp0_lpcg_clk", "dc0_disp1_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_lis_lpcg: clock-controller@56010004 {
+		reg = <0x56010004 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "dc0_lis_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_disp_ctrl_link_mst0_lpcg: clock-controller@56010008 {
+		reg = <0x56010008 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "dc0_disp_ctrl_link_mst0_lpcg_msi_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_pixel_combiner_lpcg: clock-controller@56010010 {
+		reg = <0x56010010 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "dc0_pixel_combiner_lpcg_apb_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_lpcg: clock-controller@56010014 {
+		reg = <0x56010014 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>, <&dc0_axi_int_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>;
+		clock-output-names = "dc0_lpcg_cfg_clk",
+				     "dc0_lpcg_axi_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_pc: pixel-combiner@56020000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x56020000 0x10000>;
+		clocks = <&dc0_pixel_combiner_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "apb";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+		status = "disabled";
+
+		channel@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			status = "disabled";
+
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_combiner_ch0_dc0_disp0: endpoint {
+					remote-endpoint = <&dc0_disp0_dc0_pixel_combiner_ch0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dc0_pixel_combiner_ch0_dc0_pixel_link0: endpoint {
+					remote-endpoint = <&dc0_pixel_link0_dc0_pixel_combiner_ch0>;
+				};
+			};
+		};
+
+		channel@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			status = "disabled";
+
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_combiner_ch1_dc0_disp1: endpoint {
+					remote-endpoint = <&dc0_disp1_dc0_pixel_combiner_ch1>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dc0_pixel_combiner_ch1_dc0_pixel_link1: endpoint {
+					remote-endpoint = <&dc0_pixel_link1_dc0_pixel_combiner_ch1>;
+				};
+			};
+		};
+	};
+
+	dc0: display-controller@56180000 {
+		reg = <0x56180000 0x40000>;
+		clocks = <&dc0_lpcg IMX_LPCG_CLK_4>;
+		power-domains = <&pd IMX_SC_R_DC_0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		status = "disabled";
+
+		dc0_intc: interrupt-controller@56180040 {
+			reg = <0x56180040 0x60>;
+			clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+			interrupt-controller;
+			interrupt-parent = <&dc0_irqsteer>;
+			#interrupt-cells = <1>;
+			interrupts = <448>, <449>, <450>,  <64>,
+				      <65>,  <66>,  <67>,  <68>,
+				      <69>,  <70>, <193>, <194>,
+				     <195>, <196>, <197>,  <72>,
+				      <73>,  <74>,  <75>,  <76>,
+				      <77>,  <78>,  <79>,  <80>,
+				      <81>, <199>, <200>, <201>,
+				     <202>, <203>, <204>, <205>,
+				     <206>, <207>, <208>,   <5>,
+				       <0>,   <1>,   <2>,   <3>,
+				       <4>,  <82>,  <83>,  <84>,
+				      <85>, <209>, <210>, <211>,
+				     <212>;
+			interrupt-names = "store9_shdload",
+					  "store9_framecomplete",
+					  "store9_seqcomplete",
+					  "extdst0_shdload",
+					  "extdst0_framecomplete",
+					  "extdst0_seqcomplete",
+					  "extdst4_shdload",
+					  "extdst4_framecomplete",
+					  "extdst4_seqcomplete",
+					  "extdst1_shdload",
+					  "extdst1_framecomplete",
+					  "extdst1_seqcomplete",
+					  "extdst5_shdload",
+					  "extdst5_framecomplete",
+					  "extdst5_seqcomplete",
+					  "disengcfg_shdload0",
+					  "disengcfg_framecomplete0",
+					  "disengcfg_seqcomplete0",
+					  "framegen0_int0",
+					  "framegen0_int1",
+					  "framegen0_int2",
+					  "framegen0_int3",
+					  "sig0_shdload",
+					  "sig0_valid",
+					  "sig0_error",
+					  "disengcfg_shdload1",
+					  "disengcfg_framecomplete1",
+					  "disengcfg_seqcomplete1",
+					  "framegen1_int0",
+					  "framegen1_int1",
+					  "framegen1_int2",
+					  "framegen1_int3",
+					  "sig1_shdload",
+					  "sig1_valid",
+					  "sig1_error",
+					  "reserved",
+					  "cmdseq_error",
+					  "comctrl_sw0",
+					  "comctrl_sw1",
+					  "comctrl_sw2",
+					  "comctrl_sw3",
+					  "framegen0_primsync_on",
+					  "framegen0_primsync_off",
+					  "framegen0_secsync_on",
+					  "framegen0_secsync_off",
+					  "framegen1_primsync_on",
+					  "framegen1_primsync_off",
+					  "framegen1_secsync_on",
+					  "framegen1_secsync_off";
+		};
+
+		dc0_pixel_engine: pixel-engine@56180800 {
+			reg = <0x56180800 0xac00>;
+			clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			dc0_constframe0: constframe@56180960 {
+				reg = <0x56180960 0xc>, <0x56184400 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst0: extdst@56180980 {
+				reg = <0x56180980 0x1c>, <0x56184800 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <3>, <4>, <5>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_constframe4: constframe@561809a0 {
+				reg = <0x561809a0 0xc>, <0x56184c00 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst4: extdst@561809c0 {
+				reg = <0x561809c0 0x1c>, <0x56185000 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <6>, <7>, <8>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_constframe1: constframe@561809e0 {
+				reg = <0x561809e0 0xc>, <0x56185400 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst1: extdst@56180a00 {
+				reg = <0x56180a00 0x1c>, <0x56185800 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <9>, <10>, <11>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_constframe5: constframe@56180a20 {
+				reg = <0x56180a20 0xc>, <0x56185c00 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst5: extdst@56180a40 {
+				reg = <0x56180a40 0x1c>, <0x56186000 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <12>, <13>, <14>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_fetchwarp2: fetchwarp@56180a60 {
+				reg = <0x56180a60 0x10>, <0x56186400 0x190>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_fetchlayer0: fetchlayer@56180ac0 {
+				reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend0: layerblend@56180ba0 {
+				reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend1: layerblend@56180bc0 {
+				reg = <0x56180bc0 0x10>, <0x5618a800 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend2: layerblend@56180be0 {
+				reg = <0x56180be0 0x10>, <0x5618ac00 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend3: layerblend@56180c00 {
+				reg = <0x56180c00 0x10>, <0x5618b000 0x20>;
+				reg-names = "pec", "cfg";
+			};
+		};
+
+		dc0_display_engine0: display-engine@5618b400 {
+			reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
+			reg-names = "top", "cfg";
+			interrupt-parent = <&dc0_intc>;
+			interrupts = <15>, <16>, <17>;
+			interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			dc0_framegen0: framegen@5618b800 {
+				reg = <0x5618b800 0x98>;
+				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <18>, <19>, <20>, <21>,
+					     <41>, <42>, <43>, <44>;
+				interrupt-names = "int0", "int1", "int2", "int3",
+						  "primsync_on", "primsync_off",
+						  "secsync_on", "secsync_off";
+			};
+
+			dc0_tcon0: tcon@5618c800 {
+				reg = <0x5618c800 0x588>;
+
+				port {
+					dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
+						remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
+					};
+				};
+			};
+		};
+
+		dc0_display_engine1: display-engine@5618b420 {
+			reg = <0x5618b420 0x14>, <0x5618d400 0x1c00>;
+			reg-names = "top", "cfg";
+			interrupt-parent = <&dc0_intc>;
+			interrupts = <25>, <26>, <27>;
+			interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			power-domains = <&pd IMX_SC_R_DC_0_PLL_1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			dc0_framegen1: framegen@5618d400 {
+				reg = <0x5618d400 0x98>;
+				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_1>;
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <28>, <29>, <30>, <31>,
+					     <45>, <46>, <47>, <48>;
+				interrupt-names = "int0", "int1", "int2", "int3",
+						  "primsync_on", "primsync_off",
+						  "secsync_on", "secsync_off";
+			};
+
+			dc0_tcon1: tcon@5618e400 {
+				reg = <0x5618e400 0x588>;
+
+				port {
+					dc0_disp1_dc0_pixel_combiner_ch1: endpoint {
+						remote-endpoint = <&dc0_pixel_combiner_ch1_dc0_disp1>;
+					};
+				};
+			};
+		};
+	};
+
+	dc0_pl_msi_bus: bus@56200000 {
+		reg = <0x56200000 0x100000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&dc0_irqsteer>;
+		interrupts = <320>;
+		ranges;
+		clocks = <&dc0_disp_ctrl_link_mst0_lpcg IMX_LPCG_CLK_4>,
+			 <&dc0_disp_ctrl_link_mst0_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "msi", "ahb";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
new file mode 100644
index 0000000000000..299720d8c99ed
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+&dc0 {
+	compatible = "fsl,imx8qxp-dc";
+};
+
+&dc0_constframe0 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_constframe1 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_constframe4 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_constframe5 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_disp_ctrl_link_mst0_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_disp_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_display_engine0 {
+	compatible = "fsl,imx8qxp-dc-display-engine";
+};
+
+&dc0_display_engine1 {
+	compatible = "fsl,imx8qxp-dc-display-engine";
+};
+
+&dc0_extdst0 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_extdst1 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_extdst4 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_extdst5 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_fetchlayer0 {
+	compatible = "fsl,imx8qxp-dc-fetchlayer";
+};
+
+&dc0_fetchwarp2 {
+	compatible = "fsl,imx8qxp-dc-fetchwarp";
+};
+
+&dc0_framegen0 {
+	compatible = "fsl,imx8qxp-dc-framegen";
+};
+
+&dc0_framegen1 {
+	compatible = "fsl,imx8qxp-dc-framegen";
+};
+
+&dc0_intc {
+	compatible = "fsl,imx8qxp-dc-intc";
+};
+
+&dc0_layerblend0 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_layerblend1 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_layerblend2 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_layerblend3 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_lis_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_pc {
+	compatible = "fsl,imx8qxp-pixel-combiner";
+};
+
+&dc0_pixel_combiner_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_pixel_engine {
+	compatible = "fsl,imx8qxp-dc-pixel-engine";
+};
+
+&dc0_pl_msi_bus {
+	compatible = "fsl,imx8qxp-display-pixel-link-msi-bus", "simple-pm-bus";
+};
+
+&dc0_tcon0 {
+	compatible = "fsl,imx8qxp-dc-tcon";
+};
+
+&dc0_tcon1 {
+	compatible = "fsl,imx8qxp-dc-tcon";
+};
+
+&scu {
+	dc0_pixel_link0: dc0-pixel-link0 {
+		compatible = "fsl,imx8qxp-dc-pixel-link";
+		fsl,dc-id = /bits/ 8 <0>;
+		fsl,dc-stream-id = /bits/ 8 <0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* from dc0 pixel combiner channel0 */
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_link0_dc0_pixel_combiner_ch0: endpoint {
+					remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_pixel_link0>;
+				};
+			};
+
+			/* to PXL2DPIs in MIPI/LVDS combo subsystems */
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				status = "disabled";
+
+				dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
+					reg = <0>;
+				};
+
+				dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
+					reg = <1>;
+				};
+			};
+
+			/* unused */
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			/* unused */
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* to imaging subsystem */
+			port@4 {
+				reg = <4>;
+				status = "disabled";
+			};
+		};
+	};
+
+	dc0_pixel_link1: dc0-pixel-link1 {
+		compatible = "fsl,imx8qxp-dc-pixel-link";
+		fsl,dc-id = /bits/ 8 <0>;
+		fsl,dc-stream-id = /bits/ 8 <1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* from dc0 pixel combiner channel1 */
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_link1_dc0_pixel_combiner_ch1: endpoint {
+					remote-endpoint = <&dc0_pixel_combiner_ch1_dc0_pixel_link1>;
+				};
+			};
+
+			/* to PXL2DPIs in MIPI/LVDS combo subsystems */
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				status = "disabled";
+
+				dc0_pixel_link1_mipi_lvds_1_pxl2dpi: endpoint@0 {
+					reg = <0>;
+				};
+
+				dc0_pixel_link1_mipi_lvds_0_pxl2dpi: endpoint@1 {
+					reg = <1>;
+				};
+			};
+
+			/* to parallel display interface in ADMA subsystem */
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			/* unused */
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* unused */
+			port@4 {
+				reg = <4>;
+				status = "disabled";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 7c4a50e0ec9e9..eedca1c300d64 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -207,7 +207,7 @@ psci {
 		method = "smc";
 	};
 
-	system-controller {
+	scu: system-controller {
 		compatible = "fsl,imx-scu";
 		mbox-names = "tx0",
 			     "rx0",
@@ -339,6 +339,7 @@ map0 {
 	#include "imx8-ss-security.dtsi"
 	#include "imx8-ss-cm40.dtsi"
 	#include "imx8-ss-gpu0.dtsi"
+	#include "imx8-ss-dc0.dtsi"
 	#include "imx8-ss-adma.dtsi"
 	#include "imx8-ss-conn.dtsi"
 	#include "imx8-ss-ddr.dtsi"
@@ -349,6 +350,7 @@ map0 {
 #include "imx8qxp-ss-img.dtsi"
 #include "imx8qxp-ss-vpu.dtsi"
 #include "imx8qxp-ss-security.dtsi"
+#include "imx8qxp-ss-dc.dtsi"
 #include "imx8qxp-ss-adma.dtsi"
 #include "imx8qxp-ss-conn.dtsi"
 #include "imx8qxp-ss-lsio.dtsi"
-- 
2.55.0

