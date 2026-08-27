Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD7E38911B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874441; cv=none; b=U+AtvQyB6fkTyILrwtcAC8jJHQmA5Ly5mXU1FutkZvpCfN2oVTpIRiEEKOweAhl6v/yOf80SJ7Na1LT/CNZRPwPiKwg6pItdfh69e4WON8CHwN4fM/yXqFTDQZhlq2qPe6CQNzMqn8nvjmd7eR1fvZ5WBdW1iT2B5joBeeKdXLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874441; c=relaxed/simple;
	bh=GkIw99uXkH9v3W0L1NC22q6jYwGKDnEXx7If3PIKqfU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Js3Uw2RQfOZ1k5ZHKAF9kFAZIBRYkPP24AxdJG9Mxu2jDN4zzg8o9cO9Yu5OqVhvXo0/C8VVQgS0UDBF2oUhWFTpcKnoUZ1jNBpknAx+AUAPmf96tLi0KeXC+JmhqZBig6Vj/HPYEXustnkkCSYj9scpyITZZnebsIHC3wiK0Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDO+VEQq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDO+VEQq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C961F000E9;
	Thu, 27 Aug 2026 23:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787874439;
	bh=2f/gBP+lL9kMBCKcIXbFZ0t49f0KGcv6ig1olyg9Fw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DDO+VEQqRCzS1cfmBrLQJ50LaIDOsEC9LaOiC2Uzo0Oe5gk2eVQTcRoMVN1zAyqqH
	 fvpVlSo2AcbAjO9Zc6Nj5hvfD/m/DjOhHfH0SiWfwDA5ruE+kOFT+j8t2fP0lE3XTL
	 ul7ftEd6ky1ssOvHyZJdvtjbHDta0Sh4YZlPvt5tVrLJDKvE0idjmq/R66KcZLuMoR
	 JU3/ZgTDPYDfBR++CSNPaGaGlM8Mk1CJQfQH236S4kYn069XhkEHc1JTsReafDxX2q
	 FWuILq5Cw9zObiqIOjwB9L4/WICG/G21Vdq7lpDxejMxmQDCeeVwq3MEOFPm1j7vrh
	 Bh+2FMPr1QPsw==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	lianux.mm@gmail.com
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
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
Subject: [PATCH v2 2/7] mm/mglru: batch update lrugen->nr_pages in inc_min_seq()
Date: Fri, 28 Aug 2026 07:46:59 +0800
Message-Id: <20260827234704.63163-3-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260827234704.63163-1-baohua@kernel.org>
References: <20260827234704.63163-1-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, folio_inc_gen() updates lrugen->nr_pages for every folio
as it advances generations. Instead, accumulate the size changes
and update lrugen->nr_pages in a batch after scanning the entire
oldest generation, or when the scan stops because remaining reaches
zero.

Since we only move folios from the oldest generation to the second
oldest generation, the active/inactive state cannot change. We can
therefore skip __lru_update_size().

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmscan.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 8f187d296b8e..07c22d51debd 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3918,6 +3918,7 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	int hist = lru_hist_from_seq(lrugen->min_seq[type]);
 	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
+	int target_gen = (old_gen + 1) % MAX_NR_GENS;
 
 	/* For file type, skip the check if swappiness is anon only */
 	if (type && (swappiness == SWAPPINESS_ANON_ONLY))
@@ -3927,35 +3928,47 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 	if (!type && !swappiness)
 		goto done;
 
+	VM_WARN_ON_ONCE(get_nr_gens(lruvec, type) != MAX_NR_GENS);
+	VM_WARN_ON_ONCE(lru_gen_is_active(lruvec, old_gen) !=
+			lru_gen_is_active(lruvec, target_gen));
 	/* prevent cold/hot inversion if the type is evictable */
 	for (zone = 0; zone < MAX_NR_ZONES; zone++) {
 		struct list_head *head = &lrugen->folios[old_gen][type][zone];
+		long delta = 0;
 
 		while (!list_empty(head)) {
 			struct folio *folio = lru_to_folio(head);
+			long nr_pages = folio_nr_pages(folio);
 			int refs = folio_lru_refs(folio);
 			bool workingset = folio_test_workingset(folio);
+			bool gen_increased;
 
 			VM_WARN_ON_ONCE_FOLIO(folio_test_unevictable(folio), folio);
 			VM_WARN_ON_ONCE_FOLIO(folio_test_active(folio), folio);
 			VM_WARN_ON_ONCE_FOLIO(folio_is_file_lru(folio) != type, folio);
 			VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) != zone, folio);
 
-			new_gen = folio_inc_gen(lruvec, folio);
+			new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);
 			list_move_tail(&folio->lru, &lrugen->folios[new_gen][type][zone]);
-
+			if (gen_increased)
+				delta += nr_pages;
 			/* don't count the workingset being lazily promoted */
 			if (refs + workingset != BIT(LRU_REFS_WIDTH) + 1) {
 				int tier = lru_tier_from_refs(refs, workingset);
-				int delta = folio_nr_pages(folio);
 
 				WRITE_ONCE(lrugen->protected[hist][type][tier],
-					   lrugen->protected[hist][type][tier] + delta);
+					   lrugen->protected[hist][type][tier] + nr_pages);
 			}
 
 			if (!--remaining)
-				return false;
+				break;
 		}
+		WRITE_ONCE(lrugen->nr_pages[old_gen][type][zone],
+			   lrugen->nr_pages[old_gen][type][zone] - delta);
+		WRITE_ONCE(lrugen->nr_pages[target_gen][type][zone],
+			   lrugen->nr_pages[target_gen][type][zone] + delta);
+		if (!remaining)
+			return false;
 	}
 done:
 	reset_ctrl_pos(lruvec, type, true);
-- 
2.34.1

