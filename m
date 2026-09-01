Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198D9306B3D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243737; cv=none; b=tebXpv5I58adwCSWyuqcCy/Qr1uSL90oBeuqdI7P8x2GK0D6TtHQW4Wg5Pz4GZ45MqIOtvjBkv4OZNvZBxZf/2zmfK90FqnXIR+e5bpNeK45r8jmEvvBp7C3DiqJOoZLvNI7tj8VFcHtYtnC7GEM/yO3iNmGyPkk1/i5nD1BzlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243737; c=relaxed/simple;
	bh=bRwEjPB8J1SjKC3oPG9e9HzL/U1SyH/SEHquXWa+ZBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I4H7GuOnyIBfZiyFyF1dRJF/yw3mNyd9oTz4De59pA+qGQs2VaeIsNHSzQve5FBp21Tz6WVZ0lnQaZsDi7fPjGzmVvwpXLdtvD70G9w8s/9EzTjIBg6rOw3PDsKNTxJB25IGnd5DN5eBULIh0SnIwFZJbPmmSZsThvyCDSt/E14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tRJQnl6J; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tRJQnl6J"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D0151756;
	Mon, 31 Aug 2026 23:22:11 -0700 (PDT)
Received: from [10.164.19.53] (unknown [10.164.19.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0E1D3F85F;
	Mon, 31 Aug 2026 23:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788243735; bh=bRwEjPB8J1SjKC3oPG9e9HzL/U1SyH/SEHquXWa+ZBo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tRJQnl6JSh2o7IqeJ2FWMR9/vm89y7lkqOowGY30fN7wWGWyNd7EbfWGSKAMI21XF
	 eaXX+Y50GLxB3qa7dL66KFS6W2PlaH7q0E6sHhNpPR8RIJwisDDptjJb4XyVudCQHk
	 +JZRRhN+w34Ljsi5l6j5jjepxFiuEqtZq5EYtHGQ=
Message-ID: <54bd749f-04f5-4665-bd5f-d485e7197132@arm.com>
Date: Tue, 1 Sep 2026 11:52:11 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: vmalloc: fix vmap_purge_lock livelock under memory
 pressure
To: Uladzislau Rezki <urezki@gmail.com>, Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ye Liu <liuye@kylinos.cn>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260828091753.299295-1-ye.liu@linux.dev>
 <20260828110503.e1eff32a9b7df9a8b2ddd4d6@linux-foundation.org>
 <bec5eaef-d084-467f-9bfd-43f7dedc1aa7@arm.com> <apVPTt9Xw8kSgmTU@milan>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <apVPTt9Xw8kSgmTU@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 31/08/26 3:24 pm, Uladzislau Rezki wrote:
> On Mon, Aug 31, 2026 at 11:39:14AM +0530, Dev Jain wrote:
>>
>>
>> On 28/08/26 11:35 pm, Andrew Morton wrote:
>>> On Fri, 28 Aug 2026 17:17:53 +0800 Ye Liu <ye.liu@linux.dev> wrote:
>>>
>>>> From: Ye Liu <liuye@kylinos.cn>
>>>>
>>>> The vmap_purge_lock mutex can be held for an extended period by
>>>> __purge_vmap_area_lazy() which calls flush_work() to wait for
>>>> purge_vmap_node workers while holding the lock.  Under memory
>>>> pressure, those workers may themselves be blocked in direct
>>>> reclaim trying to acquire the same lock via the
>>>> vmap_node_shrink_scan() shrinker callback, creating a circular
>>>> dependency that deadlocks the entire system.
>>>>
>>>> Two places acquire vmap_purge_lock from paths that can be reached
>>>> during direct reclaim:
>>>>
>>>> 1. vmap_node_shrink_scan(): replace blocking guard(mutex) with
>>>>    mutex_trylock().  This is a shrinker that only decays the vmap
>>>>    pool and returns SHRINK_STOP without freeing memory; skipping a
>>>>    decay cycle when the lock is contended is harmless and prevents
>>>>    tasks from piling up on the mutex in the direct reclaim path.
>>>>
>>>> 2. reclaim_and_purge_vmap_areas(): replace mutex_lock() with
>>>>    mutex_trylock().  This is called from the vmalloc allocation
>>>>    overflow path; if trylock fails, another thread is already
>>>>    purging and the allocator's retry will find freed space.  The
>>>>    notifier chain provides a fallback if the retry still fails.
>>>>
>>>> Both trylock failures break the circular dependency: the lock
>>>> holder's flush_work() can complete because workers are no longer
>>>> blocked on vmap_purge_lock in the direct reclaim path.
>>>
>>> Thanks.  AI review expressed a couple of concerns:
>>> 	https://sashiko.dev/#/patchset/20260828091753.299295-1-ye.liu@linux.dev
>>
>>
>> Sounds legit to me. Now there is no guarantee of purge being successful, and we
>> can get a spurious failure.
>>
>> How about using a WQ_RECLAIM workqueue:
>>
>> vmap_purge_wq = alloc_workqueue("vmap_purge",
>> 				WQ_MEM_RECLAIM | WQ_PERCPU, 0);
>>
>> I see the same pattern in __lru_add_drain_all() and kmem_cache_init_late().
>>
> WQ_MEM_RECLAIM makes sense but this is another patch.
> 
> I copied here AI comment:
>>
>> Does replacing this blocking lock with a trylock break synchronization for
>> the callers?
>>
> No it does not. If someone is doing reclaim we do not wait and do not try
> to do it again thus fail allocation.
> 
>> When vmalloc space is exhausted, alloc_vmap_area() calls
>> reclaim_and_purge_vmap_areas() and relies on its blocking behavior to ensure
>> that free space has actually been reclaimed before looping back to retry:
>> mm/vmalloc.c:alloc_vmap_area() {
>>    ...
>> overflow:
>> 	if (!purged) {
>> 		reclaim_and_purge_vmap_areas();
>> 		purged = 1;
>> 		goto retry;
>> 	}
>>    ...
>> }
>> With this patch, if another thread holds vmap_purge_lock, mutex_trylock()
>> fails and the function returns immediately.
>>
> If reclaim is in progress and trylock fails a caller repeats only one
> time to retry an allocation. There is no any infinite loop.
> 
>>
>> The allocator then retries
>> instantly without waiting for the concurrent purge to complete.
>> Because the retry fails and purged is already 1, could this cause the
>> allocation to abort and return a spurious vmalloc allocation failure
>> (-EBUSY or -ENOMEM)?
>>
> vmap space can be fragmented and not avail for 32-bit systems. For
> 64-bit system it is likely impossible.
> 
> But, i think we can overt mutex_lock() into mutex_trylock() just only
> in the:
> 
> static unsigned long
> vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
> {
> 	struct vmap_node *vn;
> 
> 	guard(mutex)(&vmap_purge_lock);
> 	for_each_vmap_node(vn)
> 		decay_va_pool_node(vn, true);
> 
> 	return SHRINK_STOP;
> }
> 
> so the reclaim path is not blocked. It should also address an issue
> reported by the Ye Liu <ye.liu@linux.dev>.

IIUC you are suggesting mutex_trylock() only in the shrinker path. But
then, the following is possible no: take purge lock, try to get a
worker thread, worker thread is stuck in vmalloc -> alloc_vmap_area
-> reclaim_and_purge_vmap_areas -> take purge lock?


> 
> --
> Uladzislau Rezki

