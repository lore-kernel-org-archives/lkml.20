Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439623;
	b=hN0MTjpSJ+EXW6wTIKLbOJzNtuBCuViAHPhaCwnXchTk6nL20PhheSws5Sca8L6S738e
	 qudbGemimfUSO5moRgE5W5godc9yo4C/9fN6V6xorm6t5Jn37hjUMnh9cIczxbPpfP8X+
	 x4DpzrIzMGCbLtHZdmVY8ivDcSugE1LSTSwhZ7u3JO7i2L3y9zJsMPJxi5o/ca7eylKyQ
	 vZl0/lSeFwzkwc88c/AHzHmhOWeRd+AIVRKoOf4H5ApS4QmHHZZyjvgEJAZUNh1+Uv2N3
	 3Lxg25MdqQOIap1eavJo0r5jUQrfUubX4NlCgYuvrzKus2HuBtTQXjW4wOtsHxnHxrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439623;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=us1KUlLBFfnvhPfdhmbZmuJ5B8kI86ogiTrry9m5hwo=;
	b=5OnOAaS+pPbFUY3dK/9DHDD4CBEe0loECwBzOcXcgVNRhl0BBxDoxmXICyq30ulHwKec
	 s/lO/PzpxfR574Zi8wDKIfUJlJpLxVpiVskuU/gEjDB7Av8/LILmdRLRcKJbqScaCy8P+
	 h4PT+KSfX4zgdYPFQ4LV4hNhEKImp/B6b7MN6BSVNUfy0rYpYLatvdzbjJGm6IistD1iu
	 CfgAoy4bkmU8gsmGxwpoJ5hlx1FDjuskbLHw7or5YBfIj4HjCWZ4u9gyl9jZ1b1FPCiGE
	 /IJPoWxVF5wcErEkYHqzMK5iptXYnVGdvm7kah+lcgp4np7WBHIT+0czk6a+nuWoYjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bPVn7yHS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAD7606A887
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bPVn7yHS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98731F00A07;
	Wed, 11 Nov 2026 23:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794439623;
	bh=us1KUlLBFfnvhPfdhmbZmuJ5B8kI86ogiTrry9m5hwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bPVn7yHSXV2r9bHDFbwmTou4LvhfPtRUTJDhSqOQ3g5pWqvY6tTuajMcr0UNcRXEF
	 IW7YHWNA6S0/LPOJOu/GaKU97ZLvdSlZvtBuOTxsQBpfovw5kRV3/iV8qDT9rM5LGM
	 r4WBh+D1rdPLK5dyLMkfwV5oUy8PUnjj5oI1z90ypFGcPsildFk1+SeK4cNhPaqvTn
	 6oHRWRKnYfMooPZ7/7x9MZx6X3dmXc4TqTcznQyrmG53aIr8MH/uOm2CODfz/5nYdy
	 NJADOlKfbyAsYsFFMWQOnzXzuyBrsXqBYGvoS0b7ubM3vep80K0jz8V9V7sjnVblv+
	 iCzgc3gwPkLYQ==
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
Subject: [PATCH v7 10/16] mm/mglru: Run aging when pages are rare outside the youngest gen
Date: Thu, 12 Nov 2026 07:25:57 +0800
Message-Id: <20261111232603.9934-11-baohua@kernel.org>
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

From: lyugaofei <lyugaofei@xiaomi.com>

Run aging when the total number of pages outside the youngest
generation across both types falls below 1/MAX_NR_GENS of the number
of pages in the youngest generation. For extreme swappiness values
such as 1 and 200, also consider the balance of the corresponding
type.

This improves reclaim efficiency, especially at extreme swappiness
values, while reducing system time.

To avoid the overhead of aging, we only allow imbalance-based aging
when the reclaim priority is low enough that we might reclaim the
youngest generation.

Signed-off-by: lyugaofei <lyugaofei@xiaomi.com>
Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index c5c4d6418d46..bf30c5b95478 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5068,6 +5068,41 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	return scanned;
 }
 
+static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_control *sc,
+		int swappiness)
+{
+	unsigned long youngest[ANON_AND_FILE] = {0}, old[ANON_AND_FILE] = {0};
+	struct lru_gen_folio *lrugen = &lruvec->lrugen;
+	DEFINE_MAX_SEQ(lruvec);
+	DEFINE_MIN_SEQ(lruvec);
+	int type;
+
+	if (sc->priority > DEF_PRIORITY / 2)
+		return false;
+
+	for_each_evictable_type(type, swappiness) {
+		unsigned long seq;
+
+		youngest[type] = lruvec_gen_size(lrugen, type, max_seq);
+		for (seq = min_seq[type]; seq < max_seq; seq++)
+			old[type] += lruvec_gen_size(lrugen, type, seq);
+	}
+
+	/* the vast majority of pages sit in the youngest gen */
+	if (youngest[LRU_GEN_ANON] + youngest[LRU_GEN_FILE] >
+	    (old[LRU_GEN_ANON] + old[LRU_GEN_FILE]) * MAX_NR_GENS)
+		return true;
+
+	/* Swappiness extremes: the corresponding type matters */
+	if (swappiness == MIN_SWAPPINESS + 1)
+		return youngest[LRU_GEN_FILE] > old[LRU_GEN_FILE] * MAX_NR_GENS;
+
+	if (swappiness == MAX_SWAPPINESS)
+		return youngest[LRU_GEN_ANON] > old[LRU_GEN_ANON] * MAX_NR_GENS;
+
+	return false;
+}
+
 static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
 			     struct scan_control *sc, int swappiness)
 {
@@ -5082,7 +5117,11 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
 		return false;
 
 	/* better to run aging even though eviction is still possible */
-	return evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS == max_seq;
+	if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS == max_seq)
+		return true;
+
+	/* run aging when folios outside the youngest gen are rare */
+	return lru_gen_imbalanced(lruvec, sc, swappiness);
 }
 
 static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
-- 
2.34.1

