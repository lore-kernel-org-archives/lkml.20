Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439634;
	b=1UtxNdjH5SXQC4ZpFOZ//ch4l+ri2BtkCaigw4NxtU3qwA+ClWBMD9bvjeyLr93k8eOM
	 tNfrF3q41+DW0RtsDQnwmsNJXXYWtfUK247vVmunY8/W33ATQ1MR39KVcLr3uZMFR9qiE
	 yLC2mD5vVQ4WuvqOjKzfPuoXkWmSma7YFKij2kqhCgSZzOUgusecLrpVFO5M1/ZKavfwI
	 ed7raBkihpclAv/NtNfT6PGrl6X7E0kWo9/s0oeR6g5l28q+t0IkehxUilUWoys818Qt9
	 FrJ8jCHzO1BnPsHnIK/3DFQWvIB8fBs+ic0WPmGmYLm9UQ6v7McxHU2a7HyJhmQ/h0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439634;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Fsa/3R0gWLm71S692DhPHCIO/U3uY5UaEpNYc+QUcok=;
	b=DsQ1qsjmMmbDTTcu8PX1VOl1M+Rn4g2oWsmFGJq5B64aJQIIr+F1EC4aLL0/CFBomU6i
	 0lm6y5nXCZfJSZ+VG0zQc0W71AtHGitgkBOLsFLD0rYRYDnd29dkq6WZaAM9Rmv6W6qzZ
	 WzwCXlIn7zHW9QVucwfnmxk0fftOLueujwXp38HGucuqwBcpi8Ts+0A4Jrcx+TH1AHyIe
	 2pPO/GjBtvyCMOLrLsRf0VyrkYFBaWnLUkrVfj/jIgD2Ytn6W08DGGysk1IiJD+AID3Na
	 R7+lLfYPKFOCU6EsKhLbh2JqqA6W7/PMCGvZ+57NN+tAoM3YHtOrx+rKizndrCWQIrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dwyF8D+/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BAE606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dwyF8D+/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005AC1F00A06;
	Wed, 11 Nov 2026 23:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794439633;
	bh=Fsa/3R0gWLm71S692DhPHCIO/U3uY5UaEpNYc+QUcok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dwyF8D+/LrZODYHsj7+QskkuOzeXpiO+SCzTot8yYsX0Viv/AoiXc+QqrXK9vD1xD
	 TZxy4ndtS1CW8Evw6X0g5IjYa92QfZkklXeVCDmmf1PaA2eJAzfcO657PjLh7RVD8r
	 ZRLxTJi7jjd2UiJI0pgoCVmTIMMXPvvcDVYGoMPEmu2kVaWYFAw3NPO1pETmSRxR01
	 uQxrJTTIlQY14ItIbOjB0wuMqUGRIrJbbGY42u3uggyQTkJWC3zGjJuJxY1TrOyozs
	 k2VtmhPNQarTTAVfTuzktjYeeru4aEgBs5PisBO4I2T/MuryDXWBlZzX6LzxNlA7dB
	 2AeWpyXPf8y/w==
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
Subject: [PATCH v7 12/16] mm/mglru: Restrict eviction accounting to eligible zones
Date: Thu, 12 Nov 2026 07:25:59 +0800
Message-Id: <20261111232603.9934-13-baohua@kernel.org>
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

For both lruvec_evictable_size() and lru_gen_imbalanced(),
only count eligible zones below sc->reclaim_idx. This
avoids inflating the number of scanned pages and allows
aging to proceed more promptly when eligible zones have
few folios.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/trace_vmscan.h |  4 ++--
 mm/vmscan.c       | 18 +++++++++---------
 mm/vmscan.h       |  5 +++--
 3 files changed, 14 insertions(+), 13 deletions(-)

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
index 27c1547012bf..7a48b82ea4c1 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4206,8 +4206,8 @@ static void set_initial_priority(struct pglist_data *pgdat, struct scan_control
 	sc->priority = clamp(priority, DEF_PRIORITY / 2, DEF_PRIORITY);
 }
 
-static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
-				  unsigned long nr[])
+static void lruvec_evictable_size(struct lruvec *lruvec, struct scan_control *sc,
+				  int swappiness, unsigned long nr[])
 {
 	int type;
 	unsigned long seq;
@@ -4220,7 +4220,7 @@ static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
 
 	for_each_evictable_type(type, swappiness) {
 		for (seq = min_seq[type]; seq <= max_seq; seq++)
-			nr[type] += lruvec_gen_size(lrugen, type, seq);
+			nr[type] += lruvec_gen_size(lrugen, type, seq, sc->reclaim_idx + 1);
 	}
 }
 
@@ -4229,7 +4229,7 @@ static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc)
 	unsigned long total, sizes[ANON_AND_FILE];
 	int swappiness = get_swappiness(lruvec, sc);
 
-	lruvec_evictable_size(lruvec, swappiness, sizes);
+	lruvec_evictable_size(lruvec, sc, swappiness, sizes);
 	total = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
 
 	/* whether the size is big enough to be helpful */
@@ -5083,9 +5083,9 @@ static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_control *sc,
 	for_each_evictable_type(type, swappiness) {
 		unsigned long seq;
 
-		youngest[type] = lruvec_gen_size(lrugen, type, max_seq);
+		youngest[type] = lruvec_gen_size(lrugen, type, max_seq, sc->reclaim_idx + 1);
 		for (seq = min_seq[type]; seq < max_seq; seq++)
-			old[type] += lruvec_gen_size(lrugen, type, seq);
+			old[type] += lruvec_gen_size(lrugen, type, seq, sc->reclaim_idx + 1);
 	}
 
 	/* the vast majority of pages sit in the youngest gen */
@@ -5138,7 +5138,7 @@ static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
 {
 	unsigned long total;
 
-	lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
+	lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan);
 	total = nr_to_scan[LRU_GEN_ANON] + nr_to_scan[LRU_GEN_FILE];
 
 	total = apply_proportional_protection(memcg, sc, total);
@@ -5836,7 +5836,7 @@ static int lru_gen_seq_show(struct seq_file *m, void *v)
 			char mark = full && seq < min_seq[type] ? 'x' : ' ';
 
 			seq_printf(m, " %10lu%c",
-				   lruvec_gen_size(lrugen, type, seq), mark);
+				   lruvec_gen_size(lrugen, type, seq, MAX_NR_ZONES), mark);
 		}
 
 		seq_putc(m, '\n');
@@ -5889,7 +5889,7 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
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
2.34.1

