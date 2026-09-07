Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEAF3C2D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788760405; cv=none; b=Z45oZLBov/PlH+WlY2E4bntmbx/jTI+tOTCdhEUNvengZsIzrn6gIT30KPFV642pLIvw/DbGE9F1iU+rJ5WTydsidq8YrnxPvwRIEGiC3dHu/ci1XD2rUk3WcTSy/uInrjEZZ917sfVWGcnZHsxiW9sIh8ope7E9HMerqVFZU00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788760405; c=relaxed/simple;
	bh=DQ8S6kzSN9zLpBiSzg9WmSv7nBwfmD4k49o+tjRXBBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p33A4bopJcyEGYyeIvuue3HlSUYla/aD6fuxngghGVFqv+G9WdjLTJjJOmZRkZ6skWjNVsHouAdONuYc1BGtczIiY5mn/pTH7l5HGxyCipOcPTdX7nq6JZHKjweG9dGCsuwrYoWfJJt55NbtzSZZSFfi+pMHGsLmTvGpJMRX5Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ck6qA5Fb; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ck6qA5Fb"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788760394; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ep44r7OC97WvRCgfJ4aDAB+5nIEpOJgFq+MgFPa8afI=;
	b=ck6qA5FbuRkp8qA3AGQhT3wHr8PwkUUgjVE/YbkduHaiQqLWtnOTtM/7NfysLFmN2j9sh27WfdV7Y2w8y/TvGkgbkE0+Euj9CAYyRZwJVuMzsRpzRISttHqS2ydAN1QiA+RPX38YcsXmKH40Jgpdbm6LOOnVKrae3o/fYXfDWfM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XAPo5rX_1788760392;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAPo5rX_1788760392 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Sep 2026 13:53:13 +0800
Message-ID: <b4c84ef4-0c2f-48d3-9eeb-6f39ed297be5@linux.alibaba.com>
Date: Mon, 7 Sep 2026 13:53:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: mglru: clear the reference counter for rejected
 folios
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com,
 weixugc@google.com, hannes@cmpxchg.org, david@kernel.org, mhocko@kernel.org,
 ljs@kernel.org, ridong.chen@linux.dev, hebaoquan@kylinos.cn,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <8e4db9a298c5ea6ccb192e274caed5b96f0cf022.1788751143.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4xxZWomhtUmdz9f1x5wdeoTSTRfEudzufdBs_ykKM1HBA@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4xxZWomhtUmdz9f1x5wdeoTSTRfEudzufdBs_ykKM1HBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/7/26 12:28 PM, Barry Song wrote:
> On Mon, Sep 7, 2026 at 11:25 AM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>> As per the comment on LRU_REFS_FLAGS, when accessed folios are promoted to
>> a new generation, LRU_REFS_FLAGS should be cleared so that the reference
>> counter can start over.
>>
>> For folios rejected by shrink_folio_list(), we clear LRU_REFS_FLAGS and
>> set the PG_active flag if the rejected folio is planned to be put back to
>> the oldest generation. That's fine.
> 
> I find the description a bit confusing. Yes, according to
> `lru_gen_folio_seq()`, the folio would be put back into the oldest
> generation. That's why we set the active bit to prevent this from
> happening. So there is no case where the folio is intentionally put
> back into the oldest generation.

How about?

"
For folios rejected by shrink_folio_list(), we clear LRU_REFS_FLAGS and
set the PG_active flag when lru_gen_folio_seq() would place them in the 
oldest generation.
"

>> But for those that are not put back to the oldest generation (which can
>> be treated as a promotion), we do not clear LRU_REFS_FLAGS, which can
>> violate the promotion mechanism. This means the rejected folio enters the
>> new generation with stale, inflated tier bits, which can inflate reference
>> counts and distort eviction statistics for these rejected folios.
> 
> Maybe simply say that folios for which lru_gen_folio_seq()
> returns something other than min_seq?

OK.

>> Fix this by clearing LRU_REFS_FLAGS for rejected folios, and also do some
>> measurement. On my 32-core Arm machine, with the memcg limit set to 3G,
>> running 'make -j32' to build the kernel showed a small improvement in sys
>> time when using either a zram or NVMe swap device (averaged over 2 runs with
>> no significant variance).
>>
>> zram swap:
>>                  w/o patch       w/ patch
>> sys time:       1666.5s         1589.5s
>>
>> NVMe swap:
>>                  w/o patch       w/patch
>> sys time:       760s            741.5s
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   mm/vmscan.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index 40d3f1b48a74..42c0a09938ab 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -5021,10 +5021,11 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>>                  }
>>
>>                  /* don't add rejected folios to the oldest generation */
>> -               if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type]) {
>> -                       folio_set_lru_refs(folio, 0);
>> +               if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type])
>>                          folio_set_active(folio);
>> -               }
>> +
>> +               /* See the comments on LRU_REFS_FLAGS */
>> +               folio_set_lru_refs(folio, 0);
>>          }
> 
> The code change makes sense to me if we keep aging and always reclaim
> only the oldest generation. However, if we go further in
> `scan_folios()`—for example, continuing to scan after we have fewer
> than two generations left—we might not be in that case anymore.

I may not fully understand your concern. If there is only one generation 
(fewer than two generations), we should aging instead of reclaim.

But my point is that regardless, if promotion happens, we should clear 
the reference counter. Otherwise, as I mentioned, it will distort 
eviction statistics.

> So far, the code looks correct to me.
> 
> BTW, Baolin, I wonder if you could find some time to test this
> change on your arm64 system:
> https://lore.kernel.org/linux-mm/20260901220430.79810-1-baohua@kernel.org/
> 
> It might have addressed one of your previous, similar concerns here.
> On my x86 machine, I find that the change further reduces the
> sys time from 3 minutes 40 seconds to 3 minutes 30 seconds.
> 
> Meanwhile, I will also run your patch on my x86 machine.

Sigh. I missed this thread. Yes, I also raised a similar issue before 
[1] and this is still my next step. I'll find some time to check this 
thread. Thanks for reminding me.

[1] 
https://lore.kernel.org/all/eb395442-0aad-428a-a5ac-9072d2d89060@linux.alibaba.com/
