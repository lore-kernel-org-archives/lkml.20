Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0E03DE43F;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788670021; cv=none; b=Y8CettEgp1KoSZ2hAlZ2IqQ5WisH2i8koN0RurJGa7SGjYpBDKdR69qYXJ6KpdUQml/3TPFWu5R1h+x6o18hpsUt16FaTncF8U9U+aQqyZu4BzE1TP8e4UmC3M+PBYVCcRkHHCLtMBEMpbyQg1DP/Py0aWG1FfNgbep+alxMTK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788670021; c=relaxed/simple;
	bh=YUIor8yMS9GKkHFUZ11ZoJQm/DvRtyUy5+W583C/if8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HD54evi3Odov0lX047elqLXUZt/1yU/hXZLSXY63DgKFJUIUgPAphSnumDkGdUR3wbdJC6Tx86BQHsKlpHqN2/A70sZYpY09NaFoaoQ3RipLucY9rk969aUSZpMwak38ZfdlgBLr5gd5Kzh5Mkp6S8cEMgD89dSgW4J5kslRaUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8yyGgBd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8yyGgBd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FD37C4AF0B;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788670021;
	bh=YUIor8yMS9GKkHFUZ11ZoJQm/DvRtyUy5+W583C/if8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=f8yyGgBdEOaP0dcHraZpaCs90Da69esTRpsIwv9r/2ilF/IGD0NeCaFU3C1leAd6n
	 oV0euphYhvJSZO4LwXiU88t6hanCBOf4ZAArBVvCjXgxfIyFb03xNGHqro9s0DpCEP
	 eA536LelqcWqr6TTF73pDCYlcuPsMBDpoDKpi3F2luERLwaW5Bg0q2DuYp15FFgmxv
	 VOd6q4ci1LVvGJ1RDFNH1v8umKxQASctrZg0sf2tPOlpAm/Psg93HUenzekhhTaqrK
	 PJwxVlaEDbbEtjYwtNCIj4dDH3d872sgqKtd85cbUzxNwEJIyVBcXFde3ePNX0a02m
	 BDF0VIwxCeMFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE426C79F9F;
	Sun,  6 Sep 2026 04:47:00 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 06 Sep 2026 08:46:43 +0400
Subject: [PATCH v3 04/10] arm64: dts: qcom: ipq5332: Flatten usb controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ipq-flatten-usb-v3-4-13e4e0f63123@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788670018; l=3451;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=PYOFo1aWcJ8CI++Ruzl5x/cryb7/w2wzFL+6CGLmDk4=;
 b=01fTuIF5eaQFE2aaDUTxhZhITF3mfrZ+xTGGCvtv3n96cCEK46ooNHjT7Oa8k1/e1urILE7bg
 8/7o9iNcK0+Denv1NORD5NWBinFbOLJcgkx5j98XiA2AyByh4VkE64e
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Flatten usb controller node and update to using latest bindings and
flattened driver approach.

In addition, set the right UTMI clock rate and override any clock rate
inherited from the bootloader.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts |  6 +--
 arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 57 +++++++++++++----------------
 2 files changed, 28 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
index c224ffc65b08..25a70cd884c0 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
@@ -90,11 +90,9 @@ spi_0_cs_pins: spi-0-cs-state {
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
diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..b8c54c75b161 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -493,16 +493,9 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
-		usb: usb@8af8800 {
-			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
-			reg = <0x08af8800 0x400>;
-
-			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
-					  "dp_hs_phy_irq",
-					  "dm_hs_phy_irq";
+		usb: usb@8a00000 {
+			compatible = "qcom,ipq5332-dwc3", "qcom,snps-dwc3";
+			reg = <0x08a00000 0xfc100>;
 
 			clocks = <&gcc GCC_USB0_MASTER_CLK>,
 				 <&gcc GCC_USB0_SLEEP_CLK>,
@@ -510,34 +503,36 @@ usb: usb@8af8800 {
 			clock-names = "core",
 				      "sleep",
 				      "mock_utmi";
+			assigned-clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+			assigned-clock-rates = <60000000>;
 
-			resets = <&gcc GCC_USB_BCR>;
-
-			qcom,select-utmi-as-pipe-clk;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
 
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
 			interconnects = <&gcc MASTER_SNOC_USB &gcc SLAVE_SNOC_USB>,
 					<&gcc MASTER_SNOC_USB &gcc SLAVE_SNOC_USB>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
-			status = "disabled";
+			resets = <&gcc GCC_USB_BCR>;
 
-			usb_dwc: usb@8a00000 {
-				compatible = "snps,dwc3";
-				reg = <0x08a00000 0xe000>;
-				clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
-				clock-names = "ref";
-				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
-				phy-names = "usb2-phy";
-				phys = <&usbphy0>;
-				tx-fifo-resize;
-				snps,is-utmi-l1-suspend;
-				snps,hird-threshold = /bits/ 8 <0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-			};
+			phys = <&usbphy0>;
+			phy-names = "usb2-phy";
+
+			qcom,select-utmi-as-pipe-clk;
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


