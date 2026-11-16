Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816859;
	b=t90PqajKk2W/8RLc013ZJoEWU2AIkn+31phVkbWFq/dOquSxV+sga1pJwiai3DRN9cUz
	 2/SdgylGwPCNNwPagKkGoz00YUSRNJMy4aHSKMDeHgT1OlDfXdhWT87XbIYhppqHJoDhO
	 K2Rhii2wsbAOtpNRGk6bD+TOz54UJ378nKdiiFq6mn4V3btiHUTjLbugQ1n4wv4II1J1l
	 k0QRIb1lnUKupowUPAncKdFwU5kWaHmWVUVR+brhbBkb/CxCz6lBD3f6ThKYRWpoD1sH4
	 n6hI++z/hD7DSRiOEyn3HtGbqg7BqIb7j8xODg7KxYKtT5j8Rnk/o3yRuVJv/lXtC/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bGXfKLiq/xapUarMj/h8JL1wFySyJOjdq/BDGf5JeCg=;
	b=l/OawmjXqRn0EWq+XoYXzwLQM9KNglFnedd8e0TNbt9a6H7T92jEJr1PRTscplGVZ6pj
	 QDKd6L8+qhElPLGI9+s7WOm91lInYdwE4vzjgiY4xvYpcoohamttdUOtCtBg909KVAmzt
	 WVqRxkAtMYFzcnoFnedgHsPh2MJ8mt08ubwswDNRnk5xBDj9Hg/gXyPlqm/M7W4AAImg8
	 QgCU8+2Ok71z034X+47kaHe90kUyAEUlaWMNyW4sMOU4YpAVZGspJeoLWZF+uqrTlY2/h
	 ZJ7p9SHPOVmKfO4QPIfWyKGk996W/RYfIOPZOK8+fO3pltb8oIjvpFF5CIA6PtpStBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b="Ad/wiBtP";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E99606A89A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E99606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=Ad/wiBtP
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1591672f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794816857; x=1795421657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGXfKLiq/xapUarMj/h8JL1wFySyJOjdq/BDGf5JeCg=;
        b=Ad/wiBtPiRE2BxRwg4Vjr8gvGCtQhZWoctymyHiXg+2qiaQKB9Iebc5iKQGFGzjKZm
         +DWWoakhc7OS/zi+JMPO0s6XvUUo3W44w9ch3dFJJLQ6Qagyml/B4A+pFIT7qrKApRJf
         ToMk9g9bEegmF4mre3QEtpRolOSJfO1DopqayZfM0DuvCawQaLQ+jLOqF4V8q7giLChP
         v4jqd1cjJVMs1Vy5c6x0l3aIv55jqkDypOGnPIXpG3ZUTNPhpkVmTP/y+VPxKPtpW6fY
         FXDqyEBF+/tkOJzMxfPNc/ntlJXGx3avCaA9SCEVk2UFyu/5KuV1aND1EC6FnTGAJNjO
         x+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816857; x=1795421657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGXfKLiq/xapUarMj/h8JL1wFySyJOjdq/BDGf5JeCg=;
        b=jX6aLhNYTHMkawr7FOrNWjfR8q4UlO0gt8iFDIY+68Uk7RM5SUE19U4Qps5iEHehKs
         1BnqECiJ96qBRrtPYa1TLarTxH4L8tp8C13b3ugMg4Blg0u659ElnThbgJkl7n8sgivW
         aMOozLuGLJHG1grBUzxLXsPrkPzQOPZ0TKk0yjFfsKtAP9IGT8jmNGlcpltZfQMPoqbX
         RycUwO5DgouIrBecBD2Neyfjl8Ecd41aXeYKAuH8KhMJsU6gO4Fl6UlxBS5FAuRbRbe2
         PRofrlOTadTt9YqRtFldWdr0BJg2czthaxWV0+nhLoCWeIRVknkxbFiONwAGm4mujUVD
         ipDA==
X-Forwarded-Encrypted: i=1; AL+hErExNT7jKwTT8QGyouAj+CtuakpbcJHpO3lhZEiM7RveQE9TsC9Dt5ZPbARLmpez/pPadaORAk6XxYkvsHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iroVTZuMt+Kw/Gvm/8fbOHQ6ChQDyMV5JE8YhFXJFFiWuIBk3
	7swpNfhubhO9JSX7rJ458cI6uEo24x9MfHCjVrJnUxak06t4YS4/SBGA2LFpou8lZ9s=
X-Gm-Gg: AZFdTZe+U1k00gV76UMrO4RcdKfkmUyW7K4WdDd+59QwR/5uN1c5phXBhamsXAgUsje
	cAZAFzNDwC0uYTXU9F9xyzJ2WfiOcAwnZZyZ0ORnSxD/Lc6qbq0Z7EqE3oPFjBnhC5W6LqhKRPO
	7XvfjL+q5gei+wgE4rzbUur3A9mttJnxZyMgR41q2HMkneH6qUSIR//W4IDKSmVxgnnSzAu7wpH
	CR5PmsmgsAWDv2AZzskeTy/Df6M/m/whekxL+X9bqROOPR/8zeZtItmt+HKhlRv2V+5p9m+AwLB
	Hvr0cMjAiJlHQsitbZYqgTA1CcNT0iK7y6rs/RZ0siuj+/S2E+zyR9+5z2znCHRhctTrqXezncG
	BdE+KVGn92+VAEg6D7uzWRFGKr2oU9FvMyPOsRQlrRm29WPo6VlVhDj9IQZgqkxbpPR4NoQ5Uo1
	fpH1PrRR8Dry5umlPlyb6WHGwLylReB42uZLuOlCUVCr+LW4VYhdHLSidtyDiaRDpQTh01WmovM
	LNaeIiSU+jte6NJW8SfhY8TDw0z/ZROuU7Dt6a+9w3vqOYUft7K1PHEVjXamhP0oe4cqLb0jolR
	inC1EVUylBCDHqDgUJPTcvjzNstDHrsL6IND4qeKY8AxGls7/hqQoqRNpjZ05Y2DXu0DEPCdRrD
	NKlM5uE0/J6JZVWEiMurcW47/Bp07RQQuddBotdkts0reLiYkXxI=
X-Received: by 2002:a5d:5f56:0:b0:48d:f36e:fbcb with SMTP id ffacd0b85a97d-49c70ed9069mr24699139f8f.14.1794816857186;
        Mon, 16 Nov 2026 00:14:17 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1797sm22902289f8f.11.2026.11.16.00.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:14:16 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v3 3/5] mm/mglru: cache the last memcg node, make tail insertion constant time
Date: Mon, 16 Nov 2026 09:14:01 +0100
Message-ID: <20261116081403.216452-4-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116081403.216452-1-max.kellermann@ionos.com>
References: <20261116081403.216452-1-max.kellermann@ionos.com>
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

Rotating or onlining a memcg currently uses hlist_nulls_add_tail_rcu()
which walks the destination bin to find its tail while holding
`memcg_lru.lock` with interrupts disabled.  With thousands of cgroups,
this takes a long time and causes severe lock contention.

Cache a pointer to each bin's last node, making tail insertion O(1).
This requires remembering the bin number (but the new struct field
occupies a hole, so it does not grow).

In a micro benchmark that creates 1500 cgroups and repeatedly writes
`1024M swappiness=0` to `memory.reclaim` in 8 threads, the request
rate increases by a factor of 9.5 and the average duration of each
write request is reduced by 89%.

All writes return EAGAIN in both runs; the benchmark measures the cost
of reclaim attempts that cannot meet their requested target, not
reclaimed throughput.

Fixes: e4dde56cd208 ("mm: multi-gen LRU: per-node lru_gen_folio lists")
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 include/linux/mmzone.h |  4 ++++
 mm/vmscan.c            | 24 ++++++++++++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index c161d563ce8f..8382fc86cf0d 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -570,6 +570,8 @@ struct lru_gen_folio {
 	u8 gen;
 	/* the list segment this lru_gen_folio belongs to */
 	u8 seg;
+	/* the memcg bin, protected by memcg_lru.lock */
+	u8 bin;
 	/* per-node lru_gen_folio list for global reclaim */
 	struct hlist_nulls_node list;
 };
@@ -661,6 +663,8 @@ struct lru_gen_memcg {
 	unsigned long nr_memcgs[MEMCG_NR_GENS];
 	/* per-node lru_gen_folio list for global reclaim */
 	struct hlist_nulls_head	fifo[MEMCG_NR_GENS][MEMCG_NR_BINS];
+	/* last entry in each bin, or NULL if empty */
+	struct hlist_nulls_node *tail[MEMCG_NR_GENS][MEMCG_NR_BINS];
 	/* protects the above */
 	spinlock_t lock;
 };
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 49ef29a86553..7cfaeca9a605 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4434,18 +4434,36 @@ static void lru_gen_add_memcg(struct lru_gen_memcg *memcg_lru,
 			      int gen, int bin)
 {
 	struct hlist_nulls_head *head = &memcg_lru->fifo[gen][bin];
+	struct hlist_nulls_node *last = memcg_lru->tail[gen][bin];
 
 	lockdep_assert_held(&memcg_lru->lock);
 
-	hlist_nulls_add_tail_rcu(&lrugen->list, head);
+	lrugen->bin = bin;
+
+	if (!last)
+		hlist_nulls_add_head_rcu(&lrugen->list, head);
+	else
+		hlist_nulls_add_behind_last_rcu(&lrugen->list, last);
+
+	memcg_lru->tail[gen][bin] = &lrugen->list;
 }
 
 static void lru_gen_del_memcg(struct lru_gen_memcg *memcg_lru,
 			      struct lru_gen_folio *lrugen,
 			      int gen)
 {
+	const int bin = lrugen->bin;
+	struct hlist_nulls_head *head = &memcg_lru->fifo[gen][bin];
+
 	lockdep_assert_held(&memcg_lru->lock);
 
+	/* pprev points to head->first for the only entry, otherwise prev->next. */
+	if (memcg_lru->tail[gen][bin] == &lrugen->list)
+		memcg_lru->tail[gen][bin] = lrugen->list.pprev == &head->first
+			? NULL
+			: container_of(lrugen->list.pprev, struct hlist_nulls_node, next);
+
+	/* Keep next intact for readers that still hold this entry. */
 	hlist_nulls_del_init_rcu(&lrugen->list);
 }
 
@@ -6106,8 +6124,10 @@ void lru_gen_init_pgdat(struct pglist_data *pgdat)
 	spin_lock_init(&pgdat->memcg_lru.lock);
 
 	for (i = 0; i < MEMCG_NR_GENS; i++) {
-		for (j = 0; j < MEMCG_NR_BINS; j++)
+		for (j = 0; j < MEMCG_NR_BINS; j++) {
 			INIT_HLIST_NULLS_HEAD(&pgdat->memcg_lru.fifo[i][j], i);
+			pgdat->memcg_lru.tail[i][j] = NULL;
+		}
 	}
 }
 
-- 
2.53.0

