Received: from mta0.migadu.com (out-42.mta0.migadu.com [91.218.175.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA9A4F1857
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420666; cv=none; b=FnllWKmmNFku+bbYvDLnDVOWHhqgUwzuHCxNxDekbvFPPdGgXOQIYSO47esDeb8pQtwQT53W8AbQhIlIbQwTd1kvXcL1UTnkdP7UGAF8J17jV/VBDY2nc9rOtcFwQtnLgC9qBIF3v20Id140UQu5dEz+h3a6WrbzFr/wwNK/ID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420666; c=relaxed/simple;
	bh=Pdl0oIvnemB8EPi3eJVtyka3qkkaZD8i9MNNRHe/YMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PV9ZvDZlTNAvE3lYF/KH381FF1Ha+Few2sZ/Yjx2SeS9rP9H5D8gvulPKoX7z3QTInZ9RD1srfM/wdkl1/0WEHJ0i0QcWynWi3+kzFIpscJDF0ODE1Yd5Z6fmtvyn7KoJ8jUdNUHc1yMWMOcfBaeiZHKbJE6/cug6UPJKX9jk0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f97OAP5B; arc=none smtp.client-ip=91.218.175.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f97OAP5B"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Pdl0oIvnemB8EPi3eJVtyka3qkkaZD8i9MNNRHe/YMY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792420662; v=1; x=1793025462;
 b=f97OAP5BN7Wt/TqBKXZRCA//6c9Vt0KGOvJycBfzIt80H0n1wsUgg0mf5k3n9iUig8jc7QlD
 M42qC81bKrpiVdEokef8iqFz9r17pyESMGyjNTYFrcqWV+UiSavQsAqJirFSmzTl0ZbN4kL6Xty
 5tRgr+UM2Jgn5ipJrBwh4rVc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 87511d3e1b116c5b;
	Mon, 19 Oct 2026 14:37:42 +0000
X-Mizu-Trace-ID: 87511d3e1b116c5b
X-Migadu-Flow: FLOW_OUT
Message-ID: <4f361479-1dbc-4f09-aa26-e1ad6c06cbee@linux.dev>
Date: Mon, 19 Oct 2026 22:37:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-next] mm/swap: free swap cache folios the zap path gave
 up on
To: Nhat Pham <nphamcs@gmail.com>, Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>,
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>,
 linux-kernel@vger.kernel.org
References: <20261014090821.227366-1-jiayuan.chen@linux.dev>
 <CAMgjq7D50X47JFsTnF2-jYGv7i-Nd3WhQLK-TJGy4XkhMQU4OQ@mail.gmail.com>
 <62d17959-d695-4fec-a87b-8eadaaf995a8@linux.dev>
 <CAMgjq7CJ+bwKgwUmCzO9Hr7TrL68bDjgAsLx-4AGuXo6zowh9g@mail.gmail.com>
 <CAKEwX=O4sPx5MtGL4-JwLzD4TWm7fNycFMiuOqLk4ADFUUipNg@mail.gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <CAKEwX=O4sPx5MtGL4-JwLzD4TWm7fNycFMiuOqLk4ADFUUipNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/17/26 3:28 AM, Nhat Pham wrote:
> On


[...]

> /proc/meminfo | grep Swap
> SwapCached:     489006260 kB
> SwapTotal:      976561148 kB
> SwapFree:       487554888 kB
>
> cluster_alloc_swap_entry() picks clusters from nonfull_clusters first,
> then free_clusters; it looks at frag_clusters only when both are empty,
> and at full_clusters only when vm_swap_full(). A cluster gets onto
> nonfull_clusters in partial_free_cluster(), that is when
> __swap_cluster_free_entries() frees a slot in it; after
> alloc_swap_scan_cluster() has used it, relocate_cluster() moves it to
> frag or full.
>
> A leftover slot has count 0 and a folio, so __swap_cluster_free_entries()
> never runs for it. Once the live slots of a cluster are gone, nothing
> calls partial_free_cluster() on it again, it stays on frag or full, and
> cluster_alloc_swap_entry() doesn't pick it until the device is half
> full. That is what the swap table looked like after the run:
>
> list      clusters   leftover slots
> FULL        106415       54484480   (all 512 slots leftover)
> FRAG         44822       18471614
> NONFULL          1              0
>
> Making cluster_alloc_swap_entry() revisit those clusters means changing
> the list policy.
>
>
>
>>>> Or, from the LRU's side, put swap readahead folios at the tail. I'm
>>>> actually trying to do that and it's not very easily doable at the
>>>> moment but will soon be easy to do.
>>>
>>> That helps the RAM side under pressure but doesn't give the slots
>>> back.
>>>
>>>
>>>>> Options considered:
>>>>>
>>>>> 1. Fix it on the readahead side: after the read, check the swap count
>>>>>      and free the slot. Covers the lock, not writeback, and the
>>>>>      asynchronous read path unlocks in the bio completion where the slot
>>>>>      cannot be freed. Two places to patch, neither clean.
>>>> In fact, readahead checks the count before starts the read. It should
>>>> prevent some of the problems but seems not enough.
>>>
>>> Right, the count is still 1 at that point. The zap drops it to 0 while
>>> the read is in flight, after the folio is already in the swap cache.
>>>
>>>
>>>> And another idea, what if we just add dropbehind flag or rotate the
>>>> folio, if folio_try_lock failed in __try_to_reclaim_swap?
>>>
>>> dropbehind would work for readahead and writeback if the read
>>> completion honoured it too; today only folio_end_writeback() does, for
>>> zswap writeback folios, and swap_writeback_dropbehind_folio() expects
>>> the folio off the LRU. It still misses other lock holders (migration,
>>> split, ...). Rotating only helps under memory pressure.
> Yeah might be worth trying. You'd have to modify readahead and zswap
> load logic to check folio_mapped() etc. I suppose...
>
> I'm not sure how reliable it will be FWIW. There is still a race
> window right? Albeit a bit smaller - the readahead thread might check
> the dropbehind flag before __try_to_reclaim_swap() sets it.
>
>> Right.. But I think it will be much better to avoid such folios from
>> hunging in the swap cache in the first place instead of having a
>> worker to reclaim them. I'm not strongly against adding a reclaimer if
>> other approaches are too difficult at this point though.
> Also, IIRC, dropbehind can only be handled in task context, right?
> We'd need to make readahead bios to complete in task context
> (BIO_COMPLETE_IN_TASK). I wonder if this has any perf implications.
>
> Another idea: how about, in swap_read_folio(), where we are guaranteed
> to have the folio's lock, we check if folio is mapped. If it's not,
> invoke folio_free_swap(), unlock, put, then drop that folio from the
> submit batch?

At that point the swap count is still 1; the zap comes while the read
is in flight. Checking after the read works for the synchronous zswap
path, which I tried first, but the bdev read is unlocked in
swap_bio_read_end_io(), in interrupt context, where the slot cannot be
freed.


> That takes care of the readahead race. Seems safe to me
> (I assume if a folio is not mapped and swap count == 0, then it's a
> pure readahead artifact, but maybe I'm missing a case).
>
> The write direction already tries folio_free_swap() before submitting
> the writeback, FWIW.

Same shape: the zap arrives after that check, while the folio is under
writeback. On our box with a swap partition that is where most of the
leftover came from.

Every check on the holder's side runs while the count is still 1. Only
the zap sees it go to 0, and it cannot wait. That is why the patch has
the zap hand it over instead (very nasty i know it :( ).


> So that takes care of both directions. But who
> knows - maybe we still have a small race window, and that's bad
> enough.
