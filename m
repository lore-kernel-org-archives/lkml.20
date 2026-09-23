Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C348953163A;
	Wed, 23 Sep 2026 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175414; cv=none; b=a4Ey8MKJ76t5T9wK30hBAuQDnz+VVdzQjxjNUEmGk/fr5jPqgbotgsqWeZOIcHJJSyr9gU2YsaxPgm8+SEPPDvn7fob8OFIRMHBUG8EiT6jg6PK5jMqZWDybq8UiOkN/5qa+in9brtp/Do8SjqhIngbDpQsCIVFIoEhP8vSSfos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175414; c=relaxed/simple;
	bh=+NoCwNQno1x3g8OGbl0mW+5uJcHCveny72+JeTY7Ez0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2PQXzVjJINrLKyR88UTQrWIs6L9f20oNsFR9mkw9dBjran6U7Dm2MXsoOuDO144XuQfQKU69Cvd09kHH35Tpmpj3ySLONF4gc2T8DzN77hVY8w3RvIUx4CmAqNcXed7w/qLHXjt9i0VMtBLqCKPEgc/nxcB0jfYe2pc7aaOoX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLZPuEF5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLZPuEF5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790175413; x=1821711413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+NoCwNQno1x3g8OGbl0mW+5uJcHCveny72+JeTY7Ez0=;
  b=cLZPuEF5VVYsRQFekYsAJiTqeTvs6RRrersuGRtFwx0bcR7SXr8TpA3e
   qqBZwtDv8zfeNM+q8boNalTIdRsy3LNSlPaoYjiS8vox7mmup8zmhIgEM
   t+JMFk8XqF0+vQfvJd1bcxEyrsBKCN5sq2GBl24MmG+0j+9KtIiiHIPcQ
   dpx8RKbptlxlx0RTe24QoZCUDGHsQjp0mfFFwEA7eBq0ZHj67Vf+V9akA
   nzenVPCdMiEjtTiQKtAdF7wDmCHSU5J2lTHG35GXh34dSJsnSNq35yNuC
   96wWKKXhSrPcVw+xMuUxcJRsYt7ABcAoTSKEYG0HDBGHFPeRtoYYTjlH3
   g==;
X-CSE-ConnectionGUID: 68Dgm0lcRWijjeWEjjS+tw==
X-CSE-MsgGUID: ApnoldtVSDKcHDYanbkKig==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90994721"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90994721"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:56:51 -0700
X-CSE-ConnectionGUID: Ttchn/a4TTCaFMrPmeaoOQ==
X-CSE-MsgGUID: olsR4xbuTqq4VohNXYcoVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4730903"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:56:49 -0700
Date: Wed, 23 Sep 2026 16:56:41 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: add vicap node to rk3576
Message-ID: <arPoWFbmckTv3m2H@mdjait-mobl>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
 <20260921-vicap-rk3576-v2-5-0a4582e20c72@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vicap-rk3576-v2-5-0a4582e20c72@gmail.com>

Hello Amin,

Thank you for the patch!

On Mon, Sep 21, 2026 at 05:30:01PM +0200, Amin Gattout wrote:
> Add the device tree node for the Video Capture (VICAP) unit of the
> RK3576 and its IOMMU, and connect the VICAP to the two MIPI CSI-2
> receivers that are usable with the MIPI D-PHYs in full mode.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
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

small nit:
Maybe add a blank line before vicap.

> +		vicap: video-capture@27c10000 {
> +			compatible = "rockchip,rk3576-vicap";
> +			reg = <0x0 0x27c10000 0x0 0x800>;
> +			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
> +				 <&cru DCLK_VICAP>,
> +				 <&cru CLK_VICAP_I0CLK>, <&cru CLK_VICAP_I1CLK>,
> +				 <&cru CLK_VICAP_I2CLK>, <&cru CLK_VICAP_I3CLK>,
> +				 <&cru CLK_VICAP_I4CLK>;

[..]

--
Kind Regards
Mehdi Djait
