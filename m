Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675CF2DB79F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954086; cv=none; b=TuFwSIjh8pj02zVarQHrI+SBIQUGPIuehHEVO2K9+PKds23yAbxhwyeyngjEcq+hOjlVabmvaRjjJORID6B9yD8omJPDB8RifR6nWtv+SSiSYgFA3ZgSDCtJx1D3lGkSnlT/eEh46gJMlmVcAsrxf86clZzNbEKN4xRIHB+4ToY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954086; c=relaxed/simple;
	bh=M7YB45jwlZus43G1U2j3Dk7+sQSaGDZK1HI7meKjPsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nPNtxKpSC855NGqSgX7T04RgTR7wtmr9aYw0OHgtmZL7E2cqb/KZCOyyODwvulkoSWLXQ+6eUt7fF5shKpf9P1QVEB4Y3LoRYpe5UCf1vXn7bXVsu+3LEo1bvqOcqWKAZP2wjlo5AfX2tuvcYwbQp6D3naHls9fq8IrtN20apsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Q2BjX7ff; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Q2BjX7ff"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F21D1143D;
	Fri,  2 Oct 2026 08:14:39 -0700 (PDT)
Received: from [10.0.129.26] (e122027.cambridge.arm.com [10.0.129.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 555493F85F;
	Fri,  2 Oct 2026 08:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954083; bh=M7YB45jwlZus43G1U2j3Dk7+sQSaGDZK1HI7meKjPsw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q2BjX7ff5a29JfK673TRO/2xD8zjvao1x+BqxukL+WQ3ol+buzlA+tmJG7AV5fNDk
	 OmS29CRVvU6mcuVYe6/ocIQmvQ4UghE1CSRbu3zbDTX2kt77PF219BaEu2DADSND7a
	 0iot4YL3GIAoAK70OtFr7eEmOBCIr5HyMrGpr5q8=
Message-ID: <95174a67-0eee-4bf7-b883-9f1138c74a6f@arm.com>
Date: Fri, 2 Oct 2026 16:14:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 12/15] drm/panfrost: Skip cache flush/invalidate when
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
References: <20260929-claude-fixes-v12-0-62beb08de207@collabora.com>
 <20260929-claude-fixes-v12-12-62beb08de207@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260929-claude-fixes-v12-12-62beb08de207@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/09/2026 04:44, Adrián Larumbe wrote:
> The GPU cache flush/invalidate operation is unnecessary. First off, the
> GPU doesn't read off the perfcnt sample buffer, only writes into it, so

I don't think this is entirely true. The GPU performance counter unit
only writes the counters that are enabled, counters that share a cache
line but are not enabled are not written by the performance counter
unit, but if the L2 contains that cache line then the write can hit in
the L2 and dirty the entire line including stale data where the
unwritten cache line is.

The upshot is that if the CPU has cleared a block of memory which the
GPU happens to have cached, then the "unused" counters may end up
showing the old data before the CPU cleared it (if they share a cache
line with an active counter).

I have to admit it's probably somewhat academic given that Panfrost
doesn't expose the ability to control which counters are enabled...

Is there a good reason for this patch (i.e. have you seen a performance
problem with doing the invalidate)? Otherwise I'd prefer we keep to the
safe route rather than trying to over optimise cache maintenance.

Obviously in the fully coherent case the invalidate could be skipped (as
in the next patch).

Thanks,
Steve

> an invalidate doesn't make a difference. Then flushing GPU caches after
> each sample has been written is enough for the CPU to see updated values.
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

