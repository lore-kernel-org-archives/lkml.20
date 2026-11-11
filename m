Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387865;
	b=JFsHoqP6rP+KNXeMesuSOlQ23tkL3CsK9EaKWBB0KQEvUiLf3L2CCdxFZaMS0carvvOl
	 AzjUjUoyaIPcHLyutuX23NeXuQaijyqnbWA28mU630YLOPhQ+/ELoQMkQBBhb5Of0YOHe
	 3QFuuPY3krpVp+Bi87plgkrek9yOHBsEVQSb/jcCbXrgWq5nRIgnWTjpdfH97OdhxXOId
	 5eY4l40if6CcoI0GhJSCaklB0fHQ7/lutg1aCCoCo//UPNeIvL/QaoJ5yb6u3EWgwnich
	 iSO8hXzvyzFmEJW1pee8Z5o52MREhiGdch2r2LaCKChHLF0cZn8pkk1gIiVAMkmoJ8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387865;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Uu+9KGMrpHo8NgeySjI/tnMOPCgQH/37jz3abKrEz2o=;
	b=jfJ0f1nr8RgriNES7qrRAicW1WPUKC2jqNuMX7TlAIKT76UVC6oorjvaCNlcbhtKcucQ
	 X091QH4PoOBjD9MZkwHsNnxxy9/k9a0IGD3ZSPpjufj94Q+s6vB5Mj7OvPgpuCJMTCiT6
	 B0uFsnpE29ehR1N4KBnGZFJo5IygLbmAVe/0Du7N4FrMd/LU2yuQi7hBYPplU6+vK0KkM
	 BlxhB4YnipqGReAQ2jCiMsbhDco4KeTn33zZIj6GBLQNShahg4iFtQSdVT0d5XEyLx1V9
	 11GMqGPK6P304llcaiNHYo5H+1ygUaCoFrHo/pSlPxTIZWUfOqWX1Zuv3QKWmRe6gtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HIi63Rsc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF429606A333
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HIi63Rsc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53ADA1F00A05;
	Wed, 11 Nov 2026 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794387865;
	bh=Uu+9KGMrpHo8NgeySjI/tnMOPCgQH/37jz3abKrEz2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HIi63Rsc072fcV3Tl1WAPHmCUz8w3a5jTfXsiegMUGVvyuq0PblXB+u68/3bRBoJO
	 T1P0Y3HXdzA2glvFOEAULVTxX+f30mY5CzVeX37aHt4sn3Yq80qpmSNWLSpwA+QF5L
	 +OWMh0pe3Wf/fuBagRsb2AAxmPmnH8HLa430rxxnafK5LaZUUdRqGILc0uzwMDQoS7
	 APpykF1PkmpRzUSEJIa6FImTQdljxta8iwjlHX+H7UxhNeqBY85ZZHGXyejxM+DtJm
	 iFt4yxKv7HQ9sSl7td/sWSWxe9ov/nIWJbuwpsmeuFh2WB5KaNQWfbiChgOXpq5Q0q
	 4mRWIekkXy4BA==
Date: Wed, 11 Nov 2026 10:04:19 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Chris Down <chris@chrisdown.name>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH] arm64: hugetlb: Prevent write fault livelocks on stale
 TLB entries
Message-ID: <avQvk0oxEHTLFacU@localhost.localdomain>
References: <avPxZjjdBIlM_8_g@chrisdown.name>
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
In-Reply-To: <avPxZjjdBIlM_8_g@chrisdown.name>

On Tue, Nov 10, 2026 at 08:39:02PM -0800, Chris Down wrote:
> In Meta production, we have had tasks get stuck in a fault loop while
> using hugetlb on arm64. During my investigations I found that affected
> tasks share a private hugetlb page.
> 
> Looking at the stuck task states, I found the following ordering:
> 
>   CPU0                                 CPU1
>   ----                                 ----
>   read page
>   [read only entry cached in TLB]
>                                        write page
>                                        hugetlb_fault()
>                                          hugetlb_wp()
>                                          [reuse folio]
>                                          set_huge_ptep_maybe_writable()
>                                            set_huge_ptep_writable()
>                                          [flush local TLB only]
> 
>   write page using stale entry
>   hugetlb_fault()
>     huge_ptep_set_access_flags()
>     [entry already writable, no flush]
>   retry write using stale entry
>   [fault indefinitely. well, that's not ideal!]
> 
> The reason is that when a write fault makes a non-contiguous hugetlb
> entry writable, it only invalidates the local TLB. However, another CPU
> can keep the old read-only entry, so its write will fault even though
> the page table already permits it. hugetlb_fault() then finds nothing to
> change and leaves the stale entry in place, so the same write keeps
> going round in circles.
> 
> This is particularly bad because, if the kernel is copying to user
> memory, the retry stays inside the kernel and the task can't act on the
> pending signal.
> 
> It can even remain unkillable while holding locks across the copy,
> resulting in further failures. For example, a read into a hugetlb
> buffer can hold the pipe mutex and block other users of the pipe until
> the loop ends, causing cascading lockups across the machine.
> 
> To fix this, when a write fault finds nothing to change in a
> non-contiguous hugetlb entry, let's invalidate the local entry.
> 
> Fixes: cb1fa2e99955 ("arm64, tlbflush: don't TLBI broadcast if page reused in write fault")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chris Down <chris@chrisdown.name>

This makes sense to me, and I see that commit cb1fa2e99955 ("arm64, tlbflush:
don't TLBI broadcast if page reused in write fault") only invalidated local tlb
for cont-hugetlb.
Reading the changelog, I guess that was an oversight because I could not find
the reason behind.

> ---
>  arch/arm64/mm/hugetlbpage.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 8e799c1fe0aa..ff1f53e435e1 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -429,9 +429,24 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  	VM_WARN_ON(!pte_present(pte));
>  	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
>  
> -	if (!pte_cont(pte))
> -		return __ptep_set_access_flags_anysz(vma, addr, ptep, pte,
> -						     dirty, pgsize);
> +	if (!pte_cont(pte)) {
> +		if (__ptep_set_access_flags_anysz(vma, addr, ptep, pte,
> +						  dirty, pgsize))
> +			return 1;
> +
> +		/*
> +		 * Another CPU may have made the entry writable without
> +		 * invalidating our stale read-only TLB entry. To avoid
> +		 * indefinitely faulting on this entry, flush it.
> +		 */

Maybe put that we already do that for cont-pte? 

 

-- 
Oscar Salvador
SUSE Labs
