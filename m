Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791FF3E8C65;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841227; cv=none; b=NHTHNvtarkRlmoSmphUTZGMUFAOnBBoEnZ74IB8UfWWMhbv1KaEvM+1p8kfwBmhKjbnVDrqQxYM/RxlfskmqZuiyXImO+hQxt4ng6vgs8kqs2Rg7/5CnYP6FyVTwLW4NmLKkGXJ34ZTUBfFapQ4AU3TUbu+a1FPJPeErwYeHwOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841227; c=relaxed/simple;
	bh=e4r1wsaCudGQMw0iy0X0HiXG90QGfyzdg8SnMY4mLcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fyq2mBjsVfV7eKNBwaIfAk5fXl1m/kUbdRGdI063HuVWh+98s+50ApOJLfENT3cPMWy4nbhQ9HqbfDqTAHXCfrHliXlOVjiRcoBUzx5G71dKr3MXT3x7BfJXY2OV0EO7bG/8dURHFLqfohTw/PmlEW9K/tQCTsI7QsWV95jFMNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shQrWqS7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shQrWqS7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 441B1C2BCF4;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790841227;
	bh=e4r1wsaCudGQMw0iy0X0HiXG90QGfyzdg8SnMY4mLcU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=shQrWqS7+5tD9Yo6GV8Yq0H9XOpv+r/t3R2C7Y8rMycAaYUncnEe2fHBgrl5PmA/R
	 GnwO8L10/unLSWF8NDuzKKGKdmS/6Gx8Qp5fYfWs04h8AJNbyre65Uo2QqYIBlkiY3
	 16swUlwNcOjuQetsIcuE0On8xhgMLsOfC/75ROzN6OOezBOaxH/yornq/PxZFyuOZB
	 gJXib7WdumdDDWl/dckT1ev6nja9CYVWjb0UXhbp4FmkuWTMmfAjhLoih8W9hfwjng
	 fc8IMS7v+Mt+i1RTCf1m61f67I2XMkPQcWFS8uV0NaE0eJtYS8I4vPB3OX78yFYXJX
	 gEaBNtaGNDUtw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277FACA5FD2;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Thu, 01 Oct 2026 11:53:46 +0400
Subject: [PATCH v4 3/8] arm64: dts: qcom: ipq5424: Flatten usb controller
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-ipq-flatten-usb-v4-3-486a4d5ede30@outlook.com>
References: <20261001-ipq-flatten-usb-v4-0-486a4d5ede30@outlook.com>
In-Reply-To: <20261001-ipq-flatten-usb-v4-0-486a4d5ede30@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790841224; l=5279;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=2WbZjl88BsVpRDMHt1Ow+ORwp5yxlD+lDvmWEcY7aow=;
 b=GMUcklkAGAqAdZc9eG9WsIwoqTJMmjoPPtRbu1lCvJfua42X64RGMQKE92GL6PLGpPWnuedZ3
 XUFH4lUUXPJAko43U4QTlH2BYZXa+IXzZ1PHe5AbVwbqd8OkcmwGfA0
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Flatten usb controller nodes and update to using latest bindings and
flattened driver approach.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++--
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 86 +++++++++++++----------------
 2 files changed, 41 insertions(+), 57 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index 793afc3ee82e..0c3370dba65b 100644
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
@@ -284,10 +276,14 @@ &uart1 {
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
index 23f851e9241f..b1bfe31227e7 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -640,12 +640,9 @@ qusb_phy_1: phy@71000 {
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
@@ -664,33 +661,31 @@ usb2: usb2@1ef8800 {
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
@@ -746,13 +741,9 @@ restart_reason: restartreason-sram@7b0 {
 			};
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
@@ -771,34 +762,31 @@ usb3: usb3@8af8800 {
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


