Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5906048E0DB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809829; cv=none; b=o1/7M2u7iUoIZK5pMrrL0HG3LTeYIZL2d3WV+DwGpGWQoyiFZcSrA/f++bS2qhB/EGAn3aFCJU4FlUBUWJH0SGgjjQn6qtd9CGeDPlZroiX+eBGujkl6oos7o76B3LDsVwhew82t6wXjddoAkuD2x0tBb4+gFppRiBRaLdyW4Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809829; c=relaxed/simple;
	bh=SBjN5CEkhLAEsLZMVa3/XFuBmU6ol734B995e4JYmG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2F9QItQlMfqqbsWcVcyhJ3mzCtY3ArmzbigEb4bzEZ3/Z5zFlH90ARh8HKVvbGPDQuiThlrhTmpcPojvf1oFmhG3nJjT9s46zgtEnQx7pORXNWrBjs6GrTcf6DrBN9+du65BbqJc7lPqI2Iuf7hoHMko+zfIsJqxXzCuGEs0cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJFALB2J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJFALB2J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D7D1F0089B;
	Mon, 12 Oct 2026 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791809827;
	bh=cniybAFPuYmkywYYtlFXNwkUQYMBMbCpGkul4BT0ctk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jJFALB2JergrfKltKzSDa4LndCsJ4Ai2YPpCcn2cRk+4Jv/zcP0vM5K7s8F3bxlzs
	 BG7j65wRaEqUbyBlnt9u6v1yfXxWy76eKajJttqPPNp5x0Jlfqxu+jUF4aoGm89i/4
	 tlxsiSbXgjE3dQ+JcvHtHMbFqvf7mAIg9hTlaxk1kmk7EoIs/+cJQeEXakAakKYYQV
	 3YDOiIcS5l8F7hRsmoADhnzUk6WjmbnUz4k2vorqyLpB/MT+6YQm/b4GYDJ7uSylAe
	 KFJfcn70bOLzakvPy8Zup3p8RpB6qiD73dpgyz8U2Q5u6vV0MaxrgNr9dxgvxYTumg
	 vuOiMiu8xjmkw==
Date: Mon, 12 Oct 2026 13:57:02 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: albin_yang@163.com, akpm@linux-foundation.org, liam@infradead.org, 
	vbabka@kernel.org, jannh@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, albinwyang@tencent.com
Subject: Re: [PATCH] mm/madvise: add cond_resched() in THP branch of
 madvise_cold_or_pageout_pte_range()
Message-ID: <aszYQpnRikFRuSYN@gremlin>
References: <20261010024042.4070048-1-albin_yang@163.com>
 <bd78c58a-f266-40bd-9290-90f77b8e4225@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd78c58a-f266-40bd-9290-90f77b8e4225@kernel.org>

On Mon, Oct 12, 2026 at 01:02:59PM +0200, David Hildenbrand (Arm) wrote:
> On 10/10/26 04:40, albin_yang@163.com wrote:
> > From: Wei Yang <albinwyang@tencent.com>
> >
> > During stress testing with stress-ng on a 256-CPU system, a softlockup
> > was observed when madvise(MADV_COLD) was called on a 31GB memory region
> > backed by transparent hugepages. The region contains 15935 THP PMD
> > entries, and the softlockup was triggered after 14485 of them had been
> > processed.
> >
> > The THP branch of madvise_cold_or_pageout_pte_range() has no scheduling
> > point. walk_pmd_range() invokes it once per 2MB PMD entry with no
> > cond_resched() anywhere in the loop. Each iteration calls
> > pmdp_invalidate() which issues a synchronous TLB shootdown (dsb ish)
> > waiting for all CPUs to acknowledge. This operation can be
> > time-consuming under heavy system load, causing the accumulated time
> > across all PMD entries to exceed the softlockup threshold (20s) and
> > panic when softlockup_panic=1. On a CONFIG_PREEMPT_NONE=y kernel, there
> > is no other opportunity to reschedule during this entire traversal.
> >
> > The regular PTE path already has an unconditional cond_resched() at the
> > function tail (introduced by commit 9c276cc65a58 ("mm: introduce
> > MADV_COLD") and commit 1a4e58cce84e ("mm: introduce MADV_PAGEOUT") when
> > MADV_COLD and MADV_PAGEOUT were first introduced) and a conditional one
> > inside the loop (commit b2f557a21bc8 ("mm/madvise: add cond_resched()
> > in madvise_cold_or_pageout_pte_range()")). The THP branch never
> > received equivalent treatment.
>
> That's quite a text to say "Do it just like the PTE case" ;)

Yeah would it be possible to cut down these giant paragraphs please?

Maybe:

	Running stress-ng on a 256-CPU system resulted in softlockups when
	madvise(MADV_COLD) was called over a 31 GiB THP-populated memory
	region with CONFIG_PREEMPT_NONE set.

	This is a result of a missing cond_resched() in the THP PMD path in
	madvise_cold_or_pageout_pte_range(), so fix the issue by doing the
	same thing the PTE path does by adding the missing cond_resched().

>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

The logic LGTM though, so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

--
Cheers, Lorenzo
