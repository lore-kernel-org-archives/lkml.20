Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFAD531AEB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718820; cv=none; b=TyEb0K4YqFPj439dbxsIYXcpxj/KNpRCvz3uE4ryzJ7g0ne+PBr6D3ZBrNtt0MM+HWZIFnb8MEhimp16RDn7hdqXlNGF4t6yvbRQfVq8s4C8DlI+vEJWZtJPY35r2Gb2smFsko+tGt5Z/wLMTgQd5VPmaO9YzhZF8ldvVOqOxac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718820; c=relaxed/simple;
	bh=cX6NFaEzGNODYDFC4D/aRaT+cSNf1dC1Pojw9AckivY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Gv/1wKuU2tRoKVkNJKWutnR4XYkphFswRSldq+tDeM/jPUfe2UBQ+eNHFIEfL9JAvaWPhLW+sqhYBi37Fzg4uLQR79XzOBU9JP07I+PdZ4k2pJgGX2HTgiHVGLxtayC0/G4B90+XxH2b/6xS5rBRKIR29rIkoA1oRrqc4wF12ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Prkw8gt0; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Prkw8gt0"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so9298691eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718817; x=1791323617; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Wm1IURbc0+vf3diG/SgSb6OtcSfp4vt1b6dn62K85s=;
        b=Prkw8gt0jGSbkJX/l20+igHwMjkFIVSrMLDQvLPKIPE0hxV/rgqJBhwEPa1GblXgAT
         BgLsc/SiyhmWdwNZBjDi1A04cnEIGYZraq5uQTEPwRFVntz4T1guFR/W00Q1BtFZDRXj
         ERzy9Sed8N/nW468/nJHXt7v4VQNx++krOR97ei32TH3E0btBsTwWGvM41nRs5Jql00p
         hth673EOa/FqYjNEK5HGZWqc4Ar5+RP0gtSqZx/TMCmvjpZkfpGU2iYZNuNjm02nqEf2
         tMD9mXZcvWh2ypwucn3wrzG1RLV8QEkvz4b36BhiHK22T8ye0mEARtG/kOt+EXUye+6N
         CEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718817; x=1791323617;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Wm1IURbc0+vf3diG/SgSb6OtcSfp4vt1b6dn62K85s=;
        b=PlaaGRYK1CegR8yRMr/FM4Z27BYLtJh6zDHbxY1XqLZfM42NIWEJzfvJcDrTo+dAPv
         D3zygyI2suk6ldVdBXWp88nujVMvbyGqbxW53O9J8zsIWBSJpTOAgmdVY+lD0NC6b5H6
         9Y1yao+5KbhA/+JwW8Zr9nbICShRsvgsfH8ozUZHjfPUQpEbgvAYZY6gNcSSfkDaf0vN
         n64fZrwajoFAq3q3gwu4n6l1IV1bb8O3d6oO8ACAqXSJEf2pkbdOE77uSDrXXlpSXVFb
         plLEPohfokbEiCeRtRF19ZKyerw3kGoPg7Z6SVJIY0DyMYECO2xMHmTUmlYgReuIwA27
         TDCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs62ihHMERi+p6I2HobsC3o5f6s6ZOX3tVt46KnsuCOpXwczQK8U6u0mVCmXPsEO4BgxIE64hVKrod7R8=@vger.kernel.org
X-Gm-Message-State: AFuF++mKuvMoA4MybjsDYZGOHFMiSAZWH0dRQCpjinFV2IVDX7KIoyVZ
	O5BhZSLU0r0wtssPn5naLy6I0KbBdEfMQO6qcsm0A1WgH01kSGNBt0Z8MVov9FqEHkQqnX0MAbW
	+m4YDdaq5ID6ZCIiEEvO50Q==
X-Received: from dlbef6.prod.google.com ([2002:a05:7022:f46:b0:14a:9017:9767])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:ed09:b0:14c:1f57:3e86 with SMTP id a92af1059eb24-14ca066e61fmr545721c88.47.1790718816389;
 Tue, 29 Sep 2026 14:53:36 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:52:04 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-14-nilayvaish@google.com>
Subject: [PATCH 13/15] mm/page_alloc, folio: use folio_page() when freeing folios
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

Replace &folio->page with folio_page(folio, 0) in __folio_put() and
free_unref_folios().

No functional change intended.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/folio.c      |  2 +-
 mm/page_alloc.c | 18 ++++++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/mm/folio.c b/mm/folio.c
index 35e242b48870..978565add078 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -103,7 +103,7 @@ void __folio_put(struct folio *folio)
 	page_cache_release(folio);
 	folio_unqueue_deferred_split(folio);
 	mem_cgroup_uncharge(folio);
-	free_frozen_pages(&folio->page, folio_order(folio));
+	free_frozen_pages(folio_page(folio, 0), folio_order(folio));
 }
 EXPORT_SYMBOL(__folio_put);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 07e03c7c7771..2f8cd3da199d 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3006,17 +3006,18 @@ void free_unref_folios(struct folio_batch *folios)
 	/* Prepare folios for freeing */
 	for (i = 0, j = 0; i < folios->nr; i++) {
 		struct folio *folio = folios->folios[i];
+		struct page *page = folio_page(folio, 0);
 		unsigned long pfn = folio_pfn(folio);
 		unsigned int order = folio_order(folio);
 
-		if (!__free_pages_prepare(&folio->page, order, FPI_NONE))
+		if (!__free_pages_prepare(page, order, FPI_NONE))
 			continue;
 		/*
 		 * Free orders not handled on the PCP directly to the
 		 * allocator.
 		 */
 		if (!pcp_allowed_order(order)) {
-			free_one_page(folio_zone(folio), &folio->page,
+			free_one_page(folio_zone(folio), page,
 				      pfn, order, FPI_NONE);
 			continue;
 		}
@@ -3029,13 +3030,14 @@ void free_unref_folios(struct folio_batch *folios)
 
 	for (i = 0; i < folios->nr; i++) {
 		struct folio *folio = folios->folios[i];
+		struct page *page = folio_page(folio, 0);
 		struct zone *zone = folio_zone(folio);
 		unsigned long pfn = folio_pfn(folio);
 		unsigned int order = (unsigned long)folio->private;
 		int migratetype;
 
 		folio->private = NULL;
-		migratetype = get_pfnblock_migratetype(&folio->page, pfn);
+		migratetype = get_pfnblock_migratetype(page, pfn);
 
 		/* Different zone requires a different pcp lock */
 		if (zone != locked_zone ||
@@ -3051,7 +3053,7 @@ void free_unref_folios(struct folio_batch *folios)
 			 * allocator, see comment in free_frozen_pages.
 			 */
 			if (is_migrate_isolate(migratetype)) {
-				free_one_page(zone, &folio->page, pfn,
+				free_one_page(zone, page, pfn,
 					      order, FPI_NONE);
 				continue;
 			}
@@ -3062,7 +3064,7 @@ void free_unref_folios(struct folio_batch *folios)
 			 */
 			pcp = pcp_spin_trylock(zone->per_cpu_pageset);
 			if (unlikely(!pcp)) {
-				free_one_page(zone, &folio->page, pfn,
+				free_one_page(zone, page, pfn,
 					      order, FPI_NONE);
 				continue;
 			}
@@ -3076,9 +3078,9 @@ void free_unref_folios(struct folio_batch *folios)
 		if (unlikely(migratetype >= MIGRATE_PCPTYPES))
 			migratetype = MIGRATE_MOVABLE;
 
-		trace_mm_page_free_batched(&folio->page);
-		if (!free_frozen_page_commit(zone, pcp, &folio->page,
-				migratetype, order, FPI_NONE)) {
+		trace_mm_page_free_batched(page);
+		if (!free_frozen_page_commit(zone, pcp, page,
+					     migratetype, order, FPI_NONE)) {
 			pcp = NULL;
 			locked_zone = NULL;
 		}
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

