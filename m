Received: from mta0.migadu.com (out-48.mta0.migadu.com [91.218.175.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0D82931F4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902749; cv=none; b=rdTPmwGj4pOA/VivTVOEfhWiMEW8Bk8bDl8X23W6gdzD2XicRo6zj6r9/IoSqctPF2Vey4IznVRp5We4gLNe8nS6ag9EoeU/pUYB3tNNoUCvFfa5FXCBRdWB+BeusbFN/kvdoxzgr85V8ApdDHnbNWQUTikyo8E+BCJzeFuDmuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902749; c=relaxed/simple;
	bh=CzJCrm1JG/Bdu/TaUWFhlC0tN1b8yrUeWHq+eUql9jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfw1TV80zwbGEOasbKXvRI9Hlrx+YRs5SV/h3ea0ryKU1lepV5c0aY+UEnqihgpMoiyC0g1UfE9Ug8xiYI9+4ivNroOyZJSFJxYO7FnJgFlsY2seXXX7b9sJ1Q6+klicmT72UD0FBq7HITOUq1sNwqW0YkW5EcV2Cgd0BCsgBBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g0mwTo1M; arc=none smtp.client-ip=91.218.175.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g0mwTo1M"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CzJCrm1JG/Bdu/TaUWFhlC0tN1b8yrUeWHq+eUql9jI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789902743; v=1; x=1790507543;
 b=g0mwTo1MVnVUuhyRklpcYFd6kE4PTzxmfxBswAgpUF7ap0Zjb+NjIqhYSxZIr87r1MWJ+y9M
 tpIgYUqd6WFTANDHSPmGgKnMdvSfv18AOZrP1/6m1xIuGN6BdcCDow9p9mPMpgvWZZtrez0iGfm
 NjBg89vQ3iYs6r90U18e2bdU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4a53f6ddf8c44ae7;
	Sun, 20 Sep 2026 11:12:13 +0000
X-Mizu-Trace-ID: 4a53f6ddf8c44ae7
X-Migadu-Flow: FLOW_OUT
Message-ID: <63de7ffe-8410-4e88-9e09-02f2cc386539@linux.dev>
Date: Sun, 20 Sep 2026 19:12:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-new] mm: vmscan: put rotation-missed folios at the LRU
 tail
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
References: <20260920043015.3126317-1-ridong.chen@linux.dev>
 <CAGsJ_4xmoGWULDVNGj0LzRFFfxM4VVGg4Bx5Pz5cUfXx9uKrtw@mail.gmail.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <CAGsJ_4xmoGWULDVNGj0LzRFFfxM4VVGg4Bx5Pz5cUfXx9uKrtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/20/2026 5:21 PM, Barry Song wrote:
> On Sun, Sep 20, 2026 at 12:30 PM Ridong Chen <ridong.chen@linux.dev> wrote:
>>
>> From: Ridong Chen <chenridong@xiaomi.com>
>>
>> The page reclaim isolates a batch of folios from the tail of an LRU list
>> and works on them one by one.  For a suitable swap-backed folio on an
>> async swap device, it queues the folio for writeback and, after finishing
>> the batch, puts the folio back to the head of the original LRU list.
>>
>> Meanwhile the page writeback flushes the queued folios in its own,
>> independent batches.  For each folio it writes back it calls
>> folio_rotate_reclaimable(), which tries to rotate the folio to the LRU
>> tail.  But folio_rotate_reclaimable() only takes effect once the folio has
>> been put back by reclaim.  If the async swap device is fast enough, the
>> writeback can complete a folio while reclaim is still working on the rest
>> of the batch that contains it.  In that case the folio stays near the head
>> and reclaim will not revisit it before wrapping around, causing a cold/hot
>> inversion: a clean, written-back folio that should be a prime reclaim
>> candidate is kept ahead of hotter folios.
>>
>> commit 359a5e1416ca ("mm: multi-gen LRU: retry folios written back while
>> isolated") addressed this for MGLRU only.  The traditional active/inactive
>> LRU has the same problem, reported at [1].  A reproducer is available at
>> [2].
>>
>> Rather than re-reclaiming those folios (which would drop the swap cache
>> that may still be useful for a future hit [4]), restore the rotation that
>> was missed: when move_folios_to_lru() puts a folio back, add it to the LRU
>> tail if it looks like it missed folio_rotate_reclaimable() (inactive, not
>> mapped, not dirty and not under writeback).  A new do_rotate parameter
>> gates this so it only applies on the reclaim put-back path
>> (shrink_inactive_list()), not on shrink_active_list() where the list order
>> is already deliberate.  This approach was suggested by Barry Song [3].
>>
>> Only the traditional LRU is handled here.  MGLRU already retries such
>> folios via its own clean-list retry pass in evict_folios(), so it is left
>> unchanged.  The same do_rotate scheme could later replace that retry pass
>> to unify both LRUs, which is left for a follow-up.
>>
>> [1] https://lore.kernel.org/linux-kernel/20241010081802.290893-1-chenridong@huaweicloud.com/
>> [2] https://lore.kernel.org/lkml/46037a37-4cf6-448e-a94b-30a4d16e8814@linux.dev/
>> [3] https://lore.kernel.org/lkml/CAGsJ_4zwP3_+EYY5Ug9EJ+yD1UdxsBSGr25u8s1K3u_i7LH3Zg@mail.gmail.com/
>> [4] https://lore.kernel.org/linux-mm/20260911121341.178028-1-alex@ghiti.fr/
>>
>> Suggested-by: Barry Song <baohua@kernel.org>
>> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
>> ---
>>   mm/vmscan.c | 21 +++++++++++++++------
>>   1 file changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index e200ce3eb056..026b844c681f 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -1971,7 +1971,7 @@ static bool too_many_isolated(struct pglist_data *pgdat, int file,
>>    *
>>    * Note: The caller must not hold any lruvec lock.
>>    */
>> -static unsigned int move_folios_to_lru(struct list_head *list)
>> +static unsigned int move_folios_to_lru(struct list_head *list, bool do_rotate)
>>   {
>>          int nr_pages, nr_moved = 0;
>>          struct lruvec *lruvec = NULL;
>> @@ -2018,7 +2018,16 @@ static unsigned int move_folios_to_lru(struct list_head *list)
>>                          continue;
>>                  }
>>
>> -               lruvec_add_folio(lruvec, folio);
>> +               /*
>> +                * Put folios that may have missed folio_rotate_reclaimable()
>> +                * at the tail to avoid cold/hot inversion.
>> +                */
>> +               if (do_rotate && !folio_test_active(folio) && !folio_mapped(folio) &&
>> +                   !folio_test_dirty(folio) && !folio_test_writeback(folio))
>> +                       lruvec_add_folio_tail(lruvec, folio);
> 
> sashiko says:
> 
> "Could this heuristic indiscriminately place un-reclaimable clean folios at
> the LRU tail, ensuring they are immediately re-scanned in an infinite loop?
> If shrink_inactive_list() isolates a clean, unmapped file folio with an
> elevated refcount (such as from a concurrent GUP or speculative lookup),
> it will fail __remove_mapping() and be placed on ret_folios.
> Because this pinned folio matches the !active, !mapped, !dirty, and
> !writeback checks, it is placed at the tail of the inactive LRU. The very
> next isolate_lru_folios() pull from the tail will immediately isolate this
> exact same folio again, creating an infinite loop that prevents any other
> folios from being reclaimed and causes kswapd to spin at 100% CPU."
> 
> This seems to be a valid concern. For a clean and unmapped folio, we
> may still fail in `__remove_mapping()` if it is pinned somewhere. So
> perhaps we can add a refcount check when fixing the rotation.
> 

Thanks, I will update.

-- 
Best regards
Ridong

