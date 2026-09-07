Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78B1476061;
	Mon,  7 Sep 2026 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787757; cv=none; b=WeZoD6T1pq2L8X4gpFnhOPb5Tr35i6zq3MlZ7kkS8u9vTQa4ufczsHAVFzxo+8uedhK8mjrQv0cg6t/rJkEeasMvPEyT9POk8K9uR3HzBSDNtHdUXzuVo3LX6XsfGRS8oiKTVuVlh+51PqvPvpvTdJf8puqYwKa69hZGYG9YpZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787757; c=relaxed/simple;
	bh=KCOInMF53JPR9Db3dKAD8lAt7bSISweS8pOhJUIMqEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2fb+etVOUg/5tfu3CtCc/fEg1CpqK9zP72HSqCr52wu57oDApwqQXwHR/4CGIwTLTO9HTU4XZZJvLo1GCoNf26mY7YadV3KaZr2bdel6wZadrqNsMN3mVahTZ8ZwfxJNMbzcjQOcgBAdeSEmuy91ZdS1UxuFY1/wD+Uhdm1Gns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=EHq1EgoA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KE0kA54y; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="EHq1EgoA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KE0kA54y"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 948CCEC0260;
	Mon,  7 Sep 2026 09:29:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 07 Sep 2026 09:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788787749;
	 x=1788874149; bh=IIxpK9P4abciZOzEFhxDem4E5vaVHZBtvKa4rlNGrPg=; b=
	EHq1EgoAS39ZOa35IfgepgShMq4zjE4045EZESVTrGVXg3nKFAWvtA2KIjrDZVAa
	zqMFR4XBk2eI0c2W8gBlrGyHX352zigRkGIlI59I1+A4Qt0yvuneiJrx63Ae5JAi
	L1LmdO+BDdHFTyr527/lpbhXir/HJiL27YWI8W2i57jHdpswVqeXtRncWfFhhwWS
	vWQUiDJDPjFB4X7MceSWu9Bvqg3XlhqJTTojL2Hw8V853DyTmIIlBFcHs/YW8ptj
	AAwn3nxCWF5jvG2K56Uz+WAe+X09FfwdWujI4ovTMiI5MWfAMs8I5vGT8hvDstPV
	GyguJs4Tw2tpkfbCxrj8zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788787749; x=
	1788874149; bh=IIxpK9P4abciZOzEFhxDem4E5vaVHZBtvKa4rlNGrPg=; b=K
	E0kA54yeF+pGvYrjYtLBnduhe/cEQBeNzVkbk+eFq11XgglWGkiIv/uHpn0fwB9w
	a+ZEMDP1rSMAQpw0cMTYN3M+TnSFWe7nn784ChRMnEm5e24L5eiSDXbp8+8aGZMH
	BtEjCwBKOlfTkymRsNQwuiGBfqI1xOu9/xUYgJrnb4BGEGWg1u++oPn8dZFpn0OT
	cWjTwQTpTCXyPNPSNum5SD92A2zj3/2OMuf/t8qOcS9YoLy1WxjOpvuiP+F+zp7h
	r0NvRlJXQgajSb+Ib6gG0xn0/tQEZDHBJpUMTk33GkMIweapKAVBkhmk2vwWXDpo
	0YjKJHkeXVT2bRs3I5ZKQ==
X-ME-Sender: <xms:JbyeajPVtxcqVvBaZ7NFc2IDdzNc5sJuOAH2mLCyxCkzTqq5P51Nag>
    <xme:JbyeamKpR8ocuUx10yy8FW8YipIGjnDGPdTy92jK_YGdy-ADZXPuMZ7N8f0f117bo
    XMElrA9pvPxFnqaoy5d1DEB5SsUcxrrNxuC0GxS1m-kDdzsSMS5P9Q>
X-ME-Received: <xmr:Jbyeat3sgy7YObsl-VSc20ffpda33b2Bxj_qf8j0KKTsC4TFFl45uZuHlHRx4tZWe72tQiZ5-Ufk6beZJQrK9hYb-4uY-bk>
X-ME-Proxy-Cause: dmFkZTF9BCg1tTzLMI5waeHS5xWEX6u/NELv7fg19Qjw3ixWO07b8FxLDp8I+bjaeDrEJ1
    5DvY4DBKSSFnb8zbDMK/vs5YgTX+vF6ymog8qSXiTILJPNbjFWUXLOz7ZU/08MbQatbeLC
    qy2bwn+1vKjm/iFn3MWSNPjAmM8+84tJVYcDHNwwD9cm4LCYT5w/Rbq67fkybGpgKLhHib
    9alr/iHO/omtcvrts3fL8T3PoAvx0LAX76bSbmVTdsyA3XTzOwTcRZ4bamPX5srjMOkSaP
    81FzZMwz8JPQLF/99ELINO+yabFxftrDvVFWDUZNK/TnIw0RJ2D0tk++5dC5DICghl3yWw
    CphKawlk3Yg+Mf/NHalxzV0rP9clc0NDK4Qyf4wdBVYKvSVJ+M+skO2F3M1M8rs+fM6yuB
    zxzxnUtX16MRyeObimodNqYzwhONbJ9yE0WpmwV2QNo5UBzCRktPSDyr9NR23W8eWp8Nu+
    NW2s1xIW/UZU9ipEfHjlIEgIEOe7+FJ8o6QSc2iRcdqK9CNs3HhJttRPrZMN9qWfyRw+Yz
    fiFGyRsV8BzCvjiuSQRJn/bVg8BpDVOS2PdN5JVw0pA3hgCbY2yaq60uZchdGAOZjACJWi
    Ga/359hgR559LOHB0rcUFdHJNDESBo6AF+jKn94vBg9ArWL4xQPvVmZW/Q9g
X-ME-Proxy: <xmx:JbyeaiXuLrnR5h03_bgo41SpG3dlHQura_AkaQlXx0ADHh5hygH2NA>
    <xmx:JbyeanPnWpr_I_rXXvHO3hDyR_CicC5Pjg_I4N2T5og6rLkcEiOZIQ>
    <xmx:Jbyeat2wjnPrkp3pOC-fHexlbvcxxCdQpp575rMpWCO5sMmmdnTW5A>
    <xmx:JbyeajT3LuhZGUkhLGng9Aa14C5fTYC-v5w1uYRudTpEkqxCTMR16A>
    <xmx:JbyeajDx8R5FBoT8Zh3aJfTZ4H-ItSWXMKhydZHhAMO0jHwUBLe3t9kU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 09:29:08 -0400 (EDT)
Date: Mon, 7 Sep 2026 15:29:06 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v6 06/11] media: rcar-isp: Switch to Streams API
Message-ID: <20260907132906.GJ3497753@ragnatech.se>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
 <20260617-rcar-streams-v6-6-1260eb72dff7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617-rcar-streams-v6-6-1260eb72dff7@ideasonboard.com>

Hi Tomi,

Thanks for your work.

On 2026-06-17 14:54:59 +0300, Tomi Valkeinen wrote:
> Switch to Streams API with a single hardcoded route.
> 
> For single-stream use case there should be no change in behavior.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 69 ++++++++++++++++++++++---
>  1 file changed, 62 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 58a9a3bd9f75..8ac45516aa39 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -124,6 +124,17 @@ static const struct rcar_isp_format rcar_isp_formats[] = {
>  	},
>  };
>  
> +static const struct v4l2_mbus_framefmt risp_default_fmt = {
> +	.width = 1920,
> +	.height = 1080,
> +	.code = MEDIA_BUS_FMT_RGB888_1X24,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
> +	.field = V4L2_FIELD_NONE,
> +	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
> +	.quantization = V4L2_QUANTIZATION_DEFAULT,
> +	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
> +};
> +
>  static const struct rcar_isp_format *risp_code_to_fmt(unsigned int code)
>  {
>  	unsigned int i;
> @@ -216,13 +227,20 @@ static void risp_power_off(struct rcar_isp *isp)
>  
>  static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>  {
> +	const struct v4l2_subdev_route *route;
>  	const struct v4l2_mbus_framefmt *fmt;
>  	const struct rcar_isp_format *format;
>  	unsigned int vc;
>  	u32 sel_csi = 0;
>  	int ret;
>  
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK);
> +	if (state->routing.num_routes != 1)
> +		return -EINVAL;
> +
> +	route = &state->routing.routes[0];
> +
> +	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +					   route->sink_stream);
>  	if (!fmt)
>  		return -EINVAL;
>  
> @@ -341,7 +359,7 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
>  			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_format *format)
>  {
> -	struct v4l2_mbus_framefmt *framefmt;
> +	struct v4l2_mbus_framefmt *fmt;
>  
>  	if (format->pad > RCAR_ISP_SINK)
>  		return v4l2_subdev_get_fmt(sd, state, format);
> @@ -349,10 +367,20 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
>  	if (!risp_code_to_fmt(format->format.code))
>  		format->format.code = rcar_isp_formats[0].code;
>  
> -	for (unsigned int i = 0; i < RCAR_ISP_NUM_PADS; i++) {
> -		framefmt = v4l2_subdev_state_get_format(state, i);
> -		*framefmt = format->format;
> -	}
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
> +
> +	*fmt = format->format;
>  
>  	return 0;
>  }
> @@ -369,6 +397,32 @@ static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
>  	.pad	= &risp_pad_ops,
>  };
>  
> +static int risp_init_state(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state)
> +{
> +	static struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = RCAR_ISP_SINK,
> +			.sink_stream = 0,
> +			.source_pad = RCAR_ISP_PORT0,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +
> +	static const struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> +						&risp_default_fmt);
> +}
> +
> +static const struct v4l2_subdev_internal_ops risp_internal_ops = {
> +	.init_state = risp_init_state,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Async handling and registration of subdevices and links
>   */
> @@ -526,11 +580,12 @@ static int risp_probe(struct platform_device *pdev)
>  
>  	isp->subdev.owner = THIS_MODULE;
>  	isp->subdev.dev = &pdev->dev;
> +	isp->subdev.internal_ops = &risp_internal_ops;
>  	v4l2_subdev_init(&isp->subdev, &rcar_isp_subdev_ops);
>  	v4l2_set_subdevdata(&isp->subdev, &pdev->dev);
>  	snprintf(isp->subdev.name, sizeof(isp->subdev.name), "%s %s",
>  		 KBUILD_MODNAME, dev_name(&pdev->dev));
> -	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>  
>  	isp->subdev.entity.function = MEDIA_ENT_F_VID_MUX;
>  	isp->subdev.entity.ops = &risp_entity_ops;
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund
