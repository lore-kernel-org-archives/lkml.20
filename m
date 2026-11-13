Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596210;
	b=zGhzRGquJLXc/YmbkAlD3av425VSk8fsxy0R1KrT6KNkHm2UFfch14na9mrZKxPcTD5J
	 9lG32e8XUCBYddH/cqThiwF2SspRhdBt11H53qGoi1ggw859WiUEvZlS35QcfmQ5WiNfb
	 znN1e01Clr0RHOjJtJW7VuraY0vYhcUZsaHn6o2QlV+hXggx17eYZMcucI5zamTYNdGG4
	 czOJRSrvmDdoCiBkogtfTgqiLlxMUd3W5IeiCMtMfpGGSpDDXwE9bp4V2hKsPecTX5OGy
	 z04QuQIPfWkv0KgppNRTRhIB98QQ4pLGwesxCJtxzgqLN5vzA8OLjutac62iXFaFhtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596210;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8b2BNlI9D/dTvm+pNy8yi6bMbbcURwn+cQ+yjC30tMI=;
	b=HZ+plUOnNSAJujTuTOELbwo01VvFX22nvYHPb6W5mZpLArnRutOkZh8OOgxZPkhEeRqO
	 VsmaHTCCWMgcDQG9YyQZ0PHDJLAWuUaQLBk8K+AXeY0mXTBj5EiXVIeKX5cK0VN7EVUmB
	 OIFSEl5s14TPqJLezSSi7xZm3S96/c5cCQ/JkoWDaM5YKIqLMsiK7A1aDR8EdTYq3pXS0
	 CKrIzWYiTOL4sUhJUN8xVsJt8q3zzyNYeyt5UeWHWle76zT374SoXDPNS7vj10jtszvSS
	 HzwhkiB1/xH6DgLJmMMgwVnuvzmxskqikUrmjnSQkr2wyHCmSGCnUU/0tFIVFOEDo2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bXI2J06z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433C5606B353
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bXI2J06z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C55B1F000C4;
	Fri, 13 Nov 2026 18:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596209;
	bh=8b2BNlI9D/dTvm+pNy8yi6bMbbcURwn+cQ+yjC30tMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bXI2J06zqS4ZMTGM2ywcmXZMT6M5NchVfkrpb3+jmFMX0GouWWfQtvL19PqvwjRbG
	 uXyoa+cGma3kCNC6ndYJrY0oeLu9Ensr4Ya6TdLkoVSKIoAg8Uzuo2l5h7p3eO3fXp
	 O0tUN/ofRqvlsoMR3ByVCopBGWCCl8MoU/OxIAhtAuPe9ph5A5vPhbEDhuqhzebBKP
	 sLhtxxhU22vHjynQLcTIt0S/UgbOpgNIAuIC/q/JJe0rbe2SMV8TYQRSJh4sWcUNbp
	 +jtNJCGMK4Y5TLQlTTlzMNVHmq81BpoSASl9pq7xE7J+ggD4khO99VH1MB+QpgMrWO
	 e9M1HLuIaAPCg==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
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
Subject: [PATCH v8 12/16] mm/mglru: Restrict eviction accounting to eligible zones
Date: Sat, 14 Nov 2026 02:55:37 +0800
Message-Id: <20261113185541.70203-13-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261113185541.70203-1-baohua@kernel.org>
References: <20261113185541.70203-1-baohua@kernel.org>
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

For both lruvec_evictable_size() and lru_gen_imbalanced(),
only count eligible zones up to sc->reclaim_idx. This avoids
overestimating the number of pages available for scanning and
allows aging to proceed more promptly when eligible zones
contain few folios.

lru_gen_age_node() uses lruvec_is_reclaimable() to determine
whether any memcg has generations old enough to reclaim under
min_ttl. If none are reclaimable, it may trigger OOM. However,
lruvec_is_reclaimable() also uses lruvec_is_sizable() to
estimate the LRU size.

Previously, lruvec_is_sizable() counted folios across all zones.
With accounting now restricted to zones up to sc->reclaim_idx,
the estimated size may be significantly smaller, potentially
leading to premature OOM.

To avoid this, skip the sizing check when reclaim is restricted
to zones below ZONE_NORMAL. As in __alloc_pages_may_oom(),
triggering OOM for low-zone allocations is generally pointless.

Furthermore, defer the sizing check until reclaim reaches a
very low sc->priority to reduce the risk of premature OOM.

Co-developed-by: Bo Zhang <zhangbo56@xiaomi.com>
Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/trace_vmscan.h |  4 ++--
 mm/vmscan.c       | 26 ++++++++++++++++----------
 mm/vmscan.h       |  5 +++--
 3 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/mm/trace_vmscan.h b/mm/trace_vmscan.h
index 565c56428364..9dafdb5bd3ce 100644
--- a/mm/trace_vmscan.h
+++ b/mm/trace_vmscan.h
@@ -488,9 +488,9 @@ TRACE_EVENT(mm_mglru_aging,
 			unsigned long seq = max_seq - MAX_NR_GENS + 1 + i;
 
 			__entry->nr_anon[i] =
-				lruvec_gen_size(lrugen, LRU_GEN_ANON, seq);
+				lruvec_gen_size(lrugen, LRU_GEN_ANON, seq, MAX_NR_ZONES);
 			__entry->nr_file[i] =
-				lruvec_gen_size(lrugen, LRU_GEN_FILE, seq);
+				lruvec_gen_size(lrugen, LRU_GEN_FILE, seq, MAX_NR_ZONES);
 		}
 		__entry->nid = lruvec_pgdat(lruvec)->node_id;
 		__entry->priority = sc->priority;
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9071f8889b5c..6ed47089a330 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4205,8 +4205,8 @@ static void set_initial_priority(struct pglist_data *pgdat, struct scan_control
 	sc->priority = clamp(priority, DEF_PRIORITY / 2, DEF_PRIORITY);
 }
 
-static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
-				  unsigned long nr[])
+static void lruvec_evictable_size(struct lruvec *lruvec, struct scan_control *sc,
+				  int swappiness, unsigned long nr[])
 {
 	int type;
 	unsigned long seq;
@@ -4219,7 +4219,7 @@ static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
 
 	for_each_evictable_type(type, swappiness) {
 		for (seq = min_seq[type]; seq <= max_seq; seq++)
-			nr[type] += lruvec_gen_size(lrugen, type, seq);
+			nr[type] += lruvec_gen_size(lrugen, type, seq, sc->reclaim_idx + 1);
 	}
 }
 
@@ -4228,7 +4228,7 @@ static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc)
 	unsigned long total, sizes[ANON_AND_FILE];
 	int swappiness = get_swappiness(lruvec, sc);
 
-	lruvec_evictable_size(lruvec, swappiness, sizes);
+	lruvec_evictable_size(lruvec, sc, swappiness, sizes);
 	total = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
 
 	/* whether the size is big enough to be helpful */
@@ -4247,7 +4247,13 @@ static bool lruvec_is_reclaimable(struct lruvec *lruvec, struct scan_control *sc
 	if (mem_cgroup_below_min(NULL, memcg))
 		return false;
 
-	if (!lruvec_is_sizable(lruvec, sc))
+	/*
+	 * As in __alloc_pages_may_oom(), avoid triggering OOM for low-zone
+	 * allocations. Also, defer the LRU size check until reclaim reaches
+	 * a very low priority to avoid premature OOM.
+	 */
+	if (sc->priority <= 1 && sc->reclaim_idx >= ZONE_NORMAL &&
+	    !lruvec_is_sizable(lruvec, sc))
 		return false;
 
 	gen = lru_gen_from_seq(evictable_min_seq(min_seq, swappiness));
@@ -5088,9 +5094,9 @@ static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_control *sc,
 	for_each_evictable_type(type, swappiness) {
 		unsigned long seq;
 
-		youngest[type] = lruvec_gen_size(lrugen, type, max_seq);
+		youngest[type] = lruvec_gen_size(lrugen, type, max_seq, sc->reclaim_idx + 1);
 		for (seq = min_seq[type]; seq < max_seq; seq++)
-			old[type] += lruvec_gen_size(lrugen, type, seq);
+			old[type] += lruvec_gen_size(lrugen, type, seq, sc->reclaim_idx + 1);
 	}
 
 	/* the vast majority of pages sit in the youngest gen */
@@ -5143,7 +5149,7 @@ static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
 {
 	unsigned long total;
 
-	lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
+	lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan);
 	total = nr_to_scan[LRU_GEN_ANON] + nr_to_scan[LRU_GEN_FILE];
 
 	total = apply_proportional_protection(memcg, sc, total);
@@ -5854,7 +5860,7 @@ static int lru_gen_seq_show(struct seq_file *m, void *v)
 			char mark = full && seq < min_seq[type] ? 'x' : ' ';
 
 			seq_printf(m, " %10lu%c",
-				   lruvec_gen_size(lrugen, type, seq), mark);
+				   lruvec_gen_size(lrugen, type, seq, MAX_NR_ZONES), mark);
 		}
 
 		seq_putc(m, '\n');
@@ -5907,7 +5913,7 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
 		if (sc->nr_reclaimed >= nr_to_reclaim)
 			return 0;
 
-		lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
+		lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan);
 		lru_gen_balance_scan(lruvec, swappiness,
 				     nr_to_reclaim - sc->nr_reclaimed, nr_to_scan);
 
diff --git a/mm/vmscan.h b/mm/vmscan.h
index c6b583fc7493..2599d7c614ac 100644
--- a/mm/vmscan.h
+++ b/mm/vmscan.h
@@ -119,12 +119,13 @@ struct scan_control {
 #ifdef CONFIG_LRU_GEN
 /* The number of pages of @type in the generation @seq, summed over all zones */
 static inline unsigned long lruvec_gen_size(struct lru_gen_folio *lrugen,
-					    int type, unsigned long seq)
+					    int type, unsigned long seq,
+					    int max_zone)
 {
 	int gen = lru_gen_from_seq(seq);
 	unsigned long size = 0;
 
-	for (int zone = 0; zone < MAX_NR_ZONES; zone++)
+	for (int zone = 0; zone < max_zone; zone++)
 		size += max(READ_ONCE(lrugen->nr_pages[gen][type][zone]), 0L);
 
 	return size;
-- 
2.39.3 (Apple Git-146)

