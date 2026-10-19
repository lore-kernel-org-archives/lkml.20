Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427285;
	b=SfALV81BgTaENwzBBQUcoI/8DupWYTjON5/k8ErsEqq0SMxwEZ+4cD9OamkNSseifH+D
	 rE2umsmU6X/nDylMEolcvUQ6Vmy03F03lEDqQCLEN8ARe0sp2uw/dW9hdTt9GhjEn5WlQ
	 +HgUNmpLxdq9J88G1kEq3rqhuaLGh/td0lUt/ssK/ov5Gv/YcEM6OQ78TIjr7vfyC1pFm
	 OHhQBQwbtw/QFfDAVsdZAED4B0JzXlhkFiyDPc04DTeUZusWsPYBmYiffrt9QJ8as+W1U
	 foaLCv0wA2kfxFySuXRF86lFl1a5L1O6AQkumD0KDbZMTarnguqdb3nud8VUHOwUzbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MPCaT6OOOqUW7TTHp3t+eRxmMncThW2Jrb7agn7Vd5c=;
	b=UmjiTKipa5zozwd61e0Ofw7B1fK/80QkNqrF/2T4/bAI8hwVf2CNHVnxsnRI8fR+YZfp
	 jvvNAI98tRaBTWbDfGyhSi27mFVdDQD+NG8cdyKd+RSeDFILy3eU/YYcH9PmjL+YQprlJ
	 /sX2Srrvahd8JrYlx9RfLHIqr40VtUfYB+RdvQPo4jf3Hz8LmNocfZudTYa+XuoFu7FN8
	 W8sshsTcesccMZpwCAUhX9+gxun4McYfnuFHWkcgwcw7wGRGoBE7rF29yek1H6TanpPZF
	 pZVLgaWoLc/5GGUdVuHh4FlN+KUpUeSprZUhOl0QwFYnfdY+kidxckOAPXNQugEmclw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXrJcCcm;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478D1606AAF0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 478D1606AAF0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXrJcCcm
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6d7e06dbcccso1454278eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792427284; x=1793032084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MPCaT6OOOqUW7TTHp3t+eRxmMncThW2Jrb7agn7Vd5c=;
        b=jXrJcCcmfFkxiK6oKu/AGu+KLGqH999drbfxqKfQ6foU5qyR4IbbzQiCb6aXlmEV0J
         m4kFRtpNZu7jbyegn5zZRgdv626naB0Qt53b2AJapUCcdMIs8oHaXasw/XF3LAtHEdr0
         Wy1VmnJkFNqEA6XB+MyMjai2hD/WJgNQU5NziaJwHJmUq9VKBfB22GPZ0sY2SgXM5dxZ
         PBLeW/azKrMJ86Jh9E/oNFVLDHqWy8C7I1bxOHw0LEaC53IrBF58LPsPt8BlznyZ9MLJ
         rdgh5S8zERjA6I14AYdkplWLf9uCRjQbITXF3fhdXuaJsZN6VBVcvuW/Ckmq1NoP+6AS
         tRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427284; x=1793032084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPCaT6OOOqUW7TTHp3t+eRxmMncThW2Jrb7agn7Vd5c=;
        b=CckEhD4GDvQIcjY0icAPaYMxXgDSVHYVit9QWTuhIDIENC8rlLivNrryRFEO2Di804
         Ig0LMur3WTHefYvaJR+Yx6cv7pCrf6SwADWwNPV0fkI5YCWil1tSpjJRRi8ecCzbm6Qd
         3jm8HOapC4LUVqthYg2AuzC+B040XMPxL3WcS7UJ2TQw6gZsikW5yCJ8PoyYe0sAJpR8
         Hl2fC8j3XItC/YZZtGCM21DVE6twieKDgwhorejMki/NgqfCc2cgXr8fZfeQXzyeeXLo
         ISM/3M+HOeM/SQ4AUI1Aw2wCcyVgbCf7IgixBT5ZHeaNrBxOYrAFH1PH+MSriL6IXpQn
         a7Jw==
X-Forwarded-Encrypted: i=1; AKwUvBxBuQtQz2+BuxFWEMXLp1cktB2lEoQGz/xoC+60TIeYJrWOJk94FrPGpfxoQ/LMcfsjzhEf0koawwERKxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKl6ODMbns2UlBNZLySagIiuJP3HK3WUjv4Q+ryARCNGMbgVrsS
	IP8mrRT6UnKQPZ96QejbRnKyYG0qsSMLgPzTPPbb9bu+uyLkETGRYxrr
X-Gm-Gg: AYBFou2ou+YIfiSp1m1SSF25yLRAYhqdNGyPhpLEkPtrX6H7sYq7CBU0SnvxNe1q15V
	L7ZL5OuB/rS7mjgQHo/q+Yw/HCramiUF6D2T3QIRoEO2vUVC4zS05eWFj/rLlGj9jsbO7y2jaCp
	TcqV7zxTrE0n82fBDyEfcOoQqicjvp5phE2BPIEh+YFTr+9pObVCMy7BDUEWEuzaVGXV0r54ET7
	tjWDvPmxHIXewMgdprFnb2xXr9yCkGXLusMcSaQLFHjEoEmC4/H7ZL9FPaQZn8W4X8Sf7sAAwJk
	rfufmPX+8HO6i205AeXr99pxSxwKEoQ4Wen4GzAIjJHIEZbn0+/JMPHcLY1h6sVYWbq+vELEVV1
	bGzhz/juFuEPYyp65zYDaiWBBPXYTCj9rxfwe3BMl7++GncVyZyJzlUvG2C8ALkIXxFWNBReSb1
	LDLcDH0IVHkoEqezU07jS8g87EGZa2o2E5si+qgkkGhC9d/URmnn4BfzWnEyOXVA5nH4C19AQKs
	Fwt8+X0YwPrKBKsAm2iQuQvUw==
X-Received: by 2002:a05:6820:560b:b0:6c9:80d8:a201 with SMTP id 006d021491bc7-70357496035mr3645829eaf.62.1792427284118;
        Mon, 19 Oct 2026 09:28:04 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-849859184easm2998661a34.23.2026.10.19.09.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:28:03 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Harry Yoo <harry@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] mm/percpu: clean up callers of pcpu_obj_full_size()
Date: Mon, 19 Oct 2026 09:28:02 -0700
Message-ID: <20261019162803.281810-1-joshua.hahnjy@gmail.com>
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
definition (total size). Make this more obvious by coalescing the
callers of pcpu_obj_full_size().

No functional changes intended.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/percpu.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/mm/percpu.c b/mm/percpu.c
index d7883507dc151..76848e096caee 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1623,7 +1623,7 @@ static bool pcpu_memcg_pre_alloc_hook(size_t size, gfp_t gfp,
 	if (!objcg || obj_cgroup_is_root(objcg))
 		return true;
 
-	if (obj_cgroup_charge(objcg, gfp, pcpu_obj_full_size(size)))
+	if (obj_cgroup_charge(objcg, gfp, size))
 		return false;
 
 	*objcgp = objcg;
@@ -1642,11 +1642,10 @@ static void pcpu_memcg_post_alloc_hook(struct obj_cgroup *objcg,
 		chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].cgroup = objcg;
 
 		rcu_read_lock();
-		mod_memcg_state(obj_cgroup_memcg(objcg), MEMCG_PERCPU_B,
-				pcpu_obj_full_size(size));
+		mod_memcg_state(obj_cgroup_memcg(objcg), MEMCG_PERCPU_B, size);
 		rcu_read_unlock();
 	} else {
-		obj_cgroup_uncharge(objcg, pcpu_obj_full_size(size));
+		obj_cgroup_uncharge(objcg, size);
 	}
 }
 
@@ -1662,11 +1661,10 @@ static void pcpu_memcg_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
 		return;
 	chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].cgroup = NULL;
 
-	obj_cgroup_uncharge(objcg, pcpu_obj_full_size(size));
+	obj_cgroup_uncharge(objcg, size);
 
 	rcu_read_lock();
-	mod_memcg_state(obj_cgroup_memcg(objcg), MEMCG_PERCPU_B,
-			-pcpu_obj_full_size(size));
+	mod_memcg_state(obj_cgroup_memcg(objcg), MEMCG_PERCPU_B, -size);
 	rcu_read_unlock();
 
 	obj_cgroup_put(objcg);
@@ -1696,15 +1694,14 @@ static void pcpu_alloc_tag_alloc_hook(struct pcpu_chunk *chunk, int off,
 {
 	if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts)) {
 		alloc_tag_add(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag,
-			      current->alloc_tag, pcpu_obj_full_size(size));
+			      current->alloc_tag, size);
 	}
 }
 
 static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
 {
 	if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts))
-		alloc_tag_sub(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag,
-			      pcpu_obj_full_size(size));
+		alloc_tag_sub(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag, size);
 }
 #else
 static void pcpu_alloc_tag_alloc_hook(struct pcpu_chunk *chunk, int off,
@@ -1744,7 +1741,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
 	int slot, off, cpu, ret;
 	unsigned long flags;
 	void __percpu *ptr;
-	size_t bits, bit_align;
+	size_t bits, bit_align, full_size;
 
 	gfp = current_gfp_context(gfp);
 	/*
@@ -1773,6 +1770,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
 	size = ALIGN(size, PCPU_MIN_ALLOC_SIZE);
 	bits = size >> PCPU_MIN_ALLOC_SHIFT;
 	bit_align = align >> PCPU_MIN_ALLOC_SHIFT;
+	full_size = pcpu_obj_full_size(size);
 
 	if (unlikely(!size || size > PCPU_MIN_UNIT_SIZE || align > PAGE_SIZE ||
 		     !is_power_of_2(align))) {
@@ -1781,7 +1779,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
 		return NULL;
 	}
 
-	if (unlikely(!pcpu_memcg_pre_alloc_hook(size, gfp, &objcg)))
+	if (unlikely(!pcpu_memcg_pre_alloc_hook(full_size, gfp, &objcg)))
 		return NULL;
 
 	if (!is_atomic) {
@@ -1793,7 +1791,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
 		if (gfp & __GFP_NOFAIL) {
 			mutex_lock(&pcpu_alloc_mutex);
 		} else if (mutex_lock_killable(&pcpu_alloc_mutex)) {
-			pcpu_memcg_post_alloc_hook(objcg, NULL, 0, size);
+			pcpu_memcg_post_alloc_hook(objcg, NULL, 0, full_size);
 			return NULL;
 		}
 	}
@@ -1903,12 +1901,11 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
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
 
@@ -1938,7 +1935,7 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
 		mutex_unlock(&pcpu_alloc_mutex);
 	}
 
-	pcpu_memcg_post_alloc_hook(objcg, NULL, 0, size);
+	pcpu_memcg_post_alloc_hook(objcg, NULL, 0, full_size);
 
 	return NULL;
 }
@@ -2242,6 +2239,7 @@ void free_percpu(void __percpu *ptr)
 	struct pcpu_chunk *chunk;
 	unsigned long flags;
 	int size, off;
+	size_t full_size;
 	bool need_balance = false;
 
 	if (!ptr)
@@ -2262,10 +2260,11 @@ void free_percpu(void __percpu *ptr)
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

base-commit: 2887e63d2e8e0cf55402612d8996ce955a2c3e55
-- 
2.53.0-Meta

