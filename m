Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607E84BF941
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671671; cv=none; b=ci4h5m1JjOFwQJw6PkAzM62tfKxLwgAFuyA+Wt1hRHUnKD2pusV66U8ZT/V4UJ/YuTUieb9/dnc50U0JWt+ZodRiUQuBvB09HKU8ZkGDRww6/XCf5rwcnAghRHUAOg6g2Sn0LA48V66jD/TG9R8oLTAdkjUxD6LWUiV+QNsYdoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671671; c=relaxed/simple;
	bh=pM+/sTNy+DDM1wr2mUIY/Hnt0dTn7L0qOvqekbSvwXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S35RaDeqZiJQY+z3yWkkGjAf64gG4lX/rkb6rnrCbeNql3ysPxmhOJN34ca8+6H+D2JFPN8wjXE22QYCP1+/Gqiz5ul1kU21UfbcHg00wcDolFqpY+TCSBxg8J+DHtPvmESa6dOfbgWJoTJqB7GBiZ+N4YIHGzqpS5lXePwzm2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKK35Bh8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKK35Bh8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6799F1F00893;
	Tue, 29 Sep 2026 08:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671660;
	bh=iXU9WKYyz2HshOVhT6ETdZXfSguTHd4IIQU9aRF/ioU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OKK35Bh8R/0RgBY8cs1ma82GYgIamBoCqyPdGcJ85FQDOijyspUN8TODjqODl7P9S
	 k0fEZTwTCmITfKXU02h0CS4pQ4YFIknAv1EQ/6TDYsjAOn+jgjdskCVy+O362T6Iby
	 LsSndhImXG4OWhp3hDTUpHc08QPULUA6Hl5zr9mPyjKuvyztTwAcNK/DSeuYQHnRCt
	 TRhV12bFfG7viOh7n7iiH932ibV6sxSAEuu0+xzY1blj9rtexUcgJfccnV+0cSqiF6
	 ASnqmAVMei+FLy5MIDpi7PMPzy2gcZ1ouVS0ihtKUTnCX+fKkHullHXqNFAN1EiGkj
	 p7IlWX4BHFRug==
Date: Tue, 29 Sep 2026 09:47:34 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Park Tae-sun <ts930@dgu.ac.kr>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mlock: fix zero-length request normalization and
 integer overflows
Message-ID: <art6x0XpWcT2aUyy@gremlin>
References: <179066531783.50175.13377521828379196177@dgu.ac.kr>
 <3a95d0e5-7969-4b0d-988a-ead62b06b6f5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a95d0e5-7969-4b0d-988a-ead62b06b6f5@kernel.org>

On Tue, Sep 29, 2026 at 10:40:13AM +0200, David Hildenbrand (Arm) wrote:
> On 9/29/26 07:56, Park Tae-sun wrote:
> > mlock() and munlock() currently normalize the requested address range
> > using:
> >
> >     len = PAGE_ALIGN(len + offset_in_page(start));
> >     start &= PAGE_MASK;
> >
> > This performs multiple arithmetic operations on user-provided values
> > without validating intermediate overflows.
> >
> > First, a zero-length request with an unaligned address is incorrectly
> > converted into a non-zero page range. Because
> > PAGE_ALIGN(offset_in_page(start)) rounds any non-zero offset up to a
> > full page, a request such as mlock(0x1005, 0) falsely locks an entire
> > 4KB page (or fails with ENOMEM if unmapped), and munlock(0x1005, 0)
> > silently unlocks memory that should remain locked. Conversely, an
> > aligned mlock(0x1000, 0) is a no-op. Zero-length behavior should be a
> > consistent no-op regardless of address alignment.
> >
> > Second, a sufficiently large length wraps around to zero during page
> > alignment (e.g., len = ULONG_MAX). Because PAGE_ALIGN(x) is defined as:
> >
> >     (((x) + PAGE_SIZE - 1) & PAGE_MASK)
> >
> > when len is close to ULONG_MAX, adding (PAGE_SIZE - 1) wraps around:
> > on a 64-bit system with 4KB pages, ULONG_MAX + 4095 wraps to 4094, and
> > masking with PAGE_MASK clears the lower 12 bits, producing 0.
> > When len becomes 0, the subsequent check in apply_vma_lock_flags():
> >
> >     end = start + len;
> >     if (end == start)
> >         return 0;
> >
> > evaluates to true and immediately returns 0 (success) without locking or
> > unlocking the requested memory range. Similar wrap-around issues have
> > previously been addressed in mincore() and madvise() by checking for
> > zero length after PAGE_ALIGN().
> >
> > Finally, address addition overflow (start + len < start) is currently
> > detected only inside apply_vma_lock_flags(), after mmap_write_lock has
> > already been acquired and memlock rlimits checked, improperly returning
> > -ENOMEM instead of -EINVAL. Per POSIX.1-2024 and man 2 mlock, arithmetic
> > overflow of the requested range represents an invalid argument and must
> > fail with -EINVAL before modifying VMAs or acquiring locks. Note that
> > apply_vma_lock_flags() already contains:
> >
> >     if (end < start)
> >         return -EINVAL;
> >
> > but this was obscured because rlimit accounting preceded it.
> >
> > Introduce a common check_mlock_range() helper to:
> > 1. Return 0 immediately for zero-length requests without taking mmap_lock.
> > 2. Validate intermediate and final arithmetic additions using
> >    check_add_overflow().
> > 3. Reject lengths that wrap to zero under PAGE_ALIGN() with -EINVAL.
> > 4. Detect start + len address overflow before taking mmap_write_lock.
> >
> > Signed-off-by: Park Tae-sun <ts930@dgu.ac.kr>
> > ---
> >  mm/mlock.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 47 insertions(+), 8 deletions(-)
>
> You call it "fix" but then I see no Fixes: tag.

Or an Assisted-by tag :)

>
> Which of the problems described above have reproducers (IOW can be triggered)
> and what is the user-visible problem?

Good question!

Also note that the code is just horrible - 2 output parameters into a function
called 'check' but mutates all of its input, deref of the input parameters
throughout the function, useless comments, etc.

This patch is not upstreamable, and if it's LLM-generated I'd rather that
somebody from the core team did the work if we wanted it.

In general, I think it might be helpful to have a general 'check for overflow
stuff' function that various syscalls could use, but I'd want to see that
developed by an experienced mm person.

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
