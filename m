Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D886241C6A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896800; cv=none; b=JjykCCtQbFIGwcMheyjfajvJ43Oi3q2Epzjt/Ps9AtvQs/fWN05QifrFC0f41FplzSkAQRgQKJOthDa3kkRvQ7w29V9406rdZixwidQTrQH6MxrRjtijYPwaz0n/gW5AfXPBAPB5TxSTBI4Gj0lWLa1pSVmKS3wPtu807nSc6sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896800; c=relaxed/simple;
	bh=xqzn9VzOzXthsGZCeQ/UCMTMeDqmtcMCdFN82+11dso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sz+N0BNfzSm5sRMzAhpl0nEmVcSjidNpfIVFULQJcc0DeYMJ2jxkeHMhfec+DYr6b1av7We6ICsr6is4mi8TVq3M+7Y/S9Co5FSuXhXyrMbQk0h2oclKb+Hrr77DnP9NrviVL/hw5Cm4Swmv79XDv6nnqWq2xkv2DID2AUMTeB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWTvH3Rb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWTvH3Rb"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381b831d535so1317936a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787896798; x=1788501598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7VK6Qr7VyOU0DiKXFkET6z2QkJwdvjQa2S5pL5XscY=;
        b=nWTvH3RbXCZV/Ec7kh4pJbPbxzVeTiNJBs1rht4tZ/wseSyYzLb+9ULfyIA6FGlBOi
         S/jlnPByXn74M/kHiCCZEtmfxBCKBhoriAIhO11Du8hY13XYuJSgwczUu5UkVMnusFPG
         EKmpEdBtM6k6icmC9M5nu3VxXkQJgSRVMzid4Q+rpa4r7ViKng0AD5NADL0zp/I/2tGD
         VE8SKOmgHEhrmM6F+lsixorN+UffHOnF89NJ+5HxCiV7Pd3eSOO62Gd/HFjZ5jQLZQcc
         XXL0vVS607KDe9D5ZIT7IILee4FCPLvs7V9XGpOkLmFMn0VwYDb2dxFdkes6foTwgRLc
         csjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896798; x=1788501598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7VK6Qr7VyOU0DiKXFkET6z2QkJwdvjQa2S5pL5XscY=;
        b=Lb0u4kYwklQZ3OBmDxPCNKi3CTsLEXEl8nSZZOJ5l/NQunD3lZ4au5CKFQYVGOZWig
         2J12fptw4BHWs/AQKL9VaFXV0Amr7xIHzf+CgnWueuK319rK5Zue2I6MNaU/UQoCh6lz
         ciTlyZahRislAN+8zN7uKkWEDzo0QOKt0fTnMF1CnqV72wg6x1NPssM0Ec+uS07n2Vku
         vnFFZxAMftdQY2hvCQAI9dIua/5PZUj+/7MofKzbwB2NKtcSGkq0A6AjdV0h2/ekJkOe
         L87i8wjrswP3Q/nFV0Cwv721zZvSl3hV9f+rQCETRUuQwtwJ5h1GKvvlnsKqXc92vFLm
         Rz1A==
X-Forwarded-Encrypted: i=1; AHgh+RpWpf+gJSKodawP580jV/0khuzcYqPWuP3agcom51OOyd3x/ywHR9ScA9ObdigJX7jQoJqFSxzj/mf77F4=@vger.kernel.org
X-Gm-Message-State: AFuF++lV5KmGNGOgkJfT/5hwKCUup1WlgV44Wn5N4Yp/4Hp9t05Gk9TO
	NflrC5Sa+vY4wxQ0W7yXV/Yqfd6XCvN/L53WwabczNgI/AUKMUtGBtwU
X-Gm-Gg: AR+sD12CxaSrpPXHYJeHjGrb1PbAQn/EPmxEG/RAzHFsVZJ553Y6YTkK2/ki9poBXft
	7/XVhs7G6KpukorKX/g5uxA+Ry9DjzBLOMUbk0CeEeruHpAoJs0SpKN3hPj8dgY7d/q/qBP1M68
	K7kUtuC6tknvRL/Gs//b8ruoy2s6+gnPtJ/28yW7rtAd6jDBsrkieDxH/HWANjlRHNVGa0ZBU6i
	yaTN60itsX9Wfq2KqOJ4I9GJ6XY90j+aOI9fBOnnOxVsvRYJOs3c1evz9zbiled+oLbucjF7B17
	cOHXWVfUkqBj0JI5Ms8fpzkZ8iERMiZryOCTH8/ayCUrHV851RzJ2RzWF3Vc0pUbMytDQ0HNN4f
	UpRjOmECdu8ApKKB6ogrAbFCF/L2DmC/KUtWIciSwvig6dxSqI0QWShKH0vuPnx+W1GtfOIv/KT
	KfFb65e5Xiahkwxk9icTS9v0fwfvqFTZOIJC6ZY2KI15wTnejW8YcUVz0OtnMvJOrB+N8FsXmEl
	HLr
X-Received: by 2002:a17:90b:51d2:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-396d0f8ffdamr9816307a91.9.1787896798256;
        Thu, 27 Aug 2026 22:59:58 -0700 (PDT)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm5826241a91.2.2026.08.27.22.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:59:57 -0700 (PDT)
From: Vernon Yang <vernon2gm@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	zokeefe@google.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org,
	Vernon Yang <yanglincheng@kylinos.cn>
Subject: [PATCH v4 2/3] mm: khugepaged: fix folio is used after pte_unmap_unlock()
Date: Fri, 28 Aug 2026 13:59:25 +0800
Message-ID: <20260828055926.346744-3-vernon2gm@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828055926.346744-1-vernon2gm@gmail.com>
References: <20260828055926.346744-1-vernon2gm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vernon Yang <yanglincheng@kylinos.cn>

After the page table lock has dropped, the folio can be freed
concurrently. The trace_mm_khugepaged_scan_pmd() is left with
a dangling folio pointer.

So using the folio_pfn() before dropping the page table lock, closing
use-after-free window.

And other pre-existing bug, When the `for (i = 0; i < HPAGE_PMD_NR; i++)`
iteration to terminate and the folio operation preceding is normal, but
pfn will be incorrect. so we really only trace the PFN if it really was
problematic.

About calling the respective trace_xxx() functions separately on success
and failure, refer to [1].

[1] https://lore.kernel.org/linux-mm/ao6jVbVHLUmuY2UA@gremlin/

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Fixes: 7d2eba0557c1 ("mm: add tracepoint for scanning pages")
Cc: stable@vger.kernel.org
Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>
---
 include/trace/events/huge_memory.h |  6 +++---
 mm/khugepaged.c                    | 17 ++++++++++++++---
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/include/trace/events/huge_memory.h b/include/trace/events/huge_memory.h
index 7b526528f85b..fa828967e1fb 100644
--- a/include/trace/events/huge_memory.h
+++ b/include/trace/events/huge_memory.h
@@ -55,10 +55,10 @@ SCAN_STATUS
 
 TRACE_EVENT(mm_khugepaged_scan_pmd,
 
-	TP_PROTO(struct mm_struct *mm, struct folio *folio,
+	TP_PROTO(struct mm_struct *mm, unsigned long pfn,
 		 int referenced, int none_or_zero, int status, int unmapped),
 
-	TP_ARGS(mm, folio, referenced, none_or_zero, status, unmapped),
+	TP_ARGS(mm, pfn, referenced, none_or_zero, status, unmapped),
 
 	TP_STRUCT__entry(
 		__field(struct mm_struct *, mm)
@@ -71,7 +71,7 @@ TRACE_EVENT(mm_khugepaged_scan_pmd,
 
 	TP_fast_assign(
 		__entry->mm = mm;
-		__entry->pfn = folio ? folio_pfn(folio) : -1;
+		__entry->pfn = pfn;
 		__entry->referenced = referenced;
 		__entry->none_or_zero = none_or_zero;
 		__entry->status = status;
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b597a3e68606..4d360ae87769 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1612,6 +1612,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 	enum scan_result result = SCAN_FAIL;
 	struct page *page = NULL;
 	struct folio *folio = NULL;
+	unsigned long failed_pfn = -1;
 	unsigned long addr;
 	unsigned long enabled_orders;
 	spinlock_t *ptl;
@@ -1706,11 +1707,13 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		if (cc->is_khugepaged && !(vma->vm_flags & VM_DROPPABLE) &&
 		    folio_test_lazyfree(folio) && !pte_dirty(pteval)) {
 			result = SCAN_PAGE_LAZYFREE;
+			failed_pfn = folio_pfn(folio);
 			goto out_unmap;
 		}
 
 		if (!folio_test_anon(folio)) {
 			result = SCAN_PAGE_ANON;
+			failed_pfn = folio_pfn(folio);
 			goto out_unmap;
 		}
 
@@ -1721,6 +1724,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		if (folio_maybe_mapped_shared(folio)) {
 			if (++shared > max_ptes_shared) {
 				result = SCAN_EXCEED_SHARED_PTE;
+				failed_pfn = folio_pfn(folio);
 				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_SHARED_PTE,
 						     MTHP_STAT_COLLAPSE_EXCEED_SHARED);
 				goto out_unmap;
@@ -1738,15 +1742,18 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		node = folio_nid(folio);
 		if (collapse_scan_abort(node, cc)) {
 			result = SCAN_SCAN_ABORT;
+			failed_pfn = folio_pfn(folio);
 			goto out_unmap;
 		}
 		cc->node_load[node]++;
 		if (!folio_test_lru(folio)) {
 			result = SCAN_PAGE_LRU;
+			failed_pfn = folio_pfn(folio);
 			goto out_unmap;
 		}
 		if (folio_test_locked(folio)) {
 			result = SCAN_PAGE_LOCK;
+			failed_pfn = folio_pfn(folio);
 			goto out_unmap;
 		}
 
@@ -1759,6 +1766,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		 */
 		if (folio_expected_ref_count(folio) != folio_ref_count(folio)) {
 			result = SCAN_PAGE_COUNT;
+			failed_pfn = folio_pfn(folio);
 			goto out_unmap;
 		}
 
@@ -1782,10 +1790,13 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 				       unmapped, cc, enabled_orders);
 		/* mmap_lock was released above, set lock_dropped */
 		*lock_dropped = true;
-	}
+		trace_mm_khugepaged_scan_pmd(mm, -1, referenced, none_or_zero,
+					     SCAN_SUCCEED, unmapped);
+	} else {
 out:
-	trace_mm_khugepaged_scan_pmd(mm, folio, referenced,
-				     none_or_zero, result, unmapped);
+		trace_mm_khugepaged_scan_pmd(mm, failed_pfn, referenced,
+					     none_or_zero, result, unmapped);
+	}
 	return result;
 }
 
-- 
2.53.0

