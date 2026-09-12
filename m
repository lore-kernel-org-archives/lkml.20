Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE3F348C6E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789225170; cv=none; b=E8q5JDNtqbp/DxrVFo0dhbrJCyd+h6MRQDAQA+H7ZvQrPwyqg1vfAiCKs5j6IPjNy0DhpXxQ7iDafY6zOdcph3MziC9+5N1RX7fkZ2wrzmAP/cJ4AX80ZFIR3+S3N8h+9b5qiMowhTe3/Ilq/EQjjKqXlg+g+WDpY8GJM5LvPNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789225170; c=relaxed/simple;
	bh=Um2SLWGFQ309ggQXSjB/9VtiQD2g+1hMiPAQ4LtCX0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tH+Oxlouv6e74C+WrV64TgUHpDcz7VQqybE8cwwhMUhgL0XlC6tClV+jS/dPCAZlUGOGDVgJXLamJM77lzY+EKswHtn6ab1seouDCI8NSVPPJBaK/xZzvusQJO7dQn5OqIDr7i+ccDiKz/Rp3u0tzF4caBD/G62bd5er+VlnIAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Qy+woBp5; arc=none smtp.client-ip=209.85.219.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Qy+woBp5"
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-9120eda2195so20628156d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789225167; x=1789829967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSH+PXY7tNw2pFxhes4voQUOqmS+asUClkbTsJy7w5o=;
        b=Qy+woBp5TSUZNMsoiQw+sHuSE0o7X4O9EIfrke9FI37GwRtHlxhM006iexohwM9Ak1
         bzT+hJazVRno4dgRT5iLL1qQIU5G1f9BbjCrbimhzuRTucyEe3l2t6vqplszXYvpJ9uS
         8LqmDqKv1im89pz53ZUgKHl57qyaS98t+d3gD9c9jCSFlanXBIwVtI5TEyNhp7N7KERb
         kuDvSmy3Medcw0POZ8IuWeA09y+oWEA3HE6WIvIdunx2PMg/GA8KaearKD+O/BHpl1zI
         WJ+PEfpZrs56LZItYxIINRGuV6IpqLs4agge5IcyppK8aVY1KrIPOOhX+X3qE3CkkH+/
         +I/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789225167; x=1789829967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSH+PXY7tNw2pFxhes4voQUOqmS+asUClkbTsJy7w5o=;
        b=nOccsA2/8IJvsFbCCxfPn90n3yIiOp9wmke4mwM/DZntuzPwK6UUTobfM0IrefMqTz
         tyQP+mZVPPtHZYXP48YI6jyp0rGKCFpL9/DC9Qy/6YaOng2kkDAIZQZ3wdfn9R5V7iOZ
         D6e2eOneGi7AikuyhJVZlOjKgiXHDa5nMAp3R+soVCsqH2JNPYZlsKVeu/thxSF2KpSH
         24O/DaXCcgY3AF5boGS7VL65rc78winmiSLZvTWI5+LsoUkXDOFPTYqks3FLnFAgQXQ0
         Q3XgC/Snj0UOgg3ukSxPPpzydeML5kmweuyXaBIN/2v3gHM0pn832TZEwEB6Qq1k0TKo
         sL6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwZx6T48BMKX4Rwybp+ZeFB1Cr7mX5mltUShhIV7GiCcCPn4a9+49bzlH7zAFFMGY2Ns/ig1itcHBRWMs0=@vger.kernel.org
X-Gm-Message-State: AFuF++kkiWTb6RfORKrIJKxPZ2Q4BREHCKQ+ZHIz460vXxBf1IMy3K5m
	6JOUTIEsDQo4pDdByvUoMqCMp2NtCMS986Nnfn+6QaTvmTIWBggO6b5dun8yLMtEf4XpeTPKri0
	RvWzgrSG9x65T6e0s1A68lr7QXYalvI8XnE/r
X-Gm-Gg: AYBFou16HfL5oDKCnbmwJ8lykXhLlVjZvRuVFqKj/OV0iYEHMGzoUnQBFCFtDRo2XQM
	LdYH9O1HJplp4O3sV5jVoDgHfdhkCfjZ//7vtcHADzQwk0lVALUGY8ofroW6+NeozXhizNABkhd
	Eo/mdfi/svRDVJBr3vicf2do2xsoNw9Xh8yAkQzqtA5bNt5x9DTkdH8LKQadHC3AQBxlE+LMBFc
	Jxd6+GCqCfEqFzj8cySVMI6E99mVofZriZdki7d5R63HuTh4ESeykXXsM2sTtLPVGw7TV7EL/91
	ZIdECC1jGa83w3M5mBYSyhZr4VhnUxUfduNhcmAjx7D9DshSAXaey7l2QjiT+huHpOftTfi9zXL
	yXppELf/nl6JPn6OEyCv9bdOKcj/rFg2M1GH8+Q==
X-Received: by 2002:a05:620a:404a:b0:939:a45:8c96 with SMTP id af79cd13be357-939d7eb5ef0mr1680637085a.19.1789225167413;
        Sat, 12 Sep 2026 07:59:27 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.128])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-939e824312csm47711185a.4.2026.09.12.07.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:59:27 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 619E73406B3;
	Sat, 12 Sep 2026 07:59:26 -0700 (PDT)
From: tmenninger@purestorage.com
To: Chuck Lever <cel@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Badger <ebadger@everpuredata.com>,
	Jon Curley <jcurley@everpuredata.com>
Subject: Re: [PATCH RFC 6/8] SUNRPC: Reduce rpciod workqueue contention
Date: Sat, 12 Sep 2026 14:59:26 +0000
Message-Id: <20260912145926.208269-1-tmenninger@purestorage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <48e8b6c6-dc62-4630-b7c9-19cdcc5cbf11@slotpi15m67>
References: <48e8b6c6-dc62-4630-b7c9-19cdcc5cbf11@slotpi15m67>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the delay, I've been without internet.

> 1. Check that sheaves are actually on for that cache:
>
>       cat /sys/kernel/slab/nfs_page/sheaf_capacity
>
>    A zero means your kernel predates sheaves or the cache has debug
>    flags, and the contention is the older remote-free slab
>    transition path. That is a different report.

    root@irp309-h02:/sys/kernel/slab/nfs_page# cat sheaf_capacity
    60

> 2. Build with CONFIG_SLUB_STATS=y and sample these before and after
>    a 10-second all-local window:
>
>    ```
>    cd /sys/kernel/slab/nfs_page
>    grep . free_fastpath free_slowpath sheaf_flush barn_put \
>        barn_put_fail barn_get barn_get_fail alloc_slowpath
>    ```
>
>    If barn_put_fail and sheaf_flush track the contention count, the
>    barn limit is the bottleneck. If free_slowpath dominates and the
>    sheaf counters are quiet, the frees are bypassing sheaves
>    entirely and my analysis is wrong.

10-second deltas:

    free_fastpath:    +49,161,373
    free_slowpath:    +70,391,872
    sheaf_flush:       +1,582,440
    barn_put:            +673,877
    barn_put_fail:        +26,374
    barn_get:            +673,860
    barn_get_fail:     +1,199,576
    alloc_slowpath:             0

> 3. Run perf lock contention with -l on the same window so the lock
>    shows up by address, and note whether the callers under
>    list_lock are sheaf_flush_unused / __kmem_cache_free_bulk or
>    direct __slab_free from kmem_cache_free.

    contended       total wait     avg wait      address
    3,346,091       5.05 min       90.48 us      ff1db88b8f578b80

Filtering the perf lock data to that address gives:

    2,845,710   __slab_free+0x126
      318,458   get_partial_node_bulk+0x9c
      181,842   __refill_objects_node+0x4d0
           71   alloc_from_new_slab+0x183
           10   __slab_free+0x126

The next most contended lock had only 23 contentions.

So about 85% of the contention on the dominant lock is coming directly
from __slab_free. I don't see sheaf_flush_unused or
__kmem_cache_free_bulk among the callers. get_partial_node_bulk is
about 9.5% and __refill_objects_node about 5.4%.

That seems to put this much more firmly in the direct
kmem_cache_free -> __slab_free case you mentioned rather than a barn
limit / sheaf flush bottleneck.

> 4. Tell me the I/O pattern: direct reads, I assume, but the I/O
>    size, number of threads, and how they are spread across the two
>    nodes. I would like to attempt to reproduce the
>    alloc-here-free-there imbalance rather than speculate.

Yes, direct reads. The workload is:

    elbencho \
        --iter 1 \
        --threads 160 \
        --files 16 \
        --size 512G \
        --block 1m \
        --dropcache \
        --iodepth 64 \
        --direct \
        --read \
        --lat \
        --latpercent \
        --log 1 \
        <16 files>

I'm not pinning the elbencho threads to CPUs or NUMA nodes. I just waited
for a run where all of the CQs landed on node 0.
