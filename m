Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048E32D1907;
	Sat, 26 Sep 2026 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790434641; cv=none; b=ZEQHoKYRoKx5sVAOxvvfMUfWro5p8WvPRcFZoZI5ZN2MzGh9OB+tFvu6EePG9dAoSWRh6ElTjXhXqKeB1i60bLnPSamsijpYVSkDAqzN8Hy/YsItAW5xZLapN9n98HFyXttQYoEgrcoJSTaNLljcEUWT4AQbs+/9IukDGb99hxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790434641; c=relaxed/simple;
	bh=MnzDPDtMMNhamKHW99FoslhsRuKtscVO5qkdZNF/MyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oavkAxoPnxSB4+0KstSAWf7KzvMKPwVGvYP2fqr6LPEKvioN2Eod4gmMAjQpdkOJd45vAfl9m1fJErFb+PNiHps9ND7Vo0CZLrTahhiRE7IJxNUnhvOIrZh8CIt/3IbNUPGWPpTUA91QreoacATiKJedgxig+mwOTQc5jF7Ib+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kyopCTyW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kyopCTyW"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DBD3B5;
	Sat, 26 Sep 2026 16:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790434528;
	bh=MnzDPDtMMNhamKHW99FoslhsRuKtscVO5qkdZNF/MyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyopCTyWJZ77lrsA1Wd1GnbcSF6k8FX/fR83MOIvjD3L9XkHkZhw2EgdzQlFlQLbx
	 lmRDylvISE3Yc0kMPG6HPaMioO/FLwCBzT3dk8jpPRGKANb1s1HQrdL9xDChIQ3nW+
	 PrYeOBl7n5rwzonYC8vCCFE9G+J8m48QmGhbCvDs=
Date: Sat, 26 Sep 2026 17:57:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, sakari.ailus@linux.intel.com,
	mripard@kernel.org, jai.luthra@linux.dev,
	jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, mirela.rabulea@nxp.com
Subject: Re: [RFC PATCH 7/8] arm64: dts: ti: k3-am62a7: FPDLink overlays for
 LI OV2312
Message-ID: <20260926145715.GF764757@killaraus.ideasonboard.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-8-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925133001.2780868-8-r-donadkar@ti.com>

On Fri, Sep 25, 2026 at 07:00:00PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> OV2312 is a raw (4x4 RGB-IR bayer) sensor, the LI-OV2312-FPDLinkIII-110H
> module [1] packages it with an FPDLink-III serializer (DS90UB953) for
> use with sensor fusion setups using FPDLink-III deserializer boards.
> 
> Link: https://www.leopardimaging.com/product/autonomous-camera/ti-fpdlinkiii-cameras/li-ov2312-fpdlinkiii/li-ov2312-fpdlinkiii-110h/ [1]
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile               |  6 ++
>  .../boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso    | 89 +++++++++++++++++++
>  .../boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso    | 89 +++++++++++++++++++
>  .../boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso    | 89 +++++++++++++++++++
>  .../boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso    | 89 +++++++++++++++++++

This seems to be a very strong candidate for the new DT addons
(https://bootlin.com/blog/device-tree-addons-describing-non-discoverable-addon-boards-and-connectors/).
It would help getting this feature merged if you could give it a try.

>  5 files changed, 362 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso
>  create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso
>  create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso
>  create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 795978e962ee..8d608e244087 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -508,5 +508,11 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-j784s4-evm-usb0-type-a.dtb \
>  	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
>  
> +# FPDLink Sensors
> +dtb-$(CONFIG_ARCH_K3) += k3-fpdlink-ov2312-0-0.dtbo \
> +			 k3-fpdlink-ov2312-0-1.dtbo \
> +			 k3-fpdlink-ov2312-0-2.dtbo \
> +			 k3-fpdlink-ov2312-0-3.dtbo
> +
>  # Enable support for device-tree overlays
>  DTC_FLAGS := -@
> diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso
> new file mode 100644
> index 000000000000..0829f01a0f90
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IMX390 FPD-Link 3 Camera Module
> + * Copyright (c) 2023 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&deserializer_0_ports {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* FPDLink RX 0 */
> +	port@0 {
> +		reg = <0>;
> +
> +		ub960_fpd3_1_in: endpoint {
> +			remote-endpoint = <&ub953_1_out>;
> +		};
> +	};
> +};
> +
> +&deserializer_0_links {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	link@0 {
> +		reg = <0>;
> +		i2c-alias = <0x44>;
> +
> +		ti,rx-mode = <3>;
> +
> +		serializer: serializer {
> +			compatible = "ti,ds90ub953-q1";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +
> +			#clock-cells = <0>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					ub953_1_in: endpoint {
> +						data-lanes = <1 2>;
> +						/*clock-noncontinuous;*/
> +						remote-endpoint = <&sensor_1_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ub953_1_out: endpoint {
> +						remote-endpoint = <&ub960_fpd3_1_in>;
> +					};
> +				};
> +			};
> +
> +			i2c {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				sensor@60 {
> +					compatible = "ovti,ov2312";
> +					reg = <0x60>;
> +
> +					clocks = <&serializer>;
> +					clock-names = "xvclk";
> +					assigned-clocks = <&serializer>;
> +					assigned-clock-rates = <24000000>;
> +
> +					reset-gpios = <&serializer 2 GPIO_ACTIVE_HIGH>;
> +
> +					port {
> +						sensor_1_out: endpoint {
> +							remote-endpoint = <&ub953_1_in>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso
> new file mode 100644
> index 000000000000..06cba8c7397f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IMX390 FPD-Link 3 Camera Module
> + * Copyright (c) 2023 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&deserializer_0_ports {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* FPDLink RX 1 */
> +	port@1 {
> +		reg = <1>;
> +
> +		ub960_fpd3_1_in: endpoint {
> +			remote-endpoint = <&ub953_1_out>;
> +		};
> +	};
> +};
> +
> +&deserializer_0_links {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	link@1 {
> +		reg = <1>;
> +		i2c-alias = <0x45>;
> +
> +		ti,rx-mode = <3>;
> +
> +		serializer: serializer {
> +			compatible = "ti,ds90ub953-q1";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +
> +			#clock-cells = <0>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					ub953_1_in: endpoint {
> +						data-lanes = <1 2>;
> +						/*clock-noncontinuous;*/
> +						remote-endpoint = <&sensor_1_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ub953_1_out: endpoint {
> +						remote-endpoint = <&ub960_fpd3_1_in>;
> +					};
> +				};
> +			};
> +
> +			i2c {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				sensor@60 {
> +					compatible = "ovti,ov2312";
> +					reg = <0x60>;
> +
> +					clocks = <&serializer>;
> +					clock-names = "xvclk";
> +					assigned-clocks = <&serializer>;
> +					assigned-clock-rates = <24000000>;
> +
> +					reset-gpios = <&serializer 2 GPIO_ACTIVE_HIGH>;
> +
> +					port {
> +						sensor_1_out: endpoint {
> +							remote-endpoint = <&ub953_1_in>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso
> new file mode 100644
> index 000000000000..7d377dbe5bbf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IMX390 FPD-Link 3 Camera Module
> + * Copyright (c) 2023 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&deserializer_0_ports {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* FPDLink RX 2 */
> +	port@2 {
> +		reg = <2>;
> +
> +		ub960_fpd3_1_in: endpoint {
> +			remote-endpoint = <&ub953_1_out>;
> +		};
> +	};
> +};
> +
> +&deserializer_0_links {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	link@2 {
> +		reg = <2>;
> +		i2c-alias = <0x46>;
> +
> +		ti,rx-mode = <3>;
> +
> +		serializer: serializer {
> +			compatible = "ti,ds90ub953-q1";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +
> +			#clock-cells = <0>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					ub953_1_in: endpoint {
> +						data-lanes = <1 2>;
> +						/*clock-noncontinuous;*/
> +						remote-endpoint = <&sensor_1_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ub953_1_out: endpoint {
> +						remote-endpoint = <&ub960_fpd3_1_in>;
> +					};
> +				};
> +			};
> +
> +			i2c {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				sensor@60 {
> +					compatible = "ovti,ov2312";
> +					reg = <0x60>;
> +
> +					clocks = <&serializer>;
> +					clock-names = "xvclk";
> +					assigned-clocks = <&serializer>;
> +					assigned-clock-rates = <24000000>;
> +
> +					reset-gpios = <&serializer 2 GPIO_ACTIVE_HIGH>;
> +
> +					port {
> +						sensor_1_out: endpoint {
> +							remote-endpoint = <&ub953_1_in>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso
> new file mode 100644
> index 000000000000..f74bff5f12b0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IMX390 FPD-Link 3 Camera Module
> + * Copyright (c) 2023 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&deserializer_0_ports {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* FPDLink RX 3 */
> +	port@3 {
> +		reg = <3>;
> +
> +		ub960_fpd3_1_in: endpoint {
> +			remote-endpoint = <&ub953_1_out>;
> +		};
> +	};
> +};
> +
> +&deserializer_0_links {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	link@3 {
> +		reg = <3>;
> +		i2c-alias = <0x47>;
> +
> +		ti,rx-mode = <3>;
> +
> +		serializer: serializer {
> +			compatible = "ti,ds90ub953-q1";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +
> +			#clock-cells = <0>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					ub953_1_in: endpoint {
> +						data-lanes = <1 2>;
> +						/*clock-noncontinuous;*/
> +						remote-endpoint = <&sensor_1_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ub953_1_out: endpoint {
> +						remote-endpoint = <&ub960_fpd3_1_in>;
> +					};
> +				};
> +			};
> +
> +			i2c {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				sensor@60 {
> +					compatible = "ovti,ov2312";
> +					reg = <0x60>;
> +
> +					clocks = <&serializer>;
> +					clock-names = "xvclk";
> +					assigned-clocks = <&serializer>;
> +					assigned-clock-rates = <24000000>;
> +
> +					reset-gpios = <&serializer 2 GPIO_ACTIVE_HIGH>;
> +
> +					port {
> +						sensor_1_out: endpoint {
> +							remote-endpoint = <&ub953_1_in>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +	};
> +};

-- 
Regards,

Laurent Pinchart
