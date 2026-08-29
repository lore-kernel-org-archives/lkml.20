Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BB52D0605;
	Sat, 29 Aug 2026 19:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788031914; cv=none; b=Ns748A1Nsc1xB57x8nPzZ9HTRF+AxLAlBWH5GrQn2ckpd4gL16bljC/BP0IEjI5i1ZglT/wxhSbC0kw6TPlHBXci5Ra68k0nZzf0taFk83SC7vPt+G0veEt0/kWMaLVwksBowuZR1f9THL7IHGfkXZZEnhC06+4ueIs+Nx+tPbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788031914; c=relaxed/simple;
	bh=15opzRmKqGl0xbyqqgk5uEP/W3AXIwkst/G6x0dFFB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FzrqsEDzJLVJf6svvAyg8RXZxYy+EvtRejsejJYGfI23hE0nJyD24M+Q1ZARaG4bT1lc+uWsKYoncS2YnBsxyDeoavTESuZlG03/guw4OjePQ4YugsqfSE9TtIokoGdkGKgIABELfHKy3nP0/GgqvdnYPDtNVBKAxyG20edokp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQ0xyrBA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQ0xyrBA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97ACCC4AF0B;
	Sat, 29 Aug 2026 19:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788031914;
	bh=15opzRmKqGl0xbyqqgk5uEP/W3AXIwkst/G6x0dFFB4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kQ0xyrBAr6xhcm058pMw2uuybm33kgCW3clUvv8ywPdOpF25a53yNfQ3S+cqt/Q+3
	 vSmkAq0DvYCqJebDchE9gytbxGLULliG5yOFbFkIqCBdqsFe6PGyk6Uu+Jdc1cTh8d
	 Jx0bTYsYXlEecyPxZCtLmebCBkmy/TdaRsFRTLhO17xY7MXysHJN6Z90NlyIg2qdmW
	 PSF8huGmOce9FUiAsDmHanjSEk+zja0nLlCckDXHjTYx/0CQpfJTDnBvLlu3iUTXkA
	 DD1t0LJaS05sgFXm+X1fMJ/esMtgh9Sz8iPll4mKYr/2+keLfYUmTSaP5CG5lSKS//
	 QvAAYUzZIF8ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5CBC61DD9;
	Sat, 29 Aug 2026 19:31:54 +0000 (UTC)
From: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>
Date: Sat, 29 Aug 2026 21:31:26 +0200
Subject: [PATCH 2/2] ARM: dts: qcom: ipq4019: migrate USB to the
 qcom,snps-dwc3 glue
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-ipq4019-dwc3-migration-v1-2-cc66b54ce21c@divinehawk.com>
References: <20260829-ipq4019-dwc3-migration-v1-0-cc66b54ce21c@divinehawk.com>
In-Reply-To: <20260829-ipq4019-dwc3-migration-v1-0-cc66b54ce21c@divinehawk.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Eaton <linux@divinehawk.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788031913; l=3659;
 i=linux@divinehawk.com; s=20260828; h=from:subject:message-id;
 bh=AUKeyMHeQyiAGw9bR6BmQ2bzc7i1QB5Ai04Aihce1dI=;
 b=y2qzS66wPsaJTc6QXTrq4Q9IK8Jc7ccrse2Ady6RWm5+fNjE0NFDSr6SPW7Ga4gSKxuC+b8v1
 96MTGP0srhUBKqL1arpuMskHscT92SLgx89nLxu5FRqEjFJ3yloFCIq
X-Developer-Key: i=linux@divinehawk.com; a=ed25519;
 pk=UG4KnKXGwxjTNdirUPh/nySblET4aRxWYWSMTQwzlMw=
X-Endpoint-Received: by B4 Relay for linux@divinehawk.com/20260828 with
 auth_id=982
X-Original-From: Matt Eaton <linux@divinehawk.com>
Reply-To: linux@divinehawk.com

From: Matt Eaton <linux@divinehawk.com>

The legacy qcom,dwc3 glue describes the DWC3 core as a child node and
populates it with of_platform_populate(). qcom,snps-dwc3 embeds the core
in the glue device instead, so the two nodes collapse into one and the
unit address moves to the core base.

The QSCRATCH register block sits at a fixed 0xf8800 from the core base on
this SoC, which is what dwc3-qcom.c already assumes, so no driver change
is needed:

  usb3: 0x8a00000 + 0xf8800 = 0x8af8800
  usb2: 0x6000000 + 0xf8800 = 0x60f8800

Both match the addresses the wrapper nodes used before.

The usb3_dwc label goes away with the child node, so the ap120c-ac
override of the SS phy moves up to the parent.

Signed-off-by: Matt Eaton <linux@divinehawk.com>
---
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi |  4 --
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           | 46 ++++++++--------------
 2 files changed, 16 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
index be76bc39ac27..49c8ce80ac14 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
@@ -260,10 +260,6 @@ &usb3_hs_phy {
 
 &usb3 {
 	status = "okay";
-
-	};
-
-&usb3_dwc {
 	phys = <&usb3_hs_phy>;
 	phy-names = "usb2-phy";
 };
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index 8eeaab1c0be1..18c386ae9af7 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -654,26 +654,19 @@ usb3_hs_phy: usb-phy@a6000 {
 			status = "disabled";
 		};
 
-		usb3: usb@8af8800 {
-			compatible = "qcom,ipq4019-dwc3", "qcom,dwc3";
-			reg = <0x8af8800 0x100>;
-			#address-cells = <1>;
-			#size-cells = <1>;
+		usb3: usb@8a00000 {
+			compatible = "qcom,ipq4019-dwc3", "qcom,snps-dwc3";
+			reg = <0x8a00000 0xf8c00>;
+			interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3";
 			clocks = <&gcc GCC_USB3_MASTER_CLK>,
 				 <&gcc GCC_USB3_SLEEP_CLK>,
 				 <&gcc GCC_USB3_MOCK_UTMI_CLK>;
 			clock-names = "core", "sleep", "mock_utmi";
-			ranges;
+			phys = <&usb3_hs_phy>, <&usb3_ss_phy>;
+			phy-names = "usb2-phy", "usb3-phy";
+			dr_mode = "host";
 			status = "disabled";
-
-			usb3_dwc: usb@8a00000 {
-				compatible = "snps,dwc3";
-				reg = <0x8a00000 0xf8000>;
-				interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb3_hs_phy>, <&usb3_ss_phy>;
-				phy-names = "usb2-phy", "usb3-phy";
-				dr_mode = "host";
-			};
 		};
 
 		usb2_hs_phy: usb-phy@a8000 {
@@ -686,26 +679,19 @@ usb2_hs_phy: usb-phy@a8000 {
 			status = "disabled";
 		};
 
-		usb2: usb@60f8800 {
-			compatible = "qcom,ipq4019-dwc3", "qcom,dwc3";
-			reg = <0x60f8800 0x100>;
-			#address-cells = <1>;
-			#size-cells = <1>;
+		usb2: usb@6000000 {
+			compatible = "qcom,ipq4019-dwc3", "qcom,snps-dwc3";
+			reg = <0x6000000 0xf8c00>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3";
 			clocks = <&gcc GCC_USB2_MASTER_CLK>,
 				 <&gcc GCC_USB2_SLEEP_CLK>,
 				 <&gcc GCC_USB2_MOCK_UTMI_CLK>;
 			clock-names = "core", "sleep", "mock_utmi";
-			ranges;
+			phys = <&usb2_hs_phy>;
+			phy-names = "usb2-phy";
+			dr_mode = "host";
 			status = "disabled";
-
-			usb@6000000 {
-				compatible = "snps,dwc3";
-				reg = <0x6000000 0xf8000>;
-				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb2_hs_phy>;
-				phy-names = "usb2-phy";
-				dr_mode = "host";
-			};
 		};
 	};
 };

-- 
2.43.0


