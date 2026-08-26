Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E4641D122
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747276; cv=none; b=WO0EXiXjVQqmyA5DsKNch6OXtJsAE6jcZzKdL7MsQPw+p96DYuvBRMsIqs9gsPzXX5R4pHTSN9BSGRoWNnKcH07EwoYhbTucEFJ5vg1UTl6s7CZHCW7ClK6tSmTCjlyJ6qTHbOSJx2hPoq+sSEX8a0FKE5+2YUjhZ5qu74J10p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747276; c=relaxed/simple;
	bh=wvOp/5M9oSeAib2BaxQdO+zwBzrKRwMctyM/1j1TAec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tIEL2nR5LkOw1nRnCrWemGVXXvU98pXVmRxIIbBBtWC4dwkaKrHMG52b8AjZ6IkRzKwnBHSveL4xQG4NHQQiF5dv+Q/uyVA3WauVs2oSYLb3CwfN/qkTC4Suu/y/0NoBYTgRAOyp3cZrMmjaP9+iLeysWw1YxEwElNzCDiuC+pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=d5honx7x; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="d5honx7x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=RDMQst8eEoPEmikPgwEYc77DJ/dIQ8+891tDktDBlKE=; b=d5honx7xEAKCqLAft8iVBnJXkA
	1106cIY+UCfYnkIz6G4+20BSFY5cT22Hj81MOyvZBpZcaDCZw2siSjEB2ssugpOnaSafvDY3LcjCc
	65vZKPYMqApoTQb6BHjfl1ZAILKzn73hMagjRwUesCbA23Wd4zFs+t2jrFytlyK2O/QGnzrkAfMWz
	dKujTF3atXZn4FE04w2+JHpWZRcBKYpr8q3T73W5sqOr7Bpdh5ESoePSzrEXj9wgfFIFxqDN3baVZ
	ug1CoNSQfEYEH2UsnU7AVSrXklRg26j/jz+XKsUXgUWljgU2/WF9Nr9LfI9g6rRFBePbPbWTp1QW1
	WY9/bLTA==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154] helo=[192.168.1.206])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wzCj9-009X8C-AF; Wed, 26 Aug 2026 14:27:35 +0200
Message-ID: <96fd00f9-bab3-40cb-b028-16f721e07c46@igalia.com>
Date: Wed, 26 Aug 2026 14:27:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/atomic: remove bogus check for file_priv
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20260817-drm_atomic_bogus_check-v2-1-2b9e60f32a7e@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260817-drm_atomic_bogus_check-v2-1-2b9e60f32a7e@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/08/2026 20:45, Thadeu Lima de Souza Cascardo wrote:
> Since file_priv can never be NULL at prepare_signaling() as it is only
> called by drm_mode_atomic_ioctl(), remove the check.
>
> If that was not the case, skipping the rest of the block here would cause
> the drm_pending_vblank_event object to leak and fail to set up the fence in
> case out_fence_ptr is set.
>
> Since the check is unreachable, there is no possible leak.
>
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

Applied to drm-misc-fixes.
commit d32b08284f44c20edb2ea3f64ba0a6a165036fb2

Melissa

> ---
> Changes in v2:
> - Change commit message to indicate this is not a reachable leak.
> - Link to v1: https://patch.msgid.link/20260729-drm_atomic_bogus_check-v1-1-a4d5bd4ae4c8@igalia.com
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index e997917819e8..657c15474ed5 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1445,9 +1445,6 @@ static int prepare_signaling(struct drm_device *dev,
>   		if (arg->flags & DRM_MODE_PAGE_FLIP_EVENT) {
>   			struct drm_pending_vblank_event *e = crtc_state->event;
>   
> -			if (!file_priv)
> -				continue;
> -
>   			ret = drm_event_reserve_init(dev, file_priv, &e->base,
>   						     &e->event.base);
>   			if (ret) {
>
> ---
> base-commit: ab243f74ab4084ca5c8dec608cb5b0deb27db067
> change-id: 20260729-drm_atomic_bogus_check-456d5fb6eee9
>
> Best regards,
> --
> Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>

