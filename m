Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957383;
	b=zo7yT81PwVBdEVsyATIoOmnHIIURzwM8mAEh/KufTP8Gwdehh3Te1cXaT1CdGxqOHXmL
	 Q4zBwKwu964PK8bLkcGhF86uX/5Jb2G9F2UMFty30/Skbeg9jx1vFovC9TnHQTk5mXudC
	 aX4gRkyUfYjatNS8b7BJMxcjERBtupki9P/cvC3NP2+bJrrtVzoULRVgRSt8DwzUMGJJa
	 W9P9MgeyVbv8oUwVAAKdtx8bFQ7/xWaOSjGuPKR0shMlg2AGHvZYmUI0mhkU3o4YvC1yB
	 7wFDk1rhBJnP6Qw83j22Ah/000QkgnGH1PkNIbohtfaHXTNou290cgFqDCsQG8rzCiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957383;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ybL1+EWOXeKj6CTb1tBIbfnzvSUjlgWfwtN6yNCqSOI=;
	b=Elgx2fu6ikabIA37h05cU9dlDfAkIEy0Rmm0sjL4IfAGBK2DkZ5OUlHUeoBxnxE2Cso3
	 ekAOtNjuTcGJBv2kBYbQkWZnbQQPgNxwyhbE/PeuXgyYpnVua5PSZwWYNomQXppVNlU+g
	 M1lwh6mCo7Ws1HC3YLnjZ+rESgAQwwXEySR0TMBt5FSWuPksf/xEfQwqX6jhhTJU7DoWq
	 vF5cri7A74FPDk870k8Eq9zdc8MdeHgRTjUespexYep2Drxr/VjL28tUm3Cf2YULvtEDQ
	 vN9VhhDHC0zq+TCoTi4V+2+TSfX1SJb73m3OglWu0xoG0RcRFb5Yxq3OTzT0aQXGzMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NkByeYQW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4422E606D806;
	Fri,  6 Nov 2026 09:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NkByeYQW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A001F008BE;
	Fri,  6 Nov 2026 09:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957382;
	bh=ybL1+EWOXeKj6CTb1tBIbfnzvSUjlgWfwtN6yNCqSOI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NkByeYQWmYTRmx8hpTdY1Sh/65XpUK3awcKK61WZDSwVMVjaPU3n54nQjhjGqYZoo
	 sGppEV4iywjL/EkiFQhx4KFLIkTxwo9sULjdwrZr7Gg2on1WNlSMuliZd31dMc1sd4
	 L0+RnqrMHHtwkKaS6vQFsA1M0E/qXBPJiuz07QL7FuY4ZqYq9WebQP/bS8P+jP40HH
	 nkcTTeRUJnyV22axNY2MPKoU7ZLqpqN7JybpaMbVhIvBk0MZUL3zLuAKc2y/O3VezJ
	 DAIR2kdBCP47wPDxCG4YRzMVzjomYXrlhsf9Bpknf4MXAlSBQ6OUXM4UT+crY9z9ED
	 bJ1Rn37CaUPSg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 06 Nov 2026 10:29:07 +0100
Subject: [PATCH v3 6/8] arm64: dts: qcom: Consolidate Glymur SiP power grid
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
Message-Id: <20261106-topic-sip_cob-v3-6-52cd3826ab49@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793957347; l=21032;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=hDTWniT5/ib1x7LdqEvBc8uo7aG5FG+XqkXHz4iiBUo=;
 b=RlAW+vd2fW6BXyJnWA7Apc9d4TZNx70JvC4WQ1NxZvOz9yxLnigQ05I18pTx/kY+IeyWanRsT
 aU8cki5oq/eCgeI90q121AGyVVLT4G4nNLtd6ZQYMIW9lCYSGSPtQ29
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Much like with CoB, the SiP PMIC configuration is fixed, which makes
the regulators and the supply mappings of the on-SoC peripherals the
same across SiP-based boards. Factor them out of the Zenbook A16 into
glymur-sip.dtsi, so that further SiP boards can reuse them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  | 336 +++------------------
 arch/arm64/boot/dts/qcom/glymur-sip.dtsi           | 304 +++++++++++++++++++
 2 files changed, 351 insertions(+), 289 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index e42e6c43f6a3..51dc49fbd86f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -4,25 +4,13 @@
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
+#include "glymur-sip.dtsi"
 
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
-/delete-node/ &pmh0104_l_e1;
-/delete-node/ &pmh0104_l1_thermal;
-/delete-node/ &pmh0110_h_e0;
-/delete-node/ &pmh0110_h0_thermal;
-
 / {
 	compatible = "asus,zenbook-a16-ux3607oa", "qcom,glymur";
 	model = "ASUS Zenbook A16 (UX3607OA)";
@@ -371,220 +359,63 @@ m2_e_uart_ep: endpoint@0 {
 	};
 };
 
-&apps_rsc {
-	/* PMCX0104 */
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
-		/* Unused */
-		vreg_l2b0: ldo2 {
-			regulator-name = "vreg_l2b0";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		vreg_l6b0: ldo6 {
-			regulator-name = "vreg_l6b0";
-			regulator-min-microvolt = <3304000>;
-			regulator-max-microvolt = <3304000>;
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
-		/* Unused */
-		vreg_l9b0: ldo9 {
-			regulator-name = "vreg_l9b0";
-			regulator-min-microvolt = <2960000>;
-			regulator-max-microvolt = <2960000>;
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
-		/* Unused */
-		vreg_l12b0: ldo12 {
-			regulator-name = "vreg_l12b0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
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
-		/* Unused */
-		vreg_l17b0: ldo17 {
-			regulator-name = "vreg_l17b0";
-			regulator-min-microvolt = <2504000>;
-			regulator-max-microvolt = <2504000>;
-		};
-
-		vreg_l18b0: ldo18 {
-			regulator-name = "vreg_l18b0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-
-			/* Provides reference voltage for many undescribed components */
-			regulator-always-on;
-		};
+&rpmh_vregs_b_e0 {
+	/* Unused */
+	vreg_l2b0: ldo2 {
+		regulator-name = "vreg_l2b0";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
 	};
 
-	regulators-1 {
-		compatible = "qcom,pmcx0102-rpmh-regulators";
-		qcom,pmic-id = "C_E0";
-
-		vreg_l1c0: ldo1 {
-			regulator-name = "vreg_l1c0";
-			regulator-min-microvolt = <936000>;
-			regulator-max-microvolt = <936000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c0: ldo2 {
-			regulator-name = "vreg_l2c0";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4c0: ldo4 {
-			regulator-name = "vreg_l4c0";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	vreg_l6b0: ldo6 {
+		regulator-name = "vreg_l6b0";
+		regulator-min-microvolt = <3304000>;
+		regulator-max-microvolt = <3304000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 
-	/* PMCX0101 */
-	regulators-2 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E0";
-
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
+	vreg_l8b0: ldo8 {
+		regulator-name = "vreg_l8b0";
+		regulator-min-microvolt = <3304000>;
+		regulator-max-microvolt = <3304000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 	};
 
-	regulators-3 {
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
+	/* Unused */
+	vreg_l9b0: ldo9 {
+		regulator-name = "vreg_l9b0";
+		regulator-min-microvolt = <2960000>;
+		regulator-max-microvolt = <2960000>;
 	};
 
-	/* PMCX0101 */
-	regulators-4 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E1";
+	/* Unused */
+	vreg_l12b0: ldo12 {
+		regulator-name = "vreg_l12b0";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
 
-		vreg_l1f1: ldo1 {
-			regulator-name = "vreg_l1f1";
-			regulator-min-microvolt = <904000>;
-			regulator-max-microvolt = <904000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+	/* Unused */
+	vreg_l17b0: ldo17 {
+		regulator-name = "vreg_l17b0";
+		regulator-min-microvolt = <2504000>;
+		regulator-max-microvolt = <2504000>;
+	};
+};
 
-		vreg_l2f1: ldo2 {
-			regulator-name = "vreg_l2f1";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+&rpmh_vregs_f_e0 {
+	vreg_s7f0: smps7 {
+		regulator-name = "vreg_s7f0";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+	};
 
-		vreg_l4f1: ldo4 {
-			regulator-name = "vreg_l4f1";
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
 
@@ -732,8 +563,6 @@ misc_3p3_reg_en: misc-3p3-reg-en-state {
 };
 
 &lpass_vamacro {
-	vdd-micb-supply = <&vreg_l1b0>;
-
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
 
@@ -802,9 +631,6 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -816,9 +642,6 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
@@ -841,9 +664,6 @@ &pcie5 {
 };
 
 &pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f0>;
-	vdda-pll-supply = <&vreg_l4c0>;
-
 	status = "okay";
 };
 
@@ -883,16 +703,6 @@ &remoteproc_soccp {
 			"qcom/glymur/ASUSTeK/UX3607OA/soccp_dtb.mbn";
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
 
@@ -949,26 +759,6 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
-&tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2c0>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2c0>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f1>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2c0>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f0>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4c0>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f0>;
-	vdda-refgen3-1p2-supply = <&vreg_l4c0>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f1>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f1>;
-};
-
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC Secure I3C */
 			       <10 2>, /* OOB UART */
@@ -1151,19 +941,12 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_hsphy {
-	vdd-supply = <&vreg_l3f0>;
-	vdda12-supply = <&vreg_l4c0>;
-
 	phys = <&smb2370_j_e2_eusb2_repeater>;
 
 	status = "okay";
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l3f0>;
-	vdda-pll-supply = <&vreg_l4c0>;
-	refgen-supply = <&vreg_l2f0>;
-
 	status = "okay";
 };
 
@@ -1180,19 +963,12 @@ &usb_1_dwc3_hs {
 };
 
 &usb_1_hsphy {
-	vdd-supply = <&vreg_l3f0>;
-	vdda12-supply = <&vreg_l4c0>;
-
 	phys = <&smb2370_k_e2_eusb2_repeater>;
 
 	status = "okay";
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l1c0>;
-	vdda-pll-supply = <&vreg_l4c0>;
-	refgen-supply = <&vreg_l2f0>;
-
 	status = "okay";
 };
 
@@ -1201,10 +977,6 @@ &usb_1_qmpphy_out {
 };
 
 &usb_2_qmpphy {
-	vdda-phy-supply = <&vreg_l4c1>;
-	vdda-pll-supply = <&vreg_l4f1>;
-	refgen-supply = <&vreg_l4f1>;
-
 	/delete-property/ mode-switch;
 	/delete-property/ orientation-switch;
 
@@ -1233,9 +1005,6 @@ &usb_mp {
 
 /* MP0 (eUSB3 + USBSS3) -> Type-A port */
 &usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2c0>;
-	vdda12-supply = <&vreg_l4c0>;
-
 	phys = <&ptn3222_0>;
 
 	status = "okay";
@@ -1243,26 +1012,15 @@ &usb_mp_hsphy0 {
 
 /* MP1 (eUSB6 + USBSS4) -> RTS5329 SD Card reader */
 &usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2c0>;
-	vdda12-supply = <&vreg_l4c0>;
-
 	phys = <&ptn3222_1>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l2c0>;
-	vdda-pll-supply = <&vreg_l4c0>;
-	refgen-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l2c0>;
-	vdda-pll-supply = <&vreg_l4c0>;
-	refgen-supply = <&vreg_l4f1>;
-
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-sip.dtsi b/arch/arm64/boot/dts/qcom/glymur-sip.dtsi
new file mode 100644
index 000000000000..4acc002a36ee
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/glymur-sip.dtsi
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Common PMIC settings for on-SoC peripherals found on Glymur-SiP and
+ * derived platforms.
+ */
+
+#include "glymur.dtsi"
+#include "pmcx0102.dtsi"
+#include "pmh0101.dtsi"
+#include "pmh0110-glymur.dtsi"
+#include "pmh0104-glymur.dtsi"
+#include "pmk8850.dtsi"
+#include "smb2370.dtsi"
+
+/* Not present on SiP designs */
+/delete-node/ &pmh0104_l_e1;
+/delete-node/ &pmh0104_l1_thermal;
+/delete-node/ &pmh0110_h_e0;
+/delete-node/ &pmh0110_h0_thermal;
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
+	rpmh_vregs_c_e0: regulators-1 {
+		compatible = "qcom,pmcx0102-rpmh-regulators";
+		qcom,pmic-id = "C_E0";
+
+		vreg_l1c0: ldo1 {
+			regulator-name = "vreg_l1c0";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c0: ldo2 {
+			regulator-name = "vreg_l2c0";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c0: ldo4 {
+			regulator-name = "vreg_l4c0";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
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
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f0: ldo3 {
+			regulator-name = "vreg_l3f0";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	rpmh_vregs_c_e1: regulators-3 {
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
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c1: ldo3 {
+			regulator-name = "vreg_l3c1";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
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
+	rpmh_vregs_f_e1: regulators-4 {
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
+	vdda-pll-supply = <&vreg_l4c0>;
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
+&tcsr {
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
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l3f0>;
+	vdda12-supply = <&vreg_l4c0>;
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l3f0>;
+	vdda-pll-supply = <&vreg_l4c0>;
+	refgen-supply = <&vreg_l2f0>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l3f0>;
+	vdda12-supply = <&vreg_l4c0>;
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l1c0>;
+	vdda-pll-supply = <&vreg_l4c0>;
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
+	vdd-supply = <&vreg_l2c0>;
+	vdda12-supply = <&vreg_l4c0>;
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2c0>;
+	vdda12-supply = <&vreg_l4c0>;
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2c0>;
+	vdda12-supply = <&vreg_l4c0>;
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l2c0>;
+	vdda-pll-supply = <&vreg_l4c0>;
+	refgen-supply = <&vreg_l4f1>;
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l2c0>;
+	vdda-pll-supply = <&vreg_l4c0>;
+	refgen-supply = <&vreg_l4f1>;
+};

-- 
2.56.0

