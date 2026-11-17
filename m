Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.251.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913136;
	b=j2V5VauGnrCPkAbGzicC1kCx2PcLBU1aNKEv3nAXPqA4YAaStpbSgsvGMPxx3L76JFzx
	 Vox1Eaih4s28LyRsoKWkHnrs56Pt2ugdiAK3tIXylfimqSucSgHNycBo9ZjT7rYeCKuvd
	 x82OhLWNIeL6kzh4knS0JbJw7WY5udbEXxJKrHEK2WtbvzoM3vHcR+zQwNiPq4Wmze0A1
	 sRxKVTwzEsxS3r2vyUO9/wf4XsnKZHewCCXrohmeEF4h7KJdQP8oaq8zndxVITkEGy2ff
	 zSSEKzcUfAAnPosgHgOkl3bmyr61D7Z/dxKfEHVFhklfPPgllq197A5Mi7zwKWnKZKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913136;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=8EDeFjaAa1DoZryu4fek5G/oMoeMhlFQNTV709PTDS0=;
	b=lBR3f2743O2FJZOEe3f9cOkwEUbY9/RRB+Tw8ABWjdwX5Te1wEvjMRQAs9mZz3/J72Us
	 iGsqvIkiikC5p9x7xEEjWzJucmeGeMWQqEGmgv6SownT3/vjBwd+M+AvHWLCI9NjP3wQv
	 +Se+WkRw6/g7Q+BpNEsgtqtkun0Un1mRwafx1rm39tWNWj525ktnhlIeHmryWEthBnHYd
	 CAB78wOJ7uMl8uBoBe1ZpGG7lNCzD3qewbNxnjoVs1UmvhCPRLydo4DyQN5kt1/DhZCyW
	 gY70gwrioRgVR5DcF6TPGVARlByFcvt245cmMa1KZZSdfxW/5Q6dfIYeZmOEyxXglRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fhannenheim.net;
	spf=pass smtp.mailfrom=fhannenheim.net;
	dkim=pass header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=s76HB28j;
	arc=none smtp.remote-ip=188.245.251.181
Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F89D606A329;
	Tue, 17 Nov 2026 10:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F89D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=s76HB28j
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1794913128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EDeFjaAa1DoZryu4fek5G/oMoeMhlFQNTV709PTDS0=;
	b=s76HB28jbXIMFMuoBzhLKEz04EcxFI0uQaCM8cpvBERUcsxDTDc07EVjoOLGWl1KHcI57w
	2sZcOUTmaYVWNbfGaUgQnI7FamgYmJPlGjWZevDEvcdd6InoCUyPIT56Btx8fY+RxD2fxk
	Sx1TJn8QUJqXxArEavAWGZ/CGJ3IkgI=
Date: Tue, 17 Nov 2026 11:57:57 +0100
Subject: [PATCH v5 2/3] arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
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
Message-Id: <20261117-kebab_dts-v5-2-bdee1c9fe351@fhannenheim.net>
References: <20261117-kebab_dts-v5-0-bdee1c9fe351@fhannenheim.net>
In-Reply-To: <20261117-kebab_dts-v5-0-bdee1c9fe351@fhannenheim.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=14220; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=nBubOvBJUdkZr/5WjIVpiOlavEqB4DRIHnZDAmpYdsg=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFl/jL2VIjudNvN3qH59U+rTzDpJu7ujf6/6jcs5KzmMO
 vubpKo7SlkYxLgYZMUUWZynS/6wrxTW0Q//pwgzh5UJZAgDF6cATMR5JiNDl6nB6aAngoGTLJx3
 /7LRll4Xsk4u9/PB2gyGk6ffb3QIYGR4+H9v8mJZI5ZKjmNn7nm//HVP2HmZ4FKpOW9ir8pz7A3
 kBAA=
X-Developer-Key: i=git@fhannenheim.net; a=openpgp;
 fpr=439719F83F79132C2F57FE216C0173C8B7931E53

This file contains common properties shared by all OnePlus devices using
the Qualcomm sm8250 chipset.

Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
---
 .../arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi | 525 +++++++++++++++++++++
 1 file changed, 525 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi
new file mode 100644
index 000000000000..5b81b7c9c354
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi
@@ -0,0 +1,525 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sm8250.dtsi"
+#include "pm8150.dtsi"
+#include "pm8150b.dtsi"
+#include "pm8150l.dtsi"
+
+/*
+ * Delete following upstream (sm8250.dtsi) reserved
+ * memory mappings which are different on this device.
+ */
+/delete-node/ &adsp_mem;
+/delete-node/ &camera_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &cdsp_secure_heap;
+/delete-node/ &cvp_mem;
+/delete-node/ &gpu_mem;
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &ipa_gsi_mem;
+/delete-node/ &npu_mem;
+/delete-node/ &removed_mem;
+/delete-node/ &slpi_mem;
+/delete-node/ &spss_mem;
+/delete-node/ &video_mem;
+/delete-node/ &wlan_mem;
+
+/ {
+	chassis-type = "handset";
+	qcom,msm-id = <QCOM_ID_SM8250 0x20001>;
+	qcom,board-id = <QCOM_BOARD_ID_MTP 0x0>;
+
+	aliases {
+		serial0 = &uart12;
+		serial1 = &uart6;
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "serial0:115200n8";
+
+		framebuffer: framebuffer-0 {
+			compatible = "simple-framebuffer";
+			memory-region = <&framebuffer_mem>;
+			format = "a8r8g8b8";
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&gcc GCC_DISP_SF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+				 <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+				 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+				 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+				 <&dispcc DISP_CC_MDSS_ESC0_CLK>;
+			power-domains = <&dispcc MDSS_GDSC>;
+		};
+	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+		label = "Volume keys";
+
+		pinctrl-0 = <&vol_down_l &vol_up_n>;
+		pinctrl-names = "default";
+
+		key-vol-down {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&pm8150_gpios 7 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
+		key-vol-up {
+			label = "Volume Up";
+			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	reserved-memory {
+		removed_mem: memory@80b00000 {
+			reg = <0x0 0x80b00000 0x0 0xcd00000>;
+			no-map;
+		};
+
+		camera_mem: memory@8dc00000 {
+			reg = <0x0 0x8dc00000 0x0 0x500000>;
+			no-map;
+		};
+
+		wlan_mem: memory@8e100000 {
+			reg = <0x0 0x8e100000 0x0 0x100000>;
+			no-map;
+		};
+
+		ipa_fw_mem: memory@8e200000 {
+			reg = <0x0 0x8e200000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: memory@8e210000 {
+			reg = <0x0 0x8e210000 0x0 0xa000>;
+			no-map;
+		};
+
+		gpu_mem: memory@8e21a000 {
+			reg = <0x0 0x8e21a000 0x0 0x2000>;
+			no-map;
+		};
+
+		npu_mem: memory@8e300000 {
+			reg = <0x0 0x8e300000 0x0 0x500000>;
+			no-map;
+		};
+
+		video_mem: memory@8e800000 {
+			reg = <0x0 0x8e800000 0x0 0x500000>;
+			no-map;
+		};
+
+		cvp_mem: memory@8ed00000 {
+			reg = <0x0 0x8ed00000 0x0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: memory@8f200000 {
+			reg = <0x0 0x8f200000 0x0 0x1400000>;
+			no-map;
+		};
+
+		slpi_mem: memory@90600000 {
+			reg = <0x0 0x90600000 0x0 0x1500000>;
+			no-map;
+		};
+
+		adsp_mem: memory@91b00000 {
+			reg = <0x0 0x91b00000 0x0 0x2500000>;
+			no-map;
+		};
+
+		spss_mem: memory@94000000 {
+			reg = <0x0 0x94000000 0x0 0x100000>;
+			no-map;
+		};
+
+		cdsp_secure_heap: memory@94100000 {
+			reg = <0x0 0x94100000 0x0 0x4600000>;
+			no-map;
+		};
+
+		framebuffer_mem: memory@9c000000 {
+			reg = <0 0x9c000000 0 0x2300000>;
+			no-map;
+		};
+
+		ramoops: ramoops@b0000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xb0000000 0x0 0x400000>;
+			record-size = <0x40000>;
+			console-size = <0x40000>;
+			ftrace-size =  <0x40000>;
+			pmsg-size = <0x200000>;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+	};
+
+	vreg_s4a_1p8: vreg-s4a-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s4a_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-allow-set-load;
+		regulator-always-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8150-rpmh-regulators";
+		qcom,pmic-id = "a";
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-l2-l10-supply = <&vreg_bob>;
+		vdd-l3-l4-l5-l18-supply = <&vreg_s6a_0p95>;
+		vdd-l6-l9-supply = <&vreg_s8c_1p3>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_1p9>;
+		vdd-l13-l16-l17-supply = <&vreg_bob>;
+
+		vreg_s5a_1p9: smps5 {
+			regulator-name = "vreg_s5a_1p9";
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6a_0p95: smps6 {
+			regulator-name = "vreg_s6a_0p95";
+			regulator-min-microvolt = <920000>;
+			regulator-max-microvolt = <1128000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2a_3p1: ldo2 {
+			regulator-name = "vreg_l2a_3p1";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a_0p9: ldo3 {
+			regulator-name = "vreg_l3a_0p9";
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <932000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a_0p88: ldo5 {
+			regulator-name = "vreg_l5a_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_1p2: ldo6 {
+			regulator-name = "vreg_l6a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p8: ldo7 {
+			regulator-name = "vreg_l7a_1p8";
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l9a_1p2: ldo9 {
+			regulator-name = "vreg_l9a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10a_1p8: ldo10 {
+			regulator-name = "vreg_l10a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-name = "vreg_l12a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a_ts_3p0: ldo13 {
+			regulator-name = "vreg_l13a_ts_3p0";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a_1p8: ldo14 {
+			regulator-name = "vreg_l14a_1p8";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <1880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a_1p8: ldo15 {
+			regulator-name = "vreg_l15a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16a_2p7: ldo16 {
+			regulator-name = "vreg_l16a_2p7";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a_3p0: ldo17 {
+			regulator-name = "vreg_l17a_3p0";
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a_0p92: ldo18 {
+			regulator-name = "vreg_l18a_0p92";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8150l-rpmh-regulators";
+		qcom,pmic-id = "c";
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-l1-l8-supply = <&vreg_s4a_1p8>;
+		vdd-l2-l3-supply = <&vreg_s8c_1p3>;
+		vdd-l4-l5-l6-supply = <&vreg_bob>;
+		vdd-l7-l11-supply = <&vreg_bob>;
+		vdd-l9-l10-supply = <&vreg_bob>;
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_s8c_1p3: smps8 {
+			regulator-name = "vreg_s8c_1p3";
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <4000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-name = "vreg_l1c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_1p2: ldo2 {
+			regulator-name = "vreg_l2c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_0p8: ldo3 {
+			regulator-name = "vreg_l3c_0p8";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c_1p7: ldo4 {
+			regulator-name = "vreg_l4c_1p7";
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c_1p8: ldo5 {
+			regulator-name = "vreg_l5c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c_2p96: ldo6 {
+			regulator-name = "vreg_l6c_2p96";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c_cam_vcm0_2p85: ldo7 {
+			regulator-name = "vreg_l7c_cam_vcm0_2p85";
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-name = "vreg_l8c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c_2p96: ldo9 {
+			regulator-name = "vreg_l9c_2p96";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c_3p0: ldo10 {
+			regulator-name = "vreg_l10c_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_3p0: ldo11 {
+			regulator-name = "vreg_l11c_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+	};
+};
+
+&pm8150_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		input-enable;
+		bias-pull-up;
+	};
+
+	vol_down_l: vol-down-l-state {
+		pins = "gpio7";
+		function = "normal";
+		power-source = <1>;
+		input-enable;
+		bias-pull-up;
+	};
+};
+
+&pon {
+	mode-bootloader = <0x2>;
+	mode-recovery = <0x1>;
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&qup_spi4_cs_gpio {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&qup_spi4_data_clk {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&qupv3_id_2 {
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <28 4>, /* SPI (NFC) */
+			       <40 4>; /* SPI (fingerprint scanner) */
+};
+
+&uart12 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	vcc-supply = <&vreg_l17a_3p0>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l6a_1p2>;
+	vccq-max-microamp = <800000>;
+	vccq2-supply = <&vreg_s4a_1p8>;
+	vccq2-max-microamp = <800000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+
+	status = "okay";
+};
+

-- 
2.54.0

