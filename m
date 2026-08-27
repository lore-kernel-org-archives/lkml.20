Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FBA36897F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803131; cv=none; b=sRKpqF34aY4nKhQ+MAOtZGH4Uq49j3MMqS80e2dakKO4FvhCZGmaMWOIDoTaFaJ22hcDu+iz8CTT5ZYZEntx/LVTZ6UUFJOYQiqHLsnIGU22sevU773XMN2s1JtQ6gt2j3YnGC7ca8Ld7pXQFb+emJIBu0no15djVy3wtybi+IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803131; c=relaxed/simple;
	bh=KBbn5zMVc11FFLiEDAyH0VD8kb3z5zwz1J7+56mGnFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Am3YSd1yzoXrLLTtSfrBL9VR0VBhHuHgnHA6FoO7DjhpVLobT0YmKaJFltf3dJtaa3Po3+jgs0B1z4LcdZaF2+3CbUnoSQ3MpFwg81IDUMrz3mEA33jfCjj6WecPa9DAX/igywo0XuuwtywEsQAj4Wo7Y7tJMn99N/7l2q4pCkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cL2LYI/B; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cL2LYI/B"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7eb9b427da2so596278a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803127; x=1788407927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1ZYKnbhx55UfIG6vLf2ZPoaGRdGf42KIjwnPPEG1OU=;
        b=cL2LYI/BZPNhuZ4AFoxQBk6llab2BH4F6hEyRqthG4+8IaVnUk6vXyK4lmE/lX9qH7
         I/mLkrizF/4tV7U0Sdh9g2A2L4uqBQO1kuC8S+mF/+4OdyxsUXLXGqSQj2+wSRQh1JeE
         nitDw2K+Cef+PH96CqCklGOWJynxD8PWoErDwVQBoAFMxXAWOaVIiDD2DE3r7vQuS6Ma
         wAqnGgk5j4I0ql4Ftdrik2ocoQ/DkBpkMF9KPTrKbFMN9lP/rDwCKUVgTapiDGKEYanb
         i9wfcuxQAmXkEfKhPSab7RbyWxyAWlOONHZ3jJBOzNA74Gdqfaz0qdgTHqPbeNV+U8nd
         YzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803127; x=1788407927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i1ZYKnbhx55UfIG6vLf2ZPoaGRdGf42KIjwnPPEG1OU=;
        b=OLxZwAU1xxeUYI8u3ZajDqfPhzWefvrQnvHkv/X777AO5d2o23D+YJ6O5Xt07cjsiS
         DgvIGczxWKJeo13xs27//1pWdjX59EyS4N8AaQYm9ogYXAmwQJ2i536asmCuyI1B09Id
         GtwoA8jE5LYGgfpf9MHJyENiMXovWeN/hVMDZzzhGckqHtdbur6Xduw/rNTM/zuhgrKW
         TOM6qN6n2viy7b6xJc8m94gGdx0fwsF9oX0GlrUmwBa+Mo8v4CA0YOOVFD3FJr9JY16A
         uLG7gEQ8A1vUeRi/f2lXp5bNuwX2u2BdTDU9vb8znAMRg+psCdn6Ke8WPs6Xzis8PmwK
         4f4A==
X-Gm-Message-State: AFuF++lzE9Nl8hH+yq9N6I02ayPSXg3k/azxKQPBF55JDPYTk7+NdGk8
	/VxmrrGuX2gr1IvCj9mTytxSD4NjnmNauooGyUztVpQJzf7sgBK4mrU0
X-Gm-Gg: AR+sD131meDiR/dqmNxn+3o+c3XIG5a+dQXCDkmoxirX9IZgaWLVaSPtpIgQXLRt5tv
	8sVS/rS7tdAREgBTuIBA/BCr5+Ml/MMMElvJiRO6ZcHnf7BWafOACCNbcVUsSkKUpJQ64xYQypt
	Zkd0jzvcRvDH2/PgOTmZfdARCraw96x1S+iGFoz96dRuzVKN7KJKGOWlumTac8I85X07rCKPhFe
	sWWUkVotFCZ8vSDdaxrifnleNjhro911B3cLQeeOqb6aVDD0lyp0COX8MGG4N1olCYeFtFD6HOm
	xnNxgPErndp9C+wIg9eykhuABYNsMtnMjEmYbUOIT9Fpne0Y9UpYTms7yhMzmZYj6XCyzeZc37m
	FqRdJT9PK7ERa+c9INuAVFoObYWW4+xTzJX+jNd1XtTZoyQjl6nXgGSOT6XIi9V6Mz2Ijx0Ph0D
	20pDhDcZHNOD4QsmXmBfAtAfBfmpItszYLQ8sqf2Y7Mewacf3URhszkJPwDJEArVuTLPxdoEFK0
	aELDapUcokHEKu0GDURCArCBmtMwNdx4pHzK/nePpfKndVH6MG248lP99XUq7eFHFTQf+cuYW2j
	6HF8piJI
X-Received: by 2002:a05:6820:4b14:b0:6b1:19dd:f2cb with SMTP id 006d021491bc7-6b1b00bdba0mr2985829eaf.12.1787803126896;
        Wed, 26 Aug 2026 20:58:46 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-467367af2bfsm900825fac.6.2026.08.26.20.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:58:46 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 26 Aug 2026 21:58:37 -0600
Subject: [PATCH 5/8] lockdep: Fast-path power-of-2 tables with shift/mask
 indexing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-lockdep-memblock-v1-v1-5-e2db855391ec@gmail.com>
References: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
In-Reply-To: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787803120; l=3516;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=KBbn5zMVc11FFLiEDAyH0VD8kb3z5zwz1J7+56mGnFM=;
 b=iFOeT+4MtfEBubaJMjX8+5la/Gq0dbjCnYl0hKvKo8WFzOz86V+Xn7YbBVfxtcFJNzVkAWBW9
 y64UMLc9A7+CibPDhvdFrE0DJoNayNs5owJ1n3pw4gRNhAYx7Nd9y+f
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

The 2D chunked arrays (DECLARE_CHUNKED_ARRAY) use Granlund-Montgomery
reciprocal division (reciprocal_divide()) to map indices to (chunk, offset)
tuples across 64 KB slabs. This achieves >99.8% packing density for
non-power-of-2 structs (lock_classes @ 160 B and list_entries @ 48 B).

However, the ultra-hot cache-verification tables (lock_chains @ 32 B and
chain_hlocks @ 2 B) have exact power-of-2 chunk counts (2,048 and 32,768
elements per 64 KB slab).

Add a compile-time branch in DECLARE_CHUNKED_ARRAY() using __builtin_ctz():
for power-of-2 tables, GCC/Clang folds translation into single-cycle bit
shifts (idx >> SHIFT) and masks (idx & MASK), eliminating reciprocal
multiplication overhead entirely from the hot acquire validation path.

Workload Progression (hackbench -p -g 8 -l 1000, 4 vCPUs):

  Metric        Upstream (1D) Generic (P2)      Fast-Path (P3)   Delta
  ====================================================================
  Runtime             8.482 s    8.895 s (+4.8%)       8.278 s  -2.40%
  Cycles          52899510936   55428687460     52033166458     -1.64%
  Instructions    29008189069   31932214532     31698626928     +9.27%

By replacing G-M multiplication with single-cycle bit shifts on the hot
cache verification tables, cycle overhead drops by ~6.4% relative to
Patch 2, bringing total cycles to parity with or slightly faster than
upstream baseline (-1.64% cycles).

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 kernel/locking/lockdep.c           |  2 +-
 kernel/locking/lockdep_internals.h | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 1c8db52af1ac..b2dc7619a5e3 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -3953,7 +3953,7 @@ static struct lock_chain *alloc_lock_chain(void)
 	if (unlikely(idx >= MAX_LOCKDEP_CHAINS))
 		return NULL;
 
-	chunk_idx = reciprocal_divide(idx, lock_chain_rv);
+	chunk_idx = idx / lock_chain_PER_CHUNK;
 	if (chunk_idx >= LOCKDEP_MAX_SLABS)
 		return NULL;
 
diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
index eaa23d9b4dd5..ccd7343af672 100644
--- a/kernel/locking/lockdep_internals.h
+++ b/kernel/locking/lockdep_internals.h
@@ -154,14 +154,25 @@ enum {
 #define DECLARE_CHUNKED_ARRAY(name, type)					\
 	enum {									\
 		name##_PER_CHUNK = (LOCKDEP_SLAB_SIZE / sizeof(type)),		\
+		name##_IS_P2     = (!(name##_PER_CHUNK & (name##_PER_CHUNK - 1))), \
+		name##_SHIFT     = (__builtin_ctz(name##_PER_CHUNK)),		\
+		name##_MASK      = (name##_PER_CHUNK - 1),			\
 	};									\
 	extern type * name##_chunks[LOCKDEP_MAX_SLABS];				\
 	extern const struct reciprocal_value name##_rv;				\
 	static __always_inline type *idx_to_##name(unsigned int idx)		\
 	{									\
-		unsigned int chunk = reciprocal_divide(idx, name##_rv);		\
-		unsigned int offset = idx - (chunk * name##_PER_CHUNK);		\
+		unsigned int chunk, offset;					\
 		type *chunk_ptr;						\
+										\
+		if (name##_IS_P2) {						\
+			chunk = idx >> name##_SHIFT;				\
+			offset = idx & name##_MASK;				\
+		} else {							\
+			chunk = reciprocal_divide(idx, name##_rv);		\
+			offset = idx - (chunk * name##_PER_CHUNK);		\
+		}								\
+										\
 		if (unlikely(chunk >= LOCKDEP_MAX_SLABS))			\
 			return NULL;						\
 		/* Pairs with smp_store_release() when new chunk slabs are published */ \

-- 
2.55.0

