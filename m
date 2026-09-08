Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E62509F18
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862899; cv=none; b=jPQJOQAmCQ44fuvIu1l/GKpCj4ZVfqw7rf/1Nh6hl7cpuCmzTKKdmmGcMBtRaalpkJobQ7rkJeeHoxyogv56VjpuBRvNtrj63GATK9oCjeh6xdiJwONvbxlHZ4idsLjyiTD6AHwDU3VjtGHDb8POPUa7PUZr+AmO97xS/yIVYCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862899; c=relaxed/simple;
	bh=tvA6eisArEKd0wG1Qr/T58/reEyjYFkwPuF18n0iWJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hS+NRjJ4XgrHDt80+zkxbNb7Qd8wXPIRUYFySuI/944R3i0ODztX6VSSmWP3z47BkLrzx3PM0+QVY0kZmUI0liqluZw/r3n4yVVDipDX3RqpW7t14SPQko72fO3Lfm5ZUTHmhOEOGKoFahhvy9XbG42raBXRPVG/DR9m6ma1CYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=naAVfI6v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naAVfI6v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E441F00A3D;
	Tue,  8 Sep 2026 10:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788862898;
	bh=trKkVjLDuoNyZ1KBYX25zdJ5VlGPOhjg9ThffyQDe88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=naAVfI6vDSA2o8yuJf1a9zMvqUkjjc3EB/eQ0HaObPU5xZO+BguKYHo0/BI8FO5wO
	 OPTkGvC+MxQEP7eTKyh7XFqvIXvpiVZlXuZht6DZBEg6i0YsBjd9RbSUg44cqDUg/W
	 DYi/Ymu6EFJDSFSaOdKJh+Art02RzAW1vXucjI/m+/rJbatHGfjFKKdlzVDGw1YiWx
	 oqlQi4rtudxQygI4tlVghW/3tam1Xjso8WGESLncynmqsA0rQTmaGnquHA1Uu+db/a
	 JmLA+Y/hiXysYeDOKJ1KBFXVnuQ9At4J7hZA+880iOB+OSFGQkf6N8ABwn4Z7BrKUf
	 xUnf53cNE74xg==
Date: Tue, 8 Sep 2026 11:21:33 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Tianyi Chen <hi@tychen.cc>
Cc: "Liam R . Howlett" <liam@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, vbabka@kernel.org, jannh@google.com, pfalcato@suse.de, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tools/testing/vma: cover hole filling through
 __mmap_region()
Message-ID: <ap_gTfb10dw0wx91@gremlin>
References: <20260906144100.849288-1-hi@tychen.cc>
 <178886112560.138404.17741948638665342936.vma-v2@tychen.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178886112560.138404.17741948638665342936.vma-v2@tychen.cc>

On Tue, Sep 08, 2026 at 05:55:15PM +0800, Tianyi Chen wrote:
> The mmap tests extend existing mappings one neighbor at a time, while
> merge tests construct merge state directly. Neither exercises filling
> a hole between compatible mappings through the mmap setup and completion
> path.
>
> Fill a gap through __mmap_region() and require both neighbors to merge
> into one VMA. Repeat with only the new mapping's execute permission set
> and require three separate VMAs. Check boundaries, permissions, page
> offsets, map_count and cleanup.
>
> Signed-off-by: Tianyi Chen <hi@tychen.cc>

For future - please always send v2 patches not in-reply-to anything :P otherwise
mails get buried.

Otherwise all LGTM, thanks for addressing feedback! So:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> Assisted-by: Codex:GPT-6
> ---
> Changes in v2:
> - Rebase onto mm-unstable, preserving the new /dev/zero test.
> - Rename hole_flags to middle_flags and describe each mapping's address
>   and length in its comment.
> - Remove the redundant hole, per-page and outer-boundary iterator checks.
> - Use const bounds and named booleans for the middle VMA's expected execute
>   permission, and separate assertion groups for readability.
>
> Validation: all 29 VMA tests passed with ASan and UBSan enabled, built
> with clang 20 using the existing VMA Makefile.
>
> v1: https://lore.kernel.org/r/20260906144100.849288-1-hi@tychen.cc
> Review: https://lore.kernel.org/r/ap5pmX-RddQ-c90O@gremlin

Thanks! :) very nice.

>
>  tools/testing/vma/tests/mmap.c | 68 ++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/tools/testing/vma/tests/mmap.c b/tools/testing/vma/tests/mmap.c
> index fa73faff226..53e4abe6a63 100644
> --- a/tools/testing/vma/tests/mmap.c
> +++ b/tools/testing/vma/tests/mmap.c
> @@ -45,6 +45,72 @@ static bool test_mmap_region_basic(void)
>  	return true;
>  }
>
> +static bool mmap_region_fill_hole(bool merge)
> +{
> +	const vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
> +			VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT, VMA_MAYEXEC_BIT);
> +	vma_flags_t middle_flags = vma_flags;
> +	struct mm_struct mm = {};
> +	struct vm_area_struct *vma;
> +	unsigned long addr;
> +	int count = 0;
> +	VMA_ITERATOR(vmi, &mm, 0);
> +
> +	current->mm = &mm;
> +	if (!merge)
> +		vma_flags_set(&middle_flags, VMA_EXEC_BIT);
> +
> +	/* Map at 0x300000, length 0x3000. */
> +	addr = __mmap_region(NULL, 0x300000, 0x3000, vma_flags, 0x300, NULL);
> +	ASSERT_EQ(addr, 0x300000);
> +
> +	/* Map at 0x306000, length 0x3000, leaving a hole. */
> +	addr = __mmap_region(NULL, 0x306000, 0x3000, vma_flags, 0x306, NULL);
> +	ASSERT_EQ(addr, 0x306000);
> +	ASSERT_EQ(mm.map_count, 2);
> +
> +	/* Map at 0x303000, length 0x3000, filling the hole. */
> +	addr = __mmap_region(NULL, 0x303000, 0x3000, middle_flags, 0x303, NULL);
> +	ASSERT_EQ(addr, 0x303000);
> +	ASSERT_EQ(mm.map_count, merge ? 1 : 3);
> +
> +	vma_iter_set(&vmi, 0);
> +	for_each_vma(vmi, vma) {
> +		const unsigned long start = 0x300000 + count * 0x3000;
> +		const unsigned long end = merge ? 0x309000 : start + 0x3000;
> +		/* Only the middle VMA in the non-merge case has VMA_EXEC. */
> +		const bool is_middle_vma = count == 1;
> +		const bool expect_exec_vma = is_middle_vma && !merge;
> +
> +		ASSERT_EQ(vma->vm_start, start);
> +		ASSERT_EQ(vma->vm_end, end);
> +		ASSERT_EQ(vma_start_pgoff(vma), start >> PAGE_SHIFT);
> +		ASSERT_EQ(vma_start_anon_pgoff(vma), start >> PAGE_SHIFT);
> +
> +		ASSERT_TRUE(vma_test_all(vma, VMA_READ_BIT, VMA_WRITE_BIT,
> +					 VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT,
> +					 VMA_MAYEXEC_BIT));
> +		ASSERT_EQ(vma_test(vma, VMA_EXEC_BIT), expect_exec_vma);
> +
> +		count++;
> +	}
> +
> +	ASSERT_EQ(count, mm.map_count);
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
>  static bool test_pure_anon_dev_zero(void)
>  {
>  	const vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
> @@ -84,5 +150,7 @@ static bool test_pure_anon_dev_zero(void)
>  static void run_mmap_tests(int *num_tests, int *num_fail)
>  {
>  	TEST(mmap_region_basic);
> +	TEST(mmap_region_fill_hole_merge);
> +	TEST(mmap_region_fill_hole_flags_mismatch);
>  	TEST(pure_anon_dev_zero);
>  }
> --
> 2.55.0
>

--
Cheers, Lorenzo
