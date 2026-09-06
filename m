Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6C83E00A5;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788670022; cv=none; b=WR3/ppdSBN3703BqlAPb1lbB3kJXLXXjZT3wsAoCAdlYyN9MP9Z/eeJ8/DqtvFBbFjFAQVLuFon/Amet/Dwys4XB4JBH1f9zE+fda3MIOlwWLYYRZVOgalKmlWWkT1CfyVhpn/VEGzIPyaid7H7N3R5rvhMSWCXbu2P4+A0lAVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788670022; c=relaxed/simple;
	bh=xoukKYFvKtH0yVYC52oTXyZxdkrrVfGnS9OTDeei6DU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ehCNdFiFBQ82bArg9XoxcUj3CvBCIuJ2f5Ex4ywWq/5RoVA4d/XLIClDRwH0bj68tKB5ohP5II9amMIGfiCuobhK6CLl3/tVucD8JCI3utTbxydB6RiyIKnlvFEfOXklXtWxLJ3+KJv68i76wbj2djUdnzGiz74UVdwerwSiWjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVjy6iTT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVjy6iTT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68B9AC2BCFF;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788670021;
	bh=xoukKYFvKtH0yVYC52oTXyZxdkrrVfGnS9OTDeei6DU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TVjy6iTT1Qz6ze6y7NeSzEKp8NMinTWRe9O3Hbt/aD2qYpt3e3Dp0cSJRIIRXzGjD
	 17Ak6/P/lhckXMIbZ+DVdsHewbKbiju4rlzCPvPod1bkmcIenfeF34GBegRotP0X0R
	 F9zZ/7BTNYeaTtf5ECNXmc17CsR8rOJ3TaBYoc5Kf+r8JIKvmORCD9sUzV8HHscS5o
	 kvLgdl2KVGzdlupClCswScd58Nzuzl5c4z/conIbYMRXU1XLVcYzshOVsbvtwctTLi
	 AwRA2hFtIosqPlyQ8FHtdTWBYTATSlvPGQ34dexo06oSazy8vYx9GkF7IHDe/tRWXG
	 R/aNjv4fCVdQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56134C79F8C;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 06 Sep 2026 08:46:48 +0400
Subject: [PATCH v3 09/10] arm64: dts: qcom: ipq8074: Flatten usb controller
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ipq-flatten-usb-v3-9-13e4e0f63123@outlook.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788670018; l=5701;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=uxth14kMmQNJdlzw9mv+WW7U6sqEqBSC4dgsram9iyE=;
 b=5Lb1womhZCVVcpnhAbLq/rMFmzhLxmQ2BNZXnwOFo+nYlerFfREzNCK6OEJv5S15e7o/x/OnP
 DXOiwho+QxTBEaWinExdmIIkmEPjskJvARFMRUTxn/gdKiDZM+KqGRd
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Flatten usb controller nodes and update to using latest bindings and
flattened driver approach.

In addition, fix indentation of properties in both nodes.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts |  12 ++--
 arch/arm64/boot/dts/qcom/ipq8074.dtsi     | 108 ++++++++++++++----------------
 2 files changed, 54 insertions(+), 66 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
index 75827676bde9..2a3b497f9598 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
@@ -52,14 +52,6 @@ &blsp1_uart5 {
 	status = "okay";
 };
 
-&dwc_0 {
-	dr_mode = "host";
-};
-
-&dwc_1 {
-	dr_mode = "host";
-};
-
 &pcie0 {
 	status = "okay";
 };
@@ -125,9 +117,13 @@ &ssphy_1 {
 };
 
 &usb_0 {
+	dr_mode = "host";
+
 	status = "okay";
 };
 
 &usb_1 {
+	dr_mode = "host";
+
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 5c57d9cd72fc..45745b58495c 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -625,102 +625,94 @@ qpic_nand: nand-controller@79b0000 {
 			status = "disabled";
 		};
 
-		usb_0: usb@8af8800 {
-			compatible = "qcom,ipq8074-dwc3", "qcom,dwc3";
-			reg = <0x08af8800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+		usb_0: usb@8a00000 {
+			compatible = "qcom,ipq8074-dwc3", "qcom,snps-dwc3";
+			reg = <0x08a00000 0xfc100>;
 
 			clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
-				<&gcc GCC_USB0_MASTER_CLK>,
-				<&gcc GCC_USB0_SLEEP_CLK>,
-				<&gcc GCC_USB0_MOCK_UTMI_CLK>;
+				 <&gcc GCC_USB0_MASTER_CLK>,
+				 <&gcc GCC_USB0_SLEEP_CLK>,
+				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
 			clock-names = "cfg_noc",
-				"core",
-				"sleep",
-				"mock_utmi";
+				      "core",
+				      "sleep",
+				      "mock_utmi";
 
 			assigned-clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
 					  <&gcc GCC_USB0_MASTER_CLK>,
 					  <&gcc GCC_USB0_MOCK_UTMI_CLK>;
 			assigned-clock-rates = <133330000>,
-						<133330000>,
-						<19200000>;
+					       <133330000>,
+					       <19200000>;
 
-			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "qusb2_phy",
 					  "ss_phy_irq";
 
 			power-domains = <&gcc USB0_GDSC>;
 
+			phys = <&qusb_phy_0>, <&ssphy_0>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			snps,parkmode-disable-ss-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+
 			resets = <&gcc GCC_USB0_BCR>;
-			status = "disabled";
 
-			dwc_0: usb@8a00000 {
-				compatible = "snps,dwc3";
-				reg = <0x8a00000 0xcd00>;
-				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&qusb_phy_0>, <&ssphy_0>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,parkmode-disable-ss-quirk;
-				snps,is-utmi-l1-suspend;
-				snps,hird-threshold = /bits/ 8 <0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-			};
+			status = "disabled";
 		};
 
-		usb_1: usb@8cf8800 {
-			compatible = "qcom,ipq8074-dwc3", "qcom,dwc3";
-			reg = <0x08cf8800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+		usb_1: usb@8c00000 {
+			compatible = "qcom,ipq8074-dwc3", "qcom,snps-dwc3";
+			reg = <0x08c00000 0xfc100>;
 
 			clocks = <&gcc GCC_SYS_NOC_USB1_AXI_CLK>,
-				<&gcc GCC_USB1_MASTER_CLK>,
-				<&gcc GCC_USB1_SLEEP_CLK>,
-				<&gcc GCC_USB1_MOCK_UTMI_CLK>;
+				 <&gcc GCC_USB1_MASTER_CLK>,
+				 <&gcc GCC_USB1_SLEEP_CLK>,
+				 <&gcc GCC_USB1_MOCK_UTMI_CLK>;
 			clock-names = "cfg_noc",
-				"core",
-				"sleep",
-				"mock_utmi";
+				      "core",
+				      "sleep",
+				      "mock_utmi";
 
 			assigned-clocks = <&gcc GCC_SYS_NOC_USB1_AXI_CLK>,
 					  <&gcc GCC_USB1_MASTER_CLK>,
 					  <&gcc GCC_USB1_MOCK_UTMI_CLK>;
 			assigned-clock-rates = <133330000>,
-						<133330000>,
-						<19200000>;
+					       <133330000>,
+					       <19200000>;
 
-			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "qusb2_phy",
 					  "ss_phy_irq";
 
 			power-domains = <&gcc USB1_GDSC>;
 
+			phys = <&qusb_phy_1>, <&ssphy_1>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			snps,parkmode-disable-ss-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+
 			resets = <&gcc GCC_USB1_BCR>;
-			status = "disabled";
 
-			dwc_1: usb@8c00000 {
-				compatible = "snps,dwc3";
-				reg = <0x8c00000 0xcd00>;
-				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&qusb_phy_1>, <&ssphy_1>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,parkmode-disable-ss-quirk;
-				snps,is-utmi-l1-suspend;
-				snps,hird-threshold = /bits/ 8 <0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-			};
+			status = "disabled";
 		};
 
 		intc: interrupt-controller@b000000 {

-- 
2.53.0


