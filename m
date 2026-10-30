Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793328943;
	b=q4CPYbJUrjHQg+MmO0+PQweaT1KqqjeeRQ8UgY2ZGEVm+54G2AuB4oQt/SWSCQXym2Ap
	 EP9iJ2FjlDyJnsOooemd6mdpcglDbwGNsKH/cdstegqnKW1YAPsCV3gA+iKmmzf0JbBvX
	 DA9GM/tZgQFbUhxijMQytK4nv3tAQ3o6CYmAh/Rnjk4eq8lizz34gJfEta45XwYodirHb
	 TzO+UDUFA6/kanLYHIjnsQDBKVC6bf+4VmczdZq5bps5S6JPmR/+MrD5VVf3YWSfYeBEd
	 ApcmpXJaH4xqYd0Ho3RlViymH98O9SjSWAS6ClzFs9DYwBFsgHQ1b0D0pLNGvqMXSpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793328943;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pUCbReckSqEr12tJBWbX35Dm/JKcttu5DEw0fkc69DI=;
	b=EkhO72/bHHeQpm0jaKlHRUtF80tt3meq/gAdSze53BIXgauu6avYCTaH9sXrdx8VqsEN
	 5x2Ox6iTj+G831CYW9NYyxqOx0s4mmjT1P7xz9xwhSRoiqyomQ3eJYtLDvjt0OXDc1Fug
	 tOFEWv5uH7WI9VYY/PzGDkEP256/Bk/6kCYt0KiZDVcRBW4w23DMZKSku+HxnXThLosdJ
	 hVqB0R8WwZTCPJX04MU3tBuUNwoxq4xL2Y563q6zx/QfyGkYsXS8PiAV4Q/G/mpv85ZHO
	 EMJ4wWmzgKtKar0NCnNbE5OR1ELV3WfeVL7OdS9SN+bL8//EG9tXIjM3bX1Oo8UXUPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZLPuw5EX;
	arc=none smtp.remote-ip=95.215.58.180
Received: from mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A342C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A342C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZLPuw5EX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sAQYKG0X+cRq7vrg7+ttEQx6a2fpFc91J/Dodm9J4/w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793328939; v=1; x=1793933739;
 b=ZLPuw5EXMctc9GYJweSlQAVVeQcklAr1ydzoP1OgL9PNQ1GMrdrfZh319f8dRhKqxrXYbFmu
 oG5oSwUsozWbD77rPDJ1+F3Q+Cq16azVhE4HxwZKtGOsrXdIs9A463tt6WRzHC7N1WLSsre3BLj
 O3TzgJQEXeStP+MhnI3apFGE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 392c1607db233a43;
	Fri, 30 Oct 2026 02:55:39 +0000
X-Mizu-Trace-ID: 392c1607db233a43
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
Subject: [PATCH v2] mm/compaction: annotate data race for zone->free_area[order].nr_free
Date: Fri, 30 Oct 2026 10:55:07 +0800
Message-ID: <20261030025507.115248-1-hui.zhu@linux.dev>
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
af1c31acc853 ("mm/vmstat: annotate data race for zone->free_area[order].nr_free").

No functional change intended.

Fixes: 70b44595eafe ("mm, compaction: use free lists to quickly locate a migration source")
Fixes: 5a811889de10 ("mm, compaction: use free lists to quickly locate a migration target")
Cc: stable+noautosel@kernel.org # KCSAN annotation only, no functional change
Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Acked-by: Zi Yan <ziy@nvidia.com>
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

