Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A3D37F006
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874462; cv=none; b=uljW3WQePXBVhNH+JzCdUtDH056nAianNHja94HxjGad+53MgUFMMoXit4Ce5muTqvzrNywrlIkhP+ne8d8329zNnqNE7hhDWouKv78b+vRQL4kLfmiBIVVgZy+h2cRe5Vs+62luw4/KUgfuzTKDyu6uFTcUUcUyvw9E9ga9eu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874462; c=relaxed/simple;
	bh=Hxje9xumeitE6b5gN/GluFPkClYPXrs+5wmzMTCtK84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W97/s//niU+YIi9rzGBldOSWwzb4VAPz+d4L3VI0Qu5NX6jAxsr2761NdqgSqsG6C9/XcONssc9blYUDTe2wCJTqgij0VT38BU7PlKHObM+T2ysjvw6sdd1OTmUo78LCg7v16QXzDsnTU9JlGRJfgAnHYDqKob9Nb72ClDzp5Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vjf35Uvk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vjf35Uvk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAA61F00A3D;
	Thu, 27 Aug 2026 23:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787874461;
	bh=qItSZf2IMrcadC3doUN+qm71ZNZWkB8tfnyRrPNJHJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vjf35UvktgdHiWQIABTxMqaWim3kr4E58NO+7gveoHzr9gSUuODU+e/oPsz6xDDHU
	 d6molKBbiRPKf84hwQk5MKnfAuzKDUvOceSBI8UxSANtm2F+olNrsbn5M7PiwmhDF4
	 1kKleza67ZT3+22y7hBv665q2bHi7AxrnTMwcJ4denIPhChL6ThTf0gCjWYRftQ07V
	 6neNqlatpZ5vqdsoIPzu+ElSTTYbCqaIJy0yQceQLtwjMRP4rUSfNMSOMd6BiyFW1r
	 fWy8QvSUkhZ5kR2k0z0bhGFCEUppN14Hvwa8EoskbbyiCtYlmsixo0qaEdRzsuzG2M
	 f8+Xe0GMMdlrA==
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
Subject: [PATCH v2 7/7] mm/mglru: batch move folios to the second-oldest gen's LRU
Date: Fri, 28 Aug 2026 07:47:04 +0800
Message-Id: <20260827234704.63163-8-baohua@kernel.org>
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

Detect folios that need to move from the oldest generation to
the second-oldest generation, and batch-move them together.
This can significantly reduce the sys time of inc_min_seq(),
especially when the other type is significantly behind the
preferred type.

Assisted-by: gemini:gemini-3.6-flash
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Baoquan He <baoquan.he@linux.dev>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmscan.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 17524e96fe64..2b6f3f05ce60 100644
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
@@ -3974,7 +3989,7 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 			new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);
 			if (gen_increased) {
 				delta += nr_pages;
-				list_move_tail(&folio->lru, &lrugen->folios[new_gen][type][zone]);
+				batch_end = &folio->lru;
 
 				/* don't count the workingset being lazily promoted */
 				if (refs + workingset != BIT(LRU_REFS_WIDTH) + 1) {
@@ -3984,11 +3999,14 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
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

