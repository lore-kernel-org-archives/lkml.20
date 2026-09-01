Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF11646D541
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788305078; cv=none; b=iFObfUKkliovtnf1RdK3Vz+3VvNaDlB3vanlNenUzeVvMyVinWPYdH4RknPHU8nAPEA17nWkgA8MRhIo9OqvHgVGsnr4TTbHm9UhHoceWnE3+d8QqGVZ3/mLgeqeu4eKP56koxItSKXoBv0ZZK+EnM1O0Nqjc6sCzWF0tXbrCJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788305078; c=relaxed/simple;
	bh=NP8ebDdt8O3z8l/Sq5Z2hu6aATnHI2jjkvuT1DrtszY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SV+rQwFaGlUY0lN1XkZb5rtPNdr+j0kjLk13z6qS+vC95mfRND0xMXAau4j+BPhewQ8+WWBtj2YK3sq6eYRJLvt3LMC6IeDS7DwSqbYxitnIVS8uMEEbgf0zNhKC+drJDv9X949FEzPPgNRLQoOekQnFptozoY+J0+9ScllBbhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXAQ3QSm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXAQ3QSm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A611F000E9;
	Tue,  1 Sep 2026 23:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788305076;
	bh=3mrvoCwf3JhHo6/B0HvRbUVwX76oJvSOJSq8DmmzItY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TXAQ3QSmW1kL0/7w7FaPW8RnsDkCuqPXbtBoqB0y2WXus7vg1zrqEl/L0Q9l4bFNl
	 ri6q7uhCpuIhvRBdIjis6rb2sE9cN1rdK//O9NnxouQgBFBkHYVcliV0NisEKwbKed
	 O6H0SpjWaCY9ptsqg0RI9Hgkpm3K0n/9OjVK7PigCLKdp0HbR3EtbEjHziSrN9wFqb
	 YahoOIrYqne51/guURoNXtmcDMcZ/7j++r1/CM3q8wHS+CU9JTsWkCrbH69xgLaWVq
	 v5TROxmYjEv9+W9pIxioG92t0dslVeEDrNNUXZ4ibzKWFR2n1zTLfcWd3SUJpMVblx
	 C25N/pdk72h3g==
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
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH v3 2/7] mm/mglru: batch update lrugen->nr_pages in inc_min_seq()
Date: Wed,  2 Sep 2026 07:24:16 +0800
Message-Id: <20260901232421.40157-3-baohua@kernel.org>
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
Reviewed-by: Lian Wang <lianux.mm@gmail.com>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 mm/vmscan.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 54bce2f608ef..27494505cecc 100644
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

