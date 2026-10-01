Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A35B3EA957;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841227; cv=none; b=c+6xiDmXawlgWaJ2ypn8UhkumF4uV39giOEnOecxBIHPVnC4cAlmwEMdSt8UGRaUtct0WhGDeB1LeU6OqxBo4yW93Bg9HBjI21C6lRjnj7wl5cYxt9y42dcFbYsPGp1bsJ6tMM53k26TS5GjM47UZyIEy+Esa2srFM+19Igf1kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841227; c=relaxed/simple;
	bh=QnUpphnnQ7013UkgTmlr7ZCmpOacjq/TbHyZ8X/m4Aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cynZNiimEhLHCIdxz7a9/kpkqP3KZa7yHXkOyXvPmpEP5wKf5N1FWzKI3CJRB9iFsRJmNdvMn2KzSjyHvA/G5Sl4DG0T9PEfswFGfI+hTCl0oLLGQBVt9UzyYWuVts5LmRm1h+AgU21UNJxmr66kK/O+nr+/aOm7C9AD5rgvqSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1JoW+wn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1JoW+wn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A881C4AF12;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790841227;
	bh=QnUpphnnQ7013UkgTmlr7ZCmpOacjq/TbHyZ8X/m4Aw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p1JoW+wn73QnzXLhnYe/LeknOmi9kvrMor+DvyIijdVp/2FjBSBrQTDSS22FsT/te
	 gbWu0zKheWSGoW8rPDiynr707cQr9Q8IJh1jIXN0egMldOp1F6hR87NBoZY7fb9IlB
	 LBYLUta2bGpvAp8miF3Dq/3zKJgCo8LOjuOZmeOdkz80eac2izMfCT2OpPbg/3E66E
	 7h1A+epRlNZPE3TA52QkEDS/BCeNBY76ACMxkS8djwAlyuX47JRflfZdeXGK4hzBls
	 eTHVS3ENP9Tk8a0x7DurGConmJMo0jvs/+jRJO2QPf4FrW5ju8LzjCt09HHPp7IJt9
	 lgqyRud6hN0Vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0100CCA5FCE;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Thu, 01 Oct 2026 11:53:44 +0400
Subject: [PATCH v4 1/8] arm64: dts: qcom: ipq5018: Flatten usb controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-ipq-flatten-usb-v4-1-486a4d5ede30@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790841224; l=3217;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=vSb5SCrOOgcKqtOqAskBl84HMnfl0jgqnWZwHBwwx2k=;
 b=fN/OCMsVsQTmx0RkZAlkUtBmT4gcUaQTIhJcBnew1mPEf7GEtn2Jv0QnjhDg1Kl3ncg2IlGn5
 8VlfZcRhPc3Bj4syAbWGK1yMaqD8lFRT3GYQspObC3y7G1z8QsFt5TU
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
index 34d4a0886356..1c1006ec50ca 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -120,11 +120,9 @@ data-pins {
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
index fe1ed240de59..4f81e87ffdbf 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -597,16 +597,9 @@ qpic_nand: spi@79b0000 {
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
@@ -616,30 +609,32 @@ usb: usb@8af8800 {
 				      "iface",
 				      "sleep",
 				      "mock_utmi";
+			assigned-clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+			assigned-clock-rates = <24000000>;
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


