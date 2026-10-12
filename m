Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C058E29BD8C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804570; cv=none; b=UG/y/7S27Lzlsvl/CVczVMP3ikQp20vgL8G4Xie6beuU/3oAzFX1wPSyMjZbhgA5oMx5Vobbde9fOKbkK8S5eAkAxjHAwyI6tm8BFDmCBsWLj1Y/JdUpmiDA8t/m1b3qNGT5u1wuzsLPf3cBBJ/WGaRne1HZMAKaDt4PxjZ72fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804570; c=relaxed/simple;
	bh=Hi/iubEwvQLeEzP1ddkttJh6m5ITHDaOhk563UOIGXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIPprP7ORoDDT6/3Uk14RvWc4DH+MmJ5jM/VmV6v6PR2K6h2KC5xlI90EIwBx0oWgc2WmzSPGas62yibjOCGpyIglcGMNbdhCPCBxjh1c1Io9RKUUORcBtaGMqltud1uU17XZZleuXL+JYEDPwSOZSdk/Rk73n5tnubTAU4yKJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eF4fA/A8; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eF4fA/A8"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D74781A00;
	Mon, 12 Oct 2026 04:29:24 -0700 (PDT)
Received: from [10.57.78.107] (unknown [10.57.78.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B583D3F882;
	Mon, 12 Oct 2026 04:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791804568; bh=Hi/iubEwvQLeEzP1ddkttJh6m5ITHDaOhk563UOIGXo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eF4fA/A8cmor53R6lvFOpebE9kG4vfA77S0eDnZB7RJ0AEEHnFKV5655tntbwYmi5
	 hzjhjY/oPHQj2gUrABZ4aMbAgR3RishFRNmC2muF95OHs1a6jhS5sq4pbAL9iJy8aD
	 d+2qCfIy+Qx0Pc3q9QX3jE5jzhAkO/o+dyU1iwcw=
Message-ID: <b2994ebb-6d6e-44c2-a5c3-ac43fa79375e@arm.com>
Date: Mon, 12 Oct 2026 12:29:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 12/15] drm/panfrost: Skip cache flush/invalidate when
 enabling perfcnt
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 "Marty E. Plummer" <hanetzer@startmail.com>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>,
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Collabora Kernel Team <kernel@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20261009-claude-fixes-v14-0-cb743b3b973b@collabora.com>
 <20261009-claude-fixes-v14-12-cb743b3b973b@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20261009-claude-fixes-v14-12-cb743b3b973b@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/10/2026 13:33, Adrián Larumbe wrote:
> The GPU cache flush/invalidate operation is unnecessary. In the usual case,
> before a perfcnt dump is requested, there will be no stale lines in GPU
> caches for the sample BO's physmem pages, since their memory had not
> recently been addressed by the GPU.
> 
> However, in the off-chance that the sample BO reuses memory that the GPU
> had recently addressed and for which it contains stale lines in its caches,
> there already was a FLUSH_PT command being issued as part of the buffer GPU
> mapping procedure, so by the time panfrost_gem_open() comes back at perfcnt
> session enable, stale GPU cache lines should've already been evicted.
> 
> In either case, forcing a GPU cache clean when enabling a new session makes
> no difference, and removing it simplifies handling of the error path.

Thanks, that commit message explains what's going on and why it's safe.

Reviewed-by: Steven Price <steven.price@arm.com>

> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> index f71534e741b6..ffc77121070e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -124,21 +124,10 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
>  	panfrost_gem_internal_set_label(&bo->base, "Perfcnt sample buffer");
>  
>  	/*
> -	 * Invalidate the cache and clear the counters to start from a fresh
> -	 * state.
> +	 * Clear the counters to start from a fresh state.
>  	 */
> -	reinit_completion(&pfdev->perfcnt->dump_comp);
> -	gpu_write(pfdev, GPU_INT_CLEAR,
> -		  GPU_IRQ_CLEAN_CACHES_COMPLETED |
> -		  GPU_IRQ_PERFCNT_SAMPLE_COMPLETED);
> +	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_PERFCNT_SAMPLE_COMPLETED);
>  	gpu_write(pfdev, GPU_CMD, GPU_CMD_PERFCNT_CLEAR);
> -	gpu_write(pfdev, GPU_CMD, GPU_CMD_CLEAN_INV_CACHES);
> -	ret = wait_for_completion_timeout(&pfdev->perfcnt->dump_comp,
> -					  msecs_to_jiffies(1000));
> -	if (!ret) {
> -		ret = -ETIMEDOUT;
> -		goto err_vunmap;
> -	}
>  
>  	ret = panfrost_mmu_as_get(pfdev, perfcnt->mapping->mmu);
>  	if (ret < 0)
> 

