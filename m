Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD22B37F006
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874458; cv=none; b=dFwFEUe3KeLo194yDVmYcvaSDcwI9TcqAzqWOWqf0WhfFrYlp7NK8wnNp+2i4dGfx14mTU72iA7kAUwGyu+7wkpSuNIWFIScYlpPVXHGl1dpX9q77umh2tUABU/eMKmTkXSt5zsjSmz8wGDPM8PyhPFcEk2S2N8/Ihz7n0Qj2xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874458; c=relaxed/simple;
	bh=+wQDlABALUKVLcpowu9fKE0POTtsYkOHESyPGipBNW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cLo/WqZ2gL/8l+LkEHDv0/ukq1aj5s/gQBqAHzhIU5Zly54FKIYMWZTKH+xx8krTYm5ox1FNwhVEJoeZf4NHnQIo0mXcAwtio1C6K63rszaVjsIM5JEDiCFxcr3rIbm8oMiGh60kjQEgyJX1XYijpmoKOs0axACpmmURln/pt4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=msIgs9KZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="msIgs9KZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0D71F000E9;
	Thu, 27 Aug 2026 23:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787874457;
	bh=yvhE1//hn5gBVVZ/BGXLx4fVEuO6Hu7ZhZmDmlWmdWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=msIgs9KZMVZ+2npfWCXzmLUEkiRpmyAtOsS0AFJ0OwwqPCU2r+7MrirFQ2cERxpsH
	 Pqao3cc4b1bs+wT4OWt7kD/joBx5pcSl7Dt3LzWEpeL9CU7zdeU6qarkcdRyOsL2m2
	 tT9wdg5lsmQ/feBqyFEJa0P0tvJ9oP5LOqjV+GTuwr+lIFo7IN6wDsimfwAofQz4qw
	 rXciMXo/qmNK6NMDlvkaIBB2siFBlctjCrRSE/vYS3ovx6ho+P4c8Mbi8ew/KIUsns
	 swIwVNoJuh6G+XqypKeRwSd8Sk2VnJoP5bPVK6VEXMYiK77ceLCsQ6WX+EZzqOOhps
	 /DNrpEtCgXLXQ==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	lianux.mm@gmail.com
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
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
Subject: [PATCH v2 6/7] mm/mglru: move folios from oldest gen to second-oldest gen from head to tail
Date: Fri, 28 Aug 2026 07:47:03 +0800
Message-Id: <20260827234704.63163-7-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260827234704.63163-1-baohua@kernel.org>
References: <20260827234704.63163-1-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For reclamation, it makes sense to reclaim folios from tail to
head, as folios near the head are relatively hot. However, when
moving folios from the oldest generation to the second-oldest
generation, using the tail-to-head order would effectively cause
a cold/hot inversion.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Baoquan He <baoquan.he@linux.dev>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmscan.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 81f95a968447..17524e96fe64 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -192,11 +192,27 @@ static inline void prefetchw_prev_lru_folio(struct folio *folio,
 		prefetchw(&prev->flags);
 	}
 }
+
+static inline void prefetchw_next_lru_folio(struct folio *folio,
+		struct list_head *base)
+{
+	if (folio->lru.next != base) {
+		struct folio *next;
+
+		next = list_entry(folio->lru.next, struct folio, lru);
+		prefetchw(&next->flags);
+	}
+}
 #else
 static inline void prefetchw_prev_lru_folio(struct folio *folio,
 		struct list_head *base)
 {
 }
+
+static inline void prefetchw_next_lru_folio(struct folio *folio,
+		struct list_head *base)
+{
+}
 #endif
 
 /*
@@ -3938,10 +3954,11 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 	/* prevent cold/hot inversion if the type is evictable */
 	for (zone = 0; zone < MAX_NR_ZONES; zone++) {
 		struct list_head *head = &lrugen->folios[old_gen][type][zone];
+		struct list_head *pos = head->next;
 		long delta = 0;
 
-		while (!list_empty(head)) {
-			struct folio *folio = lru_to_folio(head);
+		while (pos != head) {
+			struct folio *folio = list_entry(pos, struct folio, lru);
 			long nr_pages = folio_nr_pages(folio);
 			int refs = folio_lru_refs(folio);
 			bool workingset = folio_test_workingset(folio);
@@ -3952,6 +3969,8 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 			VM_WARN_ON_ONCE_FOLIO(folio_is_file_lru(folio) != type, folio);
 			VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) != zone, folio);
 
+			prefetchw_next_lru_folio(folio, head);
+			pos = pos->next;
 			new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);
 			if (gen_increased) {
 				delta += nr_pages;
-- 
2.34.1

