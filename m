Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792868867;
	b=NrRLCEh0yERqxnHTCalYJMJXVsb5dLCuIKNF8rSpIxCxn+IwQzIFt+7Sbj+zPygxAZZj
	 7Oe7cXOgs7qDm6vqkhmvtLkKRBkC6x8jWCYs8tJAWE+XXd4gEh5x6Ud24o+ttAIRe3spE
	 3r+Z4bjhD2Ka/bkUBMReRYA3a03DjhrUw7Zk+Jown08UbK89AiCgrw85hmlwmRNFYMEaR
	 jdumXLxX6FrABlTMyjoD/aaBV6jwb/SDYRKc5FcVb/nX7ryzRRTiui6G5Kh7TlhdcTIL/
	 To4VscjvGSJFPlK+X7yMsGVMWJIuPVfUV5LHDQOokR1cp/BWPqOkPdyod3ZpWi66RUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792868867;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=ZaNkuK+CuZCH16Zfn9adKcMMnVfFDERJiwr1XCFoM7M=;
	b=e13PBaLmRBBEsqzPRRllmDruuqzM8u5wq2UsIPlsO90fQT1iIlrtrw4bQNBHjZFB4qUR
	 wf8d/fSld8dPwF9kpOjpEL+R5EKWoTyf/WXjAm9L97nET6PDs0jCFH8pUPuqVSRuO5wrw
	 EKe34jFriDLQ7Hm8e+HMV2ZZT234lXHFeVnNbKt2xks0J2OPhtIfjmct2uMNww7ZLZOWn
	 I5BK2AkjG1OY0gMXTDV3g9YLOdTt+rDjn0yxclFdZtWqDZCtzu7UwkUUrIP1PGDS5Ms2a
	 XLQgQdBPE49fO4dMG37V79CAUPqBysw8YOOEUSyZzmTTQ/mLVouVzu7NoxLU9P91ZJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCFTpsce;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB9660A2600
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCFTpsce
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DFC1F01828;
	Sat, 24 Oct 2026 19:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792868866;
	bh=ZaNkuK+CuZCH16Zfn9adKcMMnVfFDERJiwr1XCFoM7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nCFTpscefOvN4FKKY7J0TU5WfZFfA6iuEGxsM111Fql15KylIOsDkfLQ9nH5GG+pp
	 nd4E2l6bWYfd6ufS0f0H6ntIDMZUpEieUAk1saZcqn1mDN/GUYR8YIgWHO6pwB7L+I
	 coFfoYAu0LJVHlVmSvs1Swoxv/9hcXy1Pe0WQwTyqxv/7W2nrXUNB+iTE7WjUg14qO
	 Vpl3LcfVIlwwkr0IDG1Atsm42i3OlbuclaSrV6HzwRkjtgOvorXZUx0HMFsPv91nTA
	 kRGsd+6bvZGgtotoasQkQTvta1qePw4y2iFBGmGdmYcDqoaVvP3+tGlZciEBHik/sM
	 ZUEfyr8g6Eyng==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Sat, 24 Oct 2026 21:07:26 +0200
Subject: [PATCH RFC v2 4/8] mm, slab: make SLUB_TINY handling dynamic for
 sizing decisions
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
Message-Id: <20261024-slub_tiny_rework-v2-4-bf1419ab5ffd@kernel.org>
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

Enabling CONFIG_SLUB_TINY results in the caches' min partial slabs
threshold to be zero, thus every slab where all objects become free is
freed immediately. It also sets the default slab_max_order to 1, with
the goal of reducing the potential of internal slab fragmentation.

Rework both of these decisions to be based on the newly introduced
slab_tiny_enabled flag instead of #ifdefs. It's still possible to
override the reduced slab_max_order with the boot parameter, as before.

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 mm/slub.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index a3ee1bdf0eb3..be4e1f193295 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -272,7 +272,6 @@ void *fixup_red_left(struct kmem_cache *s, void *p)
 /* Enable to log cmpxchg failures */
 #undef SLUB_DEBUG_CMPXCHG
 
-#ifndef CONFIG_SLUB_TINY
 /*
  * Minimum number of partial slabs. These will be left on the partial
  * lists even if they are empty. kmem_cache_shrink may reclaim them.
@@ -285,10 +284,6 @@ void *fixup_red_left(struct kmem_cache *s, void *p)
  * sort the partial list by the number of objects in use.
  */
 #define MAX_PARTIAL 10
-#else
-#define MIN_PARTIAL 0
-#define MAX_PARTIAL 0
-#endif
 
 #define DEBUG_DEFAULT_FLAGS (SLAB_CONSISTENCY_CHECKS | SLAB_RED_ZONE | \
 				SLAB_POISON | SLAB_STORE_USER)
@@ -7706,8 +7701,7 @@ EXPORT_SYMBOL(kmem_cache_alloc_bulk_noprof);
  * take the list_lock.
  */
 static unsigned int slab_min_order;
-static unsigned int slab_max_order =
-	IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : PAGE_ALLOC_COSTLY_ORDER;
+static unsigned int slab_max_order = PAGE_ALLOC_COSTLY_ORDER;
 static unsigned int slab_min_objects;
 
 /*
@@ -8027,7 +8021,7 @@ static unsigned int calculate_sheaf_capacity(struct kmem_cache *s,
 	size_t size;
 
 
-	if (IS_ENABLED(CONFIG_SLUB_TINY) || s->flags & SLAB_DEBUG_FLAGS)
+	if (slab_tiny_enabled || s->flags & SLAB_DEBUG_FLAGS)
 		return 0;
 
 	/*
@@ -8763,6 +8757,9 @@ void __init kmem_cache_init(void)
 
 	slab_obj_ext_has_codetag_init();
 
+	if (slab_tiny_enabled)
+		slab_max_order = 1;
+
 	if (slab_max_order_param <= MAX_PAGE_ORDER)
 		slab_max_order = slab_max_order_param;
 
@@ -8886,6 +8883,8 @@ int do_kmem_cache_create(struct kmem_cache *s, const char *name,
 	 */
 	s->min_partial = min_t(unsigned long, MAX_PARTIAL, ilog2(s->size) / 2);
 	s->min_partial = max_t(unsigned long, MIN_PARTIAL, s->min_partial);
+	if (slab_tiny_enabled)
+		s->min_partial = 0;
 
 	s->cpu_sheaves = alloc_percpu(struct slub_percpu_sheaves);
 	if (!s->cpu_sheaves) {

-- 
2.56.0

