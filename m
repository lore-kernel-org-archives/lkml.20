Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706596;
	b=RRcOaNEBDmsDV4lfR7GkfCaQ92CmKg8Okbp+fDQtNVjDuIvvW1OpuVHUN38OzlZKlfhi
	 OZzfpj5/4XAB9EOddFSbbPFpd+ATYDukW3gCnfTm+smye0E9NAGPi/5gjIW8fjbMwxnaj
	 lGTu/ZdUCZR9dWD9+4/4oM83D/uCz+8+MaZmUQqidJBg4j2UvnnO6oEv6AjvM07jF34nb
	 8sMQk0CWCWQd/ySlVZhe2isdmNJAQ17CxEbDnqmxvoPSnGxxue26o9ppD0PbfVlhwmAGu
	 8vda3a5jMqcbcHl1sBObTsz5lgKuPn5ispW7VHz6HMzGqwV9zWMUGS2gzbkkIsHM5JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706596;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mwy1/E7qFCLKO+qrr+CV7aqdVMAe+BNUVLDdmHlEewA=;
	b=qsCOmt2TOsqBf3n6QYnutsbvHfzVBx5jY4xGL/vXnbsWvdknx07B1QNxp4uG3dH/Ai47
	 Lgb2DTjRg02ux9w3KZWoX+BvedWD9BA6iw7So/Xsrh2q4dD6m8sGTRamxYbXFo6NVWpoU
	 PNCHvlyb6y7ESJf5FZ1jxAIvVnI1fdQUsGMbbc7ABYbgr4HQN7A0pkdWWhVoE8U18S9Gj
	 8xsgbo5ZjfTiOuSFTaUdLD6Gck/Myf3iJklS9FonVhV3J4fc6HXjBwwobl1Hpc3IPmsJ3
	 VHVtcsb9qx7o7B0iqKKfuf4JSJeZ878B3mozMqCjWwPxNERhcV0IY0gXIylUhRxEXGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYdStfuA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CA9606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYdStfuA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2D71F01828;
	Thu, 22 Oct 2026 22:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706595;
	bh=mwy1/E7qFCLKO+qrr+CV7aqdVMAe+BNUVLDdmHlEewA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WYdStfuAzdas6WBe5uBBKWpJR4w4OwoOyIHE03T6K2D+0UL3VE/1qyXYWTq4oTkJx
	 tHGHpk91MWgG7keIE2/b73rNOYpnd8Uf6paFe4Bt3qlPm6WKiaxl2HFrTiJ8m5dlu+
	 EY/AZcR7Jvt4Vj9JtNmyZBRwHD5qF3YsCVWQ1BC+G7WWQYIJBI5o8XaSqLercQuRI7
	 wL3A8N7H9yqL0rbcRkAa2V8hKRJqgIGk9cTBCw2JvHt2xb/BDHAJDejAFPi4moObXt
	 wSg/e/kiLgC7joTy4KRUAKz3cF0kN2UKDHSWGJah4gjRaeClYJNyxmHjJu397yXJOJ
	 +BHErol9aUr2Q==
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
Subject: [RFC PATCH v5 12/14] mm/mglru: Avoid prolonged anon reclaim with swappiness=200
Date: Fri, 23 Oct 2026 06:02:01 +0800
Message-Id: <20261022220203.91911-13-baohua@kernel.org>
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

From: lyugaofei <lyugaofei@xiaomi.com>

It has been observed that swappiness=200 can significantly slow down
reclaim on some machines, with some workloads running 3x slower
under MGLRU than under CLRU.

This is because swappiness=200 currently results in file_factor=0.
Give file reclaim a small factor at lower priorities, for example,
when sc->priority < DEF_PRIORITY / 2.

Signed-off-by: lyugaofei <lyugaofei@xiaomi.com>
Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 555359cc0368..81e81d69e67e 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5056,8 +5056,8 @@ static int get_tier_idx(struct lruvec *lruvec, int type)
  * We don't calculate the scan cost, MGLRU uses lazy promotion, which will
  * cancel the scan budget natually.
  */
-static void lru_gen_balance_scan(struct lruvec *lruvec, int swappiness,
-		unsigned long total_scan, unsigned long nr[])
+static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
+		int swappiness, unsigned long total_scan, unsigned long nr[])
 {
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	u64 refault_rate[ANON_AND_FILE], anon_factor, file_factor;
@@ -5114,7 +5114,12 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, int swappiness,
 	file_weight = nr[LRU_GEN_FILE] + nr[LRU_GEN_ANON] / size_bias;
 
 	anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
-	file_factor = (u64)(MAX_SWAPPINESS - swappiness) * refault_rate[LRU_GEN_ANON] * file_weight;
+	if (swappiness == MAX_SWAPPINESS)
+		file_factor = sc->priority < DEF_PRIORITY / 2 ?
+			      refault_rate[LRU_GEN_ANON] * file_weight : 0;
+	else
+		file_factor = (u64)(MAX_SWAPPINESS - swappiness) *
+			      refault_rate[LRU_GEN_ANON] * file_weight;
 
 	/* Cross-multiply the ratio above. */
 	anon_scan = mul_u64_u64_div_u64(total_scan, anon_factor, anon_factor + file_factor);
@@ -5305,7 +5310,7 @@ static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
 
 	total = apply_proportional_protection(memcg, sc, total);
 	total >>= sc->priority;
-	lru_gen_balance_scan(lruvec, swappiness, total, nr_to_scan);
+	lru_gen_balance_scan(lruvec, sc, swappiness, total, nr_to_scan);
 }
 
 static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
@@ -6050,7 +6055,7 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
 			return 0;
 
 		lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
-		lru_gen_balance_scan(lruvec, swappiness,
+		lru_gen_balance_scan(lruvec, sc, swappiness,
 				     nr_to_reclaim - sc->nr_reclaimed, nr_to_scan);
 
 		if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappiness, MAX_LRU_BATCH))
-- 
2.34.1

