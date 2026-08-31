Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916DF3DFC6A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170069; cv=none; b=C3b6mwWdPOrlmlhpzhFwEoc3Ot019FLezlEb+uYZEbLSV6B3PMNdxCEZ2LHPcTwaQFD2y9lAcH3yBNEK5P4sR2GaI2F7+HibxR0XIVewyaBI1gzOx2AwcpXPvgxBhVy1Gza72Ce6LzQ8FbfZ+pJmc7OUcL9dkz3JtAh2WZNlwn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170069; c=relaxed/simple;
	bh=/FDrAb7hM/EQSL25eFpDVEjA6s1rq1eNEc590hhbYJ4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgY6z+U0LNeSKcswkqQc/nhhRauZ00kuCphR1gCIa0cQrnZtDcvp70t/3Nd83NLjFo9Eu//vEPu3LJHxMcCryLXWfQmDv1A3O35Ma7wXNg2fTlS0h+6tcqm5+olVxGPT60PidqxQkmdUP/W2nIpPyRBFb1NvoDZZ172HH5g8egc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMdz/Hku; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMdz/Hku"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so5114876a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788170065; x=1788774865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=loNoEotVshAkf6GbGqDOZPoaBhFH7ZZvecjTTBvFy18=;
        b=YMdz/HkukdFx5cggpuv6UK2ClO/CRvo4ikTCw9EIHts07bMWCvIrS6mb6tCQZnRolF
         OG6enp+sKzd7uKZH05GJ1RC7lhTbOxzzixJB6HifqO1jmL3JT/wcRxZ9r3vzcOulSNvd
         vI9dtDCUJJ4opSy1Y/b+010EbdZjoXTkiBbiaLouOtC7ndDVqb3Ji3IUqrTzuIp/Ss1E
         //12bFBW0fU6WoOmSr0mNT1czTXRgCmS4mw4OV3+eGtHlL+yPRx/bsrEc6/2lypqj+xw
         6EjNsSj5n3x4HIJqaoRj/qRURljDLwLfdWIk1SIyPoIRseMhW/CWbDfe88d+heJZ26gx
         ndEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170065; x=1788774865;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=loNoEotVshAkf6GbGqDOZPoaBhFH7ZZvecjTTBvFy18=;
        b=iNzVW+Mj/BxSCAKJSCbbZ6JpZ/ySMX04aRlplLhyjcaHv86F5NwqAL1ZHei1CP0g57
         a7Odh/WocYKHe1k1+3fYnin/0b+VxQKQJ3a5sVijz0z5c5/kgGQchWFb/HXR3TlqJaf9
         xzKvR9s7T2ELhGqlgB7126kJqY0eQPg8qh8HNNT9yHDeh4n8995Jub4kfRAKKY5AdIrw
         upqT6o/uZFAj65W6fYpfdte8X80rhRq6inNE8TgQwAQJzA55xHMktqg/SRkbxE+38Yls
         cpZ7EpmMOCeWoIePBjocJIakSx2iq/JIdJcpoJrrM/ofrKD7bEJ7FmRHKZsuBturZfvS
         wrog==
X-Forwarded-Encrypted: i=1; AKwUvBxz8omsiZrymyUcO2svVh6hBd4OR2TCj2/CTcJNZx/O2vLdtST8mBmjNkbet1qh8LdUIPjhedQfTekDsgo=@vger.kernel.org
X-Gm-Message-State: AFuF++mboRQdWPcxg7yNvE/+DENIVHhTHqO/EtCLRirIXa9LVEM55t4t
	dhe/OxCG51U/hueTgn1ISeoDzb8A1u0wrSt7T/17cl2EX/s7kBlRyNttPnFjmV3G
X-Gm-Gg: AYBFou2MeSl0z/najGkwLSY3cI9msuk2UeN2N2FZDjqkHTtwbSIK6gPH1E+TmcPUXWb
	ZIpat//KlXqRo4wve/NpNMSv0Y9c7zkGCxdKoz353LRQJUy24GlmulxSq2nP//0HbEuzLk4hTDx
	mtvfEDsrZ0ojA54hldyYOU0cmaUM/BMXOQ388lY0sV8a8YfEB2bgIfsw7aSr65UOPX8yWRJev4D
	+e9UQpL48Bqp0gdARIiKXc4I6f/j9SL75TZM/VpqrblR+8M7tudiPbrp9FVL2E5Ow4o1dquwjDD
	bfdas50osW4gDFSWqXcuJEClGrkXtd9pioIjCNWcBdV7g+TuUuBSyv3bjyX1v7/9YriILvsmjbe
	LrHAY0lPO9havSRSntFFBz5n88k1Jq4PF9sDrGLPp5FY9vVZHzqlP6fmH5D5WPVNLJAT5O50CUe
	2X7bnm76S8vV7SuJyJNasuwklBEA==
X-Received: by 2002:a05:6402:501e:b0:6a6:15a1:6c38 with SMTP id 4fb4d7f45d1cf-6a615a16d92mr14366008a12.3.1788170065225;
        Mon, 31 Aug 2026 02:54:25 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a636c816bbsm1697500a12.17.2026.08.31.02.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:54:24 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 31 Aug 2026 11:54:22 +0200
To: Dev Jain <dev.jain@arm.com>, Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ye Liu <ye.liu@linux.dev>,
	Uladzislau Rezki <urezki@gmail.com>, Ye Liu <liuye@kylinos.cn>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: vmalloc: fix vmap_purge_lock livelock under
 memory pressure
Message-ID: <apVPTt9Xw8kSgmTU@milan>
References: <20260828091753.299295-1-ye.liu@linux.dev>
 <20260828110503.e1eff32a9b7df9a8b2ddd4d6@linux-foundation.org>
 <bec5eaef-d084-467f-9bfd-43f7dedc1aa7@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bec5eaef-d084-467f-9bfd-43f7dedc1aa7@arm.com>

On Mon, Aug 31, 2026 at 11:39:14AM +0530, Dev Jain wrote:
> 
> 
> On 28/08/26 11:35 pm, Andrew Morton wrote:
> > On Fri, 28 Aug 2026 17:17:53 +0800 Ye Liu <ye.liu@linux.dev> wrote:
> > 
> >> From: Ye Liu <liuye@kylinos.cn>
> >>
> >> The vmap_purge_lock mutex can be held for an extended period by
> >> __purge_vmap_area_lazy() which calls flush_work() to wait for
> >> purge_vmap_node workers while holding the lock.  Under memory
> >> pressure, those workers may themselves be blocked in direct
> >> reclaim trying to acquire the same lock via the
> >> vmap_node_shrink_scan() shrinker callback, creating a circular
> >> dependency that deadlocks the entire system.
> >>
> >> Two places acquire vmap_purge_lock from paths that can be reached
> >> during direct reclaim:
> >>
> >> 1. vmap_node_shrink_scan(): replace blocking guard(mutex) with
> >>    mutex_trylock().  This is a shrinker that only decays the vmap
> >>    pool and returns SHRINK_STOP without freeing memory; skipping a
> >>    decay cycle when the lock is contended is harmless and prevents
> >>    tasks from piling up on the mutex in the direct reclaim path.
> >>
> >> 2. reclaim_and_purge_vmap_areas(): replace mutex_lock() with
> >>    mutex_trylock().  This is called from the vmalloc allocation
> >>    overflow path; if trylock fails, another thread is already
> >>    purging and the allocator's retry will find freed space.  The
> >>    notifier chain provides a fallback if the retry still fails.
> >>
> >> Both trylock failures break the circular dependency: the lock
> >> holder's flush_work() can complete because workers are no longer
> >> blocked on vmap_purge_lock in the direct reclaim path.
> > 
> > Thanks.  AI review expressed a couple of concerns:
> > 	https://sashiko.dev/#/patchset/20260828091753.299295-1-ye.liu@linux.dev
> 
> 
> Sounds legit to me. Now there is no guarantee of purge being successful, and we
> can get a spurious failure.
> 
> How about using a WQ_RECLAIM workqueue:
> 
> vmap_purge_wq = alloc_workqueue("vmap_purge",
> 				WQ_MEM_RECLAIM | WQ_PERCPU, 0);
> 
> I see the same pattern in __lru_add_drain_all() and kmem_cache_init_late().
> 
WQ_MEM_RECLAIM makes sense but this is another patch.

I copied here AI comment:
>
> Does replacing this blocking lock with a trylock break synchronization for
> the callers?
>
No it does not. If someone is doing reclaim we do not wait and do not try
to do it again thus fail allocation.

> When vmalloc space is exhausted, alloc_vmap_area() calls
> reclaim_and_purge_vmap_areas() and relies on its blocking behavior to ensure
> that free space has actually been reclaimed before looping back to retry:
> mm/vmalloc.c:alloc_vmap_area() {
>    ...
> overflow:
>	if (!purged) {
>		reclaim_and_purge_vmap_areas();
>		purged = 1;
>		goto retry;
>	}
>    ...
>}
> With this patch, if another thread holds vmap_purge_lock, mutex_trylock()
> fails and the function returns immediately.
>
If reclaim is in progress and trylock fails a caller repeats only one
time to retry an allocation. There is no any infinite loop.

>
> The allocator then retries
> instantly without waiting for the concurrent purge to complete.
> Because the retry fails and purged is already 1, could this cause the
> allocation to abort and return a spurious vmalloc allocation failure
> (-EBUSY or -ENOMEM)?
>
vmap space can be fragmented and not avail for 32-bit systems. For
64-bit system it is likely impossible.

But, i think we can overt mutex_lock() into mutex_trylock() just only
in the:

static unsigned long
vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
{
	struct vmap_node *vn;

	guard(mutex)(&vmap_purge_lock);
	for_each_vmap_node(vn)
		decay_va_pool_node(vn, true);

	return SHRINK_STOP;
}

so the reclaim path is not blocked. It should also address an issue
reported by the Ye Liu <ye.liu@linux.dev>.

--
Uladzislau Rezki
