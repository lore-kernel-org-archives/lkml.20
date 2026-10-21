Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583295;
	b=eZ9uFuMhvXFoj+w9jOQFvknzus/laU6DzqJh0cgK2fPh5QT1CeN+eePG9/yckWSemLGb
	 B2zWNFC+kvjYDcPUjsXtRg63UTYfXmOr0itH1vQ+ieLhogoJOTjbpglWVFP99QmUn7gdz
	 xV3vXdYZQEqdlgsC8m2GUPNpAjIL17b+PQ99tCQGC/wqx5yenDqWpYHZcf1dQT+YZQQjj
	 uGLAS82JA4Syl1uyZ6cf3g1rH0vCxggQ2luM+FxSfiRZ0uzNqx6w5uDmJYxLArv5EbD+9
	 G+WLyLqeMJ2KfFhWzmOqKOOqTh/SWpfyksaIu4g++UffgyKaR3NhR0Qbj3BTKtFj4Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583295;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=EjyGHiA63Kg9pRo+xskIrl/3J/aH9iYm9CZHmHbN9Ks=;
	b=Yw8f0fEPwOrZGZ3mkpdi8kAXnifeVn5vi5pB519rgUsA+dbuw/HEgMV42JR7RKR4gw22
	 yfsc+zl8q620xcQXarZMz0kuFHPHcv/cKnPNvLjOwaIQpftWYtpsgRdDNYsCtHQDQ/yMz
	 +0gO0MvH/j/ZUTNq5LW2zFV/4RoWPcm/lze5qEVDwtzmLj8jMmKf8jmSAEWDA9biFcZF0
	 fiMbtxQwh94RLc3QVVotHptN6rSHiu4vz4USnmQZ7v5h6KhTlJ0A3ZUUTRq8I4iEFsG+v
	 k9Mb/vl81c5qGlEKk/mHtamrT5hS490U67q6z5zfJKokHeqEc8GGDH04uf5dl/5k7CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gz+GXDjL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FCB60A4AF1
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gz+GXDjL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95061F000CF;
	Wed, 21 Oct 2026 11:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792583295;
	bh=EjyGHiA63Kg9pRo+xskIrl/3J/aH9iYm9CZHmHbN9Ks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gz+GXDjLutO2S6shUocw0cTgHIwlqLGnY+0JorwJyOhgW7u9stCz2SZl47wxlVLbn
	 lVhxDEsUyPoVkb6j9PiR6gpMylykZHsxTbcRgDa0qhDe7J3KU2tuq/9aiJi3O6RKF7
	 91RveW4SxB5JA+6/X6AizJBeWc2tH3I8n0kBcD7A+7nS6HtfhAdpdWxdUqqH7alFU4
	 LxDyrMh4VGNlnamqhirLa31r6p+22LHBEfgOSoPpusUjlxFLjc/bIbab/G3QXUArc+
	 ySX/ElnrrZLc3ff6Lb1H2KZ1k2IZuKUUIzQp+ikv81t4655Rh0JoMJpyRMsYdo1+Qo
	 BdGzv997QLcMA==
From: "Harry Yoo (Meta)" <harry@kernel.org>
Date: Wed, 21 Oct 2026 12:46:55 +0100
Subject: [PATCH slab/for-next 14/14] mm/slab: do not set SLAB_MAY_ACCOUNT
 for all caches
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
Message-Id: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-14-096800aa3330@kernel.org>
References: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-0-096800aa3330@kernel.org>
In-Reply-To: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-0-096800aa3330@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, Muchun Song <muchun.song@linux.dev>, 
 Hao Ge <hao.ge@linux.dev>, Pedro Falcato <pfalcato@suse.de>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 "Harry Yoo (Meta)" <harry@kernel.org>
X-Mailer: b4 0.16.0

Now that all caches whose objects may be allocated with __GFP_ACCOUNT
specify SLAB_MAY_ACCOUNT (or SLAB_ACCOUNT, which implies it), stop
assuming any cache may be used with __GFP_ACCOUNT. This avoids wasting
the objcg slot in slabobj_ext for caches that are never charged to a
memcg.

Assisted-by: LLM # Changelog
Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
---
 include/linux/slab.h | 16 +++++++++++++---
 mm/slab_common.c     |  8 +++-----
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index cda126def67a..d69445346494 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -200,14 +200,24 @@ enum _slab_flag_bits {
 /**
  * define SLAB_ACCOUNT - Account allocations to memcg.
  *
- * All object allocations from this cache will be memcg accounted, regardless of
- * __GFP_ACCOUNT being or not being passed to individual allocations.
+ * All object allocations from this cache will be memcg accounted.
+ * SLAB_ACCOUNT implies SLAB_MAY_ACCOUNT.
  */
 #ifdef CONFIG_MEMCG
 # define SLAB_ACCOUNT		__SLAB_FLAG_BIT(_SLAB_ACCOUNT)
-# define SLAB_MAY_ACCOUNT	__SLAB_FLAG_BIT(_SLAB_MAY_ACCOUNT)
 #else
 # define SLAB_ACCOUNT		__SLAB_FLAG_UNUSED
+#endif
+
+/**
+ * define SLAB_MAY_ACCOUNT
+ *
+ * Objects will be memcg accounted when __GFP_ACCOUNT flag is specified.
+ * Requesting __GFP_ACCOUNT allocations without SLAB_MAY_ACCOUNT is not allowed.
+ */
+#ifdef CONFIG_MEMCG
+# define SLAB_MAY_ACCOUNT	__SLAB_FLAG_BIT(_SLAB_MAY_ACCOUNT)
+#else
 # define SLAB_MAY_ACCOUNT	__SLAB_FLAG_UNUSED
 #endif
 
diff --git a/mm/slab_common.c b/mm/slab_common.c
index e66c0778ee98..c69aac8bb0e4 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -359,12 +359,10 @@ struct kmem_cache *__kmem_cache_create_args(const char *name,
 		goto out_unlock;
 	}
 
-	/*
-	 * For now we assume any cache can be used with __GFP_ACCOUNT and thus
-	 * may need to store objcg pointers for objects
-	 */
-	if (!mem_cgroup_kmem_disabled())
+	if (flags & SLAB_ACCOUNT)
 		flags |= SLAB_MAY_ACCOUNT;
+	if (mem_cgroup_kmem_disabled())
+		flags &= ~SLAB_MAY_ACCOUNT;
 
 	/* Fail closed on bad usersize of useroffset values. */
 	if (!IS_ENABLED(CONFIG_HARDENED_USERCOPY) ||

-- 
2.54.0

