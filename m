Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357579;
	b=mqMQIPTad4HwWAvTNBNPQRgTWgGeSzajCQBFxKs0vNJeRvEsFy9hJYnav2CyE52SMWmz
	 WZsUjs5Kd20X3HRGIxyyUgbMZZm3OmZYGcM5IZkyEkI8s8eYc9kU7vM7G3JtyH3Ejb0ca
	 vr2wSN5xb2bFAnIUQ4aRLIHiecLLXfKh4V5YRDK61j4zbVOdxxht0qpzBbL8JX0Bj+UAf
	 RNzbkDUUeYXYSJvjDy3GVwReBU1fXVfN+rzVa7SF3Sy1n+pyxoSAuCiUKwaQBL7eWjq3+
	 IZ6qfiY2e8RBftSTYLd6CdU3SqCG7vVNkuayrUQyesz2DH9YY+Hja0ZFgrjGmHXjQXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357579;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=k48Kq6+gG3Z0aQpIzMvr8uSlOukM6/7bvIrpsogoaB0=;
	b=Gn2TNeIG6z1XNkOg7EV9ml8iGxaYPfQPFRrU1D/7ov9j3OooI7RSOhD5nrEjgaD9euJg
	 qcJq1thoHvf9ejZJ7zyePOVeRLB4GqVw1pG6l7Ewl6rY8Hvoz/k/QHs3Q4zoCSibr6EZ9
	 I5AAneeK8VbUJqJ3jdqc+Pw6uxoVjGO2ah5buPHhucFL6Lu1cyGVn8MejsC/tZdT7uKEm
	 zVC7gYyFk/ebOxIFiz//vcma1WVwlVOh8OZFCh/ceBA8EdLPtroNRzvEh8K0ypmeFbQvT
	 OGJVV87lFzkQoco4Mc2IuTw1Sh/UDh8xn/QaQeO+OY/VB0F/3qU31W9rEoDFaweCaIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lc+bUIoC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6945C606C4F2;
	Fri, 30 Oct 2026 10:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lc+bUIoC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D6C1F00A02;
	Fri, 30 Oct 2026 10:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357578;
	bh=k48Kq6+gG3Z0aQpIzMvr8uSlOukM6/7bvIrpsogoaB0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Lc+bUIoCLHw3ysBvkgsIQKXIrRWdDwysMbDEQqfOd/xn0hAfY5sBpgzZ+Ln59Qy05
	 5ymMEmyzAtwh8TjPWyeXiLqlG7O6kTfDuxEXvfQSMEykgDQ8HRFJ9gW/9afm671Hfw
	 6vXIFQ4Bw1kmKNn54scEnLQRM4D+lCVx3Ger2Gg/taVOrExwShaC4V0YUtBmrKYFd3
	 rZ9/PLTU0I+JiyTIuLfeSsHosQdkB62U/OLHjXu6cPkzDgudBT+FSqMSAbrthM/lfZ
	 i0KI+MvLfiPvesm6gNrUfDx8RRlLwr6pleR2FrZaT5CRC2COpvT9sdwcWsJNwL7FaK
	 n8Za2IuaK3Png==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 30 Oct 2026 11:52:33 +0100
Subject: [PATCH v2 1/3] arm64: dts: qcom: Unify Glymur/Mahua regulator
 handles
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
Message-Id: <20261030-topic-sip_cob-v2-1-159e29e97c82@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793357562; l=95435;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=GwpcW8JDMJC+Qvw7WOFRWk1zRlIKFECor/pbk3IZbzI=;
 b=pl01r7TLbWlXw2wpZtHJmyCCg1duzG0kbJsqReixrdk+qAM0EdiWBzDMwsJxC3yOOzFP8diAz
 M3j32P5MEKSAyyvjEey4zpP+QVW+500M+jdQYsfweTwj+uhio2QWswE
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

In preparation for removing on-SoC invariants from each device's DT,
start with aligning the regulator names and phandles to the format that
appears on schematics.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  | 232 +++++++++---------
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  42 ++--
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 230 +++++++++---------
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 178 +++++++-------
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 224 ++++++++---------
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            |  34 +--
 arch/arm64/boot/dts/qcom/glymur-qcb.dtsi           | 138 +++++------
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |  30 +--
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 266 ++++++++++-----------
 arch/arm64/boot/dts/qcom/mahua-qcb.dts             |  26 +-
 10 files changed, 700 insertions(+), 700 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 95da35125d75..e42e6c43f6a3 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -334,7 +334,7 @@ platform {
 	wlan-connector {
 		compatible = "pcie-m2-e-connector";
 		vpcie3v3-supply = <&vreg_wcn_3p3>;
-		vpcie1v8-supply = <&vreg_l15b_e0>;
+		vpcie1v8-supply = <&vreg_l15b0>;
 
 		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
 		w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
@@ -377,71 +377,71 @@ regulators-0 {
 		compatible = "qcom,pmh0101-rpmh-regulators";
 		qcom,pmic-id = "B_E0";
 
-		vreg_l1b_e0: ldo1 {
-			regulator-name = "vreg_l1b_e0";
+		vreg_l1b0: ldo1 {
+			regulator-name = "vreg_l1b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		/* Unused */
-		vreg_l2b_e0: ldo2 {
-			regulator-name = "vreg_l2b_e0";
+		vreg_l2b0: ldo2 {
+			regulator-name = "vreg_l2b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
 
-		vreg_l6b_e0: ldo6 {
-			regulator-name = "vreg_l6b_e0";
+		vreg_l6b0: ldo6 {
+			regulator-name = "vreg_l6b0";
 			regulator-min-microvolt = <3304000>;
 			regulator-max-microvolt = <3304000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l7b_e0: ldo7 {
-			regulator-name = "vreg_l7b_e0";
+		vreg_l7b0: ldo7 {
+			regulator-name = "vreg_l7b0";
 			regulator-min-microvolt = <3072000>;
 			regulator-max-microvolt = <3072000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l8b_e0: ldo8 {
-			regulator-name = "vreg_l8b_e0";
+		vreg_l8b0: ldo8 {
+			regulator-name = "vreg_l8b0";
 			regulator-min-microvolt = <3304000>;
 			regulator-max-microvolt = <3304000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		/* Unused */
-		vreg_l9b_e0: ldo9 {
-			regulator-name = "vreg_l9b_e0";
+		vreg_l9b0: ldo9 {
+			regulator-name = "vreg_l9b0";
 			regulator-min-microvolt = <2960000>;
 			regulator-max-microvolt = <2960000>;
 		};
 
-		vreg_l10b_e0: ldo10 {
-			regulator-name = "vreg_l10b_e0";
+		vreg_l10b0: ldo10 {
+			regulator-name = "vreg_l10b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l11b_e0: ldo11 {
-			regulator-name = "vreg_l11b_e0";
+		vreg_l11b0: ldo11 {
+			regulator-name = "vreg_l11b0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		/* Unused */
-		vreg_l12b_e0: ldo12 {
-			regulator-name = "vreg_l12b_e0";
+		vreg_l12b0: ldo12 {
+			regulator-name = "vreg_l12b0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 		};
 
-		vreg_l15b_e0: ldo15 {
-			regulator-name = "vreg_l15b_e0";
+		vreg_l15b0: ldo15 {
+			regulator-name = "vreg_l15b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -450,14 +450,14 @@ vreg_l15b_e0: ldo15 {
 		};
 
 		/* Unused */
-		vreg_l17b_e0: ldo17 {
-			regulator-name = "vreg_l17b_e0";
+		vreg_l17b0: ldo17 {
+			regulator-name = "vreg_l17b0";
 			regulator-min-microvolt = <2504000>;
 			regulator-max-microvolt = <2504000>;
 		};
 
-		vreg_l18b_e0: ldo18 {
-			regulator-name = "vreg_l18b_e0";
+		vreg_l18b0: ldo18 {
+			regulator-name = "vreg_l18b0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -471,22 +471,22 @@ regulators-1 {
 		compatible = "qcom,pmcx0102-rpmh-regulators";
 		qcom,pmic-id = "C_E0";
 
-		vreg_l1c_e0: ldo1 {
-			regulator-name = "vreg_l1c_e0";
+		vreg_l1c0: ldo1 {
+			regulator-name = "vreg_l1c0";
 			regulator-min-microvolt = <936000>;
 			regulator-max-microvolt = <936000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2c_e0: ldo2 {
-			regulator-name = "vreg_l2c_e0";
+		vreg_l2c0: ldo2 {
+			regulator-name = "vreg_l2c0";
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4c_e0: ldo4 {
-			regulator-name = "vreg_l4c_e0";
+		vreg_l4c0: ldo4 {
+			regulator-name = "vreg_l4c0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -498,29 +498,29 @@ regulators-2 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "F_E0";
 
-		vreg_s7f_e0: smps7 {
-			regulator-name = "vreg_s7f_e0";
+		vreg_s7f0: smps7 {
+			regulator-name = "vreg_s7f0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_s8f_e0: smps8 {
-			regulator-name = "vreg_s8f_e0";
+		vreg_s8f0: smps8 {
+			regulator-name = "vreg_s8f0";
 			regulator-min-microvolt = <952000>;
 			regulator-max-microvolt = <952000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2f_e0: ldo2 {
-			regulator-name = "vreg_l2f_e0";
+		vreg_l2f0: ldo2 {
+			regulator-name = "vreg_l2f0";
 			regulator-min-microvolt = <936000>;
 			regulator-max-microvolt = <936000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3f_e0: ldo3 {
-			regulator-name = "vreg_l3f_e0";
+		vreg_l3f0: ldo3 {
+			regulator-name = "vreg_l3f0";
 			regulator-min-microvolt = <912000>;
 			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -531,29 +531,29 @@ regulators-3 {
 		compatible = "qcom,pmcx0102-rpmh-regulators";
 		qcom,pmic-id = "C_E1";
 
-		vreg_l1c_e1: ldo1 {
-			regulator-name = "vreg_l1c_e1";
+		vreg_l1c1: ldo1 {
+			regulator-name = "vreg_l1c1";
 			regulator-min-microvolt = <912000>;
 			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2c_e1: ldo2 {
-			regulator-name = "vreg_l2c_e1";
+		vreg_l2c1: ldo2 {
+			regulator-name = "vreg_l2c1";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3c_e1: ldo3 {
-			regulator-name = "vreg_l3c_e1";
+		vreg_l3c1: ldo3 {
+			regulator-name = "vreg_l3c1";
 			regulator-min-microvolt = <936000>;
 			regulator-max-microvolt = <936000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4c_e1: ldo4 {
-			regulator-name = "vreg_l4c_e1";
+		vreg_l4c1: ldo4 {
+			regulator-name = "vreg_l4c1";
 			regulator-min-microvolt = <912000>;
 			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -565,22 +565,22 @@ regulators-4 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "F_E1";
 
-		vreg_l1f_e1: ldo1 {
-			regulator-name = "vreg_l1f_e1";
+		vreg_l1f1: ldo1 {
+			regulator-name = "vreg_l1f1";
 			regulator-min-microvolt = <904000>;
 			regulator-max-microvolt = <904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2f_e1: ldo2 {
-			regulator-name = "vreg_l2f_e1";
+		vreg_l2f1: ldo2 {
+			regulator-name = "vreg_l2f1";
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4f_e1: ldo4 {
-			regulator-name = "vreg_l4f_e1";
+		vreg_l4f1: ldo4 {
+			regulator-name = "vreg_l4f1";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -627,8 +627,8 @@ ptn3222_1: redriver@43 {
 
 		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
 
-		vdd3v3-supply = <&vreg_l8b_e0>;
-		vdd1v8-supply = <&vreg_l15b_e0>;
+		vdd3v3-supply = <&vreg_l8b0>;
+		vdd1v8-supply = <&vreg_l15b0>;
 
 		#phy-cells = <0>;
 	};
@@ -639,8 +639,8 @@ ptn3222_0: redriver@4f {
 
 		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 
-		vdd3v3-supply = <&vreg_l8b_e0>;
-		vdd1v8-supply = <&vreg_l15b_e0>;
+		vdd3v3-supply = <&vreg_l8b0>;
+		vdd1v8-supply = <&vreg_l15b0>;
 
 		#phy-cells = <0>;
 	};
@@ -732,7 +732,7 @@ misc_3p3_reg_en: misc-3p3-reg-en-state {
 };
 
 &lpass_vamacro {
-	vdd-micb-supply = <&vreg_l1b_e0>;
+	vdd-micb-supply = <&vreg_l1b0>;
 
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
@@ -802,8 +802,8 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f_e1>;
-	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-phy-supply = <&vreg_l2f1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -816,8 +816,8 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c_e1>;
-	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-phy-supply = <&vreg_l1c1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -841,8 +841,8 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f_e0>;
-	vdda-pll-supply = <&vreg_l4c_e0>;
+	vdda-phy-supply = <&vreg_l2f0>;
+	vdda-pll-supply = <&vreg_l4c0>;
 
 	status = "okay";
 };
@@ -884,13 +884,13 @@ &remoteproc_soccp {
 };
 
 &smb2370_j_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0>;
-	vdd3-supply = <&vreg_l7b_e0>;
+	vdd18-supply = <&vreg_l15b0>;
+	vdd3-supply = <&vreg_l7b0>;
 };
 
 &smb2370_k_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0>;
-	vdd3-supply = <&vreg_l7b_e0>;
+	vdd18-supply = <&vreg_l15b0>;
+	vdd3-supply = <&vreg_l7b0>;
 };
 
 &swr0 {
@@ -903,8 +903,8 @@ left_woofer: speaker@0,0 {
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "WooferLeft";
-		vdd-1p8-supply = <&vreg_l15b_e0>;
-		vdd-io-supply = <&vreg_l18b_e0>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <1 2 3 7 12 14>;
 	};
 
@@ -915,8 +915,8 @@ left_tweeter: speaker@0,1 {
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TweeterLeft";
-		vdd-1p8-supply = <&vreg_l15b_e0>;
-		vdd-io-supply = <&vreg_l18b_e0>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <4 5 6 7 13 15>;
 	};
 };
@@ -931,8 +931,8 @@ right_woofer: speaker@0,0 {
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "WooferRight";
-		vdd-1p8-supply = <&vreg_l15b_e0>;
-		vdd-io-supply = <&vreg_l18b_e0>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <1 2 3 7 12 14>;
 	};
 
@@ -943,30 +943,30 @@ right_tweeter: speaker@0,1 {
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TweeterRight";
-		vdd-1p8-supply = <&vreg_l15b_e0>;
-		vdd-io-supply = <&vreg_l18b_e0>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <4 5 6 7 13 15>;
 	};
 };
 
 &tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2c_e0>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2c_e0>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2c_e0>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4c_e0>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f_e0>;
-	vdda-refgen3-1p2-supply = <&vreg_l4c_e0>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f_e1>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f_e1>;
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2c0>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2c0>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2c0>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f0>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f0>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4c0>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f0>;
+	vdda-refgen3-1p2-supply = <&vreg_l4c0>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f1>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f1>;
 };
 
 &tlmm {
@@ -1151,8 +1151,8 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_hsphy {
-	vdd-supply = <&vreg_l3f_e0>;
-	vdda12-supply = <&vreg_l4c_e0>;
+	vdd-supply = <&vreg_l3f0>;
+	vdda12-supply = <&vreg_l4c0>;
 
 	phys = <&smb2370_j_e2_eusb2_repeater>;
 
@@ -1160,9 +1160,9 @@ &usb_0_hsphy {
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l3f_e0>;
-	vdda-pll-supply = <&vreg_l4c_e0>;
-	refgen-supply = <&vreg_l2f_e0>;
+	vdda-phy-supply = <&vreg_l3f0>;
+	vdda-pll-supply = <&vreg_l4c0>;
+	refgen-supply = <&vreg_l2f0>;
 
 	status = "okay";
 };
@@ -1180,8 +1180,8 @@ &usb_1_dwc3_hs {
 };
 
 &usb_1_hsphy {
-	vdd-supply = <&vreg_l3f_e0>;
-	vdda12-supply = <&vreg_l4c_e0>;
+	vdd-supply = <&vreg_l3f0>;
+	vdda12-supply = <&vreg_l4c0>;
 
 	phys = <&smb2370_k_e2_eusb2_repeater>;
 
@@ -1189,9 +1189,9 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l1c_e0>;
-	vdda-pll-supply = <&vreg_l4c_e0>;
-	refgen-supply = <&vreg_l2f_e0>;
+	vdda-phy-supply = <&vreg_l1c0>;
+	vdda-pll-supply = <&vreg_l4c0>;
+	refgen-supply = <&vreg_l2f0>;
 
 	status = "okay";
 };
@@ -1201,9 +1201,9 @@ &usb_1_qmpphy_out {
 };
 
 &usb_2_qmpphy {
-	vdda-phy-supply = <&vreg_l4c_e1>;
-	vdda-pll-supply = <&vreg_l4f_e1>;
-	refgen-supply = <&vreg_l4f_e1>;
+	vdda-phy-supply = <&vreg_l4c1>;
+	vdda-pll-supply = <&vreg_l4f1>;
+	refgen-supply = <&vreg_l4f1>;
 
 	/delete-property/ mode-switch;
 	/delete-property/ orientation-switch;
@@ -1233,8 +1233,8 @@ &usb_mp {
 
 /* MP0 (eUSB3 + USBSS3) -> Type-A port */
 &usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2c_e0>;
-	vdda12-supply = <&vreg_l4c_e0>;
+	vdd-supply = <&vreg_l2c0>;
+	vdda12-supply = <&vreg_l4c0>;
 
 	phys = <&ptn3222_0>;
 
@@ -1243,8 +1243,8 @@ &usb_mp_hsphy0 {
 
 /* MP1 (eUSB6 + USBSS4) -> RTS5329 SD Card reader */
 &usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2c_e0>;
-	vdda12-supply = <&vreg_l4c_e0>;
+	vdd-supply = <&vreg_l2c0>;
+	vdda12-supply = <&vreg_l4c0>;
 
 	phys = <&ptn3222_1>;
 
@@ -1252,17 +1252,17 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l2c_e0>;
-	vdda-pll-supply = <&vreg_l4c_e0>;
-	refgen-supply = <&vreg_l4f_e1>;
+	vdda-phy-supply = <&vreg_l2c0>;
+	vdda-pll-supply = <&vreg_l4c0>;
+	refgen-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l2c_e0>;
-	vdda-pll-supply = <&vreg_l4c_e0>;
-	refgen-supply = <&vreg_l4f_e1>;
+	vdda-phy-supply = <&vreg_l2c0>;
+	vdda-pll-supply = <&vreg_l4c0>;
+	refgen-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index b8e3fedcdea8..dfac99056bcd 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -30,29 +30,29 @@ &mdss_dp1_out {
 };
 
 &pcie3_phy {
-	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
-	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+	vdda-phy-supply = <&vreg_l3c1>;
+	vdda-pll-supply = <&vreg_l2c1>;
 
-	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
-	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c1>;
+	vdda-refgen1p2-supply = <&vreg_l4f1>;
 };
 
 &tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
-	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
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
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..4744bcb3c123 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -289,11 +289,11 @@ wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
 		vdd-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_l15b_e0_1p8>;
-		vddaon-supply = <&vreg_l15b_e0_1p8>;
-		vdddig-supply = <&vreg_l15b_e0_1p8>;
-		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
-		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
+		vddio-supply = <&vreg_l15b0>;
+		vddaon-supply = <&vreg_l15b0>;
+		vdddig-supply = <&vreg_l15b0>;
+		vddrfa1p2-supply = <&vreg_l15b0>;
+		vddrfa1p8-supply = <&vreg_l15b0>;
 
 		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
 		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
@@ -364,78 +364,78 @@ vreg_bob2_e0: bob2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
 		};
 
-		vreg_l1b_e0_1p8: ldo1 {
-			regulator-name = "vreg_l1b_e0_1p8";
+		vreg_l1b0: ldo1 {
+			regulator-name = "vreg_l1b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2b_e0_2p9: ldo2 {
-			regulator-name = "vreg_l2b_e0_2p9";
+		vreg_l2b0: ldo2 {
+			regulator-name = "vreg_l2b0";
 			regulator-min-microvolt = <1804000>;
 			regulator-max-microvolt = <2904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l7b_e0_2p79: ldo7 {
-			regulator-name = "vreg_l7b_e0_2p79";
+		vreg_l7b0: ldo7 {
+			regulator-name = "vreg_l7b0";
 			regulator-min-microvolt = <2790000>;
 			regulator-max-microvolt = <2792000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l8b_e0_1p50: ldo8 {
-			regulator-name = "vreg_l8b_e0_1p50";
+		vreg_l8b0: ldo8 {
+			regulator-name = "vreg_l8b0";
 			regulator-min-microvolt = <1504000>;
 			regulator-max-microvolt = <1504000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l9b_e0_2p9: ldo9 {
-			regulator-name = "vreg_l9b_e0_2p9";
+		vreg_l9b0: ldo9 {
+			regulator-name = "vreg_l9b0";
 			regulator-min-microvolt = <2960000>;
 			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l10b_e0_1p8: ldo10 {
-			regulator-name = "vreg_l10b_e0_1p8";
+		vreg_l10b0: ldo10 {
+			regulator-name = "vreg_l10b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l11b_e0_1p2: ldo11 {
-			regulator-name = "vreg_l11b_e0_1p2";
+		vreg_l11b0: ldo11 {
+			regulator-name = "vreg_l11b0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l12b_e0_1p14: ldo12 {
-			regulator-name = "vreg_l12b_e0_1p14";
+		vreg_l12b0: ldo12 {
+			regulator-name = "vreg_l12b0";
 			regulator-min-microvolt = <1144000>;
 			regulator-max-microvolt = <1144000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l15b_e0_1p8: ldo15 {
-			regulator-name = "vreg_l15b_e0_1p8";
+		vreg_l15b0: ldo15 {
+			regulator-name = "vreg_l15b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l17b_e0_2p4: ldo17 {
-			regulator-name = "vreg_l17b_e0_2p4";
+		vreg_l17b0: ldo17 {
+			regulator-name = "vreg_l17b0";
 			regulator-min-microvolt = <2400000>;
 			regulator-max-microvolt = <2700000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l18b_e0_1p2: ldo18 {
-			regulator-name = "vreg_l18b_e0_1p2";
+		vreg_l18b0: ldo18 {
+			regulator-name = "vreg_l18b0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -446,29 +446,29 @@ regulators-1 {
 		compatible = "qcom,pmcx0102-rpmh-regulators";
 		qcom,pmic-id = "C_E1";
 
-		vreg_l1c_e1_0p82: ldo1 {
-			regulator-name = "vreg_l1c_e1_0p82";
+		vreg_l1c1: ldo1 {
+			regulator-name = "vreg_l1c1";
 			regulator-min-microvolt = <832000>;
 			regulator-max-microvolt = <832000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2c_e1_1p14: ldo2 {
-			regulator-name = "vreg_l2c_e1_1p14";
+		vreg_l2c1: ldo2 {
+			regulator-name = "vreg_l2c1";
 			regulator-min-microvolt = <1144000>;
 			regulator-max-microvolt = <1144000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3c_e1_0p89: ldo3 {
-			regulator-name = "vreg_l3c_e1_0p89";
+		vreg_l3c1: ldo3 {
+			regulator-name = "vreg_l3c1";
 			regulator-min-microvolt = <890000>;
 			regulator-max-microvolt = <980000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4c_e1_0p72: ldo4 {
-			regulator-name = "vreg_l4c_e1_0p72";
+		vreg_l4c1: ldo4 {
+			regulator-name = "vreg_l4c1";
 			regulator-min-microvolt = <720000>;
 			regulator-max-microvolt = <720000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -479,43 +479,43 @@ regulators-2 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "F_E0";
 
-		vreg_s7f_e0_1p32: smps7 {
-			regulator-name = "vreg_s7f_e0_1p32";
+		vreg_s7f0: smps7 {
+			regulator-name = "vreg_s7f0";
 			regulator-min-microvolt = <1320000>;
 			regulator-max-microvolt = <1352000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_s8f_e0_0p95: smps8 {
-			regulator-name = "vreg_s8f_e0_0p95";
+		vreg_s8f0: smps8 {
+			regulator-name = "vreg_s8f0";
 			regulator-min-microvolt = <952000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_s9f_e0_1p9: smps9 {
-			regulator-name = "vreg_s9f_e0_1p9";
+		vreg_s9f0: smps9 {
+			regulator-name = "vreg_s9f0";
 			regulator-min-microvolt = <1900000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2f_e0_0p82: ldo2 {
-			regulator-name = "vreg_l2f_e0_0p82";
+		vreg_l2f0: ldo2 {
+			regulator-name = "vreg_l2f0";
 			regulator-min-microvolt = <832000>;
 			regulator-max-microvolt = <832000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3f_e0_0p72: ldo3 {
-			regulator-name = "vreg_l3f_e0_0p72";
+		vreg_l3f0: ldo3 {
+			regulator-name = "vreg_l3f0";
 			regulator-min-microvolt = <720000>;
 			regulator-max-microvolt = <720000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4f_e0_0p3: ldo4 {
-			regulator-name = "vreg_l4f_e0_0p3";
+		vreg_l4f0: ldo4 {
+			regulator-name = "vreg_l4f0";
 			regulator-min-microvolt = <1080000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -526,29 +526,29 @@ regulators-3 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "F_E1";
 
-		vreg_s7f_e1_0p3: smps7 {
-			regulator-name = "vreg_s7f_e1_0p3";
+		vreg_s7f1: smps7 {
+			regulator-name = "vreg_s7f1";
 			regulator-min-microvolt = <300000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l1f_e1_0p82: ldo1 {
-			regulator-name = "vreg_l1f_e1_0p82";
+		vreg_l1f1: ldo1 {
+			regulator-name = "vreg_l1f1";
 			regulator-min-microvolt = <832000>;
 			regulator-max-microvolt = <832000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2f_e1_0p83: ldo2 {
-			regulator-name = "vreg_l2f_e1_0p83";
+		vreg_l2f1: ldo2 {
+			regulator-name = "vreg_l2f1";
 			regulator-min-microvolt = <832000>;
 			regulator-max-microvolt = <832000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4f_e1_1p08: ldo4 {
-			regulator-name = "vreg_l4f_e1_1p08";
+		vreg_l4f1: ldo4 {
+			regulator-name = "vreg_l4f1";
 			regulator-min-microvolt = <1080000>;
 			regulator-max-microvolt = <1320000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -559,29 +559,29 @@ regulators-4 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "H_E0";
 
-		vreg_l1h_e0_0p89: ldo1 {
-			regulator-name = "vreg_l1h_e0_0p89";
+		vreg_l1h0: ldo1 {
+			regulator-name = "vreg_l1h0";
 			regulator-min-microvolt = <832000>;
 			regulator-max-microvolt = <832000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2h_e0_0p72: ldo2 {
-			regulator-name = "vreg_l2h_e0_0p72";
+		vreg_l2h0: ldo2 {
+			regulator-name = "vreg_l2h0";
 			regulator-min-microvolt = <832000>;
 			regulator-max-microvolt = <832000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3h_e0_0p32: ldo3 {
-			regulator-name = "vreg_l3h_e0_0p32";
+		vreg_l3h0: ldo3 {
+			regulator-name = "vreg_l3h0";
 			regulator-min-microvolt = <320000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4h_e0_1p2: ldo4 {
-			regulator-name = "vreg_l4h_e0_1p2";
+		vreg_l4h0: ldo4 {
+			regulator-name = "vreg_l4h0";
 			regulator-min-microvolt = <1080000>;
 			regulator-max-microvolt = <1320000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -618,7 +618,7 @@ touchpad@2c {
 		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 
 		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
+		vddl-supply = <&vreg_l15b0>;
 
 		pinctrl-0 = <&tpad_default>;
 		pinctrl-names = "default";
@@ -634,7 +634,7 @@ keyboard@3a {
 		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
 
 		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
+		vddl-supply = <&vreg_l15b0>;
 
 		pinctrl-0 = <&kybd_default>;
 		pinctrl-names = "default";
@@ -654,8 +654,8 @@ ptn3222_0: redriver@43 {
 
 		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 
-		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
-		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+		vdd3v3-supply = <&vreg_l8b0>;
+		vdd1v8-supply = <&vreg_l15b0>;
 
 		#phy-cells = <0>;
 	};
@@ -666,8 +666,8 @@ ptn3222_1: redriver@47 {
 
 		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
 
-		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
-		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+		vdd3v3-supply = <&vreg_l8b0>;
+		vdd1v8-supply = <&vreg_l15b0>;
 
 		#phy-cells = <0>;
 	};
@@ -685,7 +685,7 @@ touchscreen@38 {
 		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
 
 		vcc33-supply = <&vreg_misc_3p3>;
-		vccio-supply = <&vreg_l15b_e0_1p8>;
+		vccio-supply = <&vreg_l15b0>;
 
 		reset-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
 
@@ -698,7 +698,7 @@ &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";
 	qcom,dmic-sample-rate = <4800000>;
-	vdd-micb-supply = <&vreg_l1b_e0_1p8>;
+	vdd-micb-supply = <&vreg_l1b0>;
 };
 
 &mdss {
@@ -736,8 +736,8 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f_e1_0p83>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-phy-supply = <&vreg_l2f1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -762,8 +762,8 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-phy-supply = <&vreg_l1c1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -798,8 +798,8 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-phy-supply = <&vreg_l2f0>;
+	vdda-pll-supply = <&vreg_l4h0>;
 
 	status = "okay";
 };
@@ -819,8 +819,8 @@ &pcie6 {
 };
 
 &pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-phy-supply = <&vreg_l1c1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -890,18 +890,18 @@ &remoteproc_cdsp {
 };
 
 &smb2370_j_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0_1p8>;
-	vdd3-supply = <&vreg_l7b_e0_2p79>;
+	vdd18-supply = <&vreg_l15b0>;
+	vdd3-supply = <&vreg_l7b0>;
 };
 
 &smb2370_k_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0_1p8>;
-	vdd3-supply = <&vreg_l7b_e0_2p79>;
+	vdd18-supply = <&vreg_l15b0>;
+	vdd3-supply = <&vreg_l7b0>;
 };
 
 &sdhc_2 {
-	vmmc-supply = <&vreg_l9b_e0_2p9>;
-	vqmmc-supply = <&vreg_l2b_e0_2p9>;
+	vmmc-supply = <&vreg_l9b0>;
+	vqmmc-supply = <&vreg_l2b0>;
 
 	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
 	pinctrl-1 = <&sdc2_sleep_state &sdc2_card_det_n>;
@@ -925,8 +925,8 @@ left_woofer: speaker@0,0 {
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "WooferLeft";
-		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
-		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <1 2 3 7 12 14>;
 	};
 
@@ -937,8 +937,8 @@ left_tweeter: speaker@0,1 {
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TweeterLeft";
-		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
-		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <4 5 6 7 13 15>;
 	};
 };
@@ -953,8 +953,8 @@ right_woofer: speaker@0,0 {
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "WooferRight";
-		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
-		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <1 2 3 7 12 14>;
 	};
 
@@ -965,8 +965,8 @@ right_tweeter: speaker@0,1 {
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TweeterRight";
-		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
-		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <4 5 6 7 13 15>;
 	};
 };
@@ -1182,8 +1182,8 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_hsphy {
-	vdd-supply = <&vreg_l3f_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l3f0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	phys = <&smb2370_j_e2_eusb2_repeater>;
 
@@ -1191,9 +1191,9 @@ &usb_0_hsphy {
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l3f_e0_0p72>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-	refgen-supply = <&vreg_l2f_e0_0p82>;
+	vdda-phy-supply = <&vreg_l3f0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l2f0>;
 
 	status = "okay";
 };
@@ -1211,8 +1211,8 @@ &usb_1_dwc3_hs {
 };
 
 &usb_1_hsphy {
-	vdd-supply = <&vreg_l3f_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l3f0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	phys = <&smb2370_k_e2_eusb2_repeater>;
 
@@ -1220,9 +1220,9 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l1h_e0_0p89>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-	refgen-supply = <&vreg_l2f_e0_0p82>;
+	vdda-phy-supply = <&vreg_l1h0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l2f0>;
 
 	status = "okay";
 };
@@ -1238,8 +1238,8 @@ &usb_hs {
 };
 
 &usb_hs_phy {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l2h0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	phys = <&ptn3222_1>;
 
@@ -1251,8 +1251,8 @@ &usb_mp {
 };
 
 &usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l2h0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	phys = <&ptn3222_0>;
 
@@ -1260,24 +1260,24 @@ &usb_mp_hsphy0 {
 };
 
 &usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l2h0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l2h_e0_0p72>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-	refgen-supply = <&vreg_l4f_e1_1p08>;
+	vdda-phy-supply = <&vreg_l2h0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l2h_e0_0p72>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-	refgen-supply = <&vreg_l4f_e1_1p08>;
+	vdda-phy-supply = <&vreg_l2h0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
index 096d40e49210..ef77e70c8af3 100644
--- a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
@@ -236,11 +236,11 @@ wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
 		vdd-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_l15b_e0_1p8>;
-		vddaon-supply = <&vreg_l15b_e0_1p8>;
-		vdddig-supply = <&vreg_l15b_e0_1p8>;
-		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
-		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
+		vddio-supply = <&vreg_l15b0>;
+		vddaon-supply = <&vreg_l15b0>;
+		vdddig-supply = <&vreg_l15b0>;
+		vddrfa1p2-supply = <&vreg_l15b0>;
+		vddrfa1p8-supply = <&vreg_l15b0>;
 
 		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
 		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
@@ -297,29 +297,29 @@ regulators-0 {
 		compatible = "qcom,pmh0101-rpmh-regulators";
 		qcom,pmic-id = "B_E0";
 
-		vreg_l1b_e0_1p8: ldo1 {
-			regulator-name = "vreg_l1b_e0_1p8";
+		vreg_l1b0: ldo1 {
+			regulator-name = "vreg_l1b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l7b_e0_3p1: ldo7 {
-			regulator-name = "vreg_l7b_e0_3p1";
+		vreg_l7b0: ldo7 {
+			regulator-name = "vreg_l7b0";
 			regulator-min-microvolt = <3072000>;
 			regulator-max-microvolt = <3072000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l15b_e0_1p8: ldo15 {
-			regulator-name = "vreg_l15b_e0_1p8";
+		vreg_l15b0: ldo15 {
+			regulator-name = "vreg_l15b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l18b_e0_1p2: ldo18 {
-			regulator-name = "vreg_l18b_e0_1p2";
+		vreg_l18b0: ldo18 {
+			regulator-name = "vreg_l18b0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -330,8 +330,8 @@ regulators-1 {
 		compatible = "qcom,pmcx0102-rpmh-regulators";
 		qcom,pmic-id = "C_E1";
 
-		vreg_l1c_e1_0p91: ldo1 {
-			regulator-name = "vreg_l1c_e1_0p91";
+		vreg_l1c1: ldo1 {
+			regulator-name = "vreg_l1c1";
 			regulator-min-microvolt = <912000>;
 			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -342,15 +342,15 @@ regulators-2 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "F_E0";
 
-		vreg_l2f_e0_0p94: ldo2 {
-			regulator-name = "vreg_l2f_e0_0p94";
+		vreg_l2f0: ldo2 {
+			regulator-name = "vreg_l2f0";
 			regulator-min-microvolt = <936000>;
 			regulator-max-microvolt = <936000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3f_e0_0p91: ldo3 {
-			regulator-name = "vreg_l3f_e0_0p91";
+		vreg_l3f0: ldo3 {
+			regulator-name = "vreg_l3f0";
 			regulator-min-microvolt = <912000>;
 			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -361,22 +361,22 @@ regulators-3 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "F_E1";
 
-		vreg_l1f_e1_0p88: ldo1 {
-			regulator-name = "vreg_l1f_e1_0p88";
+		vreg_l1f1: ldo1 {
+			regulator-name = "vreg_l1f1";
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2f_e1_0p88: ldo2 {
-			regulator-name = "vreg_l2f_e1_0p88";
+		vreg_l2f1: ldo2 {
+			regulator-name = "vreg_l2f1";
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4f_e1_1p2: ldo4 {
-			regulator-name = "vreg_l4f_e1_1p2";
+		vreg_l4f1: ldo4 {
+			regulator-name = "vreg_l4f1";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -387,22 +387,22 @@ regulators-4 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "H_E0";
 
-		vreg_l1h_e0_0p94: ldo1 {
-			regulator-name = "vreg_l1h_e0_0p94";
+		vreg_l1h0: ldo1 {
+			regulator-name = "vreg_l1h0";
 			regulator-min-microvolt = <936000>;
 			regulator-max-microvolt = <936000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2h_e0_0p88: ldo2 {
-			regulator-name = "vreg_l2h_e0_0p88";
+		vreg_l2h0: ldo2 {
+			regulator-name = "vreg_l2h0";
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4h_e0_1p2: ldo4 {
-			regulator-name = "vreg_l4h_e0_1p2";
+		vreg_l4h0: ldo4 {
+			regulator-name = "vreg_l4h0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -470,7 +470,7 @@ touchscreen@10 {
 };
 
 &lpass_vamacro {
-	vdd-micb-supply = <&vreg_l1b_e0_1p8>;
+	vdd-micb-supply = <&vreg_l1b0>;
 
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
@@ -529,8 +529,8 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f_e1_0p88>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-phy-supply = <&vreg_l2f1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -543,8 +543,8 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p91>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-phy-supply = <&vreg_l1c1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -579,8 +579,8 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f_e0_0p94>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-phy-supply = <&vreg_l2f0>;
+	vdda-pll-supply = <&vreg_l4h0>;
 
 	status = "okay";
 };
@@ -625,13 +625,13 @@ &remoteproc_soccp {
 };
 
 &smb2370_j_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0_1p8>;
-	vdd3-supply = <&vreg_l7b_e0_3p1>;
+	vdd18-supply = <&vreg_l15b0>;
+	vdd3-supply = <&vreg_l7b0>;
 };
 
 &smb2370_k_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0_1p8>;
-	vdd3-supply = <&vreg_l7b_e0_3p1>;
+	vdd18-supply = <&vreg_l15b0>;
+	vdd3-supply = <&vreg_l7b0>;
 };
 
 &swr0 {
@@ -644,8 +644,8 @@ left_woofer: speaker@0,0 {
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "WooferLeft";
-		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
-		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <1 2 3 7 12 14>;
 	};
 
@@ -656,8 +656,8 @@ left_tweeter: speaker@0,1 {
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TweeterLeft";
-		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
-		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <4 5 6 7 13 15>;
 	};
 };
@@ -672,8 +672,8 @@ right_woofer: speaker@0,0 {
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "WooferRight";
-		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
-		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <1 2 3 7 12 14>;
 	};
 
@@ -684,30 +684,30 @@ right_tweeter: speaker@0,1 {
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TweeterRight";
-		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
-		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <4 5 6 7 13 15>;
 	};
 };
 
 &tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p88>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p88>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p88>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p88>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p88>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p88>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p88>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p88>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p88>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p91>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p91>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p88>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p94>;
-	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p88>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p2>;
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
 };
 
 &tlmm {
@@ -841,8 +841,8 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_hsphy {
-	vdd-supply = <&vreg_l3f_e0_0p91>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l3f0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	phys = <&smb2370_j_e2_eusb2_repeater>;
 
@@ -850,9 +850,9 @@ &usb_0_hsphy {
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l3f_e0_0p91>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-	refgen-supply = <&vreg_l2f_e0_0p94>;
+	vdda-phy-supply = <&vreg_l3f0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l2f0>;
 
 	status = "okay";
 };
@@ -870,8 +870,8 @@ &usb_1_dwc3_hs {
 };
 
 &usb_1_hsphy {
-	vdd-supply = <&vreg_l3f_e0_0p91>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l3f0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	phys = <&smb2370_k_e2_eusb2_repeater>;
 
@@ -879,9 +879,9 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l1h_e0_0p94>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-	refgen-supply = <&vreg_l2f_e0_0p94>;
+	vdda-phy-supply = <&vreg_l1h0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l2f0>;
 
 	status = "okay";
 };
@@ -898,8 +898,8 @@ &usb_hs {
 };
 
 &usb_hs_phy {
-	vdd-supply = <&vreg_l2h_e0_0p88>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l2h0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	status = "okay";
 };
@@ -910,31 +910,31 @@ &usb_mp {
 };
 
 &usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2h_e0_0p88>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l2h0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	status = "okay";
 };
 
 &usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2h_e0_0p88>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l2h0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l2h_e0_0p88>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-	refgen-supply = <&vreg_l4f_e1_1p2>;
+	vdda-phy-supply = <&vreg_l2h0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l2h_e0_0p88>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-	refgen-supply = <&vreg_l4f_e1_1p2>;
+	vdda-phy-supply = <&vreg_l2h0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index 769f195c99d9..56c22daab056 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -320,11 +320,11 @@ wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
 		vdd-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_l15b_e0>;
-		vddaon-supply = <&vreg_l15b_e0>;
-		vdddig-supply = <&vreg_l15b_e0>;
-		vddrfa1p2-supply = <&vreg_l15b_e0>;
-		vddrfa1p8-supply = <&vreg_l15b_e0>;
+		vddio-supply = <&vreg_l15b0>;
+		vddaon-supply = <&vreg_l15b0>;
+		vdddig-supply = <&vreg_l15b0>;
+		vddrfa1p2-supply = <&vreg_l15b0>;
+		vddrfa1p8-supply = <&vreg_l15b0>;
 
 		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
 		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
@@ -381,71 +381,71 @@ regulators-0 {
 		compatible = "qcom,pmh0101-rpmh-regulators";
 		qcom,pmic-id = "B_E0";
 
-		vreg_l1b_e0: ldo1 {
-			regulator-name = "vreg_l1b_e0";
+		vreg_l1b0: ldo1 {
+			regulator-name = "vreg_l1b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l7b_e0: ldo7 {
-			regulator-name = "vreg_l7b_e0";
+		vreg_l7b0: ldo7 {
+			regulator-name = "vreg_l7b0";
 			regulator-min-microvolt = <3072000>;
 			regulator-max-microvolt = <3072000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l8b_e0: ldo8 {
-			regulator-name = "vreg_l8b_e0";
+		vreg_l8b0: ldo8 {
+			regulator-name = "vreg_l8b0";
 			regulator-min-microvolt = <3304000>;
 			regulator-max-microvolt = <3304000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l9b_e0: ldo9 {
-			regulator-name = "vreg_l9b_e0";
+		vreg_l9b0: ldo9 {
+			regulator-name = "vreg_l9b0";
 			regulator-min-microvolt = <2960000>;
 			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l10b_e0: ldo10 {
-			regulator-name = "vreg_l10b_e0";
+		vreg_l10b0: ldo10 {
+			regulator-name = "vreg_l10b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l11b_e0: ldo11 {
-			regulator-name = "vreg_l11b_e0";
+		vreg_l11b0: ldo11 {
+			regulator-name = "vreg_l11b0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l12b_e0: ldo12 {
-			regulator-name = "vreg_l12b_e0";
+		vreg_l12b0: ldo12 {
+			regulator-name = "vreg_l12b0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l15b_e0: ldo15 {
-			regulator-name = "vreg_l15b_e0";
+		vreg_l15b0: ldo15 {
+			regulator-name = "vreg_l15b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l17b_e0: ldo17 {
-			regulator-name = "vreg_l17b_e0";
+		vreg_l17b0: ldo17 {
+			regulator-name = "vreg_l17b0";
 			regulator-min-microvolt = <2504000>;
 			regulator-max-microvolt = <2504000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l18b_e0: ldo18 {
-			regulator-name = "vreg_l18b_e0";
+		vreg_l18b0: ldo18 {
+			regulator-name = "vreg_l18b0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -456,29 +456,29 @@ regulators-1 {
 		compatible = "qcom,pmcx0102-rpmh-regulators";
 		qcom,pmic-id = "C_E1";
 
-		vreg_l1c_e1: ldo1 {
-			regulator-name = "vreg_l1c_e1";
+		vreg_l1c1: ldo1 {
+			regulator-name = "vreg_l1c1";
 			regulator-min-microvolt = <912000>;
 			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2c_e1: ldo2 {
-			regulator-name = "vreg_l2c_e1";
+		vreg_l2c1: ldo2 {
+			regulator-name = "vreg_l2c1";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3c_e1: ldo3 {
-			regulator-name = "vreg_l3c_e1";
+		vreg_l3c1: ldo3 {
+			regulator-name = "vreg_l3c1";
 			regulator-min-microvolt = <936000>;
 			regulator-max-microvolt = <936000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4c_e1: ldo4 {
-			regulator-name = "vreg_l4c_e1";
+		vreg_l4c1: ldo4 {
+			regulator-name = "vreg_l4c1";
 			regulator-min-microvolt = <912000>;
 			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -489,29 +489,29 @@ regulators-2 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "F_E0";
 
-		vreg_s7f_e0: smps7 {
-			regulator-name = "vreg_s7f_e0";
+		vreg_s7f0: smps7 {
+			regulator-name = "vreg_s7f0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_s8f_e0: smps8 {
-			regulator-name = "vreg_s8f_e0";
+		vreg_s8f0: smps8 {
+			regulator-name = "vreg_s8f0";
 			regulator-min-microvolt = <952000>;
 			regulator-max-microvolt = <952000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2f_e0: ldo2 {
-			regulator-name = "vreg_l2f_e0";
+		vreg_l2f0: ldo2 {
+			regulator-name = "vreg_l2f0";
 			regulator-min-microvolt = <936000>;
 			regulator-max-microvolt = <936000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3f_e0: ldo3 {
-			regulator-name = "vreg_l3f_e0";
+		vreg_l3f0: ldo3 {
+			regulator-name = "vreg_l3f0";
 			regulator-min-microvolt = <912000>;
 			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -522,22 +522,22 @@ regulators-3 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "F_E1";
 
-		vreg_l1f_e1: ldo1 {
-			regulator-name = "vreg_l1f_e1";
+		vreg_l1f1: ldo1 {
+			regulator-name = "vreg_l1f1";
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2f_e1: ldo2 {
-			regulator-name = "vreg_l2f_e1";
+		vreg_l2f1: ldo2 {
+			regulator-name = "vreg_l2f1";
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4f_e1: ldo4 {
-			regulator-name = "vreg_l4f_e1";
+		vreg_l4f1: ldo4 {
+			regulator-name = "vreg_l4f1";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -548,29 +548,29 @@ regulators-4 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "H_E0";
 
-		vreg_l1h_e0: ldo1 {
-			regulator-name = "vreg_l1h_e0";
+		vreg_l1h0: ldo1 {
+			regulator-name = "vreg_l1h0";
 			regulator-min-microvolt = <936000>;
 			regulator-max-microvolt = <936000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2h_e0: ldo2 {
-			regulator-name = "vreg_l2h_e0";
+		vreg_l2h0: ldo2 {
+			regulator-name = "vreg_l2h0";
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3h_e0: ldo3 {
-			regulator-name = "vreg_l3h_e0";
+		vreg_l3h0: ldo3 {
+			regulator-name = "vreg_l3h0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4h_e0: ldo4 {
-			regulator-name = "vreg_l4h_e0";
+		vreg_l4h0: ldo4 {
+			regulator-name = "vreg_l4h0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -599,7 +599,7 @@ touchpad@2c {
 		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 
 		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0>;
+		vddl-supply = <&vreg_l15b0>;
 
 		pinctrl-0 = <&tpad_default>;
 		pinctrl-names = "default";
@@ -615,7 +615,7 @@ keyboard@3a {
 		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
 
 		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0>;
+		vddl-supply = <&vreg_l15b0>;
 
 		pinctrl-0 = <&kybd_default>;
 		pinctrl-names = "default";
@@ -647,7 +647,7 @@ touchscreen@14 {
 		post-power-on-delay-ms = <200>;
 
 		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0>;
+		vddl-supply = <&vreg_l15b0>;
 
 		pinctrl-0 = <&ts0_default>;
 		pinctrl-names = "default";
@@ -727,8 +727,8 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f_e1>;
-	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-phy-supply = <&vreg_l2f1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -741,8 +741,8 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c_e1>;
-	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-phy-supply = <&vreg_l1c1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -777,8 +777,8 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f_e0>;
-	vdda-pll-supply = <&vreg_l4h_e0>;
+	vdda-phy-supply = <&vreg_l2f0>;
+	vdda-pll-supply = <&vreg_l4h0>;
 
 	status = "okay";
 };
@@ -798,8 +798,8 @@ &pcie6 {
 };
 
 &pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c_e1>;
-	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-phy-supply = <&vreg_l1c1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -861,18 +861,18 @@ &remoteproc_soccp {
 };
 
 &smb2370_j_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0>;
-	vdd3-supply = <&vreg_l7b_e0>;
+	vdd18-supply = <&vreg_l15b0>;
+	vdd3-supply = <&vreg_l7b0>;
 };
 
 &smb2370_k_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0>;
-	vdd3-supply = <&vreg_l7b_e0>;
+	vdd18-supply = <&vreg_l15b0>;
+	vdd3-supply = <&vreg_l7b0>;
 };
 
 &smb2370_l_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0>;
-	vdd3-supply = <&vreg_l7b_e0>;
+	vdd18-supply = <&vreg_l15b0>;
+	vdd3-supply = <&vreg_l7b0>;
 
 	status = "okay";
 };
@@ -887,8 +887,8 @@ left_woofer: speaker@0,0 {
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "WooferLeft";
-		vdd-1p8-supply = <&vreg_l15b_e0>;
-		vdd-io-supply = <&vreg_l18b_e0>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <1 2 3 7 12 14>;
 	};
 
@@ -899,8 +899,8 @@ left_tweeter: speaker@0,1 {
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TweeterLeft";
-		vdd-1p8-supply = <&vreg_l15b_e0>;
-		vdd-io-supply = <&vreg_l18b_e0>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <4 5 6 7 13 15>;
 	};
 };
@@ -915,8 +915,8 @@ right_woofer: speaker@0,0 {
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "WooferRight";
-		vdd-1p8-supply = <&vreg_l15b_e0>;
-		vdd-io-supply = <&vreg_l18b_e0>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <1 2 3 7 12 14>;
 	};
 
@@ -927,30 +927,30 @@ right_tweeter: speaker@0,1 {
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TweeterRight";
-		vdd-1p8-supply = <&vreg_l15b_e0>;
-		vdd-io-supply = <&vreg_l18b_e0>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <4 5 6 7 13 15>;
 	};
 };
 
 &tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f_e0>;
-	vdda-refgen3-1p2-supply = <&vreg_l4h_e0>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f_e1>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f_e1>;
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
 };
 
 &tlmm {
@@ -1142,8 +1142,8 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_hsphy {
-	vdd-supply = <&vreg_l3f_e0>;
-	vdda12-supply = <&vreg_l4h_e0>;
+	vdd-supply = <&vreg_l3f0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	phys = <&smb2370_j_e2_eusb2_repeater>;
 
@@ -1151,9 +1151,9 @@ &usb_0_hsphy {
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l4h_e0>;
-	vdda-pll-supply = <&vreg_l3f_e0>;
-	refgen-supply = <&vreg_l2f_e0>;
+	vdda-phy-supply = <&vreg_l4h0>;
+	vdda-pll-supply = <&vreg_l3f0>;
+	refgen-supply = <&vreg_l2f0>;
 
 	status = "okay";
 };
@@ -1171,8 +1171,8 @@ &usb_1_dwc3_hs {
 };
 
 &usb_1_hsphy {
-	vdd-supply = <&vreg_l3f_e0>;
-	vdda12-supply = <&vreg_l4h_e0>;
+	vdd-supply = <&vreg_l3f0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	phys = <&smb2370_k_e2_eusb2_repeater>;
 
@@ -1180,9 +1180,9 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l4h_e0>;
-	vdda-pll-supply = <&vreg_l1h_e0>;
-	refgen-supply = <&vreg_l2f_e0>;
+	vdda-phy-supply = <&vreg_l4h0>;
+	vdda-pll-supply = <&vreg_l1h0>;
+	refgen-supply = <&vreg_l2f0>;
 
 	status = "okay";
 };
@@ -1200,8 +1200,8 @@ &usb_2_dwc3_hs {
 };
 
 &usb_2_hsphy {
-	vdd-supply = <&vreg_l4c_e1>;
-	vdda12-supply = <&vreg_l4f_e1>;
+	vdd-supply = <&vreg_l4c1>;
+	vdda12-supply = <&vreg_l4f1>;
 
 	phys = <&smb2370_l_e2_eusb2_repeater>;
 
@@ -1209,9 +1209,9 @@ &usb_2_hsphy {
 };
 
 &usb_2_qmpphy {
-	vdda-phy-supply = <&vreg_l4f_e1>;
-	vdda-pll-supply = <&vreg_l4c_e1>;
-	refgen-supply = <&vreg_l1c_e1>;
+	vdda-phy-supply = <&vreg_l4f1>;
+	vdda-pll-supply = <&vreg_l4c1>;
+	refgen-supply = <&vreg_l1c1>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index f0ed47adfc2f..6acf457a4872 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -14,21 +14,21 @@ / {
 };
 
 &tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
-	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
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
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi b/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
index 9751fbcc5f82..f012b6f7f1f5 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
@@ -115,11 +115,11 @@ wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
 		vdd-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_l15b_e0_1p8>;
-		vddaon-supply = <&vreg_l15b_e0_1p8>;
-		vdddig-supply = <&vreg_l15b_e0_1p8>;
-		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
-		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
+		vddio-supply = <&vreg_l15b0>;
+		vddaon-supply = <&vreg_l15b0>;
+		vdddig-supply = <&vreg_l15b0>;
+		vddrfa1p2-supply = <&vreg_l15b0>;
+		vddrfa1p8-supply = <&vreg_l15b0>;
 
 		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
 		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
@@ -190,78 +190,78 @@ vreg_bob2_e0: bob2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
 		};
 
-		vreg_l1b_e0_1p8: ldo1 {
-			regulator-name = "vreg_l1b_e0_1p8";
+		vreg_l1b0: ldo1 {
+			regulator-name = "vreg_l1b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2b_e0_2p9: ldo2 {
-			regulator-name = "vreg_l2b_e0_2p9";
+		vreg_l2b0: ldo2 {
+			regulator-name = "vreg_l2b0";
 			regulator-min-microvolt = <2904000>;
 			regulator-max-microvolt = <2904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l7b_e0_2p79: ldo7 {
-			regulator-name = "vreg_l7b_e0_2p79";
+		vreg_l7b0: ldo7 {
+			regulator-name = "vreg_l7b0";
 			regulator-min-microvolt = <2790000>;
 			regulator-max-microvolt = <2792000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l8b_e0_1p50: ldo8 {
-			regulator-name = "vreg_l8b_e0_1p50";
+		vreg_l8b0: ldo8 {
+			regulator-name = "vreg_l8b0";
 			regulator-min-microvolt = <1504000>;
 			regulator-max-microvolt = <1504000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l9b_e0_2p7: ldo9 {
-			regulator-name = "vreg_l9b_e0_2p7";
+		vreg_l9b0: ldo9 {
+			regulator-name = "vreg_l9b0";
 			regulator-min-microvolt = <2704000>;
 			regulator-max-microvolt = <2704000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l10b_e0_1p8: ldo10 {
-			regulator-name = "vreg_l10b_e0_1p8";
+		vreg_l10b0: ldo10 {
+			regulator-name = "vreg_l10b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l11b_e0_1p2: ldo11 {
-			regulator-name = "vreg_l11b_e0_1p2";
+		vreg_l11b0: ldo11 {
+			regulator-name = "vreg_l11b0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l12b_e0_1p14: ldo12 {
-			regulator-name = "vreg_l12b_e0_1p14";
+		vreg_l12b0: ldo12 {
+			regulator-name = "vreg_l12b0";
 			regulator-min-microvolt = <1144000>;
 			regulator-max-microvolt = <1144000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l15b_e0_1p8: ldo15 {
-			regulator-name = "vreg_l15b_e0_1p8";
+		vreg_l15b0: ldo15 {
+			regulator-name = "vreg_l15b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l17b_e0_2p4: ldo17 {
-			regulator-name = "vreg_l17b_e0_2p4";
+		vreg_l17b0: ldo17 {
+			regulator-name = "vreg_l17b0";
 			regulator-min-microvolt = <2400000>;
 			regulator-max-microvolt = <2700000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l18b_e0_1p2: ldo18 {
-			regulator-name = "vreg_l18b_e0_1p2";
+		vreg_l18b0: ldo18 {
+			regulator-name = "vreg_l18b0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -272,29 +272,29 @@ regulators-1 {
 		compatible = "qcom,pmcx0102-rpmh-regulators";
 		qcom,pmic-id = "C_E1";
 
-		vreg_l1c_e1_0p82: ldo1 {
-			regulator-name = "vreg_l1c_e1_0p82";
+		vreg_l1c1: ldo1 {
+			regulator-name = "vreg_l1c1";
 			regulator-min-microvolt = <832000>;
 			regulator-max-microvolt = <832000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2c_e1_1p14: ldo2 {
-			regulator-name = "vreg_l2c_e1_1p14";
+		vreg_l2c1: ldo2 {
+			regulator-name = "vreg_l2c1";
 			regulator-min-microvolt = <1144000>;
 			regulator-max-microvolt = <1144000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3c_e1_0p89: ldo3 {
-			regulator-name = "vreg_l3c_e1_0p89";
+		vreg_l3c1: ldo3 {
+			regulator-name = "vreg_l3c1";
 			regulator-min-microvolt = <890000>;
 			regulator-max-microvolt = <980000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4c_e1_0p72: ldo4 {
-			regulator-name = "vreg_l4c_e1_0p72";
+		vreg_l4c1: ldo4 {
+			regulator-name = "vreg_l4c1";
 			regulator-min-microvolt = <720000>;
 			regulator-max-microvolt = <720000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -305,43 +305,43 @@ regulators-2 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "F_E0";
 
-		vreg_s7f_e0_1p32: smps7 {
-			regulator-name = "vreg_s7f_e0_1p32";
+		vreg_s7f0: smps7 {
+			regulator-name = "vreg_s7f0";
 			regulator-min-microvolt = <1320000>;
 			regulator-max-microvolt = <1352000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_s8f_e0_0p95: smps8 {
-			regulator-name = "vreg_s8f_e0_0p95";
+		vreg_s8f0: smps8 {
+			regulator-name = "vreg_s8f0";
 			regulator-min-microvolt = <952000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_s9f_e0_1p9: smps9 {
-			regulator-name = "vreg_s9f_e0_1p9";
+		vreg_s9f0: smps9 {
+			regulator-name = "vreg_s9f0";
 			regulator-min-microvolt = <1900000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2f_e0_0p82: ldo2 {
-			regulator-name = "vreg_l2f_e0_0p82";
+		vreg_l2f0: ldo2 {
+			regulator-name = "vreg_l2f0";
 			regulator-min-microvolt = <832000>;
 			regulator-max-microvolt = <832000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3f_e0_0p72: ldo3 {
-			regulator-name = "vreg_l3f_e0_0p72";
+		vreg_l3f0: ldo3 {
+			regulator-name = "vreg_l3f0";
 			regulator-min-microvolt = <720000>;
 			regulator-max-microvolt = <720000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4f_e0_1p08: ldo4 {
-			regulator-name = "vreg_l4f_e0_1p08";
+		vreg_l4f0: ldo4 {
+			regulator-name = "vreg_l4f0";
 			regulator-min-microvolt = <1080000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -352,29 +352,29 @@ regulators-3 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "F_E1";
 
-		vreg_s7f_e1_0p3: smps7 {
-			regulator-name = "vreg_s7f_e1_0p3";
+		vreg_s7f1: smps7 {
+			regulator-name = "vreg_s7f1";
 			regulator-min-microvolt = <300000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l1f_e1_0p82: ldo1 {
-			regulator-name = "vreg_l1f_e1_0p82";
+		vreg_l1f1: ldo1 {
+			regulator-name = "vreg_l1f1";
 			regulator-min-microvolt = <832000>;
 			regulator-max-microvolt = <832000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2f_e1_0p83: ldo2 {
-			regulator-name = "vreg_l2f_e1_0p83";
+		vreg_l2f1: ldo2 {
+			regulator-name = "vreg_l2f1";
 			regulator-min-microvolt = <832000>;
 			regulator-max-microvolt = <832000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4f_e1_1p08: ldo4 {
-			regulator-name = "vreg_l4f_e1_1p08";
+		vreg_l4f1: ldo4 {
+			regulator-name = "vreg_l4f1";
 			regulator-min-microvolt = <1080000>;
 			regulator-max-microvolt = <1320000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -385,29 +385,29 @@ regulators-4 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "H_E0";
 
-		vreg_l1h_e0_0p89: ldo1 {
-			regulator-name = "vreg_l1h_e0_0p89";
+		vreg_l1h0: ldo1 {
+			regulator-name = "vreg_l1h0";
 			regulator-min-microvolt = <832000>;
 			regulator-max-microvolt = <832000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2h_e0_0p72: ldo2 {
-			regulator-name = "vreg_l2h_e0_0p72";
+		vreg_l2h0: ldo2 {
+			regulator-name = "vreg_l2h0";
 			regulator-min-microvolt = <832000>;
 			regulator-max-microvolt = <832000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3h_e0_0p32: ldo3 {
-			regulator-name = "vreg_l3h_e0_0p32";
+		vreg_l3h0: ldo3 {
+			regulator-name = "vreg_l3h0";
 			regulator-min-microvolt = <320000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4h_e0_1p2: ldo4 {
-			regulator-name = "vreg_l4h_e0_1p2";
+		vreg_l4h0: ldo4 {
+			regulator-name = "vreg_l4h0";
 			regulator-min-microvolt = <1080000>;
 			regulator-max-microvolt = <1320000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -438,8 +438,8 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-phy-supply = <&vreg_l1c1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -474,8 +474,8 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-phy-supply = <&vreg_l2f0>;
+	vdda-pll-supply = <&vreg_l4h0>;
 
 	status = "okay";
 };
@@ -495,8 +495,8 @@ &pcie6 {
 };
 
 &pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-phy-supply = <&vreg_l1c1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 17e40f2a6259..51708954f17a 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -21,22 +21,22 @@ / {
 };
 
 &pcie3b_phy {
-	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
-	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+	vdda-phy-supply = <&vreg_l3c1>;
+	vdda-pll-supply = <&vreg_l2c1>;
 };
 
 &tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
-	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
-	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f1>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h0>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h0>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h0>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f1>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f1>;
 };
diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..860e9ef01aa6 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -332,11 +332,11 @@ wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
 		vdd-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_l15b_e0_1p8>;
-		vddaon-supply = <&vreg_l15b_e0_1p8>;
-		vdddig-supply = <&vreg_l15b_e0_1p8>;
-		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
-		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
+		vddio-supply = <&vreg_l15b0>;
+		vddaon-supply = <&vreg_l15b0>;
+		vdddig-supply = <&vreg_l15b0>;
+		vddrfa1p2-supply = <&vreg_l15b0>;
+		vddrfa1p8-supply = <&vreg_l15b0>;
 
 		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
 		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
@@ -407,79 +407,79 @@ vreg_bob2_e0: bob2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
 		};
 
-		vreg_l1b_e0_1p8: ldo1 {
-			regulator-name = "vreg_l1b_e0_1p8";
+		vreg_l1b0: ldo1 {
+			regulator-name = "vreg_l1b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2b_e0_2p9: ldo2 {
-			regulator-name = "vreg_l2b_e0_2p9";
+		vreg_l2b0: ldo2 {
+			regulator-name = "vreg_l2b0";
 			regulator-min-microvolt = <2904000>;
 			regulator-max-microvolt = <2904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l7b_e0_2p79: ldo7 {
-			regulator-name = "vreg_l7b_e0_2p79";
+		vreg_l7b0: ldo7 {
+			regulator-name = "vreg_l7b0";
 			regulator-min-microvolt = <2790000>;
 			regulator-max-microvolt = <2792000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l8b_e0_3p3: ldo8 {
-			regulator-name = "vreg_l8b_e0_3p3";
+		vreg_l8b0: ldo8 {
+			regulator-name = "vreg_l8b0";
 			regulator-min-microvolt = <1504000>;
 			regulator-max-microvolt = <3304000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l9b_e0_2p9: ldo9 {
-			regulator-name = "vreg_l9b_e0_2p9";
+		vreg_l9b0: ldo9 {
+			regulator-name = "vreg_l9b0";
 			regulator-min-microvolt = <2704000>;
 			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l10b_e0_1p8: ldo10 {
-			regulator-name = "vreg_l10b_e0_1p8";
+		vreg_l10b0: ldo10 {
+			regulator-name = "vreg_l10b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l11b_e0_1p2: ldo11 {
-			regulator-name = "vreg_l11b_e0_1p2";
+		vreg_l11b0: ldo11 {
+			regulator-name = "vreg_l11b0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l12b_e0_1p2: ldo12 {
-			regulator-name = "vreg_l12b_e0_1p2";
+		vreg_l12b0: ldo12 {
+			regulator-name = "vreg_l12b0";
 			regulator-min-microvolt = <1144000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l15b_e0_1p8: ldo15 {
-			regulator-name = "vreg_l15b_e0_1p8";
+		vreg_l15b0: ldo15 {
+			regulator-name = "vreg_l15b0";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-always-on;
 		};
 
-		vreg_l17b_e0_2p4: ldo17 {
-			regulator-name = "vreg_l17b_e0_2p4";
+		vreg_l17b0: ldo17 {
+			regulator-name = "vreg_l17b0";
 			regulator-min-microvolt = <2400000>;
 			regulator-max-microvolt = <2700000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l18b_e0_1p2: ldo18 {
-			regulator-name = "vreg_l18b_e0_1p2";
+		vreg_l18b0: ldo18 {
+			regulator-name = "vreg_l18b0";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -491,29 +491,29 @@ regulators-1 {
 		compatible = "qcom,pmcx0102-rpmh-regulators";
 		qcom,pmic-id = "C_E1";
 
-		vreg_l1c_e1_0p82: ldo1 {
-			regulator-name = "vreg_l1c_e1_0p82";
+		vreg_l1c1: ldo1 {
+			regulator-name = "vreg_l1c1";
 			regulator-min-microvolt = <832000>;
 			regulator-max-microvolt = <832000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2c_e1_1p14: ldo2 {
-			regulator-name = "vreg_l2c_e1_1p14";
+		vreg_l2c1: ldo2 {
+			regulator-name = "vreg_l2c1";
 			regulator-min-microvolt = <1144000>;
 			regulator-max-microvolt = <1144000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3c_e1_0p89: ldo3 {
-			regulator-name = "vreg_l3c_e1_0p89";
+		vreg_l3c1: ldo3 {
+			regulator-name = "vreg_l3c1";
 			regulator-min-microvolt = <890000>;
 			regulator-max-microvolt = <980000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4c_e1_0p72: ldo4 {
-			regulator-name = "vreg_l4c_e1_0p72";
+		vreg_l4c1: ldo4 {
+			regulator-name = "vreg_l4c1";
 			regulator-min-microvolt = <720000>;
 			regulator-max-microvolt = <720000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -524,43 +524,43 @@ regulators-2 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "F_E0";
 
-		vreg_s7f_e0_1p32: smps7 {
-			regulator-name = "vreg_s7f_e0_1p32";
+		vreg_s7f0: smps7 {
+			regulator-name = "vreg_s7f0";
 			regulator-min-microvolt = <1320000>;
 			regulator-max-microvolt = <1352000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_s8f_e0_0p95: smps8 {
-			regulator-name = "vreg_s8f_e0_0p95";
+		vreg_s8f0: smps8 {
+			regulator-name = "vreg_s8f0";
 			regulator-min-microvolt = <952000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_s9f_e0_1p9: smps9 {
-			regulator-name = "vreg_s9f_e0_1p9";
+		vreg_s9f0: smps9 {
+			regulator-name = "vreg_s9f0";
 			regulator-min-microvolt = <1900000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2f_e0_0p94: ldo2 {
-			regulator-name = "vreg_l2f_e0_0p94";
+		vreg_l2f0: ldo2 {
+			regulator-name = "vreg_l2f0";
 			regulator-min-microvolt = <936000>;
 			regulator-max-microvolt = <936000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3f_e0_0p91: ldo3 {
-			regulator-name = "vreg_l3f_e0_0p91";
+		vreg_l3f0: ldo3 {
+			regulator-name = "vreg_l3f0";
 			regulator-min-microvolt = <912000>;
 			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4f_e0_0p3: ldo4 {
-			regulator-name = "vreg_l4f_e0_0p3";
+		vreg_l4f0: ldo4 {
+			regulator-name = "vreg_l4f0";
 			regulator-min-microvolt = <1080000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -571,29 +571,29 @@ regulators-3 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "F_E1";
 
-		vreg_s7f_e1_0p3: smps7 {
-			regulator-name = "vreg_s7f_e1_0p3";
+		vreg_s7f1: smps7 {
+			regulator-name = "vreg_s7f1";
 			regulator-min-microvolt = <300000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l1f_e1_0p88: ldo1 {
-			regulator-name = "vreg_l1f_e1_0p88";
+		vreg_l1f1: ldo1 {
+			regulator-name = "vreg_l1f1";
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2f_e1_0p9: ldo2 {
-			regulator-name = "vreg_l2f_e1_0p9";
+		vreg_l2f1: ldo2 {
+			regulator-name = "vreg_l2f1";
 			regulator-min-microvolt = <904000>;
 			regulator-max-microvolt = <904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4f_e1_1p2: ldo4 {
-			regulator-name = "vreg_l4f_e1_1p2";
+		vreg_l4f1: ldo4 {
+			regulator-name = "vreg_l4f1";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -604,29 +604,29 @@ regulators-4 {
 		compatible = "qcom,pmh0110-rpmh-regulators";
 		qcom,pmic-id = "H_E0";
 
-		vreg_l1h_e0_0p94: ldo1 {
-			regulator-name = "vreg_l1h_e0_0p94";
+		vreg_l1h0: ldo1 {
+			regulator-name = "vreg_l1h0";
 			regulator-min-microvolt = <936000>;
 			regulator-max-microvolt = <936000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2h_e0_0p72: ldo2 {
-			regulator-name = "vreg_l2h_e0_0p72";
+		vreg_l2h0: ldo2 {
+			regulator-name = "vreg_l2h0";
 			regulator-min-microvolt = <832000>;
 			regulator-max-microvolt = <832000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l3h_e0_0p32: ldo3 {
-			regulator-name = "vreg_l3h_e0_0p32";
+		vreg_l3h0: ldo3 {
+			regulator-name = "vreg_l3h0";
 			regulator-min-microvolt = <320000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4h_e0_1p2: ldo4 {
-			regulator-name = "vreg_l4h_e0_1p2";
+		vreg_l4h0: ldo4 {
+			regulator-name = "vreg_l4h0";
 			regulator-min-microvolt = <1080000>;
 			regulator-max-microvolt = <1320000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -656,7 +656,7 @@ touchpad@2c {
 		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 
 		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
+		vddl-supply = <&vreg_l15b0>;
 
 		pinctrl-0 = <&tpad_default>;
 		pinctrl-names = "default";
@@ -672,7 +672,7 @@ keyboard@3a {
 		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
 
 		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
+		vddl-supply = <&vreg_l15b0>;
 
 		pinctrl-0 = <&kybd_default>;
 		pinctrl-names = "default";
@@ -692,8 +692,8 @@ ptn3222_0: redriver@43 {
 
 		reset-gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
 
-		vdd3v3-supply = <&vreg_l8b_e0_3p3>;
-		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+		vdd3v3-supply = <&vreg_l8b0>;
+		vdd1v8-supply = <&vreg_l15b0>;
 
 		#phy-cells = <0>;
 	};
@@ -704,8 +704,8 @@ ptn3222_1: redriver@4b {
 
 		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
 
-		vdd3v3-supply = <&vreg_l8b_e0_3p3>;
-		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+		vdd3v3-supply = <&vreg_l8b0>;
+		vdd1v8-supply = <&vreg_l15b0>;
 
 		#phy-cells = <0>;
 	};
@@ -716,8 +716,8 @@ ptn3222_cam: redriver@47 {
 
 		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
 
-		vdd3v3-supply = <&vreg_l8b_e0_3p3>;
-		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+		vdd3v3-supply = <&vreg_l8b0>;
+		vdd1v8-supply = <&vreg_l15b0>;
 
 		#phy-cells = <0>;
 	};
@@ -728,8 +728,8 @@ ptn3222_fpr: redriver@4f {
 
 		reset-gpios = <&tlmm 40 GPIO_ACTIVE_LOW>;
 
-		vdd3v3-supply = <&vreg_l8b_e0_3p3>;
-		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+		vdd3v3-supply = <&vreg_l8b0>;
+		vdd1v8-supply = <&vreg_l15b0>;
 
 		#phy-cells = <0>;
 	};
@@ -739,7 +739,7 @@ &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
 	qcom,dmic-sample-rate = <4800000>;
-	vdd-micb-supply = <&vreg_l1b_e0_1p8>;
+	vdd-micb-supply = <&vreg_l1b0>;
 };
 
 &mdss {
@@ -796,8 +796,8 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f_e1_0p9>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-phy-supply = <&vreg_l2f1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -811,8 +811,8 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-phy-supply = <&vreg_l1c1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -848,8 +848,8 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f_e0_0p94>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-phy-supply = <&vreg_l2f0>;
+	vdda-pll-supply = <&vreg_l4h0>;
 
 	status = "okay";
 };
@@ -870,8 +870,8 @@ &pcie6 {
 };
 
 &pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-phy-supply = <&vreg_l1c1>;
+	vdda-pll-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -930,8 +930,8 @@ left_spkr: speaker@0,0 {
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "SpkrLeft";
-		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
-		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <1 2 3 7 12 14>;
 	};
 
@@ -942,42 +942,42 @@ right_spkr: speaker@0,1 {
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "SpkrRight";
-		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
-		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
 		qcom,port-mapping = <4 5 6 7 13 15>;
 	};
 };
 
 &smb2370_j_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0_1p8>;
-	vdd3-supply = <&vreg_l7b_e0_2p79>;
+	vdd18-supply = <&vreg_l15b0>;
+	vdd3-supply = <&vreg_l7b0>;
 };
 
 &smb2370_k_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0_1p8>;
-	vdd3-supply = <&vreg_l7b_e0_2p79>;
+	vdd18-supply = <&vreg_l15b0>;
+	vdd3-supply = <&vreg_l7b0>;
 };
 
 &tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p9>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p9>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p9>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p9>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p9>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p9>;
-	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p91>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p91>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p88>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p94>;
-	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p88>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p2>;
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h0>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h0>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h0>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h0>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h0>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f0>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f0>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h0>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f0>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h0>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f1>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f1>;
 };
 
 &tlmm {
@@ -1149,8 +1149,8 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_hsphy {
-	vdd-supply = <&vreg_l3f_e0_0p91>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l3f0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	phys = <&smb2370_j_e2_eusb2_repeater>;
 
@@ -1158,9 +1158,9 @@ &usb_0_hsphy {
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l3f_e0_0p91>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-	refgen-supply = <&vreg_l2f_e0_0p94>;
+	vdda-phy-supply = <&vreg_l3f0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l2f0>;
 
 	status = "okay";
 };
@@ -1178,8 +1178,8 @@ &usb_1_dwc3_hs {
 };
 
 &usb_1_hsphy {
-	vdd-supply = <&vreg_l3f_e0_0p91>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l3f0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	phys = <&smb2370_k_e2_eusb2_repeater>;
 
@@ -1187,9 +1187,9 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l1h_e0_0p94>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-	refgen-supply = <&vreg_l2f_e0_0p94>;
+	vdda-phy-supply = <&vreg_l1h0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l2f0>;
 
 	status = "okay";
 };
@@ -1203,8 +1203,8 @@ &usb_mp {
 };
 
 &usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l2h0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	phys = <&ptn3222_0>;
 
@@ -1212,8 +1212,8 @@ &usb_mp_hsphy0 {
 };
 
 &usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l2h0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	phys = <&ptn3222_1>;
 //USB-A..
@@ -1221,17 +1221,17 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l2h_e0_0p72>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-	refgen-supply = <&vreg_l4f_e1_1p2>;
+	vdda-phy-supply = <&vreg_l2h0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l2h_e0_0p72>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-	refgen-supply = <&vreg_l4f_e1_1p2>;
+	vdda-phy-supply = <&vreg_l2h0>;
+	vdda-pll-supply = <&vreg_l4h0>;
+	refgen-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
@@ -1243,8 +1243,8 @@ &usb_hs {
 };
 
 &usb_hs_phy {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
+	vdd-supply = <&vreg_l2h0>;
+	vdda12-supply = <&vreg_l4h0>;
 
 	phys = <&ptn3222_cam>;
 
@@ -1263,8 +1263,8 @@ &usb_2 {
 };
 
 &usb_2_hsphy {
-	vdd-supply = <&vreg_l4c_e1_0p72>;
-	vdda12-supply = <&vreg_l4f_e1_1p2>;
+	vdd-supply = <&vreg_l4c1>;
+	vdda12-supply = <&vreg_l4f1>;
 
 	phys = <&ptn3222_fpr>;
 
diff --git a/arch/arm64/boot/dts/qcom/mahua-qcb.dts b/arch/arm64/boot/dts/qcom/mahua-qcb.dts
index 0c742c54a237..384cd03cda36 100644
--- a/arch/arm64/boot/dts/qcom/mahua-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-qcb.dts
@@ -22,17 +22,17 @@ / {
 };
 
 &tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
-	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
-	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f1>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h0>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h0>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h0>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f1>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f1>;
 };

-- 
2.56.0

