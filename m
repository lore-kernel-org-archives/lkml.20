Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793142698;
	b=AQFIkObnGZBNj+wQGTgtkEEHh1YLIxpaAmvQMrKSFPAHNohmOHGZVR21CCCOGFYwwLSB
	 dfIJkgU7yMrNhGZc3A858VkcvZFCOREixLAa42utuELQo4alu6sFcS3iJoesVz0NRV8W8
	 LxBf06ow31qKQLf/a5/unJp8NoXfD0S6erTCRu0WG0zoKRgDW4u6pC3QCvgx5WcV/2wXU
	 xkagz0jiee6B6KvCIXlLOUaVfui4Nq40o4BZD9XC7Tfgvu9aArl48Br//SJoqiTHVZAgG
	 ncfWV5ft3rIEj4VZ0PN2igX8pjxY17Jj6tmS2dizfZmwRpfnyxyCcQFib+fm0hFyioQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rhl2geudcbOZICdrGNLpkxL+lbiX8RJZUOCOaZhyCBY=;
	b=h8hzGKtWiKhNXPSacph86bu4RwRmNv3MixCEtmsV/jh5rGh/TJsgc0Zvh4uANuHeNj/C
	 xdeX0pwY8kYVwuqHiWKaLCMYO88IXTy+9FYPrdP6N3aGN58bhBmG4LSKiuzPtZioq0geB
	 u3yLvDmhv7yryf8dkzfhgULIuDQSjXhAwDqMTGTH4dT6MNtM8Ogzu0FqlPr4Ugbf+O7k3
	 zWMuC86bt/0V1b6+47ggxBfm7YeYh8rlMzxfPx/Eq2SuyOREJC0+alnkwQAVyWE5/P8+k
	 xVhysltCXzanE8lsSv2Mv0My3UJdlO4yXW/6aaYKjpBjKfaEvcJd1eUDMJBo/9gUEtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="V/KUhNH8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC539606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC539606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V/KUhNH8
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a018493d57so30235e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:11:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793142696; cv=none;
        d=google.com; s=arc-20260327;
        b=FK0anTpHDvgsz+9Xtsj9PvYen/PlvjA4R6US9f68yCEDsPCC619royR52YkgSrgwj5
         PifQQfBW4YWSFvpcclqWvq+oXq8e7ZzO5QCquxqOPRHLufT+zaPSRS8BBWybo3fxJSFg
         B+lFjZx81MM8ctYCjerspDNVjRKHGWJnR0UwneQ63v6P85YQLpSPc9ZlYP1X2nZI1DN/
         y3y9FuNAFj7c3ysM55MHpHn1Lxl136cEMp9rzD2cnMsewgxNBixQcjZP4IIaXkDuEsO+
         LmR+RNhQCKk3/V6Tx8OBYts7Qfad+9y6//F1vDSO75wJHtp/sicBTKcrM1ZThq7RPq7C
         TrAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rhl2geudcbOZICdrGNLpkxL+lbiX8RJZUOCOaZhyCBY=;
        fh=CfAYo7j2gqtwErq2V3QUaJKy+F/BYHQEWyfIkn2oRdY=;
        b=Ib18EcF8gIWJ9D0edEeowzisA8oGfo+qCXQbdWkwgHHngxtnVchHBeSmEsJRqozxCX
         vPZ60obkoANPilqC4YQfYV4rhIWaN/myrUeegWIfu0uH4rb8JxcgjzduAEXAQnDRWAuY
         n8ACBg7rgKXRy6bWLfuDwS3HZH05b6soTkJ9eMLbastBFIvKqKQkyFv8EbqZU5B7ypx2
         gmC0J3E/T3WwKyaWA+lNzeLmfMaomGuvak2pvi9X/jVa6JJFF/KuUCm1jbo+I31EsCkZ
         RoVvYn/G9n0xfjhnExjYdYKRFCpSrcU7r0XI2mmyk18PJ2lhy15YX5ndhgNYPcPM8Xq8
         kh6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793142696; x=1793747496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rhl2geudcbOZICdrGNLpkxL+lbiX8RJZUOCOaZhyCBY=;
        b=V/KUhNH8lmp4ZeEhXIbNWPEuOggqT1b/wg/aPuhHdtm+4T44SfhGggjTgcgxOabpp4
         yBDX8qJ4pYYEeQvEfHhBg9mU93fWD2L1TLETyv6tPbumOn8+H+K2fbscFmpm+Gw7aHsW
         NMZjSt5FQ6hC1bduvDY6NAkIbtj/cvIxb4Dsj1bwb0nP1TwNsCL5ohMPBH6tUi8G2YDk
         QfF0h+EhZ/aFNWxbm4IdDJ5ss5Y3QwDq3Dl0F+lWembf1W2nB0/BaO+PRosrPmTxJJET
         dL6GZ+Y7N4VV/+oyoRSRnZ8nfFdV0jWaRhwFis4soGHTQAKH7aqpDD1uEhbFRxJ9onf3
         laiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142696; x=1793747496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rhl2geudcbOZICdrGNLpkxL+lbiX8RJZUOCOaZhyCBY=;
        b=PiS66TaxBmP4AAq43yWU2R0Xbmz/bOTOMoO1iqvWh60XHR7blAgfk7zH6U/oofOB4N
         E8bI9rV9WSibit+VZpA1HBPQttMJhT4/zkT9yluwAWdyk/Iy7U1Uk5vuS41IvezaPXaL
         Mf7O8fOpiBhdKev964D8pAdBpva7cuAkdXDpN/hE9iUZn9zXpMTONktTqfj5aeMPTzWK
         rgtDwmifnRw3EgEOkzMmnd97d0HtMVtwRqqBMCuw1t0PpPXX11v59G9Oe8bfORzxPs8M
         GGMnWC4jrzFGkuf9Jt6fo6cri2GHdJ7eb28mNpY+VMLLtL9N2DBsrrK1aEustl0aivVc
         j5xA==
X-Forwarded-Encrypted: i=1; AKwUvBxvK/xpq7F4qh59W9w5D5Qa5NZQA4d12JuK2Neqr9GKtlCa0p0xozRtGrntn9+tWNgYHt0tROVlWAR/uWo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs9LUgdTm9WuiRqtvEJPOaEW2cM6sm6Q2Qi+sQSxcg2NZxNb2l
	+xj3l5l2s67xTQtX+U2LmTb24B1cMc13pBzZDs3ZItBH2WoGIcFJ9VYQ/MewvfciOG8GtXQ5TPH
	df1710vspXwf0IGiJ6VmHvmj09Sv+fCeco+Hu/sRP
X-Gm-Gg: AYBFou1mVlKEOq6xCIuMoDBV8WA4HSosR5fS7Z/hHIEJz5irK+iDcSBEp2E2UeF1ahD
	m8zCC/jpJFbmfj8tWHxgquXo9d8h4tXqDHszFQGOe5HpjM5bHNmn3Sv7hgWJno+OcAk485Yjvjk
	nn4tECEWsl2y74uZxuob9JEjJfkMUr3r/dXgtGlMYUaS3n0CGmWZ1fic463P+y/j36TpewKfNB1
	OPZAEDruSW29rr+BnWvc095cAbr8N0Gm1m3s6jWb4pXFt9w5+ykso9yEflzAbiHu/G2PfhvoELK
	75XYY+aXt2UXyrF2yJUGA4wBq2jTlBvJ+34XGjAGsPqM1UdolSGrXcGj62Q66Y5TOZQ/MA2aXgb
	t3qIoGc5H4QC1OGON8znbZikHud8MiX63fgsXcBe/egUUtV5l99w3WS8vCff+hzK4dyk0keNVKp
	Yyd/ICqQQfOc2F1ByuLHemsPhXUMqhU17NfiZ+hI6mxbJu
X-Received: by 2002:a05:600c:3227:b0:4a1:eb11:489d with SMTP id
 5b1f17b1804b1-4a96036cebemr122195e9.16.1793142695725; Tue, 27 Oct 2026
 16:11:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023222313.3979455-1-tjmercier@google.com>
 <DF7DBE4B-E0BA-423B-BDA7-DB07D1C9E564@linux.dev> <CABdmKX3-XKWXwZe5f=VwZeSuKH6xM0dsK7TvY7u9B1hgaPOm4g@mail.gmail.com>
In-Reply-To: <CABdmKX3-XKWXwZe5f=VwZeSuKH6xM0dsK7TvY7u9B1hgaPOm4g@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 27 Oct 2026 16:11:23 -0700
X-Gm-Features: AclHuK84iU4LGcBkObjk5TD5SSpvHPSR8JadqDMoPlQEagyX_MXN3xEU-MBo_ZY
Message-ID: <CABdmKX3DEDwgO_wj3JDYvx15FYPKGCav8HKvHC-u_EHdGhWwLg@mail.gmail.com>
Subject: Re: [PATCH] mm: memcontrol: fix NULL pointer deref in
 high_work_func() on dying memcg
To: Muchun Song <muchun.song@linux.dev>
Cc: hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, zhengqi.arch@bytedance.com, akpm@linux-foundation.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 10:42=E2=80=AFAM T.J. Mercier <tjmercier@google.com=
> wrote:
>
> On Mon, Oct 26, 2026 at 7:42=E2=80=AFPM Muchun Song <muchun.song@linux.de=
v> wrote:
> >
> >
> >
> > > On Oct 24, 2026, at 06:23, T.J. Mercier <tjmercier@google.com> wrote:
> > >
> > > When memory.high is exceeded in non-task context, try_charge_memcg()
> > > schedules memcg->high_work without taking a CSS reference on the memc=
g,
> > > and high_work_func() invokes reclaim_high() without pinning the memcg=
.
> > >
> > > Before commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of
> > > dying memory cgroup for LRU folios"), memory usage above memory.high
> > > kept the memcg's refcount non-zero. With reparenting, folios and objc=
gs
> > > charged to a child memcg are reparented to its parent in
> > > mem_cgroup_css_offline(), leaving the offlined child's memory usage
> > > permanently above its memory.high even after its last reference is
> > > dropped.
> > >
> > > cancel_work_sync(&memcg->high_work) only runs at the end of teardown =
in
> > > mem_cgroup_css_free(), so high_work_func() can start or still be runn=
ing
> > > reclaim_high() after mem_cgroup_css_released() or shrink_many() has
> > > called lru_gen_release_memcg() and unhashed lruvec->lrugen.list. This
> > > causes lru_gen_rotate_memcg() to dereference a NULL pprev pointer.
> > >
> > > Fix this by acquiring a reference with css_tryget_online() in
> > > high_work_func() before calling reclaim_high(), and by resetting
> > > memory.high and swap.high to PAGE_COUNTER_MAX in
> > > mem_cgroup_css_offline() so that charges via references on an offline=
d
> > > memcg do not trigger high_work on the dead child or skip checking liv=
e
> > > ancestors in try_charge_memcg().
> > >
> > > Oops: general protection fault, probably for non-canonical address 0x=
dffffc0000000000: 0000 [#1] SMP KASAN NOPTI
> > > KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007=
]
> > > CPU: 1 UID: 0 PID: 27 Comm: kworker/1:0 Tainted: G    B   W          =
 7.3.0-rc5-g2bba28e98578 #284 PREEMPT(full) <- Taint from lru_gen_rotate_me=
mcg() VM_WARN_ON_ONCE
> > > Tainted: [B]=3DBAD_PAGE, [W]=3DWARN
> > > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-de=
bian-1.17.0-1 04/01/2014
> > > Workqueue: events high_work_func
> > > RIP: 0010:lru_gen_rotate_memcg+0x1a3/0xe90
> > > Code: fd 7f 09 45 84 ed 0f 85 64 0c 00 00 48 89 cf c6 83 6a 07 00 00 =
00 48 c1 ef 03 88 83 69 07 00 00 48 b8 00 00 00 00 00 fc ff df <80> 3c 07 0=
0 0f 85 ec 0b 00 00 48 89 31 40 f6 c6 01 0f 85 4e 00
> > > RSP: 0018:ffa00000001ef4c8 EFLAGS: 00010046
> > > RAX: dffffc0000000000 RBX: ff1100000779e440 RCX: 0000000000000000
> > > RDX: 0000000000000001 RSI: ff1100000779b9b0 RDI: 0000000000000000
> > > RBP: ff110000bffd8e40 R08: 0000000000000000 R09: ff1100000779ebb8
> > > R10: ff1100000779ebb0 R11: 0000000000000246 R12: 0000000000000000
> > > R13: 0000000000000000 R14: ffa00000001efb30 R15: 0000000000000002
> > > FS:  0000000000000000(0000) GS:ff1100011c0e7000(0000) knlGS:000000000=
0000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 000000000251ac88 CR3: 0000000009d6c000 CR4: 0000000000751ef0
> > > PKRU: 55555554
> > > Call Trace:
> > > <TASK>
> > > ? read_ctrl_pos+0x22f/0x3f0
> > > shrink_lruvec+0x16cb/0x1b80
> > > ? ret_from_fork_asm+0x1a/0x30
> > > ? lapic_next_event+0x15/0x20
> > > ? clockevents_program_event+0x2bb/0x6f0
> > > ? lapic_next_event+0x15/0x20
> > > ? __pfx_shrink_lruvec+0x10/0x10
> > > ? __pfx_clockevents_program_event+0x10/0x10
> > > ? _raw_spin_lock+0x84/0xe0
> > > ? __pfx__raw_spin_lock+0x10/0x10
> > > ? kasan_save_stack+0x30/0x50
> > > ? psi_group_change+0x381/0x740
> > > ? __pfx_sched_clock_cpu+0x10/0x10
> > > ? save_fpregs_to_fpstate+0xc4/0x2c0
> > > ? finish_task_switch.isra.0+0x1de/0xac0
> > > ? __schedule+0xf62/0x42c0
> > > ? __pfx___schedule+0x10/0x10
> > > ? __pfx___irq_work_queue_local+0x10/0x10
> > > ? shrink_node+0x626/0x31e0
> > > shrink_node+0x626/0x31e0
> > > ? ring_buffer_unlock_commit+0x11d/0x5c0
> > > ? kswapd_clear_hopeless+0xa0/0x150
> > > ? __pfx_shrink_node+0x10/0x10
> > > ? 0xffffffffc0000095
> > > do_try_to_free_pages+0x255/0x13b0
> > > ? ring_buffer_unlock_commit+0x11d/0x5c0
> > > ? reclaim_high+0x10a/0x1b0
> > > try_to_free_mem_cgroup_pages+0x1f9/0x5a0
> > > ? __pfx_try_to_free_mem_cgroup_pages+0x10/0x10
> > > ? irqentry_exit+0xc6/0x670
> > > reclaim_high+0x10a/0x1b0
> > > ? __pfx_reclaim_high+0x10/0x10
> > > ? process_one_work+0x5ff/0x1030
> > > ? __pfx_high_work_func+0x10/0x10
> > > process_one_work+0x6e2/0x1030
> > > ? __pfx___schedule+0x10/0x10
> > > ? __pfx_process_one_work+0x10/0x10
> > > worker_thread+0x422/0xbb0
> > > ? __pfx_worker_thread+0x10/0x10
> > > kthread+0x2cd/0x3a0
> > > ? recalc_sigpending+0x15c/0x200
> > > ? __pfx_kthread+0x10/0x10
> > > ret_from_fork+0x368/0x590
> > > ? __pfx_ret_from_fork+0x10/0x10
> > > ? __switch_to+0x588/0xf50
> > > ? __pfx_kthread+0x10/0x10
> > > ret_from_fork_asm+0x1a/0x30
> > > </TASK>
> > >
> > > Fixes: f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of dying =
memory cgroup for LRU folios")
> >
> > Hi T.J.,
> >
> > Thanks for fixing this.
> >
> > I have one question about the Fixes tag.
> >
> > The changelog says that, before f1cf8d2f36dc, memory usage above
> > memory.high kept the memcg reference count non-zero. This is true for
> > LRU folios: before that commit, each charged LRU folio held a CSS
> > reference until it was uncharged.
> >
> > However, I wonder whether objcg-based kmem already provided a reachable
> > path before f1cf8d2f36dc.
> >
> > In particular, BPF alloc_bulk() mostly runs from irq_work. It obtains a
> > temporary memcg reference from a persistent objcg, uses set_active_memc=
g()
> > while performing __GFP_ACCOUNT allocations, and drops the temporary
> > reference after the allocation. The charge can therefore queue
> > memcg->high_work in non-task context without transferring a CSS
> > reference to the work item.
> >
> > If this races with memcg offlining, objcg reparenting can redirect the
> > objcg to the parent while the old child's page-counter usage remains
> > above memory.high. Once the temporary CSS reference is dropped,
> > mem_cgroup_css_released() can call lru_gen_release_memcg() before the
> > queued high_work runs. The worker can then enter reclaim_high() and
> > rotate an already removed lrugen.list.
> >
> > This path appears to have all the required pieces after:
> >
> >   e4dde56cd208 ("mm: multi-gen LRU: per-node lru_gen_folio lists")
> >
> > Commit 6867c7a33206 later changed the release operation to
> > hlist_nulls_del_init_rcu(), which explains the exact NULL pprev seen in
> > the reported crash. Before that, the same invalid second deletion would
> > instead encounter LIST_POISON2.
> >
> > So f1cf8d2f36dc clearly broadens the problem to ordinary LRU folios, bu=
t
> > I am not very sure it is the first commit after which the underlying ra=
ce is
> > reachable.
> >
> > Is there an additional lifetime guarantee that prevents the pre-f1cf
> > objcg/kmem path above? If no, would the following be more appropriate?
> >
> > Fixes: e4dde56cd208 ("mm: multi-gen LRU: per-node lru_gen_folio lists")
> >
> > Thanks,
> > Muchun
>
> Hi Muchun,
>
> Everything you said sounds correct to me. I don't think there's
> anything preventing kmem from keeping the memcg above high while the
> refcount hits 0, and hitting the same problem in
> lru_gen_rotate_memcg() from lru_gen_shrink_lruvec().
>
> So using Fixes: e4dde56cd208 ("mm: multi-gen LRU: per-node
> lru_gen_folio lists") sounds good to me.
>
> Thanks,
> T.J.

I was able to get a reproduction on e4dde56cd208. Fortunately this
patch applies cleanly on e4dde56cd208, so I expect the stable
backports to be straightforward.

general protection fault, probably for non-canonical address
0xfbd59c0000000024: 0000 [#1] PREEMPT SMP KASAN NOPTI
KASAN: maybe wild-memory-access in range [0xdead000000000120-0xdead00000000=
0127]
CPU: 1 PID: 37 Comm: kworker/1:1 Not tainted 6.2.0-rc4-00108-ge4dde56cd208 =
#1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.17.0-debian-1.17.0-1 04/01/2014
Workqueue: events high_work_func
RIP: 0010:lru_gen_rotate_memcg+0x147/0xef0
Code: 49 c1 ea 03 41 80 3c 3a 00 0f 85 a5 09 00 00 48 89 f7 4c 8b 93
08 07 00 00 48 c1 ef 03 48 89 fa 48 bf 00 00 00 00 00 fc ff df <80> 3c
3a 00 0f 85 2a 07 00 00 4c 89 16 41 f6 c2 01 0f 85 72 00
RSP: 0018:ffa00000002a75e0 EFLAGS: 00010206
RAX: ff11000008d46701 RBX: ff11000008d46000 RCX: 0000000000000000
RDX: 1bd5a00000000024 RSI: dead000000000122 RDI: dffffc0000000000
RBP: ff110000bfe54000 R08: ff11000008d46708 R09: ff11000008d46710
R10: ff11000009a5a708 R11: 0000000000000000 R12: 0000000000000006
R13: 0000000000000004 R14: 1ff4000000054ee4 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ff110000a3480000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000007d5c000 CR4: 0000000000751ee0
PKRU: 55555554
Call Trace:
 <TASK>
 ? reset_ctrl_pos+0x10f/0x460
 shrink_lruvec+0x19e0/0x2000
 ? kasan_set_track+0x25/0x30
 ? __kasan_slab_alloc+0x66/0x80
 ? kmem_cache_alloc+0x165/0x310
 ? __kernfs_new_node+0xd3/0x590
 ? __kernfs_create_file+0x2d/0x280
 ? sysfs_add_file_mode_ns+0x12b/0x3a0
 ? internal_create_group+0x286/0x940
 ? internal_create_groups+0x84/0x110
 ? really_probe+0x223/0x690
 ? unwind_next_frame+0xa9a/0x2040
 ? arch_stack_walk+0x7a/0x110
 ? unwind_next_frame+0xa9a/0x2040
 ? arch_stack_walk+0x7a/0x110
 ? __pfx_shrink_lruvec+0x10/0x10
 ? preempt_count_add+0x83/0x180
 ? unwind_next_frame+0xb2/0x2040
 ? unwind_next_frame+0x212/0x2040
 ? ret_from_fork+0x2c/0x50
 ? __pfx_stack_trace_consume_entry+0x10/0x10
 ? arch_stack_walk+0xa2/0x110
 ? sched_clock_local+0x132/0x210
 ? __pfx_sched_clock_local+0x10/0x10
 ? unwind_next_frame+0x212/0x2040
 ? __pfx_shrink_slab+0x10/0x10
 ? sched_clock_cpu+0x232/0x2c0
 ? __pfx_sched_clock_local+0x10/0x10
 ? __pfx_sched_clock_cpu+0x10/0x10
 ? mem_cgroup_iter+0x269/0x600
 ? vmpressure+0x30/0x3b0
 shrink_node+0xb39/0x26a0
 ? __pfx_shrink_node+0x10/0x10
 ? kasan_save_stack+0x42/0x60
 ? ring_buffer_lock_reserve+0x2fb/0xe30
 do_try_to_free_pages+0x31a/0x1880
 ? __pfx_do_try_to_free_pages+0x10/0x10
 try_to_free_mem_cgroup_pages+0x282/0x5f0
 ? try_to_free_mem_cgroup_pages+0x4/0x5f0
 ? reclaim_high.constprop.0+0x191/0x250
 ? __pfx_try_to_free_mem_cgroup_pages+0x10/0x10
 ? try_to_free_mem_cgroup_pages+0x9/0x5f0
 reclaim_high.constprop.0+0x191/0x250
 ? __pfx_reclaim_high.constprop.0+0x10/0x10
 ? __pfx_high_work_func+0x10/0x10
 process_one_work+0x641/0x1010
 worker_thread+0x424/0xec0
 ? __kthread_parkme+0x89/0x160
 ? __pfx_worker_thread+0x10/0x10
 kthread+0x26c/0x300
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x2c/0x50
 </TASK>
