Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049F434214A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241483; cv=none; b=ka/pzJmQPrgVjBdK4eHECqL2NxbK2FbqViIKVkqgvm7x093NhoXiWe9ozBZVVkxx+CBDbZHGIrLj8oxSr+8HxTD2qCmMVyhq5PzJnW8I4GyrbHOo3KwnnVQd0aSZfVYzfqnhlym3/GbhoN22zAtdFr0/Q1aKM8fG115TqBZMwT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241483; c=relaxed/simple;
	bh=hmuhLEjycle0vItvKp8YgT1Zsj6d4IkLCimp6M+bfX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpQhF3QJ3WppPWOTzKRQV1rzDXfssn0K+2VoWtzd2P4A46fpe3MzQbpLydll8e3FEBot+KUHf9dRKMnFEvGnmfi+iNKXH4JeN5k0GtcigNBb8UNxeyrBgYk80KWrRXuQwhVOvxiI9X8+BsSop/9ZcC4/1GLLUDkwtQZqXOJvInk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tWwefnfA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tWwefnfA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A294E1756;
	Mon, 31 Aug 2026 22:44:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8DF4E3F85F;
	Mon, 31 Aug 2026 22:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788241480; bh=hmuhLEjycle0vItvKp8YgT1Zsj6d4IkLCimp6M+bfX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tWwefnfAhhBIpkRqqur17UuVtt3/sSCqdPq2EY+WY4FNf1DHC36JM1Q8qvEKzdYIh
	 Gtxx0+HQorULV+ZQ69Khn+KIV3NV5xPZQSCirYE2riTZlphNNqZ8+sJv43mfhL+n4J
	 lPNgmUXmQHJXdWSxXuSl0IY2Y38ckOUv1mhy+xQo=
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
Subject: [PATCH v2 4/8] mm/rmap: Add batched version of folio_try_share_anon_rmap_pte
Date: Tue,  1 Sep 2026 05:43:51 +0000
Message-ID: <20260901054358.4049095-5-dev.jain@arm.com>
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

To enable batched unmapping of anonymous folios, we need to handle the
sharing of exclusive pages. Hence, a batched version of
folio_try_share_anon_rmap_pte is required.

Currently, the sole purpose of nr_pages in __folio_try_share_anon_rmap is
to do some rmap sanity checks. Now, clear the PageAnonExclusive bit on a
batch of nr_pages. Refactor the function such that the clearing of the bit
can be done at one place without duplication.

Note that __folio_try_share_anon_rmap can receive nr_pages == HPAGE_PMD_NR
from the PMD path, but currently we only clear the bit on the head page.
Retain this behaviour by setting nr_pages = 1 in case the caller is
folio_try_share_anon_rmap_pmd.

While at it, convert nr_pages to unsigned long to future-proof from
overflow in case P4D-huge mappings etc get supported down the road.
I haven't made such a change in each function receiving nr_pages in
try_to_unmap_one - perhaps this can be done incrementally.

Add two WARN's: check that the batch is entirely exclusive (for PMD
callers, need to check only head page), and that there are only
PTE/PMD paths converging into __folio_try_share_anon_rmap.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 include/linux/rmap.h | 56 ++++++++++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 0b332770abeed..320f9f14f6020 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -706,17 +706,23 @@ static inline int folio_try_dup_anon_rmap_pmd(struct folio *folio,
 }
 
 static __always_inline int __folio_try_share_anon_rmap(struct folio *folio,
-		struct page *page, int nr_pages, enum pgtable_level level)
+		struct page *page, unsigned long nr_pages, enum pgtable_level level)
 {
+	/* device private folios cannot get pinned via GUP. */
+	const bool pinnable = !folio_is_device_private(folio);
+
 	VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
 	VM_WARN_ON_FOLIO(!PageAnonExclusive(page), folio);
+
 	__folio_rmap_sanity_checks(folio, page, nr_pages, level);
 
-	/* device private folios cannot get pinned via GUP. */
-	if (unlikely(folio_is_device_private(folio))) {
-		ClearPageAnonExclusive(page);
-		return 0;
-	}
+	VM_WARN_ON_ONCE(level > PGTABLE_LEVEL_PMD);
+
+	/* We only clear anon-exclusive from head page of PMD folio. */
+	if (level == PGTABLE_LEVEL_PMD)
+		nr_pages = 1;
+
+	VM_WARN_ON_FOLIO(page_anon_exclusive_batch(0, nr_pages, page, true) != nr_pages, folio);
 
 	/*
 	 * We have to make sure that when we clear PageAnonExclusive, that
@@ -760,29 +766,38 @@ static __always_inline int __folio_try_share_anon_rmap(struct folio *folio,
 	 * so we use explicit ones here.
 	 */
 
-	/* Paired with the memory barrier in try_grab_folio(). */
-	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
-		smp_mb();
+	if (likely(pinnable)) {
+		/* Paired with the memory barrier in try_grab_folio(). */
+		if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
+			smp_mb();
 
-	if (unlikely(folio_maybe_dma_pinned(folio)))
-		return -EBUSY;
-	ClearPageAnonExclusive(page);
+		if (unlikely(folio_maybe_dma_pinned(folio)))
+			return -EBUSY;
+	}
+
+	for (;;) {
+		ClearPageAnonExclusive(page);
+		if (--nr_pages == 0)
+			break;
+		page++;
+	}
 
 	/*
 	 * This is conceptually a smp_wmb() paired with the smp_rmb() in
 	 * gup_must_unshare().
 	 */
-	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
+	if (likely(pinnable) && IS_ENABLED(CONFIG_HAVE_GUP_FAST))
 		smp_mb__after_atomic();
 	return 0;
 }
 
 /**
- * folio_try_share_anon_rmap_pte - try marking an exclusive anonymous page
- *				   mapped by a PTE possibly shared to prepare
+ * folio_try_share_anon_rmap_ptes - try marking exclusive anonymous pages
+ *				   mapped by PTEs possibly shared to prepare
  *				   for KSM or temporary unmapping
  * @folio:	The folio to share a mapping of
- * @page:	The mapped exclusive page
+ * @page:	The first mapped exclusive page of the batch in the folio
+ * @nr_pages:	The number of pages to share in the folio (batch size)
  *
  * The caller needs to hold the page table lock and has to have the page table
  * entries cleared/invalidated.
@@ -798,10 +813,17 @@ static __always_inline int __folio_try_share_anon_rmap(struct folio *folio,
  * Returns 0 if marking the mapped page possibly shared succeeded. Returns
  * -EBUSY otherwise.
  */
+static inline int folio_try_share_anon_rmap_ptes(struct folio *folio,
+		struct page *page, unsigned long nr_pages)
+{
+	return __folio_try_share_anon_rmap(folio, page, nr_pages,
+					   PGTABLE_LEVEL_PTE);
+}
+
 static inline int folio_try_share_anon_rmap_pte(struct folio *folio,
 		struct page *page)
 {
-	return __folio_try_share_anon_rmap(folio, page, 1, PGTABLE_LEVEL_PTE);
+	return folio_try_share_anon_rmap_ptes(folio, page, 1);
 }
 
 /**
-- 
2.43.0

