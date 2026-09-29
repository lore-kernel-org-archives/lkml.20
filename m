Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33F453161B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718817; cv=none; b=oCXoybYFiNyobYDqrNuufqXCFmcJo+guVZ5kLLlkPr8RDmpW/bfmfQyF8XJIpYM32Vl+c4rnLXA0fIHX4/A5im2KuQUuBjjDjSmp/Ttgf4GBnkY4e2QlQdtnjhwT8d8UxU9XgYGi1dRTAKmElMibLdfvXhfUW1Ve21wYPJpJCfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718817; c=relaxed/simple;
	bh=zzruahyydD+/JfkoryjcojvXG3wO9411LXT4CdRTps8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l3TRAJOWLHpllmkbCtq2IilJMrEesD0iFPfC/bmQvGh+idwpvuehIeJjIcaquJ5PlIArY8YXgxqNQRZS/SSgaSlbax+bPI4mqu7xGB4cS2OHofNsIK+07gnaVgL3s+fCHYI/V/pL7z0QJAPOwFYAkIYH9kveyL1VZ/fixTb8fA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SL/NULeo; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SL/NULeo"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-349ffa249bdso3923082eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718815; x=1791323615; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Okt1BYM8cWvy94RHyYjUAgOKsz864b3e7Z1IiAGJ5yQ=;
        b=SL/NULeoB6bqRFDxgpBbsl6PbtXVo2IEXevwW8TRKN1VLXTnqwc6l1Rf5YROx4W/DM
         kas0Z36y4jYrUA93wKMJ3aJOSSDBE1MUV00M2isTunq/C8ZBxIWp5kMe3zSbMCvT79Qx
         1O/HDDM0L7MK3oKgfo7IEKlGC459uQcHcGrMVfAZNMZ1/j7/85Pby+uDAPyvKLeKoNSL
         d9Tkc2zp3zvgeevqyY30rRi4aUqg3mFutYj5AdObwv1qSZVD35kI7FyDDWAi1qBYaYO4
         NRy4gZHlYHyDhzBvA7SmvUSdoS6NTl4s2I1G/DfcMlAKgKHk/kCF6O722d1VH32vpopm
         e27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718815; x=1791323615;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Okt1BYM8cWvy94RHyYjUAgOKsz864b3e7Z1IiAGJ5yQ=;
        b=fq8V7FyAg+klB7+LYIO21PW7MaoMCZQYWOXSE2sECGWil/7Lz9b8V8hqgbya0UElbr
         4+d2BTDTksYvR0Le2wejsqFTCZ1+Ira6v1+XqxREuYWBRz1Eq8T9W82TYQMonMILCJih
         1DJfdKabFWaVxvtRNzqGiQYqVCZvoIJ530n5rgs/QNwYXWkRTbuSxpTztU0jUWACpdDv
         1G4/WKJ7pfFbgthbhkdrfeRPF7gEOwWF/veEcpz8tq0D1jUX0XLDK6fnzUnyKPays8Em
         ThF5ViM+Z5vMRy1omwNP1UlqG73kEWab+75qBeW0oFxwguVExXXZ631jcExuCwbbgk1D
         aMkg==
X-Forwarded-Encrypted: i=1; AKwUvBzYL6dkh9rfml4Qh3xiIm4AxcQ4gTXUB2aM+TPRbxuKCeLEK5Q9Srz238+OrZOkbp+7iLBvMWIafBliMqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5A4RPj7SVyGOE9Fv9+je+SjvLqjZv5k/46Whn7ojoFb3EgAHe
	tT2nZ8Xfh6MVQyweag1YBVwsV1HV8y+MomRWH+SodVWX8vjlwotLOKY290/Sc5QbRC4tu5aXyXG
	7YeByZWxcVyZ456cjnGwn8w==
X-Received: from dycmz8.prod.google.com ([2002:a05:7300:ea08:b0:341:e362:8413])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:550a:b0:341:8ee2:6f76 with SMTP id 5a478bee46e88-34c676c6ac3mr582951eec.33.1790718814374;
 Tue, 29 Sep 2026 14:53:34 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:52:03 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-13-nilayvaish@google.com>
Subject: [PATCH 12/15] mm/ksm, userfaultfd: replace &folio->page with folio_page()
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

Replace direct &folio->page, &kfolio->page, &tree_folio->page, and
&src_folio->page uses with folio_page(..., 0) across KSM tree
comparison/merging and userfaultfd page population/movement paths.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/ksm.c         | 16 ++++++++++------
 mm/userfaultfd.c | 14 ++++++++------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index f33523a84a1a..bb8c564d9ffb 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1112,7 +1112,8 @@ struct ksm_stable_node *folio_stable_node(const struct folio *folio)
 static inline void folio_set_stable_node(struct folio *folio,
 					 struct ksm_stable_node *stable_node)
 {
-	VM_WARN_ON_FOLIO(folio_test_anon(folio) && PageAnonExclusive(&folio->page), folio);
+	VM_WARN_ON_FOLIO(folio_test_anon(folio) &&
+			 PageAnonExclusive(folio_page(folio, 0)), folio);
 	WRITE_ONCE(folio->mapping,
 		   (void *)((unsigned long)stable_node | FOLIO_MAPPING_KSM));
 }
@@ -1324,7 +1325,7 @@ static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
 	if (unlikely(!pte_present(entry)))
 		goto out_unlock;
 
-	anon_exclusive = PageAnonExclusive(&folio->page);
+	anon_exclusive = PageAnonExclusive(folio_page(folio, 0));
 	if (pte_write(entry) || pte_dirty(entry) ||
 	    anon_exclusive || mm_tlb_flush_pending(mm)) {
 		swapped = folio_test_swapcache(folio);
@@ -1355,7 +1356,8 @@ static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
 
 		/* See folio_try_share_anon_rmap_pte(): clear PTE first. */
 		if (anon_exclusive &&
-		    folio_try_share_anon_rmap_pte(folio, &folio->page)) {
+		    folio_try_share_anon_rmap_pte(folio,
+						  folio_page(folio, 0))) {
 			set_pte_at(mm, pvmw.address, pvmw.pte, entry);
 			goto out_unlock;
 		}
@@ -1893,7 +1895,7 @@ static struct folio *stable_tree_search(struct page *page)
 			goto again;
 		}
 
-		ret = memcmp_pages(page, &tree_folio->page);
+		ret = memcmp_pages(page, folio_page(tree_folio, 0));
 		folio_put(tree_folio);
 
 		parent = *new;
@@ -2100,7 +2102,8 @@ static struct ksm_stable_node *stable_tree_insert(struct folio *kfolio)
 			goto again;
 		}
 
-		ret = memcmp_pages(&kfolio->page, &tree_folio->page);
+		ret = memcmp_pages(folio_page(kfolio, 0),
+				   folio_page(tree_folio, 0));
 		folio_put(tree_folio);
 
 		parent = *new;
@@ -2333,7 +2336,8 @@ static void cmp_and_merge_page(struct page *page, struct ksm_rmap_item *rmap_ite
 		if (kfolio == ERR_PTR(-EBUSY))
 			return;
 
-		err = try_to_merge_with_ksm_page(rmap_item, page, &kfolio->page);
+		err = try_to_merge_with_ksm_page(rmap_item, page,
+						 folio_page(kfolio, 0));
 		if (!err) {
 			/*
 			 * The page was successfully merged:
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 3c7fd39deb13..a39d7d40a76b 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -565,7 +565,7 @@ static int __mfill_atomic_pte(struct mfill_state *state,
 				goto err_folio_put;
 		}
 	} else if (uffd_flags_mode_is(flags, MFILL_ATOMIC_ZEROPAGE)) {
-		clear_user_highpage(&folio->page, state->dst_addr);
+		clear_user_highpage(folio_page(folio, 0), state->dst_addr);
 	} else {
 		VM_WARN_ONCE(1, "Unknown UFFDIO operation, flags: %x", flags);
 	}
@@ -584,7 +584,7 @@ static int __mfill_atomic_pte(struct mfill_state *state,
 	}
 
 	ret = mfill_atomic_install_pte(state->pmd, state->vma, dst_addr,
-				       &folio->page, flags);
+				       folio_page(folio, 0), flags);
 	if (ret)
 		goto err_filemap_remove;
 
@@ -1268,7 +1268,8 @@ static struct folio *check_ptes_for_batched_move(struct vm_area_struct *src_vma,
 	folio = vm_normal_folio(src_vma, src_addr, orig_src_pte);
 	if (!folio || !folio_trylock(folio))
 		return NULL;
-	if (!PageAnonExclusive(&folio->page) || folio_test_large(folio)) {
+	if (!PageAnonExclusive(folio_page(folio, 0)) ||
+	    folio_test_large(folio)) {
 		folio_unlock(folio);
 		return NULL;
 	}
@@ -1306,7 +1307,7 @@ static long move_present_ptes(struct mm_struct *mm,
 	}
 	if (folio_test_large(src_folio) ||
 	    folio_maybe_dma_pinned(src_folio) ||
-	    !PageAnonExclusive(&src_folio->page)) {
+	    !PageAnonExclusive(folio_page(src_folio, 0))) {
 		err = -EBUSY;
 		goto out;
 	}
@@ -1590,7 +1591,8 @@ static long move_pages_ptes(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd
 			}
 
 			folio = vm_normal_folio(src_vma, src_addr, orig_src_pte);
-			if (!folio || !PageAnonExclusive(&folio->page)) {
+			if (!folio ||
+			    !PageAnonExclusive(folio_page(folio, 0))) {
 				spin_unlock(src_ptl);
 				ret = -EBUSY;
 				goto out;
@@ -2072,7 +2074,7 @@ static ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
 					struct folio *folio = pmd_folio(*src_pmd);
 
 					if (!is_huge_zero_folio(folio) &&
-					    !PageAnonExclusive(&folio->page)) {
+					    !PageAnonExclusive(folio_page(folio, 0))) {
 						spin_unlock(ptl);
 						err = -EBUSY;
 						break;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

