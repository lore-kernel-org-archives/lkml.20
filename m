Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467423C1D4A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788492922; cv=none; b=XDO/YlOZ1tv/fAapU8MqnsR4dAq+RkMOiXAGix3jGktE4JRju+lK0ZdIph2yP3v6jNEZxLgYPH/Lq47Ll0MSAxpUjftBDIjjDC6H4BdPU1p4D27DSMxQeNPyjHrlTnvB/Td7KHAEHXx7hDE2mg+V25j6022jympnRxoDBkD7+JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788492922; c=relaxed/simple;
	bh=bGU7Lfchzdfr7wfBSEEKXWoDmWaiWhUJmfcShQnJ7Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YM1Lvx6AqLgmIX1E/ZOQXlzBhpUAO+NyfTHBoe4GxGxwgZLm5b7uo5/+FOTSumaQzFlfbmwzEbdCBXplXZdouhDznJQucoXBJPbJkrmNmrd/cjVfaJ5+sppGQkL1TcB7tOCfXR9qJEkFQnItZ6svi3cM/SjcSDLdLHv/qmd8BNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=bBqSUasH; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="bBqSUasH"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788492910; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=Uxu22xj995mFVQr2+Ydau7ylOTci62Lzzj4k69xScho=;
	b=bBqSUasHjOYLFKUuhEm6an8pN+L389Ez9CdZsO9qnNZitJJwuRQ8X5Px5aApRHE0NENNL9G0BmIsS+CcI5k8H5iZp1p+QWHcavMhKNNQoaS/lJYF3druZU59gTj2+VJSq+Q6rIZsgbs96aqjmwMYN5DEHVp+ck16d41BadROwkM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0XAHQrJe_1788492907;
Received: from banye.tbsite.net(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0XAHQrJe_1788492907 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 04 Sep 2026 11:35:08 +0800
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Xunlei Pang <xlpang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qinyun Tan <qinyuntan@linux.alibaba.com>
Subject: [PATCH 1/2] mm: thp: restore SHRINKER_NONSLAB on the deferred split shrinker
Date: Fri,  4 Sep 2026 11:35:02 +0800
Message-ID: <20260904033503.4067283-2-qinyuntan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260904033503.4067283-1-qinyuntan@linux.alibaba.com>
References: <20260904033503.4067283-1-qinyuntan@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On a system booted with cgroup.memory=nokmem, the deferred split
shrinker is quietly demoted to a non-memcg-aware one.  As a result,
partially unmapped THPs are only split under global reclaim; memcg
(limit-induced) reclaim never splits them, so a cgroup under memory
pressure keeps its underused THPs intact.

This is a regression from commit fafaeceb89a5 ("mm: switch deferred
split shrinker to list_lru"), which re-registered the shrinker without
SHRINKER_NONSLAB.  The shrinker had carried this flag since commit
0a432dcbeb32 ("mm: shrinker: make shrinker not depend on memcg kmem")
precisely so it would keep working with kmem accounting disabled.
Without the flag, shrinker_memcg_alloc() fails with -ENOSYS under
nokmem and the shrinker loses its memcg awareness.

This was noticed by Michal during review of the patch "mm/list_lru:
don't copy stale shrinker id from non-memcg-aware shrinkers" [1].

Restore the flag.

[1] https://lore.kernel.org/lkml/697713c4-0857-485b-aba7-c74f37a3c8b4@linux.alibaba.com/

Fixes: fafaeceb89a5 ("mm: switch deferred split shrinker to list_lru")
Suggested-by: Michal Koutný <mkoutny@suse.com>
Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
---
 mm/huge_memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 644d6905b49cc..16f9aa5b2d077 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1022,7 +1022,8 @@ int folio_memcg_alloc_deferred(struct folio *folio)
 static int __init thp_shrinker_init(void)
 {
 	deferred_split_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE |
-						 SHRINKER_MEMCG_AWARE,
+						 SHRINKER_MEMCG_AWARE |
+						 SHRINKER_NONSLAB,
 						 "thp-deferred_split");
 	if (!deferred_split_shrinker)
 		return -ENOMEM;
-- 
2.43.7

