Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF355372FF;
	Tue, 29 Sep 2026 16:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701190; cv=none; b=Z3+F6t2pH7aTDs8UntIe12efOW2koUfC17w40ifY28KeJqroo1oVcLzZAu4zJONsTvl1Gg13S4+zGi9TktpyKpyfHKm0Y/cIPXBjHkjsKRJCrQYHD0cJumtFHcS/6zMnERa3K1ZBU3VoMs0BMSJPCuFp7uyl1CnmysBnzsk6OWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701190; c=relaxed/simple;
	bh=J1+6xwDV8EuHmy0sQKPAFEPOWIsDzRc5ctVmlv0ovDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PY3xcl8OXC6iQXcxc3OMGVHBiuxKthpZwV16BmrQkF6J0Os27h/XTgHXcJzex/tDS6LWYK2bYbZawcFK3qhFth+QE2tttiST/n8jJcXVE+8qePi/8QcuGY8QGgFqSH/OlFs74HKKqfD7vLoRxKDQABQ1ADvNvMz4VfbcN/QpMeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3ujcfgR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3ujcfgR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B930A1F00893;
	Tue, 29 Sep 2026 16:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790701189;
	bh=QZCLRTQ9xYI/d2c42h8rqFs6nxa/dYI93im2TcbUTcw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=R3ujcfgR2PhlrEWvK2Fz43EnykvZXb9i7ct9vUqm4tt/x9X0llbqvJW/kuGR+6m3+
	 qK9ofHj498e3z5s+O9sSr4YMbkqIO0rqOulaRX6lpDioxmaJeNVhiWao0Kg9YdsMPQ
	 gtCgFFHSrXDWOwK/8ie5UrAWoXQ2Ynr+9+48aFZh6IGRUuqpaMIrRBDcJBdEuZqybu
	 XpsOk1FQYh4kZ9wmKcDVa9LGABbzYaZwCN+RhXcJFmBZaNRcCTAosfAa4EpsD7L5Ww
	 TF8LKCvws/qLpyH6rdqGGrrjKikwsIYDBrDAgLQGczKi9js0ohlSz2ngIkJgCijvWE
	 JK5oGG45PIIwQ==
Message-ID: <5245043a-e24f-438b-9ddb-7dd3f6fd6b18@kernel.org>
Date: Tue, 29 Sep 2026 11:59:47 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] arm: dts: altera: add Draeger M48 CPU Module
Content-Language: en-US
To: Petko Manolov <petko.manolov@konsulko.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, arnemaximilian.richter@draeger.com,
 martynas.grybauskas@draeger.com
References: <20260929134058.819371-1-petko.manolov@konsulko.com>
 <20260929134058.819371-4-petko.manolov@konsulko.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260929134058.819371-4-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/29/26 08:40, Petko Manolov wrote:
> M48 is a heterogeneous board made by Draeger that is based on two
> independent cpus, that are monitoring each other.  One of them is
> imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
> independently off qspi.
> 
> This one adds the DT for the Altera SoCFPGA part of M48.
> 
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> ---
>   arch/arm/boot/dts/intel/socfpga/Makefile      |  1 +
>   .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 91 +++++++++++++++++++
>   2 files changed, 92 insertions(+)
>   create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> 
> diff --git a/arch/arm/boot/dts/intel/socfpga/Makefile b/arch/arm/boot/dts/intel/socfpga/Makefile
> index 8df0976da01c..cdcea11abdfa 100644
> --- a/arch/arm/boot/dts/intel/socfpga/Makefile
> +++ b/arch/arm/boot/dts/intel/socfpga/Makefile
> @@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
>   	socfpga_arria10_mercury_aa1_st1_emmc.dtb \
>   	socfpga_arria10_mercury_aa1_st1_qspi.dtb \
>   	socfpga_arria10_mercury_aa1_st1_sdmmc.dtb \
> +	socfpga_cyclone5_draeger_m48.dtb \
>   	socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb \
>   	socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb \
>   	socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb \
> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> new file mode 100644
> index 000000000000..85daa839c314
> --- /dev/null
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
> + */
> +#include "socfpga_cyclone5.dtsi"
> +
> +/ {
> +	model = "Draeger M48 Cyclone V SoC";
> +	compatible = "draeger,socfpga-m48", "altr,socfpga-cyclone5", "altr,socfpga";
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@0 {
> +		name = "memory";

Sashiko's comment about this is true.

> +		device_type = "memory";
> +		reg = <0x0 0x40000000>;
> +	};
> +
> +	aliases {
> +		/* this allow the ethaddr uboot environmnet variable contents

s/environmnet/environment

> +		 * to be added to the gmac0 device tree blob.
> +		 */
> +		ethernet0 = &gmac0;
> +	};
> +};
> +
> +&gmac0 {
> +	status = "okay";
> +	phy-mode = "rgmii-id";
> +	rxc-skew-ps = <1860>;
> +	rxd0-skew-ps = <0>;
> +	rxd1-skew-ps = <0>;
> +	rxd2-skew-ps = <0>;
> +	rxd3-skew-ps = <0>;
> +	rxdv-skew-ps = <0>;
> +	txc-skew-ps = <900>;
> +	txd0-skew-ps = <0>;
> +	txd1-skew-ps = <0>;
> +	txd2-skew-ps = <0>;
> +	txd3-skew-ps = <0>;
> +	txen-skew-ps = <0>;

Sashiko's comment about these PHY properties is also correct. Take a 
look at commit dabb5db17c06 ("ARM: dts: imx6qdl: move phy properties 
into phy device node").


> +};
> +
> +&gpio0 {
> +	status = "okay";
> +};
> +
> +&gpio1 {
> +	status = "okay";
> +};
> +
> +&gpio2 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +	clock-frequency = <100000>;
> +
> +	eeprom_mac: eeprom@50 {
> +		compatible = "atmel,24c08";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&mmc0 {
> +	status = "okay";
> +};
> +
> +&qspi {
> +	status = "okay";
> +
> +	flash: flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
Sashiko's message here is a false positive. You can ignore.

Thanks,
Dinh
