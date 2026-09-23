Received: from mail-qv2-f20.google.com (mail-qv2-f20.google.com [74.125.230.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437FA3FD969
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197856; cv=none; b=pUFs2mMawdZ5cyNvaFJrsywOC44lWYkHtRl8Vor1n7JLdtpWMdRtrGX+R0FwmNXLJ0ZYalk6BV0tYnt13Q2pswZT9QCZhwe9P9atL5LgozLyLoi8Pr0YZ+pGOouhwhvwXlH6HslN6gxzcrTEEgGebAk5FrB7TiA5idYSquxGJXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197856; c=relaxed/simple;
	bh=f7jLp3wHPMKJ2uLRlkyduFLNcqp1N3nkDtlgrZmrOxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldEgI+HcpNdXoIY0DJk0XsdB5uHedF3+RExJ6qCdu6foLZthIuQVrl6WQlqQ99W3KL6zl/KfxWQdcGt+asVzR7J8MQsW8qSMMzM3lhs1ikHmIv+x8thGATbf2Hb7wrl05yi1SpC7H4+Wm/1LnmHWtPvGxudnkz/OmG/sHtetXW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=BHqR8XBl; arc=none smtp.client-ip=74.125.230.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="BHqR8XBl"
Received: by mail-qv2-f20.google.com with SMTP id 6a1803df08f44-90cdfc9b6e4so13124986d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790197850; x=1790802650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/Ioh0E0wp4TmybDNX/mkYZyZ5cUYapYs7dOai2tJpk=;
        b=BHqR8XBlbOtqtefjkV+fJT9SncSAw/sxdhOfw+7rGGaU41TwxJnLH3+2XV/i6CP8jR
         b46a4XbDeN6LOLro5NCa2eIE5WYkGSnkHnj1Dlk4yjYAa1XY9fIofA/gosw9NLVIY9x1
         cawnmAganxt31/QJb0rDtPVvB9oESgZ5u3qKZrkPxGyX17v34wKtOSNqHX5Olve7wtZA
         3TMIfSDsuujPly4Ht/d/eEax6E1M27bZVUZD2moFbwconVDTpo2IIIcmbJ8K7Nl6Be/e
         TW3LdHgG9CRG/Ek6MEhRiHMZyBB0/oaVnUaT4/71ukzaSBJBGlxO4WI3gOwq8b4i/eF3
         ZrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197850; x=1790802650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/Ioh0E0wp4TmybDNX/mkYZyZ5cUYapYs7dOai2tJpk=;
        b=oFRSt1UUVW0900pxpsM9GKKU/L0WR+ICIvJirksBrhLZZnljRkIe05aBytJmjRtnbQ
         z7bEYqq0mDsW2AyEbSKTpMBcM2rYK6F+P9INgBF7FdN8bo2JyG8EcF5kq5oTEX8Mc4h6
         uWIjCysjNQeECAXQTXQIZKD5iJbjp/fmoTzNGUtiK1CcFATYDNuMYK8E7vcMWanxA08K
         UM2BcMD4d15cco2QEo1hckS9So8/q/0RZc35p2UkDplPROQ9U7r+Sl2IHnFK7aq0QqK4
         AfKhacRivdR9H72QJXlo7etD1P6SUKUbIkU5sYbdLKNh43H98g+gda+r68jkxp01o6l0
         Jfhw==
X-Gm-Message-State: AFuF++nSE0HzJfxH96p4dzTzvM1Q+fLbKbwtYhk6G7XLT7Q7KSFdsISo
	tDJV/fOFjLYitDmTr3/ipjPRe/ETfXTHrw627sjz2c8VsmfnLyiq721jYlYleZA4iZ0=
X-Gm-Gg: AYBFou10jL25RVGcYB7XpcoxxXhXJMHpgra8CE1kHzAwBTfRBjIfyjyo1JMgWR6yT5u
	vD3zFhs1+5MCscEhFachZwN/U3v0zVwYs9rTFwlFV9sB7g7SazdgeyA5cdfm5TmMxVREelKdSqJ
	FAMV4keWyEY2t2zesJHPMZDuBCKTPZnvUVF4V5MddL33+eQ1QwGjtIOA/7/Xd5UgSUrxKo6V9Id
	A+pFHX9JNtNyEJ5vk0zGerVvMnqdef0QxvGkaYMoTnFhr2Na+ToCS0MgtOJWkR+3BZOvS5/YAB5
	zBx1Jk4N7Ud8vou1kcRX84bONecY0zqIn773nLHRKXuzzGoP8wghnGKAEQE3/MjzalZNhARkTFV
	ymXUI3Lpb/Gc9XiwU1ilZ8d7tKHJKes1c952AR1nQ8ivBKNfJkNbqpf0ZZ/BpwW0srcZWoLZ730
	cDrNfLA0Azh5Vxn0UdqHeWOxrhOE2D4iADUXKEnvd/HI4duRlCQoBRIm61Xqz94wSHb4ODJL584
	AJ2uMWn2OfwW90R3kmWEjlE3fGIuwy5FTfpT/uSFAZu9wLN3v5IoEqYqCO2tg==
X-Received: by 2002:a05:620a:2690:b0:939:b55a:3c7 with SMTP id af79cd13be357-93c344ef4famr76423385a.41.1790197850184;
        Wed, 23 Sep 2026 14:10:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2485926esm305893085a.19.2026.09.23.14.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:10:49 -0700 (PDT)
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
	Brendan Jackman <brendan.jackman@google.com>
Subject: [RFC PATCH 4/6] mm/mempolicy: plumb alloc_flags through folio allocation
Date: Wed, 23 Sep 2026 17:10:38 -0400
Message-ID: <20260923211041.3127588-5-gourry@gourry.net>
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

From: Brendan Jackman <brendan.jackman@google.com>

The NUMA policy allocation paths hard-code ALLOC_DEFAULT before reaching
the page allocator.

Add an alloc_flags argument to the MM-internal policy allocator and carry
it through preferred-many, huge-page, and general policy allocation paths.
Keep the public mempolicy folio interface as an ALLOC_DEFAULT wrapper.

Task policy selection is not safe in every interrupt context, so non-task
ALLOC_NOLOCK requests bypass it and use the supplied preferred node
directly.

No existing caller behavior is changed.

Link: https://lore.kernel.org/r/20260726-page_alloc-unmapped-v3-25-6f5729aa9832@google.com
Signed-off-by: Brendan Jackman <brendan.jackman@google.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/mempolicy.c | 44 ++++++++++++++++++++++++++++++++------------
 mm/mempolicy.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 12 deletions(-)
 create mode 100644 mm/mempolicy.h

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 4c0b8ff1a7e6..2c01699081b7 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -120,6 +120,7 @@
 #include <linux/memory.h>
 
 #include "internal.h"
+#include "mempolicy.h"
 #include "page_alloc.h"
 
 /* Internal flags */
@@ -2437,7 +2438,8 @@ bool mempolicy_in_oom_domain(struct task_struct *tsk,
 }
 
 static struct page *alloc_pages_preferred_many(gfp_t gfp, unsigned int order,
-						int nid, nodemask_t *nodemask)
+						int nid, nodemask_t *nodemask,
+						unsigned int alloc_flags)
 {
 	struct page *page;
 	gfp_t preferred_gfp;
@@ -2451,10 +2453,10 @@ static struct page *alloc_pages_preferred_many(gfp_t gfp, unsigned int order,
 	preferred_gfp = gfp | __GFP_NOWARN;
 	preferred_gfp &= ~(__GFP_DIRECT_RECLAIM | __GFP_NOFAIL);
 	page = __alloc_frozen_pages_noprof(preferred_gfp, order, nid, nodemask,
-					   ALLOC_DEFAULT);
+					   alloc_flags);
 	if (!page)
 		page = __alloc_frozen_pages_noprof(gfp, order, nid, NULL,
-						   ALLOC_DEFAULT);
+						   alloc_flags);
 
 	return page;
 }
@@ -2466,11 +2468,13 @@ static struct page *alloc_pages_preferred_many(gfp_t gfp, unsigned int order,
  * @pol: Pointer to the NUMA mempolicy.
  * @ilx: Index for interleave mempolicy (also distinguishes alloc_pages()).
  * @nid: Preferred node (usually numa_node_id() but @mpol may override it).
+ * @alloc_flags: ALLOC_* flags.
  *
  * Return: The page on success or NULL if allocation fails.
  */
 static struct page *alloc_pages_mpol(gfp_t gfp, unsigned int order,
-		struct mempolicy *pol, pgoff_t ilx, int nid)
+		struct mempolicy *pol, pgoff_t ilx, int nid,
+		unsigned int alloc_flags)
 {
 	nodemask_t *nodemask;
 	struct page *page;
@@ -2478,7 +2482,8 @@ static struct page *alloc_pages_mpol(gfp_t gfp, unsigned int order,
 	nodemask = policy_nodemask(gfp, pol, ilx, &nid);
 
 	if (pol->mode == MPOL_PREFERRED_MANY)
-		return alloc_pages_preferred_many(gfp, order, nid, nodemask);
+		return alloc_pages_preferred_many(gfp, order, nid, nodemask,
+					  alloc_flags);
 
 	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
 	    /* filter "hugepage" allocation, unless from alloc_pages() */
@@ -2502,7 +2507,7 @@ static struct page *alloc_pages_mpol(gfp_t gfp, unsigned int order,
 			 */
 			page = __alloc_frozen_pages_noprof(
 				gfp | __GFP_THISNODE | __GFP_NORETRY, order,
-				nid, NULL, ALLOC_DEFAULT);
+				nid, NULL, alloc_flags);
 			if (page || !(gfp & __GFP_DIRECT_RECLAIM))
 				return page;
 			/*
@@ -2514,7 +2519,8 @@ static struct page *alloc_pages_mpol(gfp_t gfp, unsigned int order,
 		}
 	}
 
-	page = __alloc_frozen_pages_noprof(gfp, order, nid, nodemask, ALLOC_DEFAULT);
+	page = __alloc_frozen_pages_noprof(gfp, order, nid, nodemask,
+					   alloc_flags);
 
 	if (unlikely(pol->mode == MPOL_INTERLEAVE ||
 		     pol->mode == MPOL_WEIGHTED_INTERLEAVE) && page) {
@@ -2530,11 +2536,18 @@ static struct page *alloc_pages_mpol(gfp_t gfp, unsigned int order,
 	return page;
 }
 
-struct folio *folio_alloc_mpol_noprof(gfp_t gfp, unsigned int order,
-		struct mempolicy *pol, pgoff_t ilx, int nid)
+struct folio *__folio_alloc_mpol_noprof(gfp_t gfp, unsigned int order,
+		struct mempolicy *pol, pgoff_t ilx, int nid,
+		unsigned int alloc_flags)
 {
-	struct page *page = alloc_pages_mpol(gfp | __GFP_COMP, order, pol,
-			ilx, nid);
+	struct page *page;
+
+	if (unlikely((alloc_flags & ALLOC_NOLOCK) && !in_task()))
+		return __folio_alloc_flags_noprof(gfp, order, nid, NULL,
+						 alloc_flags);
+
+	page = alloc_pages_mpol(gfp | __GFP_COMP, order, pol, ilx, nid,
+				alloc_flags);
 	if (!page)
 		return NULL;
 
@@ -2542,6 +2555,13 @@ struct folio *folio_alloc_mpol_noprof(gfp_t gfp, unsigned int order,
 	return page_rmappable_folio(page);
 }
 
+struct folio *folio_alloc_mpol_noprof(gfp_t gfp, unsigned int order,
+		struct mempolicy *pol, pgoff_t ilx, int nid)
+{
+	return __folio_alloc_mpol_noprof(gfp, order, pol, ilx, nid,
+					 ALLOC_DEFAULT);
+}
+
 /**
  * vma_alloc_folio - Allocate a folio for a VMA.
  * @gfp: GFP flags.
@@ -2586,7 +2606,7 @@ struct page *alloc_frozen_pages_noprof(gfp_t gfp, unsigned order)
 		pol = get_task_policy(current);
 
 	return alloc_pages_mpol(gfp, order, pol, NO_INTERLEAVE_INDEX,
-				       numa_node_id());
+			       numa_node_id(), ALLOC_DEFAULT);
 }
 
 /**
diff --git a/mm/mempolicy.h b/mm/mempolicy.h
new file mode 100644
index 000000000000..8d2c07868f6e
--- /dev/null
+++ b/mm/mempolicy.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * mm-internal API for mempolicy.c. Public API lives in
+ * include/linux/mempolicy.h.
+ */
+#ifndef __MM_MEMPOLICY_H
+#define __MM_MEMPOLICY_H
+
+#include <linux/gfp.h>
+#include <linux/mempolicy.h>
+
+#include "page_alloc.h"
+
+#ifdef CONFIG_NUMA
+struct folio *__folio_alloc_mpol_noprof(gfp_t gfp, unsigned int order,
+		struct mempolicy *pol, pgoff_t ilx, int nid,
+		unsigned int alloc_flags);
+#else
+static inline struct folio *__folio_alloc_mpol_noprof(gfp_t gfp,
+		unsigned int order, struct mempolicy *pol, pgoff_t ilx, int nid,
+		unsigned int alloc_flags)
+{
+	return __folio_alloc_flags_noprof(gfp, order, numa_node_id(), NULL,
+					 alloc_flags);
+}
+#endif
+
+#endif
-- 
2.55.0

