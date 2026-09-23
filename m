Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF5C53D0A6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178336; cv=none; b=Mk4dfTcOHOrgh2hidMHAgohm/vTmQSaEeYCXMz3gYelGTg6pQNvoilv9tfxcawFeUFB8stRFofT8OC2dn0Kgmv2QN8q5MyLczbF78ypewTOH/qZ26qke0C7EsEIP5m7XCEZE7nMM7TQv3WJllAGMof6Sf08mApwSXPJyGJ3YWzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178336; c=relaxed/simple;
	bh=vqbRjdBNGswfQFfPyJ+V4zNIV90PXQwfAxpwZB+a1Zs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwBoE1PXO6XfxqpHPdIVS7b6zoTWXA7mgWYBCPAz83AQyM40lEYOR5zsCRazsx8ZwZSOLHYgmv9ahvwWyrPnYZdgeG98msoJDU5a3/rkFGlc9D3R8X0FHSlQbmr/xGk7rNMjWRMgb6nBda9TlUt1vVqCocihkTOeQIHihIvilho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRPzTi0t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRPzTi0t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91DE1F000FF;
	Wed, 23 Sep 2026 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790178333;
	bh=EMIQ8REFMb6acQ/FvLPkwRl4y6xpfycLIc9I6w2Z8IA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YRPzTi0t/aNV2USi5quM29/LcexoXRiBzJyVHc9Cl1NZCUu6aGOkFA5NIXTzkBGGG
	 6f44I48FlewUg0O3N6WPXf/un48KDg2WhoHiT5YGYI3jL7Zdgw1ggOaK38pg+wZV9P
	 WaP/ezP/ugqgqP3VGWtVnn9ZSbKDjpdCZEIdxiSRYP/dK6VqS+YKOA8r0vdx2i4XZd
	 9RTd86EzJ009yfGLrGbMYV/4vqlKryoBdV4OxV9flX+3ALsrKpm9/+k9SUFVTOipfc
	 o3eZdGIFs9qvAqvURHcZsRJNp1r0QF9TLs1bYbzWuW9MfdoMmt2elyJErc4DuDxkXT
	 cKUAZ9xA/yJoA==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Wed, 23 Sep 2026 17:45:11 +0200
Subject: [PATCH RFC 6/8] mm, slab: remove remaining compile-time checks for
 CONFIG_SLUB_TINY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-slub_tiny_rework-v1-6-a0e66d536eb5@kernel.org>
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
index 23017a5d10d1..065de2b92586 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -296,16 +296,15 @@ struct kmem_cache {
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
index c6a0422e055d..4814f025fde5 100644
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
2.55.0

