Received: from mta0.migadu.com (out-207.mta0.migadu.com [91.218.175.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89DB4EC674
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559290; cv=none; b=g2TXsvRaMUI3ID2F7ipYZDRaKJXjZb/EeQjZ5Qc2GyvNQ4Bl72D5EsRol4Wir3RG4sjSjzNypaFfklA48eHj5qRuGhK3VAEz+YLQbgIxfR5tzc2lV601K+VJVLbb15WmhjoPkoNSjnt1w1INbSNA8gon18FobWmFSLWVjFFMWSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559290; c=relaxed/simple;
	bh=QkgxTAjnw9kjoZrd4E4SroH/8THVIEwQ2WjorBKbMs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GiX745QoeH7IdKx58G2YbLzSCKF6UJ+K+6RS6AOS91GOOTA9F7f+Zc30x3b5eWgSaHOYqWTK/al0Xq6ajTaU3GCrdbeWKNgpM/NFeRqO7tWSaBZwVcSNes5S/K3DU3QnyzBHgFwAP7o7t2RgoCHoHJvbTG0Ke89MoEC/V6q64y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Oe30Vh81; arc=none smtp.client-ip=91.218.175.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Oe30Vh81"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QkgxTAjnw9kjoZrd4E4SroH/8THVIEwQ2WjorBKbMs4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789559279; v=1; x=1790164079;
 b=Oe30Vh81EI21s/dDYotCAXjcMII9SOM1nMku33ZCIok2R4y7Mh+xuR6WzsUrKNaaC+NGRuwB
 V/YHXjd3szcUxeb2sIsm2/4QnISKv1sRUDcL1Xvycc9o7Y9c4F+tS4lMoQicKab5v84hNGYztSu
 mS0hbiC69LrJPE3CvBYCKaoA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7d2a5ac1929357ee;
	Wed, 16 Sep 2026 11:47:49 +0000
X-Mizu-Trace-ID: 7d2a5ac1929357ee
X-Migadu-Flow: FLOW_OUT
Message-ID: <4c8febe3-8e07-4c73-8f4b-44e4ad4374fb@linux.dev>
Date: Wed, 16 Sep 2026 19:47:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] mm: vmscan: retry folios written back while isolated
 for traditional LRU
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
References: <20260913100013.3603815-1-ridong.chen@linux.dev>
 <CAGsJ_4xEAS5Bacn8dUxDPoMKwD054zUsfUB3MSGYxGYwicPyWQ@mail.gmail.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <CAGsJ_4xEAS5Bacn8dUxDPoMKwD054zUsfUB3MSGYxGYwicPyWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/13/2026 7:33 PM, Barry Song wrote:
> On Sun, Sep 13, 2026 at 6:00 PM Ridong Chen <ridong.chen@linux.dev> wrote:
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
>> It can be reproduced with below steps:
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
>>
>> This issue should be fixed in the same way as mglru. Therefore, the common
>> logic was extracted to the 'find_folios_written_back' function firstly,
>> which is then reused in the 'shrink_inactive_list' function. Finally,
>> retry reclaiming those folios that may have missed the rotation for
>> traditional LRU.
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
>> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
>> ---
>> v8: Rebase to the -next tree, adapt to the current reclaim API, and retest.
>>
>> [v7]: https://lore.kernel.org/linux-mm/20250111091504.1363075-1-chenridong@huaweicloud.com/
>>
>>   mm/vmscan.c | 104 ++++++++++++++++++++++++++++++++++++----------------
>>   1 file changed, 73 insertions(+), 31 deletions(-)
>>
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index d1495a7d469d..6e13e570aab8 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -181,6 +181,10 @@ struct scan_control {
>>          struct reclaim_state reclaim_state;
>>   };
>>
>> +static void find_folios_written_back(struct list_head *list,
>> +                                    struct list_head *clean, struct lruvec *lruvec,
>> +                                    int type, bool skip_retry);
>> +
>>   #ifdef ARCH_HAS_PREFETCHW
>>   static inline void prefetchw_prev_lru_folio(struct folio *folio,
>>                  struct list_head *base)
>> @@ -2013,14 +2017,16 @@ static unsigned long shrink_inactive_list(unsigned long nr_to_scan,
>>                  enum lru_list lru)
>>   {
>>          LIST_HEAD(folio_list);
>> +       LIST_HEAD(clean_list);
>>          unsigned long nr_scanned;
>> -       unsigned int nr_reclaimed = 0;
>> -       unsigned long nr_taken;
>> +       unsigned int nr_reclaimed, total_reclaimed = 0;
>> +       unsigned long nr_taken, isolated;
>>          struct reclaim_stat stat;
>>          bool file = is_file_lru(lru);
>>          enum node_stat_item item;
>>          struct pglist_data *pgdat = lruvec_pgdat(lruvec);
>>          bool stalled = false;
>> +       bool skip_retry = false;
>>
>>          while (unlikely(too_many_isolated(pgdat, file, sc))) {
>>                  if (stalled)
>> @@ -2052,25 +2058,42 @@ static unsigned long shrink_inactive_list(unsigned long nr_to_scan,
>>          if (nr_taken == 0)
>>                  return 0;
>>
>> +       isolated = nr_taken;
>> +retry:
>>          nr_reclaimed = shrink_folio_list(&folio_list, pgdat, sc, &stat, false,
>>                                           lruvec_memcg(lruvec));
>> +       total_reclaimed += nr_reclaimed;
>> +
>> +       /* Retry pass is only meant for clean folios without new isolation */
>> +       if (isolated)
>> +               handle_reclaim_writeback(isolated, pgdat, sc, &stat);
>> +       trace_mm_vmscan_lru_shrink_inactive(pgdat->node_id,
>> +                       nr_scanned, nr_reclaimed, &stat, sc->priority, file);
>> +
>> +       find_folios_written_back(&folio_list, &clean_list, lruvec, file, skip_retry);
>>
>>          move_folios_to_lru(&folio_list);
>>
>>          mod_lruvec_state(lruvec, PGDEMOTE_KSWAPD + reclaimer_offset(sc),
>>                                          stat.nr_demoted);
>> -       mod_node_page_state(pgdat, NR_ISOLATED_ANON + file, -nr_taken);
>>          item = PGSTEAL_KSWAPD + reclaimer_offset(sc);
>>          mod_lruvec_state(lruvec, item, nr_reclaimed);
>>          mod_lruvec_state(lruvec, PGSTEAL_ANON + file, nr_reclaimed);
>> -       if (nr_scanned > nr_reclaimed)
>> +
>> +       if (!list_empty(&clean_list)) {
>> +               list_splice_init(&clean_list, &folio_list);
>> +               skip_retry = true;
>> +               /* Retry folios were already isolated and accounted above */
>> +               isolated = 0;
>> +               goto retry;
>> +       }
>> +
>> +       mod_node_page_state(pgdat, NR_ISOLATED_ANON + file, -nr_taken);
>> +       if (nr_scanned > total_reclaimed)
>>                  mod_lruvec_state(lruvec, PGROTATE_ANON + file,
>> -                                nr_scanned - nr_reclaimed);
>> +                                nr_scanned - total_reclaimed);
>>
>> -       handle_reclaim_writeback(nr_taken, pgdat, sc, &stat);
>> -       trace_mm_vmscan_lru_shrink_inactive(pgdat->node_id,
>> -                       nr_scanned, nr_reclaimed, &stat, sc->priority, file);
>> -       return nr_reclaimed;
> 
> this is a bit weird to move the tracepoint, shouldn't it just trace the total
> number of twice reclamation?
> 

Sorry for misssing this comment.

I think we should move the tracepoint, since the 'stat' would be cleared by the 
time it is passed to shrink_folio_list, just as evict_folios does.

>> +       return total_reclaimed;
>>   }
>>
>>   /*
>> @@ -5006,8 +5029,6 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>>   {
>>          LIST_HEAD(list);
>>          LIST_HEAD(clean);
>> -       struct folio *folio;
>> -       struct folio *next;
>>          enum node_stat_item item;
>>          struct reclaim_stat stat;
>>          struct lru_gen_mm_walk *walk;
>> @@ -5046,26 +5067,7 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>>                          type_scanned, reclaimed, &stat, sc->priority,
>>                          type ? LRU_INACTIVE_FILE : LRU_INACTIVE_ANON);
>>
>> -       list_for_each_entry_safe_reverse(folio, next, &list, lru) {
>> -               DEFINE_MIN_SEQ(lruvec);
>> -
>> -               /* move_folios_to_lru() culls unevictable folios via folio_putback_lru() */
>> -               if (!folio_evictable(folio))
>> -                       continue;
>> -
>> -               /* retry folios that may have missed folio_rotate_reclaimable() */
>> -               if (!skip_retry && !folio_test_active(folio) && !folio_mapped(folio) &&
>> -                   !folio_test_dirty(folio) && !folio_test_writeback(folio)) {
>> -                       list_move(&folio->lru, &clean);
>> -                       continue;
>> -               }
>> -
>> -               /* don't add rejected folios to the oldest generation */
>> -               if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type]) {
>> -                       folio_set_lru_refs(folio, 0);
>> -                       folio_set_active(folio);
>> -               }
> 
> Baolin has a patch which modifies this.
> so probably you are not based on the mm-new?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=519f7768585e372b97e568baf9d4648e6beb6863
> 
>> -       }
>> +       find_folios_written_back(&list, &clean, lruvec, type, skip_retry);
>>
>>          move_folios_to_lru(&list);
>>
>> @@ -6108,6 +6110,46 @@ static void lru_gen_shrink_node(struct pglist_data *pgdat, struct scan_control *
>>
>>   #endif /* CONFIG_LRU_GEN */
>>
>> +/**
>> + * find_folios_written_back - Find and move the written back folios to a new list.
>> + * @list: folios list
>> + * @clean: the written back folios list
>> + * @lruvec: the lruvec
>> + * @type: LRU type (only used for CONFIG_LRU_GEN)
>> + * @skip_retry: whether skip retry.
>> + */
>> +static void find_folios_written_back(struct list_head *list,
>> +                                    struct list_head *clean, struct lruvec *lruvec,
>> +                                    int type, bool skip_retry)
>> +{
>> +       struct folio *folio;
>> +       struct folio *next;
>> +
>> +       list_for_each_entry_safe_reverse(folio, next, list, lru) {
>> +#ifdef CONFIG_LRU_GEN
>> +               DEFINE_MIN_SEQ(lruvec);
>> +#endif
>> +               /* move_folios_to_lru() culls unevictable folios via folio_putback_lru() */
>> +               if (!folio_evictable(folio))
>> +                       continue;
>> +
>> +               /* retry folios that may have missed folio_rotate_reclaimable() */
>> +               if (!skip_retry && !folio_test_active(folio) && !folio_mapped(folio) &&
>> +                   !folio_test_dirty(folio) && !folio_test_writeback(folio)) {
>> +                       list_move(&folio->lru, clean);
>> +                       continue;
>> +               }
>> +#ifdef CONFIG_LRU_GEN
>> +               /* don't add rejected folios to the oldest generation */
>> +               if (lruvec->lrugen.enabled &&
>> +                   lru_gen_folio_seq(lruvec, folio, false) == min_seq[type]) {
>> +                       folio_set_lru_refs(folio, 0);
>> +                       folio_set_active(folio);
>> +               }
> 
> as above. please take a look at Baolin's patch:
> https://lore.kernel.org/9214e36bf738fcfba86acc8cea85dff4010f66b0.1788918714.git.baolin.wang@linux.alibaba.com
> 
> 
> Best Regards
> Barry

-- 
Best regards
Ridong

