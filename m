Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D0E49DB8C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947868; cv=none; b=gxAnx+FsiAnE+qfOkzIFQJFGvdehSpV5pOQlh+3BoldwTzX0c15xuUS5Y63sB/hgTRfOq7P7zgL19BWIT9UjKSwKtmHN5sGAbB08I3FGRMxpK4Nt0JyqKAIOk/vDCFOJgWcJGluB74bJjkdz00aZGHoxYIZFCJ2zNb6a8kDR9aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947868; c=relaxed/simple;
	bh=Lu6+2Sh9UbWS2A6fpr98+wTn38kozrsF+/qIOZDiezw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fe+3HQF4xYAyk3tIlinrYIKa1KyiqLexHyrdPF5oJHRhnmTdahIm41PZ30hWIfburLA0kGsuS0rqxBzUVHq8hCPPX74qY6MUZJhYCxQWcI4IsCLrCH/Ta8Mhid0kyWOk9L0dshIk5hi8FOoYVkrCQdgSeqZMsva1Tgsqe6IPZxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QnamKCBk; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QnamKCBk"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66e64e6e3fbso4986792d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788947866; x=1789552666; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=si69YHQMirkBMxmzc+pJ5uD7PWHLsBw1JDPVVCPJL9Q=;
        b=QnamKCBkEqLIrqImoayAM9p1VZMZ8YT8+y8dSP2LqKDcPC/n2hhSijYK9bBIplx2OQ
         pneC5kej/S9qexwR2SUqbkNWLBEH9iqroXM/IWMFFC9P78HSbe9SdM0cDBngpFVbotsS
         PREWPXFYuBilXpQjPREHxdLoTy6/QRe17EMFvvUg/Ua940aF90yufuhHnKPBSW1I0on6
         53In+vLsgzOVPdznlCbxpMXl2p3k5cOF4EM3EPx265gfpg+JBJjS4ErDTIw4wsOv4Twu
         9v+zZ9amdQ1e5cWb9vGH9D4EfiXz28foC21Flvs3Uq5buiVltF97n35t9pgHXh4i/H/v
         1DOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788947866; x=1789552666;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=si69YHQMirkBMxmzc+pJ5uD7PWHLsBw1JDPVVCPJL9Q=;
        b=UcEd5dLzqGaBwcna22z9MSlfTpa48x3ir4sPkuoXDu1L0EDoMQ0068X5oNZ496JR/P
         u+nRxwfOyFmdPr0IXpIMKdiir2TTkctBtJvu6ViRkT9suJCdHVuety4DCzceJ3uyjLnA
         hF8ewKvPPm7DEInakpZf6h77z6l1Dx/EoaLZAvRHc2BHBU4PLXmbz+YTRUecle/6unh1
         CSFyu4IifZHPzmWnn565Q5yxmGbPOshPSK//tA+Z47/Kgn1IoIxjDbFJEfrbeKSQH4E3
         et6qMesD8IKOhb+fHFCopd956gr9S1CWazcvxuyuwVQZWqypuGaKUfQTTwV4/TF77EwB
         /yag==
X-Forwarded-Encrypted: i=1; AKwUvBy7JVXeV0vF5FxOi/sj4Cd2cLBRsXLEsp/aDmNF8YHBwaHJrQz/qxRXwavVi3ltNb+xrDz7sCC8xbwri48=@vger.kernel.org
X-Gm-Message-State: AFuF++kx0LFCJV8pH/Pm9lTrvmPHqkM4XTmaycwvYO5EqxpO626Dqzod
	1GsP0LUVfn1nMtYSak/NFdmZYeTQvTxAM8qSakf9ABf7y7ldtGLu3nxhgTJXXs8SaA==
X-Gm-Gg: AYBFou1U7w+kOGGYr555YX5K0G9NeyR6DKF94g4oDf7VMfqp9HcvJJQzErV9XTs7XP+
	SYEWNmZBEvDHkxFSVm+6WkovHa4P8Ae3ea5yBLN1nKFt/kqRKdtTHXgHUD/rlDearS/XORfO32/
	TAmqXxqmX5qkNnLuA0Fw7WhwRzgES0h6bM/JCntD1RWaVSOut6lkBV2e4SWUl/MfkS5GNYzUPNW
	pYRadjcCd0R8I9c9Z6pmUk1tcGEQ3ULjZHmNB0r3io1GfgtVsjjJWMFsgzAJQzrI+kedlPXXcX1
	/yo4uNhay4ZGW85/QMQFkKBhFMZpli6R15TU+3EGvrhjrPWlGoNk0hfb3SX00d17vBttjcN+zg0
	KMafKp0VLOZrcQHPBDi5hfZAK4GuvOInzJJbzH0VUt6CTxx5uawTACtNXxkoPFbf63/MTarvoZM
	BqNyO2kqarNO9vmAgyiC66t362isxZgTfJ4mjnaVwxTnsW5zhrwbOT+IUA6aDYNwUCBdagzuspw
	7rr9yGJZ6/HiqseEtIzjRIs0yqRSyL8i4xGc7zLfG+YOBepROR2AW/NUwQ=
X-Received: by 2002:a05:690e:13cc:b0:66f:c6c6:aab8 with SMTP id 956f58d0204a3-66fc6c6bd7emr7410637d50.15.1788947864938;
        Wed, 09 Sep 2026 02:57:44 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb47a8894sm12054613d50.1.2026.09.09.02.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:57:44 -0700 (PDT)
Date: Wed, 9 Sep 2026 02:57:39 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
cc: Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, Alexandre Ghiti <alex@ghiti.fr>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    David Hildenbrand <david@kernel.org>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
    Leonardo Bras <leobras.c@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Marcelo Tosatti <mtosatti@redhat.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mel Gorman <mgorman@techsingularity.net>, 
    Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
    Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rik van Riel <riel@surriel.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, 
    Yang Shi <yang@os.amperecomputing.com>, Yu Zhao <yuzhao@google.com>, 
    Zach O'Keefe <zokeefe@google.com>, Zi Yan <ziy@nvidia.com>, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 08/26] mm/fbatch: replace mlock_new_folio() by
 __folio_add_lru(,mlockit)
In-Reply-To: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Message-ID: <6757bf3c-599f-4ef4-85d3-d572e3bb59fe@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Replace mlock_new_folio(), working on mm/mlock.c's mlock_fbatch, by
__folio_add_lru(,mlockit), working on mm/folio.c's lru_add fbatch:
folio moved to lruvec by lru_add(), with its mlocking incidental.

Remove old comment about not needing smp_mb__after_atomic() from
lru_add(): but that is a detail which will need to be reconsidered.

Initialize mlock_count earlier, when adding to fbatch rather than when
adding to lruvec. mlock_count count in 2s, with the low bit set to
distinguish it from lru.prev. This helps when an mlocked folio is put
back early by compaction, but will enable further optimization next.

Change mlock_count from unsigned int to long: long to match pointer
without endian concerns, signed for better treatment of those rare
cases when final munlocks precede their still batched mlocks.

This is an intermediate, poorly tested review stage: mlock_new_folio()
code removed from mm/mlock.c, remaining code there updated to respect
the new mlock_count accounting, but not considered beyond that.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 Documentation/mm/unevictable-lru.rst |  2 +-
 include/linux/mm_types.h             | 10 +++--
 include/linux/swap.h                 |  6 ++-
 mm/folio.c                           | 59 ++++++++++++------------
 mm/huge_memory.c                     |  2 +-
 mm/internal.h                        |  4 +-
 mm/mlock.c                           | 67 ++++------------------------
 7 files changed, 53 insertions(+), 97 deletions(-)

diff --git a/Documentation/mm/unevictable-lru.rst b/Documentation/mm/unevictable-lru.rst
index 8d11fe6a0854..45b453226336 100644
--- a/Documentation/mm/unevictable-lru.rst
+++ b/Documentation/mm/unevictable-lru.rst
@@ -314,7 +314,7 @@ For each PTE (or PMD) being faulted into a VMA, the page add rmap function
 calls mlock_vma_folio(), which calls mlock_folio() when the VMA is VM_LOCKED
 (unless it is a PTE mapping of a part of a transparent huge page).  Or when
 it is a newly allocated anonymous page, folio_add_lru_vma() calls
-mlock_new_folio() instead: similar to mlock_folio(), but can make better
+__folio_add_lru(mlockit) instead: similar to mlock_folio(), but can make better
 judgments, since this page is held exclusively and known not to be on LRU yet.
 
 mlock_folio() sets PG_mlocked immediately, then places the page on the CPU's
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index fe6220b97cf3..772e3acda8c2 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -86,7 +86,7 @@ struct page {
 	 * means the other users of this union MUST NOT use the bit to
 	 * avoid collision and false-positive PageTail().
 	 * Bit 1 of the first word is used by page_is_pfmemalloc().
-	 * Bit 1 of the first word (lru_next) is also used by folio_add_lru().
+	 * Bit 1 of the first word (lru_next) is also used by __folio_add_lru().
 	 */
 	union {
 		struct {	/* Page cache and anonymous pages */
@@ -361,7 +361,7 @@ typedef unsigned short mm_id_t;
  * struct folio - Represents a contiguous set of bytes.
  * @flags: Identical to the page flags.
  * @lru: Least Recently Used list; tracks how recently this folio was used.
- * @mlock_count: Number of times this folio has been pinned by mlock().
+ * @mlock_count: Number of times this folio has been pinned by mlock() *2 +1
  * @mapping: The file this page belongs to, or refers to the anon_vma for
  *    anonymous memory.
  * @index: Offset within the file, in units of pages.  For anonymous memory,
@@ -415,7 +415,7 @@ struct folio {
 				struct {
 					unsigned long lru_next;
 	/* public: */
-					unsigned int mlock_count;
+					long mlock_count;
 	/* private: */
 				};
 	/* public: */
@@ -509,6 +509,10 @@ struct folio {
 	};
 };
 
+/* folio's mlock_count is doubled, low bit set to distinguish from lru.prev */
+#define MLOCK_COUNT_0	1	/* Bit not set in any aligned pointer */
+#define MLOCK_COUNT_1	2	/* Increment or decrement mlock_count */
+
 #define FOLIO_MATCH(pg, fl)						\
 	static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
 FOLIO_MATCH(flags, flags);
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 5658a1634b85..a6fad5127118 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -294,7 +294,11 @@ extern unsigned long totalreserve_pages;
 #define nr_free_pages() global_zone_page_state(NR_FREE_PAGES)
 
 /* linux/mm/folio.c */
-void folio_add_lru(struct folio *folio);
+void __folio_add_lru(struct folio *folio, bool mlockit);
+static inline void folio_add_lru(struct folio *folio)
+{
+	__folio_add_lru(folio, false);
+}
 void folio_mark_accessed(struct folio *folio);
 void lru_add_drain_all(void);
 
diff --git a/mm/folio.c b/mm/folio.c
index 0b75c3b69d5a..18e97923e527 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -113,31 +113,12 @@ static void lru_add(struct lruvec *lruvec, struct folio *folio)
 
 	VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);
 
-	/*
-	 * Is an smp_mb__after_atomic() still required here, before
-	 * folio_evictable() tests the mlocked flag, to rule out the possibility
-	 * of stranding an evictable folio on an unevictable LRU?  I think
-	 * not, because __munlock_folio() only clears the mlocked flag
-	 * while the LRU lock is held.
-	 *
-	 * (That is not true of __page_cache_release(), and not necessarily
-	 * true of folios_put(): but those only clear the mlocked flag after
-	 * folio_put_testzero() has excluded any other users of the folio.)
-	 */
 	if (folio_evictable(folio)) {
 		if (was_unevictable)
 			__count_vm_events(UNEVICTABLE_PGRESCUED, nr_pages);
 	} else {
 		folio_clear_active(folio);
 		folio_set_unevictable(folio);
-		/*
-		 * folio->mlock_count = !!folio_test_mlocked(folio)?
-		 * But that leaves __mlock_folio() in doubt whether another
-		 * actor has already counted the mlock or not.  Err on the
-		 * safe side, underestimate, let page reclaim fix it, rather
-		 * than leaving a page on the unevictable LRU indefinitely.
-		 */
-		folio->mlock_count = 0;
 		if (!was_unevictable)
 			__count_vm_events(UNEVICTABLE_PGCULLED, nr_pages);
 	}
@@ -383,15 +364,16 @@ void folio_mark_accessed(struct folio *folio)
 EXPORT_SYMBOL(folio_mark_accessed);
 
 /**
- * folio_add_lru - Add a folio to an LRU list.
+ * __folio_add_lru - Add a folio to an LRU list.
  * @folio: The folio to be added to the LRU.
+ * @mlockit: Mark the folio as mlocked.
  *
  * Queue the folio for addition to the LRU. The decision on whether
  * to add the page to the [in]active [file|anon] list is deferred until the
  * folio_batch is drained. This gives a chance for the caller of folio_add_lru()
- * have the folio added to the active list using folio_mark_accessed().
+ * to have the folio added to the active list using folio_mark_accessed().
  */
-void folio_add_lru(struct folio *folio)
+void __folio_add_lru(struct folio *folio, bool mlockit)
 {
 	struct folio_batch *fbatch;
 	unsigned long lru_next;
@@ -426,6 +408,27 @@ void folio_add_lru(struct folio *folio)
 	lru_next |= BIT(LRU_NEXT_BATCHED);
 	folio->lru_next = lru_next;
 
+	if (mlockit) {
+		long nr_pages = folio_nr_pages(folio);
+
+		folio_set_mlocked(folio);
+		folio->mlock_count = MLOCK_COUNT_0 + MLOCK_COUNT_1;
+		zone_stat_mod_folio(folio, NR_MLOCK, nr_pages);
+		__count_vm_events(UNEVICTABLE_PGMLOCKED, nr_pages);
+	} else if (folio_test_mlocked(folio)) {
+		/*
+		 * A folio is being put back while mlocked. If mlock_count
+		 * has not been overwritten by use of lru.prev, believe it.
+		 * Otherwise, since there may be __mlock_folio()s to come
+		 * through, initialize it to the safer 0 rather than to 1.
+		 */
+		if (!(folio->mlock_count & MLOCK_COUNT_0))
+			folio->mlock_count = MLOCK_COUNT_0;
+	} else {
+		/* Initialize this field, which the page allocator did not */
+		folio->mlock_count = MLOCK_COUNT_0;
+	}
+
 	full = !folio_batch_add(fbatch, folio);
 
 	/* Ensure folio->lru_next visible to folio_test_clear_lru() callers */
@@ -437,24 +440,20 @@ void folio_add_lru(struct folio *folio)
 
 	local_unlock(&cpu_fbatches.lock);
 }
-EXPORT_SYMBOL(folio_add_lru);
+EXPORT_SYMBOL(__folio_add_lru);
 
 /**
  * folio_add_lru_vma() - Add a folio to the appropriate LRU list for this VMA.
  * @folio: The folio to be added to the LRU.
  * @vma: VMA in which the folio is mapped.
  *
- * If the VMA is mlocked, @folio is added to the unevictable list.
+ * If the VMA is mlocked, @folio will be added to the unevictable list.
  * Otherwise, it is treated the same way as folio_add_lru().
  */
 void folio_add_lru_vma(struct folio *folio, struct vm_area_struct *vma)
 {
-	VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);
-
-	if (unlikely((vma->vm_flags & (VM_LOCKED | VM_SPECIAL)) == VM_LOCKED))
-		mlock_new_folio(folio);
-	else
-		folio_add_lru(folio);
+	__folio_add_lru(folio,
+		(vma->vm_flags & (VM_LOCKED | VM_SPECIAL)) == VM_LOCKED);
 }
 
 /*
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index abebd8a23e56..d53e5443b802 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3623,7 +3623,7 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
 		/* head is still on lru (and we have it frozen) */
 		VM_WARN_ON(!folio_test_lru(folio));
 		if (folio_test_unevictable(folio))
-			new_folio->mlock_count = 0;
+			new_folio->mlock_count = MLOCK_COUNT_0;
 		else
 			list_add_tail(&new_folio->lru, &folio->lru);
 		folio_set_lru(new_folio);
diff --git a/mm/internal.h b/mm/internal.h
index 0d78406eb126..40bd128a58ae 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -974,7 +974,7 @@ folio_within_vma(struct folio *folio, struct vm_area_struct *vma)
  *
  * mlock is usually called at the end of folio_add_*_rmap_*(), munlock at
  * the end of folio_remove_rmap_*(); but new anon folios are managed by
- * folio_add_lru_vma() calling mlock_new_folio().
+ * folio_add_lru_vma() calling __folio_add_lru().
  */
 void mlock_folio(struct folio *folio);
 static inline void mlock_vma_folio(struct folio *folio,
@@ -1009,7 +1009,6 @@ static inline void munlock_vma_folio(struct folio *folio,
 		munlock_folio(folio);
 }
 
-void mlock_new_folio(struct folio *folio);
 bool need_mlock_drain(int cpu);
 void mlock_drain_local(void);
 void mlock_drain_remote(int cpu);
@@ -1136,7 +1135,6 @@ static inline bool vma_supports_mlock(const struct vm_area_struct *vma)
 
 #else /* !CONFIG_MMU */
 static inline void unmap_mapping_folio(struct folio *folio) { }
-static inline void mlock_new_folio(struct folio *folio) { }
 static inline bool need_mlock_drain(int cpu) { return false; }
 static inline void mlock_drain_local(void) { }
 static inline void mlock_drain_remote(int cpu) { }
diff --git a/mm/mlock.c b/mm/mlock.c
index 929abeac85d0..2c690f18031e 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -85,14 +85,16 @@ static struct lruvec *__mlock_folio(struct folio *folio, struct lruvec *lruvec)
 
 	if (folio_test_unevictable(folio)) {
 		if (folio_test_mlocked(folio))
-			folio->mlock_count++;
+			folio->mlock_count += MLOCK_COUNT_1;
 		goto out;
 	}
 
 	lruvec_del_folio(lruvec, folio);
 	folio_clear_active(folio);
 	folio_set_unevictable(folio);
-	folio->mlock_count = !!folio_test_mlocked(folio);
+	folio->mlock_count = MLOCK_COUNT_0;
+	if (folio_test_mlocked(folio))
+		folio->mlock_count += MLOCK_COUNT_1;
 	lruvec_add_folio(lruvec, folio);
 	__count_vm_events(UNEVICTABLE_PGCULLED, folio_nr_pages(folio));
 out:
@@ -100,25 +102,6 @@ static struct lruvec *__mlock_folio(struct folio *folio, struct lruvec *lruvec)
 	return lruvec;
 }
 
-static struct lruvec *__mlock_new_folio(struct folio *folio, struct lruvec *lruvec)
-{
-	VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);
-
-	lruvec = folio_lruvec_relock_irq(folio, lruvec);
-
-	/* As above, this is a little surprising, but possible */
-	if (unlikely(folio_evictable(folio)))
-		goto out;
-
-	folio_set_unevictable(folio);
-	folio->mlock_count = !!folio_test_mlocked(folio);
-	__count_vm_events(UNEVICTABLE_PGCULLED, folio_nr_pages(folio));
-out:
-	lruvec_add_folio(lruvec, folio);
-	folio_set_lru(folio);
-	return lruvec;
-}
-
 static struct lruvec *__munlock_folio(struct folio *folio, struct lruvec *lruvec)
 {
 	int nr_pages = folio_nr_pages(folio);
@@ -132,9 +115,9 @@ static struct lruvec *__munlock_folio(struct folio *folio, struct lruvec *lruvec
 
 	if (folio_test_unevictable(folio)) {
 		/* Then mlock_count is maintained, but might undercount */
-		if (folio->mlock_count)
-			folio->mlock_count--;
-		if (folio->mlock_count)
+		if (folio->mlock_count > MLOCK_COUNT_0)
+			folio->mlock_count -= MLOCK_COUNT_1;
+		if (folio->mlock_count > MLOCK_COUNT_0)
 			goto out;
 	}
 	/* else assume that was the last mlock: reclaim will fix it if not */
@@ -165,17 +148,11 @@ static struct lruvec *__munlock_folio(struct folio *folio, struct lruvec *lruvec
  * Flags held in the low bits of a struct folio pointer on the mlock_fbatch.
  */
 #define LRU_FOLIO 0x1
-#define NEW_FOLIO 0x2
 static inline struct folio *mlock_lru(struct folio *folio)
 {
 	return (struct folio *)((unsigned long)folio + LRU_FOLIO);
 }
 
-static inline struct folio *mlock_new(struct folio *folio)
-{
-	return (struct folio *)((unsigned long)folio + NEW_FOLIO);
-}
-
 /*
  * mlock_folio_batch() is derived from folio_batch_move_lru(): perhaps that can
  * make use of such folio pointer flags in future, but for now just keep it for
@@ -192,14 +169,12 @@ static void mlock_folio_batch(struct folio_batch *fbatch)
 
 	for (i = 0; i < folio_batch_count(fbatch); i++) {
 		folio = fbatch->folios[i];
-		mlock = (unsigned long)folio & (LRU_FOLIO | NEW_FOLIO);
+		mlock = (unsigned long)folio & LRU_FOLIO;
 		folio = (struct folio *)((unsigned long)folio - mlock);
 		fbatch->folios[i] = folio;
 
-		if (mlock & LRU_FOLIO)
+		if (mlock)
 			lruvec = __mlock_folio(folio, lruvec);
-		else if (mlock & NEW_FOLIO)
-			lruvec = __mlock_new_folio(folio, lruvec);
 		else
 			lruvec = __munlock_folio(folio, lruvec);
 	}
@@ -261,30 +236,6 @@ void mlock_folio(struct folio *folio)
 	local_unlock(&mlock_fbatch.lock);
 }
 
-/**
- * mlock_new_folio - mlock a newly allocated folio not yet on LRU
- * @folio: folio to be mlocked, either normal or a THP head.
- */
-void mlock_new_folio(struct folio *folio)
-{
-	struct folio_batch *fbatch;
-	int nr_pages = folio_nr_pages(folio);
-
-	local_lock(&mlock_fbatch.lock);
-	fbatch = this_cpu_ptr(&mlock_fbatch.fbatch);
-	folio_set_mlocked(folio);
-
-	zone_stat_mod_folio(folio, NR_MLOCK, nr_pages);
-	__count_vm_events(UNEVICTABLE_PGMLOCKED, nr_pages);
-
-	folio_get(folio);
-	if (!folio_batch_add(fbatch, mlock_new(folio)) ||
-	    true || /* XXX Temporarily disable mlock_new batching */
-	    !folio_may_be_lru_cached(folio) || lru_cache_disabled())
-		mlock_folio_batch(fbatch);
-	local_unlock(&mlock_fbatch.lock);
-}
-
 /**
  * munlock_folio - munlock a folio
  * @folio: folio to be munlocked, either normal or a THP head.
-- 
2.51.0

