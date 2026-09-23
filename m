Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A625335AA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178330; cv=none; b=QFcvicC+eZ+24dY9D9XlhFl9+ELKJEXkjyXjNrV7fmAxdohPKxxFHhr2n7OhdWEcCwCrSqsKWVU3szzF1d4r+vIUrgMud1krdV59WO/2vhKrYE8Pz4k9/++P9mweUUbmBFFgjlSB4HcCzQNMehnMl+xE0yPO04yyVU5n73qT1aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178330; c=relaxed/simple;
	bh=33FdYS7LcHQOUuVVbB724hi3rHicKValZW5fZAPUwE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sPpqVLZGEczeIiqMXfOR8EY90JSczlpPOjGP8qjqICIuCR3WbYF3Yeq8eBjfF9BtjA+kw3RiKxTp3ER2CbmNfgckztJeLc8+tMQZECsl8wgxgTy2wU6Md9tMQyg5QlrpLUFPF5zsUMJQRvuRjVveimiejzjMZ4FhpyXebSuKT9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7OTHLD4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7OTHLD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F671F000FF;
	Wed, 23 Sep 2026 15:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790178328;
	bh=NzT0YNZekEUjP9R0sb5doBa5YOLmVvxQILIsqj1HgT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h7OTHLD4zH6KwJ6BLFqpcKrGs3/t4gr+WYAn8O9Bo6UWEIK717FJcpQcPPo6FNOfL
	 As19/HSnO6zPWKxjEbIjEZrAgstc+GM7B+ikA2oa8Q+UYxtlCRBhuca6Lkb5PI7I1g
	 jpH4nyb9ASSYfAcWLvUiaOEM9z/dHG8Inr1gSxHLN13im1WQ4KK9nBgCDT4p960R96
	 mNcWU+OSWHFlUAjOyCO53HZHLgyLF/GhZALDFdPhq87GITelC3l52X2UEqERId29qn
	 wAGkz6H2+VvUk0NniOL6loNnfSem0f6VeI3P0tGaXVHY2IQRinHG7n23mREDpV4w3V
	 VEPH/eFmvOWgw==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Wed, 23 Sep 2026 17:45:09 +0200
Subject: [PATCH RFC 4/8] mm, slab: make SLUB_TINY handling dynamic for
 sizing decisions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-slub_tiny_rework-v1-4-a0e66d536eb5@kernel.org>
References: <20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org>
In-Reply-To: <20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org>
To: Harry Yoo <harry@kernel.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0

Enabling CONFIG_SLUB_TINY results in the caches' min partial slabs
threshold to be zero, thus every slab where all objects become free is
freed immediately. It also sets the default slab_max_order to 1, with
the goal of reducing the potential of internal slab fragmentation.

Rework both of these decisions to be based on the newly introduced
slab_tiny_enabled flag instead of #ifdefs. It's still possible to
override the reduced slab_max_order with the boot parameter, as before.

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 mm/slub.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 2a7b3b3b91b5..2c8477033700 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -272,7 +272,6 @@ void *fixup_red_left(struct kmem_cache *s, void *p)
 /* Enable to log cmpxchg failures */
 #undef SLUB_DEBUG_CMPXCHG
 
-#ifndef CONFIG_SLUB_TINY
 /*
  * Minimum number of partial slabs. These will be left on the partial
  * lists even if they are empty. kmem_cache_shrink may reclaim them.
@@ -285,10 +284,6 @@ void *fixup_red_left(struct kmem_cache *s, void *p)
  * sort the partial list by the number of objects in use.
  */
 #define MAX_PARTIAL 10
-#else
-#define MIN_PARTIAL 0
-#define MAX_PARTIAL 0
-#endif
 
 #define DEBUG_DEFAULT_FLAGS (SLAB_CONSISTENCY_CHECKS | SLAB_RED_ZONE | \
 				SLAB_POISON | SLAB_STORE_USER)
@@ -7604,8 +7599,7 @@ EXPORT_SYMBOL(kmem_cache_alloc_bulk_noprof);
  * take the list_lock.
  */
 static unsigned int slab_min_order;
-static unsigned int slab_max_order =
-	IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : PAGE_ALLOC_COSTLY_ORDER;
+static unsigned int slab_max_order = PAGE_ALLOC_COSTLY_ORDER;
 static unsigned int slab_min_objects;
 
 /*
@@ -7924,7 +7918,7 @@ static unsigned int calculate_sheaf_capacity(struct kmem_cache *s,
 	size_t size;
 
 
-	if (IS_ENABLED(CONFIG_SLUB_TINY) || s->flags & SLAB_DEBUG_FLAGS)
+	if (slab_tiny_enabled || s->flags & SLAB_DEBUG_FLAGS)
 		return 0;
 
 	/*
@@ -8660,6 +8654,9 @@ void __init kmem_cache_init(void)
 
 	slab_obj_ext_has_codetag_init();
 
+	if (slab_tiny_enabled)
+		slab_max_order = 1;
+
 	if (slab_max_order_param <= MAX_PAGE_ORDER)
 		slab_max_order = slab_max_order_param;
 
@@ -8783,6 +8780,8 @@ int do_kmem_cache_create(struct kmem_cache *s, const char *name,
 	 */
 	s->min_partial = min_t(unsigned long, MAX_PARTIAL, ilog2(s->size) / 2);
 	s->min_partial = max_t(unsigned long, MIN_PARTIAL, s->min_partial);
+	if (slab_tiny_enabled)
+		s->min_partial = 0;
 
 	s->cpu_sheaves = alloc_percpu(struct slub_percpu_sheaves);
 	if (!s->cpu_sheaves) {

-- 
2.55.0

