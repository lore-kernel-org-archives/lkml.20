Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540155;
	b=eyD7CWjc43e/tnbxpptTtt/y8m+3B3F37rkjTmOZOTdV/AdvrqkeR6Tqnxc20NQsQD1u
	 wLqtC966/i24lwwD3oTgayBQTPaDIhYuJ97IUehtNOWTLE/hVFDRKMUCz3NZqPgT+caYs
	 +F6JpbUjSXEwfDkvqhO42f3gYh0BrEVv5iBxZad140lCLqBrWzFWhTpuvA4nvYCwJ/DUI
	 3PX4gLKl7JwLUF6Z2E5goWtvqcttOtP8GuXt6wiFhkjGSyOVuNUlfapeZnXdTSN4SCLB2
	 TXBzePGESW5VqaD6VV/J0Df+4M4FeFTmZ+Kd4Cn6K1vh+IFA7lstz72f9tba6FJMifA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540155;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aKPg/C+iEjXAyA26yNMVbAy4RFLh/YULbk2Iqfm+Dhw=;
	b=G3V+t2Qmrd75Y3p2MZSV4qzr9NEYs+8TLWKNbNBXvdUVJ7GdMQ4xEfYphNMV9H09qPoJ
	 7xBR26iswOS6TbCjPNcXADchrKwrLfmhDPEmJx2/xO878mEz5kIjgrVIHxea8yeOAKN3L
	 HJ3EwBCpnkSjCqjVwHJI2ap8ocfHcz/SNlrE4ftlCPcVtn0UNBcEo6HKKa/A3b42kzCo/
	 BuKj1PyogwmS3afgdL3qxmTYsM1UJH4qO7YsDN+LELfqD0nCQyINbQQr7m85Vfo2dFv94
	 9hIEZktpZ5EyWULnC96hghLywVJfnFuKdInJNkllFRRXG/bVU9OPLJN/JLMAlvsbKAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=wffJ3n6x;
	arc=none smtp.remote-ip=115.124.30.119
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432FE606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 432FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=wffJ3n6x
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794540148; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=aKPg/C+iEjXAyA26yNMVbAy4RFLh/YULbk2Iqfm+Dhw=;
	b=wffJ3n6xvviGtNPOgrZ8jg7APxzo9drM6jK3beliBrFXST7kbGqhn/4RK9h1MpS4JkPO7dA63wxr86kxzlsD7Drk1ImnMHfvIH+Lktkq+JogunCYIJ9Jb6wSIjeCdfzHdoVT3ZhiieoDIehOY3C8fX7VdLY3SmEs1s4eJYwZA9w=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XEdjdNz_1794540146;
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEdjdNz_1794540146 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 11:22:27 +0800
Message-ID: <920ed3c0-42ee-4268-b8ac-45981645ae4b@linux.alibaba.com>
Date: Fri, 13 Nov 2026 11:22:25 +0800
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
Subject: Re: [PATCH v2] mm/mglru: yield the lru_lock earlier in
 fill/drain_evictable()
To: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>
References: <20261113020132.274013-1-hui.zhu@linux.dev>
 <a72af87a-0f10-4717-9d50-2d3480c32caf@linux.alibaba.com>
 <1c6137c0-297a-4993-b386-6e8a1824d8dc@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <1c6137c0-297a-4993-b386-6e8a1824d8dc@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/13/26 11:08 AM, Hui Zhu wrote:
> 
> 2026/11/13 10:50, Baolin Wang :
>>
>>
>> On 11/13/26 10:01 AM, Hui Zhu wrote:
>>> From: Hui Zhu <zhuhui@kylinos.cn>
>>>
>>> lru_gen_change_state() migrates folios in batches of up to
>>> MAX_LRU_BATCH (4096) folios under lruvec_lock_irq().  A full batch
>>> keeps local interrupts off for up to about a millisecond, and CPUs
>>> contending for the same lru_lock spin with interrupts disabled for
>>> that long.
>>>
>>> The caller already reschedules between batches, but a batch itself
>>> only ends after 4096 folios.  Stop it early when a resched is
>>> pending, or when the lock has waiters and the current hold has moved
>>> at least MIN_LRU_BATCH folios; the caller restarts where it left off.
>>> TIF_NEED_RESCHED can still be set with interrupts off: a remote
>>> resched_curr() sets it directly in the target's thread_info. The
>>> minimum batch avoids lock bouncing under sustained contention, while
>>> a waiter now waits ~15us instead of ~1ms.
>>>
>>> This follows lru_gen_look_around() in this file, security/keys/gc.c
>>> and jbd2_log_do_checkpoint(), and commit 6e9be217a3ce ("mm/mglru:
>>> use a smaller batch for reclaim").
>>>
>>> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
>>> ---
>>> Changlog:
>>> v2:
>>> Also yield on lock contention after a minimum batch (Kairui Song).
>>>
>>>   mm/vmscan.c | 10 ++++++++--
>>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>>> index 6a1af9b92349..c1231925159f 100644
>>> --- a/mm/vmscan.c
>>> +++ b/mm/vmscan.c
>>> @@ -5533,7 +5533,10 @@ static bool fill_evictable(struct lruvec *lruvec)
>>>               success = lru_gen_add_folio(lruvec, folio, !active);
>>>               VM_WARN_ON_ONCE(!success);
>>>   -            if (!--remaining)
>>> +            /* stop early to shorten the irq-off section */
>>> +            if (!--remaining || need_resched() ||
>>> +                (MAX_LRU_BATCH - remaining >= MIN_LRU_BATCH &&
>>> +                 spin_is_contended(&lruvec->lru_lock)))
>>>                   return false;
>>
>> IIUC, Kairui's point[1] is to just drop the 'MAX_LRU_BATCH - remaining 
>> >= MIN_LRU_BATCH' condition, no?
>>
>> if (!--remaining || need_resched() || spin_is_contended(&lruvec- 
>> >lru_lock))
>>
>> [1] https://lore.kernel.org/all/ 
>> CAMgjq7CUMuNSdCXZ7_kDdo9+0BFvPNHuO=mq=ct_Q5YUyyckvQ@mail.gmail.com/
> 
> Not quite.  [1] was about the extra `moved` counter in the version
> discussed on the v1 thread; Kairui was fine with the rest.  Since
> `remaining` counts down from MAX_LRU_BATCH and one call is exactly one
> lock hold, `MAX_LRU_BATCH - remaining` is the number of folios moved
> in the current hold, so the condition is just `moved >= MIN_LRU_BATCH`
> without the extra variable.

If so, why not just set:

int remaining = MIN_LRU_BATCH;
?

> The minimum-batch test itself is a response to Michal's lock bouncing
> concern [2].  Without it, under sustained contention the loop could
> yield after every single folio: each yield costs an unlock, a requeue
> and a restart (microseconds), while one folio move costs a few hundred
> nanoseconds, so the migration could slow down by tens of times, with
> cgroup_lock and cpus_read_lock held throughout.  With it, each hold
> moves at least MIN_LRU_BATCH (64) folios, i.e. does ~15us of work
> before it may hand the lock over, while a waiter still waits only
> ~15us instead of the ~1ms of a full MAX_LRU_BATCH batch.

fill_evictable()/drain_evictable() are really cold paths, I really don't 
see any practical impact from this. At least we (Alibaba) won't be 
dynamically switching MGLRU state in practice.
