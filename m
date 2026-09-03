Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179D9466B75
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426664; cv=none; b=NTGNa3WRv2HicCloickvB8KlC2I7HJ8I07PjhA2nMl/yhutVCEOEiVOkTgdRiOCFxPHUGhBVK+mXRRExtXnMjiGEBcKWWjKv+ewK1BX4cknsLB0Pd1KNx7Pn6Td7l0OlbkCklLQJXmG4H+PNbnIHkgHSHz+FaRReM1En97Y7euM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426664; c=relaxed/simple;
	bh=LKfx2De437VcWSsNzcF2jD8vrAvXUiKg+6/6ZIsaSNs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbkIl4amwE+vN2GB2lMcCRwxdiCp5qSNCi6tAQEMDefIW/5P8kwEbr08zAC1+nec3lRyV4mCuR12AL8s6xIK2FbiwdthU8RwZG69KQfFyz44wpUMIyRcIJz3PS/+wBrBH1579F+Vf2RFCXVFz6HEvi1mR9pKHuxAYRULMzvg7rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a60F2aMm; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a60F2aMm"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c20ce3c118aso165673466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788426660; x=1789031460; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dsu+vk43VpSBv82gBLNeaPR8X7xILN5rCQXYDm2G8Ts=;
        b=a60F2aMmotsLnZo924PpMmDoWKPqOYIdnSXWLaFRGnHCjakrU47QmfDS282FJrVDDV
         v20I9R3orm9zHskg7KgA4sfdmkepdMoQ9rwZwN8AOGIUDQdGjjfyNHldMTBAgwaxbEh4
         ldzjaG8bK66PmPje+0CmxGYxbtogiBFDdWu7IdI49Qu74TNE7GBD9k/EAklATLEdN+zD
         8CrM+3no69Dgd+TXuGxDo6uducn8stm+7929AMyNK6iZTuypwFHpt6DGU3wVAMVxmSMV
         nFPfiLI3LfUGg7tjsXM9o2A060xGMERt/t3K56fOPRe9X1HtJCta33yiNpsWf3kLyVnn
         Vulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426660; x=1789031460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dsu+vk43VpSBv82gBLNeaPR8X7xILN5rCQXYDm2G8Ts=;
        b=TSaN5Z0fX0LCLMQkOLzFfZ6BnrFDHUCZwwnvlogOnPqspc0Zo5H6KhB99lg4ljMw1u
         GDIy+QeGYeEj323UF2cSzOtimS6XSPu3cArdpPLjisHlIpaELR8kNo6zexpJVr6HWvsB
         dZBDjmRGKq2XVcsE+r8cfKTwUY/TPOKjoKZwwalmPNjchTnpRUsueYxdWesmdgl4ZDBT
         L51uscKyHCkZneYvC3mU6PITfM8kbktCxVH03MaieRf1RZ8Rge1ZulcTuBXZeIkjI9iP
         sjfnQ7lvLK9krLcZkNjq6NrPSYNGP9Sv+7qCpsjigPeq2QLCLpIgtaDQ3VfpxmhVFPsA
         oZnA==
X-Forwarded-Encrypted: i=1; AKwUvBx6t2ClWTE8+TTJsLsXiOQZN9ZpGQTH7OdxWKzRJFn2i1UTL3MPW7lDQaWT1YWKVYXqdzQucS7iipIRMfQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l8TIW78hqw+i58hKhv1Ufp6JV7zmolbNM7aJ5NFfd9sDQFAtH8
	z8F08lIPHkt3sgRKauCNGKXrLsJTcWxg6fGR8fbDKz1LfdI+kgl2lPUx
X-Gm-Gg: AYBFou2o88M6XJ9bfWg/x0np6mWzoLf6fh6fvrECP5E0jy/dv9jTOcn2YPMT4JfohF+
	k8J9zB0THH4MHRR0E6ROS31TH99KX5Sjmux37uxzUsQ+NWfbIkd+9P5ewqC2udXA+mDXuQOLm9C
	DGnjLmNu/58nqGVpFwUF0P7bF2OyHRQ3y8MqODSVeSg+1VHHpP0k4DsT/aqVtFktqM2RjUDqEqv
	fJGjN+zwEDsGHSmvJLs6VWpqQs516PklG/Zt9QDT1ZkD+3bP0OXt531nTgqaV3Fn9mM/UbOEnWu
	K8m5G4H6dP1CMaZzDoYWm4wYPQ+UrymAqr1PJMmTHxbk1ZjixkwUqcY6/nhCDw88vsoGs8IYxYb
	eJykZjOv1FGPeCK0pHB9znPS6LIUIfKS5M89o8MYWJ0yhhO8g58pzXhyQEITtWyHP15PFc78yir
	M/TwjLnZDr1soDUTIFd7n17KHbLQ==
X-Received: by 2002:a17:907:944a:b0:c25:f7dc:2d4 with SMTP id a640c23a62f3a-c25f7dc092amr91549966b.21.1788426659790;
        Thu, 03 Sep 2026 02:10:59 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f932bf5sm2116425a12.14.2026.09.03.02.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:10:59 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 3 Sep 2026 11:10:57 +0200
To: Dev Jain <dev.jain@arm.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ye Liu <ye.liu@linux.dev>, Ye Liu <liuye@kylinos.cn>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: vmalloc: fix vmap_purge_lock livelock under
 memory pressure
Message-ID: <apk5oYoBQ1EDc0u9@milan>
References: <20260828091753.299295-1-ye.liu@linux.dev>
 <20260828110503.e1eff32a9b7df9a8b2ddd4d6@linux-foundation.org>
 <bec5eaef-d084-467f-9bfd-43f7dedc1aa7@arm.com>
 <apVPTt9Xw8kSgmTU@milan>
 <54bd749f-04f5-4665-bd5f-d485e7197132@arm.com>
 <2e9488bb-feb6-4994-92e3-e5ef0c1ff5ec@linux.dev>
 <apcAvwXe89M20mGs@milan>
 <apcEh4iuYa6_47TJ@milan>
 <c88d035a-cf81-4431-bc28-bb09878e09d7@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c88d035a-cf81-4431-bc28-bb09878e09d7@arm.com>

On Wed, Sep 02, 2026 at 10:00:57AM +0530, Dev Jain wrote:
> 
> 
> On 01/09/26 10:29 pm, Uladzislau Rezki wrote:
> > On Tue, Sep 01, 2026 at 06:43:43PM +0200, Uladzislau Rezki wrote:
> >> On Tue, Sep 01, 2026 at 05:07:30PM +0800, Ye Liu wrote:
> >>>
> >>>
> >>> 在 2026/9/1 14:22, Dev Jain 写道:
> >>>>
> >>>>
> >>>> On 31/08/26 3:24 pm, Uladzislau Rezki wrote:
> >>>>> On Mon, Aug 31, 2026 at 11:39:14AM +0530, Dev Jain wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 28/08/26 11:35 pm, Andrew Morton wrote:
> >>>>>>> On Fri, 28 Aug 2026 17:17:53 +0800 Ye Liu <ye.liu@linux.dev> wrote:
> >>>>>>>
> >>>>>>>> From: Ye Liu <liuye@kylinos.cn>
> >>>>>>>>
> >>>>>>>> The vmap_purge_lock mutex can be held for an extended period by
> >>>>>>>> __purge_vmap_area_lazy() which calls flush_work() to wait for
> >>>>>>>> purge_vmap_node workers while holding the lock.  Under memory
> >>>>>>>> pressure, those workers may themselves be blocked in direct
> >>>>>>>> reclaim trying to acquire the same lock via the
> >>>>>>>> vmap_node_shrink_scan() shrinker callback, creating a circular
> >>>>>>>> dependency that deadlocks the entire system.
> >>>>>>>>
> >>>>>>>> Two places acquire vmap_purge_lock from paths that can be reached
> >>>>>>>> during direct reclaim:
> >>>>>>>>
> >>>>>>>> 1. vmap_node_shrink_scan(): replace blocking guard(mutex) with
> >>>>>>>>    mutex_trylock().  This is a shrinker that only decays the vmap
> >>>>>>>>    pool and returns SHRINK_STOP without freeing memory; skipping a
> >>>>>>>>    decay cycle when the lock is contended is harmless and prevents
> >>>>>>>>    tasks from piling up on the mutex in the direct reclaim path.
> >>>>>>>>
> >>>>>>>> 2. reclaim_and_purge_vmap_areas(): replace mutex_lock() with
> >>>>>>>>    mutex_trylock().  This is called from the vmalloc allocation
> >>>>>>>>    overflow path; if trylock fails, another thread is already
> >>>>>>>>    purging and the allocator's retry will find freed space.  The
> >>>>>>>>    notifier chain provides a fallback if the retry still fails.
> >>>>>>>>
> >>>>>>>> Both trylock failures break the circular dependency: the lock
> >>>>>>>> holder's flush_work() can complete because workers are no longer
> >>>>>>>> blocked on vmap_purge_lock in the direct reclaim path.
> >>>>>>>
> >>>>>>> Thanks.  AI review expressed a couple of concerns:
> >>>>>>> 	https://sashiko.dev/#/patchset/20260828091753.299295-1-ye.liu@linux.dev
> >>>>>>
> >>>>>>
> >>>>>> Sounds legit to me. Now there is no guarantee of purge being successful, and we
> >>>>>> can get a spurious failure.
> >>>>>>
> >>>>>> How about using a WQ_RECLAIM workqueue:
> >>>>>>
> >>>>>> vmap_purge_wq = alloc_workqueue("vmap_purge",
> >>>>>> 				WQ_MEM_RECLAIM | WQ_PERCPU, 0);
> >>>>>>
> >>>>>> I see the same pattern in __lru_add_drain_all() and kmem_cache_init_late().
> >>>>>>
> >>>>> WQ_MEM_RECLAIM makes sense but this is another patch.
> >>>>>
> >>>>> I copied here AI comment:
> >>>>>>
> >>>>>> Does replacing this blocking lock with a trylock break synchronization for
> >>>>>> the callers?
> >>>>>>
> >>>>> No it does not. If someone is doing reclaim we do not wait and do not try
> >>>>> to do it again thus fail allocation.
> >>>>>
> >>>>>> When vmalloc space is exhausted, alloc_vmap_area() calls
> >>>>>> reclaim_and_purge_vmap_areas() and relies on its blocking behavior to ensure
> >>>>>> that free space has actually been reclaimed before looping back to retry:
> >>>>>> mm/vmalloc.c:alloc_vmap_area() {
> >>>>>>    ...
> >>>>>> overflow:
> >>>>>> 	if (!purged) {
> >>>>>> 		reclaim_and_purge_vmap_areas();
> >>>>>> 		purged = 1;
> >>>>>> 		goto retry;
> >>>>>> 	}
> >>>>>>    ...
> >>>>>> }
> >>>>>> With this patch, if another thread holds vmap_purge_lock, mutex_trylock()
> >>>>>> fails and the function returns immediately.
> >>>>>>
> >>>>> If reclaim is in progress and trylock fails a caller repeats only one
> >>>>> time to retry an allocation. There is no any infinite loop.
> >>>>>
> >>>>>>
> >>>>>> The allocator then retries
> >>>>>> instantly without waiting for the concurrent purge to complete.
> >>>>>> Because the retry fails and purged is already 1, could this cause the
> >>>>>> allocation to abort and return a spurious vmalloc allocation failure
> >>>>>> (-EBUSY or -ENOMEM)?
> >>>>>>
> >>>>> vmap space can be fragmented and not avail for 32-bit systems. For
> >>>>> 64-bit system it is likely impossible.
> >>>>>
> >>>>> But, i think we can overt mutex_lock() into mutex_trylock() just only
> >>>>> in the:
> >>>>>
> >>>>> static unsigned long
> >>>>> vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
> >>>>> {
> >>>>> 	struct vmap_node *vn;
> >>>>>
> >>>>> 	guard(mutex)(&vmap_purge_lock);
> >>>>> 	for_each_vmap_node(vn)
> >>>>> 		decay_va_pool_node(vn, true);
> >>>>>
> >>>>> 	return SHRINK_STOP;
> >>>>> }
> >>>>>
> >>>>> so the reclaim path is not blocked. It should also address an issue
> >>>>> reported by the Ye Liu <ye.liu@linux.dev>.
> >>>>
> >>>> IIUC you are suggesting mutex_trylock() only in the shrinker path. But
> >>>> then, the following is possible no: take purge lock, try to get a
> >>>> worker thread, worker thread is stuck in vmalloc -> alloc_vmap_area
> >>>> -> reclaim_and_purge_vmap_areas -> take purge lock?
> >>>>
> >>>>
> >>>
> >>> Personally, I lean toward the WQ_MEM_RECLAIM workqueue solution. 
> >>> After taking a closer look at the code, I noticed a subtle but 
> >>> potentially problematic scenario:
> >>>
> >>> When drain_vmap_area_work acquires vmap_purge_lock and calls into 
> >>> __purge_vmap_area_lazy, it may subsequently invoke queue_work/queue_work_on 
> >>> on the same CPU's system_wq. If the newly queued work ends up waiting 
> >>> for an available worker on that same CPU, while the current worker is
> >>> blocked waiting for that very work to complete (via flush_work), 
> >>> we could end up with a self-deadlock on a single CPU.
> >>>
> >>> Theoretically, this seems possible. I suspect the reason we don't 
> >>> see widespread reports of such deadlocks is that the nr_purge_helpers 
> >>> logic limits the number of asynchronous workers; when resources are tight, 
> >>> it falls back to synchronous execution (purge_vmap_node directly), 
> >>> which avoids queuing additional work. 
> >>>
> >>> Using a dedicated workqueue with WQ_MEM_RECLAIM would provide a clean, 
> >>> explicit isolation—ensuring forward progress under memory pressure and 
> >>> eliminating the risk of interfering with other subsystems' workqueues. 
> >>> I believe this approach is more robust in the long run.
> >>>
> >>> Perhaps like the code below：
> >>> the dedicated queue eliminates the self‑deadlock risk, and the trylock 
> >>> in the shrinker prevents recursive lock attempts from reclaim contexts.
> >>>
> >>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> >>> index bea9f76ed7e7..68fc1f5acb2f 100644
> >>> --- a/mm/vmalloc.c
> >>> +++ b/mm/vmalloc.c
> >>> @@ -2218,6 +2218,9 @@ static unsigned long lazy_max_pages(void)
> >>>   */
> >>>  static DEFINE_MUTEX(vmap_purge_lock);
> >>>  
> >>> +/* Workqueue for lazy vmap purging; WQ_MEM_RECLAIM guarantees progress. */
> >>> +static struct workqueue_struct *vmap_purge_wq;
> >>> +
> >>>  /* for per-CPU blocks */
> >>>  static void purge_fragmented_blocks_allcpus(void);
> >>>  
> >>> @@ -2408,9 +2411,9 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
> >>>                                 INIT_WORK(&vn->purge_work, purge_vmap_node);
> >>>  
> >>>                                 if (cpumask_test_cpu(i, cpu_online_mask))
> >>> -                                       schedule_work_on(i, &vn->purge_work);
> >>> +                                       queue_work_on(i, vmap_purge_wq, &vn->purge_work);
> >>>                                 else
> >>> -                                       schedule_work(&vn->purge_work);
> >>> +                                       queue_work(vmap_purge_wq, &vn->purge_work);
> >>>  
> >>>                                 nr_purge_helpers--;
> >>>                         } else {
> >>> @@ -5519,10 +5522,14 @@ vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
> >>>  {
> >>>         struct vmap_node *vn;
> >>>  
> >>> -       guard(mutex)(&vmap_purge_lock);
> >>> +       if (!mutex_trylock(&vmap_purge_lock))
> >>> +               return SHRINK_STOP;
> >>> +
> >>>         for_each_vmap_node(vn)
> >>>                 decay_va_pool_node(vn, true);
> >>>  
> >>> +       mutex_unlock(&vmap_purge_lock);
> >>> +
> >>>         return SHRINK_STOP;
> >>>  }
> >>>  
> >>> @@ -5575,6 +5582,17 @@ void __init vmalloc_init(void)
> >>>          * Now we can initialize a free vmap space.
> >>>          */
> >>>         vmap_init_free_space();
> >>> +
> >>> +       /*
> >>> +        * A dedicated workqueue for lazy vmap purging.  WQ_MEM_RECLAIM
> >>> +        * reserves a rescue worker so queued purge work items are executed
> >>> +        * even under memory pressure, when workers of the system workqueue
> >>> +        * may be stuck in direct reclaim.
> >>> +        */
> >>> +       vmap_purge_wq = alloc_workqueue("vmap_purge",
> >>> +                                       WQ_MEM_RECLAIM | WQ_PERCPU, 0);
> >>> +       WARN_ON(!vmap_purge_wq);
> >>> +
> >>>         vmap_initialized = true;
> >>>
> >> I agree. We should have it and it should be as separate patch, i.e.
> >> split vmap_node_shrink_scan() and dedicated per-cpu WQs per vmap drain.
> >>
> > And i sent out already the WQ_UNBOUND | WQ_MEM_RECLAIM and separate WQ
> > for vmap drain logic. It looks like Andrew/me forgot about it:
> > 
> > https://lore.kernel.org/all/20260331202352.879718-1-urezki@gmail.com/
> 
> Great! Perhaps resend it and we can review it?
> 
I will and add you to Cc.

--
Uladzislau Rezki
