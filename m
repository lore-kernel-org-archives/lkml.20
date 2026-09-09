Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2AE4915A5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947782; cv=none; b=XgheV269S8Mqb5m7AMAlEn3LMoJsPdRVLeeH/5evvTMPWq0JiWeDpL+n7lzpqNRKYxFLfq4rRU9DDaRXcyBPIBwjRkNSY3BTh1wKWGR72fsS1WlbggKL4W+ajzngYqo9FfkATd75CspC08S5at5FuBtOziaQJJ429kxZNOhciag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947782; c=relaxed/simple;
	bh=uf8D5m9HYTaZrc7d93WoJxgkkkji+vGtS3KIVwcx3cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYSp2cGaztLD8cO9tUGvGg7kcpOPrTRkq7bS3D4xZnn3OUQzjLv96CoF56tx/HzXJ9lJI+OF4Y9S1StCuOJxqkAHIyaZyJ+vj3pXuXW/m1f24jZG1pwKhmoaJzq/msjDKBmlfT5s5HUkvIoZsRmXBIeEWFQMAyw0b3B9e9yG33g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNEgf5mw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNEgf5mw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CBA1F00A3D;
	Wed,  9 Sep 2026 09:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788947780;
	bh=ByKpa3vC0eC5ZuBtQYhI31h+rDqEMFcUW70pnZTcQhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KNEgf5mwgM8CxhI5IANttxJV2blzsgGI6l5uqybUi5NYt6gaDzOWGl2Dg9RMMLgE5
	 fytqZ2nxAvUTdgQuLelPTbAZgc1XjHLNVTQ7pO1JuizKM/dc6XC+t1ev0Bcy1eQ63M
	 5IG4lis2yjJMRvwt1T0h8Dc2i12Y6VN8i8tvb5yi8diRdsf1gXGBHHTG4NPt2N0DpL
	 POnHVDw2Mh620IUZOfsLcmFKY0/9+Z1Y3ghPiBj+VSXeewELZvZYmbgd1ituFFParz
	 v+3CpC7sKI7vbMqle+Xq1s6dPpMnYsPe3uL54chp2Uyt78nzn6+e0pO8aLgSzzy+n2
	 lnVRnnXJsG9yw==
Message-ID: <a2016390-28ce-4199-a063-d2e9101dacab@kernel.org>
Date: Wed, 9 Sep 2026 11:56:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/17] mm/sparse: initialize memory sections earlier
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>
Cc: Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
 David Laight <david.laight.linux@gmail.com>,
 "Liam R . Howlett" <liam@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Muchun Song <muchun.song@linux.dev>
References: <20260825084608.47437-1-songmuchun@bytedance.com>
 <20260825084608.47437-10-songmuchun@bytedance.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260825084608.47437-10-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/25/26 10:46, Muchun Song wrote:
> Upcoming HugeTLB bootmem changes need sparsemem section metadata before
> the HugeTLB bootmem allocation path runs. The memory sections are
> initialized from sparse_init(), which is called too late for that setup.
> 
> Move the code that initializes sparsemem section metadata for memblock
> ranges into mm_core_init_early(), before free_area_init() and the HugeTLB
> bootmem setup. Rename the helper to sparse_sections_init() so the new
> caller describes the sparsemem-specific initialization step.
> 
> This is a preparatory change.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
> v5:
> - Collect Reviewed-by from Mike Rapoport
> 
> v2:
> - Rename the helper to sparse_sections_init() to describe the section
>   metadata initialization (suggested by Mike Rapoport)
> - Fix the !SPARSEMEM stub name so SPARSEMEM=n builds compile
>   (reported by Sashiko)
> ---
>  mm/mm_init.c |  1 +
>  mm/sparse.c  | 10 ++--------
>  mm/sparse.h  |  2 ++
>  3 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 0317fb781e77..e2a16d833635 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -2642,6 +2642,7 @@ void __init mm_core_init_early(void)
>  {
>  	kho_memory_init_early();
>  
> +	sparse_sections_init();
>  	free_area_init();
>  
>  	hugetlb_cma_reserve();
> diff --git a/mm/sparse.c b/mm/sparse.c
> index e6cb67ca9c8d..439802e6a6ad 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -191,12 +191,8 @@ static void __init memory_present(int nid, unsigned long start, unsigned long en
>  	}
>  }
>  
> -/*
> - * Mark all memblocks as present using memory_present().
> - * This is a convenience function that is useful to mark all of the systems
> - * memory as present during initialization.
> - */
> -static void __init memblocks_present(void)
> +/* Initialize memory section metadata for all system memory. */

I'd drop this comment, it's not entirely accurate. A lot more initialization of
the sections happens later.

What this function mostly does is

(a) Allocate sparse-exteme metadata
(b) Temporarily store the nid and mark the section for being present and online

I have patches to get rid of __section_mark_present() and just set them all to
SECTION_IS_EARLY|SECTION_IS_ONLINE such that we can just iterate early sections
and get rid of that PRESENT monstrosity.

Apart from that LGTM, even though I don't particularly enjoy splitting us now
having two init entry points

sparse_init

and

sparse_sections_init


Where it's rather unclear from the name what is actually happening.

-- 
Cheers,

David
