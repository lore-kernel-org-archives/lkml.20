Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1C533F385
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404544; cv=none; b=EVTPR/IzqXeke3gGQR256112iXdGyicFfKnmbO1iKDX87FjXgHszLCOTHv/upJXOxeHzojerWsG4goZDxE9WLyVV//3Qe4fVa6KH1gdhbIm1+EzFXsbraY+XVC6FYw7KiWV5qENWPC5zzczF+hKEOrvgss6W8b+661VSgKtAex0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404544; c=relaxed/simple;
	bh=M3g3YwF1NJZTlh6jbpswmAlwPOEuJxSp8reqh00uYOI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=h0R4WEEnjAaXV/H8O1ZZHeEMjC9ptkcLjpetpi3piyr6WknWvdarQvgCbhrQSYSD9DR7v5gUhc802a2H3ulKF0PnGdwkzyMb8ugBpfkJu/0RUTCIDDHYITwo0v71aYnKUlBUKXIp4wg1zztMQYAxnnNQe29BsN0cYaE1jnaNpok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=t3iiBiFf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="t3iiBiFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487FF1F000E9;
	Thu,  3 Sep 2026 03:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788404541;
	bh=E6fpnYgQzDhI+g8OqpnRixNH2BQW4d1tJxRUcM7JXB8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=t3iiBiFfRRLEbBH6VG0Yzu05L5kwyfurUSxpLlfb2DiO5C+lNRJXCo0xT/W9NQH+y
	 QyKASfWpjDvvvMzQzM5Ji1ORGcIqNRBgLxqEgzCHT47Id1NnnQJ1g7YBfaWfTamDIq
	 47vKTtt86AodzSavp4ePH9BN463gU6ZN6n3amXCI=
Date: Wed, 2 Sep 2026 20:02:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: david@kernel.org, ljs@kernel.org, riel@surriel.com, liam@infradead.org,
 vbabka@kernel.org, harry@kernel.org, jannh@google.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, lance.yang@linux.dev,
 Kiryl Shutsemau <kas@kernel.org>, Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH] mm/page_vma_mapped: guard check_pmd() with
 CONFIG_TRANSPARENT_HUGEPAGE
Message-Id: <20260902200220.408ae7e8a28d3af4e82fd060@linux-foundation.org>
In-Reply-To: <20260624082359.2869-1-richard.weiyang@gmail.com>
References: <20260624082359.2869-1-richard.weiyang@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 Jun 2026 08:23:59 +0000 Wei Yang <richard.weiyang@gmail.com> wrote:

> The kernel test robot reported a build failure on the parisc architecture
> when expanding HPAGE_PMD_NR in check_pmd().
> 
>    mm/page_vma_mapped.c:142:13: note: in expansion of macro 'HPAGE_PMD_NR'
>      if ((pfn + HPAGE_PMD_NR - 1) < pvmw->pfn)
>                 ^~~~~~~~~~~~
> 
> The config [1] in report link shows neither TRANSPARENT_HUGEPAGE nor
> HUGETLB_PAGE is defined. Then trigger the BUILD_BUG.
> 
> Fix it by define check_pmd() under CONFIG_TRANSPARENT_HUGEPAGE.
> 
> [1]: https://download.01.org/0day-ci/archive/20260624/202606240042.ffPsEXVc-lkp@intel.com/config
> 
> Fixes: 2aff7a4755be ("mm: Convert page_vma_mapped_walk to work on PFNs")
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606240042.ffPsEXVc-lkp@intel.com/
>
> ...
>
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -136,6 +136,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>  	return true;
>  }
>  
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  /* Returns true if the two ranges overlap.  Careful to not overflow. */
>  static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
>  {
> @@ -145,6 +146,12 @@ static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
>  		return false;
>  	return true;
>  }
> +#else
> +static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
> +{
> +	return false;
> +}
> +#endif
>  
>  static void step_forward(struct page_vma_mapped_walk *pvmw, unsigned long size)
>  {

lgtm, thanks.

You provoked Sashiko into talking about memory corruption and kernel
panics in page_vma_mapped.c.  Usual stuff.

	https://sashiko.dev/#/patchset/20260624082359.2869-1-richard.weiyang@gmail.com

I'll cc likely suspects but boy do we need a way of being more
organized about this.

