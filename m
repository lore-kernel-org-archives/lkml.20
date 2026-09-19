Received: from mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0416D2248AF
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789826036; cv=none; b=roW3ayBsVdVIcBCMZRWPpE2oh2mjfO3vBZE9dQUvMECFUJNN9Qk4Hun0KiywBKzDXNoBRSmvfo7LgZTzzSleB2rsyedg1uqgELr/Y6Ci1ek0efvV5RKolEasVWFQmS3+3L1znLBiJFR66Zd4LJdkjkbE0eG7Yi1J2bXL1SlVSmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789826036; c=relaxed/simple;
	bh=ulFUDD8oGZETsKoDZVeS8UP/2Tko9UtaPMINXvCETkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=De0R9Exam/Zyu/MsPuWRPzM7MIYVg85KiRJFIxVtHSlJfv6HsCg1NACrktHAZSm7tYoAh7biANHEgvoLLMZcjwRs0xnkmGMm2m24lf87usz2Ok26sAspQIy+ZeH77qaVtXePdw20FRyE7aPdjg3qOv+tUWT+jgs1zOtoQQNh3jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AAud+wk9; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AAud+wk9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ulFUDD8oGZETsKoDZVeS8UP/2Tko9UtaPMINXvCETkE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789826032; v=1; x=1790430832;
 b=AAud+wk9BYaenQoL/FFK9pNb5yYL+wdD3itOwNh0fu+/foyQnSwPo90CtGCy/x3Yr6aW8L9Y
 MQ/8m4163aGeDpMrYA6hE1z6P+HrHaZL+OvfnLGgMLJFojq57JDaiAAs6mFfQF49ZHDO47Xptk2
 Ym47octg/p003kFy1g0wVyDk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f6f7a880625134d2;
	Sat, 19 Sep 2026 13:53:52 +0000
X-Mizu-Trace-ID: f6f7a880625134d2
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>
Cc: Priyanshu Kumar <priyanshukumarpu@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH v2 1/3] mm: Remove unused exact_nid parameter from memmap_alloc()
Date: Sat, 19 Sep 2026 21:53:25 +0800
Message-ID: <20260919135327.74089-2-kaitao.cheng@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260919135327.74089-1-kaitao.cheng@linux.dev>
References: <20260919135327.74089-1-kaitao.cheng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

Commit ffe55393137c ("mm/sparse: remove sparse buffer pre-allocation
mechanism") removed sparse_buffer_init(), which was the only caller of
memmap_alloc() that passed true for exact_nid.

All remaining callers pass false, leaving the exact-node allocation
branch unreachable. Remove the exact_nid parameter and unconditionally
use memblock_alloc_try_nid_raw().

This has no functional impact.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 mm/mm_init.c        | 14 ++++----------
 mm/mm_init.h        |  4 ++--
 mm/sparse-vmemmap.c |  2 +-
 mm/sparse.c         |  2 +-
 4 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 9ce6060de06d..af3c8a2cc91b 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1596,7 +1596,7 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
 }
 
 void __init *memmap_alloc(phys_addr_t size, phys_addr_t align,
-			  phys_addr_t min_addr, int nid, bool exact_nid)
+			  phys_addr_t min_addr, int nid)
 {
 	void *ptr;
 
@@ -1604,14 +1604,8 @@ void __init *memmap_alloc(phys_addr_t size, phys_addr_t align,
 	 * Kmemleak will explicitly scan mem_map by traversing all valid
 	 * `struct *page`,so memblock does not need to be added to the scan list.
 	 */
-	if (exact_nid)
-		ptr = memblock_alloc_exact_nid_raw(size, align, min_addr,
-						   MEMBLOCK_ALLOC_NOLEAKTRACE,
-						   nid);
-	else
-		ptr = memblock_alloc_try_nid_raw(size, align, min_addr,
-						 MEMBLOCK_ALLOC_NOLEAKTRACE,
-						 nid);
+	ptr = memblock_alloc_try_nid_raw(size, align, min_addr,
+					 MEMBLOCK_ALLOC_NOLEAKTRACE, nid);
 
 	if (ptr && size > 0)
 		page_init_poison(ptr, size);
@@ -1639,7 +1633,7 @@ static void __init alloc_node_mem_map(struct pglist_data *pgdat)
 	end = ALIGN(pgdat_end_pfn(pgdat), MAX_ORDER_NR_PAGES);
 	size =  (end - start) * sizeof(struct page);
 	map = memmap_alloc(size, SMP_CACHE_BYTES, MEMBLOCK_LOW_LIMIT,
-			   pgdat->node_id, false);
+			   pgdat->node_id);
 	if (!map)
 		panic("Failed to allocate %ld bytes for node %d memory map\n",
 		      size, pgdat->node_id);
diff --git a/mm/mm_init.h b/mm/mm_init.h
index c9fc35e7e9f1..a8ed5c20851b 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -31,8 +31,8 @@ static inline void clear_zone_contiguous(struct zone *zone)
 
 void memblock_free_pages(unsigned long pfn, unsigned int order);
 
-void *memmap_alloc(phys_addr_t size, phys_addr_t align, phys_addr_t min_addr,
-		int nid, bool exact_nid);
+void *memmap_alloc(phys_addr_t size, phys_addr_t align,
+		   phys_addr_t min_addr, int nid);
 
 void memmap_init_range(unsigned long size, int nid, unsigned long zone,
 		unsigned long start_pfn, unsigned long zone_end_pfn,
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 96506f594924..dbd1ebe93fe9 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -62,7 +62,7 @@ void __ref *vmemmap_alloc_block(unsigned long size, int node)
 		}
 		return NULL;
 	} else
-		return memmap_alloc(size, size, __pa(MAX_DMA_ADDRESS), node, false);
+		return memmap_alloc(size, size, __pa(MAX_DMA_ADDRESS), node);
 }
 
 static void * __meminit altmap_alloc_block_buf(unsigned long size,
diff --git a/mm/sparse.c b/mm/sparse.c
index b75921c622ed..36692b1dd733 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -215,7 +215,7 @@ struct page __init *__populate_section_memmap(unsigned long pfn,
 {
 	const unsigned long size = PAGE_ALIGN(sizeof(struct page) * PAGES_PER_SECTION);
 
-	return memmap_alloc(size, size, __pa(MAX_DMA_ADDRESS), nid, false);
+	return memmap_alloc(size, size, __pa(MAX_DMA_ADDRESS), nid);
 }
 #endif /* !CONFIG_SPARSEMEM_VMEMMAP */
 
-- 
2.54.0 (Apple Git-157)

