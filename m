Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED75632C8B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085917; cv=none; b=AZTLyLYBiSSnTlM6xa9DttB4aAqPXeuTSFJpqpMoQ90WurIxwvrhLKUCxSNFL/H0Qgti1Rlxc77FbmeIUTmABvlk2vTPWxaOdD4t0tbqa7Ary/cyaGmAfGt5wSBkfUrf/l/yJpUHn5qkD+OLtjwhs3SA+H2aVD+YQOqV7iFITbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085917; c=relaxed/simple;
	bh=Jljp3ztDhFP6O+PAfvk83+8GLPXNCVYLh8IZWY/KNiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dtHpwTsqkq6n+Ba76xOavZXrJ0hLfqbWbiNvV78j+pA2muecr7fcIcL1kJ0g18L67iw5bNxjGFx1bHBTSab+UaQ1NrHI/7SJwvwon88y10d6SdOPXKIXW/SzYmuMyW7Y2GQvvdqyz7ms9+WOrnmY5ijQpVID++X55QqFfqXy1vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=s2N61fim; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="s2N61fim"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9309d4ea213so34380985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789085915; x=1789690715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlfoGyQgrNSRVIxWxP7qSy7UsF5M3AH+3KUxqb60W44=;
        b=s2N61fim4h9Hyo1KG80u1cKEqeKti0m5D1U0+FTkwcCoc7rOkZzPPx6Pty7Jjojqkf
         xmzAC1oIaD/AvxQJQI5isg6B2kBJ7OhwYUiDyzjq/NtY5z8LghxbWKFg2lZUQsF+3dHX
         noFPRbxcoFRvL5jmnafdtrWxWG/eK/JYj7bSWnLWfixKDAotQyoK0PebTZxqnI9Ll/fv
         /8wTWgTHzPv7zyDfhFcZWXoxHYsnAwCyR3wYgUsq95SIVJYKb7EzOBJ0wWAV4CszNCi4
         rIjJZwMbZToZdUjNRm8Tzi60Ws2RkTB899x5fSbHd4KE+iBiG/loyAsu24eSV/hNwvjB
         byQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789085915; x=1789690715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XlfoGyQgrNSRVIxWxP7qSy7UsF5M3AH+3KUxqb60W44=;
        b=DsNs3ugazU4lLVRi907NjzwLKG7M0FUuF98r9fWaLvhU9SZsCPUNEquZzm/SaeSNO7
         wqsGxf4bLyo7P0GZqBBLWrIjfp6SCefZmayBmSgG8OBlhvYjCX0q7gI9GGHnBdNYUlf1
         PTXe/gCd3RFlbjnEI52s4D/olv3rrtpoXvTrjBHh7bGP8UKkCsCZvTiSZHbWlxNn4/7v
         MZjm8OCFoZHDEHksqEgMoHTmuCHVeKx9kwedhAmCdi/jouEltHH2asDxOaCe8MLy70LY
         oY9SdMmT3USBRPFQfiiqXhJrFf5KcB510A2H1lFVysKdRDHQPE2hbWxyHiohZUcAhrNc
         xpGA==
X-Gm-Message-State: AFuF++kQERwp3JtV5z7RqdOvA/ewnBNUdm20925WvpPhSb4eYaU9O9hG
	nypdt2P+S0i2negjmR4taQkfWm0f4cDJAxOHWHc0wzb8uwzEobzEntHL/N4XgO6n2tc=
X-Gm-Gg: AYBFou1TZX2HSqT9u3X7kngsaW/WRpMh5iZ2S5+OKMU+A+rwP3S8FnkZC8W0+eM8UGP
	nhrEiGRzLOWZP/qnNZPJIYHZWWYl7i/bqnfN9E74Bx9WsQUWTeF0JxV5OLmHAvIVQGpM15nQ7U6
	71abl3lfvpRMPT885bQEwFR6wbxbdWMV4VQH78mzEparo359ZnZvvl6ILdyx2k80jFfSxah6b5O
	ryOGm7xNRoaJ0tNsJvtfwhZg6Kk6pa7H1boivXAUDyJ+sJxZ3ujjg0BuZ0OX7fDK+aI0ZL9g8dp
	m1WzEAtgB2/MBinswmWdJPCzIuRSOis4uHKcfrrtKvvl5h0Q6BOC0RS0PDK/IMOLssCsBcDeRRB
	g4CgzrGB20lzAhOaBEuIkuUTfGQU3oGI0ShGnGf84+sk0H76zaO6mDY32BtQ00odKCGMpNd1/QZ
	7kfcb/SuyV/gLCmRsnMstkGPO7bFpPZa8iKz5w8aw+FrLJ4rIR1y9nG6Dde93ccbL+Xb+y2+0qS
	1RZcbnzGx0fRhDb1STAqV4BAf3suwd8H2IMORKEXFTRhAx6KP2pb8MbHuQibA==
X-Received: by 2002:a05:620a:2989:b0:939:7f2f:b17e with SMTP id af79cd13be357-939e9efcaf8mr205827185a.30.1789085914637;
        Thu, 10 Sep 2026 17:18:34 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80e4c36sm108896485a.40.2026.09.10.17.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:18:34 -0700 (PDT)
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
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	jannh@google.com,
	pfalcato@suse.de,
	osalvador@suse.de,
	hannes@cmpxchg.org,
	raghavendra.kt@amd.com,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] mm: support promotion-only NUMA hinting scans
Date: Thu, 10 Sep 2026 20:18:23 -0400
Message-ID: <20260911001826.2109390-2-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911001826.2109390-1-gourry@gourry.net>
References: <20260911001826.2109390-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Gregory Price (Meta)" <gourry@gourry.net>

folio_can_map_prot_numa() derives the eligible memory from the global
balancing mode. Combined mode needs the scanner to distinguish placement
scans from promotion-only scans.

Add MM_CP_PROT_NUMA_PROMO_ONLY and let change_prot_numa() callers request
a promotion-only protection walk. Carry the choice with each walk so the
PTE and PMD paths use the same decision.

Initially derive the value from the normal balancing mode, preserving the
existing behavior for the following fixes.

Fixes: c574bbe91703 ("NUMA balancing: optimize page placement for memory tiering system")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/mm.h  |  4 +++-
 kernel/sched/fair.c |  7 ++++++-
 mm/huge_memory.c    |  3 ++-
 mm/internal.h       |  5 +++--
 mm/mempolicy.c      | 22 +++++++++++++---------
 mm/mprotect.c       |  4 +++-
 6 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 969594074fd2..2d1b59a27629 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3408,6 +3408,8 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
 #define  MM_CP_UFFD_RWP_RESOLVE            (1UL << 5) /* resolve rwp */
 #define  MM_CP_UFFD_RWP_ALL                (MM_CP_UFFD_RWP | \
 					    MM_CP_UFFD_RWP_RESOLVE)
+/* Whether a MM_CP_PROT_NUMA change is for promotion only */
+#define  MM_CP_PROT_NUMA_PROMO_ONLY        (1UL << 6)
 
 bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 			     pte_t pte);
@@ -4736,7 +4738,7 @@ void vma_set_file(struct vm_area_struct *vma, struct file *file);
 
 #ifdef CONFIG_NUMA_BALANCING
 unsigned long change_prot_numa(struct vm_area_struct *vma,
-			unsigned long start, unsigned long end);
+			unsigned long start, unsigned long end, bool promo_only);
 #endif
 
 struct vm_area_struct *find_extend_vma_locked(struct mm_struct *,
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8dff37059faf..81359b414947 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4129,8 +4129,10 @@ static void task_numa_work(struct callback_head *work)
 	unsigned long nr_pte_updates = 0;
 	long pages, virtpages;
 	struct vma_iterator vmi;
+	unsigned int numab_mode = READ_ONCE(sysctl_numa_balancing_mode);
 	bool vma_pids_skipped;
 	bool vma_pids_forced = false;
+	bool promo_only;
 
 	WARN_ON_ONCE(p != container_of(work, struct task_struct, numa_work));
 
@@ -4304,11 +4306,14 @@ static void task_numa_work(struct callback_head *work)
 			continue;
 		}
 
+		promo_only = !(numab_mode & NUMA_BALANCING_NORMAL);
+
 		do {
 			start = max(start, vma->vm_start);
 			end = ALIGN(start + (pages << PAGE_SHIFT), HPAGE_SIZE);
 			end = min(end, vma->vm_end);
-			nr_pte_updates = change_prot_numa(vma, start, end);
+			nr_pte_updates = change_prot_numa(vma, start, end,
+							  promo_only);
 
 			/*
 			 * Try to scan sysctl_numa_balancing_size worth of
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 30b7c63b0e35..2f9ada1bbcfc 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2784,7 +2784,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			goto unlock;
 
 		if (!folio_can_map_prot_numa(pmd_folio(*pmd), vma,
-					     vma_is_single_threaded_private(vma)))
+					     vma_is_single_threaded_private(vma),
+					     cp_flags & MM_CP_PROT_NUMA_PROMO_ONLY))
 			goto unlock;
 	}
 	/*
diff --git a/mm/internal.h b/mm/internal.h
index 0dca33db068f..f3e093168f84 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1237,11 +1237,12 @@ static inline bool vma_is_single_threaded_private(struct vm_area_struct *vma)
 
 #ifdef CONFIG_NUMA_BALANCING
 bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
-		bool is_private_single_threaded);
+		bool is_private_single_threaded, bool promo_only);
 
 #else
 static inline bool folio_can_map_prot_numa(struct folio *folio,
-		struct vm_area_struct *vma, bool is_private_single_threaded)
+		struct vm_area_struct *vma, bool is_private_single_threaded,
+		bool promo_only)
 {
 	return false;
 }
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 2ad0a5f18280..a082ccfa09ec 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -846,6 +846,7 @@ static int queue_folios_hugetlb(pte_t *pte, unsigned long hmask,
  * @folio: The folio whose mapping considered for being made NUMA hintable
  * @vma: The VMA that the folio belongs to.
  * @is_private_single_threaded: Is this a single-threaded private VMA or not
+ * @promo_only: Whether this scan should only collect promotion candidates
  *
  * This function checks to see if the folio actually indicates that
  * we need to make the mapping one which causes a NUMA hinting fault,
@@ -855,7 +856,7 @@ static int queue_folios_hugetlb(pte_t *pte, unsigned long hmask,
  * Return: True if the mapping of the folio needs to be changed, false otherwise.
  */
 bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
-		bool is_private_single_threaded)
+		bool is_private_single_threaded, bool promo_only)
 {
 	int nid;
 
@@ -886,12 +887,8 @@ bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
 	if (is_private_single_threaded && (nid == numa_node_id()))
 		return false;
 
-	/*
-	 * Skip scanning top tier node if normal numa
-	 * balancing is disabled
-	 */
-	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
-	    node_is_toptier(nid))
+	/* Promotion-only scans do not collect NUMA placement samples */
+	if (promo_only && node_is_toptier(nid))
 		return false;
 
 	if (folio_use_access_time(folio))
@@ -905,19 +902,26 @@ bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
  * These are later cleared by a NUMA hinting fault. Depending on these
  * faults, pages may be migrated for better NUMA placement.
  *
+ * With @promo_only only folios eligible for promotion are made
+ * hint-faultable, without also sampling for task placement.
+ *
  * This is assuming that NUMA faults are handled using PROT_NONE. If
  * an architecture makes a different choice, it will need further
  * changes to the core.
  */
 unsigned long change_prot_numa(struct vm_area_struct *vma,
-			unsigned long addr, unsigned long end)
+			unsigned long addr, unsigned long end, bool promo_only)
 {
+	unsigned long cp_flags = MM_CP_PROT_NUMA;
 	struct mmu_gather tlb;
 	long nr_updated;
 
+	if (promo_only)
+		cp_flags |= MM_CP_PROT_NUMA_PROMO_ONLY;
+
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 
-	nr_updated = change_protection(&tlb, vma, addr, end, MM_CP_PROT_NUMA);
+	nr_updated = change_protection(&tlb, vma, addr, end, cp_flags);
 	if (nr_updated > 0) {
 		count_vm_numa_events(NUMA_PTE_UPDATES, nr_updated);
 		count_memcg_events_mm(vma->vm_mm, NUMA_PTE_UPDATES, nr_updated);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 2888ee638d87..4e66e4c7665b 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -337,6 +337,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 	long pages = 0;
 	bool is_private_single_threaded;
 	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
+	bool numa_promo_only = cp_flags & MM_CP_PROT_NUMA_PROMO_ONLY;
 	bool uffd_rwp = cp_flags & MM_CP_UFFD_RWP;
 	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
 	int nr_ptes;
@@ -384,7 +385,8 @@ static long change_pte_range(struct mmu_gather *tlb,
 			 */
 			if (prot_numa &&
 			    !folio_can_map_prot_numa(folio, vma,
-						is_private_single_threaded)) {
+						is_private_single_threaded,
+						numa_promo_only)) {
 
 				/* determine batch to skip */
 				nr_ptes = mprotect_folio_pte_batch(folio,
-- 
2.55.0

