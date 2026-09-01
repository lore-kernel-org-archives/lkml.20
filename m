Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458EB49B20C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286883; cv=none; b=Ywm8xruRHjH8ruvr9iOHTai8rOBTFSzw5aRt9n+ChHC89qE5VDvbAr0nxGnW+fRSZaZRBAHRafTvQ/WDJQh3PzaD5ShEOGNISca/C+REWZnIk+kGkkVXSmKOTqGOYdbGECIw3cFGpj5U26DhSVT2z/o8lqcOUzTjQxIG032IMQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286883; c=relaxed/simple;
	bh=nppaxm6G73+ACSreqf6avdv3L9eQf8lUeX0i2OblTts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejD/dnt5Af411Bv8ypRApsz4b+xAiRPV2S9/eOaxtIrlplirOCsuIrtVMcQkvUfrlg1MkbCQdTgJC8QMRf1ROExWaXeaflohYT57OVLTZKMuKEwpr4IbQ3htl2WWW8oBErd32hY/g9gDqd7IwNhQbFlupWZIZ2RRO9L2z/vB1ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFGiMDAX; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFGiMDAX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso147873a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788286882; x=1788891682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zwtKl7Zg7TrJlKVsQMpgHVHuRB/fv/tJD5LyzuV86W4=;
        b=YFGiMDAXkKPfNoGUFHMxFE+o/vua4O4+Uy/cVXbuHfKXNz7+xjThfJt/SB3zH5tpTH
         PikW7jEomTTGFqH+L12qroeUyUM6Av/AwcHyjS6BSB/Y+F6A9rt2uV/VXtBUH49O0tyb
         l47inZL8SHcIMgz6h/fHLB8X2okwWpx0h6ZORZg91hZFDCXC3Pbgvo/3GdV41jDk4QG6
         hf6R5jtexBUFoAek/G6wBLuyJCKvCO11FFxY+ONITf54PzwCnuyBudVGCpWFYaY5xn31
         YzIJ2Lh3yLyxIUapobUmDQFVUK+i1gqs1oFaF/48DzFpgzbalNkPClOWGg0JG8kispmf
         ZFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286882; x=1788891682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwtKl7Zg7TrJlKVsQMpgHVHuRB/fv/tJD5LyzuV86W4=;
        b=dFF/ySpuzgENXrdYNJXYDjxH/vRDbKKiP4wAeOXNTlEFi41iswkP4RORk+Yu1mRMt4
         6cEKWQpciEyf//9Gy8fzCvQds27/wqh38EpUNce7/yKjaqsiYzroaneUcN6FzAyhmb9v
         cpzJvwxcNNZgMHdzxXK/FRT2C7+sdx08pBGiO/aCnEN8XHnOTQRAyftV8e8BeZIhfpvY
         5J3R73KwAP17XVKf6kVYsMLRV+wkN9YAfPZe8xAYXMqqgHta70JPmtMpFAesaEp+YZoZ
         FUnYt4kpVGKna2aundBLEz47sqFZ7UCS4nm2s+iEGcx1wKJXpdamBmHafKwqVDXxk0M1
         js5w==
X-Forwarded-Encrypted: i=1; AKwUvBzfQ3I0hK+3OrdyWyICzUra0OlY/Jlq276w+jy/F1R2P0o4OArWElMFqQA7sodrCro7EIQn2j3tpdzwP50=@vger.kernel.org
X-Gm-Message-State: AFuF++nbYzT2+CyUcXKIm4STEkxXCvkhaGCOcZ/AJEt/Xmc2yrOwNq/n
	hPFDBecVWBnJ0ZWaE+ictyFbJXNGe0RNqusSTEpyKrfGFTJo+qE5NMKa
X-Gm-Gg: AYBFou0AGolnrKcmDSQIrvyMRQaUPpBDkH7xVWS4JRMJ2ygd+QgOYQIpkWyczTT5xMk
	l93Zzy/bINTU9GCmd75tsxpeNeXgjkKNYXrKh/GWdWGTaomLewHebNvqv6odnLveg4bM8YF11S8
	TLkEs5o5jhiFLbu2C5jyF1wmjpG6vlwA4msb2cHuFPoLh47FOApnSOxa/DcPVVIEEde/LxPOEGd
	d+liqF4ZVORDJT/nPFFrqAoBprE2BA4+6c074DjjD+ZDSzAv3D6l+ZLw083ukFJQ44dozTedbJh
	0tWWXARdl2L+ipydv0NUXw2XZh1nFI4bdgWroV+uIfOADGc9J4M5vIgGlOJgTPuEo6v9wZ5uIIY
	5A4QaL62MLQuAaNtqdHZVMBM46MzL5SzNHEnFozKpm8qqPrz8BZGMCL73uFe4Mbd+mrKP7xCuJT
	hbNwFSsmlWED5n/1qseeGYufbwTrUz4KEsB3SRLv2gXcMmMmjejIkMGn+8oExP5QLzhMKe+mnhy
	BmySMpKlKxox+miB3P/aoNb
X-Received: by 2002:a17:90b:1b0d:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39907e0f7ccmr14889557a91.12.1788286881524;
        Tue, 01 Sep 2026 11:21:21 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0f28b19sm946573a91.6.2026.09.01.11.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:21:20 -0700 (PDT)
Date: Wed, 2 Sep 2026 02:21:14 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Ehab Ababneh <ehab.ababneh@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	Yu Zhao <yuzhao@google.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mm/mglru: dynamically protect readahead fault folios
 under refault pressure
Message-ID: <apcVhWzEwkwHYjB1@KASONG-MC4>
References: <20260901180704.168106-1-ehab.ababneh@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901180704.168106-1-ehab.ababneh@intel.com>

On Tue, Sep 01, 2026 at 11:06:43AM +0800, Ehab Ababneh wrote:
> Commit 6cbdd9726fb5 ("mm/mglru: use folio_mark_accessed to replace
> folio_set_active") introduced a regression for workloads that rely on
> readahead to keep sequential file access efficient.
> 
> The problem is that MGLRU can place fault-path file folios in older
> generations, so memory pressure can reclaim readahead folios before the
> workload touches them. In our Cassandra read benchmark, this raised p99
> latency to about 9.2-9.5 ms and cut throughput to roughly 41.8k-43.6k
> op/s; the revert restored the workload to about 5.5-5.6 ms and
> 51.9k-53.1k op/s.
> 
> Readahead is important for sequential I/O and mmap scans, but it should
> not be retained when the workload does not benefit from it. The goal is
> to keep the optimization without keeping readahead pages alive forever.
> 
> This patch provides a middle ground: keep the original behavior by
> default, but temporarily protect fault-path file folios when repeated
> file refaults show that readahead is actually helping.
> 
> The mechanism is dynamic and self-tuning:
> 
> - add a per-lruvec readahead/refault credit
> - accumulate credit on file refaults in the MGLRU refault path
> - consume credit in folio_add_lru() for fault-path file folios
> - keep the folio active while credit is available, and otherwise let the
>   original behavior stand
> - decay/reset the credit as generations advance and when an lruvec is
>   initialized
> 
> This means we only protect fault-path file folios when refault pressure
> shows that the workload is actively benefiting from readahead. If the
> workload does not need that protection, the original optimization
> remains intact and we do not keep readahead pages around unnecessarily.
> 
> Benchmark results for the Cassandra read workload
> (4 nodes, 720s, 100 readers):
> 
> - with commit 6cbdd9726fb5 ("mm/mglru: use folio_mark_accessed to
>   replace folio_set_active"):
>   p99 ~9.2-9.5 ms, throughput ~41.8k-43.6k op/s
> - with revert of commit 6cbdd9726fb5 ("mm/mglru: use folio_mark_accessed to
>   replace folio_set_active"):
>   p99 ~5.5-5.6 ms, throughput ~51.9k-53.1k op/s
> - with this fix: p99 ~5.8 ms, throughput ~51.9k-52.7k op/s

Hello Ehab,

We ran into the same issue on our side too. I hesitated to report or fix
that as I'm working on MGLRU-FG which fixed the problem on my side:

https://lore.kernel.org/linux-mm/20260804-mglru-fg-v1-0-4d8dad39dad6@tencent.com/

I especially mentioned it, see the parts after:
"recent change in lru_gen_folio_seq that bumps new folios with refs == 1"

Latest version still being tested which you can use directly:
https://github.com/ryncsn/linux/commits/b4/mglru-fg-v1.8/

Do you mind have a look of that as well? I think in the long term that is
the right direction. With our test the regression is gone and performance
is even better.

And is there any easy way to reproduce the specific case you are reporting?

> The fix restores the readahead protection lost by the regression while
> preserving the original intent of the optimization: do not keep
> readahead pages around if the workload does not need them.
> 
> Fixes: 6cbdd9726fb5 ("mm/mglru: use folio_mark_accessed to replace folio_set_active")
> Signed-off-by: Ehab Ababneh <ehab.ababneh@intel.com>
> ---
>  include/linux/mmzone.h |  2 ++
>  mm/swap.c              | 82 ++++++++++++++++++++++++++++++++++++++----
>  mm/vmscan.c            |  7 ++++
>  mm/workingset.c        | 18 ++++++++++
>  4 files changed, 102 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index ca2712187147..c998b1e0b8a7 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -578,6 +578,8 @@ struct lru_gen_folio {
>  	/* can be modified without holding the LRU lock */
>  	atomic_long_t evicted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS];
>  	atomic_long_t refaulted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS];
> +	/* credit: file refaults indicate fault-path file folios need protection */
> +	atomic_long_t ra_refaults;
>  	/* whether the multi-gen LRU is enabled */
>  	bool enabled;
>  	/* the memcg generation this lru_gen_folio belongs to */
> diff --git a/mm/swap.c b/mm/swap.c
> index 588f50d8f1a8..a31c9000868a 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -70,6 +70,70 @@ static DEFINE_PER_CPU(struct cpu_fbatches, cpu_fbatches) = {
>  	.lock_irq = INIT_LOCAL_LOCK(lock_irq),
>  };
>  
> +#ifdef CONFIG_LRU_GEN
> +/* Refill two default readahead windows to amortize shared-counter updates. */
> +#define RA_REFAULT_LOCAL_BATCH	(VM_READAHEAD_PAGES * 2)
> +
> +struct ra_credit_cache {
> +	/* Batch shared credit per CPU to avoid a contended atomic RMW per folio. */
> +	/* only compared for identity, never dereferenced */
> +	struct lru_gen_folio *lrugen;
> +	long credit;
> +};
> +
> +static DEFINE_PER_CPU(struct ra_credit_cache, ra_credit_cache);
> +
> +/*
> + * Spend readahead protection credit from a per-CPU bucket, refilled in batches
> + * from the shared per-lruvec counter, so the fault path avoids an atomic RMW on
> + * a contended cacheline for every folio.
> + */
> +static bool lru_gen_take_ra_credit(struct folio *folio)
> +{
> +	struct lru_gen_folio *lrugen;
> +	long nr_pages = folio_nr_pages(folio);
> +	struct ra_credit_cache *cache;
> +	bool taken = false;
> +	long old, new;
> +
> +	rcu_read_lock();
> +	lrugen = &folio_lruvec(folio)->lrugen;
> +	cache = get_cpu_ptr(&ra_credit_cache);
> +
> +	/* credit cached for a different lruvec is forfeited, bounded by the batch */
> +	if (cache->lrugen != lrugen) {
> +		cache->lrugen = lrugen;
> +		cache->credit = 0;
> +	}
> +
> +	if (cache->credit < nr_pages) {
> +		old = atomic_long_read(&lrugen->ra_refaults);
> +		while (old > 0) {
> +			new = old - min_t(long, old, RA_REFAULT_LOCAL_BATCH);
> +			if (atomic_long_try_cmpxchg(&lrugen->ra_refaults, &old, new)) {
> +				cache->credit += old - new;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (cache->credit >= nr_pages) {
> +		cache->credit -= nr_pages;
> +		taken = true;
> +	}
> +
> +	put_cpu_ptr(&ra_credit_cache);
> +	rcu_read_unlock();
> +
> +	return taken;
> +}
> +#else
> +static bool lru_gen_take_ra_credit(struct folio *folio)
> +{
> +	return false;
> +}
> +#endif /* CONFIG_LRU_GEN */
> +

Just an idea. For an short term and easy fix, what if we simply revert
than, then only protect in_fault && folio_test_swapbacked folios with
PG_active?
