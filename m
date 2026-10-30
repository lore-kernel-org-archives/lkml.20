Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377889;
	b=Vup0i+82Yi1E2+nBng4LQk5UqnlXtldgUNi7CwHoftsQWVJN41SP9UNNziRJbN6r8Gss
	 uZZ9RCLtB8baIsiiV//EQ8L/TQJPzBHFvu7hMbrq4qp/1iDyv+RuqgvkWLKKXjkXMiMr7
	 ffvcGljRUTpayYrf6GwgwzJWHWGbpGV+LKtuY12X3VlzjeKx9MNVW+8Y8bRDZxLcRd6/m
	 rJo/LS7+GID9nrQjj7tYtPaty2wWyH7Et2OcMMMvAa2x89rhJfSdU3zi4sRxweL+rnZ+H
	 yV7wNLOOP56N8CPIug2H1FmIqTPM/gAT2tRYbci/5C72qG2i07E2ult84Ooht7MsAwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=trsHnVMI6YDWj7rsoQPF0JN2z6GWW+nTgXWERqdG0yk=;
	b=oi9S31+1DrZeAjaLn7B20aXPlMLXWY68xhec2VU9tl5a0+NZ/3Nqdh1mNmUS5zc0h/7Z
	 76JsE9AbAx70sipaaa3MQvvekKRaO15bMh2t/NJtkvSGrJg6rD+xcCwF4XVv/NC2q1don
	 RXRytZ6RvwDKnJbFd1ylrzCvJ8WDvvtEcJucm1ZmqSoj/IvUgetY+vJuJ0RF860p3Nt03
	 kuWL56pegsBO5Fmx/ToPSYlhcMQraYVex+abB4QfOtaRb7jo/278qAuaR1EqOacR8Pcqj
	 5rEhA0DhDzNGIul50oqo6cUPCWQ9RmLE4KFeVJm/HYgHKLJW7JVuA6+GbzGKcCODlRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GEHo4ZEB;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AF2606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4AF2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GEHo4ZEB
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df54150dfso458264f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793377887; x=1793982687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=trsHnVMI6YDWj7rsoQPF0JN2z6GWW+nTgXWERqdG0yk=;
        b=GEHo4ZEBbPgIqvKH/esYl4bKEwIgrqYul6cG5ju2hvDLzsBHXTbzLIiQof86MeshRT
         0ccaU+Crjup3egqCgGqPwbBMF/SS5dnC+03U0HRLqdK8p6QCiKO7dEQFBlnPlS0xfXZj
         SbBbAE9WGm2wyHttP9/9yCtzN9YFhBUPOdvJIRMwxZgFLqcwzm8jmeYRExcBIGXaXWwk
         uB6rnPnnxrsmdrLUEg7DRr9LI7bOjPuFmI3t7aMuh6GeX/gg0Fy+aG4w8iHa64aeeDb4
         3y1LRVwrhxbt2pHJ0H8U9bIWcLF8FU3QjUR3HvgyEZMQuQS9JcJoYOOZ7s6gXaykSEdc
         yZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377887; x=1793982687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trsHnVMI6YDWj7rsoQPF0JN2z6GWW+nTgXWERqdG0yk=;
        b=if20jpyaEQw6iJb0iIqpbSYNr6Qkflznane49HBsuSCXtzE4XSVLCM+KJexu15t3GC
         wAMd/mq00V3NqeGqJyz50dE90V7GHUK4IBm72/P1TDWRc1MfQjZnd/lq1MeBUIyQIF9A
         wctEb/4JiMPGUHjUOUIlHBjOFz9SQCnmj0F1iayVJx75TSlIpll0KYoNkgkV3Vt+nhzN
         Mhtpm5Hzqezh4Pxc1x+SR1FzrvrNywtis3sk/vrsVuQu53a6H0960449exz1O4Cvhpw8
         +QJYfB1zqCTwENEEBVUmFybHrPX7drwPwazQ2ufaDrX2ucipz4XYTHzYlADc9ksC8I6S
         TDjw==
X-Forwarded-Encrypted: i=1; AKwUvBwLCCzmzGj5NZRVmF48kpAAok4H+h9wkqcyZS8WYcwHoys00GxlNcq5LTPY25MXpYhGmoHF8s/2KiPVOSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrom3xL9IdZeCJP2oSaJK15JAJRdWF41CN1wgNGq4yeg5Ax8cu
	qp51oykHY1zcZRznnNRdUZMrTiwjD8lqZ+Ca7RRsOhQbUqtwCN+VcXRhQCShRsLW5jk=
X-Gm-Gg: AYBFou3HS7PdSsvjdsF8w9/jMbAY6kxz9ol7S9mlQoM55Qe0A2IRCUb6tXVpHThzdcJ
	1UNbHYaEHXt74FNGQtoc0jE35iNO/KFPfcapLaWQgnqH74f6eDrPJqdFnw5e/uEcidN3PPtUSS9
	j6IeEE2Cpn/HoyOwjU9U0Dst+mHOqONHqZUjK8F7ITG6g1f2AGMcoSgCJTonxTgFfPLv2cjtgr5
	URrUKXrWufhCmoW8tIgLYDmHnfJaiQ4FHsmxnGkTL9nDxxzR4dbbLj6mtlc1zkKZxYAfLviCR0n
	oyp0QbwduUEu0Ig8KzBH7K4VN1Ca7+VZVbnBzPtj2yoibqPv2bhna01FF3edi+Rt2Tn8OTOFJjk
	0s6WT3lFyMH7vvFcc1PCNRhyoLZ38CdVirub3vmDAh0Ha37UmmzHgnW4w1cflbSf+dnjJTX5h1i
	keqWAQjjKf44Ih6xFPMSA0rj14WHWwhj65UU58rc01pFONUqCp9y18NcLD/U1UQDwHwngKGiLAX
	VRrX31fo8yDROq7lJ7xhyDq8Gje/OD8VfNBxBjIJ+KfISrr01ss5UBMOGA1/0vl7PoWTp5C9vId
	Q+KC61igE4b+X3yaPrCLbUkG2jmzk5bqTFpcArHxrGmnP3nD9bbEv/cV1S45l9W/
X-Received: by 2002:a05:6000:2282:b0:48d:f14a:9188 with SMTP id ffacd0b85a97d-48e73851611mr3804299f8f.17.1793377887133;
        Fri, 30 Oct 2026 09:31:27 -0700 (PDT)
Received: from localhost (109-81-92-234.rct.o2.cz. [109.81.92.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm4025629f8f.9.2026.10.30.09.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:31:26 -0700 (PDT)
Date: Fri, 30 Oct 2026 17:31:25 +0100
From: Michal Hocko <mhocko@suse.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: hannes@cmpxchg.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, zhengqi.arch@bytedance.com,
	jp.kobryn@linux.dev, akpm@linux-foundation.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] mm: memcontrol: fix NULL pointer deref and UAF from
 high_work_func() on dying memcg
Message-ID: <auTGXWh2uGK_slxF@tiehlicka>
References: <20261029201858.2932905-1-tjmercier@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029201858.2932905-1-tjmercier@google.com>

On Thu 29-10-26 13:18:58, T.J. Mercier wrote:
> When memory.high is exceeded in non-task context, try_charge_memcg()
> schedules memcg->high_work without taking a reference on the memcg, and
> high_work_func() invokes reclaim_high() without pinning the memcg.
> 
> With obj_cgroup reparenting, introduced in commit bf4f059954dc ("mm:
> memcg/slab: obj_cgroup API"), objects charged to a child memcg are
> reparented to its parent in mem_cgroup_css_offline() instead of holding
> a reference on the child until uncharged. Subsequent uncharges of those
> objects go to the parent, which can leave the child's memory use
> permanently above its high limit, so any later charge on the offlined
> memcg in non-task context schedules high_work. This was later widened
> from kernel memory to LRU folios when commit f1cf8d2f36dc ("mm:
> memcontrol: eliminate the problem of dying memory cgroup for LRU
> folios") converted LRU folios to use obj_cgroup reparenting.
> 
> cancel_work_sync(&memcg->high_work) only runs at the end of teardown in
> mem_cgroup_css_free(), so high_work_func() can start or still be running
> reclaim_high() after mem_cgroup_css_released() or shrink_many() has
> called lru_gen_release_memcg() and unhashed lruvec->lrugen.list. If
> reclaim tries to rotate the memcg, lru_gen_rotate_memcg() dereferences a
> NULL pprev pointer. This issue is specific to MGLRU and was introduced
> with the memcg LRU in commit e4dde56cd208 ("mm: multi-gen LRU: per-node
> lru_gen_folio lists").
> 
> With either traditional LRU or MGLRU, css_free_rwork_fn() calls
> css_rstat_exit() which frees per-CPU rstat data before calling
> mem_cgroup_css_free(). If reclaim_high() is still running, rstat updates
> via mod_lruvec_state() -> __css_rstat_updated() cause a use-after-free
> on the per-CPU rstat data. This was introduced when commit 5da3bfa029d6
> ("cgroup: use separate rstat trees for each subsystem") moved
> css_rstat_exit() ahead of ss->css_free().
> 
> Fix both problems by acquiring a reference with css_tryget_online() in
> high_work_func() before calling reclaim_high(), and by resetting
> memory.high and swap.high to PAGE_COUNTER_MAX in
> mem_cgroup_css_offline() so that charges via references on an offlined
> memcg do not trigger high_work on the dead child and skip checking live
> ancestors in try_charge_memcg().
> 
> Acquiring the reference in high_work_func() rather than before
> scheduling high_work is safe because mem_cgroup_css_free() calls
> irq_work_sync() and cancel_work_sync() which cancels pending work and
> waits for an already running high_work_func() to complete before
> mem_cgroup_free() frees the memcg. css_tryget_online() uses
> percpu_ref_tryget_live() and is safe to call after percpu_ref_exit()
> before the cgroup is freed unlike css_tryget().
> 
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
> KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> CPU: 1 UID: 0 PID: 27 Comm: kworker/1:0 Tainted: G    B   W           7.3.0-rc5-g2bba28e98578 #284 PREEMPT(full)
> Tainted: [B]=BAD_PAGE, [W]=WARN  <-- Taint from lru_gen_rotate_memcg() VM_WARN_ON_ONCE
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-debian-1.17.0-1 04/01/2014
> Workqueue: events high_work_func
> RIP: 0010:lru_gen_rotate_memcg+0x1a3/0xe90
> Call Trace:
>  <TASK>
>  ? read_ctrl_pos+0x22f/0x3f0
>  shrink_lruvec+0x16cb/0x1b80
>  ? ret_from_fork_asm+0x1a/0x30
>  ? lapic_next_event+0x15/0x20
>  ? clockevents_program_event+0x2bb/0x6f0
>  ? lapic_next_event+0x15/0x20
>  ? __pfx_shrink_lruvec+0x10/0x10
>  ? __pfx_clockevents_program_event+0x10/0x10
>  ? _raw_spin_lock+0x84/0xe0
>  ? __pfx__raw_spin_lock+0x10/0x10
>  ? kasan_save_stack+0x30/0x50
>  ? psi_group_change+0x381/0x740
>  ? __pfx_sched_clock_cpu+0x10/0x10
>  ? save_fpregs_to_fpstate+0xc4/0x2c0
>  ? finish_task_switch.isra.0+0x1de/0xac0
>  ? __schedule+0xf62/0x42c0
>  ? __pfx___schedule+0x10/0x10
>  ? __pfx___irq_work_queue_local+0x10/0x10
>  ? shrink_node+0x626/0x31e0
>  shrink_node+0x626/0x31e0
>  ? ring_buffer_unlock_commit+0x11d/0x5c0
>  ? kswapd_clear_hopeless+0xa0/0x150
>  ? __pfx_shrink_node+0x10/0x10
>  ? 0xffffffffc0000095
>  do_try_to_free_pages+0x255/0x13b0
>  ? ring_buffer_unlock_commit+0x11d/0x5c0
>  ? reclaim_high+0x10a/0x1b0
>  try_to_free_mem_cgroup_pages+0x1f9/0x5a0
>  ? __pfx_try_to_free_mem_cgroup_pages+0x10/0x10
>  ? irqentry_exit+0xc6/0x670
>  reclaim_high+0x10a/0x1b0
>  ? __pfx_reclaim_high+0x10/0x10
>  ? process_one_work+0x5ff/0x1030
>  ? __pfx_high_work_func+0x10/0x10
>  process_one_work+0x6e2/0x1030
>  ? __pfx___schedule+0x10/0x10
>  ? __pfx_process_one_work+0x10/0x10
>  worker_thread+0x422/0xbb0
>  ? __pfx_worker_thread+0x10/0x10
>  kthread+0x2cd/0x3a0
>  ? recalc_sigpending+0x15c/0x200
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x368/0x590
>  ? __pfx_ret_from_fork+0x10/0x10
>  ? __switch_to+0x588/0xf50
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1a/0x30
>  </TASK>
> 
> Fixes: e4dde56cd208 ("mm: multi-gen LRU: per-node lru_gen_folio lists")
> Fixes: 5da3bfa029d6 ("cgroup: use separate rstat trees for each subsystem")
> Cc: stable@vger.kernel.org
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
> Acked-by: Muchun Song <muchun.song@linux.dev>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

-- 
Michal Hocko
SUSE Labs
