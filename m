Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB2E4A3F0C;
	Thu,  1 Oct 2026 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841228; cv=none; b=lYAmzd7ICG6cJWShiV3lwXOvVKVyK/o7DxvKeZ06Ez4j15QUyIvjbXB+92zqoCSQYsgdx1yz5yFDufLX8YlvIKSAeH4XrxVDLWOnQob4aSx9pwP/FKOimI6X6QvQspB7RLBy7uzahUcVtVm5nJ0aWaGoXn2gPUtRNluwBrbOP1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841228; c=relaxed/simple;
	bh=wfzv0GqtffRUcKu0nitIUU9FvQealI4fDUBxFclPL/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lB482qzUIEswhwge9wsKCmx8UJ76ylVVTT/ICQpSE6JLteUz/hqOTyguxqXPyFcGz/YnkPOZZ/zua8dxuAe0s9c6PKcqEB0lhNHgT+POsT22+Rt2bWO8pjxBY7xdtMkFksIM61RSgnYC9B7N3OXi5pQ5Ev4w9IeVhn3NyaD5O28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5lxvI4J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5lxvI4J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9E2EC4AF4D;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790841227;
	bh=wfzv0GqtffRUcKu0nitIUU9FvQealI4fDUBxFclPL/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z5lxvI4Jfhf9LJ0NYtci1+79QQRM/TNgkbjKB6pXoMFLzoLNxaw+ldgkFwVYc3Z9d
	 jjrheUQXWft3dZoIUulwI9OwvTOf7jM9LVAG+B6rRCw9kNfW3RkRAsQKs0VTM4aXnD
	 mZhMCfKkjaiwpXKrQU9OP5fizDS0I3ArSlwybgr05VlQGG4T1xp3Cfne7At6ghqpEB
	 YBIT1e72crL0dbUy/2su1baXJOs6VevQ5v1XNkYWQvAbDZiL7Nz/uRreQ2KOIw52Oy
	 /gl3zcEzDp70u4krsvPImyHL7ohE03x8vHT83lMxfYRMt33cF6Cuu7zDC0tcdbS4bS
	 Pveu3om/aEFTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6668CA5FA5;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Thu, 01 Oct 2026 11:53:51 +0400
Subject: [PATCH v4 8/8] arm64: dts: qcom: ipq9574: Flatten usb controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-ipq-flatten-usb-v4-8-486a4d5ede30@outlook.com>
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
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790841224; l=3497;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=ucCSCJLM3gwrUrksnvID3hZqnjd/cUHQ0F1NihiTB4s=;
 b=r12iJl/TNEBN8kmCbcMeV2xJFX839qpMTZn0BmXYoXJ/bxWNjw5/fta0gYq0PmLXFrsGjQajt
 bfY9S2ij/DmACBzEjTXhkwscE1eNrfZsbgB9hDhbuZEgzOwqPKIJcLC
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Flatten usb controller nodes and update to using latest bindings and
flattened driver approach.

In addition, swap interrupts for dp_hs_phy_irq and dm_hs_phy_irq as
per order in updated binding.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 +--
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 48 +++++++++++-------------
 2 files changed, 23 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 86138529ba77..68616590815b 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -254,10 +254,6 @@ flash@0 {
 	};
 };
 
-&usb_0_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_0_qmpphy {
 	vdda-pll-supply = <&mp5496_l5>;
 	vdda-phy-supply = <&regulator_fixed_0p925>;
@@ -274,6 +270,8 @@ &usb_0_qusbphy {
 };
 
 &usb3 {
+	dr_mode = "host";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 771a59585645..abb7a8391b46 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -757,12 +757,9 @@ usb_0_qmpphy: phy@7d000 {
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
@@ -781,32 +778,29 @@ usb3: usb@8af8800 {
 			assigned-clock-rates = <200000000>,
 					       <24000000>;
 
-			interrupts-extended = <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+					      <&intc GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "qusb2_phy",
-					  "dm_hs_phy_irq",
-					  "dp_hs_phy_irq";
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
 
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


