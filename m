Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463765;
	b=iVyV/1z0StVMxuitWJUV/Kbdfwg1lDpr1PGhBZwOJPGj56saumJAcQsY6FqzOZzJVHFN
	 v02YWr06S29huhcahLnNJcM9KrXVVHUFi6BPCe8m1SKN0Syb5Eg5GjWxeXESuJbgfRbIK
	 J6HQwJjMcFtY0lsc7ewG5WnYcpijBDX5Pb03D4yzKv4xW8bNoNqwTEzNWi6Fo1717Bz02
	 uEEgq20fE5VcUmf/ZKn+a+13RbFr6sO0OJGcMjaYHRpvw5NfxBkj5uWGpI2a4v2xvXmrb
	 PkV1TiOSJ2vYe8eMzsKdUctX5rRU/t6+xApvc2xedsGdx1ykkxWsQTY9iuJvTEXZzPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463765;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=xkGhnhY44K2J1OBQ/8hTDyBxqBV4vaK4wkgxii7kUUo=;
	b=FjSVFK6HBvmUr4JsNjDKD+gQl6y4nP60E4mh5YOUuP2/rEToXmPRgeRhIclYB6ThusPs
	 /YWmA/CArFENZbwvf4KYMHZ+jAHf818T/gIWQObvGLv9/h1XQJDhQD7k+ANxZ++VC5QLj
	 5Ts1pgBiJIGdPuxBwVMPK3NNXapmeE1iUv9aLDRiD3tUjQ0DgKndU2J/s3YTMjnt+Uug8
	 PRwYCJXYhybk4PIkqAYW1NVpNlj2Tu+q7FjpCPnU+wjXcOFbIRbE9NIVUsa3xw2KbR2ig
	 4DwwxesDSx/xECoY6o2YyIQvtgnoOtKD59uWO2rmHOr3JbTHNGRoXzoA5pBATBBVbeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=baB3S6gF;
	arc=none smtp.remote-ip=91.218.175.23
Received: from mta0.migadu.com (out-23.mta0.migadu.com [91.218.175.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87DF606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E87DF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=baB3S6gF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VsTbGfpp4irBeMjTHpzRqpN9dSM7uDhmL47sNU/lgh8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792463761; v=1; x=1793068561;
 b=baB3S6gFMdIWH3TskBvOzxIYK54c7b7kgB9p0vLO6E6qpm5U3l6Q6Z5S2V4Lk8C60PBJDjmz
 xeVuQzpJmWm88LjuDtBmrVjaBUzRSyo5xykOx/Z0ix8Z6mu0bEg4M0hMsbUjDhPH36WCtx0uvA0
 J80nSEuu+E75QhqNty3KgotY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 72d5ed4ea47801f3;
	Tue, 20 Oct 2026 02:36:01 +0000
X-Mizu-Trace-ID: 72d5ed4ea47801f3
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH mm-new] mm/mglru: clarify the generation placement in lru_gen_folio_seq()
Date: Tue, 20 Oct 2026 10:35:48 +0800
Message-Id: <20261020023548.3242028-1-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
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

From: Ridong Chen <chenridong@xiaomi.com>

lru_gen_folio_seq() computes how many generations below max_seq a
folio should be added to, but stores it in a variable named "gen".
Elsewhere in MGLRU "gen" means an index into lrugen->folios[], i.e.
seq % MAX_NR_GENS, so reusing the name for a relative offset is
confusing.

The comment table above the code also no longer matches it. It only
covers the PG_active and the final branch, leaving out the reclaiming
and "can't evict yet" cases, and it lists LRU_REFS_FLAGS as an input
although lru_gen_folio_seq() never looks at it.

Rename the local variable to "age", redraw the table so that each
branch maps to the age and seq it produces, and note that the result
is clamped to min_seq[type].

No functional change.

Assisted-by: LLM
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 include/linux/mm_inline.h | 48 ++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index ab69b9930893..a933d8c14558 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -302,34 +302,50 @@ static inline unsigned long lru_gen_folio_seq(const struct lruvec *lruvec,
 					      const struct folio *folio,
 					      bool reclaiming)
 {
-	int gen;
+	int age;
 	int type = folio_is_file_lru(folio);
 	const struct lru_gen_folio *lrugen = &lruvec->lrugen;
 
 	/*
-	 * +-----------------------------------+-----------------------------------+
-	 * | Accessed through page tables and  | Accessed through file descriptors |
-	 * | promoted by folio_update_gen()    | and protected by folio_inc_gen()  |
-	 * +-----------------------------------+-----------------------------------+
-	 * | PG_active (set while isolated)    |                                   |
-	 * +-----------------+-----------------+-----------------+-----------------+
-	 * |  PG_workingset  |  PG_referenced  |  PG_workingset  |  LRU_REFS_FLAGS |
-	 * +-----------------------------------+-----------------------------------+
-	 * |<---------- MIN_NR_GENS ---------->|                                   |
-	 * |<---------------------------- MAX_NR_GENS ---------------------------->|
+	 *            +-----------------+-----------------+-----------------+-----------------+
+	 * age        |        1        |        2        |        3        |        4        |
+	 *            +-----------------+-----------------+-----------------+-----------------+
+	 * seq        |     max_seq     |    max_seq-1    |    max_seq-2    |    max_seq-3    |
+	 *            +-----------------------------------+-----------------------------------+
+	 *            |<---------- MIN_NR_GENS ---------->|                                   |
+	 *            |<---------------------------- MAX_NR_GENS ---------------------------->|
+	 *            +-----------------------------------+-----------------------------------+
+	 *            | Accessed through page tables and  | Accessed through file descriptors |
+	 *            | promoted by folio_update_gen()    | and protected by folio_inc_gen()  |
+	 *            +-----------------+-----------------+-----------------+-----------------+
+	 * PG_active  |  PG_workingset  | !PG_workingset  |                 |                 |
+	 *            +-----------------+-----------------+-----------------+-----------------+
+	 * reclaiming |                 |                 |                 |     always      |
+	 *            +-----------------+-----------------+-----------------+-----------------+
+	 * can't      |                 |  anon && not in |                 |                 |
+	 * evict yet  |                 |  swapcache, or  |                 |                 |
+	 *            |                 |  PG_reclaim &&  |                 |                 |
+	 *            |                 | dirty/writeback |                 |                 |
+	 *            +-----------------+-----------------+-----------------+-----------------+
+	 * else       |                 |                 |  PG_workingset  | !PG_workingset  |
+	 *            |                 |                 |       or        |       &&        |
+	 *            |                 |                 |  PG_referenced  | !PG_referenced  |
+	 *            +-----------------+-----------------+-----------------+-----------------+
+	 *
+	 * The resulting seq is clamped to min_seq[type].
 	 */
 	if (folio_test_active(folio))
-		gen = MIN_NR_GENS - folio_test_workingset(folio);
+		age = MIN_NR_GENS - folio_test_workingset(folio);
 	else if (reclaiming)
-		gen = MAX_NR_GENS;
+		age = MAX_NR_GENS;
 	else if ((!folio_is_file_lru(folio) && !folio_test_swapcache(folio)) ||
 		 (folio_test_reclaim(folio) &&
 		  (folio_test_dirty(folio) || folio_test_writeback(folio))))
-		gen = MIN_NR_GENS;
+		age = MIN_NR_GENS;
 	else
-		gen = MAX_NR_GENS - (folio_test_workingset(folio) || folio_test_referenced(folio));
+		age = MAX_NR_GENS - (folio_test_workingset(folio) || folio_test_referenced(folio));
 
-	return max(READ_ONCE(lrugen->max_seq) - gen + 1, READ_ONCE(lrugen->min_seq[type]));
+	return max(READ_ONCE(lrugen->max_seq) - age + 1, READ_ONCE(lrugen->min_seq[type]));
 }
 
 static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *folio, bool reclaiming)
-- 
2.34.1

