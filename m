Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811657;
	b=pJdHCnXibgbg7pq7Yb+y1mIVrGjHps3lk+bOJsKBaaeiGL3Kl6VGUWQzi/n9ZlboENEL
	 wFyRzMRlligQ7s8nPIcEvUh7qTIKereyPUllGxCEgd0vGYg9vQxSEKWY9Z2nJ8cK+iuE7
	 1ZilLQrl+BqAYw8SnD4JP/CmU/RlmFcYNeFfTqtgOl0j/BXzugFQ/oGF0sX/Eveo+Zc7v
	 IxgaafYgVQNrRxfa5vyL8+OMXdxj9CyYLv/Bi+lAYtF6WPFzmkZebqYSL+BfB4/qtWGOR
	 UWX2qg2L3a+bT76RkCowC7jzyFbRIO+fgfBOIeB1z44uPyY9sPM7rWp+SWZVTj4Ycvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811657;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=YtLIbSo48K9CccVqc5phPEZBBM23ut66AAk1YeVVHH4=;
	b=gr7u+FAp7HAwKF34OaZbdA33/t+3rxkGiehVdbTC9+OgKL9FS7PJdXo+UMRaVSxbtN1m
	 Y+R2j53ghMjo7uG01gGqsZswHV4T2nUpABAATHJwLNvaJ5nms2EFU+tMWqofybxz/VHt0
	 +FTURAy7X6pqX5RmF5bLtajR3doluw1HWiv88dYophz4yhBOEzIs91xFNHuqn17NkNueK
	 bg6yvCtPGaNc9toWEkxWHTKkTIjBxI7YK7iLNX19XSwXgjQLGEOC9DNzoZxISGiIGg8vd
	 cDCZbRQguDDZkSa2pb6sh5KfGeryjEe1Bh9ps5Kwyrqi/TixGa57hw5J+O2g5qUcLgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WyciufVo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBDA606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WyciufVo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCF81F000C4;
	Mon, 16 Nov 2026 06:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811656;
	bh=YtLIbSo48K9CccVqc5phPEZBBM23ut66AAk1YeVVHH4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WyciufVoqkp3MohcOppU5Y+0Cvp0Y58i56WSsRZke9g0zuhifQXzWP2NvUoym2HPm
	 UcR84Z7qj8ju8MAZIXLIf1pohaHngjJhQKIr3/lEqqs0s/jXGLqKzbiIiFUIec24bb
	 jlSUc4B7W1Mj8kdcRMXTcqMXgImk6RRsQR52rs3M/Q2kyvTHujplkvtAW3bGeqDeou
	 ApfHEr2Vur0ev8sp2hEoRVyMxCFmUbfPrYJVc6MoQCyaECcccNULkQHTX9pY+3q7yH
	 aYhocGpkPWiEtp7Y70+84cah8vrmzqcGNKn/ES0iGVX3b1mTFH1Fgov39+q4HIai6G
	 Y8UIctPOCUKFg==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Mon, 16 Nov 2026 07:47:13 +0100
Subject: [PATCH v4 05/10] mm, slab: rework KMALLOC_RECLAIM handling of
 SLUB_TINY
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
Message-Id: <20261116-slub_tiny_rework-v4-5-227a4b3636a5@kernel.org>
References: <20261116-slub_tiny_rework-v4-0-227a4b3636a5@kernel.org>
In-Reply-To: <20261116-slub_tiny_rework-v4-0-227a4b3636a5@kernel.org>
To: Harry Yoo <harry@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
 Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0

One (relatively minor) aspect of CONFIG_SLUB_TINY is the assumption that
letting reclaimable and non-reclaimable caches merge will save more
memory, which is more important on small systems than the page allocator
level fragmentation (where distinguishing reclaimable slabs should
help).

For now that has been achieved by #ifdefs that result in making the
SLAB_RECLAIM_ACCOUNT no-op and aliasing KMALLOC_RECLAIM to
KMALLOC_NORMAL on the enum values level.

With the goal of converting CONFIG_SLUB_TINY to a boot-time decision,
rework this so that SLAB_RECLAIM_ACCOUNT and KMALLOC_RECLAIM are
distinctly defined always. Now, creation of kmalloc-rcl caches is
avoided by assigning a pointer to the normal kmalloc cache on the
kmalloc_caches array level.

To prepare disconnecting of this boot-time decision (and the evaluation
of the need for kmalloc_no_objext) from CONFIG_SLUB_TINY, introduce a
slab_tiny_enabled variable that's initialized to the CONFIG_SLUB_TINY
state.

Since SLAB_RECLAIM_ACCOUNT is not 0 anymore, caches that differ only in
that flag would stop being mergeable. To avoid this potential impact on
memory footprint, start dropping the flag on cache creation when
slab_tiny_enabled is true.

Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 include/linux/slab.h | 10 ----------
 mm/slab.h            |  5 +++--
 mm/slab_common.c     | 15 +++++++++------
 mm/slub.c            |  2 ++
 4 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index ed949e8522be..930dd64b9ad6 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -55,9 +55,7 @@ enum _slab_flag_bits {
 #ifdef CONFIG_KFENCE
 	_SLAB_SKIP_KFENCE,
 #endif
-#ifndef CONFIG_SLUB_TINY
 	_SLAB_RECLAIM_ACCOUNT,
-#endif
 	_SLAB_OBJECT_POISON,
 	_SLAB_CMPXCHG_DOUBLE,
 #ifdef CONFIG_SLAB_OBJ_EXT
@@ -241,11 +239,7 @@ enum _slab_flag_bits {
  * pages are allocated with __GFP_RECLAIMABLE, which affects grouping pages by
  * mobility, and are accounted in SReclaimable counter in /proc/meminfo
  */
-#ifndef CONFIG_SLUB_TINY
 #define SLAB_RECLAIM_ACCOUNT	__SLAB_FLAG_BIT(_SLAB_RECLAIM_ACCOUNT)
-#else
-#define SLAB_RECLAIM_ACCOUNT	__SLAB_FLAG_UNUSED
-#endif
 #define SLAB_TEMPORARY		SLAB_RECLAIM_ACCOUNT	/* Objects are short-lived */
 
 /* Slab caches without obj_exts array */
@@ -724,11 +718,7 @@ enum kmalloc_cache_type {
 #endif
 	KMALLOC_PARTITION_START = KMALLOC_NORMAL,
 	KMALLOC_PARTITION_END = KMALLOC_PARTITION_START + KMALLOC_PARTITION_CACHES_NR,
-#ifdef CONFIG_SLUB_TINY
-	KMALLOC_RECLAIM = KMALLOC_NORMAL,
-#else
 	KMALLOC_RECLAIM,
-#endif
 #ifdef CONFIG_ZONE_DMA
 	KMALLOC_DMA,
 #endif
diff --git a/mm/slab.h b/mm/slab.h
index 79774e2be3bb..835d977634ec 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -396,6 +396,8 @@ extern const struct kmalloc_info_struct {
 	unsigned int size;
 } kmalloc_info[];
 
+extern bool slab_tiny_enabled;
+
 /* Kmalloc array related functions */
 void setup_kmalloc_cache_index_table(void);
 void create_kmalloc_caches(void);
@@ -576,8 +578,7 @@ static inline bool need_kmalloc_no_objext(void)
 	if (!mem_alloc_profiling_permanently_disabled())
 		return true;
 
-	if (!mem_cgroup_kmem_disabled() &&
-			(KMALLOC_NORMAL == KMALLOC_RECLAIM))
+	if (!mem_cgroup_kmem_disabled() && slab_tiny_enabled)
 		return true;
 
 	return false;
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 4df73eda1090..bd31184e0642 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -352,6 +352,9 @@ struct kmem_cache *__kmem_cache_create_args(const char *name,
 	if (args->sheaf_capacity)
 		flags |= SLAB_NO_MERGE;
 
+	if (slab_tiny_enabled)
+		flags &= ~SLAB_RECLAIM_ACCOUNT;
+
 	mutex_lock(&slab_mutex);
 
 	err = kmem_cache_sanity_check(name, object_size);
@@ -840,11 +843,7 @@ EXPORT_SYMBOL(kmalloc_size_roundup);
 #define KMALLOC_CGROUP_NAME(sz)
 #endif
 
-#ifndef CONFIG_SLUB_TINY
 #define KMALLOC_RCL_NAME(sz)	.name[KMALLOC_RECLAIM] = "kmalloc-rcl-" #sz,
-#else
-#define KMALLOC_RCL_NAME(sz)
-#endif
 
 #ifdef CONFIG_KMALLOC_PARTITION_CACHES
 #define __KMALLOC_PARTITION_CONCAT(a, b) a ## b
@@ -981,7 +980,11 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
 	unsigned int aligned_size = kmalloc_info[idx].size;
 	int aligned_idx = idx;
 
-	if ((KMALLOC_RECLAIM != KMALLOC_NORMAL) && (type == KMALLOC_RECLAIM)) {
+	if (type == KMALLOC_RECLAIM) {
+		if (slab_tiny_enabled) {
+			kmalloc_caches[type][idx] = kmalloc_caches[KMALLOC_NORMAL][idx];
+			return;
+		}
 		flags |= SLAB_RECLAIM_ACCOUNT;
 	} else if (IS_ENABLED(CONFIG_MEMCG) && (type == KMALLOC_CGROUP)) {
 		if (mem_cgroup_kmem_disabled()) {
@@ -1014,7 +1017,7 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
 	 * KMALLOC_NO_OBJ_EXT cache.
 	 */
 	if (!mem_cgroup_kmem_disabled()) {
-		if (type == KMALLOC_NORMAL && KMALLOC_RECLAIM != KMALLOC_NORMAL)
+		if (type == KMALLOC_NORMAL && !slab_tiny_enabled)
 			flags |= SLAB_NO_MERGE;
 		else if (!(flags & SLAB_NO_OBJ_EXT))
 			flags |= SLAB_MAY_ACCOUNT;
diff --git a/mm/slub.c b/mm/slub.c
index 3eff5ef4ac80..0238c990351c 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -219,6 +219,8 @@ DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
 			slab_obj_ext_has_codetag_key);
 #endif
 
+bool slab_tiny_enabled __read_mostly = IS_ENABLED(CONFIG_SLUB_TINY);
+
 /* Structure holding extra parameters for slab allocations */
 struct slab_alloc_context {
 	unsigned long caller_addr;

-- 
2.56.0

