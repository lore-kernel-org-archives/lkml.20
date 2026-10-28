Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212542;
	b=xZwmKusBmHUvF9+GxqdQMdldJvN/bnbhytClBY1zJBKg1zWETl9YVOgR568uuzm8gKw7
	 LxOOwcH9j42i+9RvLcwgnc7FIx9slxhvPI+WN5qo33Wj+ufx/h3OYiuBupEQmBdngkHLf
	 hQ/WtkIWp7Sz0RdD0iPRBTYrT1obW0Sv4gE4g8u7+Jw+0gxNZlerwnbipxWzyCX9YK3JR
	 cXwO5wCa0xzGC39bw+eBIUL7f29EqqxKPf+Tg1QmYcrOKYZePlY0hZcAiEyIUra5sJWcv
	 K3FDFOy3Vu8dVEcDpTTMIpLRB/St4Se9HGXVi8hs0wXYgw+mMvkv+waBLeZiQScj8cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=4eOYqPDRiAJM8WSK8cz84JY8oCFHe+0xhzQ90c4msyE=;
	b=iu2Rf+yAMUTDm7G75ZayK/2hzpB8kaKLNiruQWxQ2hvvMdKwta47H+ce3jFZ4ux3k/E/
	 fZtex65XDPFRPs87ct8eD7xOydIpb8KFH32oAuQ/Nfw92sMRMZq+wexvGMTU5gx6cd6ac
	 OQ5k+bXPnVAzuePOZT5u0Y4hm1g4DNDDYYtO8lnFasvCmfQx2Qj2FK/xTpSeZlqUTNYQd
	 PXR7yk9dyPjREuNdyrcQOGjDb3g2WTjXa+ieCKoW09ffOhpll9yOQcclhJ4bk050CiaiV
	 2TPm3V66YZJSis/tt2JsCl0JFfRYuCchD6ca6/mYDKJFPCKi7gHkRUBUSy6rwxtpwqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a1TryU1T;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F57A606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F57A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a1TryU1T
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso1067583a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793212540; x=1793817340; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4eOYqPDRiAJM8WSK8cz84JY8oCFHe+0xhzQ90c4msyE=;
        b=a1TryU1TSznoV84u4y29fQwTDKkv1dqZz8H+RzjPIrQ1iAQlLi+S3JcmJnc3jw+Lhs
         KRdN4M6DnAkIFIbJMLI2qMMOS/v4EspTnzZyN/1SZtqXXw3y/wdPABU5Djf+gfGU2DFW
         Q9dxFdsxb0sEC2hyXe5s0MmdYTZYZDhijDlF+OSd0fUMr7qbd8yxQ4eoSXhxDL6yII3Y
         MJsGFUpZYkCOaI9LBDLfqM56qCYAWDHOES67ka8tGkGl5LaWlhYeX2l8u+zz+uN9IcmF
         KavuU4nNRYKG9fklRirUOPEwdTxCDZc/IaB5WabCZudg9QYPs4bshdSAuFekarjeUDLZ
         DmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212540; x=1793817340;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4eOYqPDRiAJM8WSK8cz84JY8oCFHe+0xhzQ90c4msyE=;
        b=IvyGgXlyAVnVFPkhgmP7vixjVmzpux4ALdXFlnrzONDrkem4ozlfTrlJx3Mo4ZHPmA
         ygIPGnxC0V26gT4uLt9jmezEK95WdE+n57dnyRpHRmrMAVanUHFHR/KfQlWzucOZy3QL
         zDeqTxROMZ+BiayDHP5z+RDhd/LPCbtwD8/SMlqTUoTKAESXY16QiAcu6pre2Bp6ImAJ
         C+tGCAFhCFTpYBPApuusgF7O2QM9K/r3INu48G/1G6dfnNsusayosAArahjyJfx1Cjqu
         f1/rEM6myOjxV8L6aa+OrmjuquWjlDPj9p32lZkCeAZGy6z2+w3yiCDKtPvcAUUrcCNe
         xtwA==
X-Forwarded-Encrypted: i=1; AKwUvByqS/bknUQ8E8bBpeAxAlkffVIcXK2o+uU7zC4zGiQmy9hI+6i5e+IFOj6X/vK6pTcBGGUiafvgxjCGQxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNB2Z4CovxFxYdgkfwZEf6MrAwiowSJtsGXcHUmgoy76nT5OlS
	bgc1vllY30iMIZXOxM3JxxxWEvuwPyisgyc2lbxbaZmqyX1gMGOMVB0Pck2LHmLk5MYUIDGzFkS
	uhBlHogll1CaBgfsY5w==
X-Received: from pgcgn5-n2.prod.google.com ([2002:a05:6a02:6a05:20b0:cc7:cb66:8df9])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5252:b0:3a0:516d:9f87 with SMTP id 98e67ed59e1d1-3ae580a9d39mr2315489a91.13.1793212540177;
 Wed, 28 Oct 2026 11:35:40 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:35:37 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028183537.605854-1-tjmercier@google.com>
Subject: [PATCH v2] mm: memcontrol: fix NULL pointer deref from
 high_work_func() on dying memcg
From: "T.J. Mercier" <tjmercier@google.com>
To: hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, muchun.song@linux.dev
Cc: zhengqi.arch@bytedance.com, akpm@linux-foundation.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

When memory.high is exceeded in non-task context, try_charge_memcg()
schedules memcg->high_work without taking a reference on the memcg, and
high_work_func() invokes reclaim_high() without pinning the memcg.

cancel_work_sync(&memcg->high_work) only runs at the end of teardown in
mem_cgroup_css_free(), so high_work_func() can start or still be running
reclaim_high() after mem_cgroup_css_released() or shrink_many() has
called lru_gen_release_memcg() and unhashed lruvec->lrugen.list. If
reclaim tries to rotate the memcg, lru_gen_rotate_memcg() dereferences a
NULL pprev pointer.

With obj_cgroup reparenting, introduced in commit bf4f059954dc ("mm:
memcg/slab: obj_cgroup API"), objects charged to a child memcg are
reparented to its parent in mem_cgroup_css_offline() instead of holding
a reference on the child until uncharged. Subsequent uncharges of those
objects go to the parent, which can leave the child's memory use
permanently above its high limit, so any later charge on the offlined
memcg in non-task context schedules high_work.

This problem was first exposed when commit e4dde56cd208 ("mm: multi-gen
LRU: per-node lru_gen_folio lists") introduced the memcg LRU, and was
later widened from kernel memory to LRU folios when
commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of dying
memory cgroup for LRU folios") converted LRU folios to use obj_cgroup
reparenting.

Fix this by acquiring a reference with css_tryget_online() in
high_work_func() before calling reclaim_high(), and by resetting
memory.high and swap.high to PAGE_COUNTER_MAX in
mem_cgroup_css_offline() so that charges via references on an offlined
memcg do not trigger high_work on the dead child or skip checking live
ancestors in try_charge_memcg().

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 27 Comm: kworker/1:0 Tainted: G    B   W           7.3.0-rc5-g2bba28e98578 #284 PREEMPT(full)
Tainted: [B]=BAD_PAGE, [W]=WARN <- Taint from lru_gen_rotate_memcg() VM_WARN_ON_ONCE
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-debian-1.17.0-1 04/01/2014
Workqueue: events high_work_func
RIP: 0010:lru_gen_rotate_memcg+0x1a3/0xe90
Call Trace:
 <TASK>
 ? read_ctrl_pos+0x22f/0x3f0
 shrink_lruvec+0x16cb/0x1b80
 ? ret_from_fork_asm+0x1a/0x30
 ? lapic_next_event+0x15/0x20
 ? clockevents_program_event+0x2bb/0x6f0
 ? lapic_next_event+0x15/0x20
 ? __pfx_shrink_lruvec+0x10/0x10
 ? __pfx_clockevents_program_event+0x10/0x10
 ? _raw_spin_lock+0x84/0xe0
 ? __pfx__raw_spin_lock+0x10/0x10
 ? kasan_save_stack+0x30/0x50
 ? psi_group_change+0x381/0x740
 ? __pfx_sched_clock_cpu+0x10/0x10
 ? save_fpregs_to_fpstate+0xc4/0x2c0
 ? finish_task_switch.isra.0+0x1de/0xac0
 ? __schedule+0xf62/0x42c0
 ? __pfx___schedule+0x10/0x10
 ? __pfx___irq_work_queue_local+0x10/0x10
 ? shrink_node+0x626/0x31e0
 shrink_node+0x626/0x31e0
 ? ring_buffer_unlock_commit+0x11d/0x5c0
 ? kswapd_clear_hopeless+0xa0/0x150
 ? __pfx_shrink_node+0x10/0x10
 ? 0xffffffffc0000095
 do_try_to_free_pages+0x255/0x13b0
 ? ring_buffer_unlock_commit+0x11d/0x5c0
 ? reclaim_high+0x10a/0x1b0
 try_to_free_mem_cgroup_pages+0x1f9/0x5a0
 ? __pfx_try_to_free_mem_cgroup_pages+0x10/0x10
 ? irqentry_exit+0xc6/0x670
 reclaim_high+0x10a/0x1b0
 ? __pfx_reclaim_high+0x10/0x10
 ? process_one_work+0x5ff/0x1030
 ? __pfx_high_work_func+0x10/0x10
 process_one_work+0x6e2/0x1030
 ? __pfx___schedule+0x10/0x10
 ? __pfx_process_one_work+0x10/0x10
 worker_thread+0x422/0xbb0
 ? __pfx_worker_thread+0x10/0x10
 kthread+0x2cd/0x3a0
 ? recalc_sigpending+0x15c/0x200
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x368/0x590
 ? __pfx_ret_from_fork+0x10/0x10
 ? __switch_to+0x588/0xf50
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>

Fixes: e4dde56cd208 ("mm: multi-gen LRU: per-node lru_gen_folio lists")
Cc: stable@vger.kernel.org
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
Changes since V1 (https://lore.kernel.org/all/20261023222313.3979455-1-tjmercier@google.com/)
- Switch to Fixes: e4dde56cd208 ("mm: multi-gen LRU: per-node lru_gen_folio lists")
  from Fixes: f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of dying memory cgroup for LRU folios")
  per Muchun Song.
- Reorder and update commit message content to describe reparenting
  separately from the commits that exposed and then widened the problem.
- Trim the backtrace a bit.

 mm/memcontrol.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index a05d9a8baa1b..84f4a8fd4d16 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2457,7 +2457,10 @@ static void high_work_func(struct work_struct *work)
 	struct mem_cgroup *memcg;
 
 	memcg = container_of(work, struct mem_cgroup, high_work);
+	if (!css_tryget_online(&memcg->css))
+		return;
 	reclaim_high(memcg, MEMCG_CHARGE_BATCH, GFP_KERNEL);
+	css_put(&memcg->css);
 }
 
 static void high_irq_work_func(struct irq_work *work)
@@ -4463,6 +4466,8 @@ static void mem_cgroup_css_offline(struct cgroup_subsys_state *css)
 
 	page_counter_set_min(&memcg->memory, 0);
 	page_counter_set_low(&memcg->memory, 0);
+	page_counter_set_high(&memcg->memory, PAGE_COUNTER_MAX);
+	page_counter_set_high(&memcg->swap, PAGE_COUNTER_MAX);
 
 	zswap_memcg_offline_cleanup(memcg);
 

base-commit: 2bba28e98578de622ef307d00875aa8f8bca3d10
-- 
2.56.0.313.g2479322e68-goog

