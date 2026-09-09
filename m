Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D553A568FC8;
	Wed,  9 Sep 2026 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960977; cv=none; b=ZwiMoUSGcXkDTzGbVvMUHOngOhdb1ijn9SukNe5kv+qRhL7PMracZJ6SWaO3KhSFC6ist9eWBuXD/ubW1XawH07LdCtiWTdG685ltWaVm3ywvHoP6Az9rok8O3kWqWz/iw1Znythm+WHLKGw+6TmDEG2TvB31HT78S/8rjvgf6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960977; c=relaxed/simple;
	bh=vBp4e05DoyWVF/cBTIf7H7n1IVZTkp9qwiup7tOtmGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgnQJKRGaHhnUzrBC3ffMjqP9YOCxNUtRxr3sYN4fu5eUxx0Mw4KPlhvmdDHpkVmhgthmsdQwj7VynzLbrjmdTV3IGqWWQh0m7e0it8Ifre1jFmsyXr+jGVSGiCG8a/2IAilIfw9WQOySS2V+0rBJZIaYS9mU6V3Jf0FTh4gT8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWFB/cfk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWFB/cfk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E961F00A3F;
	Wed,  9 Sep 2026 13:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788960975;
	bh=TIaYDwtFaFZmmEO83q8h4VTEKFUfg7csPY0Bobz913g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JWFB/cfkBhvmgrGmoCaX+OuwqQQ6CWVdZqbaFJLJYxp0N7QZICAXELRmI7BeX2Ger
	 GMesIioV5FBNCi8QJ7F2NzLPiZb/zTUh7qiWc1dD/Tr0JdPDvOFpY5oC+HWXQ0lMaq
	 b3Q2adJf0XvmMPGnVB8limOt1UbHwgXBZyaqRmejAaqQ1r+PQlhLP2f2i73/u6vlE2
	 iSq7k/O1TXABuf16Nj4cxpp4wNqWxwWEo6KgF0Xo1P10AmL0kgzTodw1pgnJnUD+Ax
	 o+MMO7X2CeT2pZLMvVNmD3CDVOOOD5dkOagjnXZAvEPjmWf6YisPXyOjvYhpqqfq1Q
	 WkB8b6VcwH+0Q==
Message-ID: <0b682ab0-731d-49dc-a7f8-64c4d71bed71@kernel.org>
Date: Wed, 9 Sep 2026 08:36:14 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 3/3] Add socfpga devicetree for Draeger's M48 board.
Content-Language: en-US
To: Petko Manolov <petko.manolov@konsulko.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
 <20260909111513.2259643-4-petko.manolov@konsulko.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260909111513.2259643-4-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/9/26 06:15, Petko Manolov wrote:
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> ---
>   arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
>   .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 129 ++++++++++++++++++
>   2 files changed, 130 insertions(+)
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
> index 000000000000..6c5a8013d40c
> --- /dev/null
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
> + */
> +#include "socfpga_cyclone5.dtsi"
> +
> +/ {
> +	model = "Draeger M48 Cyclone V SoC";
> +	compatible = "draeger,M48", "altr,socfpga-cyclone5", "altr,socfpga";
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@0 {
> +		name = "memory";
> +		device_type = "memory";
> +		reg = <0x0 0x40000000>;
> +
> +		/* 1GB */

Stray comment?

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
> +			status = "okay";
> +
> +			portd: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				snps,nr-gpios = <2>;
> +				reg = <0>;
> +				bank-name = "SYNC_I";

bank-name? I don't see it documented anywhere.


Dinh
