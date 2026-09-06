Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6952F8E99;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788670021; cv=none; b=kXMoQgkcyUkzokf97NwisH3AiaS6MjnQuAcfTWOfyD1AspPeMzbZ/XKhuJDoobxeCLHgdYHFIq3YkyOWerP+KZ5jwJxUuCgrsXoy/u3xunpswYLasDsfv93XpWarAXeHH4uEnq4EwrhkEljE2Cl5CZyo0o/CBJf/L1ixqXyrpe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788670021; c=relaxed/simple;
	bh=JaVt7yZdbJ9bWdkGGPA5mC2d1T6xwdo0sQd87FyuVTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7swx2jaJYjt1l919J0af0aBJvZpuh7vbfZRXWu3uo0C/kwPPRjvU7+i9ahddi8k184mNClmOPHWO320LKesXL6AXXhhGl6txh8d99EWZRocdnrgsDFK+PlCiUPwVr7+ITZwauhGwLd0u+RhWNh/v41aymGK9YmwcS0HaXBIT/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sTKKtom/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sTKKtom/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02121C2BD00;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788670021;
	bh=JaVt7yZdbJ9bWdkGGPA5mC2d1T6xwdo0sQd87FyuVTY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sTKKtom/7OPDghe9kGfapYhdmasIY65xkExt3aqAHGHUBWbcZWiJHoJAiXbMbd8NW
	 vy/ikxHVFXjRf3OrZRmRGyCKeXBJdJiPRu/pRqzAPe1DnZUIU7oR0UOh92hk1nt8gd
	 AEwr41sP5OL5hdyeGU0pl7ix+4QP+VPYuTXMNFZD99dXDaw+Kqg/ELKXQDj/5eHBSS
	 KA79YMTRTnik7UlHDtZapLZb2J4EK1CoZgQL3/T0XkCsU6S3RUqjdMZo1108pzUnbI
	 aAfFJmz5fjRk2QRzOCxJKVsb2CLfT3TriUJkb4rT1Yrd3DnbxFHM+X2jOuXTkMqwIK
	 hYKeAOs8EiEYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB99C79FA1;
	Sun,  6 Sep 2026 04:47:00 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 06 Sep 2026 08:46:42 +0400
Subject: [PATCH v3 03/10] arm64: dts: qcom: ipq5018: Flatten usb controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ipq-flatten-usb-v3-3-13e4e0f63123@outlook.com>
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
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788670018; l=3217;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=d4OUV1ubr3frsOV//1ALOKp4iIE5azs6C7X+EbQ6/2I=;
 b=nITrPC21x9Y9BL71zqAWKhah5eSe+DL7XTNs5FqNeF4gC3YqQ3mTDf5UxgG+oEjRJVtIMfYdD
 HbGHsVn7DufAObR7M3KkKhhhTGevRPTKzU+XMyjE5xgVD6zxbSWKzFA
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Flatten usb controller node and update to using latest bindings and
flattened driver approach.

In addition, set the right UTMI clock rate and override any clock
rate inherited from the bootloader.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts |  6 +--
 arch/arm64/boot/dts/qcom/ipq5018.dtsi          | 51 ++++++++++++--------------
 2 files changed, 25 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
index 33eef92b19b1..8efb2b21ed9e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -110,11 +110,9 @@ data-pins {
 };
 
 &usb {
-	status = "okay";
-};
-
-&usb_dwc {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usbphy0 {
diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 4fc627b47fe7..956d3217ec52 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -580,16 +580,9 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
-		usb: usb@8af8800 {
-			compatible = "qcom,ipq5018-dwc3", "qcom,dwc3";
-			reg = <0x08af8800 0x400>;
-
-			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
-					  "dp_hs_phy_irq",
-					  "dm_hs_phy_irq";
+		usb: usb@8a00000 {
+			compatible = "qcom,ipq5018-dwc3", "qcom,snps-dwc3";
+			reg = <0x08a00000 0xfc100>;
 
 			clocks = <&gcc GCC_USB0_MASTER_CLK>,
 				 <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
@@ -599,30 +592,32 @@ usb: usb@8af8800 {
 				      "iface",
 				      "sleep",
 				      "mock_utmi";
+			assigned-clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+			assigned-clock-rates = <60000000>;
+
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
 
 			resets = <&gcc GCC_USB0_BCR>;
 
+			phys = <&usbphy0>;
+			phy-names = "usb2-phy";
+
 			qcom,select-utmi-as-pipe-clk;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
 
-			status = "disabled";
+			tx-fifo-resize;
+			snps,is-utmi-l1-suspend;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
 
-			usb_dwc: usb@8a00000 {
-				compatible = "snps,dwc3";
-				reg = <0x08a00000 0xe000>;
-				clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
-				clock-names = "ref";
-				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-				phy-names = "usb2-phy";
-				phys = <&usbphy0>;
-				tx-fifo-resize;
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


