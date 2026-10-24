Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792868864;
	b=2j26ipH4Sv1xbdyXXc0VWsCu6tm0HQeB7Ewk9ndheHjqok/y3X9aCjMol4Sc6aOgDRvC
	 jxfo6uXwJMn4spQuEMVXTwu1CnhrUCw3mK1P1JwH/6jvcd9phpjem4rKjfbr2XeC/ygJ2
	 DxWta4VUmvpfNGfhp7iRwD52TTyDUoNXnSzugeoyRi414tH8dgNKaCLajaVOxAxdl6G9Q
	 DWunBXpZUyamQWi/Itxwy2c8pSoWmeW6kYlakVP1H04MaMmvdMPhvoQJDYJd90UGm0Ze9
	 ZcMOnA1euWexWf4XS6gV6yg1Wtoroiyq5e/TJUzKluOSGDuePmoPQ6MyjwUqb8nM5cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792868864;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=MZjaY6QuOHRtN96A5SO2kORXdqjBzKooIBWrk23AQ4w=;
	b=i9MzqUbAtImOiKsVvAszaScSbaypnifHlcFNBtwK6VQax1rAEM6VfRwpE+XIf6wn0N03
	 qMSBIHK1rssErVRIdG52RYoKVa0tmksNPdT1DqGZfZRHqCPRZUPPiB4EIxaB5azdFa/F+
	 jcyb/9qasl4brtD3g5+x8l0bRqWcmXGXFVCMhDKvKXRnnU5S/2EZAxdzHg+gAmfR3e3y4
	 skvqN01WEw1sEhvh4lerpk4q8ol0rubz5fhGbB2RJvG7lW/7oMgck3uooNoFXDQCSskph
	 Y+kFT6xDTBPTV2bbcs9tZ7AewYPVxyJW7QE2YCmdIbWRuYmZuRLE8nVNM+SFP4h4tHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZC0mt9T7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F71606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZC0mt9T7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91ABC1F031E3;
	Sat, 24 Oct 2026 19:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792868863;
	bh=MZjaY6QuOHRtN96A5SO2kORXdqjBzKooIBWrk23AQ4w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZC0mt9T7mmveHc8v5XsDnpeWpmf9YjMXcXaad3CWhh3noCVU2hsUN+gDJ1aYjOs/o
	 ALjjJReZdiCIuNlgHhOScoX81pOFnErNOIWClCpAXaLMPk8vxbf/0Z+a+ugZbrKyfE
	 0akn6be13wFtI2PXX8zpgEg1I55iVW91qRsz/90Psc89N3/47h1wLjKCY4IzNB+P1u
	 cNP7QkDrNEfGNOLwc+GjzjY5CUsks+9Xu1LtnkqF5HN6CPfW8QVMBzYfcG7ZJum2w/
	 PDJhBzoZC/wO/c4+QHMFV1pg3gf2PIzfh91jMRHteyHGXh61rxi3aR+IKOFwAFlETu
	 GFqGbDRnvmyPA==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Sat, 24 Oct 2026 21:07:25 +0200
Subject: [PATCH RFC v2 3/8] mm, slab: rework KMALLOC_RECLAIM handling of
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
Message-Id: <20261024-slub_tiny_rework-v2-3-bf1419ab5ffd@kernel.org>
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
slub_tiny_enabled variable that's initialized to the CONFIG_SLUB_TINY
state.

There is one minor functional change for CONFIG_SLUB_TINY=y. Since
SLAB_RECLAIM_ACCOUNT is not 0 anymore, caches that differ only in that
flag will stop being mergeable. If that turns out to have a noticeable
impact on memory footprint, we can adjust the merging decisions to
ignore SLAB_RECLAIM_ACCOUNT when slub_tiny_enabled is true.

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 include/linux/slab.h | 10 ----------
 mm/slab.h            |  5 +++--
 mm/slab_common.c     | 12 ++++++------
 mm/slub.c            |  2 ++
 4 files changed, 11 insertions(+), 18 deletions(-)

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
index 02dfe4351e8b..33e76a0c3084 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -835,11 +835,7 @@ EXPORT_SYMBOL(kmalloc_size_roundup);
 #define KMALLOC_CGROUP_NAME(sz)
 #endif
 
-#ifndef CONFIG_SLUB_TINY
 #define KMALLOC_RCL_NAME(sz)	.name[KMALLOC_RECLAIM] = "kmalloc-rcl-" #sz,
-#else
-#define KMALLOC_RCL_NAME(sz)
-#endif
 
 #ifdef CONFIG_KMALLOC_PARTITION_CACHES
 #define __KMALLOC_PARTITION_CONCAT(a, b) a ## b
@@ -976,7 +972,11 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
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
@@ -1009,7 +1009,7 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
 	 * KMALLOC_NO_OBJ_EXT cache.
 	 */
 	if (!mem_cgroup_kmem_disabled()) {
-		if (type == KMALLOC_NORMAL && KMALLOC_RECLAIM != KMALLOC_NORMAL)
+		if (type == KMALLOC_NORMAL && !slab_tiny_enabled)
 			flags |= SLAB_NO_MERGE;
 		else if (!(flags & SLAB_NO_OBJ_EXT))
 			flags |= SLAB_MAY_ACCOUNT;
diff --git a/mm/slub.c b/mm/slub.c
index 51daf361c601..a3ee1bdf0eb3 100644
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

