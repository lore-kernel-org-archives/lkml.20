Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0323B71D3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197852; cv=none; b=OG5QGwimrFkn3gW4LwdiY6uk0KchTW0syMBpin4+vmNylpgdG6XfJyDDXcxtznl4pljPwlb5Y21nVu31YgVowHJgWpUErJ2PoSZxqEVn1q9A+XgXqdC9OVakbJ9f3lFS6z+d9ZtO0oNMRdjuiROvMbCpN3ss8BWz6D0Zkp+mops=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197852; c=relaxed/simple;
	bh=XRO48Bgw48FqtNFnwxoO2t8s1KdDx0HkbyEfUCKJjsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3CA7nAtaZZ/Jz41PLOR0JjmT4axsurcHuNiVn2+qPWtIfeFxVssNTmZIQNGDVWaM6FraA9fA/0sxZeyYSAyuOxCCMVxn0mLIFZaS81vQVtj8kQx5uJVZJpAmcPqemY0ndvNS5TlxS9Hx8BnvlJtt+tZzoJsL/JsmWg1uT0q0M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=iMQewwTX; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="iMQewwTX"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910cc46c4so134833385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790197847; x=1790802647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vPVSrxtSx9kDTub89+jb9IguuxzhfykwRy7ihRNBm8Q=;
        b=iMQewwTXR44v5uEfqfL3yUAYonKfI5suYEY3eSOPcf+9HZK0FtexNM1/DfrPs+mx7E
         gtXnvWbJyAfS07L5x4Q+idvHPGXXwnurk1dt+CaxeoUMERbA9YD3VrSTD6AcVagzMolX
         bn1g5OGd6QTOZJqk99MjF8hihbHD45gPffkjmLBhl1zTzu26ZjBoAjb4J4Ex3mSJKdnP
         7UwMqWWGV4a/W9Cwd4Fd69HgdQjiuFLnu8tSrTKQC9rwIKEDDspvCLxx1HGZOLC+7bhP
         0VU9+Dw8F5AzlBsYVFhTl/+vCyxOtniYUbyvpim/5qYYIU8KAk7IET4VwptUHSeaxbln
         T+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197847; x=1790802647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vPVSrxtSx9kDTub89+jb9IguuxzhfykwRy7ihRNBm8Q=;
        b=UNtcVjIPlFUdg6xl9CIbb4WGt+ZyX1qEtbm6vx1Tqn1ULhAA8Fq6SoUYuYUv6OKqja
         mAKBwrHGxiJxCDJ+6WaaJqJY+zRi7W0eumYHT3TUBDkmQ2wIJmL5Hv9wJ9jiTR2BAxlu
         k9nP9+Z6JOhiKl0Yvf5YBsGx+zgNMJ0iTLrE//9Y8i10buiBxV9kOfc894lbhGTzP8oQ
         g1jIprGpmS1yBspEE0td61OoN0k+nlkAFRcXssIsD01bVWkFY+wk+2Ze744jOXg0C2Bn
         Z3ktJrucglwSVpUIq69512i7qbTmj/enho0cPUmN/wt6svrKb1uxTMS1gUbUmKnuIdwr
         h2Sw==
X-Gm-Message-State: AFuF++nCEH0wyX0ZoMrJ3xO+/H+MYcGoNrKpjEnWPPcKdCkzo531Znv2
	0iAs3HbOHAtYlUnPRIEEluwjHPScAJP9TPk+T7iBMjPmNQpHrOY7fZHKcVmjh0zm8lM=
X-Gm-Gg: AYBFou3U4OPZubiTg/9h+p33KzPDNgXFIi27F+rDo9qoKv3/mkTiI+wYwd2mrpaRbRG
	qCrIyC7JZHpyBiTZMrZXM4xrf51hgAXE4WUbGukmxZMtNZaJSmN11+D+GYL2B+9xqpoAUgWikWr
	G7m+spQvdvmuVmf//hk2gVKWLsomj4CRC2aKfldLMBz+Ayja9dKdQqcyFwfk+cC+v0akU4H0yHH
	9k0iU03EFlTpfA4SV9oXpd9x0xEVS6Vm8JHdSdxDNbCD5gIYnZlHmkeQ+0GRT2sdmfnj79boEdA
	9CCycrOysSe1lg4p4ijy2xaG6pcI86MEh0Zv5AYuWkTnLyd4KZrQBiHuL5KE6RWGYFdDnVuzrOx
	Czjlzle2zbKaKwHUAUgnkEtRkGzl7onLr895kNuJAV6niWc6D8NFREXjKaqijYwBBP1WneQ8nHW
	9J2keepxdG5QtsN2My1A4eubOEgf8fsOcJXgTgfNlXk1CNdSI9ZRlIATJK9cgEI3HGe/q78UtqP
	q9EJP19OWvZZoa2rEDWxoItNuPcLkH1dPH3dNGUGlsW5FBk8tt86N1fgraX
X-Received: by 2002:a05:620a:2586:b0:939:9bcf:8d35 with SMTP id af79cd13be357-93c348aee16mr64595285a.35.1790197847255;
        Wed, 23 Sep 2026 14:10:47 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2485926esm305893085a.19.2026.09.23.14.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:10:46 -0700 (PDT)
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
	hannes@cmpxchg.org
Subject: [RFC PATCH 2/6] mm/page_alloc: refactor alloc_flags preparation
Date: Wed, 23 Sep 2026 17:10:36 -0400
Message-ID: <20260923211041.3127588-3-gourry@gourry.net>
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

__alloc_frozen_pages_noprof() validates allocation flags, checks the
order, prepares ALLOC_NOLOCK, and selects its initial watermark.

alloc_pages_bulk_noprof() separately initializes its allocation context
and low-watermark flags.

Move this setup into prepare_alloc_flags() and call it from both paths.
The bulk allocator continues to pass ALLOC_DEFAULT.

No change in functionality.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/page_alloc.c | 158 ++++++++++++++++++++++++++----------------------
 1 file changed, 87 insertions(+), 71 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 728dd1a36f0f..b4a021fad183 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5138,6 +5138,84 @@ static inline bool prepare_alloc_pages(gfp_t gfp_mask, unsigned int order,
 	return true;
 }
 
+static inline bool alloc_order_allowed(gfp_t gfp, unsigned int order,
+				       unsigned int alloc_flags)
+{
+	if (alloc_flags & ALLOC_NOLOCK)
+		return pcp_allowed_order(order);
+
+	/*
+	 * There are several places where we assume that the order value is sane
+	 * so bail out early if the request is out of bound.
+	 */
+	return !(WARN_ON_ONCE_GFP(order > MAX_PAGE_ORDER, gfp));
+}
+
+static inline bool alloc_nolock_allowed(void)
+{
+	if (!can_spin_trylock())
+		return false;
+
+	/* Bailout, since _deferred_grow_zone() needs to take a lock */
+	if (deferred_pages_enabled())
+		return false;
+
+	return true;
+}
+
+/*
+ * GFP flags to set for ALLOC_NOLOCK i.e. alloc_pages_nolock().
+ *
+ * Do not specify __GFP_DIRECT_RECLAIM, since direct claim is not allowed.
+ * Do not specify __GFP_KSWAPD_RECLAIM either, since wake up of kswapd
+ * is not safe in arbitrary context.
+ *
+ * These two are the conditions for gfpflags_allow_spinning() being true.
+ *
+ * Specify __GFP_NOWARN since failing alloc_pages_nolock() is not a reason
+ * to warn. Also warn would trigger printk() which is unsafe from
+ * various contexts. We cannot use printk_deferred_enter() to mitigate,
+ * since the running context is unknown.
+ *
+ * Specify __GFP_ZERO to make sure that call to kmsan_alloc_page() below
+ * is safe in any context. Also zeroing the page is mandatory for
+ * BPF use cases.
+ *
+ * Though __GFP_NOMEMALLOC is not checked in the code path below,
+ * specify it here to highlight that alloc_pages_nolock()
+ * doesn't want to deplete reserves.
+ */
+static const gfp_t gfp_nolock = __GFP_NOWARN | __GFP_ZERO | __GFP_NOMEMALLOC |
+				__GFP_COMP;
+
+static __always_inline bool prepare_alloc_flags(gfp_t *gfp, unsigned int order,
+		unsigned int alloc_flags, unsigned int *prepared_alloc_flags,
+		unsigned int *fastpath_alloc_flags)
+{
+	/* Other flags could be supported later if needed. */
+	if (WARN_ON(alloc_flags & ~(ALLOC_NOLOCK | ALLOC_NO_CODETAG)))
+		return false;
+
+	if (!alloc_order_allowed(*gfp, order, alloc_flags))
+		return false;
+
+	*prepared_alloc_flags = alloc_flags;
+	*fastpath_alloc_flags = alloc_flags;
+
+	if (alloc_flags & ALLOC_NOLOCK) {
+		/* Certain other flags could be supported later if needed. */
+		VM_WARN_ON_ONCE(*gfp & ~(__GFP_ACCOUNT | gfp_nolock));
+		if (!alloc_nolock_allowed())
+			return false;
+		*gfp |= gfp_nolock;
+		*fastpath_alloc_flags |= ALLOC_WMARK_MIN;
+	} else {
+		*fastpath_alloc_flags |= ALLOC_WMARK_LOW;
+	}
+
+	return true;
+}
+
 /*
  * __alloc_pages_bulk - Allocate a number of order-0 pages to an array
  * @gfp: GFP flags for the allocation
@@ -5169,7 +5247,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	struct per_cpu_pages *pcp;
 	struct list_head *pcp_list;
 	struct alloc_context ac;
-	unsigned int fastpath_alloc_flags = ALLOC_WMARK_LOW;
+	unsigned int fastpath_alloc_flags;
 	int nr_populated = 0, nr_account = 0;
 
 	/*
@@ -5207,6 +5285,10 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 		goto failed;
 #endif
 
+	if (!prepare_alloc_flags(&gfp, 0, ALLOC_DEFAULT, &ac.alloc_flags,
+				 &fastpath_alloc_flags))
+		goto out;
+
 	/* May set ALLOC_NOFRAGMENT, fragmentation will return 1 page. */
 	gfp &= gfp_allowed_mask;
 	gfp = current_gfp_context(gfp);
@@ -5335,56 +5417,6 @@ void free_pages_bulk(struct page **page_array, unsigned long nr_pages)
 	}
 }
 
-static inline bool alloc_order_allowed(gfp_t gfp, unsigned int order,
-				       unsigned int alloc_flags)
-{
-	if (alloc_flags & ALLOC_NOLOCK)
-		return pcp_allowed_order(order);
-
-	/*
-	 * There are several places where we assume that the order value is sane
-	 * so bail out early if the request is out of bound.
-	 */
-	return !(WARN_ON_ONCE_GFP(order > MAX_PAGE_ORDER, gfp));
-}
-
-static inline bool alloc_nolock_allowed(void)
-{
-	if (!can_spin_trylock())
-		return false;
-
-	/* Bailout, since _deferred_grow_zone() needs to take a lock */
-	if (deferred_pages_enabled())
-		return false;
-
-	return true;
-}
-
-/*
- * GFP flags to set for ALLOC_NOLOCK i.e. alloc_pages_nolock().
- *
- * Do not specify __GFP_DIRECT_RECLAIM, since direct claim is not allowed.
- * Do not specify __GFP_KSWAPD_RECLAIM either, since wake up of kswapd
- * is not safe in arbitrary context.
- *
- * These two are the conditions for gfpflags_allow_spinning() being true.
- *
- * Specify __GFP_NOWARN since failing alloc_pages_nolock() is not a reason
- * to warn. Also warn would trigger printk() which is unsafe from
- * various contexts. We cannot use printk_deferred_enter() to mitigate,
- * since the running context is unknown.
- *
- * Specify __GFP_ZERO to make sure that call to kmsan_alloc_page() below
- * is safe in any context. Also zeroing the page is mandatory for
- * BPF use cases.
- *
- * Though __GFP_NOMEMALLOC is not checked in the code path below,
- * specify it here to highlight that alloc_pages_nolock()
- * doesn't want to deplete reserves.
- */
-static const gfp_t gfp_nolock = __GFP_NOWARN | __GFP_ZERO | __GFP_NOMEMALLOC |
-				__GFP_COMP;
-
 /*
  * This is the 'heart' of the zoned buddy allocator.
  */
@@ -5393,29 +5425,13 @@ struct page *__alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order,
 {
 	struct page *page;
 	gfp_t alloc_gfp; /* The gfp_t that was actually used for allocation */
-	struct alloc_context ac = {
-		.alloc_flags = alloc_flags,
-	};
-	unsigned int fastpath_alloc_flags = alloc_flags;
-
-	/* Other flags could be supported later if needed. */
-	if (WARN_ON(alloc_flags & ~(ALLOC_NOLOCK | ALLOC_NO_CODETAG)))
-		return NULL;
+	struct alloc_context ac;
+	unsigned int fastpath_alloc_flags;
 
-	if (!alloc_order_allowed(gfp, order, alloc_flags))
+	if (!prepare_alloc_flags(&gfp, order, alloc_flags, &ac.alloc_flags,
+				 &fastpath_alloc_flags))
 		return NULL;
 
-	if (alloc_flags & ALLOC_NOLOCK) {
-		/* Certain other flags could be supported later if needed. */
-		VM_WARN_ON_ONCE(gfp & ~(__GFP_ACCOUNT | gfp_nolock));
-		if (!alloc_nolock_allowed())
-			return NULL;
-		gfp |= gfp_nolock;
-		fastpath_alloc_flags |= ALLOC_WMARK_MIN;
-	} else {
-		fastpath_alloc_flags |= ALLOC_WMARK_LOW;
-	}
-
 	gfp &= gfp_allowed_mask;
 	/*
 	 * Apply scoped allocation constraints. This is mainly about GFP_NOFS
-- 
2.55.0

