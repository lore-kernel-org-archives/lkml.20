Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357583;
	b=o+yqjGzO4jCeM4QExuRe5PL/UhfRCq4EK5cxhizPoeXRsL3hXQav4WsKfMVQLM2tzkNh
	 dR2tp9V56/OVKIKKTMQAb79rvWWJCCOvZjxicrsovqSDBeKpxWHfZpZBAILJs8CIH4ab6
	 7MKCG6m5R70sUWeL81EFaF93IVnfyvNZGIIJ0GsVw3UpsIRPOsLeXR2tpDXNKDKjnLdBs
	 Bys9YuA3+UVVM8ci6wQFE5O1a0BApqvjkGdUklzus8Z4XQdMyJdBE7C5JNTYfKN2USzrF
	 Mw4H9Qshjqh2f3TElY9XAcxt+ImcrfDh+18IAJLBU3oe22dpi6jrA3fBSFAn/hYxGyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357583;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=vFY/z8EoZUrKndUcT47DopPcrMDw4wGVbUAHCXDFMUA=;
	b=w3kWZKtdCIb7euii5h4Bq1SAvrve844ObbE4Pk95rbufxOSIEd50ZoTlV0YvrJbWIhtA
	 9QfyTZo0FLujOv8oMQFpHwZ4JLjTcKnt2X9apuy0q6UFLXHsys7DyvVs/zY3VElM/+iDX
	 /eWraFJDlBGuZAyYNUaPiV4b77qqgZy6INDf/1ex8IDOm/XgJ0T2fTphxrmN9DJc+8nuc
	 YZZ/ieKZU5cgc1ctlqjP2ACLESyksZE9LLlPSVPuV7WxfMefLLQcpQ8fYpjC4ZA5nqoNe
	 yH+ia/ZzZhJ8sO7dZHLucDxVXO59D+3LxhCTeCPrBjcvYivApbMMgljBEt2BfY5Pw+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJE2QrwL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B967606B97C;
	Fri, 30 Oct 2026 10:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJE2QrwL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E8A1F00A1C;
	Fri, 30 Oct 2026 10:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357581;
	bh=vFY/z8EoZUrKndUcT47DopPcrMDw4wGVbUAHCXDFMUA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aJE2QrwLzsEivGr8PuVjK6JNq4QdPK1gZfhZiJ8cEunLOHVYghnvzg2sd9HimWa0T
	 3+XWWR4Jp2R9BWA6/8MkHC+Wuf/kJbwO5583D5r/m/UUs4hEwr4sPniNB9D615waYd
	 lGrrAZIa9LM3cx7eDKIi9wUopqvZc9aTeCwUSwN/mmTTA/GcUXlXf+BWRWFGW78fm1
	 H7Q7VBjpHcSk1NO3GyCNaVQRefi76zcQSldNQlORLh4klpcfHfbJFaiBs11EeNtnJk
	 Z0vGnJoRiizvaPe/AWeQDvw+3S8oMSx/R1xO147FInz5hGPWwg4BrqXB29x9FRJgrG
	 6wAmxSf2q+WVg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 30 Oct 2026 11:52:34 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: Consolidate Glymur CoB power grid
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
Message-Id: <20261030-topic-sip_cob-v2-2-159e29e97c82@oss.qualcomm.com>
References: <20261030-topic-sip_cob-v2-0-159e29e97c82@oss.qualcomm.com>
In-Reply-To: <20261030-topic-sip_cob-v2-0-159e29e97c82@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793357562; l=79959;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=t5a/+LbNxG2MMpykO7w0vi5/qWthbJZ3KS0FIbJXAiA=;
 b=wlgoM7xI1HVzvnRrzQmoaKh+aHOiYau7+VkbSuNZijG9Ft9S10l262LBwFyDAaeI0/Wm9Fx3s
 eGsy5IlNvaADFnXQ/o/ifp4fC2IbZYVFL7bY8D1yXxnRPI9UsrCuZh5
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

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  | 236 +------------
 arch/arm64/boot/dts/qcom/glymur-cob.dtsi           | 311 +++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  22 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 358 ++++---------------
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 199 +----------
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 296 ++--------------
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            |  22 +-
 arch/arm64/boot/dts/qcom/glymur-qcb.dtsi           | 300 +++-------------
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |  23 --
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 379 +++------------------
 arch/arm64/boot/dts/qcom/mahua-qcb.dts             |   8 -
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  29 +-
 12 files changed, 554 insertions(+), 1629 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
index e96e65a0c5b4..671710ee72b3 100644
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
 
@@ -695,9 +541,6 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -733,9 +576,6 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -791,16 +631,6 @@ &remoteproc_soccp {
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
 
@@ -829,26 +659,6 @@ right_speaker: speaker@0,1 {
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
@@ -1025,19 +835,12 @@ &usb_0_dwc3_hs {
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
 
@@ -1054,19 +857,12 @@ &usb_1_dwc3_hs {
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
 
@@ -1075,10 +871,6 @@ &usb_1_qmpphy_out {
 };
 
 &usb_2_qmpphy {
-	vdda-phy-supply = <&vreg_l4c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-	refgen-supply = <&vreg_l4f1>;
-
 	/delete-property/ mode-switch;
 	/delete-property/ orientation-switch;
 
@@ -1106,35 +898,21 @@ &usb_mp {
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
index 000000000000..77157394286a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/glymur-cob.dtsi
@@ -0,0 +1,311 @@
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
index dfac99056bcd..bab82e36d793 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "glymur.dtsi"
+#include "glymur-cob.dtsi"
 #include "glymur-crd.dtsi"
 
 / {
@@ -36,23 +36,3 @@ &pcie3_phy {
 	vdda-refgen0p9-supply = <&vreg_l1c1>;
 	vdda-refgen1p2-supply = <&vreg_l4f1>;
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

