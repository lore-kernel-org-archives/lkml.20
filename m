Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE714FDA5D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718815; cv=none; b=VUtaFqPha+YqIDOM0pXAGdPMjZv85+4QkFKOQx0NXCtukvxPCfrld2zjs3v8XiuL8jwdCmWd9mn+wLRdAFhvQ/XOs642zLtZiL2OMG5U+Of/HyeIIqs/NN4hy/0l7S/YpPLGKL7hK4/ChMirC3dwMRSbRueD7Kkv5YuIA8KFaHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718815; c=relaxed/simple;
	bh=S8mCzp4NxjMAdNAy3wnw6Op/TTmHcJj81ZzN3VIYwFE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q5NZLwtEW6Sz/CppAjCPjLTUDigpE4tTPqSnBza30IJ1qudnMFHcSMhSWh3EQ3h6yFG5Lc1fw5jZfmXdH/NBj//Nr92h+nMk0NXCPOQcPg/0py+/IIUnW7/biYqXl3ntMUWwMrQqbHyCUmcSpRlrosi/PT44qZbsADJH07lKCp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rBy6Gpkp; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rBy6Gpkp"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34344599f01so3533002eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718813; x=1791323613; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAMB3W3KRBdsKi3TzRfB6ZNmdd0wTycBXYPw/qJaC3E=;
        b=rBy6GpkpN/trisVzMb9J5Ri8KlGBkuUSD/UHNWA9sEX/0FlJfMxkFkiKQdEfHed/a1
         qkAvw8Y7BnXcjCbeQctnu4UD4J/GTMbnqLZtgKohRHvLU0Af146krL7P7YSa1YBEzu2h
         Hs4UudFyJWPYLD0/bAzQLARtrh+05SoN75FKE44Uce5p9Ymfz1pvc+DQrsyhmw9IYILT
         huzpqZtTdn6HJoTXW4bjMYaxBQM8pGYMPa8/mqmw5Wmimp+sFHrAHu7g+0TCctGQmk72
         U+OD8c7wy+7f3FTL9ym2FZ4MJMCwAtRjJyLEPcq6XsruloRC8lASyAAwJjyvSMjrXXoV
         v/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718813; x=1791323613;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAMB3W3KRBdsKi3TzRfB6ZNmdd0wTycBXYPw/qJaC3E=;
        b=cam/hsaOB8Zk5J4aKYmUeAPaT//sENVdvPX1EZvYolUtJsf6MhURvaavcRcrQq4PoD
         ZJiAZV4aBpzIbdCUcDYuKriZBsqyuf7kz8Au8P0frGN+q7bpmEIXbZAu48eZXmTK9Y+t
         0SMEk57nKMNC2iswkAvmmTiLyhT3QGHw2kitjoY37EkS72FniM6lUAKiT2cYseY4LVPS
         +LHnvWJ8pE88EFR12NrijXpmHqPk8nwPw05RF4Hq+KG8PrXzac7gmNRiy3dAmD/Sz/hu
         arSh8DNZN6fFNVuSQJZL3wTJdV1+PVw8+cxu0B9yXhueeBv4ok4+WJ32musy29lnqUQ0
         S7eQ==
X-Forwarded-Encrypted: i=1; AKwUvBywkH9VjeVVsPC2/3UP8D0TZiLoTcLSTu/X3XQ6URRlhZh4Nr6c46QPI/OWX+JqP/qRaZni6uBwIcAfqys=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+tvFoJrokQfhzun2i8v/vMMfbxRcG15E9K59y58Ae1oq93opA
	MTOayNx64c4Ns0aMcVMkcYCxDhnfR0Zf9BL3z7Gu06lO30t5iLd9HJHQO+YpOCOm0TINfhCjUES
	cJ6zAHTQxT6dmp0N2HLt45Q==
X-Received: from dybhi53.prod.google.com ([2002:a05:7301:29b5:b0:33e:4e3a:51a8])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:18aa:b0:342:5098:a983 with SMTP id 5a478bee46e88-34c6370d985mr650471eec.11.1790718812376;
 Tue, 29 Sep 2026 14:53:32 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:52:02 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-12-nilayvaish@google.com>
Subject: [PATCH 11/15] mm/rmap, gup: use folio_page() for PageAnonExclusive
 and gup_must_unshare
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

Replace &folio->page with folio_page(folio, 0) when checking or setting
PageAnonExclusive() in folio_add_new_anon_rmap(),
hugetlb_add_anon_rmap(), hugetlb_add_new_anon_rmap(), and
sanity_check_pinned_pages(), and when calling gup_must_unshare() in
gup_fast_pmd_leaf() and gup_fast_pud_leaf().

No functional change intended.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/gup.c  | 11 +++++++----
 mm/rmap.c | 10 +++++-----
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 8e9ef5ee7498..1ce7ea5e7abb 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -59,10 +59,11 @@ static inline void sanity_check_pinned_pages(struct page **pages,
 		    !folio_test_anon(folio))
 			continue;
 		if (!folio_test_large(folio) || folio_test_hugetlb(folio))
-			VM_WARN_ON_ONCE_FOLIO(!PageAnonExclusive(&folio->page), folio);
+			VM_WARN_ON_ONCE_FOLIO(!PageAnonExclusive(folio_page(folio, 0)),
+					      folio);
 		else
 			/* Either a PTE-mapped or a PMD-mapped THP. */
-			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page) &&
+			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(folio_page(folio, 0)) &&
 					     !PageAnonExclusive(page), page);
 	}
 }
@@ -2957,7 +2958,8 @@ static unsigned long gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp,
 		gup_put_folio(folio, nr_pages, flags);
 		return 0;
 	}
-	if (!pmd_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
+	if (!pmd_write(orig) &&
+	    gup_must_unshare(NULL, flags, folio_page(folio, 0))) {
 		gup_put_folio(folio, nr_pages, flags);
 		return 0;
 	}
@@ -2999,7 +3001,8 @@ static unsigned long gup_fast_pud_leaf(pud_t orig, pud_t *pudp,
 		return 0;
 	}
 
-	if (!pud_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
+	if (!pud_write(orig) &&
+	    gup_must_unshare(NULL, flags, folio_page(folio, 0))) {
 		gup_put_folio(folio, nr_pages, flags);
 		return 0;
 	}
diff --git a/mm/rmap.c b/mm/rmap.c
index fbd66a2823b7..cd1cf570c770 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1668,7 +1668,7 @@ void folio_add_new_anon_rmap(struct folio *folio, struct vm_area_struct *vma,
 		/* increment count (starts at -1) */
 		atomic_set(&folio->_mapcount, 0);
 		if (exclusive)
-			SetPageAnonExclusive(&folio->page);
+			SetPageAnonExclusive(folio_page(folio, 0));
 	} else if (!folio_test_pmd_mappable(folio)) {
 		int i;
 
@@ -1694,7 +1694,7 @@ void folio_add_new_anon_rmap(struct folio *folio, struct vm_area_struct *vma,
 		if (IS_ENABLED(CONFIG_PAGE_MAPCOUNT))
 			atomic_set(&folio->_nr_pages_mapped, ENTIRELY_MAPPED);
 		if (exclusive)
-			SetPageAnonExclusive(&folio->page);
+			SetPageAnonExclusive(folio_page(folio, 0));
 		nr_pmdmapped = nr;
 	}
 
@@ -3187,9 +3187,9 @@ void hugetlb_add_anon_rmap(struct folio *folio, struct vm_area_struct *vma,
 	atomic_inc(&folio->_entire_mapcount);
 	atomic_inc(&folio->_large_mapcount);
 	if (flags & RMAP_EXCLUSIVE)
-		SetPageAnonExclusive(&folio->page);
+		SetPageAnonExclusive(folio_page(folio, 0));
 	VM_WARN_ON_FOLIO(folio_entire_mapcount(folio) > 1 &&
-			 PageAnonExclusive(&folio->page), folio);
+			 PageAnonExclusive(folio_page(folio, 0)), folio);
 }
 
 void hugetlb_add_new_anon_rmap(struct folio *folio,
@@ -3203,6 +3203,6 @@ void hugetlb_add_new_anon_rmap(struct folio *folio,
 	atomic_set(&folio->_large_mapcount, 0);
 	folio_clear_hugetlb_restore_reserve(folio);
 	__folio_set_anon(folio, vma, address, true);
-	SetPageAnonExclusive(&folio->page);
+	SetPageAnonExclusive(folio_page(folio, 0));
 }
 #endif /* CONFIG_HUGETLB_PAGE */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

