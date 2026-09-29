Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D933551EDFE;
	Tue, 29 Sep 2026 14:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692342; cv=none; b=T6IdX8T0a7+gZg0PXNJQPSe4uCdCr3kBDJiTgi2NmPGyO23lR8UeyBMurpDyWRGcVCcYLkx2T17QuheKMbxF2U0WgNQNMGxaIYoOSxSZNTYQG8wo46/pcm68O9nw6BPxG34x0yFmUMsxeM58kfW1Z0aWIj8ms1SEhYiJce4S9A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692342; c=relaxed/simple;
	bh=EEkC1k5TlXqhlI1kvQuSXPB95c6jcTfMP0aFzVMO958=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yp2+9Ojqamg+Q0bYE+F4Hr9m0+/lk1Cj5hQZQYAArnB/1iEms9OG6dM+x9TE65pmezuVNcrq347O9YTxzz7dQk92MQxdINJwxK0QDJ9rDBoHlG4sVvXwj9O2aoDdmOMbxBspcn7BboxBvRKKGTWem0MJ8fz11veWPr8pW/9sFPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XaGKsPSN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=v/No45hR; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XaGKsPSN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="v/No45hR"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 37DEEEC0B6C;
	Tue, 29 Sep 2026 10:32:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 29 Sep 2026 10:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790692332;
	 x=1790778732; bh=DaNWAhJP0gQpiCQdc/OXCgSdstp19EO6gxhOwhRHnfE=; b=
	XaGKsPSN67oBIpgRE+BUn5jYHrYfyVSq/btZpjLzuJURoe9z0Ffv1fDjlakfh4oU
	mqLms6SIi1pBkE/uVR4EJlArQ4LW9Q4UInvIdLL++KqJWpCb2oCVTc0X21upMOfY
	d/aUEDSmU7jFMS52r+pNfW6fkHk4Qm2uhnL1xxqCTTKO8AtccBTUu1cu3pNMZvco
	awzg9rggdVxCiWfkbh2Y3vEYqH5mLkPXGMeF0KHhC1mu7f7zB0W0ebQRLZtioYd4
	T3sOYXm/BJhFGNkZ6ffMezDL8SBgLAdHCJUNoOEk5tSknzkr6TbpQVCWVZscCl9L
	q3SZbLykvm8HFketwzXy2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790692332; x=
	1790778732; bh=DaNWAhJP0gQpiCQdc/OXCgSdstp19EO6gxhOwhRHnfE=; b=v
	/No45hRJO2HHQbeLbtRs0wRFskqhvFXevopYBAxmJdXQjzrQlvDPtwOMi1OPNRGF
	XcH7Gdijwf57foOqqdeLUJyUVQNxStPe/6vDYzzqbhCmzDIx4ZtAWgk2Dde29/kc
	QB5DL0RifJBWRj6OcBHUtYn7+GpHtnF1pTiC+wLPg4bU937Fcp+zw0Hln3kjfHLY
	+jI56IpduYapDLPIYkxik9gUrqPTVS6OPrmuEfDE7Cx6o1j2Hjxk4bfl0WUAb0M/
	CJbP/Ksel/IogQ5oTzx0LjGi5kWL7o83nPoTq+BczvEB7HbSIglxNF2BdilcTkaf
	AwAUZJ15an1G+h/G8IbUw==
X-ME-Sender: <xms:68u7amiTG50oxv0Juv1OhZaUkNgSuCGICMwCoMhpHZjyY0ucb5E-7Q>
    <xme:68u7ahGTWhGn9_RcCsInnmFXEIGO_4mIldDkLeKh1gU9qgTOiLWeiQMdZIlOpUdd1
    BAkRNeJ1e5BzDXU0GYkQmv3Zg3ET7Zj7kvJ5IDvNPWK-J5NckUkHkI>
X-ME-Received: <xmr:68u7at8_OImoJ7R9Xj7TFsiNuvjfeRPj6po_N96819qJNGQ_WCiwwj55S0w6pzoNpqQdpZ7RUnrBrohmBUMleuJ_t0HnXjo>
X-ME-Proxy-Cause: dmFkZTFKpfdBnY2TZoh/ZAx2aNt9EPRpz20KcKtXzjCFAmyJsPZQs813kKOYPMn9fBHhMH
    tzcrruEmr8LiQJujG2I9tkjWOlPCUhwW4mndVRV5hq4y58IrR8u3fJyFxE9ZWwYJ3aw2kY
    zdc9Zm0R7ocQyq4EQgVl5qTRomUZ/wI/0olAKav0bY252ZwBfSkbhVbMjDPx2kHn8g8p/V
    WeRqTLDm9Bly8+nirCwUwiK/qBr6rBUsae8DlriMj7WwnwhAL8leObQc10ieSpQrMCKehY
    83KH5NxcE0S2iNl2D5vhMP0fNgXFiTotPXM6xXc1aKwS+0kamtfxfI8TaHFJhV7XpuwXg6
    7EKStK+ZCGbUjKTgBiQZuYibsx2NWcTYTHH4URhzqbs1RTw4/ehGv0ROnSB7XV30wJ4v02
    GeEY+HiXHMmHuBvnTAYZ/9Y4t90LX6Wq16we+/8VsYS6XWIBzmQbuYLlekB6rf1P/yI8Az
    K05BwNY1X+SrddYuykh3yC/yGOQtV+27EBv5H6ALVSOiVJeu6t8iGeHbEy1KcaMJOhlfjJ
    koIyaA2PNksz+/Wx5hYnVdWG7K1uWebFleP8dRrxsxzNbwnXHfFOAEEQ7krcyaBC4vEsvv
    WuqIY142exsQyqLIfOgHwLlWeABE+ABKY+gHOiqeJ+qPt8qJbIgnYorBqoQw
X-ME-Proxy: <xmx:68u7agyHUsiPCfT0F-9-M6kgvlGTu3m7xiegqBoX1X0EH2n7kcDHig>
    <xmx:68u7ahMGFeuIrAw05tMuB8fpZpTIO6laFCqIvBbR79olAd7udSdM8g>
    <xmx:68u7at_F1YPjlBHdJj3vkaUTfruYPwRt3pQgwUnMwe-YYBbpGg9lKg>
    <xmx:68u7am4oniXNtd2wHeNTFnLTgZKAgfsrPMFiL1ra-YYg_syuWWBSbA>
    <xmx:7Mu7anUzmF6J4_O8WO3gtqii1wb5ELpl5bt3vLrueZr5yHGI9R1NikNV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Sep 2026 10:32:11 -0400 (EDT)
Date: Tue, 29 Sep 2026 16:32:09 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: rcar-vin: Implement `VIDIOC_ENUM_FRMSIZES`
Message-ID: <20260929143209.GB1244576@ragnatech.se>
References: <20260929133720.344955-1-barnabas.pocze+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929133720.344955-1-barnabas.pocze+renesas@ideasonboard.com>

Hi Barnabás,

Thanks for your patch,

On 2026-09-29 15:37:20 +0200, Barnabás Pőcze wrote:
> Currently there is no way for applications to query the available frame
> sizes, so implement `VIDIOC_ENUM_FRMSIZES` based on what is allowed in
> `rvin_format_align()`.
> 
> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>

I'm not super exited about having ` in the patch title. With them 
dropped,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../platform/renesas/rcar-vin/rcar-v4l2.c     | 70 ++++++++++++++-----
>  1 file changed, 51 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> index 9d45e11898c13..4961d28f42c78 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> @@ -19,6 +19,8 @@
>  #include "rcar-vin.h"
>  
>  #define RVIN_DEFAULT_FORMAT	V4L2_PIX_FMT_YUYV
> +#define RVIN_MIN_WIDTH		5
> +#define RVIN_MIN_HEIGHT		2
>  #define RVIN_DEFAULT_WIDTH	800
>  #define RVIN_DEFAULT_HEIGHT	600
>  #define RVIN_DEFAULT_FIELD	V4L2_FIELD_NONE
> @@ -187,6 +189,24 @@ static u32 rvin_format_sizeimage(struct v4l2_pix_format *pix)
>  	}
>  }
>  
> +static u32 rvin_format_width_alignment(u32 pixelformat)
> +{
> +	/* Hardware limits width alignment based on format. */
> +	switch (pixelformat) {
> +	/* Multiple of 32 (2^5) for NV12/16. */
> +	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_NV16:
> +		return 5;
> +	/* Multiple of 2 (2^1) for YUV. */
> +	case V4L2_PIX_FMT_YUYV:
> +	case V4L2_PIX_FMT_UYVY:
> +		return 1;
> +	/* No multiple for RGB. */
> +	default:
> +		return 0;
> +	}
> +}
> +
>  static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
>  {
>  	u32 walign;
> @@ -208,27 +228,12 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
>  		break;
>  	}
>  
> -	/* Hardware limits width alignment based on format. */
> -	switch (pix->pixelformat) {
> -	/* Multiple of 32 (2^5) for NV12/16. */
> -	case V4L2_PIX_FMT_NV12:
> -	case V4L2_PIX_FMT_NV16:
> -		walign = 5;
> -		break;
> -	/* Multiple of 2 (2^1) for YUV. */
> -	case V4L2_PIX_FMT_YUYV:
> -	case V4L2_PIX_FMT_UYVY:
> -		walign = 1;
> -		break;
> -	/* No multiple for RGB. */
> -	default:
> -		walign = 0;
> -		break;
> -	}
> +	walign = rvin_format_width_alignment(pix->pixelformat);
>  
>  	/* Limit to VIN capabilities */
> -	v4l_bound_align_image(&pix->width, 5, vin->info->max_width, walign,
> -			      &pix->height, 2, vin->info->max_height, 0, 0);
> +	v4l_bound_align_image(&pix->width, RVIN_MIN_WIDTH, vin->info->max_width, walign,
> +			      &pix->height, RVIN_MIN_HEIGHT, vin->info->max_height, 0,
> +			      0);
>  
>  	pix->bytesperline = rvin_format_bytesperline(vin, pix);
>  	pix->sizeimage = rvin_format_sizeimage(pix);
> @@ -343,6 +348,32 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
>  	return -EINVAL;
>  }
>  
> +static int rvin_enum_framesizes(struct file *file, void *priv,
> +				struct v4l2_frmsizeenum *fsize)
> +{
> +	struct rvin_dev *vin = video_drvdata(file);
> +	u32 wstep;
> +
> +	if (fsize->index != 0)
> +		return -EINVAL;
> +
> +	if (!rvin_format_from_pixel(vin, fsize->pixel_format))
> +		return -EINVAL;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +
> +	wstep = 1u << rvin_format_width_alignment(fsize->pixel_format);
> +	fsize->stepwise.min_width = round_up(RVIN_MIN_WIDTH, wstep);
> +	fsize->stepwise.max_width = vin->info->max_width;
> +	fsize->stepwise.step_width = wstep;
> +
> +	fsize->stepwise.min_height = RVIN_MIN_HEIGHT;
> +	fsize->stepwise.max_height = vin->info->max_height;
> +	fsize->stepwise.step_height = 1;
> +
> +	return 0;
> +}
> +
>  static int rvin_remote_rectangle(struct rvin_dev *vin, struct v4l2_rect *rect)
>  {
>  	struct media_pad *pad = media_pad_remote_pad_first(&vin->pad);
> @@ -564,6 +595,7 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
>  	.vidioc_g_fmt_vid_cap		= rvin_g_fmt_vid_cap,
>  	.vidioc_s_fmt_vid_cap		= rvin_mc_s_fmt_vid_cap,
>  	.vidioc_enum_fmt_vid_cap	= rvin_enum_fmt_vid_cap,
> +	.vidioc_enum_framesizes		= rvin_enum_framesizes,
>  
>  	.vidioc_g_selection		= rvin_g_selection,
>  	.vidioc_s_selection		= rvin_s_selection,
> -- 
> 2.55.0
> 

-- 
Kind Regards,
Niklas Söderlund
