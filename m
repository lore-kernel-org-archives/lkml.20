Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363444;
	b=BDI5cvzV9aFx7tSp4n6RD8WTfLTtcG+jJuPQfl9SKZrwfMUsq/tXIfPOYUEny91/v3bH
	 xEry5taDv+A5OMTQ3pWz5gGqkIlTOgYwgBRUbqFbMNFpoykwWCR8XK8hxNa5ezlWGgTl8
	 i8VAHzUZelzee8j90U+YFj5TF2LkHTk1ZV8RQYkYW8oTqeUl9oAXi233vP329clu3loUa
	 gGiBiCfnoZjhmsCWYetCDzpdjwvb5WzB2bYj6xf0xnYSz+Mb0zrkGzEX8np/FhMQHLdY8
	 iE3RlaxKHbxhcXFJyAmuI438/q3+ATrY12WRe8yCTSFou07UH7O1jxN1bM1sGTcQOkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363444;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:MIME-Version:Date:From:To:
	 Cc:Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=Pux+dy+zyuqyjLkNJ7LPPXv0u3VdJaaJL0aktDYWhKQ=;
	b=alFy6JVnUA9wk6Q2XAaCOv3gxr9Q6Ov6C23RLGreW4ePzI0DObI/w7c8YYp+ZiQpyJht
	 rmHmPNGc/w/P2sH6NjOZ6NfI3aY00P0z/SYiRs946SHjbqomjjypGnUpvqzbH1L7GEE3B
	 TtmHfHoMA4PeZqQh3/DBCjNMt+lrloGJ60Nae6qGU4/qo++boWW++ucwScAgX7JfBbJ5y
	 S08tj+aTpYAskWfmJfL0fJnOQsR7X+RVfHrAntQOQBTm2rXiTVU+Rh8McWzcMx5+E86Pc
	 WRaEGLUHYrxjR9l5R1p27hL0x7bLEx187IqNz8lpot4D/rsti/qM8/t41mEfdPuEAkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=pd9+QfX1;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=BzlybBld;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1064606A31A;
	Fri, 30 Oct 2026 12:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1064606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=pd9+QfX1;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=BzlybBld
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793363429; bh=Pux+dy+zyuqyjLkNJ7LPPXv
	0u3VdJaaJL0aktDYWhKQ=; b=pd9+QfX103orR55Y6ntLJdKWlOsZn3SchE5ovaZwGyk+DU/CYH
	aGittboCqaKpmTVc3h+8ZGryDuC7QBAmho70Dergh5nA8e6x8h8DIw5aKwA1KaULqaoDvwKVZjZ
	hxbcwCoAsXMczEztN7Oy14P+7Ze3jGRmG8AbFoTJUh+qME08NshheXKCYORT3hsQmZFnNv0Skaf
	fJiSy7OA7ZxK2xfA4ja00PTBOELzVlRu8pDg+MhdakcRFouGJSSPm5kkRWDeKVEqoWZkJ4Md7xH
	s1EOpeP48Hybqn5ZCvstxHYp2GOsgDaoJVwSD0ZnFRY9Wbrn1yWTcwAXj9f6kpDFUww==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793363429; bh=Pux+dy+zyuqyjLkNJ7LPPXv
	0u3VdJaaJL0aktDYWhKQ=; b=BzlybBldTbacZ6kL/Ke3/X4bMXnJNl+ndbwOxLV4HI62nbYeBd
	wJfIuwnJFDIFwusWxnpPoPNdGGT/Lehz5HCw==;
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 30 Oct 2026 13:30:28 +0100
From: =?UTF-8?Q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
To: Amir Hanip <killdeath104@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
In-Reply-To: <20261027205146.16384-3-killdeath104@gmail.com>
References: <20261027205146.16384-1-killdeath104@gmail.com>
 <20261027205146.16384-3-killdeath104@gmail.com>
Message-ID: <239d46726c0aad84feccc3def4eafab2@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-10-27 21:51, Amir Hanip wrote:
> Add initial device tree for the Xiaomi Poco M3 (codename citrus),
> based on the Qualcomm Snapdragon 662 (SM6115) SoC.
> 
> Currently working:
> - UFS and microSD
> - USB host (OTG)
> - WiFi
> - Bluetooth
> - Remoteprocs (ADSP, CDSP and modem)
> 
> WiFi, Bluetooth and the remoteprocs need device-specific firmware,
> which is not part of this series. WiFi additionally needs qrtr,
> tqftpserv and rmtfs running in userspace, and the Bluetooth
> controller needs its BD address set from userspace.
> 
> Display panel, touchscreen, and the GPU display pipeline will
> be added later, so the display is currently only available through
> simple-framebuffer.
> 
> Signed-off-by: Amir Hanip <killdeath104@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm6115-xiaomi-citrus.dts    | 538 ++++++++++++++++++
>  2 files changed, 539 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile 
> b/arch/arm64/boot/dts/qcom/Makefile
> index 88230c4e0..02e87dd78 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -386,6 +386,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= 
> shikra-iqs-evk-imx577-camera.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-xiaomi-citrus.dtb
Hi,

Poco M3 (citrus) is same HW like Redmi 9T (lime) and Remi 9T NFC (lemon) 
basically is
a lime with NFC.
So i think it would be better make a common base from lemon's devicetree 
instead of making the same
devicetree again for the different variants where only the compatible 
and the model property will be
the difference.
Check sm6125-xiaomi-gingkgo-common for example, it was the same case for 
Redmi Note 8 (ginkgo) and 8T (willow).
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-xiaomi-lemon.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6115p-lenovo-j606f.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts 
> b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
> new file mode 100644
> index 000000000..330f626ae
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
> @@ -0,0 +1,538 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2023 - 2024, Dang Huynh <danct12@riseup.net>
> + * Copyright (c) 2026, Amir Hanip <killdeath104@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "sm6115.dtsi"
> +#include "pm6125.dtsi"
> +#include "pmi632.dtsi"
> +#include <dt-bindings/arm/qcom,ids.h>
> +
> +/delete-node/ &cdsp_sec_mem;
> +
> +/ {
> +	model = "Xiaomi Poco M3";
> +	compatible = "xiaomi,citrus", "qcom,sm6115";
> +	chassis-type = "handset";
> +
> +	qcom,msm-id = <QCOM_ID_SM4250 0x10000>, <QCOM_ID_SM6115 0x10000>;
> +	qcom,board-id = <0x00 0x303>;
> +
> +	aliases {
> +		serial1 = &uart3;
> +	};
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@5c000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0x5c000000 0x0 (1080 * 2340 * 4)>;
> +			width = <1080>;
> +			height = <2340>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&vol_up_n>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pm6125_gpios 5 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
> +	wcn3950-pmu {
> +		compatible = "qcom,wcn3950-pmu";
> +
> +		pinctrl-0 = <&sw_ctrl_default>;
> +		pinctrl-names = "default";
> +
> +		vddio-supply = <&pm6125_l9>;
> +		vddxo-supply = <&pm6125_l16>;
> +		vddrf-supply = <&pm6125_l17>;
> +		vddch0-supply = <&pm6125_l23>;
> +
> +		swctrl-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
> +
> +		regulators {
> +			vreg_pmu_io: ldo0 {
> +				regulator-name = "vreg_pmu_io";
> +			};
> +
> +			vreg_pmu_xo: ldo1 {
> +				regulator-name = "vreg_pmu_xo";
> +			};
> +
> +			vreg_pmu_rf: ldo2 {
> +				regulator-name = "vreg_pmu_rf";
> +			};
> +
> +			vreg_pmu_ch0: ldo3 {
> +				regulator-name = "vreg_pmu_ch0";
> +			};
> +
> +			vreg_pmu_ch1: ldo4 {
> +				regulator-name = "vreg_pmu_ch1";
> +			};
> +		};
> +	};
> +};
> +
> +&dispcc {
> +	/* Prevent simplefb from dying until we wire panel driver */
> +	status = "disabled";
> +};
> +
> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/sm6115/xiaomi-citrus/a610_zap.mbn";
> +};
> +
> +&pil_adsp_mem {
> +	reg = <0x0 0x53800000 0x0 0x2200000>;
> +};
> +
> +&pil_cdsp_mem {
> +	reg = <0x0 0x51a00000 0x0 0xa00000>;
> +};
> +
> +&pil_gpu_mem {
> +	reg = <0x0 0x55a15000 0x0 0x2000>;
> +};
> +
> +&pil_ipa_fw_mem {
> +	reg = <0x0 0x55a00000 0x0 0x10000>;
> +};
> +
> +&pil_ipa_gsi_mem {
> +	reg = <0x0 0x55a10000 0x0 0x5000>;
> +};
> +
> +&pm6125_gpios {
> +	vol_up_n: vol-up-n-state {
> +		pins = "gpio5";
> +		function = "normal";
> +		power-source = <0>;
> +		bias-pull-up;
> +		input-enable;
> +	};
> +};
> +
> +&pmi632_typec {
> +	status = "okay";
> +
> +	connector {
> +		compatible = "usb-c-connector";
> +
> +		power-role = "dual";
> +		data-role = "dual";
> +		self-powered;
> +
> +		typec-power-opmode = "default";
> +		pd-disable;
> +
> +		vbus-supply = <&pmi632_vbus>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				pmi632_hs_in: endpoint {
> +					remote-endpoint = <&usb_dwc3_hs>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				pmi632_ss_in: endpoint {
> +					remote-endpoint = <&usb_qmpphy_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&pmi632_vbus {
> +	regulator-min-microamp = <500000>;
> +	regulator-max-microamp = <1000000>;
> +
> +	status = "okay";
> +};
> +
> +&pon_pwrkey {
> +	status = "okay";
> +};
> +
> +&pon_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +
> +	status = "okay";
> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/sm6115/xiaomi-citrus/adsp.mdt";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/sm6115/xiaomi-citrus/cdsp.mdt";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name = "qcom/sm6115/xiaomi-citrus/modem.mdt";
> +
> +	status = "okay";
> +};
> +
> +&rpm_requests {
> +	regulators-0 {
> +		compatible = "qcom,rpm-pm6125-regulators";
> +
> +		pm6125_s6: s6 {
> +			regulator-min-microvolt = <304000>;
> +			regulator-max-microvolt = <1456000>;
> +		};
> +
> +		pm6125_s7: s7 {
> +			regulator-min-microvolt = <1280000>;
> +			regulator-max-microvolt = <2040000>;
> +		};
> +
> +		pm6125_s8: s8 {
> +			regulator-min-microvolt = <1064000>;
> +			regulator-max-microvolt = <1304000>;
> +		};
> +
> +		pm6125_l1: l1 {
> +			regulator-min-microvolt = <952000>;
> +			regulator-max-microvolt = <1152000>;
> +		};
> +
> +		pm6125_l4: l4 {
> +			regulator-min-microvolt = <488000>;
> +			regulator-max-microvolt = <1000000>;
> +		};
> +
> +		pm6125_l5: l5 {
> +			regulator-min-microvolt = <1648000>;
> +			regulator-max-microvolt = <3056000>;
> +			regulator-allow-set-load;
> +		};
> +
> +		pm6125_l6: l6 {
> +			regulator-min-microvolt = <576000>;
> +			regulator-max-microvolt = <656000>;
> +		};
> +
> +		pm6125_l7: l7 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1304000>;
> +		};
> +
> +		pm6125_l8: l8 {
> +			regulator-min-microvolt = <400000>;
> +			regulator-max-microvolt = <728000>;
> +		};
> +
> +		pm6125_l9: l9 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2000000>;
> +		};
> +
> +		pm6125_l10: l10 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <1904000>;
> +		};
> +
> +		pm6125_l11: l11 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <1952000>;
> +			regulator-allow-set-load;
> +		};
> +
> +		pm6125_l12: l12 {
> +			regulator-min-microvolt = <1624000>;
> +			regulator-max-microvolt = <1984000>;
> +		};
> +
> +		pm6125_l13: l13 {
> +			regulator-min-microvolt = <1504000>;
> +			regulator-max-microvolt = <1952000>;
> +		};
> +
> +		pm6125_l14: l14 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <1904000>;
> +		};
> +
> +		pm6125_l15: l15 {
> +			regulator-min-microvolt = <2920000>;
> +			regulator-max-microvolt = <3232000>;
> +		};
> +
> +		pm6125_l16: l16 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <1904000>;
> +		};
> +
> +		pm6125_l17: l17 {
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1304000>;
> +		};
> +
> +		pm6125_l18: l18 {
> +			regulator-min-microvolt = <1104000>;
> +			regulator-max-microvolt = <1312000>;
> +		};
> +
> +		pm6125_l19: l19 {
> +			regulator-min-microvolt = <1624000>;
> +			regulator-max-microvolt = <3304000>;
> +		};
> +
> +		pm6125_l20: l20 {
> +			regulator-min-microvolt = <1624000>;
> +			regulator-max-microvolt = <3304000>;
> +		};
> +
> +		pm6125_l21: l21 {
> +			regulator-min-microvolt = <2400000>;
> +			regulator-max-microvolt = <3600000>;
> +		};
> +
> +		pm6125_l22: l22 {
> +			regulator-min-microvolt = <2952000>;
> +			regulator-max-microvolt = <3304000>;
> +		};
> +
> +		pm6125_l23: l23 {
> +			regulator-min-microvolt = <3200000>;
> +			regulator-max-microvolt = <3400000>;
> +		};
> +
> +		pm6125_l24: l24 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <3600000>;
> +			regulator-allow-set-load;
> +		};
> +	};
> +};
> +
> +&sdc2_state_off {
> +	cd-pins {
> +		pins = "gpio88";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> +
> +&sdc2_state_on {
> +	cd-pins {
> +		pins = "gpio88";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};
> +
> +&sdhc_2 {
> +	pinctrl-0 = <&sdc2_state_on>;
> +	pinctrl-1 = <&sdc2_state_off>;
> +	pinctrl-names = "default", "sleep";
> +
> +	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +
> +	vmmc-supply = <&pm6125_l22>;
> +	vqmmc-supply = <&pm6125_l5>;
> +
> +	status = "okay";
> +};
> +
> +&sleep_clk {
> +	clock-frequency = <32764>;
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <14 4>; /* SE5 SPI, not usable from Linux */
> +
> +	uart3_default: uart3-default-state {
> +		cts-pins {
> +			pins = "gpio8";
> +			function = "qup3";
> +			drive-strength = <2>;
> +			bias-bus-hold;
> +		};
> +
> +		rts-pins {
> +			pins = "gpio9";
> +			function = "qup3";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		tx-pins {
> +			pins = "gpio10";
> +			function = "qup3";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		rx-pins {
> +			pins = "gpio11";
> +			function = "qup3";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	uart3_sleep: uart3-sleep-state {
> +		cts-pins {
> +			pins = "gpio8";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-bus-hold;
> +		};
> +
> +		rts-pins {
> +			pins = "gpio9";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +
> +		tx-pins {
> +			pins = "gpio10";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		rx-pins {
> +			pins = "gpio11";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	sw_ctrl_default: sw-ctrl-default-state {
> +		pins = "gpio87";
> +		function = "gpio";
> +		bias-pull-down;
> +	};
> +};
> +
> +&uart3 {
> +	pinctrl-0 = <&uart3_default>;
> +	pinctrl-1 = <&uart3_sleep>;
> +	pinctrl-names = "default", "sleep";
> +
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn3950-bt";
> +		vddio-supply = <&vreg_pmu_io>;
> +		vddxo-supply = <&vreg_pmu_xo>;
> +		vddrf-supply = <&vreg_pmu_rf>;
> +		vddch0-supply = <&vreg_pmu_ch0>;
> +	};
> +};
> +
> +&ufs_mem_hc {
> +	vcc-supply = <&pm6125_l24>;
> +	vcc-max-microamp = <600000>;
> +	vccq2-supply = <&pm6125_l11>;
> +	vccq2-max-microamp = <600000>;
> +	vdd-hba-supply = <&pm6125_l18>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&pm6125_l4>;
> +	vdda-pll-supply = <&pm6125_l12>;
> +
> +	status = "okay";
> +};
> +
> +&usb {
> +	status = "okay";
> +};
> +
> +&usb_dwc3 {
> +	maximum-speed = "high-speed";
> +
> +	status = "okay";
> +};
> +
> +&usb_dwc3_hs {
> +	remote-endpoint = <&pmi632_hs_in>;
> +};
> +
> +&usb_hsphy {
> +	vdd-supply = <&pm6125_l4>;
> +	vdda-pll-supply = <&pm6125_l12>;
> +	vdda-phy-dpdm-supply = <&pm6125_l15>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	/delete-property/ orientation-switch;
> +
> +	vdda-phy-supply = <&pm6125_l4>;
> +	vdda-pll-supply = <&pm6125_l12>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy_out {
> +	remote-endpoint = <&pmi632_ss_in>;
> +};
> +
> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&pm6125_l4>;
> +	vdd-1.8-xo-supply = <&pm6125_l16>;
> +	vdd-1.3-rfa-supply = <&pm6125_l17>;
> +	vdd-3.3-ch0-supply = <&pm6125_l23>;
> +	vdd-3.3-ch1-supply = <&pm6125_l24>;
> +
> +	status = "okay";
> +};
> +
> +&xo_board {
> +	clock-frequency = <19200000>;
> +};
