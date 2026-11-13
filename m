Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596200;
	b=q0g9YkOG5RhG++3ow7wjVyC936w2NmVr+8m9/CA8+FsPuNU45R2WZOf3PGOcIoZRzW2O
	 RID6HAFJpgdYDXvxVPGMBxT+FhTx30c5+TDh1k3/g25y8Lco9MJNT0ZXJGDaxAl6TObx2
	 i0vt5k29ePIfzZjKNe4+s8lXBTOxvsU7P1h4TaPNmB56Q0sylMXIkCTFl4OIPnse+8qHA
	 ebf9N5Bbr8pEod/ClEAzEaIKRDMmb8bfhTSiKNaAgATTrl7UwgTAUnCWHz9bL8QMrk7TX
	 SxymCcvC6y5qi0iPC20hMcLb10B/fIXoT5kdIzW+rbx1S3/LRQp4+GJaihoRvSP7sNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596200;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=NW8nmh3F61gF8JllerIuj4vC7Vf5nVwoCNHth2XqrMk=;
	b=gTXwtdz+NZ77DIusOHLnQsfMIHVshSlli96g/I8iXJ0yU0nGQaTU7wYNJZUGuf/jRReK
	 gU2D5nQgozF+LA8CAT/jxaOvBRQX1GxGSyCLgKgTIABG35O8ZqkHiAZqkGgVX0wYQpWSC
	 hudoBSp+xJWz8EgMLTS0C9em5iLDT1RyMq2j1ue5IB/8B3gZOp4GH1gV4AoI9RDOFZm6h
	 Yz8R57IqGtuFC9Et5ZrjhDo/tS4Pr422zKO/DZG9fWP7I+/ZnQ3Ocs3I2gUEXZXDfYI79
	 RXVn9nnxZ4WdCA2gACCmlEcmQhpUCGpJd1H5xnrGjLG2Ty+rr0rwVlS26QCxGbT7bFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmMwfM2f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268FA606B2E9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmMwfM2f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7951F000C5;
	Fri, 13 Nov 2026 18:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596199;
	bh=NW8nmh3F61gF8JllerIuj4vC7Vf5nVwoCNHth2XqrMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nmMwfM2fOnmhhn2bfnthfL58t+QqotwcdXDg1Yu4FmA7EJFnZRc6ZKqdsp1ShiERG
	 npdWCP9NL7van4Fc4H8pMh7LQq7Pw8SfTTHsox9ZsRyIiPFqD8/xnfgvUxIyK0feCK
	 ncDWah39lfjfEWnGzkKBiDQciDMeGZv769d0BpeRh3O5Jfyh36fZgQIWU8WeYGncjU
	 Unhdft4P/n0NICrqjCpzl7AuKUV9cJjYXZHvsF+LWnubzOrYu9hSlBtVEcze+v+o1q
	 jHi1NFLjHilJj+ifYu1hJIBR1/I/5en7NdiYlpCENS7X8nmf2smkBhOO5VCTJ6GnJq
	 GPVxHPaPhht2A==
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
	Barry Song <baohua@kernel.org>
Subject: [PATCH v8 10/16] mm/mglru: Run aging when pages are rare outside the youngest gen
Date: Sat, 14 Nov 2026 02:55:35 +0800
Message-Id: <20261113185541.70203-11-baohua@kernel.org>
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

From: Gaofei Lyu <lyugaofei@xiaomi.com>

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

Signed-off-by: Gaofei Lyu <lyugaofei@xiaomi.com>
Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 8bdc88748959..59957fab915b 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5073,6 +5073,41 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
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
@@ -5087,7 +5122,11 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
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
2.39.3 (Apple Git-146)

