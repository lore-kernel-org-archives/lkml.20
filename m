Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB2330C617
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788305099; cv=none; b=iUKkrbK1v6RipKAK9iOnGKkooMqJsKlboRIKHDap5iz4C0Erglbk94gsZJ13wNgLFOE6dAgMlWCAW37jwBmAIg6XOF46V3Vdmfdr3K15RLOQdV4AxpYQ9hu0ohNx4BErIjiqmhq2/hmZyHsN8uKFi+JWmKLdO7pxVl6ZuZrQBDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788305099; c=relaxed/simple;
	bh=5ClfFsrwU1Rz8dszqqRa6GmGLdKTuqyTjhmr7GJo+Tw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D6COZiJxaMLzEi8jh+PA5m6R6XutiNnwzO7pT9WRYU+7PV4KeEgG79taxIIspjYQ8SttbenZWIzfj0Xu0hYZhqg2+L3oVh1fmqrbse0q3GqgQdGNwmQdQKqHGKy0NAuBYllwXOwo4VRXQJpsd9TOAPs2IQEqVcdxB2pOHR7U1tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgcS4yZ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgcS4yZ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E0D1F000E9;
	Tue,  1 Sep 2026 23:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788305097;
	bh=jk2RFe/XVKJiusQmuo8ChyovasaBl76wwu4zIL3Vsv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UgcS4yZ06pssXbFHHgG3+Ba+Bbr3x3lwd8ymNYfhY8aNnW+fzhwjTE19IIdLf3Sbt
	 /m4VP+4uYyt8LOV1zRCYv/cYeVi4Vek0sUaMdYHVc2IlCjkRp3vS1Cjgyau25mxUY8
	 bwh7uq2MFhTrAQR+r+Zj0aO6vgdKbxMPBMc3qERLkgpyUZJytfp07A4i95Il+ODhqe
	 CM3yE2H6QZVkEGDb25z8NtTRBm9YdvWbnecC2zBCWXX7LzNZtlXn+71xRLFJPMIs1g
	 9RK51c7UNMO8stCGfu1jVeMzO9TY8zHr4C1miE8AZT/dVutp1osI9/cTZheaIrSSrj
	 tbhlffqX8dzVw==
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
Subject: [PATCH v3 7/7] mm/mglru: batch move folios to the second-oldest gen's LRU
Date: Wed,  2 Sep 2026 07:24:21 +0800
Message-Id: <20260901232421.40157-8-baohua@kernel.org>
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

Detect folios that need to move from the oldest generation to
the second-oldest generation, and batch-move them together.
This can significantly reduce the sys time of inc_min_seq(),
especially when the other type is significantly behind the
preferred type.

Assisted-by: gemini:gemini-3.6-flash
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Baoquan He <baoquan.he@linux.dev>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Reviewed-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/vmscan.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 76dfa9575852..79defbb44c6e 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3931,6 +3931,19 @@ static void clear_mm_walk(void)
 		kfree(walk);
 }
 
+static inline void flush_lru_batch(struct list_head *head, struct list_head **batch_end,
+				   struct list_head *dst)
+{
+	LIST_HEAD(movable);
+
+	if (!*batch_end)
+		return;
+
+	list_cut_position(&movable, head, *batch_end);
+	list_splice_tail_init(&movable, dst);
+	*batch_end = NULL;
+}
+
 static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 {
 	int zone;
@@ -3953,8 +3966,10 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 			lru_gen_is_active(lruvec, target_gen));
 	/* prevent cold/hot inversion if the type is evictable */
 	for (zone = 0; zone < MAX_NR_ZONES; zone++) {
+		struct list_head *target_list = &lrugen->folios[target_gen][type][zone];
 		struct list_head *head = &lrugen->folios[old_gen][type][zone];
 		struct list_head *pos = head->next;
+		struct list_head *batch_end = NULL;
 		long delta = 0;
 
 		while (pos != head) {
@@ -3979,7 +3994,7 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 			 */
 			if (gen_increased) {
 				delta += nr_pages;
-				list_move_tail(&folio->lru, &lrugen->folios[new_gen][type][zone]);
+				batch_end = &folio->lru;
 
 				/* don't count the workingset being lazily promoted */
 				if (refs + workingset != BIT(LRU_REFS_WIDTH) + 1) {
@@ -3989,11 +4004,14 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 						   lrugen->protected[hist][type][tier] + nr_pages);
 				}
 			} else {
+				flush_lru_batch(head, &batch_end, target_list);
 				list_move(&folio->lru, &lrugen->folios[new_gen][type][zone]);
 			}
 			if (!--remaining)
 				break;
 		}
+		flush_lru_batch(head, &batch_end, target_list);
+
 		WRITE_ONCE(lrugen->nr_pages[old_gen][type][zone],
 			   lrugen->nr_pages[old_gen][type][zone] - delta);
 		WRITE_ONCE(lrugen->nr_pages[target_gen][type][zone],
-- 
2.34.1

