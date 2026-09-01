Received: from mta1.migadu.com (out-5.mta1.migadu.com [95.215.58.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1993546D0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253982; cv=none; b=ct/ihXBJErIC4VFdLGOdMWp0ZbUwUrtH8yqC56x1y5PQVXBckfsPp0SpIFrvmqJ850p26C4qDPJ5/pbH7K+mYQrLVNksHP5cRIIbv7YfPyuJ+ZhYXSIUv+vBnK96hCw16zm/+3u/x9+UiKJSsfqPtRdQDDA+uKQCr3QFBDc6pus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253982; c=relaxed/simple;
	bh=kaupwl2CerM+wcHSCXXaFwLigAE3E8c74QApBbEU49A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DICJ4GduYC8qx/IOvsLORWF7yAj3azpE+HHi2jioHSVSSUUD5QWHRaVEdRbl8Jf6TvgSoFKRpy/uAlRKHTqkXfyID8j2FBabMgt8OoSxdfhYtb0RJ8Qrla0ncYec7WFpZL+u88/r1EpyVK8th5j1speLZHM0JnL9TphxVRThm5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=irU2sJO9; arc=none smtp.client-ip=95.215.58.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="irU2sJO9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kaupwl2CerM+wcHSCXXaFwLigAE3E8c74QApBbEU49A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788253978; v=1; x=1788858778;
 b=irU2sJO9q4WUJoILGuRTchvv90VDGfFzrX7swFprOZS1WtztcdnKaSoZVz/BNamTFcR8oQdd
 Sb6IEq9iJkws2UFE5KgXWKdaDwItzXwWCn1zAAoWIjiy9hxR82tLy8OmGyvn35qdm8N8/DGQCib
 YeyCuuGdmZX9TgfQ60U62DZc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b5c480e00ff4c702;
	Tue, 01 Sep 2026 09:12:58 +0000
X-Mizu-Trace-ID: b5c480e00ff4c702
X-Migadu-Flow: FLOW_OUT
From: "Hui Zhu" <hui.zhu@linux.dev>
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
Subject: [PATCH mm-unstable v5 1/2] mm/vmscan: fix missing NR_ISOLATED counter update in MGLRU reclaim path
Date: Tue,  1 Sep 2026 17:12:18 +0800
Message-ID: <65cf410fc9e281bc1de00e938522e5140eb49499.1788252038.git.zhuhui@kylinos.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788252038.git.zhuhui@kylinos.cn>
References: <cover.1788252038.git.zhuhui@kylinos.cn>
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
index c1404a59523d..98226bb021f3 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4892,6 +4892,9 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	scanned = isolate_folios(nr_to_scan, lruvec, sc, swappiness,
 				 &list, &isolated, &type, &type_scanned);
 	nr_isolated = isolated;
+	if (nr_isolated)
+		__mod_node_page_state(pgdat, NR_ISOLATED_ANON + type,
+				      nr_isolated);
 
 	/* Scanning may have emptied the oldest gen, flush it */
 	if (scanned)
@@ -4954,6 +4957,8 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 		goto retry;
 	}
 
+	mod_node_page_state(pgdat, NR_ISOLATED_ANON + type, -nr_isolated);
+
 	if (nr_isolated > total_reclaimed)
 		mod_lruvec_state(lruvec, PGROTATE_ANON + type,
 				 nr_isolated - total_reclaimed);
-- 
2.53.0

