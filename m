Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29512F3C3E;
	Tue,  1 Sep 2026 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263768; cv=none; b=dLWRaKQgdxxJYZQzHNqKp0E0QvM0CAduOrZezgzlIyN8yGWVEHo+AwqqiYOD8Lrb+xAnM8Vf0Xwodyl+NsoDICESYZ5M0rpnFixrV3Y2KjRKTc5VovQq2ZdpvEXBl+ilX4SjjlVZLqyqSB8XmajiJTT6i4KExNeJ6u6y/iRxt40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263768; c=relaxed/simple;
	bh=BXGA0AD21kQ+ZYWfNEdiKfsOL+vYN1BV28RWzR/TUOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igAH6LLS8/F6uwmpz2EUgvwC4RbkVUg1PzS8Xg13bFZRSdxj0+VxZgYYvqlANLt9GoiXalHD54Fe+JhOS1sgqKhvIpRsvXahATFdPzD8L5NoK34KMjj92Qlv6R8PrBjLNZFb9JPgICSu0qlnhKLDU8RhmGRxdiVVTssHsNI3O7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p9V96+aH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p9V96+aH"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3343B163;
	Tue,  1 Sep 2026 13:54:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788263673;
	bh=BXGA0AD21kQ+ZYWfNEdiKfsOL+vYN1BV28RWzR/TUOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p9V96+aHTk6zTD4DMj0FQ7ihXgAzIhud0AH72Id6ZFFjVuvYK3gFw2HGoh77Twu6D
	 +Ho7A0avbH3wzfIMJh5TR+XYa8G0jHhDXIrriAEBeSHLCm5Vjco5IJYlwzoslpIJVe
	 CHZusvxJIQFFl2WzViQbHGR6/zpP50sjGCwUxr24=
Date: Tue, 1 Sep 2026 14:56:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] media: xilinx: vtc: Dynamically calculate pixel clock
Message-ID: <20260901115602.GE19683@killaraus.ideasonboard.com>
References: <20260729101808.3904212-1-rajesh.gugulothu@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729101808.3904212-1-rajesh.gugulothu@amd.com>

CC'ing Tomi who is working on Xilinx V4L2 drivers.

On Wed, Jul 29, 2026 at 03:48:08PM +0530, Rajesh Gugulothu wrote:
> This update enables the vtc to set the pixel clock based on the
> specified timing parameters. A new fps field is added to struct
> xvtc_config and the pixel rate is computed as fps * hsize * vsize.
> After setting the rate, the actual clock rate is read back and a
> warning is emitted if it deviates beyond a small tolerance.
> 
> The pixel rate is computed in unsigned long arithmetic to avoid a 32-bit
> overflow in the fps * hsize * vsize product.
> 
> Signed-off-by: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
> ---
>  drivers/media/platform/xilinx/xilinx-vtc.c | 19 +++++++++++++++++++
>  drivers/media/platform/xilinx/xilinx-vtc.h |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-vtc.c b/drivers/media/platform/xilinx/xilinx-vtc.c
> index 92fec7bb4..695eb2a46 100644
> --- a/drivers/media/platform/xilinx/xilinx-vtc.c
> +++ b/drivers/media/platform/xilinx/xilinx-vtc.c
> @@ -141,6 +141,9 @@
>  
>  #define XVTC_GENERATOR_GLOBAL_DELAY		0x0104
>  
> +/* Value of 1 = .01% */
> +#define XVTC_CLK_MAX_PCT_ERR			1
> +
>  /**
>   * struct xvtc_device - Xilinx Video Timing Controller device structure
>   * @xvip: Xilinx Video IP device
> @@ -175,10 +178,26 @@ int xvtc_generator_start(struct xvtc_device *xvtc,
>  			 const struct xvtc_config *config)
>  {
>  	int ret;
> +	unsigned long s_rate;
> +	unsigned long g_rate;
> +	unsigned long clk_err;
>  
>  	if (!xvtc->has_generator)
>  		return -ENXIO;
>  
> +	s_rate = (unsigned long)config->fps * config->hsize * config->vsize;
> +	ret = clk_set_rate(xvtc->xvip.clk, s_rate);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Verify that the clock is within a reasonable tolerance. */
> +	g_rate = clk_get_rate(xvtc->xvip.clk);
> +	clk_err = (abs(g_rate - s_rate) * 10000) / (s_rate);
> +	if (clk_err > XVTC_CLK_MAX_PCT_ERR)
> +		dev_warn(xvtc->xvip.dev,
> +			 "Failed to set clk rate: %lu, actual rate: %lu\n",
> +			 s_rate, g_rate);
> +
>  	ret = clk_prepare_enable(xvtc->xvip.clk);
>  	if (ret < 0)
>  		return ret;
> diff --git a/drivers/media/platform/xilinx/xilinx-vtc.h b/drivers/media/platform/xilinx/xilinx-vtc.h
> index 855845911..0f360ed55 100644
> --- a/drivers/media/platform/xilinx/xilinx-vtc.h
> +++ b/drivers/media/platform/xilinx/xilinx-vtc.h
> @@ -27,6 +27,7 @@ struct xvtc_config {
>  	unsigned int vsync_start;
>  	unsigned int vsync_end;
>  	unsigned int vsize;
> +	unsigned int fps;
>  };
>  
>  struct xvtc_device *xvtc_of_get(struct device_node *np);

-- 
Regards,

Laurent Pinchart
