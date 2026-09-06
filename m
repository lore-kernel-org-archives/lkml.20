Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09D63C2795;
	Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666767; cv=none; b=uipsDRFMO0mxNj7WzGPPZo/TfKAgtMiz1fkYlOrmxpuw2sLkruBWdCOeOolQ31mtYJ87nsvKZ+okO19XyLQrxKpx69s8nASFwrQZr7/O9mcQ/a5LGZ9xI2/zBFKf2D7PVCwucWS4kyX8rYPAErjQjA48Omf3NsL3PN2tgF5iEgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666767; c=relaxed/simple;
	bh=Bbwqxn/dYETE0fH+5VZOc5Z5ZrxCBQN1qc3+VDfAIDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S1Vza6S0miwGxgpuKBJikOZHzFgJzKiqYwRqeC+LxIAOr/+/6AmbkoeeUV6oWHfpqJAaZl6MjER7NpBmdWldzbkjVPzOTJ86a4SV9CjyH8C/oDKmXpZFnfpdMm2hZcBjT+NQ/ooQ3n4tDcI88D6/OYrlLzyHPkIRwLqVWY45m7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPYg+FT1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPYg+FT1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A57DC2BCFD;
	Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788666766;
	bh=Bbwqxn/dYETE0fH+5VZOc5Z5ZrxCBQN1qc3+VDfAIDc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TPYg+FT1YiIyWYXuKUIFT50rsJ1T+KW0A2WzpeXV8KNWPug12kC/92IJoBMaZmsai
	 JUbGZqNRliCuByVvkLiz7FFytWqHTDmMjo74968CYFpDEP6h5H1gmW3twqzkw502hC
	 6FfOVBalRGdBsGfVl7n7Wq22cIthFYXMVHxq3fGwpMbPi0QTkQPxtbqEP8QdUothkT
	 mdTl4gj++TBf4DtO0rixnf1Xf03YwKU15qlnvcDGx+n7t8ZXpe4pxK//CN6FxYtWry
	 iJ7yBgm2YXHuVqb3HTWCv1lkD0FunkGn2dEvuAKMylDDJT3e/bLNUE1mo74Rvnxtoj
	 XfwALNV8ouUkg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F82C79FA0;
	Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 06 Sep 2026 07:52:44 +0400
Subject: [PATCH v2 05/10] arm64: dts: qcom: ipq5424: Flatten usb controller
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ipq-flatten-usb-v2-5-dab83120b10a@outlook.com>
References: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
In-Reply-To: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788666763; l=5216;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=y0UKZW8UPAFUmI+uUPmVraXJ0oMSSqbxgtDqSe4LuFQ=;
 b=tk+RhyQgjE94xgIgJ04yl0AXK8IJU7LaHG6rYVf5uD/7CqiZX4j9dFhihB459clbNFkQgBBht
 WhIx5JSY7oYCsgJkw6te3Hj1kRDNJ6J1ZkPVchiK5H3wUEYSm0N7CLK
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Flatten usb controller nodes and update to using latest bindings and
flattened driver approach.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++--
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 86 +++++++++++++----------------
 2 files changed, 41 insertions(+), 57 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index be8657239c46..dfd6a124686a 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -74,14 +74,6 @@ vreg_misc_0p925: regulator-usb-0p925 {
 	};
 };
 
-&dwc_0 {
-	dr_mode = "host";
-};
-
-&dwc_1 {
-	dr_mode = "host";
-};
-
 &pcie2 {
 	pinctrl-0 = <&pcie2_default_state>;
 	pinctrl-names = "default";
@@ -282,10 +274,14 @@ &uart1 {
 };
 
 &usb2 {
+	dr_mode = "host";
+
 	status = "okay";
 };
 
 &usb3 {
+	dr_mode = "host";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 702061e16a58..de795ca2a905 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -639,12 +639,9 @@ qusb_phy_1: phy@71000 {
 			status = "disabled";
 		};
 
-		usb2: usb2@1ef8800 {
-			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
-			reg = <0 0x01ef8800 0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb2: usb2@1e00000 {
+			compatible = "qcom,ipq5424-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x01e00000 0 0xfc100>;
 
 			clocks = <&gcc GCC_USB1_MASTER_CLK>,
 				 <&gcc GCC_USB1_SLEEP_CLK>,
@@ -663,33 +660,31 @@ usb2: usb2@1ef8800 {
 			assigned-clock-rates = <200000000>,
 					       <24000000>;
 
-			interrupts-extended = <&intc GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "qusb2_phy",
 					  "dm_hs_phy_irq",
 					  "dp_hs_phy_irq";
 
 			resets = <&gcc GCC_USB1_BCR>;
+
+			phys = <&qusb_phy_1>;
+			phy-names = "usb2-phy";
+
 			qcom,select-utmi-as-pipe-clk;
-			status = "disabled";
 
-			dwc_1: usb@1e00000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x01e00000 0 0xe000>;
-				clocks = <&gcc GCC_USB1_MOCK_UTMI_CLK>;
-				clock-names = "ref";
-				interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&qusb_phy_1>;
-				phy-names = "usb2-phy";
-				tx-fifo-resize;
-				snps,is-utmi-l1-suspend;
-				snps,hird-threshold = /bits/ 8 <0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-			};
+			tx-fifo-resize;
+			snps,is-utmi-l1-suspend;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+
+			status = "disabled";
 		};
 
 		qusb_phy_0: phy@7b000 {
@@ -730,13 +725,9 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
-		usb3: usb3@8af8800 {
-			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
-			reg = <0 0x08af8800 0 0x400>;
-
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb3: usb3@8a00000 {
+			compatible = "qcom,ipq5424-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x08a00000 0 0xfc100>;
 
 			clocks = <&gcc GCC_USB0_MASTER_CLK>,
 				 <&gcc GCC_USB0_SLEEP_CLK>,
@@ -755,34 +746,31 @@ usb3: usb3@8af8800 {
 			assigned-clock-rates = <200000000>,
 					       <24000000>;
 
-			interrupts-extended = <&intc GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "qusb2_phy",
 					  "dm_hs_phy_irq",
 					  "dp_hs_phy_irq";
 
 			resets = <&gcc GCC_USB_BCR>;
-			status = "disabled";
 
-			dwc_0: usb@8a00000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x08a00000 0 0xcd00>;
-				clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
-				clock-names = "ref";
-				interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&qusb_phy_0>, <&ssphy_0>;
-				phy-names = "usb2-phy", "usb3-phy";
-				tx-fifo-resize;
-				snps,is-utmi-l1-suspend;
-				snps,hird-threshold = /bits/ 8 <0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-			};
+			phys = <&qusb_phy_0>, <&ssphy_0>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			tx-fifo-resize;
+			snps,is-utmi-l1-suspend;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+
+			status = "disabled";
 		};
 
 		timer@f420000 {

-- 
2.53.0


