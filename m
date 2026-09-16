Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B000B388E4F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571331; cv=none; b=f9xBkkvriEEYnzp2BsrWB8AJ6LwKrQ7QRJ8G3ishU4GKfIrQTKSCxtgXBHuwZD5sKkMrQ+fIM4qnAC8vVi61CdEAdKNvDtj/HQJtp5uUkMn/uVz8XTHF++D5LbWbFIOMbnPsUM72hWDly+H06ft3hq9yaiw1uj3M4ZEYV9ibNu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571331; c=relaxed/simple;
	bh=EU1wGW5kYXS5Qr64aAYS03FVgemLX7OIwiHQgBJzHi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVbdy/WAWZZYb+p1fDJ16+0xpO5800HOj8KiLaw2ScJnCJMUcwmFk1z8ll40XJrMOxz0x4+80YyH8f6cbLvPYeRzivBgb7zUuFGoWZrz5mePp2bV72B3hEAKJ+3x7uwKnEjWNeZAbuGgw4EDinCdY1DQDnkR7LyWvMz1Byr2G48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLEvfqMR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLEvfqMR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F181F000FF;
	Wed, 16 Sep 2026 15:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789571329;
	bh=7+I7hNy+4kK9tMqj+kRN/8nDK6B8RgoQtAKL5I3vRGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lLEvfqMR3ZsDVZwCPcLV0izH5/qstHEwp+RJHHg5rFLbCEQLg7oVdbq3ZONQ5s6yi
	 k2hndoZKeFVSBhGDdon/PMKTmH3NFL5hDOae3Gmet4poM8R6d+5SnQpDEoxu0yA5Zv
	 s2QwPpbRAnUlHezMI3YHC0y7+2Y0L6hbigeAtMiAnHdaxnqRFfapDmadhgVfvl7P4q
	 K1wjyQlf15r+3XOoG7zijYbl87oH+ZtdityI5lJh78/yZpJCs7QpFYCB5RVWdvqW+Y
	 gCiB718gOMRTz0Ge0RI0NSbhuG2CgXEbDu4UyxogHl/zX4zr62lCgNQoN6mrcWt/tE
	 Ej0+PUtbehQmA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.ams.internal (Postfix) with ESMTP id A336F198003A;
	Wed, 16 Sep 2026 11:08:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 16 Sep 2026 11:08:45 -0400
X-ME-Sender: <xms:-LCqajJtiVA2x1HPugDA4ckv9P87Y6ni5x3QWwO0R1HxzWMxtDaVPQ>
    <xme:-LCqapcAGXUrrwJAcpkCDcUGhnQssFkEJC5JJXxakmgFstXVYHAW9i4hTzddcksJY
    xd3pUAn1MXJzRE5D_h0Y7zYD6mHOJeW0hmHDxkN3ZfvLW45jeiaCP2p>
X-ME-Received: <xmr:-LCqaqcRDPz-XcFfEI9si2wyLLJog4Vh8UCipx0VkzNKONEb_bltCyCnsis>
X-ME-Proxy-Cause: dmFkZTGNu7teyML3OQg3qsqO2WA9eCURw0xRlFHSQT+DETOsBOoIx43sCQ/Xg4nRRLC2F3
    Zuc4psmCspFLVlpyyXeIX3yCdBTLJgiPRq6ghP5O8aJeW8x+TZEDqJAvkQgvRh8ZyaMvVN
    oX5TATzoSczQAODwP/lDwRtC2BHo7X71A/Uz5wXXnizWrHPoyShkFMF5Mm/f0jxDfriHbX
    124tslR5DdVqmQka4LrEVl798EH+lwXeYKtp+GRwVH4cjkaGG7xe75Q0ns64Txujgy8zMF
    pVVqyNx1edVeZYYPIG6pcnL+AM/oA347Qth5LMgrUouGmPQaYga+OLqH+GCejgS7BXlSLF
    VRGh4tb9eOg+DIxEFR43Uiy+Lq5HJCoF5voaDQBc5+SZnSML6Cp2Uz+KuxMbwibglEwgex
    vbRiXfbSUmFhRlaknTLyjzGMg2T0sqmOFm2uHWMIX3OzYnsc1Cyrc0MCoBDdgku3NUMC/k
    kwlZ1WYT42XF7tlnnUWXEBONz24JwxeEKYUGHJMYZJnt56l3LuNVdLTa3mD4J0d0EpPWCT
    GCY2wM8Fcan/3TJ94WVA4ontfGhkFtpIEXlPY8pNW/SXhf/aBp4n5I5QWL7ix08jB5Tmzd
    THSy+1to/QCBt3wdznz5gxq2FTr/y+5AgYPc/EwE669HEHwOYERClaUqsGdA
X-ME-Proxy: <xmx:-LCqamn6gkriNRIIy0XTEIbNY89XxX4VmJIMyOVdjVZ9A86ueuf1-g>
    <xmx:-LCqas8vFhaAmMwah0WjeGhGlkwLlY2fOekTksjHhlndE82_DlyiHQ>
    <xmx:-LCqappnuOXGPSL_XOTDPP9QdwePEGP_q6ju5BhM2GxhS79JSlztiw>
    <xmx:-LCqaqKLlCQs4_WPcnCsTRidkx4rFX5jCoEvRQlRD2trs7MduG0bOg>
    <xmx:-LCqas51xIfKNv6mkvL2MMyRSUV5sLZRm5_gvZlqAmRL_MsqXuAAx9_i>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Sep 2026 11:08:39 -0400 (EDT)
Date: Wed, 16 Sep 2026 16:08:38 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	chrisl@kernel.org, kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, 
	linux-mm@kvack.org, ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>, 
	willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org, riel@surriel.com, 
	shakeel.butt@linux.dev, alex@ghiti.fr, baohua@kernel.org, dev.jain@arm.com, 
	baolin.wang@linux.alibaba.com, Nico Pache <nico.pache@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>, 
	lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com, 
	shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev, luizcap@redhat.com, 
	kernel-team@meta.com
Subject: Re: [RESEND v7 11/29] mm: split PMD swap entries into PTE swap
 entries
Message-ID: <aqqwFOoPxqFnxclE@thinkstation>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-12-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914122950.3283997-12-usama.arif@linux.dev>

On Mon, Sep 14, 2026 at 05:28:01AM -0700, Usama Arif wrote:
> Once a PMD can hold a swap entry, everything that splits a PMD - mprotect()
> or munmap() over part of the range, MADV_FREE, a pagewalk with no PMD
> handler - has to be able to split that entry too, or the callers that rely
> on split_huge_pmd() to hand them a PTE table would find the PMD unchanged.
> 
> No reference counting is needed: a swap entry pins no folio, and swap_map
> is already one per slot, so the PTEs simply take over what the PMD held.
> 
> The migration-only entry point cannot reach the new branch, because
> page_vma_mapped_walk() never hands back a swap PMD for the folio being
> migrated. Warn if that ever changes, and force the regular split anyway,
> since the branch leaves folio and page uninitialised.
> 
> Test the pre-split old_pmd rather than re-reading *pmd in the trailing
> folio_remove_rmap_pmd() gate, so every entry-type test in the function
> interrogates the same snapshot. That part is cosmetic: pmdp_invalidate()
> leaves the PMD present as far as software is concerned.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  mm/huge_memory.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 873887aed0bc2..0e347a545588c 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3304,6 +3304,21 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
>  						 vma, haddr, rmap_flags);
>  		}
> +	} else if (pmd_is_swap_entry(*pmd)) {
> +		/*
> +		 * A PMD swap entry has no page, so it cannot be turned into
> +		 * PTE migration entries.  page_vma_mapped_walk() never hands
> +		 * one back for the folio being migrated, so this should not
> +		 * happen; warn, but also force the regular split so that a
> +		 * broken invariant cannot make the code below dereference the
> +		 * uninitialised folio and page.
> +		 */

The comment can be shorter.

> +		VM_WARN_ON_ONCE(use_migration_entries);
> +		use_migration_entries = false;
> +		old_pmd = *pmd;
> +		soft_dirty = pmd_swp_soft_dirty(old_pmd);
> +		uffd_wp = pmd_swp_uffd(old_pmd);
> +		anon_exclusive = pmd_swp_exclusive(old_pmd);

The logic looks right to me, but __split_huge_pmd_locked() is getting
awkward. It is close to 300 lines with two if-else chains that have to
be kept in sync.

Can we have a preparatory patch that moves the PTE-install loops into
per-type helpers?

split_pmd_into_migration_ptes(), split_pmd_into_device_private_ptes(),
split_pmd_into_present_ptes().

Each is a plain loop with set_pte_at() or set_ptes(), so it is pure
code motion.

This patch would then add split_pmd_into_swap_ptes(), which visibly
takes no page or folio, and the comment goes away.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
