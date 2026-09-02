Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022078.outbound.protection.outlook.com [40.107.75.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D4413B293;
	Wed,  2 Sep 2026 03:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319307; cv=fail; b=n6d8FDzHXAnGW42H+POB47OyGkrYdcufa5atfhXrIC0mMe92uDAe8FN7pNa8XVohi674EgG+Ua1+MMWXoVfr9Odx2Au1KTxz8oRpHKWPzw0w4kmNDhCCCl3zS4ajWM/hUv5Ge45FElPpkgJq24e+qRyUM6RPTT8yeOczozcHB2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319307; c=relaxed/simple;
	bh=BRjVkH1+QIJKTul3FISk1DZwZAqP9itY9bqRVTJG6A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aq3yOuU3O55CU7jl/bQk2HsNpPGB+bVzdOD/DmZbvSPcMNi7V3WmPggsd2Uqaweo0vcmEWJJAt+Frm7LMrxKrO5C83eQK1JrMjTfG1mM1O0aaZSME4DE+kVgwaDMzXzJ9wd+A+8ITCUfQtPjvVYiupSvgJKPven6RZHxb/7DfFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPzc/0rnUvtpBXC5R4TaW3dvltJ5SNeMs5Hmn6zUd/ZUZQRAfSOK5ro78vzlpAuimzLDc8MgO/Ye2r3O5Y9HIB6le+nc5LhhM312FK5E4lEEY+/QRJdIC5gYb0kJObg2gGbXbJyj1nwOdK3/iCb7vjL/34UOMUBaI+Ne7tLhJRr/B4sTY12GdgFKDDvqS7ad/bKXQUQ34kzgS4eYqk6gHTeeBobCtIjnjg5ofafSUfMLLjysagxQXwZp1g/AKeFeN4P1veOM4ArDdl3Pk8+dSbKtBXKViHHnEbGbUC2TWxYOCXTuigLA13ENMP9aGaHv4SafuYaHFrgsPUIUFBapaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tnib1AXW9ZIDsEM2nFmOqjwYQkawDxBoIKzNV75KWws=;
 b=ygAkY6DOysOIbmiR2WL5h5kKuJwKUHBRfBPrCHx8a045cAiLvM35cWywkxoi5xbbtfZl79usPWIbt1Xhi4uT2Q8v9viE8ibv0aVRKj2seQfpQYn7fXzxD1sfClpcvqDhES6l4qhMhGgvrhbwfsBlsWQP945e3Mg+zhbwwsvT99tESuSHKKXdysuA+kl0mT/XZvSiNJT0srBweOwMMpAmZYtbWzbwqv1aUaLhVusi2HuKkO01vz+jWQ81YrnO2T1Yx9K+ZuxNfQ/OcggrFLu45E6x0S1ms4UbsDdTsRk0TISNyluriEtoIPQGtsMh8kYslzccqPPFXIQAEkKNTQ0Klw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17) by
 SE3PR06MB9116.apcprd06.prod.outlook.com (2603:1096:101:321::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 03:21:42 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::a1) by SG2P153CA0030.outlook.office365.com
 (2603:1096:4:c7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.3 via Frontend Transport; Wed, 2
 Sep 2026 03:21:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 03:21:39 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id F0E234092113;
	Wed,  2 Sep 2026 11:21:37 +0800 (CST)
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
Subject: [PATCH v2 5/5] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Date: Wed,  2 Sep 2026 11:21:34 +0800
Message-ID: <20260902032134.1182634-6-hongliang.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|SE3PR06MB9116:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 26ad01ed-1c6a-4354-76fe-08df08a14dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|82310400026|1800799024|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	LC7IjzUrd7gMfjHLPvFnUC+oXT5CIl4mb7Si8l6Z6dlW4oZ7ogTznruh2YtrH9yCpkgf7lhMLQX4xSDEsclVsnz3G7NseZvLDRF7pij3nO378smf/RdZbLnIQzcjicXoegBUjVOi2NITVsxBclFhfooXXnhWYONXQkIEJwCO1hfkvWsQLIWQzQqKblgxDUeZfEEBTTvbzo+G2okVbcQqC9QAXoXeFt360zsvkb3WcXxIWCXW5nBFAO1f6HgNKHP24USqJ4CgdVQLS5f+3yb+6n6nNahrJf7MmUSUWxuoNB8hVWjVmCGNpLXcdSD2+f1lrI+4Wx1pu2qRzFGx4+8kODrSyORo8UZZuCEouzdvdFEYCpK2b13hXan6TMMazH0Svy9e9f9QjpEHfpcoOBRNRYXRZ4zCK4Sr7uc8HMG38U+v5gM2JuTpN4SBrptX2/62h+5BnP5nQYv/YMb9enG8SOH6Ysm1TD3aWG27y23UwsYAvmP9bkHpZadPWOIjvVqF1Cw9xU+kyCOSmV9X3+FFs8hIrAScfLWWn1JvXNGBtYx5pjE8rLj0QYP+LYfwD7n9ykT8ZrHirhIPqhxjIaa+9H0T2XDsw7MP5MWBFewDnULt4goCjLEkkPj6vlwo1kXl67bHwtCiOJWuz62Cn4XMzmgB49z/S0KjcDrrywjrVZCoEBvG+b5ro/TmlS6RQcjeQji70mHi7jczt5yaGvJJVQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(82310400026)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Lj4oheoDoRmks+7VS8yJLfGFuejwOP+ySLwS8CraQbtezZKQkDRpnbcXclgo/OA+9GNthN41SgMlvWGzmiwNup7WjNguGL9KVsHerwzWBY+HKOD23Fvh261QwzmDAt6LrCbyakBp1dfcSp6wEH9eafxKXBHyGjzVBtyf+arUdYu50sjWzk/y8KWwThsK1l3RnKvK/3rXjqr/eB1tWoLJmlx3AuLUSxl2AOqBcXn+lwtKxIj/ZLT345rDCILg+uM9mdDAWkSqTcIfnlerHLSorXGswFaK9am6332WbThzoc6DahybVhddeyMu1aKmjzQX2VsajclLYNeURItsNUx/3anSoApFj6eqKNRJB0rR9K7pYOzJo7dLZS16XJ89dD8GeLI/Z6NjGVtgsl+TeoPSVYjBrvaiNLspEOtehRX0GmlAxRvNqZ6ojF57GTwW24b/
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 03:21:39.6060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ad01ed-1c6a-4354-76fe-08df08a14dec
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB9116

Add USB4 and USB5 controller nodes and their associated USB3 PHY nodes
for the CIX Sky1 SoC. Enable USB4 and USB5 in host mode on the Radxa
Orion O6 board.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  54 ++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 118 ++++++++++++++++++++++
 2 files changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..4f47e8cd70fc 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -80,6 +80,22 @@ pins {
 
 		};
 	};
+
+	pinctrl_usb4: usb4-power-on-cfg {
+		pins {
+			bias-pull-down;
+			drive-strength = <8>;
+			pinmux = <CIX_PAD_GPIO041_FUNC_USB_DRIVE_VBUS4>;
+		};
+	};
+
+	pinctrl_usb5: usb5-power-on-cfg {
+		pins {
+			bias-pull-down;
+			drive-strength = <8>;
+			pinmux = <CIX_PAD_GPIO042_FUNC_USB_DRIVE_VBUS5>;
+		};
+	};
 };
 
 &pcie_x8_rc {
@@ -117,3 +133,41 @@ &s5_gpio2 {
 &uart2 {
 	status = "okay";
 };
+
+&usb4 {
+	pinctrl-0 = <&pinctrl_usb4>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&usbss_4 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb5 {
+	pinctrl-0 = <&pinctrl_usb5>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&usbss_5 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb3_phy4 {
+	status = "okay";
+
+	usb-port@0 {
+		status = "okay";
+	};
+
+	usb-port@1 {
+		status = "okay";
+	};
+};
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index a77c52296ebd..661251765d22 100644
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
@@ -574,6 +581,117 @@ mbox_ap2sfh: mailbox@80a0000 {
 			cix,mbox-dir = "tx";
 		};
 
+		usb4: usb@91c0314 {
+			compatible = "cix,sky1-usbssp";
+			reg = <0x00 0x091c0314 0x00 0x4>,
+			      <0x00 0x091c0400 0x00 0x4>;
+			reg-names = "axi", "controller";
+			ranges;
+			#address-cells = <2>;
+			clocks = <&scmi_clk CLK_TREE_USB3A_H0_CLK_SOF>,
+			         <&scmi_clk CLK_TREE_USB3A_0_AXI_GATE>,
+			         <&scmi_clk CLK_TREE_USB3A_H0_CLK_LPM>,
+			         <&scmi_clk CLK_TREE_USB3A_0_APB_GATE>;
+			clock-names = "sof", "axi", "lpm", "apb";
+			resets = <&s5_syscon SKY1_USBC_SS2_PRST_N>,
+			         <&s5_syscon SKY1_USBC_SS2_RST_N>;
+			reset-names = "apb", "core";
+			#size-cells = <2>;
+			cix,usb-syscon = <&s5_syscon>;
+
+			status = "disabled";
+
+			usbss_4: usb@91d0000 {
+				compatible = "cdns,usb3";
+				reg = <0x00 0x91d0000 0x00 0x4000>,
+				      <0x00 0x91d8000 0x00 0x8000>,
+				      <0x00 0x91d4000 0x00 0x4000>;
+				reg-names = "otg", "xhci", "dev";
+				dr_mode = "otg";
+				interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
+				             <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
+				             <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
+				             <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "host", "peripheral",
+				                  "otg", "wakeup";
+				maximum-speed = "super-speed-plus";
+				phys = <&usb3_phy4_0>;
+				phy-names = "cdns3,usb3-phy";
+
+				status = "disabled";
+			};
+		};
+
+		usb5: usb@91c0324 {
+			compatible = "cix,sky1-usbssp";
+			reg = <0x00 0x091c0324 0x00 0x4>,
+			      <0x00 0x091c0410 0x00 0x4>;
+			reg-names = "axi", "controller";
+			ranges;
+			#address-cells = <2>;
+			clocks = <&scmi_clk CLK_TREE_USB3A_H1_CLK_SOF>,
+			         <&scmi_clk CLK_TREE_USB3A_1_AXI_GATE>,
+			         <&scmi_clk CLK_TREE_USB3A_H1_CLK_LPM>,
+			         <&scmi_clk CLK_TREE_USB3A_1_APB_GATE>;
+			clock-names = "sof", "axi", "lpm", "apb";
+			resets = <&s5_syscon SKY1_USBC_SS3_PRST_N>,
+			         <&s5_syscon SKY1_USBC_SS3_RST_N>;
+			reset-names = "apb", "core";
+			#size-cells = <2>;
+			cix,usb-syscon = <&s5_syscon>;
+
+			status = "disabled";
+
+			usbss_5: usb@91e0000 {
+				compatible = "cdns,usb3";
+				reg = <0x00 0x91e0000 0x00 0x4000>,
+				      <0x00 0x91e8000 0x00 0x8000>,
+				      <0x00 0x91e4000 0x00 0x4000>;
+				reg-names = "otg", "xhci", "dev";
+				dr_mode = "otg";
+				interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
+				             <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
+				             <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
+				             <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "host", "peripheral",
+				                  "otg", "wakeup";
+				maximum-speed = "super-speed-plus";
+				phys = <&usb3_phy4_1>;
+				phy-names = "cdns3,usb3-phy";
+
+				status = "disabled";
+			};
+		};
+
+		usb3_phy4: usb-phy@9210000 {
+			compatible = "cix,sky1-usb3-phy";
+			reg = <0x00 0x09210000 0x00 0x40000>;
+			#address-cells = <1>;
+			clocks = <&scmi_clk CLK_TREE_USB3A_PHY3_GATE>,
+			         <&scmi_clk CLK_TREE_USB3A_PHY_x2_REF>;
+			clock-names = "apb", "ref";
+			resets = <&s5_syscon SKY1_USBPHY_SS_RST_N>,
+			         <&s5_syscon SKY1_USBPHY_SS_PST_N>;
+			reset-names = "core", "apb";
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			usb3_phy4_0: usb-port@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			usb3_phy4_1: usb-port@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		pcie_x8_rc: pcie@a010000 {
 			compatible = "cix,sky1-pcie-host";
 			reg = <0x00 0x0a010000 0x00 0x10000>,
-- 
2.54.0

