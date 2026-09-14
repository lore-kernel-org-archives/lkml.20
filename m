Received: from mta0.migadu.com (out-139.mta0.migadu.com [91.218.175.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A3745D930
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389109; cv=none; b=R/KCbzlcnUabLSRrMqGZiBcsstOp8BZAtj3iOfceBrETN/qus6AAzjYQtx8h3rEeFMUK0gsJ63mKVzCQV3LcAwHpdhNcqCQ99Mo6JvqnzmkDng93dTtynJ7pb6Z6mo43wLiBGQiUkK52OAIKrcNFEeniiCo1FRJYPYPwYeI97+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389109; c=relaxed/simple;
	bh=2eHW0y7y7uGyU1RGoY9G808x9f5l4A7c7aMBHiLQq+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BmRRdjTGNkInmRC6EdwGWgxOqU9qcmTfEZ5GgHMbJ2egmTKASYKumOQg42U0WkSbEliW8Qyf30mlJwv0vheV8RwVLbakHplywnehqK5uZhvRsb8ACOb2ZlBIHTNm4TtNBL6Xrtc4F71BS//2fAZ3m5EUg6HBW+9jo6KxrlRUYNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d9WjUnY2; arc=none smtp.client-ip=91.218.175.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d9WjUnY2"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2eHW0y7y7uGyU1RGoY9G808x9f5l4A7c7aMBHiLQq+A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789389101; v=1; x=1789993901;
 b=d9WjUnY2evR8QgKHUj2PVKmLVy6KFGm5/nWQiO0iGSkyD3UtI0fv63IVqfX7onGpMML8L+Yp
 7SoPe0qwjpykcWqmwS2FAxk3gfajIMB+7e8/gKa0dSKCQk7ti3/Dukkh2Fj3sLJvpo4PYJKyChz
 1U87qA7KSWfsxxkobuDzjx1Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id d75a3d950def4de7;
	Mon, 14 Sep 2026 12:31:41 +0000
X-Mizu-Trace-ID: d75a3d950def4de7
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
Subject: [RESEND v7 16/29] mm: handle soft-dirty and uffd-wp on PMD swap entries
Date: Mon, 14 Sep 2026 05:28:06 -0700
Message-ID: <20260914122950.3283997-17-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914122950.3283997-1-usama.arif@linux.dev>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
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
index aa3f4d54a8580..ad0d4c7f0988b 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1654,7 +1654,7 @@ static void clear_soft_dirty_pmd(struct vm_area_struct *vma,
 		pmd = pmd_clear_soft_dirty(pmd);
 
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
-	} else if (pmd_is_migration_entry(pmd)) {
+	} else if (pmd_is_migration_entry(pmd) || pmd_is_swap_entry(pmd)) {
 		pmd = pmd_swp_clear_soft_dirty(pmd);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
 	}
@@ -2480,7 +2480,7 @@ static void make_uffd_wp_pmd(struct vm_area_struct *vma,
 		old = pmdp_invalidate_ad(vma, addr, pmdp);
 		pmd = pmd_mkuffd(old);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
-	} else if (pmd_is_migration_entry(pmd)) {
+	} else if (pmd_is_migration_entry(pmd) || pmd_is_swap_entry(pmd)) {
 		pmd = pmd_swp_mkuffd(pmd);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
 	}
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 6dfe8ef6dd371..d3d0fec9a5ff3 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2660,7 +2660,8 @@ static inline int pmd_move_must_withdraw(spinlock_t *new_pmd_ptl,
 static pmd_t move_soft_dirty_pmd(pmd_t pmd)
 {
 	if (pgtable_supports_soft_dirty()) {
-		if (unlikely(pmd_is_migration_entry(pmd)))
+		if (unlikely(pmd_is_migration_entry(pmd) ||
+			     pmd_is_swap_entry(pmd)))
 			pmd = pmd_swp_mksoft_dirty(pmd);
 		else if (pmd_present(pmd))
 			pmd = pmd_mksoft_dirty(pmd);
@@ -2752,6 +2753,12 @@ static void change_non_present_huge_pmd(struct mm_struct *mm,
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
 
@@ -2812,7 +2819,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	if (!ptl)
 		return 0;
 
-	if (thp_migration_supported() && pmd_is_valid_softleaf(*pmd)) {
+	if (pmd_is_valid_softleaf(*pmd)) {
 		change_non_present_huge_pmd(mm, addr, pmd, uffd_prot,
 					    uffd_prot_resolve);
 		goto unlock;
-- 
2.53.0-Meta

