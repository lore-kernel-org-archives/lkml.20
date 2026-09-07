Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AE64BB5DE;
	Mon,  7 Sep 2026 12:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785288; cv=none; b=OqCaVpGVx89Jx+4pAqZuLeRJEOj50C0yjTdEXwPkRv3c6fN83mRqMcNFIaGtZ3iwP5xz8yk5ufB3x/0dsHJpM3hp6DNAKuVmujSMocuuhGoEsjW/Fg4VyHDDe0KzmQ2vTMJXL/jch84TEm5iLCEEYf6SwRo8ZvdWmPBSO5aCXdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785288; c=relaxed/simple;
	bh=sTw5mmlt6nn709ufsy3u6CM2xjzUUX5x9TNB20MZmFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hrmnmb6dk7ni0NPZoSPAQJ+QMMV3S44zeiCOiipx8fNbo/jhOryTobt59jkAFIZ1Dd7jMuhLrvEjtwodglPCPCOisdZj1rMcRjfKK3Y7qo6sM/soKufC3yb7qWYQMyPrK7xT5Km3NZNPmPGM3bKHUK/uEP2PH7EhkZZd7+jQX9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=PZioovUY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eqOcBLaN; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="PZioovUY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eqOcBLaN"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3D6DE140004E;
	Mon,  7 Sep 2026 08:48:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 07 Sep 2026 08:48:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788785285;
	 x=1788871685; bh=Ic+M/eg1yFnMbercSBLfQBWYDDrGnU0DUj2/eFExi2c=; b=
	PZioovUYQ+GsBY18YwtPLkLdVa+OaqNXqfBREaUCnaVaZM5h5ruAVf2VTc/wfW+g
	kvgrlEhv1WgOFuGzlI/oR96e/RhGom1i5j2asGN0ArmdmM4sMx/dVpVYvdccQ/nG
	xBfm+wpIPMv8Sroytk/+BXHQc4ZmDTxu1IHsZGCg/vmz2mpDrgWWsU/52VjyeRps
	3WbouPlGs4jwLDflTmUnfUf0lUTLRKJ7w4IUcXTqJMi3I7tIQ4WCtBHDoImeE48j
	Ls/nJG15hDJsV3O7slY92J6la5JT2pgAnzvj1zsejObDPRNgApQAcZUkrHonX+mQ
	grmvwLLLLrvxL4+QRoTYZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788785285; x=
	1788871685; bh=Ic+M/eg1yFnMbercSBLfQBWYDDrGnU0DUj2/eFExi2c=; b=e
	qOcBLaN6Z5V5kNnyYCHxLbKGafX9VdJKs1NoIY9Sq0KTmT6oVSSWWeFIoTHADHoc
	HT4eykY/YyGErT7yn/BGN5UKKpybphUFQv51+stTqfE7/Q4LvKSnxl3PiACwfLo3
	s7KTL3Hfbl5gZBcxKyg7f6ymtowD/grDZacNzz4MH07UYvguq1Tw7vk15CDg1PLc
	Lq3db6F00m6Lw4WFR+jH7gQdXsWJJDQAN2mY3V4nFhfmBZgpBtR1NWRP1LDDiUCZ
	nwt4Z2RjOcSg7eO86vhOJ4UQKI284cZm/E+mW7QRZzrXIAwowLnYKfm6lk/BiXza
	2NeS9a90NTPcGKEAvZKpw==
X-ME-Sender: <xms:hbKeatkB9As3vkHub8pCjr50CqxWJ9KXKtDXCaknB1BxXAY0ixO8ng>
    <xme:hbKealamZarT8IR3QwWPoiALGQU9To0mtsESMXkwzRgxuFsBe8B0QC977mCCroBSs
    nedqS5waRNaPRZP8z7K9Fb4OVG9uR9YMGPorjJYb34RySbK2mUCbzMQ>
X-ME-Received: <xmr:hbKeaoFPpz9g8hSTpz38F6azjlkokWTfO43ToQiiyzvF5G2sVBcu9dNp1zM6HcTR3V3oSVB5ibAm9eQ5bXU5RX8JnxUQj_U>
X-ME-Proxy-Cause: dmFkZTFlWnRzE/nO08MUvXUw+jm7MOI5FRBgN/06urbObTfasVnk1SjT+FfcdKOAw+MqAM
    d+6s+IyFOkYb/EQq7BBAQJJSyrIEHC32bS9vWQrr2zC5y+RHoyzEP0b4nIrNYAZNWSKK2D
    pd2PjEKMMQX1saJrfGP1d44QwCLkmpsUpsuPWXGogxXe04PO9UbF9ZycyWnnW+5vjBujSa
    NeNq657K+1Na5tH1OVpSSo1RNouPIiQK8IdJwP+/yiDofe2QRCj2aWLjwtWubfUzmXvUf1
    eTSFFeLEUCVFg+U09u1Gs/QsU2FRKzYZfF3S/kQsmtULw5uR2ypjv/n1wKHmAagVTV/8V6
    727sZRQNiMZVAnzDxaeaCLxc0q322xfgQOVoRmz71Nq81eML0M5GvonSQk0/Vda1YRBlUW
    SHVQumJv+Xz9I6L5g8BcMAiVvLjIiHxqKoP3z9TECgwJaxLfgYwqq1qVyTuOmvzA1/K6JI
    pXssZkSWl3Zxv64Dp2J3/IY0jvS10UH1mMavhpb/yn+rXZJELSvVeWK4hl4ENW6JpsC00T
    QRQ+ZiEPpAvMoMnuM0SXHhLv3R0s7ic4V2j+mLc7srpWWfRnp8grmdOCTvmXPh2M25FLgb
    ct8p7IQCvZoGHoTeCfdkHdEMgqyRZLo0wyKAC1pA7B2zmRp3kdIljr3mN17A
X-ME-Proxy: <xmx:hbKeakbBC8XL2eNAtLUmHwnCIPDB2uV0-kwfyRbBRK6RxfLot-xM7w>
    <xmx:hbKeaswGTLJN8847BtHttRI5A1CLsdJ1KBqn4OUVZkO5p05gf47EJw>
    <xmx:hbKeamSkjD1iodpOVSeEDA5xEnP_iIrezGWf-RomiXfm5xEeiad06A>
    <xmx:hbKeapI_hGiL2AjZrQWb-kUopRPKWYzK-4MD4WymDCL2HSf1E9o30w>
    <xmx:hbKearxuOEqU0tMzAFhWzmKKeW5hJy6xXLwXN-7Cx_taAhOKZ1Gkyq5R>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 08:48:04 -0400 (EDT)
Date: Mon, 7 Sep 2026 14:48:03 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v6 10/11] media: rcar-csi2: Add full streams support
Message-ID: <20260907124803.GI3497753@ragnatech.se>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
 <20260617-rcar-streams-v6-10-1260eb72dff7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617-rcar-streams-v6-10-1260eb72dff7@ideasonboard.com>

Hi Tomi,

Thanks for your patch.

On 2026-06-17 14:55:03 +0300, Tomi Valkeinen wrote:
> Add the missing pieces to enable full streams support:
> 
> - Add set_routing
> - Drop the explicit uses of a single stream, and instead use the streams
>   mask
> - Track enabled sink streams so that in rcsi2_irq_thread() we can
>   disable and enable all currently enabled streams
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 95 ++++++++++++++++++++----------
>  1 file changed, 64 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 8cd38b4cbc7f..34899e5409da 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -702,6 +702,17 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
>  	},
>  };
>  
> +static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
> +	.width		= 1920,
> +	.height		= 1080,
> +	.code		= MEDIA_BUS_FMT_RGB888_1X24,
> +	.colorspace	= V4L2_COLORSPACE_SRGB,
> +	.field		= V4L2_FIELD_NONE,
> +	.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> +	.quantization	= V4L2_QUANTIZATION_DEFAULT,
> +	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> +};
> +
>  static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
>  {
>  	unsigned int i;
> @@ -773,7 +784,7 @@ struct rcar_csi2 {
>  
>  	int channel_vc[4];
>  
> -	int stream_count;
> +	u64 enabled_sink_streams_mask;
>  
>  	bool cphy;
>  	unsigned short lanes;
> @@ -1883,29 +1894,32 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
>  				u64 source_streams_mask)
>  {
>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	int ret = 0;
> -
> -	if (source_streams_mask != 1)
> -		return -EINVAL;
> +	u64 sink_streams;
> +	int ret;
>  
>  	if (!priv->remote)
>  		return -ENODEV;
>  
> -	if (priv->stream_count == 0) {
> +	if (!priv->enabled_sink_streams_mask) {
>  		ret = rcsi2_start(priv, state);
>  		if (ret)
>  			return ret;
>  	}
>  
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       source_pad,
> +						       RCAR_CSI2_SINK,
> +						       &source_streams_mask);
> +
>  	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> -					 BIT_ULL(0));
> +					 sink_streams);
>  	if (ret) {
> -		if (priv->stream_count == 0)
> +		if (!priv->enabled_sink_streams_mask)
>  			rcsi2_stop(priv);
>  		return ret;
>  	}
>  
> -	priv->stream_count += 1;
> +	priv->enabled_sink_streams_mask |= sink_streams;
>  
>  	return ret;
>  }
> @@ -1915,23 +1929,26 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
>  				 u32 source_pad, u64 source_streams_mask)
>  {
>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> +	u64 sink_streams;
>  	int ret;
>  
> -	if (source_streams_mask != 1)
> -		return -EINVAL;
> -
>  	if (!priv->remote)
>  		return -ENODEV;
>  
> -	if (priv->stream_count == 1)
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       source_pad,
> +						       RCAR_CSI2_SINK,
> +						       &source_streams_mask);
> +
> +	if (priv->enabled_sink_streams_mask == sink_streams)
>  		rcsi2_stop(priv);
>  
>  	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
> -					  BIT_ULL(0));
> +					  sink_streams);
>  	if (ret)
>  		return ret;
>  
> -	priv->stream_count -= 1;
> +	priv->enabled_sink_streams_mask &= ~sink_streams;
>  
>  	return 0;
>  }
> @@ -1966,6 +1983,34 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int rcsi2_set_routing(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state,
> +			     enum v4l2_subdev_format_whence which,
> +			     struct v4l2_subdev_krouting *routing)
> +{
> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
> +	int ret;
> +
> +	if (priv->info->use_isp) {
> +		ret = v4l2_subdev_routing_validate(sd, routing,
> +						   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	} else {
> +		ret = v4l2_subdev_routing_validate(sd, routing,
> +						   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
> +						   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +					       &rcar_csi2_default_fmt);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
>  					 unsigned int pad,
>  					 struct v4l2_mbus_frame_desc *fd)
> @@ -2045,6 +2090,7 @@ static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>  	.set_fmt = rcsi2_set_pad_format,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  
> +	.set_routing = rcsi2_set_routing,
>  	.get_frame_desc = rcsi2_get_frame_desc,
>  };
>  
> @@ -2065,17 +2111,6 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
>  		},
>  	};
>  
> -	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
> -		.width		= 1920,
> -		.height		= 1080,
> -		.code		= MEDIA_BUS_FMT_RGB888_1X24,
> -		.colorspace	= V4L2_COLORSPACE_SRGB,
> -		.field		= V4L2_FIELD_NONE,
> -		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> -		.quantization	= V4L2_QUANTIZATION_DEFAULT,
> -		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> -	};
> -
>  	static const struct v4l2_subdev_krouting routing = {
>  		.num_routes = ARRAY_SIZE(routes),
>  		.routes = routes,
> @@ -2120,13 +2155,13 @@ static irqreturn_t rcsi2_irq_thread(int irq, void *data)
>  
>  	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
>  
> -	if (priv->stream_count == 0)
> +	if (!priv->enabled_sink_streams_mask)
>  		goto out;
>  
>  	rcsi2_stop(priv);
>  
>  	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
> -					  BIT_ULL(0));
> +					  priv->enabled_sink_streams_mask);
>  	if (ret) {
>  		dev_warn(priv->dev,
>  			 "Error recovery: failed to disable streams: %d\n",
> @@ -2145,7 +2180,7 @@ static irqreturn_t rcsi2_irq_thread(int irq, void *data)
>  	}
>  
>  	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> -					 BIT_ULL(0));
> +					 priv->enabled_sink_streams_mask);
>  	if (ret) {
>  		dev_warn(priv->dev,
>  			 "Error recovery: failed to start streams: %d\n",
> @@ -2748,8 +2783,6 @@ static int rcsi2_probe(struct platform_device *pdev)
>  
>  	priv->dev = &pdev->dev;
>  
> -	priv->stream_count = 0;
> -
>  	ret = rcsi2_probe_resources(priv, pdev);
>  	if (ret) {
>  		dev_err(priv->dev, "Failed to get resources\n");
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund
