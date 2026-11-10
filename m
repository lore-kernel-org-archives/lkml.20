Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342092;
	b=AyvWAMBBVrdE2RQ2QgU79P52AexhEOTNbaCfQ1RmkD0knXo5F+vF0eydIZC71VDvzFug
	 74K7OqTk25B1uR3LA52N0e8e2gzhgiqHbuhDQEz8rn6l0bKD6heU0pj7xbmXdI9/efEnY
	 Htj4Yzsns08p8EwYgBxgjhfTM79jeKh5c7WEPzDHerQcr3DmEOQNsPItRlv7I5qoMrwfH
	 59qIOOcVVPsq85lj8rqg7hf1bHQA0qh3vaPEhxfoAwOgdrS7Dl5HopMrhAJIIAV4hoIa8
	 EpYej0Nt9r9IcBdireax9dXZ/SxHnHdEPMncVfqxDLpIzEoalTRjmAsgqV+4N4fJ+2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342092;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=DkWfkzdkG8JnZPnLVaaxVwnhsNZ1KUyME4j3NgArqy4=;
	b=Z8WyKi3tYdnLeTaUeunv81uUJ+02psCwJ/vFgr5d+HS87U8H2Klt1wUW4VRHTurEUdkN
	 YatEX10+Vl4RI9WkoEuEITkc6ijj4/sFAYCwkVxGEjNj4wSYN53MJ5cmp1av+lY4v7YmF
	 Rtu95ZiiKfPg3cpcfDInSat1sB4KTdCITYWInaijhOwkaMx9IaDuC56qgWAorJrkQZwgo
	 mBavrRUquPHjVqCCSZzcz/0ig+qXiszODva9koDwjYnZPI/mWX+sP66eOZ3JncRSlszg4
	 rmRxDFHPjxIYPOScTpsGEw3TF9Nw//joMr1+f33QyUSEGKQjPBjDv3UB/bEqpgTH8DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MW3DPdZP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3705360A5BC4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MW3DPdZP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD6E1F0089F;
	Tue, 10 Nov 2026 20:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794342092;
	bh=DkWfkzdkG8JnZPnLVaaxVwnhsNZ1KUyME4j3NgArqy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MW3DPdZPavU+zKRqSawyhYFMiSgqkT05HfqhIhc/hG2TTRXLTF/D6CRbrp4k5Goln
	 dYyRAKxC5Dw+3r/FEDrqVZtoosqwMSrklxq5V4APE6lpQW+lgNsd2QPr3wpgRYSiW+
	 8qZIaQXjYazDMIRZ7/h5JIhvbH9rO6IhWT86Ft+A118dpP11bzod9Pm4ZkU40Eo/sc
	 Yu20a0HSfGxA9FJGUojR7u5VjQml7vg4fUHNrEtQP6cFXrpXbX5wvptGLGidcatdrz
	 /YJRfpUMnBnTZpIM3KdhOPIAWFbKf0imBZVxr/mf6AwiI/ZdDQuoJdVYMKNS8rQPRe
	 IK5j/F42nUO5A==
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
Subject: [PATCH v6 11/15] mm/mglru: Restrict eviction accounting to eligible zones
Date: Wed, 11 Nov 2026 04:20:21 +0800
Message-Id: <20261110202025.25736-12-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261110202025.25736-1-baohua@kernel.org>
References: <20261110202025.25736-1-baohua@kernel.org>
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
 mm/trace_vmscan.h | 4 ++--
 mm/vmscan.c       | 8 ++++----
 mm/vmscan.h       | 5 +++--
 3 files changed, 9 insertions(+), 8 deletions(-)

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
index 8014a90e4bc2..bfc9789a999a 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4220,7 +4220,7 @@ static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
 
 	for_each_evictable_type(type, swappiness) {
 		for (seq = min_seq[type]; seq <= max_seq; seq++)
-			nr[type] += lruvec_gen_size(lrugen, type, seq);
+			nr[type] += lruvec_gen_size(lrugen, type, seq, sc->reclaim_idx + 1);
 	}
 }
 
@@ -5080,9 +5080,9 @@ static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_control *sc,
 	for_each_evictable_type(type, swappiness) {
 		unsigned long seq;
 
-		youngest[type] = lruvec_gen_size(lrugen, type, max_seq);
+		youngest[type] = lruvec_gen_size(lrugen, type, max_seq, sc->reclaim_idx + 1);
 		for (seq = min_seq[type]; seq < max_seq; seq++)
-			old[type] += lruvec_gen_size(lrugen, type, seq);
+			old[type] += lruvec_gen_size(lrugen, type, seq, sc->reclaim_idx + 1);
 	}
 
 	/* the vast majority of pages sit in the youngest gen */
@@ -5826,7 +5826,7 @@ static int lru_gen_seq_show(struct seq_file *m, void *v)
 			char mark = full && seq < min_seq[type] ? 'x' : ' ';
 
 			seq_printf(m, " %10lu%c",
-				   lruvec_gen_size(lrugen, type, seq), mark);
+				   lruvec_gen_size(lrugen, type, seq, MAX_NR_ZONES), mark);
 		}
 
 		seq_putc(m, '\n');
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

