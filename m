Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086541;
	b=AE9YrlW8n1j+L+tInyUvsWG85o1tV4eqt9+Uv1cG5xvKbifzmnaYrfobMulYeDnVGWLp
	 kNfiax77Xx1cs2pyk6IBDpGwgIZt3OVZVE8ko6LEbXQQvwpeQueWB+Khkrz7VBOCEHwly
	 MsOzW6JLidw0nV9BZm4FPXTyD4AxQy7EmStNERQaJ/zGgIhAZHmoMK8+JSeQM/ZEGHtFr
	 rnxR71QChe7bSWh396jboJtcbbMF/irr9okiyYEaDrSI9nHDg04gUs9u3t5LGEiXLXGVh
	 78jW2FZ4zNrtGVdyqelehyoSpiXpbSMwCSItF2BhPpXHQnIYLMOCy0WzHZGJx+UkN2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=HiOeizALgL+htPryz91jPJKAKWQ4nNVAQkQrkPjqDpY=;
	b=V+LyeE+Qu7tf9+D2eRhpulqhenAylG2MD0PZABNkPg7OzqsrjSihftB+ocB1ndbySpJQ
	 NH6mQ2ZrTH7T1zwsiIUDpzFiqAoU+QjmzXznT9oigTFhWS898oG2nwT8nS5UFROtkx8En
	 hxoYhPCh83o3wCKowOkkJ41IrOitdE2aD9ad65GotuQ/q1mKjCaTn/HMyN3p+AyCbE5KQ
	 EdXK1yp/ue91u0hrMl/wot/49VCb6+yFlvSeO1FFKrPWKzZyBDTrNLS1ib0Jy8AdG4U+s
	 VrZeM67mukB48MCe0jmYUxn3/cxfMuSWlCqIFDIP7s8xldTv9jILY3+03xijDBTcVPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=jzfqJxMi;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B91E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B91E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=jzfqJxMi
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so1898788a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086540; x=1793691340; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HiOeizALgL+htPryz91jPJKAKWQ4nNVAQkQrkPjqDpY=;
        b=jzfqJxMiyzjoTvcRto6vUwLyT33Ld/PNM/3tkguq4PFX+DIggDYGi6V6flUSLkahdj
         6ZmvHrWdlWHCmg8BKTXgS6EQhe4iVzvsfVlyweCJp8pE6sBO9tMUHrMDVTZzAlqH1rVv
         NElchlsi/IxicXGawloh114Wnh52mXfgGhKek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086540; x=1793691340;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HiOeizALgL+htPryz91jPJKAKWQ4nNVAQkQrkPjqDpY=;
        b=YiIrF+3frZxGB67MaRMWOZYWD8M8iYoiaC0t8z4aZ3eimU0Drnmjr2ufhaxU+m6OUt
         hxkMl2CzQziVJQ9wMMibvRFEhthf5pAfRSt/nIKYhx4Y3JgzagmbDZe5TA4Iog+JjAJ4
         A6f9xOwDD7wEqPW9Ra0QgjeawsmzCMIwNyy9i6ZsoOpTCpLV+yPI46nObYw0SzftnGpK
         +QB3pc4fukXHQMO6OlqWmsuVZQg6/AKZrqjqOVfhj/hPSsxMPF2LNAJoQw7La6H1yiqQ
         QlllXFgBWtmiFDo/aArztSxf208kyQTF1t1eVYi3MWdraPymQHTRVxIbCjw8jABvUyGK
         g7lQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3AnZo2ylF1TJozuDv53OVKJNgH5Vv52l3i77E9tPa08IM0D6kLjHLXgN5USysGrGg9OuvlpiUh99SdGI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJTXjCSk1IS9w5NviXOHsOlFIE7xWYl5JUhXpYa1aSSiqq+VGE
	FPme9dVzudvndip6B/vEQlKMJYH4hYoIjVMudVRVE3rEIhW/HJUJdL6ZpA7s6Ei/A1U=
X-Gm-Gg: AYBFou3cq6C/p1InAW99d9+T9Mazlks80+Oi4tet2Tsw5O+CFN8RYDjFGMPxsF+gEL/
	n7DjgGvuj5oniaTCDS/FbC6OZWNW+E5aU5yQFRXBEPvON/Ex5Fd2W7vha25bpPkQA9j8lFvmXGo
	1Sa1/JxilsVmcWpjmHhTT7oLxpdlbcXnPHYw5Txu4ByD4YOFDfvFvA+075ljUgUY5nmzH2AZ+d7
	SVd/O4uKX86jUEGMLV3srGnb2hUNnE3Um8H4mvK+i9woCm0ULqG6tpsfF6Hqgw33+5NaZnjUKL8
	reiNXOE3llkH+KFXx4vtpstCVuazRmJL2WuQfsFEtgsSeYYMr3qW/xQCiydgCVx2R5Ej5+siz23
	iLxNYNl4h0xkMrckZDFha5HHk0i1PJuXxESO+ag25o9m7GzgLhDclaYS3jc/LsvFMpj7XAltVXH
	8q3US3zzNplfxob+8tKBmmQJEGo9lJvZxwj15hgzzvP7PUbtWZ1UsatxnEOay7xBej4MSsQCrNB
	BeGEfoC6XTg1TkM16Z0NGc9zcnFc/ESaLT4lWzAYnIcl0HKrDQV1+u9yRZfH03TJfmd+2sDffet
	KUWTZO4pebGAvR61INYN6MAU+vdbuHuBlQ44EiaVQj0Wt6ZjMa+zNqXWNID39q3SaonbBpKtMBM
	ZZD+kJR6ym6dT58GFEh2hb8Q=
X-Received: by 2002:a17:90b:3b45:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3ade9b2cff5mr8340964a91.1.1793086540437;
        Tue, 27 Oct 2026 00:35:40 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb06c57sm7546810a91.3.2026.10.27.00.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:35:39 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:35:35 +0800
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
Subject: [PATCH 1/8] mm/slub: Support disabling freelist hardening at boot
Message-ID: <d244124ec287b576470a405c828432df69b4e9cb.1793086056.git.chris@chrisdown.name>
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

Add the slab_freelist_hardened= early parameter, enabled by default on
kernels built with CONFIG_SLAB_FREELIST_HARDENED=y.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  7 +++
 mm/Kconfig                                    |  3 ++
 mm/slab.h                                     | 13 +++++
 mm/slub.c                                     | 49 +++++++++++++++----
 scripts/gdb/linux/slab.py                     |  8 ++-
 5 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..ddf2f6fd60be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7014,6 +7014,13 @@ Kernel parameters
 			option which can be undone by adding the
 			"hash_pointers=always" option.
 
+	slab_freelist_hardened= [MM,EARLY]
+			Format: <bool>
+			Enable or disable slab freelist hardening on kernels
+			built with CONFIG_SLAB_FREELIST_HARDENED=y. Ignored
+			without that option.
+			Default: on.
+
 	slab_max_order= [MM]
 			Determines the maximum allowed order for slabs.
 			A high setting may cause OOMs due to memory
diff --git a/mm/Kconfig b/mm/Kconfig
index 604c58199acb..3ae97fec9946 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -214,6 +214,9 @@ config SLAB_FREELIST_HARDENED
 	  sacrifices to harden the kernel slab allocator against common
 	  freelist exploit methods.
 
+	  The hardening is enabled by default and can be disabled at boot
+	  with "slab_freelist_hardened=0".
+
 config SLAB_BUCKETS
 	bool "Support allocation from separate kmalloc buckets"
 	depends on !SLUB_TINY
diff --git a/mm/slab.h b/mm/slab.h
index e94ac63d10dc..8187ddb2face 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -540,6 +540,19 @@ static inline bool kmem_cache_debug_flags(struct kmem_cache *s, slab_flags_t fla
 	return false;
 }
 
+#ifdef CONFIG_SLAB_FREELIST_HARDENED
+DECLARE_STATIC_KEY_TRUE(slab_freelist_hardened);
+#endif
+
+static inline bool slab_freelist_hardened_enabled(void)
+{
+#ifdef CONFIG_SLAB_FREELIST_HARDENED
+	return static_branch_likely(&slab_freelist_hardened);
+#else
+	return false;
+#endif
+}
+
 #if IS_ENABLED(CONFIG_SLUB_DEBUG) && IS_ENABLED(CONFIG_KUNIT)
 bool slab_in_kunit_test(void);
 #else
diff --git a/mm/slub.c b/mm/slub.c
index 8fbc6bf8ebc5..c82bc626b657 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -214,6 +214,32 @@ DEFINE_STATIC_KEY_FALSE(slub_debug_enabled);
 static DEFINE_STATIC_KEY_FALSE(strict_numa);
 #endif
 
+#ifdef CONFIG_SLAB_FREELIST_HARDENED
+/*
+ * Free pointers stored inside free objects are encoded according to this key,
+ * so it must not change once the first slab has been populated.
+ */
+DEFINE_STATIC_KEY_TRUE_RO(slab_freelist_hardened);
+static bool slab_freelist_hardened_early __initdata = true;
+
+static int __init setup_slab_freelist_hardened(char *str)
+{
+	return kstrtobool(str, &slab_freelist_hardened_early);
+}
+early_param("slab_freelist_hardened", setup_slab_freelist_hardened);
+
+static void __init init_freelist_hardening(void)
+{
+	if (slab_freelist_hardened_early)
+		return;
+
+	static_branch_disable(&slab_freelist_hardened);
+	pr_info("SLUB: freelist hardening disabled\n");
+}
+#else
+static inline void init_freelist_hardening(void) { }
+#endif
+
 #ifdef CONFIG_MEM_ALLOC_PROFILING
 DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
 			slab_obj_ext_has_codetag_key);
@@ -565,10 +591,10 @@ static inline freeptr_t freelist_ptr_encode(const struct kmem_cache *s,
 {
 	unsigned long encoded;
 
-#ifdef CONFIG_SLAB_FREELIST_HARDENED
-	encoded = (unsigned long)ptr ^ s->random ^ swab(ptr_addr);
-#else
 	encoded = (unsigned long)ptr;
+#ifdef CONFIG_SLAB_FREELIST_HARDENED
+	if (slab_freelist_hardened_enabled())
+		encoded ^= s->random ^ swab(ptr_addr);
 #endif
 	return (freeptr_t){.v = encoded};
 }
@@ -578,10 +604,10 @@ static inline void *freelist_ptr_decode(const struct kmem_cache *s,
 {
 	void *decoded;
 
-#ifdef CONFIG_SLAB_FREELIST_HARDENED
-	decoded = (void *)(ptr.v ^ s->random ^ swab(ptr_addr));
-#else
 	decoded = (void *)ptr.v;
+#ifdef CONFIG_SLAB_FREELIST_HARDENED
+	if (slab_freelist_hardened_enabled())
+		decoded = (void *)(ptr.v ^ s->random ^ swab(ptr_addr));
 #endif
 	return decoded;
 }
@@ -601,9 +627,9 @@ static inline void set_freepointer(struct kmem_cache *s, void *object, void *fp)
 {
 	unsigned long freeptr_addr = (unsigned long)object + s->offset;
 
-#ifdef CONFIG_SLAB_FREELIST_HARDENED
-	BUG_ON(object == fp); /* naive detection of double free or corruption */
-#endif
+	/* naive detection of double free or corruption */
+	if (slab_freelist_hardened_enabled())
+		BUG_ON(object == fp);
 
 	freeptr_addr = (unsigned long)kasan_reset_tag((void *)freeptr_addr);
 	*(freeptr_t *)freeptr_addr = freelist_ptr_encode(s, fp, freeptr_addr);
@@ -6730,7 +6756,7 @@ void kmem_cache_free(struct kmem_cache *s, void *x)
 
 	slab = virt_to_slab(x);
 
-	if (IS_ENABLED(CONFIG_SLAB_FREELIST_HARDENED) ||
+	if (slab_freelist_hardened_enabled() ||
 	    kmem_cache_debug_flags(s, SLAB_CONSISTENCY_CHECKS)) {
 
 		/*
@@ -8766,6 +8792,9 @@ void __init kmem_cache_init(void)
 	if (debug_guardpage_minorder())
 		slub_max_order = 0;
 
+	/* Must be settled before any free pointer is written. */
+	init_freelist_hardening();
+
 	/* Inform pointer hashing choice about slub debugging state. */
 	hash_pointers_finalize(__slub_debug_enabled());
 
diff --git a/scripts/gdb/linux/slab.py b/scripts/gdb/linux/slab.py
index ddde25aeca8d..eab6cf44b54b 100644
--- a/scripts/gdb/linux/slab.py
+++ b/scripts/gdb/linux/slab.py
@@ -96,8 +96,14 @@ def swab64(x):
     ((x & 0xff00000000000000) >> 56))
     return result
 
+def freelist_hardened():
+    if not constants.LX_CONFIG_SLAB_FREELIST_HARDENED:
+        return False
+    key = gdb.parse_and_eval("slab_freelist_hardened")
+    return int(key['key']['enabled']['counter']) > 0
+
 def freelist_ptr_decode(cache, ptr, ptr_addr):
-    if constants.LX_CONFIG_SLAB_FREELIST_HARDENED:
+    if freelist_hardened():
         return ptr['v'] ^ cache['random'] ^ swab64(int(ptr_addr))
     else:
         return ptr['v']
-- 
2.54.0

