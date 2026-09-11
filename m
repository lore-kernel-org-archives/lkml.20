Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31691F91E3;
	Fri, 11 Sep 2026 09:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119922; cv=none; b=uCiKmq0T1IlvSzIkrvfoxmxSagdRJEjyaG6Hewq55RvcWno1QlS9mKWwT7ZR5lU56YU8Zk65Tp65ezAclt1ui2uAZjgDBPbuDfXXrp/K70st34ewyKEeXRxvwpRA8hEMS12wZ1OolUZaufu6QDIId/d/QOsMGR/MUkh7xw70VrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119922; c=relaxed/simple;
	bh=AQjnisJP24hyrCD9AxpdLLMafK7ZjlxORRjMfAqen48=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DugcvRqNdil3z91nAf8aW4IhGDP2OvPkQzDoU6nZXoAPax2SXsbATplGYi1+SrJNTIvdRWZJzoPhHWdGZ+xazmsahey8ZtACAWWYd195DFgzb7PFnvgRCCW1H3556vTz6ySSeqwHwn75B/Ymxn4G77XOvJPYIuCACHKGSUtfjq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTp5ZVbv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTp5ZVbv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CB41F000FF;
	Fri, 11 Sep 2026 09:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789119921;
	bh=kK9cfd+AD/dt67wv8V2sR5uRACb7SCGAIFjPlX0iQ/g=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=bTp5ZVbvHgfrig6nkdLIfz1EtqgdZYJ49sVQMOTblspvSa9ZcyKBpM7LsPVUXmKQA
	 Rvrs89KqM2bx5gpYHX92lh/qUtydMtzuVLyh89SMm2ryJmkW6ahZRFTStaM5/hiTXY
	 bwxCh6zp7JmZDoI22WYKHL/XpaMb1TTg+CK6S88Qo5hPrsMddTVp5Mey9owFLQeWqC
	 KdT8Fcu8IXBQILlzoJFJfQEknZ0FLDgVrztQO/COWNKmwSOE+i9UotJVwmSrNT8IE/
	 Vy9EkIk7bCC9bz4Th9aLuDDkQc/HLU0mCCccoVadK1RaLdCpz7o1OSFGKM65tOGWo4
	 pmr9s0XY1v+8Q==
Message-ID: <7055515a-8892-4fc2-ab5c-81283e40e054@kernel.org>
Date: Fri, 11 Sep 2026 04:45:19 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3] arm64: dts: altera: Move all SoCFPGA files to
 dts/altera
Content-Language: en-US
To: evon.chiam@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <47719884b157863b2253b415daa447b417cd3419.1789048358.git.evon.chiam@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <47719884b157863b2253b415daa447b417cd3419.1789048358.git.evon.chiam@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/10/26 09:16, evon.chiam@altera.com wrote:
> From: "Chiam, Evon" <evon.chiam@altera.com>
> 
> The dts/intel/ directory contains two distinct families:
> - Altera SoCFPGA platforms (Stratix 10, Agilex, Agilex5, Agilex72,
>    Agilex7M, N5X)
> - Intel Keembay
> 
> All Altera SoCFPGA device trees already have a home in dts/altera/
> (Stratix 10 has been there since the directory was introduced). Move
> the remaining SoCFPGA DTS/DTSI files from dts/intel/ to dts/altera/
> to consolidate all Altera SoCFPGA device trees under a single
> directory. Only the Keembay files remain in dts/intel/.
> 
> Also drop the stale SoCFPGA MAINTAINERS path for
> arch/arm64/boot/dts/intel/. Keembay DT files there remain covered
> by ARM/INTEL KEEMBAY ARCHITECTURE
> 
> All inter-file includes are relative so no include paths need to
> change. The set of DTBs produced by dtbs_install is unchanged; they
> are simply built from dts/altera/ instead of dts/intel/.
> 
> No compatible strings or DTS/DTSI contents are modified; the device
> tree move is rename-only.
> 
> Link: https://lore.kernel.org/all/cd16fb78-551e-4630-83d6-a44a68e2e411@kernel.org/
> Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
> ---
> Changes in v3:
> - Drop stale SoCFPGA MAINTAINERS F: entry for arch/arm64/boot/dts/intel/
> 
> Changes in v2:
> - Reworded commit subject to drop redundant "device trees" and phrase
>    the move as "to dts/altera"
> 
> v1 patch link:
> https://lore.kernel.org/all/802bf0d27fbff9b1ddb6b9fc323a1a9f8f050f74.1788512748.git.evon.chiam@altera.com/
> 
>   MAINTAINERS                                        |  1 -
>   arch/arm64/boot/dts/altera/Makefile                | 14 +++++++++++++-
>   .../boot/dts/{intel => altera}/socfpga_agilex.dtsi |  0
>   .../{intel => altera}/socfpga_agilex3_socdk.dts    |  0
>   .../dts/{intel => altera}/socfpga_agilex5.dtsi     |  0
>   .../{intel => altera}/socfpga_agilex5_socdk.dts    |  0
>   .../socfpga_agilex5_socdk_013b.dts                 |  0
>   .../socfpga_agilex5_socdk_modular.dts              |  0
>   .../socfpga_agilex5_socdk_nand.dts                 |  0
>   .../dts/{intel => altera}/socfpga_agilex72.dtsi    |  0
>   .../{intel => altera}/socfpga_agilex72_socdk.dts   |  0
>   .../{intel => altera}/socfpga_agilex7m_socdk.dts   |  0
>   .../dts/{intel => altera}/socfpga_agilex_n6000.dts |  0
>   .../dts/{intel => altera}/socfpga_agilex_socdk.dts |  0
>   .../socfpga_agilex_socdk_emmc.dts                  |  0
>   .../socfpga_agilex_socdk_nand.dts                  |  0
>   .../dts/{intel => altera}/socfpga_n5x_socdk.dts    |  0
>   arch/arm64/boot/dts/intel/Makefile                 | 12 ------------
>   18 files changed, 13 insertions(+), 14 deletions(-)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex.dtsi (100%)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex3_socdk.dts (100%)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5.dtsi (100%)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk.dts (100%)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_013b.dts (100%)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_modular.dts (100%)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_nand.dts (100%)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72.dtsi (100%)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72_socdk.dts (100%)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex7m_socdk.dts (100%)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_n6000.dts (100%)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk.dts (100%)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk_emmc.dts (100%)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk_nand.dts (100%)
>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_n5x_socdk.dts (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15011f5752a9..98f374ae7586 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3590,7 +3590,6 @@ F:	arch/arm/boot/dts/intel/socfpga/
>   F:	arch/arm/configs/socfpga_defconfig
>   F:	arch/arm/mach-socfpga/
>   F:	arch/arm64/boot/dts/altera/
> -F:	arch/arm64/boot/dts/intel/
>   
Please separate this change into a separate patch. Otherwise, LGTM.

Dinh
