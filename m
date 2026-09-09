Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A11B4349AD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948222; cv=none; b=L09R0atabjUrMv82G1zhk4JqYANfGoZ9HJqnYG+nQpt+cWMbYCrr28EPrqy2aCOkzbuLTD8+YGzWLkrIlCkETincBHEn9TgPBBWaO88Vtq0/wOdxvVsUxneU7IsADv+mi8s35fMOW7K2u5RlbGHldi5iJSgrYYFlJHjk1UgbZ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948222; c=relaxed/simple;
	bh=haV5ijKKeNFA+cVGf0/itoGu5pSxbzf5S7kuITcT64g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=b4rHqQQm5Gq7VBycMFxFVmLWu3gctvj15Qjfn0UmGz56vh78ao9hPYqZQJm7zuS2BRP847d0L75v/K8zP3R7JNUWdWQj6V/JFawsOtlC0oDBRG3EWGweMmqlWP/XSXE8HLC9qqdgNSd2ENECga9LNdc/UUjYcW3knLB/MGQT7sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SE9CepmM; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SE9CepmM"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66d258d1effso743758d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788948217; x=1789553017; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZLYBDT0mJ+F0yYdyxDNynq3EZCGij4ebq9WOsT9s4c=;
        b=SE9CepmMPaMBUxXW9zwLm5VleuwwDDnZs5aoA/3cHA99HTqzSrYaHCkyA4mwA0PaUO
         IW56pnPa4ZrK+KgkGF/gJABWCv9tL04f3tg9ZUtLbcMKg3ecVXVPkn3uzAIM5s4jv07Z
         Vny3d6oSrB0xtGUwknVbuMY5gVK61X8YO6EMFddtk3wzY+GhS07f9q1teS1N9M7V5EHv
         Pyn65qz1PJd0JxOg2kHxsdM3ffsGUJs/pJH1br5Xd6Jaeci4tYTxdpdXl0VHPe5flF5F
         RMdUJ0CTitLvnvLhcnpKwz70fcXNQs3ZUKTZ9zUCCC8Ltp1XJ/diErqyIK+pXhI+TqCx
         Qehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948217; x=1789553017;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZLYBDT0mJ+F0yYdyxDNynq3EZCGij4ebq9WOsT9s4c=;
        b=NO45AlAvNm8izexX/bhoU+P4Vm99eDAP5Dq5l7075ceKDqrR2kTZTLMhMPY/PC+tkk
         dh8WHKsN/s84SfBUFAtOVyJuko4K3jPgdHeJQZQRWz87tOQqvUZHsBPlvGtAngyZ6IlG
         3i2qV3imnCLpSs4o0k9WevziQ/9XGgeWvtXZFLH3tv9ciSUDtyXa0JPA1CNSd28LTlwZ
         Yxfnd6j3FAlB0lwCSQM8j+R+wJEhGhuatYWQDo68/zMAZ3+J5iZrU0/UJnIyqD8z9lVD
         ut+jie976yO/2MHs4bfDoyzRavVZ1mwv2216hnX8qLdAZsauW6RpxPYSkjNHlLiXiCgn
         AAYQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5os0T4DavJO6Z6u2SaTu+27fZ+rXSghWKWQo757vAKtCwCLmwZEFcAIs5v7vp7RVDHKdESMkJ41/Y42U=@vger.kernel.org
X-Gm-Message-State: AFuF++kyhNXtqQqjvab9UKKwvktqmFS/q2YGJeIA2h5W0P0zJqxBfDJE
	PdRW/DNeD5V1x2BnXHeYhW48zfxsuwR4kuxLHAdWVoPZlmkLWiJaMj3l3WN/QmzybA==
X-Gm-Gg: AYBFou0MJP9WIQO3bs+liL3FzI+3DonjgrJWZ8NR9PaBaSTQXV7ZaBuwBpzCyvEn2XU
	2+q3tcLf5lDwxX37qof0w9AWRsgg0SdsOn6Ue8Mi9zGtOjea4Pw63zBYcmVspo+hBGXiv5RHWoJ
	2vs8SnfW6LGCvR0oDR1S4TaysoWIRD8Y7Z1FY8W2ZVpei6Zc85BSYsq+NlP7md8t1UJMfYutvjS
	VxkXCgDyUjcHLahkQlxSWusDGKSIJK1KRFGWIaMSJFaKSJONQHQF6+d0V6HhoJpo40UfF/Q9HK9
	WbdROaM0gn80pgzz/8H4O1ZZfFSJJHABDZMOF4zI3AEd8Pcs7Bq0bBXXdxs2uX0S7KkL0oV3qVh
	lUPInviw9pxli/8nkGx5v1fFMWYzFx94VinuEbXng8Q1VeOzWHAjAeYMfZV/dCM6l7X3F6reDE/
	2sE8jq7OVXODTnK/Geb4yHo+Tgo2DJ225YWf0MpSEBw5M3yf/e+J3AROeGNPcccAxp4yZWdVHbj
	wYBu/6jsHC+RJ8KIT299qsjp6lg/qiOWQjahuZ52KEisrMQ3uPxY9wF4nmDXdmAl9+S1w==
X-Received: by 2002:a05:690e:4384:b0:66f:8b35:dedd with SMTP id 956f58d0204a3-66fb58f2dd2mr7477525d50.6.1788948216887;
        Wed, 09 Sep 2026 03:03:36 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48ee9easm11934983d50.8.2026.09.09.03.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:03:35 -0700 (PDT)
Date: Wed, 9 Sep 2026 03:03:30 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
cc: Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, Alexandre Ghiti <alex@ghiti.fr>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    David Hildenbrand <david@kernel.org>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
    Leonardo Bras <leobras.c@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Marcelo Tosatti <mtosatti@redhat.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mel Gorman <mgorman@techsingularity.net>, 
    Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
    Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rik van Riel <riel@surriel.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, 
    Yang Shi <yang@os.amperecomputing.com>, Yu Zhao <yuzhao@google.com>, 
    Zach O'Keefe <zokeefe@google.com>, Zi Yan <ziy@nvidia.com>, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 11/26] mm/fbatch: remove migration's PAGE_WAS_MLOCKED
 lru_add_drain()
In-Reply-To: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Message-ID: <e13a7f3e-0629-5602-603e-af01624a2887@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

A welcome side-effect of mm/mlock.c's mod_mlock_count() succeeding on
folios on the per-cpu lru_add fbatch, is that migrate_folio_move() no
longer has to lru_add_drain() before remove_migration_ptes() restores
a PAGE_WAS_MLOCKED mlock_count: so remove PAGE_WAS_MLOCKED altogether.

(Re the "We would like to do something similar for the old page, when
unsuccessful" comment above it: that may be easier now, but involve
some rearrangement: not researched, so just leave the comment as is.)

However: it was uncommon before, for isolate_migratepages_block() to
meet a folio on LRU, with suitable refcount, marked mlocked but not yet
unevictable: so that got missed when sysctl_compact_unevictable_allowed
should not allow it. But now it's a more common case, so check if the
folio will become unevictable, by using !folio_evictable() instead.

That is more expensive than testing mlocked and unevictable bits: but
it is consistent with the decision made once the fbatch gets drained,
and is_inaccessible further down depends on the right is_unevictable.
Optimize those checks better if they show a regression in practice.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/compaction.c | 2 +-
 mm/migrate.c    | 8 +-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index 9e045a90ba21..1290b9170cb2 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1113,7 +1113,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (!folio_test_lru(folio))
 			goto isolate_fail_put;
 
-		is_unevictable = folio_test_unevictable(folio);
+		is_unevictable = !folio_evictable(folio);
 
 		/* Compaction might skip unevictable pages but CMA takes them */
 		if (!(mode & ISOLATE_UNEVICTABLE) && is_unevictable)
diff --git a/mm/migrate.c b/mm/migrate.c
index 1939d6ed19c9..364015cbef33 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1147,8 +1147,7 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
  */
 enum {
 	FOLIO_WAS_MAPPED = BIT(0),
-	FOLIO_WAS_MLOCKED = BIT(1),
-	FOLIO_OLD_STATES = FOLIO_WAS_MAPPED | FOLIO_WAS_MLOCKED,
+	FOLIO_OLD_STATES = FOLIO_WAS_MAPPED,
 };
 
 static void __migrate_folio_record(struct folio *dst,
@@ -1258,8 +1257,6 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 		folio_lock(src);
 	}
 	locked = true;
-	if (folio_test_mlocked(src))
-		old_folio_state |= FOLIO_WAS_MLOCKED;
 
 	if (folio_test_writeback(src)) {
 		/*
@@ -1410,9 +1407,6 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
 	 * isolated from the unevictable LRU: but this case is the easiest.
 	 */
 	folio_add_lru(dst);
-	if (old_folio_state & FOLIO_WAS_MLOCKED)
-		lru_add_drain();
-
 	if (old_folio_state & FOLIO_WAS_MAPPED)
 		remove_migration_ptes(src, dst, 0);
 
-- 
2.51.0

