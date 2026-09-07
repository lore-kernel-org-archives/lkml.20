Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9415142122A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767606; cv=none; b=tnlUZTfwGK26BskoWxnq52vaULoWJEGecYKFri1B3nNHkDyekSl3worj7GcwFiJFXdBnkcAeclzug3aBqNZFSg1uu/JaG1lsbbuVFReYecR/8K/HwlmGW7OHqcqcsd3AMaN8gCu8IYxvZ7o/ZTO0xZ90FcyAPxi/lo79kdOmYv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767606; c=relaxed/simple;
	bh=y3iEmSm0buYgP7VyUyIki/kASSHbMYn7aeK99WmvvQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrW+5fxdWKsWiAQpitHfntPDnb0Q0orb+yEfbQ4IwNRPVbtOako2PuHZJj2gNFxL3fWe/GYASCIUbb2RY/2sLLhcCTD8hZn2bMvAnLjytzF12k4xxO3nHYb3cMKoOKyoHoOsMYWHKXLI8fHTFJh2cUeShY1uAhn9yrgNsE/gLN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOcXGWgd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOcXGWgd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7821F00A3A;
	Mon,  7 Sep 2026 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788767605;
	bh=kPZ1F3J8KBi9MBahvagaR9ROmfUoSVBBVkLS8cERORw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MOcXGWgdidzTr8uSm3nVezqHIcr1nc28xnbSu6ByjN1peFiglJMoQ7TMIxM1rAuTo
	 +LlTSFr+sxJbGh23IWkyDELK3sIkYklSEX408UnsFuy9KFMnoN42sFcRJvzJ81RUZv
	 UH6SeeXYOqAk+dQLWuIXR7TZ2mGz9gbS6JMchxSKBC7mEGIWpb3InoZVHJ3ELsAuDd
	 66jalnuy7h0pOV2+WXP+Q97rTsRn2tzkmOQaABQkCzIqMMWqDSRO9ml93GCdfaK7y6
	 1gbsdCpfJaQ+C8zd9OdbBb+T33wq6Gz0pEhqAKaqjg0eAo5vPuC+iOVgOIaLEVm+gc
	 2JhtpdNdvGt7g==
Date: Mon, 7 Sep 2026 08:53:20 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Tianyi Chen <hi@tychen.cc>
Cc: "Liam R . Howlett" <liam@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/testing/vma: cover hole filling through
 __mmap_region()
Message-ID: <ap5pmX-RddQ-c90O@gremlin>
References: <20260906144100.849288-1-hi@tychen.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906144100.849288-1-hi@tychen.cc>

On Sun, Sep 06, 2026 at 10:41:00PM +0800, Tianyi Chen wrote:
> The mmap tests extend existing mappings one neighbor at a time, while
> merge tests construct merge state directly. Neither exercises filling
> a hole between compatible mappings through the mmap setup and completion
> path.
>
> Fill a gap through __mmap_region() and require both neighbors to merge
> into one VMA. Repeat with only the new mapping's execute permission set
> and require three separate VMAs. Check boundaries, permissions, page
> offsets, map_count and tree lookups across the mapped pages.
>
> The full VMA test suite passes all 28 tests with ASan and UBSan enabled.
>
> Assisted-by: LLM

Thanks for adding the tag, always much appreciated!

I may actually set my own LLM loose on these tests to expand some more. Is
a good area for such work I think.

Though it still needs massaging to get good code :)

> Signed-off-by: Tianyi Chen <hi@tychen.cc>

General idea seems reasonable to me, and never any harm in adding more
tests :)

A bunch of stuff to fix below, but with those addressed patch should be
good.

Also please rebase this on the mm-unstable branch of Andrew's tree:

https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/

As there is a minor conflict with my upcoming work :)

> ---
>  tools/testing/vma/tests/mmap.c | 75 ++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>
> diff --git a/tools/testing/vma/tests/mmap.c b/tools/testing/vma/tests/mmap.c
> index c85bc000d1c..b66ec932a75 100644
> --- a/tools/testing/vma/tests/mmap.c
> +++ b/tools/testing/vma/tests/mmap.c
> @@ -45,7 +45,82 @@ static bool test_mmap_region_basic(void)
>  	return true;
>  }
>
> +static bool mmap_region_fill_hole(bool merge)
> +{
> +	const vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
> +			VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT, VMA_MAYEXEC_BIT);
> +	vma_flags_t hole_flags = vma_flags;

Hole is the wrong word, maybe 'middle_flags'?

> +	struct mm_struct mm = {};
> +	struct vm_area_struct *vma;
> +	unsigned long addr;
> +	int count = 0;
> +	VMA_ITERATOR(vmi, &mm, 0);
> +
> +	current->mm = &mm;
> +	if (!merge)
> +		vma_flags_set(&hole_flags, VMA_EXEC_BIT);
> +
> +	/* Leave a hole between two otherwise mergeable mappings. */
> +	addr = __mmap_region(NULL, 0x300000, 0x3000, vma_flags, 0x300, NULL);
> +	ASSERT_EQ(addr, 0x300000);
> +	addr = __mmap_region(NULL, 0x306000, 0x3000, vma_flags, 0x306, NULL);
> +	ASSERT_EQ(addr, 0x306000);
> +	ASSERT_EQ(mm.map_count, 2);

Everything here is reasonable but can you please add comments like other tests
like:

	/* Map at 0x306000, length 0x3000. */

etc.

> +	vma_iter_set(&vmi, 0x303000);
> +	ASSERT_EQ(vma_iter_load(&vmi), NULL);
> +	vma_iter_set(&vmi, 0x305fff);
> +	ASSERT_EQ(vma_iter_load(&vmi), NULL);

Let's drop these 4 lines they're a bit useless I think.

> +
> +	/* A single flag difference must prevent merging with either neighbor. */

Similar to above re: comment.

Also worth saying

> +	addr = __mmap_region(NULL, 0x303000, 0x3000, hole_flags, 0x303, NULL);
> +	ASSERT_EQ(addr, 0x303000);
> +	ASSERT_EQ(mm.map_count, merge ? 1 : 3);
> +
> +	vma_iter_set(&vmi, 0);
> +	for_each_vma(vmi, vma) {
> +		unsigned long start = 0x300000 + count * 0x3000;
> +		unsigned long end = merge ? 0x309000 : start + 0x3000;

NIT: Can we make these const please?

> +		VMA_ITERATOR(lookup, &mm, start);
> +
> +		ASSERT_EQ(vma->vm_start, start);
> +		ASSERT_EQ(vma->vm_end, end);
> +		ASSERT_EQ(vma_start_pgoff(vma), start >> PAGE_SHIFT);
> +		ASSERT_EQ(vma_start_anon_pgoff(vma), start >> PAGE_SHIFT);

Newline here maybe as basic stuff above.

> +		ASSERT_TRUE(vma_test_all(vma, VMA_READ_BIT, VMA_WRITE_BIT,
> +					VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT,
> +					VMA_MAYEXEC_BIT));
> +		ASSERT_EQ(vma_test(vma, VMA_EXEC_BIT), !merge && count == 1);

Also can we separate out the !merge && count bit? So put this at the start
of the for_each_vma() block:

	/* If testing the non-merge case, middle VMA will be set VMA_EXEC. */
	const bool is_middle_vma = count == 1;
	const expect_exec_vma = is_middle_vma && !merge;

Then here:

	ASSERT_EQ(vma_test(vma, VMA_EXEC_BIT), expect_exec_vma);

Also a newline here would be nice.

> +		for (addr = start; addr < end; addr += PAGE_SIZE) {
> +			vma_iter_set(&lookup, addr);
> +			ASSERT_EQ(vma_iter_load(&lookup), vma);
> +			vma_iter_set(&lookup, addr + PAGE_SIZE - 1);
> +			ASSERT_EQ(vma_iter_load(&lookup), vma);
> +		}

Let's drop this entire block please I don't think it's achieving anything
useful.

> +		count++;
> +	}

Newline here please.

> +	ASSERT_EQ(count, mm.map_count);
> +	vma_iter_set(&vmi, 0x2fffff);
> +	ASSERT_EQ(vma_iter_load(&vmi), NULL);
> +	vma_iter_set(&vmi, 0x309000);
> +	ASSERT_EQ(vma_iter_load(&vmi), NULL);

Again let's drop this block, it's not useful I don't think.

> +
> +	ASSERT_EQ(cleanup_mm(&mm, &vmi), count);
> +	return true;
> +}
> +
> +static bool test_mmap_region_fill_hole_merge(void)
> +{
> +	return mmap_region_fill_hole(true);
> +}
> +
> +static bool test_mmap_region_fill_hole_flags_mismatch(void)
> +{
> +	return mmap_region_fill_hole(false);
> +}
> +
>  static void run_mmap_tests(int *num_tests, int *num_fail)
>  {
>  	TEST(mmap_region_basic);
> +	TEST(mmap_region_fill_hole_merge);
> +	TEST(mmap_region_fill_hole_flags_mismatch);
>  }
> --
> 2.55.0
>

--
Cheers, Lorenzo
