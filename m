Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439578;
	b=Phx0ku8ZJNiz047piNtDJ5Pb6TCZK+cppf7EEHxiGGARJCnZA/NfUr2tIQ6tfjnVR0+B
	 Z4YRwwz6vSymcL86e9yDlNp6zxg677ZR+5XEz5b9Nz7H5JjQC8SDYOyEJ8vWM1DRo0qK6
	 4eAngr3854VJYT+O3YSgewuVt9dRfrskSIl0v7/iHgD3t/F+4lrtYDWYcAMUNJHZdW3c1
	 35Ups+0XUxox0kKZ27OAmgJh0FB5/uPSVFsTkHEgDCVluHki3SsY++3wpSnQriPGDOOZ9
	 /lnTaWePjzUcnbhZwJGZMoZGYaYMuxn7aDzdMHdyqbBXpO4ss/WCk4ZGEjYCYqoQ+Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439578;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XP8BVGG3k/SgxxucX4Qss0oWT0tMPudgWX8MpTd7f+o=;
	b=Lbu4g6X5CDjVamaj6Dog1naVRwILoLt9F/bpQ+YZE7VO70hVEktH5ci5OWyz3ZsRjA3D
	 TsJz3h3ZY13w0CB0u0yjqaUxJ2dL2ASbrDocf4c8gGiuxSDf74l8wlxFePlVGYBKLBt0o
	 eKeEf0BALWgjKcvO9wrJp4Ejsa9WGreTwdE7okOOAZ/HfL0eurCwwWOYs88Ia7iFMGHlk
	 XsLPYtfrwZ3CmwStpWQuxWv8jz3TflCy9OEQq/QWbSrb3u6OeOSIy8go+v4y56smIMDtM
	 O+AA2zi3JvTpSFJMniNqIbIh9vFAIFapLJfgs9pRSyRBYEuafOyGC3lykRNUUK8KdLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EZxbUB/Z";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B46606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZxbUB/Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65701F00A05;
	Wed, 11 Nov 2026 23:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794439577;
	bh=XP8BVGG3k/SgxxucX4Qss0oWT0tMPudgWX8MpTd7f+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EZxbUB/Z7guwRZZ/08dAkZz0LLA30SSS8kVtBtH9dYNhkk9vo6OFA4OpKQuBqvgu9
	 ZZ5/r5dgZSqPgmVcV2Q+lXJ/NUxMWFHlyHYLNXCBaRbyQchcCFmHR9YX9wJkMzzbsu
	 8KN7bKEzSXiWbtcIOW+x0kQp6JwGQ0yRc7npIsi68uHbU7aaR6XBXoP/+yRG4DY6bK
	 hMO9FKhAI9hzwGHgsxktbCQ2WqINtAqESUm1LNfLdJxFXBidzOn3mimI1kuIj/csJ1
	 TOynbEFY9zJNPbE/yL584+dd8QVtkaonKTZARJ1LILP+K6bzwYlE0BcvGNsARa1L4Y
	 pmbk4YTy+md9Q==
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
	Barry Song <baohua@kernel.org>
Subject: [PATCH v7 01/16] mm/mglru: report evictable sizes per type
Date: Thu, 12 Nov 2026 07:25:48 +0800
Message-Id: <20261111232603.9934-2-baohua@kernel.org>
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

From: Kairui Song <kasong@tencent.com>

Change lruvec_evictable_size() to return the number of evictable
anonymous and file pages separately instead of a single total, so
that callers can weigh the two types independently.

Update lruvec_is_sizable() and get_nr_to_scan() accordingly; the
summed totals are unchanged, so there is no functional change.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 mm/vmscan.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 061fbd168d98..acc4efccda2f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4192,28 +4192,31 @@ static void set_initial_priority(struct pglist_data *pgdat, struct scan_control
 	sc->priority = clamp(priority, DEF_PRIORITY / 2, DEF_PRIORITY);
 }
 
-static unsigned long lruvec_evictable_size(struct lruvec *lruvec, int swappiness)
+static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
+				  unsigned long nr[])
 {
 	int type;
-	unsigned long seq, total = 0;
+	unsigned long seq;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	DEFINE_MAX_SEQ(lruvec);
 	DEFINE_MIN_SEQ(lruvec);
 
+	nr[LRU_GEN_ANON] = 0;
+	nr[LRU_GEN_FILE] = 0;
+
 	for_each_evictable_type(type, swappiness) {
 		for (seq = min_seq[type]; seq <= max_seq; seq++)
-			total += lruvec_gen_size(lrugen, type, seq);
+			nr[type] += lruvec_gen_size(lrugen, type, seq);
 	}
-
-	return total;
 }
 
 static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc)
 {
-	unsigned long total;
+	unsigned long total, sizes[ANON_AND_FILE];
 	int swappiness = get_swappiness(lruvec, sc);
 
-	total = lruvec_evictable_size(lruvec, swappiness);
+	lruvec_evictable_size(lruvec, swappiness, sizes);
+	total = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
 
 	/* whether the size is big enough to be helpful */
 	return total >> sc->priority;
@@ -5021,7 +5024,7 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
 static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
 			   struct mem_cgroup *memcg, int swappiness)
 {
-	unsigned long nr_to_scan, evictable;
+	unsigned long nr_to_scan, evictable, sizes[ANON_AND_FILE];
 	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
 
 	/*
@@ -5037,7 +5040,8 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
 			return 0;
 	}
 
-	evictable = lruvec_evictable_size(lruvec, swappiness);
+	lruvec_evictable_size(lruvec, swappiness, sizes);
+	evictable = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
 
 	nr_to_scan = apply_proportional_protection(memcg, sc, evictable);
 	nr_to_scan >>= sc->priority;
-- 
2.34.1

