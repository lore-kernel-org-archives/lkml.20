Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559897;
	b=NudUeLXMjemGCy5d8z4muG7Qn8lJmaiq5v5Xci9BFkeaMMUFEdAxBC/E/kZLEjuZ/bFx
	 QKjf5hTy163h7dGc5WBz6Gu6YwDWXCkUfXsWM5XUWIfVMcHbQz/LMSpPPehxVi+dTJ+y7
	 cGqU2kntdKAff/Tvi7Fb0jaF0FOIv2cFEwLwDY3Ii2G5OunsOIpDRW45awQbkOhbICw8n
	 XIq5oBposVIUqReCrXw9JTPTt9J51qdXe/69Xf3L6Df4dYKvrTQi5kRHBd8QnpgKEI7//
	 x1GwmCf5zUVJzI9MOx3PkyDQTdOHwNDwPrXscSnVOM6nIpqtk/K9gt6onVT+MFs4ebg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=UnWUSSllMVMhg7PktgO/3YoCDA/za9YFOUp/rF6lTqM=;
	b=tNN6CjBbxTNBabhx6DKtzvr/ynz7zOoePRzNGOeNWeVhgZHpDlcMNr7y8FvSsfkFSw3D
	 82iljHi/T+b4qcs7+TgY48HfmJBbJzERsq8WL5yarYFncySPsNsZkNel3GlrkcteRXKC+
	 1C9yYaRd7Jy59LZFMkwywE2qljmR0KlTVaiVTEXQKuf0IyAC6h4irR0R14jEuqaU94Lq6
	 uUxM6wD+tpv/RdzFOFVA2hYtHAoHJuMH0nyt+BkGCPieND2iLdSXEX9OxIbKKrfaGX7NH
	 9gqDqmAZUVxPCUQxE72zifXTXQ1NS1JIes58fH9klrn/Zc3AZmRjU+U6KsAGIifS+tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=EYH8iN2h;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F342606B37D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F342606B37D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=EYH8iN2h
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9995ce866so11168935ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559896; x=1795164696; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UnWUSSllMVMhg7PktgO/3YoCDA/za9YFOUp/rF6lTqM=;
        b=EYH8iN2hkzgAfrtHXuplF1LouLGhOz3dEt5cfTghhvoh7BuMSLeV4tMpXaAl6x62Y1
         MRu3KIfolqdUXq4lDK9GTG+UTI3aI6y0TWtxe4FE8uBDY8D5WKgGTL73DcQfszX1QaiD
         yyr8a85huV/i8IY7fJXfu1cemmwY4fvz2Sc68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559896; x=1795164696;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnWUSSllMVMhg7PktgO/3YoCDA/za9YFOUp/rF6lTqM=;
        b=G2039CcJft1VdlKZfFh59NRyp3w/1LKRLQj5w1zKbJf6CLe7dWWvV8B7+kbbAFLw7H
         GaGAyY2Kqh/0iG0vNJGYyyqspNEAvZqB5YjBWqk3WTa/QLDVZlyva6GVh7w2VFatt0IX
         cAdHT2KI2GEauc7RM506S4csgG+uwYWclVWtGy8rdRZAo2s9g40et+9z+JbRV/N58lop
         EqXrMSa6L//KjCuAwO09Pv+/KOYMbNH2cuK5epKyMUvorIiAVaFfvwcw0pPRLKDa09w2
         KGoyZGtFQq2Fn9HhDGxIrH0lx4zOOHY62nRc+/+BW1PJ7yoBmkRidP0KWJk1HSAPlerM
         A7+A==
X-Forwarded-Encrypted: i=1; AL+hErHGlHGd7eEM0CaziUG3C8peg+SFbNCuGJ1H/vodNQmHPkTLnZXw3Bwi/x8D07FASx0P9CNnlvAMLMJAXEQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y6UhxDj+rGxdXiLmKtp6UcFUJ0K9BTC3isLNLNd0oBH26slX1
	9+QlLmE9HHeL4jRkcxMsSSoT5/njut+FjECbzsCN/QbaFaWu24eCnvPeB++T+v1RpzU=
X-Gm-Gg: AYBFou1KL+NDV8dloMVSVojxPjMvphDIlQwIqPV/Ry9vTq+80fFV+TYrEFgNVlMkKwT
	5BemZbAEEGNr8bWmHsqdEWPhwWpoJ+ieA2qMVrVsqsAiSO9xYPLbRotWFiLLWF8lKu02+z6NDPK
	NA/E4gPqxStZpmbcqfxf9pcwIM2MDFC8sF0bb36nBuzH/zjTvWLp42VUPGcdkgcZqTGlo8VyhPT
	y2iOPcPxDz9sFLD8XwogXCluY150FpqRYEweg+Jn5beXrJ52/KJi+ZP/7akd7NYjxBADwcE+qGq
	Jg3lpZw0XUlcJ+hDSHr/FdXu/1taBPtx2EQFoD31BZgoOMN808LKcxvBpHp7FZS8gvmUUprwqPe
	8TIsYa7Dk9QZUl3SLcXHq6Knh1xya554x2NCCRebM2qdF+97QuDZJCq9kN76jz7osCSqcWtpb5p
	/N+T7YLRTtr4Bi0NB6OzB434Zdef50YnZWkJSYUJ0QQfNqiiCsfCg5/s3zJgve0c+GlStvvEo1l
	ZxbdcIH5iT2xHwKvdliccInoPNs0wFIrM/xohd1UzJXfn3ZAvohLOONHdPzttGSbnUI9kaUzhmH
	AVwYms9ktrbyq9Q8rhcIBr2fEMf0ZSB1XfZe/cvXe+Ho03qGneAx61XeAhJ3HgfzgHbfuObB76f
	njtMPS+8vTmZUy/aozH5CQ0czMz5DdVVHc450F/gL9kLfyFRkA19sYyycwRIYNGmBKwTUe1JdHc
	ZjT7+iZObXemTvC9+b38xHGC0+8CEnCWI+RxIfCdD7IAINhpeByEtTBUdWwLw=
X-Received: by 2002:a17:902:e88d:b0:2ed:acb:aa96 with SMTP id d9443c01a7336-2ee0dad0247mr21324925ad.24.1794559895887;
        Fri, 13 Nov 2026 00:51:35 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75c86asm7039685ad.23.2026.11.13.00.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:51:35 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:32 -0800
Message-ID: <843f0f05bbe3ff36efd22d490e83b0260f8d2f81.1794506262.git.chris@chrisdown.name>
In-Reply-To: <cover.1794506262.git.chris@chrisdown.name>
References: <cover.1794506262.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 3/6] mm/slab: Support disabling SLAB_BUCKETS at boot
To: Vlastimil Babka <vbabka@kernel.org>,
    Harry Yoo <harry@kernel.org>,
    Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>,
    Christoph Lameter <cl@gentwo.org>,
    David Rientjes <rientjes@google.com>,
    Roman Gushchin <roman.gushchin@linux.dev>,
    Kees Cook <kees@kernel.org>,
    Marco Elver <elver@google.com>,
    GONG Ruiqi <gongruiqi@huaweicloud.com>,
    Jonathan Corbet <corbet@lwn.net>,
    linux-mm@kvack.org,
    linux-hardening@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

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
index 0b3c140babd9..c27bbe205051 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6990,6 +6990,14 @@ Kernel parameters
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
index d174537d941e..e602ebabd6e4 100644
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
index 01c64ef661e7..272d22f411c2 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -410,6 +410,16 @@ EXPORT_SYMBOL(__kmem_cache_create_args);
 
 static struct kmem_cache *kmem_buckets_cache __ro_after_init;
 
+static bool slab_buckets_enabled __ro_after_init = IS_ENABLED(CONFIG_SLAB_BUCKETS);
+
+static int __init setup_slab_buckets(char *str)
+{
+	if (!IS_ENABLED(CONFIG_SLAB_BUCKETS))
+		return 0;
+	return kstrtobool(str, &slab_buckets_enabled);
+}
+early_param("slab_buckets", setup_slab_buckets);
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
2.56.1

