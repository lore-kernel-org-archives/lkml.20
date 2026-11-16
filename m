Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816857;
	b=a+gGJ0iEL/btbgSYKJVTQ6M0pY6Ssbu5GHQYT/y875B1QgWFkc0/lypr+LtmtUEBnhzP
	 E0XvxkY+gO454WAXYoUPY1IpOZ47oRRNiY3KcMCuga3mI49on0wN7tyNStGmaRJ7/bvSR
	 8iBehDov+n9E7iZoo5tfuahFXwkxFaeRuOy/hvU7q2uskG5rB3M7RVFFG/yoovI2k5+Da
	 7XH56O9Cq9Skp9QQdDJb90NqUnBaFlokxltsTE0HrozMjz4RDBqYbGZEDujOWYtO4Hjxl
	 0YI3x9gxirNm81+5ogA+D+/KCXowaCedKxGbGkA7JO02zoccT1iNK8kNKQaObDxZ8EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z66nA7na/nCTcTXEktzwqJyV65V9uawjJcIXBSwcrSg=;
	b=USFiQw8jKCkJYGUV/kl219Krvt1XAwRt563WLFHwW3DmMlgg3MFlv/Lp773iJgDJZY/u
	 GpdkAVTpvD7KHao+9dK+S64uiepsSSisB8ciNK3kMX9RtBcpvBJt9AnkR9+2vIQo87lJX
	 ZbtWjU53EgYy6UC3EoPqHwbhDNBK5aIcS0XXUcYo0eR99eDgS335wZ598LMo2u9v817ZO
	 TtzrdvDOUvYVLMIdvCjIhgextMMCfbquhnGtcnzj3IRL+1N60G1wPVVxummZU6EaInApp
	 2kUROG5DPtTmX04rda3JpBf50HxLnbXOzjqj7CYcjZTNE9LSl3Alt/pL9cPEOVTNYYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=CYSYAxQ8;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FEA606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90FEA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=CYSYAxQ8
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490f38e9688so2156638f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794816856; x=1795421656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z66nA7na/nCTcTXEktzwqJyV65V9uawjJcIXBSwcrSg=;
        b=CYSYAxQ8QNlj2VlXXSB6rwSNPfBjZQu8cKrmWHvHbpJ4f/i7/0P3tyMmUsFs0u/gb/
         BYqN613nzQf5V4xItSG+Kn9QCXBqRl4E+epCqR6lEHuAvb6d7jhSbPdTs0OPx7ZPNErI
         6P6LxXFlfp70soNuEiN62P3i0yjo6dEnIGtbWFBcPyzJWslGvOl04pX+0mtySszbIsiz
         hsw39t0ENBTQqnCL3YYW5XXS6QyKfoDxfO1yk3JaFX2KsIhHcLa89ekYaAgc45gKfYK4
         H3n4ckZZGwwz2o2CrgSbkOFyQIf8obDzCCAC9AabCrh3C3UTximAAmN68k6Laq7dBOGw
         hYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816856; x=1795421656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z66nA7na/nCTcTXEktzwqJyV65V9uawjJcIXBSwcrSg=;
        b=Vrs7YDa80mSi4n7ZiVgfo15gW7fCJOVxMOqoya1aXUYqc7PAor7BSC0Fa6lvBDeild
         unk+jFUVXc1YxROUCjs46lI8XybBwVhIjVaEJhUQSe1nHdUhLSURLHBgVSDBvPrbZbC1
         Ta63pDuRzwKD9muFklp4sL1/eIpjqE5pG1/yY6KsTvWS3L5JEFbT3Uz6tzab0jHNvpXT
         F1ljlqeGpMAOJARRhWoEryGGdQlqnB6OHYBvI5Byx54q33uthaeot1qm5QhJaiqFHhj7
         gGRsJ28TQvvWRfUoWVSmQOKSwrEuwbmoWfAeSSglUhVd5t3g27QKYwK6NzWKP5Nsbmyl
         DztQ==
X-Forwarded-Encrypted: i=1; AL+hErGFI/mdpB+kurrMDyhIOrvrxVbc7Uy58hDbMAkSbdzF2/35h98DJKu9fhzyGU+otcNXz/KVGtzE6GEbLx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hDJGvxjhGHLWXiDbs7HVA89MKYCNXmy564b8RWUv0pVnDPDqS
	jBlBM01D8uc2pbLzPNBygaHdW2ZsUQr0AKGpEIc36v1tRzyZl/UEgsL9qI6Gq3w5tYQ=
X-Gm-Gg: AYBFou0c/DCMwYz7s5EpN31HZjjYR3MfYp2zkFPzW2ULn0sYUJoB07aW7LgbG5urwEl
	LQnaaaGEFc+IEw1jQ+HOKq23DdEwpQaFsfjIyR9ljhVNkN++bI3XUXzl7A/WIi1wH8hoSsPM+ho
	phboxmHiwUfkjF/yCkMfzK1YGWs/ILD9UNhvz41SCATu5hSaX+r8frJWZaM+sLc4/m8equVLVda
	pvp4yEcUrd3ZBoWyTI1g3qKZDCCFCGaW0rcgwLYpMVZOTRAGfKE8LlJRtJKYsV+0/6JQGuauD4V
	5hnHJnDvhI/phH2noRn8m0ICR4RcUInyP7WOeRrLf6tHi/6G6XzNcGZafu3Dz8GAQW8Ok+rDeXr
	2pzHm6A5ETF+JABMe0dVt/XjnSwkUCf/OhKPeSjViRdbWuVReGAXqwEPJs0E756QirOTtVMMB6/
	8BVPbKdNzVlgVE1nBWzlMonwzv8dW+qH5MaZ0SVuSj2cFAWiDUqKWX7JIhDWngGsZcXFQaUo9bq
	dAZOZ/tznu6vq7NpUev0ebD/FgepaPVkAuAOd28VAfLl0jKFb0idMS1gwtDRMSxcDqh6px2v8rF
	T4E47a/vwdQJW5ig1PGsa8/AeoNPdpc/TquVjK/9pRAGgvR9MiBMONrCakRZmvX5VaQSb0t0R+c
	VnnmLArN6bOFUgPiWKQRiIYBaoOP0zg==
X-Received: by 2002:a05:6000:2402:b0:498:6171:c074 with SMTP id ffacd0b85a97d-49afe168694mr29470489f8f.3.1794816855867;
        Mon, 16 Nov 2026 00:14:15 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1797sm22902289f8f.11.2026.11.16.00.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:14:15 -0800 (PST)
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
Subject: [PATCH v3 2/5] mm/vmscan: move code to lru_gen_{add,del}_memcg()
Date: Mon, 16 Nov 2026 09:14:00 +0100
Message-ID: <20261116081403.216452-3-max.kellermann@ionos.com>
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

Preparation for the following patch that adds tail caching.

For simplicity, hlist_nulls_del_init_rcu() is now always used, which
is also valid during rotation, because the entry is immediately
reinserted under `memcg_lru.lock`.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 mm/vmscan.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index e772eacff3f8..49ef29a86553 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4429,6 +4429,26 @@ enum {
 	MEMCG_LRU_YOUNG,
 };
 
+static void lru_gen_add_memcg(struct lru_gen_memcg *memcg_lru,
+			      struct lru_gen_folio *lrugen,
+			      int gen, int bin)
+{
+	struct hlist_nulls_head *head = &memcg_lru->fifo[gen][bin];
+
+	lockdep_assert_held(&memcg_lru->lock);
+
+	hlist_nulls_add_tail_rcu(&lrugen->list, head);
+}
+
+static void lru_gen_del_memcg(struct lru_gen_memcg *memcg_lru,
+			      struct lru_gen_folio *lrugen,
+			      int gen)
+{
+	lockdep_assert_held(&memcg_lru->lock);
+
+	hlist_nulls_del_init_rcu(&lrugen->list);
+}
+
 static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 {
 	int seg;
@@ -4455,8 +4475,8 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 	WRITE_ONCE(lruvec->lrugen.seg, seg);
 	WRITE_ONCE(lruvec->lrugen.gen, new);
 
-	hlist_nulls_del_rcu(&lruvec->lrugen.list);
-	hlist_nulls_add_tail_rcu(&lruvec->lrugen.list, &pgdat->memcg_lru.fifo[new][bin]);
+	lru_gen_del_memcg(&pgdat->memcg_lru, &lruvec->lrugen, old);
+	lru_gen_add_memcg(&pgdat->memcg_lru, &lruvec->lrugen, new, bin);
 
 	pgdat->memcg_lru.nr_memcgs[old]--;
 	pgdat->memcg_lru.nr_memcgs[new]++;
@@ -4487,7 +4507,7 @@ void lru_gen_online_memcg(struct mem_cgroup *memcg)
 
 		lruvec->lrugen.gen = gen;
 
-		hlist_nulls_add_tail_rcu(&lruvec->lrugen.list, &pgdat->memcg_lru.fifo[gen][bin]);
+		lru_gen_add_memcg(&pgdat->memcg_lru, &lruvec->lrugen, gen, bin);
 		pgdat->memcg_lru.nr_memcgs[gen]++;
 
 		spin_unlock_irq(&pgdat->memcg_lru.lock);
@@ -4510,7 +4530,7 @@ void lru_gen_release_memcg(struct mem_cgroup *memcg)
 
 		gen = lruvec->lrugen.gen;
 
-		hlist_nulls_del_init_rcu(&lruvec->lrugen.list);
+		lru_gen_del_memcg(&pgdat->memcg_lru, &lruvec->lrugen, gen);
 		pgdat->memcg_lru.nr_memcgs[gen]--;
 
 		if (!pgdat->memcg_lru.nr_memcgs[gen] && gen == get_memcg_gen(pgdat->memcg_lru.seq))
-- 
2.53.0

