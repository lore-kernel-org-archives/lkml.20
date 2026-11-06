Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984833;
	b=3lvy9Y9is7udM5H4cHcj+WJU0Rzk8sOWWA0KeAloVlMuRahSPyBKEaeDUM2outONi0+m
	 9+yFmO1P5tcDzZ74TUwy2E/nVNcqOiAMfu9/oqb8guFk1SW3u+qHTMgYhB8KSEkcmgmFW
	 rV+8MVmh7Zd+pWBySi0Zhuk9lIQHXg1bsNciJQa4/Ayc1o6f93WwfHO/mwokP1zmB6FjV
	 ZuPy0wo+J9NCz2ZkOzHhA4p0P8kpgpdj+vGSkiJU+TPv4hB04/VVf1nT744CeEkqROuRP
	 nwqH6rpQHkBAkrOFB+hIBejeMonfgeofWH5OkfL3gl6ki0cQS9WkuqniX8VjQpMSRug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984833;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0pHuyDdGFHrSjHAgPsM7O2JBzWQTNhkZRPUuo4cj1zQ=;
	b=nYk/EgwCAHx98fMBpXSEqDRxChYm+GmuJFN7HK/SoWAUtXSS/uvtaa08lhPTMzrHdGlp
	 du1cQXGLBAKvqcWkyiF6xO+r4UIZAE2Mor0+T+/LhP0TGIHi8GOZ08veIdZTQfcGg/US4
	 9/HOdTonncyOKJvtlJXf6CB+YtHvOBGD5RgwlPKyJ7+DqtROpPXyQjGdpMe8gI/NfRUCs
	 BvHNpw26pPJvwasaVbVBtEXxDVBYwg9VdI2anSgxX0HkgkT4pQnOI+ECDfP34xTBJByrF
	 wvZ5KtYKsvRXKvVYRbIO3D1pr7giTrRak8aOr+5G+WWRjYrC4XALP7M6GFkNwR5Ik0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JwoAZg5E;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E094606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E094606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JwoAZg5E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73C7F1682;
	Fri,  6 Nov 2026 09:07:08 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 750F13F632;
	Fri,  6 Nov 2026 09:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793984831; bh=6ol2Z/D8V05yZ6or6LI2IXFUiWAfEVEFcBbNRI7igRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwoAZg5EVgwKh2wLqs1WliIdCo+Jfe1JYxHmcWG8yqrfzzJE+U64zgM/8LqFm/Vuh
	 pkkyPGZB6Yf41ge3WPrhn+nKkojCwclMerf7UZDiTa7bmgmV7dusGidsTJa/Ppx3z8
	 /OXYfs9RtlgS12Njn/g8z8FBTzv608nrFXDMVCxU=
Date: Fri, 6 Nov 2026 17:07:06 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: will@kernel.org, mark.rutland@arm.com, pratyush@kernel.org,
	leitao@debian.org, mpilaniy@redhat.com, yeoreum.yun@arm.com,
	graf@amazon.com, pasha.tatashin@soleen.com,
	akpm@linux-foundation.org, baoquan.he@linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rppt@kernel.org
Subject: Re: [PATCH v8] arm64: kexec_file: Stop using the Image text_offset
Message-ID: <au4JOjnQlx2aSpiE@arm.com>
References: <20261105125442.2282987-1-ruanjinjie@huawei.com>
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
In-Reply-To: <20261105125442.2282987-1-ruanjinjie@huawei.com>

On Thu, Nov 05, 2026 at 08:54:42PM +0800, Jinjie Ruan wrote:
> image_load() adds text_offset to kernel_segment->mem and subtracts it
> from kernel_segment->memsz.  For CMA backed segments this breaks the
> load path: the payload is copied to page_address(cma), which is the CMA
> base, while image->start is set to the adjusted address, so kexec jumps
> into the middle of the kernel.  kimage_map_segment() has the same
> mismatch when a segment has been moved.
> 
> The adjusted memsz also breaks the release path: the CMA pages are
> freed using segment->memsz >> PAGE_SHIFT, which is fewer than were
> allocated, leaking the tail of the allocation.
> 
> Since commit 751c263bb74f ("arm64: remove TEXT_OFFSET randomization")

This commit only removed the randomisation. The one you want mentioned
here is cfa7ede20f13 ("arm64: set TEXT_OFFSET to 0x0 in preparation for
removing it entirely"). Although this removing never happened (see more
below).

> TEXT_OFFSET is always zero.  This has been upstream since v5.8, so no
> LTS kernel carries a non-zero text_offset.  Drop the adjustment and
> reject images with a non-zero value instead of booting them from a
> wrong address.  With the adjustment gone, segments stay at their CMA
> base and the release size matches the allocation.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Link: https://lore.kernel.org/all/20260921090450.807575-2-ruanjinjie@huawei.com/
> Link: https://lore.kernel.org/all/20260921090450.807575-3-ruanjinjie@huawei.com/
> Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2:
> - Split out from the patch set.
> - Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/
> ---
>  arch/arm64/kernel/kexec_image.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
> index 78b1f956d8d7..7d6baea3d28f 100644
> --- a/arch/arm64/kernel/kexec_image.c
> +++ b/arch/arm64/kernel/kexec_image.c
> @@ -80,12 +80,17 @@ static void *image_load(struct kimage *image,
>  	kbuf.bufsz = kernel_len;
>  	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>  	kbuf.memsz = le64_to_cpu(h->image_size);
> +	/*
> +	 * Pre-v5.8 images carry a non-zero text_offset, which is no longer
> +	 * honored; reject them instead of loading them at a wrong address.
> +	 */
>  	text_offset = le64_to_cpu(h->text_offset);
> +	if (text_offset) {
> +		pr_err("Unsupported Image text_offset 0x%lx\n", text_offset);
> +		return ERR_PTR(-ENOEXEC);
> +	}

If it's only CMA getting it wrong, can we not just set
image->no_cma = true here and continue as normal?

While text_offset is 0 now, I don't think we concluded it should be
deprecated. There was a recent push back on the attempt to document the
always 0 behaviour:

https://lore.kernel.org/all/20260604140839.1930847-1-linux@rasmusvillemoes.dk/

-- 
Catalin
