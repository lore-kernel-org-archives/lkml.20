Received: from mta1.migadu.com (out-105.mta1.migadu.com [95.215.58.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308F4485519
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935025; cv=none; b=HmGpGAANa3aUieWtiG2i8yrHuqL+8WD6IyEm25Fce6fobOc3Mi1jKW/PqhH9hGaqqKdUXdKQkTMsFRh5fpC/5NmVo7eh/NS8feKAoZlWCLFkEJTu6z7uZAQun5Tw6WymftOLw8JXCTeymeyqT5mLbpg5o8Hq7RDLYv+w7bH/Dl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935025; c=relaxed/simple;
	bh=LJuxmAXZRz2ysvPto4NuVYTODe3NrwDrlQwZEMzbd3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUk016sIgO4nj7PyxCgki+APEkjLwas6O40D4XWV27RTs/Ok2jwFrhF6/B+Pd6pRyZxTb7sCzIXAmTFeGnIH4rz3i/uUdUjY4wIHU71dmRWnuREUkh+Pe/0ofcW8JOQ8+dsepFCESGfj+bOXvkbrphcTWqa9PhJ0ZP5X+R+rIpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eBdrL6Kp; arc=none smtp.client-ip=95.215.58.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eBdrL6Kp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LJuxmAXZRz2ysvPto4NuVYTODe3NrwDrlQwZEMzbd3g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790935021; v=1; x=1791539821;
 b=eBdrL6KpnsDy49ceqbpx7OyQfw4CyqGhRhlgkRhlcz7Z6srKmuaF2ESgxVeTmul0mpskFnQL
 rl+gRByl5hyqOn96iuKhT3Skvd2BiDnn7hdUb9mrO+QZ0pyFVLxLd7vQ4T5dP+0+yaFR+qG2fVd
 YbBYy8dsPVbDhxwYunQn7t18=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id fda1ba0995e89929;
	Fri, 02 Oct 2026 09:57:00 +0000
X-Mizu-Trace-ID: fda1ba0995e89929
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v8 17/30] mm: handle soft-dirty and uffd-wp on PMD swap entries
Date: Fri,  2 Oct 2026 02:52:31 -0700
Message-ID: <20261002095503.3585565-18-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002095503.3585565-1-usama.arif@linux.dev>
References: <20261002095503.3585565-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Soft-dirty and uffd-wp live in the PMD, not in the swap entry, so every
path that manipulates them for a PMD migration entry has to do the same for
a PMD swap entry. Otherwise clearing soft-dirty skips a swapped-out THP,
UFFDIO_WRITEPROTECT does not arm it, and mremap does not mark the
destination.

change_huge_pmd() needs nothing beyond dropping its
thp_migration_supported() gate: a PMD swap entry encodes no write
permission, so it falls into the default arm of
change_non_present_huge_pmd() and picks up only the uffd-wp update.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 fs/proc/task_mmu.c |  4 ++--
 mm/huge_memory.c   | 11 +++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 97c3fd7acf15d..83cf39006e5f8 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1655,7 +1655,7 @@ static void clear_soft_dirty_pmd(struct vm_area_struct *vma,
 		pmd = pmd_clear_soft_dirty(pmd);
 
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
-	} else if (pmd_is_migration_entry(pmd)) {
+	} else if (pmd_is_migration_entry(pmd) || pmd_is_swap_entry(pmd)) {
 		pmd = pmd_swp_clear_soft_dirty(pmd);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
 	}
@@ -2481,7 +2481,7 @@ static void make_uffd_wp_pmd(struct vm_area_struct *vma,
 		old = pmdp_invalidate_ad(vma, addr, pmdp);
 		pmd = pmd_mkuffd(old);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
-	} else if (pmd_is_migration_entry(pmd)) {
+	} else if (pmd_is_migration_entry(pmd) || pmd_is_swap_entry(pmd)) {
 		pmd = pmd_swp_mkuffd(pmd);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
 	}
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 80d18ca972ecf..56eb87fa98376 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2637,7 +2637,8 @@ static inline int pmd_move_must_withdraw(spinlock_t *new_pmd_ptl,
 static pmd_t move_soft_dirty_pmd(pmd_t pmd)
 {
 	if (pgtable_supports_soft_dirty()) {
-		if (unlikely(pmd_is_migration_entry(pmd)))
+		if (unlikely(pmd_is_migration_entry(pmd) ||
+			     pmd_is_swap_entry(pmd)))
 			pmd = pmd_swp_mksoft_dirty(pmd);
 		else if (pmd_present(pmd))
 			pmd = pmd_mksoft_dirty(pmd);
@@ -2729,6 +2730,12 @@ static void change_non_present_huge_pmd(struct mm_struct *mm,
 	pmd_t newpmd;
 
 	VM_WARN_ON(!pmd_is_valid_softleaf(*pmd));
+
+	/*
+	 * Note that a PMD swap entry falls into the default branch below: it
+	 * does not encode write permission in the entry type, so only the
+	 * uffd_wp flag update at the end applies to it.
+	 */
 	if (softleaf_is_migration_write(entry)) {
 		const struct folio *folio = softleaf_to_folio(entry);
 
@@ -2789,7 +2796,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	if (!ptl)
 		return 0;
 
-	if (thp_migration_supported() && pmd_is_valid_softleaf(*pmd)) {
+	if (pmd_is_valid_softleaf(*pmd)) {
 		change_non_present_huge_pmd(mm, addr, pmd, uffd_prot,
 					    uffd_prot_resolve);
 		goto unlock;
-- 
2.53.0-Meta

