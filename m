Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9F3442364
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281031; cv=none; b=oUjFwztR+Qrqk+fcv74hPCcrQdP1XnSev34j6sI6IWmJODUCobo8oBnfSTs4dUTzftbPfhwViWVx7PEaQwQ+Ih7dMKEU2i48kqIz96CdvbpLt/i4NqUzDCq4DvNiCONdCK9glbDLZy09wSNQdJF5JwwFjGjyVB38G4OUUtDc4nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281031; c=relaxed/simple;
	bh=uztdUmOzsck0qMPAfDOTHJWfhOpe9y/Jlk/Ud/CnxHU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ha6nvpXKejIIZAuYfK/gwKcPU3JS3CLKZFrKZNOSnqvXsAYx0YUOfRCiId1K/MPGNTVBgP3m50YhGt8icmIDQGsFnR8CcqbQ/M83lf1MDExJWAtGWTM5sQ/G5h850UEqaK0KTLRbmswFrUn5CBA45IHKtaDZyZyl7gAz6KWDxHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3feA/aj; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3feA/aj"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1712a04ddaso818835266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788281027; x=1788885827; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VtqPoM0c1dC0lrkur+oQD0yCDgbYlDlCJcSGxrJXNGE=;
        b=B3feA/ajdHllKaLL/jk6JMgQOgcGtaUMcVz5x/Ulwfag0Y1WPfODGsUyYJwgrSJlJW
         c26FvTHZO7FDOOAkgj/bl4H6gWwXcIVgd0nZNWmD8UNqkwpvngEfvgCgiJzVW2wRV2WU
         FAlDHRqH/Wg/ycMAZ2LEsRPGwqOaiaxy81qmVOOzIk4zaiVvqcxruUaHq23YsMHw21+Z
         DGHFxd1uXnEWv8fNLiQJVdVbVCthq4EtuBz3QPAKKWTlOJt/yB/7FCQfngvCrJznOHdv
         bWV2Lgb8WKqHHP1MxJ7kN7TztjPXyjReO6fMZuU061XEOyFiQJW37+GcGLB6dnZ58k/9
         h4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281027; x=1788885827;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VtqPoM0c1dC0lrkur+oQD0yCDgbYlDlCJcSGxrJXNGE=;
        b=jCd2AGlkWOYudG4M8ExmqIfD7Q1SDSIQTIB/eUKT53ln7EBWIve26QQJECsHiKt3Zh
         tApP7KHSEhRkEjGyK8T1n1v/Zvs5cL6B7L57TouJlKCbY9Q1IMhBoF3gwUUXTQ/c+K/N
         wFWgmBBaPs0Ual4OuMFTTZAZNdvbzQm2819MuuxMkiwS8w1NrT38y0kBQfsbpBkXBNy2
         1FS5G2PL5XscHurLizdZAXYSfRqesjvOF4xO2n5a678wFoBPk16eZoCYb6vQtLyaRyi8
         uSiIs6OuxuiBe0IbbNDAQSNp5hAEEcWRRUbuKePvp13ct88Jtcda4KMIV4N6KLZZpphF
         OEGw==
X-Forwarded-Encrypted: i=1; AHgh+RpHaUXz1ijXx90EQYeYJGba6PIoJu2XPlV3t5vZ89ER5WjsnpFRHz1KnJ+21E5VAWOCvHvZrZh0pjI8+ps=@vger.kernel.org
X-Gm-Message-State: AFuF++nbJsApvSp8cAws6BixbWKBg475Pa+Q+bvWA2afu2nhBN11LPp5
	/k4A+VLEfH2lswiNXdd5XUZdIpigFiiW5AO0NqigMmMQ/keQBSzx2Qa4l8fxuqLj
X-Gm-Gg: AR+sD11qXmv1FcykWiJsWI+xFRmzVZG7PLSaf2sgdg4X6QX8qbWzMOg5NZO87g+0je8
	/vCT5aOGrdVvGRkDDXNR+7XNbWF8fGg3ERAHt7hreGkpKR71FhZSgopCi1PpqEvyIe/w7cRPTP/
	tN4u0y7TRg1Q2kQxiNlQvXOmwbaQuzxuNqRzlot2N4E6OX+24/dqH21TUZt3/fdnx66qAP7a62z
	9ifJ/Iz5S9jKtTuunKd/uWNN+I6cO3LBeUjL26e2sFRDv8f9n3fFlT+dZ4vNN7CRmx/QKOSYkzu
	KJdjLY94nBV7pYxprSIeA4yH5x4vSrUxkoqgHWKSRgEgQXMmkoL14VtjoMKHXZeGsfuh10R1CgM
	urIY7tWmEl2sN/9d5WnXsBMOa3kuGrkeF3kSFL2dHNjoVexmXc1XwenQgRRlzAWsbE3CbA3O6UN
	M7+T+R5S9YcfdaluG0xP4Yj5MY0w==
X-Received: by 2002:a17:907:c01c:b0:c21:382e:9a38 with SMTP id a640c23a62f3a-c2556c18e20mr2424645566b.2.1788281027128;
        Tue, 01 Sep 2026 09:43:47 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25ab2f9aa6sm257006166b.35.2026.09.01.09.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:43:45 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 1 Sep 2026 18:43:43 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Dev Jain <dev.jain@arm.com>, Uladzislau Rezki <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ye Liu <liuye@kylinos.cn>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: vmalloc: fix vmap_purge_lock livelock under
 memory pressure
Message-ID: <apcAvwXe89M20mGs@milan>
References: <20260828091753.299295-1-ye.liu@linux.dev>
 <20260828110503.e1eff32a9b7df9a8b2ddd4d6@linux-foundation.org>
 <bec5eaef-d084-467f-9bfd-43f7dedc1aa7@arm.com>
 <apVPTt9Xw8kSgmTU@milan>
 <54bd749f-04f5-4665-bd5f-d485e7197132@arm.com>
 <2e9488bb-feb6-4994-92e3-e5ef0c1ff5ec@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e9488bb-feb6-4994-92e3-e5ef0c1ff5ec@linux.dev>

On Tue, Sep 01, 2026 at 05:07:30PM +0800, Ye Liu wrote:
> 
> 
> 在 2026/9/1 14:22, Dev Jain 写道:
> > 
> > 
> > On 31/08/26 3:24 pm, Uladzislau Rezki wrote:
> >> On Mon, Aug 31, 2026 at 11:39:14AM +0530, Dev Jain wrote:
> >>>
> >>>
> >>> On 28/08/26 11:35 pm, Andrew Morton wrote:
> >>>> On Fri, 28 Aug 2026 17:17:53 +0800 Ye Liu <ye.liu@linux.dev> wrote:
> >>>>
> >>>>> From: Ye Liu <liuye@kylinos.cn>
> >>>>>
> >>>>> The vmap_purge_lock mutex can be held for an extended period by
> >>>>> __purge_vmap_area_lazy() which calls flush_work() to wait for
> >>>>> purge_vmap_node workers while holding the lock.  Under memory
> >>>>> pressure, those workers may themselves be blocked in direct
> >>>>> reclaim trying to acquire the same lock via the
> >>>>> vmap_node_shrink_scan() shrinker callback, creating a circular
> >>>>> dependency that deadlocks the entire system.
> >>>>>
> >>>>> Two places acquire vmap_purge_lock from paths that can be reached
> >>>>> during direct reclaim:
> >>>>>
> >>>>> 1. vmap_node_shrink_scan(): replace blocking guard(mutex) with
> >>>>>    mutex_trylock().  This is a shrinker that only decays the vmap
> >>>>>    pool and returns SHRINK_STOP without freeing memory; skipping a
> >>>>>    decay cycle when the lock is contended is harmless and prevents
> >>>>>    tasks from piling up on the mutex in the direct reclaim path.
> >>>>>
> >>>>> 2. reclaim_and_purge_vmap_areas(): replace mutex_lock() with
> >>>>>    mutex_trylock().  This is called from the vmalloc allocation
> >>>>>    overflow path; if trylock fails, another thread is already
> >>>>>    purging and the allocator's retry will find freed space.  The
> >>>>>    notifier chain provides a fallback if the retry still fails.
> >>>>>
> >>>>> Both trylock failures break the circular dependency: the lock
> >>>>> holder's flush_work() can complete because workers are no longer
> >>>>> blocked on vmap_purge_lock in the direct reclaim path.
> >>>>
> >>>> Thanks.  AI review expressed a couple of concerns:
> >>>> 	https://sashiko.dev/#/patchset/20260828091753.299295-1-ye.liu@linux.dev
> >>>
> >>>
> >>> Sounds legit to me. Now there is no guarantee of purge being successful, and we
> >>> can get a spurious failure.
> >>>
> >>> How about using a WQ_RECLAIM workqueue:
> >>>
> >>> vmap_purge_wq = alloc_workqueue("vmap_purge",
> >>> 				WQ_MEM_RECLAIM | WQ_PERCPU, 0);
> >>>
> >>> I see the same pattern in __lru_add_drain_all() and kmem_cache_init_late().
> >>>
> >> WQ_MEM_RECLAIM makes sense but this is another patch.
> >>
> >> I copied here AI comment:
> >>>
> >>> Does replacing this blocking lock with a trylock break synchronization for
> >>> the callers?
> >>>
> >> No it does not. If someone is doing reclaim we do not wait and do not try
> >> to do it again thus fail allocation.
> >>
> >>> When vmalloc space is exhausted, alloc_vmap_area() calls
> >>> reclaim_and_purge_vmap_areas() and relies on its blocking behavior to ensure
> >>> that free space has actually been reclaimed before looping back to retry:
> >>> mm/vmalloc.c:alloc_vmap_area() {
> >>>    ...
> >>> overflow:
> >>> 	if (!purged) {
> >>> 		reclaim_and_purge_vmap_areas();
> >>> 		purged = 1;
> >>> 		goto retry;
> >>> 	}
> >>>    ...
> >>> }
> >>> With this patch, if another thread holds vmap_purge_lock, mutex_trylock()
> >>> fails and the function returns immediately.
> >>>
> >> If reclaim is in progress and trylock fails a caller repeats only one
> >> time to retry an allocation. There is no any infinite loop.
> >>
> >>>
> >>> The allocator then retries
> >>> instantly without waiting for the concurrent purge to complete.
> >>> Because the retry fails and purged is already 1, could this cause the
> >>> allocation to abort and return a spurious vmalloc allocation failure
> >>> (-EBUSY or -ENOMEM)?
> >>>
> >> vmap space can be fragmented and not avail for 32-bit systems. For
> >> 64-bit system it is likely impossible.
> >>
> >> But, i think we can overt mutex_lock() into mutex_trylock() just only
> >> in the:
> >>
> >> static unsigned long
> >> vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
> >> {
> >> 	struct vmap_node *vn;
> >>
> >> 	guard(mutex)(&vmap_purge_lock);
> >> 	for_each_vmap_node(vn)
> >> 		decay_va_pool_node(vn, true);
> >>
> >> 	return SHRINK_STOP;
> >> }
> >>
> >> so the reclaim path is not blocked. It should also address an issue
> >> reported by the Ye Liu <ye.liu@linux.dev>.
> > 
> > IIUC you are suggesting mutex_trylock() only in the shrinker path. But
> > then, the following is possible no: take purge lock, try to get a
> > worker thread, worker thread is stuck in vmalloc -> alloc_vmap_area
> > -> reclaim_and_purge_vmap_areas -> take purge lock?
> > 
> > 
> 
> Personally, I lean toward the WQ_MEM_RECLAIM workqueue solution. 
> After taking a closer look at the code, I noticed a subtle but 
> potentially problematic scenario:
> 
> When drain_vmap_area_work acquires vmap_purge_lock and calls into 
> __purge_vmap_area_lazy, it may subsequently invoke queue_work/queue_work_on 
> on the same CPU's system_wq. If the newly queued work ends up waiting 
> for an available worker on that same CPU, while the current worker is
> blocked waiting for that very work to complete (via flush_work), 
> we could end up with a self-deadlock on a single CPU.
> 
> Theoretically, this seems possible. I suspect the reason we don't 
> see widespread reports of such deadlocks is that the nr_purge_helpers 
> logic limits the number of asynchronous workers; when resources are tight, 
> it falls back to synchronous execution (purge_vmap_node directly), 
> which avoids queuing additional work. 
> 
> Using a dedicated workqueue with WQ_MEM_RECLAIM would provide a clean, 
> explicit isolation—ensuring forward progress under memory pressure and 
> eliminating the risk of interfering with other subsystems' workqueues. 
> I believe this approach is more robust in the long run.
> 
> Perhaps like the code below：
> the dedicated queue eliminates the self‑deadlock risk, and the trylock 
> in the shrinker prevents recursive lock attempts from reclaim contexts.
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index bea9f76ed7e7..68fc1f5acb2f 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2218,6 +2218,9 @@ static unsigned long lazy_max_pages(void)
>   */
>  static DEFINE_MUTEX(vmap_purge_lock);
>  
> +/* Workqueue for lazy vmap purging; WQ_MEM_RECLAIM guarantees progress. */
> +static struct workqueue_struct *vmap_purge_wq;
> +
>  /* for per-CPU blocks */
>  static void purge_fragmented_blocks_allcpus(void);
>  
> @@ -2408,9 +2411,9 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
>                                 INIT_WORK(&vn->purge_work, purge_vmap_node);
>  
>                                 if (cpumask_test_cpu(i, cpu_online_mask))
> -                                       schedule_work_on(i, &vn->purge_work);
> +                                       queue_work_on(i, vmap_purge_wq, &vn->purge_work);
>                                 else
> -                                       schedule_work(&vn->purge_work);
> +                                       queue_work(vmap_purge_wq, &vn->purge_work);
>  
>                                 nr_purge_helpers--;
>                         } else {
> @@ -5519,10 +5522,14 @@ vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
>  {
>         struct vmap_node *vn;
>  
> -       guard(mutex)(&vmap_purge_lock);
> +       if (!mutex_trylock(&vmap_purge_lock))
> +               return SHRINK_STOP;
> +
>         for_each_vmap_node(vn)
>                 decay_va_pool_node(vn, true);
>  
> +       mutex_unlock(&vmap_purge_lock);
> +
>         return SHRINK_STOP;
>  }
>  
> @@ -5575,6 +5582,17 @@ void __init vmalloc_init(void)
>          * Now we can initialize a free vmap space.
>          */
>         vmap_init_free_space();
> +
> +       /*
> +        * A dedicated workqueue for lazy vmap purging.  WQ_MEM_RECLAIM
> +        * reserves a rescue worker so queued purge work items are executed
> +        * even under memory pressure, when workers of the system workqueue
> +        * may be stuck in direct reclaim.
> +        */
> +       vmap_purge_wq = alloc_workqueue("vmap_purge",
> +                                       WQ_MEM_RECLAIM | WQ_PERCPU, 0);
> +       WARN_ON(!vmap_purge_wq);
> +
>         vmap_initialized = true;
> 
I agree. We should have it and it should be as separate patch, i.e.
split vmap_node_shrink_scan() and dedicated per-cpu WQs per vmap drain.

--
Uladzislau Rezki
