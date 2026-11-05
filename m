Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868258;
	b=rZwS1z6J4ZMqu2RsSyi8EC8rC4g3AT4QpJF4jDCDq2C9PzJZubUIXGWyOKLgK08NGtH7
	 KFkqZ+3Z/vQFNgAxcDyZs34FAo8Lgf+5wfJDamqdGIiw6sDOJ0NwzKGDt06JgEPZGMc4M
	 dXmKUCZ460+OuQR2fTT71cCt1mcsZ8Rt7tuxhZJQjbN0AvjXhpBZ/jrYy/rPtfhhEkvLY
	 +5A2XS3mChWROFFGfI0hQscKTDq56xbzki75rohJQ4BooY6JOvV8/tzS0dC5eJbTQiZEn
	 pNAzWEXLBxCDgTJKVq+eNdG7RcrEfEkDdzo0DIUvdr7sDySMtRplOh+uo9VQTzQf2/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868258;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=ZaNkuK+CuZCH16Zfn9adKcMMnVfFDERJiwr1XCFoM7M=;
	b=4Z6Q9vQf1T8oniO8MYTZ14ERcwxHbBunjasLcizOYAy6eVx7v0EEpdFDnkfbB/KNvsJM
	 OjAk+4NY+/IIoUNYeOgY5bXU31xKpcPqrsnxczJVrWIZd2/4B7s1sYudHp88pqfDgNMYW
	 CjXMH2NVdYkYZs5Aj3FCz9ftLAE/KKrqkDkOxkYsvu7RLS7xBhRmG8ALUmzjdt4nKsUe5
	 ulZW5epz3f1mImnPdCXHy1ITsck9rDPtN0EpXFeCo77H0zxS264uGwgN81xY0vAJvJo4N
	 iRalNdpriWaMeHJkPldevrE2a3xd1O0dSIQYBkbDcVAGkRObUuBsyAK48zhKSL9Dzyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xl6rJmUN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED15606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xl6rJmUN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709831F00A15;
	Thu,  5 Nov 2026 08:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868257;
	bh=ZaNkuK+CuZCH16Zfn9adKcMMnVfFDERJiwr1XCFoM7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Xl6rJmUN/DWrJon99nZtxTbfk5UDamIX8Eq/y4HE94KYkSeXgDheIx+53+ZQXd1Mu
	 0k/BcEHNgJQsE7TMa0C3mD1aclFY0HQgwxmwGUdYvkPy5Y5QXplmW0GjNqokKIbklS
	 9iz0MpLl7bh6vPvauR9kFF/es4F1pI94mOdmOXv7NqAZ/GtvlVvyfM5Bn1RYdz2mjy
	 omCm9bRJ67oFRb4w6BgXx9sow/DiQOP3Yt/y+fmktLRG05HRq/QLdnXVmrOpx7iPiZ
	 G3Fuw4HJgbR2Lf/LgqGjojP4OkERYm/vSAr8k8gXDTmWnvSaeeC3oqHV4mq/T8zR1z
	 YLOG9Herkid2w==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Thu, 05 Nov 2026 09:43:55 +0100
Subject: [PATCH v3 06/10] mm, slab: make SLUB_TINY handling dynamic for
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
Message-Id: <20261105-slub_tiny_rework-v3-6-0484ce59eabb@kernel.org>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
In-Reply-To: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
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

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 mm/slub.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index a3ee1bdf0eb3..be4e1f193295 100644
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

