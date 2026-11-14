Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686903;
	b=jcIPOynLozW9ABPS+KJUn+ygUBjK77Rbx+OOiruanYurG2uFDKDeYPEzkYsojVZ6qX7F
	 dtdSwogPr3E48NXwNBq9r4/E4kHGl6EYLVNu0BLvZmkZLGsDfrPgcpKfCKbQqKgw5LBcm
	 zSQmltuYLYgxtkUWGOpOfEkZWA8poxSOwQ7P4qmbyxd+9UFQsJ7jwVZnzPIC8Sri+GsGk
	 pWcxdBGAuscGLhXSHsbSJzXaF2UrMOdyTy3qMz3J3O/O7h8d2fgbOZQIrQZokQ2Y+uZN9
	 8JSQG9og/MczwjBqmpDeJsxcRLaky2ut0O4EovnDTKs4+a4GoeVj/yvrrqIMRWROmaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686903;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=a77mtASibmNRpSvCk4qjY5DapLOB/+QPvfDiCbB3EpM=;
	b=N19SKao4ilSU59Xy87B865B2DSSzG7/RUGwSO2Zg1SXoGaLqPOtqJOQYCKXRJtjElNDv
	 BuTrCQJwbOuSUveZBPNLpiyXyNOmVBwsEDOngBMot+g86RatMZvi/bOp7UsyyRJgk+6my
	 l5SfVkXyTu4dkBwc3/3+xiuyyT5KE7ApAHLk3PG1c5jbcgAyDBgy6unFIDJMy/nWPkucF
	 X/zZBgazl58MJYmQLIJ6VYtrbyvVyk46vNYSheimSE9mfXSFjEHVt9RRgVKU8ZrVsUTDB
	 YkHNcOKOZB2b/ysEEPw7SxRa/OVzW0kIUxEIUF00YgXlS9srrJF7nnroPaT8GfLndIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXIC0n4w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0865606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXIC0n4w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C381F000C8;
	Sat, 14 Nov 2026 20:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794686903;
	bh=a77mtASibmNRpSvCk4qjY5DapLOB/+QPvfDiCbB3EpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oXIC0n4wRCmwWSji2V7+PkU/4qChsSTxJGYkEYumI2UuNruxVrDLQzKwu6DI/KVmc
	 HPb6/z3+R+LZb1Tr4vsr/F1P4uMC9BmXWbHfXycYIizCmh5F3oGCqEQVN4EeLorPCA
	 uhh1z8cJ8V/nAsgTTZxrZkCkFJAzUg80oJt2nM0IcuRX7ANX7N6c9VSGBg818tT8iK
	 /Vlr9qccXonbn9Bies8t5lXD3HhSza0gFqFklX6WE0iA1Jd8G9gbgGZkb1GfR0kR6K
	 LtEvCo27NzK2fsBBJvnCWHF+U2bulsQz8Hc43Sx3cymTHJmgG3iSilO4iC1i+NTAVt
	 l6ImXlUC5bB2Q==
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
Subject: [PATCH v9 02/16] mm/mglru: extract lruvec_populated_min_seq() helper
Date: Sun, 15 Nov 2026 04:07:49 +0800
Message-Id: <20261114200803.23129-3-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261114200803.23129-1-baohua@kernel.org>
References: <20261114200803.23129-1-baohua@kernel.org>
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
index 400f87fc51e1..ae3e13b1fb27 100644
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
+	while (min_seq < max_seq) {
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

