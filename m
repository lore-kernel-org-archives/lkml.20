Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55ED397692
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908690; cv=none; b=Ks8Bpo4fSvS1obwmUo0n6SLji78TAsq1ACDkF/SwRL9iQMYiddXzk7sRZvrZNL+38id8rSHTAUPG65X/zIV933KvtmpBhx+H44gKyg1wYpYWTIn40hvcENiRdARqxxP9Ba+lI4IjO+qdeNEREaRQgeTXpgFo6G0IL1M/p58fQNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908690; c=relaxed/simple;
	bh=LzNLsUOw5eYBsVgYAUV0RPvY/OPvLva9xUTPUw3M3rA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mBITi1ZeSkEguE6rocfPflT9A2PN052dMOmD48tz99NoHl7bxmBKW4T1kOrrM8y/FoW8Lhw9GIaj3mp2Lhf2ZqwxZWfJAveAvM3Xw6wbjj38wu1DRjnPWylci4zTDPQaHwWlc2d8dK+/zx653JQkByCKbqHV5kWPAfCdwo0o6jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V2oxIeTd; arc=none smtp.client-ip=91.218.175.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V2oxIeTd"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LzNLsUOw5eYBsVgYAUV0RPvY/OPvLva9xUTPUw3M3rA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787908682; v=1; x=1788513482;
 b=V2oxIeTdgWG7J7VsdjgRJGwVb27Rzgt5fagHIxpbhTTK3NIMGHWKrS/NeVBMNn8NvKkDfZy4
 OblkCobz6C+VGg+T/0YcIR3F41nWs/2tjnV5jbHc7okAMD9F4bdPzYMlq6EHNvDFSKIS1LDEUaz
 +aTiihN+3cyL7U73ddZTiFAU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3ee0ae8b69a5b7fd;
	Fri, 28 Aug 2026 09:18:02 +0000
X-Mizu-Trace-ID: 3ee0ae8b69a5b7fd
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: Ye Liu <liuye@kylinos.cn>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mm: vmalloc: fix vmap_purge_lock livelock under memory pressure
Date: Fri, 28 Aug 2026 17:17:53 +0800
Message-Id: <20260828091753.299295-1-ye.liu@linux.dev>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ye Liu <liuye@kylinos.cn>

The vmap_purge_lock mutex can be held for an extended period by
__purge_vmap_area_lazy() which calls flush_work() to wait for
purge_vmap_node workers while holding the lock.  Under memory
pressure, those workers may themselves be blocked in direct
reclaim trying to acquire the same lock via the
vmap_node_shrink_scan() shrinker callback, creating a circular
dependency that deadlocks the entire system.

Two places acquire vmap_purge_lock from paths that can be reached
during direct reclaim:

1. vmap_node_shrink_scan(): replace blocking guard(mutex) with
   mutex_trylock().  This is a shrinker that only decays the vmap
   pool and returns SHRINK_STOP without freeing memory; skipping a
   decay cycle when the lock is contended is harmless and prevents
   tasks from piling up on the mutex in the direct reclaim path.

2. reclaim_and_purge_vmap_areas(): replace mutex_lock() with
   mutex_trylock().  This is called from the vmalloc allocation
   overflow path; if trylock fails, another thread is already
   purging and the allocator's retry will find freed space.  The
   notifier chain provides a fallback if the retry still fails.

Both trylock failures break the circular dependency: the lock
holder's flush_work() can complete because workers are no longer
blocked on vmap_purge_lock in the direct reclaim path.

Fixes: 7679ba6b36db ("mm: vmalloc: add a shrinker to drain vmap pools")
Suggested-by: Uladzislau Rezki <urezki@gmail.com>
Suggested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
v2:
 - Use mutex_trylock instead of mutex_lock to acquire vmap_purge_lock,
   as suggested by Uladzislau Rezki and Dev Jain.
 - Link: https://lore.kernel.org/all/20260824095020.1225189-1-ye.liu@linux.dev/
 mm/vmalloc.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bea9f76ed7e7..e5c68b795a3e 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2440,7 +2440,8 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
 static void reclaim_and_purge_vmap_areas(void)
 
 {
-	mutex_lock(&vmap_purge_lock);
+	if (!mutex_trylock(&vmap_purge_lock))
+		return;
 	purge_fragmented_blocks_allcpus();
 	__purge_vmap_area_lazy(ULONG_MAX, 0, true);
 	mutex_unlock(&vmap_purge_lock);
@@ -5519,10 +5520,20 @@ vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 {
 	struct vmap_node *vn;
 
-	guard(mutex)(&vmap_purge_lock);
+	/*
+	 * This shrinker is invoked from direct reclaim where memory
+	 * pressure is already high.  Blocking on vmap_purge_lock here
+	 * can deadlock the system: the lock holder may be blocked in
+	 * flush_work() waiting for a worker that is stuck in this same
+	 * reclaim path trying to acquire the same lock.  Use trylock
+	 * to avoid this; skipping a pool decay cycle is harmless.
+	 */
+	if (!mutex_trylock(&vmap_purge_lock))
+		return SHRINK_STOP;
 	for_each_vmap_node(vn)
 		decay_va_pool_node(vn, true);
 
+	mutex_unlock(&vmap_purge_lock);
 	return SHRINK_STOP;
 }
 
-- 
2.25.1

