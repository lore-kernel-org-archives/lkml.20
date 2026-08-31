Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022105.outbound.protection.outlook.com [40.107.75.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C874D3D1CBE;
	Mon, 31 Aug 2026 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164599; cv=fail; b=NDAORGXQzbxktwIQJR+gz8az8ldX0exJZrMRGOrphhkiOrRo0zXHhZ4/7/pkt/T37/VOe5C+ybrohPvprCBkW9+vx3+YI69j6gtD1ZqgFgVHtH4cd9fa9JOnwS27uQoAfs2LsHQyS0KEpgvlCSRjjSeIAj6F25phgxk3pK7QZVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164599; c=relaxed/simple;
	bh=4zmOIma6CG1f7MboAGZzS/etRBPSv2/enZ3E30BTym0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pc3uQWkiBauzL1vqPy08VBVWltNtsuNRfkhqW9YzHHvmF6+Oz+hhLiadp3Ri3u5oKBmyJfRRa2VUJ2cQL6RtpJwTAv1+2ehhAsS8ndzPLfAu8u4JSjz6Hrfbae1IF/Hy2vzmtVJDFpmadX6O3jLx6eioH95Aficbn1IWKnNxjrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lE1PvmjkUVi4Q0OsWABLy92F70LuFlY+7nmofcWOh5Obe0fI+872iZIFlF+BZUd8JHbUH/Oo1r30dEHSOygmRhrWoiJn3FW9Wa6v1RH+26XbNCOl84hcl9vsYu9/GroqxBwDcsi0xcpEwmEm3NlWphePXxpUGWX1O90VLh081yc3kspIFnvTePvOGlQj8r2HufmzeXGx1o8bZ6vGyyAyl8BZJ0AttaMIdWoCKnZ+mCnR+KlzyqCP/3dbYYBei++CcBOCKTsRmZXDXRN/GBKw3lRVyPmv8JoNxkxRpIrfofaiYgVL9lriPoxg2gcYXHqEyc5uH/2PALYCWseMCYRGZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GFuSqhzb2adpCqyR50iZnG4aJEoaKym8aRjqQf2xwY=;
 b=XtjJEe2RX49z8mraFdypxIUoo4LBPdiUuwr5JYtN8XJaeexv89n/0QaaEZKZ3Fb3X/HXX3qUJWauGl/S/ubnbJ3gFFfW24ksT7XrE0wZwGB1gu3Cf4vfbURi5w7wkeuTt1vYOSVWAzcWmYJkRQoJ57nJRhEyBnToSNOMFV5D9MXT3gcSAXHXMTQdZrsxfxfd2eRIR7myvIvH65pC/8czk9PhY7+zPEo65M7pztNS1WU5KPlZQTL4/a79U5rAkToF9Pj4c+ujyxqkLCU27c7UAcO/Wh1Xp4hWjSEeTlW/FeFIanKSvdVviELOCpX0dD6qA8Xt2oI+khx8D0aoiIMw0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0036.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::23) by
 SEZPR06MB5959.apcprd06.prod.outlook.com (2603:1096:101:e3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Mon, 31 Aug 2026 08:23:14 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:c7:cafe::c1) by SG2P153CA0036.outlook.office365.com
 (2603:1096:4:c7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Mon,
 31 Aug 2026 08:23:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 08:23:13 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3563D409210F;
	Mon, 31 Aug 2026 16:23:12 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: peter.chen@kernel.org,
	pawell@cadence.com,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: gregkh@linuxfoundation.org,
	rogerq@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	fugang.duan@cixtech.com,
	cix-kernel-upstream@cixtech.com,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: [PATCH v1 4/4] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Date: Mon, 31 Aug 2026 16:23:08 +0800
Message-ID: <20260831082309.3854507-5-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|SEZPR06MB5959:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6b904db2-f1b9-4369-754a-08df07391a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	v+x/5p5gLY6jqyoBREGCYQts902t8t+ohC71l2KX/wbOgAOBlCKJckMFfrQqN9kPczfNNKhfy5JhFg/tu6uChgjGeAPD6MwF/tM3WL7VmJ421OdvbmVi9pTs8TRqoXY9KlJHwfVHiuo23SeMmQnxUsISYlhCTqImK/cNWqoXkeuV7lHGE+oDR0ftRYD8dtDhyBxG4rfI+tKd/XFZY2jmYj3be1NhI7sLWXbowVWuQtfNcqZZxtdTVGee+6LmloN2pjgZN4Aw3BLnKgg/5SLtJig4tc503MR9kgThla+PWahX4vHgjAOfbJ7Sx1dyCdA7ZAiHJQcsfSZk8k7OMqvkwOAiXTWGh5Sts+Pk+l7wOc45RMkTTAwC8/Z2bhJ0cfUNc8p5x9Wx9kMJR1eV9fERJsIszfY9d9wNvsxjIgVXhO/7zRJLq0NPUvx36O2iXmUHHQ71c+/+tXkJ0sGZ/6+iF6Lcvp2cQSzapfKK2FVa2qhbLcXUAqxTa9djuF60LxUlT8hNdLiuTnvadcSljO/E9Bji/NAAERR+5UbmsWX8//gycciWA6f2fp5T3vaZ5UvIVDkzYNmVf1hSoBs+/KOHnUpxYM8aE2DKO+WMQGvO3kAcaCR1Q+jejnp+FDWAmvaLRqNMwXvSRCT1vc9g3N3WUyC0uaSUFHzi9Lu5HctunvbELkE+yW5Mw8SraG92/sFdFCxLdsEQHvIexfEUit//QQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8nT+ujzEz58waYtn1pzXDBS8M88spschGWxodp4xm4uX2GoU35BOuWzDN0aC0u/XMBc6KZ1nyTPtIoPZJE/naxeBSNuORZzkHa20oOc7AR75Czwq/YTRu/41A8VrBTCG9rfwLiH4OGirE0Ia1ndIKJb8ipnd52J5+U/1fozLuE6C+lk5LIUv1yWHoPbdDaQX4eE20WihTLt0pDScp6zQjDulGnjWs53fQvDUdc6jykt/g0D7F/OT2E3K+UBXPdo1eYynmvTj9Y4SDHvdA7j2jD3XECGkPlK9HISm2mhpyzmFu3e/o/zf7sHTVaYo9N2HgVHlj744eDxAiW/u/LL6aqVD7tSEYEL2Izqn9FrTPsF59CL4h49EhpvM9FVEWXCkWC/xciUk0WarNiLLsWhUZhlzXcheiLtliVelnma48rlbmFkc2eWpaUENTfljmiYk
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 08:23:13.6390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b904db2-f1b9-4369-754a-08df07391a12
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5959

Add USB4 and USB5 controller nodes (based on Cadence USBSSP DRD)
and their associated USB3 PHY nodes for the CIX Sky1 SoC. Enable
USB4 and USB5 in host mode on the Radxa Orion O6 board.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  36 ++++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 133 ++++++++++++++++++++++
 2 files changed, 169 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..33d3ffdc3f9e 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -80,6 +80,22 @@ pins {
 
 		};
 	};
+
+	pinctrl_usb4: usb4-power-on-cfg {
+		pins {
+			pinmux = <CIX_PAD_GPIO041_FUNC_USB_DRIVE_VBUS4>;
+			bias-pull-down;
+			drive-strength = <8>;
+		};
+	};
+
+	pinctrl_usb5: usb5-power-on-cfg {
+		pins {
+			pinmux = <CIX_PAD_GPIO042_FUNC_USB_DRIVE_VBUS5>;
+			bias-pull-down;
+			drive-strength = <8>;
+		};
+	};
 };
 
 &pcie_x8_rc {
@@ -117,3 +133,23 @@ &s5_gpio2 {
 &uart2 {
 	status = "okay";
 };
+
+&usb4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb4>;
+};
+
+&usbss_4 {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&usb5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb5>;
+};
+
+&usbss_5 {
+	status = "okay";
+	dr_mode = "host";
+};
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index a77c52296ebd..44736c071573 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -6,6 +6,8 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/cix,sky1.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
 #include "sky1-power.h"
 
 / {
@@ -13,6 +15,11 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		usb4 = &usb4;
+		usb5 = &usb5;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -574,6 +581,132 @@ mbox_ap2sfh: mailbox@80a0000 {
 			cix,mbox-dir = "tx";
 		};
 
+		usb4: usb@91c0300 {
+			compatible = "cix,sky1-usbssp";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			reg = <0x00 0x091c0314 0x00 0x4>,
+				<0x00 0x091c0400 0x00 0x4>;
+			reg-names = "axi_property", "controller_status";
+
+			resets = <&s5_syscon SKY1_USBC_SS2_PRST_N>,
+				<&s5_syscon SKY1_USBC_SS2_RST_N>;
+			reset-names = "usb_preset", "usb_reset";
+
+			clocks = <&scmi_clk CLK_TREE_USB3A_H0_CLK_SOF>,
+				<&scmi_clk CLK_TREE_USB3A_0_AXI_GATE>,
+				<&scmi_clk CLK_TREE_USB3A_H0_CLK_LPM>,
+				<&scmi_clk CLK_TREE_USB3A_0_APB_GATE>;
+			clock-names = "sof_clk", "usb_aclk", "lpm_clk", "usb_pclk";
+
+			cix,usb_syscon = <&s5_syscon>;
+			axi_bmax_value = <0x7>;
+			sof_clk_freq = <8000000>;
+			lpm_clk_freq = <32000>;
+			status = "disabled";
+
+			usbss_4: usb-controller@91d0000 {
+				compatible = "cdns,usb3";
+				reg = <0x00 0x91d0000 0x00 0x4000>,
+					<0x00 0x91d4000 0x00 0x4000>,
+					<0x00 0x91d8000 0x00 0x8000>;
+				reg-names = "otg", "dev", "xhci";
+
+				interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
+				interrupt-names = "host",
+					"peripheral",
+					"otg",
+					"wakeup";
+
+				maximum-speed = "super-speed-plus";
+				dr_mode = "otg";
+				phys = <&usb3_phy4_0>;
+				phy-names = "cdns3,usb3-phy";
+				status = "disabled";
+			};
+		};
+
+		usb5: usb@91c0304 {
+			compatible = "cix,sky1-usbssp";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			reg = <0x00 0x091c0324 0x00 0x4>,
+				<0x00 0x091c0410 0x00 0x4>;
+			reg-names = "axi_property", "controller_status";
+
+			resets = <&s5_syscon SKY1_USBC_SS3_PRST_N>,
+				<&s5_syscon SKY1_USBC_SS3_RST_N>;
+			reset-names = "usb_preset", "usb_reset";
+
+			clocks = <&scmi_clk CLK_TREE_USB3A_H1_CLK_SOF>,
+				<&scmi_clk CLK_TREE_USB3A_1_AXI_GATE>,
+				<&scmi_clk CLK_TREE_USB3A_H1_CLK_LPM>,
+				<&scmi_clk CLK_TREE_USB3A_1_APB_GATE>;
+			clock-names = "sof_clk", "usb_aclk", "lpm_clk", "usb_pclk";
+
+			cix,usb_syscon = <&s5_syscon>;
+			axi_bmax_value = <0x7>;
+			sof_clk_freq = <8000000>;
+			lpm_clk_freq = <32000>;
+			status = "disabled";
+
+			usbss_5: usb-controller@91e0000 {
+				compatible = "cdns,usb3";
+				reg = <0x00 0x91e0000 0x00 0x4000>,
+					<0x00 0x91e4000 0x00 0x4000>,
+					<0x00 0x91e8000 0x00 0x8000>;
+				reg-names = "otg", "dev", "xhci";
+
+				interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>;
+				interrupt-names = "host",
+					"peripheral",
+					"otg",
+					"wakeup";
+
+				maximum-speed = "super-speed-plus";
+				dr_mode = "otg";
+				phys = <&usb3_phy4_1>;
+				phy-names = "cdns3,usb3-phy";
+				status = "disabled";
+			};
+		};
+
+		usb3_phy4: usb-phy@9210000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "cix,sky1-usb3-phy";
+			reg = <0x00 0x09210000 0x00 0x40000>;
+			status = "disabled";
+
+			resets = <&s5_syscon SKY1_USBPHY_SS_RST_N>,
+				<&s5_syscon SKY1_USBPHY_SS_PST_N>;
+			reset-names = "reset", "preset";
+
+			clocks = <&scmi_clk CLK_TREE_USB3A_PHY3_GATE>,
+				<&scmi_clk CLK_TREE_USB3A_PHY_x2_REF>;
+			clock-names = "apb_clk", "ref_clk";
+
+			usb3_phy4_0: usb-port@0 {
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
+			usb3_phy4_1: usb-port@1 {
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+		};
+
 		pcie_x8_rc: pcie@a010000 {
 			compatible = "cix,sky1-pcie-host";
 			reg = <0x00 0x0a010000 0x00 0x10000>,
-- 
2.54.0

