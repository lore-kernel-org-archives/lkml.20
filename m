Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023104.outbound.protection.outlook.com [52.101.127.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739B133ADAF;
	Thu,  3 Sep 2026 02:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788402936; cv=fail; b=J8yrY1rKLGWSeuW0yDLFZysvNFCqMdLoiZh8PvA0+PnwKwDtomzejuknWWGPO0K3ZNZdYSojBjof9kE07fH4jM9o0oSt+otJ2pOEedEnFVN4fhtpYT4cELltooGpqze2GLfwwmXmYH5+ynLI61ysLQQs5eSfR0n3U0wJOeSdHmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788402936; c=relaxed/simple;
	bh=7NXqpSdYuZrUrxFWnrpKkYv2n/5BSSz8BHCBJMdRKLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PixmFvywDHf+TugHBG5PXTyWfUpxv3DZ4pflFm5X5LEPbNnjkSW6hehJhNqybyZI+J8+GqRadUkqJ9vSXqG/xFzau2Ychd7AKb8dySw9b79gLfWHUY67sBicCf7K1EzrPmGYoHJW/8WktCH+JdncY8RJUsUvKVFBQpu7ojpeRmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUQgcjZMuYP3cuvoK968P6Mo1mBlq2928sBnMLY99o/KpbuyvvJO+8IGlORpKaLrzmaUWMlJYdnfhfNWWPRYlziDkopej07FjAd2yGa9XZFGNIMrm0eLeHiQ4WTGVX+xqny3DkUPsDH1t1fX7Nepez+YRqIo/PjmdhhV1dCMHB6cwgtphtGdl83jneqXyylGDaS/6kLScRzV9roXhvEsZFkt+IN7So365HsbWFRJy/al0sAsrSi/LQvmADh68uuJEiVzO9GTWe28t6stFFfqLzgSKwE3JrH19QAgeYo6bSCmYwccJal6g4uYDYWr2Rje0w5KIiDka6llBASz3kzWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oH1RvRMjxEH6ZqlTsao5HpMzwPE+IlOegNHjbSOc0c=;
 b=Km0sx7TzNy2c2mQRsaN0dqnlmAJXOiSavI5G1LBOQ+LElSW6COi4yHhrVTZtQLQJGXEPx3XHdLy3Rn7hqvoXy8uiO3CislpuN3WvOGPkEiC7EfaaIE6sxHC/2vXylje6pqrehpV5LNf36uNkEYpzBELJGyHBU0dz08rPBMxMfiOx3bnEuLqa+WSk8K/yGUkPfbm857E039VtD6J3LkzZlheMSDPR6nYy8aaucvr6AOdXEpwKBMRp5T/dKAmFmsW/eVR/WfCd7sxqskrizND+mqqEViUTnMkoKwhjTy7mJfl/PblYDGN8RetMMC78sxKmmxPsAtewF/t9UBvJxmjyFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0021.apcprd02.prod.outlook.com (2603:1096:4:195::10)
 by TY8PR06MB9295.apcprd06.prod.outlook.com (2603:1096:405:3ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 02:35:26 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:4:195:cafe::29) by SI2PR02CA0021.outlook.office365.com
 (2603:1096:4:195::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 02:35:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 02:35:25 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2C9E94092108;
	Thu,  3 Sep 2026 10:35:24 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: krzk@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	fugang.duan@cixtech.com,
	gregkh@linuxfoundation.org,
	hongliang.yang@cixtech.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	pawell@cadence.com,
	peter.chen@kernel.org,
	robh@kernel.org,
	rogerq@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v3 5/5] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Date: Thu,  3 Sep 2026 10:35:21 +0800
Message-ID: <20260903023521.2064986-6-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903023521.2064986-1-hongliang.yang@cixtech.com>
References: <503e87d9-3311-413a-98c0-e02a02c4a354@kernel.org>
 <20260903023521.2064986-1-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|TY8PR06MB9295:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3e945f27-47a6-4fa0-8437-08df096402cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|1800799024|376014|23010399003|36860700016|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ew2vEtyNM7zwHKPSxFsxMB5KZfrU47lgXGnL57hBBdEzkHTUgbXnncjlBkxEM2TVrxOzQEhOrUidQZHxSBDpP1xosEBwOdbV5TYtLxpLNddJs8UWcG6XSWvjqtF71maQ7fVYaY8MaMQ6vJNxUxjuW4g0v2NgoQAz00ej4qVYtKgJIjqFZDMYNjXQ/8AI1Ap4uKu5ohkjrZxHXNNuyvtwsqMmNU2KBMyg74SuXZHaV6fjgyh9s7eeczEwZlOe6Ak2/KiNNrfY2IdpvY0AwStikaVtwyjpq7l+VtXoTqyJL8V7jfkm2rS87nREhdoH6cSo7fQuu7DYiog1UJd8k6EUwQRluh9SitIonC67GXtYlunmV3QYG1UfzDuCEHEYmK/Ae5ZIFEtZa7R6tPLEdZc8bG70ReehbI5ekOlsekZEJYdpEUJRO1tVPbG3gz4Ms4RpZ982R8U66KBbyAcz/1aCunmRHHJILHGlvL/7P+HZan78NcDIUPELXwykwhmKGfvtmybFj1i6j1dCcKUND3Eo99gg0VUhogtLiFGR8AUp5a+SkFRADnNOLUWR48LxiTVbVutgBM9xErg+HqChtLapUPHBF5Cm+qGUw/5JFh6xpkfO+XharVKSKduQGNkcz7Gqhddvn7b0k0u3WN24SnDzjakHx+hyanmIdygtHAoEc/7ICHT9sruYkvlv4P6cpstOaWQz9e5oIuC74X7v+yNJsQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Oa+HZPGhBsR/iqOjGQUJCHODQIpYPka5BQcJjSQZc2k20j5w7SnaEko+ocxxxaL3G+++uMQaW2vWfqzwrReZFbBOyVRInWYo91YneWG4eQZtHbFx6n8IBKAkD7zEbFLL+2YhYSFqZCGt1c+6bpT1B0X/b6NAZRFGNQ4zxwD9dF3j+NYiUytPQWZbjCt79QiVvd8AJwcBUczErbAsruAqmYgihEnpRwdmxK28iZBkA4k+CwHajCC+NCe/7n57YbS5myc3sennHJzj81+o1X/8heT0/PogQiFIW/sIbkBs2CQPNPcQlbzaUQ0KhcJgxH3invBOk2lq5kbfucydKmCijfFfiKLolB/Ud7DOvJHwP8CK1fqQbiJ8hTOsgu4IAN1ADvqv9oCHbINIU4pD+Xs8T/Wk3mP6KT2f0acU1sxHuSiYgYcuKsVCzk2YkYqIEmY6
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 02:35:25.4783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e945f27-47a6-4fa0-8437-08df096402cf
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY8PR06MB9295

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
index a77c52296ebd..e8febb9c558b 100644
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
+				interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>,
+				             <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>,
+				             <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH 0>,
+				             <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
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
+				interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>,
+				             <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>,
+				             <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>,
+				             <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>;
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

