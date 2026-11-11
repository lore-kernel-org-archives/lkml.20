Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401813;
	b=QAYl5eXejJYmOl42q61iH+3Mo3PAIn6odmVfYZomkZWa9d7AwMb5M1wVTolXCm+HkJvn
	 +bs8a8sMmXyBi/M5r4HQF7NuQ4pPvZOVHVmCwz0R1o7NiDBMzMzOs3qK5FPd9uuq7fK8f
	 pozHjfV0PsTJ8npviWR3JxCBsF8qmPrTltjBo6PFuMGGfV1nwbokZSUZnp47qa1Xl17D5
	 B3gFAem5b+qW28qRZVFcRG+oxw4NqwRvOekdUlTu+BmDWoi8nmYaJ8A7mL46hOKxr+eIj
	 XDMaBb5xqb0lpkqSQAb4cibDiFfd6VNxG4XHO54NrqG3fyos69cQUSWXRRFu1/wOBKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401813;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3oWe+9OurKGZHeVfPxCUVowplTdJf5Yg0iJZsnEMIJg=;
	b=Z2RtRSUoumf+PF5RwGWgIvSg/zPLM+zA1MvX9/hdxIcaeZoBViU9+0b4mzA5ry4R8lxB
	 fHgZeT02W/1XxYGOy5vQBqzQWCpSAu8/0x+IjaUV1CSoz8N6UdU4UUQB40pEWSVUJInI/
	 /bWBdLjn9khzlAOcCeR4eZu4itAM+u4tlu1hbTLnW8jUQQFjb+XGtZui6hfggIR3szNK/
	 GrVWaUEb3xEOQw4xS8Gzb9ZqeKieXszGCnb0zg9LgPWkT55hHHKNPnux8U9jPHVXPPbQq
	 6VMcQ9S6uMwnE1p3l3u8OcmE3zcvC+5tGiGn+Rm7OE9RaivQv5TM+qutlMwUos5N+rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=onpncTKU;
	arc=none smtp.remote-ip=95.215.58.209
Received: from mta1.migadu.com (out-209.mta1.migadu.com [95.215.58.209])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B07606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B07606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=onpncTKU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ccPpTzutagVeIujYiF+PHwu2InfZpHYdEFtz32EU+hM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794401810; v=1; x=1795006610;
 b=onpncTKUjSpfN3RLoZgu+ZZWIwhpM9hUHjI0hhKh0edlbLFmRGy315eGXNAY6ovEUc7seC6i
 OWpY2cJTWK99QMNU3bAYHS2eKlsEx3qrSNDkVUfV91W0DC8uC9rU0CmRvrIIQZ4jeyA/CYpLB13
 tvYqljFrQELeqdtcJ3GIX8iY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b1405ec9a21693fa;
	Wed, 11 Nov 2026 12:56:50 +0000
X-Mizu-Trace-ID: b1405ec9a21693fa
X-Migadu-Flow: FLOW_OUT
From: Hao Li <hao.li@linux.dev>
To: vbabka@kernel.org,
	harry@kernel.org,
	akpm@linux-foundation.org
Cc: cl@gentwo.org,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Hao Li <hao.li@linux.dev>
Subject: [PATCH] mm/slab: don't set SLAB_MAY_ACCOUNT for KMALLOC_PARTITION_CACHES
Date: Wed, 11 Nov 2026 20:49:10 +0800
Message-ID: <20261111125628.375624-1-hao.li@linux.dev>
X-Mailer: git-send-email 2.54.0
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

An allocation with __GFP_ACCOUNT set (without __GFP_DMA or
__GFP_RECLAIMABLE) is redirected to KMALLOC_CGROUP and will never hit
KMALLOC_NORMAL or KMALLOC_PARTITION_CACHES. Consequently, neither of
these caches requires objcg slots in obj_exts.

While KMALLOC_NORMAL already skips setting SLAB_MAY_ACCOUNT,
KMALLOC_PARTITION_CACHES still carries it unnecessarily.

Extend the check to skip KMALLOC_PARTITION_CACHES as well, saving
unnecessary objcg slots in obj_exts.

Signed-off-by: Hao Li <hao.li@linux.dev>
---
This doesn't seem like a real bug to me, just a small waste of memory, so I
didn't add a Fixes tag.
---
 mm/slab_common.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index 2befd24b4d09..f0ea1fa178e7 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1000,16 +1000,18 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
 #endif
 
 	/*
-	 * If memcg_kmem is enabled and this is a KMALLOC_NORMAL cache and not
-	 * aliased with any other type, make sure it's never merged with any other
-	 * cache.
+	 * If memcg_kmem is enabled and this is a KMALLOC_NORMAL or
+	 * KMALLOC_PARTITION_CACHES cache and not aliased with any other type,
+	 * make sure it's never merged with any other cache.
 	 *
 	 * In other cases the kmalloc cache may end up being used for a
 	 * __GFP_ACCOUNT allocation so mark it as such. The exception is a
 	 * KMALLOC_NO_OBJ_EXT cache.
 	 */
 	if (!mem_cgroup_kmem_disabled()) {
-		if (type == KMALLOC_NORMAL && KMALLOC_RECLAIM != KMALLOC_NORMAL)
+		if (type >= KMALLOC_PARTITION_START &&
+		    type <= KMALLOC_PARTITION_END &&
+		    KMALLOC_RECLAIM != KMALLOC_NORMAL)
 			flags |= SLAB_NO_MERGE;
 		else if (!(flags & SLAB_NO_OBJ_EXT))
 			flags |= SLAB_MAY_ACCOUNT;
-- 
2.55.0

