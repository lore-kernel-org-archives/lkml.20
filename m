Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A01152E046;
	Fri, 18 Sep 2026 21:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766456; cv=pass; b=kXs8taFi1I3IY9oU9pTwuAPnyHD/LxHBW+EqmOyOR8Tbh7u5gXlXPbWUxybE/EQvnZNQrZeZdgkiHZV/HPiJMv9NOytWh/HzaEeRVx8ThSdnHk3g/OuOSbnF6vSPtMCCMF9/JXt8S/isZUcJxyLFQg+O5UaoB/+cIl9JoV2S968=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766456; c=relaxed/simple;
	bh=YOSjn37aLTWZke9iLmPvLBAxRSqkA1gloFnVqhWQZqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hcjzl64eU49EH6ZQK2hu+0nz08WB3g2Uh2aBtmD7yV/+QHbilqqThhgd8p/caRX3WmQaKX8onrHD5KK5fsKYVOB63+86rqNydt2nXn8Uh72lS5oO4Uien+Dy3/fChKM+4cWQ7WJ8slRQ6w7yYj1XsGrEDGe4jJ6jqAve4jP3x5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=HmIQKc6O; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="HmIQKc6O"
ARC-Seal: i=1; a=rsa-sha256; t=1789766443; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aK8T1LCJElHchFVo//zNjR2sWeqf0MSwb6MNa6AWx6JaIOpmkHAmxrqfJtlDx3QH3gGz11+7fyJKCbwuO0yMzKzI/Z61PbN0fp4Igsde2Rj4//D3a+TdAyZngezj2r7hf5ecUn2855CUbhJowlZEs+uhcsMQJCvfBk7UmB4/lzE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789766443; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=H+P7YnXPfz9ptQy86PJm7ONmSOKBYxrU4NYx2d3q4yI=; 
	b=Ufe2BD5RNyzuwkIIEXSkOL+AcMqsYp04pJu4bS+9s6Xpmr2Ny+voJYdU3lZwh/HQrrDjQBosN5GP+egVzOzjnRrmaNf1ZVOS40n0mHRLZ8nvpgiL2vEY5cAJrpk4angEf5xbORIzlh29EsosS8od7etZKVdPvU88mlONSvfwnp4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789766443;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=H+P7YnXPfz9ptQy86PJm7ONmSOKBYxrU4NYx2d3q4yI=;
	b=HmIQKc6Oei1tc7AfFr/dCrlZ1rqSVfx/+qfYh4en9RZB7AlszKpFSbRQuvZ8vk6m
	9tN17nymSlAtcBjiywF3PGGDQylNDIpm6WpqGX9XiYR5LVpPaYCLN1eFK7awiWo6bDd
	aj2S5Fxlz4SS5/+lok8V80o2Ns3RVJSFRse9FDYE=
Received: by smtp.zohomail.com with SMTPS id 1789766441920465.471558146431;
	Fri, 18 Sep 2026 14:20:41 -0700 (PDT)
Message-ID: <7a419924-01ea-4de7-b662-18b0ca62082a@collabora.com>
Date: Fri, 18 Sep 2026 23:20:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: add vicap node to rk3576
To: Amin Gattout <amin.gattout@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
 <20260915-vicap-rk3576-v1-3-d3f5eb58a0b5@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260915-vicap-rk3576-v1-3-d3f5eb58a0b5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Amin,

Thanks for the patch, LGTM!

On 9/15/26 14:27, Amin Gattout wrote:
> Add the device tree node for the Video Capture (VICAP) unit of the
> RK3576 and its IOMMU, and connect the VICAP to the two MIPI CSI-2
> receivers that are usable with the MIPI D-PHYs in full mode.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 83 ++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index cbf8b70cc15a..0c46accf5657 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1323,6 +1323,81 @@ vdec_mmu: iommu@27b00800 {
>  			rockchip,disable-mmu-reset;
>  			#iommu-cells = <0>;
>  		};
> +		vicap: video-capture@27c10000 {
> +			compatible = "rockchip,rk3576-vicap";
> +			reg = <0x0 0x27c10000 0x0 0x800>;
> +			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
> +				 <&cru DCLK_VICAP>,
> +				 <&cru CLK_VICAP_I0CLK>, <&cru CLK_VICAP_I1CLK>,
> +				 <&cru CLK_VICAP_I2CLK>, <&cru CLK_VICAP_I3CLK>,
> +				 <&cru CLK_VICAP_I4CLK>;
> +			clock-names = "aclk", "hclk", "dclk",
> +				      "iclk", "iclk1", "iclk2", "iclk3", "iclk4";
> +			iommus = <&vicap_mmu>;
> +			power-domains = <&power RK3576_PD_VI>;
> +			resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
> +				 <&cru SRST_D_VICAP>,
> +				 <&cru SRST_VICAP_I0CLK>, <&cru SRST_VICAP_I1CLK>,
> +				 <&cru SRST_VICAP_I2CLK>, <&cru SRST_VICAP_I3CLK>,
> +				 <&cru SRST_VICAP_I4CLK>;
> +			reset-names = "arst", "hrst", "drst",
> +				      "irst0", "irst1", "irst2", "irst3", "irst4";
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				vicap_dvp: port@0 {
> +					reg = <0x0>;
> +				};
> +
> +				vicap_mipi0: port@1 {
> +					reg = <0x1>;
> +				};
> +
> +				vicap_mipi1: port@2 {
> +					reg = <0x2>;
> +
> +					vicap_mipi1_input: endpoint {
> +						remote-endpoint = <&csi1_output>;
> +					};
> +				};
> +
> +				vicap_mipi2: port@3 {
> +					reg = <0x3>;
> +				};
> +
> +				vicap_mipi3: port@4 {
> +					reg = <0x4>;
> +
> +					vicap_mipi3_input: endpoint {
> +						remote-endpoint = <&csi3_output>;
> +					};
> +				};
> +
> +				vicap_mipi4: port@5 {
> +					reg = <0x5>;
> +				};
> +
> +				vicap_toisp0: port@10 {
> +					reg = <0x10>;
> +				};
> +			};
> +		};
> +
> +		vicap_mmu: iommu@27c10800 {
> +			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
> +			reg = <0x0 0x27c10800 0x0 0x100>;
> +			interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
> +			clock-names = "aclk", "iface";
> +			power-domains = <&power RK3576_PD_VI>;
> +			rockchip,disable-mmu-reset;
> +			#iommu-cells = <0>;
> +			status = "disabled";
> +		};
>  
>  		csi1: csi@27c90000 {
>  			compatible = "rockchip,rk3576-mipi-csi2", "rockchip,rk3568-mipi-csi2";
> @@ -1346,6 +1421,10 @@ csi1_in: port@0 {
>  
>  				csi1_out: port@1 {
>  					reg = <1>;
> +
> +					csi1_output: endpoint {
> +						remote-endpoint = <&vicap_mipi1_input>;
> +					};
>  				};
>  			};
>  		};
> @@ -1372,6 +1451,10 @@ csi3_in: port@0 {
>  
>  				csi3_out: port@1 {
>  					reg = <1>;
> +
> +					csi3_output: endpoint {
> +						remote-endpoint = <&vicap_mipi3_input>;
> +					};
>  				};
>  			};
>  		};
> 

