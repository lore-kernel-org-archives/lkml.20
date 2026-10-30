Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355554;
	b=F63CsL4K0LfJPrMZIoPLa4DJPur53RKiB0wSHK630G1sAEQ6qU00F6YxL6ohqliGGabO
	 DCiyXlXqTUG0VEjMSYVV9AhbBddEpbNJnkzZ2HHiwVw12fXoi5NRC01EwBIyKSRkp1ZDb
	 yjkYJTxyD1ocOsDjc+pflmTu/LL3jCwECQqaKYuDCR7axUkTaa2ooMnB9QMnbKK48Qghp
	 bvEfxJTX9EsiLiwc3ZIBCUadrPvroNFaF9kmGn4dBBpQ3Og3/efh6Pqc7RCkKSu4SUgcm
	 lGF6Nf4qvZStsE77ZG0sOb0zWBwhwofQIvhMHru/BhfeUG4jNascZVqPYrMEawJqiiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355554;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+UyhghDqbkh6Fs4bKf9cC/vT2//GoTRNOpMJ8SvItkI=;
	b=TTm4cCggQzj6/LSdlw0w9E9MlMgywWi6bdap0qN1gkpAwNTKzei0IoBSj7tFJJH4HkDy
	 8eTA0bgiNh37jGMcaC/E0OcG3nrlbm8kpTP13RN3ifBo4YA6kQAqQDBHHG7C6F/VSCv19
	 S9HWr0sqodRAL0BEzz4PGsyIGBEs/abRMZpKR7PR06zhhQMSulkPqz/FpEzOTiXXAv5ij
	 wWulRRFpYnx+KJnR60FsJsc7XIAtlYVtCPF4FYGEICy5NYnJ4NCkO4dH701O/ChTeQp76
	 hUm7gShKyjmGJKvydrIq36jaoD+wpGbUP43o8LUH7AszRovY/3N2OtInyynSBIODc1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Phsnf3OJ;
	arc=none smtp.remote-ip=91.218.175.117
Received: from mta0.migadu.com (out-117.mta0.migadu.com [91.218.175.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17481606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17481606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Phsnf3OJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2h88SG0HENwuhHsaFHjwKEoGobN7MhTMT5AdNQYTdWM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793355551; v=1; x=1793960351;
 b=Phsnf3OJA12Yb93IF69DCa72LskXapSWk35l29hO5xHgsrvXVCidMhaDo84fxQiDsUgDzLuq
 MmMv1DgwoBH6UiFa5Qo5VgKUE4JJ8trRT2D5EPcFDamxOqjyP8ggOHwfdsGIVgRXWgDuRTKQZuJ
 aYjx+KfkUijH7SB4nPvWAAgA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 67ac1b4e1752f144;
	Fri, 30 Oct 2026 10:19:11 +0000
X-Mizu-Trace-ID: 67ac1b4e1752f144
X-Migadu-Flow: FLOW_OUT
Message-ID: <3ae9717b-ed65-426e-b06f-e25e7c2fb5f9@linux.dev>
Date: Fri, 30 Oct 2026 18:18:58 +0800
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
Subject: Re: [PATCH mm-next] mm/swap: free swap cache folios the zap path gave
 up on
To: linux-mm@kvack.org, Kairui Song <ryncsn@gmail.com>,
 Nhat Pham <nphamcs@gmail.com>
Cc: Jiayuan Chen <jiayuan.chen@shopee.com>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>,
 linux-kernel@vger.kernel.org
References: <20261014090821.227366-1-jiayuan.chen@linux.dev>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261014090821.227366-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/14/26 5:08 PM, Jiayuan Chen wrote:
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>
> On our production hosts we saw swap cache only pages keep growing for days:
> on a box with a 500 GiB swap partition, 250 GiB of RAM and 250 GiB of
> swap slots were held by folios that no process mapped any more, charged
> to cgroups whose workloads had long exited. The only way to get them
> back was swapoff, and with other services actively swapping on the
> same host that is not an option.
>
> Such a slot has swap count 0 and an unmapped folio pinned in the swap
> cache, left there after a process exited or did MADV_DONTNEED. No page
> table holds its swap entry any more, so nothing comes back for the
> slot; LRU reclaim drops it eventually, and the allocator only reclaims
> such slots once swap is half full. The growth stopped exactly there:
> at 50% of the device, where vm_swap_full() becomes true.
>
> The race is readahead against a zap in a neighbouring thread. Readahead
> works on virtual addresses, so a fault at the end of thread A's range
> pulls in the entries at the start of thread B's range:
>
>    thread A                               thread B
>    do_swap_page()
>      swap_vma_readahead()
>        swap_cache_read_folio(B's entry)
>          folio locked, added to cache
>          swap_read_folio()                MADV_DONTNEED
>            zswap_load() / bio in flight     zap_nonpresent_ptes()
>            .                                  swap_put_entries_cluster()
>            .                                    swap count 1 -> 0
>            .                                    __try_to_reclaim_swap()
>            .                                      folio_trylock() fails
>            .                                      gives up
>            folio_unlock()
>        folio_put()
>    -> slot: swap count 0, folio in swap cache, not mapped, never freed
>
> The lock is one reason it gives up. The other is writeback: with a block
> device as backing store, B's own PAGEOUT leaves the folio in the swap
> cache under writeback, and when the DONTNEED comes __try_to_reclaim_swap()
> gets the lock but folio_swapcache_freeable() refuses. The write
> completes, nobody frees the slot. The present-PTE side has the same two
> outcomes through free_swap_cache().
>
> Options considered:
>
> 1. Fix it on the readahead side: after the read, check the swap count
>     and free the slot. Covers the lock, not writeback, and the
>     asynchronous read path unlocks in the bio completion where the slot
>     cannot be freed. Two places to patch, neither clean.
> 2. swapoff/swapon clears it, as does memory.reclaim on the right cgroup.
>     That is a workaround, not a fix.
> 3. Have the side that gives up come back later. This patch.
>
> The zap runs under the PTL and the fault path takes the folio lock
> before the PTL, so waiting there is out; a worker has to do it. On a
> lost trylock or a writeback refusal under TTRS_UNMAPPED,
> __try_to_reclaim_swap() schedules si->sweep_work. The worker walks the
> in-use clusters and, for every slot with swap count 0 whose folio is
> unmapped, calls __try_to_reclaim_swap() with TTRS_WAIT, which takes the
> folio lock and waits for writeback instead of giving up.
> free_swap_cache() now calls __try_to_reclaim_swap() as well, so both
> paths give up, and wake the worker, in the same place.
>
> For now the worker scans every in-use cluster of the device; marking
> the clusters that need it can reduce that later.
>
> Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
> ---
>   include/linux/swap.h |   1 +
>   mm/swap.h            |   1 +
>   mm/swap_state.c      |   9 ++--
>   mm/swapfile.c        | 101 ++++++++++++++++++++++++++++++++++++++++++-
>   4 files changed, 104 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 4f686709d71f..5777f10e9aa4 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -267,6 +267,7 @@ struct swap_info_struct {
>   					 */
>   	struct work_struct discard_work; /* discard worker */
>   	struct work_struct reclaim_work; /* reclaim worker */
> +	struct work_struct sweep_work;	/* frees swap cache only slots a zap gave up on */
>   	struct list_head discard_clusters; /* discard clusters list */
>   	struct plist_node avail_list;   /* entry in swap_avail_head */
>   	const struct swap_ops *ops;
> diff --git a/mm/swap.h b/mm/swap.h
> index d5bf21f517dc..f62f36c0ce5c 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -309,6 +309,7 @@ static inline bool folio_matches_swap_entry(const struct folio *folio,
>    * - See the comment of get_swap_device() for more complex usage.
>    */
>   bool swap_cache_has_folio(swp_entry_t entry);
> +void swap_reclaim_entry(swp_entry_t entry);
>   struct folio *swap_cache_get_folio(swp_entry_t entry);
>   void *swap_cache_get_shadow(swp_entry_t entry);
>   void swap_cache_del_folio(struct folio *folio);
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index ebef568cd62e..99708f149b25 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -598,16 +598,13 @@ void swap_writeback_dropbehind_folio(struct folio *folio)
>    *
>    * Its ok to check the swapcache flag without the folio lock
>    * here because we are going to recheck again inside
> - * folio_free_swap() _with_ the lock.
> + * __try_to_reclaim_swap() _with_ the lock.
>    * 					- Marcelo
>    */
>   void free_swap_cache(struct folio *folio)
>   {
> -	if (folio_test_swapcache(folio) && !folio_mapped(folio) &&
> -	    folio_trylock(folio)) {
> -		folio_free_swap(folio);
> -		folio_unlock(folio);
> -	}
> +	if (folio_test_swapcache(folio) && !folio_mapped(folio))
> +		swap_reclaim_entry(folio->swap);
>   }
>   



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

