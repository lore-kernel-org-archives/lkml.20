Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181975;
	b=l76YTQMArSqP8LtEJ32Xy4Kh12SgZFGDnevo3UKkkbTQjx5flpGC2yFQi4xK0Iuvn7Rn
	 b7KScEuPXPKrpg0259RJdCYERY5GkXhn9WnUV9lb6LXTy1J/cn9truAGqZLFI8Ud9vzuV
	 ZYFyUUraNTlCamsviP1TKiejwtp8yUShACW0X5VdCuIMVkvUK1cRgK+7ykwcQ1Z3Cy3RF
	 jc+dPbukeGYiIK8KPKwHH4+M6oPqfYV94hNQshTZ17oNPwgBJbeIMC8fvKAC3mO7Dgkqc
	 a3LG+MxVBcyHMWRoeH9BnHg9s/2ew6dl2ZWMH+eRofzab92HUcW7rD6JH+YOgpMmuPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181975;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gmHmsZMgq8R8AlD94kwTcgJuLE0oJANffXWy8BFPRM0=;
	b=3/UlbT00+eLC/S0hiKB/yk4Nqfpa2VQZL69Ekn4diR1tIPIDH4FO3qY8KPD3Lie0s+ix
	 V3DUg3DcmpVABj4EkJUxWlf+22Jl4DTc28tucW4z908QO3VpMC0dKXN/TVQEIl9yFO89f
	 UgQGZup0B+T8/ymNaBSbp0QSG6h5d9WJ4RfLJ/13jdJj4PLFlgpKRYE4H4v/OZR/aH+Vu
	 MFgnaQ40kNWYzpLbWUgW60TkWyqXJTpI7Kac7jZP96iQCyRyKgW2V33LFd4qS8Xxf46+/
	 iELvItchwEHBnMESZjNJAXxKQLD37H2/uc5IG5Iu3SWoOX0XZvWzEgTITfFyI3HSotQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PkESUUaY;
	arc=none smtp.remote-ip=91.218.175.179
Received: from mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113CE606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 113CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PkESUUaY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UZgn8pD2NttZaxDu84FvSOmqRpKSe97dXDTfaW/QOy0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793181971; v=1; x=1793786771;
 b=PkESUUaYNeEgTBCg3bqhiLTmfng13b+y1XRqa/W1GJUd5fuj0hKaChONfjcR+gMo9FExDunS
 dfb5LXN0e0xaP3RpB+WxqdF5pYUCicpDGqpUFURp/SDYdjLbZrMzyb2LDNdn8iYTM66qU1aJuXo
 O0tVOltEJQ8w/pNYccNdfzCQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 8bb92c80f9064327;
	Wed, 28 Oct 2026 10:06:11 +0000
X-Mizu-Trace-ID: 8bb92c80f9064327
X-Migadu-Flow: FLOW_OUT
From: Hui Zhu <hui.zhu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>
Subject: [PATCH] mm/vmstat: annotate data race in zone_page_state_snapshot()
Date: Wed, 28 Oct 2026 18:05:49 +0800
Message-ID: <20261028100549.70689-1-hui.zhu@linux.dev>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hui Zhu <zhuhui@kylinos.cn>

KCSAN reports a data-race on v6.6 which also exists on mainline:

BUG: KCSAN: data-race in zone_page_state_snapshot root/klinux/./include/linux/vmstat.h:232 [inline]
BUG: KCSAN: data-race in allow_direct_reclaim+0x150/0x290 root/klinux/mm/vmscan.c:6328

race at unknown origin, with read to 0xffff9e0575410740 of 1 bytes by task 209280 on cpu 15:
zone_page_state_snapshot root/klinux/./include/linux/vmstat.h:232 [inline]
allow_direct_reclaim+0x150/0x290 root/klinux/mm/vmscan.c:6328
throttle_direct_reclaim+0x1c4/0x480 root/klinux/mm/vmscan.c:6402
try_to_free_pages+0x177/0x590 root/klinux/mm/vmscan.c:6466
__perform_reclaim root/klinux/mm/page_alloc.c:3966 [inline]
__alloc_pages_direct_reclaim root/klinux/mm/page_alloc.c:3988 [inline]
__alloc_pages_slowpath.constprop.0+0x3b3/0xdf0 root/klinux/mm/page_alloc.c:4395
__alloc_pages_noprof+0x28a/0x2d0 root/klinux/mm/page_alloc.c:4794
alloc_pages_mpol_noprof+0x181/0x470 root/klinux/mm/mempolicy.c:2270
alloc_pages_noprof+0x7a/0xe0 root/klinux/mm/mempolicy.c:2347
io_mem_alloc_compound root/klinux/io_uring/io_uring.c:2848 [inline]
io_pages_map+0xb9/0x330 root/klinux/io_uring/io_uring.c:2892
io_allocate_scq_urings+0x231/0x300 root/klinux/io_uring/io_uring.c:3933
io_uring_create+0x29c/0x9c0 root/klinux/io_uring/io_uring.c:4091
io_uring_setup+0xb6/0x100 root/klinux/io_uring/io_uring.c:4203
__do_sys_io_uring_setup root/klinux/io_uring/io_uring.c:4230 [inline]
__se_sys_io_uring_setup root/klinux/io_uring/io_uring.c:4224 [inline]
__x64_sys_io_uring_setup+0x66/0xe0 root/klinux/io_uring/io_uring.c:4224
x64_sys_call+0x1816/0x1d90 root/klinux/./arch/x86/include/generated/asm/syscalls_64.h:426
do_syscall_x64 root/klinux/arch/x86/entry/common.c:51 [inline]
do_syscall_64+0x70/0x2a0 root/klinux/arch/x86/entry/common.c:81
entry_SYSCALL_64_after_hwframe+0x76/0xe0

value changed: 0xdd -> 0xb6

Reported by Kernel Concurrency Sanitizer on:
CPU: 15 PID: 209280 Comm: syz-executor.13 Tainted: G S ------- ---- 6.6.89+ #1250
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014

Found by KCSAN testing on an older kernel; the same race still exists on
mainline.

zone_page_state_snapshot() sums the per-cpu vm_stat_diff[] deltas of all
online CPUs with a plain load, while the allocation and free fast paths
update the local delta through this_cpu_cmpxchg() and friends.  Those are
inline asm, and page_alloc.o is excluded from KCSAN, so the writer is not
instrumented and the report is of unknown origin.

The race is benign: the function already documents that the result cannot be
exactly accurate, and every consumer is a reclaim or compaction heuristic
that tolerates an estimate.  Annotate the read with data_race(), following
commit af1c31acc853 ("mm/vmstat: annotate data race for
zone->free_area[order].nr_free").

No functional change intended.

Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
---
 include/linux/vmstat.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
index 5b31d8e7ae405..9df3587a29685 100644
--- a/include/linux/vmstat.h
+++ b/include/linux/vmstat.h
@@ -236,9 +236,15 @@ static inline unsigned long zone_page_state_snapshot(struct zone *zone,
 	long x = atomic_long_read(&zone->vm_stat[item]);
 
 #ifdef CONFIG_SMP
+	struct per_cpu_zonestat __percpu *pzstats = zone->per_cpu_zonestats;
 	int cpu;
+
 	for_each_online_cpu(cpu)
-		x += per_cpu_ptr(zone->per_cpu_zonestats, cpu)->vm_stat_diff[item];
+		/*
+		 * Access to vm_stat_diff is lockless as the result is only
+		 * an estimate. Use data_race to avoid KCSAN warning.
+		 */
+		x += data_race(per_cpu_ptr(pzstats, cpu)->vm_stat_diff[item]);
 
 	if (x < 0)
 		x = 0;
-- 
2.43.0

