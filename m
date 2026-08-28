Received: from mta0.migadu.com (out-222.mta0.migadu.com [91.218.175.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499B431195B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945100; cv=none; b=A0cAEJ3GTioqV7VZXTUunqvnhRGj+iSlCBCY4rso/NR3tcOUEiH/1K6b41yt1kxBdfp9c5McGTskQz6zq+zuwJfw/8BXEMxVt93yOQKo5ntFiKHpaiYSTo5dusczzufMKxr8kSgX8PF9WG6L9dAW+QZqwm7P9jn8g9oxJV2wlKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945100; c=relaxed/simple;
	bh=TfHpnzMcF+zAkZEjIfKiZONKrvtQEIIuCJ+9jCgmo5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKEAZMP6WQkle7OAMmSmYxN4t5YyrDj9FdLmz6Trhs6wmjCw/sY5ZS9ovBX8ZlQqNuZFMyHGmvlD+qN0xZdeEGP/E921T19BR/6lObC+49oeAyKzabConlG4zeur5ZOsTm9emQkXYW0hi2rQpHSWWsBBrAjtzY3cQQriYXJJQsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jQOflQML; arc=none smtp.client-ip=91.218.175.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jQOflQML"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TfHpnzMcF+zAkZEjIfKiZONKrvtQEIIuCJ+9jCgmo5E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787945094; v=1; x=1788549894;
 b=jQOflQMLLSXvF4RhH9T39JLmhIlr+hXTlgvUTmQqK2S39rimNS1UowlQOljTXHZMzi/sPe7n
 OIozzK5ugM07jT7eadhZMzgSJh08DgGksHzqOBMAnyKJkq+nZA+daUgC7WF0Q8NSHUlOyTcWQU2
 WLTuBKQHFbNLZutGsTUBuOf0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 94f82fffaa8d6179;
	Fri, 28 Aug 2026 19:24:44 +0000
X-Mizu-Trace-ID: 94f82fffaa8d6179
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Rik van Riel <riel@surriel.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Meta kernel team <kernel-team@meta.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] memcg: clear FLUSHING_CACHED_CHARGE on cpu offline
Date: Fri, 28 Aug 2026 12:24:19 -0700
Message-ID: <20260828192419.3057939-1-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko [1] reported that memcg_hotplug_cpu_dead() drains the stocks
of the CPU which went away but leaves FLUSHING_CACHED_CHARGE alone.

The flag can be set at that point: drain_all_stock() may have claimed
the stock and queued the drain work shortly before the CPU went down.
workqueue_offline_cpu() unbinds the per-cpu workers, so such a pending
work item is executed by an unbound worker on some other CPU, where
drain_local_memcg_stock() operates on this_cpu_ptr() and thus drains
and clears the flag of that other CPU instead.  Nothing clears the flag
of the dead CPU, so drain_all_stock() would skip its stock forever once
the CPU comes back online.

Clear the flag of both stocks after draining them.

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260828135036.7d44361f%40fangorn [1]
---
 mm/memcontrol.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index e082aa68fa5c..872115c6b0f2 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2378,9 +2378,21 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
 
 static int memcg_hotplug_cpu_dead(unsigned int cpu)
 {
+	struct memcg_stock_pcp *memcg_st = &per_cpu(memcg_stock, cpu);
+	struct obj_stock_pcp *obj_st = &per_cpu(obj_stock, cpu);
+
 	/* no need for the local lock */
-	drain_obj_stock(&per_cpu(obj_stock, cpu));
-	drain_stock_fully(&per_cpu(memcg_stock, cpu));
+	drain_obj_stock(obj_st);
+	drain_stock_fully(memcg_st);
+
+	/*
+	 * A drain work queued before the CPU went away is executed by an
+	 * unbound worker on some other CPU and clears that CPU's flag, so
+	 * clear the flags here to make these stocks drainable again once
+	 * the CPU comes back online.
+	 */
+	clear_bit(FLUSHING_CACHED_CHARGE, &memcg_st->flags);
+	clear_bit(FLUSHING_CACHED_CHARGE, &obj_st->flags);
 
 	return 0;
 }
-- 
2.53.0-Meta

