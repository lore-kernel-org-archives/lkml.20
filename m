Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851704;
	b=5GOmQRZZBpit69EPPx22+2qOiWPiC+XzllTya8fphAcgczhdmW7Wh+z+D+XZiAyWZs06
	 fE+x+HhZvLXW54bPEwlOkElnd7yMDnjS13JRmewQKodMNLpxAF1RiGlNkNK+22ZyRX1ZU
	 lYduqSxWxrUWK90q3wN0Qwiof50i9iliUF+3/i4H7yrMjIeXcFx56HA34O0QuSleI2Zmz
	 8SxjWag0p+/x9O5Ye5v/5oRtnGWqrrfsiOAxUw3unGE6a2oqSYiXegIqTzyLcL9/el7Ze
	 q73Hh/3hUms5Aaxg6DhP2so+NMsz/+Aj7Dj9GtNioUUDxX3NgBoFINqpTpG5tkRAbZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851704;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jhoY+jpmWMSdYwp//JSUuvTndwwXluhkSDeys0thRCY=;
	b=ZKHTkIhWB/ceo7gPrbIy2IO63RI7jGh9i3+ZNm3RT6wJr1l7UDbZ7XbX/bNP/IY+8rom
	 okFHTmtY7DxA6hl8zlgdS/2bzKlpxOAWJq1VoWSijdtRhoBBmFWoPM9BVHGBlztcrGUOV
	 0kg9blaps9mIwp8JTtkCQQO6R85sef+tyuRPd7+K1TyVA8B7XlMr+gF1D8OepnA1ADFSN
	 MAXIVknbxk7DhwZkxobdCRLQYV0IS/I+G5kcT+FiGtd+UPLDpldvqIlwu2VS202bpyoPA
	 KIZLvgDsy+RQ3VcdiacJqlg++ySMhCsrE7eDIWsfA2GIo77shCWzqVw7p51d7V4+8Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hzFCTF9W;
	arc=none smtp.remote-ip=95.215.58.216
Received: from mta1.migadu.com (out-216.mta1.migadu.com [95.215.58.216])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8B1606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E8B1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hzFCTF9W
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WEbewz6b9wHYALxehhglrOgrV5IZCtm+DbbZBJ1BU2Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793851700; v=1; x=1794456500;
 b=hzFCTF9Wu/qi6Z9WvmibqufnABpILnjdHG3/YE5KtTgLG6adx+diqiWJ8XyitEl4HUGroll6
 UiQL/vbleqH6dO9huCP7B1n+ExiFzwUHFcjZ+AjS9SbQOA0/ntzl6mXYmSjeu0+k/VQaJk0/oyB
 f7XJ7769JlLHeR1laPissX9s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 03a3cfa50fb27246;
	Thu, 05 Nov 2026 04:08:20 +0000
X-Mizu-Trace-ID: 03a3cfa50fb27246
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
Subject: [PATCH v2 3/4] mm: hugetlb: fix GFP mask propagation to CMA
Date: Thu,  5 Nov 2026 12:07:45 +0800
Message-ID: <ac2de9b321f68c1025333e92e3ce94beadcb0b6c.1793850539.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1793850539.git.zhengqi.arch@bytedance.com>
References: <cover.1793850539.git.zhengqi.arch@bytedance.com>
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
---
 include/linux/cma.h | 2 +-
 mm/cma.c            | 4 ++--
 mm/hugetlb_cma.c    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

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
index 9ec1d1fd5dff5..876635a56180e 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -933,9 +933,9 @@ struct page *cma_alloc_frozen(struct cma *cma, unsigned long count,
 	return __cma_alloc_frozen(cma, count, align, gfp);
 }
 
-struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int order)
+struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int order, gfp_t gfp)
 {
-	gfp_t gfp = GFP_KERNEL | __GFP_COMP | __GFP_NOWARN;
+	gfp |= __GFP_COMP | __GFP_NOWARN;
 
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

