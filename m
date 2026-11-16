Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811668;
	b=KQ97HJ2l2ruAvEffAa2WgmiZTHzU32VtHxQJ1hk6t8t0GJtlBUz9wHreA584NDaN+mtX
	 dCHhCdVux9PbwZzypdkPAWXRjjg9J2ssWl8H6XSFA/0LdbuOaPtcjNzZbegWNC2zOIFAi
	 ZLaKuff78DiVJPAxhI2P9Knlhy5VRiVyyjLHTqAEC2R0ulO/6/d+YOKZD8aTmdQfShoL1
	 Cu7fFg1Ux8YHZps4qc9w/rL2USwN6TBRI0TTSCl3wtHwK6YPVEEdfZz+YzavPh8nIIzVy
	 XyN2JGjqzlEZ+osS+Jx/KxHrzyuDP1oBmnKLcS5TRhPiciNoeYMpH5FoJrDXIVNdH4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811668;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=dTc4xLzdAujQ6ScWi/lwPCQ//qRhKRB4Q39XzYz2O6Y=;
	b=sjfUl736/BEqF1ywDVPVUKC4YJ7zIcgT31Amc5p6wAOhWF9j9EoBYJaAsYdQEFwTqR90
	 TawTLlxA8zana0ixiaFGC2X/Zyn+ExSDsbu+RIBd/L74NHXHbvka/GKj0ATJW5mA6xpX/
	 ndy3WycdR4goRbO9JzfbPJUm5tYINis77DbIuzMBR3NrkQK51QyPp4Wd52hSuQFOveOPh
	 o5zzoKbE64gkmX82+kAXX9NbQgOoHB7Isl9iHd7abM+WvWxk5Sh0nl4EkdZk7nEowjW3N
	 dtLXRUn/wwcPalk2kRlzfZKEx1jLPD1niAq8o+0WWwSruccm5l4mejT3XLeV6jc/ApA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WByHw8Pb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F363D606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WByHw8Pb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C99B1F000C6;
	Mon, 16 Nov 2026 06:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811667;
	bh=dTc4xLzdAujQ6ScWi/lwPCQ//qRhKRB4Q39XzYz2O6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WByHw8PbTY5AmmJyEbePVaApyXWF+L3JfmcBzWodnnH31DERC2uK5kovM1okyPzwm
	 X31aKffEXpz8u6mMsD8DxnIh1tFh2eN2CYmoOQz4rkzhczGZU0aRvihx08EvflYCvO
	 sF8apaLV7imRK51TJLD2L6BPLlJAq4r2oth39/rO3riAshVRhsp/yM1VAX6qkaWIUG
	 RgPj7tg5E1AWZ1rBpJRTDxlgGNlHIYQVQMzVEgoOgJhZcZKddsk5hrPfMbqmg+hyW6
	 UNjhqRSFAFu6vbRFVS3a4aegz2qlHHDkpLNDrOR8NIYVnVNWrAhgYh6TSnL75T9U/a
	 6+h+0el2PvuRw==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Mon, 16 Nov 2026 07:47:16 +0100
Subject: [PATCH v4 08/10] mm, slab: remove remaining compile-time checks
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
Message-Id: <20261116-slub_tiny_rework-v4-8-227a4b3636a5@kernel.org>
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

Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
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
index ac9dcb4682fb..bb57728962c2 100644
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

