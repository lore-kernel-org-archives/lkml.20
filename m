Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2E45218A0;
	Tue, 29 Sep 2026 12:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686628; cv=pass; b=F5PiUorBFcjQ8tc/Yt+G1OGVNviR7dkd2VniJ3YJqGN5vYOOhHGKrrHHjuA7JWhDak+9m37+DyXWDhSeCrQzaI978Pqkg0P+/ojZte7ZD/G05oXhcdo0gJaApq6UgXKeZ4G0wsjUCHbGjYzaBqP2MXQI3+N6o+ghoMCd4wYUyqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686628; c=relaxed/simple;
	bh=YT06j9/V28dQXmdEuPafK8KsgPylDSS5+L3CsxadAX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVgu82zlWggFVJ8KLdVWBcWLn1MdIjNfXjvV7QfUemcLqzderBztYVrYqHv29XOsMjEzNUCRQLPhMGOyZG4+WkMMwoujqo8qgD/Zinxgyt6TOT6j1loDJfFJaAsIVTFFRxlAXkA9M29gZq9Ry4d60d1NT6wmYSVxnNECrcG6HcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=RgJwRajf; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="RgJwRajf"
ARC-Seal: i=1; a=rsa-sha256; t=1790686616; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Rt7F9cTQIqsjz0/NLpXxFU/ERhBy0Wq5tUNyvR0qSmXf+sbVn5wEqTfdOoyD6Jvuug97tgA9DIwfcw0AfIBeIugiu3B4q0/tjOvQvVlmr6vS8YyidT61uSPlXVM37ukrwZtcT4nYfG7IyzPieKbU3fzueVl8v7pQ7sMCVQZuMcU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790686616; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dw2G6qHIZr2q4Bt6ggK8RCIkbrjHTRhw+FWlDVwXhMw=; 
	b=Y4j6sHPHlglWJ/oKpZoONft9cPvUrJh3rTAi/SfU2Qm7gB6A0lMTFnKkdjT4yxVGi/ZBxO2xsrz73GvFnO9Dl/JMoIhTW+09rzQaNL1Xh7U3Eik+cDFALzkdDmPihi1AOheVFsV83L1pxX7TJNazG5D/XzgdAC8M/KTjv0ydZLk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790686616;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dw2G6qHIZr2q4Bt6ggK8RCIkbrjHTRhw+FWlDVwXhMw=;
	b=RgJwRajfRURzMAck6XuHxeKK9XLgC4qoJTbyTeubCqyQnoIui8KFgVN5y/kFby1D
	8paaPKm9XKd4B+sSHGNLJ19lfeeKISnD2LpEnA1nD0fiFN1m6YSYKGKLsjl+X43NvgI
	jn06RIF6os8JMUwmNNVbIqXVi+V/JjzsJJWffMo0=
Received: by smtp.zohomail.com with SMTPS id 1790686613886757.8277621120569;
	Tue, 29 Sep 2026 05:56:53 -0700 (PDT)
Message-ID: <e0699ffb-5e73-4fd5-b3e2-79cc7c2d49aa@collabora.com>
Date: Tue, 29 Sep 2026 14:56:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: add radxa camera 4k on rock 4d
To: Amin Gattout <amin.gattout@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260925-rock4d-cam4k-v1-1-c9519c794fb3@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260925-rock4d-cam4k-v1-1-c9519c794fb3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Amin,

Thanks for the patch, LGTM!

On 9/25/26 14:16, Amin Gattout wrote:
> Add a device tree overlay for the Radxa Camera 4K (featuring the Sony
> IMX415 image sensor) to be applied on the Radxa ROCK 4D camera
> connector. The camera connects to CSI HOST1 through the MIPI D-PHY0
> in full mode.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  arch/arm64/boot/dts/rockchip/Makefile              |   5 +
>  .../dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso   | 105 +++++++++++++++++++++
>  2 files changed, 110 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index e7936a21c118..82b2afd420d5 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -183,6 +183,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-m5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-r76s.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d-radxa-cam4k.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-sige7.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-w3.dtb
> @@ -311,6 +312,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10-pcie1.dtb
>  rk3576-evb1-v10-pcie1-dtbs := rk3576-evb1-v10.dtb \
>  	rk3576-evb1-v10-pcie1.dtbo
>  
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d-radxa-4k-cam.dtb
> +rk3576-rock-4d-radxa-4k-cam-dtbs := rk3576-rock-4d.dtb \
> +	rk3576-rock-4d-radxa-cam4k.dtbo
> +
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
>  rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
>  	rk3588-edgeble-neu6a-wifi.dtbo
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso
> new file mode 100644
> index 000000000000..613a3e351500
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device tree overlay for the Radxa Camera 4K attached to the camera
> + * connector of the Radxa ROCK 4D.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/rockchip,rk3576-cru.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +
> +&{/} {
> +	savdd_cam: regulator-savdd-cam {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio3 RK_PD0 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <2900000>;
> +		regulator-max-microvolt = <2900000>;
> +		regulator-name = "savdd_cam";
> +		vin-supply = <&vcc_3v3_s0>;
> +	};
> +
> +	sdvdd_cam: regulator-sdvdd-cam {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <1100000>;
> +		regulator-max-microvolt = <1100000>;
> +		regulator-name = "sdvdd_cam";
> +		vin-supply = <&vcc_5v0_device>;
> +	};
> +
> +	siovdd_cam: regulator-siovdd-cam {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-name = "siovdd_cam";
> +		vin-supply = <&vcc_3v3_s0>;
> +	};
> +};
> +
> +&i2c5 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c5m3_xfer>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	imx415: camera-sensor@1a {
> +		compatible = "sony,imx415";
> +		reg = <0x1a>;
> +		assigned-clocks = <&cru CLK_MIPI_CAMERAOUT_M1>;
> +		assigned-clock-rates = <37125000>;
> +		avdd-supply = <&savdd_cam>;
> +		clocks = <&cru CLK_MIPI_CAMERAOUT_M1>;
> +		dvdd-supply = <&sdvdd_cam>;
> +		orientation = <2>; /* External */
> +		ovdd-supply = <&siovdd_cam>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_rstn &cam_clk1m0_clk1>;
> +		reset-gpios = <&gpio3 RK_PC7 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			imx415_output: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				link-frequencies = /bits/ 64 <445500000>;
> +				remote-endpoint = <&csi1_input>;
> +			};
> +		};
> +	};
> +};
> +
> +&pinctrl {
> +	cam {
> +		cam_rstn: cam-rstn-pinctrl {
> +			rockchip,pins = <3 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&csi1 {
> +	status = "okay";
> +};
> +
> +&csi1_in {
> +	csi1_input: endpoint {
> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +		data-lanes = <1 2 3 4>;
> +		link-frequencies = /bits/ 64 <445500000>;
> +		remote-endpoint = <&imx415_output>;
> +	};
> +};
> +
> +&csi_dphy0 {
> +	status = "okay";
> +};
> +
> +&vicap {
> +	status = "okay";
> +};
> +
> +&vicap_mmu {
> +	status = "okay";
> +};
> 
> ---
> base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
> change-id: 20260925-rock4d-cam4k-6e3521c61b55
> prerequisite-change-id: 20260819-rk3576-dphy-2304f848215b:v2
> prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
> prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
> prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
> prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
> prerequisite-change-id: 20260825-csi-2-rcv-dts-7712bd834de6:v2
> prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
> prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
> prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
> prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
> prerequisite-patch-id: bdbb3e9b072469900cac21031cd799265b52d734
> prerequisite-patch-id: c91ceb74abc8bc79ac036990abdef4cbd7328f97
> prerequisite-change-id: 20260828-vicap-rk3576-6e7118ea0246:v2
> prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
> prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
> prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
> prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
> prerequisite-patch-id: bdbb3e9b072469900cac21031cd799265b52d734
> prerequisite-patch-id: c91ceb74abc8bc79ac036990abdef4cbd7328f97
> prerequisite-patch-id: d4120ad9def5effeda632f831b6fd0cd59295285
> prerequisite-patch-id: e0c7e587fcaffe58b61fe78508efccec86dc7c79
> prerequisite-patch-id: 6a87bd22798d58cc8f9b30733f5b28a2fced05c1
> prerequisite-patch-id: a94c687ac3f648079b18dbb5109657fb038bd516
> prerequisite-patch-id: 76e36df1aab8a9853440aa28b4bda528ce2adfd7
> 
> Best regards,
> --  
> Amin Gattout <amin.gattout@gmail.com>
> 

