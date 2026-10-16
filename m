Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24E03DFC7B;
	Fri, 16 Oct 2026 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159039; cv=none; b=THMDjjYxLH4gtPDeq1cL/12KWGCnynsqwcWSAVThA09ys+Pix0IFJ8cC2lW9TnGFM/t7+E2kAYGFnseFR3HnZIxP32fe6magW6cyuNIq8WB3fJIzrmu6p0vrkkKtt1szl4MyBuWnp3vbMQPWDn+NK9xkmshupoxnksAKtdIZE/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159039; c=relaxed/simple;
	bh=bWJ6GpVkJ5f0cCSpMNIzTrqipg1uURSdKwE/IVmYeIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C3881TbqZ0h9ZJ0f+NDKVvzxdt9mJZc61K6v4htDr4i6xXQPNjkrOI9hARGU2dpxkluO/rYdKtgPKuP2aPoLubAsXmYS+YLqTdSSjVcmRCtJ1+MTgqWSZMuQp9h7kWsJQjYe7Dr3fEi5Dpeatt6CAtBCy9QazIxU3Opl1dEGwqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwQp5o0S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwQp5o0S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66C7AC2BCF4;
	Fri, 16 Oct 2026 13:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792159038;
	bh=bWJ6GpVkJ5f0cCSpMNIzTrqipg1uURSdKwE/IVmYeIM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cwQp5o0SvOBb/GbwIyNmnK5znayb1y5jQZrn+PYfO6DFA10IdP7XhLt9iCY9np266
	 PxwYbGzu608yKDhfgGE7mLJg9H6hL4r3nX+2iCaFYP+H8mvFfjmedpP7ADFMAnhnuZ
	 NQJB2WcdqkhRz4jCBZFHF6ylQSDBMU5KRHsSgNUpAzcBmU1rZCw7n+/ca6bGAIHO29
	 GmjtFGZwftLEBTo3lVif+8vi06SamB2Plixf9VDpuQOd7g6A1wjvcwajRQpRxSNFTQ
	 UtXM3szR3SSWkdDLEgKBzNeES7RaAKtuIyQMWfQ6J0kDl2g8NkdsuuDyL9ou88Fyaq
	 dqVW4HBaLIgBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6E4CCA462;
	Fri, 16 Oct 2026 13:57:18 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Fri, 16 Oct 2026 13:57:09 +0000
Subject: [PATCH] arm64: dts: qcom: sm8350: Flatten USB controller nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-sm8350-usb-flatten-v1-1-22a2ca3e642f@fromdisposition.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBBA4auQWTtJh5+KXsWwKDjAGKimU4gJ4
 e5WWH6L9zZQDsIK92yDwKuovH0CXTLoRucHRnkmQ25yS4Ys6lwXlcFFW+wnFyN7tHVF7lpauhU
 lpPATuJfvMX00p3VpX9zF/wn2/QfO7r2LdgAAAA==
X-Change-ID: 20261016-sm8350-usb-flatten-6851a7461934
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792159042; l=8406;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=4PeNvpz5gpApVBXDzwm7sndi++evymHPK2bxZ29Wsto=;
 b=0njUvmb7SVmJ422XS7gYC8RsVTfO//QrL1015R5XwLDZZ3I/jscNl+TMiteV7vZPocpG71WXX
 1iP76AtG22yCGtWDr1XYSpYjyYjcfnl2QFSRzdMPfSdQh2ST+Iavjvf
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org

From: Demeter Barna <me@fromdisposition.org>

The USB controllers still use the legacy two-node layout, which binds
dwc3-qcom-legacy. That driver updates the QSCRATCH VBUS valid override
only through extcon, so with usb-role-switch the controller does not see
the cable being pulled and does not enumerate again when it comes back.

Flatten both controllers as on SM8450, so that dwc3-qcom updates the
override with the role, and move the board properties from &usb_N_dwc3
to &usb_N.

Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
Tested on a Razer Edge 5G (SM8350, board not upstream yet; Type-C
through pmic-glink): without this patch USB does not enumerate again
after the first unplug; with it, it does on every re-plug, after deep
sleep (5/5) and across reboots (3/3). The other boards are only
build-tested; dtbs_check is clean for all.

Prepared with an LLM coding assistant; tested on my device.
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            | 12 +--
 .../dts/qcom/sm8350-microsoft-surface-duo2.dts     |  6 +-
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |  6 +-
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |  6 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 94 ++++++++++------------
 5 files changed, 51 insertions(+), 73 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 24ad073b4143..47519654640a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -847,12 +847,10 @@ &ufs_mem_phy {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
@@ -879,14 +877,12 @@ &usb_1_qmpphy_out {
 };
 
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "host";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb_hub_enabled_state>;
+
+	status = "okay";
 };
 
 &usb_2_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
index 442405ba5f6a..01e39565c68f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
@@ -338,11 +338,9 @@ &ufs_mem_phy {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "peripheral";
+
+	status = "okay";
 };
 
 &usb_1_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
index 410bb0befeea..a282e6d2007e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
@@ -336,11 +336,9 @@ &ufs_mem_phy {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "peripheral";
+
+	status = "okay";
 };
 
 &usb_1_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index 969c8cb31df9..6e26aa3590b5 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -909,11 +909,9 @@ &ufs_mem_phy {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "peripheral";
+
+	status = "okay";
 };
 
 &usb_1_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 55b32050ce9c..21863ba00d17 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2615,13 +2615,10 @@ compute-cb@8 {
 			};
 		};
 
-		usb_1: usb@a6f8800 {
-			compatible = "qcom,sm8350-dwc3", "qcom,dwc3";
-			reg = <0 0x0a6f8800 0 0x400>;
+		usb_1: usb@a600000 {
+			compatible = "qcom,sm8350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xfc100>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -2638,12 +2635,14 @@ usb_1: usb@a6f8800 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
@@ -2657,48 +2656,40 @@ usb_1: usb@a6f8800 {
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
-			usb_1_dwc3: usb@a600000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a600000 0 0xcd00>;
-				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x0 0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy", "usb3-phy";
+			iommus = <&apps_smmu 0x0 0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-					port@0 {
-						reg = <0>;
+				port@0 {
+					reg = <0>;
 
-						usb_1_dwc3_hs: endpoint {
-						};
+					usb_1_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_1_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
-						};
+					usb_1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
 					};
 				};
 			};
 		};
 
-		usb_2: usb@a8f8800 {
-			compatible = "qcom,sm8350-dwc3", "qcom,dwc3";
-			reg = <0 0x0a8f8800 0 0x400>;
+		usb_2: usb@a800000 {
+			compatible = "qcom,sm8350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xfc100>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
 				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
@@ -2717,12 +2708,14 @@ usb_2: usb@a8f8800 {
 					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
@@ -2736,19 +2729,14 @@ usb_2: usb@a8f8800 {
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_1 0>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
-			usb_2_dwc3: usb@a800000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a800000 0 0xcd00>;
-				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x20 0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-				phys = <&usb_2_hsphy>, <&usb_2_qmpphy>;
-				phy-names = "usb2-phy", "usb3-phy";
-			};
+			iommus = <&apps_smmu 0x20 0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			phys = <&usb_2_hsphy>, <&usb_2_qmpphy>;
+			phy-names = "usb2-phy", "usb3-phy";
 		};
 
 		iris: video-codec@aa00000 {

---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261016-sm8350-usb-flatten-6851a7461934

Best regards,
--  
Demeter Barna <me@fromdisposition.org>


