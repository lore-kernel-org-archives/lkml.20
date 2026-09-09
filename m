Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A84936654C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974098; cv=none; b=KeTzFscnKb1Cf3dLaFoKbX5E5oMsBd9o+AUClZnJZgqq+67uOG1ibM6tp61OdPdZNT0mFYwrKRRkUgi/Zp3pcqL7FYfux30oxNnSgzXrlg2etu3dnVgkSIwiCanpVuEjLcjTV1aTNParSNmotUa4FzhzwOBXbR6cAuXhpbb3Rc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974098; c=relaxed/simple;
	bh=xBpWW915qLyjbnCTP7vbfYfwK7XNr4GVyqRjlIVqCn8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=u5O+MtkhhdvYEN452EvrQIvA94kgST+BGQRiC0i7RFCP1tSI2ROf4EefWui3fRGCzNy4ZlXlWzJyDzNJwty8TSkvAYHVYtSFlPY1O+rJno/X6VYVg8+Y0+40liSRuq1OvAyvDZnHc/wezkiN5vC51jJMCFSxW8V7OwKhyinhgzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TectydSl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TectydSl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495661F00893;
	Wed,  9 Sep 2026 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788974097;
	bh=DmOHtlkwAibVRWrf6jBbqPon1+V1g3DbJrK8wybEPH4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=TectydSlKEMFQH6KGXygMaQ3DW+SZaJsyqJFazoo0mTTnNYx+TmNnHUPNyqVX4gM4
	 C2YCSjECs604S7NxtZrXnlYKG8CYodJdKRhYMCysYLIpom8cOULCW1vdZc24molrsM
	 rqr/X+bZa4rtB5A8zZr/8ElSNzntXYc4pLP3aX0LE+QK+1Lm88Xt/ebWicHFeCMIU+
	 xV7wG23kR7GWuukN/0pq9mDemnwpvzQPjmfA6eMbYTactNi5CwVJv4WZcN4j45SulA
	 c4RBRdIReCUs8hOqAQG6WaHcaPFh48LdJ8edfmh4A2YescnwILX+cxaHQHo9PwenGg
	 P5q0VbXjAvPWw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] memblock tests: cover allocations below the low
 address limit
From: Mike Rapoport <rppt@kernel.org>
To: Tianyi Chen <hi@tychen.cc>
Cc: rppt@kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <178874362959.1415955.5009708808960886376.memblock-v2-2@tychen.cc>
References: <20260906144011.848898-1-hi@tychen.cc>
 <178874362959.1415955.18132997964995947947.memblock-v2-0@tychen.cc>
 <178874362959.1415955.5009708808960886376.memblock-v2-2@tychen.cc>
Date: Wed, 09 Sep 2026 20:14:50 +0300
Message-Id: <178897409075.1489479.6187209873282102376.b4-review@b4>
X-Mailer: b4 0.17-dev

Hi,

> Add memblock_alloc_low() coverage using the simulator's low address
> limit. Exercise aligned allocation, an allocation whose last byte is
> immediately below the limit, an alignment constraint that prevents
> fitting below it, and fully reserved low memory with high memory still
> available.
> 
> Run each case with bottom-up and top-down allocation. Check zeroing
> and reserved-region accounting as well as returned addresses. Verify
> that an unrestricted allocation can use the free high memory after
> the low allocation fails.
> 
> Document the registered memory range and its simulated limit, clarify
> the allocation boundary, and remove the completed TODO.
> 
> Assisted-by: Codex:GPT-6
> Signed-off-by: Tianyi Chen <hi@tychen.cc>
>
> diff --git a/tools/testing/memblock/Makefile b/tools/testing/memblock/Makefile
> index d80982ccdc209..20524fcbe3c72 100644
> --- a/tools/testing/memblock/Makefile
> +++ b/tools/testing/memblock/Makefile
> @@ -7,7 +7,8 @@ CFLAGS += -I. -I../../include -Wall -O2 -fsanitize=address \
>  LDFLAGS += -fsanitize=address -fsanitize=undefined
>  TARGETS = main
>  TEST_OFILES = tests/alloc_nid_api.o tests/alloc_helpers_api.o tests/alloc_api.o \
> -		  tests/basic_api.o tests/common.o tests/alloc_exact_nid_api.o
> +		  tests/basic_api.o tests/common.o tests/alloc_exact_nid_api.o \
> +		  tests/alloc_low_api.o
>  DEP_OFILES = memblock.o lib/slab.o mmzone.o slab.o cmdline.o
>  OFILES = main.o $(DEP_OFILES) $(TEST_OFILES)
>  EXTR_SRC = ../../../mm/memblock.c
> diff --git a/tools/testing/memblock/README b/tools/testing/memblock/README
> index b435f48d8a700..13b7f58b2eed1 100644
> --- a/tools/testing/memblock/README
> +++ b/tools/testing/memblock/README
> @@ -67,13 +67,13 @@ memblock
>  |-- tests
>  |    |-- alloc_api.(c|h)         -- memblock_alloc tests
>  |    |-- alloc_helpers_api.(c|h) -- memblock_alloc_from tests
> +|    |-- alloc_low_api.(c|h)     -- memblock_alloc_low tests
>  |    |-- alloc_nid_api.(c|h)     -- memblock_alloc_try_nid tests
>  |    |-- basic_api.(c|h)         -- memblock_add/memblock_reserve/... tests
>  |    |-- common.(c|h)            -- helper functions for resetting memblock;
>  |-- main.c        --------------.   dummy physical memory definition
>  |-- Makefile                     `- test runner
>  |-- README
> -|-- TODO
>  |-- .gitignore
>  
>  Simulating physical memory
> @@ -101,12 +101,12 @@ There's no need to explicitly free the dummy memory from memblock via
>  memblock_free() call. The entry will be erased by reset_memblock_regions(),
>  called at the beginning of each test.
>  
> -Known issues
> -============
> -
> -1. Tests for memblock_alloc_low() can't be easily implemented. The function uses
> -   ARCH_LOW_ADDRESS_LIMIT marco, which can't be changed to point at the low
> -   memory of the memory_block.
> +The simulator defines ARCH_LOW_ADDRESS_LIMIT in asm/dma.h using the midpoint
> +of the MEM_SIZE range registered by setup_memblock(), rather than the larger
> +PHYS_MEM_SIZE backing buffer. This leaves registered memory both below and

"rather than ..." part is excessive

> +above the limit, even when malloc() returns an address above the kernel's

Why do we care about what malloc() returns here?

> +default limit. The limit is the first address an allocation must not use;
> +an allocation's base plus its size may equal the limit.
>  
>  References
>  ==========
> diff --git a/tools/testing/memblock/TODO b/tools/testing/memblock/TODO
> deleted file mode 100644
> index c13ad0dae7763..0000000000000
> --- a/tools/testing/memblock/TODO
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -TODO
> -=====
> -
> -1. Add tests for memblock_alloc_low() once the simulator can model
> -   ARCH_LOW_ADDRESS_LIMIT against the low memory in memory_block
> diff --git a/tools/testing/memblock/main.c b/tools/testing/memblock/main.c
> index 278f9dec50087..9a96e178551b8 100644
> --- a/tools/testing/memblock/main.c
> +++ b/tools/testing/memblock/main.c
> @@ -4,6 +4,7 @@
>  #include "tests/alloc_helpers_api.h"
>  #include "tests/alloc_nid_api.h"
>  #include "tests/alloc_exact_nid_api.h"
> +#include "tests/alloc_low_api.h"
>  #include "tests/common.h"
>  
>  int main(int argc, char **argv)
> @@ -12,6 +13,7 @@ int main(int argc, char **argv)
>  	memblock_basic_checks();
>  	memblock_alloc_checks();
>  	memblock_alloc_helpers_checks();
> +	memblock_alloc_low_checks();
>  	memblock_alloc_nid_checks();
>  	memblock_alloc_exact_nid_checks();
>  
> diff --git a/tools/testing/memblock/tests/alloc_low_api.c b/tools/testing/memblock/tests/alloc_low_api.c
> new file mode 100644
> index 0000000000000..1ea5a36fcf0d8
> --- /dev/null
> +++ b/tools/testing/memblock/tests/alloc_low_api.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#include "alloc_low_api.h"
> +#include <linux/align.h>
> +
> +/* Allocate at the first or last aligned address below the low limit. */
> +static int alloc_low_simple_check(void)
> +{
> +	struct memblock_region *rgn = &memblock.reserved.regions[0];
> +	phys_addr_t size = SZ_64;
> +	phys_addr_t expected;
> +	void *allocated_ptr;
> +
> +	PREFIX_PUSH();
> +	setup_memblock();
> +
> +	/* malloc() does not guarantee SMP_CACHE_BYTES alignment. */

I'd drop malloc() and say "simulated physical RAM isn't necessarily
SMP_CACHE_BYTES aligned"

> +	if (memblock_bottom_up())
> +		expected = ALIGN(memblock_start_of_DRAM(), SMP_CACHE_BYTES);
> +	else
> +		expected = ALIGN_DOWN(ARCH_LOW_ADDRESS_LIMIT - size,
> +				      SMP_CACHE_BYTES);
> +
> +	allocated_ptr = memblock_alloc_low(size, SMP_CACHE_BYTES);
> +
> +	ASSERT_NE(allocated_ptr, NULL);
> +	ASSERT_EQ((phys_addr_t)(uintptr_t)allocated_ptr, expected);

Isn't (phys_addr_t) cast enough?

-- 
Sincerely yours,
Mike.

