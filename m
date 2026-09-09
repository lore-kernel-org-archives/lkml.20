Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452432EEE8A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922721; cv=none; b=uY4JaG+Ulv55VV5b5/rd9pO9ujQ/sUTXtk9VCmbl+yzHHldvS5CH6i9E/NK4o6FjsXlqbIBkVV0RZiG/PiQe77K7GCb2hyYfVm76sqX7pAxmTZa1me7ZOAwey2qW6MYAuR1t5bEmaQ4cjhCM+kkLm1jFc/l7YFJkfU2YT/WZmH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922721; c=relaxed/simple;
	bh=LXlsTApBrqoiuYStPAwfG+fUQJZVGG67zHShaS1Y7Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jSs9UsKpTQtiCFaQyJeYvmuWfysFc/SRT8mOdvodsvtmZ2xqt3tiAHA+16aFVYXbGnjEdt68ykI8OPlIsYH+SyByQHrbeELHTmQL9da0SaSQcqEqfpRr2sEDCz1V8gftNHWKW0YGm1Od2lNGVnP7sNImebTK+Eg0Jf+HaC4aURE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F31EtvlQ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F31EtvlQ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso4007909a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788922717; x=1789527517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CrA+cvlGJlbJCNYzltiXcEC/SgR4IipKiqObnP/BdA=;
        b=F31EtvlQdHqbNTjE2jPVwVCi56lpwAjxECZtcS/Oy/421ZU7FhvcuYy6c9IMx+sqno
         ZoKwCB2/lDSQXC/vw6UUgB5V9mYjrb7Uh3pQbrquwjx9tx9flNpKfmuSLQJCthGPeAh3
         IBkgcFW0p8lNSKiTrCPHTNTqCb52+kqINKnsIxKsT3mlmGJv/EP56bNaSKoSvMn2pL/w
         mqO1HdmoxY4W2wL3ciR1vdaNBKHeQnPjNbX+GmVX2mindX7FdIv1W0tc5Ow9sT6xGK0t
         PE2NfP7wT/gUXE3cY9lkTeNlHQybzAgARxiD3FnHRxQzMljnd84n/9GfVzn+XsGv76rf
         DkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788922717; x=1789527517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+CrA+cvlGJlbJCNYzltiXcEC/SgR4IipKiqObnP/BdA=;
        b=Vaa3ZuzliWLzriV36Opgyj1PL4xCvUS4PsZs64zBXqmEkZ8LFuvIIgBgNwfRtDfbJ3
         LhBdq9w2zRDFzq6h+JPK8JGqV5LvXkFGEJjwzp7YxwKmjq0WyckjzjmAKJYWiqc3V+Cr
         md+u4nhN9XYptcAL7A+v2BI4X88rs+ZtHDnoyFpMXbShLQNFFF/DtOBnUsiqf/zPKF/l
         4lKJmflSKyvOqN02cPBbclT9fWpmyZp+GhRUX61d/erbLeSzB2GWnDLjOOBz+lkstkjh
         M/wIGBwUXUBM08MTX/osyTjUwM3wXaeKrUvZkkng5LcWENg/YQKFMkUR3XA316nKhxOX
         rEvg==
X-Forwarded-Encrypted: i=1; AKwUvBxzfBFGeOH8hbhp5d4LcbzlRRjTAEx5NuAGn9GB0P/nvDgA3mL72v4RefpO+WFdbp/wYO54qaxkWtW81vg=@vger.kernel.org
X-Gm-Message-State: AFuF++mZF8IhBrJdH4RZcj2oHGh9ldAb1iaULz/A0r8+52fUkepDGnUT
	KFAGxbgtOUom4ak36mXEm44hg+Eatmi9K8GbFywxeC5RGpub6U9o3847
X-Gm-Gg: AYBFou3yrnsV3ng8MENK0AdvzLgTQ2S3TpSoov19ywnESCMfZz8uZz17TiULfcaphZc
	DtYOU7uVdYgHSP6q6EJRT//DXJOjhw0cj6G9StW2n613N5XX8J/urcvLVGVQA3a4ADYMgvn0X5L
	xjxqfktWNOarxxtPO1hsLctOqJ6qdxrUl0br3httPOtZkQflLgpBF7V1xwNr27EzG16vpzVQaZ9
	mEANfsiZGdwzDfxrW1YpHq3luQHw0HNDLWu5ukhfBAHymR5E3X/OnxR73a+7QD/K/rDiFMUPN7F
	3evNwvKVibMsczEH0EBEu2Wf/RPZjxVefuoVN5uFD6/TWE2cydi/zef8KlD1z4jindN3iMCY2fj
	yAM8il2Y7n75aP39YwIBqkbdz0ttOk5MzSZcPDIKxmLf/5F2DgNMie0vu7zimR0HyOcqmFQ4Tmm
	Q6XyIP5PB6/ucN2Q/byc6r4H7PJvpXP3l19RWh/ylIVWyX3t1iRKf0qnqB3YKuv/Q+zVJL5vu8V
	kfhQWk83m4oDA==
X-Received: by 2002:a17:90b:4d06:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39b2614df74mr46235543a91.1.1788922717300;
        Tue, 08 Sep 2026 19:58:37 -0700 (PDT)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39451sm35077172a91.7.2026.09.08.19.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:58:36 -0700 (PDT)
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
Subject: [PATCH v5 2/3] mm: khugepaged: fix folio is used after pte_unmap_unlock()
Date: Wed,  9 Sep 2026 10:58:02 +0800
Message-ID: <20260909025804.3233645-3-vernon2gm@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909025804.3233645-1-vernon2gm@gmail.com>
References: <20260909025804.3233645-1-vernon2gm@gmail.com>
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

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Fixes: 7d2eba0557c1 ("mm: add tracepoint for scanning pages")
Cc: stable@vger.kernel.org
Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>
---
 include/trace/events/huge_memory.h |  6 +++---
 mm/khugepaged.c                    | 10 +++++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

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
index 6ee0ad13a31f..b352c1330f8e 100644
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
 
@@ -1784,7 +1792,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		*lock_dropped = true;
 	}
 out:
-	trace_mm_khugepaged_scan_pmd(mm, folio, referenced,
+	trace_mm_khugepaged_scan_pmd(mm, failed_pfn, referenced,
 				     none_or_zero, result, unmapped);
 	return result;
 }
-- 
2.53.0

