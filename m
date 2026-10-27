Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793123007;
	b=m+rIEGimIyp/IRqmHlNXjEFOVt/FvA0SRkwZARpUUw1TJft6jmRXGLVZqqSabdgTfJYu
	 jUMzc8lklopA8KsyMKDmGRh49IVW80u/rmb7MLWtmsagkgilPyyEp9lzsiuia6Q7wEpUw
	 f0VFFVsnUylYumsi9OmC6bb1f1sbYOoXCVesIm/ikXt5SvyBxmP/HVZIsVIpY4JoN1N4Y
	 uL/y94LksBFE2A3CCrDBDaP3y2qIsTUhLZKrkUoY1HtTdaDylppYKrKttxUwCDx4I//Fe
	 DibAteh/6ihuhOygv780Y0BC3zbptz5BaAVXPIc/9xAACJflQl94IscSjUFWTqlzMMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p3B3dOUVUprYHGKVW+MiktwDFrlXxMAYs/IueGeZxSQ=;
	b=qOi3yXZSTdOR+3KiqY5Fn0IFAISIzGePmJsDEDMs7xATX0lGXs7dzmFJiJ6rCfTILGsu
	 lqUmZJOl5Y6Bh0rLdNF94BiGiGFFRWA6xyl+mN5x5Dcdt5NGmYDN6sn0a1R2Xo8JUe3xR
	 dEdAQcHkb79XzLrNKQt07FOuhmSsj6QWxZq+TRt2enokDtTV0TYrY3kPJlu4t5qibVtR3
	 2dUWfloaSKLROL6c29qFIjsZzgEFI7XnzSQK9xwuwBZjh9MYfDfULGjgPhu/dpmIe3qns
	 LStknuhsyI7UiaajipdHKQD9HnbBFYG+rEs1nyDdJ2PNw8Cf3D/kndMOQEyluI7l4LA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aJnmVK7k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137E2606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 137E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aJnmVK7k
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso6365e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793123005; cv=none;
        d=google.com; s=arc-20260327;
        b=bQIhx/8qhyTD7JKwfbtJOLBFuW7iUpa+zYPUll/zvZDvB7R2612mBbCeaSffvbcgDi
         m+rnKFixYZ4TL7Z6xVdPVHIpRo8I/cewO80WsyRHXav4SIaxpnLAgcazxYyKfxNX2Cc+
         q+x5wfRnfc0qzVqHjnWx+l2UiljShPM3MSXxDK59q+qAwo9DulVrT+HhMw+1pOJsEqdI
         FSeqsLM9ZKMBAeKYEnVHrgpkZBIooGxKT/+32D5TtysNhyz3of0ry325EJEg9P9KFEKg
         rhvNduzcydQu3kabIsH/Tjxb3ewhsCCL5/wmlYtm0nMnk7L85d/gUaMzVAjePTxodiid
         Z0AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p3B3dOUVUprYHGKVW+MiktwDFrlXxMAYs/IueGeZxSQ=;
        fh=FqJsBGro4bSkJcnw15ru2tahTJABX6KbMRfNbRY9YqY=;
        b=rkADr3t1c2aZcX+pgY7F0RCV2P38BsqIYTmU743hXgSq3+6ozT2YMRlzP8+jtReM1x
         ZzBCA+8WQcebQN35OMWWNKgdoZia164GzqDmkJY+3+/vMuAlwTW4c9cmDgZ7OkLo7ztW
         dkUZe+/k7/Iue8Fozj9iHA73q98w3nKWQ1xekUr4LCS3NxuS1p4AQJOpumpEv2LQ5mnj
         YxgX4w3ASM/zAP409SBUs8vZNUUQqlQZtKAQURA1jmEpnz4hSI2nPli3JumOl+YRIJ4E
         OUPcmXOXeFSAkv20ZAIVwmipJthUGWYQagVmd3Vyw93Zgl2mUibo09MJPKMRaLYel5xj
         LmcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793123005; x=1793727805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p3B3dOUVUprYHGKVW+MiktwDFrlXxMAYs/IueGeZxSQ=;
        b=aJnmVK7kp+8RQDq/9rrzQLnJK6Gv7tEDbKCdVeOIzNNZRf/oTNA/9L194r13/FophL
         lNDDcFRUoXcAU6+hDjC1T55LHcJAHUPzws6b/7Sz56SJLsW0WXADRN4DSabG903/LL9h
         BddV7AEUobaVzQ1rZlKf42w74N6MOhvhoJtgdG8OAQsaw6xlXLzlTrttrIu+HOt2ha20
         RY7g3mYLw+Zb42JHBqJTM972c3pP4yCa9aLFXEaqIQiwGjHSW1u7VgEAzGLTL/7Ipkfj
         0pUqcLHlfsnFdmz5iv4TF+I7ETThNysjdCTc18nuw3nzmS4vUw7aJbGTmZI4kF8ybPYh
         +2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123005; x=1793727805;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3B3dOUVUprYHGKVW+MiktwDFrlXxMAYs/IueGeZxSQ=;
        b=TKd8XPL6fx+J7H6IqNiGvBqNs5dNwcFBfh/283IOSqJzubodVtDdgBn1+JwbJg6dB0
         wXP9+Jbf7cai6RTUh1t4e5wEJGu8EJid2fHxus+67hSCcfPNwLnCtdWnzFBYuxbWt2gQ
         FVbjHn8lYCDP5yW+t9Shgq+daEFjUk5c3cdh5hZ/RvcOlvfTlUlWXx529kaLk48ZRyOI
         qipbTvWQIrR84JBERH/egeQfHp5m0Ky1me5OwbtjIm1XIe1AA/KYNnNJHp5LUCdB1aFg
         w7jyz5ymqaw+TT3Dl74wN1lT05yj6re+qET8sEKW2I7ocMGyPO5RWG2St0LxhzoyLDq6
         HEZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzskskMc3PhqZ9FZ1r025OPb66hB5i9MBYhSxWS9gQ36GNVqVrYTXgY/UVTzCnb7Pueo++xTHzP3ScInsM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh/ebkBwLpdyjz7AlKiYTCqhEwR7bVtZej3ryxHCJMxnrMsZnA
	ZUTUYj0TU3xZOpSL6dcfEAAiThVPRy1F1ZPF6I3PJu/Avu7wHdrreoKX+BN2oSJsV9W/AnCRbfE
	hN1Fe4XQdmAcMUItKNd/Wd/adn2sOsVh3fEq81eM3
X-Gm-Gg: AYBFou0eycsa/zl8soIwWh8qYJGpbDuO1p9CsWCIUr5Va3uXGRjFRH+hcm58FDi2at2
	GMt4TEjIHqffPRIL6yIPu+3YCgeDJVbGI672fiOp50BhQyt+KtN2ymHSGOXSPs7cYgNxMz3RLEu
	iqejGGG5dy2pvAJ5INDGYG5tNSkoCpQm1csZWExfvcstj5GxXgvQjTEOndi0EfH4pB5kS04FDKc
	3Kq9FotjXToHqlpxyi66X2MqqsPW4qE7PZgupN6jefCgCY3ms4mAHWgT1mYst3F+PAlT2bU5zmj
	tYz6DH5z8PT+RS1gVRjLPD5k8UA74+55fVPa+MiLfWYaSR1vYIWnPEXHRi7jMQN4xuXj+i/qRgK
	4Ebpha5bDPiRf90L5k2qq0YPYHmPrYs9lIFfWwZhZ9KdLZdWbi935jg4LMxWjdmX0/p/7+o0jft
	ff/ImHYwSUQJX8uQ==
X-Received: by 2002:a05:600c:1092:b0:4a1:eb02:37c with SMTP id
 5b1f17b1804b1-4a93cd51d37mr18155e9.6.1793123005040; Tue, 27 Oct 2026 10:43:25
 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023222313.3979455-1-tjmercier@google.com> <DF7DBE4B-E0BA-423B-BDA7-DB07D1C9E564@linux.dev>
In-Reply-To: <DF7DBE4B-E0BA-423B-BDA7-DB07D1C9E564@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 27 Oct 2026 10:42:00 -0700
X-Gm-Features: AclHuK_QytrvT9uNtK6TFZfkFqcTUjqFLup9uHHWt2PGssnl21GD_10Q-N8u7ck
Message-ID: <CABdmKX3-XKWXwZe5f=VwZeSuKH6xM0dsK7TvY7u9B1hgaPOm4g@mail.gmail.com>
Subject: Re: [PATCH] mm: memcontrol: fix NULL pointer deref in
 high_work_func() on dying memcg
To: Muchun Song <muchun.song@linux.dev>
Cc: hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, zhengqi.arch@bytedance.com, akpm@linux-foundation.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 7:42=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Oct 24, 2026, at 06:23, T.J. Mercier <tjmercier@google.com> wrote:
> >
> > When memory.high is exceeded in non-task context, try_charge_memcg()
> > schedules memcg->high_work without taking a CSS reference on the memcg,
> > and high_work_func() invokes reclaim_high() without pinning the memcg.
> >
> > Before commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of
> > dying memory cgroup for LRU folios"), memory usage above memory.high
> > kept the memcg's refcount non-zero. With reparenting, folios and objcgs
> > charged to a child memcg are reparented to its parent in
> > mem_cgroup_css_offline(), leaving the offlined child's memory usage
> > permanently above its memory.high even after its last reference is
> > dropped.
> >
> > cancel_work_sync(&memcg->high_work) only runs at the end of teardown in
> > mem_cgroup_css_free(), so high_work_func() can start or still be runnin=
g
> > reclaim_high() after mem_cgroup_css_released() or shrink_many() has
> > called lru_gen_release_memcg() and unhashed lruvec->lrugen.list. This
> > causes lru_gen_rotate_memcg() to dereference a NULL pprev pointer.
> >
> > Fix this by acquiring a reference with css_tryget_online() in
> > high_work_func() before calling reclaim_high(), and by resetting
> > memory.high and swap.high to PAGE_COUNTER_MAX in
> > mem_cgroup_css_offline() so that charges via references on an offlined
> > memcg do not trigger high_work on the dead child or skip checking live
> > ancestors in try_charge_memcg().
> >
> > Oops: general protection fault, probably for non-canonical address 0xdf=
fffc0000000000: 0000 [#1] SMP KASAN NOPTI
> > KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> > CPU: 1 UID: 0 PID: 27 Comm: kworker/1:0 Tainted: G    B   W           7=
.3.0-rc5-g2bba28e98578 #284 PREEMPT(full) <- Taint from lru_gen_rotate_memc=
g() VM_WARN_ON_ONCE
> > Tainted: [B]=3DBAD_PAGE, [W]=3DWARN
> > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-debi=
an-1.17.0-1 04/01/2014
> > Workqueue: events high_work_func
> > RIP: 0010:lru_gen_rotate_memcg+0x1a3/0xe90
> > Code: fd 7f 09 45 84 ed 0f 85 64 0c 00 00 48 89 cf c6 83 6a 07 00 00 00=
 48 c1 ef 03 88 83 69 07 00 00 48 b8 00 00 00 00 00 fc ff df <80> 3c 07 00 =
0f 85 ec 0b 00 00 48 89 31 40 f6 c6 01 0f 85 4e 00
> > RSP: 0018:ffa00000001ef4c8 EFLAGS: 00010046
> > RAX: dffffc0000000000 RBX: ff1100000779e440 RCX: 0000000000000000
> > RDX: 0000000000000001 RSI: ff1100000779b9b0 RDI: 0000000000000000
> > RBP: ff110000bffd8e40 R08: 0000000000000000 R09: ff1100000779ebb8
> > R10: ff1100000779ebb0 R11: 0000000000000246 R12: 0000000000000000
> > R13: 0000000000000000 R14: ffa00000001efb30 R15: 0000000000000002
> > FS:  0000000000000000(0000) GS:ff1100011c0e7000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 000000000251ac88 CR3: 0000000009d6c000 CR4: 0000000000751ef0
> > PKRU: 55555554
> > Call Trace:
> > <TASK>
> > ? read_ctrl_pos+0x22f/0x3f0
> > shrink_lruvec+0x16cb/0x1b80
> > ? ret_from_fork_asm+0x1a/0x30
> > ? lapic_next_event+0x15/0x20
> > ? clockevents_program_event+0x2bb/0x6f0
> > ? lapic_next_event+0x15/0x20
> > ? __pfx_shrink_lruvec+0x10/0x10
> > ? __pfx_clockevents_program_event+0x10/0x10
> > ? _raw_spin_lock+0x84/0xe0
> > ? __pfx__raw_spin_lock+0x10/0x10
> > ? kasan_save_stack+0x30/0x50
> > ? psi_group_change+0x381/0x740
> > ? __pfx_sched_clock_cpu+0x10/0x10
> > ? save_fpregs_to_fpstate+0xc4/0x2c0
> > ? finish_task_switch.isra.0+0x1de/0xac0
> > ? __schedule+0xf62/0x42c0
> > ? __pfx___schedule+0x10/0x10
> > ? __pfx___irq_work_queue_local+0x10/0x10
> > ? shrink_node+0x626/0x31e0
> > shrink_node+0x626/0x31e0
> > ? ring_buffer_unlock_commit+0x11d/0x5c0
> > ? kswapd_clear_hopeless+0xa0/0x150
> > ? __pfx_shrink_node+0x10/0x10
> > ? 0xffffffffc0000095
> > do_try_to_free_pages+0x255/0x13b0
> > ? ring_buffer_unlock_commit+0x11d/0x5c0
> > ? reclaim_high+0x10a/0x1b0
> > try_to_free_mem_cgroup_pages+0x1f9/0x5a0
> > ? __pfx_try_to_free_mem_cgroup_pages+0x10/0x10
> > ? irqentry_exit+0xc6/0x670
> > reclaim_high+0x10a/0x1b0
> > ? __pfx_reclaim_high+0x10/0x10
> > ? process_one_work+0x5ff/0x1030
> > ? __pfx_high_work_func+0x10/0x10
> > process_one_work+0x6e2/0x1030
> > ? __pfx___schedule+0x10/0x10
> > ? __pfx_process_one_work+0x10/0x10
> > worker_thread+0x422/0xbb0
> > ? __pfx_worker_thread+0x10/0x10
> > kthread+0x2cd/0x3a0
> > ? recalc_sigpending+0x15c/0x200
> > ? __pfx_kthread+0x10/0x10
> > ret_from_fork+0x368/0x590
> > ? __pfx_ret_from_fork+0x10/0x10
> > ? __switch_to+0x588/0xf50
> > ? __pfx_kthread+0x10/0x10
> > ret_from_fork_asm+0x1a/0x30
> > </TASK>
> >
> > Fixes: f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of dying me=
mory cgroup for LRU folios")
>
> Hi T.J.,
>
> Thanks for fixing this.
>
> I have one question about the Fixes tag.
>
> The changelog says that, before f1cf8d2f36dc, memory usage above
> memory.high kept the memcg reference count non-zero. This is true for
> LRU folios: before that commit, each charged LRU folio held a CSS
> reference until it was uncharged.
>
> However, I wonder whether objcg-based kmem already provided a reachable
> path before f1cf8d2f36dc.
>
> In particular, BPF alloc_bulk() mostly runs from irq_work. It obtains a
> temporary memcg reference from a persistent objcg, uses set_active_memcg(=
)
> while performing __GFP_ACCOUNT allocations, and drops the temporary
> reference after the allocation. The charge can therefore queue
> memcg->high_work in non-task context without transferring a CSS
> reference to the work item.
>
> If this races with memcg offlining, objcg reparenting can redirect the
> objcg to the parent while the old child's page-counter usage remains
> above memory.high. Once the temporary CSS reference is dropped,
> mem_cgroup_css_released() can call lru_gen_release_memcg() before the
> queued high_work runs. The worker can then enter reclaim_high() and
> rotate an already removed lrugen.list.
>
> This path appears to have all the required pieces after:
>
>   e4dde56cd208 ("mm: multi-gen LRU: per-node lru_gen_folio lists")
>
> Commit 6867c7a33206 later changed the release operation to
> hlist_nulls_del_init_rcu(), which explains the exact NULL pprev seen in
> the reported crash. Before that, the same invalid second deletion would
> instead encounter LIST_POISON2.
>
> So f1cf8d2f36dc clearly broadens the problem to ordinary LRU folios, but
> I am not very sure it is the first commit after which the underlying race=
 is
> reachable.
>
> Is there an additional lifetime guarantee that prevents the pre-f1cf
> objcg/kmem path above? If no, would the following be more appropriate?
>
> Fixes: e4dde56cd208 ("mm: multi-gen LRU: per-node lru_gen_folio lists")
>
> Thanks,
> Muchun

Hi Muchun,

Everything you said sounds correct to me. I don't think there's
anything preventing kmem from keeping the memcg above high while the
refcount hits 0, and hitting the same problem in
lru_gen_rotate_memcg() from lru_gen_shrink_lruvec().

So using Fixes: e4dde56cd208 ("mm: multi-gen LRU: per-node
lru_gen_folio lists") sounds good to me.

Thanks,
T.J.
