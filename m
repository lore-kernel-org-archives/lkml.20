Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647844;
	b=jYMX3xFZCo2MCWc8BgHe/Hx3qkaUZNNRFVeEPU35XpFB6v/vtaabU64RiI3sTTxdRr0I
	 kmr71uTrhKGzCzYpip6jfZSnD4tS5ETEeWYzWJ7hZ8uU45CxFl6yyTXrNYBUaZzylmchC
	 us3zo0xLfKkMuo5GGbcrtyDGhElRcOM0vi2Pqop5FFmQwocmzwI5KGpbyMvLahdqdGfu0
	 xBcoy6KLHBHuZR8ljGAx2+JXKZkFWbDy+0KVrjA5sbTczgf+KBEGoxknemZKwVu1q7Bjy
	 8SFklXwFtUi5SgZTyOkCshCLxS28Ma+EoxCIR7Y7FikTGQJU7rlP4k5pOdFa0ZylzcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647844;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EssaCi2baNEeAPpk67tmLaBdKKwRtpyn3LygDdFuUKc=;
	b=Bd4wAwHUz9Zf1oEedqVXmezhhy5YIFwla2pqWy75XusaQG+29wRlGkdF7yFOR5nvDYyV
	 jnHtVmAmPSPH9U+gcoQPCy+TPg5klqfpUJQmViLf5RClE77/i7VBIzURRK9y4WdK/k2ro
	 yE2I2x2V/mnuw2ph9fbHMOqJR1TaoLuPyIbOBhkpMrFLRsx1jicdx5oRLGirfaLWdSKZf
	 yP0K2afPvXcJXZXQc2Bg+Ju3dJOB3h3QbD+uQ18a93I+powcON74P88nd+Nd4yY6LZY0Q
	 ntyTpODILFjxixpr+v6fMbQIpUWXk0NtqRYDYonY6fjLjVnsWG4GpbqW+ZOC+9xOlQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=H4O+qNzY;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ADD606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1ADD606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=H4O+qNzY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=EssaCi2baNEeAPpk67tmLaBdKKwRtpyn3LygDdFuUKc=; b=H4O+qN
	zYJlUgRH/Gqu/0hHvWmJjaOrfLTu9L+QeCQc5vP/s4bgx6yoSPHQNSKfvdlWH+w9zorwBa8y84snI
	vNjlttT82c9YYWyPBnan5rK0BpfTE7iEJCcih2mOTTvjLYJHt6SLQT1SbDPOzqMrwLDwdV3KWGkqe
	X/PbvY+g/SMe5/3byxw1M79+XERo+jxvkR4OamnW/0NYLH71gkd9EkpQFOgyBZ0dvZvjX1IuulPTU
	m2N9Nl5VPWpFLvDJMqI1hFDwIuBsr1h/wuGifXjtwPduCQpG7xuDe6KRYyB73ycdqcukB+ZaSqt5d
	dmm33ylXBybJ8lovrEwDCsWmCeAw==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xNxjk-00000001W8x-16er;
	Mon, 02 Nov 2026 19:30:32 +0000
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	linux-mm@kvack.org,
	Rik van Riel <riel@surriel.com>
Subject: [PATCH 8/8] mm/gup: batch contiguous same-folio PTEs into one refcount grab
Date: Mon,  2 Nov 2026 14:30:26 -0500
Message-ID: <20261102193026.3860700-9-riel@surriel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102193026.3860700-1-riel@surriel.com>
References: <20261102193026.3860700-1-riel@surriel.com>
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

Add gup_pte_batch_len() and give gup_grab_folio_pages() a run
length. Each run starts with a full per-PTE resolve, then
gup_pte_batch_len() finds how many more PTEs extend it with a pte_same()
scan rather than a re-derivation of each page, and the run is committed
with one refcount grab. Runs stop at folio boundaries, so plain base
pages are unaffected.

Gather the dirty bits from all the PTEs in a batch, in order to mark
the folio dirty for FOLL_WRITE.

Same benchmark as the previous change, with before again taken at the
base of the series:

  gup_test -L -m 256 -n 65536 -r 16 -t
                        before      after
  64 kB mTHP           2946 us      231 us  (12.8x)
  4 kB base (control)  2753 us     1198 us   (2.3x)
  2 MB THP (control)     72 us       71 us

The 4 kB column is the previous change's 2.3x, unchanged: base pages
share no folio, so there is nothing to batch. 64 kB mTHP goes from that
change's 2.2x to 12.8x, a further 5.9x from committing a run with one
refcount grab instead of one per subpage.

With FOLL_TOUCH, folio_mark_accessed() runs once per run instead of
once per page: 512 calls before and 32 after over 2 MB of 64 kB
folios, leaving them referenced but inactive after the first call.
That matches the huge-page and fast paths, which mark once
per folio. (Measured by Yuan-Hao Hsu.)

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 67e20b326be6e..47f204e21a3a7 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -937,6 +937,35 @@ static long gup_lookup_pte(struct vm_area_struct *vma, unsigned long address,
 	return 0;
 }
 
+/*
+ * Return how many PTEs map consecutive pages of the same folio and can be
+ * committed as one run. Always at least 1.
+ *
+ * The write-fault and unshare checks in gup_lookup_pte() are per PTE, but a
+ * writable run needs no repeat: a writable anon page is exclusive. A read-only
+ * run under FOLL_WRITE or FOLL_PIN does need the per-page check, so it stays
+ * one page at a time.
+ */
+static unsigned long gup_pte_batch_len(struct vm_area_struct *vma,
+		unsigned long address, unsigned long walk_end,
+		struct folio *folio, pte_t *ptep, pte_t *batch_pte, unsigned int flags)
+{
+	unsigned long max;
+
+	if (!folio_test_large(folio))
+		return 1;
+	if (!pte_write(*batch_pte) && (flags & (FOLL_WRITE | FOLL_PIN)))
+		return 1;
+
+	max = (walk_end - address) >> PAGE_SHIFT;
+	if (max <= 1)
+		return 1;
+
+	/* Merge young/dirty across batch so folio_mark_dirty sees any dirty. */
+	return folio_pte_batch_flags(folio, vma, ptep, batch_pte, max,
+				     FPB_RESPECT_WRITE | FPB_MERGE_YOUNG_DIRTY);
+}
+
 /*
  * Walk the PTEs from the start address to the end of this page table or VMA,
  * whichever comes first, and commit every page found.
@@ -968,7 +997,10 @@ static long follow_page_pte(struct vm_area_struct *vma,
 
 	for (; address < walk_end; address += PAGE_SIZE, ptep++) {
 		pte_t pte = ptep_get(ptep);
+		struct folio *folio;
 		struct page *page;
+		unsigned long batch;
+		pte_t batch_pte;
 
 		ret = gup_lookup_pte(vma, address, ptep, pte, flags, &page);
 		if (ret || !page) {
@@ -983,12 +1015,23 @@ static long follow_page_pte(struct vm_area_struct *vma,
 				need_no_page_table = true;
 			break;
 		}
-		ret = gup_grab_folio_pages(page_folio(page), page,
-						     1, pte_dirty(pte), flags,
+		folio = page_folio(page);
+		batch_pte = pte;
+
+		batch = gup_pte_batch_len(vma, address, walk_end, folio,
+					 ptep, &batch_pte, flags);
+		ret = gup_grab_folio_pages(folio, page, batch,
+						     pte_dirty(batch_pte), flags,
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
 
-- 
2.53.0-Meta

