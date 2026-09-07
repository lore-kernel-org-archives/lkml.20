Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB374119E3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764454; cv=none; b=UhPON1K1tjPm289NqFb4FVTI3cLhTHbjtE2G1rdh174H/tbCVxtFW8qBTjiB4JwLcZRbTD0TArwy3YLtcBn9qj4Gzyem8DK62MqxTez1jNzaYfgzlsX3D9wFkBcb+l0uUaH2u0+hn63I8tgHFiHsxdCy/y3F87V3WaA4J4cpuN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764454; c=relaxed/simple;
	bh=sLQ3SwAUUXRzuIZz/i1Gx4vixDbuAVR782D36s6FlvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPUrxmPr5EoK5hA8/ehEfzMrqHIF0Wp2aCY3vADrwG0F8H0yzXglOoYA5cE09naDel/lz+3K6e2YSwllFOxPWR/odl40HvNpfBpkz29aQ86krQiSlxAOXv1dtDjta/bUIzS0RPrwEFBxzSqCQPaGPEagbTMiFFev3KQq5n4jCxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nSd2cOng; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nSd2cOng"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3489408a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788764452; x=1789369252; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5WskygW+ceCXuqHmaYkYH5iopbTLupaw7gvlN5zYQE=;
        b=nSd2cOng71Nr2G6pFLJhMItZAvtoUGdIn6dbSO87HaSfPToKEMoC7kxfHGwsrsLcGl
         fd2emXb7j2WQNNAKp/OxuXneyon7eHDkuZVqt4ADTIlOXcWf0/dLPZzGWwlAN8yg7JnL
         oJfBg5AFbUsRZJ5+g8jltthH87nrpMieYeLJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764452; x=1789369252;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q5WskygW+ceCXuqHmaYkYH5iopbTLupaw7gvlN5zYQE=;
        b=IgKV2CPN82vl4v3D0PXur4+dMc4HtlrZrtA6GRlU4RHwgcl2Nl+GjGSgSC5P0fXzGm
         G8xeNq3RLZUeq7yK0fHwHiN01sGT7jZLjWo6ondObijuxR4zCaTsFka3eWfisEV4/+ZU
         fGIA58F+SXpxeh0spLal9b1Ru2AiYlHVrBmebFkyAovrePs9sv7ei1W/HDlbJHC7jrmE
         iFoX2hQQmBjxAIYy6TSq4WHTK6yUbJdLsBZXAR594/wRW2eerse0ouoRZi27fWz+G2ZO
         3e4sDxvJFWOYIY+DU6V6PK2zfeHi5tCSyDEttu6Uc9rTw1UqvhqP3Fxp//8xGPEKVupm
         zzSQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4G0XB+Z3zOmFnN6wJBV3vQhGVwzEMXH+7e7FBFdoShsVg2hjGkOfugeTC+BTN55gUAnLf1SKSUMxfUdE=@vger.kernel.org
X-Gm-Message-State: AFuF++l9hgBqqUhPCQnp3x5AfBW5NEhb5qAKOLFGvj6L81RbJB5/pMc4
	f1XW2uYI+oEXpqqfvk4XJuBjWgDt4WJLVvxY2vrC3d+9HtpkEb4JrQLfOeP+gY8ILPj8Tz+wDuA
	OuJxqkw==
X-Gm-Gg: AYBFou2EcD/cAHHMMHwT9ezRdb6lBKdWSRYPTOKpi/ZeL8K6rm79AaO6Yj3A1hDA+mz
	EA8tOtJTbeVQq4/Z2c0YufCApGIkWgfw4W7vTuJhba2Tg6FoWnoWx+BvQ4eB6j5BlkpV7HhfPS7
	WRbp/xapGSUe7OCS0y/mqLaIZmFFwIyzmkPWu9fL8Nui6EjIBDRcm8E9M6mKMuvOJsK3cD9si+2
	Zl8AlMXl+Csai2K4BykTAdg43V+nKXvWuu8iLMkemfghSQBui77e69IJ+Uu+MB1NruFaVfJNCcx
	q8Jge9thTOXSp+WN7D6TfGbZgSFSEiAxYnmkZROcPCzXI/Hpo8ZXancmqEO4p9QGyTDkYc9iU/W
	pGO3V5wTzn60qngLJpEvNhoTnw0aBcgrH5Dk9hBY4KWLvRaw/McaJDhH5B+fxYhT7pI4SP/m/dy
	/kqp1pHjPg1vzMQms05GTCg8z48oZv+xlh0j1LqhBlCrw2YQk4TDhvVFuni5CwVtG5Byh2zr9fW
	mysKI84oF+gZJZ/6aojHcgATS5xTD0=
X-Received: by 2002:a17:90b:55cf:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39b261b1a52mr35231357a91.12.1788764451496;
        Mon, 07 Sep 2026 00:00:51 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com. [209.85.214.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612ba2bsm18394903a91.14.2026.09.07.00.00.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:00:51 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d7200b2e15so33156495ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:00:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBze6ScA7Cn56RP/0XjOd2Y8v7hxMjTyXEot2/dKcXgCzX9dCsxLh4mcY3cO653zLBod1+S4xGrmr7jPDpM=@vger.kernel.org
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id
 98e67ed59e1d1-39b261b1bcfmr37283600a91.16.1788764448217; Mon, 07 Sep 2026
 00:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907062819.2519878-1-98lawweijie@gmail.com> <20260907062819.2519878-2-98lawweijie@gmail.com>
In-Reply-To: <20260907062819.2519878-2-98lawweijie@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 7 Sep 2026 09:00:35 +0200
X-Gmail-Original-Message-ID: <CANiDSCtypCfEoZbRvdT7EoJdd2G8yOVcvxBoS5LcE60UjFQx2g@mail.gmail.com>
X-Gm-Features: AcwNN1X7eNH4dgTPP7uE_95pl9LbXvmNZv7-4pX7KqzlKshUnu0bIwYnd8a9zmQ
Message-ID: <CANiDSCtypCfEoZbRvdT7EoJdd2G8yOVcvxBoS5LcE60UjFQx2g@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: uvcvideo: Fix NULL deref on events for
 uninitialized controls
To: Wei Jie Law <98lawweijie@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wei

On Mon, 7 Sept 2026 at 08:34, Wei Jie Law <98lawweijie@gmail.com> wrote:
>
> A null-ptr-deref exists in v6.12.105 and upstream. KASAN crash log:
>
>   KASAN: null-ptr-deref in range [0x0000000000000080-0x0000000000000087]
>   Workqueue: events uvc_ctrl_status_event_work
>   RIP: 0010:uvc_ctrl_status_event+0x105/0x280
>    uvc_ctrl_status_event_work+0x82/0x240
>    process_one_work+0x66f/0x10b0

Could you provide more info on how you reproduced the error?

>
> XU controls are initialized lazily, on the first UVCIOC_CTRL_MAP or
> UVCIOC_CTRL_QUERY.  Until then ctrl->info is all zeroes, so
> info.mappings is not a valid list head, list_empty() returns false, and
> uvc_ctrl_status_event() walks it from a NULL next pointer.
>
> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wei Jie Law <98lawweijie@gmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Assisted-by: Claude:claude-opus-5
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3ca108b83f1d..21802f9b1b61 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2209,7 +2209,12 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
>         struct uvc_device *dev = chain->dev;
>         struct uvc_ctrl_work *w = &dev->async_ctrl;
>
> -       if (list_empty(&ctrl->info.mappings))
> +       /*
> +        * An uninitialized control has a zeroed info struct, so its
> +        * mappings list head is not a list: list_empty() returns false
> +        * and the walk dereferences NULL.
> +        */
nit: I would not add the comment.
> +       if (!ctrl->initialized || list_empty(&ctrl->info.mappings))
>                 return false;
>
>         w->data = data;
> --
> 2.43.0
>
>


-- 
Ricardo Ribalda
