Received: from mta0.migadu.com (out-218.mta0.migadu.com [91.218.175.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237633B9D99
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789697578; cv=none; b=OEla0J5r4A3pZ+3vX6wgwEggbrk1kFTbfr2KcYw42XONBPBUZiDOxbXy9OgxUS3NodMB3xqBzjE0XN/LkQWpkqq2mjpZM68XJj85XS7/R3tKJFdWFBcro1scTMYZ0g7fbPlfzro4mXwcnpA04AWfDaHk/n048n9iSt+VoMzCNfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789697578; c=relaxed/simple;
	bh=kQvImw+M8oW97C4OuIFHYNrBrNt0ZvV2KwIXHOOruKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bq2RX4q9OG3oLsVqcaNINn6K30dHWVLi2/b7KIagVduzPVB0zmrOLR1BjkF9KW89gFmX6IzKe78/2GRjvFuUZccc3fYweMtPmoWer0rsPLxRBVyC0OgC26DzR2Re64x2NihRTEVSfyPtbvSB7UI0/Nx3frt1bEMQ8MZ33qBA/3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qpel0en0; arc=none smtp.client-ip=91.218.175.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qpel0en0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kQvImw+M8oW97C4OuIFHYNrBrNt0ZvV2KwIXHOOruKs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789697574; v=1; x=1790302374;
 b=qpel0en089rC2FycTFqty9QFPMP5sNLmGimIfJZa2ToeVuuRNVqPfly3zYkGBxpcXF0n/rZV
 yIRvBXR/3PwJanMSTlXAY9OE7Y22ydraAy8yQ9RH0vs08YFOAXouNOinxKvtnWSy7FMCV8kIvfP
 QEtP+EVTaHg5Xu3g1ACuv2+o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9c1077d3109a1d2e;
	Fri, 18 Sep 2026 02:12:43 +0000
X-Mizu-Trace-ID: 9c1077d3109a1d2e
X-Migadu-Flow: FLOW_OUT
Message-ID: <188835d7-64c1-422a-8a64-6b5e0e960ee1@linux.dev>
Date: Fri, 18 Sep 2026 10:12:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-new v9] mm: vmscan: retry folios written back while
 isolated for traditional LRU
To: Barry Song <baohua@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <kasong@tencent.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "open list:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)" <linux-mm@kvack.org>,
 linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
References: <20260916123846.1242548-1-ridong.chen@linux.dev>
 <CAGsJ_4zwP3_+EYY5Ug9EJ+yD1UdxsBSGr25u8s1K3u_i7LH3Zg@mail.gmail.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <CAGsJ_4zwP3_+EYY5Ug9EJ+yD1UdxsBSGr25u8s1K3u_i7LH3Zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/17/2026 5:25 AM, Barry Song wrote:
> On Wed, Sep 16, 2026 at 8:39 PM Ridong Chen <ridong.chen@linux.dev> wrote:
>>
>> From: Ridong Chen <chenridong@xiaomi.com>
>>
>> As commit 359a5e1416ca ("mm: multi-gen LRU: retry folios written back
>> while isolated") mentioned:
>>
>>    The page reclaim isolates a batch of folios from the tail of one of the
>>    LRU lists and works on those folios one by one.  For a suitable
>>    swap-backed folio, if the swap device is async, it queues that folio for
>>    writeback.  After the page reclaim finishes an entire batch, it puts back
>>    the folios it queued for writeback to the head of the original LRU list.
>>
>>    In the meantime, the page writeback flushes the queued folios also by
>>    batches.  Its batching logic is independent from that of the page
>>    reclaim. For each of the folios it writes back, the page writeback calls
>>    folio_rotate_reclaimable() which tries to rotate a folio to the tail.
>>
>>    folio_rotate_reclaimable() only works for a folio after the page reclaim
>>    has put it back.  If an async swap device is fast enough, the page
>>    writeback can finish with that folio while the page reclaim is still
>>    working on the rest of the batch containing it.  In this case, that folio
>>    will remain at the head and the page reclaim will not retry it before
>>    reaching there".
>>
>> The commit 359a5e1416ca ("mm: multi-gen LRU: retry folios written back
>> while isolated") only fixed the issue for mglru. However, this issue
>> also exists in the traditional active/inactive LRU and was found at [1].
>>
>> It can be reproduced with below steps [3]:
>>
>> 1. Compile with CONFIG_TRANSPARENT_HUGEPAGE=y
>> 2. Mount memcg v1, and create memcg named test_memcg and set
>>     limit_in_bytes=1G, memsw.limit_in_bytes=2G.
>> 3. Create a 1G swap file, and allocate 1.35G anon memory in test_memcg.
>>
>> It was found that:
>>
>>    cat memory.usage_in_bytes
>>    1073700864
>>    cat memory.memsw.usage_in_bytes
>>    1413124096
>>
>>    free -h
>>                  total        used        free
>>    Mem:           1.6Gi       1.2Gi       299Mi
>>    Swap:          1.0Gi       678Mi       346Mi
>>
>> As shown above, the test_memcg charged about 324M swap (memsw.usage minus
>> usage), but almost 678M swap memory was used, which means that 350M+ may
>> be wasted because other memcgs can not use these swap memory.
> 

Thank you for your review.

> I don't like the way you describe the problem as "wasted" swap.
> 
> The real problem is that those folios skipped
> `folio_rotate_reclaimable()`, so they were added back to the head
> instead of the tail, where rotation could have moved them to the tail.
> This resulted in a cold/hot inversion.
> 
> The swap entries they are using now will eventually be released when
> we scan those folios again and reach the head of the list, so this is
> not actually wasted swap space. You are probably right, on the other
> hand, that if those head folios hold swap entries and the swap is
> full, this could prevent the reclamation of folios at the tail, making
> it even harder for us to reach the head.
> 

This issue was observed with unexpected OOM. For example, Docker A swapped out 2 
GB, but it held more than 8.5 GB of swap on the host. Those 6.5 GB could not be 
used by other Docker containers, which could trigger OOM. So it seems the swap 
was "wasted." After all, it is a global resource, yet it was held for a private 
cgroup even though that cgroup did not need so much swap.

>>
>> This issue should be fixed in the same way as mglru. Therefore, the common
>> logic was extracted to the 'find_folios_written_back' function firstly,
>> which is then reused in the 'shrink_inactive_list' function. Finally,
>> retry reclaiming those folios that may have missed the rotation for
>> traditional LRU.
> 
> I wouldn't necessarily call it a fix, as keeping the swap cache for
> those folios can sometimes help with future hits. For example, we may
> hit those folios again before they are reclaimed. So it's a
> double-edged sword.
> 
> That said, the cold/hot inversion is a real problem that we should
> fix. Ideally, we should find a way to restore the missed
> `folio_rotate_reclaimable()` behavior, conceptually something like:
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index fde28d0a647d..5ee296474b48 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -891,7 +891,10 @@ long remove_mapping(struct address_space
> *mapping, struct folio *folio)
>    */
>   void folio_putback_lru(struct folio *folio)
>   {
> -       folio_add_lru(folio);
> +       if (folio_has_been_writtenback_due_reclaim(folio))
> +               folio_add_lru_tail(folio);
> +       else
> +               folio_add_lru(folio);
>          folio_put(folio);               /* drop ref from isolate */
>   }
> 

That is a good idea. But I am not sure I can find the correct way to do it. I 
will give it a try and get back to you.

> But if that turns out to be impossible or practically infeasible,
> leveraging MGLRU's approach could still be a possible workaround, as
> it would at least be better than the current behavior.
> 
> On the other hand, the fast swap-out cases should be similar to zram
> and zswap, as Yu Zhao mentioned in his previous commit:
> 
> "This problem affects relatively slow async swap devices like
> Samsung 980 Pro much less and does not affect sync swap devices like
> zram or zswap at all."
> 
>>
>> After change, the same test case only wasted about 2M swap. The swap
>> device usage matches what the memcg actually charged.
>>
>>    cat memory.usage_in_bytes
>>    1070301184
>>    cat memory.memsw.usage_in_bytes
>>    1412448256
>>
>>    free -h
>>                  total        used        free
>>    Mem:           1.6Gi       1.2Gi       299Mi
>>    Swap:          1.0Gi       327Mi       696Mi
>>
>> [1] https://lore.kernel.org/linux-kernel/20241010081802.290893-1-chenridong@huaweicloud.com/
>> [2] https://lore.kernel.org/linux-kernel/CAGsJ_4zqL8ZHNRZ44o_CC69kE7DBVXvbZfvmQxMGiFqRxqHQdA@mail.gmail.com/
>> [3] https://lore.kernel.org/lkml/46037a37-4cf6-448e-a94b-30a4d16e8814@linux.dev/
>> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
>> ---
> 
> Thanks
> Barry

-- 
Best regards
Ridong

