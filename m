Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D9E471435
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791298976; cv=none; b=EvlGC59stPo4h7FbzkX3oVZIAw9xur32m0Wf6J5m6nkv6ZGTbgj07QyU8pw1IJQBreB2zYZElRX0ev5pPOg3JmiYqkFI/fbTB4R8121miHcWqM6w3rUfEaygLxv9bL9LBcnGiBTPC+4R2DooU5ASfiRWHGHFl2DNXBAasvYbjGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791298976; c=relaxed/simple;
	bh=uHmxGDTsNhsQt2YwJyM42DyClVzXNZr5HiOheNyEOSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBNlUhj9Qmo2PQZi99br+Zkv6gaN+vOmzbCIUX8+DJ971XkzyXmd8LtD7/U3SmGvCpuUnz9VUeNOzQC5ovxibqa4QW5JaWPN5b4CcDiTaj6L9kOZfee0xkUqwz91uAt9uDmjCWvB01h58l+yXoo4T0NUcvLKhErI4Be8noE0oBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/FWaShQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/FWaShQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FEA1F0089C;
	Tue,  6 Oct 2026 15:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791298975;
	bh=XrmZ5VjcGo1CmLI392pf/ezl3slVPaW65lqzIAGxnkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X/FWaShQqtGzwCzQ/Fd66ZOxErJRlyAyTqeg5H0ztxUsxHSnqpZz3z8eaWDIGfJ7O
	 IcOZWb4nhRp94GIVZL57lmQB6GNn1/eM7flBjjrai6LSjZXpi5TWJFTL5aJ1V85LaU
	 dQsk3MEv2rufH3NiaA7u/INlrgZ+Wh3e/9UmFBsJOKbOkpK9X76xQQMSGz9VWl2NS8
	 RKm0wNkeK+xHgROjJG7Y17m5GHuqUXvw5ZcSfuQgv6pRkZizVZlIm3XqpLbQ04cbFz
	 9JL6GnwrbIlgm3Bf3wFJxzX2ZYxr+S6MV5Wu7DtAnAC6BGc4CJQgZot9eYhSkM4C0c
	 3uuEwR0Cp5WgA==
Date: Tue, 6 Oct 2026 17:02:50 +0200
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] x86/fpu: Use vmemdup_user() in xstateregs_set()
Message-ID: <asUNmhyCFpNx5olr@kernel.org>
References: <20260917121441.214567-3-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917121441.214567-3-blum@kernel.org>

On Thu, Sep 17, 2026 at 02:14:41PM +0200, Thorsten Blum wrote:
> Replace the open-coded vmalloc() and copy_from_user() with
> vmemdup_user() to simplify xstateregs_set().
> 
> vmemdup_user() returns an ERR_PTR() on failure, preserving the existing
> -ENOMEM and -EFAULT error codes. Since vmemdup_user() is backed by
> kvmalloc(), use kvfree() to free the buffer instead.
> 
> Return early on error and drop the obsolete out label.
> 
> Performance should be similar, and xstateregs_set() is not a hot path.
> Page alignment should not matter because the buffer is only used as a
> memcpy() source in copy_uabi_from_kernel_to_xstate().
> 
> The allocation behavior differs because vmemdup_user() uses GFP_USER,
> which adds __GFP_HARDWALL and may affect cpuset allocations.
> 
> tools/testing/selftests/x86/avx_64 passed on an Alder Lake CPU.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
> Changes in v2:
> - Add performance analysis and selftest result to the changelog (Ingo)
> - v1: https://lore.kernel.org/r/20260720195534.70111-3-thorsten.blum@linux.dev/
> ---
>  arch/x86/kernel/fpu/regset.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)

Hi Ingo,

A gentle follow-up on this resend. The v2 changelog now includes the
analysis you asked for in the earlier thread, plus a successful x86
selftest result. Is anything else needed for this to be queued?

Thanks,
Thorsten
