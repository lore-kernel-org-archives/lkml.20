Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894792;
	b=TI3dnGLzJZNM7bSpCnloo9tlosr7uGG5iKQXeJ3wj4+E8jZeQ0KwzahOPv6ZBRpIhZPb
	 AEX84PfJkUv5iBH4QSG0LZ2c8GiW0xvJ8L9ZnahCqe35+QG0kOEeUBFEJPrbi79/2q7X0
	 4Fe6bJpWpXPJak0NbN/m1lkYugSCiCPXPLxAmHiqDSaIH8imBCb3ojoYUkuJN4RMS0tzy
	 FcdWkNz7irNBsBjPmIVKq9oUyLG0MpCJcwvyMiMux1vA48dlpZZIW38aikldMGbejEVsk
	 EfO6ZiSx8VfGrO4w5H4ucbSvZhA3d3poHKwet6c/MotGxLcyrb0+PDoHWxeHbpF5DIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894792;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=preYSvRhvln7+HpvLwGVKBTF6qwxYYu7pQfN5NTytYU=;
	b=CGv2JRAbnzaxEcV3vYBspqljG5XlSrU/c/5k69aanDDTcE4OkzZauDbRYfsmlR1F65ZF
	 YykLsVYW+u7/9E3lZUVcAJxXCXcCNyRDaQPT+5Zvu8QuWsQWcT/45rP+yYmPn9xqJ+C7B
	 KhTNNlQihjCSoEtIWU5QUvfSSpLthvPRGx++OwLzlTqdOtlAH0kLFS/Jj1i+vevip+jx8
	 QnR4TT38++WoJQL2ajyQKpx4OSo43SSO7TQVQ/SE2NqQ9/U4F1XTwMra1bwiTOIrVcAgb
	 zcdUBhqEpDqxaMZUKgtbiRmqwQniVT5l5kAnOW+82366OhobfGm+TsEl34URVjXjrCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=soXSklK+;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BF7606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7BF7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=soXSklK+
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69C311682;
	Mon, 16 Nov 2026 21:53:07 -0800 (PST)
Received: from [10.163.156.60] (unknown [10.163.156.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 282C33F673;
	Mon, 16 Nov 2026 21:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794894790; bh=LeNEd6XybC/0oQxf6tPEXuNsH/uhyc0vnuxHYF7fhAE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=soXSklK+FJaMyX7c81avmAyAcqpvFzRiWZU4JCZehiQO8CLy91r+p5aueoYQaI4om
	 t7tyYU15TqiYoQGlI/BoCP1DY9vNUu0BY9gThGDlvh0HvfLGNprRWeRo7J1dRd7YoH
	 HsnX9MS+DU6Ph5GxQpqgRIVBJ9LuTa9/Rq3k3uFg=
Message-ID: <7191bd56-ba20-4b60-9969-7005e64c086a@arm.com>
Date: Tue, 17 Nov 2026 11:23:00 +0530
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
Subject: Re: [PATCH v5 03/11] mm/vmalloc: reject an unaligned range in
 vmap_page_range()
To: Hao Ge <hao.ge@linux.dev>, Suren Baghdasaryan <surenb@google.com>,
 Uladzislau Rezki <urezki@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org
References: <20261116071325.263682-1-hao.ge@linux.dev>
 <20261116071325.263682-4-hao.ge@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261116071325.263682-4-hao.ge@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/11/26 12:43 pm, Hao Ge wrote:
> commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not
> PAGE_SIZE aligned") put the check in vmap_pte_range(), which is too
> late, because the upper levels may already have installed page tables
> for a range that is rejected anyway.
> 
> The pte loop maps whole pages and stops only when addr lands exactly
> on end. An unaligned end lets addr jump over it and the loop keeps
> mapping past the range. An unaligned start maps the page below the
> range and usually misses end too. Such a range is never a legitimate
> request.
> 
> vmap_range_noflush() has a single caller, vmap_page_range(). Warn on
> addr and end there and bail out with -EINVAL before any page table is
> installed, and drop the check from vmap_pte_range().
> 
> Suggested-by: Suren Baghdasaryan <surenb@google.com>
> Suggested-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>


>  mm/vmalloc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3c0d9e69b886..a168f6f20f4f 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -125,9 +125,6 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	unsigned long size;
>  	unsigned int nr_pages;
>  
> -	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> -		return -EINVAL;
> -
>  	pfn = phys_addr >> PAGE_SHIFT;
>  	pte = pte_alloc_kernel_track(pmd, addr, mask);
>  	if (!pte)
> @@ -369,6 +366,9 @@ int vmap_page_range(unsigned long addr, unsigned long end,
>  {
>  	int err;
>  
> +	if (WARN_ON_ONCE(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end)))
> +		return -EINVAL;
> +
>  	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
>  				 ioremap_max_page_shift);
>  	flush_cache_vmap(addr, end);

