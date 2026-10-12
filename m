Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177174CDA31
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791838516; cv=none; b=T7U+oGs3n2YHUpQOeOV4N6A1I/s9jzYBkHsjFIruavklJGuZ5A3jUxjlq7pqSaF4a0sYzQ7ZSHlSOeVzC15UpFYEiNNmgEOKRCJCelWXa84k6f/zBh4hQFg5PVCE5wmkri8tEE5YtSV70xgvZUF1et9py7pyECdt15INMgyUU18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791838516; c=relaxed/simple;
	bh=vk/ZLEuicmBlCrG96aV3h1S4Bcfxwl2bjRehHbc5fu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrLR5UeXgu2xNAtefLJNFfaS9LAuhRJ8Iqm0469rsDv75wsNQkZfTZjIEbtiEJsUR3kU1SSLRxbqQj7+lJrgYg260ZdBVOl/mIY6V7jOSKGgmTj8Ak68VeQB0N1RbkJ/qtiYq0LPhAZ+9XzA9jEjqpTopaO84uBIsGtGBxq3ujY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=A12gOd34; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="A12gOd34"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1326172f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1791838509; x=1792443309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cM4+BdXHxixpIoH9wpDKozsr43Lr0DrRbvDrH1ZEVGw=;
        b=A12gOd3485uFa/1lkxuIwNr7/hOnxNGDA74L0sDvNK+TANWK6Rqr1k9llJ1k+0l9ta
         l6gSb4/qwqdqmneHsU/8ifdZ55IUZc7BJiMn65nS4rB6qvvFmNHOE71phOgsGscogi89
         17RFocGEgNt7tWtNbF1QGM3c/hVb1jPtlv1uhTXalpQL0l3cdL0qwmeAVXUzQORWCGps
         vLpXkiEGkrFVoI+U30dcQDtmZxfo7ItHWSKOntPy6ilS+DW1KEyG+FDzKDFrFmC2xIjr
         oiiDDAuB/IBGA8h//uqhGupqWWJpzi2i9rRgsdwAojIlkNW0dUIBVRsRk1NhSFlUHj4K
         8FJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791838509; x=1792443309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cM4+BdXHxixpIoH9wpDKozsr43Lr0DrRbvDrH1ZEVGw=;
        b=ZD3TnBfyTQEKMqE54PwfauL7r5tJus0IXXrrPO9tpCDOzHWUhW/f7L7RIeYPtmUd6A
         v6Ogf5eVkelsA7EPjITRzXp4U0ErrtXar364uPU7NRZ9fyL/aWXJL9Kylhf20s7de17j
         ExXAOdG24Ib35HiSZ2PyqWbDPWLM4c+DD5SzlolhrnB6Q6qBHKHcFowpFg7rKlxnrlQl
         hvOIBSF5IxnpOp1QjPbalJjQZMm70J3wPnGNw87IAiM9OjGmxKZnaMSktQWyaUZRQ+jE
         pxa0OfwNkWUvEPpyxkt9o0iFX2C6KWKoI5AMmn1IOs8/HcWLC5PzqtmDOFPuzOSHjr0J
         pQPA==
X-Forwarded-Encrypted: i=1; AKwUvBxFnvG1nlRlrTfYj35To0UyWLkxvdSGHd187EBbiAaRtkc9pMFPE2gvDoP8hP5Hxd0QU4LItp4VFeDgiE0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLx6Ka7I1zKBcmxuPUwqVj3yvwwUzZk/WVBHNo4rw23tT4laf/N
	A+Ggl99rzTbBROADHTS1jICjxp28rowpqt3/hKEoKlAj3SVhkcMwF867HNlka8HPZfE=
X-Gm-Gg: AYBFou0ZH9WfBiiL/hoLwhQs1IthtMPpo+to/UX0p1QjOBAK8o+HZKODYKahwZWlSP8
	Q/uepPIgZ/9/zZ2hN0rfid7E0cV6MNDsWfJl47eBlM7EjPW7DfasVPaWCc/mPY3SmJ7nHNJFMdU
	O2nyYtBtN2eva7V7PaXUhbg5QUpQr5e82tUO2agn0Z9yuzjRWjFXWlCYCW8rze6mpcPC1L4TP0P
	vh+mHLgeNLxFDBR1monfAIAImNpQMpPuP832rwcPz14BDHvYjjAwTAxCbogG4+2jPZHtFOAoSGO
	FTXnWjkZbuZ50k/nisVsa5wsUsdUKywQHxpJjvliJ9OqwE/gXhqnVl/4kDlnMp3cDif2eW2oL3X
	WwZTMy5vkfldUlB02YyPMG2IQBa+/h7HDQLMhKxmpdwwwq3wtnA3WGmfSUDAdljUJnCQOBEZFGw
	mClo1zwJNXGjD7FqJK6H9yR/SGfkY8bXZawEs+rRyMyBaY4cdvIZFonJ3FBla8Z7NgS7xIVYeI6
	0UXH/zmPPXgqFomg5FW8BjAk8DFhcygy0YcEvtkGjDe/00xEO6AcXy8r/P090hURVC2S/AuwUE=
X-Received: by 2002:a05:6000:2481:b0:48a:f318:ac02 with SMTP id ffacd0b85a97d-48dba9bdbaemr22343002f8f.19.1791838509192;
        Mon, 12 Oct 2026 13:55:09 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0514ab1sm1895744f8f.0.2026.10.12.13.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:55:08 -0700 (PDT)
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
Subject: [PATCH 3/5] mm/mglru: cache the last memcg node, make tail insertion constant time
Date: Mon, 12 Oct 2026 22:54:45 +0200
Message-ID: <20261012205447.2717801-4-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012205447.2717801-1-max.kellermann@ionos.com>
References: <20261012205447.2717801-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 include/linux/mmzone.h |  4 ++++
 mm/vmscan.c            | 24 +++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 94f9c3ff5416..9c1c1f153d1f 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -586,6 +586,8 @@ struct lru_gen_folio {
 	u8 gen;
 	/* the list segment this lru_gen_folio belongs to */
 	u8 seg;
+	/* the memcg bin, protected by memcg_lru.lock */
+	u8 bin;
 	/* per-node lru_gen_folio list for global reclaim */
 	struct hlist_nulls_node list;
 };
@@ -683,6 +685,8 @@ struct lru_gen_memcg {
 	unsigned long nr_memcgs[MEMCG_NR_GENS];
 	/* per-node lru_gen_folio list for global reclaim */
 	struct hlist_nulls_head	fifo[MEMCG_NR_GENS][MEMCG_NR_BINS];
+	/* last entry in each bin, or NULL if empty */
+	struct hlist_nulls_node *tail[MEMCG_NR_GENS][MEMCG_NR_BINS];
 	/* protects the above */
 	spinlock_t lock;
 };
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 3d4bc12cf18e..69976df5d537 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4384,21 +4384,37 @@ static void lru_gen_add_memcg(struct lru_gen_memcg *memcg_lru,
 			      int gen, int bin, bool at_head)
 {
 	struct hlist_nulls_head *head = &memcg_lru->fifo[gen][bin];
+	struct hlist_nulls_node *last = memcg_lru->tail[gen][bin];
 
 	lockdep_assert_held(&memcg_lru->lock);
 
-	if (at_head)
+	lrugen->bin = bin;
+
+	if (at_head || !last)
 		hlist_nulls_add_head_rcu(&lrugen->list, head);
 	else
-		hlist_nulls_add_tail_rcu(&lrugen->list, head);
+		hlist_nulls_add_behind_rcu(&lrugen->list, last);
+
+	if (!at_head || !last)
+		memcg_lru->tail[gen][bin] = &lrugen->list;
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
 
@@ -5883,8 +5899,10 @@ void lru_gen_init_pgdat(struct pglist_data *pgdat)
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
2.47.3

