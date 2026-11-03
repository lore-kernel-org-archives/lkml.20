Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705848;
	b=t3xhEH4O78p/PegT38K48gYKQrqXhYvNE5x0t8hUl1SlxA4d92BrYnZe7I2+xvg8SEnz
	 ZRDHHPfNho9U8ynAZI0ZCiS7oY9m2+zMrqvw8C5x2XLruOEJO0HBpWc2jVl0+eU3MoMdd
	 Ie3Q+SWXjzmRU718cNYzhrL2jLcqcW2JcU4X6wQUytPEKDjpDsd1SyYOi9B5i/rMjQYTP
	 c/Wd7HNnnYDNANifS5M7XgdSF55a2WUEj+JhKKlgR8phj8UNXubCAbnzZxsuJbfv0HKvC
	 weXEE7eLtFrzLwjIBSSpfZrQLiMwSrmUHji5+jQhwkVnGQMKslAYN8jR90/e6M6IkzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WzSkHTcO0a3HdoBG47R7ltqRhcp97RPhOPTJVt3x6Qw=;
	b=Pi4PMZMzGtpz+jiywZ8JSMaTjYtsgBqn1ePViKyeZFeWYKAWsh6rhLInvkOEcYv1bpBa
	 DzIpB9uaRikgWlFxJp737bzsloqstEICQvNmy70ni2xPKSlFlsOeL+ysfUdGuinUDhAgq
	 uTi09j5TViBpVF/HMN2eNIOSvTwSuowHLhgcQ1f4lr6G691vG2OgrzcXiVaY51V0pDDZV
	 g0KjIQ13oGz9j4txqTWeIchecnf3Px2dRRmx4u13vIlNdpIgp0FvMwlL84RzddnvB+Sjs
	 C4zJ2GiOL01+KVk9DxK1olNyCalgR7843x8+plhh3Wzdu8ZvPMdojkWiaENuadcW4Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=e8+8BXCc;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB80F6082BE5
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB80F6082BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=e8+8BXCc
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so30574405e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793705845; x=1794310645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzSkHTcO0a3HdoBG47R7ltqRhcp97RPhOPTJVt3x6Qw=;
        b=e8+8BXCc0qbix0DZfpNhAq3GbdkI6mcqPqTVzaF1QBl4h6Li8nRVlixMutF7Zk/Xvf
         +T+5dc6vLtHYkMaRIqnpPfehUFYDk5P7/LvouIZ2/P+Nk4caAk98o/oWNatQ5SkQuD6L
         t50orM+sdy1PJfk4KJr9qAE22yc2Y9nFXp2MwEP3UU2dgI2sW4u3S3TEb1Aspwccog8E
         76UrZMQKUheLjZEPE3KJihrg49nypZUan3nlKGMrbuz08Qi+HppDdW0U6DV0/OsPWDuB
         /YnywIy0bmXwv0L9ZGwp3qRAR6mIEwauN447cdCrdk7ZfeKFlKEgvyv7WTJegKuXJDIT
         XQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705845; x=1794310645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzSkHTcO0a3HdoBG47R7ltqRhcp97RPhOPTJVt3x6Qw=;
        b=qY+mIEd+EMBRHqcw9O6WNS7XoqqNvgVq6wiaqvvaR3dsz3JXUmU/x9qg2q/fDqaYWY
         BacYQQ2chwNpdEQTfXy6jwjdG27I9/BHdWpTDofxNhap23YlnaIJriYrvro0Mys+0ZD0
         vDNI6XAxYEfd9KRfcSLIH4bIo9V5mB3IW9ncMRb+bV9c9sxRIzp9nOSywyvSYCH7T6iM
         q3nJLzM9KRJe5/VCd0P5BYl69X6PSL34/vMjPkRxSL4tsLKYh/tpJembcCwEchdXiFRK
         2isrQ83Z7fFsJmQarbIfBvVcYQyBLka5gcP56JZgBbNPYLDhCmxdF6gPB8VAodpEvjaV
         pjig==
X-Forwarded-Encrypted: i=1; AKwUvBz0h15iTlnlGOuraEU3Ku3mirEDjekvOfDHZXYQPeDQeEGb9vK0ZK3vlbcVniVDLNsNmD8BGbkw7xGHI0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/35TnA6HCnuIi6YocEALfNonqZ44Xkkj6svzuOzIHppqxAEnT
	cZMyCElmHZpXqZX9mAEXpP+migsCqpi8L5ZyB+PVK4FW5Bhhf7uI8Dis3Ph3ASCTYoQ=
X-Gm-Gg: AYBFou2xu7HiTmu/D2nIv3UXnBuyV2b8iHREihY3ubC07gJPMvoLurNkxHaGsy6TzXe
	1nU2lsYSHj35fPj90ByxQpeipR+MsVYS8Q/YKZOiy2Zp2pZJr7sHO1Zku3dnfAtMkC9lf1vpfns
	2cCESYalsVMSrPcnHqG26kGK/pA/el69XfflYVx0Y35g4iCtr9YTW8yvVL3yFphHm0DFq6+WQsk
	pPXV8K8vN8iE6HW5SkfB7IqJTswsQabh57ngfX1jPqCqss5IErFSQnPJLlzZfvDIyxdA5zgtjVv
	YSj7ypEPAJmD+JrjBun/KpSrlURXaDHFejEuoUeZZ0Nll8td5ZXug1ZvgcvcrQHFpZfMoyxQdHC
	5z2FlKvCoH47QN4FpbMeGQfc9GvyPIw7rcmGhMYPaSIjmc+Ol5t8FpqY/5CzI7gERNpl0CCJaPI
	22MxT2PVvM73uqqhaY1zKacpIpkvI6FZDKrOUuMMP1mDZ+jlhle6OSUfCzUWwuNEtMDozrFties
	Pv92/HyqAR2AduJdZkYe1+SAWA10Fhh8CpMPOXOF/bKbR0cZCXPNnUJ+BYgFd4ww9P7EBL6YH7M
	QSgU3wa/fAeS4l/BUfwJI2Fq8aoWAkWThgUZXlcumR8nVFcwBiunivCqQ5NQ2cL8j09FzK8sGi0
	lAazdqtZZWeJyPTPzdrhPu6RAPbYt/g==
X-Received: by 2002:a05:600c:628d:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4ac17d16b99mr288398315e9.11.1793705845239;
        Tue, 03 Nov 2026 03:37:25 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm23000997f8f.28.2026.11.03.03.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:37:24 -0800 (PST)
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
Subject: [PATCH v2 3/5] mm/mglru: cache the last memcg node, make tail insertion constant time
Date: Tue,  3 Nov 2026 12:37:08 +0100
Message-ID: <20261103113711.1832834-4-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103113711.1832834-1-max.kellermann@ionos.com>
References: <20261103113711.1832834-1-max.kellermann@ionos.com>
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

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 include/linux/mmzone.h |  4 ++++
 mm/vmscan.c            | 24 +++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index ecd1ebd49756..08928179b8aa 100644
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
@@ -664,6 +666,8 @@ struct lru_gen_memcg {
 	unsigned long nr_memcgs[MEMCG_NR_GENS];
 	/* per-node lru_gen_folio list for global reclaim */
 	struct hlist_nulls_head	fifo[MEMCG_NR_GENS][MEMCG_NR_BINS];
+	/* last entry in each bin, or NULL if empty */
+	struct hlist_nulls_node *tail[MEMCG_NR_GENS][MEMCG_NR_BINS];
 	/* protects the above */
 	spinlock_t lock;
 };
diff --git a/mm/vmscan.c b/mm/vmscan.c
index aed56d452881..3075949bf641 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4561,21 +4561,37 @@ static void lru_gen_add_memcg(struct lru_gen_memcg *memcg_lru,
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
 
@@ -6101,8 +6117,10 @@ void lru_gen_init_pgdat(struct pglist_data *pgdat)
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

