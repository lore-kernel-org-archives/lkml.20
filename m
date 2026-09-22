Received: from mail-pj2-f18.google.com (mail-pj2-f18.google.com [74.125.227.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5EF35A3BF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047150; cv=none; b=VT5fww12GRV4NxMc8XNQaPOeI6XRgu19onUN55lAPTrjIOq3xJ1M/eldjISJ/x7hXoRtRCxLVm0g18ucqY2HRvN3aidxt9nOCCV0sxnXBaQJ5n43KRKKnZi0iExoBOgf2gwVjW2EN9p9axBJLs6VnkU857fx5Q2kvGG7+ElkmWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047150; c=relaxed/simple;
	bh=kT5dcCEWj8O3x+xAoQ/ruWurUEruOOzef8gVj6D7Abg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hm7TtUoYl3B7Mp4UoD8ZXuI4s0vhZE7PRPdPMHejt7DQlEs6HS/YkVzO70UdN71e+aFLx3AQf0KCEBOlBnPDCxOwextxYwFb5CavYQHauo2xnXHMYAjZbedAHFEQmLKLRFwg9KWs9wz6H6fM5M2CdHkn1R5WHQZ54zImIIvvEB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qy2n8JDz; arc=none smtp.client-ip=74.125.227.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qy2n8JDz"
Received: by mail-pj2-f18.google.com with SMTP id d9443c01a7336-2db22383fe8so23776305ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047148; x=1790651948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DotsY3IdEWc33WXgE/Lg7K7aGvGk/433kU16yh7bSOk=;
        b=qy2n8JDzIwzA/i+XHX2YfKxsYL0YPRLzNmidNj0m/v46SUZTXHeOGHGvK0a6mk54hi
         NEjJDVFZ66DmxTPbZX59mQeoh7Zm4/Mta+a0g4XQhe5SRNJ9xjKlD4zjlByeJIrSFxcV
         8o8/NR9zCdRvf2X8r92LOv+99rGxgvGlKZG5eYhm9Zpno5VbO+FM+tiRsODmwNf1UsZm
         M8CE+1PghHYx8kFIqrx6ZAUc1mDwAZX7MJaVxd/lmurHaDWiCsPJsAkH0hWz+xb2gLYB
         w4u6LRbgpI4eijFjtQ5Fs53nBdgk9JRYZ0UlJoZg8BBSIUBEhrt8dk6XbH+RQHyd9NCe
         tIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047148; x=1790651948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DotsY3IdEWc33WXgE/Lg7K7aGvGk/433kU16yh7bSOk=;
        b=llMwFZfDewj17yqMqkanpNed7YyP9PxEvUL/y6LHIGr0xS/7vxILoqOW1DlzYO8c7Q
         aExzg1xPJoElUdDTXgU+MmbO8C49vvfm6n414BioJprb5x3m2vcuXnssi4Z3MEbUoIRn
         /jPUArXCCc6WOANikc5pwodxOxPTH2UbK+VE4c8P5bNAZH+PuTr5Opu1LxoNAJ//noBx
         orCjIQAYO11xCak24G7RY2Wj53uoHBA+yc5bnO44kpOuUZSgxsR9XRinWQOAkpX8z/6I
         1FEr1Bk6LWnZtXCTWlbVF6n3VmFqx+fKMxYntZQeRXX9W2Qqss1IVVnZXuxoToqg52bA
         KbSg==
X-Forwarded-Encrypted: i=1; AKwUvBwbgHVJHCD53f3qNO+AaU9AGtsWvB2U882bAal1pRZevAk+F094RF/U4dkCbw2GVpiI39+oaldPLobR9Q0=@vger.kernel.org
X-Gm-Message-State: AFuF++kECOYHGoxOw4LhOhSPWfvcer7xU+dJoHQbkLLetA0hYiy3a50f
	tVIl6XQXHHkgjqrtxjQQTu4qqaJhFhIpTY9B2rF4w3W3zGzTFqQMJH0x
X-Gm-Gg: AYBFou10arb+0Egfp9ggf7ib9jP8AvheDNTeAagooTA0BgLsFrcCrOeqqdyDaRjshNc
	zFxKTkbQ/LCfGQwWZJt0JgjjWZhJZXCsCzwilrfo/ph/ixMEKmNSuXT1teyab9UTCu8FRnChtBZ
	m5xlZBKCv7NNgtPYC0S2fuQI4cAx1kZagDSu0s6a8wafTUk5WJXlYL6GGml1ED2xb/UtsF1KAJt
	skHOf/QuZ4g1A2KkzbuKKtXQM8SqLqiNGpOXY1qmtCpUAY+53FvRzVXQtpwrnuDvn6640Pht/hQ
	9kAKxf+uQ0IMjw028aC6rX70Fi9FeOwv6IkYJ4pq6o3T/pb00g9QwTpeRnAJGW1/k8co21PpQcb
	8N0cWwzAC7yCjelx4pA0lNmZhDSIxAyY5EEV/ZMVKslvRicxWd15QW9aVoKril7awe17PkMRCxt
	5vnr/bxhDGW/GXvdZb3RefE7p44NY/SIwRHGQuiNVFvb6iPE3sHI1CVjwUrwHf04wK0Dcyc/ioj
	iuYnNeoPMx+yoOcMmjamuIYfthm1Ue0HYtkNHzWVGvPEqzbO6B55h4BcCJmdjg=
X-Received: by 2002:a17:902:c945:b0:2db:8c12:6b03 with SMTP id d9443c01a7336-2ddb1ac976emr178237535ad.8.1790047147285;
        Mon, 21 Sep 2026 20:19:07 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129ad40sm1420226eec.12.2026.09.21.20.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:19:06 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	SJ Park <sj@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Alexander Potapenko <glider@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: fix typos in various comments
Date: Tue, 22 Sep 2026 11:18:43 +0800
Message-ID: <20260922031843.2857104-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling errors found by codespell in several mm source files:

- "aray" -> "array" in include/linux/mm.h
- "indiciate" -> "indicate" in include/linux/mm_types.h
- "aggresive" -> "aggressive" in include/linux/mm_types.h
- "progated" -> "propagated" in mm/huge_memory.c
- "Pressumably" -> "Presumably" in mm/hugetlb.c
- "fime" -> "time" in mm/hugetlb.c
- "farest" -> "farthest" in mm/list_lru.c
- "trivally" -> "trivially" in mm/madvise.c
- "atmost" -> "at most" in mm/memcontrol.c
- "splited" -> "split" in mm/memory-failure.c
- "appliable" -> "applicable" in mm/memory.c
- "incase" -> "in case" in mm/page_io.c
- "contigous" -> "contiguous" in mm/vmalloc.c
- "probablity" -> "probability" in mm/kfence/core.c
- "widnow" -> "window" in mm/damon/core.c
- "makrs" -> "marks" in mm/damon/core.c
- "possesss" -> "possesses" in mm/util.c

No functional changes.

Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
 include/linux/mm.h       | 2 +-
 include/linux/mm_types.h | 4 ++--
 mm/damon/core.c          | 4 ++--
 mm/huge_memory.c         | 2 +-
 mm/hugetlb.c             | 4 ++--
 mm/kfence/core.c         | 2 +-
 mm/list_lru.c            | 2 +-
 mm/madvise.c             | 2 +-
 mm/memcontrol.c          | 2 +-
 mm/memory-failure.c      | 2 +-
 mm/memory.c              | 2 +-
 mm/page_io.c             | 2 +-
 mm/util.c                | 2 +-
 mm/vmalloc.c             | 2 +-
 14 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 87feaa5a2..5b2215e24 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4501,7 +4501,7 @@ static inline void mmap_action_simple_ioremap(struct vm_area_desc *desc,
  * @desc: The VMA descriptor for the VMA requiring kernel pags to be mapped.
  * @start: The virtual address from which to map them.
  * @pages: An array of struct page pointers describing the memory to map.
- * @nr_pages: The number of entries in the @pages aray.
+ * @nr_pages: The number of entries in the @pages array.
  */
 static inline void mmap_action_map_kernel_pages(struct vm_area_desc *desc,
 		unsigned long start, struct page **pages,
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 939b5ea8c..6c21bab3b 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -759,7 +759,7 @@ static inline struct anon_vma_name *anon_vma_name_alloc(const char *name)
 /*
  * While __vma_enter_locked() is working to ensure are no read-locks held on a
  * VMA (either while acquiring a VMA write lock or marking a VMA detached) we
- * set the VM_REFCNT_EXCLUDE_READERS_FLAG in vma->vm_refcnt to indiciate to
+ * set the VM_REFCNT_EXCLUDE_READERS_FLAG in vma->vm_refcnt to indicate to
  * vma_start_read() that the reference count should be left alone.
  *
  * See the comment describing vm_refcnt in vm_area_struct for details as to
@@ -1968,7 +1968,7 @@ enum {
 /*
  * MMF_HAS_PINNED: Whether this mm has pinned any pages.  This can be either
  * replaced in the future by mm.pinned_vm when it becomes stable, or grow into
- * a counter on its own. We're aggresive on this bit for now: even if the
+ * a counter on its own. We're aggressive on this bit for now: even if the
  * pinned pages were unpinned later on, we'll still keep this bit set for the
  * lifecycle of this mm, just for simplicity.
  */
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 644daf5a1..c01b7e2a1 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2328,7 +2328,7 @@ static bool damos_valid_target(struct damon_ctx *c, struct damon_region *r,
  * This function checks if a given region should be skipped or not for the
  * reason.  If only the starting part of the region has previously charged,
  * this function splits the region into two so that the second one covers the
- * area that not charged in the previous charge widnow, and return true.  The
+ * area that not charged in the previous charge window, and return true.  The
  * caller can see the second one on the next iteration of the region walk.
  * Note that this means the caller should use damon_for_each_region() instead
  * of damon_for_each_region_safe().  If damon_for_each_region_safe() is used,
@@ -2486,7 +2486,7 @@ static void damos_walk_call_walk(struct damon_ctx *ctx, struct damon_target *t,
  * This function is called when kdamond finished applying the action of a DAMOS
  * scheme to all regions that eligible for the given &damos->apply_interval_us.
  * If every scheme of @ctx including @s now finished walking for at least one
- * &damos->apply_interval_us, this function makrs the handling of the given
+ * &damos->apply_interval_us, this function marks the handling of the given
  * DAMOS walk request is done, so that damos_walk() can wake up and return.
  */
 static void damos_walk_complete(struct damon_ctx *ctx, struct damos *s)
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 644d6905b..a997d1a4f 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3378,7 +3378,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 				swp_entry = make_readable_device_private_entry(
 							page_to_pfn(page + i));
 			/*
-			 * Young and dirty bits are not progated via swp_entry
+			 * Young and dirty bits are not propagated via swp_entry
 			 */
 			entry = swp_entry_to_pte(swp_entry);
 			if (soft_dirty)
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 1c9d4a590..bb5d4c414 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5332,7 +5332,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			int rc = vma_needs_reservation(h, vma, address);
 
 			if (rc < 0)
-				/* Pressumably allocate_file_region_entries failed
+				/* Presumably allocate_file_region_entries failed
 				 * to allocate a file_region struct. Clear
 				 * hugetlb_restore_reserve so that global reserve
 				 * count will not be incremented by free_huge_folio.
@@ -5545,7 +5545,7 @@ static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
 	 * In order to determine where this is a COW on a MAP_PRIVATE mapping it
 	 * is enough to check whether the old_folio is anonymous. This means that
 	 * the reserve for this address was consumed. If reserves were used, a
-	 * partial faulted mapping at the fime of fork() could consume its reserves
+	 * partial faulted mapping at the time of fork() could consume its reserves
 	 * on COW instead of the full address range.
 	 */
 	if (is_vma_resv_set(vma, HPAGE_RESV_OWNER) &&
diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index 6577bd769..5adeee400 100644
--- a/mm/kfence/core.c
+++ b/mm/kfence/core.c
@@ -156,7 +156,7 @@ atomic_t kfence_allocation_gate = ATOMIC_INIT(1);
  * allocations of the same source filling up the pool.
  *
  * Assuming a range of 15%-85% unique allocations in the pool at any point in
- * time, the below parameters provide a probablity of 0.02-0.33 for false
+ * time, the below parameters provide a probability of 0.02-0.33 for false
  * positive hits respectively:
  *
  *	P(alloc_traces) = (1 - e^(-HNUM * (alloc_traces / SIZE)) ^ HNUM
diff --git a/mm/list_lru.c b/mm/list_lru.c
index 36662d02f..b3bbea605 100644
--- a/mm/list_lru.c
+++ b/mm/list_lru.c
@@ -587,7 +587,7 @@ static int __memcg_list_lru_alloc(struct mem_cgroup *memcg,
 	 */
 	do {
 		/*
-		 * Keep finding the farest parent that wasn't populated
+		 * Keep finding the farthest parent that wasn't populated
 		 * until found memcg itself.
 		 */
 		pos = memcg;
diff --git a/mm/madvise.c b/mm/madvise.c
index 240d9161e..0554129f6 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1284,7 +1284,7 @@ static bool is_discard(int behavior)
  * We are restricted from madvise()'ing mseal()'d VMAs only in very particular
  * circumstances - discarding of data from read-only anonymous SEALED mappings.
  *
- * This is because users cannot trivally discard data from these VMAs, and may
+ * This is because users cannot trivially discard data from these VMAs, and may
  * only do so via an appropriate madvise() call.
  */
 static bool can_madvise_modify(struct madvise_behavior *madv_behavior)
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 69b37f63a..a441d2b4e 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -659,7 +659,7 @@ struct memcg_vmstats {
  *
  * 2) Flush the stats synchronously on reader side only when there are more than
  *    (MEMCG_CHARGE_BATCH * nr_cpus) update events. Though this optimization
- *    will let stats be out of sync by atmost (MEMCG_CHARGE_BATCH * nr_cpus) but
+ *    will let stats be out of sync by at most (MEMCG_CHARGE_BATCH * nr_cpus) but
  *    only for 2 seconds due to (1).
  */
 static void flush_memcg_stats_dwork(struct work_struct *w);
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index aaf14608b..b7463b619 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -2561,7 +2561,7 @@ int memory_failure(unsigned long pfn, int flags)
 	/*
 	 * We're only intended to deal with the non-Compound page here.
 	 * The page cannot become compound pages again as folio has been
-	 * splited and extra refcnt is held.
+	 * split and extra refcnt is held.
 	 */
 	WARN_ON(folio_test_large(folio));
 
diff --git a/mm/memory.c b/mm/memory.c
index 8da0f9451..3d2a834c1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5035,7 +5035,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	 * have changed, so sub pages might got charged to the wrong cgroup,
 	 * or even should be shmem. So we have to free it and fallback.
 	 * Nothing should have touched it, both anon and shmem checks if a
-	 * large folio is fully appliable before use.
+	 * large folio is fully applicable before use.
 	 *
 	 * This will be removed once we unify folio allocation in the swap cache
 	 * layer, where allocation of a folio stabilizes the swap entries.
diff --git a/mm/page_io.c b/mm/page_io.c
index b23f494fc..e52dfa0ad 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -182,7 +182,7 @@ static bool is_folio_zero_filled(struct folio *folio)
 	for (i = 0; i < folio_nr_pages(folio); i++) {
 		data = kmap_local_folio(folio, i * PAGE_SIZE);
 		/*
-		 * Check last word first, incase the page is zero-filled at
+		 * Check last word first, in case the page is zero-filled at
 		 * the start and has non-zero data at the end, which is common
 		 * in real-world workloads.
 		 */
diff --git a/mm/util.c b/mm/util.c
index bf0513d1d..cddd55cbb 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1240,7 +1240,7 @@ EXPORT_SYMBOL(__compat_vma_mmap);
 /**
  * compat_vma_mmap() - Apply the file's .mmap_prepare() hook to an
  * existing VMA and execute any requested actions.
- * @file: The file which possesss an f_op->mmap_prepare() hook.
+ * @file: The file which possesses an f_op->mmap_prepare() hook.
  * @vma: The VMA to apply the .mmap_prepare() hook to.
  *
  * Ordinarily, .mmap_prepare() is invoked directly upon mmap(). However, certain
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 5c0c2d0d6..e27bafdb2 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3682,7 +3682,7 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
 	/*
 	 * Initially, attempt to have the page allocator give us large order
 	 * pages. Do not attempt allocating smaller than order chunks since
-	 * __vmap_pages_range() expects physically contigous pages of exactly
+	 * __vmap_pages_range() expects physically contiguous pages of exactly
 	 * order long chunks.
 	 */
 	while (large_order > order && nr_remaining) {
-- 
2.43.0

