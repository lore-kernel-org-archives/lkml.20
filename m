Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDDF37F748
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074217; cv=none; b=CAiwDj08eeP8DCvSbpCHgWbewCg3XMhqT4CIhPvWLFUeb7xqtaltqQDi7W0mUcfqBIFUvjaXqUEbwtDdPbWnaDZkTvuG6oGgBPawQIenUlCH8Tb1crIY1QnZ8qx8jznsU2zrYNWEpujIOrfD9kQ2DNXYuuWpROTpI5PhUrPlAGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074217; c=relaxed/simple;
	bh=0+iooWQw52Www5HReZBOrQwshBCxR+z0ZhLJfDpMqZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kourdmJXgfCDZHeMdgMWf+s009iCknHaVD/HCPti54eiXRIj1t2B+3mYYYw7XkfSUFo5yJEoZCvvtlLgpcDPPpYE4n7AfuQ7wt/MHVkouOBDHoTwTr9Ct/SJlnSNHLDNe/LZb3GcGOsTc1xRQbdrOSg84IoSpEl3nXO4tuWdLRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=L+W/WdyD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="L+W/WdyD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E42591516
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:23:30 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ED1593F871
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792074214; bh=0+iooWQw52Www5HReZBOrQwshBCxR+z0ZhLJfDpMqZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L+W/WdyD/+c93K2SfSXoJt8fRkdS421w83AT7U3mTzek1pGLTXnq8ggBGzftIaLNB
	 JBIvylLeNSTmmws2FxfAEkBz+YpaVTsoKKOSZq/Ys8yKnEw0Hgsjbjv28RZJCAITMC
	 8/4C8Gz12zsR55YRXiuZvxbZbiGITbBPPn9VNMUA=
Date: Thu, 15 Oct 2026 15:23:29 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Akash Goel <akash.goel@arm.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH v2 1/2] drm/panthor: Fix handling of NO_MMAP BOs
Message-ID: <atDh4XdILkqrvHuL@e142607>
References: <20261013125433.26432-1-akash.goel@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013125433.26432-1-akash.goel@arm.com>

On Tue, Oct 13, 2026 at 01:54:32PM +0100, Akash Goel wrote:
> The BOs created with DRM_PANTHOR_BO_NO_MMAP flag are not supposed to be
> mmappable by the Userspace. But after the rework to support shrinker,
> it became possible to mmap NO_MMAP BOs. Userspace could second guess
> the file offset range, allocated unconditionally at the BO creation
> time, and create a CPU mapping. There may not be any adverse effect of
> such a CPU mapping though.
> This commit adds a check in the mmap callback of Panthor driver to
> fail the mmap() attempts on BOs created with NO_MMAP flag. The check
> covers private BOs as well as the prime exported BOs that are mmapped
> using prime fd.
> 
> v2:
>  - Fix breakage of mmap() on exported BOs that didn't have
>    BO_MMAP_OFFSET ioctl invoked for them.
> 
> Fixes: 68cbf96b1e9b ("drm/panthor: Part ways with drm_gem_shmem_object")
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Pushed to drm-misc-next.

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index c07a44057e42..22b57ab6f929 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -744,6 +744,9 @@ static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *v
>  	struct panthor_gem_object *bo = to_panthor_bo(obj);
>  	int ret;
>  
> +	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP)
> +		return -EINVAL;
> +
>  	if (drm_gem_is_imported(obj)) {
>  		/* Reset both vm_ops and vm_private_data, so we don't end up with
>  		 * vm_ops pointing to our implementation if the dma-buf backend
> -- 
> 2.25.1
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
