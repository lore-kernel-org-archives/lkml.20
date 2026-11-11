Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439629;
	b=A0pHLrb+XRbfmO40C6Z7rXAyjWEb3kMZethmhmStOhsVgXibYlZ8/d25B7bhvOz8zMIk
	 J7CvwtE1Y7Ww+QZoPloW/yGNfG41r7Lyokg2rpumwHVKYjJFHV4GJ4eGEtvkau9/Y5RVq
	 +oyj68O24+PpUmLiPxml376cMDVBqUmbJlLNdAgPoF3ZTNXqWDMVq6y9B2rChY/KA1wM2
	 psbhPpzW5IHYUC5jST4+20pO7VcyiAyw2uztQOmu2Ev5mt97mIOKGYrrBDVI9/xBnLtmd
	 RI4YSA2S699KG4QXyavTzPYxkbpVp5z93GAaxH+ejewZOR/opQJHVQFWc9WXjcEzNWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439629;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HVNLYWh2WNudvby9zWzUbNqB94HeT+AKpF3CXnXYX2A=;
	b=AfAlLThVPMkAXHL2HTmMliKrz8koKoRVXVH4m6yM5ntYLB6PUTm9MrBg7tl2IucRQqH2
	 McJCHwhtwAt1UizUeM4rY0T/ZowSJofdfGTGEIcgjs5IEDPlPw4Eye2/z0AM1TT70m9rc
	 FiRQXPAlaiqVluN8oGewZDkSqRp5tk3N4aBGZKAW7d0B/82RKNh8y14JxOfa2J8bwZL31
	 ivpIz/5kkCOx/xLRvOvKELhVfcPbpaaUUyXDmlTPI2+Ko2BBjBS3gnm21VQA6fu9E7vhX
	 hpz/UO8ChARcZhjltTGN7FFz/DBVIm4QUiLjKPEQBifpiBJbrZB1jbSC0Di74+VkYZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dcZiCOXb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A6B606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dcZiCOXb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFC61F00A05;
	Wed, 11 Nov 2026 23:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794439628;
	bh=HVNLYWh2WNudvby9zWzUbNqB94HeT+AKpF3CXnXYX2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dcZiCOXbgswBvQ7UzVFoZlZiaycHb0NhXjZV/ocHEpQ3ngRdInmFasvgmGLeZKsjg
	 yxg2dO1365iNRwMiPGKntLA5BAIgEJGa7nnhTqM19oToXAMN9iMmfo+vYI8P71zEoa
	 /AjC1+fdK1C4v2aBpzW9WRziUNV4umRt3K8YRzgELDg+WF4L0Q10Y+dtKeFD7j4Bgd
	 PSr9nudyRMnDiIIJzeqAAkbj7wtMMbbJAX9yNm5DtLJoggNhadyS6OVH/fGOb/pDoe
	 pR8dtM+tjGtEkKfCbK9lsl1QIC5qSXIrm/KKvGChmcY3Ug/2s/KP9GCzvsy3X/301a
	 hs9Rijitx9hHA==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	hannes@cmpxchg.org,
	hui.zhu@linux.dev,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	liuxiang.277@bytedance.com,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	ridong.chen@linux.dev,
	rppt@kernel.org,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	surenb@google.com,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	zhuhui@kylinos.cn,
	sidchintamaneni@gmail.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [PATCH v7 11/16] mm/mglru: Run aging when one type has no populatable folios
Date: Thu, 12 Nov 2026 07:25:58 +0800
Message-Id: <20261111232603.9934-12-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261111232603.9934-1-baohua@kernel.org>
References: <20261111232603.9934-1-baohua@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We may have scan budget remaining for anon or file
but no folios in populatable generations to scan.
In this case, `scan_folios()` may waste time scanning
that type while the other type still has populatable
folios.

Run aging in this case to make more folios
populatable. This also helps respect the scan budget
distribution determined by swappiness.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index bf30c5b95478..27c1547012bf 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5104,7 +5104,8 @@ static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_control *sc,
 }
 
 static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
-			     struct scan_control *sc, int swappiness)
+			     struct scan_control *sc, int swappiness,
+			     bool no_populatable)
 {
 	DEFINE_MIN_SEQ(lruvec);
 
@@ -5116,6 +5117,13 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
 	if (sc->priority == DEF_PRIORITY)
 		return false;
 
+	/*
+	 * Run aging if scan budget remains but no folios
+	 * in populatable generations are available to scan.
+	 */
+	if (no_populatable)
+		return true;
+
 	/* better to run aging even though eviction is still possible */
 	if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS == max_seq)
 		return true;
@@ -5220,20 +5228,17 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 	lru_gen_prepare_scan(lruvec, sc, memcg, swappiness, nr);
 
 	while (nr[LRU_GEN_ANON] > 0 || nr[LRU_GEN_FILE] > 0) {
+		unsigned long orig_file, orig_anon;
 		DEFINE_MAX_SEQ(lruvec);
+		bool no_populatable;
 
 		if (mem_cgroup_below_min(sc->target_mem_cgroup, memcg)) {
 			need_rotate = true;
 			break;
 		}
 
-		if (should_run_aging(lruvec, max_seq, sc, swappiness)) {
-			trace_mm_mglru_aging(lruvec, sc, swappiness);
-			if (try_to_inc_max_seq(lruvec, max_seq, swappiness, false))
-				need_rotate = true;
-			should_age = true;
-		}
-
+		orig_anon = nr[LRU_GEN_ANON];
+		orig_file = nr[LRU_GEN_FILE];
 		if (!evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LRU_BATCH))
 			break;
 
@@ -5247,6 +5252,15 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 		if (root_reclaim(sc) && should_age)
 			break;
 
+		no_populatable = (nr[LRU_GEN_ANON] && nr[LRU_GEN_ANON] == orig_anon) ||
+				 (nr[LRU_GEN_FILE] && nr[LRU_GEN_FILE] == orig_file);
+		if (should_run_aging(lruvec, max_seq, sc, swappiness, no_populatable)) {
+			trace_mm_mglru_aging(lruvec, sc, swappiness);
+			if (try_to_inc_max_seq(lruvec, max_seq, swappiness, false))
+				need_rotate = true;
+			should_age = true;
+		}
+
 		cond_resched();
 	}
 
-- 
2.34.1

