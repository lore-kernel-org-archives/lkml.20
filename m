Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355484;
	b=f2JacLD3FsPSN8zL0kGSaafjPdXOgkCxWp7rNjMFS+X594HtHaT30H7nyAa1RZuVehrG
	 1iiIaOqDXOSFziKCADXgX1U3ahkcKfnOkCwoJbXvXpXi/ymu9PV79/7H+/hgCYQxqDyY6
	 sS0HQ1aHkH9R4x7BD3DQ3k6Ns+0O+MAJE9ZaYWQFAsq4gikIQVc2rs0GUCMdGZeec0/BP
	 DtGk4RI1t/s4ZJlFq6a+XfaLuAso7fDSDrxb3kCq6QcVUtPFNyUieChpa2XelKZldbTl+
	 gL8paEg+pxRdX0Z+iPiAZiOkAvV7fAFDKSpaOsooP+m+7NA0TCT/QM8WCqlzLOKUezg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355484;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9yXaqoh5s4PPf38iH+x6/oHHC3PWrUNwJu1/pUiEDlE=;
	b=grsvQ0uIZBP1keR6h2drkmYhnfyxiCBbiXjLxm+6+Ax/sI0i9p0ISKrKBK68dJpNpFL3
	 SQR/MYKZR+C0zEnhUw5ccpCBqDX8gsBy4dia63u6w6SwS1F1PFSHihfSf6ZkuCijAzhei
	 235U40nhuWCawC1wclHDPhCmqfl8qf0eZHRrXZsNZMqELb8u3P1WM5VlB+ICh6mpnocBo
	 31TbBbE+R+9Dmj/PwOGGIZDCXmSS31sWLERa5sqBWtZBzHCfyHdpOu4O78dSEim/GuXAV
	 J6nqZd8xy4NMgOiwp8JSbeYMvS2s0GboR8kSYQEGCLAZrwE67JFLT++WER0KD6OqOKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="USh/uglF";
	arc=none smtp.remote-ip=91.218.175.97
Received: from mta0.migadu.com (out-97.mta0.migadu.com [91.218.175.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8447606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8447606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=USh/uglF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jxdOHkyiVlgx0ljrE8WPZ+UvQQ8nJ+n+xgvwtsmeeU0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793355481; v=1; x=1793960281;
 b=USh/uglFKtNIE72pa2slhmXIbXPLaJ/+BKMtF37xJQh6jZZlIZwL/3d/OSdInl2NsZsqoQEF
 hpPN4QWYMP+4pZasQ5EPNX5RQenkNVPjhFRuWDPdeRLxQPuadxWLQcvmXIP0eFpZM1LSuChbB4l
 HZ6iG6pYa0cpQdns3OJmVWbQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e316e627bb9b034f;
	Fri, 30 Oct 2026 10:18:01 +0000
X-Mizu-Trace-ID: e316e627bb9b034f
X-Migadu-Flow: FLOW_OUT
Message-ID: <0f0f8e9d-b7c7-4032-9045-8d910d763e27@linux.dev>
Date: Fri, 30 Oct 2026 18:17:49 +0800
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
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: linux-mm@kvack.org, Kairui Song <ryncsn@gmail.com>,
 Nhat Pham <nphamcs@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Jiayuan Chen <jiayuan.chen@shopee.com>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
References: <20261015060528.302634-1-jiayuan.chen@linux.dev>
 <23a3fa60-9489-48ff-ab0e-38a865d6bde7@linux.dev>
In-Reply-To: <23a3fa60-9489-48ff-ab0e-38a865d6bde7@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/30/26 6:11 PM, Jiayuan Chen wrote:
>
> On 10/15/26 2:05 PM, Jiayuan Chen wrote:
>> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>>
>> swap_cache_get_folio() reads the folio from the swap table and takes a
>> reference with folio_try_get(), without any lock. If the folio is
>> removed from the swap cache and freed in between, and its memory gets
>> reused, folio_try_get() still succeeds and we return a page that has
>> nothing to do with the swap entry:
>>
>>    CPU 0                                  CPU 1
>>    do_swap_page()
>>      swap_cache_get_folio()
>>        swp_tb = swap_table_get()
>>        folio = swp_tb_to_folio(swp_tb)
>>                                           madvise(MADV_DONTNEED)
>> zap_nonpresent_ptes()
>> swap_put_entries_direct()
>> swap_put_entries_cluster()
>> __try_to_reclaim_swap()
>> swap_cache_del_folio()
>> folio_put()   <- freed
>>                                           page reused, e.g. as an anon
>>                                           folio of another task
>>        folio_try_get(folio)               <- succeeds
>>        return folio
>>      swap_update_readahead()              <- may clear PG_readahead 
>> on it
>>      folio_lock_or_retry()                <- locks it
>>      folio_matches_swap_entry() fails, unlock and put
>>
>> filemap_get_entry() does the same lockless lookup for the page cache,
>> and after folio_try_get() it rechecks the xarray, because the folio may
>> have been freed and reused in between. swap_cache_get_folio() lost
>> that recheck when the swap cache moved to the swap table.
>>
>> So CPU 0 writes to a folio it doesn't own: it may clear PG_readahead and
>> takes the folio lock of someone else's page, before
>> folio_matches_swap_entry() finds out the folio is not ours.
>>
>> Recheck the slot after folio_try_get() and retry if it no longer holds
>> this folio.
>>
>> Fixes: 8578e0c00dcf ("mm, swap: use the swap table for the swap cache 
>> and switch API")
>> Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
>> Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
>> ---
>> https://sashiko.dev/#/patchset/20261014090821.227366-1-jiayuan.chen@linux.dev 
>>
>> ---
>>   mm/swap_state.c | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/swap_state.c b/mm/swap_state.c
>> index ebef568cd62e..d9e36c505398 100644
>> --- a/mm/swap_state.c
>> +++ b/mm/swap_state.c
>> @@ -92,17 +92,27 @@ void show_swap_cache_info(void)
>>    */
>>   struct folio *swap_cache_get_folio(swp_entry_t entry)
>>   {
>> +    struct swap_cluster_info *ci = __swap_entry_to_cluster(entry);
>> +    unsigned int ci_off = swp_cluster_offset(entry);
>>       unsigned long swp_tb;
>>       struct folio *folio;
>>         for (;;) {
>> -        swp_tb = swap_table_get(__swap_entry_to_cluster(entry),
>> -                    swp_cluster_offset(entry));
>> +        swp_tb = swap_table_get(ci, ci_off);
>>           if (!swp_tb_is_folio(swp_tb))
>>               return NULL;
>>           folio = swp_tb_to_folio(swp_tb);
>> -        if (likely(folio_try_get(folio)))
>> +        if (!folio_try_get(folio))
>> +            continue;
>> +        /*
>> +         * The folio may have been freed and its memory reused before
>> +         * we got the reference. Make sure it is still in the slot.
>> +         */
>> +        swp_tb = swap_table_get(ci, ci_off);
>> +        if (likely(swp_tb_is_folio(swp_tb) &&
>> +               swp_tb_to_folio(swp_tb) == folio))
>>               return folio;
>> +        folio_put(folio);
>>       }
>>         return NULL;
>
>
>
>
> I spent some more time on this and I'm not happy with any of the
> options I have. Advice welcome.
>
>   1. Trigger the worker where the zap gives up (this patch). On the
>      swap entry side that works, __try_to_reclaim_swap() has the si.
>      On the present PTE side it doesn't: free_swap_cache() lost the
>      trylock, so it can't read folio->swap to find the si, as Kairui
>      pointed out. And that trylock-and-give-up is not in one place,
>      free_swap_cache(), do_wp_page() and __uprobe_write() all have
>      their own copy. Chasing every one of them doesn't feel right.
>
>   2. Clean up at memcg offline. Doesn't cover the root cgroup or a
>      cgroup that stays alive, and on mm-new the folios are reparented
>      at offline anyway, so there is nothing left to find there.
>
>   3. A swapon flag, say --clean-cache, that enables the cleanup.
>      Pro: covers everything, and the cleanup can live in its own
>      function without touching the existing paths. Con: we know to
>      turn it on because we hit this, others won't. Needs util-linux
>      too.
>
>   4. A per-device worker that walks the device on its own, say 1024
>      clusters per second, backing off when a pass finds nothing.
>      Pro: same as 3, and nothing to turn on. Con: a worker that wakes
>      up on its own for this, I expect objections.
>
>   5. A sysctl (or a drop_caches bit) to kick the cleanup by hand.
>      Pro: same as 4, all in the worker. Con: same as 3, someone has
>      to know to poke it.
>
> 4 is the one I'd pick if nobody objects. Thoughts?


Plesase ignore his. I reply the wrong thread......

