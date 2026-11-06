Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999775;
	b=Y9qis4KnPjZVMfsppdjywXcjOvq9g2a0SuFfaPxJZ1nvUbhYe7x+f+3tdNcA4GXEB0My
	 DytBI6DfB+xfVdvuf71HQVqlz0Lf7wF2lnrg0HkWz4FX9+xDFcT8bZmQWJq59YDkEqaED
	 LFd8Q06huCiM/OAjJjwGBLIzab2qeHjDQTSJiNv9/e58UZyZhvVDyob0oSQXFCfVVRCoC
	 Sc1bqwHwOazhkxHNOxZpwztFfBPcOYvihN1rgu3vsOsPG/ccb+TFpbIN1qzuuSfk/Virj
	 WaMSRysJUr/oBj8cbDQ5XqrifKc/L+/Fjw+poxNVjh9+s1N0GeqZxWs2O9IxRdzBEDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999775;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lGIry59/kztjQjrt6vun5/zmI1Vxrfxdl0pZwMKu6dk=;
	b=P1DEBLe21/Z2dA41YOATclY/hKseYkVIFJ+CJfT4ksrKh40pP5EhksbFWMFm5DH4sfJy
	 BMbCL3hLiOXwR/vNwUisU9MbVY6vhPvIpo5P6NHqh5fDUpRBC5pxUkHcPfLyARe0bZGAl
	 S8078RmuKBbPor8OrOWNcn8373r7zomrrylww5TBrmcXwMgiqK94wpvw+5pQiEYaahJ6t
	 hrPw2iNq9mIBRaf+do030vUK4AW2ezaIacnZX62zMC6mf08NoJccOptUTaMs7HGcdG+8H
	 +Puvls5J2hxJW28HCpJjmV1JZQAQWTT64hrPFSFhP1Iu4MUYwSoq9ycFVvvQW9zBBig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHkxMzoj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D58606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHkxMzoj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224811F0089F;
	Fri,  6 Nov 2026 21:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793999775;
	bh=lGIry59/kztjQjrt6vun5/zmI1Vxrfxdl0pZwMKu6dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KHkxMzojGNv82WuwiAhohEz5muS6LECPJGM545RBj1EfFNYtPurIgbEssNtN2VQLx
	 8L8OsE2Lkv2BnuGTihJubUE/ExDn4RDMSpFu7LorsuwNEV+8WcZQCnu3P+Dfvixu5d
	 a3Vh8AFreDjKwd2g9bMyFrz9x8dB+mhfyKxy91vMN+ZDjh1Mwi3Fa5t4ASSaHqxivC
	 UW3uS0exUkF36cOnL640O0PfBs61LoFpl7clTBXPKybP4+eXwURCpDBWCevt+vI7ay
	 rDQgN9C83HQMOAZdaa03R0awimi3M4Isxnjgt7RQgqn/Z8joo5eFkVENzxge/Q+P0x
	 aCbtD+foXHZDw==
Date: Fri, 6 Nov 2026 21:16:12 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	chrisl@kernel.org, kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, 
	linux-mm@kvack.org, chenhuacai@kernel.org, ying.huang@linux.alibaba.com, 
	Baoquan He <baoquan.he@linux.dev>, willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org, 
	riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org, 
	baohua@kernel.org, dev.jain@arm.com, baolin.wang@linux.alibaba.com, 
	Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com, 
	Vlastimil Babka <vbabka@kernel.org>, lance.yang@linux.dev, linux-kernel@vger.kernel.org, 
	nphamcs@gmail.com, shikemeng@huaweicloud.com, qi.zheng@linux.dev, 
	luizcap@redhat.com, kernel-team@meta.com
Subject: Re: [PATCH v9 16/32] mm: zswap: reject high-order swap cache
 allocations backed by zswap
Message-ID: <au5CgmSHCebwhNMa@google.com>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
 <20261105183940.2236717-17-usama.arif@linux.dev>
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
In-Reply-To: <20261105183940.2236717-17-usama.arif@linux.dev>

On Thu, Nov 05, 2026 at 10:39:00AM -0800, Usama Arif wrote:
> zswap stores swapped-out pages one at a time, so a range of swap slots can
> be split between zswap entries and the backing device. A high-order
> swap-cache folio over such a range cannot be read back in one go: the disk
> read would return stale or zero data for every slot zswap owns.
> 
> Reject that in __swap_cache_alloc(). Do the check after the folio is in the
> swap cache: from that point zswap can neither start storing nor start
> writing back any slot in the range, so the answer is stable. Callers
> already fall back to order-0, which zswap_load() handles per page.
> 
> Co-developed-by: Alexandre Ghiti <alex@ghiti.fr>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  mm/swap_state.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index a8a486b0403ab..f41e740a91b87 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -12,6 +12,7 @@
>  #include <linux/kernel_stat.h>
>  #include <linux/mempolicy.h>
>  #include <linux/swap.h>
> +#include <linux/zswap.h>
>  #include <linux/leafops.h>
>  #include <linux/init.h>
>  #include <linux/pagemap.h>
> @@ -482,6 +483,17 @@ static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
>  	__swap_cache_do_add_folio(ci, folio, entry);
>  	spin_unlock(&ci->lock);
>  
> +	/*
> +	 * Now that the folio is in the swap cache, zswap can no longer start
> +	 * storing or writing back any slot in the range, so this is a stable
> +	 * answer. Reject a high-order allocation over a range that already
> +	 * has per-page zswap entries.

Probably worth mentioning *why* we reject the folio is part of it is in
zswap.

> +	 */
> +	if (order && zswap_is_present(entry, nr_pages)) {

I am curious how often this fails in practice when zswap is enabled and
how often do we end up churning the lock and swap allocation for no
reason. I am mainly wondering if a lockless check at the top of the
function would be useful.

Anyway, this looks good:

Reviewed-by: Yosry Ahmed <yosry@kernel.org>

> +		err = -EBUSY;
> +		goto delete_folio;
> +	}
> +
>  	if (mem_cgroup_swapin_charge_folio(folio, memcg_id,
>  					   vmf ? vmf->vma->vm_mm : NULL, gfp)) {
>  		err = -ENOMEM;
> -- 
> 2.53.0-Meta
> 
