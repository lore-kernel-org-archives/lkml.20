Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02193C1984;
	Sat, 17 Oct 2026 15:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792249993; cv=none; b=TGGWR4JeLIPdovXeB/XGIODdW5WDueFBYxvfvZ24cbi7k/f9LU5J3YtrLD60YZf6IBytcBv0FEV+z/dWGIg/EeuXhvkFgPF/zifx6CClVirgkUf0Ehz0uDDRswATt8QJYg/HwHztEZS7oOPF9pH7Krnn3TjK2pVX0d/igPEX7Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792249993; c=relaxed/simple;
	bh=UeE8AiUU3F5U3FcH/+DQfJJbRSFzMM4NQ9c26KmcCHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5RjlNpCDiTrX6Dh+0FTRzLGxXklBRVv6IyzyfzSQkDMzPi1SnuXuTM6Lkwpvdof2xjjdRucueN895SX3RN30mkQvVPT1W4g3laZz0740wgPTxnmYlQyGl2ZTHplnmISwn2uPNIcBTJlULxmcltP9WC2ggv+rZ6qm1buxrTiUvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=6/vh6QPR; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="6/vh6QPR"
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792249989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dHJzDgjL0J/ZGWFINHJZuf+/9RhUE+Dm0Xf+8rk6Cc8=;
	b=6/vh6QPRb0q0S0waiChiLEUIng73c+ca1bh/VeYzMTgvzNREaZFMVwY8rK6hKH/8ANcwZJ
	WMMeWideAYFxtjmWOsDBpgk+qPc/oiMkgiztTyeb+44YGDr2WC7HKHDX1u9cGDGa7qXegL
	qcuPRCSly7SJXv/b3UJFcnfFw1bW+30=
Date: Sat, 17 Oct 2026 17:12:36 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: oneplus-kebab: new device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-kebab_dts-v3-3-5fc3ca52a383@fhannenheim.net>
References: <20261017-kebab_dts-v3-0-5fc3ca52a383@fhannenheim.net>
In-Reply-To: <20261017-kebab_dts-v3-0-5fc3ca52a383@fhannenheim.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4157; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=UeE8AiUU3F5U3FcH/+DQfJJbRSFzMM4NQ9c26KmcCHE=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFmXJ9S98r26sszk6IyY53e8Px3/tkd8U4SD3HRJr04pl
 ddzNK7ydpSyMIhxMciKKbI4T5f8YV8prKMf/k8RZg4rE8gQBi5OAZjI0bkM/5SNfkz0l8y+dsXE
 ekqvkcHLbTnnQxIKr/x47bt3RkHGPE2Gf9rzPK6prbtgp+i6QenYRoGPr8MDTj76kPrnhMXJT6u
 6mtkA
X-Developer-Key: i=git@fhannenheim.net; a=openpgp;
 fpr=439719F83F79132C2F57FE216C0173C8B7931E53

Add initial device-tree for the OnePlus 8T. Downstream reference is [1].

[1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts

Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                 |   1 +
 arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts | 130 ++++++++++++++++++++++
 2 files changed, 131 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..d8292f681e71 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -356,6 +356,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-bahamut.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-griffin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-oneplus-kebab.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-samsung-r8q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-samsung-x1q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts b/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts
new file mode 100644
index 000000000000..1bd3734a74e9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "sm8250-oneplus-common.dtsi"
+
+/ {
+	model = "OnePlus 8T";
+	compatible = "oneplus,kebab", "qcom,sm8250";
+};
+
+&battery {
+	charge-full-design-microamp-hours = <4500000>;
+	energy-full-design-microwatt-hours = <19575000>;
+	voltage-max-design-microvolt = <4350000>;
+};
+
+&framebuffer {
+	width = <1080>;
+	height = <2400>;
+	stride = <(1080 * 4)>;
+};
+
+&i2c2 {
+	status = "okay";
+
+	pm8008: pmic@8 {
+		compatible = "qcom,pm8008";
+		reg = <0x8>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <112 IRQ_TYPE_EDGE_RISING>;
+
+		reset-gpios = <&tlmm 93 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&vreg_s8c_1p3>;
+		vdd-l3-l4-supply = <&vreg_bob>;
+		vdd-l5-supply = <&vreg_bob>;
+		vdd-l6-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_bob>;
+
+		pinctrl-0 = <&pm8008_default>;
+		pinctrl-names = "default";
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8008 0 0 2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		#thermal-sensor-cells = <0>;
+
+		regulators {
+			ldo1 {
+				regulator-name = "vreg_l1p";
+				regulator-min-microvolt = <528000>;
+				regulator-max-microvolt = <1504000>;
+			};
+
+			ldo2 {
+				regulator-name = "vreg_l2p";
+				regulator-min-microvolt = <528000>;
+				regulator-max-microvolt = <1300000>;
+			};
+
+			ldo3 {
+				regulator-name = "vreg_l3p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			ldo4 {
+				regulator-name = "vreg_l4p";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			ldo5 {
+				regulator-name = "vreg_l5p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			ldo6 {
+				regulator-name = "vreg_l6p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			ldo7 {
+				regulator-name = "vreg_l7p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
+	};
+};
+
+&i2c16 {
+	status = "okay";
+
+	fuel-gauge@55 {
+		compatible = "ti,bq28z610";
+		reg = <0x55>;
+		monitored-battery = <&battery>;
+	};
+};
+
+&tlmm {
+	pm8008_default: pm8008-default-state {
+		int-pins {
+			pins = "gpio112";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		reset-n-pins {
+			pins = "gpio93";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+};
+
+&vreg_f {
+	status = "disabled";
+};

-- 
2.54.0

