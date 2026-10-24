Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792840275;
	b=vUXxp586rtakPW0Eq5bTKESzBJwCtVft+WMRO0/1FaIZ7CEIZsWgaAgdSyWaPo09Vby/
	 sux5U6/vnYrUM6TAElHM7gjLyFLgm9rjR31D39WfMzM/3CnAzc3zqXMGvvCoGti6jVAVf
	 KwkYlIFpdd5wdJIWWXRlmFZg1ajBdudFe40M1UyTd1KjzZB1OO0lCYVJKtdTcpfpoFzat
	 6GAFYSEhHYQA4e0GSGa6AOVZrdcIsib5BT26wFMX+eK7pHjhBIWMrvIOZMEr4W6KAqI79
	 4BavjjU8QWsWoG/Lc1jcSl70YzcW5xyrmNfCTAEQ5LUtz7YQBbeQtKR4A/8EiI1SBCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792840275;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XKawUEas0+ewxVkQvD9UzFgid97iDDDPxd6wFpvvkpg=;
	b=odBTM2xAThBqGVP5ZdhBmi4KqwLPpA2Dn9L6lfhS0M981ipueSGXG7cWOsPiVBv3Lagn
	 Tmn4p3nLYcCaPHCrTecuL+ANrgE7yDgt9tSaIxyX59c6Sqz8QyK19RN7c9sYDCbtgL6rW
	 Q48vbKQJBWetuV95f9w2GckqYwiejHdF9lKWggopPHZhyEySeV+OtdezyUeZq4XpkEDBn
	 c87ZBbzkbNuT0iMBcagHryD5u6XIDC9ORO3FdVhNvwNOkkltqzlwXVU5+0gtxFG9atOK2
	 r+kdPB8C6/kCYmv/RcnhFdqkzpVZuZMVFY+TkJlyMw2g1EdJSWfxyZTHtnnQjk3joqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=wIhJGjnd;
	arc=none smtp.remote-ip=79.135.106.111
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66939606A330
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66939606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=wIhJGjnd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792840267; x=1793099467;
	bh=XKawUEas0+ewxVkQvD9UzFgid97iDDDPxd6wFpvvkpg=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=wIhJGjndxQn7TlWCFlzc02lHFzlNXVNkI+r0KQ3p3JkzkW36FelZCPdMCFTH0fAA3
	 6/epOSfWNY3JtAL7Ni+SEGQibzXBSmSKfcXokc8Gnwe6ScbgNSh561Xz4WKw/p7PfH
	 vnASIb0MohWftxnYRqO8sgdipqmayV9EkzsLbT9O4sDKBq7+25wku1kZuahqZNa4tE
	 2+w923jvPoaDeHSNq9nTUhN+4AoubndwQRuJXV+ozr9ISRO6BY8wecwogCqg0vKpf2
	 IhJFFe1/PkNJt913KQgCuCdCSgQUwuhxJ2SPtcgitq2TAIBrxvuBO2S4IDO/84PEfp
	 Fm9xX254z6YXw==
X-Pm-Submission-Id: 4jBcdP3wjHz1DFSp
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 12:10:08 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: Add Motorola Moto G10
Message-ID: <1e50fab3692cc285621b2ad4a674dca79e5391ea.1792840208.git.me@michaelmcallister.org>
In-Reply-To: <cover.1792840208.git.me@michaelmcallister.org>
References: <cover.1792840208.git.me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Add an initial board description for the SM4250-based Motorola Moto G10
(codenamed capri), including eMMC, USB-C, buttons, GPU, Wi-Fi and remote
processors. Describe the board-specific firmware carveouts and use the
shared PM6125 and PMI632 definitions. Put the modem, ADSP and GPU firmware
paths under qcom/motorola/capri/.

Use the firmware framebuffer until native panel support is available.
Retain the GCC display AHB and AXI clocks and leave DISPCC disabled to
preserve the bootloader display configuration.

Leave Bluetooth disabled until the WCN3950 shutdown fixes are merged.
Panel, touchscreen, amplifier, sound-card and battery-monitor support
depend on separate driver and binding submissions.

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm4250-motorola-capri.dts   | 374 ++++++++++++++++++
 2 files changed, 375 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250-motorola-capri.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e0..6f2dd88a1 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -383,6 +383,7 @@ shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-ca
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-motorola-capri.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm4250-motorola-capri.dts b/arch/arm64/boot/dts/qcom/sm4250-motorola-capri.dts
new file mode 100644
index 000000000..08807953a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm4250-motorola-capri.dts
@@ -0,0 +1,374 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026 Michael McAllister <me@michaelmcallister.org>
+ *
+ * PM6125 regulator definitions derived from sm4250-oneplus-billie2.dts:
+ * Copyright (c) 2021 Iskren Chernev <iskren.chernev@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "sm4250.dtsi"
+#include "pm6125.dtsi"
+#include "pmi632.dtsi"
+
+/delete-node/ &pil_adsp_mem;
+/delete-node/ &pil_ipa_fw_mem;
+/delete-node/ &pil_ipa_gsi_mem;
+/delete-node/ &pil_gpu_mem;
+
+/ {
+	model = "Motorola Moto G10";
+	compatible = "motorola,capri", "qcom,sm4250";
+
+	/* Used by the bootloader to select the board */
+	qcom,msm-id = <QCOM_ID_SM4250 0x10000>;
+	qcom,board-id = <0 0xb200>;
+
+	aliases {
+		display0 = &mdss;
+		mmc0 = &sdhc_1;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "display0";
+
+		framebuffer0: framebuffer@5c000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0x5c000000 0 (720 * 1600 * 4)>;
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>;
+			display = <&mdss>;
+			format = "a8r8g8b8";
+			height = <1600>;
+			stride = <(720 * 4)>;
+			vddio-supply = <&vreg_l9a>;
+			width = <720>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&volume_up_default>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			debounce-interval = <15>;
+			gpios = <&pm6125_gpios 5 GPIO_ACTIVE_LOW>;
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+		};
+	};
+};
+
+&dispcc {
+	/* Preserve the bootloader display until the native panel is supported */
+	status = "disabled";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/motorola/capri/a610_zap.mdt";
+};
+
+&pil_cdsp_mem {
+	reg = <0 0x51a00000 0 0x800000>;
+};
+
+&pm6125_gpios {
+	volume_up_default: volume-up-state {
+		pins = "gpio5";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		power-source = <0>;
+	};
+};
+
+&pmi632_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+		data-role = "dual";
+		pd-disable;
+		power-role = "dual";
+		self-powered;
+		typec-power-opmode = "default";
+		vbus-supply = <&pmi632_vbus>;
+
+		port {
+			pmi632_hs_in: endpoint {
+				remote-endpoint = <&usb_dwc3_hs>;
+			};
+		};
+	};
+};
+
+&pmi632_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <500000>;
+
+	status = "okay";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/motorola/capri/adsp2.mdt";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/motorola/capri/modem.mdt";
+
+	status = "okay";
+};
+
+&reserved_memory {
+	/* The ADSP and following carveouts differ from the SM6115 defaults */
+	pil_adsp_mem: memory@52200000 {
+		reg = <0 0x52200000 0 0x1c00000>;
+		no-map;
+	};
+
+	pil_ipa_fw_mem: memory@53e00000 {
+		reg = <0 0x53e00000 0 0x10000>;
+		no-map;
+	};
+
+	pil_ipa_gsi_mem: memory@53e10000 {
+		reg = <0 0x53e10000 0 0x5000>;
+		no-map;
+	};
+
+	pil_gpu_mem: memory@53e15000 {
+		reg = <0 0x53e15000 0 0x2000>;
+		no-map;
+	};
+
+	/* Bootloader debug data */
+	memory@aef9d800 {
+		reg = <0 0xaef9d800 0 0x62800>;
+		no-map;
+	};
+
+	ramoops@af000000 {
+		compatible = "ramoops";
+		reg = <0 0xaf000000 0 0xbf800>;
+		console-size = <0x40000>;
+		pmsg-size = <0x40000>;
+		record-size = <0x20000>;
+	};
+};
+
+&rpm_requests {
+	regulators-0 {
+		compatible = "qcom,rpm-pm6125-regulators";
+
+		vreg_s6a: s6 {
+			regulator-min-microvolt = <320000>;
+			regulator-max-microvolt = <1456000>;
+		};
+
+		vreg_s7a: s7 {
+			regulator-min-microvolt = <1280000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_s8a: s8 {
+			regulator-min-microvolt = <1064000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		vreg_l1a: l1 {
+			regulator-min-microvolt = <952000>;
+			regulator-max-microvolt = <1152000>;
+		};
+
+		vreg_l4a: l4 {
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		vreg_l5a: l5 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3056000>;
+		};
+
+		vreg_l6a: l6 {
+			regulator-min-microvolt = <576000>;
+			regulator-max-microvolt = <656000>;
+		};
+
+		vreg_l7a: l7 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		vreg_l8a: l8 {
+			regulator-min-microvolt = <640000>;
+			regulator-max-microvolt = <640000>;
+		};
+
+		vreg_l9a: l9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-boot-on;
+		};
+
+		vreg_l10a: l10 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1904000>;
+		};
+
+		vreg_l11a: l11 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1952000>;
+		};
+
+		vreg_l12a: l12 {
+			regulator-min-microvolt = <1624000>;
+			regulator-max-microvolt = <1984000>;
+		};
+
+		vreg_l13a: l13 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <1952000>;
+		};
+
+		vreg_l14a: l14 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1904000>;
+		};
+
+		vreg_l15a: l15 {
+			regulator-min-microvolt = <2920000>;
+			regulator-max-microvolt = <3232000>;
+		};
+
+		vreg_l16a: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_l17a: l17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		vreg_l18a: l18 {
+			regulator-min-microvolt = <1104000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		vreg_l19a: l19 {
+			regulator-min-microvolt = <1624000>;
+			regulator-max-microvolt = <3304000>;
+		};
+
+		vreg_l20a: l20 {
+			regulator-min-microvolt = <1624000>;
+			regulator-max-microvolt = <3304000>;
+		};
+
+		vreg_l21a: l21 {
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		vreg_l22a: l22 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <3304000>;
+		};
+
+		vreg_l23a: l23 {
+			regulator-min-microvolt = <3296000>;
+			regulator-max-microvolt = <3304000>;
+		};
+
+		vreg_l24a: l24 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <3544000>;
+		};
+	};
+};
+
+&sdhc_1 {
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+	vmmc-supply = <&vreg_l24a>;
+	vqmmc-supply = <&vreg_l11a>;
+	max-frequency = <50000000>;
+	non-removable;
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32764>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <14 4>;
+};
+
+&usb {
+	/* The connector exposes only the USB 2.0 data pair */
+	qcom,select-utmi-as-pipe-clk;
+
+	status = "okay";
+};
+
+&usb_dwc3 {
+	maximum-speed = "high-speed";
+	phy-names = "usb2-phy";
+	phys = <&usb_hsphy>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l4a>;
+	vdda-phy-dpdm-supply = <&vreg_l15a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l8a>;
+	vdd-1.3-rfa-supply = <&vreg_l17a>;
+	vdd-1.8-xo-supply = <&vreg_l16a>;
+	vdd-3.3-ch0-supply = <&vreg_l23a>;
+	qcom,calibration-variant = "Motorola_Capri";
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <19200000>;
+};
