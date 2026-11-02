Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607580;
	b=TvbPZ7T1bCpnvR4AD8GLSALi0Ww3ZwtDRQ45wbSYHWu2KCuHv7lB3Rs/eGqfVQ/NW6Ow
	 yLMDs/fdX27DACXvAItB7Q4020cRgYRO+bx7d47Y4N2/q1GfF7S65IfgI2vJsSCKatAjk
	 Q9aiMrLDxYRUu129HzN5BoUzIVL5gTrXl2yERlhHqiIUkgQWjqvdXswxsoq3PaBzTCism
	 6U25btoUA52tJNCP5mcRr3gU1+vlpoO7oABB/ZLgA/3Ayz5LmIwvbjBfk4IpuVTlqaZSY
	 fhlYy+WmupAmc+zGGJYPut152Kr8FvSbBNLU1C3r/b2zjz62IpeSOZNE/NEO7H3kj9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607580;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6LIgKMD8dHTd4WojjokCcwg495C76eo9u3xZtsqzS+k=;
	b=MPsqa+R2NdipF+klEnMZ4fYT5E7UPcnQUM3zcf9I1ETJ8tKbLG3gt7neyu9gOgBfAvt+
	 42yhUhgvBsLmci++OsqkqFfms0s99N5FSRdKH1oOcArY7P4pjYBUDvYg0UGBYPqajirZs
	 T3aO8MrCmEtVAGwxn4A5HkPJWxbUpfIx7qJR/8tr4RVr6U5izNzi0NaxFnzT1NiUHaHXz
	 RTO+z0lNz/P0VhY7ickjUtE3m9Cc7F+aLZvToP9dKqPphIa8atWSykW90TX809mSPX8Lz
	 psj0oIw6tNzaHhy91LhQj/yckRTnOE227FE4fAzOmBUEu4AWAjDL9QGv/SrbkTwkNNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.163
Received: from mta0.migadu.com (out-163.mta0.migadu.com [91.218.175.163])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EE8606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2EE8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EBKM40GcqovOdTmepBxoC9IiuiPwdTEdquc/inXuQmU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793607576; v=1; x=1794212376;
 b=AZDzOl1WlM0ZM+HlRBWP8R2eySrKpGJIpSlS84qhwFCPdwO3z0lg0x+ioEPVsR71T3wegNd2
 FCRPfwrNebKHsirn2PZKLgRXt8rmNSW5PyoK2LjoDTv+I5vIqg5MzMEhk1VHm5VDo0BHzEb0piK
 Yt4ws4hq3JjvhVFChcDlxgy8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 684001e98352b0ca;
	Mon, 02 Nov 2026 08:19:36 +0000
X-Mizu-Trace-ID: 684001e98352b0ca
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
Cc: Hui Zhu <zhuhui@kylinos.cn>,
	stable+noautosel@kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v3] mm/compaction: annotate data race for zone->free_area[order].nr_free
Date: Mon,  2 Nov 2026 16:19:18 +0800
Message-ID: <20261102081919.80625-1-hui.zhu@linux.dev>
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
af1c31acc853 ("mm/vmstat: annotate data race for zone->free_area[order].nr_free"),
and say at each site why both stale directions are harmless.

No functional change intended.

Fixes: 70b44595eafe ("mm, compaction: use free lists to quickly locate a migration source")
Fixes: 5a811889de10 ("mm, compaction: use free lists to quickly locate a migration target")
Cc: stable+noautosel@kernel.org # KCSAN annotation only, no functional change
Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Acked-by: Zi Yan <ziy@nvidia.com>
---
Changelog:
v3:
Reword both comments to explain why a stale read is harmless (Vlastimil).
v2:
Real name in Signed-off-by, add Fixes: and Cc: stable+noautosel tags.

 mm/compaction.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index f1b2060eb2016..426563acf7acf 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1601,7 +1601,12 @@ static void fast_isolate_freepages(struct compact_control *cc)
 		unsigned int order_scanned = 0;
 		unsigned long high_pfn = 0;
 
-		if (!area->nr_free)
+		/*
+		 * Opportunistic lockless check.  A false non-zero is fine, we
+		 * inspect the freelist under the lock.  A false zero is fine,
+		 * we just miss this order.
+		 */
+		if (!data_race(area->nr_free))
 			continue;
 
 		spin_lock_irqsave(&cc->zone->lock, flags);
@@ -2031,7 +2036,12 @@ static unsigned long fast_find_migrateblock(struct compact_control *cc)
 		unsigned long flags;
 		struct page *freepage;
 
-		if (!area->nr_free)
+		/*
+		 * Opportunistic lockless check.  A false non-zero is fine, we
+		 * inspect the freelist under the lock.  A false zero is fine,
+		 * we just miss this order.
+		 */
+		if (!data_race(area->nr_free))
 			continue;
 
 		spin_lock_irqsave(&cc->zone->lock, flags);
-- 
2.43.0

