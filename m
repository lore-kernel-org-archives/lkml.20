Received: from flow-a3-smtp.messagingengine.com (flow-a3-smtp.messagingengine.com [103.168.172.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D70B394EBA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382347; cv=none; b=rxelrgaiw94YojtP9wwIHjuMYoojU2tR9sMg6gJBeITYPsquu0Xwm1kZpR3CcK+KvvKzXY7YK8Ocmu29r5rZLHEuByth1s0bWjvNpM+E37eyAf1JF1lqH0X9X9uwtVOmHUznpfOsZOz9PL1BF2IlpV8q6t/cLUYf0BZ96EMl8gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382347; c=relaxed/simple;
	bh=8TvghD8fb9Zy5mvArgTkNTHXlyXRFErq8WIJuI1R2q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwDiUT4GsIWR0BIDEdGNvHklJ8kIyVJtHxby05UF9XPeJhKSyQ4epXJIdvdiZE289/E0zL0RfPjQKfIYYnsjTaYvjt7YrsGWu43sRWiRtWoCcn8S8NDjK1UfVzYMisSzLTOIuMVEgmqJjaxazpdZ3D5hUcVkJIBi9qaXBBl9D2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Yppxdr+9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kQbg7u48; arc=none smtp.client-ip=103.168.172.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Yppxdr+9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kQbg7u48"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 52D591380189;
	Mon, 14 Sep 2026 06:39:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 14 Sep 2026 06:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789382344; x=
	1789389544; bh=vydnH135QpbJgGMFtNUv3g8AnqjoSBdujNdUzisGZV8=; b=Y
	ppxdr+9sIO3inCy2Zet2IFqjSwyGWnwvFWdKrvKchoOYmXsEW1Bv9jW0wbQCJyyg
	MqGwl15buCJVZsoxWa5ihyX+mdhDbxRsxHeBwxe/8XkdXSjY/oGAkYxxb3gKPNBv
	+ojPfFQ34viBG5WjHOntnQ3G3QfXjv3MFQz2tgwtqlWdqIlK4nbitjQ/G8rB61JL
	t+zsd4S8YPmxJWm+SWYxLp56n4Im03XG92c0Ta90CiN4b8IBNggNFPcQSvu+iTYI
	XRgaiXcogiNoDAS1o8++f9TqB97QztfM15IEC9OniB1oiHg/y/cGusMDJmj8ySkC
	NOm1uqV2831kK1RImXe7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789382344; x=1789389544; bh=vydnH135QpbJgGMFtNUv3g8AnqjoSBdujNd
	UzisGZV8=; b=kQbg7u48+y9tnA18y/82bF7gpzqoK1xlC0km9vFBiOhuYdzMsqQ
	wv8+Mr5pLHDcwLMVbIsx41JjGGzCiVcfH4l3DbId0VNjxbml6Uxj1TFJmkGTRSQe
	atwz2M0Sv1z8zjTveRdfFoMZvkAoTIfFtDgVl6iYP4ar2lxbx8JLLv1+eitSxJNu
	6V2xb8Lw8GLxYW9YjqB8TlmLsNyF3/LX3cUiCUMl9ccLGJSJL8k4sakUXFSjl00H
	Jpak+liWVEA5krqYPXA2wuOR2IDwiBRU/OQ8MDhvE/6eI5mR3KEEUNadLQukPNeS
	k7MroZwuK8ZL7l2z2284shSi6yyT2RFgFiA==
X-ME-Sender: <xms:xs6nagFUSJFkutUT8tTYk0_GfibJgi0JVVYc2fojXtAVRRuqp44Spw>
    <xme:xs6nany7oXjXLGzFVLY1cy_g6DLuX8PbvCEmFbBm0ablQfhVDXN5_COVsKr1SAEAw
    L0IVIXtCFUbYIxhWK78tTPMekKtm7maPs1_qa5DyGNtPJlG0mSkhmWC>
X-ME-Received: <xmr:xs6nahTDCgkwZGAyFGywYEOqDnckskH7i1CGEtWOL-M6qLxRqoBKQZKLl9w>
X-ME-Proxy-Cause: dmFkZTGiQOIHw77ggY3DlkCXQlXCz8IImeccgwXV7ZHAyBfhRJ+QMHaWjJMnXPmuSwFSAn
    aaA5a5aZytYVxDOEkRZwzAMYrUN5yu6KO5igraE5IQbw89Oae2bj7upLv2siaMdI87K+7K
    aDxg+srjkcWNkZ9mq4+mr7JSydd1Uh0l5MFl0m9dFbzE6xiBoYeP/gaZAorLEUc0gjpNPF
    BlytW0gd6Xt1q3rdYRogjsTo7RQxJ3A1K0cF0lHLusSVWg/BD95pgd2oon1ZU5OJuO8cKr
    df9ieBPv9ai4ZfUANvnOmwenyCHczi7vRcjan4EMvof1gvN7+71qzZoz0skg7ceEeYeTSW
    iC2SVG7wH2jvSAcGrCPn2En+Hlmv3l29qymMA0DgSsAoVTf4h0lc/Sa0yVEeS4LJ8CytH0
    Y2wbAKv6hmu6E1gEEE9gVc/gQUA6O7tvDvTk3FMOnpWH+LjE7CAP30Bedp3hnpdoIvJ4GT
    UmT23P4hWJity8KSB7eoRI1woG9aGqRyG4HW/vZAcMW3351XCb1VsHLDJhVLAMy4ouwc59
    xtmEXeyWItcdCDF+foURYzSbI+b4jRXxDDuRik8npdM4BVk42i/3S+ElDAJJooRS6FsYWL
    er7GgSXW0ZTervo6e39TuRcESSAUlE//A2a0wuaIxux/GX+GpZ0tN0mgRx7w
X-ME-Proxy: <xmx:xs6nalq8g2WjDv9p7btSshK2qnJXITGaDxgHiJsxUvpfkD8vjXRySw>
    <xmx:xs6napsqLGX7SzZRe_u4jzV0aMLLUE66sgel41Y5uvIR7qSxlJu59A>
    <xmx:xs6naisbmz1XkB2_lmqbQ85t8MHzLmPMrUl6Bnc8uhGbGFv1QMtIBw>
    <xmx:xs6nalrmRWX_5SXJv-luMbGbcyMuSnfWXQ9aWzaUZLSDAbV-EYJvCQ>
    <xmx:yM6nalYWcG7cpQtVdUpaBNMt7VNwiT-_mdpG0Wxb-gQOOzarMYMqOd7H>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 06:39:01 -0400 (EDT)
Date: Mon, 14 Sep 2026 11:39:00 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: akpm@linux-foundation.org, andrew+netdev@lunn.ch, apopple@nvidia.com, 
	artem.kuzin@huawei.com, baolin.wang@linux.alibaba.com, david@kernel.org, 
	Liam.Howlett@oracle.com, edumazet@google.com, harry.yoo@oracle.com, 
	hramamurthy@google.com, ivgorbunov@me.com, joshwash@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	muchun.song@linux.dev, pfalcato@suse.de, rppt@kernel.org, surenb@google.com, 
	torvalds@linuxfoundation.org, vbabka@suse.cz, willy@infradead.org, yuzhao@google.com, 
	ziy@nvidia.com
Subject: Re: [PATCH v6 3/3] mm: implement page refcount locking via dedicated
 bit
Message-ID: <aqe-sLv4L5SOHA6l@thinkstation>
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
 <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>

On Sat, Sep 12, 2026 at 10:50:10PM +0300, Ilya Gladyshev wrote:
> The current page refcount implementation uses a single counter value
> (zero) as dead. So, to prevent incrementing a dead refcount in
> folio_try_get(), it fundamentally requires a CAS loop.
> 
> This CAS loop can act as a serialization point and can become a
> significant bottleneck during high-frequency file read operations
> [1][2].
> 
> This patch reallocates the refcount value range:
> 
> (1) refcount < 0 means dead refcount (uninit / frozen)
> (2) refcount = 0 allowed only as a temporary state (see below)
> (3) refcount > 0 is a regular reference count
> 
> In other words, refcount is now split into "dead bit" and a 31-bit
> counter.
> 
> Refcount decrement now works as follows:
> 1. Counter decrement
> 2. If it is now zero, try to put it deep inside the dead zone
>    (CAS to INT_MIN). Or you can view it as "set up frozen bit and reset
>    counter".
> 3. This CAS can fail only if someone grabbed a reference in-between --
>    that's okay, this page is their problem now.
> 
> The size of the dead zone allows performing an optimistic increment
> inside page_ref_add_unless_frozen(), replacing the previous read + CAS
> loop with a single RMW operation. This reduces cache line bouncing and
> improves scalability, especially in NUMA scenarios.
> 
> [1]: https://lore.kernel.org/all/20251017141536.577466-1-kirill@shutemov.name/
> [2]: https://lore.kernel.org/all/CAHk-=wj00-nGmXEkxY=-=Z_qP6kiGUziSFvxHJ9N-cLWry5zpA@mail.gmail.com/
> 
> Reviewed-by: Artem Kuzin <artem.kuzin@huawei.com>
> Co-developed-by: Ivan Gorbunov <ivgorbunov@me.com>
> Signed-off-by: Ivan Gorbunov <ivgorbunov@me.com>
> Signed-off-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
> Acked-by: Linus Torvalds <torvalds@linuxfoundation.org>
> ---
>  include/linux/page-flags.h | 13 +++++++++++++
>  include/linux/page_ref.h   | 30 +++++++++++++++++++++++++-----
>  2 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 7a863572adce..b19721e0e7ca 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -196,6 +196,19 @@ enum pageflags {
>  
>  #define PAGEFLAGS_MASK		((1UL << NR_PAGEFLAGS) - 1)
>  
> +/* Most significant bit in page refcount */
> +#define PAGEREF_FROZEN_BIT BIT(31)

I am not sure about the naming here. I would expect _BIT to be 31.
Maybe we should name it _MASK?

#define PAGEREF_FROZEN_BIT	31
#define PAGEREF_FROZEN_MASK	BIT(PAGEREF_FROZEN_BIT)

> +
> +/* Page reference counter can be in 3 logical states,
> + * which are described below with their value representation
> + *        state              |         value
> + * (1)  safe with  owners    |   1...INT_MAX
> + * (2)  safe with no owners  |         0
> + * (3)  frozen               |  INT_MIN....-1
> + *
> + * State (2) can only temporarily occur inside dec_and_test.
> + */
> +

Do we what to enforce your comment about (2)? VM_WARN() in
page_ref_dec(), page_ref_sub() and _return() variants?

BTW, I wounder if all these VM_WARNs makes DEBUG_VM=y kernel too slow?
Do we need a separate config option to debug refcounts?

>  #ifndef __GENERATING_BOUNDS_H
>  
>  /*
> diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
> index 82ff3a99297a..cc7a9d7db504 100644
> --- a/include/linux/page_ref.h
> +++ b/include/linux/page_ref.h
> @@ -64,7 +64,7 @@ static inline void __page_ref_unfreeze(struct page *page, int v)
>  
>  static inline bool __page_count_is_frozen(int count)
>  {
> -	return count == 0;
> +	return count & PAGEREF_FROZEN_BIT;
>  }
>  
>  static inline bool page_is_frozen(const struct page *page)
> @@ -79,7 +79,12 @@ static inline bool folio_is_frozen(const struct folio *folio)
>  
>  static inline int page_ref_count(const struct page *page)
>  {
> -	return atomic_read(&page->_refcount);
> +	int val = atomic_read(&page->_refcount);
> +
> +	if (unlikely(val & PAGEREF_FROZEN_BIT))
> +		return 0;
> +
> +	return val;

I was worried about the branch in the hot path and wanted to propose a
branchless hack -- val & ~(val >> 31) -- but compilers seem to be good
enough to generate CMOV. The hack produces one more instruction.

>  }
>  
>  /**
> @@ -150,7 +155,7 @@ static inline void init_page_count(struct page *page)
>  
>  static inline void set_page_count_frozen(struct page *page)
>  {
> -	set_page_count(page, 0);
> +	set_page_count(page, PAGEREF_FROZEN_BIT);

Are you sure we covered the cases that do frozen -> 1 transition with
page_ref_inc()?

Patch 2 switches __init_zone_device_page() to set_page_count_frozen().
Who unfreezes them?

Looking dax_fault_iter(), it seems to be done by folio_ref_inc() there
for FS_DAX case. Switching to PAGEREF_FROZEN_BIT would break it, no?

It seems some more ground work needed.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
