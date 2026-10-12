Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC802392822
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815456; cv=none; b=HQpqYMVnyXAGjpOX0fWcRFUXZLN0An0zQHwJh/T5w8v56DEoXYyCBQYgzJ0EPAc3EGlHwpFe+5K2YuABzOXGJCgrnyrQME95y+Hz8NWe7KEjIicdxAYx1m0jxtuEOQqU4JK3OQIAgG0/yAYS7wv/UbSvg7ajSKvIsoOFYt+zBAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815456; c=relaxed/simple;
	bh=2iptY45sZjaUOEY0qkrjXEhKlN4aIRtRRPbd7ezV+X8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dmUqv3SWJaWZY19it2MnFdfR9AGhi3x1a7/AECEx6e36mBLhuU4JsIMMO/x73ChNE6/3NyP4VaACUQKfbVIPFcnP31Z2c1NEDBR5y+cwVDQSQCibDj7La0G1D822EL6HlRr1vuwDaK19c/5OIlKtlNx+g3r+GGhT49QbhP66RsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N30nkZhn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N30nkZhn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099FB1F0089B;
	Mon, 12 Oct 2026 14:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791815455;
	bh=MKq0YlVZaN6uo7U9gHQW5guRnA4CvVhwp5Xx9G/tslo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=N30nkZhnpfbN4mIx8WKiJZKQiRFP16MssSxvaATKX0mDhkhKjIzcKKzDvSc5/oXc9
	 EUvwV/7n6vhh4B78f1V3hQsonrFuoQZdfBOtMDLu7dXB/niEi73HqT1dg8EQVhQShR
	 B/OtCod86sIO7cjPyJG2b96TFgKiJpWPKq2tGEeeoD+yy3x50+FT3xWSNN3j3kbb3y
	 rf1b212b4LIU2yx08qfhd3V6vxJ/+fSnRNeJnaRaauRVPU6tTTApi9SlrcqP9LRa5v
	 il/SASQSEIC1fp6lr4u8wrZQpzxRv6Z6uR8stnuofQqohtx7IoYHASiQ0HjgwF7nkG
	 CqBY7xfaar5tw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: kexec@lists.infradead.org,  Aditya Gupta <adityag@linux.ibm.com>,
  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Baoquan He <baoquan.he@linux.dev>,
  "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,  Hari Bathini
 <hbathini@linux.ibm.com>,  Madhavan Srinivasan <maddy@linux.ibm.com>,
  Mahesh Salgaonkar <mahesh@linux.ibm.com>,  Michael Ellerman
 <mpe@ellerman.id.au>,  Mike Rapoport <rppt@kernel.org>,  Nicholas Piggin
 <npiggin@gmail.com>,  Pasha Tatashin <pasha.tatashin@soleen.com>,
  Pratyush Yadav <pratyush@kernel.org>,  "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>,  Shivang Upadhyay <shivangu@linux.ibm.com>,
  Shrikanth Hegde <sshegde@linux.ibm.com>,  linux-kernel@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 1/2] kho: check scratch vs CMA alignment at runtime
In-Reply-To: <20260928083226.107807-2-sourabhjain@linux.ibm.com> (Sourabh
	Jain's message of "Mon, 28 Sep 2026 14:02:25 +0530")
References: <20260928083226.107807-1-sourabhjain@linux.ibm.com>
	<20260928083226.107807-2-sourabhjain@linux.ibm.com>
Date: Mon, 12 Oct 2026 16:30:50 +0200
Message-ID: <2vxzfqybj8it.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Sep 28 2026, Sourabh Jain wrote:

> KHO requires the scratch alignment to be at least CMA_MIN_ALIGNMENT_BYTES,
> and this is currently enforced with a static_assert().
>
> That assertion breaks the build on powerpc once CONFIG_KEXEC_HANDOVER is
> enabled together with CONFIG_TRANSPARENT_HUGEPAGE or CONFIG_HUGETLB_PAGE:
>
>     kernel/liveupdate/kexec_handover.c:49:39: error: expression in static assertion is not constant
>        49 | static_assert(SCRATCH_ALIGNMENT_BYTES >= CMA_MIN_ALIGNMENT_BYTES);
>     ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
>        80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>           |                                                        ^~~~
>     kernel/liveupdate/kexec_handover.c:49:1: note: in expansion of macro 'static_assert'
>        49 | static_assert(SCRATCH_ALIGNMENT_BYTES >= CMA_MIN_ALIGNMENT_BYTES);
>
> CMA_MIN_ALIGNMENT_BYTES depends on pageblock_order, which is not a
> compile-time constant with certain configs, such as
> CONFIG_HUGETLB_PAGE_SIZE_VARIABLE on powerpc. The next patch in this
> series enables KHO on powerpc, so the alignment must be checked at
> runtime instead.
>
> Replace the static_assert() with a runtime check at the start of
> kho_reserve_scratch(), before any scratch memory is reserved. If the
> scratch alignment is smaller than the CMA minimum alignment, warn once
> and disable KHO rather than continue with a misaligned reservation.
>
> Cc: Aditya Gupta <adityag@linux.ibm.com>
> Cc: Alexander Graf <graf@amazon.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan He <baoquan.he@linux.dev>
> Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  kernel/liveupdate/kexec_handover.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 7c4d86daf86d..dc76dd6b74da 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -39,15 +39,7 @@
>  #include "../kexec_internal.h"
>  #include "kexec_handover_internal.h"
>  
> -/*
> - * This is the minimal alignment required by deferred struct page init.
> - * deferred_init_memmap_chunk frees memory to the buddy allocator, which looks
> - * at the neighboring pages (up to MAX_PAGE_ORDER) to merge them.
> - * If KHO scratch is not aligned to that value, buddy can access uninitialized
> - * struct pages, which can cause a crash.
> - */
>  #define SCRATCH_ALIGNMENT_BYTES (PAGE_SIZE * MAX_ORDER_NR_PAGES)
> -static_assert(SCRATCH_ALIGNMENT_BYTES >= CMA_MIN_ALIGNMENT_BYTES);
>  
>  /* The magic token for preserved pages */
>  #define KHO_PAGE_MAGIC 0x4b484f50U /* ASCII for 'KHOP' */
> @@ -836,6 +828,21 @@ static void __init kho_reserve_scratch(void)
>  	if (!kho_enable)
>  		return;
>  
> +	/*
> +	 * This is the minimal alignment required by deferred struct page init.
> +	 * deferred_init_memmap_chunk frees memory to the buddy allocator, which looks
> +	 * at the neighboring pages (up to MAX_PAGE_ORDER) to merge them.
> +	 * If KHO scratch is not aligned to that value, buddy can access uninitialized
> +	 * struct pages, which can cause a crash.
> +	 */
> +	if (WARN_ON_ONCE(SCRATCH_ALIGNMENT_BYTES < CMA_MIN_ALIGNMENT_BYTES)) {

Nit: do we need both the WARN_ON_ONCE() and the pr_err()? Can't we drop
the WARN and keep the pr_err only?

LGTM otherwise.

> +		pr_err("scratch alignment %lu < CMA minimum %lu, disabling\n",
> +		       (unsigned long)SCRATCH_ALIGNMENT_BYTES,
> +		       (unsigned long)CMA_MIN_ALIGNMENT_BYTES);
> +		kho_enable = false;
> +		return;
> +	}
> +
>  	scratch_size_update();
>  
>  	/* FIXME: deal with node hot-plug/remove */

-- 
Regards,
Pratyush Yadav
