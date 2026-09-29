Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876823C342B;
	Tue, 29 Sep 2026 03:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651645; cv=none; b=JnvU9iVziqCNOHgU2vru7khKaCNAuLSTpUcUWhiMDtv5tHg1NJmI4cyzBw1vLJHQ4ANUQZcdjT6kSZ9nVvWLv9qpXQ5JZp/8DDl7Fcfb4eU+IoMJeSY9UqzJ9kgnNCwpe/BgNUBimdnTVZQbizMrR4AUnktw7b7dBXoaz2gz5D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651645; c=relaxed/simple;
	bh=b2OfSb2+SciWkRMpuXJSyGid0M8VY1bTxEUNQw1US6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIkZ4G2SwkjW0WWnR2vUdurbcj/q53eybeZgGdeuoER5juZgGCyQLu2BrZfdxqDqmzbyx1d4eyJORU5tvbvN5m/wr6a7/JVuO230XRR6defNZpEltGlnjr9uOiIqAFU6Os0j2lvHUGlNiTudCpZyG0ll1Rarg6ME5dGXiPsfdWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUu8MX2W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUu8MX2W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83041F000FF;
	Tue, 29 Sep 2026 03:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651639;
	bh=f+/2mu3Kkhj/XCxEL4wgAbPmQ6fjcskhKTYYG5//9qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nUu8MX2Wiieaf7rfl4Y1Mvf1kGn1hZkY0W+2rILeSupK33V4YwL0jwsHW5tR3Cm/J
	 dbsM3hZV5/MiP9zh2oeDrZ+YuZo4oaIOipoO5JxMbyvmLRjbL2RqSbS+n9CzqANilz
	 veQNUbrbxD67iKRh4u9br1vlAPd1TQh4agbi9SrA1dqxfsHTZvDon3+TqQp7RaU9xh
	 wLTFDVJ5v96oZ42pW3YqYjOQAkO1Aq/Q55A5HqlGt3yyhz0qY2/feuttXOz5t6P6ej
	 y+ges4gzYCTuvsBPIwc+fnXkJ5dF4r3bFF2QKymEyPC9ZoAZ+c8IE3Zhy+ONq61CB5
	 01EI0crIMzIXA==
Date: Mon, 28 Sep 2026 22:13:56 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: jens.glathe@oldschoolsolutions.biz
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	=?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 Replace old sound nodes, enable DisplayPort audio
Message-ID: <arssv5dH5ywjQWUw@zenbook>
References: <20260825-blackrock-audio-v2-0-659cc4724d57@oldschoolsolutions.biz>
 <20260825-blackrock-audio-v2-1-659cc4724d57@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-blackrock-audio-v2-1-659cc4724d57@oldschoolsolutions.biz>

On Tue, Aug 25, 2026 at 04:07:45PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Windows Dev Kit 2023 has no built-in speakers, microphones or
> headphone jack. Likewise the device with the same mainboard, Surface
> Pro 9 5G [1]. The previous WCD938x / WSA / VA sound card definition
> was therefore non-functional.
> 
> Replace the unused codec nodes, SoundWire controllers, LPASS macros
> and related pinctrl with DisplayPort DAI links (DP0/DP1/DP2) so that
> audio is available over the DP connectors. Add the required
> sound-name-prefix properties and update the card model name to the
> conventional SC8280XP-MICROSOFT-BLACKROCK form.
> 
> [1]: https://support.microsoft.com/en-us/surface/models/surface-pro-9-features-and-specs

Computer says:

arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@aea0000 (qcom,sc8280xp-edp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
    from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml
+ 5 more times...

What am I doing wrong?

Regards,
Bjorn

> 
> Fixes: 16a7fed11714 ("arm64: dts: qcom: sc8280xp-blackrock: dt definition for WDK2023")
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 135 +++------------------
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   4 +
>  2 files changed, 21 insertions(+), 118 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> index 4f4b5f4285ec2..ac22f44020a64 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> @@ -28,32 +28,6 @@ aliases {
>  		serial1 = &uart2;
>  	};
>  
> -	wcd938x: audio-codec {
> -		compatible = "qcom,wcd9380-codec";
> -
> -		pinctrl-0 = <&wcd_default>;
> -		pinctrl-names = "default";
> -
> -		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
> -
> -		vdd-buck-supply = <&vreg_s10b>;
> -		vdd-rxtx-supply = <&vreg_s10b>;
> -		vdd-io-supply = <&vreg_s10b>;
> -		vdd-mic-bias-supply = <&vreg_bob>;
> -
> -		qcom,micbias1-microvolt = <1800000>;
> -		qcom,micbias2-microvolt = <1800000>;
> -		qcom,micbias3-microvolt = <1800000>;
> -		qcom,micbias4-microvolt = <1800000>;
> -		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> -		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> -		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> -		qcom,rx-device = <&wcd_rx>;
> -		qcom,tx-device = <&wcd_tx>;
> -
> -		#sound-dai-cells = <1>;
> -	};
> -
>  	dp3_connector: connector {
>  		compatible = "dp-connector";
>  		label = "DP-3";
> @@ -852,23 +826,19 @@ &remoteproc_nsp0 {
>  	status = "okay";
>  };
>  
> -&rxmacro {
> -	status = "okay";
> -};
> -
>  &sound {
>  	compatible = "qcom,sc8280xp-sndcard";
> -	model = "microsoft/blackrock";
> +	model = "SC8280XP-MICROSOFT-BLACKROCK";
>  
> -	wcd-playback-dai-link {
> -		link-name = "WCD Playback";
> +	dp0-dai-link {
> +		link-name = "DP0 Playback";
>  
> -		cpu {
> -			sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +		codec {
> +			sound-dai = <&mdss0_dp0>;
>  		};
>  
> -		codec {
> -			sound-dai = <&wcd938x 0>, <&swr1 0>, <&rxmacro 0>;
> +		cpu {
> +			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
>  		};
>  
>  		platform {
> @@ -876,15 +846,15 @@ platform {
>  		};
>  	};
>  
> -	wcd-capture-dai-link {
> -		link-name = "WCD Capture";
> +	dp1-dai-link {
> +		link-name = "DP1 Playback";
>  
> -		cpu {
> -			sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
> +		codec {
> +			sound-dai = <&mdss0_dp1>;
>  		};
>  
> -		codec {
> -			sound-dai = <&wcd938x 1>, <&swr2 0>, <&txmacro 0>;
> +		cpu {
> +			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
>  		};
>  
>  		platform {
> @@ -892,67 +862,23 @@ platform {
>  		};
>  	};
>  
> -	wsa-dai-link {
> -		link-name = "WSA Playback";
> -
> -		cpu {
> -			sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> -		};
> +	dp2-dai-link {
> +		link-name = "DP2 Playback";
>  
>  		codec {
> -			sound-dai = <&swr0 0>, <&wsamacro 0>;
> -		};
> -
> -		platform {
> -			sound-dai = <&q6apm>;
> +			sound-dai = <&mdss0_dp2>;
>  		};
> -	};
> -
> -	va-dai-link {
> -		link-name = "VA Capture";
>  
>  		cpu {
> -			sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
>  		};
>  
>  		platform {
>  			sound-dai = <&q6apm>;
>  		};
> -
> -		codec {
> -			sound-dai = <&vamacro 0>;
> -		};
>  	};
>  };
>  
> -&swr0 {
> -	status = "okay";
> -};
> -
> -&swr1 {
> -	status = "okay";
> -
> -	wcd_rx: wcd9380-rx@0,4 {
> -		compatible = "sdw20217010d00";
> -		reg = <0 4>;
> -		qcom,rx-port-mapping = <1 2 3 4 5>;
> -	};
> -};
> -
> -&swr2 {
> -	status = "okay";
> -
> -	wcd_tx: wcd9380-tx@0,3 {
> -		compatible = "sdw20217010d00";
> -		reg = <0 3>;
> -		qcom,tx-port-mapping = <1 1 2 3>;
> -	};
> -};
> -
> -&txmacro {
> -	status = "okay";
> -};
> -
>  &uart2 {
>  	pinctrl-0 = <&uart2_default>;
>  	pinctrl-names = "default";
> @@ -1076,31 +1002,12 @@ &usb_2_qmpphy0 {
>  	status = "okay";
>  };
>  
> -&vamacro {
> -	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
> -	pinctrl-names = "default";
> -
> -	vdd-micb-supply = <&vreg_s10b>;
> -
> -	qcom,dmic-sample-rate = <4800000>;
> -
> -	status = "okay";
> -};
> -
> -&wsamacro {
> -	status = "okay";
> -};
> -
>  &xo_board_clk {
>  	clock-frequency = <38400000>;
>  };
>  
>  /* PINCTRL */
>  
> -&lpass_tlmm {
> -	status = "okay";
> -};
> -
>  &pmc8280_1_gpios {
>  	misc_3p3_reg_en: misc-3p3-reg-en-state {
>  		pins = "gpio1";
> @@ -1302,14 +1209,6 @@ usb2_en_state: usb2-en-state {
>  		output-low;
>  	};
>  
> -	wcd_default: wcd-default-state {
> -		reset-pins {
> -			pins = "gpio106";
> -			function = "gpio";
> -			bias-disable;
> -		};
> -	};
> -
>  	wlan_en: wlan-en-state {
>  		pins = "gpio134";
>  		function = "gpio";
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index fbcfd3883bbb4..baca36b151853 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -4903,6 +4903,7 @@ mdss0_dp0: displayport-controller@ae90000 {
>  				phy-names = "dp";
>  
>  				#sound-dai-cells = <0>;
> +				sound-name-prefix = "DisplayPort0";
>  
>  				operating-points-v2 = <&mdss0_dp0_opp_table>;
>  				power-domains = <&rpmhpd SC8280XP_MMCX>;
> @@ -5168,6 +5169,7 @@ mdss0_dp1: displayport-controller@ae98000 {
>  				phy-names = "dp";
>  
>  				#sound-dai-cells = <0>;
> +				sound-name-prefix = "DisplayPort1";
>  
>  				operating-points-v2 = <&mdss0_dp1_opp_table>;
>  				power-domains = <&rpmhpd SC8280XP_MMCX>;
> @@ -5252,6 +5254,7 @@ mdss0_dp2: displayport-controller@ae9a000 {
>  				operating-points-v2 = <&mdss0_dp2_opp_table>;
>  
>  				#sound-dai-cells = <0>;
> +				sound-name-prefix = "DisplayPort2";
>  
>  				status = "disabled";
>  
> @@ -5327,6 +5330,7 @@ mdss0_dp3: displayport-controller@aea0000 {
>  				operating-points-v2 = <&mdss0_dp3_opp_table>;
>  
>  				#sound-dai-cells = <0>;
> +				sound-name-prefix = "DisplayPort3";
>  
>  				status = "disabled";
>  
> 
> -- 
> 2.53.0
> 
> 
