Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217275;
	b=BaD2A96rtFNwNOlXRWo7XH+oKUkmv5tY4UhyEG7Feh19UoKOelNJq0fiSvK5F6enIuHv
	 GHc53HQCBxGJQd9m+y9fJ/J7dkS9YtkYZufE5rGehMxlYdXDbq9nPyxa8legT1bBh8j45
	 PEhiSCQi8qLCqJmgE0bekj8JCVvfIrNCub7jTzE37GUZPMc6TzQ78l5O4HJmPokPrwVHr
	 EnESI8w9kkVvolcPYTHsHuSSGM0tPUlklUngQIveR+vKNiuvPHKgYGCyjfd4GDE2gBO6K
	 f66Ww0ZCWsJOQHyAaJu9rrNEgwaLYRHSMcWSwlNiI68Mujhp82BP9U5tmZnXl/IZHsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217275;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=2Bm1+eUEK+FHSD+EcDQEDqDRX6+druzmbz7a8/C2NzM=;
	b=Zo6nG/nHFSOfxfu9coySkGtiYc7K5rl1x5L3gTzTb7A/vVdlBPPF+hC9KKZ1Gj5UdcZo
	 Yn7JeESq0t2CfWNbeROfq9ULzXK9FmMmNrdC01aS9rqIwubTk3YRy9Bwqaq9Mt8JgXAU0
	 QTvKCLc/g1l9WcDv7h/CcoozBbue8CeNFdnSysdyHDKEge0MhE31Z1x5qsKCgTwiQ1Dw+
	 fd+9RgF9wBOVb5sA2tWkQHTeZrWGj3jNuFHs15GWvOdd+FgKP1hxzMy4vrXYlIslTgfca
	 LZkh6TRONLxmVUBl0qMfhAteoTItp+lxDqTdiSc4EGQbd+KCvvGEywGXk9chU77okuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P/4uSXe3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E284606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P/4uSXe3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE4B1F008A1;
	Mon,  9 Nov 2026 09:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794217274;
	bh=2Bm1+eUEK+FHSD+EcDQEDqDRX6+druzmbz7a8/C2NzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P/4uSXe3euy2p0f/uGxCs0nP5wZK8Wjy988o6H9jf6+IHycHdQkyMlZBCI+OemLGh
	 HdnxgiG7WBtzVaM7RJfaACyZ1LkbSys/EEAc1pKixLmyxgk4clYaEa1yI/ibME/cmR
	 73sIhcFe628fL24tNi1nmyQG6/y2XsUkES662ZExlcV2P3WLAyHLbhx1Js8nlF+PI7
	 Wpo9SX2fJsRxUx4xoPrEAv0pYnjvnVCMAc61PwBzl/uy9uNCLfJZAGfdL3Fb8yTsSm
	 bflhB89PTYiDbNVBwE7kWZo375vuHS8Ab6pBAUPt900QcWpxfG80hK5jDCuzPzD6fv
	 N66HTRB1UqEHA==
Date: Mon, 9 Nov 2026 11:41:08 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: Balbir Singh <balbirs@nvidia.com>, muchun.song@linux.dev,
	osalvador@suse.de, david@kernel.org, akpm@linux-foundation.org,
	apopple@nvidia.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/hugetlb: optimize bootmem hugepage tail vmemmap
 init
Message-ID: <avGVNISvj-v8IN3g@kernel.org>
References: <20261105120615.16817-1-lizhe.67@bytedance.com>
 <20261105120615.16817-3-lizhe.67@bytedance.com>
 <au2qhlsxQt3SRwIu@parvat>
 <ca38db3a-a8fe-47c3-8813-5c3b0ac4b7ac@bytedance.com>
 <3e5a9f27-ea35-4557-95d1-70ce359e4c92@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e5a9f27-ea35-4557-95d1-70ce359e4c92@bytedance.com>

Hi,

On Mon, Nov 09, 2026 at 05:22:24PM +0800, Li Zhe wrote:
> On 11/9/26 11:01 AM, Li Zhe wrote:
> >
> > On 11/6/26 6:23 PM, Balbir Singh wrote:
> >> On Thu, Nov 05, 2026 at 08:06:15PM +0800, Li Zhe wrote:
> >>> Boot-time HugeTLB allocation has to initialize tail struct pages itself
> >>> when HugeTLB vmemmap optimization (HVO) is unavailable or fails.  For
> >>> gigantic pages, this can cover a large number of tail pages. Most state
> >>> installed by __init_single_page() and prep_compound_tail() is identical
> >>> for every tail page in the same huge page; only PFN-dependent fields
> >>> need refreshing.
> >>>
> >>> Initialize the first tail page normally, copy it into a local template,
> >>> then initialize the remaining tails from that template with
> >>> memmap_init_page_from_template().  This avoids repeatedly doing the 
> >>> full
> >>> __init_single_page() and prep_compound_tail() sequence for state 
> >>> that is
> >>> identical across tail pages in the same huge page.
> >>>
> >>> On an arm64 QEMU/KVM guest using 4K pages and 64 boot-time 1G hugepages
> >>> (HVO unavailable on arm64 in v7.4-rc1), the measured fallback tail
> >>> initialization time improved by 36.43%, measured with a temporary
> >>> jiffies-based printk modeled after the existing timing in
> >>> memmap_init_zone_device():
> >>>
> >>>    base:             318.4 ms
> >>>    with this patch:  202.4 ms
> >>>
> >>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> >>> ---
> >>>   mm/hugetlb.c | 23 ++++++++++++++++++-----
> >>>   1 file changed, 18 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> >>> index da5d04edf7c1..987f16a5ea27 100644
> >>> --- a/mm/hugetlb.c
> >>> +++ b/mm/hugetlb.c
> >>> @@ -3219,19 +3219,32 @@ static void __init 
> >>> hugetlb_folio_init_tail_vmemmap(struct folio *folio,
> >>>       enum zone_type zone = folio_zonenum(folio);
> >>>       int nid = folio_nid(folio);
> >>>       struct page *page = folio_page(folio, start_page_number);
> >>> +    struct page template;
> >>>       unsigned long head_pfn = folio_pfn(folio);
> >>>       unsigned long pfn, end_pfn = head_pfn + end_page_number;
> >>>       unsigned int order = huge_page_order(h);
> >>>   +    if (start_page_number >= end_page_number)
> >>> +        return;
> >>> +
> >> Can this actually happen?
> >
> >
> > No, current callers always pass a non-empty range. I kept this to
> > preserve the old for-loop no-op semantics for an empty range, but it is
> > not needed here. I will remove it in v2.
> 
> 
> I need to correct this. A local Sashiko run pointed out that the bootmem
> fallback caller can pass an empty range on SuperH.
> 
> SuperH supports a 64M HugeTLB page size, and with 64K base pages
> pages_per_huge_page(h) is 1024. HUGETLB_VMEMMAP_RESERVE_PAGES is
> PAGE_SIZE / sizeof(struct page), which can also be 1024 or larger on a
> 32-bit SuperH configuration.

If the only difference is unnecessary initialization of the template on SuperH,
we don't care and you can drop that if.
 
> In that case the old for loop is a no-op. So I will keep the empty-range
> check in v2, before creating the seed template.
> 
> Thanks,
> Zhe

-- 
Sincerely yours,
Mike.
