Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F93AAF74;
	Sun, 20 Sep 2026 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916695; cv=none; b=qYNyl9oEvDbb9B2S3g5xtSAnlbP/3u1JpvSQS182QI6jpPyvHAr94oU/uVn3DIB3eWlGmhc7Zi5PgIzHQMTeqKPyarhtLE2NN6JTIhYrLWm5k6+eToi+X/bqtMtPAbmgCIssn8dm0vWCrIGaHGh8GE3+AA5yP5M3dXgXSpzNHP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916695; c=relaxed/simple;
	bh=TpPiDz5hV+A+fOEVAJl7B09uFQMx/xwXkM+qzexfzyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8zFJqlsxNFvnvVooE+qxZbRM0zu7zV2ibFNcdJfRuRAbW3MVZwaCsC8Ullb0KUwcoEKiZpauYRAAr0rwMFzBMhkR5IDv6lN1B0tiwQmKuvNDOqUnFcsyfwUsQRwCtkBs2+q+WF6zncvb8xpfEQV3FMk3osNegStWlVf6xDZN8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=1Ehtwmen; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1Ehtwmen"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=e0Xair5WrqnEDWZxl7Rdcr954TntOjThEzSLQBodpGU=; b=1EhtwmenXXHrqXysEV2ImkgAwi
	PZNf1Pmmq/HkAdYuJhuTzzWhtfze1imU2ye99SaDoun8h0n2uAW1lQF1GJ2LXKR+n5p6xL5jgWbq9
	E84ckkLx45ubYw8naGpyMB8XNkmI/QNHYrfLohm+aIUwDiHvloCLLSRwH9o+U+WCwUa8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x8J5r-006AaZ-P7; Sun, 20 Sep 2026 17:04:39 +0200
Date: Sun, 20 Sep 2026 17:04:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Zoltan HERPAI <wigyori@uid0.hu>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp: add Olimex i.MX8MP-SOM-EVB kit
Message-ID: <b3ef52c9-3ab7-40b2-8279-9cc8c7f74eb8@lunn.ch>
References: <20260918195559.130443-1-wigyori@uid0.hu>
 <20260918195559.130443-3-wigyori@uid0.hu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918195559.130443-3-wigyori@uid0.hu>

On Fri, Sep 18, 2026 at 09:55:59PM +0200, Zoltan HERPAI wrote:
> This adds support for an i.MX8-based system-on-module + EVB board. The
> product pages are here [1] and here [2] respectively.
> 
> There are two new files, one dts for the EVB and one dtsi for the SoM.
> 
> EVB features:
>  - microSD slot, eMMC headers
>  - 2x Ethernet 1Gb
>  - 2x USB 3.0
>  - 1x m.2 PCIe slot
>  - 2x CAN interface
>  - audio (2x jacks via ES8328)
>  - at24 eeprom
>  - separate UARTs for the A53 and the M7 cores
>  - HDMI
>  - UEXT and GPIO connectors with I2C available
> 
> SoM features:
>  - NXP i.MX8MP @ 1600MHz
>  - 4GByte memory
>  - LVDS interface
>  - 2x MIPI_CSI, 1x MIPI_DSI
>  - status LED
> 
> [1] https://www.olimex.com/Products/SOM/NXP-iMX8/iMX8MP-SOM-4GB-IND
> [2] https://www.olimex.com/Products/SOM/NXP-iMX8/iMX8MP-SOM-EVB-IND
> 
> Signed-off-by: Zoltan HERPAI <wigyori@uid0.hu>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx8mp-olimex-som-evb.dts   | 137 +++++
>  .../boot/dts/freescale/imx8mp-olimex-som.dtsi | 571 ++++++++++++++++++
>  3 files changed, 709 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-olimex-som-evb.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-olimex-som.dtsi
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 95ae85ab4..3657e3464 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -447,6 +447,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-navqp.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-enc-carrier-board.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-smarc-universal-board.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-olimex-som-evb.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
>  imx8mp-phyboard-pollux-etml1010g3dra-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
>  	imx8mp-phyboard-pollux-etml1010g3dra.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-olimex-som-evb.dts b/arch/arm64/boot/dts/freescale/imx8mp-olimex-som-evb.dts
> new file mode 100644
> index 000000000..26fee72d5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-olimex-som-evb.dts
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2019 NXP
> + * Copyright 2026 Zoltan HERPAI <wigyori@uid0.hu>
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8mp-olimex-som.dtsi"
> +
> +/ {
> +	compatible = "olimex,imx8mp-som-evb", "fsl,imx8mp";
> +	model = "Olimex i.MX8MP-SOM-EVB";
> +
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +};
> +
> +&ecspi2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
> +
> +	status = "okay";
> +
> +	spidev1: spi@0 {
> +		reg = <0>;
> +		compatible = "rohm,dh2228fv";
> +		spi-max-frequency = <500000>;
> +	};
> +};
> +
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +
> +	status = "okay";
> +};
> +
> +&flexcan2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	eeprom: eeprom@50 {
> +		compatible = "atmel,24c16";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&snvs_pwrkey {
> +	status = "okay";
> +};
> +
> +&usb3_phy0 {
> +	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
> +	fsl,phy-tx-vref-tune-percent = <122>;
> +
> +	status = "okay";
> +};
> +
> +&usb3_0 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	dr_mode = "host";
> +
> +	status = "okay";
> +};
> +
> +&usb3_phy1 {
> +	vbus-supply = <&reg_usb1_host_vbus>;
> +	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
> +	fsl,phy-tx-vref-tune-percent = <116>;
> +
> +	status = "okay";
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_ecspi2: ecspi2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x82
> +			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x82
> +			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x82
> +		>;
> +	};
> +
> +	pinctrl_ecspi2_cs: ecspi2csgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x40000
> +		>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX		0x154
> +			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX		0x154
> +		>;
> +	};
> +
> +	pinctrl_flexcan2: flexcan2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX		0x154
> +			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX		0x154
> +		>;
> +	};
> +
> +	pinctrl_flexcan1_reg: flexcan1reggrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x154	/* CAN1_STBY */
> +		>;
> +	};
> +
> +	pinctrl_flexcan2_reg: flexcan2reggrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27	0x154	/* CAN2_STBY */
> +		>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-olimex-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-olimex-som.dtsi
> new file mode 100644
> index 000000000..9876d3e7b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-olimex-som.dtsi
> @@ -0,0 +1,571 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2019 NXP
> + * Copyright 2026 Zoltan HERPAI <wigyori@uid0.hu>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/usb/pd.h>
> +#include <dt-bindings/phy/phy-imx8-pcie.h>
> +#include <dt-bindings/leds/common.h>
> +#include "imx8mp.dtsi"
> +
> +/ {
> +	compatible = "olimex,imx8mp-som", "fsl,imx8mp";
> +
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_led>;
> +
> +		led_status: status {
> +			color = <LED_COLOR_ID_YELLOW>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x40000000 0 0xc0000000>,
> +		      <0x1 0x00000000 0 0x40000000>;
> +	};
> +
> +	pcie0_refclk: clock-pcie0 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
> +	reg_pcie0: regulator-pcie {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pcie0_reg>;
> +		regulator-name = "MPCIE_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usb1_host_vbus: regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb1_host_vbus";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_usb1_vbus>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio1 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name = "VSD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
> +
> +&A53_0 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_1 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_2 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_3 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&eqos {
> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@3 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			eee-broken-100tx;
> +			eee-broken-1000t;

Do you know what is actually broken here? Is it the PHY? The MAC? The
combination of MAC and PHY?

	Andrew
