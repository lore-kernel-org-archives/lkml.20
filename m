Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D141A6807
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 02:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791339211; cv=none; b=Rq9t6+LqQBEuLgWJsWohtVCUiab4lMdFeXVrsQIhUca3z/+LorpBo9zGMv1pSET3DweFN0YwnS/v2ItetottzRu6n+VyR69ehdkn/4S/ob2MOuj2Z/NK6Nm0Ggf2VvowDzwt5TUlxzpFqZnFPavTsnFHrILNNddJwxHAfafTKkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791339211; c=relaxed/simple;
	bh=bHhALlTCKYC2vOcM2e8c+qT1/Q1dkG21dzXpSanzS38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OpCpBE1bF0gz0/UnsmmuXaT/2/1/I1WuUj9tnGC7r1jQ1JsTi0KOjJUC/sOz7Sb+ZAdZ+gHjdHf1B79vBXsZXbeSAgRGoI/ZPGsjfKbdTAjnFDh10kMyoP/f+3/ENBE2Vj9V5xNqamPi/J2JTzMqK5Y6g3jW3PEXjgklubLCCI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=kTfrxLUB; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="kTfrxLUB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=nKyw0L1oOLHL45ZtO7jJ4XCZaQCX2P7sIOr8B24Tems=; b=kTfrxL
	UBDwBQEGO9S2TARCSZdV8q9uIuyj2IS1GEUGdjr07LqQ0eZgV2BS/OWiuy/ufx7+njRJ6xCjICpmh
	8EekvkoHdgHFThrKZlLCLsY48YqvfwwC2l67s2Uhc98fsoZX+5bHvbPFxzPHyxGZjSNR8CvuTtj17
	HdB+bfL7jKFXmWJA+UmyHvvs/SZgN18U2kL1AXqLmw4vForEmXmzAWtDmxefEfeTKfBdEPOR9pj3G
	3Ad52lvUJf1MZajtfdgq/OOue/7Xr3A2A/wr9urZ94a140ELUg0iDheK5uk4VeIavOc4zxhrt7h79
	YrrUEALOnID4Zf0fo6Kou8fjb/KQ==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xEH9N-0000000B2cT-0IZQ;
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
Subject: [RFC PATCH 5/5] mm/page_alloc: claim blocks captured for non-movable use
Date: Tue,  6 Oct 2026 22:12:50 -0400
Message-ID: <20261007021250.1665929-6-riel@surriel.com>
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

compaction_capture() hands any merged block to the compacting task
with no type change, except it refuses a movable block to a
non-movable request below pageblock order. A non-movable request
capturing a whole movable block leaves non-movable content in a
movable-typed block.

Make a non-movable capture claim a movable block: convert it to
the request. A partial block cannot be retyped, so the refusal
below pageblock order stays; reaching the conversion means a
whole block. A movable capture steals: it takes the pages and
leaves the type alone.

Assisted-by: LLM
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/page_alloc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 16d3594d913a0..edb69d8a74c73 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -728,6 +728,9 @@ static inline struct capture_control *task_capc(struct zone *zone)
 		capc->zone == zone ? capc : NULL;
 }
 
+static void change_pageblock_range(struct page *pageblock_page,
+				   int start_order, int migratetype);
+
 static inline bool
 compaction_capture(struct capture_control *capc, struct page *page,
 		   int order, int migratetype)
@@ -751,6 +754,19 @@ compaction_capture(struct capture_control *capc, struct page *page,
 	    capc->migratetype != MIGRATE_MOVABLE)
 		return false;
 
+	/*
+	 * A non-movable capture claims a movable block: convert it to
+	 * the request. A movable capture steals: take the pages and
+	 * leave the type alone. Partial movable blocks returned above,
+	 * so reaching here means a whole block.
+	 */
+	if (capc->migratetype != MIGRATE_MOVABLE &&
+	    migratetype == MIGRATE_MOVABLE) {
+		change_pageblock_range(page, order, capc->migratetype);
+		/* Converted whole, so no fragmentation to report below. */
+		migratetype = capc->migratetype;
+	}
+
 	if (migratetype != capc->migratetype)
 		trace_mm_page_alloc_extfrag(page, capc->order, order,
 					    capc->migratetype, migratetype);
-- 
2.53.0-Meta

