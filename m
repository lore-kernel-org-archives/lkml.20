Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC7649E129;
	Fri, 11 Sep 2026 15:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139820; cv=none; b=FtTfmjqkmYt5bC9NUfQOAW7Ok2SNvQOnK7gl3lccqN9c1bpDjfDiuet/749ID7k7w8EzNFd2mJodfGy2LPFtiSl+8DaqErgy185uujX5QIRAJNAa7rtbh+PO1mrI8/xU7I8DJskcUSwPN91tR0ZThQkyauFjJzBnnhGQWzYPto8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139820; c=relaxed/simple;
	bh=SH9LQjovDQKwYst9EmYx/0+2qn295mC9Q+2GFhxBYLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hFBHbRZM3bJhIYTmIFoGdGIFYLe/rlU47s2qH/Jhy/uHkEy2tD+JvGWmDFBgEInBj0SmgW8bjwdkTxkIaizrxxH7KoXGbNnLECh+Zb3LffPonlDoLJgVJ1y/3sE8zGOeUOksOWQELWO18/4gYLzLBEn9k+3JY4W71Yi7az2zL+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VrDyOKDU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VrDyOKDU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B05716A3;
	Fri, 11 Sep 2026 08:16:52 -0700 (PDT)
Received: from [10.57.6.75] (unknown [10.57.6.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 866A73F8C6;
	Fri, 11 Sep 2026 08:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789139816; bh=SH9LQjovDQKwYst9EmYx/0+2qn295mC9Q+2GFhxBYLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VrDyOKDUEAoDzxB/jtc1qwotnvW8CKelDYAZgbTzMT4DvT2KmQrcUOx7l+dSn5ZtP
	 xAXAzNyC5W13BfhS8cMlkUVH84i7/pvi5LoE5oNcq57voI6avTUmW34tSBFazyx+w3
	 gFA1eHbbiwzSuccwAOShQBbsFJ+TN697fe14Ecso=
Message-ID: <63a19617-9349-4dd4-b9cb-dc677edc387f@arm.com>
Date: Fri, 11 Sep 2026 17:16:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: Add SPC Glee 10.1 A64
To: jcarlosgl96@proton.me, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911-b4-spc-glee-a64-v1-v2-0-ed0b7ff02e0b@proton.me>
 <20260911-b4-spc-glee-a64-v1-v2-2-ed0b7ff02e0b@proton.me>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260911-b4-spc-glee-a64-v1-v2-2-ed0b7ff02e0b@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

thanks for taking the time to send this upstream!
Have you looked at the Pinetab .dts? That could serve as a guideline for 
the other peripherals. Typically many devices follow some Allwinner 
reference design, so are close to each other.

On 9/11/26 15:48, Juan Carlos Gutiérrez Lavado via B4 Relay wrote:
> From: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>
> 
> Add support for the SPC Glee 10.1 tablet based on the Allwinner A64.
> Describe the 2 GiB DRAM configuration, AXP803 PMIC, essential supplies,
> microSD, UART, battery monitoring and USB peripheral port. Leave eMMC

why is that? eMMC should be very easy to enable: you just need to figure 
out if it's 1.8V or 3.3V, the speed (mode) in a BSP booted system should 
give you some clue.
> and unverified peripherals disabled.
> 
> Include CPU operating points for frequency scaling and thermal cooling.
> Enable the PMIC USB supply and connect it to the PHY for VBUS detection.
> Keep the ALDO2 VCC-PL and ALDO3 VCC-PLL/AVCC supplies enabled, matching
> the stock firmware and the measured 1.8 V and 3.0 V baseline settings.
> 
> Tested with kexec into Linux 7.3.0-rc1 without regulator_ignore_unused:
> CPU frequency transitions, CPU cooling frequency cap, and USB supply
> unplug/replug detection with SSH reconnection. Cold-boot validation of
> this revision remains pending.
> 
> Signed-off-by: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>
> ---
>   arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>   .../boot/dts/allwinner/sun50i-a64-spc-glee.dts     | 143 +++++++++++++++++++++
>   2 files changed, 144 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index aa21f58a4..cc6687b39 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -21,6 +21,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.2.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab-early-adopter.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-spc-glee.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts
> new file mode 100644
> index 000000000..0f8f37b14
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2026 SPC Glee A64 Linux contributors
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-a64.dtsi"
> +#include "sun50i-a64-cpu-opp.dtsi"
> +
> +/ {
> +	model = "SPC Glee 10.1 A64";
> +	compatible = "onspc,glee-10-1-a64", "allwinner,sun50i-a64";
> +	chassis-type = "tablet";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x40000000 0x80000000>;
> +	};

Please no memory nodes, this is up to the bootloader (U-Boot) to detect 
and insert into the DTB.
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&mmc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins>;
> +	vmmc-supply = <&reg_dcdc1>;
> +	vqmmc-supply = <&reg_dcdc1>;
> +	broken-cd;
> +	bus-width = <4>;
> +	max-frequency = <25000000>;

Why is this? This would limit the SD card to just 12.5 MB/s, half of 
what it can do at High-Speed mode (at 3.3V).
If it can do 50 MHz (~25MB/s at 4 bits), you wouldn't need to enter a 
max frequency at all, as the 3.3V I/O supply would limit the frequency 
to that anyway.

> +	status = "okay";
> +};
> +
> +&r_rsb {
> +	status = "okay";
> +
> +	axp803: pmic@3a3 {
> +		compatible = "x-powers,axp803";
> +		reg = <0x3a3>;
> +		interrupt-parent = <&r_intc>;
> +		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +#include "axp803.dtsi"
> +
> +&axp_adc {
> +	status = "okay";
> +};
> +
> +&battery_power_supply {
> +	status = "okay";
> +};
> +
> +&reg_aldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <1800000>;
> +	regulator-name = "vcc-pl";
> +};
> +
> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-name = "vcc-pll-avcc";
> +};
> +
> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-name = "vcc-3v3";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1000000>;
> +	regulator-max-microvolt = <1300000>;
> +	regulator-name = "vdd-cpux";
> +};
> +
> +&reg_dcdc5 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1500000>;
> +	regulator-max-microvolt = <1500000>;
> +	regulator-name = "vcc-dram";
> +};
> +
> +&reg_dcdc6 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1100000>;
> +	regulator-max-microvolt = <1100000>;
> +	regulator-name = "vdd-sys";
> +};
> +
> +&reg_fldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1100000>;
> +	regulator-max-microvolt = <1100000>;
> +	regulator-name = "vdd-cpus";
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	status = "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode = "peripheral";

Is that really peripheral only? I guess it can do OTG, right? You hint 
at that above in the commit message. You would just need to specify 
usb0_id_det-gpios in the usbphy node below. If you are lucky, the BSP's 
/sys/kernel/debug/gpio would give you a hint which GPIO it is.

Cheers,
Andre

> +	status = "okay";
> +};
> +
> +&usb_power_supply {
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb0_vbus_power-supply = <&usb_power_supply>;
> +	status = "okay";
> +};
> 

