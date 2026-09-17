Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC701A6822;
	Thu, 17 Sep 2026 20:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789676978; cv=none; b=gt9ZidF/UUxEsPhk/8jTsBU73N2LFm4harN6vOKL3xUJJb+GeuftRMlVoBIKZO/sfMy2VdGn7VxgwZ1kfhVptBYWX3fim+FjayEwOzK6Pjnmhub2xpPw0IOEmA8VP3Up97VEvUcU9El4YgodyBIXJjBONRI529OB4aKOCJTWslQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789676978; c=relaxed/simple;
	bh=C95ZpaNXQil564v6Jf4y2JHkz7kV++idLTYEGq4ilS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2tLKPw4BXQOO0kx5bd+/3IbAzTMS4Ps8IByaG7R3IUWkAsGEmg6uOj0ueXD1i0ctEbqkXTjCm+O6RoezY+kjR9I2FUvpi82wr26hAogxYlZm1v1EqGK3MVvKnhkq6f3E0ul3UfTDNjEtWkl08LSO1K1EdeBvpFTNgxr5zf7HCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=thDW76Vl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="thDW76Vl"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BADB2C6;
	Thu, 17 Sep 2026 22:27:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789676871;
	bh=C95ZpaNXQil564v6Jf4y2JHkz7kV++idLTYEGq4ilS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=thDW76VlkjlTAqhJBPyQY6geW4IM7KQS8xz3Dpk2Rdjfsc+yWnKAppBwP6BJxi4pp
	 gnRevtmbIejJa3Y6QE/ePVfFYhDQTloMHOjZFrtIHBTd/3acI72jnL4+51+/bOmyHq
	 MTkW31QC3kKWzaWd+PlkNKfJZnA3EFi41O5LCo9Q=
Date: Thu, 17 Sep 2026 23:29:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>, Xu Rao <raoxu@uniontech.com>,
	Kees Cook <kees@kernel.org>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
	vkoul@kernel.org
Subject: Re: [PATCH 1/1] media: m2m-deinterlace: replace direct
 ->device_prep*() calls with standard DMA engine API
Message-ID: <20260917202931.GA59058@killaraus.ideasonboard.com>
References: <20260917190420.1189246-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917190420.1189246-1-Frank.Li@oss.nxp.com>

On Thu, Sep 17, 2026 at 03:04:16PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> DMA engine consumers must not call the channel's device_prep_*() function
> pointers directly. Use the standard dmaengine wrapper APIs instead.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I've checked the other DMA operations, and there are a few direct
callers of .device_prep_dma_memcpy() and .device_prep_slave_sg(). The
former should be easy to address, as the dmaengine_prep_dma_memcpy()
wrapper is a drop-in replacement. The latter may be a bit more
complicated.

Any volunteer to send patches ? :-)

> ---
>  drivers/media/platform/m2m-deinterlace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
> index 9dcc4bd6cbdd5..57a91ff2269f2 100644
> --- a/drivers/media/platform/m2m-deinterlace.c
> +++ b/drivers/media/platform/m2m-deinterlace.c
> @@ -330,7 +330,7 @@ static void deinterlace_issue_dma(struct deinterlace_ctx *ctx, int op,
>  	ctx->xt->dst_sgl = true;
>  	flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
>  
> -	tx = dmadev->device_prep_interleaved_dma(chan, ctx->xt, flags);
> +	tx = dmaengine_prep_interleaved_dma(chan, ctx->xt, flags);
>  	if (tx == NULL) {
>  		v4l2_warn(&pcdev->v4l2_dev, "DMA interleaved prep error\n");
>  		return;

-- 
Regards,

Laurent Pinchart
