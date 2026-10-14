Received: from mta0.migadu.com (out-84.mta0.migadu.com [91.218.175.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED3D340DA6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968469; cv=none; b=j3TAX5he/dmn7nabl/yRxZ/aTbtNlUmwFWu23l2r9bwIQrwCixyEc2urCOqxCKDGonT6C7UaGcINPh1zNnD6i3EjuYx1rAfz6mpokk5KYJknGmT500+dr4Ggn9w1TZXwfQocB6m67/BnT0LJtuQ1fqBG2O8wy6i+Zk9jBEXNz/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968469; c=relaxed/simple;
	bh=ZQ4kJhYF+3X/w38Sl/rvW6wcqURly93fU44FB0RP9cI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yw/g1NDzSEKfyPSJChDaztzUOd8WYEhSZ6IgF1ICxsD2zzUIsvvOAXqLHop56xtuzCvsgoT/s2+M2GHGrcPD09RqGS2I66C4kNv7jnUQ9eJtGRWiYpNwcLDdUo4vhYiBy8LQNLG6jcD0BKD+Wu0GQe1iUMp+Z+sfCJ4kICtl6Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mfp6boUk; arc=none smtp.client-ip=91.218.175.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mfp6boUk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZQ4kJhYF+3X/w38Sl/rvW6wcqURly93fU44FB0RP9cI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791968464; v=1; x=1792573264;
 b=mfp6boUkpxxfdJoGuf6WbU6ZReeuaG95Hf8t9xd9mYpsTHUVhZYr5crCarNi43QAu/9HWDcq
 6lx3ZHii3rpQrLp1MO4sgDk26nU+70NKIT6u0YixTz+h2M9dAc/1iQoCwmwFFjBA6tHwkXla7P2
 F9Ed6rlAg8D3WD7noJv/AGOc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id abacb56748857724;
	Wed, 14 Oct 2026 09:01:03 +0000
X-Mizu-Trace-ID: abacb56748857724
X-Migadu-Flow: FLOW_OUT
From: Hui Zhu <hui.zhu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>
Subject: [PATCH v6 1/2] mm/vmscan: fix missing NR_ISOLATED counter update in MGLRU reclaim path
Date: Wed, 14 Oct 2026 17:00:23 +0800
Message-ID: <141901355a7d9e4bbca5c4840ae32ea5c65fe3b6.1791968227.git.zhuhui@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791968227.git.zhuhui@kylinos.cn>
References: <cover.1791968227.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hui Zhu <zhuhui@kylinos.cn>

MGLRU evict_folios() isolates folios from the LRU without updating
the NR_ISOLATED_ANON/FILE counters, unlike the legacy
shrink_inactive_list() path. This causes compaction's
too_many_isolated() check to under-count isolated pages when MGLRU
reclaim is active.

Add NR_ISOLATED counter updates in evict_folios(): increment after
isolate_folios() and decrement after all retry passes complete, using
the existing nr_isolated which holds the original isolated count.

Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Barry Song <baohua@kernel.org>
---
 mm/vmscan.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 245f68c75b28..3bd604204ec7 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4982,6 +4982,9 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	scanned = isolate_folios(nr_to_scan, lruvec, sc, swappiness,
 				 &list, &isolated, &type, &type_scanned);
 	nr_isolated = isolated;
+	if (nr_isolated)
+		__mod_node_page_state(pgdat, NR_ISOLATED_ANON + type,
+				      nr_isolated);
 
 	/* Scanning may have emptied the oldest gen, flush it */
 	if (scanned)
@@ -5044,6 +5047,8 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 		goto retry;
 	}
 
+	mod_node_page_state(pgdat, NR_ISOLATED_ANON + type, -nr_isolated);
+
 	if (nr_isolated > total_reclaimed)
 		mod_lruvec_state(lruvec, PGROTATE_ANON + type,
 				 nr_isolated - total_reclaimed);
-- 
2.43.0

