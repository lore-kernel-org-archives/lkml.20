Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706538;
	b=oIf/PiishZhf7nbauP65ncVqjEH/U0nUxzMiieiMDd06VAQeTuD4Bg8UXdKKjKRJxuYm
	 wOpOpuHa4VRZC9Q3UZRu+/qFsgkXomkxcqGP8WSFhn35A0GoQkxSLIhBd6HolZ//MMHQ7
	 rT47bQ0oqOP4VF9TmKOeTf5kfP8uSH39o7shgH9AyWZVUssXWfIElZL+lPClVYxMapTXk
	 SVb0MSJjJbjCcoiRuMENWorkYHaRc11alJVdUN5KCCTZh7Nk3YfsuL73te9dgTWjAhhZM
	 i+WwGetzu0K5cdoa2/s/fWm77S7gQWJUXoYB9uEypVczCPOLG07kobUwAl0YvQZFBUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706538;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=63mK610jdToNP0YQ3Ph5BKb/f3otJucBqFL+kmib1dA=;
	b=sygr/sz+JsGkrgKx3ThlMCfSUxWmDcNf569s9kkYiVnrvT6PBKEHaW84oi1YiZ9x53iU
	 9UTPrVzQyQoX0S1ep89o60nRzHeuO09KqNSWh/vtVm+mgYW+8RqfNJU03JG2Wjsj3+X7d
	 HaylzeMGoa2CYXO7PnWzkfWB2/hcOoIAt6y1k21nSqpjcFB+Z2mbTTSGxBSlq7RqEk7hN
	 p/H8js/TmWlMjWpXi+00UC26ah6Ol4Ane5Q9gbwdugATD2QYJRCV2cflBlrrlC/EVTbSz
	 3FC3z6VRHKftR1v2kIlDVJTjQdJK3ixkV//IV71F3hfko9tcBOPQqqCNgGi99P1+tGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VsKE+RV9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF96606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VsKE+RV9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158011F01828;
	Thu, 22 Oct 2026 22:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706537;
	bh=63mK610jdToNP0YQ3Ph5BKb/f3otJucBqFL+kmib1dA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VsKE+RV9ZiFeOrwZDoTiUuwHB9vpcwRc4MSSz8a7z5neSmnRROEqC8EjB3KAUEHbU
	 MFp/cNhWnW9ptktSNH4FF3LqxBovkVC3ekNfCkRxhj/WbiH06RUhaiUPjY5fE9ohku
	 eEG2q56loqTFA2if8MKVcDXJIqHV+CXjILILaj370EAV7fWZqcykJ0VpfX3CvOM3J3
	 SPCvz9OLlv8FTMtxHWXdyhUOwRu3Y2WBXiL+JKVegV3UqvGOv+ZgVabTiGXnPDvkEc
	 YLDhOgkx9c3YlWfoUP/CeyzP0QHv8Z8VXZ85VVUfOJdProkIUKWg45o5FflkxTEyQl
	 dtVjWMF2in8ig==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: hui.zhu@linux.dev,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	weixugc@google.com,
	yuanchu@google.com,
	zhuhui@kylinos.cn,
	baoquan.he@linux.dev,
	liuxiang.277@bytedance.com,
	wangzicheng@honor.com,
	lianux.mm@gmail.com,
	kasong@tencent.com,
	liam@infradead.org,
	surenb@google.com,
	mhocko@suse.com,
	rppt@kernel.org,
	zhangbo56@xiaomi.com,
	lyugaofei@xiaomi.com,
	ridong.chen@linux.dev,
	kunwu.chan@gmail.com
Subject: [RFC PATCH v5 01/14] mm/mglru: report evictable sizes per type
Date: Fri, 23 Oct 2026 06:01:50 +0800
Message-Id: <20261022220203.91911-2-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261022220203.91911-1-baohua@kernel.org>
References: <20261022220203.91911-1-baohua@kernel.org>
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

From: Kairui Song <kasong@tencent.com>

Change lruvec_evictable_size() to return the number of evictable
anonymous and file pages separately instead of a single total, so
that callers can weigh the two types independently.

Update lruvec_is_sizable() and get_nr_to_scan() accordingly; the
summed totals are unchanged, so there is no functional change.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index fc823fe3bd1f..3be0d6c04a82 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4332,32 +4332,35 @@ static void set_initial_priority(struct pglist_data *pgdat, struct scan_control
 	sc->priority = clamp(priority, DEF_PRIORITY / 2, DEF_PRIORITY);
 }
 
-static unsigned long lruvec_evictable_size(struct lruvec *lruvec, int swappiness)
+static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
+				  unsigned long nr[])
 {
 	int gen, type, zone;
-	unsigned long seq, total = 0;
+	unsigned long seq;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	DEFINE_MAX_SEQ(lruvec);
 	DEFINE_MIN_SEQ(lruvec);
 
+	nr[LRU_GEN_ANON] = 0;
+	nr[LRU_GEN_FILE] = 0;
+
 	for_each_evictable_type(type, swappiness) {
 		for (seq = min_seq[type]; seq <= max_seq; seq++) {
 			gen = lru_gen_from_seq(seq);
 			for (zone = 0; zone < MAX_NR_ZONES; zone++)
-				total += max(READ_ONCE(lrugen->nr_pages[gen][type][zone]), 0L);
+				nr[type] += max(READ_ONCE(lrugen->nr_pages[gen][type][zone]), 0L);
 		}
 	}
-
-	return total;
 }
 
 static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc)
 {
-	unsigned long total;
+	unsigned long total, sizes[ANON_AND_FILE];
 	int swappiness = get_swappiness(lruvec, sc);
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
 
-	total = lruvec_evictable_size(lruvec, swappiness);
+	lruvec_evictable_size(lruvec, swappiness, sizes);
+	total = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
 
 	/* whether the size is big enough to be helpful */
 	return mem_cgroup_online(memcg) ? (total >> sc->priority) : total;
@@ -5181,7 +5184,7 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
 static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
 			   struct mem_cgroup *memcg, int swappiness)
 {
-	unsigned long nr_to_scan, evictable;
+	unsigned long nr_to_scan, evictable, sizes[ANON_AND_FILE];
 	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
 
 	/*
@@ -5197,7 +5200,8 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
 			return 0;
 	}
 
-	evictable = lruvec_evictable_size(lruvec, swappiness);
+	lruvec_evictable_size(lruvec, swappiness, sizes);
+	evictable = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
 
 	/* try to scrape all its memory if this memcg was deleted */
 	if (!mem_cgroup_online(memcg))
-- 
2.34.1

