Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B27D3C4B6A;
	Sun,  6 Sep 2026 03:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666767; cv=none; b=PONOiDLx4GKTB1nicxdLZGB+sOYcaMsQHvgIBc/yCoog3u3rpmJ273OjuTTnB0HakuBSdJwjC1ksp1K1d5GGrTmPVvrvA6p0aYvrIPwOy3Aa714mkWuEgrvmIxubr8dDPXnCsvHG0VOJxY7TCSW/MaY0lTKbUJ3lUSyx1ZgGPJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666767; c=relaxed/simple;
	bh=8tDaH+3AXpsTJ7Hi8IWULF3TZ/VQvjF6t0tc8cX2NIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LOnyrYbwG3GP05op5tb8rdR3fondJlY4feJsN2h3kYEm2i+oxQnpvfqQ7BX/VGJ0YGv3LbO6jIV+ow0B742y3W47hSGvMvB35py+FtVDcHatoopqgz2XJHrP/CSo9618OIvWcOK5Ta4V3QhAjHjutEovrmKO9pUx5cOOyswHksU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0OjbjO2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0OjbjO2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D46B4C32781;
	Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788666766;
	bh=8tDaH+3AXpsTJ7Hi8IWULF3TZ/VQvjF6t0tc8cX2NIU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i0OjbjO2iAhKeg40KmY3QHl7m/elF8zT+bCg9vZrLBeYwjNs57aBKN+oTRsWtrGeU
	 E2JZa2p3GFEPYng3ogqd738Oo300svjG7JqG4Gw/YUbcRo3oUk9NrCz2kxwNeR1TpE
	 Vlk/ikDqS3MTAfUjij+RDRyr6QS6tUoBb/oo91YhSoFtbeWyH9eQeg9ouuOmu5xaoA
	 VIohfw2bOyfQyjvMs7Fr1PRCVofzZeqyvilIa8oKfDO+ARYSzKZQmE0s8R07kh//Rh
	 J6fWMzKWdtZboePwvwnfw1golGnxbKAdQ6z3c5a2Wt+s68iaSgnF/93cB/zPPH8Bvr
	 A7eBCYqLJHXQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1485C79F91;
	Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 06 Sep 2026 07:52:49 +0400
Subject: [PATCH v2 10/10] arm64: dts: qcom: ipq9574: Flatten usb controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ipq-flatten-usb-v2-10-dab83120b10a@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788666763; l=3122;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=T+nwJe6bIqHYvmzJcEpOj0yFVwDqzzeofqVbUpwIM9Y=;
 b=dVFjIdgAi/4zW6P+88qDIOpfpFflRIugSSZ4sFus5MvxEawlJWnLUVgsVHmEy/mWY/FVg6d21
 dJNn52Sfof7BVewmCehW3pL2P0LnZTvhEWRzhtAPo92+kGRyY1VUc5j
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
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 ++--
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 40 ++++++++++--------------
 2 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 62877b46f9b3..0d06a838c233 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -252,10 +252,6 @@ flash@0 {
 	};
 };
 
-&usb_0_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_0_qmpphy {
 	vdda-pll-supply = <&mp5496_l5>;
 	vdda-phy-supply = <&regulator_fixed_0p925>;
@@ -272,6 +268,8 @@ &usb_0_qusbphy {
 };
 
 &usb3 {
+	dr_mode = "host";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 5a5bda5f21a1..cf2eacb16c36 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -756,12 +756,9 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
-		usb3: usb@8af8800 {
-			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
-			reg = <0x08af8800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+		usb3: usb@8a00000 {
+			compatible = "qcom,ipq9574-dwc3", "qcom,snps-dwc3";
+			reg = <0x08a00000 0xfc100>;
 
 			clocks = <&gcc GCC_SNOC_USB_CLK>,
 				 <&gcc GCC_USB0_MASTER_CLK>,
@@ -780,32 +777,29 @@ usb3: usb@8af8800 {
 			assigned-clock-rates = <200000000>,
 					       <24000000>;
 
-			interrupts-extended = <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "qusb2_phy",
 					  "dm_hs_phy_irq",
 					  "dp_hs_phy_irq";
 
 			resets = <&gcc GCC_USB_BCR>;
-			status = "disabled";
 
-			usb_0_dwc3: usb@8a00000 {
-				compatible = "snps,dwc3";
-				reg = <0x8a00000 0xcd00>;
-				clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
-				clock-names = "ref";
-				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb_0_qusbphy>, <&usb_0_qmpphy>;
-				phy-names = "usb2-phy", "usb3-phy";
-				tx-fifo-resize;
-				snps,is-utmi-l1-suspend;
-				snps,hird-threshold = /bits/ 8 <0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-			};
+			phys = <&usb_0_qusbphy>, <&usb_0_qmpphy>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			tx-fifo-resize;
+			snps,is-utmi-l1-suspend;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+
+			status = "disabled";
 		};
 
 		intc: interrupt-controller@b000000 {

-- 
2.53.0


