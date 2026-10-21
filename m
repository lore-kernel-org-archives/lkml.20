Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549814;
	b=3vgQcOiqFndlCJOeC77Nj6o/5AcJlFW0uC8vsP4ceASvss7o2WsWdptvX6XvIT0HG7B0
	 3n5a63mAzf3m0e7i/xgXmHOnZt0iDArbXBDS8aICjBjqet4/OVri40HZZMuvR6klKQD/h
	 1jnObQDIw6elr3I975S0ZJfSSNLfjfYMuTY/9pdWGHT/UniHeyiXXhOIFKq0mq+3BVI4g
	 RRUj6n5NsrYXKi0zfic+a3qG6z/U6pSrKbwrksNQiOJGKSoxiopL+UtA6d3iY65yUY83e
	 KQ6VEyjYHMqOMrMdrOAMoysWL0y2HpvMcMy4kPYVEdu47TB+z7DiV/tJppGQXzN9oLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UpWlAbXZ3XIxfmYcSBSEV2A521nrJ8xRsK3NaAAoXRQ=;
	b=klmy7vGHdav4qiS7Jmd0npJAn+5PoYc9wLrB+DMqlJaaT4xv1Gl7zD3Ewk5nF1dDONk2
	 DK8EnfmYlsnmeJv36Kcw+8yGg78XpQDzTcEJZXf9mLqlvb/rLnFIyM68WeJUXmOrCtQBi
	 vTS1l5ZTprJNtjwhIOBU5pKgflG7OPKQQEKwErhZhTemFEDXxkR9WXjWYqojxW0uQUeeH
	 u47Fg2vwFdqKN4t1s0UEwTcTD+Whi4Xd4hQVFd9cqIkIUgQsP0tpx2v0JeXnYKqpagJYJ
	 c3Zp2kbx+NHBYyNPR3NXInqMr1GGN/bwaUgNreoy0eCOgoSZ+MXt7Cxvd5WfwFKCBTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nVmZDTKu;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E02606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E02606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nVmZDTKu
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6798eb0d190so145073d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792549813; x=1793154613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UpWlAbXZ3XIxfmYcSBSEV2A521nrJ8xRsK3NaAAoXRQ=;
        b=nVmZDTKuUBueqIOPlhNxBZj126POYLZyfANjw9PiL2vKUkG054leFB+UOq6ksFR7BC
         GLqFziNsR9JvAv6ra/ak58okk11/jD8k0DLIqzP0Wn8myPEdQspjpzcZFoSTI2C9IcqN
         WTLsKElQSog6BbMy4L1yEuBRU9xT3Y36LqJ9rRq/E1t4N2gltENBUMZjexCXB2G+vFBZ
         OzLTHbsyCYxv4iav5NR42fanUe1OyGIdUNm6/hUK+Ewf1yyfyX5B6HkHc/yd851mL4yI
         bMZtydXyhlT7rMIpdtVGBCLnqcKs+FLjr/ywoaudlIS+zcqKgyDEtfgO9NTVhyRgJG1h
         tlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549813; x=1793154613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpWlAbXZ3XIxfmYcSBSEV2A521nrJ8xRsK3NaAAoXRQ=;
        b=fvNO20JPFyI5csAJfejG0HUJwwwsEWBkHc5Uh2E/IQMaO5PFsxhOAs1DdkEpPxGYbQ
         2KmJ8lBVVqNzblC/wDlBR+uAPQsXqkCmJimo7I9nERsDjzKxjsxx8RN7Isz4tMYP+S+o
         yMnMK40ZlbSJRFc/mIDZ6tMwCBPRRhHkS/H7hbIKENGS6CARZp/Jp8uH+Clddm3KRzWZ
         NarTxxyqyYiqpdkPqIEnsb8Qz1DfJ6gROe0PZ41z4XZ7Mt/eZdtS2ZzGdfvCARCmVoKx
         Qu/eE3fqpI3MA0pl2cr8gMEsPeHy0MFnIaGH+DyZ1cyYbxHZIux9i31ezriOyinE8sS0
         N+3Q==
X-Forwarded-Encrypted: i=1; AKwUvByGPFTHgT3LE5vXMc+5MNLQ4OIg8/5FrREMo//5JjoAEsqcu4LivICoq6+ik/VlKjXmMAUz0+9iOQU1fN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl/vgxeQjYMw7Zpa+xWoNCtw90ot4xR8O2ihO4L+H83Rt2waW2
	sFrHWXUP5/LSJBJx/IX9YGi5+/AuUWEiw9V/FaWy0xuB+uNCyjwlbkoj
X-Gm-Gg: AYBFou2p3JCFebR27F47V2ZX7OSwGxnf8Ndb4Ta0nH1K431h8NzFQ0q8fArgb2hAM2W
	6+vLttGrC7mzK0f9xeOYshvlxP6uxdNL7x/YarwD63NEnzpit47+cj8TYDw9oHUdpBwraGBS443
	2JNDd9O+6lQx5QLBJ4GcpuJ5N5DzbHvTbk9SxhdK3O/93ZA44VCbE9Lp/98E+Fm+x/+o/nRUQPm
	gP/DQZHKPJILPEdpduhGlRW2sIATj45VoEA0p9DUzspP/MobVGkZb+FSZPcNWKAY8YQSvnHrNQu
	zjnT8y8k1O0iMeEbWPcqwGgJNwfSIctX/izHl/UIMl6gs59EFUlJEjQD5kclDRbI7BluaPFNTeo
	/Tgv8wDLqJrWB3FoAnjOvZbO0sGPWtdGQx7PT1YQC8i+NyAk8y560zIiORyKv1tjhVOUY8U/hbq
	ICXzBqc2qXa7XJv2UJbYxLrIICD3Tmf9K5e3J6w6Gy4LR3VrX+ym0EifuZUcbVMXBsCDzhlscr7
	yQTJzIpIAOYRhB3M85KWKwcIVSixM5aeOp80UedOrr6lX840QK8Q74m8dEQ4XO2C65UklCmy+qm
	0qVhqTqkFrxj51NIit0sw93Q2NUiNYNr
X-Received: by 2002:a05:690e:b87:b0:679:98dc:b39e with SMTP id 956f58d0204a3-67a0e589c18mr438090d50.80.1792549813020;
        Tue, 20 Oct 2026 19:30:13 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4e::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a0e4914eesm468827d50.4.2026.10.20.19.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:30:12 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Harry Yoo <harry@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v2] mm/percpu: clean up callers of pcpu_obj_full_size()
Date: Tue, 20 Oct 2026 19:30:11 -0700
Message-ID: <20261021023011.3199331-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The size of a pcpu allocation can be interpreted in two ways:
1. The size of the allocation attributable to a single CPU.
2. The total size of the allocation across all CPUs, including the
   allocation overhead (for obj_cgroup membership).

In most accounting paths for percpu memory, we need the second
definition (full size). Make this more obvious by coalescing the
callers of pcpu_obj_full_size() and renaming the parameter to full_size
to distinguish between the two definitions above.

No functional changes intended.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
v1 --> v2
- Renamed the function parameter from size to full_size where
  appropriate now that pcpu_obj_full_size(size) is passed in, as
  suggested by Harry Yoo.
- Wordsmithing.

 mm/percpu.c | 63 +++++++++++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/mm/percpu.c b/mm/percpu.c
index d7883507dc151..b22a16980f646 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1611,7 +1611,7 @@ static struct pcpu_chunk *pcpu_chunk_addr_search(void *addr)
 }
 
 #ifdef CONFIG_MEMCG
-static bool pcpu_memcg_pre_alloc_hook(size_t size, gfp_t gfp,
+static bool pcpu_memcg_pre_alloc_hook(size_t full_size, gfp_t gfp,
 				      struct obj_cgroup **objcgp)
 {
 	struct obj_cgroup *objcg;
@@ -1623,7 +1623,7 @@ static bool pcpu_memcg_pre_alloc_hook(size_t size, gfp_t gfp,
 	if (!objcg || obj_cgroup_is_root(objcg))
 		return true;
 
-	if (obj_cgroup_charge(objcg, gfp, pcpu_obj_full_size(size)))
+	if (obj_cgroup_charge(objcg, gfp, full_size))
 		return false;
 
 	*objcgp = objcg;
@@ -1632,7 +1632,7 @@ static bool pcpu_memcg_pre_alloc_hook(size_t size, gfp_t gfp,
 
 static void pcpu_memcg_post_alloc_hook(struct obj_cgroup *objcg,
 				       struct pcpu_chunk *chunk, int off,
-				       size_t size)
+				       size_t full_size)
 {
 	if (!objcg)
 		return;
@@ -1643,14 +1643,15 @@ static void pcpu_memcg_post_alloc_hook(struct obj_cgroup *objcg,
 
 		rcu_read_lock();
 		mod_memcg_state(obj_cgroup_memcg(objcg), MEMCG_PERCPU_B,
-				pcpu_obj_full_size(size));
+				full_size);
 		rcu_read_unlock();
 	} else {
-		obj_cgroup_uncharge(objcg, pcpu_obj_full_size(size));
+		obj_cgroup_uncharge(objcg, full_size);
 	}
 }
 
-static void pcpu_memcg_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
+static void pcpu_memcg_free_hook(struct pcpu_chunk *chunk, int off,
+				 size_t full_size)
 {
 	struct obj_cgroup *objcg;
 
@@ -1662,57 +1663,59 @@ static void pcpu_memcg_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
 		return;
 	chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].cgroup = NULL;
 
-	obj_cgroup_uncharge(objcg, pcpu_obj_full_size(size));
+	obj_cgroup_uncharge(objcg, full_size);
 
 	rcu_read_lock();
-	mod_memcg_state(obj_cgroup_memcg(objcg), MEMCG_PERCPU_B,
-			-pcpu_obj_full_size(size));
+	mod_memcg_state(obj_cgroup_memcg(objcg), MEMCG_PERCPU_B, -full_size);
 	rcu_read_unlock();
 
 	obj_cgroup_put(objcg);
 }
 
 #else /* CONFIG_MEMCG */
-static bool
-pcpu_memcg_pre_alloc_hook(size_t size, gfp_t gfp, struct obj_cgroup **objcgp)
+static bool pcpu_memcg_pre_alloc_hook(size_t full_size, gfp_t gfp,
+				      struct obj_cgroup **objcgp)
 {
 	return true;
 }
 
 static void pcpu_memcg_post_alloc_hook(struct obj_cgroup *objcg,
 				       struct pcpu_chunk *chunk, int off,
-				       size_t size)
+				       size_t full_size)
 {
 }
 
-static void pcpu_memcg_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
+static void pcpu_memcg_free_hook(struct pcpu_chunk *chunk, int off,
+				 size_t full_size)
 {
 }
 #endif /* CONFIG_MEMCG */
 
 #ifdef CONFIG_MEM_ALLOC_PROFILING
 static void pcpu_alloc_tag_alloc_hook(struct pcpu_chunk *chunk, int off,
-				      size_t size)
+				      size_t full_size)
 {
 	if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts)) {
 		alloc_tag_add(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag,
-			      current->alloc_tag, pcpu_obj_full_size(size));
+			      current->alloc_tag, full_size);
 	}
 }
 
-static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
+static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int off,
+				     size_t full_size)
 {
 	if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts))
 		alloc_tag_sub(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag,
-			      pcpu_obj_full_size(size));
+			      full_size);
 }
 #else
 static void pcpu_alloc_tag_alloc_hook(struct pcpu_chunk *chunk, int off,
-				      size_t size)
+				      size_t full_size)
 {
 }
 
-static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
+static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int off,
+				     size_t full_size)
 {
 }
 #endif
@@ -1744,7 +1747,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
 	int slot, off, cpu, ret;
 	unsigned long flags;
 	void __percpu *ptr;
-	size_t bits, bit_align;
+	size_t bits, bit_align, full_size;
 
 	gfp = current_gfp_context(gfp);
 	/*
@@ -1773,6 +1776,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
 	size = ALIGN(size, PCPU_MIN_ALLOC_SIZE);
 	bits = size >> PCPU_MIN_ALLOC_SHIFT;
 	bit_align = align >> PCPU_MIN_ALLOC_SHIFT;
+	full_size = pcpu_obj_full_size(size);
 
 	if (unlikely(!size || size > PCPU_MIN_UNIT_SIZE || align > PAGE_SIZE ||
 		     !is_power_of_2(align))) {
@@ -1781,7 +1785,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
 		return NULL;
 	}
 
-	if (unlikely(!pcpu_memcg_pre_alloc_hook(size, gfp, &objcg)))
+	if (unlikely(!pcpu_memcg_pre_alloc_hook(full_size, gfp, &objcg)))
 		return NULL;
 
 	if (!is_atomic) {
@@ -1793,7 +1797,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
 		if (gfp & __GFP_NOFAIL) {
 			mutex_lock(&pcpu_alloc_mutex);
 		} else if (mutex_lock_killable(&pcpu_alloc_mutex)) {
-			pcpu_memcg_post_alloc_hook(objcg, NULL, 0, size);
+			pcpu_memcg_post_alloc_hook(objcg, NULL, 0, full_size);
 			return NULL;
 		}
 	}
@@ -1903,12 +1907,11 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
 	kmemleak_alloc_percpu(ptr, size, gfp);
 
 	trace_percpu_alloc_percpu(_RET_IP_, reserved, is_atomic, size, align,
-				  chunk->base_addr, off, ptr,
-				  pcpu_obj_full_size(size), gfp);
+				  chunk->base_addr, off, ptr, full_size, gfp);
 
-	pcpu_memcg_post_alloc_hook(objcg, chunk, off, size);
+	pcpu_memcg_post_alloc_hook(objcg, chunk, off, full_size);
 
-	pcpu_alloc_tag_alloc_hook(chunk, off, size);
+	pcpu_alloc_tag_alloc_hook(chunk, off, full_size);
 
 	return ptr;
 
@@ -1938,7 +1941,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
 		mutex_unlock(&pcpu_alloc_mutex);
 	}
 
-	pcpu_memcg_post_alloc_hook(objcg, NULL, 0, size);
+	pcpu_memcg_post_alloc_hook(objcg, NULL, 0, full_size);
 
 	return NULL;
 }
@@ -2242,6 +2245,7 @@ void free_percpu(void __percpu *ptr)
 	struct pcpu_chunk *chunk;
 	unsigned long flags;
 	int size, off;
+	size_t full_size;
 	bool need_balance = false;
 
 	if (!ptr)
@@ -2262,10 +2266,11 @@ void free_percpu(void __percpu *ptr)
 		WARN_ON_ONCE(1);
 		return;
 	}
+	full_size = pcpu_obj_full_size(size);
 
-	pcpu_alloc_tag_free_hook(chunk, off, size);
+	pcpu_alloc_tag_free_hook(chunk, off, full_size);
 
-	pcpu_memcg_free_hook(chunk, off, size);
+	pcpu_memcg_free_hook(chunk, off, full_size);
 
 	/*
 	 * If there are more than one fully free chunks, wake up grim reaper.
-- 
2.53.0-Meta

