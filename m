Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99604582BBB;
	Fri, 16 Oct 2026 17:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172315; cv=none; b=bEDVLvNHY/VWFyO4Pg2/seESA6udejcaiw5FrWq29ItuRaXp7i96HCOqtvrf+IQJcWuTshbLUvDLS8xEN5r0YSMTLQh3fqZYMqgUCTOEUjIxNN0Ek8nUuWxz6qTpkXJ4CquJKzVUcpYqi5wQPFX+AeZfzOKd2e4zLTIEyeyXjbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172315; c=relaxed/simple;
	bh=2wmyt6rVSWl22ZHZPzsnVNpr0vOFmeQZJ4Xx5hFi8Q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=khWDvLxwfr6cNuBN0No1dTxStFR0fitJPvQcs3P8Qs9Ekvzifyc5NYj5/OcCMIjig0HZu2xp90Vxh02rd9D4id0pjkggWSHrKNOwUsVDxfHBBe7qvUppR1AIzcnen4bl2JWm3ZP01HnZaYG05gIftI8xGgLG096tbIoAECN+Eds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7fgPRfJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7fgPRfJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D07CC4AF0C;
	Fri, 16 Oct 2026 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792172315;
	bh=2wmyt6rVSWl22ZHZPzsnVNpr0vOFmeQZJ4Xx5hFi8Q8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u7fgPRfJys1Ugyr3HPDT6W94mt0SyPznYpUUXygTmSXJqnWrXW7Eue3kqSKgK7tvH
	 EwLi4+JHOcQvWlI42FfrFL7M4aG/oR+uTp83Y+Hyums6tPk+tNUzLmtVujRZ90ZlGl
	 jrZgUL8G+hlMTUTNCsrtaC6jT22PWcVepEawjplk3nOtYfTKp+BQK7e1N4lLJ8WLPP
	 nibYB0hGRDGbtZEm+4QMzwx12UeOyaCFxWq/53J4RpiL24w1Th2DChczI99wJg3Fs3
	 fy7+S4qGMB55j2CoXWdlnyXQYj9ri76sOlKCa3BWqvFM6Wl331IGx3TL5Q4CKE2dm6
	 sbp5tddYhpIQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA36CC6B38;
	Fri, 16 Oct 2026 17:38:35 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 16 Oct 2026 19:38:35 +0200
Subject: [PATCH v6 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for second rear camera
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dw9714v-v6-3-ae730c77bfb1@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2625; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=8WfzFF7dr+OowmKfQ8hjpQk9mPH0Ypxx7JTqVv2IOQg=;
 b=owEBbAKT/ZANAwAIAWACP8TTSSByAcsmYgBq0mEZGoJCZjz1Ja6VImqWFkLPMQVjwaW6C+Wcy
 aNHl0NfL9uJAjIEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCatJhGQAKCRBgAj/E00kg
 ct/LD/jbXI7/0+x7fzNB+8fkeJgFz/vl6rdAzFaxeMtgXHZhsVrKo0NXnow1qyx1yRugafD3Lb6
 aJp9+THO5M9GIiQVIkb2Rp8AHQnrkC4/R4RZVsiI1kS4/xcLIrpOZk1dfwVJqyqVbd1GI0HhBC2
 9Ra4XXUtJ3OaLJrOsnlYVy9B06XlCGWi8WkMkB9rC9tZmUDRwkSyi8uB40ZqFCOg3UvHQMNcSLj
 Ik0UWv9eKoKyJ5feYkZG4eImLbtb04frisxQ/ms1aWfmoHbwNp2lroXHseiCTCjT9sG69KoFa2O
 getEMNY7NsVbwedp1xIuWR++8wBF257DeuXkEc1hObu2RPisoRtzpoeqzMBNl4M8KN3mYA81Qpc
 EyYbxDe+pSqt92TwDNReWj41tbBI2ZTzDMSfFFaA+5pMf8F+prXe1MB5sKAVaKgeZA4F4RCM523
 oHZBBiGuSm7BhYq5VDhZSFI7S9uoOUuoTOCIIk5wA+lD2B+C060R1KA/zPwGabxQ/pirU3Ya8cH
 pjgy0UVinj7AFef2I3qlSHL4vhRxhqMvxCNWwq4vlduBQDw/uvOCFUDC8tJ2OloAJgt6tALs2Yy
 +FVkE7tTV6s6RmzBa1svxoLPdLY7p/V1WM6mbv/8AjjTZXJ7o5ZnUh8xrmSjT7vlhh34JLsY2qb
 FGIQHoHZO6Ykm
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The SHIFT 6MQ has a second rear (auxiliary) camera. Its autofocus
actuator is a Dongwoon DW9714V.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index f14fe8e175e96..3cfc11127f5e1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -99,16 +99,34 @@ cam_main_af_2p8: regulator-cam-main-af-2p8 {
 		enable-active-high;
 
 		pinctrl-0 = <&cam_main_af_default_state>;
 		pinctrl-names = "default";
 
 		vin-supply = <&vreg_bob>;
 	};
 
+	/* SGM2036-2.8YUDH4G/TR */
+	cam_rear2_af_2p8: regulator-cam-rear2-af-2p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "cam_rear2_af_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-enable-ramp-delay = <100>;
+
+		gpio = <&tlmm 76 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_rear2_af_default_state>;
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
@@ -484,16 +502,30 @@ camera-lens@c {
 			     "dongwoon,dw9714a",
 			     "dongwoon,dw9714";
 		reg = <0x0c>;
 
 		vcc-supply = <&cam_main_af_2p8>;
 	};
 };
 
+&cci_i2c1 {
+	/* samsung,s5k2x7sp @ 10 */
+
+	/* 2nd rear camera actuator */
+	camera-lens@c {
+		compatible = "dongwoon,dw9714v",
+			     "dongwoon,dw9714a",
+			     "dongwoon,dw9714";
+		reg = <0x0c>;
+
+		vcc-supply = <&cam_rear2_af_2p8>;
+	};
+};
+
 &cdsp_pas {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/cdsp.mbn";
 
 	status = "okay";
 };
 
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
@@ -749,16 +781,23 @@ &tlmm {
 
 	cam_main_af_default_state: cam-main-af-default-state {
 		pins = "gpio8";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
 	};
 
+	cam_rear2_af_default_state: cam-rear2-af-default-state {
+		pins = "gpio76";
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


