Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC6053A3A3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076514; cv=none; b=AQ9yIhvgBkkIPdsJPPnvO9r25xGVz+RVKKkz4s+AEhdhLoJllMbWlQMnSrzJepbjTZXs2SfDAhR1LvE6i8qxdD8UGswdDODr42kpAsmh9KL98eoiC3aVdlNbzSJpMPRbZo9MJzldP2o3PRZHouqdtowC3eIgL4L9M+oadGQk+ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076514; c=relaxed/simple;
	bh=gG+ucN6t1rCdtKjxiavG2+5yDMmJ3sKVxpjLLrrXgqM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SUAAwGbQ6EobzJ6GdyF1Z1+5jaLkjTbQ4PQ4ldnlZT+bb27nEOOrA7AFkh3sQULlGrrSN9SQC3OguTvsE6EHDeCMbczBRT1YHykzH2MW+Vi9g8ROclX3YB8MtBCGVvU73F/C/sxWiREx1jQJ5tlH/6twkm+8xJjU30tkrBVs3QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aj800mXp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aj800mXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790076505;
	bh=gG+ucN6t1rCdtKjxiavG2+5yDMmJ3sKVxpjLLrrXgqM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aj800mXp4OG5xKwwBejtWRqdVC/JtuhdYhbm5/YCZYq5pVm8m+qXqJD+VcVrMAZdn
	 Maa0rSeZMpZMtK8gfnzzyhKPl0S2vzw7/0UA5KlyqZG3Q4p3g8V87h12uAfh97RT/M
	 RHA84nXnW1f5nT1jqVtxePeILaEmAb0NcV4giWNWlCs2kn33QuygTtpOmFGBrpkaCo
	 RLnyhjoruygWnxXHDuK5F7ikUZNYQkQUaJXXIjlXBswI5OTKXJN095hiaoiKS3tbaI
	 lNv8KzSNQylXabwtv4r5FiItc9NJQ8L73gmF1vK1tNLdfbuH6Vb6SdwnuY5fXUk5xB
	 P/uiptrl3/Gww==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB04B17E0515;
	Tue, 22 Sep 2026 13:28:24 +0200 (CEST)
Date: Tue, 22 Sep 2026 13:28:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH] drm/panthor: Fix handling of NO_MMAP BOs
Message-ID: <20260922132814.3ca8914b@fedora-21.home>
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

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

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

