Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E1057EDBA;
	Fri, 16 Oct 2026 17:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172315; cv=none; b=MDB1ZoP22jbbA13xo1YJJwrqtfRkg7FiVusn6FbLyQ6R4anhacY8HyEJzm5ik8AsYb7fxKbWQ1m5qIYJASsiXYNWkrYIFzXgiI1JA7uicRsJQK/O0Hq5Vi/WDXiS4tDZCwWxgFeysU+0l1CnRe6SXI2UzrDv2TXprJCub/rBK/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172315; c=relaxed/simple;
	bh=SST6i8CVjKTaAia8CIfeYy9mP5N9R7Q7saeTjawCrIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sf6MgIV8H6JdjZ4J9F/mhAYteV4GIWMe8MvV8+6bLor57rRgQzWAR3fuHG3GV2s5sp+XAwouvxP7pLYkLtMTMp1T/21ZLjPlI3N7ovDCbuSB5aAOv9ZwWwNpnayPb8CbKc+ndpqjNYEpwOTSBoTzflwqenY/RDctx/QIHe9IKfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiOXvUDA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiOXvUDA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B941C2BCFB;
	Fri, 16 Oct 2026 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792172315;
	bh=SST6i8CVjKTaAia8CIfeYy9mP5N9R7Q7saeTjawCrIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OiOXvUDAoiOw6K4mSPdIiVqGRHH3MczlSNdI7tgNO0NAzb29jXXCJF8UeGjE6Klyl
	 khVG6RpRXY2cwSmSf4icA4e6GkBhrvkPmn7HwA/9MSCFDbV+fw4BmfzSuCQv/C/hmn
	 DIrmWPxYkP0qW9kBihBjOrWElik2/3pjNU+/GFVwiclJQ5CobZgo6FQejszWLaBceA
	 G0kew19gJccNFf3sYVCUZUGhf8UHgGOd4ghhjeLmYHxQlFIOp7UgF5QtyBZrcGTaRM
	 ug9eeeodMfaNM0gCw0CaX/pU6sHblSQQgAGSfVo5WtENoXyr95m4i1nHkV8TAbkIPh
	 8Og4Xt0/SYrAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B248CCF2C3;
	Fri, 16 Oct 2026 17:38:35 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 16 Oct 2026 19:38:34 +0200
Subject: [PATCH v6 2/3] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for main rear camera
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dw9714v-v6-2-ae730c77bfb1@ixit.cz>
References: <20261016-dw9714v-v6-0-ae730c77bfb1@ixit.cz>
In-Reply-To: <20261016-dw9714v-v6-0-ae730c77bfb1@ixit.cz>
To: Alexander Martinz <amartinz@shiftphones.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3473; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=gHZ8gqtaNh8wddZIfEMQhnQ9mvQzrc6d6pxFqY4z7/w=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq0mEZR8KIA2XHu+hj4R1zMG2pOMjMdg9MLBG+n
 LMvxUsqfomJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCatJhGQAKCRBgAj/E00kg
 cpzAEADKPImzsEl+9Sj9fTKLGPh81C3D3RxVOoiz45jR5HsMn+eZlBG3cCGGetZYFak0WMX1M3v
 z5u9TEPkwF43IQBsLFQUEMjBMqPlw7VuQf3WAj9N+e9uJGxBkukIW8B8b8v15LX0SF1sgatq3fG
 OqQZJV+AP7v7mmy1C8DzP15TI9HomR3ikBvTSd05tOXMWQppSWmdeLQNxo1G1ydLfNolcyfQnt0
 Q22U8Uooerk+OlUE6Yez6KlOft7tjnJHnWdpiKkVP8YtOdZHWs/zRBAnK0qEgVQ1HHZgGWk6AqR
 s/SaHXr2hpT4Kq1tOJ8ZGr3X73GZaeUCmbsAF8UX2kcqqUdYKlpAKJGOoY9Yq2XFmtwt/H49rS7
 mTbPaqbW1XzvQ5z3bH5EeIwXdmH0eWXNqz2D2FLqqtRoULzZh8i9TITnWaSmScKgH7D/fbtWl1z
 2IVZJ+sC1JkpyGMQyM+9WNHJxr9otPVFizbQtrOTkZKVdpkSksnJNVq0S4jC55H87X3Ufs6C7m/
 3ht2M/qZf2UPbPk3xZsaGlvtn7xYbNkikLIhDwZneLT5RwBO1HGhcH0mU0se2y0IJTY72Za5/UT
 bS34Jvy52dQV1HUkoznTIyfA88+l+9aWSoQw1qJtYqcLcC6wj+UHDI3t4DYIYBIrwzghg+zqVmt
 6llwPDKSEs6ANyw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Main rear camera uses Dongwoon DW9714V actuator. Add regulator and
actuator node.

Since the actuator sits on the CCI I2C bus, whose 1.8V side is fed by
vreg_lvs1a_1p8 and there is no place to describe that, keep it always-on
for now, until bus-supply exists.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 1b0eaeafbd517..f14fe8e175e96 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -81,16 +81,34 @@ ramoops: ramoops@b0000000 {
 	battery: battery {
 		compatible = "simple-battery";
 
 		charge-full-design-microamp-hours = <3850000>;
 		voltage-min-design-microvolt = <3600000>;
 		voltage-max-design-microvolt = <4400000>;
 	};
 
+	/* SGM2036-2.8YUDH4G/TR */
+	cam_main_af_2p8: regulator-cam-main-af-2p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "cam_main_af_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-enable-ramp-delay = <100>;
+
+		gpio = <&tlmm 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_main_af_default_state>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_bob>;
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
 	};
 
 	vreg_s4a_1p8: pm8998-smps4 {
@@ -403,16 +421,23 @@ vreg_l28a_3p0: ldo28 {
 			regulator-min-microvolt = <2856000>;
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_lvs1a_1p8: lvs1 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
+
+			/*
+			 * Supplies the 1.8V side of the CCI I2C level
+			 * shifter; keep enabled until a generic
+			 * bus-supply property exists.
+			 */
+			regulator-always-on;
 		};
 
 		vreg_lvs2a_1p8: lvs2 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
 	};
 
@@ -441,16 +466,34 @@ regulators-2 {
 
 		vreg_s3c_0p6: smps3 {
 			regulator-min-microvolt = <600000>;
 			regulator-max-microvolt = <600000>;
 		};
 	};
 };
 
+&cci {
+	status = "okay";
+};
+
+&cci_i2c0 {
+	/* sony,imx519 @ 1a */
+
+	/* rear camera actuator */
+	camera-lens@c {
+		compatible = "dongwoon,dw9714v",
+			     "dongwoon,dw9714a",
+			     "dongwoon,dw9714";
+		reg = <0x0c>;
+
+		vcc-supply = <&cam_main_af_2p8>;
+	};
+};
+
 &cdsp_pas {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/cdsp.mbn";
 
 	status = "okay";
 };
 
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
@@ -699,16 +742,23 @@ &slpi_pas {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/slpi.mbn";
 
 	status = "okay";
 };
 
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
+	cam_main_af_default_state: cam-main-af-default-state {
+		pins = "gpio8";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	sdc2_default_state: sdc2-default-state {
 		clk-pins {
 			pins = "sdc2_clk";
 			drive-strength = <16>;
 			bias-disable;
 		};
 
 		cmd-pins {

-- 
2.55.0


