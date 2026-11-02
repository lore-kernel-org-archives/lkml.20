Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647844;
	b=b8kcJN+hmailvoeXGf7jRccHVFztFNoZJjZIO3EX+7zihZ808MiWHVrtWhX3t5PxPuWh
	 sJGgOoHfplDVELh/pVMx1fQiiAbnrjVIzMSDPXmbiXXpVODrLuJqRC5hpSUdILmx5JUjR
	 00iJFOD7kyT/xKzre9rClApgODVixbQj7/ywr1nq4RE7ZmYPlHQpfIaYnUdQhNhA24fpg
	 iRDNud+0W/MZVgXK9NZF4r0iN3tHnxwOkrGCodeHnG0VsWl0mTpCwYXjJ5UAvofrwMXs1
	 +59pRbZy/+0GsigX04lvSzw3RbLHZ17YzxDL0UJuhAKu/CoLSovXvPD2AP0yAZgri0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647844;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UqtQjtwRGczt9exEK3FM/tKADo6f8acL9nbyk9FwQT8=;
	b=parL1hYK9iQJWpAFikiz1qPPaLAv0HaXel5fb1UONBdU9Ii45LDmeSemdiSQxTID3cLQ
	 GEiER5k4Zqp3J3CIYkkCOit+Hj/lLqZ9Na8O9gh/DiGFgR7/lhIghZ+q7lh2/xYFS6KMl
	 ZmNwvCharlzTT3r8K//t+Ry+4AaPFvBJscaplI0NWPy0PfoEfs/7au4sScx5J0cKBOsnv
	 JAHM5UHYxPEeG4Y/oZeE2voBLM1eL1/YviAkVNv0xj2m1iJt79jHnOFMJ1iHUkvpf0aVq
	 d9hd39Fv0cmzI2Pry83p5uG3+eG6ysqt9YWXGYbu/WpxuPcrlBh5XLIeaculUCn4r5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b="g/LISk21";
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CEB606A33E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9CEB606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=g/LISk21
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=UqtQjtwRGczt9exEK3FM/tKADo6f8acL9nbyk9FwQT8=; b=g/LISk
	21VNtOyAiFe/r7BNdHoYLlMCqhBAJIKz3QA1YTIjLR9x4cSI9YFeiinf2UHYxEdLDe6dhjV7hiq0z
	L3zxV7v6wW5SK7vRaH8JnHbbuv8W8ITgfu+F+w7qIDiZoWUSmBn27VzEdeDArSKVnygp7xzHHGYx2
	wmRE4iRsGpe0zpxgQo3IPAKQ0XCckqh0wki2DFnbMLKcDdjjiph8LG61hB0tH2C4JNyC1zhEnqlzI
	9VjLA4SWc54pncm5QGWHPch8ChRt2mvz2txEHaBXixnjJNdiyRzLEcjF7H0L5ORv5e61y2dguwFxn
	1f2ZQwQOSXMgEIarVH7W748MP4lA==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xNxjk-00000001W8x-0Yqw;
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
Subject: [PATCH 4/8] mm/gup: break out gup_lookup_pte() helper
Date: Mon,  2 Nov 2026 14:30:22 -0500
Message-ID: <20261102193026.3860700-5-riel@surriel.com>
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

follow_page_pte() is 92 lines and does two separate things: work out
which page a PTE maps, if any, and commit to the page it found. The
first half reaches the second through five exit paths, two of which
unwind the PTE lock in different ways.

Split the resolve half into gup_lookup_pte(), which returns the page it
resolved, NULL when the PTE cannot be followed, or the errno the caller
must report. follow_page_pte() is left with one unlock and one exit.

no_page_table() can look up the page cache, so the case that needs it is
recorded and the call made after dropping the PTE lock, as before.

A none PTE still returns before any write check runs, so a FOLL_WRITE
failure can never reach the recorded call: the caller consults
no_page_table() for exactly the same PTEs the old code did.

No functional changes intended.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 102 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 58 insertions(+), 44 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 27ae2a1d7c36d..c2a4f5b987ced 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -889,76 +889,90 @@ static long gup_grab_folio_pages(struct folio *folio,
 	return 0;
 }
 
-static long follow_page_pte(struct vm_area_struct *vma,
-		unsigned long address, pmd_t *pmd, unsigned int flags,
-		struct page **pages)
+/*
+ * Resolve one present PTE to the page it maps. Returns no page and no error
+ * when the PTE cannot be followed but the caller may fault it in, and a
+ * negative errno when the caller must report the failure.
+ */
+static long gup_lookup_pte(struct vm_area_struct *vma, unsigned long address,
+		pte_t *ptep, pte_t pte, unsigned int flags, struct page **pagep)
 {
-	struct mm_struct *mm = vma->vm_mm;
-	struct folio *folio;
 	struct page *page;
-	spinlock_t *ptl;
-	pte_t *ptep, pte;
-	long ret;
 
-	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
-	if (!ptep)
-		return no_page_table(vma, flags, address);
-	pte = ptep_get(ptep);
+	*pagep = NULL;
+
 	if (!pte_present(pte))
-		goto no_page;
+		return 0;
 	if (pte_protnone(pte) && !gup_can_follow_protnone(vma, flags))
-		goto no_page;
+		return 0;
 
 	page = vm_normal_page(vma, address, pte);
 
 	/*
 	 * We only care about anon pages in can_follow_write_pte().
 	 */
-	if ((flags & FOLL_WRITE) &&
-	    !can_follow_write_pte(pte, page, vma, flags)) {
-		ret = 0;
-		goto out;
-	}
+	if ((flags & FOLL_WRITE) && !can_follow_write_pte(pte, page, vma, flags))
+		return 0;
 
 	if (unlikely(!page)) {
 		if (flags & FOLL_DUMP) {
 			/* Avoid special (like zero) pages in core dumps */
-			ret = -EFAULT;
-			goto out;
-		}
-
-		if (is_zero_pfn(pte_pfn(pte))) {
-			page = pte_page(pte);
-		} else {
-			ret = follow_pfn_pte(vma, address, ptep, flags);
-			goto out;
+			return -EFAULT;
 		}
+		if (!is_zero_pfn(pte_pfn(pte)))
+			return follow_pfn_pte(vma, address, ptep, flags);
+		page = pte_page(pte);
 	}
-	folio = page_folio(page);
 
-	if (!pte_write(pte) && gup_must_unshare(vma, flags, page)) {
-		ret = -EMLINK;
-		goto out;
-	}
+	if (!pte_write(pte) && gup_must_unshare(vma, flags, page))
+		return -EMLINK;
 
 	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
 			     !PageAnonExclusive(page), page);
 
-	ret = gup_grab_folio_pages(folio, page, 1,
-			pte_dirty(pte), flags, pages);
-	if (ret)
-		goto out;
-	ret = 1;
-out:
+	*pagep = page;
+	return 0;
+}
+
+static long follow_page_pte(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmd, unsigned int flags,
+		struct page **pages)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	bool need_no_page_table = false;
+	struct page *page;
+	spinlock_t *ptl;
+	pte_t *ptep, pte;
+	long ret;
+
+	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
+	if (!ptep)
+		return no_page_table(vma, flags, address);
+	pte = ptep_get(ptep);
+
+	ret = gup_lookup_pte(vma, address, ptep, pte, flags, &page);
+	if (!ret && page) {
+		ret = gup_grab_folio_pages(page_folio(page), page,
+						     1, pte_dirty(pte), flags, pages);
+		if (!ret)
+			ret = 1;
+	} else if (!ret && pte_none(pte)) {
+		/*
+		 * no_page_table() may look up the page cache, so it cannot run
+		 * under the PTE lock. A none PTE returns from gup_lookup_pte()
+		 * before any write check runs, so this is the same call the old
+		 * code made -- not a new failure mode for FOLL_WRITE.
+		 */
+		need_no_page_table = true;
+	}
+
 	pte_unmap_unlock(ptep, ptl);
+
+	if (need_no_page_table)
+		return no_page_table(vma, flags, address);
 	if (ret > 0)
 		gup_flush_pages(vma, address, pages, ret);
 	return ret;
-no_page:
-	pte_unmap_unlock(ptep, ptl);
-	if (!pte_none(pte))
-		return 0;
-	return no_page_table(vma, flags, address);
 }
 
 static long follow_pmd_mask(struct vm_area_struct *vma,
-- 
2.53.0-Meta

