Received: from mta1.migadu.com (out-159.mta1.migadu.com [95.215.58.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6AB47799D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253669; cv=none; b=oT6kOor2q4+O+iMeeGJXtUPTXQaX7RF07jVhc5ks3Xshv1VhSSf8hqfYMxsSE6Q3QvKTNh6LO4NBAmWcliB0aif0li0QN3H9bntXrABD49gknD27PzaUL5xWWgP8XsCUTgIde9JO3dtglNov2CFuuPpwZ/wvZSTNK5u0lmIeprg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253669; c=relaxed/simple;
	bh=d6xqbnoen6SvyYfnbagxCWFD259lAJ/gIVTGxLdhCwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAthDsVnOG40czSqccrVuD2v1kdiq2OFf9qvqJJRywo6FCoqeG/4tTUJ8AwMvYZIH6vbgVB4oEvd1wf+SpCUjdyLc91Z2k9nf1DU+jeFlBRIldPcIPeEtH57saayMwDiKUkdSETbigxFZaP7RZh8kAAfESvkryF4HLQzszt8Wak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SWLO1v5Y; arc=none smtp.client-ip=95.215.58.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SWLO1v5Y"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=d6xqbnoen6SvyYfnbagxCWFD259lAJ/gIVTGxLdhCwQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788253660; v=1; x=1788858460;
 b=SWLO1v5YPKnd7cLz0t88OTXQZHeVySGhdSn/ujnPf0N3qzay+JP5R2iiCxo+v91NdE3iRfVY
 pN6dfbZ+0YvB6hhFJB5UvfAMWXJf8NtlODtrKiL3BDcnIuSo7HKV1vSo4mpha3bx3LUb6Qc9+U5
 QHahn1z+Kw+E/d50tmqC3Zw4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 58ea57c259d2ccfb;
	Tue, 01 Sep 2026 09:07:40 +0000
X-Mizu-Trace-ID: 58ea57c259d2ccfb
X-Migadu-Flow: FLOW_OUT
Message-ID: <2e9488bb-feb6-4994-92e3-e5ef0c1ff5ec@linux.dev>
Date: Tue, 1 Sep 2026 17:07:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: vmalloc: fix vmap_purge_lock livelock under memory
 pressure
To: Dev Jain <dev.jain@arm.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ye Liu <liuye@kylinos.cn>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260828091753.299295-1-ye.liu@linux.dev>
 <20260828110503.e1eff32a9b7df9a8b2ddd4d6@linux-foundation.org>
 <bec5eaef-d084-467f-9bfd-43f7dedc1aa7@arm.com> <apVPTt9Xw8kSgmTU@milan>
 <54bd749f-04f5-4665-bd5f-d485e7197132@arm.com>
Content-Language: en-US
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <54bd749f-04f5-4665-bd5f-d485e7197132@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/1 14:22, Dev Jain 写道:
> 
> 
> On 31/08/26 3:24 pm, Uladzislau Rezki wrote:
>> On Mon, Aug 31, 2026 at 11:39:14AM +0530, Dev Jain wrote:
>>>
>>>
>>> On 28/08/26 11:35 pm, Andrew Morton wrote:
>>>> On Fri, 28 Aug 2026 17:17:53 +0800 Ye Liu <ye.liu@linux.dev> wrote:
>>>>
>>>>> From: Ye Liu <liuye@kylinos.cn>
>>>>>
>>>>> The vmap_purge_lock mutex can be held for an extended period by
>>>>> __purge_vmap_area_lazy() which calls flush_work() to wait for
>>>>> purge_vmap_node workers while holding the lock.  Under memory
>>>>> pressure, those workers may themselves be blocked in direct
>>>>> reclaim trying to acquire the same lock via the
>>>>> vmap_node_shrink_scan() shrinker callback, creating a circular
>>>>> dependency that deadlocks the entire system.
>>>>>
>>>>> Two places acquire vmap_purge_lock from paths that can be reached
>>>>> during direct reclaim:
>>>>>
>>>>> 1. vmap_node_shrink_scan(): replace blocking guard(mutex) with
>>>>>    mutex_trylock().  This is a shrinker that only decays the vmap
>>>>>    pool and returns SHRINK_STOP without freeing memory; skipping a
>>>>>    decay cycle when the lock is contended is harmless and prevents
>>>>>    tasks from piling up on the mutex in the direct reclaim path.
>>>>>
>>>>> 2. reclaim_and_purge_vmap_areas(): replace mutex_lock() with
>>>>>    mutex_trylock().  This is called from the vmalloc allocation
>>>>>    overflow path; if trylock fails, another thread is already
>>>>>    purging and the allocator's retry will find freed space.  The
>>>>>    notifier chain provides a fallback if the retry still fails.
>>>>>
>>>>> Both trylock failures break the circular dependency: the lock
>>>>> holder's flush_work() can complete because workers are no longer
>>>>> blocked on vmap_purge_lock in the direct reclaim path.
>>>>
>>>> Thanks.  AI review expressed a couple of concerns:
>>>> 	https://sashiko.dev/#/patchset/20260828091753.299295-1-ye.liu@linux.dev
>>>
>>>
>>> Sounds legit to me. Now there is no guarantee of purge being successful, and we
>>> can get a spurious failure.
>>>
>>> How about using a WQ_RECLAIM workqueue:
>>>
>>> vmap_purge_wq = alloc_workqueue("vmap_purge",
>>> 				WQ_MEM_RECLAIM | WQ_PERCPU, 0);
>>>
>>> I see the same pattern in __lru_add_drain_all() and kmem_cache_init_late().
>>>
>> WQ_MEM_RECLAIM makes sense but this is another patch.
>>
>> I copied here AI comment:
>>>
>>> Does replacing this blocking lock with a trylock break synchronization for
>>> the callers?
>>>
>> No it does not. If someone is doing reclaim we do not wait and do not try
>> to do it again thus fail allocation.
>>
>>> When vmalloc space is exhausted, alloc_vmap_area() calls
>>> reclaim_and_purge_vmap_areas() and relies on its blocking behavior to ensure
>>> that free space has actually been reclaimed before looping back to retry:
>>> mm/vmalloc.c:alloc_vmap_area() {
>>>    ...
>>> overflow:
>>> 	if (!purged) {
>>> 		reclaim_and_purge_vmap_areas();
>>> 		purged = 1;
>>> 		goto retry;
>>> 	}
>>>    ...
>>> }
>>> With this patch, if another thread holds vmap_purge_lock, mutex_trylock()
>>> fails and the function returns immediately.
>>>
>> If reclaim is in progress and trylock fails a caller repeats only one
>> time to retry an allocation. There is no any infinite loop.
>>
>>>
>>> The allocator then retries
>>> instantly without waiting for the concurrent purge to complete.
>>> Because the retry fails and purged is already 1, could this cause the
>>> allocation to abort and return a spurious vmalloc allocation failure
>>> (-EBUSY or -ENOMEM)?
>>>
>> vmap space can be fragmented and not avail for 32-bit systems. For
>> 64-bit system it is likely impossible.
>>
>> But, i think we can overt mutex_lock() into mutex_trylock() just only
>> in the:
>>
>> static unsigned long
>> vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
>> {
>> 	struct vmap_node *vn;
>>
>> 	guard(mutex)(&vmap_purge_lock);
>> 	for_each_vmap_node(vn)
>> 		decay_va_pool_node(vn, true);
>>
>> 	return SHRINK_STOP;
>> }
>>
>> so the reclaim path is not blocked. It should also address an issue
>> reported by the Ye Liu <ye.liu@linux.dev>.
> 
> IIUC you are suggesting mutex_trylock() only in the shrinker path. But
> then, the following is possible no: take purge lock, try to get a
> worker thread, worker thread is stuck in vmalloc -> alloc_vmap_area
> -> reclaim_and_purge_vmap_areas -> take purge lock?
> 
> 

Personally, I lean toward the WQ_MEM_RECLAIM workqueue solution. 
After taking a closer look at the code, I noticed a subtle but 
potentially problematic scenario:

When drain_vmap_area_work acquires vmap_purge_lock and calls into 
__purge_vmap_area_lazy, it may subsequently invoke queue_work/queue_work_on 
on the same CPU's system_wq. If the newly queued work ends up waiting 
for an available worker on that same CPU, while the current worker is
blocked waiting for that very work to complete (via flush_work), 
we could end up with a self-deadlock on a single CPU.

Theoretically, this seems possible. I suspect the reason we don't 
see widespread reports of such deadlocks is that the nr_purge_helpers 
logic limits the number of asynchronous workers; when resources are tight, 
it falls back to synchronous execution (purge_vmap_node directly), 
which avoids queuing additional work. 

Using a dedicated workqueue with WQ_MEM_RECLAIM would provide a clean, 
explicit isolation—ensuring forward progress under memory pressure and 
eliminating the risk of interfering with other subsystems' workqueues. 
I believe this approach is more robust in the long run.

Perhaps like the code below：
the dedicated queue eliminates the self‑deadlock risk, and the trylock 
in the shrinker prevents recursive lock attempts from reclaim contexts.

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bea9f76ed7e7..68fc1f5acb2f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2218,6 +2218,9 @@ static unsigned long lazy_max_pages(void)
  */
 static DEFINE_MUTEX(vmap_purge_lock);
 
+/* Workqueue for lazy vmap purging; WQ_MEM_RECLAIM guarantees progress. */
+static struct workqueue_struct *vmap_purge_wq;
+
 /* for per-CPU blocks */
 static void purge_fragmented_blocks_allcpus(void);
 
@@ -2408,9 +2411,9 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
                                INIT_WORK(&vn->purge_work, purge_vmap_node);
 
                                if (cpumask_test_cpu(i, cpu_online_mask))
-                                       schedule_work_on(i, &vn->purge_work);
+                                       queue_work_on(i, vmap_purge_wq, &vn->purge_work);
                                else
-                                       schedule_work(&vn->purge_work);
+                                       queue_work(vmap_purge_wq, &vn->purge_work);
 
                                nr_purge_helpers--;
                        } else {
@@ -5519,10 +5522,14 @@ vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 {
        struct vmap_node *vn;
 
-       guard(mutex)(&vmap_purge_lock);
+       if (!mutex_trylock(&vmap_purge_lock))
+               return SHRINK_STOP;
+
        for_each_vmap_node(vn)
                decay_va_pool_node(vn, true);
 
+       mutex_unlock(&vmap_purge_lock);
+
        return SHRINK_STOP;
 }
 
@@ -5575,6 +5582,17 @@ void __init vmalloc_init(void)
         * Now we can initialize a free vmap space.
         */
        vmap_init_free_space();
+
+       /*
+        * A dedicated workqueue for lazy vmap purging.  WQ_MEM_RECLAIM
+        * reserves a rescue worker so queued purge work items are executed
+        * even under memory pressure, when workers of the system workqueue
+        * may be stuck in direct reclaim.
+        */
+       vmap_purge_wq = alloc_workqueue("vmap_purge",
+                                       WQ_MEM_RECLAIM | WQ_PERCPU, 0);
+       WARN_ON(!vmap_purge_wq);
+
        vmap_initialized = true;


>>
>> --
>> Uladzislau Rezki
> 

-- 
Thanks,
Ye Liu

