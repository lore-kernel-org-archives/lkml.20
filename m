Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217879;
	b=UFy4qpppn1QARHEM0necE5Hkw+ZVWjE++QXpU0tofbRO35LWwuJSEIi+iPCQW1hN1hkU
	 CBcJbWyl+YeWd4dxFLxqjv5pHsHy938SgOUYlHoBybfK0IZ1zI48uMFeeiwUlTfxITCh9
	 za7mDSSVWHQZuDo5tSn1naTAflUNeH+Lsr/Ub+0DXCBrTsIqazSTl27RqrWkG2MypwQWS
	 njBi0y/34sJg5MQ1OPJpTCfwpoIRelOeZPpLXkG3Hqz8Sko6IOZs/HpG2toap8IfWHPGz
	 ii1TeFG0uPBSvg150giSvfwUYVfwpDsZ4XbHESgXL6RNxigFp/R8QUpXDaWZ8vTT+Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217879;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=f87sJUnNf+J/Tim7mf4F3ODJpD0W2zLHWnOrBGO6K/8=;
	b=PnshW5mB3DvfRq94tJ2Pu21IyoYa1ElMZ0nawyAl/nnjDALrLhk2JA5NG34vjpuM+nX6
	 3OIYzFbd7kHZaKCb9ehEYsggeIRUYQCsaHfHHrTq230vLZzqU1ahAcS1MVy/QLhwNQCYi
	 FR5aH4uV5e/k0fqq9FfHniWF1MWH9+4XKotBiap8bf8AFpF+UphTyBpbOWRJD/AtSZKP+
	 f2A648HXXzOKDGIwRloLMO+pMyF9ut1iR0yH8YOyLz67kZB5Ji/LinaOBr2DysShGzh1D
	 6TuU7spt66x9KQLwAwy5f5MF7j1C0qyciZy7LHYxGs8SOmqUIFRJE/I0zCPrZxJDlhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S7EgfLcU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B10606A31E;
	Wed, 28 Oct 2026 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S7EgfLcU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BB71F01825;
	Wed, 28 Oct 2026 20:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793217878;
	bh=f87sJUnNf+J/Tim7mf4F3ODJpD0W2zLHWnOrBGO6K/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=S7EgfLcUnzfLQkh8Wo1QJeskDGvjSk7MgTHni+KaqDc4+++WpJD3y44UJiiMR2TGE
	 2vOXtLzjxGSKv0ippXC4led0FU3jNE+lJGOPUeux9x05lfSRFys3+FQ4YvSIOm5ZEE
	 eJZJ+u8g6eiosveeggnK+CQf6cBoDLZCTX9hNlgc0FgBzvQejF1uDFnqUSFteoaq5u
	 +ZM0MZ5TSJG3Ch3qTgoq4c6nvNN6vJjED/91XJZFN/dUEt9uvKQu35Ez1X7FvEf+ru
	 igBT+M4n/e399vgXQbwfteml+UIzZ09gkjTEAueTFuwCPtYuZCzsSJaONY6DB4Suyl
	 NVIjZ4Ql2OfrQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 28 Oct 2026 21:04:25 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: Consolidate Glymur CoB power grid
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
Message-Id: <20261028-topic-sip_cob-v1-2-80ab6704aca3@oss.qualcomm.com>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
In-Reply-To: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793217867; l=76258;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=9WCdgn0TdjjDHNS60M9BH7EXWV0IihGnA8awPwom+QA=;
 b=Xch9ERTxhBBP+wbWEhYLf5wnoVM8NbRpcLL9c/azmsU191lq39pTzJqaCCVSXpq+AkZ989i+7
 vfJZbDFNERQAqd3pprOVlPffsBTAvvoRALSIak8XUBXYZ9ti1msW5Ci
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
 .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  | 235 +------------
 arch/arm64/boot/dts/qcom/glymur-cob.dtsi           | 310 +++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  21 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 358 ++++----------------
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 198 +----------
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 283 ++--------------
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            | 320 ++++--------------
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |  15 +-
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 366 +++------------------
 arch/arm64/boot/dts/qcom/mahua.dtsi                |   2 +-
 10 files changed, 534 insertions(+), 1574 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
index e96e65a0c5b4..dcbc88a2108f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
@@ -5,13 +5,7 @@
 /dts-v1/;
 
 #include "glymur.dtsi"
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
@@ -355,157 +349,12 @@ m2_e_uart_ep: endpoint@0 {
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
 
@@ -625,8 +474,6 @@ keyboard@15 {
 };
 
 &lpass_vamacro {
-	vdd-micb-supply = <&vreg_l1b0>;
-
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
 
@@ -695,9 +542,6 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -733,9 +577,6 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -791,16 +632,6 @@ &remoteproc_soccp {
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
 
@@ -829,26 +660,6 @@ right_speaker: speaker@0,1 {
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
@@ -1025,19 +836,12 @@ &usb_0_dwc3_hs {
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
 
@@ -1054,19 +858,12 @@ &usb_1_dwc3_hs {
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
 
@@ -1075,10 +872,6 @@ &usb_1_qmpphy_out {
 };
 
 &usb_2_qmpphy {
-	vdda-phy-supply = <&vreg_l4c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-	refgen-supply = <&vreg_l4f1>;
-
 	/delete-property/ mode-switch;
 	/delete-property/ orientation-switch;
 
@@ -1106,35 +899,21 @@ &usb_mp {
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
index 000000000000..8b4ba1d384a0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/glymur-cob.dtsi
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Common PMIC settings for on-SoC peripherals found on Glymur-CoB and
+ * derived platforms.
+ */
+
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
+			regulator-min-microvolt = <3100000>;
+			regulator-max-microvolt = <3100000>;
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
+			regulator-min-microvolt = <1900000>;
+			regulator-max-microvolt = <1900000>;
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
+			regulator-min-microvolt = <1216000>;
+			regulator-max-microvolt = <1216000>;
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
index dfac99056bcd..7afb15074190 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "glymur.dtsi"
+#include "glymur-cob.dtsi"
 #include "glymur-crd.dtsi"
 
 / {
@@ -36,23 +37,3 @@ &pcie3_phy {
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
index ef77e70c8af3..d0a98a7ed02a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
@@ -5,13 +5,7 @@
 /dts-v1/;
 
 #include "glymur.dtsi"
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
@@ -292,124 +286,6 @@ vreg_pmu_pcie_1p8: ldo9 {
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
@@ -470,8 +346,6 @@ touchscreen@10 {
 };
 
 &lpass_vamacro {
-	vdd-micb-supply = <&vreg_l1b0>;
-
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
 
@@ -529,9 +403,6 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -543,9 +414,6 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -579,9 +447,6 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-
 	status = "okay";
 };
 
@@ -624,16 +489,6 @@ &remoteproc_soccp {
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
 
@@ -690,26 +545,6 @@ right_tweeter: speaker@0,1 {
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
@@ -841,19 +676,12 @@ &usb_0_dwc3_hs {
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
 
@@ -870,19 +698,12 @@ &usb_1_dwc3_hs {
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
 
@@ -898,9 +719,6 @@ &usb_hs {
 };
 
 &usb_hs_phy {
-	vdd-supply = <&vreg_l2h0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	status = "okay";
 };
 
@@ -910,31 +728,17 @@ &usb_mp {
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
index 56c22daab056..a8580499e709 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -5,13 +5,7 @@
 /dts-v1/;
 
 #include "glymur.dtsi"
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
@@ -376,205 +370,42 @@ vreg_pmu_pcie_1p8: ldo9 {
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
 
@@ -727,9 +558,6 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -741,9 +569,6 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -777,9 +602,6 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-
 	status = "okay";
 };
 
@@ -798,9 +620,6 @@ &pcie6 {
 };
 
 &pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -860,20 +679,7 @@ &remoteproc_soccp {
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
 
@@ -933,26 +739,6 @@ right_tweeter: speaker@0,1 {
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
@@ -1142,9 +928,6 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_hsphy {
-	vdd-supply = <&vreg_l3f0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&smb2370_j_e2_eusb2_repeater>;
 
 	status = "okay";
@@ -1171,9 +954,6 @@ &usb_1_dwc3_hs {
 };
 
 &usb_1_hsphy {
-	vdd-supply = <&vreg_l3f0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&smb2370_k_e2_eusb2_repeater>;
 
 	status = "okay";
@@ -1200,9 +980,6 @@ &usb_2_dwc3_hs {
 };
 
 &usb_2_hsphy {
-	vdd-supply = <&vreg_l4c1>;
-	vdda12-supply = <&vreg_l4f1>;
-
 	phys = <&smb2370_l_e2_eusb2_repeater>;
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 3255ad66786e..d365544b0ea0 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -6,13 +6,7 @@
 /dts-v1/;
 
 #include "glymur.dtsi"
-
-#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
-#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
-#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
-#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
-#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
-#include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
+#include "glymur-cob.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Glymur QCB";
@@ -178,247 +172,72 @@ vreg_pmu_pcie_1p8: ldo9 {
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
 
@@ -446,9 +265,6 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -482,9 +298,6 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-
 	status = "okay";
 };
 
@@ -503,9 +316,6 @@ &pcie6 {
 };
 
 &pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -559,26 +369,6 @@ &remoteproc_soccp {
 			"qcom/glymur/soccp_dtb.mbn";
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
diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 51708954f17a..8a36d0caaf9e 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -26,17 +26,16 @@ &pcie3b_phy {
 };
 
 &tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
+	/delete-property/ vdda-qrefrx4-0p9-supply;
+	/delete-property/ vdda-qrefrx5-0p9-supply;
+	/delete-property/ vdda-qreftx0-0p9-supply;
+	/delete-property/ vdda-qreftx0-1p2-supply;
+	/delete-property/ vdda-refgen4-0p9-supply;
+	/delete-property/ vdda-refgen4-1p2-supply;
+
 	vdda-qrefrpt3-0p9-supply = <&vreg_l1f1>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h0>;
 	vdda-qrefrpt5-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
 	vdda-qrefrx3-0p9-supply = <&vreg_l2h0>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
 	vdda-refgen3-0p9-supply = <&vreg_l1f1>;
 	vdda-refgen3-1p2-supply = <&vreg_l4f1>;
 };
diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 860e9ef01aa6..a77eb7565804 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -6,13 +6,6 @@
 
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
@@ -388,249 +381,72 @@ vreg_pmu_pcie_1p8: ldo9 {
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
 
@@ -739,7 +555,6 @@ &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
 	qcom,dmic-sample-rate = <4800000>;
-	vdd-micb-supply = <&vreg_l1b0>;
 };
 
 &mdss {
@@ -796,9 +611,6 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -811,9 +623,6 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -848,9 +657,6 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f0>;
-	vdda-pll-supply = <&vreg_l4h0>;
-
 	status = "okay";
 };
 
@@ -870,9 +676,6 @@ &pcie6 {
 };
 
 &pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -948,36 +751,9 @@ right_spkr: speaker@0,1 {
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
 &tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h0>;
 	vdda-qrefrpt5-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
 	vdda-qrefrx3-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h0>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4h0>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f0>;
-	vdda-refgen3-1p2-supply = <&vreg_l4h0>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f1>;
 };
 
 &tlmm {
@@ -1149,19 +925,12 @@ &usb_0_dwc3_hs {
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
 
@@ -1178,19 +947,12 @@ &usb_1_dwc3_hs {
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
 
@@ -1203,36 +965,22 @@ &usb_mp {
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
 
@@ -1243,9 +991,6 @@ &usb_hs {
 };
 
 &usb_hs_phy {
-	vdd-supply = <&vreg_l2h0>;
-	vdda12-supply = <&vreg_l4h0>;
-
 	phys = <&ptn3222_cam>;
 
 	status = "okay";
@@ -1263,9 +1008,6 @@ &usb_2 {
 };
 
 &usb_2_hsphy {
-	vdd-supply = <&vreg_l4c1>;
-	vdda12-supply = <&vreg_l4f1>;
-
 	phys = <&ptn3222_fpr>;
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index a59c5ed7b48e..16f62040aa84 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -5,6 +5,7 @@
 
 /* Mahua is heavily based on Glymur, with some meaningful differences */
 #include "glymur.dtsi"
+#include "glymur-cob.dtsi"
 
 /delete-node/ &bwmon_cluster2;
 /delete-node/ &cluster2_pd;
@@ -399,4 +400,3 @@ &tsens4 {
 &tsens5 {
 	#qcom,sensors = <15>;
 };
-

-- 
2.56.0

