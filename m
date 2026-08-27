Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D48A46EF6B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843692; cv=none; b=e55lRMZyhvnf1hx/T2D6ldyDWOHR7s/UmVjnWAXZCDSgtMnaDbFa/UqGqS5d0mHKGo43oEiCcc8qcGGlJBJYsEjfOPLXfIDfABQhnDCWTtP33rh87gyKqGIuNajQ1U743T7kcqJ762k8YFAO9Yt2lyrStbMUkJYZ5hHy1er8fz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843692; c=relaxed/simple;
	bh=De9uxGFkIbvDpbdmV2B0CYxzNS1ilgoGnNj17FYNTcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBaOHp/Eow+HLWP2trhTYRgs++CFn5DvX5II3ebSGa3Ib472F5d5ZmWXgT0Lt+/B8QFmArdrwThSd6ChxBxlLA2ZCFukCoKB4ZjRGHp66+D3QiAN10FtA0Gx2ccmvNS1Kms24I0Mi12GvU4EJ/lQFz9sKjqg/8PWG4KIg8FmxYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NjBC3Ewy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NjBC3Ewy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31F8314BF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:14:46 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF9843F66F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787843690; bh=De9uxGFkIbvDpbdmV2B0CYxzNS1ilgoGnNj17FYNTcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NjBC3Ewy5BxFa7ZEuwxiGbukSpvDC6VNPT/n2vL1e9SjHqKQwaEcCB+/WphzFlT/h
	 N8LHnhLlwE+Nf9Lh9Vcnu5P8nm1h2sy5Hqw9hRCKkRmz4CpNzbfV0495r+BtaJJxyS
	 NjE8VK7prG6eoHx216gCLWDUP/FtLOGyjqOWMOUY=
Date: Thu, 27 Aug 2026 16:14:39 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
	Chris Diamand <chris.diamand@arm.com>,
	Akash Goel <akash.goel@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/18] drm/panthor: Flush the cleanup_wq in the unplug
 path
Message-ID: <apBUXw3vjSpy9IyA@e142607>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
 <20260826-panthor-unplug-fixes-v4-4-982cc8f4234b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826-panthor-unplug-fixes-v4-4-982cc8f4234b@collabora.com>

On Wed, Aug 26, 2026 at 04:56:03PM +0200, Boris Brezillon wrote:
> If we don't do that, we might face various UAFs, because the resource
> referenced by these work items might be gone by the time they get
> executed.
> 
> In each subcomponent making use of the panthor_cleanup_wq, we add a
> flush_workqueue() at the end of the _unplug() function. Note that this
> assumes no more work items from this subcomponent gets queued after
> that point, which is not yet guaranteed, but this will be fixed in
> upcoming changes.
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://sashiko.dev/#/patchset/20260625-panthor-signal-from-irq-v5-0-8836a74e0ef9@collabora.com?part=2
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c   | 6 ++++++
>  drivers/gpu/drm/panthor/panthor_sched.c | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index d43ba1c7cd2a..1385ee28bee5 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -3367,6 +3367,12 @@ void panthor_mmu_unplug(struct panthor_device *ptdev)
>  		}
>  	}
>  	mutex_unlock(&ptdev->mmu->as.slots_lock);
> +
> +	/* Ensure any pending job cleanup work are executed before returning,
> +	 * otherwise those might access objects that are gone if the work is
> +	 * executed after other components are unplugged.
> +	 */
> +	flush_workqueue(panthor_cleanup_wq);
>  }
>  
>  static void panthor_mmu_release_wq(struct drm_device *ddev, void *res)
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 42adfc76b9e1..a6d57dc1b43e 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -4049,6 +4049,12 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
>  		sched->pm.has_ref = false;
>  	}
>  	mutex_unlock(&sched->lock);
> +
> +	/* Ensure any pending group release work are executed before returning,
> +	 * otherwise those might access objects that are gone if the work is
> +	 * executed after other components are unplugged.
> +	 */
> +	flush_workqueue(panthor_cleanup_wq);
>  }
>  
>  static void panthor_sched_fini(struct drm_device *ddev, void *res)
> 
> -- 
> 2.55.0
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
