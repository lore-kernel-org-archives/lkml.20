Received: from mta0.migadu.com (out-50.mta0.migadu.com [91.218.175.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59977457E64
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934992; cv=none; b=RifksA3i3GoCXZwZNtB3l0nRNrw5hqf8BTiMUQ6yZxaYHGs5G6T7elzGpmGdiq1J54Tddx47AXyChFKkvV3/5j8bPgbFAeuddc0f3YkL4U/JEQv9CVnXKOSLTk89pIqsyWrsr1efONaQ/He4Y4uHYKKIR7/YziPuRe/rvFDujgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934992; c=relaxed/simple;
	bh=Gqph+pRQ2PnxiCPetGAbfk568P6MjZ14SuRBF6mfi6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiB0AcwVfYj9vzZOKpIkwNsM8obtV04C1O/9i6TU/b/rwrjIAev03bIOsduinhrm9Zl1dfbdglupjur/pqOsIF9Ff9QtcrLRZ8jQf2tMA3agBxMECaQj17Gz1n2btSzaxc0G+0sE/JpS75pgl9Fwo7S+8ltQqR7DqCchHrSeQ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gPbxyHM3; arc=none smtp.client-ip=91.218.175.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gPbxyHM3"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Gqph+pRQ2PnxiCPetGAbfk568P6MjZ14SuRBF6mfi6M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790934989; v=1; x=1791539789;
 b=gPbxyHM3n85SE/ngJ0pgAd0Kfdl2Hx1F+rVpKTGTHQz004h5DLET6qiR7Mn0jZXJyHO6wyps
 1i9Yq2JoaLoOYQWcVwf1TV/M+6Ok5OeS26nFykwYeq3PTZSvZE06E5GWbnoBLLx3yXnAHXiTQsy
 pDa3npPYGLCyZSAiRR3Djkf0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 53404ca15399baf8;
	Fri, 02 Oct 2026 09:56:28 +0000
X-Mizu-Trace-ID: 53404ca15399baf8
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
Subject: [PATCH v8 11/30] mm: split PMD swap entries into PTE swap entries
Date: Fri,  2 Oct 2026 02:52:25 -0700
Message-ID: <20261002095503.3585565-12-usama.arif@linux.dev>
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

Once a PMD can hold a swap entry, everything that splits a PMD - mprotect()
or munmap() over part of the range, MADV_FREE, a pagewalk with no PMD
handler - has to be able to split that entry too. A swap PMD already passes
the pmd_is_valid_softleaf() gate, so without this it reaches
__split_huge_pmd_locked() and falls through to the present-PMD path, which
pmdp_invalidate()s it and calls pmd_page() on a non-present entry.

No reference counting is needed: a swap entry pins no folio, and swap_map
is already one per slot, so the PTEs simply take over what the PMD held.

The migration-only entry point cannot reach the new branch:
page_vma_mapped_walk() never hands back a swap PMD, and
__split_huge_pmd_locked() already asserts that to_migration_entries
implies a present or device-private PMD.

Test the pre-split old_pmd rather than re-reading *pmd in the trailing
folio_remove_rmap_pmd() gate, so every entry-type test in the function
interrogates the same snapshot. That part is cosmetic: pmdp_invalidate()
leaves the PMD present as far as software is concerned.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/huge_memory.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1df4f619620b4..24d116ae1fc30 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3306,6 +3306,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
 						 vma, haddr, rmap_flags);
 		}
+	} else if (pmd_is_swap_entry(*pmd)) {
+		old_pmd = *pmd;
+		soft_dirty = pmd_swp_soft_dirty(old_pmd);
+		uffd_wp = pmd_swp_uffd(old_pmd);
+		anon_exclusive = pmd_swp_exclusive(old_pmd);
 	} else {
 		/*
 		 * Up to this point the pmd is present and huge and userland has
@@ -3443,6 +3448,21 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
 		}
+	} else if (pmd_is_swap_entry(old_pmd)) {
+		pte_t entry = softleaf_to_pte(softleaf_from_pmd(old_pmd));
+
+		if (soft_dirty)
+			entry = pte_swp_mksoft_dirty(entry);
+		if (uffd_wp)
+			entry = pte_swp_mkuffd(entry);
+		if (anon_exclusive)
+			entry = pte_swp_mkexclusive(entry);
+
+		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
+			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
+			set_pte_at(mm, addr, pte + i, entry);
+			entry = pte_next_swp_offset(entry);
+		}
 	} else {
 		pte_t entry;
 
@@ -3470,7 +3490,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (!pmd_is_migration_entry(*pmd))
+	if (!pmd_is_migration_entry(old_pmd) && !pmd_is_swap_entry(old_pmd))
 		folio_remove_rmap_pmd(folio, page, vma);
 	if (to_migration_entries)
 		put_page(page);
-- 
2.53.0-Meta

