Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF9E4C042F;
	Thu,  3 Sep 2026 14:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447499; cv=none; b=A+ohbkbCmM3r5vXFzXbt+EJXdkqx2eo1jal/GQsTEwrPX5sn6vKp8VRbg9HMfnAeGD21x0Q/BU9RVSVQUNhmPYHC8XvU1NHUrf+kCEPN9r3WXUKYCOzAE4CFJXDQNBI43duv9AuEbF59esFNdzwQTr6DNsmYA2CVInRkauDPvgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447499; c=relaxed/simple;
	bh=OdGGL7/uw8ix/rT8+5KDTQ/A+0Ul9UYhbOn8oX/N70M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7AQTKY83uxJxZTr3s5U92Led58LFWw1W3ZmLeBTopD7JxEoJqvYAL8YiflLhkG3saVRi189QkgXbNOupIco1FjUYpvc6o0CAYuV7fli0r/B10fybm8qvdNT2640L/dfYdQOw93CSU75lu3w2UtNl5Nk4rGt9D8PTk3Y0IsMHQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2H16TFn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2H16TFn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60771F00A3D;
	Thu,  3 Sep 2026 14:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788447498;
	bh=Tq2q0X2TCIg1RYPUl77QjJVvArODC8F8r/cAjMqavk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A2H16TFnJdCm3D1ArQxYXYApV1G2CDOst3QP6KYgtT3p1+oW3MTgIxBHK+2gKoN20
	 Y1BrFO6/DVa1RH/lqFiL+ySdhTs5qmcP/Zb8bCaP8Cw26/e1hbtdjK0QQVJQPDe+HV
	 VxD9bncCwxGC+o++sSJtGyr8dE+dHD1KtVHm/dESgmtdQBKSnMWDx9GIZ6lXNaZ5M/
	 W0S2KaMjQv1Ax2S+nC9nPHFxbmw6UMw/i/xBGcQmHsjBzR8aOxtxBrGsTpsMWJICfF
	 KTPoEabvlKJKpBm25mmjoO2JuYGQk0XAPhQ8yMyoDQ3DbM8ajWNlOOAucAGF1mEqg9
	 Ijj+11Q1SQvfA==
Date: Thu, 3 Sep 2026 09:58:14 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Akash Kumar <akakum@qti.qualcomm.com>, Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>, 
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>, Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Talos Lyra EVK board
Message-ID: <apmK3AKEcEo5AUqI@baldur>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-3-e3a76dc9e21c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-lyra_upstreaming-v1-3-e3a76dc9e21c@oss.qualcomm.com>

On Tue, Sep 01, 2026 at 07:14:03PM +0530, Avaneesh Kumar Dwivedi wrote:
> Add the device tree for the Talos Lyra EVK platform which combines
> the Talos Lyra EVK SoM and Lyra carrier board.
> 
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:
> 
> - Native DisplayPort output
> - GPIO expanders on i2c5
> - SPI-attached TPM (ST33)
> - USB host and peripheral controllers
> - Power and reset keys
> 
> Co-developed-by: Akash Kumar <akakum@qti.qualcomm.com>
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Please fix authorship, subject prefix and the top-level compatible. Rest
looks good.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 137 ++++++++++++++++++++++++++++
>  2 files changed, 138 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1c86e7e98f55..9818568912fd 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -409,6 +409,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
>  
>  talos-evk-el2-dtbs	:= talos-evk.dtb talos-el2.dtbo
>  
> diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> new file mode 100644
> index 000000000000..7974e5bad24c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "talos-lyra-evk-som.dtsi"
> +
> +/ {
> +	model = "Qualcomm QCS615 Talos Lyra EVK";
> +	compatible = "qcom,talos-lyra-evk", "qcom,talos-lyra-evk-som", "qcom,qcs615",
> +		     "qcom,sm6150";
> +	chassis-type = "embedded";
> +
> +	dp0-connector {
> +		compatible = "dp-connector";
> +		label = "DP0";
> +		type = "full-size";
> +
> +		hpd-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
> +
> +		port {
> +			dp0_connector_in: endpoint {
> +				remote-endpoint = <&mdss_dp0_out>;
> +			};
> +		};
> +	};
> +
> +};
> +
> +&i2c5 {
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	expander0: gpio@20 {
> +		compatible = "kinetic,kts1622", "ti,tcal6416";
> +		reg = <0x20>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +
> +	expander1: gpio@21 {
> +		compatible = "kinetic,kts1622", "ti,tcal6416";
> +		reg = <0x21>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +
> +	expander2: gpio@38 {
> +		compatible = "ti,tca9538";
> +		reg = <0x38>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +
> +	expander3: gpio@3c {
> +		compatible = "ti,tca9538";
> +		reg = <0x3c>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
> +	remote-endpoint = <&dp0_connector_in>;
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
> +&spi6 {
> +	status = "okay";
> +
> +	tpm@0 {
> +		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
> +		reg = <0>;
> +		spi-max-frequency = <20000000>;
> +	};
> +};
> +
> +&usb_1 {
> +	dr_mode = "peripheral";
> +
> +	status = "okay";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2 {
> +	dr_mode = "host";
> +
> +	status = "okay";
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy_2 {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.34.1
> 
