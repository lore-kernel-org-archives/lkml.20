Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AE83C943B;
	Wed,  7 Oct 2026 13:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380630; cv=none; b=sKHV1ab6BNtaQ6DjhPKtuYBA7qOYdSVd94zvVRxLoxFMe29UdnB2qE+UWLzK2folB86tBGbsm8tt1C0C04DnLWj81j4CQp4Cnm6Fi3TG3vvZcBMDPFW45cHiCJBlbAQEU9okXGY430U/A34MjVirRpW9iy3hU5MuWcU5hoJFlhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380630; c=relaxed/simple;
	bh=F5vfh8QHu+qtNMotNaYYtyOLccH/IQsWQtNcJcpexH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9hEKyyaJCleUlm/BGEXKqmZ20oh6HSK+NZ+wAjSPhs8bsNVG8jqpITW+iHkyJPtDiOoZJxPgZhk6EYdPr8AjIFtSBnP+aR5dEV7covnX61Q+6Uztw3vt5A4OnnxqbYDqoKrdCAtyCWENHfLP9Xm50CBgH6Fpi/Zee0vIsWPf48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcXTCADw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcXTCADw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2E01F0089D;
	Wed,  7 Oct 2026 13:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791380620;
	bh=vgcFwCJzGbYNEURvP00GVWJD30QOYsmsKCg1eeIEYSM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DcXTCADweRafrfJAH4iKZAg50IGJx2S4ckJc7hR2mkyhD58pR/YllqoDQ94/UOw44
	 jwCboiMjhNe5lJvTPl54wtzxZngshNj++AQK+3ima+kgkT/2fCmXKKIomHMuN3zK3S
	 VQl/9jcDqmti2jcxJqsfJQQvAZs3+5JsY0hXRrxQaX/AecCTTku7txfbAOR9pwQt1V
	 bJgDB3oHZ1u07ZDeCaexBGMrU9WySij6VIODl3OR2NFLF1+wPuDgenOJYnQq8XKyY4
	 D0h30doh31TYsLeUQJe6Aq5KOcfhzDCL0rhLcF3FWsOSUGabGr754C+o36+UnMuSnR
	 nej/Xo1UW5KyQ==
Message-ID: <8cd59aae-4f68-4cf8-a12c-5c63b11d29c0@kernel.org>
Date: Wed, 7 Oct 2026 08:43:38 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: socfpga: agilex: add Agilex SoCDK
 multi-QSPI board
To: genevieve.chan@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261006025418.31931-1-genevieve.chan@altera.com>
 <20261006025418.31931-3-genevieve.chan@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20261006025418.31931-3-genevieve.chan@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


NIT: your commit header "arm64: dts: socfpga: agilex: add Agilex SoCDK 
multi-QSPI board"

Avoid using the same name multiple times. Please reword this to

arm64: dts: socfpga: agilex: add SoCDK multi-QSPI board

or

arm64: dts: socfpga: add Agilex SoCDK multi-QSPI board


On 10/5/26 21:54, genevieve.chan@altera.com wrote:
> From: Genevieve Chan <genevieve.chan@altera.com>
> 
> Add a device tree for the Agilex SoCDK fitted with the multi-QSPI
> daughter board. The daughter board replaces the single QSPI flash of
> the default SoCDK with four Micron MT25QU02G flashes on chip selects
> 0-3, which allows the system to use up to 1 GiB of QSPI storage.
> 
> The board is otherwise identical to the SoCDK and builds on
> socfpga_agilex.dtsi.
> 
> Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
> ---
> Changes in v2:
> - Rename file, compatible and model to drop the "agilex7f" prefix.
> - Reword commit message to describe the hardware.
> 
>   arch/arm64/boot/dts/intel/Makefile            |   1 +
>   .../intel/socfpga_agilex_socdk_multiqspi.dts  | 213 ++++++++++++++++++
>   2 files changed, 214 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex_socdk_multiqspi.dts
> 
> diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
> index b52cd2330cef..071bad408688 100644
> --- a/arch/arm64/boot/dts/intel/Makefile
> +++ b/arch/arm64/boot/dts/intel/Makefile
> @@ -2,6 +2,7 @@
>   dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
>   				socfpga_agilex_socdk.dtb \
>   				socfpga_agilex_socdk_emmc.dtb \
> +				socfpga_agilex_socdk_multiqspi.dtb \
>   				socfpga_agilex_socdk_nand.dtb \
>   				socfpga_agilex3_socdk.dtb \
>   				socfpga_agilex5_socdk.dtb \
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_multiqspi.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_multiqspi.dts
> new file mode 100644
> index 000000000000..0bf087fa7553
> --- /dev/null
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_multiqspi.dts
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026, Intel Corporation
> + */
> +#include "socfpga_agilex.dtsi"
> +
> +/ {
> +	model = "SoCFPGA Agilex SoCDK multi-QSPI daughter board";
> +	compatible = "intel,socfpga-agilex-socdk-multiqspi", "intel,socfpga-agilex";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +		ethernet2 = &gmac2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		led0 {
> +			label = "hps_led0";
> +			gpios = <&portb 20 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led1 {
> +			label = "hps_led1";
> +			gpios = <&portb 19 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led2 {
> +			label = "hps_led2";
> +			gpios = <&portb 21 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		/* We expect the bootloader to fill in the reg */
> +		reg = <0 0x80000000 0 0>;
> +	};
> +};
> +
> +&gpio1 {
> +	status = "okay";
> +};
> +
> +&gmac0 {
> +	status = "okay";
> +	/* PHY delays are configured via skew properties */
> +	phy-mode = "rgmii";
> +	phy-handle = <&phy0>;
> +
> +	max-frame-size = <9000>;
> +
> +	mdio0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +		phy0: ethernet-phy@4 {
> +			reg = <4>;
> +
> +			txd0-skew-ps = <0>; /* -420ps */
> +			txd1-skew-ps = <0>; /* -420ps */
> +			txd2-skew-ps = <0>; /* -420ps */
> +			txd3-skew-ps = <0>; /* -420ps */
> +			rxd0-skew-ps = <420>; /* 0ps */
> +			rxd1-skew-ps = <420>; /* 0ps */
> +			rxd2-skew-ps = <420>; /* 0ps */
> +			rxd3-skew-ps = <420>; /* 0ps */
> +			txen-skew-ps = <0>; /* -420ps */
> +			txc-skew-ps = <900>; /* 0ps */
> +			rxdv-skew-ps = <420>; /* 0ps */
> +			rxc-skew-ps = <1680>; /* 780ps */
> +		};
> +	};
> +};
> +
> +&mmc {
> +	status = "okay";
> +	cap-sd-highspeed;
> +	broken-cd;
> +	bus-width = <4>;
> +	clk-phase-sd-hs = <0>, <135>;
> +};
> +
> +&osc1 {
> +	clock-frequency = <25000000>;
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&usb0 {
> +	status = "okay";
> +	disable-over-current;
> +};
> +
> +&watchdog0 {
> +	status = "okay";
> +};
> +
> +&qspi {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "micron,mt25qu02g", "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <25000000>;

The devkit has 100 MHz, why is this card only 25M MHz?
> +
> +		m25p,fast-read;
> +		cdns,read-delay = <2>;
> +		cdns,tshsl-ns = <50>;
> +		cdns,tsd2d-ns = <50>;
> +		cdns,tchsh-ns = <4>;
> +		cdns,tslch-ns = <4>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			qspi_boot0: partition@0 {
> +				label = "Boot and fpga data";
> +				reg = <0x0 0x10000000>;
> +			};
> +		};
> +	};
> +
> +	flash@1 {
> +		compatible = "micron,mt25qu02g", "jedec,spi-nor";
> +		reg = <1>;
> +		spi-max-frequency = <25000000>;
> +
> +		m25p,fast-read;
> +		cdns,read-delay = <2>;
> +		cdns,tshsl-ns = <50>;
> +		cdns,tsd2d-ns = <50>;
> +		cdns,tchsh-ns = <4>;
> +		cdns,tslch-ns = <4>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			qspi_boot1: partition@0 {
> +				label = "Boot and fpga data";
> +				reg = <0x0 0x10000000>;
> +			};
> +		};
> +	};
> +
> +	flash@2 {
> +		compatible = "micron,mt25qu02g", "jedec,spi-nor";
> +		reg = <2>;
> +		spi-max-frequency = <25000000>;
> +
> +		m25p,fast-read;
> +		cdns,read-delay = <2>;
> +		cdns,tshsl-ns = <50>;
> +		cdns,tsd2d-ns = <50>;
> +		cdns,tchsh-ns = <4>;
> +		cdns,tslch-ns = <4>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			qspi_boot2: partition@0 {
> +				label = "Boot and fpga data";
> +				reg = <0x0 0x10000000>;
> +			};
> +		};
> +	};
> +
> +	flash@3 {
> +		compatible = "micron,mt25qu02g", "jedec,spi-nor";
> +		reg = <3>;
> +		spi-max-frequency = <25000000>;
> +
> +		m25p,fast-read;
> +		cdns,read-delay = <2>;
> +		cdns,tshsl-ns = <50>;
> +		cdns,tsd2d-ns = <50>;
> +		cdns,tchsh-ns = <4>;
> +		cdns,tslch-ns = <4>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			qspi_boot3: partition@0 {
> +				label = "Boot and fpga data";

Sashiko's comment on this is valid. You give these label a unique name, 
"Boot and fpga data 3"


Dinh

