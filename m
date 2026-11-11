Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439583;
	b=Md+UPqkPJta0JKjz8WZZnBkgjeSnwoD7gfmgeHaKXGn44JS4kY+A67N/QzxqIWdm2Zwk
	 mqAm9rXWQLlCrGmE60oeoujjlI2HwILdPQN50afjrQAcM30ltfAQgWh3QjvOYggZMcfq4
	 JL32soJG+p7zMoK6TcAczO+7z/824BMSJh7wpX2zefSpg5mLVhADolKLZdECe0N+w9Cl6
	 3Fa1kVhmNrqeWfdXWqoKarCur7btguRg3GiQ9oe44lmZP/zxjSOIEwt9klRI3xCB1qCjt
	 lrXp7CDEkfZ8dC1fH+B6DXpYaE87764gdM/wjO6kzHP6wTOaLuhBockdlP+Kcaf/G9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439583;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=swxfRysumHKmdMmk09THVTvxU/XqkcT5rR3pmvabELc=;
	b=Bn7PW7Qa9HYgw8b97EKppZEY053bobIRt2xLRMOlVyQBMAY3L+cVxOnJqEFaF5ywrGsD
	 3KqPUYgZ0wSxlpkP6Kh7j5Cm/Ufo+CdgO8i8x56qUgMLobumxwDZ7JuU3c+idOttlyqKH
	 iN9HJ9jyBphrHYg1ZvButQ1lUL2uziVIllZhqf8IZn4Wyl8PjAhGHoq0nuf7vB23Ghq6f
	 iAge/aW0v8mnTvSAFJF7QF680rM92aksR9mGs1g1gWNPVABYKKea7CicGJy9zXRzyn74m
	 5KIFwZhyi+zGfvzTAXiHDAyF/1nkqNE6yUpusxODUY78T4R5vxX5YnWde1wNnE+BcfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QrrK/sCC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1541B606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrrK/sCC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBC91F00A0A;
	Wed, 11 Nov 2026 23:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794439582;
	bh=swxfRysumHKmdMmk09THVTvxU/XqkcT5rR3pmvabELc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QrrK/sCCLjOIgmdgePgUyqMNRU1+qQAirKV+BoaR4zRuyKe2T4loL8LfpRU+lTwt8
	 lxBdSpuag6vPrgQUL6L9tinExL7Y4E+OY9E6jm/t9hfir7LUmLPviG1itn049cvys+
	 zIOZNd29LRWfxH6hFMGDx3eKzaS01Hi57sx5UyEeb/I5XxUCUr4TlWlBZQJkTCvYvm
	 XGXToKpzEHSZbmD7QRwpR1S7EGUKwJjmPONr+1U261ypvoM0xEvCTQlWuaEFycUlTW
	 P6r+0yalyvLYqkWLWX4Kw7I2hohrjIDq0FhyDf6wcXD/aOuJXYMm4FDNx5nOMqNd6H
	 XtKiqyEGsoEBQ==
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
Subject: [PATCH v7 02/16] mm/mglru: extract lruvec_populated_min_seq() helper
Date: Thu, 12 Nov 2026 07:25:49 +0800
Message-Id: <20261111232603.9934-3-baohua@kernel.org>
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
 mm/vmscan.c | 43 +++++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index acc4efccda2f..4ac80968e634 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3991,30 +3991,45 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
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
-- 
2.34.1

