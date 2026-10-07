Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A67431E71
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379322; cv=none; b=G3X7Apqzk/RLY07SfIYxAPt+A1iU+76H1f/IUBNF0Y6eRojQjXvVncb8pMFzGfT3jbLhDoj+jEZNL6nofYx5Nl1T7utn7BVCKBeD25WlZSTFlmY2eM36hv1dm5I0SHlDhQWr8LFEiOD7moPw6vlkgGGijRKmdi7/+VltqOke9Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379322; c=relaxed/simple;
	bh=lP9GRKFTChylcLlFVIiP4PDNRAkBFek0PXTn0zU8Qsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoHyTqGQXpBcHUgCxHb+JhEqSPUXESLjEAmmjJKBO0cDeXXyjF6bOI0XR48tp38CXtJgi5MJCPJsRiG+MLnBw+lU4zot9q08cRE1n8SxhO45NOXJO5i3gQeU+wYJH99TVOrJjkFyFLYzoYJL/KTdEzR638/Fbu1IR8M+WMJkFMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Uf7hYcS8; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Uf7hYcS8"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 987BE1595;
	Wed,  7 Oct 2026 06:21:41 -0700 (PDT)
Received: from [10.57.75.203] (unknown [10.57.75.203])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 163683F66F;
	Wed,  7 Oct 2026 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791379304; bh=lP9GRKFTChylcLlFVIiP4PDNRAkBFek0PXTn0zU8Qsk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uf7hYcS8NQerNmKMKtNG+67Qaea6M+CdBKuOk4g7ZyLzKoXK6XL66AQh4koJfykBS
	 gJ/fGLgtsm1bdlDsC238BkXeoh35cs8IRInJ8tt9qm+EhOJvsjVOYOnKT/q04lpVxs
	 92lHth6l46crwpNeORaV9l6KFddBYJpRNO6i7+34=
Message-ID: <c7a8c70e-9130-45dd-83dd-e7a3c591f68a@arm.com>
Date: Wed, 7 Oct 2026 14:21:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 12/15] drm/panfrost: Skip cache flush/invalidate when
 enabling perfcnt
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
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
 <5af99ba3-97e7-4a05-b91c-7d53a508b635@arm.com>
 <179130709099.1018806.10936869787038535987.b4-reply@b4>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <179130709099.1018806.10936869787038535987.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2026 18:18, Adrián Larumbe wrote:
> On 2026-10-05 16:06:02+01:00, Steven Price wrote:
>> On 05/10/2026 09:38, Boris Brezillon wrote:
>>
>>> On Fri, 2 Oct 2026 16:14:38 +0100
>>> Steven Price <steven.price@arm.com> wrote:
>>>
>>>
>>> I don't think this can happen though, because _enable_locked() is
>>> creating a BO (and its GPU mapping) just before enabling the perfcnt
>>> block, meaning the buffer is known to have no dirty cacheline pointing
>>> to it until the first dump happens. And we do flush and invalidate GPU
>>> caches after each dump, so again, we should be covered.
>>
>> The situation isn't actually a dirty cache line at the start, but a
>> stale one. We start off with the memory matching a clean line in the
>> GPU's cache. But because we don't have coherency the clean line can stay
>> even if it's inconsistent with everything else.
>>
>> CPU		|	GPU		| Memory
>> ----------------+-----------------------+--------------------
>>                 | clean line            | matches GPU cache
>> ----------------+-----------------------+--------------------
>>    CPU allocates new buffer and writes zeros
>> ----------------+-----------------------+--------------------
>> Dirty cache line| stale clean line      | unknown (cache line
>>                 |                       | might be evicted)
>> ----------------+-----------------------+--------------------
>>    CPU cleans its own cache to memory
> 
> We're not doing this explicitly for BO memory from the CPU. AFAIK the only way to
> do that manually is calling dma_sync_single_for_device() on physical addresses. I
> suppose this means the reason why the CPU can see up-to-date dump data is because
> a GPU cache flush also invalidates CPU caches for the same lines?

Without coherency between the CPU and GPU then when sharing a buffer
with the GPU there needs to be cache maintenance (otherwise the GPU
might see stale data which is still in RAM, which would be a security
hole). This is because a previous user could have mapped the data
cached. I believe this is done internally within the DMA framework.

For reading the data written by the GPU, again there needs to be cache
maintenance - a flush on the GPU and an invalidate on the CPU. However I
think we map the data on the CPU as write-combining (i.e. uncached) so
there's no need for an explicit invalidate on the CPU - the reads will
bypass the cache.

>> ----------------+-----------------------+--------------------
>> Potential clean | stale clean line      | Matches CPU
>> cache line      |                       |
>> ----------------+-----------------------+--------------------
>>    Start dump without invaliding GPU
>> ----------------+-----------------------+--------------------
>> Potential clean | GPU writes data, and  | Unknown
>> cache line      | hits in the clean line|
>>                 | even though it's stale|
>> ----------------+-----------------------+--------------------
>>    CPU flushes the GPU's cache and invalidates it's own
>> ----------------+-----------------------+--------------------
>> No-cache line   | writes out clean line | Matches GPU
>>
>>
>> Of course for the GPU to have ended up with that stale clean cache line
>> means that the physical memory was previously used for something else on
>> the GPU, so the newly allocated BO has to reuse memory from a previous
>> BO that the GPU has accessed. And it's all "unlikely" due to the small
>> size of the GPU's cache.
>>
>>>>
>>>
>>> I agree, but that's not a case we can hit in the enable path. I think I
>>> mentioned the commit message was misleading, and that we should instead
>>> talk about the fact the GPU is not supposed to have cached anything up
>>> until the first SAMPLE following a the ENABLE step.
>>>
>>>
>>> I think I was the one suggesting dropping this flush so that
>>> panfrost_perfcnt_hw_enable() (in the last patch) has one less fallible
>>> operation. Besides, I find it confusing to have a cache flush+inval in
>>> a path where the GPU is not supposed to have accessed the buffer yet
>>> (or later on, when we re-enable after a RESET, in a path where the GPU
>>> has been reset and the caches are known to be empty).
>>
>> So I agree this Should Be Safe™ because of how the driver is currently
>> using the performance counters. If we really want to drop the invalidate
>> then I think we need a comment explaining the logic. My worry is that
>> someone extends this in the future (e.g. allow selecting which counters
>> to enable) and breaks assumptions without them being documentead.
> 
> Perfcnt ioctl's are currently marked as unstable, but even so, adding the
> initial flush/invalidate back in case anyone ever wanted to redefine the
> uAPI to add support for fine-grained selection of counters shouldn't be
> much of an issue. It's just that, as things stand now, it simplifies error
> handling quite a bit, and I guess it's a reasonable trade-off.
> 
> I'll add a comment explaining why it's safe not to do the initial
> flush/invalidate in a new revision.
> 
>> We normally do perform an invalidate when the GPU first touches a buffer
>> (e.g. for a BO) - it's just normally more implicit because it's done as
>> part of the job manager(/command stream).
> 
> Does this mean instructions that are part of the command stream passed to the
> submit ioctl can trigger a flush/invalidate without CPU intervention?

Sorry, I shouldn't have mentioned command streams - that's a Panthor
thing. For Panfrost the flush/invalidate is done as part of the job
submission (FLUSH_PT). With the Panthor and the MCU we then have a
FLUSH_CACHE2 instruction that can be part of the command stream - so yes
you can trigger (some forms of) a cache flush during the middle of a
command stream without CPU intervention.

Thanks,
Steve

>>
>> Also "caches known to be empty" is a dangerous thing to assume on
>> anything that could involve speculation - AFAIK Mali doesn't really
>> perform any form of speculation, but I'm not 100% sure on that.
>> Certainly with CPUs you don't get such a luxury of knowing what it might
>> have populated in the caches.
>>
>> Thanks,
>> Steve
> 
> 

