Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF7C413D99
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802805; cv=none; b=TYW3D9dZPGKnZDlJNsOrKDT4CJFlyKR4sLeop8TSMo5/OpjOTlyy3o4x5R0CpOQr55hWVJUE34dH2Hmsyai/IzXVONTKAthqyiGbGTqldQ273gHrB4ZzF7QjmWtGh+U8kVdlnxQeb7Oc+ZphxwUhN8HMxNTLrsTEFU0jaKKX3JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802805; c=relaxed/simple;
	bh=NjsSibT6gSla6xXaf/s3q9oYJ0IPJ1EF6ajDUBaMEDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WENlUryY+HnMueDjDTTM8z3NypAOEyN6c5+L+30KDH6RCMI91omeCQvYNNGOxZ2KlvrGn25bFNX6oqKtl6fQFpXF9jRVlZ/2eijIrWQIt/FJwYtXmpyogLp9ag2qHnJBvD1QMxWP6STbX5D4oV7dcPDyqoWr6hCFwrSkE53lRvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boxExt7G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boxExt7G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4A51F0089B;
	Mon, 12 Oct 2026 11:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791802803;
	bh=wZUyYooaNkAreZrRLDqDxoLKaeDJp0HzcVnuWZtLzvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=boxExt7Gw5EGkT6iSh5kJ00qc0TDPqcyKLCl31OUiV+/3dJA0RJ3MWu/o5IfYsHFd
	 FBHESnvGg+HRWIYoxmSqjGAQ0cmv8OJi3UtExxCR8DorMlBxhVYDGVgCSn/KrSqsDO
	 RgB7DnmhUUUaDjBJdKTygEYKbYVvXY3Bqie0cf6xdb39s5Ub87eWzcrfSwFBKu7A6J
	 5r96jv7eSKQWk0R+9cXY/D1JZtCoJjiK9sNC+4Cnn5FeyvlziPrkAro+e3kxDIZmT4
	 3a0C6RW8LVusinvv+HFCoa6Y6ddOYOQeyL9vcMGOazdkinjgJ/oLKadBesLh/KbDpB
	 CThChe/guHgnA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 147CE198004A;
	Mon, 12 Oct 2026 06:59:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 12 Oct 2026 07:00:00 -0400
X-ME-Sender: <xms:rb3Mao11WcOR3DIGuR1Pf4VTM82MDu4rd3QyXp04Q6ZFJSnbUL3XHA>
    <xme:rb3MamBRPQ67jo9e10CpRdepr1hHlyb4IM_1PT75p0HPAYLfLqpws6m3UIZXKIbRX
    3Oet2_K8aDgrql4-SoFZBqoFivEJzsug6kZhM3w71oK7k_Ujg6zKhkXfQ>
X-ME-Received: <xmr:rb3MalGxuYO1t-W5X7i5ZqbnZ_n-JzTEUvpMfVAWyXQi30aBVHsKqAUFFmY>
X-ME-Proxy-Cause: dmFkZTEEaa1BbtdKDc3jlhza91VHJVzeik9AwuPPJE2+YRNb0VWxDJ7KxairyrNw7HjkuC
    Hf9gpzGlUcEgROp7zYAAvBKeeSyF6Emj0HwB1Low+mJ7BNrLMBeKnhUYdksboY/BugnrGR
    FAfBZKo7foRbum/OqvDikts/NThdyfqlBTa1yXdRdLER5NVgxS0OPfAZ3HpqdAy0FC/Mde
    krdyHwCeycv0FRyPfNtVioW02hPDA3mdm9zLpCxVKdyzMnemfHEJlYUTN5Wfobkq1fYRH+
    ZgYmJCfhhQgEC3qcr/yg996V6aOJbsJnB8KqPL1CBWtwkbHCwyO4YtdFEw4WYbvBHHdnBg
    FvuQXk7wGYOpuDV8cax3XjqMaBvXroysO7Fc5s9AIa/ZaOAsdMbjtiEUxLjcq+LUlHDLxW
    M1vnZMzHlA8uDbKoVTtKOuwIGsIKtBLxLSfOVg1fVwZJkl/LgpJMucR0Yzo5J7c6fBWYbj
    Dpb7D2WvMvmC3LxG8SMLyHcr+/byurNzGsJh+pDxiJ2OoMJZzuIgVyYr+BXX2avkMRiiF4
    /BWwsSxeznYbSFQ24YPmm3ErFkDJ80MMSNdG2BuAtAPVyFTwxbq7l13umOiqpYr7QesYmb
    exG1Nlet5munosOLD+Rqdn8X4SDF4c8d9Us55yTz20nL+RIAW73JU7GZYpng
X-ME-Proxy: <xmx:rb3MavDIu79lY70WSuAhd-Iq77WcQ-_FrDaaE5jcR-tYYpmPV_WabQ>
    <xmx:rb3ManaWqhntIALVVi1vay4oU85_4vEWQvxTl_3EeZul7B6bU-gsag>
    <xmx:rb3MavNQWERFoZyMhiHgGi8yeeHaxJRKYp4xKw2YE8YA2zFHfho8Fw>
    <xmx:rb3MagQSwl-h1VqV4P8PxvDmSFRw-Fc2spJswSbYFdxPTOhv3hAsIA>
    <xmx:rb3MakS5DSfMj4Nmrutg59IiU_8NhLEiPm8AX18Xq2MeyfVxPgkkX8Wr>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Oct 2026 06:59:56 -0400 (EDT)
Date: Mon, 12 Oct 2026 11:59:56 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: James Houghton <jthoughton@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, liam@infradead.org, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Yang Shi <shy828301@gmail.com>, zokeefe@google.com, hughd@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] mm/khugepaged: Never install PMDs in
 uffd-minor-registered VMAs
Message-ID: <asy9PMMWm6waSXEz@thinkstation>
References: <20261003001859.502725-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003001859.502725-1-jthoughton@google.com>

On Sat, Oct 03, 2026 at 12:18:58AM +0000, James Houghton wrote:
> Userfaultfd minor faults provides userspace with the ability to manually
> install PTEs with UFFDIO_CONTINUE. Right now, MADV_COLLAPSE can map
> holes in the VMA when a naturally-aligned THP is present. This is not
> true for khugepaged collapse: the PTEs will be retracted, but a PMD will
> not be installed.
> 
> When MADV_COLLAPSE installs a PMD that mapped holes in the VMA,
> userspace is likely to expect UFFDIO_CONTINUE to succeed on the
> should-be holes. UFFDIO_CONTINUE will fail and return EEXIST.
> 
> This is not inherently a problem, as MADV_COLLAPSE is an explicit
> userspace action. But, especially because MADV_COLLAPSE can be invoked
> by an external process via process_madvise(), a rogue caller could break
> a userfaultfd-minor resolver thread.
> 
> Userspace cannot generally use MADV_COLLAPSE to resolve userfault minor
> faults, as MADV_COLLAPSE will only resolve such faults if a
> naturally-aligned THP is present, so this is not a functional
> regression for userspace.
> 
> The naturally-aligned THP case is the only case where this quirk exists.
> Collapsing otherwise requires all PTEs to be present for
> userfaultfd-registered VMAs (i.e., max none PTEs is 0), which is
> correct. This check is essentially bypassed for naturally-aligned THPs.
> 
> Suggested-by: Lance Yang <lance.yang@linux.dev>
> Tested-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> Changes since v3:
>   - Prevent page table retraction in patch 1. Please see the comment
>     next to it. So this patch now has two hunks instead of one.
>   - Reworded the comment and combined the userfaultfd checks in patch 1.
>     (Thanks David)
>   - Simplified the selftest a bit given the behavior change in patch 1.
>   - Undid a change in v3's selftest that incorrectly handled the case
>     where MADV_COLLAPSE was not supported entirely.
>   - Rebased on top of mm-unstable, which includes Kiryl's changes.
> v3: https://lore.kernel.org/linux-mm/20260910023411.514987-1-jthoughton@google.com/
> v2: https://lore.kernel.org/linux-mm/20260828222640.1638457-1-jthoughton@google.com/
> v1: https://lore.kernel.org/linux-mm/20260828005004.2870750-1-jthoughton@google.com/
> ---
>  mm/khugepaged.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 913086eaf17b..438c4af1c058 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1868,10 +1868,11 @@ static enum scan_result try_collapse_pte_mapped_thp(struct mm_struct *mm, unsign
>  		return SCAN_VMA_CHECK;
>  
>  	/*
> -	 * Keep pmd pgtable while the uffd bit is in use; see comment in
> -	 * retract_page_tables().
> +	 * Don't collapse if there might be PTE markers for userfaultfd-based
> +	 * access protection or if collapsing might bypass userfaultfd minor
> +	 * faults.
>  	 */
> -	if (userfaultfd_protected(vma))
> +	if (userfaultfd_protected(vma) || userfaultfd_minor(vma))
>  		return SCAN_PTE_UFFD;
>  
>  	folio = filemap_lock_folio(vma->vm_file->f_mapping,
> @@ -2093,8 +2094,13 @@ static bool file_backed_vma_is_retractable(struct vm_area_struct *vma)
>  	 * and cannot be recycled to a shared PMD. Other vmas can still
>  	 * have the same file mapped hugely, but skip this one: it will
>  	 * always be mapped in small page size for these registrations.
> +	 *
> +	 * Userfaultfd-minor-registered VMAs should also not be retracted.
> +	 * PMDs will not be installed, as doing so can suppress minor faults.
> +	 * If retraction were allowed, khugepaged might continually cause
> +	 * unnecessary userfaultfd minor faults for already-CONTINUE'd pages.
>  	 */
> -	if (userfaultfd_protected(vma))
> +	if (userfaultfd_protected(vma) || userfaultfd_minor(vma))
>  		return false;
>  
>  	/*


Did you run 2/2 on current mm-unstable?

Here, on e8d0f6a1b2a4 plus this series, minor-collapse fails every run:

  # failed reason: [unexpected memory contents after collapse]
  not ok 1 minor-collapse on shmem

This patch refuses the collapse too late.

collapse_scan_file() has no VMA, so the uffd check in
collapse_max_ptes_none() never applies, and collapse_file() goes ahead:
it try_to_unmap()s the PTEs userspace already CONTINUE'd and replaces
the page cache.

Only then does try_collapse_pte_mapped_thp() return SCAN_PTE_UFFD.

MADV_COLLAPSE fails with -EINVAL, but the page the test read beforehand
is already unmapped, takes a second minor fault, and gets flipped twice.

Also, your 2/2 missing Signed-off-by.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
