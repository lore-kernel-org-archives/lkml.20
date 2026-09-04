Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4995143C7DB;
	Fri,  4 Sep 2026 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538590; cv=none; b=f0zLY+DeJwRojONN3GKck85xL2c8EeDRDcCDxw7R9i//4ODZlso7gGgzGlnKU2NjdyCrx+Uz0TqxJD6VCVH0Bt37Tlyz/z2ipKBfrROg//jxkSW8mf6Z5mLVTd+lRfaEmDwGlUAHXJt2I3IOs3cIeuv4XWJBgxbCG7DiWIXDRYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538590; c=relaxed/simple;
	bh=ENF5CJrzUm1jx3wCBjOZbXJoT4YwtTSOEJB+6VKaEQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=C5v6U7P8Ywy44wDNdmtEnkqAIoNzHTxTH3tywYHbhI+GdN9sTZ5yoXTxZwh6anWEgwXaVgHSG9ss3S0rsdcgpj+bP9S4Ik/JQX4XArULVydytoX/d/mDGmM9MP7xYxmSpEMy4iBbmldCVa7/JWkSVz+TeQ/IykLJtVHnGiwnWg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEr4RSbE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEr4RSbE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855B21F00A3D;
	Fri,  4 Sep 2026 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788538589;
	bh=TZQaYx1p3yyeHnI+dzH7iGD1fUYRezjYN+8LXSYZuKQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=NEr4RSbEsH2hnQ9K637Yu6RNPo/yeBct2JDlt3n2cB4AnkrDRl2qmZkNjHe8WEigo
	 HsB2KoDBVodWOuu0Ssj/DofNFSojx3INv7FangVku7to/BjCRtl9SGryrOOz5V3hHe
	 E66eLNj7cAMLui4Ws37pqtvyw5cT4uExB2eiotXVwAqWwhHosvLbVrp/d0o3otuUmf
	 kW1Cm0h0pXRqpamFPWpjAbA1f/GVErERm/UGz4PnWPyjacspkL8xTSs+xb3DudqMWO
	 ygic449c2u53GuHi5Q1hynd4WgNnOx0NYsf6hvR0xcBDpdRY7XJBAGSkPJL+7N82Qo
	 M9+bWZCXNHyUw==
Message-ID: <8628bbe8-8bb0-4c36-93ca-2b9ba05c39f5@kernel.org>
Date: Fri, 4 Sep 2026 11:16:27 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND v2 1/5] arm64: dts: socfpga: agilex5: add FPGA
 manager and region nodes
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1786520346.git.adrian.ho.yin.ng@altera.com>
 <c1210302cb5dd630dfb5d98b7e0920fb38837822.1786520346.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <c1210302cb5dd630dfb5d98b7e0920fb38837822.1786520346.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/12/26 15:50, Adrian Ng Ho Yin wrote:
> Add the fpga-mgr child node under the svc firmware node and a fpga-region
> node to enable FPGA configuration and partial reconfiguration on Agilex5.
> 
> Also enable the SMMU by removing the disabled status from the smmu
> node, which is required for the svc driver to allocate DMA buffers
> within the SDM-accessible address range.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index 02e62d954e94..1cd9773a1500 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -85,9 +85,20 @@ svc {
>   			method = "smc";
>   			memory-region = <&service_reserved>;
>   			iommus = <&smmu 10>;
> +
> +			fpga_mgr: fpga-mgr {
> +				compatible = "intel,agilex-soc-fpga-mgr";
> +			};
>   		};
>   	};
>   
> +	fpga-region {
> +		compatible = "fpga-region";
> +		#address-cells = <0x2>;
> +		#size-cells = <0x2>;
> +		fpga-mgr = <&fpga_mgr>;
> +	};
> +
>   	psci {
>   		compatible = "arm,psci-0.2";
>   		method = "smc";
> @@ -385,7 +396,6 @@ smmu: iommu@16000000 {
>   			interrupt-names = "eventq", "gerror", "priq";
>   			dma-coherent;
>   			#iommu-cells = <1>;
> -			status = "disabled";

I've applied this patch with above corrected.

Dinh

