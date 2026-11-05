Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868265;
	b=InJizR4HdvhpYwa0CNkddMt3vhyAxJzEG+XzOvrimbkXO8sc4OqHUPwxdgOQhwhaomKJ
	 3YZAFxlFjw1gxP/sg1bSAvJ97sz4xRDQn+DX7WQJ5ALqI+3ancba5AhLE00DtmGrkrbZw
	 Qn57+ogyiXx6tdd5wA2IDQBggyWN1tFqatHMi//Az2xqGGPuJywKJ8RPMUgxiS4VU+ytk
	 V+fqT5wwOcgsdbyeUd6YhLVmLuTRAA+8pGtmKSjhlDquqkj0QLOx7D1L4IQzv4EKZA2CS
	 cwXga0Purc4dtkkuB3R0CwHdSOyGQzJMl8EFBsTcWsSIUuvBjjtBJ5lAFaJP/D9Cuig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868265;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=4YmAcXiBaWqfOLhWA2nJToqTdh1nYnyc3oVXmYHbXeE=;
	b=2qIdSeMQ+WRf5jFh5xrg8bIaZHexKdUTk608CvSfy+Y+SI7Um6ocfkbTWbGqoYCKzowl
	 o8JJjpcP7f9BHbTZwbYAEARHiaUHo96YpwN3efy87bPoRodvDUYyWzPra3Qto3jPW/dyO
	 RUawNbmFBY/dVfOvAESwFuoOESJv9EgiOl0HYKoqLbEYzMLT2T97Li62lCEQRpnVY4YYr
	 y6SP6hZQp2hUkx0RUm/tiLm4ztWNPknNoeNZgfD1At5D/ag9+Xw+lhNMpXeiu2jy3YBbB
	 m3t4ZFKMJTw0jjT8CGyJN3VZT+jtuMWTW1x5o6RtF4Tv4knYMGcMYLXklZQLKyQyHYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RYEs/81m";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304EB606D801
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RYEs/81m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C835B1F00919;
	Thu,  5 Nov 2026 08:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868265;
	bh=4YmAcXiBaWqfOLhWA2nJToqTdh1nYnyc3oVXmYHbXeE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RYEs/81mjOtYfXOQwKdLU8fXEGVFlTyyN4Yj+wE+uBaZjCFPQJqP/oYcD+eykzGqv
	 8TG5eFmmmdPF2bd7oJwlf1GcpGfNCmr+J08rWZAYRUkWErJXYFXGQ1EAhVTJmC2S1P
	 v9ASoluWh0GOBa1203l0ubd2XG5zljgQlyJXolhkqpAVVfxeauvhxJcOgg4BDMDyEI
	 /z5ybPmTUUq+w2Xy7Sjvq7QLNU35XPRBH3L5q78m0DozntnRDs1N2UnsYPu8Ho6ku4
	 LOYmHgNc1+jo5zYc3GFtlS2StzzsnzoqFgCoj/4GbOutTKWueCQWHnEPujguCep2/8
	 G0knYIAfQzgjw==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Thu, 05 Nov 2026 09:43:57 +0100
Subject: [PATCH v3 08/10] mm, slab: remove remaining compile-time checks
 for CONFIG_SLUB_TINY
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
Message-Id: <20261105-slub_tiny_rework-v3-8-0484ce59eabb@kernel.org>
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

Remove several minor aspect of CONFIG_SLUB_TINY to allow it to be fully
a boot-time decision:

- remove check in cache_has_sheaves(), with no change to functionality
  but only on code elimination

- remove SLAB_SUPPORTS_SYSFS dependency on !CONFIG_SLUB_TINY, thus
  /sys/kernel/slab will exist as long as CONFIG_SYSFS is enabled
  (for now leave SLAB_SUPPORTS_SYSFS around, can be cleaned up later)

- remove the control of __fastpath_inline so it's just a wrapper of
  __always_inline. Leave it also around for documenting the intent, can
  be revisited later.

- remove a comment for SLAB_NO_MERGE as we don't want new checks for
  CONFIG_SLUB_TINY

This leaves the only usage of CONFIG_SLUB_TINY in slab code to set the
value of slab_tiny_enabled around.

net/core/skbuff.c keeps using it to control SLAB_NO_MERGE but that can
be dealt with independently after the config is deprecated.

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 include/linux/slab.h | 2 +-
 mm/slab.h            | 7 +++----
 mm/slub.c            | 4 ----
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 930dd64b9ad6..ad645967a3ee 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -188,7 +188,7 @@ enum _slab_flag_bits {
  * - general caches created and used by a subsystem, only when a
  *   (subsystem-specific) debug option is enabled
  * - performance critical caches, should be very rare and consulted with slab
- *   maintainers, and not used together with CONFIG_SLUB_TINY
+ *   maintainers
  */
 #define SLAB_NO_MERGE		__SLAB_FLAG_BIT(_SLAB_NO_MERGE)
 
diff --git a/mm/slab.h b/mm/slab.h
index 7ea057fda751..d39ea67d44f4 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -282,16 +282,15 @@ struct kmem_cache {
 /*
  * Every cache has !NULL s->cpu_sheaves but they may point to the
  * bootstrap_sheaf temporarily during init, or permanently for the boot caches
- * and caches with debugging enabled, or all caches with CONFIG_SLUB_TINY. This
+ * and caches with debugging enabled (or all caches with slab_tiny). This
  * helper distinguishes whether cache has real non-bootstrap sheaves.
  */
 static inline bool cache_has_sheaves(struct kmem_cache *s)
 {
-	/* Test CONFIG_SLUB_TINY for code elimination purposes */
-	return !IS_ENABLED(CONFIG_SLUB_TINY) && s->sheaf_capacity;
+	return s->sheaf_capacity;
 }
 
-#if defined(CONFIG_SYSFS) && !defined(CONFIG_SLUB_TINY)
+#ifdef CONFIG_SYSFS
 #define SLAB_SUPPORTS_SYSFS 1
 void sysfs_slab_unlink(struct kmem_cache *s);
 void sysfs_slab_release(struct kmem_cache *s);
diff --git a/mm/slub.c b/mm/slub.c
index 1b7626645068..3b1491de5be7 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -196,11 +196,7 @@ enum slab_flags {
 	SL_pfmemalloc = PG_active,	/* Historical reasons for this bit */
 };
 
-#ifndef CONFIG_SLUB_TINY
 #define __fastpath_inline __always_inline
-#else
-#define __fastpath_inline
-#endif
 
 DEFINE_STATIC_KEY_MAYBE(CONFIG_SLUB_DEBUG_ON, slub_debug_enabled);
 

-- 
2.56.0

