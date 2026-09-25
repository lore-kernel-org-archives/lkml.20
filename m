Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DF13FFAA4;
	Fri, 25 Sep 2026 18:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360454; cv=none; b=Wko5YrAISOlNTsbubL00TtWL0XyKIql7fLJhOCTrra7oDOhcDyU5mjZW3ZjQZEfrkFYJkKXW0tJoeYYreycNKDUPtLhQO+QYJaB1BhR1hb4ikcGE4/s3PrkseVvtKaUv4RMSYCD7XuqzDj8pe0xYdiEs/FzYfi03FP4GGGh3ou8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360454; c=relaxed/simple;
	bh=e59QF1/gJAzfBLahIlarB/qRJvoLqmihh+ZQ0pZr9c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBvikgiXaHiJ3srb/NGYXErbGhxODFJ5aYzkP5gN3aLKK65dlK1uQcEs8jcsonqWbNZmUDMeMSjvSxGP1P0SXM8I4bjc7ZBxTkiDbPW49E0TdlEqPGsq9Yc7wH77EuqH8U5utRWcCiT8Fq+5sb7YFbMeEwLcn/t0azFgftTp4zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8FVwLxh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8FVwLxh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7B51F000FF;
	Fri, 25 Sep 2026 18:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790360452;
	bh=XEVZQpWQ1S8SUFjagVACI8LuHkxv6HV9CkdMaoCHFak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P8FVwLxhelz5DhaP9jRK/vtAAw1AbNE5cuh+MhpMM7Eq0pypGgR6WZV2ixPgcynoM
	 YBtWVOWZVab0U73ghJ79Y558VJpkcPP5U2EogTneu4uRHfWSLV05YHnCcr270OT6Rb
	 rN+iV30P625vWLODI6PsrDxSp1Jm3yH2Zi0PkitQuRu6LGbAVf59Zq6jDGJD4fJXEc
	 YAJzc8g+5qkbjZOjo34WhknKsMKB4QZx1OrU/ALMPBe5sQJbzcZuBJ1kHhZO1DcPLN
	 hHa23govUbNGT8+iTzTQ8w+OnSQbNHEBCe86/vpKrIpipjft0JWxuo4Xwv8uy6ke/p
	 uU5/L8Ob2mVFw==
Date: Fri, 25 Sep 2026 13:20:49 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Fix USB interrupts in Glymur DT
Message-ID: <ara7cNuOCghH2p9m@zenbook>
References: <20260803-glymur-dt-usb-fixes-v1-1-0f5f52853102@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-glymur-dt-usb-fixes-v1-1-0f5f52853102@oss.qualcomm.com>

On Mon, Aug 03, 2026 at 09:56:03AM +0530, Krishna Kurapati wrote:
> In Glymur, DRD capable USB Nodes are missing the HS Phy IRQ. Also, fix the
> pwr_event and hs_phy interrupt numbers in Multiport coontroller node.
> 
> While at it, the dp and dm interrupt numbers have been swapped on HS only
> usb controller. Fix them up.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> This series has only been compile tested.
> 
> Binding depedency:
> https://lore.kernel.org/all/20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com/

Please resend when this binding has landed.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f04058d2e089..7a71297db481 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -4574,11 +4574,13 @@ usb_0: usb@a600000 {
>  
>  			interrupts-extended = <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&pdc 90 IRQ_TYPE_EDGE_BOTH>,
>  					      <&pdc 60 IRQ_TYPE_EDGE_BOTH>,
>  					      <&pdc 17 IRQ_TYPE_EDGE_BOTH>;
>  			interrupt-names = "dwc_usb3",
>  					  "pwr_event",
> +					  "hs_phy_irq",
>  					  "dp_hs_phy_irq",
>  					  "dm_hs_phy_irq",
>  					  "ss_phy_irq";
> @@ -4649,11 +4651,13 @@ usb_1: usb@a800000 {
>  
>  			interrupts-extended = <&intc GIC_SPI 875 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 878 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&pdc 88 IRQ_TYPE_EDGE_BOTH>,
>  					      <&pdc 87 IRQ_TYPE_EDGE_BOTH>,
>  					      <&pdc 76 IRQ_TYPE_EDGE_BOTH>;
>  			interrupt-names = "dwc_usb3",
>  					  "pwr_event",
> +					  "hs_phy_irq",
>  					  "dp_hs_phy_irq",
>  					  "dm_hs_phy_irq",
>  					  "ss_phy_irq";
> @@ -4725,11 +4729,13 @@ usb_2: usb@a000000 {
>  
>  			interrupts-extended = <&intc GIC_SPI 871 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 877 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&pdc 89 IRQ_TYPE_EDGE_BOTH>,
>  					      <&pdc 81 IRQ_TYPE_EDGE_BOTH>,
>  					      <&pdc 75 IRQ_TYPE_EDGE_BOTH>;
>  			interrupt-names = "dwc_usb3",
>  					  "pwr_event",
> +					  "hs_phy_irq",
>  					  "dp_hs_phy_irq",
>  					  "dm_hs_phy_irq",
>  					  "ss_phy_irq";
> @@ -4805,14 +4811,14 @@ usb_hs: usb@a200000 {
>  
>  			interrupts-extended = <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> -					      <&pdc 92 IRQ_TYPE_EDGE_BOTH>,
> +					      <&intc GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&pdc 57 IRQ_TYPE_EDGE_BOTH>,
> -					      <&intc GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
> +					      <&pdc 92 IRQ_TYPE_EDGE_BOTH>;
>  			interrupt-names = "dwc_usb3",
>  					  "pwr_event",
> +					  "hs_phy_irq",
>  					  "dp_hs_phy_irq",
> -					  "dm_hs_phy_irq",
> -					  "hs_phy_irq";
> +					  "dm_hs_phy_irq";
>  
>  			resets = <&gcc GCC_USB20_PRIM_BCR>;
>  
> @@ -4870,10 +4876,10 @@ usb_mp: usb@a400000 {
>  				      "noc_aggr_south";
>  
>  			interrupts-extended = <&intc GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> -					      <&intc GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
> -					      <&intc GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
> -					      <&intc GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
> -					      <&intc GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&pdc 12 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&pdc 11 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&pdc 14 IRQ_TYPE_LEVEL_HIGH>,
> 
> ---
> base-commit: 1e88112e60de707020f3def45af81f9a0180ee82
> change-id: 20260803-glymur-dt-usb-fixes-62f314d3f3a9
> 
> Best regards,
> --  
> Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
