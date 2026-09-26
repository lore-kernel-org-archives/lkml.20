Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEC0443ABE;
	Sat, 26 Sep 2026 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790434367; cv=none; b=XuIwPyo44VEB9h10SvsMjYPzXcJkiJ5fwNgl+2zmj/QDKMab5WrCyqbKau7xskZjo0nOC28Yl3TUvzYV2CFU/1YDKQyz6pjIQbX74Zccj3X1R+x5VA1XVJNcCXKL5qmkBODCGGOoP8gKebi+RC5gRjJJkJGfRv5AA4dUjHk5btw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790434367; c=relaxed/simple;
	bh=5nYPgDSdmjoHrFmhSCM6PMGjRbRiiimao5/hFbMD5hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hf8hr1aH3PcMzNpszecLZW/SmJKQ+/a32uc/AO0Noc9rdf0UkRSnHXc5d12sOg2b4je8LZaBoroIQqjxhfr4MoHFQrR6gB/qW+9ocN4lVSf7QKG55R9GeJezg/Q5u/y6S29hkfTTBXrQWUkNYSYWCUViTRg1WpkMkzPEQATdUeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p51V39gZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p51V39gZ"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C2F3B5;
	Sat, 26 Sep 2026 16:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790434255;
	bh=5nYPgDSdmjoHrFmhSCM6PMGjRbRiiimao5/hFbMD5hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p51V39gZ8aT6M5NNgPyVe2RExP7bZxkQ98ATLfBsk1wddDV9on8MHphIsy22g7KZc
	 uytzvVMpV6Nn1HFTxchYHaPrAqoPqLE4o43RI7eF/+9R+4VPrxNZ823B7DmRwNBnB1
	 tEUefqY2UvLDkLrN7q5a4jgyLaeTepvg3daU3XFU=
Date: Sat, 26 Sep 2026 17:52:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, sakari.ailus@linux.intel.com,
	mripard@kernel.org, jai.luthra@linux.dev,
	jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, mirela.rabulea@nxp.com
Subject: Re: [RFC PATCH 4/8] media: cadence: csi2rx: Add RAW10 RGBIr formats
Message-ID: <20260926145242.GD764757@killaraus.ideasonboard.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-5-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925133001.2780868-5-r-donadkar@ti.com>

On Fri, Sep 25, 2026 at 06:59:57PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Add 10-bit RGBIr formats to the table to allow capturing them.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index de7cce76397a..8ed730452d3c 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -173,6 +173,14 @@ static const struct csi2rx_fmt formats[] = {
>  	{ .code	= MEDIA_BUS_FMT_RGB565_1X16,  .bpp = 16, .max_pixels = 1, },
>  	{ .code	= MEDIA_BUS_FMT_RGB888_1X24,  .bpp = 24, .max_pixels = 1, },
>  	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, .max_pixels = 1, },
> +	{ .code	= MEDIA_BUS_FMT_SRGGI10_1X10, .bpp = 10, .max_pixels = 2 },
> +	{ .code	= MEDIA_BUS_FMT_SGRIG10_1X10, .bpp = 10, .max_pixels = 2 },
> +	{ .code	= MEDIA_BUS_FMT_SBGGI10_1X10, .bpp = 10, .max_pixels = 2 },
> +	{ .code	= MEDIA_BUS_FMT_SGBIG10_1X10, .bpp = 10, .max_pixels = 2 },
> +	{ .code	= MEDIA_BUS_FMT_SGIRG10_1X10, .bpp = 10, .max_pixels = 2 },
> +	{ .code	= MEDIA_BUS_FMT_SIGGR10_1X10, .bpp = 10, .max_pixels = 2 },
> +	{ .code	= MEDIA_BUS_FMT_SGIBG10_1X10, .bpp = 10, .max_pixels = 2 },
> +	{ .code	= MEDIA_BUS_FMT_SIGGB10_1X10, .bpp = 10, .max_pixels = 2 },

Raw formats will allow supporting all possible CFA patterns without
having to extend each driver every time a new pattern is added.

>  };
>  
>  static void csi2rx_configure_error_irq_mask(void __iomem *base,

-- 
Regards,

Laurent Pinchart
