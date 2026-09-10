Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622BD34A3BF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002874; cv=pass; b=WpsOo8kXM2ypCTFDwIbHelU4g0D19k7MaXnUykm10AdrBrZ/NqgNlvzsqTRlGj1UBvr+9eTfa8yUnu7qoWaOVRd0x6peOBAdJaoEtIw/CVpXRu1dAYoQrnIs+gqUnnr5wPPapG9O5XkdDot/Y1J6yfmSDPqgjmJwCHltMVdBmrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002874; c=relaxed/simple;
	bh=DxbXvJm+cKO/83qLmQI714EOk18xEDWduFtyz9KMjUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feJCxXtb/4MWVBTwqZ7Ab+7QgncHOLdRn+p0hlw2LFMm7bsEJma8CLid84U2SrPtQfYLk1HD91QyDo7d4FZuSn4nu7fiJxUpe9jcyzPNJj6AigFo1UmaSiZTtcV+sc6kUjCeATRI936es53h7SxNKhntyce5BNW2/YXtyySr1j0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Vl97ZcIO; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Vl97ZcIO"
ARC-Seal: i=1; a=rsa-sha256; t=1789002858; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gXEKXHnwU50R0iUBnEMv48LY+zzIWyVa46yjlEIio0orGsWbk35ObFsWl13uGT3gKQf6WqLQDa4f39hafg0gOjW3rMPfG5NIswq4SJiL1D2+VddjJuqCDF8O8EuPajm2YdqnII7qNATuLqREr+dYSXj+3uTqfPe9c+mWKtmXbEY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789002858; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xAViyxVnzKU7sIwQUPeaab/vulcgLpCH31RPs3F/His=; 
	b=cSvCfCMlaUw5nYCRITy1Qe3LEuChuJ0OgSm7cTI0YQ0BxNvPNGWZyt3WKnKBERRqt2mlZWSnje4Q/CaXBaRsx2eVZsVjgnHIaInVhgid4vPIKs6HMRHLq+0DjwyLuA0bXxUU9+gJdaIY2290FxK/Q7Itjgzz/sNNmTDSnFeFFcE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789002858;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=xAViyxVnzKU7sIwQUPeaab/vulcgLpCH31RPs3F/His=;
	b=Vl97ZcIOgT1GxrvDyA+EFaF8QrZvSz3pk6aOAWAm/UeZFHnuDrAnWdkKs2B3EyrL
	dKAxCn5HkxDkPt9NPJW2vmad8PNHGjwOWhLaNZj3ngA+t3aHdi7U6SUFw6Bs486vYiu
	G4EEa4HSdQP+EvAQP6BoUx3WlZVYm3oqrxXc8fYo=
Received: by mx.zohomail.com with SMTPS id 1789002856824246.88901405836157;
	Wed, 9 Sep 2026 18:14:16 -0700 (PDT)
Date: Thu, 10 Sep 2026 02:14:12 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/18] drm/panthor: Flush the cleanup_wq in the unplug
 path
Message-ID: <aqGOgViRY3Tmp3hv@sobremesa>
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
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.982.46

On 26.08.2026 16:56, Boris Brezillon wrote:
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

I was wondering about resources group_release_work could access after unplug that are torn down in this
function, and guessing they had to do something with the Panthor scheduler itself. I didn't see any
because they're all reference counted, so I suppose the problem is the panthor device itself?

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

>  }
>  
>  static void panthor_sched_fini(struct drm_device *ddev, void *res)
> 
> -- 
> 2.55.0

Adrian Larumbe
