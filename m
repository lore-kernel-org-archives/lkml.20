Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7184A8A37;
	Mon,  7 Sep 2026 12:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785159; cv=none; b=k1iLwBELaBj0UGXbAZ1wzV6u7oV1HSg6hgpfeN7b8DlAb6nXJHjo3YQtZfSLy4T4VvqpuYOpVbfAcfGxT65MyvAcoHN0pz35zQCJjLjamNsFCxNH+Z0u5bQC7Hbfz4Tz9glvdCH9Vzdir73q5CFwUThn+SCutWkywZ6JVk7cL4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785159; c=relaxed/simple;
	bh=H1ubNT2MpvggLFWPFefEukEU0/8JUEZgv3ju6vNkAvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZ1M2e8N3+Db+akT21Nn3OUXNAVnEkPdtXSeSQdBYEcQDili+ea6gdp04bvIj5H0M9CmUMRBTvVeNL8P4B9hvpOc2HeFnZjTvWHkRqGBLT+mUHyiFC/4JdGC3zVn6apVJuFUP/dvEL3Hc//Ds6iP7IW1WvTQGog9uU7suKG6FxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZEQ6qPqz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=thjEB4EZ; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ZEQ6qPqz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="thjEB4EZ"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A5D1B140004E;
	Mon,  7 Sep 2026 08:45:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 07 Sep 2026 08:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788785156;
	 x=1788871556; bh=Xtfq/XhAvR8Otnbo7Oua0x8ib2Rr0lLYz5YvSWyxCME=; b=
	ZEQ6qPqzgB4DXT4/XCHvYgNFIMVz0ObST20Ux8IEL+ul0mChYT/ovh0Xilz9wXBj
	SogfevdjjwKV+HtaX6jieH/shrb/zNxexBjOsMknA008l9URHkaRjnstDU+1O3ii
	rK0xEOsJvpU8W0VQ9UnIuIVeJgUvtQdvnqZa296U0GTHpuLJywN0kr/hexe+aDJi
	XHENoLgnThq6HKLw5C18qCGpxB1wKSArR5V2D7eA2mb+LVrz9CRiI4LyW7/shgom
	JOabDtC1oNx6sJ7M7/LB7B4lBbpJwHuL//n17OwYNOVdZU7H93Q0M/j/gy5XHCl6
	oSGiwPkDggSMeNLf3tGRjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788785156; x=
	1788871556; bh=Xtfq/XhAvR8Otnbo7Oua0x8ib2Rr0lLYz5YvSWyxCME=; b=t
	hjEB4EZ1vgeBqUpHyMU8CIH2ARnOmQORd6OngAfWcUdadv65EW3RWhbdEcCK/kFm
	Hp0mdmQpeb7aUGwXPgNX+tVq/mXuoDXvCDfSqO8DgD2cVgBjLb2VCLeZH30A6s0j
	Jqo/IF+aUPYe80+azKzoTNISq5Y1BjfbBFGV5YCulS6LulT1QM8oObpoVSUQXg/Z
	DlH65S6q8GP+zodhgRF/tNfQ3a7BDzL9Yjq+rT4d4kO5abVhs2u8juz/M0BG6zfW
	yBQnqz7WPjZUY2ukZaKC3Gze8xpJgSvgc8iPPRnvQuM67VU4gKbvjToYza6bya2j
	UOPNkaohaMeXAx4eU2xlw==
X-ME-Sender: <xms:BLKeamynaggreB0LS5ApDsn_NhA4N8lq73D49kvP74YqLzwt1jMzbA>
    <xme:BLKeau03MN9b3MoAtnJYtzY5V75NFpjFwNVJskM-2TjN1jefCgUCE-x8UsuklOBBe
    RyhyYCD5eh1-vN7bg7xSMkjrabCeDGizkMej8j0QV5xWaEf22jdgkce>
X-ME-Received: <xmr:BLKeasz26OH-9evzwT0l_0yDZiuqUKR0cX05sWZ0Q0KlpzYEBEYTf56Tdkn0cKTzgQIzONmvkyKw5wtnlWngpagFTSEz2n0>
X-ME-Proxy-Cause: dmFkZTFabHZBn8HeuHEQtHZHkfXaYsK2nEicI5hR7pZ6Lv/Zu6oI84rTzoz1sXbQyzvJ0a
    514HKbclrteEkowzY+2r4rbXBmr0Z1AxFVpg7QULrkBUv2w4Al4vgT0q4O2Uc3+fYZLvQl
    9xKt5AODmlrzucZPY2BwN3OS/EnJrnVPUb84/2qteNP6BQMD5/AbwsdH1oKf5uFwHwfZ5k
    PzxfeZfGeamOnmzcZGcItDmWMVEDzkB87cnzM+kq9N+gNH6eWWSwMkL+C4KKm7KUd7NLoZ
    O7aVEbOSxlQdXJQSORTsTLAwQC0Y4nLDGIJqOhlP6HUiYT+psThvM1TGj3vV1KU1MBfcNe
    Qa+Gj94BQMR6Sfnag4NUgX/WwlT3ygPw1bJv8AmmHLyaPY/jpa0s7xOHKlAAR9IAugp1CO
    Q9GQLtV4I2+YmfpUvk67eQ4xf16ydPFG7VrL7KcKJSjW3GQYGaB/jmF6wWZtQMNCkO5Mk5
    m0Qj1iSqode5/E8Ds3MQjiZJuS7t+MVRJkp3LO8ERVHjc1sM506q/W5KH1QIdewyYPOOOj
    cnxKAfi1G+3SEBnblcsjt8DZcmd4I8kxOTMOdv5B79OsXsBz+ECNTVrfPtaVg97AUAK0Q2
    MGsiqV3tfZOGX7Ah8bnW0IZp42/lQ9HwzOsfqkKFo3Bl38ToFzF7rfnHWPJg
X-ME-Proxy: <xmx:BLKeajVecRrHO0uf_CQI5tgcOW-WKrxVVgiH8SIZpV6bwSHU8pbSNA>
    <xmx:BLKeao-S4kf7XVieZd8ibEpNO6M34aiITVbia-T9dI6RunO68WtfXg>
    <xmx:BLKeamtY-yFiok0Ob5O2X5vBXp_E6OJOCj1IRg6mWt3llfbfoTsunA>
    <xmx:BLKeao0w2SlscM9sWDrw5wnWPzy6GQD1Ef1pk_hIPa9hS0Z_3jLoYw>
    <xmx:BLKeanMvDxG8jjHjoUCCf9cpe8n1t2OWS_nLsWrTNxN5YlPju6poWVey>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 08:45:56 -0400 (EDT)
Date: Mon, 7 Sep 2026 14:45:54 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v6 07/11] media: rcar-csi2: Add .get_frame_desc op
Message-ID: <20260907124554.GG3497753@ragnatech.se>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
 <20260617-rcar-streams-v6-7-1260eb72dff7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617-rcar-streams-v6-7-1260eb72dff7@ideasonboard.com>

Hi Tomi,

Thanks for your work.

On 2026-06-17 14:55:00 +0300, Tomi Valkeinen wrote:
> Add v4l2_subdev_pad_ops.get_frame_desc() implementation.
> 
> We also implement a fallback for the case where the upstream subdevice
> does not implement .get_frame_desc. It assumes a single stream with VC =
> 0 and DT based on the configured stream mbus format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 74 ++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 91f713e1f8c2..0d9e730fa677 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1935,12 +1935,86 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
> +					 unsigned int pad,
> +					 struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct v4l2_subdev_route *route;
> +	const struct rcar_csi2_format *format;
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *fmt;
> +	int ret = 0;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	if (state->routing.num_routes != 1) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	route = &state->routing.routes[0];
> +
> +	if (route->source_pad != pad) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +					   route->sink_stream);
> +	if (!fmt) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	format = rcsi2_code_to_fmt(fmt->code);
> +	if (!format) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	fd->num_entries = 1;
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->entry[0].stream = route->source_stream;
> +	fd->entry[0].pixelcode = fmt->code;
> +	fd->entry[0].bus.csi2.vc = 0;
> +	fd->entry[0].bus.csi2.dt = format->datatype;
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
> +static int rcsi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
> +	int ret;
> +
> +	/*
> +	 * This should only get called on gen4, with ISP, so yell here
> +	 * if that is not the case to highlight a driver bug.
> +	 */

nit: Not your fault but as this driver grew organically to support Gen4 
which only have one source pad compared to Gen3 which have 4. Could we 
extend this comment to carry more detail?

    Providing a frame descriptor on the source pad only make sens on 
    Gen4. On Gen3 the CSI-2 IP is used to demux the CSI streams to each 
    VIN instance, while on Gen4 this job is done by the Channel Selector 
    of the ISP, and that needs the frame descriptors.

Or something similar? With that fixed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> +	if (WARN_ON(!priv->info->use_isp))
> +		return -ENOTTY;
> +
> +	if (WARN_ON(pad != RCAR_CSI2_SOURCE_VC0))
> +		return -EINVAL;
> +
> +	ret = v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
> +	if (ret == -ENOIOCTLCMD)
> +		ret = rcsi2_get_frame_desc_fallback(sd, pad, fd);
> +	return ret;
> +}
> +
>  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>  	.enable_streams = rcsi2_enable_streams,
>  	.disable_streams = rcsi2_disable_streams,
>  
>  	.set_fmt = rcsi2_set_pad_format,
>  	.get_fmt = v4l2_subdev_get_fmt,
> +
> +	.get_frame_desc = rcsi2_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund
