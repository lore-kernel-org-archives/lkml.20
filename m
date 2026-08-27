Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AF647B432
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841031; cv=none; b=bK7VB7NmXh60hkAaTiayrbpL6EK5g6sinl2Fme1JpzsSsnH8l6FOzO6Tof1n0AOlfMFkRMqQK1x/SxbLY4wUzaMfYWfP+FKeDm5vJau6UyHSpKe5oWmk0KCDkpZAaIY/jpkoaASxKBpa34p8cfJ1d6CWNogJoKGzgIOpeY8As6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841031; c=relaxed/simple;
	bh=BQslOEnalplZew/MCazXzBtYc+3SET08Oh+53jrB+40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGAEjsBV8lbAGzQALSzRu2Lg6p9CXySVk70SsArjLM5qWoz57nR/oHtx6RidXy+6wTjuSqjFyNGKlVbz5YjrHiEZ397hUpqbgNBfytw4NEch1BkMiWa3zWuwgKYs+zt2iosonv5eHRAoHmFbxEO7sCMEBtci667vbIxN4hJyaC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogWxMmf4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogWxMmf4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3651F000E9;
	Thu, 27 Aug 2026 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787841029;
	bh=JZQjss/9eVMDnqpAzTSDDgo1ILBujLnrsEIoF3t8dmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ogWxMmf4J62SjTNPX+WOrS0dmzcGFUnEVr01j2vBmechaE+DQJxr2knOZKhbjXdN6
	 bWAQ6gmuBui+fqEUmU1DdENHaxI7EsjIWBafxTYr2V6F/FmxsPBjE140RfKAoBXjrA
	 +GTBsVLjb3Erz1VtqVZHZkUKlQ//J1z+dnKW352ZJp0FUzJkY4Z3NX0GAZg/FGd4uU
	 Ud7qVx19ddPfdfBqy4BzGbjTXWQE5JLyfGf8k5nvzmqk/zQSbZ4zVKVpTqldChPLze
	 AmLppB5M8eEnk6rLacxZkjMUv4WrlB9HmnjnH/2iXMjOtEpouDkXOQ9NgNjBuLEOEn
	 J6eyoNZB2Fw7g==
Date: Thu, 27 Aug 2026 15:30:24 +0100
From: Will Deacon <will@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Walk page tables with interrupts disabled in
 show_pte()
Message-ID: <apBKADD1xiGWzHCB@willie-the-truck>
References: <20260815211316.974-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815211316.974-1-kmehltretter@gmail.com>

On Sat, Aug 15, 2026 at 11:13:16PM +0200, Karl Mehltretter wrote:
> show_pte() walks the page tables locklessly and can run with interrupts
> enabled, so a concurrent teardown (e.g. munmap() in another thread of
> the faulting mm) can free a table page from under it. Dereferencing the
> freed page can fault again or print garbage in the oops report.
> 
> arm64 selects MMU_GATHER_RCU_TABLE_FREE, and the documented protection
> for lockless walkers is disabling interrupts, as gup_fast() does. That
> holds off the RCU-deferred table frees and, unlike rcu_read_lock(),
> also blocks the IPI-based synchronisation (tlb_remove_table_sync_one())
> that khugepaged collapse uses before reusing a table.
> 
> Use guard(irqsave)() around the complete walk. This does not make the
> diagnostic output a consistent snapshot, but prevents it from
> dereferencing a released page-table page.
> 
> Fixes: 1d18c47c735e ("arm64: MMU fault handling and page table management")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Testing: QEMU arm64 virt guest, 2 vCPUs, debug_pagealloc=on. A racing
> page-table unmap triggered a nested fault in the walk without this
> patch, none with it.
> 
>  arch/arm64/mm/fault.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 0b52557652be6..b173eebd3cd19 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -16,6 +16,7 @@
>  #include <linux/mm.h>
>  #include <linux/hardirq.h>
>  #include <linux/init.h>
> +#include <linux/irqflags.h>
>  #include <linux/kasan.h>
>  #include <linux/kprobes.h>
>  #include <linux/uaccess.h>
> @@ -151,6 +152,8 @@ static void show_pte(unsigned long addr)
>  		return;
>  	}
>  
> +	guard(irqsave)();
> +
>  	pr_alert("%s pgtable: %luk pages, %llu-bit VAs, pgdp=%016lx\n",
>  		 mm == &init_mm ? "swapper" : "user", PAGE_SIZE / SZ_1K,
>  		 vabits_actual, mm_to_pgd_phys(mm));

Curious, but why did you add the guard before the print?

Will
