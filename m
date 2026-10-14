Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E99555D873
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996233; cv=none; b=dI++CV2PFkFxm9nXYUalYlfewqnQNSph2m9i/WhpaLA9axNjvNxsL6JeSKLEIwRMbs+34iYefmTulz4wbzOebKv3DzXuFwCI6oV3f5uJNEePQOXCoHUPK0QiyoMeU1s3dhr62HsHIojedVtFzoMlcFeeIu3HsrGhtHRhKgUuL64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996233; c=relaxed/simple;
	bh=PTWK2O3Q7LSGSTcECoF3nygtNDxXEAmygRPcMvAnDIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DU7vSaaDYqjzwKd56RWtiwbYEwT5gqK5+zYW1JbDruGImhTKRtUnNpvsYKk6k33Zg0dvNAstqA59L9Y8P01yVhyU5ikDB4p28LRKno4XOnD4iGehIgQXFhxeLFxnQoL8ROdhk16/zdrH6mse+U3dfAPf8lPI4P8MTovKVWN/pCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToIrwu4G; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToIrwu4G"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4a69499cefaso1691588fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996231; x=1792601031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMpqIpjk0oH8Hp+oTEjeUG/Kp3ExxsukdF4YXrCzIVQ=;
        b=ToIrwu4GZXH57VU9mglLBedQP4woYN+tPxHBdw5XYlUBiDNQY4jcZcIODdbZSjTjEx
         VuHIrRetwHk0qmIr1Db1akb1u1bQlIsZmBjb1srGSrxmrCrrFdOvEmgRe2T5pIi0zFgj
         R6Cetims8oIxBRwtBBWmI5uMt46benylZY4S4gUt+lkgPQ7ZAMJUctgfRFJjrM05AIBF
         OKo2W0wPNsuou8cO+aC3vjQ2gP0Un76QDaLIS3aB6KiOoWoIgSZojXzXkY2WWvimZg3L
         GA3JOdwNFScdgwuvX0rrs2eBynUB1AgpCAXbZZtI9YdsNLQzWS0LwUa8cIpsDDENq1oS
         pWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996231; x=1792601031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tMpqIpjk0oH8Hp+oTEjeUG/Kp3ExxsukdF4YXrCzIVQ=;
        b=n+LJ51xKltb0wrwon2W/DmEasF75DVC3Eg6vcrmHo/UVeUJ+d3RCkUYBdzerLAWFKN
         SuDaHJruflick+vqa5yF+fut8d13yYr/bPO1G7+QyioVcrk/PQ6/fwxBqQUNqKvqY9MV
         rY0Ex9+5hxpxrlCWEad3ZtKGcDZagzfQosyQOaxOObwYsluFr1VWqO77SBkDkXz5IkR+
         puOx6+MBy7GTogo8p8P6NPF4kfkJHHmV2VGzZgTAfXRBV9kuCPdRUIehUBJDgvkCtOrF
         snA3eQ8woQbdePdnwtMdKzavhxUR+/fhjI6e2yLmvPXZ0Bxe3XsjDZOVbFkuhJFKOX3A
         XrnQ==
X-Forwarded-Encrypted: i=1; AKwUvByaBGPaOgQdzRH4k7lwZpL0oe5jj+OEA43AVYgNWguCbY47w+ZY62aBXo6FVgxWDN73EKcYlTeeTPoLpIw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/dq/1XeKnfRvKP0TAZ8OiGRQ4VCuyzdGVMKApIronv/5erTXt
	ZN/QkkDcjSFLQO4IR+l03k3CD2DOKM1fUzNfndseSYLEbQYIwmrF3u0C
X-Gm-Gg: AYBFou1hqfsrdJ/gshuqe0HAQHA3M4y0AwphzBVp8ovjDOTXfx//+ZTSoW9vk1+ctQz
	Of5pNgyEMe8mxjTCA6yM0j201dwm0D5s6VbeOB9ChbGDdHOu1SHBywRK5OeW9SoaflTrKpxZTUH
	eokFQ4g59pvNp/LxdkIdVVFnNTPnpCiKGIdNiLUsoIyUSboxBcqCdDpS7w9erdKAGqGM/1Vg+Qt
	KTQxY8NcD4Nx5HwkGhqxKvuft6vY6ydaxJcEsuX2kgI9czlMK8BJaAtnc1BmL1oyyo44Eo00G0N
	gG/YaD442og+0eaQx1YYSNY/WFqh1EoV8cSXx2Ooib7LiwP059FbvYqre/2p69HrQteODA682ow
	9WufD6es/l9Cc5FwtOirPJvzO3KWU1UQTsl6FzOvMs+eOt7aKiAswGa6jHC55Ya+qYH9PQmamTX
	30jcMQngHzN3gubQ4+j6aSIoMq9eWs+mCVVGECY3u2OoHuwvMCqnnGruhrH9n7/9WwNa7D+UmNs
	GZM1aof9DzHex3GTfK7wPJ7h+0q
X-Received: by 2002:a05:6870:d14f:b0:48f:e0f6:bfef with SMTP id 586e51a60fabf-4a2a8b0ce81mr11201261fac.27.1791996231164;
        Wed, 14 Oct 2026 09:43:51 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:6::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfcabc34sm2256325fac.15.2026.10.14.09.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:43:50 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "Harry Yoo (Meta)" <harry@kernel.org>
Cc: Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Hao Ge <hao.ge@linux.dev>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/percpu: account full object size for percpu memory allocations
Date: Wed, 14 Oct 2026 09:43:48 -0700
Message-ID: <20261014164349.2332145-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013-fix-alloc-percpu-accounting-v1-1-03e788a1e41f@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 13 Oct 2026 20:34:39 +0100 "Harry Yoo (Meta)" <harry@kernel.org> wrote:

> When memory allocation profiling is enabled, the pages backing percpu
> memory chunks are attributed to func:pcpu_alloc_pages. However, the
> accounting of individual percpu memory allocations via alloc_percpu()
> and friends record only the size of a single object rather than its
> full size across all CPUs.
> 
> As a result, it is often not straightforward to identify which kernel
> code is actually responsible for percpu memory, because the size is
> under-accounted by a factor of num_possible_cpus().
> 
> Account full object size with pcpu_obj_full_size(size) instead, which
> multiplies the object size by num_possible_cpus() and adds the objcg
> pointer overhead. This is consistent with what memcg already does for
> charging percpu allocations.

Hi Harry,

This looks quite good to me. Thanks for finding this!
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Some comments below that shouldn't be blocking:

> Verified with 64-CPU VM by spawning 400 processes in a memory cgroup and
> measuring mm_init()'s rss_stat counters.
> 
> Delta of kernel/fork.c:1142 func:mm_init in /proc/allocinfo:
> 
>                   bytes   calls   per allocation
>     unpatched      6320     395         16
>     patched      418176     396       1056
> 
> 'percpu' field in memory.stat: 422400 (1056 bytes per process)
> 
> Memory allocation profiling now accounts the same amount of memory as
> what memcg charges.
> 
> Cc: stable@vger.kernel.org
> Fixes: 60fa4a9e2323 ("mm: percpu: add codetag reference into pcpuobj_ext")
> Assisted-by: LLM # Verification
> Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
> ---
>  mm/percpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/percpu.c b/mm/percpu.c
> index 3eff382e565a..d7883507dc15 100644
> --- a/mm/percpu.c
> +++ b/mm/percpu.c
> @@ -1696,14 +1696,15 @@ static void pcpu_alloc_tag_alloc_hook(struct pcpu_chunk *chunk, int off,
>  {
>  	if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts)) {
>  		alloc_tag_add(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag,
> -			      current->alloc_tag, size);
> +			      current->alloc_tag, pcpu_obj_full_size(size));
>  	}
>  }

So @size by itself isn't used, so I was looking to see if we could just
pass pcpu_obj_full_size(size) to the function instead. Looking at the
call site, pcpu_memcg_post_alloc_hook() also has the same oddity where
pcpu_obj_full_size(size) is used for all calcualtions.

So I'm wondering if we can send a follow up to just unify all of these
and pass pcpu_obj_full_size(size) where the caller never uses @size
by itself, I think it would also help in demonstrating the intent to
account the full size. Same idea for the free hook below as well,
paired with pcpu_memcg_free_hook().

Happy to follow up on that myself too : -)

Anyways, the change looks good. Just wanted to bring this up as a
follow-up cleanup patch.

Have a great day Harry!

>  static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
>  {
>  	if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts))
> -		alloc_tag_sub(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag, size);
> +		alloc_tag_sub(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag,
> +			      pcpu_obj_full_size(size));
>  }
>  #else
>  static void pcpu_alloc_tag_alloc_hook(struct pcpu_chunk *chunk, int off,
> 
> ---
> base-commit: 0e199ae6e803e76ebf128e009d336e5917221e63
> change-id: 20261013-fix-alloc-percpu-accounting-48bf24919caf
> 
> Best regards,
> --  
> Cheers,
> Harry / Hyeonggon
