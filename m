Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97A54E781D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718809; cv=none; b=uyVN6wev+JKAwuVdoYiYqitFyrOtiX5EVl8hegaaNK592DKnUQXmj+ncKedvyQc2YJJb2WmhvjltQ3c+tQYGpXToyZRdTbvg3wtMHyK12kjT3avPgL8YuZs4FLzo77KSY6IOe5EhsudyUqTsHIrqZq62ejU93zLIdqBIbHlrk4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718809; c=relaxed/simple;
	bh=y67lGQhZ9VgN2pSDMuVqqafwGL+/qOHtBHVUBhYGySY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I0CTVnsynNZEu4rQaSBm7Pw7vWATYWkia5TtnKHzPfyBOwfqpJR8CwZOovxdWzTOcQ+DxNWI3COZl196/NhFK2JGQrzAAf2HM4ye2Jm/xwlz/Nn6GUpkNTprHC7WQ2VNJb+w3g7OVNpCSYq74WzgiYWWVd88z2ARgOE058CNTJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OndD/KHS; arc=none smtp.client-ip=74.125.82.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OndD/KHS"
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438fef603cso9997098c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718807; x=1791323607; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RahMTkaht7nhK0P4I392N//nShuSxCC9bOhbGUFtS7w=;
        b=OndD/KHSgwwS9jTvsXn/EPyYSrv6Zxp0QzkVn1QCFZuxb+6mZtn0H/CeNyPY4Ir21Q
         2+ArUeYlN4qsbbQ0MiG1VL4BGaYIFJiGiKKu9IQKkpuza5p2SZH39T4S5hDJsNhVvTW9
         TGfMFckAntJuxA99J5pnQqZ+VoQlfpVAqlJIPjlUk9F1DzS92u8ALU4Ny2dA1juZVRqs
         2XC2xVTmGRdD5EKSRYhJpxZe3beoZb12D6TpPvfWiAL5riXupE7YaKiEjVmGFyHS9VZ/
         zMhTqSHrC9uDbmWk1UuVZWFS8pd3smFWSnVUp7HgjrFvPD63iG9FP3ojguo+IJt2VAPk
         CQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718807; x=1791323607;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RahMTkaht7nhK0P4I392N//nShuSxCC9bOhbGUFtS7w=;
        b=FiIkf/6t6sGi828G/TL/DfwdLtqR2KK7V2k8go/RgWEoJ5jgai6PPiKBMXWNO0DnE1
         M6rThyfZaK2qbSSqRNHuqTp7A93T5PxlW6Ddu6OFHIl4wWBIzfcaUdh8xOCXFN/ooN0i
         wAvyUtikq83oWEkVojTHEwqKa03eBDGqe6BLAvhQ2RsjsCexNyZZR1RG4kg3pH6gKND3
         qy1lHAfQlonQI192xw7QbmhIYMroGzX2HDws7bZXu2/nqboagkDLbIjj8TUYpGy3UDrZ
         GfQXHjuDd9tbNvh5KyAmzr5jRlHwGlC81gFddn9+HipKKciiuSRKA0XbXYv5bQmaObwr
         h5Qg==
X-Forwarded-Encrypted: i=1; AKwUvBwnXoaQDul0/amCAgq9URSeQ08kLGTV0G3UNGvb1VenUiJXe+gieWinrZxFj8gVmREkX9m+2G34KDE8vrU=@vger.kernel.org
X-Gm-Message-State: AFuF++knevT7EUT8uq52Px3AGQ467gbdUl6pC4218APuBZUsQaLxE5oz
	GrFSCIOdNLA8A+axvMevBZzO7+VAT6TF/2VDDys6ENfd2+R1PBufF3VwbZCqFytaiF4Ak7JY5XE
	WYeS6ZHDo7M/BF4b7flRGWw==
X-Received: from dlbqs7.prod.google.com ([2002:a05:7023:d07:b0:143:7820:3080])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4286:20b0:14c:be8e:69eb with SMTP id a92af1059eb24-14cbe8e6ae4mr214250c88.7.1790718806743;
 Tue, 29 Sep 2026 14:53:26 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:51:59 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-9-nilayvaish@google.com>
Subject: [PATCH 08/15] mm/compaction: stop casting free pages to struct folio
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

In compaction_alloc_noprof(), pass freepage directly to
post_alloc_hook(), set_page_refcounted(), prep_compound_page(), and
page_rmappable_folio() instead of casting freepage to struct folio *
prematurely and referencing &dst->page. In compaction_free(), use
folio_page(dst, 0) and add &page->lru to the struct page freelist
cc->freepages[order] after free_pages_prepare().

No functional change intended.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/compaction.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index f1b2060eb201..d708d973250a 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1845,7 +1845,6 @@ static void isolate_freepages(struct compact_control *cc)
 static struct folio *compaction_alloc_noprof(struct folio *src, unsigned long data)
 {
 	struct compact_control *cc = (struct compact_control *)data;
-	struct folio *dst;
 	int order = folio_order(src);
 	bool has_isolated_pages = false;
 	int start_order;
@@ -1878,15 +1877,13 @@ static struct folio *compaction_alloc_noprof(struct folio *src, unsigned long da
 
 		list_add(&freepage[size].lru, &cc->freepages[start_order]);
 	}
-	dst = (struct folio *)freepage;
-
-	post_alloc_hook(&dst->page, order, __GFP_MOVABLE, ALLOC_DEFAULT);
-	set_page_refcounted(&dst->page);
+	post_alloc_hook(freepage, order, __GFP_MOVABLE, ALLOC_DEFAULT);
+	set_page_refcounted(freepage);
 	if (order)
-		prep_compound_page(&dst->page, order);
+		prep_compound_page(freepage, order);
 	cc->nr_freepages -= 1 << order;
 	cc->nr_migratepages -= 1 << order;
-	return page_rmappable_folio(&dst->page);
+	return page_rmappable_folio(freepage);
 }
 
 static struct folio *compaction_alloc(struct folio *src, unsigned long data)
@@ -1903,10 +1900,10 @@ static void compaction_free(struct folio *dst, unsigned long data)
 {
 	struct compact_control *cc = (struct compact_control *)data;
 	int order = folio_order(dst);
-	struct page *page = &dst->page;
+	struct page *page = folio_page(dst, 0);
 
 	if (folio_put_testzero(dst) && free_pages_prepare(page, order)) {
-		list_add(&dst->lru, &cc->freepages[order]);
+		list_add(&page->lru, &cc->freepages[order]);
 		cc->nr_freepages += 1 << order;
 	}
 	cc->nr_migratepages += 1 << order;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

