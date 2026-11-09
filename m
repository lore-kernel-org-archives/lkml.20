Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239576;
	b=J/Ym2IeY9obSgRJtXqEYK/34588JpQIuufQvvHFv3D+tdWZdUY7PzgGkYAKGLs3QOYO+
	 j46zkwP/Pks/0V3IhxYJIpOePWULpCJRDjF5E0lKLpZFwH65oxvHgJa8HtVHodBbzpAIK
	 vk8TaIoFrSAIIhc5rrqIncZQm2MIMva7MkAFjL8cfa82XNn78dQaCu+oUm4QXCJNq0sML
	 v1We9ua8EyB3X9N6WU+T7o12Op9+XFZinD3p0S9FgH0W4W+5sYlSnIw+zTOBk1XVlWQDw
	 dzZmzzBonN4UlFq0p8t1bxLBOcmG0hKNnkOc+0hE/Vezry74GRsqbF444uhpRTFsWlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239576;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=4Lv8SVXd6EqHIedBkqXjkVoBf7+Cr06aSUt7ly/ev1E=;
	b=ROwUcCrrOYoeL7kJwVcowF+VgSCXQ3op0ksjR4oPhqMqtykLOVFawhlnAymySHf77q56
	 85qlvJAyHOvsT7sWJeHHn6uRYW6xjrjiMnZILT4BnzqWNOMH2tOHJEbccQyPXAYhBb5Rk
	 syEFhKfwCqqmpBR0Ybd+y0Q6lpHIo8SIz7Y5tbjioVtXQKNDPTmpfTzQizSaPIqvJR+Nr
	 VQMMxQdGsTHvNRCmokkrkcBQ8uL1GVqAw2BWyzOLONW06Uty9TAPkDa/aBnPBn3E7BnfK
	 DXdVzQ1AdVtUZLMUq7tkPwHNjGmnfKXDrSYrnyTwspzqw0NGlS0rQTPb99qjfLobuiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SOkvphKR;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442E3606A330;
	Mon,  9 Nov 2026 15:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 442E3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SOkvphKR
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4517F227;
	Mon,  9 Nov 2026 16:50:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794239431;
	bh=mvaIZQ3dLnK6dGJ/v9E8GKTToorYsFgOHqdjYY+F4Jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SOkvphKRhrO1MGhRWzv29PIukYX3JviOdmFBsEStuFSfxjbOkIIpX4I6g1qEgc+cW
	 ve3XoBwTq/I9d8jRpZKedTTvySRnzKgdDrP+jL4PkKIuzTS2ZhiiUQQLbraYFv4JGn
	 eYUqVEJoKZnZzjgYGZFLtlyF0W9wFR2qEzRPYznk=
Date: Mon, 9 Nov 2026 16:52:50 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>
Cc: jacopo.mondi@ideasonboard.com, dan.scally@ideasonboard.com, 
	nayden.kanchev@arm.com, mchehab@kernel.org, hverkuil+cisco@kernel.org, linusw@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: mali-c55: Require an enabled link to start a
 video node
Message-ID: <avHo8IXKwjsWNzO3@zed>
References: <20261105231626.7152-1-devnexen@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105231626.7152-1-devnexen@gmail.com>

Hi David

On Thu, Nov 05, 2026 at 11:15:59PM +0000, David Carlier wrote:
> mali_c55_pipeline_ready() skips queues whose link is disabled, but such
> a queue can still start streaming on its own, as the video node pads

Can you elaborate on how this could happen ?

How can streaming start if you VIDIOC_STREAMON() on a capture device
without an enabled link to the resizer subdev ?

> lack MEDIA_PAD_FL_MUST_CONNECT. Stopping it later sees a ready pipeline
> and disables the ISP under the connected queues still capturing.
>
> Mark the video node pads MUST_CONNECT so that starting a disconnected
> node fails with -ENOLINK.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
> Changes in v2:
> - Add missing Signed-off-by.
> - Cc stable, as d5f281f3dd29 is in the stable tree.
>
> Build tested only (W=1, checkpatch --strict clean). Not tested on
> hardware; the disconnected-node STREAMON/STREAMOFF sequence is from
> code reading.
>  drivers/media/platform/arm/mali-c55/mali-c55-capture.c | 2 +-
>  drivers/media/platform/arm/mali-c55/mali-c55-params.c  | 2 +-
>  drivers/media/platform/arm/mali-c55/mali-c55-stats.c   | 2 +-

Why not the resizer ?

>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
> index ff01553026fb..2dbce550d089 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
> @@ -855,7 +855,7 @@ static int mali_c55_register_cap_dev(struct mali_c55 *mali_c55,
>  		goto err_destroy_mutex;
>  	}
>
> -	cap_dev->pad.flags = MEDIA_PAD_FL_SINK;
> +	cap_dev->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
>  	ret = media_entity_pads_init(&cap_dev->vdev.entity, 1, &cap_dev->pad);
>  	if (ret)
>  		goto err_destroy_mutex;
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index 16e895e3488e..0888dc4a340e 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -1014,7 +1014,7 @@ int mali_c55_register_params(struct mali_c55 *mali_c55)
>  	INIT_LIST_HEAD(&params->buffers.queue);
>  	spin_lock_init(&params->buffers.lock);
>
> -	params->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	params->pad.flags = MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
>  	ret = media_entity_pads_init(&params->vdev.entity, 1, &params->pad);
>  	if (ret)
>  		goto err_destroy_mutex;
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
> index a9c28b090b2a..a9172781925c 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
> @@ -275,7 +275,7 @@ int mali_c55_register_stats(struct mali_c55 *mali_c55)
>  	INIT_LIST_HEAD(&stats->buffers.queue);
>  	spin_lock_init(&stats->buffers.lock);
>
> -	stats->pad.flags = MEDIA_PAD_FL_SINK;
> +	stats->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
>  	ret = media_entity_pads_init(&stats->vdev.entity, 1, &stats->pad);
>  	if (ret)
>  		goto err_destroy_mutex;
> --
> 2.55.0
>
>
