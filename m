Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F8C418365
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197857; cv=none; b=FIiMRy4kdk8b1+GMRXApQZ8pK1xh+y7W+jYfLEbUXtKzjh9rDoy9FxhPs/k0PH6UXXjDtk9qPTR5N66WWplyg3hvSyziIxjLttfrnCVAinSU419jD0iTe2KNBTK+U+jfmndRt3jHxN/D/wRB0YyVYsq60PzscCDahT5ktVwRfpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197857; c=relaxed/simple;
	bh=8PRj6qx0RbwILj6Hf9BDGD4tq16yZjFSnmzbs9ElPF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SlG/fSnP7Lx7Bh6KR+iJBejrdLjAAnMCwUssvWV5rLzcoaS2LCi0x61vwj8p/KI2Gsr4wdif8Q2BvUcoRrz5p8JlCJ4S96m6vQ/XEycp9SFYeB1WvkhBJNz+oWEhfAXH5XOME/M1CP2wgrnePAWilFAhDUwu2bkWqvarf0DXBSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XqWnKD2l; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XqWnKD2l"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109fafddso93042085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790197852; x=1790802652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ri8dUqYh2ciqE73sjjK4gAgS5aPTyFxGGtfGAJFHdJc=;
        b=XqWnKD2lCOBydJVl5hLCNoWD4kSNYPxz5yg0q4nMFB+Fs2UJldGhArZfkUqsgRPMNX
         pj7NLD4SuRj7MxDS668ZIbHFThAByt0K2d5NT9cUVaxqKsOddhIoVVXfUKzqWAHIHSAV
         yjA8CTA3f27H/ZtduPko9Mom4mm9sIDvu6Rxuhnkk5JWlwXNL2oDKHhyx8HecZT6nxu/
         fF0+Otq5tSFnAa/T3pRWsE94yrgmk04WmoliBdsNm7BeLJIQ6AZC2fyBBQApejS49zWZ
         Msg7WAhzoYhiCrPO+h02gVL9PqMxrxRHBW6sKXvKXVPbb3M9EgfctjkWenA24pelT1qf
         fT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197852; x=1790802652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ri8dUqYh2ciqE73sjjK4gAgS5aPTyFxGGtfGAJFHdJc=;
        b=tCwAsYHE5LVFqKWs83qr/NVwarBQZkk+oh4ibTy2xitXJNBd0rUVaBCsCJOVwc+8dA
         B2ROrLAbaiXh4Thi8AsTAOKoAX6IqjzOJczuTXnQWeLfMNthI9Zd9istXrKLVZGA/NSY
         kVIXTPl09r0QIwpXTNfaAok6nPkTk3+X6Brm7/Etcn8oY5gx3SBGJe1Jevmg5nuAB/d0
         ZFGHn8Cm9mAtHEFLf7amfFAYp0dzroY956ydclw3LuLNB9JgAsvf1Pw4VqWnWL7EoiMZ
         p1yWGc/QN4Bovm7stG133uLKQXwDokz0aXQzWdyXDvWS7rp5r6t87uyvZRP6M+WX8uIr
         fVOA==
X-Gm-Message-State: AFuF++kBDxXKnV5IEIJg16UGfCCQkcBaPEGoH05/Zd2NdBh9DbmKpsRS
	+PprH4I/OsMUu1WMfhW0MFCPqLRyr+mZ9GTo4BYrdX4mJEzYRXcJnbcxlPVjyxuWevQ=
X-Gm-Gg: AYBFou2Y5C7K5Ai36U7wbXr+OR6pAzG1ScZZmzceajw3RDuzSQqAPI3JnMeAtpJBlqC
	V5geOuf8dBFST9nW4HfkRm5gud5Hj+Ba+lhfez4QKMomBsosh/OJrRIlHYJCOIcCqNOs9VkSvOS
	+exHwa3IYpTuFi8vfzHpiYfeqHLFVYKq4+nJwo2UhfDOTR3wqZZMATODD28JS9miWISl1nkx86n
	CLAfKVy18Ewkvvj2SgSIaog7gy6sga49mkueuNqvqrjhTjIJjh76G566ilRW6um2LMCQMStYRLs
	XKEETIzGB1AM0AOdAUd6OWYWW6okspHRssyMsshQhy9F1ZxG5VJgWNcaF8WZZ28+yE7YomuDP5c
	YkTeoZZvPywXU/70iORNcQBREeNMXZuOI29+aNRrIV73tTOyOMOn1pxUTAEk5mPe91yz83bDwB8
	l/lnrtfkyMQkghNN/mpdUA62Xp/qEKPLnVIv3wEnK76eA6fraYS4D6KwIeNJA+7wuWSxd/fnw54
	51PTz5FU68CgZrjUsrmcN63f7u7lE5M+snyruxDcs59Muk/9MNct6hlLuItRQ7dyh0OUbM=
X-Received: by 2002:a05:620a:31a4:b0:93b:d79e:18f3 with SMTP id af79cd13be357-93c34540d1bmr71767185a.54.1790197852086;
        Wed, 23 Sep 2026 14:10:52 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2485926esm305893085a.19.2026.09.23.14.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:10:51 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kernel-team@meta.com,
	willy@infradead.org,
	jack@suse.cz,
	akpm@linux-foundation.org,
	david@kernel.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	Brendan Jackman <jackmanb@google.com>
Subject: [RFC PATCH 5/6] mm/filemap: plumb alloc_flags through folio allocation
Date: Wed, 23 Sep 2026 17:10:39 -0400
Message-ID: <20260923211041.3127588-6-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923211041.3127588-1-gourry@gourry.net>
References: <20260923211041.3127588-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brendan Jackman <jackmanb@google.com>

The filemap folio allocator applies NUMA policy and node selection before
reaching the low-level folio allocator. It currently provides no way for
an MM-internal caller to preserve explicit allocator behavior flags across
that selection.

Add an internal filemap folio allocator that accepts alloc_flags and carries
them through every allocation path.

Keep filemap_alloc_folio_noprof() as an ALLOC_DEFAULT wrapper so existing
callers and the exported interface remain unchanged.

No functional change intended.

Link: https://lore.kernel.org/r/20260726-page_alloc-unmapped-v3-26-6f5729aa9832@google.com
Signed-off-by: Brendan Jackman <jackmanb@google.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/filemap.c | 45 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index b74bc1e5015c..3b33cc873b73 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -52,6 +52,8 @@
 
 #include <asm/tlbflush.h>
 #include "internal.h"
+#include "mempolicy.h"
+#include "page_alloc.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/filemap.h>
@@ -995,31 +997,62 @@ int filemap_add_folio(struct address_space *mapping, struct folio *folio,
 EXPORT_SYMBOL_GPL(filemap_add_folio);
 
 #ifdef CONFIG_NUMA
-struct folio *filemap_alloc_folio_noprof(gfp_t gfp, unsigned int order,
-		struct mempolicy *policy)
+static inline struct folio *__filemap_alloc_folio_noprof(gfp_t gfp,
+		unsigned int order, struct mempolicy *policy,
+		unsigned int alloc_flags)
 {
 	int n;
 	struct folio *folio;
 
+	/* Task policy and cpuset spreading are not safe in all IRQ contexts. */
+	if (unlikely((alloc_flags & ALLOC_NOLOCK) && !in_task()))
+		return __folio_alloc_flags_noprof(gfp, order, numa_node_id(),
+						 NULL, alloc_flags);
+
 	if (policy)
-		return folio_alloc_mpol_noprof(gfp, order, policy,
-				NO_INTERLEAVE_INDEX, numa_node_id());
+		return __folio_alloc_mpol_noprof(gfp, order, policy,
+				NO_INTERLEAVE_INDEX, numa_node_id(), alloc_flags);
 
 	if (cpuset_do_page_mem_spread()) {
 		unsigned int cpuset_mems_cookie;
+
 		do {
 			cpuset_mems_cookie = read_mems_allowed_begin();
 			n = cpuset_mem_spread_node();
-			folio = __folio_alloc_node_noprof(gfp, order, n);
+			folio = __folio_alloc_flags_noprof(gfp, order, n, NULL,
+							   alloc_flags);
 		} while (!folio && read_mems_allowed_retry(cpuset_mems_cookie));
 
 		return folio;
 	}
-	return folio_alloc_noprof(gfp, order);
+
+	if (in_interrupt() || (gfp & __GFP_THISNODE))
+		return __folio_alloc_flags_noprof(gfp, order, numa_node_id(),
+						 NULL, alloc_flags);
+
+	return __folio_alloc_mpol_noprof(gfp, order, get_task_policy(current),
+			NO_INTERLEAVE_INDEX, numa_node_id(), alloc_flags);
+}
+
+struct folio *filemap_alloc_folio_noprof(gfp_t gfp, unsigned int order,
+		struct mempolicy *policy)
+{
+	return __filemap_alloc_folio_noprof(gfp, order, policy, ALLOC_DEFAULT);
 }
 EXPORT_SYMBOL(filemap_alloc_folio_noprof);
+#else
+static inline struct folio *__filemap_alloc_folio_noprof(gfp_t gfp,
+		unsigned int order, struct mempolicy *policy,
+		unsigned int alloc_flags)
+{
+	return __folio_alloc_flags_noprof(gfp, order, numa_node_id(), NULL,
+					 alloc_flags);
+}
 #endif
 
+#define __filemap_alloc_folio(...) \
+	alloc_hooks(__filemap_alloc_folio_noprof(__VA_ARGS__))
+
 /*
  * filemap_invalidate_lock_two - lock invalidate_lock for two mappings
  *
-- 
2.55.0

