Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616A937E2E5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263474; cv=none; b=DuL8kdzpyLBm8lFsFMK8GiGAdV68oaqfHUkuCDfw+mE1KbKO15jFCJURD6ltvZaCdz9x3xkRjw4Ue2/XbzMjsPxzCjm6sKB2q8MErM0srp6HjJcMv/QVpVJcE+eyGpfdoig7pRoyXna5ZG/U6Zax8EXk0dsqoUVLStoE4avlnvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263474; c=relaxed/simple;
	bh=Mn2Y8LG3wn2vYqfMVBz5mOO/znPZJyPfOjUwJgLPSzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IURviPgZYngry3h0f84eWYWbOw25rN9ii0+FzQ5PE1uHl0XHrXjGTbMAMfcpbp03iisZyM2poE4ByPtVIkBBzk6I/wx/3FeGhbE9Sb6jSWguOeRLl7v8UULX+GI3rIH44FRGC9pps87OawucPuU0pTDBFj2h0f74KcrOIrmzwzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Lt9Rizz8; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Lt9Rizz8"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788263467; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=i4x01+8pMMr7AxtHEkb51u5y7+XhfvZZkj342fN2Bd8=;
	b=Lt9Rizz86mkxC5AsMW6sFyutVq1d1Ue2uvC9kl1bSmJzbAUjp+y6SSeVfH21vGs/IFNNY/PEJIMQbhi3QsAs1pVA3tfmR6cUlLGc2D8b0odSpCkJ8TcVongEmEInPiwKXVZOESIwM8K6KsgS7SWaA5PPeXaM1iHua/r01TT7MUE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XA7QMBx_1788263465;
Received: from banye.tbsite.net(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0XA7QMBx_1788263465 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Sep 2026 19:51:06 +0800
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Dave Chinner <david@fromorbit.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Xunlei Pang <xlpang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qinyun Tan <qinyuntan@linux.alibaba.com>
Subject: [PATCH] mm/list_lru: don't copy stale shrinker id from non-memcg-aware shrinkers
Date: Tue,  1 Sep 2026 19:51:04 +0800
Message-ID: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With cgroup.memory=nokmem, shrinker_memcg_alloc() fails with -ENOSYS
for shrinkers without SHRINKER_NONSLAB, and shrinker_alloc() falls
back to a non-memcg-aware shrinker.  On this fallback path,
shrinker->id is never assigned and keeps 0 from kzalloc(), which is a
valid id belonging to whichever memcg-aware shrinker registers first.

__list_lru_init() copies shrinker->id unconditionally, so every
list_lru backed by such a fallback shrinker (thp-deferred_split,
zswap-shrinker, workingset shadow nodes, superblock lrus, ...) ends
up with lru->shrinker_id == 0 instead of -1.

Under nokmem the list_lru collapses to the shared per-node lists, but
__list_lru_add() still calls set_shrinker_bit() against the memcg of
the added object.  Most list_lru users are unaffected because their
objects resolve to a NULL memcg without kmem accounting, but the THP
deferred split queue holds user folios, which are charged regardless
of nokmem.  Since no memcg-aware shrinker can register under nokmem,
shrinker_nr_max stays 0 and every memcg's shrinker_info has
map_nr_max == 0, so the first folio added by khugepaged triggers on
every boot:

  WARNING: mm/shrinker.c:212 at set_shrinker_bit+0x99/0xa0

On systems where a SHRINKER_NONSLAB shrinker (btrfs, xfs) did register
and expand the maps, there is no warning; instead bit 0 is set
spuriously for an unrelated shrinker.

shrinker->id is only meaningful while SHRINKER_MEMCG_AWARE is set,
and all readers inside mm/shrinker.c already check the flag before
using the id.  Make __list_lru_init() do the same and fall back to -1,
so set_shrinker_bit() is never reached with a bogus id.  The stale
shrinker->id itself is left as is; cleaning that up is a separate
topic.

Fixes: 03375203e1da8 ("mm: do not allocate shrinker info with cgroup.memory=nokmem")
Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
---

Verified on a machine booting with cgroup.memory=nokmem and
CONFIG_TRANSPARENT_HUGEPAGE=y: the warning fires once per boot from
khugepaged, disappears when nokmem is removed from the command line,
and no longer triggers with this fix applied and nokmem set.

 mm/list_lru.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/list_lru.c b/mm/list_lru.c
index 36662d02ff963..96d02ea206a88 100644
--- a/mm/list_lru.c
+++ b/mm/list_lru.c
@@ -666,7 +666,12 @@ int __list_lru_init(struct list_lru *lru, bool memcg_aware, struct shrinker *shr
 	int i;
 
 #ifdef CONFIG_MEMCG
-	if (shrinker)
+	/*
+	 * If the shrinker fell back to being non-memcg-aware (e.g. with
+	 * cgroup.memory=nokmem), its id was never assigned and holds a
+	 * stale 0. Don't let set_shrinker_bit() act on it.
+	 */
+	if (shrinker && (shrinker->flags & SHRINKER_MEMCG_AWARE))
 		lru->shrinker_id = shrinker->id;
 	else
 		lru->shrinker_id = -1;
-- 
2.43.7

