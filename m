Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862905;
	b=QMYd630kDfEGs4pSNAau2cYYfskvUXy3HiEE+EhmBosxlcuudsWdIDtHwHZCUjunk9Sm
	 csXo0dxZ2q0lTkZRb7ZHCxgRl9OsNdKqNN+UAGR0iCsmqgAkTNzGZ33ypOirLdDJOJM5L
	 /PHKCKi4pKbmXmeWr/X0pGtWnKj7ulyLeiP6CQnESoTUrfSCVXfhjHAg6SMX+Uovb+Yqp
	 lXjOZIyLDJ09yUaV1CloiR35QgEX8hdEdW3andsx3LAr7l3doxnkMCCLUJZBKX/eBg50+
	 sPzdvuG3oyOhvkX6BQyF3z4LeYbrKxX//jL1l+fWoTTYK6L1Y6Hw1y6tDYuUT1nOwLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862905;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A9WS+yB2+j0+X38QKLnSIVyTlFGrRG2+fLICXzWaDJg=;
	b=WthLna7J6ocYZ4eOj5benXDb903I0kh5qzfe7fsOnaunskEvP4eOr2HKMeHvPm3GORRX
	 2EgLfDkjM9YQ9/JGJEV+4OBMYTx+IsQiqwrmRST3H6M6XrHUs+XCiMzyAZMpeVOxlbjY6
	 n6ay6lFgeGSOaxJzfB+L2k6p/nFHtutCdI0TN4ProsBxVVdVOiAokaXmRIQD6C+VOxKC+
	 nEsRHgCLC3kT7qIwiELo745/xeb/vXJVmjw507k66B9BpCw5QL7ZqeGpmpqBNpaQjQxW+
	 Mrdk7qNdZeotF2H1o2Oje0sMqjvJNQjdVRfW+Y1Kt0wIR1UKQONnErUB4lgT0WIeruA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=H8T7hxEY;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A20E606A882
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A20E606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=H8T7hxEY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=A9WS+yB2+j0+X38QKLnSIVyTlFGrRG2+fLICXzWaDJg=; b=H8T7hx
	EYJyGILuyjgDpjr8j27/5X5np2919C1Lk9FS7L6ky9FXM9py1baXfLIrRawsGI9A9lYEfZydaMN/S
	/Lw19N+tXmSejvh9eC985ikez5yil8BtgXE/GvWOxfx8khWtnXkl00dWbpmSTFC65DiIyDtdphXTG
	dsxsSGHnAc7xbOXnzpasGhdMZOPnMWUlHhBXKFzJbqzkwm4v3kxuM8Sy4o+UT0K/8ivGb6JaGCpcD
	JpI0W8P3dtbeAeCtwTJ+zimqN34tAY3MkH3s1eLQTTlT6MLYVZQQT8iawFnbB2nAifKGC/pE7t8cN
	Q1osX/GAxenY2OQ7iRE46Geb5SdA==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xT3pS-00000007LIv-2WmK;
	Mon, 16 Nov 2026 21:01:30 +0000
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Peter Xu <peterx@redhat.com>,
	Rik van Riel <riel@surriel.com>
Subject: [PATCH v5 8/8] mm/gup: batch contiguous same-folio PTEs into one refcount grab
Date: Mon, 16 Nov 2026 16:01:27 -0500
Message-ID: <20261116210127.3837898-9-riel@surriel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116210127.3837898-1-riel@surriel.com>
References: <20261116210127.3837898-1-riel@surriel.com>
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

follow_page_pte() now walks a whole page table in one call, but still
resolves and commits each PTE on its own, so a PTE-mapped large folio
(mTHP) pays one try_grab_folio() per subpage.

Add gup_pte_batch_len() and give gup_grab_fill_folio_pages() a run
length. Each run starts with a full per-PTE resolve, then
gup_pte_batch_len() finds how many more PTEs extend it with a pte_same()
scan rather than a re-derivation of each page, and the run is committed
with one refcount grab. Runs stop at folio boundaries, so plain base
pages are unaffected.

Read-only runs are not refused: they are trimmed to the leading pages
that need no unsharing, with the same gup_pages_not_requiring_unshare()
helper the fast path uses. Writable runs need no repeat, because a
writable anon page is already exclusive.

The helper is shared with GUP-fast through an fpb_flags parameter
that selects the scan: slow GUP merges young/dirty across the run so
folio_mark_dirty() sees any dirty PTE, while fast GUP scans locklessly
and revalidates the run after grabbing it.

Gather the dirty bits from all the PTEs in a batch, in order to mark
the folio dirty for FOLL_WRITE.

Same benchmark as the previous change, with before again taken at the
base of the series:

  gup_test -L -m 256 -n 65536 -r 16 -t, on bare metal:
                        before      after
  64 kB mTHP          17602 us      728 us  (24.2x)
  4 kB base (control) 21512 us     2800 us   (7.7x)
  2 MB THP (control)     169 us      170 us

The 4 kB column carries over the previous change: walking each page
table once instead of mapping it for every page pins base pages 7.7x
faster, and batching adds nothing there since base pages share no
folio. 64 kB mTHP goes from 17602 us to 728 us, a 24.2x from
committing a run with one refcount grab instead of one per subpage.

With FOLL_TOUCH, folio_mark_accessed() runs once per run instead of
once per page: 512 calls before and 32 after over 2 MB of 64 kB
folios, leaving them referenced but inactive after the first call.
That matches the huge-page and fast paths, which mark once
per folio. (Measured by Yuan-Hao Hsu.)

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 93 ++++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 74 insertions(+), 19 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index a8e8416b299c..484226e40f0c 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1011,6 +1011,42 @@ static long gup_lookup_pte(struct vm_area_struct *vma, unsigned long address,
 	return 0;
 }
 
+/*
+ * Return how many PTEs map consecutive pages of the same folio and can be
+ * committed as one run. Read-only runs are trimmed to the leading pages
+ * that need no unsharing; a zero return means even the head page needs
+ * unsharing, and the caller must fault it in instead. Writable runs need
+ * no repeat: a writable anon page is exclusive.
+ *
+ * @fpb_flags selects the scan: slow GUP merges young/dirty so
+ * folio_mark_dirty() sees any dirty PTE in the run; fast GUP scans
+ * locklessly and revalidates the run after grabbing it. @vma is only
+ * needed for FPB_MERGE_WRITE and may be NULL otherwise.
+ */
+static unsigned long gup_pte_batch_len(struct vm_area_struct *vma,
+		unsigned long address, unsigned long walk_end,
+		struct folio *folio, pte_t *ptep, pte_t *batch_pte,
+		unsigned int flags, fpb_t fpb_flags)
+{
+	unsigned long max, nr = 1;
+
+	if (folio_test_large(folio)) {
+		max = (walk_end - address) >> PAGE_SHIFT;
+		if (max > 1)
+			nr = folio_pte_batch_flags(folio, vma, ptep,
+						   batch_pte, max, fpb_flags);
+	}
+
+	/*
+	 * Even a run of one page needs the unshare check: the fast path
+	 * relies on it instead of a per-page lookup.
+	 */
+	if (!pte_write(*batch_pte))
+		nr = gup_pages_not_requiring_unshare(vma, flags, folio,
+						     pte_page(*batch_pte), nr);
+	return nr;
+}
+
 /*
  * Walk the PTEs from the start address to the end of this page table or VMA,
  * whichever comes first, and commit every page found.
@@ -1041,7 +1077,10 @@ static long follow_page_pte(struct vm_area_struct *vma,
 
 	for (; address < walk_end; address += PAGE_SIZE, ptep++) {
 		pte_t pte = ptep_get(ptep);
+		struct folio *folio;
 		struct page *page;
+		unsigned long batch;
+		pte_t batch_pte;
 
 		ret = gup_lookup_pte(vma, address, ptep, pte, flags, &page);
 		if (ret || !page) {
@@ -1056,12 +1095,35 @@ static long follow_page_pte(struct vm_area_struct *vma,
 				need_no_page_table = true;
 			break;
 		}
-		ret = gup_grab_fill_folio_pages(page_folio(page), page, 1,
-					     pte_dirty(pte), flags,
+		folio = page_folio(page);
+		batch_pte = pte;
+
+		batch = gup_pte_batch_len(vma, address, walk_end, folio,
+					 ptep, &batch_pte, flags,
+					 FPB_RESPECT_WRITE |
+					 FPB_MERGE_YOUNG_DIRTY);
+		if (!batch) {
+			/*
+			 * Unreachable: the head page passed the unshare
+			 * check in gup_lookup_pte(), so the trimmed run
+			 * holds at least that page. Break out cleanly
+			 * rather than spinning on an empty batch.
+			 */
+			ret = 0;
+			break;
+		}
+		ret = gup_grab_fill_folio_pages(folio, page, batch,
+					     pte_dirty(batch_pte), flags,
 					     pages ? pages + nr : NULL);
 		if (ret)
 			break;
-		nr++;
+		nr += batch;
+		/*
+		 * The loop's own increment covers one PTE; skip
+		 * the rest of the batch.
+		 */
+		ptep += batch - 1;
+		address += (batch - 1) * PAGE_SIZE;
 	}
 	pte_unmap_unlock(orig_ptep, ptl);
 
@@ -3017,8 +3079,6 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 		pte_t pte = ptep_get_lockless(ptep);
 		struct page *page;
 
-		nr_batch = 1;
-
 		/*
 		 * Always fallback to ordinary GUP on PROT_NONE-mapped pages:
 		 * pte_access_permitted() better should reject these pages
@@ -3058,20 +3118,15 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 		if (!gup_fast_folio_allowed(folio, flags))
 			goto out;
 
-		if (folio_test_large(folio))
-			/*
-			 * The reference acquired above keeps the folio stable
-			 * for the following checks.
-			 */
-			nr_batch = folio_pte_batch_flags(folio, NULL, ptep, &pte,
-							 (end - addr) >> PAGE_SHIFT,
-							 FPB_LOCKLESS | FPB_RESPECT_WRITE);
-
-		if (!pte_write(pte)) {
-			nr_batch = gup_pages_not_requiring_unshare(NULL, flags, folio, page, nr_batch);
-			if (!nr_batch)
-				goto out;
-		}
+		/*
+		 * The reference acquired above keeps the folio stable
+		 * for the following checks.
+		 */
+		nr_batch = gup_pte_batch_len(NULL, addr, end, folio,
+					     ptep, &pte, flags,
+					     FPB_LOCKLESS | FPB_RESPECT_WRITE);
+		if (!nr_batch)
+			goto out;
 
 		/*
 		 * We need to make the page accessible if and only if we are
-- 
2.56.0

