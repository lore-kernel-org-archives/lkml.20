Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345403;
	b=y5+y16J8InjF35r0BzDFe6EUc0aSSZZdEtGp7cuyvUtzWF7OdvPNl99Rabl3iAW9w6Rs
	 ACMXEqHc30yBYn/wSDTaNsbLaemkZN2cO8e4UxpyQsfxSgfeYnd+1p/2vbg5GGaZIhj76
	 xUii2zstA3tW/HqBOTfevJntXmoS2viyoZKTJe9hOi0I+S2rX5I8YN8caGCgFGOFEQvit
	 o/d7PHtz6pCgJYfT574JQJXkk/WI3A1KojIattONSLxL8rBaJa/vvehyg/ECj7aPY/siT
	 RjkOM/MMBzf46lCC0YSVOZeV4FOyXJcbu2ar2STB5CbhsKAcBZC0rQJ75BQQvNUuS6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345403;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=oyfKDjJKfboeY0ufdBsjhuOQtM906D+prVVlHL4BJww=;
	b=lH8A3Xmm686G1qqPjF/sMGF1fqIJDWXMKjQA2sWBinjO8PklbdITE6SiJj/vvNdUvAdJ
	 O3jETfUqyuLvPdxYA7p8yA5DrZKbUbZJmt0B3APkFiETAvC5YvXSzAmw0pHLITrFlGbEc
	 OXAlTjw4eSxsT3t/NW7hM+19O+CzneeaJkn7fvxpgHKgTEl9EE74F8zscjRnblFEo0t2L
	 MkxAU4jz3Lhr1GEiKBiEzsrnUxPIHeqaLdS9kRdla6L8z8t3b2pIRvQ4W3wvpXMbAak2Z
	 bhaHb28ttdSt/+zXWQswy9/T/Mu7XP1/5mSeXTBOawegw1kGkosj+fzPAfsEXaEIPyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YcTvULNQ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65569606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65569606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YcTvULNQ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E19F1682;
	Fri, 30 Oct 2026 00:29:57 -0700 (PDT)
Received: from [10.163.152.232] (unknown [10.163.152.232])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA59D3F7B4;
	Fri, 30 Oct 2026 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793345400; bh=C0mcHAl4LVJ8G9Pi84zcG+F9QdADyGft2/o2o+f0aCs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YcTvULNQBDbtCwZfjjgbZnJd9x9ynp64awrXns5yOXqR8Z+sGJVfTapd6gvVsFgUJ
	 57bMm++PQke8e3TIZX02+sOLDz+2oCiQuvUscLQCxTQAkheHl0XTz1g21phraKC/Qz
	 /l8zfyfjg1A8PATkbHb82RqGtQKE9AHDFttxKiWo=
Message-ID: <e1cfd568-8fdf-4aa1-a8c5-961bb8d7efba@arm.com>
Date: Fri, 30 Oct 2026 12:59:50 +0530
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
Subject: Re: [PATCH v3 04/10] mm/vmalloc: propagate errors in
 vmap_pages_p*d_range()
To: Hao Ge <hao.ge@linux.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Uladzislau Rezki <urezki@gmail.com>, Suren Baghdasaryan <surenb@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org
References: <20261026080329.140244-1-hao.ge@linux.dev>
 <20261026080329.140244-5-hao.ge@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261026080329.140244-5-hao.ge@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26/10/26 1:33 pm, Hao Ge wrote:
> vmap_pages_pmd_range(), vmap_pages_pud_range() and
> vmap_pages_p4d_range() return -ENOMEM whenever the level below them
> fails.  But vmap_pages_pte_range() can also return -EINVAL for a
> page without a valid pfn and -EBUSY for a pte that is already
> mapped.  Pass the error up as-is instead, like the vmap_p*d_range()
> helpers for vmap_page_range() do.
> 
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---

Fixes?

Reviewed-by: Dev Jain <dev.jain@arm.com>


>  mm/vmalloc.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 7131f60d1a8e..d60b99b81ec9 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -600,16 +600,18 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>  {
>  	pmd_t *pmd;
>  	unsigned long next;
> +	int err = 0;
>  
>  	pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
>  	if (!pmd)
>  		return -ENOMEM;
>  	do {
>  		next = pmd_addr_end(addr, end);
> -		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
> -			return -ENOMEM;
> +		err = vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask);
> +		if (err)
> +			break;
>  	} while (pmd++, addr = next, addr != end);
> -	return 0;
> +	return err;
>  }
>  
>  static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
> @@ -618,16 +620,18 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>  {
>  	pud_t *pud;
>  	unsigned long next;
> +	int err = 0;
>  
>  	pud = pud_alloc_track(&init_mm, p4d, addr, mask);
>  	if (!pud)
>  		return -ENOMEM;
>  	do {
>  		next = pud_addr_end(addr, end);
> -		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
> -			return -ENOMEM;
> +		err = vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask);
> +		if (err)
> +			break;
>  	} while (pud++, addr = next, addr != end);
> -	return 0;
> +	return err;
>  }
>  
>  static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
> @@ -636,16 +640,18 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>  {
>  	p4d_t *p4d;
>  	unsigned long next;
> +	int err = 0;
>  
>  	p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
>  	if (!p4d)
>  		return -ENOMEM;
>  	do {
>  		next = p4d_addr_end(addr, end);
> -		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
> -			return -ENOMEM;
> +		err = vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask);
> +		if (err)
> +			break;
>  	} while (p4d++, addr = next, addr != end);
> -	return 0;
> +	return err;
>  }
>  
>  static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,

