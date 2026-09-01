Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56E734214A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241490; cv=none; b=o75NkNz+YF7BPTtaIUEWfOeOeNJvs8y378fGc4s7Wbvw9AvRipT5ZvwHtqQxMWvBnA/gMKLWG0NxoC374+iSev7ErGAgGZrVm3Z7WOdAB9U2VMJDn9xaKqXl9g1F4ZUXrpXn4QdT+ns3OZslH2JGPr32C5zEIYUrz88DSfOWotk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241490; c=relaxed/simple;
	bh=BVSsEb8Y4xZRhSjlcLhU6nuyLKvRJakBNGn8zZZjAdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYBEW9fQLo+51DK/euwKm/pyRDEepJXonlIqoALgtkNfNPIpKvsYJgkEhqoHIUTQyDvll7aZUfd8FMNFN/7k2qLE5RHkIlP+DuGW+ls8k/Jv28WppaUtsIuIPh9Sn/ANUR9t2n9AhH1UxzY+1bgzteLL6RGK8LegZHXAWCkoGzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OAoPFr7R; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OAoPFr7R"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B91B1AED;
	Mon, 31 Aug 2026 22:44:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EBF573F85F;
	Mon, 31 Aug 2026 22:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788241487; bh=BVSsEb8Y4xZRhSjlcLhU6nuyLKvRJakBNGn8zZZjAdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OAoPFr7RxqkStsgeCzWgVlGw7svdApDqRN/OJtlKUF6uq62xSS8tpChKZ9r72yNBM
	 JNM+uw/lf8lkFIZnS/YHdWkWq5kkT8UNU57mRx0n10nqWOm8xAJ5fgQELW4tf4mPP1
	 j01pd9nAh0f1UPXHsUU3/HoTniu443zYt6IzEM0o=
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com,
	chrisl@kernel.org,
	kasong@tencent.com
Cc: Dev Jain <dev.jain@arm.com>,
	riel@surriel.com,
	liam@infradead.org,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	baolin.wang@linux.alibaba.com,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	pfalcato@suse.de,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com
Subject: [PATCH v2 5/8] mm/internal: rename swap offset helpers to softleaf offset
Date: Tue,  1 Sep 2026 05:43:52 +0000
Message-ID: <20260901054358.4049095-6-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901054358.4049095-1-dev.jain@arm.com>
References: <20260901054358.4049095-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding a helper to set softleaf ptes in one go,
generalize the swap entry helpers shifting the swap offset by delta,
for softleaves.

Note that the soft-dirty bit, exclusive bit and uffd bit preservation
will still work for non-swap softleaves, since a softleaf entry is
constructed out of a type and offset, and those bits are ahead of
the soft-dirty, exclusive and uffd bits.

For example, for a migration entry, pte_swp_exclusive() will return
false, as the exclusivity is encoded in the type itself
(SOFTLEAF_MIGRATION_READ_EXCLUSIVE).

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/internal.h | 29 +++++++++++++++--------------
 mm/memory.c   |  4 ++--
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 38b1165212c94..cfea888366d58 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -468,16 +468,16 @@ unsigned int folio_pte_batch(struct folio *folio, pte_t *ptep, pte_t pte,
 		unsigned int max_nr);
 
 /**
- * pte_move_swp_offset - Move the swap entry offset field of a swap pte
- *	 forward or backward by delta
- * @pte: The initial pte state; must be a swap entry
+ * pte_move_softleaf_offset - Move the softleaf entry offset field of a
+ * softleaf pte forward or backward by delta
+ * @pte: The initial pte state; must be a softleaf entry
  * @delta: The direction and the offset we are moving; forward if delta
  *	 is positive; backward if delta is negative
  *
- * Moves the swap offset, while maintaining all other fields, including
- * swap type, and any swp pte bits. The resulting pte is returned.
+ * Moves the softleaf offset, while maintaining all other fields, including
+ * softleaf type, and any softleaf pte bits. The resulting pte is returned.
  */
-static inline pte_t pte_move_swp_offset(pte_t pte, long delta)
+static inline pte_t pte_move_softleaf_offset(pte_t pte, long delta)
 {
 	const softleaf_t entry = softleaf_from_pte(pte);
 	pte_t new = __swp_entry_to_pte(__swp_entry(swp_type(entry),
@@ -495,15 +495,16 @@ static inline pte_t pte_move_swp_offset(pte_t pte, long delta)
 
 
 /**
- * pte_next_swp_offset - Increment the swap entry offset field of a swap pte.
- * @pte: The initial pte state; must be a swap entry.
+ * pte_next_softleaf_offset - Increment the softleaf entry offset field of a
+ * non-present pte.
+ * @pte: The initial pte state; must be a softleaf entry.
  *
- * Increments the swap offset, while maintaining all other fields, including
- * swap type, and any swp pte bits. The resulting pte is returned.
+ * Increments the softleaf offset, while maintaining all other fields, including
+ * softleaf type, and any softleaf pte bits. The resulting pte is returned.
  */
-static inline pte_t pte_next_swp_offset(pte_t pte)
+static inline pte_t pte_next_softleaf_offset(pte_t pte)
 {
-	return pte_move_swp_offset(pte, 1);
+	return pte_move_softleaf_offset(pte, 1);
 }
 
 /**
@@ -523,7 +524,7 @@ static inline pte_t pte_next_swp_offset(pte_t pte)
  */
 static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
 {
-	pte_t expected_pte = pte_next_swp_offset(pte);
+	pte_t expected_pte = pte_next_softleaf_offset(pte);
 	const pte_t *end_ptep = start_ptep + max_nr;
 	pte_t *ptep = start_ptep + 1;
 
@@ -535,7 +536,7 @@ static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
 
 		if (!pte_same(pte, expected_pte))
 			break;
-		expected_pte = pte_next_swp_offset(expected_pte);
+		expected_pte = pte_next_softleaf_offset(expected_pte);
 		ptep++;
 	}
 
diff --git a/mm/memory.c b/mm/memory.c
index 6cfea4faf0588..7ce8413a8117d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4757,7 +4757,7 @@ static bool can_swapin_thp(struct vm_fault *vmf, pte_t *ptep, int nr_pages)
 	idx = (vmf->address - addr) / PAGE_SIZE;
 	pte = ptep_get(ptep);
 
-	if (!pte_same(pte, pte_move_swp_offset(vmf->orig_pte, -idx)))
+	if (!pte_same(pte, pte_move_softleaf_offset(vmf->orig_pte, -idx)))
 		return false;
 	/*
 	 * swap_read_folio() can't handle the case a large folio is hybridly
@@ -5066,7 +5066,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 
 		folio_ptep = vmf->pte - idx;
 		folio_pte = ptep_get(folio_ptep);
-		if (!pte_same(folio_pte, pte_move_swp_offset(vmf->orig_pte, -idx)) ||
+		if (!pte_same(folio_pte, pte_move_softleaf_offset(vmf->orig_pte, -idx)) ||
 		    swap_pte_batch(folio_ptep, nr, folio_pte) != nr)
 			goto check_folio;
 
-- 
2.43.0

