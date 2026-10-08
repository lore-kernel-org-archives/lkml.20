Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D01B4746BB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449647; cv=none; b=Hgm5zqN1Kzzl+YGE9lHQxDYMJvrWescfM5g/o/xPwmodCzXjJaDg/ZmxzGR9abBRiBtF7dOAtqxqu3OL1Qix4A4BK8iRgxXmTRVFein/E+9ypDPnpZU85oM0g34KliCgNLj4GvzI4i6f5231IKb6OL3qq8g5DQgnrMov7CTNUyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449647; c=relaxed/simple;
	bh=kv5z2TT6AyAkWoFsdmXPAE51rmMlmY8WTTT3zFEcWSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1EIf67qrKiZzLjLatLGp66NyRGc8iMBcJI3zdZdxjAJB3GjnS1VRMt3ZsDz8BORv0hN7FYRpfqiA8q3f9X7yRrCRykfw919HzynhF+9quTXDsO+WbEHLGRKANC9355Zy6yYpYWLf7sj897yjds5PmzrK5cNdKIvuJvbOJmSsKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=muJ6CBXA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="muJ6CBXA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D57AE1516
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 01:54:01 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DAC7E3FB3E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 01:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791449645; bh=kv5z2TT6AyAkWoFsdmXPAE51rmMlmY8WTTT3zFEcWSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=muJ6CBXAf2RgNpxvIdePmILLVReOU84CxdM8dDo0X+6axeOlE0wdf7VjoxvY2Gx+1
	 ve5ELPhU8fw3jkR7qaUwAvQZQCH4P+SzASv8YOrMho9bQlcA7oc2zxbf1HF0g9nGKN
	 887ur+rv3Oqb3LRPqZ1U0mN+3NzWjc5guZz/VNzU=
Date: Thu, 8 Oct 2026 09:53:50 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Fix TOCTOU race between GROUP_REGISTERED
 check and erase
Message-ID: <asdaHi1t7i721Xfn@e142607>
References: <20261007181220.2418060-1-osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007181220.2418060-1-osama.abdelkader@gmail.com>

On Wed, Oct 07, 2026 at 08:12:19PM +0200, Osama Abdelkader wrote:
> panthor_group_destroy() checks the GROUP_REGISTERED mark and then calls
> xa_erase() without holding the xarray lock across both. If the handle is
> destroyed by another thread in between, and a concurrent GROUP_CREATE
> reuses the freed ID, the first destroy erases and releases the new,
> still-initializing group, leading to a use-after-free in
> panthor_group_create().
> 
> Do the mark check and erase atomically under xa_lock().
> 
> Fixes: eec7e23d848d ("drm/panthor: Prevent potential UAF in group creation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

As Boris mentioned, please let us know if LLM has assisted in finding the bug or in
the creation of the patch before we can merge the fix.

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 0493858e55d7..a343c5180e01 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3770,12 +3770,18 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
>  	struct panthor_group_pool *gpool = pfile->groups;
>  	struct panthor_device *ptdev = pfile->ptdev;
>  	struct panthor_scheduler *sched = ptdev->scheduler;
> -	struct panthor_group *group;
> +	struct panthor_group *group = NULL;
>  
> -	if (!xa_get_mark(&gpool->xa, group_handle, GROUP_REGISTERED))
> -		return -EINVAL;
> +	/*
> +	 * Check the mark and erase the entry atomically, so a concurrent
> +	 * destroy + create can't make us erase a group that's still being
> +	 * initialized and happens to reuse the same handle.
> +	 */
> +	xa_lock(&gpool->xa);
> +	if (xa_get_mark(&gpool->xa, group_handle, GROUP_REGISTERED))
> +		group = __xa_erase(&gpool->xa, group_handle);
> +	xa_unlock(&gpool->xa);
>  
> -	group = xa_erase(&gpool->xa, group_handle);
>  	if (!group)
>  		return -EINVAL;
>  
> -- 
> 2.53.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
