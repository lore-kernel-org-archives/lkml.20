Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957364;
	b=B2gzFfUgmabI0/epCnSyF3ko4kvn02Spzpmp7hBsE7eoBC/hZtp0sxzrWL544oS7N7HY
	 JFpEYP6e69CgXmkQMY+BdFRf3nkTCaRnkSRtlT86c5plWiI3v2hKwej3idVhy14tUY9Z+
	 pJysu8vBYTXOI95YZgkVlgdw5djFWz6sBoA3F+q6qPzUvxsWDbn4agyVth8P/sPUj7riO
	 sUBMsDg/sG5Bz+urz8L4clA+fznCKfOWTFv9NYMs+iYn4JB68U3TGW6k7tQ97QaO9F7yb
	 vMFBGKNZZRQ8M+3cNcrHL83v+CUKuI8+TOle55hrYs4yo81fKVQGE+N+36rGCOnjCHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957364;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bs3ptZ7qbVvQRdzbMo1hVHqlidQQygQgkZB8kKxKSTI=;
	b=aAHqa8nHfYyEDtdg+aSAeTCOtsLKzXg3LMhVWD8mj2K55mVhJsThJSJ9NoDwCcYxvfZ7
	 SZ81037S2kgcnOa7z1o0zDE6cysNmwEUEbwnt/6ObQyPNRJYH1s41M9nwcugyrprhd4uh
	 Wd2gHB8w/16ah0hrT2RqLPfUTn1vO6h4kUNYMFYoNod/jIxGs1HD7QMwlQsiTinS3Yc1R
	 sPxPe9ejW4GRc9oBCkb23UHDc5MB/biKx4sYCfMbzOJe0B3BNbc7RPvAYhn/J26hLj0Vq
	 vArmKCOR4p9bzhUuzmsSbRc/UOOzXolWNS5z2aZWdwCEND24xj65VgA3KEiKP5x4DgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlYN5O2n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21410606A32E;
	Fri,  6 Nov 2026 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlYN5O2n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B351F008A5;
	Fri,  6 Nov 2026 09:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957362;
	bh=bs3ptZ7qbVvQRdzbMo1hVHqlidQQygQgkZB8kKxKSTI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZlYN5O2nWSFbO/qAMv9mdM88rKqaMMf8kHiUXZkVyU1d1BCnnDkWofJ8NZPphsEfA
	 SqwcwrOq6xl3NMWNJXuGdILQ17eYxWB0QhwVCNkDTnld/ebozNw/R3T7F8eU5CK7ws
	 cdEYGNO3x3H8H6qzzQrnCNHR0vEtcLORtqtSZbGv7CeAsPdyUGuc29uxBKxNQekXuP
	 Fhoi+gypRpvoIq8x86caDDUOw6NmxZOsBF/5Jaja38Pvm3dUOmWj2n0N2EAnJVt03b
	 t9HFmZjIjCJtvapnAeRwjVFlWQ6vLsHINhyDecvkq3AxvPPPhIg1NLtapAzw1NJKxz
	 PD78c/CwEbauQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 06 Nov 2026 10:29:03 +0100
Subject: [PATCH v3 2/8] arm64: dts: qcom: Consolidate Glymur CoB power grid
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-topic-sip_cob-v3-2-52cd3826ab49@oss.qualcomm.com>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
In-Reply-To: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
 Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793957347; l=80591;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=bRbxPfziNr0ZzyfTYnHY7b1M8a7oOWq4aygzbVqKZu0=;
 b=73mC0sMFmXcS7SBQX7269yACN9NQWinin0htu+ZOmGoRHf1H7owsZVxH9qB+lMjZhUdt6IRkM
 iI01KcHhSxhCozF4vM5ZShHjUbCMOjbYuCykn0uY6Z3oiKoK+v3wCoi
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The power grid is partly defined by connections to the on-SoC
peripherals, which (due to various reasons, electrical and practical)
are well-defined for each PMIC configuration. Factor out the common
bits for Glymur CoB devices.

Because some DTs (mostly the CRD) disagreed about certain values, I
made sure to look up the desired one for each of these common rails,
they are now set as expected.

This enables one to take care of most required vreg settings with a
single #include.

Tested-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  | 242 +------------
 arch/arm64/boot/dts/qcom/glymur-cob.dtsi           | 319 +++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  30 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 358 ++++---------------
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 199 +----------
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 296 ++--------------
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            |  22 +-
 arch/arm64/boot/dts/qcom/glymur-qcb.dtsi           | 300 +++-------------
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |  23 --
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 379 +++------------------
 arch/arm64/boot/dts/qcom/mahua-qcb.dts             |   8 -
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  29 +-
 12 files changed, 562 insertions(+), 1643 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
index e96e65a0c5b4..154026b715d1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
@@ -4,14 +4,7 @@
  */
 /dts-v1/;
 
-#include "glymur.dtsi"
-
-#include "pmcx0102.dtsi"
-#include "pmh0101.dtsi"
-#include "pmh0110-glymur.dtsi"
-#include "pmh0104-glymur.dtsi"
-#include "pmk8850.dtsi"
-#include "smb2370.dtsi"
+#include "glymur-cob.dtsi"
 
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
@@ -355,157 +348,12 @@ m2_e_uart_ep: endpoint@0 {
 	};
 };
 
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pmh0101-rpmh-regulators";
-		qcom,pmic-id = "B_E0";
-
-		vreg_l1b0: ldo1 {
-			regulator-name = "vreg_l1b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7b0: ldo7 {
-			regulator-name = "vreg_l7b0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8b0: ldo8 {
-			regulator-name = "vreg_l8b0";
-			regulator-min-microvolt = <3304000>;
-			regulator-max-microvolt = <3304000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l15b0: ldo15 {
-			regulator-name = "vreg_l15b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			/* Provides reference voltage for many undescribed components */
-			regulator-always-on;
-		};
-
-		vreg_l18b0: ldo18 {
-			regulator-name = "vreg_l18b0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-
-			/*
-			 * This is also reference voltage for &pcie3b wake and
-			 * reset signals.
-			 */
-			regulator-always-on;
-		};
-	};
-
-	regulators-1 {
-		compatible = "qcom,pmcx0102-rpmh-regulators";
-		qcom,pmic-id = "C_E1";
-
-		vreg_l1c1: ldo1 {
-			regulator-name = "vreg_l1c1";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c1: ldo2 {
-			regulator-name = "vreg_l2c1";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3c1: ldo3 {
-			regulator-name = "vreg_l3c1";
-			regulator-min-microvolt = <936000>;
-			regulator-max-microvolt = <936000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4c1: ldo4 {
-			regulator-name = "vreg_l4c1";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-2 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E0";
-
-		vreg_l2f0: ldo2 {
-			regulator-name = "vreg_l2f0";
-			regulator-min-microvolt = <936000>;
-			regulator-max-microvolt = <936000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3f0: ldo3 {
-			regulator-name = "vreg_l3f0";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-3 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E1";
-
-		vreg_l1f1: ldo1 {
-			regulator-name = "vreg_l1f1";
-			regulator-min-microvolt = <904000>;
-			regulator-max-microvolt = <904000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f1: ldo2 {
-			regulator-name = "vreg_l2f1";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f1: ldo4 {
-			regulator-name = "vreg_l4f1";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-4 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "H_E0";
-
-		vreg_l1h0: ldo1 {
-			regulator-name = "vreg_l1h0";
-			regulator-min-microvolt = <936000>;
-			regulator-max-microvolt = <936000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2h0: ldo2 {
-			regulator-name = "vreg_l2h0";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4h0: ldo4 {
-			regulator-name = "vreg_l4h0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+&rpmh_vregs_b_e0 {
+	vreg_l8b0: ldo8 {
+		regulator-name = "vreg_l8b0";
+		regulator-min-microvolt = <3304000>;
+		regulator-max-microvolt = <3304000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 };
 
@@ -625,8 +473,6 @@ keyboard@15 {
 };
 
 &lpass_vamacro {
-	vdd-micb-supply = <&vreg_l1b0>;
-
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
 
@@ -695,19 +541,10 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
 &pcie3_phy {
-	vdda-phy-supply = <&vreg_l3c1>;
-	vdda-pll-supply = <&vreg_l2c1>;
-
-	vdda-refgen0p9-supply = <&vreg_l1c1>;
-	vdda-refgen1p2-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -733,9 +570,6 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -791,16 +625,6 @@ &remoteproc_soccp {
 	status = "okay";
 };
 
-&smb2370_j_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b0>;
-	vdd3-supply = <&vreg_l7b0>;
-};
-
-&smb2370_k_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b0>;
-	vdd3-supply = <&vreg_l7b0>;
-};
-
 &swr0 {
 	status = "okay";
 
@@ -829,26 +653,6 @@ right_speaker: speaker@0,1 {
 	};
 };
 
-&tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4h0>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f0>;
-	vdda-refgen3-1p2-supply = <&vreg_l4h0>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f1>;
-};
-
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC Secure */
 			       <10 2>, /* OOB UART */
@@ -1025,19 +829,12 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_hsphy {
-	vdd-supply = <&vreg_l3f0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&smb2370_j_e2_eusb2_repeater>;
 
 	status = "okay";
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l3f0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l2f0>;
-
 	status = "okay";
 };
 
@@ -1054,19 +851,12 @@ &usb_1_dwc3_hs {
 };
 
 &usb_1_hsphy {
-	vdd-supply = <&vreg_l3f0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&smb2370_k_e2_eusb2_repeater>;
 
 	status = "okay";
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l1h0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l2f0>;
-
 	status = "okay";
 };
 
@@ -1075,10 +865,6 @@ &usb_1_qmpphy_out {
 };
 
 &usb_2_qmpphy {
-	vdda-phy-supply = <&vreg_l4c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-	refgen-supply = <&vreg_l4f1>;
-
 	/delete-property/ mode-switch;
 	/delete-property/ orientation-switch;
 
@@ -1106,35 +892,21 @@ &usb_mp {
 };
 
 &usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2h0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&ptn3222_0>;
 
 	status = "okay";
 };
 
 &usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2h0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&ptn3222_1>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l2h0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l2h0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-cob.dtsi b/arch/arm64/boot/dts/qcom/glymur-cob.dtsi
new file mode 100644
index 000000000000..efc1da9f1d39
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/glymur-cob.dtsi
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Common PMIC settings for on-SoC peripherals found on Glymur-CoB and
+ * derived platforms.
+ */
+
+#include "glymur.dtsi"
+#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
+#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
+#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
+#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
+#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
+#include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
+
+&apps_rsc {
+	rpmh_vregs_b_e0: regulators-0 {
+		compatible = "qcom,pmh0101-rpmh-regulators";
+		qcom,pmic-id = "B_E0";
+
+		vreg_l1b0: ldo1 {
+			regulator-name = "vreg_l1b0";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b0: ldo7 {
+			regulator-name = "vreg_l7b0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* Pull-ups etc. */
+		vreg_l10b0: ldo10 {
+			regulator-name = "vreg_l10b0";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* Pull-ups etc. */
+		vreg_l11b0: ldo11 {
+			regulator-name = "vreg_l11b0";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* Pull-ups etc. */
+		vreg_l15b0: ldo15 {
+			regulator-name = "vreg_l15b0";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			/* Provides reference voltage for many undescribed components */
+			regulator-always-on;
+		};
+
+		/* Pull-ups etc. */
+		vreg_l18b0: ldo18 {
+			regulator-name = "vreg_l18b0";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			/* Provides reference voltage for many undescribed components */
+			regulator-always-on;
+		};
+	};
+
+	rpmh_vregs_c_e1: regulators-1 {
+		compatible = "qcom,pmcx0102-rpmh-regulators";
+		qcom,pmic-id = "C_E1";
+
+		vreg_l1c1: ldo1 {
+			regulator-name = "vreg_l1c1";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c1: ldo2 {
+			regulator-name = "vreg_l2c1";
+			regulator-min-microvolt = <1216000>;
+			regulator-max-microvolt = <1216000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c1: ldo3 {
+			regulator-name = "vreg_l3c1";
+			regulator-min-microvolt = <952000>;
+			regulator-max-microvolt = <952000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c1: ldo4 {
+			regulator-name = "vreg_l4c1";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	rpmh_vregs_f_e0: regulators-2 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		vreg_l2f0: ldo2 {
+			regulator-name = "vreg_l2f0";
+			regulator-min-microvolt = <944000>;
+			regulator-max-microvolt = <944000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f0: ldo3 {
+			regulator-name = "vreg_l3f0";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* Voltage input for PMCX0104 */
+		vreg_s9f0: smps9 {
+			regulator-name = "vreg_s9f0";
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	rpmh_vregs_f_e1: regulators-3 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E1";
+
+		vreg_l1f1: ldo1 {
+			regulator-name = "vreg_l1f1";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f1: ldo2 {
+			regulator-name = "vreg_l2f1";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4f1: ldo4 {
+			regulator-name = "vreg_l4f1";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	rpmh_vregs_h_e0: regulators-4 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "H_E0";
+
+		vreg_l1h0: ldo1 {
+			regulator-name = "vreg_l1h0";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2h0: ldo2 {
+			regulator-name = "vreg_l2h0";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* DDR, QFPROM */
+		vreg_l3h0: ldo3 {
+			regulator-name = "vreg_l3h0";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4h0: ldo4 {
+			regulator-name = "vreg_l4h0";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&lpass_vamacro {
+	vdd-micb-supply = <&vreg_l1b0>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l2f1>;
+	vdda-pll-supply = <&vreg_l4f1>;
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l1c1>;
+	vdda-pll-supply = <&vreg_l4f1>;
+};
+
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c1>;
+	vdda-pll-supply = <&vreg_l2c1>;
+
+	vdda-refgen0p9-supply = <&vreg_l1c1>;
+	vdda-refgen1p2-supply = <&vreg_l4f1>;
+};
+
+&pcie5_phy {
+	vdda-phy-supply = <&vreg_l2f0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+};
+
+&pcie6_phy {
+	vdda-phy-supply = <&vreg_l1c1>;
+	vdda-pll-supply = <&vreg_l4f1>;
+};
+
+&smb2370_j_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b0>;
+	vdd3-supply = <&vreg_l7b0>;
+};
+
+&smb2370_k_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b0>;
+	vdd3-supply = <&vreg_l7b0>;
+};
+
+&smb2370_l_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b0>;
+	vdd3-supply = <&vreg_l7b0>;
+};
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h0>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h0>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h0>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f0>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f0>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h0>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f0>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h0>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f1>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f1>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l3f0>;
+	vdda12-supply = <&vreg_l4h0>;
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l3f0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l2f0>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l3f0>;
+	vdda12-supply = <&vreg_l4h0>;
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l1h0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l2f0>;
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&vreg_l4c1>;
+	vdda12-supply = <&vreg_l4f1>;
+};
+
+&usb_2_qmpphy {
+	vdda-phy-supply = <&vreg_l4c1>;
+	vdda-pll-supply = <&vreg_l4f1>;
+	refgen-supply = <&vreg_l4f1>;
+};
+
+&usb_hs_phy {
+	vdd-supply = <&vreg_l2h0>;
+	vdda12-supply = <&vreg_l4h0>;
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2h0>;
+	vdda12-supply = <&vreg_l4h0>;
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2h0>;
+	vdda12-supply = <&vreg_l4h0>;
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l2h0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l4f1>;
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l2h0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l4f1>;
+};
diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index dfac99056bcd..28d9b0e4e21f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "glymur.dtsi"
+#include "glymur-cob.dtsi"
 #include "glymur-crd.dtsi"
 
 / {
@@ -28,31 +28,3 @@ &mdss_dp1 {
 &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
-
-&pcie3_phy {
-	vdda-phy-supply = <&vreg_l3c1>;
-	vdda-pll-supply = <&vreg_l2c1>;
-
-	vdda-refgen0p9-supply = <&vreg_l1c1>;
-	vdda-refgen1p2-supply = <&vreg_l4f1>;
-};
-
-&tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4h0>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f0>;
-	vdda-refgen3-1p2-supply = <&vreg_l4h0>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f1>;
-};
diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 4744bcb3c123..422ed0308147 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -3,13 +3,6 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
-#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
-#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
-#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
-#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
-#include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
-
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
@@ -345,247 +338,86 @@ vreg_pmu_pcie_1p8: ldo9 {
 	};
 };
 
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pmh0101-rpmh-regulators";
-		qcom,pmic-id = "B_E0";
-
-		vreg_bob1_e0: bob1 {
-			regulator-name = "vreg_bob1_e0";
-			regulator-min-microvolt = <2200000>;
-			regulator-max-microvolt = <4224000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
-		};
-
-		vreg_bob2_e0: bob2 {
-			regulator-name = "vreg_bob2_e0";
-			regulator-min-microvolt = <2540000>;
-			regulator-max-microvolt = <3600000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
-		};
-
-		vreg_l1b0: ldo1 {
-			regulator-name = "vreg_l1b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2b0: ldo2 {
-			regulator-name = "vreg_l2b0";
-			regulator-min-microvolt = <1804000>;
-			regulator-max-microvolt = <2904000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7b0: ldo7 {
-			regulator-name = "vreg_l7b0";
-			regulator-min-microvolt = <2790000>;
-			regulator-max-microvolt = <2792000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8b0: ldo8 {
-			regulator-name = "vreg_l8b0";
-			regulator-min-microvolt = <1504000>;
-			regulator-max-microvolt = <1504000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9b0: ldo9 {
-			regulator-name = "vreg_l9b0";
-			regulator-min-microvolt = <2960000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l10b0: ldo10 {
-			regulator-name = "vreg_l10b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l11b0: ldo11 {
-			regulator-name = "vreg_l11b0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l12b0: ldo12 {
-			regulator-name = "vreg_l12b0";
-			regulator-min-microvolt = <1144000>;
-			regulator-max-microvolt = <1144000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l15b0: ldo15 {
-			regulator-name = "vreg_l15b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l17b0: ldo17 {
-			regulator-name = "vreg_l17b0";
-			regulator-min-microvolt = <2400000>;
-			regulator-max-microvolt = <2700000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l18b0: ldo18 {
-			regulator-name = "vreg_l18b0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+&rpmh_vregs_b_e0 {
+	vreg_bob1_e0: bob1 {
+		regulator-name = "vreg_bob1_e0";
+		regulator-min-microvolt = <2200000>;
+		regulator-max-microvolt = <4224000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
 	};
 
-	regulators-1 {
-		compatible = "qcom,pmcx0102-rpmh-regulators";
-		qcom,pmic-id = "C_E1";
-
-		vreg_l1c1: ldo1 {
-			regulator-name = "vreg_l1c1";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c1: ldo2 {
-			regulator-name = "vreg_l2c1";
-			regulator-min-microvolt = <1144000>;
-			regulator-max-microvolt = <1144000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3c1: ldo3 {
-			regulator-name = "vreg_l3c1";
-			regulator-min-microvolt = <890000>;
-			regulator-max-microvolt = <980000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4c1: ldo4 {
-			regulator-name = "vreg_l4c1";
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <720000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_bob2_e0: bob2 {
+		regulator-name = "vreg_bob2_e0";
+		regulator-min-microvolt = <2540000>;
+		regulator-max-microvolt = <3600000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
 	};
 
-	regulators-2 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E0";
-
-		vreg_s7f0: smps7 {
-			regulator-name = "vreg_s7f0";
-			regulator-min-microvolt = <1320000>;
-			regulator-max-microvolt = <1352000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s8f0: smps8 {
-			regulator-name = "vreg_s8f0";
-			regulator-min-microvolt = <952000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s9f0: smps9 {
-			regulator-name = "vreg_s9f0";
-			regulator-min-microvolt = <1900000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f0: ldo2 {
-			regulator-name = "vreg_l2f0";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3f0: ldo3 {
-			regulator-name = "vreg_l3f0";
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <720000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f0: ldo4 {
-			regulator-name = "vreg_l4f0";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_l2b0: ldo2 {
+		regulator-name = "vreg_l2b0";
+		regulator-min-microvolt = <1804000>;
+		regulator-max-microvolt = <2904000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 
-	regulators-3 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E1";
-
-		vreg_s7f1: smps7 {
-			regulator-name = "vreg_s7f1";
-			regulator-min-microvolt = <300000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1f1: ldo1 {
-			regulator-name = "vreg_l1f1";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f1: ldo2 {
-			regulator-name = "vreg_l2f1";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f1: ldo4 {
-			regulator-name = "vreg_l4f1";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1320000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_l8b0: ldo8 {
+		regulator-name = "vreg_l8b0";
+		regulator-min-microvolt = <1504000>;
+		regulator-max-microvolt = <1504000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 
-	regulators-4 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "H_E0";
+	vreg_l9b0: ldo9 {
+		regulator-name = "vreg_l9b0";
+		regulator-min-microvolt = <2960000>;
+		regulator-max-microvolt = <2960000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
 
-		vreg_l1h0: ldo1 {
-			regulator-name = "vreg_l1h0";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_l12b0: ldo12 {
+		regulator-name = "vreg_l12b0";
+		regulator-min-microvolt = <1144000>;
+		regulator-max-microvolt = <1144000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
 
-		vreg_l2h0: ldo2 {
-			regulator-name = "vreg_l2h0";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_l17b0: ldo17 {
+		regulator-name = "vreg_l17b0";
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2700000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
+};
 
-		vreg_l3h0: ldo3 {
-			regulator-name = "vreg_l3h0";
-			regulator-min-microvolt = <320000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+&rpmh_vregs_f_e0 {
+	vreg_l4f0: ldo4 {
+		regulator-name = "vreg_l4f0";
+		regulator-min-microvolt = <1080000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
 
-		vreg_l4h0: ldo4 {
-			regulator-name = "vreg_l4h0";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1320000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_s7f0: smps7 {
+		regulator-name = "vreg_s7f0";
+		regulator-min-microvolt = <1320000>;
+		regulator-max-microvolt = <1352000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
+
+	vreg_s8f0: smps8 {
+		regulator-name = "vreg_s8f0";
+		regulator-min-microvolt = <952000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
+};
+
+&rpmh_vregs_f_e1 {
+	vreg_s7f1: smps7 {
+		regulator-name = "vreg_s7f1";
+		regulator-min-microvolt = <300000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 };
 
@@ -698,7 +530,6 @@ &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";
 	qcom,dmic-sample-rate = <4800000>;
-	vdd-micb-supply = <&vreg_l1b0>;
 };
 
 &mdss {
@@ -736,9 +567,6 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -762,9 +590,6 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -798,9 +623,6 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-
 	status = "okay";
 };
 
@@ -819,9 +641,6 @@ &pcie6 {
 };
 
 &pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -889,16 +708,6 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
-&smb2370_j_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b0>;
-	vdd3-supply = <&vreg_l7b0>;
-};
-
-&smb2370_k_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b0>;
-	vdd3-supply = <&vreg_l7b0>;
-};
-
 &sdhc_2 {
 	vmmc-supply = <&vreg_l9b0>;
 	vqmmc-supply = <&vreg_l2b0>;
@@ -1182,19 +991,12 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_hsphy {
-	vdd-supply = <&vreg_l3f0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&smb2370_j_e2_eusb2_repeater>;
 
 	status = "okay";
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l3f0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l2f0>;
-
 	status = "okay";
 };
 
@@ -1211,19 +1013,12 @@ &usb_1_dwc3_hs {
 };
 
 &usb_1_hsphy {
-	vdd-supply = <&vreg_l3f0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&smb2370_k_e2_eusb2_repeater>;
 
 	status = "okay";
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l1h0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l2f0>;
-
 	status = "okay";
 };
 
@@ -1238,9 +1033,6 @@ &usb_hs {
 };
 
 &usb_hs_phy {
-	vdd-supply = <&vreg_l2h0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&ptn3222_1>;
 
 	status = "okay";
@@ -1251,33 +1043,19 @@ &usb_mp {
 };
 
 &usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2h0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&ptn3222_0>;
 
 	status = "okay";
 };
 
 &usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2h0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	status = "okay";
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l2h0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l2h0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
index ef77e70c8af3..1fe26850f490 100644
--- a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
@@ -4,14 +4,7 @@
  */
 /dts-v1/;
 
-#include "glymur.dtsi"
-
-#include "pmcx0102.dtsi"
-#include "pmh0101.dtsi"
-#include "pmh0110-glymur.dtsi"
-#include "pmh0104-glymur.dtsi"
-#include "pmk8850.dtsi"
-#include "smb2370.dtsi"
+#include "glymur-cob.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
@@ -292,124 +285,6 @@ vreg_pmu_pcie_1p8: ldo9 {
 	};
 };
 
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pmh0101-rpmh-regulators";
-		qcom,pmic-id = "B_E0";
-
-		vreg_l1b0: ldo1 {
-			regulator-name = "vreg_l1b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7b0: ldo7 {
-			regulator-name = "vreg_l7b0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l15b0: ldo15 {
-			regulator-name = "vreg_l15b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l18b0: ldo18 {
-			regulator-name = "vreg_l18b0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-1 {
-		compatible = "qcom,pmcx0102-rpmh-regulators";
-		qcom,pmic-id = "C_E1";
-
-		vreg_l1c1: ldo1 {
-			regulator-name = "vreg_l1c1";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-2 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E0";
-
-		vreg_l2f0: ldo2 {
-			regulator-name = "vreg_l2f0";
-			regulator-min-microvolt = <936000>;
-			regulator-max-microvolt = <936000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3f0: ldo3 {
-			regulator-name = "vreg_l3f0";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-3 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E1";
-
-		vreg_l1f1: ldo1 {
-			regulator-name = "vreg_l1f1";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f1: ldo2 {
-			regulator-name = "vreg_l2f1";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f1: ldo4 {
-			regulator-name = "vreg_l4f1";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-4 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "H_E0";
-
-		vreg_l1h0: ldo1 {
-			regulator-name = "vreg_l1h0";
-			regulator-min-microvolt = <936000>;
-			regulator-max-microvolt = <936000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2h0: ldo2 {
-			regulator-name = "vreg_l2h0";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4h0: ldo4 {
-			regulator-name = "vreg_l4h0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-};
-
 &gmu {
 	status = "okay";
 };
@@ -470,8 +345,6 @@ touchscreen@10 {
 };
 
 &lpass_vamacro {
-	vdd-micb-supply = <&vreg_l1b0>;
-
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
 
@@ -529,9 +402,6 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -543,9 +413,6 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -579,9 +446,6 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-
 	status = "okay";
 };
 
@@ -624,16 +488,6 @@ &remoteproc_soccp {
 			"qcom/glymur/hp/elitebook-x-g2q/soccp_dtb.mbn";
 };
 
-&smb2370_j_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b0>;
-	vdd3-supply = <&vreg_l7b0>;
-};
-
-&smb2370_k_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b0>;
-	vdd3-supply = <&vreg_l7b0>;
-};
-
 &swr0 {
 	status = "okay";
 
@@ -690,26 +544,6 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
-&tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4h0>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f0>;
-	vdda-refgen3-1p2-supply = <&vreg_l4h0>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f1>;
-};
-
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
@@ -841,19 +675,12 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_hsphy {
-	vdd-supply = <&vreg_l3f0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&smb2370_j_e2_eusb2_repeater>;
 
 	status = "okay";
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l3f0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l2f0>;
-
 	status = "okay";
 };
 
@@ -870,19 +697,12 @@ &usb_1_dwc3_hs {
 };
 
 &usb_1_hsphy {
-	vdd-supply = <&vreg_l3f0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&smb2370_k_e2_eusb2_repeater>;
 
 	status = "okay";
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l1h0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l2f0>;
-
 	status = "okay";
 };
 
@@ -898,9 +718,6 @@ &usb_hs {
 };
 
 &usb_hs_phy {
-	vdd-supply = <&vreg_l2h0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	status = "okay";
 };
 
@@ -910,31 +727,17 @@ &usb_mp {
 };
 
 &usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2h0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	status = "okay";
 };
 
 &usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2h0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	status = "okay";
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l2h0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l2h0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index 56c22daab056..35bfb86eb51a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -4,14 +4,7 @@
  */
 /dts-v1/;
 
-#include "glymur.dtsi"
-
-#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
-#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
-#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
-#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
-#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
-#include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
+#include "glymur-cob.dtsi"
 
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/leds/common.h>
@@ -376,205 +369,42 @@ vreg_pmu_pcie_1p8: ldo9 {
 	};
 };
 
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pmh0101-rpmh-regulators";
-		qcom,pmic-id = "B_E0";
-
-		vreg_l1b0: ldo1 {
-			regulator-name = "vreg_l1b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7b0: ldo7 {
-			regulator-name = "vreg_l7b0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8b0: ldo8 {
-			regulator-name = "vreg_l8b0";
-			regulator-min-microvolt = <3304000>;
-			regulator-max-microvolt = <3304000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9b0: ldo9 {
-			regulator-name = "vreg_l9b0";
-			regulator-min-microvolt = <2960000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l10b0: ldo10 {
-			regulator-name = "vreg_l10b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l11b0: ldo11 {
-			regulator-name = "vreg_l11b0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l12b0: ldo12 {
-			regulator-name = "vreg_l12b0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l15b0: ldo15 {
-			regulator-name = "vreg_l15b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l17b0: ldo17 {
-			regulator-name = "vreg_l17b0";
-			regulator-min-microvolt = <2504000>;
-			regulator-max-microvolt = <2504000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l18b0: ldo18 {
-			regulator-name = "vreg_l18b0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+&rpmh_vregs_b_e0 {
+	vreg_l8b0: ldo8 {
+		regulator-name = "vreg_l8b0";
+		regulator-min-microvolt = <3304000>;
+		regulator-max-microvolt = <3304000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 
-	regulators-1 {
-		compatible = "qcom,pmcx0102-rpmh-regulators";
-		qcom,pmic-id = "C_E1";
-
-		vreg_l1c1: ldo1 {
-			regulator-name = "vreg_l1c1";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c1: ldo2 {
-			regulator-name = "vreg_l2c1";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3c1: ldo3 {
-			regulator-name = "vreg_l3c1";
-			regulator-min-microvolt = <936000>;
-			regulator-max-microvolt = <936000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4c1: ldo4 {
-			regulator-name = "vreg_l4c1";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_l12b0: ldo12 {
+		regulator-name = "vreg_l12b0";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 
-	regulators-2 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E0";
+	vreg_l17b0: ldo17 {
+		regulator-name = "vreg_l17b0";
+		regulator-min-microvolt = <2504000>;
+		regulator-max-microvolt = <2504000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
+};
 
-		vreg_s7f0: smps7 {
-			regulator-name = "vreg_s7f0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s8f0: smps8 {
-			regulator-name = "vreg_s8f0";
-			regulator-min-microvolt = <952000>;
-			regulator-max-microvolt = <952000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f0: ldo2 {
-			regulator-name = "vreg_l2f0";
-			regulator-min-microvolt = <936000>;
-			regulator-max-microvolt = <936000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3f0: ldo3 {
-			regulator-name = "vreg_l3f0";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+&rpmh_vregs_f_e0 {
+	vreg_s7f0: smps7 {
+		regulator-name = "vreg_s7f0";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 
-	regulators-3 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E1";
-
-		vreg_l1f1: ldo1 {
-			regulator-name = "vreg_l1f1";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <904000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f1: ldo2 {
-			regulator-name = "vreg_l2f1";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f1: ldo4 {
-			regulator-name = "vreg_l4f1";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-4 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "H_E0";
-
-		vreg_l1h0: ldo1 {
-			regulator-name = "vreg_l1h0";
-			regulator-min-microvolt = <936000>;
-			regulator-max-microvolt = <936000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2h0: ldo2 {
-			regulator-name = "vreg_l2h0";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3h0: ldo3 {
-			regulator-name = "vreg_l3h0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4h0: ldo4 {
-			regulator-name = "vreg_l4h0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_s8f0: smps8 {
+		regulator-name = "vreg_s8f0";
+		regulator-min-microvolt = <952000>;
+		regulator-max-microvolt = <952000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 };
 
@@ -727,9 +557,6 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -741,9 +568,6 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -777,9 +601,6 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-
 	status = "okay";
 };
 
@@ -798,9 +619,6 @@ &pcie6 {
 };
 
 &pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -860,20 +678,7 @@ &remoteproc_soccp {
 	status = "okay";
 };
 
-&smb2370_j_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b0>;
-	vdd3-supply = <&vreg_l7b0>;
-};
-
-&smb2370_k_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b0>;
-	vdd3-supply = <&vreg_l7b0>;
-};
-
 &smb2370_l_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b0>;
-	vdd3-supply = <&vreg_l7b0>;
-
 	status = "okay";
 };
 
@@ -933,26 +738,6 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
-&tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4h0>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f0>;
-	vdda-refgen3-1p2-supply = <&vreg_l4h0>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f1>;
-};
-
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
@@ -1142,19 +927,12 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_hsphy {
-	vdd-supply = <&vreg_l3f0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&smb2370_j_e2_eusb2_repeater>;
 
 	status = "okay";
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l4h0>;
-	vdda-pll-supply = <&vreg_l3f0>;
-	refgen-supply = <&vreg_l2f0>;
-
 	status = "okay";
 };
 
@@ -1171,19 +949,12 @@ &usb_1_dwc3_hs {
 };
 
 &usb_1_hsphy {
-	vdd-supply = <&vreg_l3f0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&smb2370_k_e2_eusb2_repeater>;
 
 	status = "okay";
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l4h0>;
-	vdda-pll-supply = <&vreg_l1h0>;
-	refgen-supply = <&vreg_l2f0>;
-
 	status = "okay";
 };
 
@@ -1200,19 +971,12 @@ &usb_2_dwc3_hs {
 };
 
 &usb_2_hsphy {
-	vdd-supply = <&vreg_l4c1>;
-	vdda12-supply = <&vreg_l4f1>;
-
 	phys = <&smb2370_l_e2_eusb2_repeater>;
 
 	status = "okay";
 };
 
 &usb_2_qmpphy {
-	vdda-phy-supply = <&vreg_l4f1>;
-	vdda-pll-supply = <&vreg_l4c1>;
-	refgen-supply = <&vreg_l1c1>;
-
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 6acf457a4872..42eca6c7db07 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -5,30 +5,10 @@
 
 /dts-v1/;
 
-#include "glymur.dtsi"
+#include "glymur-cob.dtsi"
 #include "glymur-qcb.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Glymur QCB";
 	compatible = "qcom,glymur-qcb", "qcom,glymur";
 };
-
-&tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4h0>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f0>;
-	vdda-refgen3-1p2-supply = <&vreg_l4h0>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f1>;
-};
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi b/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
index f012b6f7f1f5..622e84f875b2 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
@@ -3,13 +3,6 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
-#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
-#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
-#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
-#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
-#include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
-
 / {
 	aliases {
 		serial0 = &uart21;
@@ -171,252 +164,78 @@ vreg_pmu_pcie_1p8: ldo9 {
 	};
 };
 
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pmh0101-rpmh-regulators";
-		qcom,pmic-id = "B_E0";
-
-		vreg_bob1_e0: bob1 {
-			regulator-name = "vreg_bob1_e0";
-			regulator-min-microvolt = <2200000>;
-			regulator-max-microvolt = <4224000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
-		};
-
-		vreg_bob2_e0: bob2 {
-			regulator-name = "vreg_bob2_e0";
-			regulator-min-microvolt = <2540000>;
-			regulator-max-microvolt = <3600000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
-		};
-
-		vreg_l1b0: ldo1 {
-			regulator-name = "vreg_l1b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2b0: ldo2 {
-			regulator-name = "vreg_l2b0";
-			regulator-min-microvolt = <2904000>;
-			regulator-max-microvolt = <2904000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7b0: ldo7 {
-			regulator-name = "vreg_l7b0";
-			regulator-min-microvolt = <2790000>;
-			regulator-max-microvolt = <2792000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8b0: ldo8 {
-			regulator-name = "vreg_l8b0";
-			regulator-min-microvolt = <1504000>;
-			regulator-max-microvolt = <1504000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9b0: ldo9 {
-			regulator-name = "vreg_l9b0";
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <2704000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l10b0: ldo10 {
-			regulator-name = "vreg_l10b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l11b0: ldo11 {
-			regulator-name = "vreg_l11b0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l12b0: ldo12 {
-			regulator-name = "vreg_l12b0";
-			regulator-min-microvolt = <1144000>;
-			regulator-max-microvolt = <1144000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l15b0: ldo15 {
-			regulator-name = "vreg_l15b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l17b0: ldo17 {
-			regulator-name = "vreg_l17b0";
-			regulator-min-microvolt = <2400000>;
-			regulator-max-microvolt = <2700000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l18b0: ldo18 {
-			regulator-name = "vreg_l18b0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+&rpmh_vregs_b_e0 {
+	vreg_bob1_e0: bob1 {
+		regulator-name = "vreg_bob1_e0";
+		regulator-min-microvolt = <2200000>;
+		regulator-max-microvolt = <4224000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
 	};
 
-	regulators-1 {
-		compatible = "qcom,pmcx0102-rpmh-regulators";
-		qcom,pmic-id = "C_E1";
-
-		vreg_l1c1: ldo1 {
-			regulator-name = "vreg_l1c1";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c1: ldo2 {
-			regulator-name = "vreg_l2c1";
-			regulator-min-microvolt = <1144000>;
-			regulator-max-microvolt = <1144000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3c1: ldo3 {
-			regulator-name = "vreg_l3c1";
-			regulator-min-microvolt = <890000>;
-			regulator-max-microvolt = <980000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4c1: ldo4 {
-			regulator-name = "vreg_l4c1";
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <720000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_bob2_e0: bob2 {
+		regulator-name = "vreg_bob2_e0";
+		regulator-min-microvolt = <2540000>;
+		regulator-max-microvolt = <3600000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
 	};
 
-	regulators-2 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E0";
-
-		vreg_s7f0: smps7 {
-			regulator-name = "vreg_s7f0";
-			regulator-min-microvolt = <1320000>;
-			regulator-max-microvolt = <1352000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s8f0: smps8 {
-			regulator-name = "vreg_s8f0";
-			regulator-min-microvolt = <952000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s9f0: smps9 {
-			regulator-name = "vreg_s9f0";
-			regulator-min-microvolt = <1900000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f0: ldo2 {
-			regulator-name = "vreg_l2f0";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3f0: ldo3 {
-			regulator-name = "vreg_l3f0";
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <720000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f0: ldo4 {
-			regulator-name = "vreg_l4f0";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_l8b0: ldo8 {
+		regulator-name = "vreg_l8b0";
+		regulator-min-microvolt = <1504000>;
+		regulator-max-microvolt = <1504000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 
-	regulators-3 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E1";
-
-		vreg_s7f1: smps7 {
-			regulator-name = "vreg_s7f1";
-			regulator-min-microvolt = <300000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1f1: ldo1 {
-			regulator-name = "vreg_l1f1";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f1: ldo2 {
-			regulator-name = "vreg_l2f1";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f1: ldo4 {
-			regulator-name = "vreg_l4f1";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1320000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_l12b0: ldo12 {
+		regulator-name = "vreg_l12b0";
+		regulator-min-microvolt = <1144000>;
+		regulator-max-microvolt = <1144000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 
-	regulators-4 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "H_E0";
+	vreg_l17b0: ldo17 {
+		regulator-name = "vreg_l17b0";
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2700000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
+};
 
-		vreg_l1h0: ldo1 {
-			regulator-name = "vreg_l1h0";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+&rpmh_vregs_f_e0 {
+	vreg_l4f0: ldo4 {
+		regulator-name = "vreg_l4f0";
+		regulator-min-microvolt = <1080000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
 
-		vreg_l2h0: ldo2 {
-			regulator-name = "vreg_l2h0";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_s7f0: smps7 {
+		regulator-name = "vreg_s7f0";
+		regulator-min-microvolt = <1320000>;
+		regulator-max-microvolt = <1352000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
 
-		vreg_l3h0: ldo3 {
-			regulator-name = "vreg_l3h0";
-			regulator-min-microvolt = <320000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_s8f0: smps8 {
+		regulator-name = "vreg_s8f0";
+		regulator-min-microvolt = <952000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
+};
 
-		vreg_l4h0: ldo4 {
-			regulator-name = "vreg_l4h0";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1320000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+&rpmh_vregs_f_e1 {
+	vreg_s7f1: smps7 {
+		regulator-name = "vreg_s7f1";
+		regulator-min-microvolt = <300000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 };
 
 &i2c9 {
 	clock-frequency = <400000>;
+
 	status = "okay";
 
 	embedded-controller@76 {
@@ -438,9 +257,6 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -474,9 +290,6 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-
 	status = "okay";
 };
 
@@ -495,9 +308,6 @@ &pcie6 {
 };
 
 &pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 51708954f17a..c8a1669e57f3 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -8,13 +8,6 @@
 #include "mahua.dtsi"
 #include "glymur-crd.dtsi"
 
-/delete-node/ &pmcx0102_d_e0;
-/delete-node/ &pmcx0102_d0_thermal;
-/delete-node/ &pmh0104_i_e0;
-/delete-node/ &pmh0104_i0_thermal;
-/delete-node/ &pmh0104_j_e0;
-/delete-node/ &pmh0104_j0_thermal;
-
 / {
 	model = "Qualcomm Technologies, Inc. Mahua CRD";
 	compatible = "qcom,mahua-crd", "qcom,mahua";
@@ -24,19 +17,3 @@ &pcie3b_phy {
 	vdda-phy-supply = <&vreg_l3c1>;
 	vdda-pll-supply = <&vreg_l2c1>;
 };
-
-&tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l1f1>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrpt5-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx3-0p9-supply = <&vreg_l2h0>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen3-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen3-1p2-supply = <&vreg_l4f1>;
-};
diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 860e9ef01aa6..e61eb3a3b8b8 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -6,26 +6,11 @@
 
 #include "mahua.dtsi"
 
-#include "pmcx0102.dtsi"
-#include "pmh0101.dtsi"
-#include "pmh0110-glymur.dtsi"
-#include "pmh0104-glymur.dtsi"
-#include "pmk8850.dtsi"
-#include "smb2370.dtsi"
-
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
-/* PMICs tied to Glymur's cluster2 are absent on Mahua. */
-/delete-node/ &pmcx0102_d_e0;
-/delete-node/ &pmcx0102_d0_thermal;
-/delete-node/ &pmh0104_i_e0;
-/delete-node/ &pmh0104_i0_thermal;
-/delete-node/ &pmh0104_j_e0;
-/delete-node/ &pmh0104_j0_thermal;
-
 / {
 	model = "Lenovo ThinkPad T14s Gen 7 (LCD)";
 	compatible = "lenovo,thinkpad-t14s-gen7-lcd", "lenovo,thinkpad-t14s-gen7",
@@ -388,249 +373,72 @@ vreg_pmu_pcie_1p8: ldo9 {
 	};
 };
 
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pmh0101-rpmh-regulators";
-		qcom,pmic-id = "B_E0";
-
-		vreg_bob1_e0: bob1 {
-			regulator-name = "vreg_bob1_e0";
-			regulator-min-microvolt = <2200000>;
-			regulator-max-microvolt = <4224000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
-		};
-
-		vreg_bob2_e0: bob2 {
-			regulator-name = "vreg_bob2_e0";
-			regulator-min-microvolt = <2540000>;
-			regulator-max-microvolt = <3600000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
-		};
-
-		vreg_l1b0: ldo1 {
-			regulator-name = "vreg_l1b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2b0: ldo2 {
-			regulator-name = "vreg_l2b0";
-			regulator-min-microvolt = <2904000>;
-			regulator-max-microvolt = <2904000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7b0: ldo7 {
-			regulator-name = "vreg_l7b0";
-			regulator-min-microvolt = <2790000>;
-			regulator-max-microvolt = <2792000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8b0: ldo8 {
-			regulator-name = "vreg_l8b0";
-			regulator-min-microvolt = <1504000>;
-			regulator-max-microvolt = <3304000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9b0: ldo9 {
-			regulator-name = "vreg_l9b0";
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l10b0: ldo10 {
-			regulator-name = "vreg_l10b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l11b0: ldo11 {
-			regulator-name = "vreg_l11b0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l12b0: ldo12 {
-			regulator-name = "vreg_l12b0";
-			regulator-min-microvolt = <1144000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l15b0: ldo15 {
-			regulator-name = "vreg_l15b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
-		};
-
-		vreg_l17b0: ldo17 {
-			regulator-name = "vreg_l17b0";
-			regulator-min-microvolt = <2400000>;
-			regulator-max-microvolt = <2700000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l18b0: ldo18 {
-			regulator-name = "vreg_l18b0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
-		};
+&rpmh_vregs_b_e0 {
+	vreg_bob1_e0: bob1 {
+		regulator-name = "vreg_bob1_e0";
+		regulator-min-microvolt = <2200000>;
+		regulator-max-microvolt = <4224000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
 	};
 
-	regulators-1 {
-		compatible = "qcom,pmcx0102-rpmh-regulators";
-		qcom,pmic-id = "C_E1";
-
-		vreg_l1c1: ldo1 {
-			regulator-name = "vreg_l1c1";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c1: ldo2 {
-			regulator-name = "vreg_l2c1";
-			regulator-min-microvolt = <1144000>;
-			regulator-max-microvolt = <1144000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3c1: ldo3 {
-			regulator-name = "vreg_l3c1";
-			regulator-min-microvolt = <890000>;
-			regulator-max-microvolt = <980000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4c1: ldo4 {
-			regulator-name = "vreg_l4c1";
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <720000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_bob2_e0: bob2 {
+		regulator-name = "vreg_bob2_e0";
+		regulator-min-microvolt = <2540000>;
+		regulator-max-microvolt = <3600000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
 	};
 
-	regulators-2 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E0";
-
-		vreg_s7f0: smps7 {
-			regulator-name = "vreg_s7f0";
-			regulator-min-microvolt = <1320000>;
-			regulator-max-microvolt = <1352000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s8f0: smps8 {
-			regulator-name = "vreg_s8f0";
-			regulator-min-microvolt = <952000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s9f0: smps9 {
-			regulator-name = "vreg_s9f0";
-			regulator-min-microvolt = <1900000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f0: ldo2 {
-			regulator-name = "vreg_l2f0";
-			regulator-min-microvolt = <936000>;
-			regulator-max-microvolt = <936000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3f0: ldo3 {
-			regulator-name = "vreg_l3f0";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f0: ldo4 {
-			regulator-name = "vreg_l4f0";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_l8b0: ldo8 {
+		regulator-name = "vreg_l8b0";
+		regulator-min-microvolt = <1504000>;
+		regulator-max-microvolt = <3304000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 
-	regulators-3 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E1";
-
-		vreg_s7f1: smps7 {
-			regulator-name = "vreg_s7f1";
-			regulator-min-microvolt = <300000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1f1: ldo1 {
-			regulator-name = "vreg_l1f1";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f1: ldo2 {
-			regulator-name = "vreg_l2f1";
-			regulator-min-microvolt = <904000>;
-			regulator-max-microvolt = <904000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f1: ldo4 {
-			regulator-name = "vreg_l4f1";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_l12b0: ldo12 {
+		regulator-name = "vreg_l12b0";
+		regulator-min-microvolt = <1144000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 
-	regulators-4 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "H_E0";
+	vreg_l17b0: ldo17 {
+		regulator-name = "vreg_l17b0";
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2700000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
+};
 
-		vreg_l1h0: ldo1 {
-			regulator-name = "vreg_l1h0";
-			regulator-min-microvolt = <936000>;
-			regulator-max-microvolt = <936000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+&rpmh_vregs_f_e0 {
+	vreg_l4f0: ldo4 {
+		regulator-name = "vreg_l4f0";
+		regulator-min-microvolt = <1080000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
 
-		vreg_l2h0: ldo2 {
-			regulator-name = "vreg_l2h0";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_s7f0: smps7 {
+		regulator-name = "vreg_s7f0";
+		regulator-min-microvolt = <1320000>;
+		regulator-max-microvolt = <1352000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
 
-		vreg_l3h0: ldo3 {
-			regulator-name = "vreg_l3h0";
-			regulator-min-microvolt = <320000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_s8f0: smps8 {
+		regulator-name = "vreg_s8f0";
+		regulator-min-microvolt = <952000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
+};
 
-		vreg_l4h0: ldo4 {
-			regulator-name = "vreg_l4h0";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1320000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+&rpmh_vregs_f_e1 {
+	vreg_s7f1: smps7 {
+		regulator-name = "vreg_s7f1";
+		regulator-min-microvolt = <300000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 };
 
@@ -739,7 +547,6 @@ &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
 	qcom,dmic-sample-rate = <4800000>;
-	vdd-micb-supply = <&vreg_l1b0>;
 };
 
 &mdss {
@@ -796,9 +603,6 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -811,9 +615,6 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -848,9 +649,6 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-
 	status = "okay";
 };
 
@@ -870,9 +668,6 @@ &pcie6 {
 };
 
 &pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -948,38 +743,6 @@ right_spkr: speaker@0,1 {
 	};
 };
 
-&smb2370_j_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b0>;
-	vdd3-supply = <&vreg_l7b0>;
-};
-
-&smb2370_k_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b0>;
-	vdd3-supply = <&vreg_l7b0>;
-};
-
-&tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrpt5-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx3-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4h0>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f0>;
-	vdda-refgen3-1p2-supply = <&vreg_l4h0>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f1>;
-};
-
 &tlmm {
 	gpio-reserved-ranges = <4 4>,   /* EC TZ Secure I3C */
 			       <10 2>,  /* OOB UART */
@@ -1149,19 +912,12 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_hsphy {
-	vdd-supply = <&vreg_l3f0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&smb2370_j_e2_eusb2_repeater>;
 
 	status = "okay";
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l3f0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l2f0>;
-
 	status = "okay";
 };
 
@@ -1178,19 +934,12 @@ &usb_1_dwc3_hs {
 };
 
 &usb_1_hsphy {
-	vdd-supply = <&vreg_l3f0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&smb2370_k_e2_eusb2_repeater>;
 
 	status = "okay";
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l1h0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l2f0>;
-
 	status = "okay";
 };
 
@@ -1203,36 +952,22 @@ &usb_mp {
 };
 
 &usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2h0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&ptn3222_0>;
 
 	status = "okay";
 };
 
 &usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2h0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&ptn3222_1>;
 //USB-A..
 	status = "okay";
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l2h0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l2h0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-	refgen-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -1243,9 +978,6 @@ &usb_hs {
 };
 
 &usb_hs_phy {
-	vdd-supply = <&vreg_l2h0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&ptn3222_cam>;
 
 	status = "okay";
@@ -1263,9 +995,6 @@ &usb_2 {
 };
 
 &usb_2_hsphy {
-	vdd-supply = <&vreg_l4c1>;
-	vdda12-supply = <&vreg_l4f1>;
-
 	phys = <&ptn3222_fpr>;
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/mahua-qcb.dts b/arch/arm64/boot/dts/qcom/mahua-qcb.dts
index 384cd03cda36..16ad42466fbd 100644
--- a/arch/arm64/boot/dts/qcom/mahua-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-qcb.dts
@@ -8,14 +8,6 @@
 #include "mahua.dtsi"
 #include "glymur-qcb.dtsi"
 
-/* PMICs tied to Glymur's cluster2 are absent on Mahua. */
-/delete-node/ &pmcx0102_d_e0;
-/delete-node/ &pmcx0102_d0_thermal;
-/delete-node/ &pmh0104_i_e0;
-/delete-node/ &pmh0104_i0_thermal;
-/delete-node/ &pmh0104_j_e0;
-/delete-node/ &pmh0104_j0_thermal;
-
 / {
 	model = "Qualcomm Technologies, Inc. Mahua QCB";
 	compatible = "qcom,mahua-qcb", "qcom,mahua";
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index a59c5ed7b48e..8e2a1fe44ddc 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -3,8 +3,11 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-/* Mahua is heavily based on Glymur, with some meaningful differences */
-#include "glymur.dtsi"
+/*
+ * Mahua is heavily based on Glymur, with some meaningful differences.
+ * CoB is the only power grid flavor that Mahua ships with
+ */
+#include "glymur-cob.dtsi"
 
 /delete-node/ &bwmon_cluster2;
 /delete-node/ &cluster2_pd;
@@ -53,6 +56,14 @@
 /delete-node/ &tsens6;
 /delete-node/ &tsens7;
 
+/* PMICs tied to Glymur's cluster2 are absent on Mahua. */
+/delete-node/ &pmcx0102_d_e0;
+/delete-node/ &pmcx0102_d0_thermal;
+/delete-node/ &pmh0104_i_e0;
+/delete-node/ &pmh0104_i0_thermal;
+/delete-node/ &pmh0104_j_e0;
+/delete-node/ &pmh0104_j0_thermal;
+
 &aggre1_noc {
 	compatible = "qcom,mahua-aggre1-noc", "qcom,glymur-aggre1-noc";
 };
@@ -386,6 +397,19 @@ gpuss-4-critical {
 
 &tcsr {
 	compatible = "qcom,mahua-tcsr", "syscon";
+
+	/delete-property/ vdda-qrefrx4-0p9-supply;
+	/delete-property/ vdda-qrefrx5-0p9-supply;
+	/delete-property/ vdda-qreftx0-0p9-supply;
+	/delete-property/ vdda-qreftx0-1p2-supply;
+	/delete-property/ vdda-refgen4-0p9-supply;
+	/delete-property/ vdda-refgen4-1p2-supply;
+
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f1>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h0>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h0>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f1>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f1>;
 };
 
 &tlmm {
@@ -399,4 +423,3 @@ &tsens4 {
 &tsens5 {
 	#qcom,sensors = <15>;
 };
-

-- 
2.56.0

