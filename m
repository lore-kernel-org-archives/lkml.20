Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718524;
	b=Fao3gaDq2pZ60N2m6GLjtnq0Iqg2dgA9Ptuxlcds8XorXCRjs71kQUIKfYz2GyV+68VT
	 Eqcv8n+upgK18fkflOqd87kM/LjN4VzUsc+C4oRXKbLYk58bf4zPVhDP+Hy1i5c7YAKbO
	 KX/Bjt7OGUW+KhZR4k34+ZKcm1J8fyepUah3C4vhGB1V0kybae5B4oLQMsSePg08+tRpH
	 QwDxFexuRIm+J1TMJ5B9EGw+bLwmm0rbDH+65OBfDC2QQm6/Tj+513H0CBezZS6KSyPAv
	 V0GqWyRCleAD0Sm43hVh/qNAjSCihEhx6mYvjIbl/0IjqD2ZOT+CWJrss94aCsC9z7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718524;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=T78d35XJuajsWSqCh0SR2r+hq2uCDOlT3TQl7sed1Eg=;
	b=i/CtVk1+y22LbTy/bKWO0DjeXJ0CSwHPCYHTDVZRh9huDSi+p5pNhjl+AX4cNZibcTFA
	 oX1cV7eQsY32HE2DEbiMIrL7E9fHwLXmAdXzfAg/X/SeVljqqijXioppI3grwi0nzDTJ2
	 WDqysJ2OvCzFYtYSla6XnLLP2g/Lf6+biq+oEdhMdHk8Zdnl5VIQt/y78Ec1dX890U/NE
	 6QiOUY7TksEJHfz7jBNgF6kOxjNVIKNwjp/NzLLZcmky0/xKgy2CYSFT95yGAYIIkdBP6
	 v4jT2AyArm/7BDuXFdBufKUsfgDSnmUlBb4CzwhqWhczjr9Q50CQaJcXQlFJOtgJxjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Yr6YhMmW;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EB0606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50EB0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Yr6YhMmW
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 654401595;
	Tue,  3 Nov 2026 07:08:40 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBD7B3F673;
	Tue,  3 Nov 2026 07:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793718523; bh=9K8j3RHNpZl6x0R5Vf5Y5d+UFsTPvm4yCBERtbu40zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yr6YhMmWqlyf6ZrUzDb5//LGZUKtAumRbIUQdzdJIQv/2YrUiXvSJnNNaaIO3ApKa
	 xDDDO4R+bOeLEerrt6xuL6/DXLWwXdqnW2hNR6j0Yq9klEonxoRpGL/6hoeVavQ/gw
	 wNghATfBBV8snGfKZfCE5tLCXLJvdpebXmoB4ci4=
Date: Tue, 3 Nov 2026 15:08:40 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: validate /dev/mem mmap ranges without overflow
Message-ID: <aun4-MXVMZNrmvGr@arm.com>
References: <20261101171030.87343-1-zhaogongyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101171030.87343-1-zhaogongyi@bytedance.com>

On Mon, Nov 02, 2026 at 01:10:30AM +0800, Zhao Gongyi wrote:
> An arm64 syzkaller reproducer creates a FUSE character device with
> major:minor 1:1, so opening it uses the /dev/mem file operations. It
> maps one page from offset 0xfffffffffffff000 at user address zero.
> The next openat() with a NULL pathname triggers a synchronous external
> abort (SEA, ESR 0x96000010) in strncpy_from_user() via do_getname(),
> panicking the kernel.
> 
> valid_mmap_phys_addr_range() checks the exclusive end by adding the
> mapping size to the starting address. For this offset, the sum wraps
> to zero and passes the PHYS_MASK test, allowing an out-of-range PFN to
> reach remap_pfn_range(). The inclusive-end overflow check in
> mmap_mem_prepare() does not catch it because the end is ULONG_MAX.
> 
> Reject starting PFNs outside PHYS_MASK and compare the inclusive length
> against the remaining physical range without overflowing. This also
> allows mappings that end exactly at PHYS_MASK, which the old check
> incorrectly rejects.
> 
> Fixes: 1d18c47c735e ("arm64: MMU fault handling and page table management")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
> ---
> Tested on the base commit with QEMU TCG and 52-bit LPA2:
> the overflowing one-page mapping changes from success to -EINVAL,
> while the last valid one- and two-page mappings change from -EINVAL to
> success. A direct /dev/mem mmap followed by openat(NULL) panics before
> this change; with the change, mmap fails with -EINVAL and openat()
> returns -EFAULT.
> 
>  arch/arm64/mm/mmap.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
> index 32e0771..d6286bc 100644
> --- a/arch/arm64/mm/mmap.c
> +++ b/arch/arm64/mm/mmap.c
> @@ -61,7 +61,12 @@ int valid_phys_addr_range(phys_addr_t addr, size_t size)
>   */
>  int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
>  {
> -	return !(((pfn << PAGE_SHIFT) + size) & ~PHYS_MASK);
> +	const phys_addr_t max_addr = PHYS_MASK;
> +
> +	if (!size || pfn > (max_addr >> PAGE_SHIFT))
> +		return 0;
> +
> +	return size - 1 <= max_addr - (pfn << PAGE_SHIFT);
>  }

Can we write this as:

int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
{
        phys_addr_t limit = PHYS_MASK + 1;

        return size <= limit && pfn <= (limit - size) >> PAGE_SHIFT;
}

It would resemble the generic __access_ok() better where we need to
check for similar overflow. I find it easier to read.

(happy to make the change when applying)

-- 
Catalin
