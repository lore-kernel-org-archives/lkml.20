Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264430;
	b=KzWXo9f585axh/BtmErt1PQyLBNy6lOSBwDmS57OyBh0lpwe3JBp6yyPlV676w/Wiral
	 gt3KYHR0n3Oaga1AFbPvancf2E6VtA/n+hOUC3uf2zY9m5J0AUYkxxWowe5pxS8aXCq8H
	 2XxyuOyd7/nFbp72XVWuz+8nfeSTsdjpb7Ow7zLOz1W4yGBvGoxfuamZHxNmK3Cohqh3/
	 JPO3/36m9mgW5l8VXl1cqyGlwfH7bfNR7bouHAWKNh6NQRxXeX8yV4UcVp2eHPvuW8Fje
	 QOVDTcZO3TSTrC6HAeziX1Jlf5QYoxNQSchePSM0mPIPjh5iZOgo2f40RdFfKs/Y9TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264430;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=DgX+B0l0y0JObzSV9Y9eOGQGcmRVOIfdFOkUhnziwVY=;
	b=vgM1at8/iltwtCcQa5Y6nvg8QsRHIAf36ymKy5JzCteN3qjMXz9q/4oLCcGq0xiJ2wIt
	 0Y6T6X2gnZzQPGI4Gd/z0XrcxWNqddUMm1FRG+EmkOuC7sPRB6qSrzArT8Ku12xjGuJ0G
	 gKq/qC7ekG/nMCO/Yi7zGGFmG38nTTDVH9FVr6rqLtSAEqlW5C3hxpi9354YBX8Nr0Hiz
	 u5BLPkVm0e2hX44JUzBRVrswCxP2eQWuiMgy9h/XT/ShtvEX4cjVoKAUjN4D2h6b1NFs2
	 Z9PsxDuEZzRDR1J6sD00BgvbBTdWltfPt4ttVE2n69t3gD2EoG0kx4z371wXMSq6mHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NCDv9Hzu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BAF606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NCDv9Hzu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7FE1F01828;
	Thu, 29 Oct 2026 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793264429;
	bh=DgX+B0l0y0JObzSV9Y9eOGQGcmRVOIfdFOkUhnziwVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NCDv9HzuMoEmCs8WRoESgwJLXAydU8XhMhF12n47jW7sNHzO0X3BOlXZ/mz1dMhx7
	 E7qvCiqCWFwk8wyTMscwk/6QjlqbduI5fvc7W/pTjh2wxzJYhaNDYMpU3hrhgbxIoL
	 5aHamqVza5xepn1xnc1cl+e7OSEauaV/fpYpSKmg=
Date: Thu, 29 Oct 2026 10:00:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5r2Y54Wc5p2t?= <panyuhang@hdu.edu.cn>
Cc: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: Re: [PATCH] drm/vmwgfx: unpin BOs without revalidating placement
Message-ID: <2026102908-calculus-reenact-6ec5@gregkh>
References: <AD6AfwDkLPJWAKFimg*tgar*.1.1793261964318.Hmail.242270054@hdu.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AD6AfwDkLPJWAKFimg*tgar*.1.1793261964318.Hmail.242270054@hdu.edu.cn>

On Thu, Oct 29, 2026 at 04:19:24PM +0800, 潘煜杭 wrote:
> 
> Unpinning a buffer object does not change its memory placement.
> Placement revalidation is unnecessary. Currently
> vmw_bo_pin_reserved() calls ttm_bo_validate() for both pin and unpin
> operations and treats any validation error as impossible with BUG_ON().
> 
> During PRIME/GEM cleanup, vmw_gem_object_unpin() calls
> vmw_bo_pin_reserved(vbo, false). The Linux 7.3-based QEMU reproducer
> confirmed that ttm_bo_validate() returned -EINVAL. The following BUG_ON()
> crashed the kernel during process exit. 
> 
> The relevant report excerpt is:
> 
>   [   72.916147] [BO_PIN_TRACE] before-validate pin=0 old_mem_type=0 target_mem_type=0 flags=0x10
>   [   72.916201] [BO_PIN_TRACE] after-validate ret=-22 old_mem_type=0 new_mem_type=0 ...
>   [   72.918841] kernel BUG at drivers/gpu/drm/vmwgfx/vmwgfx_bo.c:342!
>   [   72.918892] Oops: invalid opcode: 0000 [#1] SMP NOPTI
>   [   72.933292] CPU: 1 UID: 0 PID: 346 Comm: repro_vmwgfx_bo
>                Not tainted 7.3.0-dirty #2 PREEMPT(lazy)
>   [   72.937912] RIP: 0010:vmw_bo_pin_reserved+0x36d/0x380
>   [   72.947235] RBP: 00000000ffffffea
>   [   72.990254] Fixing recursive fault but reboot is needed!
> 
> The reproducer created a dumb GEM buffer, exported/imported its PRIME fd,
> performed GEM flink/open/close operations, and exited. During exit_group(),
> the call path was vmw_gem_object_unpin() -> drm_gem_map_detach() ->
> dma_buf_detach() -> drm_prime_gem_destroy() -> drm_gem_shmem_release() ->
> vmw_bo_pin_reserved().
> 
> The fix skips ttm_bo_validate() when unpinning. Validation remains on the
> pin path before ttm_bo_pin().
> 
> Assisted-by: OpenAI Codex (GPT-5)
> Signed-off-by: Yuhang Pan <242270054@hdu.edu.cn>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index 9c7a73c..14d28e2 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -308,6 +308,11 @@ void vmw_bo_pin_reserved(struct vmw_bo *vbo, bool pin)
>      if (pin == !!bo->pin_count)
>          return;
>  
> +    if (!pin) {
> +        ttm_bo_unpin(bo);
> +        return;
> +    }
> +
>      pl.fpfn = 0;
>      pl.lpfn = 0;
>      pl.mem_type = bo->resource->mem_type;
> @@ -321,8 +326,5 @@ void vmw_bo_pin_reserved(struct vmw_bo *vbo, bool pin)
>  
>      BUG_ON(ret != 0 || bo->resource->mem_type != old_mem_type);
>  
> -    if (pin)
> -        ttm_bo_pin(bo);
> -    else
> -        ttm_bo_unpin(bo);
> +    ttm_bo_pin(bo);
>  }
> 
> -- 
> 2.34.1

This patch is corrupted and can not be applied :(

Also, no Fixes: or cc: stable tags?

thanks,

greg k-h
