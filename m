Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2206747D450
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856734; cv=none; b=R5JaPL3aDcb+VUY+G4U+HbeHp6cz9srWHIePpugYjMIXJS+GMPN/Eo5Zi3UDPQQfnlHXTW/hSnbmoUaEURFC8yK1KjOkodtptEQEiHUhPhz66IV45iWiAL2u/SVryLblkEYxlRSQLzOp4DZXcq8PYvMToRhFbZnvLeuzwRUF57Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856734; c=relaxed/simple;
	bh=Uf9lcRsimfLnNTBHM0phwKDA1O5oY5isHfX376NYS3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmByX7e+B4jyxM4+WmA/366Fj1NCbHXBn1HTux7972foouHD0XYS+BvOQLWiziDw3k7SlN0CJrIp2OLIAiRhJadwODchtlHiTnVDd4CYj28xnESk5jp11YlYZGId+SLexvglCvR11rLdIDCiw02woIj8QeEUX/qQfua+yy//Ur8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAD9imPX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAD9imPX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CAE1F00A3A;
	Tue,  8 Sep 2026 08:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788856731;
	bh=x0TeNxa7WKy6H83W3YykrnYwLHUqj47zG0dTNGkPR8M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EAD9imPX7j1sj3xlERKzxrMcNSF79EWjH2FLPP6UrAVWmhWhEWEnrWkns+aGFfiQr
	 9alkBgbZZm/6zgZmJdDlXjxMxAQOSLPJWPdZ9ULWoM3IsibLmHhRi4uKW3S1gVTEo/
	 BJpwqWqcVYIYiaLaBT2c8WbpYTPhCyRl5AVcrkUoHeZk79BA1/+lqzgbf2P1sfK/ys
	 L1ocK5IDCzNvvX9jUboF2L+9Z+3FvuqELM5cDGUR1IxHepvRp0iCcMuJIajweeGgND
	 PlxxQki4lTRXyG4O1Gy9yxvgZcNogU0vuTQZTvK4Q/70DnPx+Z/rfNZ8HyYGRP7AOi
	 b0QRKSftBReRg==
Message-ID: <c4c29830-ad49-4ca1-b4d5-6f40d30cdcdc@kernel.org>
Date: Tue, 8 Sep 2026 10:38:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: page_alloc: add missing hooks to bulk allocation
 path
Content-Language: en-US
To: Qiqi Liu <liuqiqi@kylinos.cn>, akpm@linux-foundation.org
Cc: surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev,
 hannes@cmpxchg.org, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, gourry@gourry.net
References: <20260907120949.418450-1-liuqiqi@kylinos.cn>
 <20260908065043.217569-1-liuqiqi@kylinos.cn>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20260908065043.217569-1-liuqiqi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 08:50, Qiqi Liu wrote:
> The bulk allocation path in alloc_pages_bulk_noprof() currently misses
> trace_mm_page_alloc() and kmsan_alloc_page() calls, leaving bulk-allocated
> pages invisible to ftrace/BPF/perf and leaving KMSAN shadow memory stale.
> 
> Add both calls after set_page_refcounted() in the bulk loop to match
> the standard allocation path. The gfp mask passed to kmsan_alloc_page()
> is stripped of __GFP_RECLAIM because the bulk loop runs under the PCP
> spinlock, and KMSAN's stack depot allocation must not sleep.
> 
> Both are no-ops when their respective features are disabled, so there
> is no overhead in production kernels.
> 
> Suggested-by: Gregory Price <gourry@gourry.net>
> Signed-off-by: Qiqi Liu <liuqiqi@kylinos.cn>
> ---
>  mm/page_alloc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 12fac9084c48..73c73499a051 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -5280,6 +5280,8 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
>  
>  		prep_new_page(page, 0, gfp, ALLOC_DEFAULT);
>  		set_page_refcounted(page);
> +		trace_mm_page_alloc(page, 0, gfp, ac.migratetype);
> +		kmsan_alloc_page(page, 0, gfp & ~__GFP_RECLAIM);

With normal page allocation the set_page_refcounted() happens after
trace+kmsan. While it currently shouldn't matter, it could be more future
proof to keep the same order.

>  		page_array[nr_populated++] = page;
>  	}
>  

