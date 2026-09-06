Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8F930567F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788726100; cv=none; b=Jh8YkN6EDDON8L3k9E+wXtSYZY+WJXxTsGVIWy+8pdx2Vl5RMBmW9KEsL9qJ+zjbxOqpd95JTUalc7sxoOYLuvO6shCyY1+XaqujeaDSN6Yz6cjtv7FsEoDha48rVRZtxgNboy8GViu0iPqcOd+e6GiFz35oKmQyw8GPe+GKJNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788726100; c=relaxed/simple;
	bh=3ZeoaK+X4B46P2YQPu/Mt4hNttpZIIjyltdXTPEiYQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZYk9NyEisxH+HRFHhAzR+FXjGwoXs+gg1ixjfmU97C3NnC5oRJw8vRuzVO2X9eeSIBw6tYbW4MiDXrij2jMUtFFllwNrGHmDDD3Gu1TKz8HDBWDec/a7z1+6TNclNZ6CbTDn9MXkslp8XuuOSv8ShlP20pJ3nRTFgXOXMIw3bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TosTePwf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TosTePwf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7851F00A3A;
	Sun,  6 Sep 2026 20:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788726098;
	bh=YzM9ANcfWxPv1Bv9pbU9NQgz9pQl43jfn34ZVVQEB/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TosTePwfV3FXRZluEZKjQtM7YblVHqUl+Kq/rBGavUUQUaJJ2tkSBoVrwLv+urmI/
	 1ZM/z5QIIt4fYbl5+KSDcWf2tccHzY5XqxKm3WzezC+5W5RYLqKcQCY8duMTTSz2Jw
	 UsGNAK1gLp3Cy/lvnxrtAhV+o7BeE4UL2mmh6lo210nODfVbVYYXFNk/lcsVkL/vQz
	 Huh1VSUhrcDIGHZqy/d9UaAtX0l7RxzsxuFcwNUDpXfH+x2UV0aDrhat+lI8lrg98Q
	 dVyRTWyWKDay6xUA9sD9LqHc7BSRasvSomnf69+KuiTD4V0o6s+DMOhmJ1BYV5gcMR
	 qLBYNu5cELkVA==
Date: Sun, 6 Sep 2026 23:21:33 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Tianyi Chen <hi@tychen.cc>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] memblock tests: model the low allocation limit
 within dummy memory
Message-ID: <ap3LTQlKTpDbAEJZ@kernel.org>
References: <20260906144011.848898-1-hi@tychen.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906144011.848898-1-hi@tychen.cc>

On Sun, Sep 06, 2026 at 10:40:10PM +0800, Tianyi Chen wrote:
> The simulator represents physical addresses using the address of its
> allocated buffer. That buffer can lie above the default
> ARCH_LOW_ADDRESS_LIMIT, preventing meaningful memblock_alloc_low()
> tests.
> 
> Use the existing architecture override in asm/dma.h to place the limit
> halfway through the dummy memory buffer. Resolve it after the buffer
> has been allocated, so both low and high memory can be represented
> regardless of its address. The production allocator is unchanged.
> 
> Assisted-by: LLM

Please add LLM attribution as per 

https://docs.kernel.org/process/coding-assistants.html#attribution

> Signed-off-by: Tianyi Chen <hi@tychen.cc>
> ---
>  tools/testing/memblock/asm/dma.h      | 6 ++++++
>  tools/testing/memblock/tests/common.c | 5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/tools/testing/memblock/asm/dma.h b/tools/testing/memblock/asm/dma.h
> index 13ff8e5d22e..6607408dcf2 100644
> --- a/tools/testing/memblock/asm/dma.h
> +++ b/tools/testing/memblock/asm/dma.h
> @@ -2,4 +2,10 @@
>  #ifndef _TOOLS_DMA_H
>  #define _TOOLS_DMA_H
>  
> +#include <linux/types.h>
> +
> +phys_addr_t dummy_physical_memory_low_limit(void);
> +
> +#define ARCH_LOW_ADDRESS_LIMIT dummy_physical_memory_low_limit()
> +
>  #endif
> diff --git a/tools/testing/memblock/tests/common.c b/tools/testing/memblock/tests/common.c
> index 3250c8e5124..4e6a920c459 100644
> --- a/tools/testing/memblock/tests/common.c
> +++ b/tools/testing/memblock/tests/common.c
> @@ -118,6 +118,11 @@ phys_addr_t dummy_physical_memory_base(void)
>  	return (phys_addr_t)memory_block.base;
>  }
>  
> +phys_addr_t dummy_physical_memory_low_limit(void)
> +{
> +	return dummy_physical_memory_base() + MEM_SIZE / 2;

Shouldn't this be PHYS_MEM_SIZE?

> +}
> +
>  static void usage(const char *prog)
>  {
>  	BUILD_BUG_ON(ARRAY_SIZE(help_opts) != ARRAY_SIZE(long_opts) - 1);
> -- 
> 2.55.0
> 
> 

-- 
Sincerely yours,
Mike.
