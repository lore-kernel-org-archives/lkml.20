Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A83547056
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718800; cv=none; b=NilzV1/9Egh+syMwdDAa8ifdgP/bPYmI0fYfxt113x/GVJzr5fNeV9u7ev761ajQ/47yks+1KD8MxCg1TzdBK1IuKcol9LwkXOKjC2Ch1TSeFAygrGIPLfbR7E06UOVdMLQKI2OrmIOxMOjS+jgED1eIoiNz5EBJbxZNwU+0FIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718800; c=relaxed/simple;
	bh=HYCWEMm9aem03dIwi6R+qn/2woZ+wycVCJ/gJSAHAJM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WncOivRtPJqNBtEsOes8Q9D+HBRJGoXHGi0hTtD/MSMWVBx04Ks+EPVjoW8reEwpBBHiGqc1FwGAsckwcAYLtmPjiR/aEcSdoE8Gb0aww/xis2kOpBeW7Nt/PFL5qFNCgHJ7Ovss7b/ikmd8Voo92dbw+JscAjNGovXICUCZbDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jcUk07OD; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jcUk07OD"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1384427c3efso6873913c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718798; x=1791323598; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVhxO6kSow0k5UDp11Gxjfu9ww4Gzm9LclAqKVKPFJA=;
        b=jcUk07ODfezPu6Dfhinp0Oru0gz46l7QEAHvqxrJl/VXYuu/vAH4ZiOcKx6om+mlY7
         eHov8ubFlur0D4jHWc93Ppr59tJ96INSPeka7XsiCJWUi7heMGYxJWi0nju1KuMyZeiC
         b6+6ubRc7RUAWQ2h1B3s3wp6SCfYyCYAANYAcWYGkSf8eI5Pd8+VE2kVJ8485YK38oN1
         dR5m7P545j4enijBmbjUNiY+F3e3sDIv0Y76pFLJ+RJt4hZ9yG9tESEdke7m1BtfVrij
         sFxysFxWwjWWyNyM/yaWQCbuNhCxPjwh4FqZ8dZOTwXWyqtxVCFhBto9pK3pi70HzlGi
         RthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718798; x=1791323598;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVhxO6kSow0k5UDp11Gxjfu9ww4Gzm9LclAqKVKPFJA=;
        b=VXINuek7zVUC2JDkNqRZWFP4Hb6FeLUr6hbHrCAwsYqCz+q0h+09QvbpRkRRoPpgvp
         9b4QHZB0EDZ5cfCrFfub3Tzxe2/px7/UY2omFmUdjwwh3bchEW0Xcqbev1LWZlFkvhcw
         nsvC13kRz0IS4zFI0yg18tbUtJnzcX3dRLs14qR+3LhqQ6H4exOY0CXWoihfq0lkh7JQ
         YER3Q7OouzkDHrubdUCmQvQDO91UitsMu8DslhyqXl7u11GJImuBraCdQoRdzvlZVRjx
         ca7gUSlREftsSd+IKypa05cW2keJgJ3Hit2uFQtVXUsJVdEMNxdYkzHe/VaKiitmQ0+L
         u4sw==
X-Forwarded-Encrypted: i=1; AKwUvBypaTjQbzdYmTwV1oV6THcacdoTi0oxPrYfwklx1LXtq1+JfmqBnvMFvdiqvgntyTuZJiP/BpqzM/rEjd0=@vger.kernel.org
X-Gm-Message-State: AFuF++m5bSM71g47boBVurk4MANMmMKvhxYkXlASB6rzdy8yP88rP1vh
	jPF6bGRNPm7wXKAt9AIKoL0/KPCTgEW56sZicVwLySS2JKX/01Qbl2efoBhpCUPc0TaxxM8Z4zn
	aBNuGaoz0g5pSwfBtiB8dlw==
X-Received: from dlbsw2.prod.google.com ([2002:a05:7022:3a82:b0:143:8d74:244a])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4183:10b0:144:c128:4c4b with SMTP id a92af1059eb24-14c9ffac4bcmr568196c88.36.1790718797482;
 Tue, 29 Sep 2026 14:53:17 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:51:54 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-4-nilayvaish@google.com>
Subject: [PATCH 03/15] mm/huge_memory: use folio_page() in THP split paths
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

Replace direct &folio->page uses and pointer arithmetic with
folio_page() in __split_folio_to_order(), __split_frozen_folio(),
folio_split_unmapped(), __split_huge_page_to_list_to_order(),
folio_split(), and split_folio_to_list().

No functional change intended.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/huge_memory.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 31af817eeded..58fbc4d4ddb8 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3711,7 +3711,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
 	 * the flags from the original folio.
 	 */
 	for (i = new_nr_pages; i < nr_pages; i += new_nr_pages) {
-		struct page *new_head = &folio->page + i;
+		struct page *new_head = folio_page(folio, i);
 		/*
 		 * Careful: new_folio is not a "real" folio before we cleared PageTail.
 		 * Don't pass it around before clear_compound_head().
@@ -3808,7 +3808,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
 	if (new_order)
 		folio_set_order(folio, new_order);
 	else
-		ClearPageCompound(&folio->page);
+		ClearPageCompound(folio_page(folio, 0));
 }
 
 /**
@@ -3898,7 +3898,7 @@ static int __split_frozen_folio(struct folio *folio, int new_order,
 		}
 
 		folio_split_memcg_refs(folio, old_order, split_order);
-		split_page_owner(&folio->page, old_order, split_order);
+		split_page_owner(folio_page(folio, 0), old_order, split_order);
 		pgalloc_tag_split(folio, old_order, split_order);
 		__split_folio_to_order(folio, old_order, split_order);
 
@@ -4394,7 +4394,7 @@ int folio_split_unmapped(struct folio *folio, unsigned int new_order)
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_anon(folio), folio);
 
-	return __folio_freeze_split_anon(folio, new_order, &folio->page,
+	return __folio_freeze_split_anon(folio, new_order, folio_page(folio, 0),
 					 false, NULL, SPLIT_TYPE_UNIFORM);
 }
 
@@ -4450,7 +4450,7 @@ int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list
 {
 	struct folio *folio = page_folio(page);
 
-	return __folio_split(folio, new_order, &folio->page, page, list,
+	return __folio_split(folio, new_order, folio_page(folio, 0), page, list,
 			     SPLIT_TYPE_UNIFORM);
 }
 
@@ -4481,8 +4481,8 @@ int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list
 int folio_split(struct folio *folio, unsigned int new_order,
 		struct page *split_at, struct list_head *list)
 {
-	return __folio_split(folio, new_order, split_at, &folio->page, list,
-			     SPLIT_TYPE_NON_UNIFORM);
+	return __folio_split(folio, new_order, split_at, folio_page(folio, 0),
+			     list, SPLIT_TYPE_NON_UNIFORM);
 }
 
 /**
@@ -4514,7 +4514,7 @@ unsigned int min_order_for_split(struct folio *folio)
 
 int split_folio_to_list(struct folio *folio, struct list_head *list)
 {
-	return split_huge_page_to_list_to_order(&folio->page, list, 0);
+	return split_huge_page_to_list_to_order(folio_page(folio, 0), list, 0);
 }
 
 /*
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

