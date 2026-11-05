Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904071;
	b=ONCdblAeLs0M12qEzKFTHUKN58yxZ7PEpdR8F7Zp2mQoX4bd+GtuNH/vTP9rvKQ1oqpH
	 EbqRY8NOwL0XAogU38gKuqNb8fGNsH/RD6lEDpYRApeINdUzM7+EH4BvIBA8t3/IDQSY1
	 3gH3FE49lQY5nFghOlo4WNiiT2I0SctbEIlSXrZA9QdWIV1LEQu5Dgso8HEHRgrJ2O4wR
	 1GEDWQyyyREBWIHy2Qm1R8Nb6W/rRbqCr9oDpHGuHHwsWnvS+3VFNRWVA6fjAScKQro1H
	 rwJNcHJIq0IgIq+yQimozeEJyzh7WK1KBy2PhapARL1t7b+40M3/wMO08ZW7XvpmHow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904071;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t7Jct9y+6ArpUxCaGk0vmeQH2/k8NYaEq0BCM+Ywj4U=;
	b=ljnWp0nv3eNxygAohFh/Bt2XEwewNRWybrK+P2cDFJURyVzLEl/k3nt46+t8it0YNcVB
	 aWYxkV0XwBL3M5NhkOkSTI3K9RjicFqU+Aw9eT+9aQXKBBiZ6lW8IH0Ve8rHu8GKfEP2V
	 XSbhMqGqDCHZ8Xku2J+vCK+5RDEn3YUJ5qrK+tpy5O6T3Y59NVFOLFf7g4eH5MNAQxpWG
	 K3xzWTgBzUdgf7m0iVKuhTFoeU0ikMCHpWadLJrMm1NfCmnldVS3Kas/97ma7MqGEN99Y
	 tfWQmPu5vh1+fTgNu/S04XWryGCmVobiA+iCrXq+V7h8yxOCsXFHq89DnvODrYy6fKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nvU86g8p;
	arc=none smtp.remote-ip=95.215.58.152
Received: from mta1.migadu.com (out-152.mta1.migadu.com [95.215.58.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16428606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16428606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nvU86g8p
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lWRNmKDZPAcDKyorsbfNDAYvamSfN3OR0hdfegr8JeU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904069; v=1; x=1794508869;
 b=nvU86g8pfSGr+7tVrn5cIij0TtrUvRENOpR5PlV7fpUMigWYGIIhRYfbj50aMJCaKO/DUp7x
 sVrnYToam4oFB2veuoJ26xPHZGltti1O0JHCngCbFkaa96pXcwjyaLipXP4MM/jq1CGaKpikqVr
 Fs2z6qNA5Mh6yW/sqmM2yJm4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id c067aed4d3f4d4a2;
	Thu, 05 Nov 2026 18:41:08 +0000
X-Mizu-Trace-ID: c067aed4d3f4d4a2
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
Subject: [PATCH v9 12/32] mm: split PMD swap entries into PTE swap entries
Date: Thu,  5 Nov 2026 10:38:56 -0800
Message-ID: <20261105183940.2236717-13-usama.arif@linux.dev>
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
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 mm/huge_memory.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 82a4fa9342672..696813776e45d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3292,6 +3292,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
@@ -3429,6 +3434,21 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
 
@@ -3456,7 +3476,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (!pmd_is_migration_entry(*pmd))
+	if (!pmd_is_migration_entry(old_pmd) && !pmd_is_swap_entry(old_pmd))
 		folio_remove_rmap_pmd(folio, page, vma);
 	if (to_migration_entries)
 		put_page(page);
-- 
2.53.0-Meta

