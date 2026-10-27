Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086575;
	b=MU4uThDlM+lNAnGldxyI53BAttY0ByVnJwMZ75ebXBJ7LMkiQcS7HwSJd0ZLbVswF6Wp
	 /T0dXOi8TUBBU17AsPT3QGRz9ifiOpagJz2npN6EJXDGhUsAGkhr42tBA5uDXTqF3EI9f
	 JZ0ynTlvVfgNzCdNbz23W4skpMVPCkR38emgTLNAR2hMlR6q4540wUr+lapN4H6UCAI1O
	 tUYfoLghv6rnOVjP4RnBMajaNgz1lJzQBrJQlluqBy05x4xCxnDjGY3c8sCD28/AUb3HN
	 LRquqoOo0nIkHnZuxZ2QnbCtgdsnf8q4YjKSxL/Wy0HIbJ0BUWrwOuAMm8xudpKydpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=TeuNf51TxMDPa7xvpxS6POY5MbCscFG1kBCUI4jUNC8=;
	b=DsknHxodYPpQQBK3iGtbfiHx/3uvd5NSDT/9/uCRhF8acoTfjduH0aT3pzCTFJABxaR9
	 AGF3+AB00aDYOIJcBptEHXKcaDyQSvk2eEPxbNsJrTFyfWPjoA5p/BM2aNJEg3GfiJESa
	 GEYlun5tDY6CpUYbXppNPZqh3rJB/c7MHNE74CfyXsZa80n23M9RUsECIYMr97Yz7lADJ
	 Sygz9cpSH27ecotF8dtcpN+uoBBUh9hEbWSFzg0nSyS6RR/ahKnTNo0Eo/mKZYSaIT1M5
	 pN/tiAXEuVf7n/5/UN5DZwBI3gvj3G2IsB30XcI5B8ZhHyr4ruqyPD0vmB4cICyT85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=t4sIvf2W;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B96606A327
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B96606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=t4sIvf2W
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9d1114320so29207735ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086565; x=1793691365; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TeuNf51TxMDPa7xvpxS6POY5MbCscFG1kBCUI4jUNC8=;
        b=t4sIvf2W+qLD3CqixmNHF0jnDEYkWaLv3ueAF9jTKdiJ8+KHNWlRKPFIoTJ7z195sY
         rls9+daC9CvtMAIjT2Avi6img8Qy0ImQ222XCWXDZP7l9SwTQIYRrFQoAqb4HcNOT6d+
         4UDhL0yFtHTxYVz/Mn6Htvuo3fj1IELxkYP+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086565; x=1793691365;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeuNf51TxMDPa7xvpxS6POY5MbCscFG1kBCUI4jUNC8=;
        b=mmCS72ZFNi45DAZJF+1nBqkoaPK2P4MbjUBkTtbmczBy/BpedfPv5N0L+svqgqVTfi
         tEmpTdeTPnDhEoboN7QRvFTlu+rWXygYWZHSmYhBYqTpf92x1TL9Hp/LEVZ6gkM8Fx3S
         r9x3gglAtacmwUZpZcdiYlG1F9UBiayjRh4uUdBOEZFbuqB+cv6keI+ydTRStBmoZoR3
         H8jxW4QXJV5KBZcwBi9i3nqBePKbRDzH5xAw90SSrOhaPY/bXJePYociR+429Mn15EEo
         O/8sECM/jR+s3irvdA2BfGP1Cge/utnMiOv0iPUljyOI6d1iC/YM9KeWXMrTSyOsYfLS
         tOYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/sD34rvReRlop2Hihj9shGIDxqoZLC5DUMjW1pq3fnvGDcnLrHkRC+MyNWUEtE3n3RwbziVVrZBzU5M0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBexZycCRKIFNSkXWUm16hjUU2ceJ6tI+60VQe2U/KvZP4efYd
	ylWvHDTy4KUrg1UydsfpWS41sH5/kmNJ7BP6ubIahGOiLPk7mV6NOlIXK8X1jdre6sM=
X-Gm-Gg: AYBFou0+rcYCQk3J/eVbFcrKb+kVJ5YOh7Ku7lT27GHblR2qKQvktjCo8frdut7hDT/
	jK5/4Bz9yINgUQ6NG+HPWePV5HKWQkcS+3h5+VEm+ewxSYdyFyVnDVeKE7lO5ySyIoBGot8E8Zm
	jRdPmc4lX+yunDHUJ16ecLS2RrTPC3rNuKPBzeTuHbPibpR0nKXjH2vKCTk7TCYIMsYgr68XMB0
	lbqlccC4vrCkHJ49u4A661KLtcH7kkqRKC70qG4ZJvz8O/EYr5Xjsfaw3G4hz2ywn/oMSEQIb+I
	d0Wfw4HfGECEpPnmCBCRNYcTyFch2ypTZ9NnbgqyK2yD0uTkyNHKmKxjpDdRsfXGx3G4SG9uk1E
	LlYQ6no2oPkeQRRtIPFfKdj9ko1Y32c/CJXnFadZi9Muk//RDw8NszxU7z7IuvTimlsJoj9H+cQ
	TWKxcwM0NnCEMoqfgzkJknz3NZMhAo1lDMX6U8oCYFiTNaSUzChGKvZFsD9KFr0lyFaC6OrRheG
	BRwDaV12T2PPGhWA7aJOY0gKvrpb4zYLIcfmBoAU5olpy0c3povYtAok/3sleiDpYAyrT6rmxXX
	NcrYGdzbi0/aiK7TZMj8B/V5fmQwv/c0W4O9o/CKHJM5r62ju/Ymi+D25Psql/CbQh8MXRtM92I
	H38g3JZDPaLoSwjBuuKS5rWE=
X-Received: by 2002:a17:902:cccf:b0:2e3:598:75b8 with SMTP id d9443c01a7336-2ea9c67507bmr74148095ad.27.1793086564825;
        Tue, 27 Oct 2026 00:36:04 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ce5912sm5015185ad.71.2026.10.27.00.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:36:04 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:35:59 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 5/8] mm/slab: Support disabling SLAB_BUCKETS at boot
Message-ID: <11c73e97a9a8a2a532b3637c290657f99dd6a69f.1793086056.git.chris@chrisdown.name>
References: <cover.1793086056.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793086056.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Add a slab_buckets= early parameter, enabled by default on kernels built
with CONFIG_SLAB_BUCKETS=y.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  8 ++++++
 mm/Kconfig                                    |  4 +++
 mm/slab_common.c                              | 26 +++++++++++++++----
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 5c4d784e7786..20710d6ccd1f 100644
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
index 56c422684b44..ebdf14a87c71 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -235,6 +235,10 @@ config SLAB_BUCKETS
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

