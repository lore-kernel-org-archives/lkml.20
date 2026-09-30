Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A072F4A263C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767336; cv=none; b=ZYgkR9mux8tkE9QEm9PEmYsqawkSpKTPhIIieKUUw5QOwDnh0azLLUqGYHc69MHuIVy9qkjEbqgSwrQes9BZ5TwGok2lvbGxC8SAm6ZmwVNqFx50Tk+5jZY5YBZx6tr1SXTi+GITDpVIFDVyCNt6o/TFmb5oVcngN1EHSj54e2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767336; c=relaxed/simple;
	bh=IRmYi/LDwc/A3if/nvdHnTS6YNgUzpjuMEeMDAdXNKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvHD6a9JKP8F9fNV+/7AzOD5gERgXyLC8jEeqbjCwcuwVMSqGR8X0aJB5uc43Z27/UwjsjJ03OmZMKKYciuyJr93oZEz1jZMp5Pj4zDjOfS618XpQhA0SaeTKOKtf0Frwu8fLK5uARrxhoh0WVLxlGpc0rwRXIt8Y7JSE1YvlEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=NEFKCgMH; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="NEFKCgMH"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so39271435e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790767332; x=1791372132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIw+KKdVSvnmdxpFXC8KfAVy8bK/hfC5OXGzj2ui4Nc=;
        b=NEFKCgMHL87bUlSybr7w0c3HAQk0rtaE+An4u7zVpq/OOb27U5uL5/qsWtA0Gna5qf
         OfX92qayhS1Mf78j0eqA0HPZMYVLSPQKHZJKHAe1JVTgeP+vCW6jJqM4lkgqORmUlhKK
         O/2IS6MF7O2GwMUz2ygF5MIPJ8RyhmlgF5cW1H0mJFgasn8AXw6+qS1o8xxuUNPnP/RY
         1SyYgay1cJht3EQRgalW44VgFVjYKyogYW73HZniL4v3ysnRotWc8/HNn67N525qSQPl
         gWhCqGECtQWW9Lo5s/uw6gCRK/pIAjpTWGmpvJUAsw69ZwReoGJOhzhwdY5CwrtTdO6e
         QIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767332; x=1791372132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIw+KKdVSvnmdxpFXC8KfAVy8bK/hfC5OXGzj2ui4Nc=;
        b=uEnI+6ExjUbHPw0Hyy3eWQHtZocVK5bZ3vBCyCO1fPlm5C9CHChLRYK4tPVKGB16RB
         uVLDveYp4BOIqlrNXRftoBqvDM4bXOwkKAEeqyjNIWQAk/dyKNgaeKbGXFqz4GXDGNBV
         DCH35ATCHRJVRu4lRoIR3PQSHtGo329UOJI/4x7ZiCPZEgoIFE6S5U9Gl8c/Vc2Kbh5Y
         5H9uNowJEMcwVbcJ3BHT3jQ+RBWLaBwCPce3v2uZ5TyELYlBAK6QwpnKNXCbnELVujg3
         kCQUyNVY1ChPkZWk0vzAurgaPUJP6l4cJsbvWWgJq4ZCQygOLem/AWb3fdqb9Lx7vI6S
         OEbw==
X-Gm-Message-State: AFuF++mJu3Pju9kCsHuYCsWI0xKMecSVe9Xv/Inw1RGJrhlNGaARLF47
	pCzCa0InKR1Xnr5W7nrYcTg9JP3PU5KR3LalfFdX7JjckAAVC6u5JPncwME3yhT//7s=
X-Gm-Gg: AYBFou3kb6JsfJQKgFV5CwMKo2UFj8NzDD6/tLbhcjrzmmbeF2DPlFdo/QTUXb7wJLl
	L9DCxqkIoCrVnXDODOuQIujhO1GfJfwz3fHJiaCAMvLguuaWUjqLmKWwuMypJXEsRL+V3RJ0M5W
	ExND7iD9f4WYINwr8z4hASMjddLbjzk5kakx0rrtUWH3LxR6Oxe22t/kjEXLl96uBFgyKt/XTrf
	jHdec1rnAEkU3gET2EfXQXaQ5KMGJ/dasG9cChQxYVoC5LiulexgXHNa6N8c0Ri33HLzvjV8z0I
	jxoIa7J20K/c9NTogx30cW1ca3aZrJZVeTjFHYEmlyF6BAYpw3jZ3ZDO1w1hnDBM2gB+1yWby3T
	VZcQhlOcB7NUgbdBb3E4UiBuYv33HPl8x1sMVnGPSR1MxNVvR/RcY9MVSreRU2dw1m7KgZeiwei
	m2Eb1A05Tz6hLtrTS2pabWUPPzea8pjO4t371NnjlA5SPAl9y8pFtC4ysEY0Nvk1kB0vwAli3LV
	7z93HYxzWAAby/1
X-Received: by 2002:a05:600c:4514:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a01affe8dfmr18099155e9.10.1790767331659;
        Wed, 30 Sep 2026 04:22:11 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.thefacebook.com ([2620:10d:c092:500::6:13b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a019740c34sm34097095e9.9.2026.09.30.04.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:22:11 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	jannh@google.com,
	pfalcato@suse.de,
	hannes@cmpxchg.org,
	shy828301@gmail.com,
	osalvador@suse.de,
	raghavendra.kt@amd.com,
	stable@vger.kernel.org
Subject: [PATCH v4 1/7] mm: support promotion-only NUMA hinting scans
Date: Wed, 30 Sep 2026 07:22:00 -0400
Message-ID: <20260930112206.205083-2-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930112206.205083-1-gourry@gourry.net>
References: <20260930112206.205083-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Gregory Price (Meta)" <gourry@gourry.net>

folio_can_map_prot_numa() derives folio eligibility from the global
balancing mode. The mode (normal, tiering, or combined) describes
which balancing mechanisms are enabled (placement vs promotion).

The global setting itself cannot describe the intent of an individual
protection walk because normal-mode tempers its scanning activity based
on a number of heuristics (read-only VMAs, activeness of VMA, etc).

In tiering or combined mode, applying these normal-mode optimizations
to an entire VMA is incorrect and breaks tiering.

 - Opting VMAs out of scanning because they became inactive obviously
   breaks tiering - because the intent is to identify when a VMA
   becomes active. Applying it in tiering modes causes VMAs to become
   permanently stranded on lower tiers.

 - Opting Read-only file VMAs out of scanning is just incorrect for
   tiering modes because its intent is to prevent bouncing between
   sockets (east-west), while tiering controls tier migration
   (north-south).  The result is hot read-only files can overload
   lower tier bandwidth.

Add MM_CP_PROT_NUMA_PROMO_ONLY and let task_numa_work() select the type
of walk from a single read of the balancing mode. Build the
change-protection flags there and pass them unchanged through
change_prot_numa() so its PTE/PMD paths use the same decision.

Have folio_can_map_prot_numa() derive the single-threaded private state at
the point of use instead of adding another precomputed boolean to the
protection-walk interface. This keeps the interface focused on scan intent
and avoids plumbing VMA-derived state beside cp_flags.

The tradeoff for the cleaner interface is an atomic mm_users read for each
folio, rather than once per PTE range. Check the promotion-only top-tier
exclusion bit first as a mild optimization.

The scan-intent interface is required by the following memory-tiering
fixes and must accompany them when backported.

Fixes: c574bbe91703 ("NUMA balancing: optimize page placement for memory tiering system")
Cc: stable@vger.kernel.org
Suggested-by: David Hildenbrand <david@kernel.org>
Link: https://lore.kernel.org/r/4d2853c9-edf4-4685-b186-7214ed6abd84@kernel.org
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/mm.h  |  6 ++++--
 kernel/sched/fair.c |  9 ++++++++-
 mm/huge_memory.c    |  3 +--
 mm/internal.h       |  4 ++--
 mm/mempolicy.c      | 26 ++++++++++++--------------
 mm/mprotect.c       |  7 +------
 6 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c038d06825c3..623ae61e52cb 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3609,6 +3609,8 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
 #define  MM_CP_UFFD_RWP_RESOLVE            (1UL << 5) /* resolve rwp */
 #define  MM_CP_UFFD_RWP_ALL                (MM_CP_UFFD_RWP | \
 					    MM_CP_UFFD_RWP_RESOLVE)
+/* Whether a MM_CP_PROT_NUMA change is for promotion only */
+#define  MM_CP_PROT_NUMA_PROMO_ONLY        (1UL << 6)
 
 bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 			     pte_t pte);
@@ -4984,8 +4986,8 @@ static inline void vma_set_page_prot(struct vm_area_struct *vma)
 void vma_set_file(struct vm_area_struct *vma, struct file *file);
 
 #ifdef CONFIG_NUMA_BALANCING
-unsigned long change_prot_numa(struct vm_area_struct *vma,
-			unsigned long start, unsigned long end);
+unsigned long change_prot_numa(struct vm_area_struct *vma, unsigned long start,
+		unsigned long end, unsigned long cp_flags);
 #endif
 
 struct vm_area_struct *find_extend_vma_locked(struct mm_struct *,
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 3fe1d35b17dc..c3dfa398d0bd 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4127,11 +4127,14 @@ static bool vma_is_accessed(struct mm_struct *mm, struct vm_area_struct *vma)
  */
 static void task_numa_work(struct callback_head *work)
 {
+	const unsigned int numab_mode = READ_ONCE(sysctl_numa_balancing_mode);
+	const bool balancing = numab_mode & NUMA_BALANCING_NORMAL;
 	unsigned long migrate, next_scan, now = jiffies;
 	struct task_struct *p = current;
 	struct mm_struct *mm = p->mm;
 	u64 runtime = p->se.sum_exec_runtime;
 	struct vm_area_struct *vma;
+	unsigned long cp_flags = MM_CP_PROT_NUMA;
 	unsigned long start, end;
 	unsigned long nr_pte_updates = 0;
 	long pages, virtpages;
@@ -4139,6 +4142,9 @@ static void task_numa_work(struct callback_head *work)
 	bool vma_pids_skipped;
 	bool vma_pids_forced = false;
 
+	if (!balancing)
+		cp_flags |= MM_CP_PROT_NUMA_PROMO_ONLY;
+
 	WARN_ON_ONCE(p != container_of(work, struct task_struct, numa_work));
 
 	work->next = work;
@@ -4315,7 +4321,8 @@ static void task_numa_work(struct callback_head *work)
 			start = max(start, vma->vm_start);
 			end = ALIGN(start + (pages << PAGE_SHIFT), HPAGE_SIZE);
 			end = min(end, vma->vm_end);
-			nr_pte_updates = change_prot_numa(vma, start, end);
+			nr_pte_updates = change_prot_numa(vma, start, end,
+							  cp_flags);
 
 			/*
 			 * Try to scan sysctl_numa_balancing_size worth of
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ddc631a388b9..b844b63549a6 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2768,8 +2768,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		if (is_huge_zero_pmd(*pmd))
 			goto unlock;
 
-		if (!folio_can_map_prot_numa(pmd_folio(*pmd), vma,
-					     vma_is_single_threaded_private(vma)))
+		if (!folio_can_map_prot_numa(pmd_folio(*pmd), vma, cp_flags))
 			goto unlock;
 	}
 	/*
diff --git a/mm/internal.h b/mm/internal.h
index 0434dfcfc36f..cbeaf1fc38cf 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1248,11 +1248,11 @@ static inline bool vma_is_single_threaded_private(struct vm_area_struct *vma)
 
 #ifdef CONFIG_NUMA_BALANCING
 bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
-		bool is_private_single_threaded);
+		unsigned long cp_flags);
 
 #else
 static inline bool folio_can_map_prot_numa(struct folio *folio,
-		struct vm_area_struct *vma, bool is_private_single_threaded)
+		struct vm_area_struct *vma, unsigned long cp_flags)
 {
 	return false;
 }
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 4c0b8ff1a7e6..8ff37f60b710 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -847,7 +847,7 @@ static int queue_folios_hugetlb(pte_t *pte, unsigned long hmask,
  * folio_can_map_prot_numa() - check whether the folio can map prot numa
  * @folio: The folio whose mapping considered for being made NUMA hintable
  * @vma: The VMA that the folio belongs to.
- * @is_private_single_threaded: Is this a single-threaded private VMA or not
+ * @cp_flags: Flags describing the protection change
  *
  * This function checks to see if the folio actually indicates that
  * we need to make the mapping one which causes a NUMA hinting fault,
@@ -857,7 +857,7 @@ static int queue_folios_hugetlb(pte_t *pte, unsigned long hmask,
  * Return: True if the mapping of the folio needs to be changed, false otherwise.
  */
 bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
-		bool is_private_single_threaded)
+		unsigned long cp_flags)
 {
 	int nid;
 
@@ -880,20 +880,16 @@ bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
 	if (folio_is_file_lru(folio) && folio_test_dirty(folio))
 		return false;
 
-	/*
-	 * Don't mess with PTEs if folio is already on the node
-	 * a single-threaded process is running on.
-	 */
 	nid = folio_nid(folio);
-	if (is_private_single_threaded && (nid == numa_node_id()))
+	/* Promotion-only scans do not mark top-tier folios. */
+	if ((cp_flags & MM_CP_PROT_NUMA_PROMO_ONLY) && node_is_toptier(nid))
 		return false;
 
 	/*
-	 * Skip scanning top tier node if normal numa
-	 * balancing is disabled
+	 * Don't mess with PTEs if folio is already on the node
+	 * a single-threaded process is running on.
 	 */
-	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
-	    node_is_toptier(nid))
+	if (vma_is_single_threaded_private(vma) && nid == numa_node_id())
 		return false;
 
 	if (folio_use_access_time(folio))
@@ -907,19 +903,21 @@ bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
  * These are later cleared by a NUMA hinting fault. Depending on these
  * faults, pages may be migrated for better NUMA placement.
  *
+ * @cp_flags carries the NUMA scan policy through the protection walk.
+ *
  * This is assuming that NUMA faults are handled using PROT_NONE. If
  * an architecture makes a different choice, it will need further
  * changes to the core.
  */
-unsigned long change_prot_numa(struct vm_area_struct *vma,
-			unsigned long addr, unsigned long end)
+unsigned long change_prot_numa(struct vm_area_struct *vma, unsigned long addr,
+		unsigned long end, unsigned long cp_flags)
 {
 	struct mmu_gather tlb;
 	long nr_updated;
 
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 
-	nr_updated = change_protection(&tlb, vma, addr, end, MM_CP_PROT_NUMA);
+	nr_updated = change_protection(&tlb, vma, addr, end, cp_flags);
 	if (nr_updated > 0) {
 		count_vm_numa_events(NUMA_PTE_UPDATES, nr_updated);
 		count_memcg_events_mm(vma->vm_mm, NUMA_PTE_UPDATES, nr_updated);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index e59c69cb5a23..7a247ed4cd55 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -335,7 +335,6 @@ static long change_pte_range(struct mmu_gather *tlb,
 	pte_t *pte, oldpte;
 	spinlock_t *ptl;
 	long pages = 0;
-	bool is_private_single_threaded;
 	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
 	bool uffd_rwp = cp_flags & MM_CP_UFFD_RWP;
 	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
@@ -346,9 +345,6 @@ static long change_pte_range(struct mmu_gather *tlb,
 	if (!pte)
 		return -EAGAIN;
 
-	if (prot_numa)
-		is_private_single_threaded = vma_is_single_threaded_private(vma);
-
 	flush_tlb_batched_pending(vma->vm_mm);
 	lazy_mmu_mode_enable();
 	do {
@@ -383,8 +379,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 			 * must set protnone regardless of NUMA placement.
 			 */
 			if (prot_numa &&
-			    !folio_can_map_prot_numa(folio, vma,
-						is_private_single_threaded)) {
+			    !folio_can_map_prot_numa(folio, vma, cp_flags)) {
 
 				/* determine batch to skip */
 				nr_ptes = mprotect_folio_pte_batch(folio,
-- 
2.55.0

