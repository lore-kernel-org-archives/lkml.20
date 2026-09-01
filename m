Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CA3473C88;
	Tue,  1 Sep 2026 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253089; cv=none; b=h8cAfYui9j6o7zTk7kBq9QAro24XhNCVxuD8HF4HmNNgn84e0C3Cl+AbOvG8a/tCacJ1jm0V5kzoAFqJ6KHp/4fiWab9231wrBh8Zzqf+mrmch/XmMCSzWc7CceDzYFBkAjZDf9HmZEfqK5jAp+EFsgn6xtxKO02AqUarr2ZkPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253089; c=relaxed/simple;
	bh=Dn9Xg91C/1thO31fkCEIbl0rMR4votQKC6FIQtp2kqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxbBRV55S7nNyxV08apeKJVeZ7vjMCFL57fbvEM0wyXGsGl90xDyK579xuFzQmLqlAKrCtiYr2Xur2eFTTrDbS3zPm1YwCdZJMlDP2TAsDiG3qtujcJRvM9GG1EK9HDqWKGqLg6VCyhGTewoQRB6By4jNQoeSONJ+wEoJa9YY0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvAF5DrV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvAF5DrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788253088; x=1819789088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dn9Xg91C/1thO31fkCEIbl0rMR4votQKC6FIQtp2kqc=;
  b=SvAF5DrVctRmnPGQcxSLHW5fR+biM7cT8PJFSXcaZDt9lqW2dJVUf58h
   OW0sgn2c1Oz8luaeZpTnJTwQ62EZ/KJrLBHmOowNqIpEiO4aXyoXam9bW
   zjTQ7Y93oEvEx4Cnh9fA1sT1rO1Cmj4XzaP/KLxy/86v0yOso3cF5mfnm
   YyIL6ZF9PeMHO3496ePoyuiWbRuDmv7JW35YZJxhb3qwK5vTucIxnvbi4
   Skjz9AefCJHoqq3eUa75md5k0dXu4kz/fxfScXFtRFWM9EJ9crHcCnVe/
   hILjEC+/As7vtc4LpxOw7np+tUEDRWuCzgwwC6uNF9w96K4shPMHWJ5E5
   g==;
X-CSE-ConnectionGUID: gMlpREwmT0uyFQ9cUV/Llg==
X-CSE-MsgGUID: BO4PLapyQKOU/7cY0hjvBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92542930"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="92542930"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 01:58:07 -0700
X-CSE-ConnectionGUID: czjYX5yyTDOsZtb1SZR0ug==
X-CSE-MsgGUID: Y14AxRADQre7S7wFBk1Gvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="265319657"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 01 Sep 2026 01:58:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1FEEE99; Tue, 01 Sep 2026 10:58:02 +0200 (CEST)
Date: Tue, 1 Sep 2026 10:58:02 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/19] thunderbolt: Make the ring register layout
 configurable
Message-ID: <20260901085802.GC106095@black.igk.intel.com>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-10-44bc9348683c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-10-44bc9348683c@kernel.org>

Hi,

On Sun, Aug 30, 2026 at 10:19:28PM +0200, Sven Peter wrote:
> The ring descriptor and options registers are laid out differently on
> the Apple NHI. Describe their offsets and strides with a
> tb_nhi_ring_layout struct that NHI drivers can override.

This is odd because Apple is sitting in USB-IF and they are behind the
original register layout so why they do not follow it themselves?

> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/thunderbolt/nhi.c   | 30 ++++++++++++++++++++++++------
>  drivers/thunderbolt/nhi.h   | 18 ++++++++++++++++++
>  include/linux/thunderbolt.h |  3 +++
>  3 files changed, 45 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index fc54ff7edfb9..3a3d334e69fd 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -176,19 +176,32 @@ void nhi_disable_interrupts(struct tb_nhi *nhi)
>  
>  /* ring helper methods */
>  
> +static const struct tb_nhi_ring_layout nhi_default_ring_layout = {
> +	.tx_desc_base = REG_TX_RING_BASE,
> +	.rx_desc_base = REG_RX_RING_BASE,
> +	.desc_stride = 16,
> +	.tx_options_base = REG_TX_OPTIONS_BASE,
> +	.rx_options_base = REG_RX_OPTIONS_BASE,
> +	.options_stride = 32,
> +};

I'm not fan of these to be honest.

I think either adding ring_ops that includes hooks that can be overridden
by non-standard HI or not sure if we can take advantage of regmap here?

> +
>  static void __iomem *ring_desc_base(struct tb_ring *ring)
>  {
> +	const struct tb_nhi_ring_layout *layout = ring->nhi->ring_layout;
>  	void __iomem *io = ring->nhi->iobase;
> -	io += ring->is_tx ? REG_TX_RING_BASE : REG_RX_RING_BASE;
> -	io += ring->hop * 16;
> +
> +	io += ring->is_tx ? layout->tx_desc_base : layout->rx_desc_base;
> +	io += ring->hop * layout->desc_stride;
>  	return io;
>  }
>  
>  static void __iomem *ring_options_base(struct tb_ring *ring)
>  {
> +	const struct tb_nhi_ring_layout *layout = ring->nhi->ring_layout;
>  	void __iomem *io = ring->nhi->iobase;
> -	io += ring->is_tx ? REG_TX_OPTIONS_BASE : REG_RX_OPTIONS_BASE;
> -	io += ring->hop * 32;
> +
> +	io += ring->is_tx ? layout->tx_options_base : layout->rx_options_base;
> +	io += ring->hop * layout->options_stride;
>  	return io;
>  }
>  
> @@ -215,8 +228,10 @@ static void ring_iowrite32desc(struct tb_ring *ring, u32 value, u32 offset)
>  
>  static void ring_iowrite64desc(struct tb_ring *ring, u64 value, u32 offset)
>  {
> -	iowrite32(value, ring_desc_base(ring) + offset);
> -	iowrite32(value >> 32, ring_desc_base(ring) + offset + 4);
> +	void __iomem *base = ring_desc_base(ring);
> +
> +	iowrite32(value, base + offset);
> +	iowrite32(value >> 32, base + offset + 4);
>  }
>  
>  static void ring_iowrite32options(struct tb_ring *ring, u32 value, u32 offset)
> @@ -1253,6 +1268,9 @@ int nhi_probe(struct tb_nhi *nhi)
>  	if (!nhi->ops->init_interrupts)
>  		return dev_err_probe(dev, -EINVAL, "missing required NHI ops\n");
>  
> +	if (!nhi->ring_layout)
> +		nhi->ring_layout = &nhi_default_ring_layout;
> +
>  	nhi->hop_count = ioread32(nhi->iobase + REG_CAPS) & 0x3ff;
>  	dev_dbg(dev, "total paths: %d\n", nhi->hop_count);
>  
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index 4884c3f5a2b2..035cee433a3c 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -40,6 +40,24 @@ void nhi_reset_interface(struct tb_nhi *nhi);
>  
>  extern const struct dev_pm_ops nhi_pm_ops;
>  
> +/**
> + * struct tb_nhi_ring_layout - Layout of the ring registers in the NHI MMIO space
> + * @tx_desc_base: Offset of the descriptor registers of the first TX ring
> + * @rx_desc_base: Offset of the descriptor registers of the first RX ring
> + * @desc_stride: Stride between the descriptor registers of neighboring rings
> + * @tx_options_base: Offset of the options registers of the first TX ring
> + * @rx_options_base: Offset of the options registers of the first RX ring
> + * @options_stride: Stride between the options registers of neighboring rings
> + */
> +struct tb_nhi_ring_layout {
> +	u32 tx_desc_base;
> +	u32 rx_desc_base;
> +	u32 desc_stride;
> +	u32 tx_options_base;
> +	u32 rx_options_base;
> +	u32 options_stride;
> +};
> +
>  /**
>   * struct tb_nhi_ops - NHI specific optional operations
>   * @init: NHI specific initialization
> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> index d48623fda79b..7c2717bd2945 100644
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -503,6 +503,8 @@ void tb_service_properties_changed(struct tb_service *svc);
>   *	  interrupt_work when dispatching interrupts to individual rings.
>   * @dev: Device associated with this NHI instance
>   * @ops: NHI specific optional ops
> + * @ring_layout: Layout of the ring registers inside @iobase. If not set
> + *		 the default layout from the USB4 specification is used.
>   * @iobase: MMIO space of the NHI
>   * @tx_rings: All Tx rings available on this host controller
>   * @rx_rings: All Rx rings available on this host controller
> @@ -524,6 +526,7 @@ struct tb_nhi {
>  	spinlock_t lock;
>  	struct device *dev;
>  	const struct tb_nhi_ops *ops;
> +	const struct tb_nhi_ring_layout *ring_layout;
>  	void __iomem *iobase;
>  	struct tb_ring **tx_rings;
>  	struct tb_ring **rx_rings;
> 
> -- 
> 2.55.0
> 
