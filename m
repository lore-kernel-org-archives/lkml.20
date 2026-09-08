Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C084C70809
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850254; cv=none; b=KirNEXjCtgkqZEnLTb7xQYx/WnDOU3KThWoGWmQKCm4BU3wUxy90CTKlF5DR4LAsHYW9KXMFU/O6LVBXJezaFz5C80e7YD4Ln3tnnxHjtL9Yh2IwXPZ7mOm3R2nHps36n/R3foVHmTXUlbNSk7hOQmCAXiAr/19VBen85mBpHxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850254; c=relaxed/simple;
	bh=L//G0uQx4SyHGBMGNmHsgliwSqH1G4apt+OIIbPnoco=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XlKo0J6eRi6HGDAr0WyaBpefDrK8AFwNy8s8Y8q7KqQw3i9jPfzSiBr2MGOsYibHWqBmSNohXrOpa3y68gwdyfATp4u/aCb44j2fAFTWsnV60P/WIy78zK6IgNaR+rG3Ktp+BDb+hmJPYUSXp5l9/6D5mNUm9ZHhZ5r7eijGx9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9f07f438ab5111f19a56ed5b684f684d-20260908
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:fbcbc149-e036-4ab9-acd7-25072a84f49e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:87ba067fa001faebc6bb9e21890526b9,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9f07f438ab5111f19a56ed5b684f684d-20260908
X-User: liuqiqi@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuqiqi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1618917366; Tue, 08 Sep 2026 14:50:47 +0800
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
Subject: [PATCH v3] mm: page_alloc: add missing hooks to bulk allocation path
Date: Tue,  8 Sep 2026 14:50:43 +0800
Message-Id: <20260908065043.217569-1-liuqiqi@kylinos.cn>
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

Add both calls after set_page_refcounted() in the bulk loop to match
the standard allocation path. The gfp mask passed to kmsan_alloc_page()
is stripped of __GFP_RECLAIM because the bulk loop runs under the PCP
spinlock, and KMSAN's stack depot allocation must not sleep.

Both are no-ops when their respective features are disabled, so there
is no overhead in production kernels.

Suggested-by: Gregory Price <gourry@gourry.net>
Signed-off-by: Qiqi Liu <liuqiqi@kylinos.cn>
---
 mm/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 12fac9084c48..73c73499a051 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5280,6 +5280,8 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 
 		prep_new_page(page, 0, gfp, ALLOC_DEFAULT);
 		set_page_refcounted(page);
+		trace_mm_page_alloc(page, 0, gfp, ac.migratetype);
+		kmsan_alloc_page(page, 0, gfp & ~__GFP_RECLAIM);
 		page_array[nr_populated++] = page;
 	}
 
-- 
2.25.1

