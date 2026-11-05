Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904105;
	b=2xUdUFT/qDOrfPPSOjHxwHHNqz8aBJv2IeXdQuAoZ5jYcZ9aKAcxp/zd8H4Wj3E1w1xm
	 mgMtjbzQsjru5QUwpqwK0nSWd0KrjsJUGPH8G/baQ1tNblkRjf1y3A4iwiwyTOj6iNANd
	 OWzx/+effFqkIbstZ8LsxFtfwD58BM2zWJQ0W7HfOWvL/y8UaCHYiFVQ2d2NNyDBilMJg
	 QTuFyd2p0+Puv4mj6XokMcKb5O4vMn5z854bCyAH8cmNyWc2c8SUXkF9JPRPbBiKkQkvD
	 dNr9xrNCnl2jlK6s59a5PHhQYnMMLGQKbiJaEyWQCIY60X3nfv1SSpKcHx827ghuwwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904105;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2Fod23qsPbOM1tVlcHaZOrkXwIAkgiKw/W8BENTibQs=;
	b=Kb0lkNXOf8OTIb1EVBvT2c7oL2ZLKsUx1W8DbhZ5N5aI4GX0deAfjL2ukfU76h/in/sU
	 obXUHmkSff65bW/i8MbCryeb3vYSHOnMX7j7dkes/crzfAxp0dS7E+z1vYooxK+G3yHZG
	 7WVtk+wFs1sTFcS2lYRBOD7aie8/rmwQsuAN+0pNQzZwDlb1xMM3xtosC5fflW2eUK1DQ
	 +wDbR16Sr+iFgq/G15LvCuoZ26EQWKQAxTQZQMJeRcH4aOOFjOMVDEvNYUMbZbiQQ1HZz
	 V4AkzxLLwer7CZG5HH8vd1aEn2p9fmYXOwLQb/EL6FJQEsUZFGTPPtykY/e8t4Q597g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ArdHY2EY;
	arc=none smtp.remote-ip=91.218.175.229
Received: from mta0.migadu.com (out-229.mta0.migadu.com [91.218.175.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966B5606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 966B5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ArdHY2EY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RxoIa9gOc32/fyswBjJHft9MO4qoFCZyc3e19SH1Bt0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904102; v=1; x=1794508902;
 b=ArdHY2EYVcLwpt7Rr10Gljn0+6DlXYyf8zrv+f8BPPmal8hDs0b2rtabJm1165Mn7AA4GtkK
 ifOJStFvWLA5l7JgAae4X5ycAk5IYSdGfM4i9FXYVx+aO1YQE4Cz8OjDThhei0GY8JEu7Msnvbw
 nRx8vz5U/Sl0rvGc3Eg2DVCY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 2423b80fe0ccb823;
	Thu, 05 Nov 2026 18:41:42 +0000
X-Mizu-Trace-ID: 2423b80fe0ccb823
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
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
Subject: [PATCH v9 19/32] mm: handle soft-dirty and uffd-wp on PMD swap entries
Date: Thu,  5 Nov 2026 10:39:03 -0800
Message-ID: <20261105183940.2236717-20-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
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
index bfe9d6af76d5a..aa0c8c1be9b0d 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1663,7 +1663,7 @@ static void clear_soft_dirty_pmd(struct vm_area_struct *vma,
 		pmd = pmd_clear_soft_dirty(pmd);
 
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
-	} else if (pmd_is_migration_entry(pmd)) {
+	} else if (pmd_is_migration_entry(pmd) || pmd_is_swap_entry(pmd)) {
 		pmd = pmd_swp_clear_soft_dirty(pmd);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
 	}
@@ -2491,7 +2491,7 @@ static void make_uffd_wp_pmd(struct vm_area_struct *vma,
 		old = pmdp_invalidate_ad(vma, addr, pmdp);
 		pmd = pmd_mkuffd(old);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
-	} else if (pmd_is_migration_entry(pmd)) {
+	} else if (pmd_is_migration_entry(pmd) || pmd_is_swap_entry(pmd)) {
 		pmd = pmd_swp_mkuffd(pmd);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
 	}
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index acb540235e5a9..101ec72944cbf 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2626,7 +2626,8 @@ static inline int pmd_move_must_withdraw(spinlock_t *new_pmd_ptl,
 static pmd_t move_soft_dirty_pmd(pmd_t pmd)
 {
 	if (pgtable_supports_soft_dirty()) {
-		if (unlikely(pmd_is_migration_entry(pmd)))
+		if (unlikely(pmd_is_migration_entry(pmd) ||
+			     pmd_is_swap_entry(pmd)))
 			pmd = pmd_swp_mksoft_dirty(pmd);
 		else if (pmd_present(pmd))
 			pmd = pmd_mksoft_dirty(pmd);
@@ -2718,6 +2719,12 @@ static void change_non_present_huge_pmd(struct mm_struct *mm,
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
 
@@ -2778,7 +2785,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	if (!ptl)
 		return 0;
 
-	if (thp_migration_supported() && pmd_is_valid_softleaf(*pmd)) {
+	if (pmd_is_valid_softleaf(*pmd)) {
 		change_non_present_huge_pmd(mm, addr, pmd, uffd_prot,
 					    uffd_prot_resolve);
 		goto unlock;
-- 
2.53.0-Meta

