Received: from mta0.migadu.com (out-41.mta0.migadu.com [91.218.175.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECFE45C71C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389097; cv=none; b=POZprCsTT/EKAiNSPPp5A0FfiHAvaJzQQB3PY3ts21ZSjlx1HxDxBsQTVAM0w9bU2wc6QXEJcTui9c8tcE40HRmkIhkT3WM3YibSVJRwI1S7IKzL57gw+NJcri0FK5z9+OnXUG5a8OPd5dKfUvU3dsDSbYEjYR5ng1V+rmwID7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389097; c=relaxed/simple;
	bh=Q7Vo+oMZWSnoi9kpct14wrtvWt95QszpUVVNkFyr/6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKYbpV87KPAX0huE5VDBc38V/ozFi3htz95/d3h5utonimi64eUocV7YHoOcXSSkAuAmx6TXb8C/7FywGvxBUSCE/K8nW8LpIdyc3Aup1sAWsEnW99wvB8mXE5yyUaol1nWTMxjhn91t/gqu+Eu2vFyPsDB3uUUUU40QFX6z3nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z5GhJrBL; arc=none smtp.client-ip=91.218.175.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z5GhJrBL"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q7Vo+oMZWSnoi9kpct14wrtvWt95QszpUVVNkFyr/6c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789389086; v=1; x=1789993886;
 b=Z5GhJrBLiU2mFJd2D90uchgd529Y/fai1OvFUV9kqOBTIdFvKQ0Q6ePS/l9kPiszDgm6pNsb
 8DvDCL7/SaRToSr+wmIf4qNysI19355EWN4HBhqZiJyPz/YplWoUDECQmwCxOWMporw7/UMe3cI
 d/6uRIU5A+MsstqisGYQ1IjY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 56156af8bd9f1fa3;
	Mon, 14 Sep 2026 12:31:26 +0000
X-Mizu-Trace-ID: 56156af8bd9f1fa3
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
Subject: [RESEND v7 11/29] mm: split PMD swap entries into PTE swap entries
Date: Mon, 14 Sep 2026 05:28:01 -0700
Message-ID: <20260914122950.3283997-12-usama.arif@linux.dev>
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

Once a PMD can hold a swap entry, everything that splits a PMD - mprotect()
or munmap() over part of the range, MADV_FREE, a pagewalk with no PMD
handler - has to be able to split that entry too, or the callers that rely
on split_huge_pmd() to hand them a PTE table would find the PMD unchanged.

No reference counting is needed: a swap entry pins no folio, and swap_map
is already one per slot, so the PTEs simply take over what the PMD held.

The migration-only entry point cannot reach the new branch, because
page_vma_mapped_walk() never hands back a swap PMD for the folio being
migrated. Warn if that ever changes, and force the regular split anyway,
since the branch leaves folio and page uninitialised.

Test the pre-split old_pmd rather than re-reading *pmd in the trailing
folio_remove_rmap_pmd() gate, so every entry-type test in the function
interrogates the same snapshot. That part is cosmetic: pmdp_invalidate()
leaves the PMD present as far as software is concerned.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/huge_memory.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 873887aed0bc2..0e347a545588c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3304,6 +3304,21 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
 						 vma, haddr, rmap_flags);
 		}
+	} else if (pmd_is_swap_entry(*pmd)) {
+		/*
+		 * A PMD swap entry has no page, so it cannot be turned into
+		 * PTE migration entries.  page_vma_mapped_walk() never hands
+		 * one back for the folio being migrated, so this should not
+		 * happen; warn, but also force the regular split so that a
+		 * broken invariant cannot make the code below dereference the
+		 * uninitialised folio and page.
+		 */
+		VM_WARN_ON_ONCE(use_migration_entries);
+		use_migration_entries = false;
+		old_pmd = *pmd;
+		soft_dirty = pmd_swp_soft_dirty(old_pmd);
+		uffd_wp = pmd_swp_uffd(old_pmd);
+		anon_exclusive = pmd_swp_exclusive(old_pmd);
 	} else {
 		/*
 		 * Up to this point the pmd is present and huge and userland has
@@ -3440,6 +3455,25 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
 		}
+	} else if (pmd_is_swap_entry(old_pmd)) {
+		const softleaf_t old_entry = softleaf_from_pmd(old_pmd);
+		pte_t pte_swp_entry;
+		swp_entry_t entry;
+
+		for (i = 0, addr = haddr; i < HPAGE_PMD_NR;
+		     i++, addr += PAGE_SIZE) {
+			entry = swp_entry(swp_type(old_entry),
+					  swp_offset(old_entry) + i);
+			pte_swp_entry = swp_entry_to_pte(entry);
+			if (soft_dirty)
+				pte_swp_entry = pte_swp_mksoft_dirty(pte_swp_entry);
+			if (uffd_wp)
+				pte_swp_entry = pte_swp_mkuffd(pte_swp_entry);
+			if (anon_exclusive)
+				pte_swp_entry = pte_swp_mkexclusive(pte_swp_entry);
+			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
+			set_pte_at(mm, addr, pte + i, pte_swp_entry);
+		}
 	} else {
 		pte_t entry;
 
@@ -3467,7 +3501,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (!pmd_is_migration_entry(*pmd))
+	if (!pmd_is_migration_entry(old_pmd) && !pmd_is_swap_entry(old_pmd))
 		folio_remove_rmap_pmd(folio, page, vma);
 	if (use_migration_entries)
 		put_page(page);
-- 
2.53.0-Meta

