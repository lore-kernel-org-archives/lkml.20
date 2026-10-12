Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DC12DFA4A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823750; cv=none; b=XCQAY5R7HjdlFYxYsL/e8xzpefgvIqRQTBR/nFZMyDwCWwFrLbyeg3ZS1Q31kTN4mUbp3yWEFfAnbq8KbboMOM04Hg6mY/sBhUXNqr46fblnHoNQkIy8qfexPIg7/6O5AGBcJdpXhdLPf9buEQdBAwk0fdVPi4a9t+tk7xxyipY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823750; c=relaxed/simple;
	bh=8TvIDi24R/O+TVv99nnG9HTxml9bp0TzOwiCiySOMsA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pR/ePQI7hrFobLur4JpSk+nD6ZZ4GEtc2AZlHB9VNZSP2TeBog9Ul6TpQFYh5NfgUNZ1wZK/2VVLOWUqEV+8PPVt3Jn2FJ8MRs079/ZYt8QkMgXQHHKnMomWMH5oshxnqdgxMHZ7JZMpeJxv6USN5Ud4RnWz7b0UwIJfFIWxnPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SqUyvMZG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SqUyvMZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791823747;
	bh=8TvIDi24R/O+TVv99nnG9HTxml9bp0TzOwiCiySOMsA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SqUyvMZGM/56SFZhqQH9XmbJVlqX/f0dub/oHQYzbSfl4aiVNcid4VVhfhNqSM4qB
	 TbkstblL2awNWIQTKk0/HO0SUVreykAZdNd25h0LZ9NE9M2x21FTal7C9WakxVbd1q
	 ILy0/ts9PCjiZz/zi+iaLXxoSuB72VUHrtKYKSOdFwQP75wjMOdIusuu+fCSqwrXkF
	 R/H3FcqTAZanIWxEzX1nTvEaVlvrai+O3TK15VX9Ks1xwA1DxB7bRLqxLUb6eBKee+
	 Ws7fJ+xQxlfpZw+V1hWhU76MG71fYv4lhtPf4PY7cn1rpCRUtQW7QN4JX8/FR4Lf6C
	 QPZOvqVERPJ2Q==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C82DC17E05A6;
	Mon, 12 Oct 2026 18:49:06 +0200 (CEST)
Date: Mon, 12 Oct 2026 18:49:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH] drm/panthor: Fix handling of NO_MMAP BOs
Message-ID: <20261012184901.26f2dcbd@fedora-21.home>
In-Reply-To: <20260922100743.447700-1-akash.goel@arm.com>
References: <20260922100743.447700-1-akash.goel@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Sep 2026 11:07:43 +0100
Akash Goel <akash.goel@arm.com> wrote:

> The BOs created with DRM_PANTHOR_BO_NO_MMAP flag are not supposed to be
> mmappable by the Userspace. But after the rework to support shrinker,
> it became possible to mmap NO_MMAP BOs. Userspace could second guess
> the file offset range, allocated unconditionally at the BO creation
> time, and create a CPU mapping. There may not be any adverse effect of
> such a CPU mapping though.
> This commit removes the unconditional allocation of file offset range
> when a user/kernel BO is created. For user BOs, allocation of file
> offset range would be done from BO_MMAP_OFFSET ioctl handler which has
> a check for NO_MMAP flag. For kernel BOs, there is no need to allocate
> file offset range.
> 
> Fixes: 68cbf96b1e9b ("drm/panthor: Part ways with drm_gem_shmem_object")
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Just a heads-up in case someone was considering merging this patch:
we've just realized this breaks mmap() on exported BOs that didn't have
a ioctl(BO_MMAP_OFFSET) on them.

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index c07a44057e42..5cfe66537e87 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -1021,10 +1021,6 @@ panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
>  	mapping_set_gfp_mask(bo->base.filp->f_mapping,
>  			     GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>  
> -	ret = drm_gem_create_mmap_offset(&bo->base);
> -	if (ret)
> -		goto err_put;
> -
>  	if (exclusive_vm) {
>  		bo->exclusive_vm_root_gem = panthor_vm_root_gem(exclusive_vm);
>  		drm_gem_object_get(bo->exclusive_vm_root_gem);

