Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0805437F8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791929787; cv=none; b=AW0UcY0dg6uIoa9r2N9NSbvR3p5ZwQNiLtZSIuME1Hn0KqrpTSMmCH64thTUUVA8xLoeN3uBOhrgqAxohwSwIsiystGc7BwhrhlhHxpQKY2X7Mke06arAIaNrkfPWj96xvhQUCn8ZM0VLsg4MFXqeVJZdKEM/usZQUEiPYP1cnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791929787; c=relaxed/simple;
	bh=5DPoXMaIZMqDtOE9aDUauEZ4Vpamu/4hm+r9RBO+TY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ok/lJgpBME5rn/9Rflnzfj2raiP52xQGcda0MuUT2EKxRkG+zKwRV90PxajY9809EPCMbW8EJv+1RyHsDmjsYnKiMz8l1pbWEOebMitUEVD2SUJ+PkrtjrJkdeqQqACzRwsz3QYPAeGjFZqVZkRKasdnVGOit/N/ZxDZHF5xCWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMkBt0an; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMkBt0an"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8198a3a54d7so5630023a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791929783; x=1792534583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o97kVTy3EqqqEFC/OlUKtIoJa3oUrpqSp2F7+qoZqxc=;
        b=rMkBt0anioSn19podBLiukwe5nW5q4HNbLjbKsrPm+aTERBVEtIT8Fb3iEAlSmvvyf
         lJf13YOkmkOdRTx/51uUAT3g2DrC3vDkG8SRf78rNDgeff1a4HFxNB/sIWE0x3sRlxwd
         uinOl3eyXnqxxvn0ilE1QJm3Kl4gPoAdkJfvJpO8jG0XNjvkWDD4zSciL1EOKNVzpY2p
         nlf5tO2K3osDdt0VLqAbNIfiK1+SsULzRHh9MLwG0yGCYQW9UzX772y8mIf4+stNflbt
         BTE2bERXQVLQm3/PQJPFt4gE13lSPqiOIGL1aFzRZMveS4cEXMpeA+c6n+FnNtvur6DH
         IK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791929783; x=1792534583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o97kVTy3EqqqEFC/OlUKtIoJa3oUrpqSp2F7+qoZqxc=;
        b=ERpNX0qAkE7qPXwvHZ16n0ZcwdJDHfpbBBx+lV8uxrnWO13Dgfs43zQZbS7BQro2U2
         vjyyKm2jB6ff1kbzK/o+R+JKtd1/SqiyYibnAjLS/Gx4CimJbjEVpKJQmDZfWNo0rU7b
         ZuioBuKTLzoaYPcaU2xNN0o2t4xhi13FQZXuGQlFv7U1WuHe82e7+0roI5rvPKBxcfbW
         XfdvjUWJgQX8WhulEScYoLtCy2K3L3yVZRp4dehLrfC1YIDGGSZ2Y7dobXmQwgrI9Cys
         TUO8FvDGe5Ue9HA709wkGvxGz7uargWlnWDmLsEXEvTDnRGFsTmhb4iqEm5GuYs5zmvV
         4fgQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4KckUWuLmjmLgZ1ugkZBsY/Q0Kmw3eNr0PdxZOOYTsxupvAJm1lzCWewREZ6cgksQfy4TT7mq/yfyZYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB1/I7BnQ/IuwOx4z6J6c4OcNyuvlqDE34YRq63AcKxKTPJdOi
	LBpClQUypt7I3cXR1DMZUms+hOUSn3sHi6XPA/RrfNxq9/MvfJSjAB7H
X-Gm-Gg: AYBFou3U9mzCgbtEYPcSe4xw72bAMyvNkSc41HX8IQFK1QtjbccU3L+5UHB+7qlGbtK
	NN65E7K6w+rirdjbNzrj3h8c5wK6mU1f/3+M3kRyninaCj8jJRFZU+xVPigmNVsRjVmcsx45GwT
	WHdQVf5RlW9VJZHtM8w+Ajlp6AZDQdrx6n5AQvCpaWkPvN4AwYnZra3JjXZTJPbnEeaU0bi/S2/
	m1Gs5zIZgVmC37Za1t6j+It6bwAtvSE0fQZ/d2+xXGX/LuD9xBEV8mD2l2YzmOidjXrXFtzq/RA
	2Zrq6RJau4t+XljAgm6fK4Kot1QVlNIJg2nDJxzcdANn73Ixj3XIWyYVK62wz58j7G7nH+Z9CAM
	CPyMtwgDh/0cOfnszTdIvToWSYOQDiYL4R3zqDAsR5DCXCOTgrxnwnT6Hd89Im7ovay+qcLchU+
	SBt6mztNu7ZORKRuf9pW6q6VFWJ66ZBOPpvLKqKGsWR2iQllguX7v4GZPRKYFrOLpOXJaQ5Biif
	k8H8Oy7fd8ghcsMOvaYNlOWCWqlk2IjSeB39Hh7p//ugt3pJrI=
X-Received: by 2002:a05:6830:3366:b0:81e:375d:3963 with SMTP id 46e09a7af769-83028c5912cmr8564561a34.18.1791929782683;
        Tue, 13 Oct 2026 15:16:22 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:71::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13759270a34.11.2026.10.13.15.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 15:16:21 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Barry Song <baohua@kernel.org>,
	Usama Arif <usama.arif@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	Hugh Dickins <hughd@google.com>
Subject: [PATCH v1] mm: unqueue deferred split folios outside the lruvec lock
Date: Tue, 13 Oct 2026 15:13:07 -0700
Message-ID: <20261013221307.850803-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() call
folio_unqueue_deferred_split() on folios where the refcount has dropped
to zero. In these paths, folio_unqueue_deferred_split() is called with
the lruvec lock often held (move_folios_to_lru() always holds it and
folio_batch_move_lru()/folios_put_refs() usually hold it for every folio
in the batch except the first). However, it's not needed to hold the
lruvec lock.

The lruvec lock protects folio->lru and the reclaim LRU lists whereas
the deferred split queue lives on folio->_deferred_list in
deferred_split_lru. The deferred_split_lru is a list_lru with its own
per-memcg per-node lock.

There are already other existing callers that call
folio_unqueue_deferred_split() without holding the lruvec lock (eg
__folio_put(), shrink_folio_list(), __folio_migrate_mapping(), ...).

Add folio_batch_unqueue_deferred_split() and use it in
move_folios_to_lru(), folio_batch_move_lru(), and folios_put_refs() to
unqueue each batch of zero-refcount folios from the deferred split list
after the lruvec lock is released and before
mem_cgroup_uncharge_folios(). This helps shorten the lruvec lock's
critical sections, which run with IRQs disabled and are highly
contended.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 mm/folio.c    | 24 +++++++++++++++++++-----
 mm/internal.h |  1 +
 mm/vmscan.c   |  3 ++-
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/mm/folio.c b/mm/folio.c
index 35e242b48870..85144078e635 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -109,6 +109,19 @@ EXPORT_SYMBOL(__folio_put);
 
 typedef void (*move_fn_t)(struct lruvec *lruvec, struct folio *folio);
 
+/*
+ * Unqueue a batch of folios from the deferred split queue. This must be
+ * called after the folios' refcounts have dropped to zero and before they
+ * are uncharged (see comment above __folio_unqueue_deferred_split() for why).
+ */
+void folio_batch_unqueue_deferred_split(struct folio_batch *fbatch)
+{
+	unsigned int i;
+
+	for (i = 0; i < folio_batch_count(fbatch); i++)
+		folio_unqueue_deferred_split(fbatch->folios[i]);
+}
+
 static void lru_add(struct lruvec *lruvec, struct folio *folio)
 {
 	int was_unevictable = folio_test_clear_unevictable(folio);
@@ -177,14 +190,10 @@ static void folio_batch_move_lru(struct folio_batch *fbatch, move_fn_t move_fn)
 		 *
 		 * We're bypassing normal cleanup. Clear flags that are not
 		 * applicable to dead folios.
-		 *
-		 * Since the folio may be part of a huge page, unqueue from
-		 * deferred split list to avoid a dangling list entry.
 		 */
 		if (is_lru_add && folio_ref_freeze(folio, 1)) {
 			__folio_clear_active(folio);
 			__folio_clear_unevictable(folio);
-			folio_unqueue_deferred_split(folio);
 			fbatch->folios[i] = NULL;
 			folio_batch_add(&free_fbatch, folio);
 			continue;
@@ -201,6 +210,11 @@ static void folio_batch_move_lru(struct folio_batch *fbatch, move_fn_t move_fn)
 
 	/* Cleanup filtered dead folios. */
 	if (is_lru_add) {
+		/*
+		 * Since the folios may be part of a huge page, unqueue them
+		 * from the deferred split list to avoid a dangling list entry.
+		 */
+		folio_batch_unqueue_deferred_split(&free_fbatch);
 		mem_cgroup_uncharge_folios(&free_fbatch);
 		free_unref_folios(&free_fbatch);
 	}
@@ -1020,7 +1034,6 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
 			free_huge_folio(folio);
 			continue;
 		}
-		folio_unqueue_deferred_split(folio);
 		__page_cache_release(folio, &lruvec, &flags);
 
 		if (j != i)
@@ -1035,6 +1048,7 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
 	}
 
 	folios->nr = j;
+	folio_batch_unqueue_deferred_split(folios);
 	mem_cgroup_uncharge_folios(folios);
 	free_unref_folios(folios);
 }
diff --git a/mm/internal.h b/mm/internal.h
index 0ca863f2639a..ac72577a6e3e 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -760,6 +760,7 @@ static inline bool folio_unqueue_deferred_split(struct folio *folio)
 
 	return __folio_unqueue_deferred_split(folio);
 }
+void folio_batch_unqueue_deferred_split(struct folio_batch *fbatch);
 
 static inline struct folio *page_rmappable_folio(struct page *page)
 {
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 29b31446fc11..94859a830fb0 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2007,9 +2007,9 @@ static unsigned int move_folios_to_lru(struct list_head *list, bool do_rotate)
 		if (unlikely(folio_put_testzero(folio))) {
 			__folio_clear_lru_flags(folio);
 
-			folio_unqueue_deferred_split(folio);
 			if (folio_batch_add(&free_folios, folio) == 0) {
 				lruvec_unlock_irq(lruvec);
+				folio_batch_unqueue_deferred_split(&free_folios);
 				mem_cgroup_uncharge_folios(&free_folios);
 				free_unref_folios(&free_folios);
 				lruvec = NULL;
@@ -2041,6 +2041,7 @@ static unsigned int move_folios_to_lru(struct list_head *list, bool do_rotate)
 		lruvec_unlock_irq(lruvec);
 
 	if (free_folios.nr) {
+		folio_batch_unqueue_deferred_split(&free_folios);
 		mem_cgroup_uncharge_folios(&free_folios);
 		free_unref_folios(&free_folios);
 	}
-- 
2.52.0

