Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708521;
	b=RZzkRXBL8ftF+rQtJBR5Zv6n9y9bsKoOP4eYFqzvZlNG/QHcgYH387j0njuill7R91BK
	 3yduIpxeXeB65fDkvX2gmj47ZV50ko/IVDTMpHfbxCMBsVdw6mIDzNmJ4M0nqSZSKrUQh
	 q4Md8dN6bkRwQgY8nHXOip5YlM/ucaQaLQj3xuYqgSmrouFsy3WtWNAxvkq+i0bAywaJJ
	 TkDYKnnttoet2/+VYncF3Q0MeEQ1WuyYYjsnNCabVibXl2QBJZQ6TbymndYEx6DDpcDvI
	 C3f6kDdksUp9WKLFGG5BHHVd9SOR+WDtMrmHeiZdVtMFeNduGwETLvnTqSYFiZicnng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DOzzqdK9OoTPF7w8+dGv8CzGaoXQjJup2f2zEoi38v8=;
	b=UuREeNu6mFD6ABu5M/+WnXOuhWy3JPC5ObpK9x+lrANkz1klHiTNcoUH9xhQnCyrqEyC
	 MWmWktged1lNubZzc3lGxdVDoRScFnQr4S7L1eltaCBYHJ5NqzO7OP8VHYobkhexildu1
	 VSntc0TampNzNk0ifR6eWiA1cUc3ErjV8Fx+yxv36vbSywett4gtZlFkDEqsi/+aITkBu
	 Jhn8LxDiRoNU6ZAbm9Rg0CgbMqg1d8rAcuebDj1P2TpjMtfrfivwi+QE56K+eq+rXvOR0
	 bvJvmS5mpfSo+otgDV/CazM90k4ny2ir2YB9g4GYxQCxbVXjP11B/lbP+PerUNSkNSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yoBXuWlF;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C433606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C433606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yoBXuWlF
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3553310f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793708519; x=1794313319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOzzqdK9OoTPF7w8+dGv8CzGaoXQjJup2f2zEoi38v8=;
        b=yoBXuWlFCJjc54rW/BciP9V4C/Iz9+IJzlIbbe7hZuSoBtjdLCqTfDCfi/N/nmyZLO
         +jQIH2hUVF4vFqcbDJ805ALJEgr1eGd78KYVVxtElnBWg7G/1omKy3DgNw0M0e8m5Ss2
         ySj0oQb3ve7zkTOf2CnlsnGm+esLH4/57XCCTvuMqlp93Tk+0BBlUQSKENmdK0W3OI0i
         aytCAPA1roN5cUvh0Eo/no36dkAyKnqA0fIy1eSCPXcqfeDA00EIt4G8gvfqsNW6hwei
         8/k//emnjOVESjfrRUgzwkUIdoB7IRM4jhVSI5FMv7b1IPPVPlR3q0v6KjqiZKljPrs5
         p4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708519; x=1794313319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOzzqdK9OoTPF7w8+dGv8CzGaoXQjJup2f2zEoi38v8=;
        b=CgZ0r1TRwgg1H5VfdYpDXeZFZdUgWxSikZ9e3QlR+8g50XbXDiZIF+yHVzabagg7eq
         3r5jcEYNLCUCvTmYCsuy11L4incJ07cJb4fFrHF/FB43QMA+PcyB9w9n+w2lGx7JFD73
         nKuORtDJ5+nixjpSN4qoZPmgrtJwweq6LCuiTaVXwJFuvKKoM4IPzHRw5Zioy/cSs20x
         GWe9AgEPVp2spYvJRur+OkTgfx0LFffb6TEyBxgbL7TyWrxA52ayzqi60bqGdc6MdFGG
         1o8DJpdHiP1gMXh0qvWgxvNr7bOfAAZhNJdyMH+yZeqSi5jam6414b4Qt4050VE8Xzdd
         +sYA==
X-Gm-Message-State: APuU4Z8bMv2Y9g94NY0I8qVBOV4UPX3GMPd0fqDEBk+NAvbVpX3CMjQk
	DYEeI3JDRwE21zlrHh2aM5CSDZXVX/EujgnATtdVfFxgv9Xy/n04FADh
X-Gm-Gg: AYBFou1wZrLA5B8ycodHvtMe2PVzICSLiTdu9TMW+kBmYK+9ulVS2Fk4FYxZi+3SEkD
	KcSS3StNW8c+1/L8nkX2QuWwpkG9F9Dkk/JwlyPSTvmc9c+NKIg0puiiwE7Qk6f4x8ek2XwN1K2
	BIRCO1AodwHKhwbnbHDGZ4bzQwai/0pYLNTUxUNEbYzsKpNAvonJR2B8ejZ3f4sGpb/tzHgNEvE
	ae3I74HPL8v8rOzzDpwxJA6Fg2Bj4nnRIWcggY0BGoDsbBIdrvHxaQqp8eOHGztVtHV7zpmFD3H
	tsQyzWcHcA4B6UcxILEdmQFHwpMVDL/iQ5qXJRq5QLKtbxi/IQZtu+Mg5DQ08vuc9aYoPQNp+Cu
	Gn2gJ1PPpZPCxz/mPZVksT8iaNNUwppr1LirVvXiS9cv3halaVAkg7txAPm83ht44+Fhc8V+RpZ
	MHklH7lo/aIYONlTd1tQlYn/OlBKaRJCtIf6VsaVW5tgDUo5yGjqUl/EJN4qCtNV9DjFAXEgP3O
	7sMv56crrEGmIcGjAoIzOiS2VJtiRyCp4qPbxtaTcc2grFrP327gjuInjuI1DOQ5B44ndlmBOdu
	BYkEMBEwl9icHeEpl5nDfVM=
X-Received: by 2002:a05:6000:24c5:b0:48e:6264:c373 with SMTP id ffacd0b85a97d-48e6e4f5798mr31061860f8f.14.1793708519379;
        Tue, 03 Nov 2026 04:21:59 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae25dsm22412110f8f.59.2026.11.03.04.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:21:58 -0800 (PST)
Message-ID: <b1c86bc9-24e8-4c87-b2a7-2eefbdd96c12@gmail.com>
Date: Tue, 3 Nov 2026 13:21:57 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mm: hugetlb: respect cpuset restrictions for surplus
 allocations
To: Qi Zheng <qi.zheng@linux.dev>, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, stable@vger.kernel.org,
 Lance Yang <lance.yang@linux.dev>
References: <cover.1793692578.git.zhengqi.arch@bytedance.com>
 <d1e41a65970ced879715a73ce2607de7ad102fb2.1793692578.git.zhengqi.arch@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <d1e41a65970ced879715a73ce2607de7ad102fb2.1793692578.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 9:01 AM, Qi Zheng wrote:
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Gigantic surplus allocations can escape the faulting task's cpuset.
> CMA and the contiguous allocator trust the supplied nodemask without
> checking the current cpuset.
> 
> For example, a shared HugeTLB VMA has MPOL_BIND={0,1}, and T is a
> non-leader thread. With surplus allocation enabled and no eligible free
> HugeTLB folio, the following sequence can occur:
> 
>   CPU0 (cgroup v1 migration)       CPU1 (thread T)
>   -------------------------       ---------------
>   cpuset_attach_task(..., T)
>     T->mems_allowed = {0}
>     /* Non-leader: skip
>        mpol_rebind_mm(). */
>                                   /* Fault; VMA policy is still {0,1}. */
>                                   policy_nodemask()
>                                     /* {0,1} intersects {0}. */
>                                     nodemask = {0,1}
>                                   hugetlb_cma_alloc_frozen_folio()
>                                     /* node0 fails; node1 succeeds. */
> 
> The 1 GiB folio is allocated on node1 despite T being restricted to node0.
> 
> Intersect the interpreted policy with the current cpuset before surplus
> allocation, preserving MPOL_BIND and MPOL_PREFERRED_MANY fallback rules.
> Apply the restriction at the policy-aware entry point to preserve
> per-node pool management semantics.
> 
> If the cpuset changes during allocation, rebuild the mask and revalidate
> any allocated folio against the current constraints. Keep it if it is
> still eligible: freeing an HVO-optimized folio can defer returning its
> range to CMA, so discarding a usable folio can cause a needless allocation
> failure. Only release the folio and allocate again if it is no longer
> eligible.
> 
> Fixes: eb02f14c4a2b ("mm/hugetlb: allow overcommitting gigantic hugepages")
> Cc: stable@vger.kernel.org
> Reported-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>  mm/hugetlb.c | 38 +++++++++++++++++++++++++++++++-------
>  1 file changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index ce9c8e57b8e5c..6fd6e58ace869 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2181,22 +2181,46 @@ struct folio *alloc_buddy_hugetlb_folio(struct hstate *h,
>  		gfp_t gfp_mask, struct mempolicy_interpreted *mpoli)
>  {
>  	struct folio *folio = NULL;
> -	nodemask_t *nodemask = mpoli->nodemask;
> +	nodemask_t alloc_nodemask;
> +	unsigned int cpuset_mems_cookie;
> +
> +retry:
> +	cpuset_mems_cookie = read_mems_allowed_begin();
> +	alloc_nodemask = cpuset_current_mems_allowed;
> +	if (mpoli->mode == MPOL_BIND && mpoli->nodemask &&
> +	    nodes_intersects(*mpoli->nodemask, alloc_nodemask))
> +		nodes_and(alloc_nodemask, alloc_nodemask, *mpoli->nodemask);
> +
> +	if (folio) {
> +		if (unlikely(read_mems_allowed_retry(cpuset_mems_cookie)))
> +			goto retry;
> +
> +		if (node_isset(folio_nid(folio), alloc_nodemask))
> +			return folio;
> +
> +		/* Balance free_huge_folio()'s decrement before caller accounting */
> +		lruvec_stat_mod_folio(folio, NR_HUGETLB, pages_per_huge_page(h));
> +		free_huge_folio(folio);
> +		folio = NULL;
> +	}

the page allocator only retries when the allocation fails, why does this
need to drop a folio that raced with a cpuset change? retrying only on
!folio would make this whole block go away, with the check at the end as:

        if (!folio &&
            unlikely(read_mems_allowed_retry(cpuset_mems_cookie)))
                goto retry;

>  
>  	if (mpoli->mode == MPOL_PREFERRED_MANY) {
>  		gfp_t gfp = gfp_mask & ~(__GFP_DIRECT_RECLAIM | __GFP_NOFAIL);
>  
> +		nodes_and(alloc_nodemask, alloc_nodemask, *mpoli->nodemask);
>  		folio = alloc_surplus_hugetlb_folio(h, gfp, mpoli->nid,
> -						    nodemask);
> +						    &alloc_nodemask);
>  
> -		/* Fallback to all nodes if page==NULL */
> -		nodemask = NULL;
> +		/* Fallback to all nodes allowed by the current cpuset */
> +		alloc_nodemask = cpuset_current_mems_allowed;
>  	}
>  
> -	if (!folio) {
> +	if (!folio)
>  		folio = alloc_surplus_hugetlb_folio(h, gfp_mask, mpoli->nid,
> -						    nodemask);
> -	}
> +						    &alloc_nodemask);
> +
> +	if (unlikely(read_mems_allowed_retry(cpuset_mems_cookie)))
> +		goto retry;
>  
>  	return folio;
>  }


-- 
cheers,
jose a. p-a
