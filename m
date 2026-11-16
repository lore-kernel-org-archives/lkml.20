Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811653;
	b=L/ften7q7Vav40U73wNW7DqcdbbTPCy3ZhDa88Z/FOIW6iJHUUdlVxkLezVfsfZuFeC1
	 tlw3Y2R7w7/DN7MwpOWpPtPp4HZHdA+vm3b5NDS1mDGC+RoKIxWVHCKCZk75+M0zKRnB8
	 ob/JbBIz9v8Jj7q/aSYbZM/DckkmctPxT9oEciyoPFEOSc0yrRgQoh0xU4lJeTxlTmAh7
	 NG05XKGugCWGIdga4+v7PPl5OheTfXq/AgWftd6e45dvToSDT1zYF0/EvcqwHbPRSfxcw
	 tQc0pyMRWkEqmcv05Ea1bHa1svfrqTl+td2IcEnry+pX2zZhotEitzHMNBJ4AMyevrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811653;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=6OoPVgHbPcVlyg0bdAKK6MSz7k2hURzUkdi2cy+F0Uk=;
	b=I7to7O++2IbS7Di1P3Nph1t5kNWZ5Z45AoviDkjTNxKApcIgKr+5yC8/lnb6PTKv7/dK
	 XjtfDUhiICzz8bxKeSbmvDJ8ngXgX+4WR6zFQXan6oW1PsVx7B7YkG3B/phbuWkd/hobS
	 v7UBvYUh61PvoAQwcyIi+ZJTcQCwSZv5lH3vxkFdBUJiDTK3duJunHCEncLT8K9rilefX
	 sdii8kU3eEOwftluchwu1Inbm+SztNm0GVPJI0Ja+TQHaSGJeUofyr0ZgubJB+pv5DYMF
	 Rg8FGS2cpCGn3KNzFrOr9hC3TXSv60n/IkP6i3JGamMd9Su3trLFh/xfbukrgxBbE0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qq58fmit;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73854606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qq58fmit
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF6F1F000CA;
	Mon, 16 Nov 2026 06:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811653;
	bh=6OoPVgHbPcVlyg0bdAKK6MSz7k2hURzUkdi2cy+F0Uk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Qq58fmitITyVdc9xLE0LoygJhD+cMGyXK6uYcmcjAeynFwpLwjWxf28Kfj6L9MqF3
	 eM29Y35OXqX8M/K3WycCts5xYTBRe7+Y1p6ZyoC/UVFYXsrZysmG9d4nfYe2DzzSf2
	 5oHmYsRKF+qXcy8HHZigQGgEjyKEdUj7apNZ+FUhJyZdOdzQHxhTukbTRYWB8PPxwm
	 dyPgXK5nGhpuzCc0jAM3Kk0+qv1Kd9Hr7mPeJjHUvJEfUFzhvgKtepgaB8dsAx6AOb
	 H2Pa+aX4JAwWXa1o6thbqkf5Jwoqjqfi8kq+zE3AexcrqSeWKjkXgPlNLFuZ05mnYU
	 LVVX/2HXlS6Cw==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Mon, 16 Nov 2026 07:47:12 +0100
Subject: [PATCH v4 04/10] mm, slab: introduce slab_debug=N
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
Message-Id: <20261116-slub_tiny_rework-v4-4-227a4b3636a5@kernel.org>
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

Enabling slab_debug has the side-effect of disabling all percpu caching
of objects (now via sheaves), which can be sometimes useful for saving
memory for e.g. kdump kernels. To make this possible without the
overhead (CPU or memory) of actual debugging options such as poisoning,
introduce a No-op debug option that only forces the debugging slow paths
and zero sheaf capacity. The new corresponding slab flag is
SLAB_DEBUG_NOOP.

This will also allow reimplementing CONFIG_SLUB_TINY as a boot-time
option.

Two details have to be considered, as suggested by Harry Yoo [1].

- While SLAB_DEBUG_NOOP is part of SLAB_DEBUG_FLAGS, it should not
  prevent cache merging as it doesn't affect object metadata, and lack
  of merging would go against the memory footprint reduction. Thus
  exclude the flag from SLAB_NEVER_MERGE.

  - However add the flag to SLAB_MERGE_SAME, per sashiko. This needs to
    be reflected in create_unique_id() as well, which an earlier version
    didn't. Add comments to help not forgetting this the next time.
    While at it, remove unnecessary SLAB_CONSISTENCY_CHECKS handling in
    create_unique_id(), as it's part of SLAB_NEVER_MERGE.

- SLAB_DEBUG_NOOP alone should not request disabling printk pointer
  hashing. Thus rework the call to hash_pointers_finalize() to not rely
  on the slub_debug static key state. Instead determine whether the
  global or per-cache slab_debug options include any flags that are not
  SLAB_DEBUG_NOOP. This does not change the fact that caches created
  with explicit debug flags (i.e. slub_kunit tests) later in boot have
  no effect on pointer hashing, which is determined in
  kmem_cache_init().

While documenting the new N option, remove obsolete SLAB references from
the F option description.

[1] https://lore.kernel.org/all/arUx56ee_nkxYP_f@thinkstation/
[2] https://sashiko.dev/#/patchset/20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org?part=2

Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 Documentation/admin-guide/mm/slab.rst | 13 +++++++++++--
 include/linux/slab.h                  |  5 ++++-
 mm/slab.h                             |  2 +-
 mm/slab_common.c                      | 13 +++++++++----
 mm/slub.c                             | 30 ++++++++++++++++++++++++------
 5 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/Documentation/admin-guide/mm/slab.rst b/Documentation/admin-guide/mm/slab.rst
index 14429ab90611..0beeae71d472 100644
--- a/Documentation/admin-guide/mm/slab.rst
+++ b/Documentation/admin-guide/mm/slab.rst
@@ -45,12 +45,12 @@ of the first "select slabs" blocks that matches the slab's name are applied.
 
 Possible debug options are::
 
-	F		Sanity checks on (enables SLAB_DEBUG_CONSISTENCY_CHECKS
-			Sorry SLAB legacy issues)
+	F		Sanity (slab consistency) checks on alloc and free
 	Z		Red zoning
 	P		Poisoning (object and padding)
 	U		User tracking (free and alloc)
 	T		Trace (please only use on single slabs)
+	N		No-op (force debugging slowpaths without any checks)
 	A		Enable failslab filter mark for the cache
 	O		Switch debugging off for caches that would have
 			caused higher minimum slab orders
@@ -85,6 +85,15 @@ in low memory situations or if there's high fragmentation of memory.  To
 
 	slab_debug=O
 
+The No-op option can be useful to minimize slab memory overhead by forcing slab
+debugging slowpaths, which disables percpu object caching. This reduces SMP
+scalability significantly, but does not impose the extra cpu or memory overhead
+of debugging options that actually perform checks. This can be useful for e.g.
+kdump kernels where scalability is not a concern, but memory has to be
+pre-reserved from the production kernel. So for a kdump kernel you can use::
+
+	slab_debug=N
+
 You can apply different options to different list of slab names, using blocks
 of options. This will enable red zoning for dentry and user tracking for
 kmalloc. All other slabs will not get any debugging enabled::
diff --git a/include/linux/slab.h b/include/linux/slab.h
index cda126def67a..ed949e8522be 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -35,6 +35,7 @@ enum _slab_flag_bits {
 	_SLAB_PANIC,
 	_SLAB_TYPESAFE_BY_RCU,
 	_SLAB_TRACE,
+	_SLAB_DEBUG_NOOP,
 #ifdef CONFIG_DEBUG_OBJECTS
 	_SLAB_DEBUG_OBJECTS,
 #endif
@@ -166,8 +167,10 @@ enum _slab_flag_bits {
  * Note that SLAB_TYPESAFE_BY_RCU was originally named SLAB_DESTROY_BY_RCU.
  */
 #define SLAB_TYPESAFE_BY_RCU	__SLAB_FLAG_BIT(_SLAB_TYPESAFE_BY_RCU)
-/* Trace allocations and frees */
+/* DEBUG: Trace allocations and frees */
 #define SLAB_TRACE		__SLAB_FLAG_BIT(_SLAB_TRACE)
+/* DEBUG: Force the debug slowpaths without actually doing anything */
+#define SLAB_DEBUG_NOOP		__SLAB_FLAG_BIT(_SLAB_DEBUG_NOOP)
 
 /* Flag to prevent checks on free */
 #ifdef CONFIG_DEBUG_OBJECTS
diff --git a/mm/slab.h b/mm/slab.h
index e94ac63d10dc..79774e2be3bb 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -476,7 +476,7 @@ void flush_rcu_sheaves_on_cache(struct kmem_cache *s);
 			 SLAB_NO_USER_FLAGS | SLAB_KMALLOC | SLAB_NO_MERGE)
 
 #define SLAB_DEBUG_FLAGS (SLAB_RED_ZONE | SLAB_POISON | SLAB_STORE_USER | \
-			  SLAB_TRACE | SLAB_CONSISTENCY_CHECKS)
+			  SLAB_TRACE | SLAB_DEBUG_NOOP | SLAB_CONSISTENCY_CHECKS)
 
 #define SLAB_FLAGS_PERMITTED (SLAB_CORE_FLAGS | SLAB_DEBUG_FLAGS)
 
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 01c64ef661e7..4df73eda1090 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -47,12 +47,17 @@ struct kmem_cache *kmem_cache;
  * Any flag that adds per-object metadata should be included,
  * since slab merging can update s->inuse that affects the metadata layout.
  */
-#define SLAB_NEVER_MERGE (SLAB_DEBUG_FLAGS | SLAB_TYPESAFE_BY_RCU | \
-		SLAB_NOLEAKTRACE | SLAB_FAILSLAB | SLAB_NO_MERGE | \
-		SLAB_OBJ_EXT_IN_OBJ)
+#define SLAB_NEVER_MERGE ((SLAB_DEBUG_FLAGS & ~SLAB_DEBUG_NOOP) | \
+		SLAB_TYPESAFE_BY_RCU | SLAB_NOLEAKTRACE | SLAB_FAILSLAB | \
+		SLAB_NO_MERGE | SLAB_OBJ_EXT_IN_OBJ)
 
+/*
+ * Set of flags that caches need to both have or both not have in order to
+ * be mergeable. These need to be also reflected in create_unique_id().
+ */
 #define SLAB_MERGE_SAME (SLAB_RECLAIM_ACCOUNT | SLAB_CACHE_DMA | \
-			 SLAB_CACHE_DMA32 | SLAB_ACCOUNT | SLAB_MAY_ACCOUNT)
+			 SLAB_CACHE_DMA32 | SLAB_ACCOUNT | SLAB_MAY_ACCOUNT | \
+			 SLAB_DEBUG_NOOP)
 
 /*
  * Merge control. If this is set then no merging of slab caches will occur.
diff --git a/mm/slub.c b/mm/slub.c
index 30714557306d..3eff5ef4ac80 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1053,6 +1053,19 @@ static slab_flags_t slub_debug;
 static const char *slub_debug_string __ro_after_init;
 static int disable_higher_order_debug;
 
+/* Union of all slab debug flags enabled for specific caches only */
+static slab_flags_t slab_debug_per_cache_union __initdata;
+
+static inline bool __init slab_want_nohash_pointers(void)
+{
+	/*
+	 * If any debugging is enabled globally or per-cache, we would like
+	 * nohash pointers. The exception is no-op debugging that only forces
+	 * the slowpaths.
+	 */
+	return (slub_debug | slab_debug_per_cache_union) & ~SLAB_DEBUG_NOOP;
+}
+
 /*
  * Object debugging
  */
@@ -1898,6 +1911,9 @@ parse_slub_debug_flags(const char *str, slab_flags_t *flags, const char **slabs,
 		case 't':
 			*flags |= SLAB_TRACE;
 			break;
+		case 'n':
+			*flags |= SLAB_DEBUG_NOOP;
+			break;
 		case 'a':
 			*flags |= SLAB_FAILSLAB;
 			break;
@@ -1961,6 +1977,7 @@ static int __init setup_slub_debug(const char *str, const struct kernel_param *k
 			global_slub_debug_changed = true;
 		} else {
 			slab_list_specified = true;
+			slab_debug_per_cache_union |= flags;
 			if (flags & SLAB_STORE_USER)
 				stack_depot_request_early_init();
 		}
@@ -2069,6 +2086,8 @@ static inline void setup_object_debug(struct kmem_cache *s, void *object) {}
 static inline
 void setup_slab_debug(struct kmem_cache *s, struct slab *slab, void *addr) {}
 
+static inline bool __init slab_want_nohash_pointers(void) { return false; }
+
 static inline bool alloc_debug_processing(struct kmem_cache *s,
 	struct slab *slab, void *object, int orig_size) { return true; }
 
@@ -8755,7 +8774,7 @@ void __init kmem_cache_init(void)
 		slab_min_order = slab_max_order;
 
 	/* Inform pointer hashing choice about slub debugging state. */
-	hash_pointers_finalize(__slub_debug_enabled());
+	hash_pointers_finalize(slab_want_nohash_pointers());
 
 	kmem_cache_node = &boot_kmem_cache_node;
 	kmem_cache = &boot_kmem_cache;
@@ -9777,9 +9796,8 @@ static char *create_unique_id(struct kmem_cache *s)
 	/*
 	 * First flags affecting slabcache operations. We will only
 	 * get here for aliasable slabs so we do not need to support
-	 * too many flags. The flags here must cover all flags that
-	 * are matched during merging to guarantee that the id is
-	 * unique.
+	 * too many flags. The flags here must cover all flags from
+	 * SLAB_MERGE_SAME to guarantee that the id is unique.
 	 */
 	if (s->flags & SLAB_CACHE_DMA)
 		*p++ = 'd';
@@ -9787,10 +9805,10 @@ static char *create_unique_id(struct kmem_cache *s)
 		*p++ = 'D';
 	if (s->flags & SLAB_RECLAIM_ACCOUNT)
 		*p++ = 'a';
-	if (s->flags & SLAB_CONSISTENCY_CHECKS)
-		*p++ = 'F';
 	if (s->flags & SLAB_ACCOUNT)
 		*p++ = 'A';
+	if (s->flags & SLAB_DEBUG_NOOP)
+		*p++ = 'N';
 	if (p != name + 1)
 		*p++ = '-';
 	p += snprintf(p, ID_STR_LENGTH - (p - name), "%07u", s->size);

-- 
2.56.0

