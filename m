Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4734C49365C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783006; cv=none; b=OSfagfl0avYYSXV3MI+mQAuL+GluZ4RY2ZpodxsIFycoYND8uNH6TFa9YqutmLKOEJWOVykhicPK7+J1VZRObNzDdcmLQcEY57TZ+AHUvZYTIpjRF0bpKTxBHaJ5Bl3Wr/1MIYxwgmf8FRu12RMSZoA2sp95Idc1OKM7hijYnnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783006; c=relaxed/simple;
	bh=WR13fmyEc9Fn2qyibMXTOJW8DfSWlWeWpn7wDPpBjYk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TCnfCmav6W0cUrXAG18RKlIh8jnGzoqCJokoFVNW8dE+LtRWQLy3sPk1jeBY1GZQ2cdda5trt2+fLEBCR4opQDPK+ZmsOEIyVlNaJVT68DV7kwAySulX2RH2w0nCS9C+YI5cSaIJcC20o/UhIPsFCQEQuq7zK5FNf159GT2+/co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0945cbbaaab511f19a56ed5b684f684d-20260907
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:21fe8680-272e-4999-b108-5fef9e18dad1,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:225d1d5d4746b72c03c14b3ad1e5a414,BulkI
	D:nil,BulkQuantity:0,SF:102|123|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0945cbbaaab511f19a56ed5b684f684d-20260907
X-User: liuqiqi@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuqiqi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1539729262; Mon, 07 Sep 2026 20:09:54 +0800
From: liuqiqi@kylinos.cn
To: akpm@linux-foundation.org,
	vbabka@kernel.org
Cc: surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qiqi Liu <liuqiqi@kylinos.cn>
Subject: [PATCH] mm: page_alloc: add trace_mm_page_alloc to bulk allocation path
Date: Mon,  7 Sep 2026 20:09:49 +0800
Message-Id: <20260907120949.418450-1-liuqiqi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Qiqi Liu <liuqiqi@kylinos.cn>

The bulk allocation path in alloc_pages_bulk_noprof() does not fire
trace_mm_page_alloc for each allocated page, leaving bulk-allocated
pages invisible to ftrace, BPF, and perf. Only the fallback path via
__alloc_frozen_pages_noprof() is traced.

Add trace_mm_page_alloc() after set_page_refcounted() in the bulk loop
to match the standard allocation path. The tracepoint is gated by
static key, so there is no overhead when tracing is disabled.

Signed-off-by: Qiqi Liu <liuqiqi@kylinos.cn>
---
 mm/page_alloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 12fac9084c48..d17c21775cb2 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5280,6 +5280,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 
 		prep_new_page(page, 0, gfp, ALLOC_DEFAULT);
 		set_page_refcounted(page);
+		trace_mm_page_alloc(page, 0, gfp, ac.migratetype);
 		page_array[nr_populated++] = page;
 	}
 
-- 
2.25.1

