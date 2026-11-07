Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794047484;
	b=Zb90F7HLMQ0c9i7i0X3qKgn5CzjJJq0pcVhFilRg8GtZAOzSvnXURNLuVU8rSaD1iq61
	 MxCA+8ZQi186g/1CBvQNl3E4Sf0N0/EAHX8m+48cmkjjvt80VJu+U0YxvZC5hClokzxBA
	 BccUGg9gfIm61NDJ6IzbP09ckMHTF7mRDAi8Kpe1SN7gmbDZij+VWItEZp85c6bFtmkoe
	 bWbiULEiQ+lgTaZbKJJX/6qnBxWj+HbxkD1b+cPeBCk2CeWFoYcMH4HAqu9/vCEIXt4aN
	 3WSYmKfp2i8XTufLHeut6EQEzlMsBGmwiizhK63GQhJWBRqFPh05LjeZcdcQYH9qdFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794047484;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3qa8oAW5DrZueQ/BMJ/7YOYYWqHn60qhqkLUj4/UYEY=;
	b=DiJTZSed9egD7hJ9aKvwIStFxzreggR5asaHitXCStbTf7/ihqZz8eLC48YZb8jVXZIw
	 OxkBOzN/Y9s6VHXrcKNx9A4BJGvExyVJUuDDciFIxAmtze9tNYTxxP8J8gzX30qzD1I5U
	 pp8LBsgDsOWveYmzENj1V/muUgMaGWQQ3cRdhsRepetZwK+oV1RLqtHynz08UBclh+3mW
	 x4XJC3o+SXX3+gJjF43B0AijkPIQXo0mCgIyxEUNRt2AaGV/739QYbAVlFK85NB/6zaQU
	 nQDYl2iJe+zfhY8piiNMkz9m4pHqke8756+PIenZ4DSOtT+K2VFZq7FsEIH4uPc4WiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j56m8Gaq;
	arc=none smtp.remote-ip=95.215.58.13
Received: from mta1.migadu.com (out-13.mta1.migadu.com [95.215.58.13])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFCF606D80B
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFCF606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j56m8Gaq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DC3/xFjT+cytEgYhhw4Ov9ae3LqMYLHYR7j8UIs7GXc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794047481; v=1; x=1794652281;
 b=j56m8Gaqvoh+cFzEbg4/MEzg+YppVMNj+sR1fMYzKWYXYWMk2rRjPLTBq8SO1w6np5mAWMKS
 8VeKEBMCAmE8dBSJuEeCcsSEdA1a5gZ2JQuU1TojZXumo3V8uY1Jovsdp75nLJTCjBT+ENf5D8w
 ln0e73O/tbEhcir2eg88or+Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id be80d4488337d4f5;
	Sat, 07 Nov 2026 10:31:21 +0000
X-Mizu-Trace-ID: be80d4488337d4f5
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	azpijr@gmail.com,
	lance.yang@linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 3/3] mm: hugetlb: fix GFP mask propagation to CMA
Date: Sat,  7 Nov 2026 18:30:47 +0800
Message-ID: <61ee04513d6cac32347ebec9b295025b8a1f07ca.1794046188.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1794046188.git.zhengqi.arch@bytedance.com>
References: <cover.1794046188.git.zhengqi.arch@bytedance.com>
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

From: Qi Zheng <zhengqi.arch@bytedance.com>

cma_alloc_frozen_compound() uses GFP_KERNEL, allowing direct reclaim
during the first MPOL_PREFERRED_MANY allocation attempt even though
the caller clears __GFP_DIRECT_RECLAIM.

Pass the caller's GFP mask through the helper so CMA respects its
reclaim constraints when trying the preferred nodes.

Fixes: 9bda131c6093 ("mm: cma: add cma_alloc_frozen{_compound}()")
Cc: stable@vger.kernel.org
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 include/linux/cma.h | 2 +-
 mm/cma.c            | 5 +++--
 mm/hugetlb_cma.c    | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 8555d38a97b1a..4539ea5f2c4e8 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -53,7 +53,7 @@ extern bool cma_release(struct cma *cma, const struct page *pages, unsigned long
 
 struct page *cma_alloc_frozen(struct cma *cma, unsigned long count,
 		unsigned int align, bool no_warn);
-struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int order);
+struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int order, gfp_t gfp);
 bool cma_release_frozen(struct cma *cma, const struct page *pages,
 		unsigned long count);
 
diff --git a/mm/cma.c b/mm/cma.c
index 9ec1d1fd5dff5..45017ed876f76 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -933,9 +933,10 @@ struct page *cma_alloc_frozen(struct cma *cma, unsigned long count,
 	return __cma_alloc_frozen(cma, count, align, gfp);
 }
 
-struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int order)
+struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int order, gfp_t gfp)
 {
-	gfp_t gfp = GFP_KERNEL | __GFP_COMP | __GFP_NOWARN;
+	if (WARN_ON_ONCE(!(gfp & __GFP_COMP)))
+		return NULL;
 
 	return __cma_alloc_frozen(cma, 1 << order, order, gfp);
 }
diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
index 80b2407e9f077..307e5736ecdbe 100644
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@ -69,14 +69,14 @@ struct folio *hugetlb_cma_alloc_frozen_folio(int order, gfp_t gfp_mask,
 	}
 
 	if (hugetlb_cma[nid] && node_isset(nid, *nmask))
-		page = cma_alloc_frozen_compound(hugetlb_cma[nid], order);
+		page = cma_alloc_frozen_compound(hugetlb_cma[nid], order, gfp_mask);
 
 	if (!page && !(gfp_mask & __GFP_THISNODE)) {
 		for_each_node_mask(node, *nmask) {
 			if (node == nid || !hugetlb_cma[node])
 				continue;
 
-			page = cma_alloc_frozen_compound(hugetlb_cma[node], order);
+			page = cma_alloc_frozen_compound(hugetlb_cma[node], order, gfp_mask);
 			if (page)
 				break;
 		}
-- 
2.54.0

