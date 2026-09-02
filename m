Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5047A3BBFCD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367791; cv=none; b=oXfQQO8CWRRRVaGUQMeOzoq27nstB3AbFAsSfbjXlJGjAa5/i7+LB/AVa0kS8fbZ8FaMHcO/zXd3nnTLY31lx1x+iHS3FAnHXqHnpp1c91nCxB9BwNCgKVFaDQCldC5aVC54UVuaO8d0zk4OWOfwFU0vYz2E/F0sofFGpOrkRHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367791; c=relaxed/simple;
	bh=bSACpyfIwUmtKyOcDgKObZYNIshXE2l5ZAOak9z2BUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYCmIZmxYOpit2TgLdBmx3118t8c94BxM+/1gb8yrsGaMro71CxfPXT2eLfPCI725nGnILY+rldpXMxfHU/HD3220ipEVjfFKAsffSe+wxhomH++KuS+HKPVVV1KIhRP1GNSyQcyxTyc30M6u2uCDJ+3HX0ccHrBSwrTCM053gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGw/2Eja; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGw/2Eja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA241F000E9;
	Wed,  2 Sep 2026 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788367789;
	bh=8dn0iOvv1GVRWETQs2SDcxWNO+0sddiy1Vm8m6bHlbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cGw/2Eja2ZXVKjPcg3P+V6xH2JPYwXkfhwNVQCowY7r3PY8C1yjuggvjE0EZY3RMB
	 ByIHlI4AiLVUoc2AWMOxd7zbfjhNMBJD0auPk2Qal4dcDC9t8l8AQupaOyIo8LogOF
	 C8WlorVwY5bD9H7SvW6vMk5DwFTJOk2Dhx9zcBvSIrN3K3PdYqcISmdxdnakOkLVDn
	 C4N6cKaPjoHOljzl8DOTpItlzu0SJOnu4d8SbSILrPUtDSyPMo5K6TFkSEYMpHvQrJ
	 u/zo7rE2z7lfskjO4kDH+/4wkZhXr1J30e7DyqZ6uLaPNfVPYTNXDWIrqhuIYEVV9P
	 JQzuw8EGDvyQQ==
Date: Wed, 2 Sep 2026 16:49:48 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Charan Teja Kalla <quic_charante@quicinc.com>, 
	Michal Hocko <mhocko@suse.com>
Cc: akpm@linux-foundation.org, mgorman@techsingularity.net, 
	david@redhat.com, vbabka@suse.cz, hannes@cmpxchg.org, quic_pkondeti@quicinc.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/3] mm: page_alloc: drain pcp lists before oom kill
Message-ID: <aphSYFTd12oia8K2@google.com>
References: <cover.1699104759.git.quic_charante@quicinc.com>
 <a8e16f7eb295e1843f8edaa1ae1c68325c54c896.1699104759.git.quic_charante@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8e16f7eb295e1843f8edaa1ae1c68325c54c896.1699104759.git.quic_charante@quicinc.com>

On Sun, Nov 05, 2023 at 06:20:50PM +0530, Charan Teja Kalla wrote:
> pcp lists are drained from __alloc_pages_direct_reclaim(), only if some
> progress is made in the attempt.
> 
> struct page *__alloc_pages_direct_reclaim() {
>     .....
>    *did_some_progress = __perform_reclaim(gfp_mask, order, ac);
>    if (unlikely(!(*did_some_progress)))
>       goto out;
> retry:
>     page = get_page_from_freelist();
>     if (!page && !drained) {
>         drain_all_pages(NULL);
>         drained = true;
>         goto retry;
>     }
> out:
> }
> 
> After the above, allocation attempt can fallback to
> should_reclaim_retry() to decide reclaim retries. If it too return
> false, allocation request will simply fallback to oom kill path without
> even attempting the draining of the pcp pages that might help the
> allocation attempt to succeed.
> 
> VM system running with ~50MB of memory shown the below stats during OOM
> kill:
> Normal free:760kB boost:0kB min:768kB low:960kB high:1152kB
> reserved_highatomic:0KB managed:49152kB free_pcp:460kB
> 
> Though in such system state OOM kill is imminent, but the current kill
> could have been delayed if the pcp is drained as pcp + free is even
> above the high watermark.
> 
> Fix this missing drain of pcp list in should_reclaim_retry() along with
> unreserving the high atomic page blocks, like it is done in
> __alloc_pages_direct_reclaim().
> 
> Signed-off-by: Charan Teja Kalla <quic_charante@quicinc.com>

[Sorry for thread necromancy]

Hi Charan,

Are you planning to respin this patch?

I know that Michal was questioning the need for it. While doing some
stress testing I came across a couple of OOM kills that had significant
amount of memory in pcplists. Something that would have been prevented
by this patch.

It's not something I can reproduce reliably and it is an artificial
workload, so not very concerning, but the patch seems like generally a
good idea and hopefully pretty harmless. It's also consistent with the
code in __alloc_pages_direct_reclaim().

For the record, we have been carrying it internally for a while and
there haven't been any issues AFAICT.

Michal, WDYT?

> ---
>  mm/page_alloc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index b91c99e..8eee292 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -3857,8 +3857,10 @@ should_reclaim_retry(gfp_t gfp_mask, unsigned order,
>  		cond_resched();
>  out:
>  	/* Before OOM, exhaust highatomic_reserve */
> -	if (!ret)
> -		return unreserve_highatomic_pageblock(ac, true);
> +	if (!ret) {
> +		ret =  unreserve_highatomic_pageblock(ac, true);
> +		drain_all_pages(NULL);
> +	}
>  
>  	return ret;
>  }
> -- 
> 2.7.4
> 
> 
