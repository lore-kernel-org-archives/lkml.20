Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178493;
	b=T5+S/QYctu9hiqL0rx3d7nu3fae9lGhx0d5Jf4v4vffW2RQCPE8L61sVRmv5uOKEaucD
	 f0schGgvOI2pEpzd/cnlI6OUW4wbDosphaKKGPKY94L5kVkXzZJMazusLNLyYG95oU+yy
	 yCNWSiUFX8Plv8Cp2cqqjM300lyACx7bzNLybMa8Mq6XRt5Y6Jc2/+MnkpWTnBDCp7de+
	 VDhM+lh3HDHZ5cyI202j/+2HVVm6RHUUMHPycrUTSKNCJS0Hb27otUoXL/LJEVOZig3TU
	 +f98eBWaZ45TfbOB5puaaDDj7GS76dNf8Ts6GOjRbDH5SYFrP+TpKQl4qHdHhFK89sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178493;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FB2zn0ztxU0bAbgb4l4L6i5REO5Iim8clUozCOhgJ6s=;
	b=ePQWZff6/RVr6jzaHhIZpO01ITKHdoWzaMb46Uqg6rm55h2Z0hUcPD88g68oHoDT5tAE
	 MXw9s5N4c307dkla5uUn3W6E0uQs8jvhaxlNwy+4Q6hxQiS0LzWVzAwQWY0FFHyYzBsh1
	 UANTNJNPIIH1SWTHceVbtWyyMnd1Y1MWZPN3jl9Dp6zsLluaQnh6akVTAacsY0Yfo7uJ1
	 NGEFGUJu+PnN2fyoKungaEZcvYaXujN347ha0LM7AdYOnNygTDJCT0TLuYvYpKyekRiTJ
	 fiNTI9nNfajfDXTy+uWxF86Obc1FXdQXyLqn6a+LxWZ1seiInRuMwt2XqKcLLDG4wGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZwkICJjx;
	arc=none smtp.remote-ip=91.218.175.143
Received: from mta0.migadu.com (out-143.mta0.migadu.com [91.218.175.143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5433B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5433B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZwkICJjx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PYXfsEwJO7PgBKy4a6fiWmbY2+1sqdlIQEJumSVKJoQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793178488; v=1; x=1793783288;
 b=ZwkICJjxV7QwU2t4RiTh5eI6NXxuJtlwspYq+RuauGc39cAPzgXZXC7e8pt6aKiv28GuNuB7
 PWiBiQYjH3szZbjXSg6HmsTr2oXmzUashLTJxc8w17L2VRsswe5EAZSZETKCU3bQyXuhiPSX7hO
 pcWj+NQJiIoQ9o70E3+cU2Ao=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id a6d4cf88f19a13c4;
	Wed, 28 Oct 2026 09:08:08 +0000
X-Mizu-Trace-ID: a6d4cf88f19a13c4
X-Migadu-Flow: FLOW_OUT
From: Hui Zhu <hui.zhu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: teawater <zhuhui@kylinos.cn>
Subject: [PATCH] mm/compaction: annotate data race for zone->free_area[order].nr_free
Date: Wed, 28 Oct 2026 17:07:47 +0800
Message-ID: <20261028090747.68086-1-hui.zhu@linux.dev>
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

From: teawater <zhuhui@kylinos.cn>

KCSAN reports a data-race on nr_free which also exists on mainline:

  BUG: KCSAN: data-race in fast_isolate_freepages+0x284/0x1550 mm/compaction.c:1589

  race at unknown origin, with read to 0xffff9894ff3dcb60 of 8 bytes by task 179078 on cpu 12:
   fast_isolate_freepages+0x284/0x1550 mm/compaction.c:1589
   isolate_freepages+0x52/0x650 mm/compaction.c:1722
   compaction_alloc_noprof+0x36e/0x3e0 mm/compaction.c:1850
   compaction_alloc+0x21/0x30 mm/compaction.c:1880
   migrate_folio_unmap+0x7f/0x820 mm/migrate.c:1177
   migrate_pages_batch+0x37e/0x1200 mm/migrate.c:1762
   migrate_pages_sync+0xce/0x560 mm/migrate.c:1928
   migrate_pages+0x8c6/0xc20 mm/migrate.c:2037
   compact_zone+0x539/0x10b0 mm/compaction.c:2660
   compact_zone_order+0x1b8/0x230 mm/compaction.c:2795
   try_to_compact_pages+0x20b/0x630 mm/compaction.c:2851
   __alloc_pages_direct_compact+0x98/0x2b0 mm/page_alloc.c:3722
   __alloc_pages_slowpath.constprop.0+0x452/0xdf0 mm/page_alloc.c:4401
   __alloc_pages_noprof+0x28a/0x2d0 mm/page_alloc.c:4794
   alloc_pages_mpol_noprof+0x1b1/0x470 mm/mempolicy.c:2270
   alloc_pages_noprof+0x7a/0xe0 mm/mempolicy.c:2347
   io_mem_alloc_compound io_uring/io_uring.c:2848 [inline]
   io_pages_map+0xb9/0x330 io_uring/io_uring.c:2892
   io_allocate_scq_urings+0x231/0x300 io_uring/io_uring.c:3933
   io_uring_create+0x29c/0x9c0 io_uring/io_uring.c:4091
   io_uring_setup+0xb6/0x100 io_uring/io_uring.c:4203
   __do_sys_io_uring_setup io_uring/io_uring.c:4230 [inline]
   __se_sys_io_uring_setup io_uring/io_uring.c:4224 [inline]
   __x64_sys_io_uring_setup+0x66/0xe0 io_uring/io_uring.c:4224
   x64_sys_call+0x1816/0x1d90 arch/x86/include/generated/asm/syscalls_64.h:426
   do_syscall_x64 arch/x86/entry/common.c:51 [inline]
   do_syscall_64+0x70/0x2a0 arch/x86/entry/common.c:81
   entry_SYSCALL_64_after_hwframe+0x76/0xe0

  value changed: 0x00000000000002f4 -> 0x00000000000002f5

nr_free is only updated with zone->lock held, but fast_isolate_freepages()
and fast_find_migrateblock() read it locklessly to skip an order that has
no free pages.  page_alloc.o is excluded from KCSAN, so the writer is not
instrumented and the report is of unknown origin.

The race is benign: a stale zero only skips the order for this round, and
a stale non-zero just finds an empty MIGRATE_MOVABLE freelist under the
lock.  Annotate both reads with data_race(), following commit
af1c31acc853 ("mm/vmstat: annotate data race for zone->free_area[order].nr_free").

No functional change intended.

Signed-off-by: teawater <zhuhui@kylinos.cn>
---
 mm/compaction.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index f1b2060eb2016..499ec7ceaa3ed 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1601,7 +1601,11 @@ static void fast_isolate_freepages(struct compact_control *cc)
 		unsigned int order_scanned = 0;
 		unsigned long high_pfn = 0;
 
-		if (!area->nr_free)
+		/*
+		 * Access to nr_free is lockless as it is only a hint; a stale
+		 * value is harmless. Use data_race to avoid KCSAN warning.
+		 */
+		if (!data_race(area->nr_free))
 			continue;
 
 		spin_lock_irqsave(&cc->zone->lock, flags);
@@ -2031,7 +2035,11 @@ static unsigned long fast_find_migrateblock(struct compact_control *cc)
 		unsigned long flags;
 		struct page *freepage;
 
-		if (!area->nr_free)
+		/*
+		 * Access to nr_free is lockless as it is only a hint; a stale
+		 * value is harmless. Use data_race to avoid KCSAN warning.
+		 */
+		if (!data_race(area->nr_free))
 			continue;
 
 		spin_lock_irqsave(&cc->zone->lock, flags);
-- 
2.43.0

