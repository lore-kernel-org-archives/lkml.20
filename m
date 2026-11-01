Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793549076;
	b=sR0LSNoWXqzO0VH9YG9YhwojFQJ1n6MAILRSaqWFhshaXreg8TNj8jO92DT4K9oxnyzX
	 opEN+aiyrqPAnKxbVQunYObhV13rX585W8ImI3onkcHQm151OQxvK58/CBAW7lg86glI6
	 HQ5eh9FdTTdj04Vq82cFvL7Bd4ukg2icNEvyHRG3ahmo/TB5G+dSWm7QdhFJjisOinYbk
	 1fqtwPmBzLol51VLEDoIt1uqg1aPP8hC7ttsl4+Rh9bZfnvtdoNcqjtKKL18nbK2U641p
	 2ntHze/MPlCoBicl5D/69QrNEPd6i8Ai+Wk+9qrICx9wtGKH0+uwIIe8+qnSmODnxyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=59AkfJZqg17nYrV8HOTYJbLmwWBLcbXj8cjORtW0eeM=;
	b=q1EvgJesB65j5m6sNZ2HfsB7WqgRaajmU7dKaTKR1DYSBlcH2zETruHdjm52yQacf1S+
	 4g+BUnu40HIk7WWxfJC33Pn109wE/5kd85Ef1NYgK4c+TmfHpFhEaYqSJ5qw+7OsHYTpR
	 3bEuoClew+3g1EHcO2C41rq9LQ2yd7cJ4UuKTeZBKCRTFWdU1OKYEHPrT/DgNG946hJc8
	 t2S/IknuO+Vp1TurC/wkEdoKCGsDgmME9FydUiqs1H4oTXDNYTG61sN3/I8yJenjTFUEV
	 MeNnNhaflOsqC2bXyiRnDQQf/J8Y2rAE/7LtOxzNaNy0+FzIwUsyCGjRqzO9vkuOEYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TTv8Os7l;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F7E606A32E
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67F7E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TTv8Os7l
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e8c710847so299800866b.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793549075; x=1794153875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59AkfJZqg17nYrV8HOTYJbLmwWBLcbXj8cjORtW0eeM=;
        b=TTv8Os7ldFh7Y5JmEgNpMAKyPAQsRraDfKgYZvwtpHXTU0h/NCuKe2ceeOu8lLjPRC
         ISFfhKX99h64nrrRAaMfL6p2GkoxVcZWjs8xi4mq6azM4plasH67yAUlTIT+2iVyQMaf
         1cYUB9AbKHp0R+ehxJnnB+GjiplcaRc8UrliidPIR4xLfZsZU95lx0b6Aklj/4KZYah9
         Hl5LWE1guLESJAn6KeE2dwgrir07ddFcemHwpQShsY5QwZ294Yz8orN4UQun/Ih2hQPB
         Q8d/mPlCqO3RU3vcCr7qUOI9h5k+V0Galw4T3FyX1tTfLhxmd8viBfC2L1+hYbRvWFKL
         7WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793549075; x=1794153875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=59AkfJZqg17nYrV8HOTYJbLmwWBLcbXj8cjORtW0eeM=;
        b=WPmi32EQ6NICtlsTTE0QNqn/muviUw1+GvACthZVOJTdSgSpuG81WLhijDdChAnaoN
         aMX8uRYEI0Sddqd9gEOp1YTN7jLn61UtK1aluzOW9uuMZv+R2eMbb8uDf0G18dwSx/CY
         ZB5FzgXuOS7m2nZOV2If9AjJeWpM7Ex2I0YkZf8JIkmIhGL8kzyY0P2u+iKoh10GWqaC
         kmPy1CqRWjH2XLxPTN6anvuLYbXVdm9cxcpeV36A7NYBPIXBkw0VDj4aaefl0RvkvYa/
         Tk2GR6/4wb+bmhaNIr33OBWRoNFGGQCbOVGgj8EE2l2fTBvSrVYzfxFK8ZZmUcZqqTSg
         UNHw==
X-Forwarded-Encrypted: i=1; AKwUvBxVWGqPyeaiT1M9cETdQkBwQibjA9Ewg+Ouj4ZS4QmlQaE3ni8bioejq239yD6Ij6QtQIY3RgN23UsJKbQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoxG8j3snSk8yChCbITnl2mQcBML+MAdQbzQFEY7lAZ3rkE2u9
	x0HA32mQS0hyKJfxKwQDXcgyFslVs0GaxMWlY7MNrUciqkGkmn0hsq7Y
X-Gm-Gg: AYBFou0rsI96l9eBUGDHG8cz5IjpY/FnEpoGGiTa/WAjOb5CAmCCaNPFvwNGGtHZl/9
	ONYqWLM6+RLHwvV6iofXd76O5OowLQsv3ATOdNSRmfXLui73VEV1xMUI+WkBpfKn/Mdq4O0et24
	9oMDhSk8WXoYxNzv2kYKVJWd//hInagI1j5y3uLpvFQQiMwPFkHmYk62rlMOiNfXXcDJGPiJv6a
	9yTLACOn0ZPhi+V1Ys0so3wDMKt5Zy5/QPN7Kjlwo6DfvKn6KI0tpV3wNETl1reEGoHBjryVklJ
	MfAkHfGZD/diUdIvLik3DwPIgLKAcuR14fXoTj7DOupvaO7nqaxOUNCjyxWVHPKEe0A3TPuUnjJ
	QG67cO+6yTU0iJ7D4aGSJDoIhl1UfDq16I+INtwK0VV2zvqdM3CyELuerVUH2YhgcAfSXqR3rC1
	MMQ2NzidOh/lZYOdd4DklnT3rS9xb9cWBlXwCyIrDIF5JCmnhsbZIPQjjT0TzQaVQdPkmVJhkhK
	sbaZp3GFSe+x1kYLBeIzJExShCtxek+MZ5VMa/e3osJv+K7GYItWB7FTKXXcWAvbPckfHR3SVzY
	xzDR+aWCyWe0IuNTLFr4C3qMXkY5hMAAYY+ovfR8fMWgG/+hyZZhAPp7YbR7fwsVWSq3+O41v/+
	ddxmpvhmsue/nPG/5xji3LyHw5w6sWg8AFYDhmio=
X-Received: by 2002:a17:907:7f92:b0:c49:8fa6:f585 with SMTP id a640c23a62f3a-c4ca7ac0085mr639888566b.38.1793549074709;
        Sun, 01 Nov 2026 08:04:34 -0800 (PST)
Received: from localhost.localdomain (dynamic-077-188-130-121.77.188.pool.telefonica.de. [77.188.130.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174c0sm287957166b.8.2026.11.01.08.04.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 08:04:33 -0800 (PST)
From: Maxim Muzafarov <maxmuzaf@gmail.com>
To: linux-mm@kvack.org
Cc: Maxim Muzafarov <maxmuzaf@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Yu Zhao <yuzhao@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] mm/mglru: age when the oldest generation is thrashing
Date: Sun,  1 Nov 2026 17:04:27 +0100
Message-ID: <20261101160427.85701-2-maxmuzaf@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261101160427.85701-1-maxmuzaf@gmail.com>
References: <20261101160427.85701-1-maxmuzaf@gmail.com>
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

With four generations, should_run_aging() only runs when the window
shrinks. With every fault on MADV_RANDOM mapping landing in min_seq,
and the oldest generation refilling as fast as it is evicted,
min_seq never advances and pages in the generations above it are
never evicted.

Run aging when the oldest file generation has refaulted more pages than
the lruvec holds since it became the oldest.

Signed-off-by: Maxim Muzafarov <maxmuzaf@gmail.com>
---
 mm/vmscan.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index f11491ee9ed5..f59b29723ec9 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4966,8 +4966,26 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	return scanned;
 }
 
+static bool oldest_gen_thrashing(struct lruvec *lruvec, unsigned long *min_seq,
+				 int swappiness, unsigned long evictable)
+{
+	int tier;
+	unsigned long refaulted = 0;
+	struct lru_gen_folio *lrugen = &lruvec->lrugen;
+	int hist = lru_hist_from_seq(min_seq[LRU_GEN_FILE]);
+
+	if (swappiness == SWAPPINESS_ANON_ONLY)
+		return false;
+
+	for (tier = 0; tier < MAX_NR_TIERS; tier++)
+		refaulted += atomic_long_read(&lrugen->refaulted[hist][LRU_GEN_FILE][tier]);
+
+	return refaulted > evictable;
+}
+
 static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
-			     struct scan_control *sc, int swappiness)
+			     struct scan_control *sc, int swappiness,
+			     unsigned long evictable)
 {
 	DEFINE_MIN_SEQ(lruvec);
 
@@ -4975,6 +4993,9 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
 	if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS > max_seq)
 		return true;
 
+	if (oldest_gen_thrashing(lruvec, min_seq, swappiness, evictable))
+		return true;
+
 	/* try to avoid aging, do gentle reclaim at the default priority */
 	if (sc->priority == DEF_PRIORITY)
 		return false;
@@ -4984,7 +5005,8 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
 }
 
 static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
-			   struct mem_cgroup *memcg, int swappiness)
+			   struct mem_cgroup *memcg, int swappiness,
+			   unsigned long *nr_evictable)
 {
 	unsigned long nr_to_scan, evictable;
 	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
@@ -5003,6 +5025,7 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
 	}
 
 	evictable = lruvec_evictable_size(lruvec, swappiness);
+	*nr_evictable = evictable;
 
 	/* try to scrape all its memory if this memcg was deleted */
 	if (!mem_cgroup_online(memcg))
@@ -5053,10 +5076,11 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 {
 	bool need_rotate = false, should_age = false;
 	long nr_batch, nr_to_scan;
+	unsigned long evictable = 0;
 	int swappiness = get_swappiness(lruvec, sc);
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
 
-	nr_to_scan = get_nr_to_scan(lruvec, sc, memcg, swappiness);
+	nr_to_scan = get_nr_to_scan(lruvec, sc, memcg, swappiness, &evictable);
 	while (nr_to_scan > 0) {
 		int delta;
 		DEFINE_MAX_SEQ(lruvec);
@@ -5066,7 +5090,7 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 			break;
 		}
 
-		if (should_run_aging(lruvec, max_seq, sc, swappiness)) {
+		if (should_run_aging(lruvec, max_seq, sc, swappiness, evictable)) {
 			if (try_to_inc_max_seq(lruvec, max_seq, swappiness, false))
 				need_rotate = true;
 			should_age = true;

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.56.0

