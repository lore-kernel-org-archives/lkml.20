Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC97345CBE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002931; cv=pass; b=MXKpvLSNwqpJed0Bb8rJPddKF5N//Y5u/5pG0unXJEqW3NwtqnGLjjYtr2a0RKgjq2Azko3LiMex/6MB+tEoeeES3mbigPHNRNy8zaSh7C11jBcKj2k60RF292t82LhuguicSWkuwkGFhLOmL7e4iwphOq/cb/4iuSiqBuOjIh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002931; c=relaxed/simple;
	bh=u8PsVXvRhPnhKkkLtMmkt1Xwt6CaHip1JB5u0alMxf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGadQYrz0dhgEX+EOy4ZSCGZpkKRH7n+SFXewx8OafeyceA0ZR52g1Cp6KMr7zVf5d7cI68FTosSLgVclGWPcW1Yi9XmXaQC0PKJVaSHWW1fZrgZpKcAmw2HvgGAnyRW2JQ0sPMP1dbQ2R5IhBEwv+Fjas8fBdIJnDDd+PHMGPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=XGTRkNct; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="XGTRkNct"
ARC-Seal: i=1; a=rsa-sha256; t=1789002916; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LizOaGzLxc3jCdW18fl0KrMWGBeRBVVnFkU9CB3OBEtgi0RTnXH14u5r4o3p54BZT49L7jb3KdjsJAWiihC3AvfTAzvAyJQmknu/Xs0ejeswG0EG6KAuFlcZ4D0AYfCMhN+3IA3wrdCNAO27SPKSjc38ij4W+8WqbRGYIi4vY6E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789002916; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4MntxQDyfuC6cfeTweUENwwFcn3DP5wHtukYShWkrWA=; 
	b=IIEoZxNrQCzlx6iMGEemA754v+4RqGxJjarqizL7uMUW9BahhZy9jgbkQEUbZVG3LMwqIsrAjxRbupXAf8ImPwuxhehTzSgf+SClQuvjEhV+y+LD1DRY0POu2fo2DLnX2Y7qfbbfWGCHEAF/CzuE5AIWsxTZ/WrFZ1J9zsBXjpQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789002916;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=4MntxQDyfuC6cfeTweUENwwFcn3DP5wHtukYShWkrWA=;
	b=XGTRkNctszzoA5UY3TXGeq6gqjqdjtLU+np4R6oTDBn4iXUnBOsjdLPq/ryuFWMY
	+VnwIQ2IapK6vTHJ8WbwEal4duILS51fPhqvPudF9CuiVuDp9JvAOE11HhOpLDiGlcA
	u4OGdyZ0ERYcznD84zgO5EoPd8MI0poOetYHKrRA=
Received: by mx.zohomail.com with SMTPS id 1789002915190385.4411115226686;
	Wed, 9 Sep 2026 18:15:15 -0700 (PDT)
Date: Thu, 10 Sep 2026 02:15:11 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/18] drm/panthor: Drop unused vm argument passed to
 panthor_vm_prepare_sync_only_op_ctx()
Message-ID: <aqIAuZ1p0h0BW8Vn@sobremesa>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
 <20260826-panthor-unplug-fixes-v4-6-982cc8f4234b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826-panthor-unplug-fixes-v4-6-982cc8f4234b@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.982.46

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 26.08.2026 16:56, Boris Brezillon wrote:
> No need to pass a panthor_vm around if it's unused.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index b4e41556247a..44a44602b8ba 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1462,8 +1462,8 @@ static int panthor_vm_prepare_unmap_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  	return ret;
>  }
>  
> -static void panthor_vm_prepare_sync_only_op_ctx(struct panthor_vm_op_ctx *op_ctx,
> -						struct panthor_vm *vm)
> +static void
> +panthor_vm_prepare_sync_only_op_ctx(struct panthor_vm_op_ctx *op_ctx)
>  {
>  	memset(op_ctx, 0, sizeof(*op_ctx));
>  	op_ctx->flags = DRM_PANTHOR_VM_BIND_OP_TYPE_SYNC_ONLY;
> @@ -3031,7 +3031,7 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *file,
>  		if (!op->syncs.count)
>  			return -EINVAL;
>  
> -		panthor_vm_prepare_sync_only_op_ctx(op_ctx, vm);
> +		panthor_vm_prepare_sync_only_op_ctx(op_ctx);
>  		return 0;
>  
>  	default:
> 
> -- 
> 2.55.0

Adrian Larumbe
