Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB069327C13
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 02:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791339212; cv=none; b=JbIY6EZt1k87DByiDWxvqh1vWylEVsn0vykaYKtYQr9Q8CRLHUDbyWpKRlm+nmrV3HWEWDo5v5x9hp02af0bHuw1q8xGeHQjzYF1VG9nKoCkPjNpvNhL7VBrV+iXSFwJnForPp11PYCuGPsdKjMQSU75cz3Mq3iXDmzIFR+j6nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791339212; c=relaxed/simple;
	bh=Pu+Lv6s6Et7pTw2TuYp8EJ3mLuLRHtRylvCfwrNQ23g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLpvjkPp89qRwMHjJj84ZLZhu36woBepIJjpiPzp0Zz5FuOhzUWLKJyw8PgFOWeTl9yFllpxV+W8an+yXqqNercLD7TYk7azgxh7sPjZFjbUWnpl1oxbRSL/LuV2HDE3iEOv+SUNGa/NxKEvDt9FAKWRH+2w5pRRI4+Vfc1i/yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=IslIgaQs; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="IslIgaQs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=7tBfzHXIi89MaBvjTTf42y7BMLPv9LoC3Ff1kliJK8g=; b=IslIga
	Qs+odbzFKPcR0fw6DynpsbDDgD53St9fs6UBBaCmucilpEpIZ1ak/9mYAUPXiqcbbXCBLYZcnpm6Z
	j8kpvio7JYY+avHxEfTdRHCxtkGtBFi4gj4UOd6d2PAqR9drKptzTfnAiJGKiaXdPFckOHPivTAEJ
	hstKxOT41kcQFEd765WC7rrgpX3YAUyTnZ/ab+BQxpWB+s5KrJkjDI6uda3/xxi05d+29qI2qydEl
	eZAOBSGuehmyiujY+FhL5D9ZIC8DrqQj9xKC89DOiMFsTCVxb29tgGkSHFtATvkmbZX7Bt3jvGBs6
	H6qVaIdS+m4kT7h+Ao179RopBJvA==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xEH9N-0000000B2cT-0AnC;
	Wed, 07 Oct 2026 02:12:57 +0000
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH 4/5] mm/page_alloc: skip movable blocks during non-movable steals
Date: Tue,  6 Oct 2026 22:12:49 -0400
Message-ID: <20261007021250.1665929-5-riel@surriel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007021250.1665929-1-riel@surriel.com>
References: <20261007021250.1665929-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__rmqueue_steal() hands a non-movable allocation pages from a
movable pageblock and leaves the block's type alone. Those pages
can never migrate, so the block reads movable to compaction while
holding content compaction cannot move. On a 3 GB guest running
ls -lR / and a 2.4 GB block device read against a fragmenter, a
temporary counter found 2654, 5341 and 5272 such allocations in
three boots.

__rmqueue_claim() runs first and would convert the block, but
rmqueue_bulk() remembers the mode across its batch. Prevent
those allocations from placing non-movable pages inside
movable pageblocks by refusing __rmqueue_steal() for non-movable
allocations in movable pageblocks.

Movable is last in fallbacks[] for both non-movable types, so
only a larger order is left to try; failing that, the steal
returns NULL and the allocation will loop around to a claim,
another zone, or reclaim.

Keep the steal where mobility grouping is disabled, or where
the block straddles a zone edge. A block that straddles zones
cannot be claimed, because the allocator only holds the lock
for one zone, which leaves stealing as the alloc path there.

Movable allocations can steal, because kcompactd can always
move those pages out of non-movable blocks later.

Over three boots allocstall_normal runs 48 to 129 against 32 to
134 on the base, and compact_stall 324 to 415 against 288 to 387.
Neither direct reclaim nor compaction stalls rise beyond
run-to-run spread.

Assisted-by: LLM
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/page_alloc.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 9f1520506ae1d..16d3594d913a0 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2423,8 +2423,10 @@ __rmqueue_claim(struct zone *zone, int order, int start_migratetype,
 }
 
 /*
- * Try to steal a single page from some fallback migratetype. Leave the rest of
- * the block as its current migratetype, potentially causing fragmentation.
+ * Try to steal one page from a fallback type, leaving the rest of the block
+ * unchanged and possibly fragmented. A non-movable allocation must not steal
+ * from a movable block: without converting its type, the steal would leave
+ * non-movable content under a movable type.
  */
 static __always_inline struct page *
 __rmqueue_steal(struct zone *zone, int order, int start_migratetype)
@@ -2444,6 +2446,19 @@ __rmqueue_steal(struct zone *zone, int order, int start_migratetype)
 			continue;
 
 		page = get_page_from_free_area(area, fallback_mt);
+
+		/*
+		 * Do not allow non-movable allocations in movable
+		 * pageblocks; that could break compaction.
+		 * Non-movable allocations should claim pageblocks, instead.
+		 */
+		if (!is_migrate_movable(start_migratetype) &&
+		    is_migrate_movable(fallback_mt) &&
+		    !page_group_by_mobility_disabled &&
+		    zone_spans_pageblock(zone, page_to_pfn(page))) {
+			continue;
+		}
+
 		page_del_and_expand(zone, page, order, current_order, fallback_mt);
 		trace_mm_page_alloc_extfrag(page, order, current_order,
 					    start_migratetype, fallback_mt);
-- 
2.53.0-Meta

