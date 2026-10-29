Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254112;
	b=47WmmcePjK7RPrX2Jnyz1Kn80avN4nwlZKOX2lw1XbGxb2EM5AntTdN7P2ToIH4DhkIb
	 dTVOPSFdMuZbdkajD2EEDeJTn3G+xxuWKCOUJj+HfBsvW5vLy76XxBDsHuu4wBM8tBb8r
	 sCEtTtCMIfXxhBWVTYdP2rhU3/QwEl3dvqlK+SsHNWgTsSvbfNm9XGbiEGNfaVjP5bANw
	 wyW9ELcQxmt0/nZwS29JJ3SEGxs4P9930JO0hB5Ko1e7xqe34gO6p5yNon4bVopv/LmGZ
	 PMs7Q6ZlDjl/BxT1zUh29QctxIuCNIaNPMI3ceteDKSj7A/DtLctPn9N0Ux6KSYbXtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=AIl6fbfmDXkFv/6QB6yZBSNCnJVQUdZCsXNNMxV+Aus=;
	b=XX34vktRSCccfspUGCiB3ybYXkp0dcNbje92ket9ZMvmkGRV22DPhpmnEa1mgjO0ij6p
	 IHS5QFuijX4QEsDLH1+G/lVOpnjdIwU970t56bk14R9+DOlkW8+yeM4gRi1RVz3jnpGz9
	 ViKYmIHKnx8fYvk2hCr079YkJZIkvM7H1j3ZMxIQD/V6Tml/jg6wMcK0KKwwbCO+8j8Lu
	 2S6/zRtL7N4+vBWYxCrqZ5OGhUarvDrXfAUhrnVkiDUYc5QjAC/T0Z/PFEVDurxeihwmX
	 Tyud4+4edqUMH4fJxSk22xGhcAinCkKyH4Keu6q0DmzwS4X9ZeGrscVGvdMj9tEtltw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=YdQeHm9m;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C58606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4C58606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=YdQeHm9m
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1477545a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793254111; x=1793858911; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AIl6fbfmDXkFv/6QB6yZBSNCnJVQUdZCsXNNMxV+Aus=;
        b=YdQeHm9mGxX1Lunxk0PVrEIAEiqhwvc/LgxAQL4FsXznfijWqULjLngpg7PpOmJ26a
         vy3l3hX0sR0eGGKoPEsCS6jmcGzhzgNesvhNiTI7uFwhIVDgxM8MQEZhY+aiwh30uJB/
         Z7k2pE+PvxvHyPckRRzfs+PHvw+PDNvhxhYn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254111; x=1793858911;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIl6fbfmDXkFv/6QB6yZBSNCnJVQUdZCsXNNMxV+Aus=;
        b=2CI+2dvZGs04HPf0e/MpBftLpD8ouBDWsn4HztCAq01RUQbaVQ5Lfhqq9aRY6vOPgJ
         mmOzcske+qyIHBNwf5+3+RSryui1VtRJ6Ykg77gzJVf7er0gUmYmlJZPFC6WbxmakOn+
         ZvfiQtZQixMOZCkmksARHTyGVYVZxWBtK/iVpRpHUXQoCnW/XPvYqB/5gqrdLhhiegWw
         jH64cjbvg7p4hm9iWOIy6IoifHL5WjImsIXmXi/cGmG7ssmQQ0nXg0RWAF3vXUPvJUhE
         iN6nGq5CJWG/R0sCYT10gurBwlq8illC4TJzReuq7ki4ecDsWjfM+qKL7ITQdXg9B3Qy
         Cbyg==
X-Forwarded-Encrypted: i=1; AKwUvBwWelSEGpgnDzHYVG3MelCQNwZqDthUsf5ZwBninDvqR7gWstB3xDoXKf6xfn6X7DwYfhjuSz97W0XGBBM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnb/VZ596A7qNJB4FLHRv2p3CmOQ9JMaOScfEL4QejrvqMMvLU
	9YkUaq62b8y3AIxZ7P0zLVlXACODEsKAJsgu02JGA5sB+aeOm36LYIjKK7PtSb4+cmo=
X-Gm-Gg: AYBFou1TSJdCfWMuST/mB+4LjiO9+nEJytArB/0p6AiL7xejM6TplSh9z9I4J+beeO0
	jbQxLf17gj0rfp7Jl7QD4x13OkAhLRQ4g24HrPJuQYxN5QaDY4vL9YWIl4RsDlU583TxMJjs1ZX
	p6dSrae92qyyjzamkd3DxpXgT7y6+K6CB4nkwunQq7lvNWswdlRDlTtlxuiGopQ5KLBVFSLjeqL
	U+nIcOsDJP6eKCgH1qLyYInxUPWdTRHWZlvigiWV0rWPVJKCLOGOa4kGHJo17tS1di6t45s3eJZ
	LPQtObBnvprgMz1JXdxjuNBIA+zA+yeN27N5nI7OHxPpwjmqnAITiVkAqBCmWOLVgxJf8QJX9fZ
	YluIV0z3oC8QSxmstw7wV6WIxe3X4Op6auXj0qXiF8vScY7JwECPMhuOitnvAhm0kNr3UPSbE8j
	7zuGlVWy6ghjMtEveA5ssE9WVFYjsGPPCIvoQeBhaFAVtG7iv1ho/+8qxDhzKDgZzJC9fO9ly/x
	MQus4SEaXDGVDeuP37Z+D9DU1Sjkl3ygymGNbT2BF73oIN+IFpx3z1ke8/+pvMFW066DOcClaHA
	x1TC8IEjVU02WisMr23WRh/28eZY+tj3i2Y6OCGm2RDmjTbm4h81bqrzsvnjyEepJ6Dz0mwVqYU
	jj+ZAnVkbCdH7KzMtwvjuKZ1uL3pndXM+igHjyO/BdGyfjqL8ZE8WxvtFqNHyuQQN80iKjje6
X-Received: by 2002:a17:90b:264d:b0:3ac:9d83:8856 with SMTP id 98e67ed59e1d1-3ae57e3d6c1mr3582035a91.9.1793254111060;
        Wed, 28 Oct 2026 23:08:31 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm2602046a91.0.2026.10.28.23.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:08:30 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:08:25 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 3/6] mm/slab: Support disabling SLAB_BUCKETS at boot
Message-ID: <9a68a4d95830352ad3821437c2e22c30a673055b.1793253633.git.chris@chrisdown.name>
References: <cover.1793253633.git.chris@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793253633.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

SLAB_BUCKETS gives allocations with user-controlled size and contents,
like memdup_user() and msg_msg, their own set of kmalloc caches, at the
cost of the memory for those caches. It can only be chosen at build
time, so hosts which want it and hosts which would rather not pay for it
need separate kernels.

Add a slab_buckets= early parameter, enabled by default on kernels built
with CONFIG_SLAB_BUCKETS=y, so that it can be turned off at boot.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  8 ++++++
 mm/Kconfig                                    |  4 +++
 mm/slab_common.c                              | 26 +++++++++++++++----
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..de2fd6963a16 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7001,6 +7001,14 @@ Kernel parameters
 			apic=verbose is specified.
 			Example: apic=debug show_lapic=all
 
+	slab_buckets= [MM,EARLY]
+			Format: <bool>
+			Enable or disable separate kmalloc buckets on kernels
+			built with CONFIG_SLAB_BUCKETS=y. When disabled,
+			allocations use regular kmalloc caches. Ignored
+			without that option.
+			Default: on.
+
 	slab_debug[=options[,slabs][;[options[,slabs]]...]]	[MM]
 			Enabling slab_debug allows one to determine the
 			culprit if slab objects become corrupted. Enabling
diff --git a/mm/Kconfig b/mm/Kconfig
index 92ff97ff24fb..48078c1fd26f 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -231,6 +231,10 @@ config SLAB_BUCKETS
 	  of extra pages since the bulk of user-controlled allocations
 	  are relatively long-lived.
 
+	  The separate buckets can be disabled at boot with the
+	  "slab_buckets=0" kernel parameter, in which case these
+	  allocations use the regular kmalloc caches.
+
 	  If unsure, say Y.
 
 config SLUB_STATS
diff --git a/mm/slab_common.c b/mm/slab_common.c
index e66c0778ee98..b7a46c368ab1 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -410,6 +410,16 @@ EXPORT_SYMBOL(__kmem_cache_create_args);
 
 static struct kmem_cache *kmem_buckets_cache __ro_after_init;
 
+static bool slab_buckets_enabled __ro_after_init = IS_ENABLED(CONFIG_SLAB_BUCKETS);
+
+#ifdef CONFIG_SLAB_BUCKETS
+static int __init setup_slab_buckets(char *str)
+{
+	return kstrtobool(str, &slab_buckets_enabled);
+}
+early_param("slab_buckets", setup_slab_buckets);
+#endif
+
 /**
  * kmem_buckets_create - Create a set of caches that handle dynamic sized
  *			 allocations via kmem_buckets_alloc()
@@ -424,10 +434,12 @@ static struct kmem_cache *kmem_buckets_cache __ro_after_init;
  *
  * Context: Cannot be called within an interrupt, but can be interrupted.
  *
- * Return: a pointer to the cache on success, NULL on failure. When
- * CONFIG_SLAB_BUCKETS is not enabled, ZERO_SIZE_PTR is returned, and
- * subsequent calls to kmem_buckets_alloc() will fall back to kmalloc().
- * (i.e. callers only need to check for NULL on failure.)
+ * Return: a pointer to the cache on success, NULL on failure or when the
+ * separate buckets were disabled with the "slab_buckets=0" boot parameter.
+ * When CONFIG_SLAB_BUCKETS is not enabled, ZERO_SIZE_PTR is returned. In all
+ * of these cases subsequent calls to kmem_buckets_alloc() with the returned
+ * value fall back to kmalloc(), so callers that can live without separate
+ * buckets do not need to check the return value.
  */
 kmem_buckets *kmem_buckets_create(const char *name, slab_flags_t flags,
 				  unsigned int useroffset,
@@ -448,6 +460,10 @@ kmem_buckets *kmem_buckets_create(const char *name, slab_flags_t flags,
 	if (!IS_ENABLED(CONFIG_SLAB_BUCKETS))
 		return ZERO_SIZE_PTR;
 
+	/* NULL makes kmalloc_slab() use the regular kmalloc caches. */
+	if (!slab_buckets_enabled)
+		return NULL;
+
 	if (WARN_ON(!kmem_buckets_cache))
 		return NULL;
 
@@ -1059,7 +1075,7 @@ void __init create_kmalloc_caches(void)
 	/* Kmalloc array is now usable */
 	slab_state = UP;
 
-	if (IS_ENABLED(CONFIG_SLAB_BUCKETS))
+	if (IS_ENABLED(CONFIG_SLAB_BUCKETS) && slab_buckets_enabled)
 		kmem_buckets_cache = kmem_cache_create("kmalloc_buckets",
 						       sizeof(kmem_buckets),
 						       0, SLAB_NO_MERGE, NULL);
-- 
2.54.0

