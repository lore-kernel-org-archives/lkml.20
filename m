Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596159;
	b=w7n0qXAVCkStKTqCkjv7F7IIiipS9AJ/Os4ji8e5pvzJ5AZ+iivIAeu8s/RPMiudqNPs
	 Cxz4NCahMUaIfHe6PEbwNczV4zEMm/lWBiXl6cU2ZU+vT1/0Gv4Nby1bx3MVH5hxyerpa
	 oqEdLOcDg0AyS68/5welpSquQ9pKee54mHYIgxBgiO4QpaFPu3N7eBGeTxV5hUD8eAKbQ
	 Af6MHlabAOHyL1JFMGWxoVFV0huoT2dCJRkxfBGCmpoVDxqCQHfSsUjcIzdUw5Bz8S3rH
	 aSHFcWfdheocFAmCac1K7U/XexcdIEU8zUbYfkphBRsil2qHID3jlOThl+VU3zKF3ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596159;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=PNYIb67MUpeEJ0PFi1nZbo5wGpgGw6DkZELvIC4TsPQ=;
	b=xxWUR4ncIfWpAFPJzymuLEyzXUNMCqxEMfgnZaCTRhvxNgAfe8mnQXHX0AadErQSufje
	 l3SJAJBVCMJH3+RInaI8rznR7xRKKz2CA4NTLmh2xj9FEXdipXkmtzyyjMgLaKZ+O5biX
	 sWKo/5nwV9YjntAxUEB7vynzt/F4+cplTL5wZEJaehXaPg2iSR6d/adiYHcMBBgx5WZUe
	 5a2IAglclrqmYCFXY3Z1pNK+f9TRvAeU46Pi8TZuwpup/rV2rhpv5TkqGSw5etfIcNoOT
	 kLM15TNTExnd9plztd/virpt7APoI8yc82KGaIKPYmbuW06DCt5I0o3vl7xPJv+TKIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dgFw4HCZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C03606A338
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dgFw4HCZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B77D1F000C9;
	Fri, 13 Nov 2026 18:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596158;
	bh=PNYIb67MUpeEJ0PFi1nZbo5wGpgGw6DkZELvIC4TsPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dgFw4HCZ4fsJyhyLhfylPMBXNgtxSzrqNk1UfRBwwxQlAzlE4OxkmGxnjN9s2Xtqz
	 IQ9jLD3rppf7Kfao8rT3oLpRHRJh4ZwuNi2FKD6k/GFC+C6ZgzELFx4dTcavDvNqrL
	 7WdwCBT7EL7S/UcJUbiVQ3BAoE6u6Qn2qvkzUvxiRuazNF4MJ5AKlo60OHbNfsHdqa
	 xO8lxPdtqaLUKPKHKxPFa3Ov/upx8p7gXj7ACrRRznbuLKbg4UuWfZ8fIgIwu8w+4n
	 LFtQdkCl2yNCoiC0/jne37467DSSUwTk9ud3zXNNSjtGNRamJKUP3E2/2MHFMV0mUK
	 fMOvQFY12GWxQ==
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
Subject: [PATCH v8 02/16] mm/mglru: extract lruvec_populated_min_seq() helper
Date: Sat, 14 Nov 2026 02:55:27 +0800
Message-Id: <20261113185541.70203-3-baohua@kernel.org>
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

From: Kairui Song <kasong@tencent.com>

The search for the oldest populated generation of a type, previously
embedded in try_to_inc_min_seq(), is extracted into the new
lruvec_populated_min_seq() helper. It returns the oldest populated seq
of a given type, bounded by the given max_seq so the search never goes
beyond it.

No functional change.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 mm/vmscan.c | 45 +++++++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 400f87fc51e1..27dfbd3ff02b 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3992,30 +3992,45 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 	return true;
 }
 
+/* Similar to lruvec_evictable_size, return the oldest populated seq of the type */
+static unsigned long lruvec_populated_min_seq(struct lruvec *lruvec, int type,
+					      unsigned long max_seq)
+{
+	int gen, zone;
+	unsigned long min_seq;
+	struct lru_gen_folio *lrugen = &lruvec->lrugen;
+
+	lockdep_assert_held(&lruvec->lru_lock);
+
+	min_seq = READ_ONCE(lrugen->min_seq[type]);
+	while (min_seq <= max_seq) {
+		gen = lru_gen_from_seq(min_seq);
+		for (zone = 0; zone < MAX_NR_ZONES; zone++) {
+			if (!list_empty(&lrugen->folios[gen][type][zone]))
+				return min_seq;
+		}
+		min_seq++;
+	}
+
+	return max_seq;
+}
+
 static void try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
 {
-	int gen, type, zone;
+	int type;
 	bool seq_inc_flag = false;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	DEFINE_MIN_SEQ(lruvec);
+	unsigned long seq;
 
 	VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
 
-	/* find the oldest populated generation */
+	/* Requires at least MIN_NR_GENS gens for basic functionality */
+	seq = lrugen->max_seq - MIN_NR_GENS;
 	for_each_evictable_type(type, swappiness) {
-		while (min_seq[type] + MIN_NR_GENS <= lrugen->max_seq) {
-			gen = lru_gen_from_seq(min_seq[type]);
-
-			for (zone = 0; zone < MAX_NR_ZONES; zone++) {
-				if (!list_empty(&lrugen->folios[gen][type][zone]))
-					goto next;
-			}
-
-			min_seq[type]++;
+		min_seq[type] = lruvec_populated_min_seq(lruvec, type, seq + 1);
+		if (min_seq[type] > lrugen->min_seq[type])
 			seq_inc_flag = true;
-		}
-next:
-		;
 	}
 
 	/*
@@ -4027,8 +4042,6 @@ static void try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
 
 	/* see the comment on lru_gen_folio */
 	if (swappiness && swappiness <= MAX_SWAPPINESS) {
-		unsigned long seq = lrugen->max_seq - MIN_NR_GENS;
-
 		if (min_seq[LRU_GEN_ANON] > seq && min_seq[LRU_GEN_FILE] < seq)
 			min_seq[LRU_GEN_ANON] = seq;
 		else if (min_seq[LRU_GEN_FILE] > seq && min_seq[LRU_GEN_ANON] < seq)
-- 
2.39.3 (Apple Git-146)

