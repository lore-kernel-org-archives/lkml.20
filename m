Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9780D4A2E1A;
	Mon,  7 Sep 2026 12:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784759; cv=none; b=SvCt9DuCj8dtN1RqAFQwJF9lwCq3woEzesZWzw58NtXU4u8LwAcX0Zap1j9lR6BmtkK/ak/VeRaIm7Rx5Sj93sYrh+yMumEkFLk9aCId0znYDhipWnWhj8A2erPCp2jq7EXaLsWIt+Ei0mTuMyHvDAPGLI3Z8ZiiRdefir1RjoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784759; c=relaxed/simple;
	bh=uISJ9qP33V7SWhzaum3QTgVRiEEYIZx6wSDPzqsQIKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUxAreMYTJtCOeRdpKugVKgXmGbEsYasH05ukJZcCr9X5DoyBmz6Xu1pnySIV9DwXQw58eFQVvqhXYzotHWQQzw544MFxhK6qw3duGEE2IWM67LgX4yoKJ+DqfY8CufuAX90e+LNmUodLa2kD1Xy7QzCw5TtBala/RCX0BCEB3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=vBYH8Qm3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mKLcAI8N; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="vBYH8Qm3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mKLcAI8N"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 5E439EC024F;
	Mon,  7 Sep 2026 08:39:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 07 Sep 2026 08:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788784755;
	 x=1788871155; bh=5DZCF1twmrzwfLe5XPOz5Dksr2g9I4SdtoS+oCPJi8E=; b=
	vBYH8Qm3L1H2PnZLiaS3noCGVifg+sPJ2kwwGByz4Ey10wmVDeCh4XFewPn7bbB9
	5FZ4hpkK8mkNGWJLi2PnOwzEPu3y1zh2PfG1FAGGHI7Erm7LCYNUggNGcXKGc1Bl
	vWtduDfHAZplyxByjewbzMz43XWmorbI/DsPb/T82DZ6Vl4WN71FllWsFRXVTyJ6
	E8o/C1/HT/3vRak6ZVsHaZKx+NR3sopGcH+BnYgznlkmS+zYxZVzN1yozMt241Ds
	Zk7o4kyRB65WuSzf5oh4wY9JCdmmJ8pa0Df3K0IEjrpYwsizZ0JhQG2KMrCdWZdK
	VeQ53orOg8j9draauyGSrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788784755; x=
	1788871155; bh=5DZCF1twmrzwfLe5XPOz5Dksr2g9I4SdtoS+oCPJi8E=; b=m
	KLcAI8NnU0KYqaRb/0YfnzEuZsGsStB3BIuaj0/cP8a9be2PAoV5D4Gr8twuzJY9
	zhQxfzyypkp0QYkGDvPWy04fu6n+Udb0fDxfcqzCXSNUcSdJAy/LkRrBdsASHnYl
	FsXVz5BBpfM9xJfdB7p7VpHGZhthpqbsvLM3h5o7UuxwAN2Njc/+fEMoiZ6cHBP6
	NJkpbEbkZ2qfYgBx11LKaw4yJLBa0FdPOTrpTXSJWeSTHK5ye4GqO4nbgIJysde/
	Fy4cER7jNueo16CwXhyhSJVOgFTBDbRzWlKftHS3wOR1G3azq5+v+sggH+whsxfP
	5evybh4sSBKJVYxzEAQ7g==
X-ME-Sender: <xms:crCeanfuyUj8rQWo_y34mhYXU-HGCUjF8-sN8WME77f1GP6L8Lj10g>
    <xme:crCeapxZuelpuNGXlOB30wsWlWxdzITBpc9-O-6uAg_dGMX9H_gSurdLozI4ii_yM
    35VjNhwuqxH3X5KHZehhSKe-mJMqxGyTsBMK_JxDNZEKuDXcBDcz2je>
X-ME-Received: <xmr:crCeak-I42Eai6OebIfawucc-cpE0np-jPlNQnraWwDMqEo0Lrg79H-dfJ-v6CnpFLwLWEA-bsl_GMx2m89LHI6JO2Vpl4k>
X-ME-Proxy-Cause: dmFkZTFBpMu6DMMK7Oy5FOIeRWmRLpfD64ZVSzEY3/setiIxhXCYVC9ZfyAPjq+KgVtWpf
    rrGfRuWyeuJSWrijjyDW7LcF2VXbROvANhgl/Cn5slLOIRfqZiSfheePndgnyMbpJU3sSb
    xOX6NJUsOQvPfMTwFyX6hbokHwM6xECv/L76vX9umE52xD3RzNS2zeefHzTqcQyfIGPpWi
    uJYB8egZe963zRvGdty6r+Hy5ebGLc3YkbrqxwwE4PXY+mXz2YNkVJvR9dlowu0rxcPUCX
    sSnDygv9bMv/28Dphq1U80RX6Jja/c+9DuqjoqFIf8Jy7nKm3nWZOUIRH5vMRjdeeY5mOJ
    1u1D5MQ16MlwNVgwTLXMxfJhl8vRO+4R/q9FLDkzCiPvAPGXmKaBqufJd9nm8huc4RU2w3
    CWmZEkyTD+8gIkUXyrDr5gb7tyjyNUsWKoe4Z2OLT+mrMCft9KSALjV7+Oo1VgvUIBiDYg
    dE14lxY++5tVZ0qNlf+Qxwt9ifbv1tpbrEt19OOCZLHwIoYyuzuapLxxRoeYOA8ICE8PVj
    oaXDcv4OjY9DgXdJUoLqHlT589q0bk5VUGZkIb2MZXdqv1OwNNbuW8tfZop8L3bkvmHWnR
    9h+M8b4J/yd4wRBIOAh5KNtAnoOYxJVLgdR3SY0R8SBpuGTKS71IJlHUhyQg
X-ME-Proxy: <xmx:crCeavwEoXUeb6sI2eMbuXT0pnfgUoHrqh_jHJXotUVqagVSEmvE8w>
    <xmx:crCeakpfdzwox-wLJxHz8sVNkjAZMOd5BoXlK6lLXbtsTssuNx9Xdw>
    <xmx:crCeagqGqtsQpt8q9KLIlJjSfcFy5VRLg9pk6KFBUe9cBLv73hCXMQ>
    <xmx:crCeakB3AI0r5Pyr_HHNK9IAHPxisMsQgPPZrBKXG1mP8vKL4YgIxw>
    <xmx:c7CeakLNaO6JuUTmN2_4ttFZi4jQCAKKleNJouSNMps8ZLbyjh0h2ypX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 08:39:14 -0400 (EDT)
Date: Mon, 7 Sep 2026 14:39:11 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v6 05/11] media: rcar-csi2: Switch to Streams API
Message-ID: <20260907123911.GF3497753@ragnatech.se>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
 <20260617-rcar-streams-v6-5-1260eb72dff7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617-rcar-streams-v6-5-1260eb72dff7@ideasonboard.com>

Hi Tomi,

Thanks for your patch.

On 2026-06-17 14:54:58 +0300, Tomi Valkeinen wrote:
> Switch to Streams API with a single hardcoded route.
> 
> For single-stream use case there should be no change in behavior.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 64 +++++++++++++++++++++++-------
>  1 file changed, 50 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index f5d8b06dff51..91f713e1f8c2 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1023,17 +1023,24 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  	 */
>  	freq = v4l2_get_link_freq(remote_pad, 0, 0);
>  	if (freq < 0) {
> +		const struct v4l2_subdev_route *route;
>  		const struct rcar_csi2_format *format;
>  		const struct v4l2_mbus_framefmt *fmt;
>  		unsigned int lanes;
>  		unsigned int bpp;
>  		int ret;
>  
> +		if (state->routing.num_routes != 1)
> +			return -EINVAL;
> +
>  		ret = rcsi2_get_active_lanes(priv, &lanes);
>  		if (ret)
>  			return ret;
>  
> -		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +		route = &state->routing.routes[0];
> +
> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +						   route->sink_stream);
>  		if (!fmt)
>  			return -EINVAL;
>  
> @@ -1062,6 +1069,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>  				     struct v4l2_subdev_state *state)
>  {
> +	const struct v4l2_subdev_route *route;
>  	const struct rcar_csi2_format *format;
>  	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
>  	const struct v4l2_mbus_framefmt *fmt;
> @@ -1070,7 +1078,16 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>  	int mbps, ret;
>  
>  	/* Use the format on the sink pad to compute the receiver config. */
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +
> +	if (state->routing.num_routes != 1)
> +		return -EINVAL;
> +
> +	route = &state->routing.routes[0];
> +
> +	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +					   route->sink_stream);
> +	if (!fmt)
> +		return -EINVAL;
>  
>  	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
>  		fmt->width, fmt->height,
> @@ -1892,8 +1909,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  				struct v4l2_subdev_state *state,
>  				struct v4l2_subdev_format *format)
>  {
> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	unsigned int num_pads = rcsi2_num_pads(priv);
> +	struct v4l2_mbus_framefmt *fmt;
>  
>  	if (format->pad > RCAR_CSI2_SINK)
>  		return v4l2_subdev_get_fmt(sd, state, format);
> @@ -1901,11 +1917,20 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  	if (!rcsi2_code_to_fmt(format->format.code))
>  		format->format.code = rcar_csi2_formats[0].code;
>  
> -	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
> +	/* Set sink format. */
> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt = format->format;
> +
> +	/* Propagate the format to the source pad. */
> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!fmt)
> +		return -EINVAL;
>  
> -	/* Propagate the format to the source pads. */
> -	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
> -		*v4l2_subdev_state_get_format(state, i) = format->format;
> +	*fmt = format->format;
>  
>  	return 0;
>  }
> @@ -1925,8 +1950,15 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
>  static int rcsi2_init_state(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_state *state)
>  {
> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	unsigned int num_pads = rcsi2_num_pads(priv);
> +	static struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = RCAR_CSI2_SINK,
> +			.sink_stream = 0,
> +			.source_pad = RCAR_CSI2_SOURCE_VC0,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
>  
>  	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
>  		.width		= 1920,
> @@ -1939,10 +1971,13 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
>  		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
>  	};
>  
> -	for (unsigned int i = RCAR_CSI2_SINK; i < num_pads; i++)
> -		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
> +	static const struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
>  
> -	return 0;
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> +						&rcar_csi2_default_fmt);
>  }
>  
>  static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
> @@ -2629,7 +2664,8 @@ static int rcsi2_probe(struct platform_device *pdev)
>  	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
>  	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
>  		 KBUILD_MODNAME, dev_name(&pdev->dev));
> -	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			     V4L2_SUBDEV_FL_STREAMS;
>  
>  	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>  	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund
