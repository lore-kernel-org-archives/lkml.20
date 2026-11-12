Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452904;
	b=LZ7GfYy/SPGHsqkP0DyKc4RVKJKLl8i1NmDj0WiZd3ODbF7UuJqsQaCLE9FFNT9lOHLW
	 gfiPnwxTAwn+8b7v8Q14zexKKHmdnFYkbsW+PG3cpaWoJL2qhz52pXuaa8CLcD+X5yJ6e
	 3UlJ6MqLAN8gs4Af9Y/dB5dYj3cRxiPe9sWXDGmXNwRu5IKCbynDXlI+N4SRgpMq6wHrU
	 4KgMrkgUIvmCSBtIeE9ov2x1irxc4KrQZ2P9S5ptl+iF+pKQwvzj1HiEIvaC5NGQMIXNP
	 Sgb9clt4nrwiIXSVY/rpc9vILFGZg7JQNGlrYu6kNZg+VgUMABpGlJg0IaoeWtrME8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452904;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type;
	bh=0hASrZa3KsQ/rJDPLJgE3hfFDgP737Rr5tw+ZVyeGEQ=;
	b=fAihe7DKQ7Ad37AP4dfDv3GYYRriC7Tp9tqotdH4h3p/Q+fmeX25cGW+OqBesVsal3/6
	 HnFPau5R0YpTqbtB2fpB1z/ASVccnZvin1Z1xxJljU65S0YhbVCCWezouDapseMyFmVw+
	 e7y4kpQxs0s3TLyPioCULWmIO0HNjDlT6RdSaA2MgwmMGmM28x0IM09pPncP/RvS5JTdE
	 W69F7QBPrzCF8SkJB/Zbjps85qhfrlYwE1FJ1CT4LpLgulPhUDyhQ5q300oNN/voDHr1e
	 o+17yPbTyaRiSp8W3U8leArman78Tb4j5kgmgUSK5GtjX5uHGuCq7ydN/7h06WQJKww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=UhXirKno;
	arc=none smtp.remote-ip=115.124.30.99
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D9E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D9E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=UhXirKno
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794452895; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=0hASrZa3KsQ/rJDPLJgE3hfFDgP737Rr5tw+ZVyeGEQ=;
	b=UhXirKnoxAPULsp7kIyOXD9IZHP3SAQVUGPjZtePuibeS8uQq78lt29uQ6/ghS21TW/bvrMngDDaRVwfeqn65Aw6fTLskMXAn5j+Q1rvcHSLORUEHHhxvM6Aj/E8/y0LjCzHb1CBLTimexsT5MRdGPQK78NoP7lpUwVZrOgOrIo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R691e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XEaUfqM_1794452884;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XEaUfqM_1794452884 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 12 Nov 2026 11:08:14 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Chris Down <chris@chrisdown.name>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  linux-kernel@vger.kernel.org,  kernel-team@meta.com,
  Mark Rutland <mark.rutland@arm.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Muchun Song <muchun.song@linux.dev>,  Oscar
 Salvador <osalvador@suse.de>,  David Hildenbrand <david@kernel.org>,  Mike
 Kravetz <mike.kravetz@oracle.com>,  linux-arm-kernel@lists.infradead.org,
  linux-mm@kvack.org
Subject: Re: [PATCH] arm64: hugetlb: Prevent write fault livelocks on stale
 TLB entries
In-Reply-To: <avPxZjjdBIlM_8_g@chrisdown.name> (Chris Down's message of "Tue,
	10 Nov 2026 20:39:02 -0800")
References: <avPxZjjdBIlM_8_g@chrisdown.name>
Date: Thu, 12 Nov 2026 11:08:02 +0800
Message-ID: <87ld6yn3vx.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Chris Down <chris@chrisdown.name> writes:

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

Good catch!  Thanks!

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
> +		if (dirty)
> +			__flush_hugetlb_tlb_range(vma, addr, addr + pgsize,
> +						  pgsize,
> +						  TLBF_NOWALKCACHE |
> +						  TLBF_NOBROADCAST |
> +						  TLBF_NONOTIFY);

IIUC, this is similar to fix_spurious_fault() for non-hugetlb folios.
Can we use similar logic?

> +		return 0;
> +	}
>  
>  	if (!__cont_access_flags_changed(ptep, pte, ncontig))
>  		return 0;
>
> base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620

---
Best Regards,
Huang, Ying
