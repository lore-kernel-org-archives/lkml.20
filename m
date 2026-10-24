Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792868877;
	b=SaWSdLBv4umTuRpd3CuMaDvA1nqVP3e6AoGNy8k94JJwf2ooDTmSIZUmYJpD4mBNsXR2
	 z1202xrpCgO4NhWgekRq7LJGZUggWMbpvqzJJUyoshvg4w78yjlcLFq9ynfyQrwlePu5Z
	 kSsgSqjcuu/MJAzHDYk9NzrCBvK07DMi2PSFo8CXbCh/YD1KRBZQcsLdqVfgsk7/UPS6j
	 3TZVTljQuW3Gvwf5z3FewlV1TXrEJ/swuKm24vWuUsEtCx0uVjgkQADpYhqsmQkbOwrcH
	 VZpnAtkdKGQmpX6c08dF4ACX/P82+lsw7afV+LAujVL6+WLlegkLxSuwUb7wsXeResQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792868877;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=BMyYTioU/FrU2fWhiwuWu1FFpNsNlrYz9eN4f3WcI2I=;
	b=QlGw5fhGwZs0VpFJrBZmpwIUx/Mnp53zPCOJ3SPj+d0eXJBwnl82oTKweCXhV86hS/IZ
	 kDRoDGhyboKtlYCVtz1I/4QnUyYepCz6R/xJJZsYLnhvYVo5rkmE5HL4PU36BXzaLe4GN
	 dsPHZF/85DrxV5skCs77J6WJ+0sMo01EMzPUOKDGj8r819zuMA4L9PuNwOWmpHjBE9RiD
	 a8qgF0DSYPqqDtXSDqY0QQuyuup7E0t5+Jso3k5EadzroT2o0hdiNJud2MuL+G6oyhUNm
	 qYXLxqRXGcAw4gEP2e5B3AXM62DC8w8FGSjb6snxuFZHteSaM0RSMILF4CiyOc6lKSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n+3r7WjY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550C560A2605
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n+3r7WjY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860C61F031E0;
	Sat, 24 Oct 2026 19:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792868876;
	bh=BMyYTioU/FrU2fWhiwuWu1FFpNsNlrYz9eN4f3WcI2I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=n+3r7WjY0T01eAUCq/zRS0G+2hGEX5GFurChhcOIYE/HpDty0WA6gmzikNcxTYdH5
	 LhJWqrngg+qlGLVhYQimSpyue667XC+oTW6/Rxmbi6YLpG2amWpIW+41nxBiKRvPrG
	 WJSCfxvpry0it2d4f/nZKPV/i9+7MudMWie7qr9DtEmLffMO7uj7+Gy1UolLzetOQ5
	 yyplSGcW1ofPrAArDLBpw0F9Rx4ZQN8TjkBWRG7FfXY5BZ2iJldfxNENi9M7Gr023V
	 3N0Fu1cYoper5E9v9Z1XiFPaLA9apxQwEo/s+bz3O9k1ymRsh+WlkQYoR8MNPndQ6/
	 ZbloiE7IXl+uQ==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Sat, 24 Oct 2026 21:07:30 +0200
Subject: [PATCH RFC v2 8/8] mm, slab: deprecate CONFIG_SLUB_TINY and reduce
 its Kconfig effects
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
Message-Id: <20261024-slub_tiny_rework-v2-8-bf1419ab5ffd@kernel.org>
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

At this point CONFIG_SLUB_TINY only affects the default value of
slab_tiny_enabled which has a boot-time parameter. Thus deprecate it in
the Kconfig description.

Also remove its interactions with other Kconfig option, as they are not
necessary:

- KASAN, SLUB_DEBUG or SLUB_STATS support do not need !SLUB_TINY

- KVFREE_RCU_BATCHED can simply depend on !TINY_RCU

- various hardening options do not need to be excluded, although it's
  unlikely that somebody would enable those with extra memory overhead
  together with slab_tiny

- SLAB_MERGE_DEFAULT does not need to be selected, although it's likely
  to be used together

Keep the "depends on EXPERT && !COMPILE_TEST" as there's no point making
the deprecated option more visible.

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 lib/Kconfig.kasan |  2 +-
 mm/Kconfig        | 16 +++++++---------
 mm/Kconfig.debug  |  2 +-
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index a4bb610a7a6f..f20b574f6653 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -49,7 +49,7 @@ menuconfig KASAN
 		     (HAVE_ARCH_KASAN_SW_TAGS && CC_HAS_KASAN_SW_TAGS)) && \
 		    CC_HAS_WORKING_NOSANITIZE_ADDRESS) || \
 		   HAVE_ARCH_KASAN_HW_TAGS
-	depends on SYSFS && !SLUB_TINY
+	depends on SYSFS
 	select STACKDEPOT_ALWAYS_INIT
 	help
 	  Enables KASAN (Kernel Address Sanitizer) - a dynamic memory safety
diff --git a/mm/Kconfig b/mm/Kconfig
index edb4a6c0a870..2286073ea906 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -167,16 +167,18 @@ config SLUB
 
 config KVFREE_RCU_BATCHED
 	def_bool y
-	depends on !SLUB_TINY && !TINY_RCU
+	depends on !TINY_RCU
 	depends on !RCU_STRICT_GRACE_PERIOD
 
 config SLUB_TINY
-	bool "Configure for minimal memory footprint"
+	bool "Enable slab_tiny by default"
 	depends on EXPERT && !COMPILE_TEST
-	select SLAB_MERGE_DEFAULT
 	help
+	   Deprecated option that enables the slab_tiny boot parameter by
+	   default, and can be overridden by booting with slab_tiny=0.
+
 	   Configures the slab allocator in a way to achieve minimal memory
-	   footprint, sacrificing scalability, debugging and other features.
+	   footprint, sacrificing scalability.
 	   This is intended only for the smallest system that had used the
 	   SLOB allocator and is not recommended for systems with more than
 	   16MB RAM.
@@ -199,7 +201,6 @@ config SLAB_MERGE_DEFAULT
 
 config SLAB_FREELIST_RANDOM
 	bool "Randomize slab freelist"
-	depends on !SLUB_TINY
 	help
 	  Randomizes the freelist order used on creating new pages. This
 	  security feature reduces the predictability of the kernel slab
@@ -207,7 +208,6 @@ config SLAB_FREELIST_RANDOM
 
 config SLAB_FREELIST_HARDENED
 	bool "Harden slab freelist metadata"
-	depends on !SLUB_TINY
 	help
 	  Many kernel heap attacks try to target slab cache metadata and
 	  other infrastructure. This options makes minor performance
@@ -216,7 +216,6 @@ config SLAB_FREELIST_HARDENED
 
 config SLAB_BUCKETS
 	bool "Support allocation from separate kmalloc buckets"
-	depends on !SLUB_TINY
 	default SLAB_FREELIST_HARDENED
 	help
 	  Kernel heap attacks frequently depend on being able to create
@@ -234,7 +233,7 @@ config SLAB_BUCKETS
 config SLUB_STATS
 	default n
 	bool "Enable performance statistics"
-	depends on SYSFS && !SLUB_TINY
+	depends on SYSFS
 	help
 	  The statistics are useful to debug slab allocation behavior in
 	  order find ways to optimize the allocator. This should never be
@@ -245,7 +244,6 @@ config SLUB_STATS
 	  Try running: slabinfo -DA
 
 config KMALLOC_PARTITION_CACHES
-	depends on !SLUB_TINY
 	bool "Partitioned slab caches for normal kmalloc"
 	default RANDOM_KMALLOC_CACHES
 	help
diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 9eaa25d1cf23..4e36c7c63ef7 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -48,7 +48,7 @@ config DEBUG_PAGEALLOC_ENABLE_DEFAULT
 config SLUB_DEBUG
 	default y
 	bool "Enable SLUB debugging support" if EXPERT
-	depends on SYSFS && !SLUB_TINY
+	depends on SYSFS
 	select STACKDEPOT if STACKTRACE_SUPPORT
 	help
 	  SLUB has extensive debug support features. Disabling these can

-- 
2.56.0

