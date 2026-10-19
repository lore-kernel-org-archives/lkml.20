Received: from mta0.migadu.com (out-124.mta0.migadu.com [91.218.175.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6C9491B23
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420891; cv=none; b=bOdzETnReAdf4leejKh84zBWURGlw2QyLEK6Pa2q5tkdkQ3vKNCwUGfGIvox+E4bo45RTyBPI4aL3sxD+43Qud06MNMR8sHWY+XeACgKMFXgvJDy8I7Ke2VjCj+Sz2Vj8ua5Mfd0jF92EVHKqUBPgzycDlestKT+qVGL6ES1VHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420891; c=relaxed/simple;
	bh=HwE2plcjFNclb9HwtwKDo6zr2B1gdPL2a6p1mdIeSyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNjdohnV75Qw/EykwpEqaiCV5duIfeIPpR9XPXtsFq4pLZx38TS3CE5J0jh54A+ZA3MsgqXmzPfOH8n+UMplM5JT0D9UkWMjBO5n6Y5Fz4aCtr2wty86OJHxyqU8nEadMAQd0CPdNx8C3yLRaiS2AEwomXORb9GOs01cW8nTME8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d+6BuBab; arc=none smtp.client-ip=91.218.175.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d+6BuBab"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HwE2plcjFNclb9HwtwKDo6zr2B1gdPL2a6p1mdIeSyU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792420887; v=1; x=1793025687;
 b=d+6BuBabhD1ZdY8NeF7Ot2Jm16a39EPZNn1G5n1mNMhKmdi+mX+6Qon1A49I/y/CISLbdZXn
 WGhfN6ws709zzS7si8qffSU92nnVUUR52ZGgla6XtBgpVAORphi+kgowB/eeR1RWghh7otM6oKV
 Bu+i453MfyuqJ5EQTzvA3ae4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id df66da58367c8def;
	Mon, 19 Oct 2026 14:41:27 +0000
X-Mizu-Trace-ID: df66da58367c8def
X-Migadu-Flow: FLOW_OUT
Message-ID: <19fcff1a-75be-4522-8413-047efc2612e5@linux.dev>
Date: Mon, 19 Oct 2026 22:41:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-next] mm/swap: free swap cache folios the zap path gave
 up on
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
References: <20261014090821.227366-1-jiayuan.chen@linux.dev>
 <CAMgjq7CT4srpTcAkStOV6zN8X2v4mPN7cRzA9B_eevFB4azvtg@mail.gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <CAMgjq7CT4srpTcAkStOV6zN8X2v4mPN7cRzA9B_eevFB4azvtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/17/26 2:17 AM, Kairui Song wrote:
> On Wed, Oct 14, 2026 at 5:10 PM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:


[...]

>> --- a/mm/swap_state.c
>> +++ b/mm/swap_state.c
>> @@ -598,16 +598,13 @@ void swap_writeback_dropbehind_folio(struct folio *folio)
>>    *
>>    * Its ok to check the swapcache flag without the folio lock
>>    * here because we are going to recheck again inside
>> - * folio_free_swap() _with_ the lock.
>> + * __try_to_reclaim_swap() _with_ the lock.
>>    *                                     - Marcelo
>>    */
>>   void free_swap_cache(struct folio *folio)
>>   {
>> -       if (folio_test_swapcache(folio) && !folio_mapped(folio) &&
>> -           folio_trylock(folio)) {
>> -               folio_free_swap(folio);
>> -               folio_unlock(folio);
>> -       }
>> +       if (folio_test_swapcache(folio) && !folio_mapped(folio))
>> +               swap_reclaim_entry(folio->swap);
> One problem here, if folio is not locked, you might read garbage from
> folio->swap.



Right, keep the trylock in free_swap_cache() and only read folio->swap 
under it.


>
>>   }
>>
>>   /*
>> diff --git a/mm/swapfile.c b/mm/swapfile.c
>> index c3288910b3e3..ee29085152fe 100644
>> --- a/mm/swapfile.c
>> +++ b/mm/swapfile.c
>> @@ -172,6 +172,8 @@ static long swap_usage_in_pages(struct swap_info_struct *si)
>>   #define TTRS_UNMAPPED          0x2
>>   /* Reclaim the swap entry if swap is getting full */
>>   #define TTRS_FULL              0x4
>> +/* May sleep: wait for the folio lock and for writeback instead of giving up */
>> +#define TTRS_WAIT              0x8
>>
>>   static bool swap_only_has_cache(struct swap_cluster_info *ci,
>>                                  unsigned long offset, int nr_pages)
>> @@ -217,9 +219,19 @@ static int __try_to_reclaim_swap(struct swap_info_struct *si,
>>           * avoiding deadlock. This is a special case and you should
>>           * use folio_free_swap() with explicit folio_lock() in usual
>>           * operations.
>> +        *
>> +        * The zap path (TTRS_UNMAPPED) is the one caller for which giving
>> +        * up means the slot is never looked at again: it stays allocated
>> +        * with count 0 and an unmapped folio pinned in the swap cache. Let
>> +        * the sweep worker, which can wait, come back for it.
>>           */
>> -       if (!folio_trylock(folio))
>> +       if (flags & TTRS_WAIT) {
>> +               folio_lock(folio);
>> +       } else if (!folio_trylock(folio)) {
>> +               if (flags & TTRS_UNMAPPED)
>> +                       schedule_work(&si->sweep_work);
>>                  goto out;
>> +       }
>>
>>          /*
>>           * Offset could point to the middle of a large folio, or folio
>> @@ -232,11 +244,20 @@ static int __try_to_reclaim_swap(struct swap_info_struct *si,
>>          }
>>          offset = swp_offset(folio->swap);
>>
>> +       if (flags & TTRS_WAIT)
>> +               folio_wait_writeback(folio);
> You may merge this into the TTRS_WAIT check above?

Right !


>> +
>>          need_reclaim = ((flags & TTRS_ANYWAY) ||
>>                          ((flags & TTRS_UNMAPPED) && !folio_mapped(folio)) ||
>>                          ((flags & TTRS_FULL) && mem_cgroup_swap_full(folio)));
>> -       if (!need_reclaim || !folio_swapcache_freeable(folio))
>> +       if (!need_reclaim)
>> +               goto out_unlock;
>> +       if (!folio_swapcache_freeable(folio)) {
>> +               /* Same for a folio the zap caught under writeback. */
>> +               if ((flags & TTRS_UNMAPPED) && folio_test_writeback(folio))
>> +                       schedule_work(&si->sweep_work);
>>                  goto out_unlock;
>> +       }
>>
>>          /*
>>           * It's safe to delete the folio from swap cache only if the folio
>> @@ -1099,6 +1120,80 @@ static void swap_reclaim_work(struct work_struct *work)
>>          swap_reclaim_full_clusters(si, true);
>>   }
>>
>> +/*
>> + * Free the slots a zap could not take back: swap cache only, count 0, folio
>> + * not mapped. The zap runs under the PTL, so when the folio was locked (a
>> + * readahead or an asynchronous swap-in still reading into it) or under
>> + * writeback, __try_to_reclaim_swap() had to give up and scheduled us. Such
>> + * a slot is reachable by nobody but LRU reclaim: no page table holds its
>> + * entry, and the allocator skips it until swap is half full. Here we can
>> + * wait for the lock and the writeback.
>> + */
>> +static void swap_sweep_work(struct work_struct *work)
>> +{
>> +       struct swap_info_struct *si;
>> +       struct swap_cluster_info *ci;
>> +       unsigned long offset, end, swp_tb;
>> +       unsigned long nr_clusters;
>> +       int nr_reclaim;
>> +
>> +       si = container_of(work, struct swap_info_struct, sweep_work);
>> +       nr_clusters = DIV_ROUND_UP(si->max, SWAPFILE_CLUSTER);
>> +
>> +       for (unsigned long i = 0; i < nr_clusters; i++) {
>> +               ci = si->cluster_info + i;
>> +               offset = i * SWAPFILE_CLUSTER;
>> +               end = min(si->max, offset + SWAPFILE_CLUSTER);
> IIUC scanning the whole device for one pending folio reclaim doesnt' look good..


Agreed. What I'd really like is a mark on the cluster itself, so the
worker only walks the clusters that need it (mentioned in commit message).
That needs more thought though, especially with Andrew's point about
backporting in mind, so I want to be careful there.

