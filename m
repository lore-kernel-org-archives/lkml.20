Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5BE28851F;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788670022; cv=none; b=p1YiZgNUvuzvvLrLD6X+UMzxdl1tA2ZiTuKY26cJYLLtLBVSxjzSCKcU1GOHg/QdFxul9rwnLNuO5LekpTfMC4KOvnW4ZSAIfWz0DVy0SshKvosvPRMQ+d9LI1+tVTiYBR2tIL7Kb619mECusPIgkhGiXa7mdoQtwaEF7OX2+vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788670022; c=relaxed/simple;
	bh=SUFE2Dky6cQoVddOB+SeWioBwtDfQj0rCyByHsrBZYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ncxp5X10lbrtZJllRYdZKgY5nYTdzIZsh2bjAfBTyCHmCqzm4R2+wk97hii7JSqxRob26YG0V2e4s1MJfzy312PJIxP3H9toaGGhhG5mkNMvfMiQ4tp7WVjYZ3tBGTdXY7oqjwTLb7CJ8yDcMPz96kQcKKAI/+vOQ9UassuPv4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFevK5tf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFevK5tf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B0B7C2BCFD;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788670021;
	bh=SUFE2Dky6cQoVddOB+SeWioBwtDfQj0rCyByHsrBZYA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kFevK5tfTKIUTwyPDnUjzqQZxLZU+P6S+ojdXC7eaaYg8EYaHlZVuICCatahXXXUN
	 1lcJ4adSvG7PLEcCUtLeYae70HalcEWTsRHal3rC0GESHFpo04yPqs83i/eoKcA39m
	 fTxZpdlYnty7YQ1d9YE+wejmNJN4Ix5nQNEJ+9StXn3o7JXZQJcI/rj86dlvkRRRRT
	 MJptatX3ipieImrGDrr4bkCemHt8mkYj6EIRrOREFj7Yt24sNLg9qGgG5z+vYHfXRa
	 1U3o7NU5WXw+rLSx70Ps8ePs7desA0Kx5WfyrcMOvs5CZh9h/alD7oxrOuAI7l8flz
	 fxcCKXNFMZ5Mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67697C79FA1;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 06 Sep 2026 08:46:49 +0400
Subject: [PATCH v3 10/10] arm64: dts: qcom: ipq9574: Flatten usb controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ipq-flatten-usb-v3-10-13e4e0f63123@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788670018; l=3383;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=tC+/n/l2GL/RsZoPV770YyexNIiGMPAPlCiic/jUtRw=;
 b=jPP0ec1ndGEEKu+1KpZpm+xBXD11ZT5GR739/IPOTjwRgjegzk5tru2sM0TtEmPzTqidDJtkq
 0lmfBS30v/9DtvyKIE2bAvIftZrtTOClnTRy6QAjV3By4QwKpJzxVGX
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

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 +--
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 48 +++++++++++-------------
 2 files changed, 23 insertions(+), 31 deletions(-)

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
index 5a5bda5f21a1..199ec0c2ae9e 100644
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


