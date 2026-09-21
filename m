Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978933BED23
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006215; cv=none; b=U/h6pAc1yMjy3OtmFG+BzWBYOzj0H+6xIF+kYT2yyAgEZOS6U5eBykRRtfNKBisyVnZABj1A8Nraj698XCnGpvkpHJdtSeidRT0WZf1w+8lItzEAXnd/OmpojxAsys1pxRXkq9iKZA3IABK+XarL+BHx/24gVnPrkfzN8aufnhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006215; c=relaxed/simple;
	bh=5/vliXgkiiHsQkGUS0MaWY2+lozGLpOlJnlU0M6q24Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSYgn8XfR9hVec45DBI2LHTdIB38QHOOfOWhaee+S9w2ilaJffHUAQ0veAZTfu6yX20ElaCRDFZ4XxgtOBf4BGSquKFI+ZFtR9zpGwA4kA98Kf7lE1qYamDMtElwvFQn2OVALICuvQJ7LAHyRHCdCqh5I6tM5i55S4aZdU4d4c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Q4pcOp7S; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Q4pcOp7S"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AAA8176C;
	Mon, 21 Sep 2026 08:56:49 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A8743F632;
	Mon, 21 Sep 2026 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790006213; bh=5/vliXgkiiHsQkGUS0MaWY2+lozGLpOlJnlU0M6q24Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q4pcOp7SfkiLg0TPGmeGWp0IXKA3kwKxa8a4umwl+d0uWarRQdGofLCbsejE82F8F
	 FWzDonyXO3r3x1e9DibZxCHS4B6hpD2iQqZl7AAp6D65zQBQTV+smk96tKN5YNEDum
	 +lKJgVHWdVVIdrConkKNS+CX6jiNkXS09Ex7PlXw=
Date: Mon, 21 Sep 2026 16:56:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 15/21] arm64: entry: Point SP_EL0 at the overflow stack
Message-ID: <arFTvxg2FJQUV7qt@arm.com>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-16-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918161407.2300-16-will@kernel.org>

On Fri, Sep 18, 2026 at 05:13:59PM +0100, Will Deacon wrote:
>  static void __init set_boot_cpu_offset(void)
>  {
> -	asm volatile("msr tpidr_el1, %0"
> -			:: "r" (per_cpu_offset(0)) : "memory");
> +	u64 ovf_sp = (u64)raw_cpu_ptr(overflow_stack) + OVERFLOW_STACK_SIZE;

raw_cpu_ptr() is using tpidr_el1 and we haven't initialised it yet.
Actually, I think we get away with it because in head.S we initialise it
to 0 (__per_cpu_offsets[0] is still zero at that point for the boot CPU).

> +
> +	asm volatile(
> +	"	msr	tpidr_el1, %1\n"
> +	"	add	%0, %0, %1\n"
> +	"	msr	sp_el0, %0" /* Update the overflow stack pointer */
> +	: "+r" (ovf_sp)
> +	: "r" (per_cpu_offset(0))
> +	: "memory");

Even if this is intentional and we rely in TPIDR_EL1 to be 0, it feels
weird to add the offset to raw_cpu_ptr().

Could we just do (untested):

	unsigned long ovf_sp = (unsigned long)per_cpu_ptr(overflow_stack, 0) +
		OVERFLOW_STACK_SIZE;

	asm volatile(
	"	msr	tpidr_el1, %0\n"
	"	msr	sp_el0, %1"
	:
	: "r" (per_cpu_offset(0)), "r" (ovf_sp)
	: "memory");

with no further arithmetics in asm.

-- 
Catalin
