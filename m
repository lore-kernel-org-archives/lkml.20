Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9A247DD7B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718808; cv=none; b=ZfjxlHooolfDA8ghJL216vI1I5f7Ea5iQJiXWtygi4A3JLoGd9U+1AUTM8oepJHfStFpPxSlzw83oPW8qftw4rhjoYN2DI9VHSvQP5OIx0EFM4yZUxFbKFKJxsGmrxUbBfW9Qqlpq+Ofi+v0NWnq9uA5XE+96oOz7RZZ23JFuyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718808; c=relaxed/simple;
	bh=MRfUENTHZnWLSoe/35nd/PTbboJLRjK23HWN2n4+YiM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Eqj2f4qbbLVMVg6Rqr/u7ePPYjX7nh4A8rfkxndrJ6QjqBjN8MPY1gqIDM+hhPgJBWTIN524AEL0PSvPAksVNWjlN/5pFMjwYtkmYoHlAWMyseDGZg7HZRjQPrD4zRjW6LuXfs255CbPLal8t9Gp7HJh0OOyVeWL0N1f2eQ1ioE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WOB4IMr8; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WOB4IMr8"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34afa104860so1779373eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718803; x=1791323603; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJjhQdW+p+tLNJzNm6XENykAkGAtvvXL7czwPhgmpfM=;
        b=WOB4IMr8/dna/Y65hfnrLjUNGL1OQX6xYbliPxA8mxBfF7fXIZfDr80beT1tSZ/2Xz
         IprLSvGlRSDRifQlTxxd3DG7WLD9u3LgEk2cPvIL/FRmF1F6OvBBnLzP5vBwbURD6D4G
         45LjIMzEP6eum0+QrrVZCTEYrRzX8McaM5UKkX+jI03dHMFINQq0aWFvQJKBh+R9yjbG
         4CMDuj7sCRMYACdNs+aA4igEMtsBfte3XR0wMre/xaIdIYyOJgqG14lzB/TAoNO4EeYY
         fIN4oew8P3io24c1JKYZZ3HlQS9GL8Yk7zWZiUWxr1V3YA/ijKZmut+BlhFMdhTxPSuo
         vv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718803; x=1791323603;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJjhQdW+p+tLNJzNm6XENykAkGAtvvXL7czwPhgmpfM=;
        b=H2td7rLCPjrlBysWwPDzpoZn8RzB7qKz9gYGF4HFjk42S0OInv41pRrZCiroegVSDB
         OwrB+NgsuNR4FNyLSzUaXiVzspAfkM/W7En8f0tXlFIB5FLgS478sSCb9r8oOCqnQniZ
         a6EHBZsJfGrSqZE5u3Mb+kLYWrXOb7WkBZWMHmQ058yjNUingTCMbF4Y5uwoRHYn7YLS
         wrpVymqdv8Dx2aJKJsxPDD83ODVHj4AMisAOnmWgki60jmVo59quKmmvu0d0fMb7ltRa
         y0B0OjoO2WsLexh2DM7l9E0hlsU26I3CVJEROJqWhyLkVkfpU28vdWWLAkUPLgTIyby/
         SdHg==
X-Forwarded-Encrypted: i=1; AKwUvBy5XMmxezJsAbD0iOlYM7oFLPuzQhEt9L7JhTzkc6/A94QhP/c49tPYy0qqP3PBoTYic/JuFwg1js3s7wY=@vger.kernel.org
X-Gm-Message-State: AFuF++k0EvT6XgQTuEK+WtsbhuoxvHDm8N+VRwKZOuJPe0wFdHgySFLl
	BVhPj9f1D9gK5OPRBpRB716ytkT+sQGeDBNjcFP9MmRXrALCcAELlMJLBwKQJLf3grR/7jErjPX
	bq8KNNrZHyInq7SurVIcx4w==
X-Received: from dlbrj21.prod.google.com ([2002:a05:7022:f415:b0:146:33a4:4ffd])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:451b:10b0:146:606e:1f62 with SMTP id a92af1059eb24-14c9e29a175mr556620c88.41.1790718802962;
 Tue, 29 Sep 2026 14:53:22 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:51:57 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-7-nilayvaish@google.com>
Subject: [PATCH 06/15] mm/hugetlb: replace &folio->page with folio_page() and VM_BUG_ON_FOLIO()
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

Replace direct &folio->page uses in mm/hugetlb.c with
folio_page(folio, 0) and convert VM_BUG_ON_PAGE(..., &old_folio->page)
in hugetlb_wp() to VM_BUG_ON_FOLIO(..., old_folio) as a 1:1 replacement
that avoids referencing &old_folio->page without changing behavior.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/hugetlb.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a1b51251103b..31ca8777ccba 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1274,7 +1274,7 @@ static struct folio *dequeue_hugetlb_folio_node_exact(struct hstate *h,
 		if (folio_test_hwpoison(folio))
 			continue;
 
-		if (is_migrate_isolate_page(&folio->page))
+		if (is_migrate_isolate_page(folio_page(folio, 0)))
 			continue;
 
 		list_move(&folio->lru, &h->hugepage_activelist);
@@ -1511,7 +1511,7 @@ static void __update_and_free_hugetlb_folio(struct hstate *h,
 	if (folio_test_hugetlb_cma(folio))
 		hugetlb_cma_free_frozen_folio(folio);
 	else
-		free_frozen_pages(&folio->page, folio_order(folio));
+		free_frozen_pages(folio_page(folio, 0), folio_order(folio));
 }
 
 /*
@@ -1701,7 +1701,7 @@ void free_huge_folio(struct folio *folio)
 
 	hugetlb_set_folio_subpool(folio, NULL);
 	if (folio_test_anon(folio))
-		__ClearPageAnonExclusive(&folio->page);
+		__ClearPageAnonExclusive(folio_page(folio, 0));
 	folio->mapping = NULL;
 	restore_reserve = folio_test_hugetlb_restore_reserve(folio);
 	folio_clear_hugetlb_restore_reserve(folio);
@@ -3238,7 +3238,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 	 */
 	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
 		__init_single_page(page, pfn, zone, nid);
-		prep_compound_tail(page, &folio->page, order);
+		prep_compound_tail(page, folio_page(folio, 0), order);
 		set_page_count(page, 0);
 	}
 }
@@ -3259,7 +3259,7 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
 	ret = folio_ref_freeze(folio, 1);
 	VM_BUG_ON(!ret);
 	hugetlb_folio_init_tail_vmemmap(folio, h, 1, nr_pages);
-	prep_compound_head(&folio->page, huge_page_order(h));
+	prep_compound_head(folio_page(folio, 0), huge_page_order(h));
 }
 
 /*
@@ -4004,7 +4004,8 @@ static long demote_free_hugetlb_folios(struct hstate *src, struct hstate *dst,
 
 		list_del(&folio->lru);
 
-		split_page_owner(&folio->page, huge_page_order(src), huge_page_order(dst));
+		split_page_owner(folio_page(folio, 0), huge_page_order(src),
+				 huge_page_order(dst));
 		pgalloc_tag_split(folio, huge_page_order(src), huge_page_order(dst));
 
 		for (i = 0; i < pages_per_huge_page(src); i += pages_per_huge_page(dst)) {
@@ -5605,9 +5606,9 @@ static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
 	 * be leaks between processes, for example, with FOLL_GET users.
 	 */
 	if (folio_mapcount(old_folio) == 1 && folio_test_anon(old_folio)) {
-		if (!PageAnonExclusive(&old_folio->page)) {
+		if (!PageAnonExclusive(folio_page(old_folio, 0))) {
 			folio_move_anon_rmap(old_folio, vma);
-			SetPageAnonExclusive(&old_folio->page);
+			SetPageAnonExclusive(folio_page(old_folio, 0));
 		}
 		if (likely(!unshare))
 			set_huge_ptep_maybe_writable(vma, vmf->address,
@@ -5616,8 +5617,8 @@ static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
 		delayacct_wpcopy_end();
 		return 0;
 	}
-	VM_BUG_ON_PAGE(folio_test_anon(old_folio) &&
-		       PageAnonExclusive(&old_folio->page), &old_folio->page);
+	VM_BUG_ON_FOLIO(folio_test_anon(old_folio) &&
+			PageAnonExclusive(folio_page(old_folio, 0)), old_folio);
 
 	/*
 	 * If the process that created a MAP_PRIVATE mapping is about to perform
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

