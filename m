Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4974244237A;
	Sat, 26 Sep 2026 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426434; cv=none; b=Zxsqd4ujDU20/TTJA0c7mj7VdE6UI5vGV0HX3/t1osr482/yxLIoYunrDZw+o/7TSEK+BXujegFN7vJf8oWTALWU/eBvsAuxUf8QkW1SNrhVET0J8ls1Tz+87sxc1UeCBij8DuZSNB0aAKTuCKnydDY87Ne+ABUVkrYsY7MmGfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426434; c=relaxed/simple;
	bh=tcPHSgwlBjZs9/CWT2bgvix/rz4IKMDvnGfKwY69OS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJJcZKeA/hLTHt9pH3My4mJcFQXBNu05zRrZb7bup/k6fAqL9OXcZ5AW4XEjgbUeCFbO1H7Z8GH0cV4ELdrx4wg5ylrjt+l9p9mhn3AzY5HvgNdYCVj4xzDmfDhSuc/P7DJ/AdkxmXhWSTl7SD+hfDdj+aNyCMr2n/zTOQGiBds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+d0jgpU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+d0jgpU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2981AC2BD01;
	Sat, 26 Sep 2026 12:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790426434;
	bh=tcPHSgwlBjZs9/CWT2bgvix/rz4IKMDvnGfKwY69OS4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l+d0jgpUW5BXyMTcWX+yfweRqctAb8fwG6KFWg2sNrDq5qkz0B+jZ6qHvkzttMU5/
	 SWl8XMN2DhSNhEKp3zmZ9UnTtm11kDAZyNZ/BK6jge92BdV5E4D9QG9co6mQow8GCq
	 Z6hgUVHSwgDAFXKhvbXLKXhqr5zcYN/ri3oTMCbsL29f3dqQ36PI33EaIfheCnCeUn
	 dmvaEDPyAkTJymJTOfWvCSHCz8/wfD23IDg1sqS9dUkFEnTXOSdyL8VM51SNKbN0DP
	 e8vuFJTXFv5HHAH5NJ8yGoenwLRSknvf96/1ADZ2sP545Zii4bBwVEzMBg3mezyJ30
	 UxqR6+8r7OgXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17526C98328;
	Sat, 26 Sep 2026 12:40:34 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 26 Sep 2026 14:40:31 +0200
Subject: [PATCH RFC 12/12] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 USB Type-C port controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-typec-v1-12-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
In-Reply-To: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
To: Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, mfd@lists.linux.dev, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4218; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=x32COcG8Butqrlw/fff8Lfo8b61ySUHbjR8/5yIgBUw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqt70+D9ld9Gu1iU4YWKZL3BfGDTzOC2I5j0XtG
 MZVW8YLmNSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCare9PgAKCRBgAj/E00kg
 ctTpEACDKiK7HntwbRh9oZMsTQl2VLJx030TyTKvQKkMLV8xfAZzVCr5NtbggSwgcW0cuAvvmOf
 a/eC3re114t2mQqz5sFmPuwQMndQPdUwdyB83yUpq/FG8jOD6b6H/qSFdeI3AmmAi2I5LPlbnXD
 q3sYf74UJo0aHBXbWzgluM5ucCqIOqFILfIVKCRF0spodPSY5IJO4GgJ3WTb4wDJWfjCdHWXRnd
 veQXKjLYzes/VLbdZbAPCx+SDuBG52lLqgFJjvu1aTLNK+24x29Xv9fnqFIjTyy+lMS1TB1fhVO
 hE+rbWoQQ3mkFIgo1XjLO0x3hKmV5GdNKbQeSSPJ/xXUZUcAdTmrXUnslz/Cq692xxWAW47QW3M
 OxKKwsda304QmybzA0WNQWQ2D4B28rcbirGgirSEzqkL1H3izI8hEzz1X6IN+D8FDxeqACkHg49
 66PoG3U5OwiONfiXCGgqq09ZYEqxTPxTISJmArCt9Ic8XvTBceLpuWADxTooDzcqh03j/tHDNW5
 xaGN43A/RRotu2VPLYwRtTM0Yq4xqx5WT2RbEo8o7QqtvG29uVbaWS8XPVnFFk5ZJVft4YefF3H
 X3xrniO/S5/tjmegs/I3vFYYM59GcJcalPPBN1kFmO7nI3pQ9Q3EywU8Qcbm1d63FhhHVzdiETq
 K5u4gTq0aPACfNg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Enable the PMI8998 Type-C port controller with a USB-C connector
description for the SHIFT6mq:

  - Sink-only power role with a 5V/3A sink PDO
  - Dual-role data with USB role switching

The VBUS output of the charger is not supported yet, so the port can't
act as a power source. Describe it as sink-only until VBUS support lands,
USB host mode is still reachable through a PD data role swap. Higher
voltage PDOs are left out until the charger driver programs the allowed
USBIN adapter voltage.

Wire the USB-C connector port graph:
  - port@0: DWC3 HS endpoint for USB role switching
  - port@1: QMP combo PHY for SS lane orientation

Switch the DWC3 controller from peripheral-only to OTG mode with
usb-role-switch to allow the TCPM framework to control USB host/device
role based on CC pin detection.

DisplayPort Alt Mode is not advertised yet, it will be added together
with enabling the DP controller (mdss_dp).

Assisted-by: LLM
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 62 ++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 1b0eaeafbd517..2ddbe732961a2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -6,16 +6,17 @@
  */
 
 /dts-v1/;
 
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
 / {
 	model = "SHIFT SHIFT6mq";
 	compatible = "shift,axolotl", "qcom,sdm845";
 	chassis-type = "handset";
@@ -654,16 +655,66 @@ led-1 {
 		color = <LED_COLOR_ID_YELLOW>;
 		led-sources = <2>;
 		led-max-microamp = <100000>;
 		flash-max-microamp = <1100000>;
 		flash-max-timeout-us = <1280000>;
 	};
 };
 
+&pmi8998_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l24a_3p075>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		/*
+		 * Sink only for now, as the PMI8998 charger doesn't provide
+		 * the VBUS output yet. Switch to the dual power role with
+		 * source PDOs, try-power-role and vbus-supply once it is
+		 * supported.
+		 *
+		 * Higher voltage sink PDOs will be added once the charger
+		 * driver programs the allowed USBIN adapter voltage.
+		 *
+		 * DisplayPort Alt Mode will be added together with enabling
+		 * the DP controller (mdss_dp).
+		 */
+		power-role = "sink";
+		data-role = "dual";
+		self-powered;
+
+		sink-pdos = <PDO_FIXED(5000, 3000,
+				       PDO_FIXED_USB_COMM |
+				       PDO_FIXED_DATA_SWAP)>;
+		op-sink-microwatt = <15000000>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pmi8998_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pmi8998_typec_mux_in: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
 &qup_uart9_rx {
 	drive-strength = <2>;
 	bias-pull-up;
 };
 
 &qup_uart9_tx {
 	drive-strength = <2>;
 	bias-disable;
@@ -855,17 +906,22 @@ &ufs_mem_phy {
 	vdda-pll-supply = <&vdda_ufs1_1p2>;
 };
 
 &usb_1 {
 	status = "okay";
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmi8998_hs_in>;
 };
 
 &usb_1_hsphy {
 	status = "okay";
 
 	vdd-supply = <&vreg_l1a_0p875>;
 	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
@@ -873,16 +929,20 @@ &usb_1_hsphy {
 
 &usb_1_qmpphy {
 	status = "okay";
 
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 };
 
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmi8998_typec_mux_in>;
+};
+
 &venus {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/venus.mbn";
 
 	status = "okay";
 };
 
 &wifi {
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;

-- 
2.55.0


