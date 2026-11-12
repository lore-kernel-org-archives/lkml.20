Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477901;
	b=q3rGQEEzsglv1KtGQKxQ8Pnq2hu9kXHPAnqe4s04Oct9yMtfeaQyBabqXeKKIHfDVbl4
	 bJHp8l+P6nfZTI7GYEhGK8VbkD6IiQvYrA/edsP91PueXqdalVWD+00GVHbbJpE4DVxTu
	 xCCUKgVRt2KkjFgkNs69aqU58iEfN6R63bCr75Ydv0Jbth2/GRf/epRLnVkYPUBEjwAR0
	 vYMQZfqSJhRhV6NO1eRkavpeOiAatIxL8urFS2PWqDcjHrstncuUP5Mx1kv2PTrczdgfW
	 lDouAMzMHInV85obG8zejQEY8MXIb3Y9miXbC61ed4lnjfaGxykkTt/se6gwMYqvi4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477901;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=srD7b7Ep/Si4Uv1VqcvOlOJ9O0diFeTtKplDChpFe6g=;
	b=sBYvLXTEK+/PDLSwWwu5KYpsbIN4pUxY7AOBdLYKiqbzJTE1FZTQxqdSlo3ndU8rsQkI
	 s0TM837Bp+Gpix4F8/NwBZ7XhmtZJ7gRtUngRzovhG367KqBl8pfGLjRviBN0zQ5SFUEP
	 WMnTlX8RmNowUubwkL2p+FfcarxV7dOHHZS3Hpv/4Y+gIVxmcc7mxgMPqehVpFleYaZvC
	 RPQURGA21NPOTdXZOhb84o5VfoJnQO0CgW2uvx38JS6G9i/z3NUG4G8YXOVEgPbQDjUCt
	 WdxctXBkM9n0yWIdzQcodDzRjLKOWI3Kdd0YO+zIf3zExJt+TVU6Scmv5X97Nz27k3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=TcCv8MYk;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12DB60A2608
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A12DB60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=TcCv8MYk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=srD7b7Ep/Si4Uv1VqcvOlOJ9O0diFeTtKplDChpFe6g=; b=TcCv8MYkIVyCdESd9ViyissnNb
	ADAi+Ci5YmHVu2Vj55Ao1yjPViMWUCPBkeTLqb5YhOXzVq4rMEKaUPr4HA6FD0fDIziXWmUD4x1Qi
	fPoFiAhjWJEJrSPLoMyHsKjI5uljG7+W+ISyE/UwcDVMpneFThzje/jE/qXUyyAiQHm6ppUcT7jrk
	k5h6+S1C10sjUp0midAhGihYhHjjeP+FuFiFotqrCPJjX4xwrVI9SfEG704EII8nZZIO93UxL39EX
	pBVJljmr+uTlvT2RK3mnUiRh9CiYipq2/KCQ32ttj5nG6nhrtO18/VCouYAdeO1z+pzCrxjyFG1rt
	ogJH2dIQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRRfn-00DssJ-2G;
	Thu, 12 Nov 2026 10:04:52 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 12 Nov 2026 02:04:18 -0800
Subject: [PATCH] slab: allow sheaves for SLAB_NOLEAKTRACE caches
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
Message-Id: <20261112-kmemleak_sheaves-v1-1-e40e3d73b253@debian.org>
X-B4-Tracking: v=1; b=H4sIACeP9WoC/x3MWwqDMBAF0K0M99uAE7FgtiKlpPVWBx8tGRBB3
 HuhZwHnhLMYHUlOFO7m9tmQRCvBa8rbyGADkiDW8aaqdZhXrgvz/PCJeaeHZ9M22naah6ioBN/
 Ctx3/sr9f1w96GXE0YgAAAA==
X-Change-ID: 20261110-kmemleak_sheaves-b3531591ad21
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 Catalin Marinas <catalin.marinas@arm.com>, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4171; i=leitao@debian.org;
 h=from:subject:message-id; bh=MLIdxiVYr0DykPJmiS1vQneQqXpmkadDVW7FJlirFLM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq9Y9A2ObEikrSuWD4D6AfZFba14UUyXj1BQJy6
 oYycboraESJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCavWPQAAKCRA1o5Of/Hh3
 bXCUEACZgA+GkTSzeaJdyEh+2nSyorQzJFWP6Jv3W5KJgVCECtKeKV4Yd04X9XYCIG+aEFuPat9
 r/gz/uZJqKRwnJeWCkgCdJaguu0OduUm2JJphP4vG9inC8fBun2FIp8scbxNq/RR+YjD0JaG8yd
 C1Fm/XwMXFShRrq6PlSCUGgkCCTRZkNbVa5aqN8JOwI1gw189SpWd6Ogmm4YfJIGVNd48tqtoRS
 XOt71tuBzhve29nFhpluf8Imf24owalpf6AwT4UzM6WanaXZx+hAAHBg841jWlXhBcIr3uLpuOH
 xvErIDZuCSALHJ1nNkOOosMp9XGSU9b/VKU9+Y2ASG46r+ZbT5FpsTURY1EfGmH78pJasoGD8+Y
 667J4m03ddSbCHSY7l+y8/G0kOy1PoAobo6ATGCvhnrdkkMrguLr/v+DhF7FEKH7qDMqe+EVHvf
 /LlgKQ7dhMqDg49aITqq+cirxiaEOrcLqGEA2Pm2Mzm4AzOD/DH3FKquCQol+gN2rLSE7Z2HYSw
 6CWqem4nea9Bs3Qk4vPN0j3q+LFGtx3gteJ63JeQdBvxXhhrd7VnYdiaTLH/4ThMZDbq2k1ABjj
 vQP0/cmM9eS4WYO+e5NUFb35TSJ0yllhLPHeaRIcbOcGitn/6RrwmeJAufpM6/hA3m7WXwoqYPh
 x4Y66BjwKQ5QMnQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

This is a patch that makes kmemleak cheaper to run, by letting
kmemleak's own metadata cache use a _new_ sheaves type. The flag only
makes that possible without recursion.

The cost today:
  * every allocation kmemleak tracks needs one kmemleak_object from
    object_cache. An RCU callback frees it later.

Why that's slow:
  * object_cache has no sheaves, so each of those allocations and frees
    goes to the shared slab lists under n->list_lock.
     - On meta's fleet kmemleak kernels, list_lock is the second most
       contended lock, after kmemleak_lock.
     - About 88% of that wait is RCU callbacks freeing kmemleak objects.

Why sheaves aren't allowed:
  * a sheaf is a kmalloc object. Tracking it makes kmemleak allocate
    another kmemleak_object, which needs a sheaf, and so on.

When I reported the recursion in [1], I suggested keeping
SLAB_NOLEAKTRACE caches away from sheaves, and commit e47c897a2949
("slab: add sheaves to most caches") did that. It stopped the
recursion, but it took the sheaves away from the whole cache, although
only the kmemleak tracking of the sheaf itself recursed.

Commit 17c38c88294d ("slab: remove cpu (partial) slabs usage from
allocation paths"), from the same series, then left these caches with
no per-CPU caching at all.

In hindsight, skipping kmemleak only for the
sheaf itself, as the new SLAB_ALLOC_NO_LEAKTRACE does, would have been
the better fix.

Link: https://lore.kernel.org/all/aW_NK2NXVgtuzCVH@gmail.com/ [1]
Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/slab.h |  1 +
 mm/slub.c | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/mm/slab.h b/mm/slab.h
index e94ac63d10dc03..7b20f10aa46a2e 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -23,6 +23,7 @@
 #define SLAB_ALLOC_NEW_SLAB	0x02 /* a flag for alloc_slab_obj_exts() */
 #define SLAB_ALLOC_NO_RECURSE	0x04 /* prevent kmalloc() recursion */
 #define SLAB_ALLOC_NO_OBJ_EXT	0x08 /* prevent obj_exts array allocation */
+#define SLAB_ALLOC_NO_LEAKTRACE	0x10 /* skip kmemleak tracking */
 
 #define SLAB_FREE_DEFAULT	0x00 /* no flags */
 #define SLAB_FREE_NOLOCK	0x01 /* spinning not allowed */
diff --git a/mm/slub.c b/mm/slub.c
index 8369853ddca721..f19e20b6f9a4fa 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2850,6 +2850,13 @@ static struct slab_sheaf *__alloc_empty_sheaf(struct kmem_cache *s, gfp_t gfp,
 	if (s->flags & SLAB_KMALLOC)
 		alloc_flags |= SLAB_ALLOC_NO_RECURSE;
 
+	/*
+	 * kmemleak allocates its metadata from SLAB_NOLEAKTRACE caches, so
+	 * tracking their sheaves would recurse into kmemleak.
+	 */
+	if (s->flags & SLAB_NOLEAKTRACE)
+		alloc_flags |= SLAB_ALLOC_NO_LEAKTRACE;
+
 	sheaf_size = struct_size(sheaf, objects, capacity);
 	sheaf = kmalloc_flags(sheaf_size, gfp | __GFP_ZERO, alloc_flags, NUMA_NO_NODE);
 
@@ -4727,7 +4734,8 @@ bool slab_post_alloc_hook(struct kmem_cache *s, gfp_t flags, size_t size,
 		if (init && p[i] && !is_kfence_address(p[i]))
 			memset(p[i], 0, zero_size);
 
-		if (alloc_flags_allow_spinning(ac->alloc_flags))
+		if (alloc_flags_allow_spinning(ac->alloc_flags) &&
+		    !(ac->alloc_flags & SLAB_ALLOC_NO_LEAKTRACE))
 			kmemleak_alloc_recursive(p[i], s->object_size, 1,
 						 s->flags, init_flags);
 		kmsan_slab_alloc(s, p[i], init_flags);
@@ -7987,13 +7995,8 @@ static unsigned int calculate_sheaf_capacity(struct kmem_cache *s,
 	if (IS_ENABLED(CONFIG_SLUB_TINY) || s->flags & SLAB_DEBUG_FLAGS)
 		return 0;
 
-	/*
-	 * Bootstrap caches can't have sheaves for now (SLAB_NO_SHEAVES).
-	 * SLAB_NOLEAKTRACE caches (e.g., kmemleak's object_cache) must not
-	 * have sheaves to avoid recursion when sheaf allocation triggers
-	 * kmemleak tracking.
-	 */
-	if (s->flags & (SLAB_NO_SHEAVES | SLAB_NOLEAKTRACE))
+	/* Bootstrap caches can't have sheaves for now (SLAB_NO_SHEAVES). */
+	if (s->flags & SLAB_NO_SHEAVES)
 		return 0;
 
 	/*

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261110-kmemleak_sheaves-b3531591ad21

Best regards,
--  
Breno Leitao <leitao@debian.org>

