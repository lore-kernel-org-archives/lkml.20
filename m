Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16B44DF4DC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961454; cv=none; b=rcWZsHhMP0P5PvCD1VqJRVRfqlaYUpn4TrJe6vBa8qsLzm+P9TbpqyWY9UPqvwKxcERzomiHJAE64MUsnhKH9O/K/AX4AqY7qOm8iSapQ694ZeALYd6On3BD7mXfZXqFVAHKK+ooaW9yVk0EZOod0/DlVPukwwscVPwIeCHNw34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961454; c=relaxed/simple;
	bh=pjd2LsReLyjFfFpYBZp5GX3HanSlfTjVjEQaO8NrO8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2Yc7CQ6C4JbEv6y1W4J55uhGc1OZ605al/K//Pr5FzmCIe35nBexW9eJso3Cq3TXyd//pr5B07VHmlyuGSfWwFzj/wOk5Y4qnNE7O0qbulP8PI6HM8biKCaiIUKTL/bIeSLoHQ0Ceb0C4eVJ+s7x9PGy73DORmcw/jDfSZAJoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4ZfLeGj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4ZfLeGj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB7F1F00A3A;
	Wed,  9 Sep 2026 13:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788961452;
	bh=fyGxRWWGY/QF48JwkFPc6wv4PEQdRhMGY+73An7lRDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D4ZfLeGjXjLDlMxccI5WKcMqoRn8z0Bqgfi0rV7gUl7oT2SmzTJT6btCL9BfeeXTl
	 KiqHLYruo4SHrnOuqlNN5NtdsZmdgmka0pWd7wZVKknvOx+jU3vBnIeA57rFTYK4bi
	 Jn3TMukKTixqersG7kwJH9mHdFztiNO2s2Y2vWXauuIcwbwiiKcaBXsBx3WH0Q2aqY
	 reGzLdTVRlAKTRazN5kQgqAZMRgw5pcdjI5pH7L5hIY9tNj0Qzr2sD1d7C9oPKcJjZ
	 24ml2xc4FYzp+en8rxvGW936mcEc+m9XYZNly3nn4YJm0wnEPYEpTP2bKqYfRl8Cyi
	 0MblVN0gCkk1w==
Date: Wed, 9 Sep 2026 14:44:06 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	pfalcato@suse.de, willy@infradead.org, lance.yang@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: bypass datarace check
Message-ID: <aqFWqqvUEiie8cYq@gremlin>
References: <20260909115723.528501-1-trintaeoitogc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909115723.528501-1-trintaeoitogc@gmail.com>

I started review below but honestly this patch is confused in multiple ways
and it's not entirely clear you really understand what's going on here.

It's also basically implementing what we suggested.

So at this point I think it's easier if I send the patch with a:

Reported-by:
Closes:

tag -> you, this patch.

Thanks!

On Wed, Sep 09, 2026 at 08:57:23AM -0300, Guilherme Giacomo Simoes wrote:
> Despiste kcsan point to a possible race condition problem, this is a

Typos  -> Despite, point -> points

> safe race condition due the access memory ordering, since
> spin_lock(&mm->page_table_lock) have ACQUIRE semantics and ensure the
> ordering mapping.

This sentence is a bit confused. Acquire semantics mean absolutely nothing
unless paired with another operation and etc. etc.

>
> Create a new function called vma_is_faulted(), that return a
> data_race(vma->anon_vma) to bypass kcsan

This sentence reads incomplete? Or missing full stop?

>

Needs a:

Suggested-by: Pedro Falcato <pfalcato@suse.de>

Also:

Assisted-by: LLM?

The list below reads very LLM-ish so I have to ask did you use one etc. etc.

https://docs.kernel.org/process/coding-assistants.html

Perhaps given I am suggesting a lot here a:


> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> ---
>  mm/memory.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 6b8280cfc1db..d85d67927400 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3800,6 +3800,25 @@ static inline vm_fault_t vmf_can_call_fault(const struct vm_fault *vmf)
>  	return VM_FAULT_RETRY;
>  }
>
> +/**
> + * vma_is_faulted - check if a vma has been faulted

Would rather 'has @vma been faulted in?'

> + * @vma: the vma to check
> + *
> + * This is a lockless access that may race with __anon_vma_prepare().

This doesn't belong here. In fact it doesn't belong at all IMO.

> + * The race is safe because:

There isn't a race at all it's KCSAN getting confused because it can't prove
that there isn't.

> + * - The fault handler ensures that the mapping of memory is ordered.

What has that got to do with this function?

> + * - If we read NULL, the caller will re-check

Umm, no? This function doesn't force callers to re-check?

> + * - The page_table_lock provides ACQUIRE semantics for memory ordering

I'm not sure how this relates to anything but again this doesn't really belong
here.

Anyway let's drop all of this please.


> + *
> + * Return: true if vma->anon_vma is non-NULL, false otherwise

This is completely breaking the abstraction.

'true if the VMA is faulted in, otherwise false.'

> + */
> +static inline bool vma_is_faulted(const struct vm_area_struct *vma)

Why in memory.c and why inline if it's in a .c file? This belongs in mm.h with other such helpers.

> +{
> +	/* Lockless check - safe because we re-validate under page_table_lock */

You don't need a comment saying accessing a field esp. with data_race() is
lockless, that's implied...

Maybe:

	/* Benign, see __anon_vma_prepare(). */

> +	return data_race(vma->anon_vma);
> +}
> +
> +
>  /**
>   * __vmf_anon_prepare - Prepare to handle an anonymous fault.
>   * @vmf: The vm_fault descriptor passed from the fault handler.
> @@ -3819,8 +3838,7 @@ vm_fault_t __vmf_anon_prepare(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	vm_fault_t ret = 0;
> -
> -	if (likely(vma->anon_vma))
> +	if (likely(vma_is_faulted(vma)))
>  		return 0;

There are other places where this check is done and etc.

>  	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
>  		if (!mmap_read_trylock(vma->vm_mm))
> --
> 2.52.0
>

--
Cheers, Lorenzo
