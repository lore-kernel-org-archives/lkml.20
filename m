Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868272;
	b=nbwl9krz7udZ4Oxn5BjOR6Tm/hzLAPTn+XSls4UJI+9xtyyYF3oAI2xobUak1KVsPbsf
	 vlD35z1gk08g5doFDVBRfT/QvwgX8OKIDWBMOqUqoXWccX4cH3P0yM2G6O1kH7CbzMrF+
	 FKh9gboiw98H4qgiqY8W4PhMTIN7qU70KhsFd7UoRg7uglLuf5pCf0tGWsc3KUjlFQq8k
	 h2AjqPPP//WTlkFEL/VKaq2fVwVKdpWlXhLGESTNNodOsymS5Dojf2pXen0JiHkheRAor
	 +fr79Jcjs8Ptp2SEruu8a6qverLj15YI5crD/oQZnQBrobXzcQxezvOw7olSME78lHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868272;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=BJRLNNmJfikXOgBL5Y+Y26aKpB5dn+CgY+okcx//Lv8=;
	b=y3+skQqRtuErtRgWzo6Agg5JfcyLcax/1isfdKMMBDYY8yQvPuhvh01Bg6Gb1wCDD6vb
	 m0WfzhmoPsrjhh9+7kVzISv9iDUBoDVAl7wcKTiQAiTVxj9XGsgKZ2+5uFbXbWUyXkzpO
	 3RcBqNneCGbzBf+yFrHA4lNmu6vhNtmD38Ym+YkS3NGyuiYfMa5ylHSUFRE18NGkcqCth
	 9HZ4zSFJGjUjweFakagKLOscPFF/6H4QG0PafEb8srCoXv8mwxeTIIpHcmaugPsxZtiR8
	 sRJb3DYfSbWToFQYtH4XXuGXz3quSEe1xdYbLb2elOE5vKJKZnZ0VrqlovNDCcUbxgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QEd3CURb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8497F606A336
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QEd3CURb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B54A1F00A02;
	Thu,  5 Nov 2026 08:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868272;
	bh=BJRLNNmJfikXOgBL5Y+Y26aKpB5dn+CgY+okcx//Lv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QEd3CURbZ1esykt5LXMmEU3mwfK3EPhyW4UmuoNSMMCIN8OxCLQbdK870kStRfTnO
	 QMMsFWLj8laFl6eA49dxZKYC1ULRf1t2E24GpHMErTIuoqYLvmllXe/IVm1KklhF7U
	 bfdtqxYIdhutvs4jwZ/U0mQyCQ238T4Fp9Wp1RN6sIrFrCMEfuiaTFbwYe5RiGTnjP
	 Polc3flX5ZMI0pt6pblTm11jZOj5//4eIDS+pYy9b5FZ3INDYpAzhGAgGY2UJrbt67
	 s88iZHrYv7r4GY/HEMwsqZRk36NKW9mINCO3d2goF5qhaJeZwMrWEWENLTETQJZqV0
	 z6OxSufCJlS6A==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Thu, 05 Nov 2026 09:43:59 +0100
Subject: [PATCH v3 10/10] mm, slab: deprecate CONFIG_SLUB_TINY and reduce
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
Message-Id: <20261105-slub_tiny_rework-v3-10-0484ce59eabb@kernel.org>
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
index afff1b25b543..ec91a4cc6c83 100644
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
index 9ae75229c76d..1c43b6aeac9f 100644
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

