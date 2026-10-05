Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F81441F360
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212772; cv=none; b=t1a7g6rQXSR3SI2ddkguIcbNtiocvthACG1z2wiOl6wrSYPoGZ8YYjmo1eKLuLzZm/N2m9lVhhNZbujgYAeHQwuxVy9HuPaElyw8VP6h0k31LpJcJL3DjOyi9kTQxV1gcALWCCQvrm3BapaGWDZpVZC3iJz8dxaGctJbUGHjMBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212772; c=relaxed/simple;
	bh=y9TI2AeCoQgiK0DIEHzqAgYKX4pPfMXwXFj7TLXbA3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u92zYvFRg+dJrxIVCbTcWJTwKMqaFjpOKJeVlODUfMwBFKLSCi9HPupCt2zaI5mGFBqwXSgF10R5Z5YT74K9JnoADnPU+VmFkJWFt2GsYNEzkxnqvHBCXB7PrDqI+wb9rSxtkz0dWgJGKHtbQ+OM5R/NcxQbV/b/K4Tm2RIno3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=K0qLDVYo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="K0qLDVYo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 713B4152B;
	Mon,  5 Oct 2026 08:06:05 -0700 (PDT)
Received: from [10.57.78.53] (unknown [10.57.78.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D16D3F66F;
	Mon,  5 Oct 2026 08:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791212768; bh=y9TI2AeCoQgiK0DIEHzqAgYKX4pPfMXwXFj7TLXbA3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K0qLDVYota0WRpIDvyw9iR+AR6lGswf2sx7f2iwEFzJde1/JHCDGFclq8JW7gznRG
	 sPwSvrFsK2rI/Nm6nDDnmyF6DSS4Fgob/gzIXoWjvhLco+r+keSWpkhASVwUPs4o+d
	 IXRbi82MbuuU0WU5SgQdjtOJExPqX57od/DdDCOo=
Message-ID: <5af99ba3-97e7-4a05-b91c-7d53a508b635@arm.com>
Date: Mon, 5 Oct 2026 16:06:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 12/15] drm/panfrost: Skip cache flush/invalidate when
 enabling perfcnt
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 "Marty E. Plummer" <hanetzer@startmail.com>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>,
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Collabora Kernel Team <kernel@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20260929-claude-fixes-v12-0-62beb08de207@collabora.com>
 <20260929-claude-fixes-v12-12-62beb08de207@collabora.com>
 <95174a67-0eee-4bf7-b883-9f1138c74a6f@arm.com>
 <20261005103855.655f8199@fedora-61.home>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20261005103855.655f8199@fedora-61.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/10/2026 09:38, Boris Brezillon wrote:
> On Fri, 2 Oct 2026 16:14:38 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 29/09/2026 04:44, Adrián Larumbe wrote:
>>> The GPU cache flush/invalidate operation is unnecessary. First off, the
>>> GPU doesn't read off the perfcnt sample buffer, only writes into it, so  
>>
>> I don't think this is entirely true. The GPU performance counter unit
>> only writes the counters that are enabled, counters that share a cache
>> line but are not enabled are not written by the performance counter
>> unit, but if the L2 contains that cache line then the write can hit in
>> the L2 and dirty the entire line including stale data where the
>> unwritten cache line is.
> 
> I don't think this can happen though, because _enable_locked() is
> creating a BO (and its GPU mapping) just before enabling the perfcnt
> block, meaning the buffer is known to have no dirty cacheline pointing
> to it until the first dump happens. And we do flush and invalidate GPU
> caches after each dump, so again, we should be covered.

The situation isn't actually a dirty cache line at the start, but a
stale one. We start off with the memory matching a clean line in the
GPU's cache. But because we don't have coherency the clean line can stay
even if it's inconsistent with everything else.

CPU		|	GPU		| Memory
----------------+-----------------------+--------------------
                | clean line            | matches GPU cache
----------------+-----------------------+--------------------
   CPU allocates new buffer and writes zeros
----------------+-----------------------+--------------------
Dirty cache line| stale clean line      | unknown (cache line
                |                       | might be evicted)
----------------+-----------------------+--------------------
   CPU cleans its own cache to memory
----------------+-----------------------+--------------------
Potential clean | stale clean line      | Matches CPU
cache line      |                       |
----------------+-----------------------+--------------------
   Start dump without invaliding GPU
----------------+-----------------------+--------------------
Potential clean | GPU writes data, and  | Unknown
cache line      | hits in the clean line|
                | even though it's stale|
----------------+-----------------------+--------------------
   CPU flushes the GPU's cache and invalidates it's own
----------------+-----------------------+--------------------
No-cache line   | writes out clean line | Matches GPU


Of course for the GPU to have ended up with that stale clean cache line
means that the physical memory was previously used for something else on
the GPU, so the newly allocated BO has to reuse memory from a previous
BO that the GPU has accessed. And it's all "unlikely" due to the small
size of the GPU's cache.


>>
>> The upshot is that if the CPU has cleared a block of memory which the
>> GPU happens to have cached, then the "unused" counters may end up
>> showing the old data before the CPU cleared it (if they share a cache
>> line with an active counter).
> 
> I agree, but that's not a case we can hit in the enable path. I think I
> mentioned the commit message was misleading, and that we should instead
> talk about the fact the GPU is not supposed to have cached anything up
> until the first SAMPLE following a the ENABLE step.
> 
>>
>> I have to admit it's probably somewhat academic given that Panfrost
>> doesn't expose the ability to control which counters are enabled...
>>
>> Is there a good reason for this patch (i.e. have you seen a performance
>> problem with doing the invalidate)? Otherwise I'd prefer we keep to the
>> safe route rather than trying to over optimise cache maintenance.
> 
> I think I was the one suggesting dropping this flush so that
> panfrost_perfcnt_hw_enable() (in the last patch) has one less fallible
> operation. Besides, I find it confusing to have a cache flush+inval in
> a path where the GPU is not supposed to have accessed the buffer yet
> (or later on, when we re-enable after a RESET, in a path where the GPU
> has been reset and the caches are known to be empty).

So I agree this Should Be Safe™ because of how the driver is currently
using the performance counters. If we really want to drop the invalidate
then I think we need a comment explaining the logic. My worry is that
someone extends this in the future (e.g. allow selecting which counters
to enable) and breaks assumptions without them being documented.

We normally do perform an invalidate when the GPU first touches a buffer
(e.g. for a BO) - it's just normally more implicit because it's done as
part of the job manager(/command stream).

Also "caches known to be empty" is a dangerous thing to assume on
anything that could involve speculation - AFAIK Mali doesn't really
perform any form of speculation, but I'm not 100% sure on that.
Certainly with CPUs you don't get such a luxury of knowing what it might
have populated in the caches.

Thanks,
Steve

>>
>> Obviously in the fully coherent case the invalidate could be skipped (as
>> in the next patch).
>>
>> Thanks,
>> Steve
>>
>>> an invalidate doesn't make a difference. Then flushing GPU caches after
>>> each sample has been written is enough for the CPU to see updated values.
>>>
>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>> ---
>>>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 15 ++-------------
>>>  1 file changed, 2 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
>>> index f71534e741b6..ffc77121070e 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
>>> @@ -124,21 +124,10 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
>>>  	panfrost_gem_internal_set_label(&bo->base, "Perfcnt sample buffer");
>>>  
>>>  	/*
>>> -	 * Invalidate the cache and clear the counters to start from a fresh
>>> -	 * state.
>>> +	 * Clear the counters to start from a fresh state.
>>>  	 */
>>> -	reinit_completion(&pfdev->perfcnt->dump_comp);
>>> -	gpu_write(pfdev, GPU_INT_CLEAR,
>>> -		  GPU_IRQ_CLEAN_CACHES_COMPLETED |
>>> -		  GPU_IRQ_PERFCNT_SAMPLE_COMPLETED);
>>> +	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_PERFCNT_SAMPLE_COMPLETED);
>>>  	gpu_write(pfdev, GPU_CMD, GPU_CMD_PERFCNT_CLEAR);
>>> -	gpu_write(pfdev, GPU_CMD, GPU_CMD_CLEAN_INV_CACHES);
>>> -	ret = wait_for_completion_timeout(&pfdev->perfcnt->dump_comp,
>>> -					  msecs_to_jiffies(1000));
>>> -	if (!ret) {
>>> -		ret = -ETIMEDOUT;
>>> -		goto err_vunmap;
>>> -	}
>>>  
>>>  	ret = panfrost_mmu_as_get(pfdev, perfcnt->mapping->mmu);
>>>  	if (ret < 0)
>>>   
>>
> 

