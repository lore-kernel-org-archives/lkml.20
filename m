Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5343876A9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119557; cv=none; b=c5pvLhzZjkCl9mTI9qrbwfhFzEmKu42bA4Vn07nVjeTfia8jCPuPDVLCNWvbJZGW+KVb6TGSZgzwF32+3Tz6f8nvL08pPurdqFGKYbi6PRHeQnZAnafGk46n0u5Pt1pZxQUKBqfrhByW9S5NRmEweuSvCoOxERiAj1rvzWP04vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119557; c=relaxed/simple;
	bh=0imXMVLvOwwix9YUdq6XqYgfrrARm+8HJOJ2LHyQZMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C4UZNJbS1povBUCUy8R4tKlc0Fbq8aqDLZujfnfOWYRf/mpUPWD2oCYXpqhIrAweckfAZZoR2ML/p+w+b9yHCM+enVMZC0OfTP2VceDddQfS1lD/FzBJQpRF6qXHwiW9Y6vmjHcPcI+75WsfERwSuABnVCeE14coxXeXgBTG3DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEd6Pkjh; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEd6Pkjh"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2803981eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792119555; x=1792724355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pPuCC48Hy2fsKRIjoJrlINKPfQUMeKQHIeAV5LoC0E=;
        b=gEd6PkjhMnC/WPLNK5nQ0uc/tgCYiGM4r9wGZX8ZJL/p4KUiKdMfU86Whv8kxF8Pxi
         4CL2LFAaCcrW67O8jcSPeO55aOJaDYnDKfiPu45G9e2TMlicKOAM8OO8a3r/6VFHCPuo
         OP2CX3Sb6fM0N6d0HuTBm1fFhL5fGs/MEboW060L9YQuRbyX0fLu3NcGsOGmYA/T4HT0
         SguOypVoVq4ZioXj2Wcpm8hZXIeTTCfLmxQwqv9F0UVV/ikh7m2WOboO2eYY264oh9wv
         72N4qhUOLXSPY8aekRmeszgxfKMCnMtMr8y/KVhTOQn9UE9bNaegGWUp3PqRa4Qu+geH
         fhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792119555; x=1792724355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pPuCC48Hy2fsKRIjoJrlINKPfQUMeKQHIeAV5LoC0E=;
        b=2PfLSDFhpcU800I1G2Dnz++KUwqP8hsMcRu7a5sduo+T7ZRs1e6AD4b6Qf1SdUd8Ge
         PwJIhRnCZ8FFPjPd7quIaLa69Trqcx7m0kl/welRZXOC5RCr64YsyfQlk0OkoSBv4xBB
         FaRBbLlTqPP9vd6fuOrDo7BANlOy/MVRi62/0JcXx1cg6nzaZxjLlop9Z/4Hgi3Rde8f
         m8SYiGVQvKjchzB/VieD0PS0ffXVDcxCPvCBC20pnvV5VXh3OEteOTTBl6ap9cewrMvE
         WUqW1MqV70f4R8cM2mbWKRUjoj/gm1E2w4ulD6fptvVJ6hlPW2Wkp5v1tg5Un39qZSvJ
         97JA==
X-Forwarded-Encrypted: i=1; AKwUvBzmOjKqfOAZImZCH9wKlo11K3ghB8ddA00q8qGLXMzToQm4vnddMXMlG/x9bh/zq0Y3cJybdjYxRtHrNRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVxo0OsZTo2pijwfZJts393W4qzTwvqxszDqe3bOhfeMnNvakm
	Cu5nZe7dXllXO13CW2tXQaBmW6LKoNUOZsgPgNbHdu+pyu6R9hg6kCWooPimDSrpRtM=
X-Gm-Gg: AYBFou18TfrRI2bt4mLvLa+eVIkeTuo4Y8i+aHVmWvDbveLVCrC7jXp6950earbIbBL
	xFjtYzakAJGWCW1K14Yz18KVoPee7lkCYMDHsLZlIsaYTIuOa99/kN4rUh6jKpVR9IMeo+Dp5e8
	ssPGtmyDw5VY/+zxwTIjpcYUYBW9x1//DiPHvxV31q2+svq3f4uUHrYY9jkkQB8VRyII4VNutGp
	0B0muqhkpEevY2M86CzZOyDVjj6TsWDPaR/IUOElj1Ysxywp0/w9NTWQBTiToiZ+Ty2vT2vWtMP
	qj/dX0ZLfeZ/UEfNlY99KRQL6iNDWYRLF4l2IDXAB1sZ7ATxhpDGziDsmjayVML8lkRvnib6APS
	VTC1OnfWC9th7tpkLHrIXWhbl27gjbIc/a5FDUZ26F96UDMUBLz/hnfZbznzUZzM4XrvbckKXNp
	+3Nq0Gy90Yj5jcG0oXAcwnxxmMKjy5tzlOBNn/2ZZXZ8iyrNdx446p6L2wzewMf9gxtA==
X-Received: by 2002:a05:7301:78cb:b0:351:515b:4e85 with SMTP id 5a478bee46e88-3537e088bd7mr28316839eec.16.1792119555483;
        Thu, 15 Oct 2026 19:59:15 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm2481261eec.3.2026.10.15.19.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:59:15 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 16 Oct 2026 10:59:05 +0800
Subject: [PATCH bpf-next v4 1/4] bpf: Protect the struct_ops association
 with a spinlock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-selftests-bpf-struct-ops-assoc-timer-v4-1-9ad31c21220c@gmail.com>
References: <20261016-selftests-bpf-struct-ops-assoc-timer-v4-0-9ad31c21220c@gmail.com>
In-Reply-To: <20261016-selftests-bpf-struct-ops-assoc-timer-v4-0-9ad31c21220c@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_prog_assoc_struct_ops() and bpf_prog_disassoc_struct_ops() update
prog->aux->st_ops_assoc under st_ops_assoc_mutex, and the latter puts
the map of a non-struct_ops prog while holding it.

A struct_ops map is about to dissociate its progs from
map_free_pre_rcu(), which bpf_map_put() calls in whatever context drops
the last reference, including softirq, e.g. bpf_struct_ops_put() from
tcp_cleanup_congestion_control(). A mutex can't be taken there, and the
put of the last reference under the lock of one prog would take the
lock of other progs.

Replace the mutex with a spinlock taken with interrupts disabled, and
put the map after dropping it.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/linux/bpf.h         |  2 +-
 kernel/bpf/bpf_struct_ops.c | 19 ++++++++++---------
 kernel/bpf/core.c           |  3 +--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 54144372281cb..2a51acd34f9a9 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1960,7 +1960,7 @@ struct bpf_prog_aux {
 		struct rcu_head	rcu;
 	};
 	struct bpf_stream *stream[2];
-	struct mutex st_ops_assoc_mutex;
+	spinlock_t st_ops_assoc_lock; /* protects st_ops_assoc */
 	struct bpf_map __rcu *st_ops_assoc;
 };
 
diff --git a/kernel/bpf/bpf_struct_ops.c b/kernel/bpf/bpf_struct_ops.c
index 1178acd72296e..a1ae30b145a03 100644
--- a/kernel/bpf/bpf_struct_ops.c
+++ b/kernel/bpf/bpf_struct_ops.c
@@ -1541,10 +1541,10 @@ int bpf_prog_assoc_struct_ops(struct bpf_prog *prog, struct bpf_map *map)
 {
 	struct bpf_map *st_ops_assoc;
 
-	guard(mutex)(&prog->aux->st_ops_assoc_mutex);
+	guard(spinlock_irqsave)(&prog->aux->st_ops_assoc_lock);
 
 	st_ops_assoc = rcu_dereference_protected(prog->aux->st_ops_assoc,
-						 lockdep_is_held(&prog->aux->st_ops_assoc_mutex));
+						 lockdep_is_held(&prog->aux->st_ops_assoc_lock));
 	if (st_ops_assoc && st_ops_assoc == map)
 		return 0;
 
@@ -1569,19 +1569,20 @@ int bpf_prog_assoc_struct_ops(struct bpf_prog *prog, struct bpf_map *map)
 
 void bpf_prog_disassoc_struct_ops(struct bpf_prog *prog)
 {
+	struct bpf_prog_aux *aux = prog->aux;
 	struct bpf_map *st_ops_assoc;
 
-	guard(mutex)(&prog->aux->st_ops_assoc_mutex);
+	scoped_guard(spinlock_irqsave, &aux->st_ops_assoc_lock) {
+		st_ops_assoc = rcu_dereference_protected(aux->st_ops_assoc,
+							 lockdep_is_held(&aux->st_ops_assoc_lock));
+		if (!st_ops_assoc || st_ops_assoc == BPF_PTR_POISON)
+			return;
 
-	st_ops_assoc = rcu_dereference_protected(prog->aux->st_ops_assoc,
-						 lockdep_is_held(&prog->aux->st_ops_assoc_mutex));
-	if (!st_ops_assoc || st_ops_assoc == BPF_PTR_POISON)
-		return;
+		RCU_INIT_POINTER(aux->st_ops_assoc, NULL);
+	}
 
 	if (prog->type != BPF_PROG_TYPE_STRUCT_OPS)
 		bpf_map_put(st_ops_assoc);
-
-	RCU_INIT_POINTER(prog->aux->st_ops_assoc, NULL);
 }
 
 /*
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 05c89396119ad..fd4e4dc4acc8c 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -141,7 +141,7 @@ struct bpf_prog *bpf_prog_alloc_no_stats(unsigned int size, gfp_t gfp_extra_flag
 	mutex_init(&fp->aux->used_maps_mutex);
 	mutex_init(&fp->aux->ext_mutex);
 	mutex_init(&fp->aux->dst_mutex);
-	mutex_init(&fp->aux->st_ops_assoc_mutex);
+	spin_lock_init(&fp->aux->st_ops_assoc_lock);
 
 	return fp;
 }
@@ -291,7 +291,6 @@ void __bpf_prog_free(struct bpf_prog *fp)
 #endif
 		mutex_destroy(&fp->aux->used_maps_mutex);
 		mutex_destroy(&fp->aux->dst_mutex);
-		mutex_destroy(&fp->aux->st_ops_assoc_mutex);
 		kfree(fp->aux->poke_tab);
 		kfree(fp->aux);
 	}

-- 
2.43.0

