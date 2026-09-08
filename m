Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAC42620DE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788837562; cv=none; b=NovYX5caBnumdfBNUfl1BtyWTZCzdkxmNPPbuMb6oSbVX7Qee/9eyaGdI0PpD+LuUYe6b6ynyu3c4e9Az0Y007udlfkjhpiJ7Yee/uwsg2TbtweLbXT7pdTEUOLljUp5eODHLHA+Nqo9bPNhbPxxQdh9gNzGAfhyAUp6e/XTlzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788837562; c=relaxed/simple;
	bh=V/QM2aCfXZQC3xehdgeQiOa4vHuTMcX/HhYCV+z7gjk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lTGWeni3q/kiRD0WlMid3CEYXjYAvGoaBaC7Dl+ZG7a2++S+wK3ZN8NqbeyvBXvmyRX2dz9cMf7ZVBO9CW+jJPWLY3NYWfryO+OdYrny5r5TwJOVwTq54UD8elictVYiK0fuwjbiupd2AOrTIsPekb0T3+/vt5pSwjMtRo0iIIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 110f5742ab3411f19a56ed5b684f684d-20260908
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:35e9f908-a554-48eb-987a-073a9f7dc827,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:f2aa7d636663486bd5c464afcb28c61f,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 110f5742ab3411f19a56ed5b684f684d-20260908
X-User: liuqiqi@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuqiqi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 24674537; Tue, 08 Sep 2026 11:19:13 +0800
From: Qiqi Liu <liuqiqi@kylinos.cn>
To: akpm@linux-foundation.org,
	vbabka@kernel.org
Cc: surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	gourry@gourry.net,
	Qiqi Liu <liuqiqi@kylinos.cn>
Subject: [PATCH v2] mm: page_alloc: add missing hooks to bulk allocation path
Date: Tue,  8 Sep 2026 11:19:09 +0800
Message-Id: <20260908031909.91771-1-liuqiqi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260907120949.418450-1-liuqiqi@kylinos.cn>
References: <20260907120949.418450-1-liuqiqi@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bulk allocation path in alloc_pages_bulk_noprof() currently misses
trace_mm_page_alloc() and kmsan_alloc_page() calls, leaving bulk-allocated
pages invisible to ftrace/BPF/perf and leaving KMSAN shadow memory stale.

Add both calls after set_page_refcounted() in the bulk loop to match the
standard allocation path. Both are no-ops when their respective features
are disabled, so there is no overhead in production kernels.

Suggested-by: Gregory Price <gourry@gourry.net>
Signed-off-by: Qiqi Liu <liuqiqi@kylinos.cn>
---
 mm/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 12fac9084c48..02ba19f6dbb5 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5280,6 +5280,8 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 
 		prep_new_page(page, 0, gfp, ALLOC_DEFAULT);
 		set_page_refcounted(page);
+		trace_mm_page_alloc(page, 0, gfp, ac.migratetype);
+		kmsan_alloc_page(page, 0, gfp);
 		page_array[nr_populated++] = page;
 	}
 
-- 
2.25.1

