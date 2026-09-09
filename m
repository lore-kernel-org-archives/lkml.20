Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DE249481B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987676; cv=none; b=r2yuWw54fcE4Yb6qhSyTZZ+2IqihUr+WaX4oN6odtejYnJJxFckB2BSfLXUaz2qDbnzssD30MdtG0Dxyam6ALhIS1w2xg8VG7eMnXC0aoWdzMK/IrRuScUr1M6E2FDPFH/rlPdGG+HBsVlZ69km9ZbbYGZgDSfmBeooVrXPzAS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987676; c=relaxed/simple;
	bh=RhE83iPwqCx8XDpm1XXD8nmidA73Rnuef6IGCkBM7w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hxkn6tX1rhUZt0zzj3yTN2u9C4NoQx0BKMqSSaoaho2D/ShrN8ZPuy8F2FQdcljpsHxFpCx0yRLUwQTJNguMD062KOVLkY8ntqatMfI3ZH0dglUXgOQ72JXXafTQRYlmMDyExySA6671cm56S3eshm49igvLabTbyOGoCObbKEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvSXgyg4; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvSXgyg4"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-39d70d669a3so482904a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788987674; x=1789592474; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqj+VNtNVIjOW6hlFESqd9b3T/mD5QgzfFuLfE05hyo=;
        b=fvSXgyg4ftNcms8DuhoNlVfIHjuVp98vDLeghIzSNU/ZsND5Tzmry3RE1ISu0iD/H2
         v6q15Vr9kjfnqRZRYpg2M3zMYR02FI6NFHS9IYiEfLGEgr1A9RByu1AjrNpn5swaPpiG
         lGp2M8uV7JJ3nU2mfNO/18oyWEMXFNIU7VDm/Yxo4YDsmiDKYyMWo2HTkyHpEYn1f9N4
         eDuW+H38oV0kxpf4R8nTUyN5ZgDaZz36AA05SzFx9R7Ch9h00hYJzNkW4l43cSGk010G
         ceWNgyX7JM97hpKFfCQbfKjOL6WkSwZp9O9l6HvyTUZpqSrDoZoO33fldBC2OgA5iien
         mIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788987674; x=1789592474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yqj+VNtNVIjOW6hlFESqd9b3T/mD5QgzfFuLfE05hyo=;
        b=q/lYVolDj9E/H8jClXYl2yaBv8rSZGzBX02HG+MGHV0hFqfHiZprePHk66aevFY0ub
         cxTo8hXtqqSfOrVukvd+8aknbYG3d9YtiWGfA+WKMcFPB7h/Wwh2MVfarfqeKvo7wzq0
         0FhsjNrU4kgvJ8JcPm5d67JwVBEVAFR+I3WhxaDUEXtM/sMHFq9406gQl2dZjVOv1mN8
         /ZgTzb6Dtq8BfYJnBRV/HkTM9bcKPWp7N5wynoZolP7YXHzwQDos+lNFWS5DOYCqHIkR
         Cc6XlXKAmcND3WoFdOKNWSCIHyTHDDPOYdZepwSKrGPtpeutxs/PonxUPxiIY9+874TN
         w1fA==
X-Forwarded-Encrypted: i=1; AKwUvByUc1+zHyKKVSDJo4zh847As+fSQY16DNY4k/EbmadBfykKBA66UUJNBezsPHY6zZO9lXs90pFl7Q6zFNc=@vger.kernel.org
X-Gm-Message-State: AFuF++lMqXB7PYLBz9AGZi84cZNDVe+6XFHa2flC8bBPjpl2LLoRpqQI
	tVS4QQwPnQe1wTuduFGqpB13u3X4BJK8nUZahyhtdgek6QLajy499Rp1
X-Gm-Gg: AYBFou3jyxS08FMjzky9IADMtpQvSqCWTAZ0pu4833fTgXEQAUIRerRZ+nKnlXFH1KY
	I0TBX8t9efetxe+t2SW0/NbOCMabecEgkv2oiwzgXfVeym6gfhzj5/zEp9UMjBv58YFOqoV3sZF
	zszgKvYTq3/FluG/BMW253BaDrV/Q/I7XCLA6eEHVHHsGbsaiFeaCKzONmcfeQHUMYc72JIoTgp
	/GLijPkZtIt3UEgXcjGq8yBVXBywMQc7b5GzcSajmNuKADqdTvw4GQgvaQQtZs8783vUxWTzA0w
	bfeI8OrG+4DuMCddSAbVm80fkd7DftAGFhTkPFt5D7jp4rLPygm9rTJuA9F4Q/voT7gqcTV4xUZ
	TftGhLQtNaptmjX9ftUSeSHiI6laiJURt4veyxOk6k5eX1MoB0Lq2aKmkmqLUwHKEVdZfXTrfJz
	WmhxKs/vA2r75AUoYpMzYRjFUCjO1oB0ikLgG6IUhhafi902SImaBOqzxvKOalSxij
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr54748127a91.20.1788987673362;
        Wed, 09 Sep 2026 14:01:13 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:52::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770bc2e1sm1304924a91.1.2026.09.09.14.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:01:12 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:00:24 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Kaifeng Wang <kaifengw@google.com>, netdev@vger.kernel.org, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, sdf@fomichev.me, bobbyeshleman@meta.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] net: devmem: remove gen_pool from dma-buf
 allocations
Message-ID: <aqHGEmXTAhFWrCNY@devvm7509.cco0.facebook.com>
References: <20260831183529.2517322-1-sdf@fomichev.me>
 <CAHS8izM5+CrZG77PxKpfG9k5kEWYMgN=uAuYvy21aabyztBt0w@mail.gmail.com>
 <aphk-b52PGfESvjL@devvm7509.cco0.facebook.com>
 <CAHS8izPRSRFz=s6q1smaKKscZshg=kRkYtXzSpSXA4KmVoh=Fw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izPRSRFz=s6q1smaKKscZshg=kRkYtXzSpSXA4KmVoh=Fw@mail.gmail.com>

On 09/09, Mina Almasry wrote:
> On Wed, Sep 2, 2026 at 11:37 AM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> >
> > On 08/31, Mina Almasry wrote:
> > > On Mon, Aug 31, 2026 at 11:35 AM Stanislav Fomichev
> > > <sdf.kernel@gmail.com> wrote:
> > > >
> > > > Replace devmem's gen_pool based fixed-size allocator with a binding-level
> > > > freelist similar to the one used by io_uring zero-copy receive.
> > > >
> > > > This is motivated by allocation latency observed in the NAPI receive path:
> > > >
> > > >   [ 1036.228913]  ? gen_pool_create+0x90/0x90
> > > >   [ 1036.228915]  net_devmem_alloc_dmabuf+0x1f/0x60
> > > >   [ 1036.228918]  mp_dmabuf_devmem_alloc_netmems+0x17/0x80
> > > >   [ 1036.228920]  mlx5e_post_rx_mpwqes+0xdbe/0xdd0
> > > >   [ 1036.228926]  mlx5e_napi_poll+0x113/0x830
> > > >   [ 1036.228928]  ? sched_clock+0x5/0x10
> > > >   [ 1036.228931]  ? wake_up_process+0x778/0x14b0
> > > >   [ 1036.228933]  net_rx_action+0x15d/0x570
> > > >   [ 1036.228934]  ? update_rq_clock+0x31/0x240
> > > >   [ 1036.228937]  ? __napi_schedule+0x55/0xa0
> > > >   [ 1036.228938]  ? mlx5_eq_comp_int+0x137/0x230
> > > >   [ 1036.228940]  ? atomic_notifier_call_chain+0x36/0x90
> > > >   [ 1036.228943]  ? sched_clock+0x5/0x10
> > > >   [ 1036.228944]  ? sched_clock_cpu+0xc/0x170
> > > >   [ 1036.228947]  irq_exit_rcu+0x12b/0x370
> > > >   [ 1036.228950]  common_interrupt+0x85/0x90
> > > >
> > > > udmabuf can create a very large number of SG entries. In the worst case,
> > > > devmem ends up adding one gen_pool chunk for each net_iov allocation
> > > > unit backed by those entries. The gen_pool allocation path then has to
> > > > traverse a linked list that can become too long for this hot path.
> > > >
> > > > Patch 1 removes the gen_pool and replaces it with a simple freelist of
> > > > net_iov pointers protected by the same spin_lock_bh() pattern used by
> > > > io_uring zcrx. Patch 2 removes the now-unnecessary chunk owner wrapper by
> > > > embedding the net_iov_area directly in the dma-buf binding.
> > > >
> > >
> > > Oh boy, this is going to be a bit tricky.
> > >
> > > I ran into this exact horrible perf bug (sorry for it in the first
> > > place), but my solution was different. My solution [1] was to coalesce
> > > the SG entries that are contigious (and they usually are in practice),
> > > and I got 'acceptable' perf after that. Kaifeng is actually working on
> > > cleaning up my hacky patch up to send it upstream now.
> >
> 
> Sorry for the late reply. We got some perf data. Not complete perf
> data but we ran the workload that detected this issue.
> 
> Basically your fix and my fix produce the same results. Surprisingly,
> the batching doesn't help.
> 
> I think to be honest we want the fix with the batching. It seems
> brutally stupid to me that we refill the cache one netmem at a time
> when filling 64 at a time should in theory be so much better,
> especially if we're not paying a gen_pool_alloc cost every time.
> 
> I'm a bit unsure about this as the version with the gen_pool fix is so
> much more verified in our production. I would welcome discussion. It
> would be nice to know the maintainers are open to switching back to
> gen_pool if this causes us issues in production. In testing and
> benchmarks it's fine.
> 
> I'll go through the patch to see if I have any other feedback besides
> perhaps including the batching.

SG, thanks! I'm gonna test with kperf before/after on my side and
resubmit v2 with batching. The reverts are always warranted if
the users report any issues and we can't forward fix.

(I'm mostly ignoring your suggested fix because I'm not sure it is gonna
solve my udmabuf issues with the merge being random/different on a
fresh/old machine)

> > As you mention, coalescing might happen to work or it might not :-(
> > I'd like us to have something that's less probabilistic.
> >
> 
> Honestly it's not that hard to get a contingous pages. We usually
> alloc GPU mem at boot when there is no fragmentation, and also I think
> underlying, the CUDA will use huge pages and if end up with a handful
> of chunks, the perf is still good.

Right, GPU dmabufs are fine, I see single big SGE on my side. I'm
trying to make udmabuf not suck. It kinda works with 2MB pages (with some
fixes/reverts depending on the kernel version), but I want default 4KB
also to work properly.

> > > Now I don't know which approach is better. Thinking about the pros and
> > > cons of your approach:
> > >
> > > + your approach is much simpler, and removes gen_pool overheads for a
> > > single queue case. It should be (much?) faster for that case.
> > > - your approach adds a lock and allocations from multiple queues in
> > > parallel will contend on this lock. There should be some value of # of
> > > queues N where your approach starts to completely trash. gen_pool is
> > > lockless so I wouldn't expect it to degrade significantly in the
> > > multi-queue case.
> > >
> > > The question for me is what the performance is for a real use case
> > > (NCCL all-to-all for example) over a realistic number of shared queues
> > > (it's 4-8 for me). I need that perf data to be honest before judging
> > > this.
> > >
> > > The io_uring zcrx comparision is not completely valid. io_uring zcrx
> > > is built from the ground up to be one-buffer-is-bound-to-one-rx-queue,
> > > and devmem tcp is built from the ground up to be
> > > one-buffer-can-be-bound-to-N-rx-queues.
> >
> > What if we add batching similar to io_pp_zc_alloc_netmems? So we don't
> > have to spin lock on every netmem (and move PP_ALLOC_CACHE_REFILL-worth
> > of chunks). Untested, on top of this series:
> >
> >
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > index 84d6c30516c8..5a1c996ba515 100644
> > --- a/net/core/devmem.c
> > +++ b/net/core/devmem.c
> > @@ -58,25 +58,25 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
> >         kfree(binding);
> >  }
> >
> > -struct net_iov *
> > -net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
> > +static unsigned int
> > +net_devmem_alloc_dmabuf_bulk(struct net_devmem_dmabuf_binding *binding,
> > +                            netmem_ref *netmems, unsigned int count)
> >  {
> > -       struct net_iov *niov;
> > +       unsigned int i;
> > +
> >         spin_lock_bh(&binding->freelist_lock);
> > -       if (unlikely(!binding->free_count)) {
> > -               spin_unlock_bh(&binding->freelist_lock);
> > -               return NULL;
> > +
> > +       count = min_t(size_t, count, binding->free_count);
> > +       for (i = 0; i < count; i++) {
> > +               struct net_iov *niov = binding->freelist[--binding->free_count];
> > +
> > +               binding->freelist[binding->free_count] = NULL;
> > +               netmems[i] = net_iov_to_netmem(niov);
> >         }
> >
> > -       niov = binding->freelist[--binding->free_count];
> > -       binding->freelist[binding->free_count] = NULL;
> >         spin_unlock_bh(&binding->freelist_lock);
> >
> > -       niov->desc.pp_magic = 0;
> > -       niov->desc.pp = NULL;
> > -       atomic_long_set(&niov->desc.pp_ref_count, 0);
> > -
> > -       return niov;
> > +       return count;
> >  }
> >
> >  void net_devmem_free_dmabuf(struct net_iov *niov)
> > @@ -433,20 +433,35 @@ int mp_dmabuf_devmem_init(struct page_pool *pool)
> >  netmem_ref mp_dmabuf_devmem_alloc_netmems(struct page_pool *pool, gfp_t gfp)
> >  {
> >         struct net_devmem_dmabuf_binding *binding = pool->mp_priv;
> > -       struct net_iov *niov;
> > -       netmem_ref netmem;
> > +       netmem_ref *netmems = pool->alloc.cache;
> > +       unsigned int allocated, i;
> > +
> > +       if (WARN_ON_ONCE(pool->alloc.count))
> > +               return 0;
> >
> > -       niov = net_devmem_alloc_dmabuf(binding);
> > -       if (!niov)
> > +       allocated = net_devmem_alloc_dmabuf_bulk(binding, netmems,
> > +                                                PP_ALLOC_CACHE_REFILL);
> > +       if (unlikely(!allocated))
> >                 return 0;
> >
> > -       netmem = net_iov_to_netmem(niov);
> > +       for (i = 0; i < allocated; i++) {
> > +               struct net_iov *niov = netmem_to_net_iov(netmems[i]);
> >
> > -       page_pool_set_pp_info(pool, netmem);
> > +               niov->desc.pp_magic = 0;
> > +               niov->desc.pp = NULL;
> > +               atomic_long_set(&niov->desc.pp_ref_count, 0);
> > +
> > +               page_pool_set_pp_info(pool, netmems[i]);
> > +
> > +               pool->pages_state_hold_cnt++;
> > +               trace_page_pool_state_hold(pool, netmems[i],
> > +                                          pool->pages_state_hold_cnt);
> > +       }
> >
> > -       pool->pages_state_hold_cnt++;
> > -       trace_page_pool_state_hold(pool, netmem, pool->pages_state_hold_cnt);
> > -       return netmem;
> > +       /* Return the last one, the rest stay in the page_pool cache. */
> > +       allocated--;
> > +       pool->alloc.count = allocated;
> > +       return netmems[allocated];
> >  }
> >
> >  void mp_dmabuf_devmem_destroy(struct page_pool *pool)
> > diff --git a/net/core/devmem.h b/net/core/devmem.h
> > index 20a3eb90ea7f..7195769b8bd1 100644
> > --- a/net/core/devmem.h
> > +++ b/net/core/devmem.h
> > @@ -133,8 +133,6 @@ net_devmem_dmabuf_binding_put(struct net_devmem_dmabuf_binding *binding)
> >  void net_devmem_get_net_iov(struct net_iov *niov);
> >  void net_devmem_put_net_iov(struct net_iov *niov);
> >
> > -struct net_iov *
> > -net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding);
> >  void net_devmem_free_dmabuf(struct net_iov *ppiov);
> >
> >
> > @@ -191,12 +189,6 @@ net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
> >         return -EOPNOTSUPP;
> >  }
> >
> > -static inline struct net_iov *
> > -net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
> > -{
> > -       return NULL;
> > -}
> > -
> >  static inline void net_devmem_free_dmabuf(struct net_iov *ppiov)
> >  {
> >  }
> >
> >
> > > Are you able to get NCCL all-to-all tests for N=4/8 yourself?
> > > Otherwise please wait for me to backport this to my release kernel and
> > > test it. ETA sometime this week, I hope.
> >
> > I can definitely wait for you to access the perf impact on your side. Wonder
> > if we need to have a selftest to do that properly in NIPA. Doesn't have to
> > be a red/green signal, but some number for humans to compare
> > before-after (specifically this bind one dmabuf to multiple queues and pass
> > a lot of traffic). I can probably sketch something..
> 
> Selftest in NIPA is nice, but NIPA would need access to a real GPU to
> run NCCL tests, AFAIK. I don't know how to make those run on udmabuf
> without O(months) of work.

Feels like we just need to invoke kperf from
tools/testing/selftests/drivers/net/hw/devmem.py ? If udmabuf
has good perf with 4KB we don't need any GPUs, right? I don't see
any perf/kperf tests on NIPA yet, but I can add a patch for v2 and we
can discuss (not using the perf to gate initially, for human review
only). No NCCL, no A2A, just two machines, N flows x M queues should
be enough?
