Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173A14BC00B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178325; cv=none; b=U1aR7TQcxe0AfLtPMHFPrZ0fIpRM4oODWLOiOyENi+WnoP/GKO3uKgoFs5QmJ3/4sVXf6S76JJSFXpWmD3KynPs+iGGGWNNSVA0y2BP6C+Uy8qr7ToREKDkkE5eT863VJ7pPk8VB8yPfYTajicKGfIbliBDk9WzJoVDAdRHsDzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178325; c=relaxed/simple;
	bh=oRFd3jSh+Ikq6LFUu0mpRxbLtMKDI7N0YsJgZ5Gkrg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FhozfHG93c5SDniHXs8DJud65EnI0APvoQtokjVpOSazlhDjZAnLK9I82bLYnUVDHaUMh8QLhXoY7Dn7Ne61y5UbuUOAeXlT9tBfBApEJdUN5CexErIeHLFitVbmvxhLBoUwJ64uxOL0588zb94Nk/bSyO6u/UjR96pHlsoblOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3gL/0e+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3gL/0e+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68ECD1F000FF;
	Wed, 23 Sep 2026 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790178323;
	bh=YX7Ca9UzhzFLU5oRq22G+Ie5WRxnHJyj2v5cEtZOB2k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=g3gL/0e+5shDUIHrn2nqmkylPMYc3pgM7ni3CiM2giZYpJMw0yGKkUO0lu2lhJ4CR
	 48BUlyiTw7uCvCEZS9r5COkM6I2WAL7RGyymiTauq4Px2ljwFwLnujrEr6XcpN7E7P
	 ob1OMdYzoy55f7h2Ts6J6ZkXdXdpo0e0XqGuUeEiiTdZYCAkeI8vCY/T7VLtTD7pKO
	 5TrlPxHEXgSAe5DcxuUqrIF9ILW+jeoGHO1ppQFfa+I7B0JMd1IyrqXnjFAjO2obeV
	 VAftTKn8j1vREkPZR/8WvfsptJdO9BpY/Rd2FgFsizx0wRD/643CiREh88X5OGeDv8
	 Oqt7P2DY97ajw==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Wed, 23 Sep 2026 17:45:07 +0200
Subject: [PATCH RFC 2/8] mm, slab: introduce slab_debug=N
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-slub_tiny_rework-v1-2-a0e66d536eb5@kernel.org>
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

Enabling slab_debug has the side-effect of disabling all percpu caching
of objects (now via sheaves), which can be sometimes useful for saving
memory for e.g. kdump kernels. To make this possible without the
overhead (CPU or memory) of actual debugging options such as poisoning,
introduce a No-op debug option that only forces the debugging slow paths
and zero sheaf capacity.

This will also allow reimplementing CONFIG_SLUB_TINY as a boot-time
option.

While documenting the new N option, remove obsolete SLAB references from
the F option description.

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 Documentation/admin-guide/mm/slab.rst | 13 +++++++++++--
 include/linux/slab.h                  |  5 ++++-
 mm/slab.h                             |  2 +-
 mm/slub.c                             |  3 +++
 4 files changed, 19 insertions(+), 4 deletions(-)

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
index 8fd6835e4235..77fcbf99b7b4 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -490,7 +490,7 @@ void flush_rcu_sheaves_on_cache(struct kmem_cache *s);
 			 SLAB_NO_USER_FLAGS | SLAB_KMALLOC | SLAB_NO_MERGE)
 
 #define SLAB_DEBUG_FLAGS (SLAB_RED_ZONE | SLAB_POISON | SLAB_STORE_USER | \
-			  SLAB_TRACE | SLAB_CONSISTENCY_CHECKS)
+			  SLAB_TRACE | SLAB_DEBUG_NOOP | SLAB_CONSISTENCY_CHECKS)
 
 #define SLAB_FLAGS_PERMITTED (SLAB_CORE_FLAGS | SLAB_DEBUG_FLAGS)
 
diff --git a/mm/slub.c b/mm/slub.c
index a107a111c75e..bc593f0078c0 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1897,6 +1897,9 @@ parse_slub_debug_flags(const char *str, slab_flags_t *flags, const char **slabs,
 		case 't':
 			*flags |= SLAB_TRACE;
 			break;
+		case 'n':
+			*flags |= SLAB_DEBUG_NOOP;
+			break;
 		case 'a':
 			*flags |= SLAB_FAILSLAB;
 			break;

-- 
2.55.0

