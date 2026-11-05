Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.60
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904142;
	b=A6C2St0U7Q7V10Kea/3SoOT+9k6quvRFk8TBAbl5pKsoe4+Dkk1W/lzzcpG92rwCS152
	 vSS3r18PDaNMtzHE7/+7IH9r1PHftrdyVUZ1H7MzI4mUpnZGxbMUdaHEnn9KTrpdZiBVf
	 u+o21ULY9q9FiFEcoO2+oOmNYNQqUXPn5xzsabWcv7k8nZ2gaFqchLDSp0cVXDoytDC9e
	 7X960dN7uihnWMFuSWzOE9Ldbdjn3hbfEBXATL431vO5NKLT5MzOdla2Nmj5T8OBUH3C0
	 /r/XgiJrxmWkPZYVszn5c0d0jbL5ahcR2O38L0P7ykYPhtGbgqU+je/Axi/VFJ0A+0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904142;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w6r6GoXW1wRqpm8rEahDU+Q8nnjGuPny+39kE7OA6eE=;
	b=T4q4YxPlUrDZhmhSdkVjxly0Syk9QMBXgiQivSmLa2Wbiqa/+qPAFdPeahcqfb9CzJdS
	 5tiZ5hTPjoQX6cG1UzozGEbZ/5TN5wM4qPIF5Tq+wmkAsHGVLLUcXZA0IjOwtCvUnkVQp
	 z7dEuudR4BhOEHV0UNsDcxzDEUd8wcJ9le8+Qn7dwI3TM0pW3JFx8eyimMfLoxFUqQtI2
	 6AMh6BLv6HSLriWcQ9rCz0DcPlcHc2p3kClnvMUndEXhymCDjQ7y91UBkD5YjvIDSdqgd
	 GIfTTmZdOoyRQYZGbpL9t1aou7b4ShboeBqO2FLU8JXccTNsEWCQgVPy/q320X1v6Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OisvzzoE;
	arc=none smtp.remote-ip=91.218.175.60
Received: from mta0.migadu.com (out-60.mta0.migadu.com [91.218.175.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C04606D814
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C04606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OisvzzoE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PHxg677bAXHmE86OEOHfaYS/DR37rbS34zhEGHcc7/4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904139; v=1; x=1794508939;
 b=OisvzzoEL38wZ2fCiKaL25KL7kY+7OIbX6qavcsa1i6geIbVt2RH8A73WxbREa3Mi5EQmFFs
 0bkrHx3u6fhrtv8Octmw2zAqyYHInkiJ62l/dgm0cyURWz0OIXRy8TyC4344gRnHJGUux58k6UO
 Gs0pcsy18gF3/HoJPC3Mgysw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 97c62b23eea458de;
	Thu, 05 Nov 2026 18:42:19 +0000
X-Mizu-Trace-ID: 97c62b23eea458de
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
Subject: [PATCH v9 28/32] mm: handle PMD swap entries in UFFDIO_MOVE
Date: Thu,  5 Nov 2026 10:39:12 -0800
Message-ID: <20261105183940.2236717-29-usama.arif@linux.dev>
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

move_pages_huge_pmd() returns -ENOENT for any PMD that is neither
trans_huge nor a migration entry, so an aligned UFFDIO_MOVE over a
swapped-out THP fails even though a PMD swap entry is a perfectly good
mapping to move. Falling back to the PTE path is no help either: splitting
yields PTE swap entries pointing at the same swap-cache folio, and
move_pages_ptes() refuses any swap-cache folio that is still large.

move_swap_pmd() is modelled on move_swap_pte(): it moves the entry under
both PMD locks, propagates soft-dirty, clears an inherited UFFD marker and
re-arms it only for an RWP-registered destination, carries the deposited
page table across, and requires pmd_swp_exclusive() for the same
single-owner semantics.

The entry can only be moved whole while the covered swap cache is empty or
holds one PMD-sized folio. A cached folio is locked and revalidated, then
its anon rmap is re-anchored to the destination VMA; an empty cache is
re-checked slot by slot under both PMD locks, because a per-slot folio that
appeared meanwhile would need the PTE path to fix up its rmap metadata. A
range that is already split is split and retried through PTEs. Revalidation
failure just returns -EAGAIN: its usual cause is a racing fault that made
src_pmd a healthy present THP, which must not be shattered.

Finally, reject a PMD swap entry at the *destination* with -EEXIST. It is
not a hole, and unlike a migration entry it does not resolve on its own:
pte_alloc() skips a !pmd_none PMD, pte_offset_map_rw_nolock() then fails,
and the resulting -EAGAIN would be retried forever.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/huge_memory.c | 159 ++++++++++++++++++++++++++++++++++++++++++++++-
 mm/userfaultfd.c |  14 +++++
 2 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 65922d9e4bec1..e02a885ea1d0b 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2938,6 +2938,79 @@ int change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
 #endif
 
 #ifdef CONFIG_USERFAULTFD
+#ifdef CONFIG_THP_SWAP
+/*
+ * Move a PMD-level swap entry from src_pmd to dst_pmd. Both PMD locks are
+ * acquired here; src_folio (if present) must already be locked. The deposited
+ * page table backing the source THP is moved across with the entry.
+ */
+static int move_swap_pmd(struct mm_struct *mm, struct vm_area_struct *dst_vma,
+			 unsigned long dst_addr, unsigned long src_addr,
+			 pmd_t *dst_pmd, pmd_t *src_pmd,
+			 pmd_t orig_dst_pmd, pmd_t orig_src_pmd,
+			 spinlock_t *dst_ptl, spinlock_t *src_ptl,
+			 struct folio *src_folio, swp_entry_t entry)
+{
+	pgtable_t src_pgtable;
+	pmd_t moved_pmd;
+
+	/*
+	 * The folio may have been freed and reused for a different swap entry
+	 * while it was unlocked. Re-verify the association.
+	 */
+	if (src_folio && unlikely(!folio_matches_swap_entry(src_folio, entry) ||
+				  folio_nr_pages(src_folio) != HPAGE_PMD_NR))
+		return -EAGAIN;
+
+	double_pt_lock(dst_ptl, src_ptl);
+
+	if (!pmd_same(*src_pmd, orig_src_pmd) ||
+	    !pmd_same(*dst_pmd, orig_dst_pmd)) {
+		double_pt_unlock(dst_ptl, src_ptl);
+		return -EAGAIN;
+	}
+
+	/*
+	 * If the folio is in the swap cache, re-anchor its anon rmap to the
+	 * destination VMA so a future swap-in fault at dst_addr finds it.
+	 * Otherwise, re-check the whole PMD swap range: a PMD swap entry is
+	 * only a compact encoding for HPAGE_PMD_NR swap slots, and any per-slot
+	 * cached folio would need the PTE move path to update its rmap
+	 * metadata.
+	 */
+	if (src_folio) {
+		folio_move_anon_rmap(src_folio, dst_vma);
+		src_folio->index = linear_anon_page_index(dst_vma, dst_addr);
+	} else {
+		unsigned int type = swp_type(entry);
+		pgoff_t offset = swp_offset(entry);
+		int i;
+
+		for (i = 0; i < HPAGE_PMD_NR; i++) {
+			if (swap_cache_has_folio(swp_entry(type, offset + i))) {
+				double_pt_unlock(dst_ptl, src_ptl);
+				return -EAGAIN;
+			}
+		}
+	}
+
+	moved_pmd = pmdp_huge_get_and_clear(mm, src_addr, src_pmd);
+	if (pgtable_supports_soft_dirty())
+		moved_pmd = pmd_swp_mksoft_dirty(moved_pmd);
+	moved_pmd = pmd_swp_clear_uffd(moved_pmd);
+	/* Re-arm RWP on the moved swap entry if dst_vma is RWP-registered. */
+	if (userfaultfd_rwp(dst_vma))
+		moved_pmd = pmd_swp_mkuffd(moved_pmd);
+	set_pmd_at(mm, dst_addr, dst_pmd, moved_pmd);
+
+	src_pgtable = pgtable_trans_huge_withdraw(mm, src_pmd);
+	pgtable_trans_huge_deposit(mm, dst_pmd, src_pgtable);
+
+	double_pt_unlock(dst_ptl, src_ptl);
+	return 0;
+}
+#endif /* CONFIG_THP_SWAP */
+
 /*
  * The PT lock for src_pmd and dst_vma/src_vma (for reading) are locked by
  * the caller, but it must return after releasing the page_table_lock.
@@ -2972,11 +3045,95 @@ int move_pages_huge_pmd(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd, pm
 	}
 
 	if (!pmd_trans_huge(src_pmdval)) {
-		spin_unlock(src_ptl);
 		if (pmd_is_migration_entry(src_pmdval)) {
+			spin_unlock(src_ptl);
 			pmd_migration_entry_wait(mm, src_pmd);
 			return -EAGAIN;
 		}
+#ifdef CONFIG_THP_SWAP
+		if (pmd_is_swap_entry(src_pmdval)) {
+			swp_entry_t entry;
+			struct swap_info_struct *si;
+			enum swap_pmd_cache cache_state;
+
+			/*
+			 * UFFDIO_MOVE on anon mappings requires single-owner
+			 * semantics; refuse to move a shared swap entry.
+			 */
+			if (!pmd_swp_exclusive(src_pmdval)) {
+				spin_unlock(src_ptl);
+				return -EBUSY;
+			}
+
+			entry = softleaf_from_pmd(src_pmdval);
+			spin_unlock(src_ptl);
+
+			/*
+			 * Pin the swap device against a racing swapoff. NULL
+			 * means swapoff is in progress, which resolves on its
+			 * own, so ask the caller to retry. An error pointer
+			 * means the entry names no swap device at all: that
+			 * never resolves, so report it instead of spinning in
+			 * the caller's -EAGAIN loop.
+			 */
+			si = get_swap_device(entry);
+			if (!si)
+				return -EAGAIN;
+			if (IS_ERR(si))
+				return PTR_ERR(si);
+
+			src_folio = NULL;
+			cache_state = swap_pmd_cache_lookup(entry, &src_folio);
+			if (cache_state == SWAP_PMD_CACHE_SPLIT) {
+				put_swap_device(si);
+				__split_huge_pmd(src_vma, src_pmd, src_addr);
+				return -EAGAIN;
+			}
+
+			mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0,
+						mm, src_addr,
+						src_addr + HPAGE_PMD_SIZE);
+			mmu_notifier_invalidate_range_start(&range);
+
+			if (src_folio) {
+				folio_lock(src_folio);
+				/*
+				 * Do not split on failure here. The usual cause
+				 * is that a racing fault swapped the range back
+				 * in and dropped the folio from the swap cache,
+				 * so src_pmd is now a healthy present THP;
+				 * splitting it would destroy the very mapping
+				 * UFFDIO_MOVE is trying to move whole. The
+				 * caller's -EAGAIN retry re-reads src_pmd and
+				 * picks the right path, exactly as
+				 * move_swap_pte() relies on for the PTE case.
+				 */
+				if (!folio_matches_swap_entry(src_folio, entry) ||
+				    folio_nr_pages(src_folio) != HPAGE_PMD_NR) {
+					folio_unlock(src_folio);
+					folio_put(src_folio);
+					mmu_notifier_invalidate_range_end(&range);
+					put_swap_device(si);
+					return -EAGAIN;
+				}
+			}
+
+			dst_ptl = pmd_lockptr(mm, dst_pmd);
+			err = move_swap_pmd(mm, dst_vma, dst_addr, src_addr,
+					    dst_pmd, src_pmd, dst_pmdval,
+					    src_pmdval, dst_ptl, src_ptl,
+					    src_folio, entry);
+
+			mmu_notifier_invalidate_range_end(&range);
+			if (src_folio) {
+				folio_unlock(src_folio);
+				folio_put(src_folio);
+			}
+			put_swap_device(si);
+			return err;
+		}
+#endif /* CONFIG_THP_SWAP */
+		spin_unlock(src_ptl);
 		return -ENOENT;
 	}
 
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 8cff0f820ca51..38b63e9cff62d 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -2072,6 +2072,20 @@ static ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
 			break;
 		}
 
+		/*
+		 * A PMD swap entry at dst is a swapped-out THP, not a hole,
+		 * and unlike a PMD migration entry it will not resolve on its
+		 * own. Nothing below faults it back in: pte_alloc() skips a
+		 * !pmd_none PMD, pte_offset_map_rw_nolock() then fails on the
+		 * non-present PMD, and the -EAGAIN that produces would be
+		 * retried forever by the loop below. Be strict, exactly as for
+		 * a present THP.
+		 */
+		if (unlikely(pmd_is_swap_entry(dst_pmdval))) {
+			err = -EEXIST;
+			break;
+		}
+
 		ptl = pmd_trans_huge_lock(src_pmd, src_vma);
 		if (ptl) {
 			/* Check if we can move the pmd without splitting it. */
-- 
2.53.0-Meta

