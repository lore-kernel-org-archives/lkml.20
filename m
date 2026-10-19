Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA66492E35;
	Mon, 19 Oct 2026 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405129; cv=none; b=XKexkqufuZYjK63a7fW6xN2fCBksJ+XiMbsvc05AumFV9HWDzBRBk3jTbhJelE0+IbrPw6kQeL0xf+8d+ZZYBcNAXxOcJZm6CFhEcv13hdSeCDipM9+Pq1cxP5gA2PSPoEBiBRmarVAgBb6KiiXGG+kLSdEcmH3/VNIYkK1P27U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405129; c=relaxed/simple;
	bh=WM+2uN4tj3rfqTshQCeOOAZq/O2sYFU2zkI9YPkkT10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+oWwCgceTLKcXGtIbeHDMV8f09Wek4v6Z3FSgLEVRP5Xllt6cy+DU50W7jn+oYEoapREZ4iA3ysH5z9SjfTU6w9Jp4UONIl0mDi8tTX1T5iGIggIXj7IzvdwznUDg/Ga2mkWfrB0lKp0bns0nKZpmVgy5EkT/VLuvvbkur+WOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=N/9ec2xF; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="N/9ec2xF"
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792405120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4aJVkUL+9MWIw+ygDMQxSxdzo4M5RL4FENoE8TUqNbI=;
	b=N/9ec2xF4KsEb7tZG2T4vgOR62nfkzaNaJVXHyG34KCWy2LcFNMXSDfsiYDP2saVz55WcT
	uTsvS87jLvv7w6Gto7lVVwtdnn7Kzvfm6Us+kT9tBEh1605NX1sYsftnjctyY3aMp4pIaY
	Bjv2bY7/zrymg/7SWhbZmERMMPBKkqE=
Date: Mon, 19 Oct 2026 12:18:10 +0200
Subject: [PATCH v4 3/3] arm64: dts: qcom: oneplus-kebab: new device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-kebab_dts-v4-3-bb6db87ff15f@fhannenheim.net>
References: <20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net>
In-Reply-To: <20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net>
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
 h=from:subject:message-id; bh=WM+2uN4tj3rfqTshQCeOOAZq/O2sYFU2zkI9YPkkT10=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFlX31XEnJGWfSO9Ueeefly1SMYC4cIXz4/YtTY9ulbAP
 /XunevrO0pZGMS4GGTFFFmcp0v+sK8U1tEP/6cIM4eVCWQIAxenAEwk2ImR4cDaKXU6S1/cnJbB
 uUUs4seRfXNTpyd+b8vT+O32QP/DmskM/9OfVrLv2NU7y1cr3W/9v51vOmOvrejav2h5YKzU28+
 bQtkA
X-Developer-Key: i=git@fhannenheim.net; a=openpgp;
 fpr=439719F83F79132C2F57FE216C0173C8B7931E53

Add initial device-tree for the OnePlus 8T. Downstream reference is [1].

[1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts

Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
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

