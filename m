Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CDC48A8A6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135151; cv=none; b=GkV7p3O+hbgNha7y/FsqpXBPV8f4NTuB7eRKoQ2r8YoD7u/2J36nGRUwUnqWtHsu73xUTXUdPDnfH6iW/cSFP0Kgz+fhkNPG1N7MPn3Z13uJH62oUoMGVIkKZEWZq/8IMuf1qIEH9Qd3t+E4WUFQrcsRmNqiWaQ/hKBKoernNCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135151; c=relaxed/simple;
	bh=qyZRqlRVa+te18rp4tHtL2Z96Joq707rpJxoDVai6bE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RtNmfu0Eyfx0vxgU1dhcelxuJx0BN1PGIZXUMQSy5lVLKa95PCgWmqG4gYZuWRiveqUfTfhnMePpN2q6G++DE0oJec5YpOnbXfla5UunZrESi0rKnqYQ/EgaMJzJi0ejJDIWf/hXSDzsHMuw8OuPKMl51JY2fk6g6PCoOJf78QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=TfDfx0Ki; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="TfDfx0Ki"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=NUjN4B4f7lGZ0KhNS6XMFk8J0whNkOXMOPXQ3kaf6lc=; b=TfDfx0KimNdWpbzcT+1nHoreWq
	k2ETKfEy4meSWlDd9bnTuSRZxGViWyaTTh2bgtAIjk7pHynVaZjo3PZVwYKGz8rtteKmPkpx4KdeB
	8TV7drQ0eo79j5FAVnz//7Z4lSM76YWHVJwcFpm0/aXuy+SBOuHAoFskdfwPBzdZ2+oNIa8Yv7pm0
	hSVp+0HPnT2Db4+an24NFZjt1mKaT00Q0vgWOuEM+Wf58w6gm+j360WSPCceabNu2IhhX662wU6SL
	PuhzuZpiyRkr+AEgU6Zh1WUy7wpBtqN8UqC7EPJEGe3VwJYJuI2YCfXgvQ0YmTZ+l/5airPDkW7IR
	jETV7bxw==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113] helo=[192.168.1.210])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x51m2-000hUv-IU; Fri, 11 Sep 2026 15:58:38 +0200
Message-ID: <48a67b88-7ad8-4764-bab0-c226e9247dda@igalia.com>
Date: Fri, 11 Sep 2026 15:58:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm: Fix drm_pending_vblank_event leak in error path
 for out_fence_ptr
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, sashiko-bot@kernel.org
References: <20260826-drm_pending_vblank_event_leak-v4-1-f8de8b996b9d@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260826-drm_pending_vblank_event_leak-v4-1-f8de8b996b9d@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/08/2026 13:46, Thadeu Lima de Souza Cascardo wrote:
> When an out_fence_ptr is provided but DRM_MODE_PAGE_FLIP_EVENT is not
> set, a drm_pending_vblank_event will be allocated. If later, there is an
> allocation failure or another failure at setup_out_fence(), that event
> will not have base.fence set and it will not be released at
> complete_signaling().
>
> Release the event and set crtc_state->event to NULL just like in the
> DRM_MODE_PAGE_FLIP_EVENT case when there is a failure at
> drm_event_reserve_init(). That is, prepare_signaling() releases the
> event and there is nothing to be done at complete_signaling(). Use
> drm_event_cancel_free() as that will also undo drm_event_reserve_init()
> in case it has been called.

LGTM. Thanks!

Reviewed-by: Melissa Wen <mwen@igalia.com>

>
> Reported-by: sashiko-bot@kernel.org
> Closes: https://sashiko.dev/#/patchset/20260727-drm_crtc_atomic_commit_leak-v1-1-23d9948a9d7c@igalia.com?part=1
> Fixes: 92c715fca907 ("drm/atomic: Fix double free in drm_atomic_state_default_clear")
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> ---
> Changes in v4:
> - Rename label to err_free_event.
> - Use crtc_state->event instead of a local variable e.
> - Link to v3: https://patch.msgid.link/20260817-drm_pending_vblank_event_leak-v3-1-7582b24447d0@igalia.com
>
> Changes in v3:
> - Use a label for the common exit pattern.
> - Link to v2: https://patch.msgid.link/20260729-drm_pending_vblank_event_leak-v2-1-a5074aae07df@igalia.com
>
> Changes in v2:
> - Fix UAF when DRM_MODE_PAGE_FLIP_EVENT is used.
> - Link to v1: https://patch.msgid.link/20260728-drm_pending_vblank_event_leak-v1-1-08429b920b16@igalia.com
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index ae7667d1072d..8c0eea2fed4a 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1458,10 +1458,12 @@ static int prepare_signaling(struct drm_device *dev,
>   			struct dma_fence *fence;
>   			struct drm_out_fence_state *f;
>   
> +			ret = -ENOMEM;
> +
>   			f = krealloc(*fence_state, sizeof(**fence_state) *
>   				     (*num_fences + 1), GFP_KERNEL);
>   			if (!f)
> -				return -ENOMEM;
> +				goto err_free_event;
>   
>   			memset(&f[*num_fences], 0, sizeof(*f));
>   
> @@ -1470,12 +1472,12 @@ static int prepare_signaling(struct drm_device *dev,
>   
>   			fence = drm_crtc_create_fence(crtc);
>   			if (!fence)
> -				return -ENOMEM;
> +				goto err_free_event;
>   
>   			ret = setup_out_fence(&f[(*num_fences)++], fence);
>   			if (ret) {
>   				dma_fence_put(fence);
> -				return ret;
> +				goto err_free_event;
>   			}
>   
>   			crtc_state->event->base.fence = fence;
> @@ -1531,6 +1533,11 @@ static int prepare_signaling(struct drm_device *dev,
>   	}
>   
>   	return 0;
> +
> +err_free_event:
> +	drm_event_cancel_free(dev, &crtc_state->event->base);
> +	crtc_state->event = NULL;
> +	return ret;
>   }
>   
>   static void complete_signaling(struct drm_device *dev,
>
> ---
> base-commit: 4d4be202165e832d74849b4a68e289a2a377039c
> change-id: 20260728-drm_pending_vblank_event_leak-a36cedb296ba
>
> Best regards,
> --
> Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>

