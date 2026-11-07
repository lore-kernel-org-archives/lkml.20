Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794076015;
	b=MTO+oh0BAAJAcIYc4gtNaTJML0V8X1YePjz0JCZujKLIe8uLPyWPfJHeUQw2dwMPMiJN
	 DKQDGwR1BLUFkFcFF7CJHXQOrHits4Wi/Qivr3F4PGxx3K9hF0IecvnwXWlp98Gqr4Wva
	 Bo5iuUJTmkh4W0yeBJqnXN8aysjR5A4mJYWy30vtdfupuT49/JF3FXabRIIBphZZaQk6/
	 mBvPJ1QC1W+004RLFJ4KFtjjGHAS+PypiyVhE1UBexPMljtHCsYIZjfnPDh/y0P8Zjz7I
	 Md70SY57c+MTxJOK8NUdFUkVGCETsi2NKLh3jT2RoI3bxiF44T+VEspX4ERiK38z7LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794076015;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:MIME-Version:Date:From:To:
	 Cc:Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=2OlRM02ztzV8yXMDP77XNgprV2JIB+WYt2A0aFSyZMc=;
	b=vztioxiy5Ilaslk1ShOL69jVYsDHyxMy5B9gi1BQAfFYxP9j51MxMClWcdrHZBVcT4yH
	 bNmrtBRNo+Am2VRtRdsyfgL7ZyRemMmbMXza9nVPAcbhdLn7WzsBzkobmzBeKRltB+rhK
	 xQcbk3AklD/4Gj8NE/CA5m/XZLKh49M6SENe9syhcoSQoC5VsRIznm+KvazqpIyXFxKTW
	 NwyX7K30QgNZP8PPNcyeSZvNzE6waTm5L6fUjdzijrfpYh4vO7xrp7IZFxRrU+EnvoF8r
	 gCWaz5C51S75iAqkxPXPco2Qbu+dWKOqpSe4DqcIeItL0yMQ1RNUboiYc+iZ+WG9Orw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=hSEEV9P5;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b="/Vwv3R33";
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B45606A326;
	Sat,  7 Nov 2026 18:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B45606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=hSEEV9P5;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=/Vwv3R33
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1794076007; bh=2OlRM02ztzV8yXMDP77XNgp
	rV2JIB+WYt2A0aFSyZMc=; b=hSEEV9P5sqF3ukXJhiL2b1F9dvHrOwgXybl1NfFAH3Lgyc2rO+
	Bg2YEhdQSfBRo76c5FdKiUwKjlvoU+gIyXeaTMumqOWua1D6a442gs92NIYRR2hCOzzNqQADnuH
	EVzcCz79u36abnM3YgAN53zFrivzs2nqg+uyYWxB/rNDajO47kCoy74XaS4mCyD+DLiSaHC6jtW
	zl07HGVK7qeQdEHdYOCWUEa5BmH2rip8+DyrRRprtqhksdTU2cevsFLXtQoWqw0tLN4cMu5ewhr
	g4mhZdxcaOGFRD484URtRO43K5kdTn20je8KBV5hRLibXFfPjfxllgdg9DMhThtqQSg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1794076007; bh=2OlRM02ztzV8yXMDP77XNgp
	rV2JIB+WYt2A0aFSyZMc=; b=/Vwv3R33hPs6BXwzRj4FjBlZG5PUj2kx+biifQHVdDRrXXPcHN
	cVtMPxzLf7iJZnaMBMpwmpHfHIICfQ97KsDw==;
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 19:26:47 +0100
From: =?UTF-8?Q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
To: Amir Hanip <killdeath104@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, abelvesa@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, a39skl@gmail.com,
 konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm6115-xiaomi-lemon: Split out a
 common dtsi
In-Reply-To: <20261107141432.39099-3-killdeath104@gmail.com>
References: <20261107141432.39099-1-killdeath104@gmail.com>
 <20261107141432.39099-3-killdeath104@gmail.com>
Message-ID: <daea291c5b5d3b1ff87bbeaac4b08083@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-07 15:14, Amir Hanip wrote:
> Move the nodes shared with the other Xiaomi SM6115 variants (Redmi 9T
> and Poco M3) into sm6115-xiaomi-lime-common.dtsi, so that the other
> variants can reuse them. No functional change intended: the
> decompiled lemon DTS is identical before and after, except for the
> numbering of auto-generated phandles.
> 
> Signed-off-by: Amir Hanip <killdeath104@gmail.com>
> ---
>  .../boot/dts/qcom/sm6115-xiaomi-lemon.dts     | 317 +----------------
>  .../dts/qcom/sm6115-xiaomi-lime-common.dtsi   | 335 ++++++++++++++++++
>  2 files changed, 336 insertions(+), 316 deletions(-)
>  create mode 100644 
> arch/arm64/boot/dts/qcom/sm6115-xiaomi-lime-common.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts 
> b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts
> index 881e05b701..2caaca3033 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts
> @@ -5,41 +5,17 @@
> 
>  /dts-v1/;
> 
> -#include "sm6115.dtsi"
> -#include "pm6125.dtsi"
> -#include "pmi632.dtsi"
>  #include <dt-bindings/leds/common.h>
> -
> -/delete-node/ &pil_adsp_mem;
> -/delete-node/ &pil_gpu_mem;
> -/delete-node/ &pil_ipa_fw_mem;
> -/delete-node/ &pil_ipa_gsi_mem;
> +#include "sm6115-xiaomi-lime-common.dtsi"
> 
>  / {
>  	model = "Xiaomi Redmi 9T";
>  	compatible = "xiaomi,lemon", "qcom,sm6115";
> -	chassis-type = "handset";
> 
>  	aliases {
>  		mmc0 = &sdhc_2;
>  	};
> 
> -	chosen {
> -		#address-cells = <2>;
> -		#size-cells = <2>;
> -		ranges;
> -
> -		framebuffer0: framebuffer@5c000000 {
> -			compatible = "simple-framebuffer";
> -			reg = <0 0x5c000000 0 (2340 * 1080 * 4)>;
> -			width = <1080>;
> -			height = <2340>;
> -			stride = <(1080 * 4)>;
> -			format = "a8r8g8b8";
> -			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
> -		};
> -	};
> -
>  	backlight_dsi: backlight-dsi {
>  		compatible = "led-backlight";
>  		leds = <&led_backlight>;
> @@ -49,38 +25,12 @@ backlight_dsi: backlight-dsi {
>  		status = "disabled";
>  	};
> 
> -	gpio-keys {
> -		compatible = "gpio-keys";
> -
> -		pinctrl-0 = <&vol_up_n>;
> -		pinctrl-names = "default";
> -
> -		key-volume-up {
> -			label = "Volume Up";
> -			linux,code = <KEY_VOLUMEUP>;
> -			gpios = <&pm6125_gpios 5 GPIO_ACTIVE_LOW>;
> -			debounce-interval = <15>;
> -			linux,can-disable;
> -			wakeup-source;
> -		};
> -	};
> -
>  	reserved-memory {
>  		pil_adsp_mem: memory@53400000 {
>  			reg = <0x0 0x53400000 0x0 0x2600000>;
>  			no-map;
>  		};
> 
> -		pil_ipa_fw_mem: memory@55a00000 {
> -			reg = <0x0 0x55a00000 0x0 0x10000>;
> -			no-map;
> -		};
> -
> -		pil_ipa_gsi_mem: memory@55a10000 {
> -			reg = <0x0 0x55a10000 0x0 0x5000>;
> -			no-map;
> -		};
> -
>  		pil_gpu_mem: memory@fa400000 {
>  			reg = <0x0 0xfa400000 0x0 0x2000>;
>  			no-map;
> @@ -108,19 +58,6 @@ vph_pwr: vph-pwr-regulator {
>  	};
>  };
> 
> -&dispcc {
> -	/* Prevent simplefb from dying until we wire panel driver */
> -	status = "disabled";
> -};
> -
> -&gpi_dma0 {
> -	status = "okay";
> -};
> -
> -&gpu {
> -	status = "okay";
> -};
> -
>  &i2c1 {
>  	status = "okay";
> 
> @@ -158,118 +95,13 @@ &mdss_dsi0_out {
>  	data-lanes = <0 1 2 3>;
>  };
> 
> -&pil_cdsp_mem {
> -	reg = <0x0 0x51a00000 0x0 0xa00000>;
> -};
> -
> -&pm6125_gpios {
> -	vol_up_n: vol-up-n-state {
> -		pins = "gpio5";
> -		function = "normal";
> -		power-source = <0>;
> -		bias-pull-up;
> -		input-enable;
> -	};
> -};
> -
> -&pmi632_typec {
> -	status = "okay";
> -
> -	connector {
> -		compatible = "usb-c-connector";
> -
> -		power-role = "dual";
> -		data-role = "dual";
> -		self-powered;
> -
> -		typec-power-opmode = "default";
> -		pd-disable;
> -
> -		vbus-supply = <&pmi632_vbus>;
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@0 {
> -				reg = <0>;
> -				pmi632_hs_in: endpoint {
> -					remote-endpoint = <&usb_dwc3_hs>;
> -				};
> -			};
> -
> -			port@1 {
> -				reg = <1>;
> -				pmi632_ss_in: endpoint {
> -					remote-endpoint = <&usb_qmpphy_out>;
> -				};
> -			};
> -		};
> -	};
> -};
> -
> -&pmi632_vbus {
> -	regulator-min-microamp = <500000>;
> -	regulator-max-microamp = <1000000>;
> -
> -	status = "okay";
> -};
> -
> -&pon_pwrkey {
> -	status = "okay";
> -};
> -
> -&pon_resin {
> -	linux,code = <KEY_VOLUMEDOWN>;
> -
> -	status = "okay";
> -};
> -
> -&qupv3_id_0 {
> -	status = "okay";
> -};
> -
> -&remoteproc_adsp {
> -	status = "okay";
> -};
> -
> -&remoteproc_cdsp {
> -	status = "okay";
> -};
> -
> -&remoteproc_mpss {
> -	status = "okay";
> -};
> -

You should not override rpm_request node here, you can use the labels
from the common to change the ranges like:
&pm6125_s7 {
    regulator-min-microvolt = <1280000>;
    regulator-max-microvolt = <2080000>;
};
>  &rpm_requests {
>  	regulators-0 {
> -		compatible = "qcom,rpm-pm6125-regulators";
> -
> -		pm6125_s6: s6 {
> -			regulator-min-microvolt = <304000>;
> -			regulator-max-microvolt = <1456000>;
> -		};
> -
>  		pm6125_s7: s7 {
>  			regulator-min-microvolt = <1280000>;
>  			regulator-max-microvolt = <2080000>;
>  		};
> 
> -		pm6125_s8: s8 {
> -			regulator-min-microvolt = <1064000>;
> -			regulator-max-microvolt = <1304000>;
> -		};
> -
> -		pm6125_l1: l1 {
> -			regulator-min-microvolt = <952000>;
> -			regulator-max-microvolt = <1152000>;
> -		};
> -
> -		pm6125_l4: l4 {
> -			regulator-min-microvolt = <488000>;
> -			regulator-max-microvolt = <1000000>;
> -		};
> -
>  		pm6125_l5: l5 {
>  			regulator-min-microvolt = <1648000>;
>  			regulator-max-microvolt = <2960000>;
> @@ -278,11 +110,6 @@ pm6125_l5: l5 {
>  			regulator-always-on;
>  		};
> 
> -		pm6125_l6: l6 {
> -			regulator-min-microvolt = <576000>;
> -			regulator-max-microvolt = <656000>;
> -		};
> -
>  		pm6125_l7: l7 {
>  			/* sdhci2 vdd-io-bias supply */
>  			regulator-min-microvolt = <1256000>;
> @@ -291,51 +118,11 @@ pm6125_l7: l7 {
>  			regulator-always-on;
>  		};
> 
> -		pm6125_l8: l8 {
> -			regulator-min-microvolt = <400000>;
> -			regulator-max-microvolt = <728000>;
> -		};
> -
> -		pm6125_l9: l9 {
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <2000000>;
> -		};
> -
> -		pm6125_l10: l10 {
> -			regulator-min-microvolt = <1704000>;
> -			regulator-max-microvolt = <1904000>;
> -		};
> -
>  		pm6125_l11: l11 {
>  			regulator-min-microvolt = <1768000>;
>  			regulator-max-microvolt = <1952000>;
>  		};
> 
> -		pm6125_l12: l12 {
> -			regulator-min-microvolt = <1624000>;
> -			regulator-max-microvolt = <1984000>;
> -		};
> -
> -		pm6125_l13: l13 {
> -			regulator-min-microvolt = <1504000>;
> -			regulator-max-microvolt = <1952000>;
> -		};
> -
> -		pm6125_l14: l14 {
> -			regulator-min-microvolt = <1704000>;
> -			regulator-max-microvolt = <1904000>;
> -		};
> -
> -		pm6125_l15: l15 {
> -			regulator-min-microvolt = <2920000>;
> -			regulator-max-microvolt = <3232000>;
> -		};
> -
> -		pm6125_l16: l16 {
> -			regulator-min-microvolt = <1704000>;
> -			regulator-max-microvolt = <1904000>;
> -		};
> -
>  		pm6125_l17: l17 {
>  			regulator-min-microvolt = <1152000>;
>  			regulator-max-microvolt = <1384000>;
> @@ -346,21 +133,6 @@ pm6125_l18: l18 {
>  			regulator-max-microvolt = <1232000>;
>  		};
> 
> -		pm6125_l19: l19 {
> -			regulator-min-microvolt = <1624000>;
> -			regulator-max-microvolt = <3304000>;
> -		};
> -
> -		pm6125_l20: l20 {
> -			regulator-min-microvolt = <1624000>;
> -			regulator-max-microvolt = <3304000>;
> -		};
> -
> -		pm6125_l21: l21 {
> -			regulator-min-microvolt = <2400000>;
> -			regulator-max-microvolt = <3600000>;
> -		};
> -
>  		pm6125_l22: l22 {
>  			regulator-min-microvolt = <2952000>;
>  			regulator-max-microvolt = <2960000>;
> @@ -369,11 +141,6 @@ pm6125_l22: l22 {
>  			regulator-always-on;
>  		};
> 
> -		pm6125_l23: l23 {
> -			regulator-min-microvolt = <3200000>;
> -			regulator-max-microvolt = <3400000>;
> -		};
> -
>  		pm6125_l24: l24 {
>  			regulator-min-microvolt = <2704000>;
>  			regulator-max-microvolt = <3600000>;
> @@ -382,23 +149,9 @@ pm6125_l24: l24 {
>  };
> 
>  &sdhc_2 {
> -	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
> -
> -	pinctrl-0 = <&sdc2_state_on>, <&sdc2_cd_on>;
> -	pinctrl-1 = <&sdc2_state_off>, <&sdc2_cd_off>;
> -	pinctrl-names = "default", "sleep";
> -
> -	vmmc-supply = <&pm6125_l22>;
> -	vqmmc-supply = <&pm6125_l5>;
>  	/* No binding for vdd-io-bias on L7*/
>  	no-sdio;
>  	no-mmc;
> -
> -	status = "okay";
> -};
> -
> -&sleep_clk {
> -	clock-frequency = <32764>;
>  };
> 
>  &spi2 {
> @@ -406,8 +159,6 @@ &spi2 {
>  };
> 
>  &tlmm {
> -	gpio-reserved-ranges = <14 4>; /* Fingerprint SPI */
> -
>  	lm3692x_bl_active: lm3692x-active-state {
>  		pins = "gpio99";
>  		function = "gpio";
> @@ -422,20 +173,6 @@ mdss_dsi_active: mdss-dsi-active-state {
>  		bias-disable;
>  	};
> 
> -	sdc2_cd_on: sdc2-cd-on-state {
> -		pins = "gpio88";
> -		function = "gpio";
> -		drive-strength = <2>;
> -		bias-pull-up;
> -	};
> -
> -	sdc2_cd_off: sdc2-cd-off-state {
> -		pins = "gpio88";
> -		function = "gpio";
> -		drive-strength = <2>;
> -		bias-disable;
> -	};
> -
>  	te_active: te-active-state {
>  		pins = "gpio81";
>  		function = "mdp_vsync";
> @@ -443,55 +180,3 @@ te_active: te-active-state {
>  		bias-pull-down;
>  	};
>  };
> -
> -&ufs_mem_hc {
> -	vcc-max-microamp = <600000>;
> -	vcc-supply = <&pm6125_l24>;
> -	vccq2-max-microamp = <600000>;
> -	vccq2-supply = <&pm6125_l11>;
> -	vdd-hba-supply = <&pm6125_l18>;
> -
> -	status = "okay";
> -};
> -
> -&ufs_mem_phy {
> -	vdda-phy-supply = <&pm6125_l4>;
> -	vdda-pll-supply = <&pm6125_l12>;
> -
> -	status = "okay";
> -};
> -
> -&usb {
> -	status = "okay";
> -};
> -
> -&usb_dwc3 {
> -	maximum-speed = "high-speed";
> -};
> -
> -&usb_dwc3_hs {
> -	remote-endpoint = <&pmi632_hs_in>;
> -};
> -
> -&usb_hsphy {
> -	vdd-supply = <&pm6125_l4>;
> -	vdda-pll-supply = <&pm6125_l12>;
> -	vdda-phy-dpdm-supply = <&pm6125_l15>;
> -
> -	status = "okay";
> -};
> -
> -&usb_qmpphy {
> -	vdda-phy-supply = <&pm6125_l4>;
> -	vdda-pll-supply = <&pm6125_l12>;
> -
> -	status = "okay";
> -};
> -
> -&usb_qmpphy_out {
> -	remote-endpoint = <&pmi632_ss_in>;
> -};
> -
> -&xo_board {
> -	clock-frequency = <19200000>;
> -};
> diff --git a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lime-common.dtsi 
> b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lime-common.dtsi
> new file mode 100644
> index 0000000000..16883e35b5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lime-common.dtsi
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2026 Adam Skladowski <a39skl@gmail.com>
> + */
> +
> +#include "sm6115.dtsi"
> +#include "pm6125.dtsi"
> +#include "pmi632.dtsi"
> +
> +/delete-node/ &pil_adsp_mem;
> +/delete-node/ &pil_gpu_mem;
> +/delete-node/ &pil_ipa_fw_mem;
> +/delete-node/ &pil_ipa_gsi_mem;
> +
> +/ {
> +	chassis-type = "handset";
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@5c000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0x5c000000 0 (2340 * 1080 * 4)>;
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
> +	reserved-memory {
> +		pil_ipa_fw_mem: memory@55a00000 {
> +			reg = <0x0 0x55a00000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		pil_ipa_gsi_mem: memory@55a10000 {
> +			reg = <0x0 0x55a10000 0x0 0x5000>;
> +			no-map;
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
> +&pil_cdsp_mem {
> +	reg = <0x0 0x51a00000 0x0 0xa00000>;
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
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +	status = "okay";
> +};
> +
Please add the missing regulators.
> +&rpm_requests {
> +	regulators-0 {
> +		compatible = "qcom,rpm-pm6125-regulators";
> +
> +		pm6125_s6: s6 {
> +			regulator-min-microvolt = <304000>;
> +			regulator-max-microvolt = <1456000>;
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
> +		pm6125_l6: l6 {
> +			regulator-min-microvolt = <576000>;
> +			regulator-max-microvolt = <656000>;
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
> +		pm6125_l23: l23 {
> +			regulator-min-microvolt = <3200000>;
> +			regulator-max-microvolt = <3400000>;
> +		};
> +	};
> +};
> +
> +&sdhc_2 {
> +	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 = <&sdc2_state_on>, <&sdc2_cd_on>;
> +	pinctrl-1 = <&sdc2_state_off>, <&sdc2_cd_off>;
> +	pinctrl-names = "default", "sleep";
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
> +	gpio-reserved-ranges = <14 4>; /* SE5 SPI (fingerprint), not usable 
> from Linux */
> +
> +	sdc2_cd_on: sdc2-cd-on-state {
> +		pins = "gpio88";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	sdc2_cd_off: sdc2-cd-off-state {
> +		pins = "gpio88";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> +
> +&ufs_mem_hc {
> +	vcc-max-microamp = <600000>;
> +	vcc-supply = <&pm6125_l24>;
> +	vccq2-max-microamp = <600000>;
> +	vccq2-supply = <&pm6125_l11>;
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
> +&xo_board {
> +	clock-frequency = <19200000>;
> +};
