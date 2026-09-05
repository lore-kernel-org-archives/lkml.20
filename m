Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA363E3D80;
	Sat,  5 Sep 2026 09:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600558; cv=none; b=jUt3wQA6zCPKnwAXiV2Z1CL7m1G2IKTVd3NBlOFPo2xh7mnMfBv3emcm4cDim88BNs27Jwwo4xQ2swiHI1XMD26DVTyyyTt1jILzsOEpEIjMFCl8lTkitQYjUabpFj45+jn6byy0HTOcJ4c+lt11ChXrpIPaMVXXq/wrFqOPF2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600558; c=relaxed/simple;
	bh=x9bCHIdNxU686H3dTUnvG4JvEnW+JFzfX1E0/hrJ4yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aj3rW4ow2FM22pJOboWeQZkzI3AHiPQiVuKylFyATUXNTnA14Bwn5iLg8fbLZ5r3if8gKICHhjmtMPREvkOgYmBKcEeAoKeAGzdKs9KYG7D8mEkLKN0q+5WcmqmZ5IflaVZn56al/MpSNOYPtJXkGTmh7zyQWYp5sboUCSMdeE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaTOeCw0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaTOeCw0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED9C5C4AF14;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788600558;
	bh=x9bCHIdNxU686H3dTUnvG4JvEnW+JFzfX1E0/hrJ4yQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FaTOeCw0SUc9GBw7HW690dLF84nY9BByAYZgyHgLpN1poDz+0R5hfC2BjmX5HKqhS
	 dWS37hE77xALBiLZ3TYaejMS/QDX0XDtw3e5R1ujulQ5Imp2TcTlWGx3kLoWDnO3XS
	 3wl2tkOVKnOfWY6iE4qyTr+RpGQ2k9dbAcO1ClLyv4wGnE81woI3e/LwtPibLtGbPh
	 wEdlksaIikrxWIul9L/RdyrTA+6291mwPKJ1A/6J8KOyPmX868CdEMrQs/b54M25U+
	 ohoH/c8p8iX3KIBA3jVqo0j/eiW4qhWQgtZtG/5EXQ14tow/LOfrLDTFuNu5ge6uVI
	 bYoIgERV0Ga6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD540C624DB;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 05 Sep 2026 11:29:02 +0200
Subject: [PATCH 7/7] arm64: dts: qcom: ideacentre-mini: Drop the unused USB
 MP port
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-x1-ideacentre-mini-prettify-v1-7-9a87882973bb@oldschoolsolutions.biz>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788600555; l=2341;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=gkyKf5ZSbwzYMe5U0u9i2d5O8EacSLGu0fqHLK27Fys=;
 b=Wl7JQ/KLljoztzelh6cLZb3JnVOpKkmZCiCA10zUt5w7eCxUuOedIpntaagczI/B/6OCr16AM
 KhQgChYben+CHNuO4YciwAeyvVOlxYbGQA8hHw38YYdZsHDK+lG2wm3
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

usb_mp port 1 (hsphy1, qmpphy1, PTN3222 @ 0x4f, TLMM 184) is not
populated. lsusb only shows two xHCI controllers: USB-C on usb_1_ss0
and the rear ports behind a Genesys hub on usb_mp port 0.

Remove that repeater, its reset pin, and the second MP PHYs. Pin
usb_mp to usb2-0 / usb3-0 so the controller does not claim empty
PHYs.

Tested-on: IdeaCentre Mini 01Q8X10, Purwa (X1-26-100)

Assisted-by: Grok 4.5 (xAI)
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 .../qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi    | 40 ++--------------------
 1 file changed, 3 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi b/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
index 5a2db91d5e587..b720622c5d90e 100644
--- a/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
@@ -650,19 +650,6 @@ eusb3_repeater: redriver@47 {
 		pinctrl-names = "default";
 	};
 
-	eusb6_repeater: redriver@4f {
-		compatible = "nxp,ptn3222";
-		reg = <0x4f>;
-		#phy-cells = <0>;
-
-		vdd3v3-supply = <&vreg_l13b>;
-		vdd1v8-supply = <&vreg_l4b>;
-
-		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&eusb6_reset_n>;
-		pinctrl-names = "default";
-	};
 };
 
 &lpass_vamacro {
@@ -1059,14 +1046,6 @@ wake-n-pins {
 		};
 	};
 
-	eusb6_reset_n: eusb6-reset-n-state {
-		pins = "gpio184";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-		output-low;
-	};
-
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio191";
 		function = "gpio";
@@ -1184,6 +1163,9 @@ usb_1_ss2_qmpphy_out_dp: endpoint@0 {
 
 &usb_mp {
 	status = "okay";
+
+	phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
+	phy-names = "usb2-0", "usb3-0";
 };
 
 &usb_mp_hsphy0 {
@@ -1195,25 +1177,9 @@ &usb_mp_hsphy0 {
 	status = "okay";
 };
 
-&usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2e>;
-	vdda12-supply = <&vreg_l3e>;
-
-	phys = <&eusb6_repeater>;
-
-	status = "okay";
-};
-
 &usb_mp_qmpphy0 {
 	vdda-phy-supply = <&vreg_l3c>;
 	vdda-pll-supply = <&vreg_l3e>;
 
 	status = "okay";
 };
-
-&usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3c>;
-	vdda-pll-supply = <&vreg_l3e>;
-
-	status = "okay";
-};

-- 
2.53.0


