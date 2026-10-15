Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46AF463B6A;
	Thu, 15 Oct 2026 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055028; cv=none; b=ZFoD1upM7FRyo9kpLYcq3JKdB6UKn/tQ/Ve6FionpxOxtc94lNiy9XuEcLdlbyqjECYU1wpf3qhPzLwO8O9Br+SRUhylLJlkSfYjks8KZQnN3cm3bvKdbADjuWKOLysXOf8aJntUSAQQMOBpvc0lS49q9rTvBPMBULEObC7vlwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055028; c=relaxed/simple;
	bh=u3d03v9fCgN22j/TBAslrKnyYtTdXVEzgV2jKzoID/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gWwT3Vqvwxqi/M02pMVXEeUneS/viRKqx2/lHAKVmPtMCbYoKgMLFFpNeYPpvt/pHO3REnpb4nK78MWdityarpJWjAyUEijITDRWPCeaIwrKg8feuwq78/H6dZfFGdj24gQWvoUICAab4KGGom6IhukuZmcEI2LWwu1CRj/mDmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=RPPb4kuW; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="RPPb4kuW"
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792054683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ee/MLol4NK2hl3Se8DbyRCXa07uWqYspIqT1UMrvJ2k=;
	b=RPPb4kuWFN63xs0/UTbC0zMrXKqyC3pT4uZenmVussYOtOS1lovQofC+vDUE2118wKLuUy
	5La9DEJyD8TDR4TJ6rViQwm991SHxSEq836nfy7n5xFvtMkDrrYQrHzlcsjdPn9W9vmLsa
	MfFEofXMSWuwe6SV3sD2w+XvYh2N6VQ=
Date: Thu, 15 Oct 2026 10:57:27 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: oneplus-kebab: new device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-kebab_dts-v1-2-1fee1204a18b@fhannenheim.net>
References: <20261015-kebab_dts-v1-0-1fee1204a18b@fhannenheim.net>
In-Reply-To: <20261015-kebab_dts-v1-0-1fee1204a18b@fhannenheim.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4049; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=u3d03v9fCgN22j/TBAslrKnyYtTdXVEzgV2jKzoID/k=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFkXpk6SfuS1el2Kyd9Cr6xVK1Y1x57MbGicLO9pXHrKb
 kOO65a7HaUsDGJcDLJiiizO0yV/2FcK6+iH/1OEmcPKBDKEgYtTACbSGsXwP1fQ6LV/utuEpTHF
 e4XX3L4l2HdY4tCsd3quqXdkgpymmTP89/Tnf7UyojBpxrpuxvX6rkInv76t0M5SLLb1Vzt+i3c
 SFwA=
X-Developer-Key: i=git@fhannenheim.net; a=openpgp;
 fpr=439719F83F79132C2F57FE216C0173C8B7931E53

Add initial device-tree for the OnePlus 8T. Downstream reference is [1].

[1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts

Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                 |   1 +
 arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts | 124 ++++++++++++++++++++++
 2 files changed, 125 insertions(+)

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
index 000000000000..3e9802db1464
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "sm8250-oneplus-common.dtsi"
+
+/ {
+	model = "OnePlus 8T";
+	compatible = "oneplus,kebab", "qcom,sm8250", "qcom,kona";
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
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8008 0 0 2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		#thermal-sensor-cells = <0>;
+
+		pinctrl {
+			gpio-keys-state {
+				pins = "gpio1";
+				function = "normal";
+			};
+		};
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
+};
+
+&vreg_f {
+	status = "disabled";
+};

-- 
2.54.0

