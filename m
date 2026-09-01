Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61993481669
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281998; cv=none; b=tT7YF3wdVbSzeBiE58KCkrq03BfoHVeVwoy1zld2CSkECsTmfgkBMfmVAnrwto0T2S2c/UDkAdH9B3F6rffmHI8aDx0fXHdh3Ul42sNez2cPCOCN++K+d3G+QZfs/iYuy56FsZGY/Z4/YWmFUUCx2efehnP3sUn+bUGj9N3FmGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281998; c=relaxed/simple;
	bh=hYNsP2Ux6bqrn9MJ570MryJjcpcqdR/wwLJFVZzsR1c=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCRqHrfJq5vMFRpq4BEUEnCsp2vot2nqTNT3c54C6d2vMtzcxW6Ic36cZ3eKOSs9G+jslf4PZj9sQWgYBQXJZC5YnqPKV7ysQ/G1hDGjPYoB6w7nzG2R7c4tSYjjfm4qcjhhknLdFAoAKBY2+Tce8b5DzYYhfKC8feA+/H/bNNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHykbZN/; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHykbZN/"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a5f968ada7so117985a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788281994; x=1788886794; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+u2ZpPe4WF1Q2YUp42qnHHNqN5pF4v/rnDCZv4ozNq4=;
        b=MHykbZN/W5Z6bwrImOF3R7AaSclEGMRC8nezv7pae7nbjH+JDC+JXBReh85eL+3C+u
         KeiUFMta18Rv4xHIVO1dYkFN4cpd+R3JfauVUX9QVDG5oMguSatNEMEjDNReklc8e0iY
         cx695YSbbo6q8GzPDS3N05RAPIsRS+Zevof3vIcXjzFx8/Apv4LlcIxYFXsb0NAlo9k0
         lUSGTLCJFmqwYfrd/3mYPNXKk+yxgSSRf+YsXkjQTO8JnheIf2F+0ClVF9Vs8pX1wkK0
         jyMeH0qeKxLNjAXI+czhhzsB2cdpg91iLMbj02ARlYg86vgj1ynMfSA4oGq/QyuFfp9K
         Gtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281994; x=1788886794;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+u2ZpPe4WF1Q2YUp42qnHHNqN5pF4v/rnDCZv4ozNq4=;
        b=XZCio4uPxjS9LVx3TrMFUZzvnXJa8zpDVbTIezgDhdH8gp7I1Dvy8rikU+fen65PnV
         QJlly84yO4wqVdafYnXFDlBCwL/FakcDhEhaaVxvbezg/KGS5P1NqL7qsh40RfISGz/x
         6XrLYwIhX/kfmMxpycMDc4JJO/ceiqzglKRtMthdu0J2SL6dlQQRy4krs2RqlBMfViCs
         iFbTRtKGyPQqmM60cHBcFRwKBb5eqPvMzaSnWhy/2cqJfs7AmeXhEebqhJ2Rjw6+niJ5
         DXPDOyfSjfYbvfyKTCQvWF1p47pLdie0LZhU9HnBlD4nPIt51recFzBaPLCSBfUHJQUA
         CULA==
X-Forwarded-Encrypted: i=1; AKwUvBy50XFQOQFiII0uwzmBYhTIkRcFxo2Ub9lvvFIlbXpIrTzNQDfCqS8PN8fpS2c7EDtCA/9LAtVgthT1CXI=@vger.kernel.org
X-Gm-Message-State: AFuF++mRBEk0Z0VZXvbtKA4t53dpducnBwLfSwFxGCKVwjWszjWr3Xlu
	rJBzbScl8TJyxhvpHDwalgfaD8yE4aByBjMVWgz9YPC8K+SytE3EgnSZvs7ICzlR
X-Gm-Gg: AYBFou1hTEGgEAYh9TwZ9JS3a4CYI9EGRE5RQACiDJ9LhUbLpUNAQthEdpsAd9NPHsw
	rAaW9fdEEhkCHNaviLDxA0j734cJvPmJpTjWnpt4JTflm6hJhUTtEu8QJLl6Ueggi3w37QkjKzC
	Mw5n/llXJrwV9sMnnCxX5sie+7KcYo44U0EqqvNlo/pSGHZwdkMHo+NJU0B6tkrpqjh2vjAz0lp
	8tMB//qhZa65iOpbcxEEE4fAx1b59suhI8CKjZO2rqQ5sUXAgInmxLcOt6t76AIGk+x9tc3q0GO
	45B0MulfYrFPO3yYPhYvKnI4HexanSCDnsrMie7WINzKxZe9ulkLGNbMJiHiGnENRNkPBIfVxNG
	3AfC2PeUVthLItSx/bHWRxuZVS5kPfAFR7scpKldKaCZrBetgVqfVcVINyWvtcMgp1cwd/B6g1i
	TONNKKEvPCqSUAHQ1A0iRgXaFXARc=
X-Received: by 2002:a05:6402:4608:b0:6a6:485b:3b7e with SMTP id 4fb4d7f45d1cf-6a66a59b428mr4221026a12.1.1788281994348;
        Tue, 01 Sep 2026 09:59:54 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895e14sm46521a12.3.2026.09.01.09.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:59:53 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 1 Sep 2026 18:59:51 +0200
To: Uladzislau Rezki <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Ye Liu <ye.liu@linux.dev>, Dev Jain <dev.jain@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ye Liu <liuye@kylinos.cn>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: vmalloc: fix vmap_purge_lock livelock under
 memory pressure
Message-ID: <apcEh4iuYa6_47TJ@milan>
References: <20260828091753.299295-1-ye.liu@linux.dev>
 <20260828110503.e1eff32a9b7df9a8b2ddd4d6@linux-foundation.org>
 <bec5eaef-d084-467f-9bfd-43f7dedc1aa7@arm.com>
 <apVPTt9Xw8kSgmTU@milan>
 <54bd749f-04f5-4665-bd5f-d485e7197132@arm.com>
 <2e9488bb-feb6-4994-92e3-e5ef0c1ff5ec@linux.dev>
 <apcAvwXe89M20mGs@milan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apcAvwXe89M20mGs@milan>

On Tue, Sep 01, 2026 at 06:43:43PM +0200, Uladzislau Rezki wrote:
> On Tue, Sep 01, 2026 at 05:07:30PM +0800, Ye Liu wrote:
> > 
> > 
> > 在 2026/9/1 14:22, Dev Jain 写道:
> > > 
> > > 
> > > On 31/08/26 3:24 pm, Uladzislau Rezki wrote:
> > >> On Mon, Aug 31, 2026 at 11:39:14AM +0530, Dev Jain wrote:
> > >>>
> > >>>
> > >>> On 28/08/26 11:35 pm, Andrew Morton wrote:
> > >>>> On Fri, 28 Aug 2026 17:17:53 +0800 Ye Liu <ye.liu@linux.dev> wrote:
> > >>>>
> > >>>>> From: Ye Liu <liuye@kylinos.cn>
> > >>>>>
> > >>>>> The vmap_purge_lock mutex can be held for an extended period by
> > >>>>> __purge_vmap_area_lazy() which calls flush_work() to wait for
> > >>>>> purge_vmap_node workers while holding the lock.  Under memory
> > >>>>> pressure, those workers may themselves be blocked in direct
> > >>>>> reclaim trying to acquire the same lock via the
> > >>>>> vmap_node_shrink_scan() shrinker callback, creating a circular
> > >>>>> dependency that deadlocks the entire system.
> > >>>>>
> > >>>>> Two places acquire vmap_purge_lock from paths that can be reached
> > >>>>> during direct reclaim:
> > >>>>>
> > >>>>> 1. vmap_node_shrink_scan(): replace blocking guard(mutex) with
> > >>>>>    mutex_trylock().  This is a shrinker that only decays the vmap
> > >>>>>    pool and returns SHRINK_STOP without freeing memory; skipping a
> > >>>>>    decay cycle when the lock is contended is harmless and prevents
> > >>>>>    tasks from piling up on the mutex in the direct reclaim path.
> > >>>>>
> > >>>>> 2. reclaim_and_purge_vmap_areas(): replace mutex_lock() with
> > >>>>>    mutex_trylock().  This is called from the vmalloc allocation
> > >>>>>    overflow path; if trylock fails, another thread is already
> > >>>>>    purging and the allocator's retry will find freed space.  The
> > >>>>>    notifier chain provides a fallback if the retry still fails.
> > >>>>>
> > >>>>> Both trylock failures break the circular dependency: the lock
> > >>>>> holder's flush_work() can complete because workers are no longer
> > >>>>> blocked on vmap_purge_lock in the direct reclaim path.
> > >>>>
> > >>>> Thanks.  AI review expressed a couple of concerns:
> > >>>> 	https://sashiko.dev/#/patchset/20260828091753.299295-1-ye.liu@linux.dev
> > >>>
> > >>>
> > >>> Sounds legit to me. Now there is no guarantee of purge being successful, and we
> > >>> can get a spurious failure.
> > >>>
> > >>> How about using a WQ_RECLAIM workqueue:
> > >>>
> > >>> vmap_purge_wq = alloc_workqueue("vmap_purge",
> > >>> 				WQ_MEM_RECLAIM | WQ_PERCPU, 0);
> > >>>
> > >>> I see the same pattern in __lru_add_drain_all() and kmem_cache_init_late().
> > >>>
> > >> WQ_MEM_RECLAIM makes sense but this is another patch.
> > >>
> > >> I copied here AI comment:
> > >>>
> > >>> Does replacing this blocking lock with a trylock break synchronization for
> > >>> the callers?
> > >>>
> > >> No it does not. If someone is doing reclaim we do not wait and do not try
> > >> to do it again thus fail allocation.
> > >>
> > >>> When vmalloc space is exhausted, alloc_vmap_area() calls
> > >>> reclaim_and_purge_vmap_areas() and relies on its blocking behavior to ensure
> > >>> that free space has actually been reclaimed before looping back to retry:
> > >>> mm/vmalloc.c:alloc_vmap_area() {
> > >>>    ...
> > >>> overflow:
> > >>> 	if (!purged) {
> > >>> 		reclaim_and_purge_vmap_areas();
> > >>> 		purged = 1;
> > >>> 		goto retry;
> > >>> 	}
> > >>>    ...
> > >>> }
> > >>> With this patch, if another thread holds vmap_purge_lock, mutex_trylock()
> > >>> fails and the function returns immediately.
> > >>>
> > >> If reclaim is in progress and trylock fails a caller repeats only one
> > >> time to retry an allocation. There is no any infinite loop.
> > >>
> > >>>
> > >>> The allocator then retries
> > >>> instantly without waiting for the concurrent purge to complete.
> > >>> Because the retry fails and purged is already 1, could this cause the
> > >>> allocation to abort and return a spurious vmalloc allocation failure
> > >>> (-EBUSY or -ENOMEM)?
> > >>>
> > >> vmap space can be fragmented and not avail for 32-bit systems. For
> > >> 64-bit system it is likely impossible.
> > >>
> > >> But, i think we can overt mutex_lock() into mutex_trylock() just only
> > >> in the:
> > >>
> > >> static unsigned long
> > >> vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
> > >> {
> > >> 	struct vmap_node *vn;
> > >>
> > >> 	guard(mutex)(&vmap_purge_lock);
> > >> 	for_each_vmap_node(vn)
> > >> 		decay_va_pool_node(vn, true);
> > >>
> > >> 	return SHRINK_STOP;
> > >> }
> > >>
> > >> so the reclaim path is not blocked. It should also address an issue
> > >> reported by the Ye Liu <ye.liu@linux.dev>.
> > > 
> > > IIUC you are suggesting mutex_trylock() only in the shrinker path. But
> > > then, the following is possible no: take purge lock, try to get a
> > > worker thread, worker thread is stuck in vmalloc -> alloc_vmap_area
> > > -> reclaim_and_purge_vmap_areas -> take purge lock?
> > > 
> > > 
> > 
> > Personally, I lean toward the WQ_MEM_RECLAIM workqueue solution. 
> > After taking a closer look at the code, I noticed a subtle but 
> > potentially problematic scenario:
> > 
> > When drain_vmap_area_work acquires vmap_purge_lock and calls into 
> > __purge_vmap_area_lazy, it may subsequently invoke queue_work/queue_work_on 
> > on the same CPU's system_wq. If the newly queued work ends up waiting 
> > for an available worker on that same CPU, while the current worker is
> > blocked waiting for that very work to complete (via flush_work), 
> > we could end up with a self-deadlock on a single CPU.
> > 
> > Theoretically, this seems possible. I suspect the reason we don't 
> > see widespread reports of such deadlocks is that the nr_purge_helpers 
> > logic limits the number of asynchronous workers; when resources are tight, 
> > it falls back to synchronous execution (purge_vmap_node directly), 
> > which avoids queuing additional work. 
> > 
> > Using a dedicated workqueue with WQ_MEM_RECLAIM would provide a clean, 
> > explicit isolation—ensuring forward progress under memory pressure and 
> > eliminating the risk of interfering with other subsystems' workqueues. 
> > I believe this approach is more robust in the long run.
> > 
> > Perhaps like the code below：
> > the dedicated queue eliminates the self‑deadlock risk, and the trylock 
> > in the shrinker prevents recursive lock attempts from reclaim contexts.
> > 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index bea9f76ed7e7..68fc1f5acb2f 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -2218,6 +2218,9 @@ static unsigned long lazy_max_pages(void)
> >   */
> >  static DEFINE_MUTEX(vmap_purge_lock);
> >  
> > +/* Workqueue for lazy vmap purging; WQ_MEM_RECLAIM guarantees progress. */
> > +static struct workqueue_struct *vmap_purge_wq;
> > +
> >  /* for per-CPU blocks */
> >  static void purge_fragmented_blocks_allcpus(void);
> >  
> > @@ -2408,9 +2411,9 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
> >                                 INIT_WORK(&vn->purge_work, purge_vmap_node);
> >  
> >                                 if (cpumask_test_cpu(i, cpu_online_mask))
> > -                                       schedule_work_on(i, &vn->purge_work);
> > +                                       queue_work_on(i, vmap_purge_wq, &vn->purge_work);
> >                                 else
> > -                                       schedule_work(&vn->purge_work);
> > +                                       queue_work(vmap_purge_wq, &vn->purge_work);
> >  
> >                                 nr_purge_helpers--;
> >                         } else {
> > @@ -5519,10 +5522,14 @@ vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
> >  {
> >         struct vmap_node *vn;
> >  
> > -       guard(mutex)(&vmap_purge_lock);
> > +       if (!mutex_trylock(&vmap_purge_lock))
> > +               return SHRINK_STOP;
> > +
> >         for_each_vmap_node(vn)
> >                 decay_va_pool_node(vn, true);
> >  
> > +       mutex_unlock(&vmap_purge_lock);
> > +
> >         return SHRINK_STOP;
> >  }
> >  
> > @@ -5575,6 +5582,17 @@ void __init vmalloc_init(void)
> >          * Now we can initialize a free vmap space.
> >          */
> >         vmap_init_free_space();
> > +
> > +       /*
> > +        * A dedicated workqueue for lazy vmap purging.  WQ_MEM_RECLAIM
> > +        * reserves a rescue worker so queued purge work items are executed
> > +        * even under memory pressure, when workers of the system workqueue
> > +        * may be stuck in direct reclaim.
> > +        */
> > +       vmap_purge_wq = alloc_workqueue("vmap_purge",
> > +                                       WQ_MEM_RECLAIM | WQ_PERCPU, 0);
> > +       WARN_ON(!vmap_purge_wq);
> > +
> >         vmap_initialized = true;
> > 
> I agree. We should have it and it should be as separate patch, i.e.
> split vmap_node_shrink_scan() and dedicated per-cpu WQs per vmap drain.
> 
And i sent out already the WQ_UNBOUND | WQ_MEM_RECLAIM and separate WQ
for vmap drain logic. It looks like Andrew/me forgot about it:

https://lore.kernel.org/all/20260331202352.879718-1-urezki@gmail.com/

--
Uladzislau Rezki
