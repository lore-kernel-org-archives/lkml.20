Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439164418F2;
	Sat, 26 Sep 2026 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426434; cv=none; b=a0v2+UJNIVjypzlogu915Hb+0gSvdwUmDmk4s0KxZbvoAe0BVabto4/ThkYojYYRE4bpeg2+pFO5agomghT37+h4SZJJq9zS1vvgemDLq0FON4IHZj1RBpIKF5kGTK6p0n/7e3T1RYsa+jTVPipAiFVKDVV0ZSQFOAwQt6RO5QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426434; c=relaxed/simple;
	bh=E+ieb3LE7ncIT4E7El1E9wjac2xsmMqHnPd46QppuKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Knb4rS8QOl03nt1lzBtElyV9dWiBCyyDTxkx0HuRLr9bZX1S/h3rYrY8fzzbVu5qZNVplBicTC92oR6vOlppmoKtv7h1sAHJofJDqbf4VZ1jk3TKWJ22Oy9ge7/sZxdAkUnvyeBWRSI/4doteOuorEFtLuFr4Mr7dA6b1Baaaeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXCxysvO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXCxysvO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16350C2BD00;
	Sat, 26 Sep 2026 12:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790426434;
	bh=E+ieb3LE7ncIT4E7El1E9wjac2xsmMqHnPd46QppuKg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mXCxysvOrJHyXvJKoj6pa6FPiXH1WzUDznoAa1Um+B9r6hzJR7zfo6+C1SYlQqt/p
	 aGbM6Nttiq4V0S1AONTlUNmzZ0wtF/I1KBKArgOMG7mkQU/NUn3tSQ5BsxuxXmspeF
	 ywYIqeWB5q2PrX76raArmmDyY8xzdME7j2Fp/T/MKb20sPT4xkAcf+qQoFnA9bHOcy
	 wSnkAN52H5v7gkf5QlHeSah+eAPRCE7mCW648KL80dVQLg0gpQFJicp4Z3pMZKgGIT
	 gVHAVMW5O0PDkfMJMzBKMFrwgRDFhA2RFI7s2vFPXG+f8xPbIsQoCeeNZbLtH6Ykvm
	 Id8SjYmZCnFNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06256C98332;
	Sat, 26 Sep 2026 12:40:34 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 26 Sep 2026 14:40:30 +0200
Subject: [PATCH RFC 11/12] arm64: dts: qcom: sdm845-oneplus-common: Enable
 USB Type-C port controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260926-typec-v1-11-31adc19f32c6@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3902; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Q1RD32QhsfxNI1Wlv483ruSgZWvd115eJ5gP4RSA0iE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqt70+v6f/M2Qj8ltENV4iwMzqcasimqGnn5e5E
 5zxolskc52JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCare9PgAKCRBgAj/E00kg
 cqxVD/4l1wTZ2Lq7JJMm2k/arBVdhyPUOYk+tBbFIslfgAxpAGHI5urwUgDiEt+7/DSSEPwFBAT
 6Q4FEC49JxWcuBrN8+q7g6EIZ6B0jkbQ4hGVBx7ahkx37ljvkOe2vHIR1kR4F2DQThQtxsxlKBz
 Nx5WYVwVt94W1h3iSSQjojfgJ95QAxdjBT6vbQGqacvMBoy8dOpizcG4Hmavd6XXoxgeVBgADSE
 eKzp5mMSX6NrAC5IzHgTTBXv8Qxrjt3nPkrWTZ6kCn2DLSSJvMJhOxhRkCy0BJJWOzLi7cN4F3Y
 H6J12Fz4MPq0jg73yDu3wDBRD4M+Z3QCONw6IVhcI7BceJsdC/hYx5FRuqFkuOCQ+rgTPBz1gqA
 hu/QKAGblOCcJqP0Qz+AkKF6Lppn+T9EHeptVKxizbKeapEeBCD7A26iHLsv23ntOFPsncEN/GD
 zM8cKlgTjrc4K9DNy5cQcGV/P3xkYZah+Ha1WgXkyinA8IH+pscnLiqvwHtuRymg4inRTBVwaIn
 yoomcq0Bv6t1rMA10EsUog0MsL6V/ny4dCr00/HR1qU7F8nwBtzecbKWNzgAXNSV9Pfc8rp9ThT
 ZXMFaYxVYU4xRPkdeeObdzR9vFiO0arzgDuPvf0F+nlEQu0tLFNka2PeYqDqnEf4c2HlE5CjeYm
 b2mqkWg78EZGSUw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Enable the PMI8998 Type-C port controller with a USB-C connector
description for the OnePlus 6 (enchilada) and OnePlus 6T (fajita),
which share the same USB-C hardware via this common dtsi.

The connector is configured as:
  - Sink-only power role with a 5V/3A sink PDO
  - Dual-role data with USB role switching

The VBUS output of the charger is not supported yet, so the port can't
act as a power source. Describe it as sink-only until VBUS support lands,
USB host mode is still reachable through a PD data role swap.

Only the HS endpoint (port@0) is wired to the DWC3 controller since
these devices use USB 2.0 only — the QMP USB3+DP combo PHY is not
connected in the OnePlus 6/6T hardware design. Consequently, no
DisplayPort Alt Mode is advertised and no SS orientation switching is
needed.

Switch the DWC3 controller from peripheral-only to OTG mode with
usb-role-switch to allow the TCPM framework to control USB host/device
role based on CC pin detection.

Assisted-by: LLM
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 48 +++++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 439779f308e38..c71cbd1effe91 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -6,16 +6,17 @@
  */
 
 /dts-v1/;
 
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
 
 #include "sdm845.dtsi"
 #include "sdm845-wcd9340.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
@@ -639,16 +640,53 @@ pinconf {
 		};
 	};
 };
 
 &pmi8998_charger {
 	status = "okay";
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
+		};
+	};
+};
+
 &pmi8998_flash {
 	status = "okay";
 
 	led-0 {
 		function = LED_FUNCTION_FLASH;
 		color = <LED_COLOR_ID_WHITE>;
 		led-sources = <1>;
 		led-max-microamp = <500000>;
@@ -929,28 +967,34 @@ &usb_1 {
 	 * disable USB3 clock requirement as the device only supports
 	 * USB2.
 	 */
 	qcom,select-utmi-as-pipe-clk;
 };
 
 &usb_1_dwc3 {
 	/*
-	 * We don't have the capability to switch modes yet.
+	 * The USB-C role is managed by the pmi8998 Type-C port controller
+	 * via usb-role-switch.
 	 */
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
 
 	/* fastest mode for USB 2 */
 	maximum-speed = "high-speed";
 
 	/* Remove USB3 phy as it's unused on this device. */
 	phys = <&usb_1_hsphy>;
 	phy-names = "usb2-phy";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmi8998_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
 	vdd-supply = <&vdda_usb1_ss_core>;
 	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
 	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
 
 	qcom,imp-res-offset-value = <8>;

-- 
2.55.0


