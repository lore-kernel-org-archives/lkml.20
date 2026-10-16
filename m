Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA05144C50D;
	Fri, 16 Oct 2026 11:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148939; cv=none; b=jLmvw8llrYN1e5npNEq3S94eQ0n6cu+HAA9pTkKeE4jyEc6m+FkNdBHYlqT0UmNRh2XA4pcTOHxPLECeIzrHLWLaYL1v3Wfh9guoNLTforkq70kP4Zk4SQ0IJH7f9XTDKindq8CFtJKlLEajgjN6/5WNRed5JYyqqUYSj+ky76Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148939; c=relaxed/simple;
	bh=87aygR43H5HflHNrWdZAK1MO6zqIDhPgXB/KcJp1mq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRmWh1sirQATdfqdUweWSkWf/OIfR5qkPXn0ShxzaBBIyPe1TlUBorY9fgS0hyqNN+WQnvtwTWSc2ny5DkesYAKBVecCduypHexTq4Vmv3br3Jc4M7sA44NMnaTMcDiFWANCwj8T4pCu4WoXq2GjIt767ueJjqd0him2GTzCJEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbKFOac7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbKFOac7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E341F000C4;
	Fri, 16 Oct 2026 11:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792148935;
	bh=2SgExio+T9oySIHfGEGctDAXMVZjtnwyFNZT1jGrGj0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MbKFOac737ebsrLL7jUWo4It+FD+7iWd2eydz4vdggouehW9Smr9feCw0Lz9hh44e
	 lRjjReh37rmNeSMevOpYmsAuaykeDU9FvrslW3+0pmxwruUgFB+ANxUF8Gyj/Lt0/f
	 rSFZwWOZoQY28olRDkpfWRZ4D/IX+2F5HmJcU8Vtq7/XmEhDt0g546fzFvvjTrGoVr
	 tCweyQ5C0Kezdz9A3oPvEZWwFYZRDN2NAjvEgeOfRoiEVoLoc2WsOpGh7uVKQib4GN
	 zTNzVPQV+hrqcZSvD3sZ2RLpj/eKOrogDKADAh7ggihpRTIGRPk3TlyX0+/GZuYAMX
	 5rKZcr7FCGX1w==
Message-ID: <62afc804-8a9f-42c0-93a5-8b0b7f3b84f0@kernel.org>
Date: Fri, 16 Oct 2026 06:08:53 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/3] arm: dts: altera: add Draeger M48 CPU Module
Content-Language: en-US
To: Petko Manolov <petko.manolov@konsulko.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, arnemaximilian.richter@draeger.com,
 martynas.grybauskas@draeger.com
References: <20261015145804.3632839-1-petko.manolov@konsulko.com>
 <20261015145804.3632839-4-petko.manolov@konsulko.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20261015145804.3632839-4-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/15/26 09:58, Petko Manolov wrote:
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
>   .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 101 ++++++++++++++++++
>   2 files changed, 102 insertions(+)
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
> index 000000000000..314930a52de5
> --- /dev/null
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> @@ -0,0 +1,101 @@
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
> +		device_type = "memory";
> +		reg = <0x0 0x40000000>;
> +	};
> +
> +	aliases {
> +		/* this allow the ethaddr uboot environment variable contents
> +		 * to be added to the gmac0 device tree blob.
> +		 */
> +		ethernet0 = &gmac0;
> +	};
> +};
> +
> +&gmac0 {
> +	status = "okay";
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy>;
> +
> +	mdio0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;

You also need this here:  compatible = "snps,dwmac-mdio"


Dinh

