Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F2052D2B1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569128; cv=none; b=nw2Rgx2G84r914Xhi75oTXVVp+98QZz94mNQ1koNBMlnnTtjxhrzMC94XehsKZqcut8BpOUKKmT/VW5mUQud3ZFF/VUR4M4ZnrUQ3bPwy2pXA3jTCvyU1FRnQ0JfkcT+Z7T2H91BbE9ADSh28iXHpOyFDz6MGLdJauA5w2RgdoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569128; c=relaxed/simple;
	bh=yrPiTNlJ7MPh2KBWSQnKxG0t2JqFACjFav/f7S7X44M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BD/bVi5xDWuQlyOBzOhjpHdwmXJOUkuec1R1q/B2iyqPCNCo+41QBmPoLyR+UXK276Ch3VTXsucH/g/yePKYBWriXhMT4blKVQm+N/awycavmz90ABT5aS5CEU8d1Z6VdWNv1fLY+LkyDUCii2nggs7PmmpG3KxgA9fEbNqCeyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCPRMzWJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCPRMzWJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFB31F00899;
	Wed, 16 Sep 2026 14:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789569127;
	bh=toEfAtNTSCi6v7AFYUgan7Rp32DShnv+mc9L1+Ghc3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LCPRMzWJ/NWuFCvlYbp9fu9dpZ+jzWk+lbBHyWTjg7AwYW+eWUaNBx+uZ+5iWQ+Xo
	 COHF0vmw/YeKMh6uVtligUjKLdcKBHqZZU+ogyJcRW7rpmF30v1Qh4GHB5evBwPR0m
	 ZTi4mgzPVfhZKzh5XNuA20tJoZr+LGpVW0Q71jT056T9RLBvSBptFuhiXy88MzLYc9
	 U2cEFsZfRIRaK1LRJl9fJnwoiWwlqwrcPqYSYKjsJCrzu7iIgzUM661eDmoizBDxQ6
	 tQ5cf8GiudQqY5KNNXXrxkbBoWyF1s4suBoj1tYoIlxFZRo3r2pQTbCsWxuoagv+jm
	 WxJNxBTsPg+kA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4AD10198003A;
	Wed, 16 Sep 2026 10:31:57 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 16 Sep 2026 10:32:02 -0400
X-ME-Sender: <xms:XKiqatVrP5NjFLE14exw2HCKcd8ivy3OMn_LcvTJVw7I2trgbVhPTQ>
    <xme:XKiqaptgrS5HOfGqXcR2Lxh8AqfLBdsTKOfIB4mDitWw4H-b8oRPKAmFkNmI6hJ1W
    0vIGvq6PPRnw8mFJvoD8un8NalqZwDQ9oWiAe6K5oYqGvrqPjf8Qx-G>
X-ME-Received: <xmr:XKiqau1Cle4WA5b9ilu5H73xkHcQg2hPa4AWn6UKWnTvODDI7CSHCOD047E>
X-ME-Proxy-Cause: dmFkZTF99NFrR82aIECAW5OBHrGwVmZAMtD74VKURny8UJoYq8M0BJEjrBTqfFpNpD8/qE
    uGGlqyyDID6yOaQeYYBEHofduBLpuKjMKK2D4TXCGz963FqqLaN+E4CuJOsElHOMBbdNZf
    5cyIzOkgDGtYXoQUhN45GNwthNSqRw6Nk/w1120YFMZ7ggc0mb8ZrkjFIlCaYSvpKPqbfp
    CZrscCpBFKSB8hTMD+8GjmWSxJ0Lvg6vzUOlHh0FcXkaRfY4ezOKWayLVQSZAuFDCPfcbw
    uPHlCVexc95yimxNGMGlrOXRnyIZ/k1Cxi3XiI7yI3utJTQAfO8bYeYVZQeOcvj6x3PKIz
    yT1L23tW1kNbpAyg5tjy1HdJ45rsCYurlWuSuMT2MeKejKsACSjUymm8LyyfkrjEiihm2c
    L/yysWg+hL4coVRc2L5i/4DRwODPdgWGcM9eH2SFVWxT6FO41m3bb1QHdlD9+OV+4MzrmQ
    1LBuysI/CFwkcSaUi68AvVkBDf9ZUGtbZUs2gixPiVG2NNISuhj1O8YPH59V+jdvbwruTt
    IfV+Pc5SKiTiC/nxDNOYFEuAo7kkZtE3C3Q2aKc4jzfg6fj+kKQnWr+Kb2noErirPr+jNI
    vHrdC5Q8SUOO5v3EpfjnGLg4ZfOiU6a/ogGsDpw2XEvmM4quFBQhWXWT7X8g
X-ME-Proxy: <xmx:XKiqavlZFCj6RwKtTqUjT3CrLwAbMWazTUoq5f246--QEsK7o1kvlg>
    <xmx:XKiqavT6AaJAk0QPXGNnAFKjR38ip3GWsE6RAI3MkZwNOpAMGPCvSw>
    <xmx:XKiqahomghJ60egyyrRNevqmYG2zvPmuKydnURm33ziAkuQjbwHwUw>
    <xmx:XKiqapBAJm4CV50HQgmd9O3mM1YY-33big0Eg8jN8OSsyfwQXNfgXg>
    <xmx:XKiqah1YYCJuRJne2FPhCiHpitCkOkxsGX_VP-kvUC7V1Dx0G2jMqkIR>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Sep 2026 10:31:55 -0400 (EDT)
Date: Wed, 16 Sep 2026 15:31:54 +0100
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
	kernel-team@meta.com, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Subject: Re: [RESEND v7 07/29] x86: mm: add PMD swap-exclusive helpers
Message-ID: <aqqmClGl0lt5Qzee@thinkstation>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-8-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914122950.3283997-8-usama.arif@linux.dev>

On Mon, Sep 14, 2026 at 05:27:57AM -0700, Usama Arif wrote:
> A later patch keeps a PMD-mapped anonymous THP mapped by a PMD across the
> swap round-trip, so PG_anon_exclusive now has to survive in a swap PMD and
> not just in a swap PTE.
> 
> x86-64 encodes a swap PMD exactly like a swap PTE, so the new helpers reuse
> _PAGE_SWP_EXCLUSIVE, bit 3, which the swap-entry layout already reserves
> for PG_anon_exclusive. 32-bit x86 aliases that bit to _PAGE_PSE and does
> not select ARCH_HAS_PMD_SOFTLEAVES.
> 
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  arch/x86/include/asm/pgtable.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index d551120a7c889..a2d1cd03cba23 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1525,6 +1525,23 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>  	return pte_clear_flags(pte, _PAGE_SWP_EXCLUSIVE);
>  }
>  
> +#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
> +static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
> +{
> +	return pmd_set_flags(pmd, _PAGE_SWP_EXCLUSIVE);
> +}
> +
> +static inline bool pmd_swp_exclusive(pmd_t pmd)
> +{
> +	return pmd_flags(pmd) & _PAGE_SWP_EXCLUSIVE;
> +}
> +
> +static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
> +{
> +	return pmd_clear_flags(pmd, _PAGE_SWP_EXCLUSIVE);
> +}
> +#endif
> +

I was about to comment that it is broken on 32-bit as
_PAGE_SWP_EXCLUSIVE there is _PAGE_PSE which would make exclusive swap
entries pmd_present(). But CONFIG_ARCH_HAS_PMD_SOFTLEAVES is only
selected for X86_64.

Do we want some BUILD_BUG_ON() to catch if anyone would try to enable
it for 32-bit machines?

Otherwise:

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

>  #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
>  static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
>  {
> -- 
> 2.53.0-Meta
> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
