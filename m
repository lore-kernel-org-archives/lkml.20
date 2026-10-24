Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792868869;
	b=zdCExO/i+aNqPLhYuuRtU5sPo1xT65QbfDi8NCqAOIl8Qm1rbg1hUJFmHz10US880604
	 KhIb1zTkPjyfvNnHO62zvo3Dp2DV9a84ltkR8C6y1OuURVZ3ZNzX4Q2AAGYCn6RdN/LLS
	 3Lj80k+YCez0wfE480qYN0bqvMX3+mTVaBk/qkJ3GP2ts6hWF3fhCfqHWDUwvkvi9fiUo
	 uJ8CX78MKpsGEwHOelsStqtCUe3VbRc0Te0fSFm9kBSy8f3UaU1QbhpoKBzPgrdZvj7qa
	 knBgg+jLzgZWns/kZPmQ1DCVDJRHeszT3sN3qbOR/eKOIWrXgSygRSqHEJj38iFAWQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792868869;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=tsjt9E/SOoMFBDvFXKXQOgR8qFXU1RBSyugeCKhoESM=;
	b=LWK2zI/HTBo5UQRKAAoCXAZyOFYElVMsF9k0qbt1MUvKGoPq3Q6e0oTd2UU45qQWSxY4
	 4s6BtY6Wx+McxlVti+1OQPpmIXwF2R8n3T2O3/hsk0dwknfHSTZ+MGJhFCDy2tslwE7jw
	 +LDUNJZKkaX52wXwyyZ2+4X5vpbW0aYt1NmCqZ2NNaOuiRPAxfm2QCDhdyOsxcQys6TxY
	 B/m06p6LcHapIUE2qVefmcOHBAazcjw1lgcR26x2PdnWyF974ic7QG09xKjoDjfVSzBzz
	 J6On1smpwK1KBobny8tyMTr+8FlLzxQh452ctC/59OPF8AaPmEA8/sWV1PMkqoa5dPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nucx+XVY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6705E606A336
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nucx+XVY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62ED1F031E0;
	Sat, 24 Oct 2026 19:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792868868;
	bh=tsjt9E/SOoMFBDvFXKXQOgR8qFXU1RBSyugeCKhoESM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Nucx+XVYwwVGg4eFZl1aC9NIMOgjyNaPQuHlO6eke6iYmUq9BZBX/xuWu5caPvA4l
	 +p3rsn5fb8X9mpDFTSr1IAeCsh96BMCU5W7MxD4EVXSA8utmcRtUKaIkCx8UaxsU4F
	 9Tn17iLD7ivEjiFcV4JOF+7pdDig0WQ1hzxkcCzHndDaOjgHK2plIJ5pyHUTPFOLw/
	 X/1Hod65+UxoSDdJfvsdxvxhQg0ENvHJEwNuGUq3VdQ5rBWZrZeVHrvqhOvAr4Qfwe
	 HuWbQPvmBFmTJ9Q8XZh9iFxaKW+TOVERDv+qZl+SupDBhX+NwsXr5SvZAltP83GHS4
	 d4yAMmGOUsgyw==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Sat, 24 Oct 2026 21:07:27 +0200
Subject: [PATCH RFC v2 5/8] mm, slab: convert CONFIG_SLUB_TINY checks to
 kmem_cache_debug()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-slub_tiny_rework-v2-5-bf1419ab5ffd@kernel.org>
References: <20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org>
In-Reply-To: <20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org>
To: Harry Yoo <harry@kernel.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
 Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0

CONFIG_SLUB_TINY shares several slowpaths with debugging as both of them
avoid percpu caching of objects. With the goal of replacing the config
with a boot-time decision, extend this sharing by hooking
slab_tiny_enabled into kmem_cache_debug() check itself.

This is made possible by the new SLAB_DEBUG_NOOP debug flag. Make
slub_debug_enabled static key always available (not just with
CONFIG_SLUB_DEBUG enabled) and have slab_tiny_enabled add
SLAB_DEBUG_NOOP to all caches in kmem_cache_flags(). Do this also in the
CONFIG_SLUB_DEBUG variant, which is currently exclusive with
CONFIG_SLUB_TINY, but that will be lifted later.

Remove the various IS_ENABLED(CONFIG_SLUB_TINY) checks that
complement kmem_cache_debug() checks as they are no longer necessary.

While removing/adjusting the CONFIG_SLUB_DEBUG #ifdefs, also convert
CONFIG_SLUB_DEBUG_ON to *_STATIC_KEY_MAYBE().

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 mm/slab.h | 18 ++++++------------
 mm/slub.c | 38 ++++++++++++++++++--------------------
 2 files changed, 24 insertions(+), 32 deletions(-)

diff --git a/mm/slab.h b/mm/slab.h
index 835d977634ec..7ea057fda751 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -506,26 +506,20 @@ struct slabinfo {
 
 void get_slabinfo(struct kmem_cache *s, struct slabinfo *sinfo);
 
-#ifdef CONFIG_SLUB_DEBUG
-#ifdef CONFIG_SLUB_DEBUG_ON
-DECLARE_STATIC_KEY_TRUE(slub_debug_enabled);
-#else
-DECLARE_STATIC_KEY_FALSE(slub_debug_enabled);
-#endif
-extern void print_tracking(struct kmem_cache *s, void *object);
-long validate_slab_cache(struct kmem_cache *s);
+DECLARE_STATIC_KEY_MAYBE(CONFIG_SLUB_DEBUG_ON, slub_debug_enabled);
+
 static inline bool __slub_debug_enabled(void)
 {
 	return static_branch_unlikely(&slub_debug_enabled);
 }
+
+#ifdef CONFIG_SLUB_DEBUG
+extern void print_tracking(struct kmem_cache *s, void *object);
+long validate_slab_cache(struct kmem_cache *s);
 #else
 static inline void print_tracking(struct kmem_cache *s, void *object)
 {
 }
-static inline bool __slub_debug_enabled(void)
-{
-	return false;
-}
 #endif
 
 /*
diff --git a/mm/slub.c b/mm/slub.c
index be4e1f193295..1b7626645068 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -202,13 +202,7 @@ enum slab_flags {
 #define __fastpath_inline
 #endif
 
-#ifdef CONFIG_SLUB_DEBUG
-#ifdef CONFIG_SLUB_DEBUG_ON
-DEFINE_STATIC_KEY_TRUE(slub_debug_enabled);
-#else
-DEFINE_STATIC_KEY_FALSE(slub_debug_enabled);
-#endif
-#endif		/* CONFIG_SLUB_DEBUG */
+DEFINE_STATIC_KEY_MAYBE(CONFIG_SLUB_DEBUG_ON, slub_debug_enabled);
 
 #ifdef CONFIG_NUMA
 static DEFINE_STATIC_KEY_FALSE(strict_numa);
@@ -1041,11 +1035,7 @@ static inline void *restore_red_left(struct kmem_cache *s, void *p)
 /*
  * Debug settings:
  */
-#if defined(CONFIG_SLUB_DEBUG_ON)
-static slab_flags_t slub_debug = DEBUG_DEFAULT_FLAGS;
-#else
-static slab_flags_t slub_debug;
-#endif
+static slab_flags_t slub_debug = IS_ENABLED(CONFIG_SLUB_DEBUG_ON) ? DEBUG_DEFAULT_FLAGS : 0;
 
 static const char *slub_debug_string __ro_after_init;
 static int disable_higher_order_debug;
@@ -2032,6 +2022,9 @@ slab_flags_t kmem_cache_flags(slab_flags_t flags, const char *name)
 	slab_flags_t block_flags;
 	slab_flags_t slub_debug_local = slub_debug;
 
+	if (slab_tiny_enabled)
+		flags |= SLAB_DEBUG_NOOP;
+
 	if (flags & SLAB_NO_USER_FLAGS)
 		return flags;
 
@@ -2104,6 +2097,9 @@ static inline void remove_full(struct kmem_cache *s, struct kmem_cache_node *n,
 					struct slab *slab) {}
 slab_flags_t kmem_cache_flags(slab_flags_t flags, const char *name)
 {
+	if (slab_tiny_enabled)
+		flags |= SLAB_DEBUG_NOOP;
+
 	return flags;
 }
 #define slub_debug 0
@@ -3964,7 +3960,7 @@ static void *get_from_partial_node(struct kmem_cache *s,
 		if (!pfmemalloc_match(slab, gfp_flags))
 			continue;
 
-		if (IS_ENABLED(CONFIG_SLUB_TINY) || kmem_cache_debug(s)) {
+		if (kmem_cache_debug(s)) {
 			object = alloc_single_from_partial(s, n, slab,
 							ac->orig_size);
 			if (object)
@@ -4578,7 +4574,7 @@ static unsigned int alloc_from_new_slab(struct kmem_cache *s, struct slab *slab,
 
 /*
  * Slow path. We failed to allocate via percpu sheaves or they are not available
- * due to bootstrap or debugging enabled or SLUB_TINY.
+ * due to bootstrap or debugging enabled.
  *
  * We try to allocate from partial slab lists and fall back to allocating a new
  * slab.
@@ -4632,7 +4628,7 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
 
 	stat(s, ALLOC_SLAB);
 
-	if (IS_ENABLED(CONFIG_SLUB_TINY) || kmem_cache_debug(s)) {
+	if (kmem_cache_debug(s)) {
 		object = alloc_single_from_new_slab(s, slab, ac);
 
 		if (likely(object))
@@ -5861,7 +5857,7 @@ static void __slab_free(struct kmem_cache *s, struct slab *slab,
 	unsigned long flags;
 	bool on_node_partial;
 
-	if (IS_ENABLED(CONFIG_SLUB_TINY) || kmem_cache_debug(s)) {
+	if (kmem_cache_debug(s)) {
 		free_to_partial_list(s, slab, head, tail, cnt, addr);
 		return;
 	}
@@ -7573,7 +7569,7 @@ static bool __kmem_cache_alloc_bulk(struct kmem_cache *s, gfp_t flags,
 {
 	int i;
 
-	if (IS_ENABLED(CONFIG_SLUB_TINY) || kmem_cache_debug(s)) {
+	if (kmem_cache_debug(s)) {
 		const struct slab_alloc_context ac = {
 			.caller_addr = _RET_IP_,
 			.orig_size = s->object_size,
@@ -7874,7 +7870,7 @@ static int init_percpu_sheaves(struct kmem_cache *s)
 		 * cache.
 		 *
 		 * We keep bootstrap_sheaf for kmem_cache and kmem_cache_node,
-		 * caches with debug enabled, and all caches with SLUB_TINY.
+		 * and caches with debugging enabled.
 		 * For kmalloc caches it's used temporarily during the initial
 		 * bootstrap.
 		 */
@@ -8691,7 +8687,7 @@ static void __init bootstrap_cache_sheaves(struct kmem_cache *s)
 
 	capacity = calculate_sheaf_capacity(s, &empty_args);
 
-	/* capacity can be 0 due to debugging or SLUB_TINY */
+	/* capacity can be 0 due to debugging */
 	if (!capacity)
 		return;
 
@@ -8757,8 +8753,10 @@ void __init kmem_cache_init(void)
 
 	slab_obj_ext_has_codetag_init();
 
-	if (slab_tiny_enabled)
+	if (slab_tiny_enabled) {
 		slab_max_order = 1;
+		static_branch_enable(&slub_debug_enabled);
+	}
 
 	if (slab_max_order_param <= MAX_PAGE_ORDER)
 		slab_max_order = slab_max_order_param;

-- 
2.56.0

