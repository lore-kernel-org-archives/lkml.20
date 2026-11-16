Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833012;
	b=G2PjKyInm8E8TL391qL9eAxq8QsTZZ/1TZSOaX/2D48DvpA6KxFst9csQo0Ksp8zWErv
	 IF8JnS4ULU3uEh42x/0BJ/KxfiIu9jZw/1FQK0EZI+dTXJVOhUfsJlUK0deXJjJrXrlTR
	 ppQwkjvhotOz3mf57r1nCTyik5+ig2+dteSvDmU/KdulSiwm0UhCknIf1XOsK17zHF1pi
	 ZcNIQWIBzKnjbXA+3bVec5B5mPUduXxEEs0Y5t033t9ywsSPiqxrcMRz4sLzFQyWHmIs2
	 1DcrCnPNMxowi7fCJTbJ0F4VtOAxOV/jSEA9HGSn4mX+GkkNp9Q+4AlvmduPPMxTVrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833012;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=5mEsGjrWIZvYwWKcXyRBgei2dljasiFhgTBybxUcBL8=;
	b=Z8oLtv6R+s+ka1MxszZ7qgD042mupwoDe72tD2b+7rKLAtfoDWpb0jKkY5Fa2cQNq3gA
	 6KjtqMBVnX0+JWb5sgyJAV9AklxyxGtyi5EdDcO2Oubn2oPTa5rvdOsNSVBO0nreZCNti
	 jq9Hz5JHtfic+M15wlA8gCXuqfXAERAJksNe4iw5A9krsdz5s3S+cy8uLn9dyFysHFnQ1
	 S/lN0/7PkEIEUsL6OjqhVOBzZpAsX+oEqzRK7wlBNdjjPjN7LaZxGeNH/y0EGQqsx9XBR
	 cO4JXVR5ll5PB9vcKROJacblz/O6SPrU/yMEE5/a48OkAGgGat5UU6DH8zkuOfyzINA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bV1jTo3e;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5A4606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F5A4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bV1jTo3e
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 966431A25
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:43:27 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5A5B53F632
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794833010; bh=dg7j36cEkL6YwieU84eZURhUe2r7Iw1mLinaBzUPWbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bV1jTo3eXLSzzFc8z6NgGGFJSv93xitULAd0WiCvcYBjfYE0Gra3chgv0ndCGAvnD
	 JLt+i0j27reWNgzIEZHzY6c3RuhtuWcHhtE8iB7Y44K2S/dxZesIFwB2yCQuco5/jS
	 wox+clKDP5kOFdLCKV+PJAfLh2q7wWvlYzcg12cc=
Date: Mon, 16 Nov 2026 12:43:19 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Tuo Li <islituo@gmail.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Fix NULL pointer dereference in sync signal
 cleanup
Message-ID: <avr6Z-LoyfKvDH0U@e142607>
References: <20261113094456.5000-1-islituo@gmail.com>
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
In-Reply-To: <20261113094456.5000-1-islituo@gmail.com>

On Fri, Nov 13, 2026 at 05:44:56PM +0800, Tuo Li wrote:
> In panthor_submit_ctx_add_sync_signal(), drm_syncobj_find() may return
> NULL. The function then jumps to err_free_sig_sync, where
> panthor_sync_signal_free() unconditionally calls drm_syncobj_put() on
> the NULL pointer, causing a NULL pointer dereference.
> 
> Check sig_sync->syncobj before calling drm_syncobj_put() to avoid the
> NULL pointer dereference.
> 
> Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
> Signed-off-by: Tuo Li <islituo@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index dc8d0191aef4..8d73956530a8 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -364,7 +364,9 @@ panthor_sync_signal_free(struct panthor_sync_signal *sig_sync)
>  	if (!sig_sync)
>  		return;
>  
> -	drm_syncobj_put(sig_sync->syncobj);
> +	if (sig_sync->syncobj)
> +		drm_syncobj_put(sig_sync->syncobj);
> +
>  	dma_fence_chain_free(sig_sync->chain);
>  	dma_fence_put(sig_sync->fence);
>  	kfree(sig_sync);
> -- 
> 2.43.0
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
