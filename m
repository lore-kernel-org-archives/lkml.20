Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C584D5963;
	Mon, 28 Sep 2026 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605087; cv=none; b=KSewCJF1+Ehq0c7una3BF7oU2J+q7NSmIZ2+81tYX134dEoiuj3MMRaR89wmNYU4B5DfRz0A/ND9rhEZIRIkH7ivXG8Js92jEIK7C60e8ZT8f1AI3m8mtRZoDW5lyBHzd7ctPbFMiZFZANgATJsdloIrkW04BUDf6xRI+wAPn0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605087; c=relaxed/simple;
	bh=oC4dcK6ekFud3utm3TycKV8J6r6uQ2BvDv1hV4yYsls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJ7UI53Gq2Jj9aHV6sru9Yj0tBbrZvqGlOLOlVGkejrolk7PJxkXTb4cwGqQ+AaUPj56BTDsR7pGGx2PJcQcjMxPLT5jqhVMu+S8uuab0i0De9xzLKscVqPV5IlEgrmY3DO7b1G5ztsPMkVHImQ2604Zb1/J3+e/umGwd4kB7nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmMlw1QX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmMlw1QX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B600A1F000FF;
	Mon, 28 Sep 2026 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790605085;
	bh=tQ920rvZgVEbAl7BGN+QLyu5bwYVgSL0f0bLg3HVZdw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lmMlw1QX+1fLQEQzkuPRUq+ccHr2gos7PO6ruhxvX1/fqKkK1yCzeiim8oOqYhuVl
	 mzyEzeoe9T/7MsA98wkUhKN7oanCpq4Fddh8Ydy443BuD505FrxVqOm9QJFWtQMAZw
	 XGKT7zzCJxjJVAZykEu0vCZg6QQKL98grpkybEGlZh5EFuINlT++7aW4PzxTyumJt3
	 x1ZNsMFDqtKIZOsI/lixVlkXYdtzrEcMnuN6KMc/ul+VEkZmh2e45GdSp80A27t8Hp
	 yxX4ho1glDo/tDYQegI+KCkga8ZgIfdbMGCoTHNFn9ZmcWQKorbxtppJcyFQyFro2u
	 ZSyH4dImDyeng==
Message-ID: <ff085338-6310-42ac-8023-bdf6d48ad103@kernel.org>
Date: Mon, 28 Sep 2026 09:18:03 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] arm: dts: altera: add Draeger M48 CPU Module
Content-Language: en-US
To: Petko Manolov <petko.manolov@konsulko.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, arnemaximilian.richter@draeger.com,
 martynas.grybauskas@draeger.com
References: <20260921090735.3174292-1-petko.manolov@konsulko.com>
 <20260921090735.3174292-4-petko.manolov@konsulko.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260921090735.3174292-4-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/21/26 04:07, Petko Manolov wrote:
> M48 is a heterogeneous board made by Draeger that is based on two
> independent cpus, that are monitoring each other.  One of them is
> imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
> independently off qspi.
> 
> This one adds the DT for the Altera SoCFPGA part of M48.
> 
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> ---
>   arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
>   .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 123 ++++++++++++++++++
>   2 files changed, 124 insertions(+)
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
> index 000000000000..dae809c02adb
> --- /dev/null
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
> + */
> +#include "socfpga_cyclone5.dtsi"
> +
> +/ {
> +	model = "Draeger M48 Cyclone V SoC";
> +	compatible = "draeger,m48", "altr,socfpga-cyclone5", "altr,socfpga";
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@0 {
> +		name = "memory";
> +		device_type = "memory";
> +		reg = <0x0 0x40000000>;
> +	};
> +
> +	aliases {
> +		/* this allow the ethaddr uboot environmnet variable contents
> +		 * to be added to the gmac0 device tree blob.
> +		 */
> +		ethernet0 = &gmac0;
> +	};
> +
> +	soc {
> +		gpio3: gpio@ff202000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0xff202000 0x20>;
> +
> +			portd: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				snps,nr-gpios = <2>;
> +				reg = <0>;
> +			};
> +		};
> +
> +		gpio4: gpio@ff202020 {

Any chance you can point me the where you got this information for gpio3 
and gpio4?

According to all my documentations, the Cyclone5 SoCFPGA has 3 GPIO 
ports, and those are already mapped in the DTSI. The address space that 
you have specified here is for FPGA bridge. Which leads me to believe 
that this GPIO is in the FPGA.

Thanks,
Dinh


