Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB3B231842;
	Sat, 26 Sep 2026 14:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790433499; cv=none; b=ghr+T4iwqeNEL2IRejNL2CDZNPJVQxuBg8jZMiE6itoOdmiudQLtq0vNW2aPOhiKFDMXsT7ScodFO52nXLm66tgx492sJzcNBtG344dTjkyAyLFyjkOxH7mDrgdQpc4sU8CexThwz7SHLopW51o5GCy8iQLB9/rrL9uPdeK1D1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790433499; c=relaxed/simple;
	bh=Qeum4K6tCJhfY8V7lmmOdPSis/nxcR2eTkIDe7hMTkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F/q+u4H3kyXB6DGSuX/f93ep3zMcCc2K14XFE2Dyvg2TVoi+wPBUkiUHu8w7o2qMpPNgdtCJsGREp2R0T9QHN/MIKaRVlQeCkkEjk33/lnuNBSfqC6vDPhCs892H+NZ6QUmamO7dMRVOZfKszn11izrJq5dZ9HWWhkiVXqT5Nnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbFqr0D7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbFqr0D7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAA71F000FF;
	Sat, 26 Sep 2026 14:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790433497;
	bh=vBwAMi/9qhE3GgmWveSKiRUQpYd503lFxP7TlWml1cc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XbFqr0D71BXjG4dZugxnPWrCNtmZoVEi/TQRXkM1aS8zDILAVRWq4T+jeZFds31wr
	 HeHbW7YUvfFzPei4NTcoHZIXjhuVT6lrPFbSxhI62jM6BBl9tLQix+m52qNZEJdJGM
	 ZjUq0EUqczGqb+XJAV3W5DT4iRngWfDXCj7sY+CYhK4g0ZJnFCdc6cRHUu8kkiJQbn
	 Nzj9jMa5yvw1cVIVx7Cr2EmAKS5rNOVaUFRSXuzVmkuSRlOaU+i25HLWf63+Jo3qCl
	 o+bF3l4b4u0AubbpH3WxGIt96PmAtMtubxaIkgypnKaF7oSQPwHQpR5DtDKfHK6BRB
	 D4SORBw1iPtzA==
Message-ID: <6b039399-083f-41ba-b691-f3d5e715ff84@kernel.org>
Date: Sat, 26 Sep 2026 15:38:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100-dell-xps13-9345: add the
 front camera
To: Liviu Nicoara <lnicoara@thinkoid.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <lVcrN5rxxI350G3UvKPxz-LATSmD1JKgO-AkmVL2XN3K_Hz2FCdk08a1btk7OPFln3a8gByLKKqg7vRtZlvUdg==@protonmail.internalid>
 <20260926122533.8200-1-lnicoara@thinkoid.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260926122533.8200-1-lnicoara@thinkoid.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:25, Liviu Nicoara wrote:
> Describe the OV02C10 front camera on CCI1 bus 1 at 0x36, fed by MCLK4
> at 19.2 MHz into CSIPHY4 over two D-PHY lanes at 400 MHz, the only
> link frequency the ov02c10 driver offers.
> 
> The wiring comes from the Windows driver store. CAMF_RES_QRD.bin
> switches a single rail, GPIO 91, before releasing reset on GPIO 237;
> GPIOs 235 and 236 are muxed to aon_cci there, the CCI1 bus 1 pins, not
> rail enables. No camera resource file votes a PMIC rail for the
> sensor, so avdd and dvdd are left out and fall to dummy regulators.
> The CSI PHY file votes LDO1_C at 1.2 V and LDO2_C at 0.88 V for the
> PHYs, which is vdda-1p2 and vdda-0p9 here, as on the Inspiron 14 Plus.
> MCLK drive strength is 2 mA, as CAMP_RES_QRD.bin programs GPIO 100,
> and tested streaming.
> 
> The module sits upside down in the lid: with both sensor flips on, the
> picture is upright and unmirrored, so rotation is 180.
> 
> The white camera indicator on GPIO 110 becomes the sensor's privacy LED,
> so the V4L2 core lights it while the sensor streams and takes it away
> from sysfs; the comment waiting for a "camera on" trigger goes, and
> panic-indicator stays, as on the X13s.
> 
> Assisted-by: LLM
> Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
> ---
> v3: add the Signed-off-by missing from v2; no other change.
> 
> v2:
> - Drop the dependency paragraph from the commit message (Abel).
> - Say in the message that panic-indicator stays, as on the X13s.
> No change to the DT.
> 
> v2: https://lore.kernel.org/all/20260926122032.4847-1-lnicoara@thinkoid.org/
> v1: https://lore.kernel.org/all/20260925181024.20352-1-lnicoara@thinkoid.org/
> 
> Depends on the x1e80100 camera DT series, v7:
> https://lore.kernel.org/all/20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org/
> and on the CAMSS PHY API series, v20 patches 5/6 and 6/6, which read the
> CAMSS endpoint's data-lanes as 1-based:
> https://lore.kernel.org/all/20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org/
> 
> Built and checked (dtbs_check, W=1) on next-20260925 with the DT series
> applied. Run-tested on 7.2.6 with the same board hunks, the CSI2 PHY
> driver v18, the PHY API series v20 and patches 1-4 of the DT series:
> the sensor streams at 30 fps through libcamera's software ISP, and the
> privacy LED lights while it streams and goes out after.
> 
> Bryan, happy for you to fold this into your next version of the DT
> series if that is easier.
> 
>   .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 120 +++++++++++++++++-
>   1 file changed, 118 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index ad62350ba670..73f06fdcd138 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -10,6 +10,8 @@
>   #include <dt-bindings/input/gpio-keys.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> 
>   #include "hamoa.dtsi"
> @@ -46,14 +48,13 @@ leds {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&cam_indicator_en>;
> 
> -		led-camera-indicator {
> +		privacy_led: led-camera-indicator {
>   			label = "white:camera-indicator";
>   			function = LED_FUNCTION_INDICATOR;
>   			color = <LED_COLOR_ID_WHITE>;
>   			gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
>   			linux,default-trigger = "none";
>   			default-state = "off";
> -			/* Reuse as a panic indicator until we get a "camera on" trigger */
>   			panic-indicator;
>   		};
>   	};
> @@ -151,6 +152,25 @@ linux,cma {
>   		};
>   	};
> 
> +	/*
> +	 * The one rail Windows switches for the front camera
> +	 * (CAMF_RES_QRD.bin: TLMM 91 high before reset release), the 1.8 V
> +	 * LDO enable on the sibling thena boards.
> +	 */
> +	vreg_cam_1p8: regulator-cam-1p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_CAM_1P8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam_ldo_en>;
> +		pinctrl-names = "default";
> +	};
> +
>   	vreg_edp_3p3: regulator-edp-3p3 {
>   		compatible = "regulator-fixed";
> 
> @@ -674,6 +694,78 @@ vreg_l3j_0p8: ldo3 {
>   	};
>   };
> 
> +&camss {
> +	status = "okay";
> +};
> +
> +&camss_csiphy4_in_port {
> +	camss_csiphy4_inep: endpoint {
> +		data-lanes = <1 2>;
> +		remote-endpoint = <&csiphy4_out_ep>;
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c1 {
> +	camera@36 {
> +		compatible = "ovti,ov02c10";
> +		reg = <0x36>;
> +
> +		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_rgb_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
> +		/* upside down in the lid; both sensor flips give an upright, unmirrored image */
> +		rotation = <180>;
> +
> +		leds = <&privacy_led>;
> +		led-names = "privacy";
> +
> +		/*
> +		 * Windows switches no rail for avdd or dvdd, only GPIO 91; they
> +		 * are left to dummy regulators rather than invented.
> +		 */
> +		dovdd-supply = <&vreg_cam_1p8>;
> +
> +		port {
> +			ov02c10_ep: endpoint {
> +				data-lanes = <1 2>;
> +				link-frequencies = /bits/ 64 <400000000>;
> +				remote-endpoint = <&csiphy4_in_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&csiphy4 {
> +	vdda-0p9-supply = <&vreg_l2c_0p8>;
> +	vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&csiphy4_in_port {
> +	csiphy4_in_ep: endpoint {
> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +		data-lanes = <1 2>;
> +		remote-endpoint = <&ov02c10_ep>;
> +	};
> +};
> +
> +&csiphy4_out_port {
> +	csiphy4_out_ep: endpoint {
> +		remote-endpoint = <&camss_csiphy4_inep>;
> +	};
> +};
> +
>   &gpu {
>   	status = "okay";
>   };
> @@ -1102,6 +1194,30 @@ cam_indicator_en: cam-indicator-en-state {
>   		bias-disable;
>   	};
> 
> +	cam_ldo_en: cam-ldo-en-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam_rgb_default: cam-rgb-default-state {
> +		/* 2 mA streams; the sibling X1E boards use 16 */
> +		mclk-pins {
> +			pins = "gpio100";
> +			function = "cam_aon";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		reset-n-pins {
> +			pins = "gpio237";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
>   	edp_bl_en: edp-bl-en-state {
>   		pins = "gpio74";
>   		function = "gpio";
> 
> base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
> prerequisite-patch-id: a7fbea14628b62a8de096dea420473b283010aba
> prerequisite-patch-id: 270d82b4c1760f1ec0a64a1b56c68ce26e6ae3b1
> prerequisite-patch-id: a12186bafac9b287c19fd719aeceb8ff1372dfbf
> prerequisite-patch-id: 4bc923fa59ee4c1ff68e64497f11e937c0ab3918
> prerequisite-patch-id: 4d000086386a3b344b1d6d345ab93d9b2b569615
> prerequisite-patch-id: 8cde6fd860c857dd7f3efce25970c88c783193b3
> prerequisite-patch-id: 1f22ff7fc93d0135e8759d45955bf998b037e11e
> prerequisite-patch-id: edb32e32f2b6be0b93f66d8da460c9f9de0c52e2
> prerequisite-patch-id: 09444936808e801a58c83356c9ae95415bacc83a
> prerequisite-patch-id: 348caa9cd0d1d70f181a47b40e2d75e8b25b5938
> prerequisite-patch-id: 1c4e4c457d8f95d8f5aaa2d93976c374b8282bf0
> prerequisite-patch-id: deedbed2643ca8a0f26bd87175d787d2f0c87417
> --
> 2.55.0
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
