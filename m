Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C63851E444;
	Thu, 15 Oct 2026 12:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067605; cv=none; b=Qg+FM9kirsro7pOdJe/UiSuaynGys9xCUqinyylGyqGuxNdI9Q6j8QGgte2Yfspk7WOqZMRW+YTp5uwM43c6eSO2olgG2Xt63P9qgSFDIGBQ5RE4ArQ5/dL8geteJHoaYt9GQ+nlIzQGOEps0ctQSZ4h66CJ0TcMUSnlPkB/HFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067605; c=relaxed/simple;
	bh=pxOzSUAqer0A8bLEH7oM+xnErw0XhYcFQhsHjbdYtWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/60h4sgg7WSMQZSgANWaE9rzZf8+ZSlDnydXPeptJRgO+Jx6Q1cAcKuJHZmMrf+yT0Se6+5QQtzMQ5vmVwcBQFo5sYgiYj7HnzP+W9h14t64X5KKUDsDG4EwvG6eeX+snwONYv3w4nxCcBzbNiesFVcjFF8fWCzX6McArMOwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=CE8I4Mo8; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="CE8I4Mo8"
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792067601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7zo+rSDQZZ7ena89y9xZ7L+opeVk03ERTqLx76gka0o=;
	b=CE8I4Mo8yM2Lh5wKZJBLSvxGWouoAeTp5739IhtmRzr/NiSyjY480b5pNr6Fs06yn6mjkg
	NUfa+Fr0ElQquiaJvDHGj5EDUIe5BWSWtvfLr3iJcfuHgBpV0OWJFqM+na7RGLEM6Ny3EB
	11R3YERvU0EjvqjS/rszauJ8qD6kkI4=
Date: Thu, 15 Oct 2026 14:32:37 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: oneplus-kebab: new device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-kebab_dts-v2-2-e783463bffd3@fhannenheim.net>
References: <20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net>
In-Reply-To: <20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4766; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=pxOzSUAqer0A8bLEH7oM+xnErw0XhYcFQhsHjbdYtWA=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFkXTnBz72r/7tiV4yLuH/dgW/OMF0v6z79NVPlx/a/4y
 8vpq2/VdJSyMIhxMciKKbI4T5f8YV8prKMf/k8RZg4rE8gQBi5OAZjIVQuGv+IFEQWL5TZIFbB0
 xSxk/D9f5ecK+d+s6u23d895It6Q8ZPhf+DDtjyRjtim+vsZiot+cwjyyG9du2W55e+arL7bbzI
 OMQAA
X-Developer-Key: i=git@fhannenheim.net; a=openpgp;
 fpr=439719F83F79132C2F57FE216C0173C8B7931E53

Add initial device-tree for the OnePlus 8T. Downstream reference is [1].

[1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts

Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml   |   1 +
 arch/arm64/boot/dts/qcom/Makefile                 |   1 +
 arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts | 129 ++++++++++++++++++++++
 3 files changed, 131 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..6e3fdce92798 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1070,6 +1070,7 @@ properties:
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
+              - oneplus,kebab
               - samsung,r8q
               - samsung,x1q
               - sony,pdx203-generic
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
index 000000000000..67996da204c9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts
@@ -0,0 +1,129 @@
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
+		pinctrl-names = "default";
+		pinctrl-0 = <&pm8008_default>, <&pm8008_interrupt>;
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
+		pins = "gpio93";
+		function = "gpio";
+		bias-pull-up;
+		output-high;
+		drive-strength = <2>;
+	};
+
+	pm8008_interrupt: pm8008-interrupt {
+		pins = "gpio112";
+		function = "gpio";
+		bias-disable;
+		input-enable;
+	};
+};
+
+&vreg_f {
+	status = "disabled";
+};

-- 
2.54.0

