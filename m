Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C38F39CD00
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413471; cv=none; b=lBnsl1rEG1FRZsktjXRxaQwIgOs94mIlIwB6F8CQkFO5Y70LLIY0G2bKeeOW2V7jwkZXkbNMz5MhmILRAxfslse1qZtki4NAiwAHngIszRGKdC/qvtB4+Tk+aYrAkLVqE3ojBPdePh7l9+nxKncto660nIEIe8adYw+JfT156Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413471; c=relaxed/simple;
	bh=5SUTE8qp6k7+32nEPQx9429Ow3NBQiRxhs/7Q97fP6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5WKVsQl55MXsCi7ecslBz2AfVlUAbi3ZSTbh/ufbFzB5oYjvzZ3lCbizr4zjtmQ6il/l2VeTUueTdefqsaNix8Jhe4sU+HjtVRXfclFRQstcWLRwnRxys0sj4hVOmCm7Mg9JilDnFxuTWRlPRJZlTZxLjY0Qq/uS/rzvJ2o604=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IY9nZjn3; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IY9nZjn3"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6aa053900f5so107228a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789413466; x=1790018266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/muLWOYcfAyaz1JP5LCp+4a6qwT2hZ9wZwIq9gz8jc=;
        b=IY9nZjn3JRMy57Ul/0am2tTlNwdaqll9QPj3BA9z8N06/tVirxFKa9hwfUtYpyU58D
         o+JIbNmRrZNJnTRrHAsk7ncjzkxRIvGdVyN7d0XfEiuWHEbx4Kkw6pLTaqkqyUEUzVit
         cWKV/yAEYCXZmGMf5AP+t50+SLgyjNO6Ud/J0SDqVc53oKkfO0be4RuthxYrXsQblIXo
         MIbZnglc3m+z/Sa7INxZOcdkk4qFMNsVPiFBgx68oFqIjBroWt31lTpr4mrwZEreCjp2
         YmgV7N/3pf9ujuOQWQK3+VS0Ce07q66QYpmB7OI6nlIXVfQI0uyhHhMLnCCiwXbj1vJG
         +YIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789413466; x=1790018266;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/muLWOYcfAyaz1JP5LCp+4a6qwT2hZ9wZwIq9gz8jc=;
        b=Jg/vvgjGmj5uhjbysJJhv1Acqnv+o3QAAoBkZn7bErUDkqJVZe28dbZPse6R3RcOEO
         TEqh41ECts70i8VFxaqR4Lgx12Ag7qzIP35VwJrzpBL22cD+8626MZOwOBB/4Wf9Mh+i
         NNyvEVLNFHICcRBgYqNUkCF0plNG/ckaiWgDYsaJeq6BQ0PdoYPSh1nXVsLweV9hf9+I
         uB/iO9wQjG37oTsQnRxobwW+q9AfuGk8aiR6arGAjm/WF6E9VTNDYTj3P1NPb5EyVmbf
         /Bsmqm25uXpEPp37tvt3E/+jkIb2ka0wYKb6TBD2rOntGgMF/hX+BSKaNJZ0/vG6CcYq
         fOnA==
X-Forwarded-Encrypted: i=1; AKwUvBxE0qljY3LIohlINAV6mjzg/z82Db1V+voq5OPA/0HsG4caEuLnnJjeQpBiWgwN/+taMj1rAOOb7FGAO3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++ksSbEQR6zqn/H71QtELdj++Ac4CYLPQxEv5tuDLq+v/oaztWqR
	5d1eCSokMSZQ93uohl34x4F42BRR14daNHdgkhZs2Q237LiuaV9EZB6O0bVes6UEukQ=
X-Gm-Gg: AYBFou1lRHnQ1WtccVZEpcenE12+K6Ca5qIa8FJKwUOeAimmfh+fk8L93nW1ul5o0ix
	pvHVhdKChAn15ZT+Qh9S80tWveq4BZNnrlDLgeiiw3vK9vNyIqlPVo5pLSViLaN1nlxTB/fL8A1
	sRY5RizIi3zJHozxq95ZuhH6sWxq8BQQShRSAFzpCx4E2XRvB8bNaG2R1HB/KR0vyUmWfHNtROC
	B/meibKH6K2HB1dMd7VKeykMZrOI7U3RnAu0mZWVdZFkSjW3drKR5aflAEplQK/uE2DpMF8e97f
	XdmSqNP4vEIIfpI90plukyuRJ+y+yX70ijPmcs/thoUugs8ovH3hpKwr+DOtAEHXoOKPXcfRuzP
	WbhEYLPuCnimCBbt9vf62wQD/17YrrMxLVqx5j8kTX+XNZC9gj2Vvpe2TpNDZOt0781C2lfp/d8
	dc095YZ61FwClhWg88waw3xTBPJZ7SfcmwfC81mgmYjqtaINu9SyEt5VQXCJDsKPUOeNDd+0+6q
	5vS/NawAOPcXdN5+oKPZw==
X-Received: by 2002:a05:6402:a01c:b0:6a9:a6fa:8b7e with SMTP id 4fb4d7f45d1cf-6a9f6252c3fmr1899372a12.18.1789413466219;
        Mon, 14 Sep 2026 12:17:46 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594e462sm4818328a12.24.2026.09.14.12.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 12:17:45 -0700 (PDT)
Message-ID: <524369e3-9783-431b-88c3-a367d9631ec0@linaro.org>
Date: Mon, 14 Sep 2026 20:17:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] media: qcom: camss: enable only the stream of the
 pipeline's virtual channel
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260914133416.1030231-9-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260914133416.1030231-9-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 14:34, Hitesh Patel wrote:
> When a streams-aware transmitter is found at the head of the
> pipeline, every stream routed to the source pad the pipeline arrived
> through is enabled at start and disabled at stop.
> 
> That is right for a transmitter driving one camera per output pad,
> but not when it aggregates several cameras onto one output. A GMSL
> deserializer can send two cameras on a single CSI-2 port as two
> virtual channels, which the CSID demultiplexes to two RDIs and thus
> two pipelines. Both pipelines then reach the same source pad, and
> each of them enables and, worse, disables both cameras' streams:
> stopping one video node stops the other camera as well, and
> starting the second one has nothing left to enable.
> 
> Identify the stream a pipeline owns from the CSID it went through:
> CSID source pad MSM_CSID_PAD_FIRST_SRC + n carries virtual channel n.
> Remember that virtual channel while walking upstream, ask the
> transmitter for the frame descriptor of its source pad, and only
> enable or disable the stream(s) it reports on that virtual channel.
> 
> A pipeline that did not pass through a CSID source pad, or a
> transmitter without a CSI-2 frame descriptor, keeps enabling every
> stream of the pad as before.
> 
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>   .../media/platform/qcom/camss/camss-video.c   | 45 +++++++++++++++++--
>   drivers/media/platform/qcom/camss/camss.c     | 30 +++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |  2 +
>   3 files changed, 74 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 90f22ce76..a261f7692 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -253,14 +253,39 @@ static int video_prepare_streaming(struct vb2_queue *q)
>    * video_source_pad_streams - Streams routed to a subdev source pad
>    * @sd: Streams-aware subdevice
>    * @pad: Source pad index on @sd
> + * @vc: Virtual channel of the pipeline, or -1 if unknown
> + *
> + * When a transmitter aggregates several cameras onto one output, that pad
> + * carries one stream per camera and each of them is a separate pipeline here.
> + * Enabling or disabling the whole pad would start or stop every camera at
> + * once, so pick out the single stream this pipeline owns: the one the frame
> + * descriptor reports on the virtual channel the CSID demultiplexed it from.
> + * With @vc unknown, or without a frame descriptor to map it, the whole pad is
> + * returned, which is the case for a transmitter driving one camera per output
> + * pad.
>    *
>    * Return the mask of streams of the active routes ending on @pad.
>    */
> -static u64 video_source_pad_streams(struct v4l2_subdev *sd, u32 pad)
> +static u64 video_source_pad_streams(struct v4l2_subdev *sd, u32 pad, int vc)
>   {
>   	struct v4l2_subdev_state *state;
>   	struct v4l2_subdev_route *route;
> +	struct v4l2_mbus_frame_desc fd;
> +	u64 vc_mask = ~0ULL;
>   	u64 mask = 0;
> +	int ret;
> +
> +	if (vc >= 0) {
> +		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, &fd);
> +		if (!ret && fd.type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> +			unsigned int i;
> +
> +			vc_mask = 0;
> +			for (i = 0; i < fd.num_entries; i++)
> +				if (fd.entry[i].bus.csi2.vc == vc)
> +					vc_mask |= BIT_ULL(fd.entry[i].stream);
> +		}
> +	}
>   
>   	state = v4l2_subdev_lock_and_get_active_state(sd);
>   	if (!state)
> @@ -270,6 +295,8 @@ static u64 video_source_pad_streams(struct v4l2_subdev *sd, u32 pad)
>   		if (route->source_pad == pad)
>   			mask |= BIT_ULL(route->source_stream);
>   
> +	mask &= vc_mask;
> +
>   	v4l2_subdev_unlock_state(state);
>   
>   	return mask;
> @@ -325,6 +352,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>   	struct media_entity *entity;
>   	struct media_pad *pad;
>   	struct v4l2_subdev *subdev;
> +	int vc = -1;
>   	int ret;
>   
>   	ret = video_device_pipeline_alloc_start(vdev);
> @@ -350,8 +378,13 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>   		entity = pad->entity;
>   		subdev = media_entity_to_v4l2_subdev(entity);
>   
> +		if (vc < 0)
> +			vc = camss_csid_source_vc(video->camss, subdev,
> +						  pad->index);
> +
>   		if (subdev->flags & V4L2_SUBDEV_FL_STREAMS) {
> -			u64 mask = video_source_pad_streams(subdev, pad->index);
> +			u64 mask = video_source_pad_streams(subdev, pad->index,
> +							    vc);
>   
>   			if (!mask)
>   				break;
> @@ -387,6 +420,7 @@ static void video_stop_streaming(struct vb2_queue *q)
>   	struct media_entity *entity;
>   	struct media_pad *pad;
>   	struct v4l2_subdev *subdev;
> +	int vc = -1;
>   	int ret;
>   
>   	entity = &vdev->entity;
> @@ -402,8 +436,13 @@ static void video_stop_streaming(struct vb2_queue *q)
>   		entity = pad->entity;
>   		subdev = media_entity_to_v4l2_subdev(entity);
>   
> +		if (vc < 0)
> +			vc = camss_csid_source_vc(video->camss, subdev,
> +						  pad->index);
> +
>   		if (subdev->flags & V4L2_SUBDEV_FL_STREAMS) {
> -			u64 mask = video_source_pad_streams(subdev, pad->index);
> +			u64 mask = video_source_pad_streams(subdev, pad->index,
> +							    vc);
>   
>   			if (!mask)
>   				break;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index ca8101c2d..63cc81570 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4655,6 +4655,36 @@ static bool camss_is_receiver_subdev(struct camss *camss,
>   	return camss_subdev_stream_users(camss, sd);
>   }
>   
> +/*
> + * camss_csid_source_vc - Virtual channel behind a CSID source pad
> + * @camss: CAMSS device
> + * @sd: Subdevice to test
> + * @pad: Source pad index on @sd
> + *
> + * The CSID demultiplexes virtual channels to its source pads, source pad
> + * MSM_CSID_PAD_FIRST_SRC + n carrying virtual channel n (see the en_vc mask
> + * maintained by csid_link_setup()). Walking a pipeline upstream, this tells
> + * which virtual channel, and so which stream of a shared transmitter, the
> + * pipeline belongs to.
> + *
> + * Return the virtual channel, or -1 if @sd is not a CSID of @camss or @pad is
> + * not one of its source pads.
> + */
> +int camss_csid_source_vc(struct camss *camss, struct v4l2_subdev *sd,
> +			 unsigned int pad)
> +{
> +	unsigned int i;
> +
> +	if (pad < MSM_CSID_PAD_FIRST_SRC)
> +		return -1;
> +
> +	for (i = 0; i < camss->res->csid_num; i++)
> +		if (sd == &camss->csid[i].subdev)
> +			return pad - MSM_CSID_PAD_FIRST_SRC;
> +
> +	return -1;
> +}
> +
>   /*
>    * camss_find_transmitter_pad - Find the pad of the CSI-2 transmitter
>    * @camss: CAMSS device
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 00b8d5304..14a7c737e 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -169,6 +169,8 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>   void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>   unsigned int *camss_subdev_stream_users(struct camss *camss,
>   					struct v4l2_subdev *sd);
> +int camss_csid_source_vc(struct camss *camss, struct v4l2_subdev *sd,
> +			 unsigned int pad);
>   struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
>   s64 camss_get_link_freq(struct camss *camss, struct media_entity *entity,
>   			unsigned int bpp, unsigned int lanes);

Instinctively I like that there is less code here than in the other series.

OTOH there is less code here than in the other series.

It'd be great if you and Gjorgji could cross-review each other's 
contributions.

---
bod
