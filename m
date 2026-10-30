Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355125;
	b=tCiPnAK6Ad4dcN9aNZ5qgl3tEM2q2iyX7LBO/MLO+Ij3e6IWXso7zQa2H7olzkoP82ps
	 pVUZm77u3MJQZzZXfnwOz3wQ3shrprefpKgsVN10xjmt+IO18gymaWRZmMOcm8LQoyZ5U
	 1mSG1fOK6AXPSNL8SFSd81zk37p0By/QU0uSKimZ4I4vu7fdY1F4U68d2aJU5WtFgkAly
	 wI3YKp/lhl+eACOn81S3Uy50bqKlMq/tZ3B8EgxyZh1a3L8LdlCyGc72/S46M3isxZMdh
	 L0oplJUpWSeJ4PmeMJnI5D0l5HN7aJjclLbdgR2Sh72u2e6Quro4RDdulCO1PDQ22VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355125;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sTBQskGF0pRfZtCmZB2evU3aYqcLsQnaOI3cIHml41Q=;
	b=C6fuQcYyr812dIM90MawgLpei4Av50JVPoHIXdWGgpzGWbtqXb6TEorVGx62uGff6RZP
	 /CFlfm1LgOFWqmauiTsFMmCNmO0k8ge06cOkHoCF5tJkHNpx+vNqqeWX1rz4BWHBylcRL
	 ghI/dTHacBU2rSonQLVm5dRnJSsJ+6wnf58b1zObCg6sT81uURVCiw4bRoEWxqT69Lzn+
	 SDrbLBTp+FFaCvV6L+8XxQ3BUZiaKDIMAkygvtN3DLYv3tiraKD7fvxOcA4O3iax84J6G
	 pJFjpY7pyuBMtWzvxRRYRWP6PQc1Y0fZ6KjE6gaINh8MTr6nVKAFUbzBlkPkDhL8CRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Z4K6iNgA;
	arc=none smtp.remote-ip=91.218.175.251
Received: from mta0.migadu.com (out-251.mta0.migadu.com [91.218.175.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1908606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1908606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Z4K6iNgA
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zVJUTxa87d/kLUCCODvqIoVfNUNdZFqklj/vKt8Altw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793355121; v=1; x=1793959921;
 b=Z4K6iNgAXgt3aRc6YYkkY0fxOQHM6AKCB7VSMV12z+8xps3oRbY6R6XCXjh9fWeSTAAUW7m4
 GzTnfaVWr9vCSiVsjqkKWhz8l/a2nurVGfUbqC6itkneIFNftchCLQMY8R9bcmeE6jBXiAVr44P
 EURN/BFFNLKyuePDXHIxayZc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 230bc242ec33716c;
	Fri, 30 Oct 2026 10:12:01 +0000
X-Mizu-Trace-ID: 230bc242ec33716c
X-Migadu-Flow: FLOW_OUT
Message-ID: <23a3fa60-9489-48ff-ab0e-38a865d6bde7@linux.dev>
Date: Fri, 30 Oct 2026 18:11:51 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/swap: fix swap_cache_get_folio() returning a folio
 that left the swap cache
To: linux-mm@kvack.org, Kairui Song <ryncsn@gmail.com>,
 Nhat Pham <nphamcs@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Jiayuan Chen <jiayuan.chen@shopee.com>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>,
 linux-kernel@vger.kernel.org
References: <20261015060528.302634-1-jiayuan.chen@linux.dev>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261015060528.302634-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/15/26 2:05 PM, Jiayuan Chen wrote:
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>
> swap_cache_get_folio() reads the folio from the swap table and takes a
> reference with folio_try_get(), without any lock. If the folio is
> removed from the swap cache and freed in between, and its memory gets
> reused, folio_try_get() still succeeds and we return a page that has
> nothing to do with the swap entry:
>
>    CPU 0                                  CPU 1
>    do_swap_page()
>      swap_cache_get_folio()
>        swp_tb = swap_table_get()
>        folio = swp_tb_to_folio(swp_tb)
>                                           madvise(MADV_DONTNEED)
>                                             zap_nonpresent_ptes()
>                                               swap_put_entries_direct()
>                                                 swap_put_entries_cluster()
>                                                   __try_to_reclaim_swap()
>                                                     swap_cache_del_folio()
>                                                     folio_put()   <- freed
>                                           page reused, e.g. as an anon
>                                           folio of another task
>        folio_try_get(folio)               <- succeeds
>        return folio
>      swap_update_readahead()              <- may clear PG_readahead on it
>      folio_lock_or_retry()                <- locks it
>      folio_matches_swap_entry() fails, unlock and put
>
> filemap_get_entry() does the same lockless lookup for the page cache,
> and after folio_try_get() it rechecks the xarray, because the folio may
> have been freed and reused in between. swap_cache_get_folio() lost
> that recheck when the swap cache moved to the swap table.
>
> So CPU 0 writes to a folio it doesn't own: it may clear PG_readahead and
> takes the folio lock of someone else's page, before
> folio_matches_swap_entry() finds out the folio is not ours.
>
> Recheck the slot after folio_try_get() and retry if it no longer holds
> this folio.
>
> Fixes: 8578e0c00dcf ("mm, swap: use the swap table for the swap cache and switch API")
> Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
> ---
> https://sashiko.dev/#/patchset/20261014090821.227366-1-jiayuan.chen@linux.dev
> ---
>   mm/swap_state.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index ebef568cd62e..d9e36c505398 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -92,17 +92,27 @@ void show_swap_cache_info(void)
>    */
>   struct folio *swap_cache_get_folio(swp_entry_t entry)
>   {
> +	struct swap_cluster_info *ci = __swap_entry_to_cluster(entry);
> +	unsigned int ci_off = swp_cluster_offset(entry);
>   	unsigned long swp_tb;
>   	struct folio *folio;
>   
>   	for (;;) {
> -		swp_tb = swap_table_get(__swap_entry_to_cluster(entry),
> -					swp_cluster_offset(entry));
> +		swp_tb = swap_table_get(ci, ci_off);
>   		if (!swp_tb_is_folio(swp_tb))
>   			return NULL;
>   		folio = swp_tb_to_folio(swp_tb);
> -		if (likely(folio_try_get(folio)))
> +		if (!folio_try_get(folio))
> +			continue;
> +		/*
> +		 * The folio may have been freed and its memory reused before
> +		 * we got the reference. Make sure it is still in the slot.
> +		 */
> +		swp_tb = swap_table_get(ci, ci_off);
> +		if (likely(swp_tb_is_folio(swp_tb) &&
> +			   swp_tb_to_folio(swp_tb) == folio))
>   			return folio;
> +		folio_put(folio);
>   	}
>   
>   	return NULL;




I spent some more time on this and I'm not happy with any of the
options I have. Advice welcome.

   1. Trigger the worker where the zap gives up (this patch). On the
      swap entry side that works, __try_to_reclaim_swap() has the si.
      On the present PTE side it doesn't: free_swap_cache() lost the
      trylock, so it can't read folio->swap to find the si, as Kairui
      pointed out. And that trylock-and-give-up is not in one place,
      free_swap_cache(), do_wp_page() and __uprobe_write() all have
      their own copy. Chasing every one of them doesn't feel right.

   2. Clean up at memcg offline. Doesn't cover the root cgroup or a
      cgroup that stays alive, and on mm-new the folios are reparented
      at offline anyway, so there is nothing left to find there.

   3. A swapon flag, say --clean-cache, that enables the cleanup.
      Pro: covers everything, and the cleanup can live in its own
      function without touching the existing paths. Con: we know to
      turn it on because we hit this, others won't. Needs util-linux
      too.

   4. A per-device worker that walks the device on its own, say 1024
      clusters per second, backing off when a pass finds nothing.
      Pro: same as 3, and nothing to turn on. Con: a worker that wakes
      up on its own for this, I expect objections.

   5. A sysctl (or a drop_caches bit) to kick the cleanup by hand.
      Pro: same as 4, all in the worker. Con: same as 3, someone has
      to know to poke it.

4 is the one I'd pick if nobody objects. Thoughts?

