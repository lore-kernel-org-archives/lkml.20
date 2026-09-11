Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E98386578
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114761; cv=none; b=TrkXTEZwnSmwPYvOtqjzfQeAWZN2P78mtgNwR/4fMBAhy0CNs16Bt1VQ5h7M4cTHd9lyjb7qa6GEMh+DJ1mk27LqgQivZWTfmKmUEgzv44ekOZGjSiK8sO7BXXzgXUMkU/+9hvqxWDhV8R4mM9zDssB9IZoVzWlm1GFKWF/S5wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114761; c=relaxed/simple;
	bh=NR5PEJeqZcHRlJQteP402Uf1pvQNvzrW3tZ7WBIIroo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lk3axc9ZmI8z8HxpGzP07DAdMMFR4U3q35rxCAFnPIh3Pz5siY++uPBb+eX8p9tJOYbxPkQQP8xT3r8LslwRUHR8YwtQXToroC4CQn4BIdH2zy6UkeY/011kRsC8mmObqPYROlk5QtBQBLlaYwQz2Hj9uKfDDbkFSrJCam3Low8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=fR3YVaAs; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="fR3YVaAs"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49e668491f3so468275e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1789114758; x=1789719558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VSH3uim0qHfCyk3GNDzVd8qd6vMAbK7ziEAl5hIbw8=;
        b=fR3YVaAszrefpDn0tUGB4zscBqg3rRtaBnxh5sY12/k9HaZxc34sciyjjellGurtm6
         Jf4P1nBGWeMJ4w/HppXBcx3EcCjTWIZFZH/BEdWiJiarhZr6yG+jVBI1tg8Uuk+nWUa6
         vrOI9Gz6jQJlm3ClISxFKCeDIaOgEczQMh5JRoK+xmUiHIg9Syhu+R0ga548KMWH/W9J
         KFN5JqjFVx9fA4kRIYlglBEpQzKg69BKlt01/UOs3NZRfO80cFgivlo0vjhszu7TU3D4
         SlHzvHUWaesJII33DvlfBJIHkbvJFGcgO0VUA19Ya4Z87p2mI9ps+5gnSgiCbShBLEin
         EA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114758; x=1789719558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VSH3uim0qHfCyk3GNDzVd8qd6vMAbK7ziEAl5hIbw8=;
        b=IjBLIFu4oLm1GvkBB9LuGfSCmWlhASxAyoTBmk36P7scI7cBanUCZgNmfbvQGjFEKq
         ArwQoeg57cwCAUX9AOfhSfCi6Wu++0aWkXxYKK6IHrWQ2gCJIrpNd0SLyjxhEUJCQ/wi
         6PsP9NuG6p4IpHOwrpZ5UzKnSZk5zUihvvya68i6E9UBET1b1QgiApjdswMxk0XcBXRA
         OPiLJm8cbNjNnoI/H05Is5LRsAlr+xLwjCpwQ0JM6aBpXv6TNkFg05e6TcZL4VMt9rMF
         wxYuYcJZFNBwEba6N2RE8mZA42hRUFMxxIrN+aKhdsrjNX1SPCjuFablZ2qFSjFwg2n8
         Qsvg==
X-Forwarded-Encrypted: i=1; AKwUvBwjES4+CGlMERg8qxnQPf7eHyIxPCXluA0sdAhy4A9SSlGVuwHyTe967Ax64+gMViJJ/V8DHAF/s28V9rY=@vger.kernel.org
X-Gm-Message-State: AFuF++m6k8ZiLxs/G8Bi05VqzGdZdZmvwKEte6eU9ChRlEgigEwL5u0J
	QEpiwRD4rs7jPhJDPR78+vkpf3V/DeagD2zfNIuELk/Q1tCX6TUGlLTCTe+Wk9wPTeY=
X-Gm-Gg: AYBFou3RQNT4pR9lW6vHyrqiv2saoVIJeRdKIL5WarPv9NO1fGQgyWqD+HeM1x+YHEm
	a5DD2DG4/I+iGGeMCQNpNayW9pBg3McL3NAYSeIQZjya214DqEg5/c53FwNQktob8ldrYotPCDS
	Q6NFrDo9IHtHMDNtmcaR09pYnEF9+CmHtWCIeoqXKRGxnQ1KOHEszVh0moB0Fj8gzb89HktQXUb
	agM8ejlQWBKczB/iArU/+DFUb4oYnQsNSsJ/MrDnM8Y7ioDS11o8/TUfTAhybI087hsvbUWflq7
	c6/o20T8VSsTROMWwVAwj8JknR+YrDqa9isyUd7GHdi2K5H1iTsp+LZnmDU2S+igsz84DeMtZBu
	E4Y7VH2ZB0mA3KkhfGd+z0dGXkk8gwIWztH2Kchz8AKiwdFa7NM9C+hdFMGjp2Tf9iAbs80gxeg
	MzZIwQrEd10xqBYrjms/oTz4b4x89Ux8H5EEpTpJR9Nd/4YTcV4D8CSKI7h8BtXidtrv53flCb6
	TqOqmTKNQjDFAg=
X-Received: by 2002:a05:600c:e547:20b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49e6198377cmr22396795e9.3.1789114758269;
        Fri, 11 Sep 2026 01:19:18 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm151236265e9.15.2026.09.11.01.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:19:17 -0700 (PDT)
Message-ID: <23c88f50-1998-4de9-bbdb-3d15fd06d642@ursulin.net>
Date: Fri, 11 Sep 2026 09:19:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] drm/sched: Introduce more locking to entity
To: Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260910075942.2000338-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260910075942.2000338-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/09/2026 08:59, Philipp Stanner wrote:
> Changes since v2:
>    - Fix ordering bug between spsc_queue_pop() and
>      drm_sched_rq_pop_entity().
> 
> Changes since v1:
>    - Remove a bunch of patches; make this series only about locking
>      entity->last_scheduled. The rest shall be done in separate patches
>      and series. Consequently, also do not lock spsc_queue, yet.
>    - Move lock-cycle patch to first position. (Tvrtko)
> 
> 
> Both Tvrtko [1] and I [2] have recently proposed some improvals for
> drm_sched.
> 
> While taking Tvrtko's feedback into account for my patch, I realized
> that both his and my patch can be fully replaced with a bigger and far
> more beautiful series.
> 
> If I am not mistaken, it turns out that the entire entity->entity_idle
> completion is also nothing but a workaround around the grave mistake of
> not using the greatest helper with parallel programming that exists in
> computer science: Locking.
> 
> This series adds locking to the last_scheduled field and all checks
> related to detect the idleness of the entity. As before, the
> job_scheduled event queue causes the periodic checks.
> 
> This way, we can get rid of memory barriers, RCU, a few lines of code,
> make things more readable, understandable...
> 
> Greetings,
> Philipp
> 
> [1] https://lore.kernel.org/dri-devel/20260611123423.39819-1-tvrtko.ursulin@igalia.com/
> [2] https://lore.kernel.org/dri-devel/20260626081942.2122144-2-phasta@kernel.org/
> 
> Philipp Stanner (3):
>    drm/sched: Lock drm_sched_rq_pop_entity() externally
>    drm/sched: Lock spsc_queue_pop() in drm_sched_entity_pop_job()

FWIW if you could review 
https://lore.kernel.org/dri-devel/20260907130527.52530-1-tvrtko.ursulin@igalia.com/ 
you could drop the first two patches from your series. Extra benefit is 
that patch fixes a bug and has been tested by the user.

Regards,

Tvrtko

>    drm/sched: Protect entity->last_scheduled with spinlock
> 
>   drivers/gpu/drm/scheduler/sched_entity.c | 53 ++++++++++--------------
>   drivers/gpu/drm/scheduler/sched_rq.c     |  4 +-
>   include/drm/gpu_scheduler.h              | 10 ++---
>   3 files changed, 28 insertions(+), 39 deletions(-)
> 

