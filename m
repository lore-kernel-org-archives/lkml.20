Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811660;
	b=xQdeHPwVBrr1q+7q6m/J+wWkGuWUzL6lJvzJ5hAC5f/gwA9TsdRXI6pbwW5yGOfgwLFO
	 Abaqv1gfyFRhFxxlAhTzgapSd3q12BzizmBEYyc2Gyt4rnRwgwLDn0AMhdg0xPY0ffe9J
	 /6OKycv5JyzLrmwticlv1M+MgB/fjy17Hrj6EJ+K4EOgfXc1iTsYdYB4+uV+fZ4/u8nFx
	 QO1iQ2BFcUqi8nPPMauYjZuFVDDVBo8DdMPd//EXtKT6uo/auVqr4Eqjdq9FdYHitBMeo
	 AA9x+r5YupkqTCDCWIgbX4pcryOfICICJMTzRYPHUmKPQevfdxUgHfokdNJWS8UyuzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811660;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=hGcbtCE0xSbWljRHzHfVhj7R0LXVbJXAi8zHRTVvrTw=;
	b=ML3SyXL4DfSgKMcX5P/Y1KAosPjpqkXP2b/olsLLXmLRfaZ0GA/QK0HWLUnCzm0TotwJ
	 mIBTjb1nREtVuZzly/+k2QIRLVPHrCTowyUNSgLyp+Qg1ITdm4d4+VRNyThZ/x32n0TIH
	 ev3m4rdsN9llnGWPdNkpBLUSrdgEb+Fac093GxPV7InWx2DVE7TJbTLilj5RoEbeRIm2W
	 nETlGogsM3kCR5EP/dLXljZJTDjOyuUpllBcKiJ265JvF+bGkSNLtNqA0Ccxw+oXghGa+
	 xE8HVnQLJteSjg30NtsMiFIkalnfxMkTg+AMgGmuvwzEUZrl1c5NCBfUNiFqd2XoJsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cyn4o4st;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECB4606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cyn4o4st
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330521F000C5;
	Mon, 16 Nov 2026 06:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811660;
	bh=hGcbtCE0xSbWljRHzHfVhj7R0LXVbJXAi8zHRTVvrTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Cyn4o4st0NP3iNx6tZjGKRw+K1yhHhaTSMrFJWUJhGFgTd6RPkeWQKeLQnElLISxm
	 oTfOG6thGik3y4hZOXKxDPYiD2K2wv2QQj7Hkc6vOPpPZrxHx/2XOe6hStDE7txWLU
	 UWssoLgEqdPqPbMIZYXNqnNyq9qgU++/+Advx2tIz1vaLN8PvWcnecu35eJzv5FmIf
	 LktidM7wpyUR+TjsYbiQmyJXXEpGBb1KRpqHkNqGvmQMIoX79l7DzT4ovTCwm6i1dC
	 hh27gKzP6ElV/lviQ318aW9Wx65U2ACr3JNJb/0R9iBSpUkczYrHesbv7LW97UPyq2
	 k24mdAeLMuxzg==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Mon, 16 Nov 2026 07:47:14 +0100
Subject: [PATCH v4 06/10] mm, slab: make SLUB_TINY handling dynamic for
 sizing decisions
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
Message-Id: <20261116-slub_tiny_rework-v4-6-227a4b3636a5@kernel.org>
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

Enabling CONFIG_SLUB_TINY results in the caches' min partial slabs
threshold to be zero, thus every slab where all objects become free is
freed immediately. It also sets the default slab_max_order to 1, with
the goal of reducing the potential of internal slab fragmentation.

Rework both of these decisions to be based on the newly introduced
slab_tiny_enabled flag instead of #ifdefs. It's still possible to
override the reduced slab_max_order with the boot parameter, as before.

Also adjust the same way the check in calculate_sheaf_capacity() that
sets sheaf capacity to 0 with slab_tiny.

Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 mm/slub.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 0238c990351c..9bd16e04ea24 100644
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
@@ -7706,8 +7701,7 @@ EXPORT_SYMBOL(kmem_cache_alloc_bulk_noprof);
  * take the list_lock.
  */
 static unsigned int slab_min_order;
-static unsigned int slab_max_order =
-	IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : PAGE_ALLOC_COSTLY_ORDER;
+static unsigned int slab_max_order = PAGE_ALLOC_COSTLY_ORDER;
 static unsigned int slab_min_objects;
 
 /*
@@ -8027,7 +8021,7 @@ static unsigned int calculate_sheaf_capacity(struct kmem_cache *s,
 	size_t size;
 
 
-	if (IS_ENABLED(CONFIG_SLUB_TINY) || s->flags & SLAB_DEBUG_FLAGS)
+	if (slab_tiny_enabled || s->flags & SLAB_DEBUG_FLAGS)
 		return 0;
 
 	/*
@@ -8763,6 +8757,9 @@ void __init kmem_cache_init(void)
 
 	slab_obj_ext_has_codetag_init();
 
+	if (slab_tiny_enabled)
+		slab_max_order = 1;
+
 	if (slab_max_order_param <= MAX_PAGE_ORDER)
 		slab_max_order = slab_max_order_param;
 
@@ -8886,6 +8883,8 @@ int do_kmem_cache_create(struct kmem_cache *s, const char *name,
 	 */
 	s->min_partial = min_t(unsigned long, MAX_PARTIAL, ilog2(s->size) / 2);
 	s->min_partial = max_t(unsigned long, MIN_PARTIAL, s->min_partial);
+	if (slab_tiny_enabled)
+		s->min_partial = 0;
 
 	s->cpu_sheaves = alloc_percpu(struct slub_percpu_sheaves);
 	if (!s->cpu_sheaves) {

-- 
2.56.0

