Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384089;
	b=E5XW7NDvu6GB1oL46BynuJc6upXaYFXdj/o0sUbO1zqrvBSckY8nUnGdLiTLlLtHFSPg
	 2tiDxT16JLS61qUY991w8Q0X8Pt64WpCA/0cghPgrfwKLJjJAodBqO3i1aZE7dkrQwimq
	 JygKuYm1bEM44HQwBYBoi3D1bHP91o+6/rAQsPCWvtGA+lxuwm8lQy7/uHnZ1ENVxV78a
	 TkJ/DAWZo5zSr85xsyHv2rrkIdiAgIKx6OJP02KjW49xldVAlhB3cTC2GPtDTimURMunX
	 ow2dzXtO0uiTxqgm16nFC2JEE/s+PxA6ZKrutolKeX3HAJI3+m9zh4PzuJ/xdt16VdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384089;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gFD8GxCW8TaX600NUsdqPsT5QbgfQppQ+86XjlXuBB8=;
	b=3nlAnNTaYjiv9FbDa7Df1WkHB1B0eTi6wx2tb82Jf5s1NUm69EnpnyI3OvCCaaFY45XQ
	 9FTwcxyXQO98JDKBclXxysd24ik5EN0819HZPEnr5wKY1gU8EjF3nw/Ywu8AmPb2RT5kB
	 yatW8N5hnxBN1qF42JS/kGesLEKrraBO0pkLTK0T33hhYvkaYkEdiFzCg2PvQ/8U594SU
	 ifHnBPnnwgHH3hv1Mgb+R8SLHzdTlXgM52lyxiFYAR2tRgXpNsGtnYN/AlKkAEu0j5QZP
	 2fTh5EnvbXEXKTQUAISa7KBm2bI8laAiSWVn/G0uMGQPe1TtwSox0cFcOwwiiK6quqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A5sS8+8u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AAC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A5sS8+8u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A022C1F00A08;
	Wed, 11 Nov 2026 08:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794384089;
	bh=gFD8GxCW8TaX600NUsdqPsT5QbgfQppQ+86XjlXuBB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A5sS8+8uY+DdCHXQg9bRdOYPz96TIc0INTUnO+kkKrJHaM26c1xrNB1zhn38ZR5XQ
	 a7PPfIg8HknZg+PMAMVRgWVp6MK3YnB4FQW+7eT4e61afhSVfAcWXe0Jj+tperG+J6
	 Dba1+3LJCt6ArpYAnkXiJLliqL/5LdetKFFAbKNh32rFyso25fblbBhUjhL8FDI1li
	 EZAo5C/9n0lU3+Vx9r00gWq5QjPkLLy6n+P9F8Oda8sotn3CotI3ynZdBEcdwNAIS0
	 L0UuXPmy9Yt9YTLvvnkx9jHVGoKUDxjn9siexv4zzcPe9rKUdzNcSyzFT1PdQDeB9J
	 k5fMTXuIOAW1Q==
Date: Wed, 11 Nov 2026 10:01:23 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chris Down <chris@chrisdown.name>
Cc: pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] kho: Prevent reuse of preserved pages after a
 reservation failure
Message-ID: <avQg0_jFY3get3wG@kernel.org>
References: <avQUquBK6cO6tUUI@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avQUquBK6cO6tUUI@chrisdown.name>

Hi,

On Tue, Nov 10, 2026 at 11:09:30PM -0800, Chris Down wrote:
> kho_preserved_memory_reserve() reserves each range of preserved memory
> in memblock and marks it noinit, but ignores both return values. Either
> can fail when memblock has to grow its reserved array and can't find
> room, which at this point in boot it may only take from KHO bootmem.

Is it an LLM analysis or you seen this happen?

> The boot then goes on as if the range were reserved, and two things
> can follow:
 
> - If the reservation failed, memblock_free_all() hands the range to the
>   page allocator with the previous kernel's data still in it, while its
>   KHO user still expects to restore it. A memfd preserved through LUO
>   can then get back pages that belong to someone else. Oh dear!
> - If only the noinit marking failed, the struct pages can be
>   initialised later, wiping the KHO magic, so restoring the range fails.
> 
> Dropping the handover at this point isn't safe either. reserve_mem=
> revives its regions from the handover before mm_core_init(), and
> relies on this walk to reserve them.

reserve_mem_kho_revive() can memblock_reserve() its memory itself and we
can carry on, can't we?
 
> Carrying on could hand out private data, so let's panic if either call
> fails.
> 
> Fixes: fc33e4b44b27 ("kexec: enable KHO support for memory preservation")
> Signed-off-by: Chris Down <chris@chrisdown.name>
> ---
>  kernel/liveupdate/kexec_handover.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index eeec298aa9d6..0faa21ebb0cf 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -629,9 +629,14 @@ static int __init kho_preserved_memory_reserve(unsigned long key, void *data)
>  	sz = 1UL << (order + PAGE_SHIFT);
>  	page = kho_get_preserved_page(phys, order);
>  
> -	/* Reserve the memory preserved in KHO in memblock */
> -	memblock_reserve(phys, sz);
> -	memblock_reserved_mark_noinit(phys, sz);
> +	/*
> +	 * Reserve the memory preserved in KHO in memblock. It's too late to
> +	 * drop the handover if that fails: reserve_mem may already have revived
> +	 * regions from it.
> +	 */
> +	if (memblock_reserve(phys, sz) || memblock_reserved_mark_noinit(phys, sz))
> +		panic("KHO: failed to reserve preserved memory %pa+%#llx\n",
> +		      &phys, sz);
>  	info.magic = KHO_PAGE_MAGIC;
>  	info.order = order;
>  	page->private = info.page_private;
> 
> base-commit: a0dc8eddbfdb6dd9c5c2b70eb66ab49cb1978425
> -- 
> 2.54.0
> 

-- 
Sincerely yours,
Mike.
