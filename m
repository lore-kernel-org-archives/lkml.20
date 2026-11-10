Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323094;
	b=foH707tOZJimn189KeydLNI7Qte54v4eqzDouI+SXhCZLHAi4s1hlVP/5ehcDcFMtGNB
	 gLhCRc+HwhaOvWLg2d4+UfJHzpvMDBUb+Cu+ECryjJz+ITtDDOtQkQAYWvOR7aYvcHUOq
	 04xlyeolqrtvocRCmiVvHiQj46K/DmpCl09k017X3fKR9o7M2KZaEgrduURGEQ0Y/Bmet
	 0XxFutGH7g7PLnS+LYkG8oOBkechE0xT2fXyi0lgSueymX0Y1PXTcVhKkNDFSTpfQ3Afg
	 9KOt9tl7k6CDu/pKHwUfTXkxOAPfLsBmSU1IHtZ8waoEDkxR9B27Ru5WfHtB5eMr0FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Mch4iZRzweRd1dIkwLWbrFi7MIz51SJR1zGEaUbpjgg=;
	b=diKXyRH7Ld2ND9+nse7zxj+lkUfW97gLF7f4tkjwbm43FsxQeKEl06kBqNjYxXqAfhJ5
	 P/ltXJlhILS7awZRIFW3ALK0ItW9MoeR/Zb+aAPBgcDzLNxQC7QeZehEXEbBsR46b7PcU
	 98vJvK75aSREWqBPyh1/QNSD3tNcE1pRWKD16hOo0sc+8Eh7Lb4uTE45HsjRenD/qBJHk
	 Ntc1cl4FXC/0k1ylEwFZeSf+XpkqEJn6WXUkh3gMnR0RivUZ0e4q/eNMGi4XkbBk67IP3
	 +aX5eZ7DB/JNTYYXBX42j53XcTJ7cQVMr9tInDM97A0/B1VbNZ59qxzN5eH5D0txsFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Azc+085+;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2184F606AA69
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2184F606AA69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Azc+085+
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91ea2e29d90so21688526d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794323093; x=1794927893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mch4iZRzweRd1dIkwLWbrFi7MIz51SJR1zGEaUbpjgg=;
        b=Azc+085+nVm6EIgsXh/bH+jeFjdTvRjBlS5B+jkMqMHddBNxEjCN1tGSDAbs8jL2M+
         jhZmaF/2Ctr4fpZwk4BRIa3L6mxprS8v4XEjs8v+RsjS/XcpgNLFkE2MvLd6YWT+4MfB
         SZWCGj8XYj1P1P6MtpjvsKzDtlO43+zO58/CJO9fg47/2GIg9bRG7kleG/Dxo5MrWJQ0
         UR2Ih4qXLNv36wH16PaXx2gkIW/B+5YOhbS5Td253MUE3TbFz4+VGA9tct5WE+SDJTKW
         OasI899FntnXMeb7zkZOd0nMMYMgDYMXVyNnMrf0fKvw/zTGeGRQrmq3Yrx+vmhjuM9z
         uGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323093; x=1794927893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mch4iZRzweRd1dIkwLWbrFi7MIz51SJR1zGEaUbpjgg=;
        b=YEJ5KsaOnKMdr4/u+sXppoxt0ANMaUveJFf2AMEWDY2rZ8Phv2cL/YpPYVpL9oRE7y
         q1krwQSNXQDcKFqeN1yZjvYv2uF6d7RW2c623+b8CJB8scaK2+NPBtSi1qmGLCiMQDYT
         9j/SDl+FyuplGIwXQXIT2hcpE+1v0QHJJkZMzdVGCp6p8LvUBwFuQmDwXEmTNB4btp0+
         5n+lVXf1iocVX9CL6WMA0BTkkixKiUe82dU/m4RYOJ/x+YUXqQv2rUkH2NDq0qAcQUrM
         2mr1LUCGrwGxPoEt+HaVwJUgzFKvbxghZgCllIAqUyNy2TDIciHWs0QjxZ0Nl777AXJT
         E0KQ==
X-Gm-Message-State: APuU4Z/x2Ou6Espqw76BGi0xmdGWZeBmBr3nPueSzqUZ2F2gAOpPHUT3
	z9DRaR8+nd/Xzv9C0elSUn6owKeEhiPzLiUcCseIQpCr2ce9oup5DwuI2YxZwttyMSY=
X-Gm-Gg: AYBFou0XtgNFrlSqW7FLB++VSeeYHEXQecNsBJbI10PtsdIgiriCWhk788ZCpPCxnWR
	DSK9Lfsyz4bDg4NUHIlURow6tKuhyoWdnSMKXDXO3t7LIwgxx9ZSm85pbOQ1Gb8o1JGHIp2gbX8
	rBDDLEFPQCYys5lRZ6MK75d5gW1Mc+gDbg+3ML5yE1B+JIE3WR54QSyr1OOz9X4mn9w1DTeMssn
	sO3NJd6VB+4bsMH2A38zaGgjJfh5n0EavlUbIf/3qo+j3JH9NDRHfhfoivyOhGZqLQTsulgU6cO
	5Sd3Yi/1sUgz+4Aqn4yf38zmL3fjyFurVsfV+LSYVi780Wvrp5I8gO8DyMR7BEoQUefDVltAcPW
	xPugGC0b17OvOg/DzdepMw8J2IvWGpGmfLOMXhWXZNqCIJsUPFOQu1FAV1YAiJ5w9hUQrJlBk8B
	foJTxAv/0B4koLDmiGp0hcoFHgSEX8HipgzsJAO4ihw8yjyfQggeFEIGEyQFrVpHCm6gV6wUObn
	FusYzXViYnVF/JtgCugiUeiKMdJMqD/xrQo2UR8M1dR9XB/DaesWMyqpuDRYRsH7WYbH63yXLIe
	V0AWYCyWWS466C4uSvn2rvulqZyrcJ2wdhFKSb2tEgSdS4ZIAOFNMttvmPHc84iyz1m1pIEpgs6
	7d9dxmABzAahKL2uy6HfqE0o8GYUitWIrCVmh
X-Received: by 2002:a05:6214:401a:b0:91b:5d39:e133 with SMTP id 6a1803df08f44-91ef02f0932mr38917826d6.30.1794323092936;
        Tue, 10 Nov 2026 07:04:52 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef031c7dasm22902406d6.1.2026.11.10.07.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:04:52 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
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
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@techsingularity.net,
	mingo@kernel.org,
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
	osalvador@suse.de,
	raghavendra.kt@amd.com,
	stable@vger.kernel.org
Subject: [PATCH v5 1/7] mm: support promotion-only NUMA hinting scans
Date: Tue, 10 Nov 2026 10:04:40 -0500
Message-ID: <20261110150446.2452975-2-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110150446.2452975-1-gourry@gourry.net>
References: <20261110150446.2452975-1-gourry@gourry.net>
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
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/mm.h  |  6 ++++--
 kernel/sched/fair.c |  9 ++++++++-
 mm/huge_memory.c    |  3 +--
 mm/internal.h       |  4 ++--
 mm/mempolicy.c      | 26 ++++++++++++--------------
 mm/mprotect.c       |  7 +------
 6 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 77b5d450fe45b..40de653041f92 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3584,6 +3584,8 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
 #define  MM_CP_UFFD_RWP_RESOLVE            (1UL << 5) /* resolve rwp */
 #define  MM_CP_UFFD_RWP_ALL                (MM_CP_UFFD_RWP | \
 					    MM_CP_UFFD_RWP_RESOLVE)
+/* Whether a MM_CP_PROT_NUMA change is for promotion only */
+#define  MM_CP_PROT_NUMA_PROMO_ONLY        (1UL << 6)
 
 bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 			     pte_t pte);
@@ -4959,8 +4961,8 @@ static inline void vma_set_page_prot(struct vm_area_struct *vma)
 void vma_set_file(struct vm_area_struct *vma, struct file *file);
 
 #ifdef CONFIG_NUMA_BALANCING
-unsigned long change_prot_numa(struct vm_area_struct *vma,
-			unsigned long start, unsigned long end);
+unsigned long change_prot_numa(struct vm_area_struct *vma, unsigned long start,
+		unsigned long end, unsigned long cp_flags);
 #endif
 
 struct vm_area_struct *find_extend_vma_locked(struct mm_struct *,
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cfc982205b98c..5d3d7b61d0257 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4271,11 +4271,14 @@ static bool vma_is_accessed(struct mm_struct *mm, struct vm_area_struct *vma)
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
@@ -4283,6 +4286,9 @@ static void task_numa_work(struct callback_head *work)
 	bool vma_pids_skipped;
 	bool vma_pids_forced = false;
 
+	if (!balancing)
+		cp_flags |= MM_CP_PROT_NUMA_PROMO_ONLY;
+
 	WARN_ON_ONCE(p != container_of(work, struct task_struct, numa_work));
 
 	work->next = work;
@@ -4459,7 +4465,8 @@ static void task_numa_work(struct callback_head *work)
 			start = max(start, vma->vm_start);
 			end = ALIGN(start + (pages << PAGE_SHIFT), HPAGE_SIZE);
 			end = min(end, vma->vm_end);
-			nr_pte_updates = change_prot_numa(vma, start, end);
+			nr_pte_updates = change_prot_numa(vma, start, end,
+							  cp_flags);
 
 			/*
 			 * Try to scan sysctl_numa_balancing_size worth of
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 0d589be136d21..54ece00a457f8 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2776,8 +2776,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		if (is_huge_zero_pmd(*pmd))
 			goto unlock;
 
-		if (!folio_can_map_prot_numa(pmd_folio(*pmd), vma,
-					     vma_is_single_threaded_private(vma)))
+		if (!folio_can_map_prot_numa(pmd_folio(*pmd), vma, cp_flags))
 			goto unlock;
 	}
 	/*
diff --git a/mm/internal.h b/mm/internal.h
index cd3675c044e0a..6e7c247781a16 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1256,11 +1256,11 @@ static inline bool vma_is_single_threaded_private(struct vm_area_struct *vma)
 
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
index fb627b37afcbb..f0933e9b209c9 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -849,7 +849,7 @@ static int queue_folios_hugetlb(pte_t *pte, unsigned long hmask,
  * folio_can_map_prot_numa() - check whether the folio can map prot numa
  * @folio: The folio whose mapping considered for being made NUMA hintable
  * @vma: The VMA that the folio belongs to.
- * @is_private_single_threaded: Is this a single-threaded private VMA or not
+ * @cp_flags: Flags describing the protection change
  *
  * This function checks to see if the folio actually indicates that
  * we need to make the mapping one which causes a NUMA hinting fault,
@@ -859,7 +859,7 @@ static int queue_folios_hugetlb(pte_t *pte, unsigned long hmask,
  * Return: True if the mapping of the folio needs to be changed, false otherwise.
  */
 bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
-		bool is_private_single_threaded)
+		unsigned long cp_flags)
 {
 	int nid;
 
@@ -882,20 +882,16 @@ bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
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
@@ -909,19 +905,21 @@ bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
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
index ef4e7188e24da..22049b265a289 100644
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
2.53.0-Meta

