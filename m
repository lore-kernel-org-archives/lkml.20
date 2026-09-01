Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692C646D541
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788305073; cv=none; b=Me5JiufaqS7sJAASOm/JozsgOPkLyI+3s27TqxAiENhcM/toIr+QPj6ybvA/bw7aCc7TYvL5hod0PZsuDlFUMnjln/vYDO44eK3QC2VlW0Y0dqUd39Z4nmWwpr6x5LofD7Kh3+v/PBOSx5v1OtRH5tLeUr6p6O3BB5slMUWNEzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788305073; c=relaxed/simple;
	bh=pBddXw9kLtL3WD5gu4P1b2Rk7upxu2Ms30pxfE4ZHgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aCsYs1zQ7ec6YcMemxA2Y3pHCd5wdQSuuL/zPXw8Cc40D+80FBj1Zo11CgcnhSr8AsbUkX1M7LX6aUzs3Mu0JLj2zDifAVRSKxcHNn2z+ZunSfwkr3QMM51s+F7wKBG173JXSb+o94mT5DKlIkg1Hh3G8vrug+PenKtghOz6/1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONNpfGFz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONNpfGFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C771F00A3A;
	Tue,  1 Sep 2026 23:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788305072;
	bh=Z0X7OvF6yz6PTqxJmY35ICxOJAuUHhLkK951+WZcIng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ONNpfGFzn7/T6wh+dIHvukw5pagye5MuBBVr0HN8zSArlZBW3NpZi89/Q2VTjz1Xu
	 efTyofK06CMYGUYqzgpM0x/rEsRcvbNkiUNW/IQNcP+0c/Orb1+sTq2p/df5AntkE6
	 YLaw1PIsQYaYlRqL0xHMxajJPelQ+WPNigtM/EEqAxb2iI108K6c+IJYbjJQy1pE1B
	 QvdoXEq62EqTOXIcMaXdBX0stgWpI5ayA8z2IVg0feyRkgpzHWk1mTSYjgKILTg0HR
	 B/TxgSKyq9pF7pZN2PM77xw3kMhEkbK2BHHpNw+Phfd9xafJWR70FE47gVJhALnIMb
	 Dn1MS+JSVqdbQ==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v3 1/7] mm/mglru: separate folio generation update from LRU accounting
Date: Wed,  2 Sep 2026 07:24:15 +0800
Message-Id: <20260901232421.40157-2-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260901232421.40157-1-baohua@kernel.org>
References: <20260901232421.40157-1-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

folio_inc_gen() currently updates both the folio's generation and the
LRU size accounting. This makes it difficult to batch the LRU size updates
when moving multiple folios.

Extract the generation update into __folio_inc_gen(), which only updates
the folio's generation and reports whether the generation was actually
increased. Keep folio_inc_gen() as the wrapper that performs the LRU size
accounting when needed.

This separates the per-folio generation update from LRU accounting and
allows the latter to be batched by subsequent changes.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Reviewed-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/vmscan.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index f11491ee9ed5..54bce2f608ef 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3295,21 +3295,21 @@ static int folio_update_gen(struct folio *folio, int gen, const vma_flags_t *vma
 	return ((old_flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
 }
 
-/* protect pages accessed multiple times through file descriptors */
-static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio)
+static int __folio_inc_gen(struct folio *folio, int old_gen, bool *increased)
 {
-	int type = folio_is_file_lru(folio);
-	struct lru_gen_folio *lrugen = &lruvec->lrugen;
-	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
 	unsigned long new_flags, old_flags = READ_ONCE(folio->flags.f);
+	int new_gen;
 
 	VM_WARN_ON_ONCE_FOLIO(!(old_flags & LRU_GEN_MASK), folio);
 
 	do {
 		new_gen = ((old_flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
 		/* folio_update_gen() has promoted this page? */
-		if (new_gen >= 0 && new_gen != old_gen)
+		if (new_gen >= 0 && new_gen != old_gen) {
+			if (increased)
+				*increased = false;
 			return new_gen;
+		}
 
 		new_gen = (old_gen + 1) % MAX_NR_GENS;
 
@@ -3317,8 +3317,22 @@ static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio)
 		new_flags |= (new_gen + 1UL) << LRU_GEN_PGOFF;
 	} while (!try_cmpxchg(&folio->flags.f, &old_flags, new_flags));
 
-	lru_gen_update_size(lruvec, folio, old_gen, new_gen);
+	if (increased)
+		*increased = true;
+	return new_gen;
+}
+
+/* protect pages accessed multiple times through file descriptors */
+static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio)
+{
+	int type = folio_is_file_lru(folio);
+	struct lru_gen_folio *lrugen = &lruvec->lrugen;
+	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
+	bool gen_increased;
 
+	new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);
+	if (gen_increased)
+		lru_gen_update_size(lruvec, folio, old_gen, new_gen);
 	return new_gen;
 }
 
-- 
2.34.1

