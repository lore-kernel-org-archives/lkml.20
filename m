Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F4F46AA68
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788305094; cv=none; b=duP2j3YIrUtnS1erRsC5+do1JIYMkBqQOFHDmyP7B4MDx/2kWsg6CauH6qNn0f4eDc2PDXSKVcevI514LkA20Qww8dvEQJoMxbdUSOdYeGMeYcQ3Js+sU7rlxnJZjTtHI7vzyZ+gA9feRlkoq7jP5mxpJdmWh+83jNRCPFpWaAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788305094; c=relaxed/simple;
	bh=eudb/UeG4VBqSbJ/WswZzZvM69bQ+YvvRyHz19z5I8M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cOSF5WBRhVZBCVKclbvncLOUo/wuk/dSRu3RV8z4u9vZrKxIsrhs0caxWaGwN/0V/aevzKQVWQ3LKOVuZktx7R7rqoys5qyKxZpY0v6vhlc8j+64PRDRqtAhK3XkjhWpEJFhvNmBbbL2+NL09TK/NQ/X9rm0pPbXxhRFTAlEt10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvGWg+Kr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvGWg+Kr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF101F00A3A;
	Tue,  1 Sep 2026 23:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788305093;
	bh=rFw5zgkGnAPMxb67e0R/o6CVVTXZaTWLLe5xe6qm9Ko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VvGWg+Kr1z5qUex3V5KxKtgW0/4PU1vYOVO5+DIRjj24ddVqGhl+RYfdUxxHg+cqG
	 EApYK3aeTVVouHEmKSMSC0eWou5bakMYTzeWh+g0ef6Z8ugDcA0mjzvy1iYtQ3T+Pl
	 uot1sQMFB01SqK3M5lURJJ/hRhJdKGvsFhcc7rsRDeACQMgz2mCwOwbEFX1L7C7zv0
	 zBSICyyYlu9rcCLwYr40KPXuKB7YNW34TqGG1XPVqOWav2lIe6vNck5ZEEorrTrAYr
	 XPFnyvdwp/cXodcjxVG4G1pZFIkkLOEBICc+UaRVEAopyOZFFm7LbyLjAqGhGa929s
	 11w/MTT2VlsZA==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v3 6/7] mm/mglru: move folios from oldest gen to second-oldest gen from head to tail
Date: Wed,  2 Sep 2026 07:24:20 +0800
Message-Id: <20260901232421.40157-7-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260901232421.40157-1-baohua@kernel.org>
References: <20260901232421.40157-1-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For reclamation, it makes sense to reclaim folios from tail to
head, as folios near the head are relatively hot. However, when
moving folios from the oldest generation to the second-oldest
generation, using the tail-to-head order would effectively cause
a cold/hot inversion.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Baoquan He <baoquan.he@linux.dev>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Reviewed-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/vmscan.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 1907a946840d..76dfa9575852 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -192,11 +192,27 @@ static inline void prefetchw_prev_lru_folio(struct folio *folio,
 		prefetchw(&prev->flags);
 	}
 }
+
+static inline void prefetchw_next_lru_folio(struct folio *folio,
+		struct list_head *base)
+{
+	if (folio->lru.next != base) {
+		struct folio *next;
+
+		next = list_entry(folio->lru.next, struct folio, lru);
+		prefetchw(&next->flags);
+	}
+}
 #else
 static inline void prefetchw_prev_lru_folio(struct folio *folio,
 		struct list_head *base)
 {
 }
+
+static inline void prefetchw_next_lru_folio(struct folio *folio,
+		struct list_head *base)
+{
+}
 #endif
 
 /*
@@ -3938,10 +3954,11 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 	/* prevent cold/hot inversion if the type is evictable */
 	for (zone = 0; zone < MAX_NR_ZONES; zone++) {
 		struct list_head *head = &lrugen->folios[old_gen][type][zone];
+		struct list_head *pos = head->next;
 		long delta = 0;
 
-		while (!list_empty(head)) {
-			struct folio *folio = lru_to_folio(head);
+		while (pos != head) {
+			struct folio *folio = list_entry(pos, struct folio, lru);
 			long nr_pages = folio_nr_pages(folio);
 			int refs = folio_lru_refs(folio);
 			bool workingset = folio_test_workingset(folio);
@@ -3952,6 +3969,8 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 			VM_WARN_ON_ONCE_FOLIO(folio_is_file_lru(folio) != type, folio);
 			VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) != zone, folio);
 
+			prefetchw_next_lru_folio(folio, head);
+			pos = pos->next;
 			new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);
 			/*
 			 * If gen_increased is false, this is a promotion. Put folios
-- 
2.34.1

