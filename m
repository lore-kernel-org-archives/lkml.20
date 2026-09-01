Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114D5368D66
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280815; cv=none; b=JTCnSSjDMC0h8afgsD0zuKSncfZbGaMPJU5BpQtbHETnZ6xJoBchYggS6+/gOSag53yHvSr0KR2EnmmaeLQbxdK5dqe2LLE4b5TZeBIsTpAzZ0DSSQStu0boy8cC5WCBfHeChD6jaRlEEeCvjWHKvxVCRNX69zU0RStAW3FA7p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280815; c=relaxed/simple;
	bh=+vq6IrR6/xDWs+6nc2Yh+UAQ3VEavHmZJU5UV+ciogE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLon+6BOLoYdiBYt0vEw177Hv9sWrkrOR8H0yX5Hrlj6E+s8V4Vml1VFMznOBemcrKrMb3N2NAUDYggAW26q3UN3qxXGoTcV7TvJh0ZX1goUmtJk3uxcIQkqAaCd6KpcgSlMNGMi3KlKjw3MiA3TcogmwCW7kpGMIhImdZ5jW4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErwwsoO1; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErwwsoO1"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15e2dab83eso212587066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280812; x=1788885612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BFL2PnQFXGTwOtmj8ilJJ1QqFCeQkcb04bsOr6A5nS4=;
        b=ErwwsoO1/Qcy6JM7T13sbLTBKUc9sQdtc7zhxjbcMp4V28UBXbGrLr5qVlxnE2F8fp
         e3hStawbgREdPB3tPZ4li3hIjv6wZso2jE5iM48ohsxnDTM9+mSZpFypY6zpqRltWnoI
         M3eUsMyg7lWu5+vatjJyNgUDVCv+CzZOfRp2pgQXp59lsSD8nwvrpJMf55F1qk0pUUKy
         Wyj62WYfqa1EjIY8uu8H482BnQazILif3AMx0r8QQaamF8sDvSjwe17PSsR2SiNrjAm5
         JkYPMesfc3XOmw6/M393P8OwrvULYmsvH2iT82LLB9RgBLctUtOXWuSbqZmtqLUVWLLt
         U12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280812; x=1788885612;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BFL2PnQFXGTwOtmj8ilJJ1QqFCeQkcb04bsOr6A5nS4=;
        b=k7abJ/JMuUoViN9O+dnMPmFhSxfsGaSMIqOJVTVDcTHE/V0Bm8C1p7eqURzjeL+N7U
         1Vag3bKLfLVWmiBK2J8wcRm4KHr2397yaa1U/rZxXq5jCsdxVI8jmHLnA1u6lcVUMX7o
         N7bMNfOzYnhqbNFTUdA57W0E0/PNdV8R/2b1o5CYGg/pVra0PQdhaavp5bH0D91C9LGB
         i9hiIx2OPlOY+i0VkuWqzIWc/IpVE4kzWNiNc01KItdyGb24cuZr90OcrTFByjVD5kPC
         IK2SD+vyv5q0MGTeUL1WZjB0BMoc9G788T6JY+L81B+hgIThUDofatHVol0jr7epz4PL
         o6Sg==
X-Forwarded-Encrypted: i=1; AHgh+RrJMnQXb2/W+VS4c6UP6lt5k6yt37YH6KKBpZPl5dbSxE31mknKKAU6VwJucUIVQ2z7HWZTPYYv4WmxcJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++mKzQgiMvOR6U46+B7MFw6La3TIvk7iLei+YZ8J8P3N1mF3LxvO
	K8JW5fB2wIBfJaC6YKnh5x5gkqnxWafMFUoScTs0aSSN0Hiao3drt4zD
X-Gm-Gg: AR+sD11jwlWWkbkmyeySvol1jtAyP3yvZzZXJM44l/d2t3Vw3ahZLnO2suWwoOzPQ0j
	xPiDKuaNJq/1PVhAU8czeBTq73TvS8AVupneIMQo7q3qYxsX0ehd876ytKsl3t9zqkqrc4lgVnI
	2mN4kV0VhLneaKG7PYvuUFPyXXuPxH0oPWm1yUAKjS83PcGIL+uqhplXqfjB02i0bCff9ex4TaW
	6idX5EJnQhEaTPdGiD3qQq1SzcfpNYr/tXV1ve0ndaze8z23RA66YkIUT4HHA2jIX5j1NYRpn+M
	7Z2V091N3fKhhzd7isgWCUD8qlJ6BV3S9k0lfoI65aYWldMzlNZDcAYUyFSv1Kk6HjO1RsjNszw
	liT7mseBx3Qx6z6RViHs503W4oyQkA52quL5e/pcQQP+JAFY5XnRq31lQaavnI5dkbtr/THPWSq
	vUnY7nRy+ThTHi3+Ad2hRivqO3+A==
X-Received: by 2002:a17:907:f495:b0:c25:37e2:2d3b with SMTP id a640c23a62f3a-c25571b387emr2163930966b.10.1788280811791;
        Tue, 01 Sep 2026 09:40:11 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fb4c3sm629113266b.48.2026.09.01.09.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:40:10 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 1 Sep 2026 18:40:08 +0200
To: Dev Jain <dev.jain@arm.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Ye Liu <ye.liu@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ye Liu <liuye@kylinos.cn>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: vmalloc: fix vmap_purge_lock livelock under
 memory pressure
Message-ID: <apb_6DUfmilJGsp1@milan>
References: <20260828091753.299295-1-ye.liu@linux.dev>
 <20260828110503.e1eff32a9b7df9a8b2ddd4d6@linux-foundation.org>
 <bec5eaef-d084-467f-9bfd-43f7dedc1aa7@arm.com>
 <apVPTt9Xw8kSgmTU@milan>
 <54bd749f-04f5-4665-bd5f-d485e7197132@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54bd749f-04f5-4665-bd5f-d485e7197132@arm.com>

On Tue, Sep 01, 2026 at 11:52:11AM +0530, Dev Jain wrote:
> 
> 
> On 31/08/26 3:24 pm, Uladzislau Rezki wrote:
> > On Mon, Aug 31, 2026 at 11:39:14AM +0530, Dev Jain wrote:
> >>
> >>
> >> On 28/08/26 11:35 pm, Andrew Morton wrote:
> >>> On Fri, 28 Aug 2026 17:17:53 +0800 Ye Liu <ye.liu@linux.dev> wrote:
> >>>
> >>>> From: Ye Liu <liuye@kylinos.cn>
> >>>>
> >>>> The vmap_purge_lock mutex can be held for an extended period by
> >>>> __purge_vmap_area_lazy() which calls flush_work() to wait for
> >>>> purge_vmap_node workers while holding the lock.  Under memory
> >>>> pressure, those workers may themselves be blocked in direct
> >>>> reclaim trying to acquire the same lock via the
> >>>> vmap_node_shrink_scan() shrinker callback, creating a circular
> >>>> dependency that deadlocks the entire system.
> >>>>
> >>>> Two places acquire vmap_purge_lock from paths that can be reached
> >>>> during direct reclaim:
> >>>>
> >>>> 1. vmap_node_shrink_scan(): replace blocking guard(mutex) with
> >>>>    mutex_trylock().  This is a shrinker that only decays the vmap
> >>>>    pool and returns SHRINK_STOP without freeing memory; skipping a
> >>>>    decay cycle when the lock is contended is harmless and prevents
> >>>>    tasks from piling up on the mutex in the direct reclaim path.
> >>>>
> >>>> 2. reclaim_and_purge_vmap_areas(): replace mutex_lock() with
> >>>>    mutex_trylock().  This is called from the vmalloc allocation
> >>>>    overflow path; if trylock fails, another thread is already
> >>>>    purging and the allocator's retry will find freed space.  The
> >>>>    notifier chain provides a fallback if the retry still fails.
> >>>>
> >>>> Both trylock failures break the circular dependency: the lock
> >>>> holder's flush_work() can complete because workers are no longer
> >>>> blocked on vmap_purge_lock in the direct reclaim path.
> >>>
> >>> Thanks.  AI review expressed a couple of concerns:
> >>> 	https://sashiko.dev/#/patchset/20260828091753.299295-1-ye.liu@linux.dev
> >>
> >>
> >> Sounds legit to me. Now there is no guarantee of purge being successful, and we
> >> can get a spurious failure.
> >>
> >> How about using a WQ_RECLAIM workqueue:
> >>
> >> vmap_purge_wq = alloc_workqueue("vmap_purge",
> >> 				WQ_MEM_RECLAIM | WQ_PERCPU, 0);
> >>
> >> I see the same pattern in __lru_add_drain_all() and kmem_cache_init_late().
> >>
> > WQ_MEM_RECLAIM makes sense but this is another patch.
> > 
> > I copied here AI comment:
> >>
> >> Does replacing this blocking lock with a trylock break synchronization for
> >> the callers?
> >>
> > No it does not. If someone is doing reclaim we do not wait and do not try
> > to do it again thus fail allocation.
> > 
> >> When vmalloc space is exhausted, alloc_vmap_area() calls
> >> reclaim_and_purge_vmap_areas() and relies on its blocking behavior to ensure
> >> that free space has actually been reclaimed before looping back to retry:
> >> mm/vmalloc.c:alloc_vmap_area() {
> >>    ...
> >> overflow:
> >> 	if (!purged) {
> >> 		reclaim_and_purge_vmap_areas();
> >> 		purged = 1;
> >> 		goto retry;
> >> 	}
> >>    ...
> >> }
> >> With this patch, if another thread holds vmap_purge_lock, mutex_trylock()
> >> fails and the function returns immediately.
> >>
> > If reclaim is in progress and trylock fails a caller repeats only one
> > time to retry an allocation. There is no any infinite loop.
> > 
> >>
> >> The allocator then retries
> >> instantly without waiting for the concurrent purge to complete.
> >> Because the retry fails and purged is already 1, could this cause the
> >> allocation to abort and return a spurious vmalloc allocation failure
> >> (-EBUSY or -ENOMEM)?
> >>
> > vmap space can be fragmented and not avail for 32-bit systems. For
> > 64-bit system it is likely impossible.
> > 
> > But, i think we can overt mutex_lock() into mutex_trylock() just only
> > in the:
> > 
> > static unsigned long
> > vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
> > {
> > 	struct vmap_node *vn;
> > 
> > 	guard(mutex)(&vmap_purge_lock);
> > 	for_each_vmap_node(vn)
> > 		decay_va_pool_node(vn, true);
> > 
> > 	return SHRINK_STOP;
> > }
> > 
> > so the reclaim path is not blocked. It should also address an issue
> > reported by the Ye Liu <ye.liu@linux.dev>.
> 
> IIUC you are suggesting mutex_trylock() only in the shrinker path. But
> then, the following is possible no: take purge lock, try to get a
> worker thread, worker thread is stuck in vmalloc -> alloc_vmap_area
> -> reclaim_and_purge_vmap_areas -> take purge lock?
> 
It is possible what you describe. Usually when no memory, the work item
can be delayed for a while. As it was noted WQ_RECLAIM and separate WQ
which has a rescue worker.

IMO, it should be a separate patch.

--
Uladzislau Rezki
