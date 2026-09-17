Received: from mta0.migadu.com (out-68.mta0.migadu.com [91.218.175.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363453845B0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623642; cv=none; b=tbEIJoQpOX/bL4FOVQGu6BLL6SDha6wCyZmUe94NT4GpMQdG+eo3Dj7ONDqxTeI6pGy5RKLYTYRi0VjkCwMukV/zc9SnOB0qGQJ9mXhdtuYMErEGCdC8oCLDrHKuNAqBDM+QNEoJzc8dVDR4lKUmAFfuFvGcZZGlyuwa7i2Yz20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623642; c=relaxed/simple;
	bh=5cYIixR20pZ41MM/JZMhsmLuC7wrwh8fwwhI/LOf6y0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HRGWPuEWPvqT3JtuAGTDKiokJA3VC4DCZnzk/pF9VSeINB/1NMCb5x5Uiprof7jAzQW6zjeIw9yx+M9OXrEh8mq0rrfUthmr2IH34FrnlHzWHuopVudqsY0MtH9YbT57MdYGIIPWjqsdjkllj6GEfGtBBt9/GHBhdvApxK+fX/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pay6ww/B; arc=none smtp.client-ip=91.218.175.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pay6ww/B"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5cYIixR20pZ41MM/JZMhsmLuC7wrwh8fwwhI/LOf6y0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789623636; v=1; x=1790228436;
 b=pay6ww/Bia5KhJ4XlU1/8O/lISA35cULXkteBnAcWlStmuT+LwzYKiBN2jB4nT4XBB2Fohdl
 s2lQr7Bcc9F5RgJP2MppryNVeXkbR97DzhLf+7TF7C6hRX2FKckJ7s0WuIrAjp6xXVVtf3wXv9J
 NuhaO6lVwsBnc0y66od7lSz8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 21436b97f924de40;
	Thu, 17 Sep 2026 05:40:36 +0000
X-Mizu-Trace-ID: 21436b97f924de40
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] mm/huge_memory: simplify pgtable deposit detection
Date: Thu, 17 Sep 2026 13:40:15 +0800
Message-ID: <20260917054015.23553-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Whether a PMD has a deposited PTE page table only depends on whether the
architecture requires deposits or the VMA is anonymous.

Implement this rule directly in vma_has_deposited_pgtable(), avoiding
mistaking a non-anonymous raw PFN PMD for one with a deposit and attempting
to withdraw a page table that was never deposited.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
v1 -> v2:
 - Simplify the pgtable deposit check and rename the helper (per David) - thanks!
 - https://lore.kernel.org/linux-mm/20260913051942.40889-1-lance.yang@linux.dev

 mm/huge_memory.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 30b7c63b0e35..bfd972b997f9 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2521,25 +2521,13 @@ static struct folio *normal_or_softleaf_folio_pmd(struct vm_area_struct *vma,
 	return pmd_to_softleaf_folio(pmdval);
 }
 
-static bool has_deposited_pgtable(struct vm_area_struct *vma, pmd_t pmdval,
-		struct folio *folio)
+static bool vma_has_deposited_pgtable(struct vm_area_struct *vma)
 {
-	/* Some architectures require unconditional depositing. */
-	if (arch_needs_pgtable_deposit())
-		return true;
-
-	/*
-	 * Huge zero always deposited except for DAX which handles itself, see
-	 * set_huge_zero_folio().
-	 */
-	if (is_huge_zero_pmd(pmdval))
-		return !vma_is_dax(vma);
-
 	/*
-	 * Otherwise, only anonymous folios are deposited, see
-	 * __do_huge_pmd_anonymous_page().
+	 * PMDs in anonymous VMAs always have a deposited page table. PMDs in
+	 * other VMAs only have one when required by the architecture.
 	 */
-	return folio && folio_test_anon(folio);
+	return arch_needs_pgtable_deposit() || vma_is_anonymous(vma);
 }
 
 /**
@@ -2579,7 +2567,7 @@ bool zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 
 	is_present = pmd_present(orig_pmd);
 	folio = normal_or_softleaf_folio_pmd(vma, addr, orig_pmd, is_present);
-	has_deposit = has_deposited_pgtable(vma, orig_pmd, folio);
+	has_deposit = vma_has_deposited_pgtable(vma);
 	if (folio)
 		zap_huge_pmd_folio(mm, vma, orig_pmd, folio, is_present);
 	if (has_deposit)
-- 
2.39.3 (Apple Git-146)
