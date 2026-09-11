Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813CC43DEAF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123088; cv=none; b=BQirT4izDeq5mdb7O2a6BX9nBfG9XVqup2AzswKkGW5/yVmiKEHCNJ0gw+j+vGiypvGJP4LagP8/cmEcetvBZUDalhwDeRE4WNHWKDPmjdKZC89UaoSM9D6HDSMv8nU1FRy1xAyZPk/gQiN4iPUZC/miEkzyzDituuEcHfxzAkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123088; c=relaxed/simple;
	bh=lAZG4y2mL9d17hDDHJXI6XUdj88Z5na1fIorQWa9zy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OW/Z/crDfX1/VqiRdFL/eMdliO8InWBKlOPECVINdVYEkzyo1XnerkJ36aa9Lo4FG2PF4pB3ewsTerhdJkr5cFPRGNc1V1iRrO5ORQpMOh6TZpwl2F7p21L80Xtp67SIPJaWTfY6yUBeVgQ2AYvWCSSMZO6TfkVktX1CP0uOhC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qkmwoowO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qkmwoowO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so11523245e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789123079; x=1789727879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WgVuAAeQV5KtAVY4dXSOX4gumGqjSEbaGz0Dq4tFu6o=;
        b=qkmwoowOUoSIclNvL/Vtok2Be+1OFzQW3/YHr/1msowclhxCvudepf21XwTLGfDFVT
         xaJkpMBZnzAzX37FS4cRx+vFiV0RphbLla8QqKo6VbUXIx1VeeaIjnM3vd8ohA8++tvg
         z3vtBf9ksLhAHvRw7oD7kGEb+iVouBmH+e4v4n78PclXzg/1c0uDvmDyKWKpZ0nQ6qb+
         4FI1Nf5GFbUmrkWW6uLvIYOT+MZC19T9BCGQzhKOSbcsoIXUmpzBF8dr+y/1387uVOd1
         P3KJ081LEhs5F666P5t20Ut3nhkJM4IAzOWPauwMM76ZoAskTRBIB5pXWLZD9oSvWO8H
         7szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123079; x=1789727879;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WgVuAAeQV5KtAVY4dXSOX4gumGqjSEbaGz0Dq4tFu6o=;
        b=YQDnPKzLD3rhePmeSfm5jR9wnbUduxrlCrhM/8ohIpMWQvYC/KN0j5Xs8b4+bnlbkn
         K/gasC/BLU4HTrAPAoffp1Pt42OHgSbAFFxzGskSYvzlsGVyby4/rtLhP9KaHqJNdsnm
         1h06SD3vtPOxixTxCw0tA94LqePY7XpfCtGCVRhaFZkiBF/JZaWaZIzD3s9pR1JMWq49
         n53zWe29nzR8Mc3QbhMMD36+jXsW9ESqJFXRek1XnQc8LoDRJ949AaLHPGCzqSCc6jzm
         LjuT7dQV/h3j3znyzN+3QVo4qwp4Ev0F7SrJttdyrqpjBZ+obOpB3Ur4vkMG658FBcxH
         c4cA==
X-Forwarded-Encrypted: i=1; AKwUvBxDhf7abakWbbO1CxQ4LV4f2vo5eeRdRqKMDo5TNb0GZCWy67CD2um234OsE9DvWSZNSsx4jyGPf3uDMqU=@vger.kernel.org
X-Gm-Message-State: AFuF++kDnaMsCfXfZk9SDm8hKrYH2zvj03S5xfkxJ2WZDsAUo8mcMbf0
	kGeq2guzuzdMcpuvFmk66AYuZiPLcdJk7ArJo0dMogRr9u5LIJykzXPaSXQks4sUS6E=
X-Gm-Gg: AYBFou3O6hj5ZaI/0jexg6F/U60Cy3aaxihdqhYVIb5/6FQP2gi0s4djNM8gXzFb9Yq
	Dy8YOlSXBFQYbJLpSxG973AUqGs5f6t64fQfZypjaKf3nord+gKyJQZepVzSbyEDjqE5RHMH2It
	FdzUmUUdnHYBsXqeQPQMskdyag1X6gPMZVcbAh+o+UPdeffABLUsz7O2iwRlcOfnwJgJXOSWTan
	uzUkkF8SJSXSdv096UBGPyodTJHr4+urJcc+A/v4ZEIQpwuYVXjtrYNFq4YDbdUNC3htyLtuhYR
	Yj6Ba5dliWyC7ccmeI88xmEKLaNj49+J/raGMbWx0/omJawyquMm5UbTm60i/OEx0FkMTEAdDKq
	1CuxNNlf0uJXpuXjBZx5DnNDKgPWUp4U9jwRQb3hSLV2Du0Z1LiQ4SFxCGQi5cIwvV305K5AstT
	wm3yYXMsQcesrM5dS+JmlDLmod1wyBBobGVs3V0YGchlf2Blx6vxhGEvAcTqiiR1UYH83rezCMM
	O03kDpPYpxc
X-Received: by 2002:a05:600c:3acb:b0:49c:fa21:1c8c with SMTP id 5b1f17b1804b1-49e619e0e6amr37449245e9.33.1789123079205;
        Fri, 11 Sep 2026 03:37:59 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.225.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a33e34sm43706995e9.0.2026.09.11.03.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 03:37:58 -0700 (PDT)
Message-ID: <d08ec8a9-4970-4d5c-b9e0-a5f84000186d@linaro.org>
Date: Fri, 11 Sep 2026 11:37:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: qcom: camss: Add streams API support for
 CSIPHY
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-2-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260911062213.195007-2-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2026 07:22, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> 
> Add the V4L2 subdev streams API to the CSIPHY driver: a passthrough
> routing table (one VC per stream) and NO_STREAM_MIX routing validation.
> 
> enable/disable_streams pad ops track active streams per pad via a
> per-pad enabled_streams[] bitmask, so that multiple source-pad
> consumers can share a single propagated sink stream without redundant
> or colliding propagation to the sensor. The shared D-PHY lanes are
> enabled once, on the transition from no active streams to at least
> one, and disabled once all streams have gone idle.
> 
> This is opt-in per CSIPHY instance via the new streams_enable resource
> flag; no platform sets it yet, so CSIPHYs continue to use the legacy
> non-streams subdev ops unchanged.
> 
> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> ---
>   .../media/platform/qcom/camss/camss-csiphy.c  | 223 +++++++++++++++++-
>   .../media/platform/qcom/camss/camss-csiphy.h  |   2 +
>   2 files changed, 222 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 539ac4888b60..7e9748e92ab8 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -332,6 +332,112 @@ static int csiphy_set_stream(struct v4l2_subdev *sd, int enable)
>   	return ret;
>   }
>   
> +/*
> + * csiphy_pad_enable_streams - Enable one or more streams on the source pad
> + * @sd: CSIPHY V4L2 subdevice
> + * @state: V4L2 subdevice state
> + * @pad: Pad number
> + * @streams_mask: Bitmask of streams to enable
> + *
> + * The shared D-PHY lanes are enabled once, on the transition from no active
> + * sink streams to at least one. 
on the transition to an active state.

The sink stream(s) are propagated upstream to
> + * the sensor only for the subset that isn't already active,
only for streams which are inactive

  so a stream
> + * that's already running is never redundantly re-propagated.
> + *
> + * CSIPHY is only ever linked to a single entity on its source pad, and that
> + * entity is responsible for only enabling a stream on this pad while it
> + * itself still needs it, so no cross-consumer refcounting is needed here.
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csiphy_pad_enable_streams(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_state *state,
> +				     u32 pad, u64 streams_mask)
> +{
> +	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
> +	struct media_pad *remote_pad =
> +		media_pad_remote_pad_first(&csiphy->pads[MSM_CSIPHY_PAD_SINK]);
> +	bool first_arrival = !csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK];
> +	u64 sink_streams, propagate_mask;
> +	int ret;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSIPHY_PAD_SINK,
> +						       &streams_mask);
> +
> +	propagate_mask = sink_streams & ~csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK];
> +
> +	if (first_arrival) {
> +		ret = csiphy_set_stream(sd, 1);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK] |= sink_streams;
> +	csiphy->enabled_streams[pad] |= streams_mask;
> +
> +	if (propagate_mask && remote_pad) {

When is remote pad false ?

> +		ret = v4l2_subdev_enable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
> +						 remote_pad->index, propagate_mask);
> +		if (ret) {
> +			csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK] &= ~propagate_mask;
> +			csiphy->enabled_streams[pad] &= ~streams_mask;
> +
> +			if (first_arrival)
> +				csiphy_set_stream(sd, 0);
> +
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * csiphy_pad_disable_streams - Disable one or more streams on the source pad
> + * @sd: CSIPHY V4L2 subdevice
> + * @state: V4L2 subdevice state
> + * @pad: Pad number
> + * @streams_mask: Bitmask of streams to disable
> + *
> + * The shared D-PHY lanes, and the propagation to the sensor, are only torn
> + * down once no sink stream is referenced by any source pad any more.
> + *
> + * CSIPHY is only ever linked to a single entity on its source pad, and that
> + * entity is responsible for only disabling a stream on this pad once it no
> + * longer needs it, so no cross-consumer refcounting is needed here.
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csiphy_pad_disable_streams(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state,
> +				      u32 pad, u64 streams_mask)
> +{
> +	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
> +	struct media_pad *remote_pad =
> +		media_pad_remote_pad_first(&csiphy->pads[MSM_CSIPHY_PAD_SINK]);
> +	u64 sink_streams;
> +	int ret = 0;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSIPHY_PAD_SINK,
> +						       &streams_mask);
> +
> +	csiphy->enabled_streams[pad] &= ~streams_mask;
> +	csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK] &= ~sink_streams;
> +
> +	if (sink_streams && remote_pad)
> +		ret = v4l2_subdev_disable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
> +						  remote_pad->index, sink_streams);

I'm again questioning when the remote_pad is false i.e. can a PHY have a 
sink_stream without a remote ?
> +
> +	if (!csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK]) {
> +		int stream_ret = csiphy_set_stream(sd, 0);
> +
> +		if (!ret)
> +			ret = stream_ret;
> +	}
> +
> +	return ret;
> +}
> +
>   /*
>    * __csiphy_get_format - Get pointer to format structure
>    * @csiphy: CSIPHY device
> @@ -743,6 +849,71 @@ static int csiphy_link_setup(struct media_entity *entity,
>   	return 0;
>   }
>   
> +static int csiphy_init_state(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = MSM_CSIPHY_PAD_SINK,
> +			.sink_stream = 0,
> +			.source_pad = MSM_CSIPHY_PAD_SRC,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +	struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +
> +	/*
> +	 * CSIPHY is a transparent D-PHY with no per-VC demux, so every sink
> +	 * stream (VC) a multi-stream sensor may drive must pass straight
> +	 * through as the same source stream, or downstream link validation
> +	 * (e.g. against CSID's multi-pad sink) will flag it as dangling. A
> +	 * multi-VC sensor is supported by userspace adding further routes via
> +	 * .set_routing; this default covers the common single-VC case.
> +	 */

Drop the references to DPHY - people are actively working on CPHY support.

> +	return v4l2_subdev_set_routing(sd, state, &routing);
> +}
> +
> +/*
> + * csiphy_set_routing - Set routing for the CSIPHY subdev
> + * @sd: CSIPHY V4L2 subdevice
> + * @state: V4L2 subdevice state
> + * @which: Type of format state (V4L2_SUBDEV_FORMAT_ACTIVE or TRY)
> + * @routing: Routing table to set
> + *
> + * CSIPHY is a transparent D-PHY with no per-VC demux, so every route must
> + * pass a sink stream straight through as the same source stream.
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csiphy_set_routing(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *state,
> +			      enum v4l2_subdev_format_whence which,
> +			      struct v4l2_subdev_krouting *routing)
> +{
> +	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
> +	unsigned int i;
> +	int ret;
> +
> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK])
> +		return -EBUSY;

Can this happen ?

dev_err() ?

> +
> +	for (i = 0; i < routing->num_routes; i++)
> +		if (routing->routes[i].sink_stream != routing->routes[i].source_stream)
> +			return -EINVAL;
> +
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_NO_STREAM_MIX |
> +					   V4L2_SUBDEV_ROUTING_NO_N_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_subdev_set_routing(sd, state, routing);
> +}
> +
>   static const struct v4l2_subdev_core_ops csiphy_core_ops = {
>   	.s_power = csiphy_set_power,
>   };
> @@ -764,10 +935,35 @@ static const struct v4l2_subdev_ops csiphy_v4l2_ops = {
>   	.pad = &csiphy_pad_ops,
>   };
>   
> +static const struct v4l2_subdev_pad_ops csiphy_streams_pad_ops = {
> +	.enum_mbus_code = csiphy_enum_mbus_code,
> +	.enum_frame_size = csiphy_enum_frame_size,
> +	.get_fmt = csiphy_get_format,
> +	.set_fmt = csiphy_set_format,
> +	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
> +	.set_routing = csiphy_set_routing,
> +	.enable_streams = csiphy_pad_enable_streams,
> +	.disable_streams = csiphy_pad_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_video_ops csiphy_streams_video_ops = {
> +	.s_stream = v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_ops csiphy_streams_v4l2_ops = {
> +	.core = &csiphy_core_ops,
> +	.pad = &csiphy_streams_pad_ops,
> +	.video = &csiphy_streams_video_ops,
> +};
> +
>   static const struct v4l2_subdev_internal_ops csiphy_v4l2_internal_ops = {
>   	.open = csiphy_init_formats,
>   };
>   
> +static const struct v4l2_subdev_internal_ops csiphy_streams_internal_ops = {
> +	.init_state = csiphy_init_state,
> +};
> +
>   static const struct media_entity_operations csiphy_media_ops = {
>   	.link_setup = csiphy_link_setup,
>   	.link_validate = v4l2_subdev_link_validate,
> @@ -786,11 +982,16 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>   	struct v4l2_subdev *sd = &csiphy->subdev;
>   	struct media_pad *pads = csiphy->pads;
>   	struct device *dev = csiphy->camss->dev;
> +	bool streams_api = csiphy->res->streams_enable;

Is this really a feature of the CSIPHY though ?

Its the CSI decoder that has to program registers in itself to trap the 
appropriate VC and route it.

Its a supported feature for a particular SoC.

This flag should live in struct camss_resources and you have a pointer o 
that structure in this routine anyway so..

>   	int ret;
>   
> -	v4l2_subdev_init(sd, &csiphy_v4l2_ops);
> -	sd->internal_ops = &csiphy_v4l2_internal_ops;
> +	v4l2_subdev_init(sd, streams_api ? &csiphy_streams_v4l2_ops
> +					      : &csiphy_v4l2_ops);
> +	sd->internal_ops = streams_api ? &csiphy_streams_internal_ops
> +					: &csiphy_v4l2_internal_ops;
>   	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	if (streams_api)
> +		sd->flags |= V4L2_SUBDEV_FL_STREAMS;
>   	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
>   		 MSM_CSIPHY_NAME, csiphy->id);
>   	sd->grp_id = CSIPHY_GRP_ID;
> @@ -813,12 +1014,27 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>   		return ret;
>   	}
>   
> +	if (streams_api) {
> +		ret = v4l2_subdev_init_finalize(sd);
> +		if (ret) {
> +			dev_err(dev, "Failed to finalize subdev: %d\n", ret);
> +			goto err_media_entity_cleanup;
> +		}
> +	}
> +
>   	ret = v4l2_device_register_subdev(v4l2_dev, sd);
>   	if (ret < 0) {
>   		dev_err(dev, "Failed to register subdev: %d\n", ret);
> -		media_entity_cleanup(&sd->entity);
> +		goto err_v4l2_subdev_cleanup;
>   	}
>   
> +	return 0;
> +
> +err_v4l2_subdev_cleanup:
> +	v4l2_subdev_cleanup(sd);
> +err_media_entity_cleanup:
> +	media_entity_cleanup(&sd->entity);
> +
>   	return ret;
>   }
>   
> @@ -829,5 +1045,6 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>   void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
>   {
>   	v4l2_device_unregister_subdev(&csiphy->subdev);
> +	v4l2_subdev_cleanup(&csiphy->subdev);
>   	media_entity_cleanup(&csiphy->subdev.entity);
>   }
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 9d9657b82f74..e55c098dbe67 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -84,6 +84,7 @@ struct csiphy_hw_ops {
>   
>   struct csiphy_subdev_resources {
>   	u8 id;
> +	bool streams_enable;
>   	const struct csiphy_hw_ops *hw_ops;
>   	const struct csiphy_formats *formats;
>   };
> @@ -114,6 +115,7 @@ struct csiphy_device {
>   	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
>   	const struct csiphy_subdev_resources *res;
>   	struct csiphy_device_regs *regs;
> +	u64 enabled_streams[MSM_CSIPHY_PADS_NUM];
>   };
>   
>   struct camss_subdev_resources;

