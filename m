Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794539309;
	b=VQ+hUtNyTnhH8DNGKGdqJYvkl2/3ZpkTnS0x9BI/1xeTyLNn/z0qjt2s5gBc8i7HYdX5
	 waoy5++knx61rlRpuHnCSG9tAGtiqG3RrKtJZ9rpO+YrapFSc7yrwdEE+yB8YgzfwvJ0Z
	 RlfLvSYm63t7nBxWJqPrdyn135JhSDkWmW8uHQIh7+RsaNeMBEk7AC6NYLT7QxBGCURC6
	 90OP7F5rX5Cv8MQsgvX85yrSalgBk0vbk1o9crkG+uW578Q0WM727jhcg2NRpYff812ok
	 6PqxlZpLHhe+nVZ5wgBvUDKIwMKMjKOwbO4MZAKPQGw3LuHyEs4jFHYKLbq8z3djY9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794539309;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=xh12Ec73501aJdZldZTaVOfppvQ19TVeVwb3Yqc67Do=;
	b=ZrhTNNlqPeUZ92FQo/fbnzUjTP63gcYgMiviNqxnWXz+4ddaSCEgz9ZmSsTS6yk7tHac
	 4pVWivSrGLMZpy4cKMWt7SE2ig3gquZx+oLInopIoTgkaLvOeg3GnG6rU2Fco3oeSSYRl
	 flUZzqBTjxKP3Yho0Gaxo/WNalUuK8EqLpJ+D+nqz4CuWe6fMLXgjQU+S6PjaAeaHCq3R
	 vCqZWKjQSDv31vcTWOyEKtuAJcwLyPCXzT1c+f6GLDhreaHU6i7A1ROywmy8wPTP3xOWg
	 ZTLkCoMl9xftOqCvZtnAh1kxbeTDamZLqxEyibYqencbXmmCyV7jwqFmuTs7FVRgRXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Xgq8tYcW;
	arc=none smtp.remote-ip=95.215.58.14
Received: from mta1.migadu.com (out-14.mta1.migadu.com [95.215.58.14])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C107D606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C107D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Xgq8tYcW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=i7wdYt1YR5CVX/6t3vNtMl/JvBAliVHJFFa19DKBkmU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794539306; v=1; x=1795144106;
 b=Xgq8tYcWRueqF4ojil24saUe27PEkfMEboQlmmXHzBbCEFdoMphPGlA7z+KF5LxNoRJ53C4I
 c7c1wCTWWNlU9bZZ/J1beBn6dPSShj3qKON2n9tIWv/bWD/o7GffX/NGF+peDJeNZruMY0E1yXJ
 UfekAJ1ZoVD0ofGejP4IHN7k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0da06881c7ca0ca3;
	Fri, 13 Nov 2026 03:08:26 +0000
X-Mizu-Trace-ID: 0da06881c7ca0ca3
X-Migadu-Flow: FLOW_OUT
Message-ID: <1c6137c0-297a-4993-b386-6e8a1824d8dc@linux.dev>
Date: Fri, 13 Nov 2026 11:08:12 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH v2] mm/mglru: yield the lru_lock earlier in
 fill/drain_evictable()
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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
Content-Language: en-US
From: Hui Zhu <hui.zhu@linux.dev>
In-Reply-To: <a72af87a-0f10-4717-9d50-2d3480c32caf@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


2026/11/13 10:50, Baolin Wang :
>
>
> On 11/13/26 10:01 AM, Hui Zhu wrote:
>> From: Hui Zhu <zhuhui@kylinos.cn>
>>
>> lru_gen_change_state() migrates folios in batches of up to
>> MAX_LRU_BATCH (4096) folios under lruvec_lock_irq().  A full batch
>> keeps local interrupts off for up to about a millisecond, and CPUs
>> contending for the same lru_lock spin with interrupts disabled for
>> that long.
>>
>> The caller already reschedules between batches, but a batch itself
>> only ends after 4096 folios.  Stop it early when a resched is
>> pending, or when the lock has waiters and the current hold has moved
>> at least MIN_LRU_BATCH folios; the caller restarts where it left off.
>> TIF_NEED_RESCHED can still be set with interrupts off: a remote
>> resched_curr() sets it directly in the target's thread_info. The
>> minimum batch avoids lock bouncing under sustained contention, while
>> a waiter now waits ~15us instead of ~1ms.
>>
>> This follows lru_gen_look_around() in this file, security/keys/gc.c
>> and jbd2_log_do_checkpoint(), and commit 6e9be217a3ce ("mm/mglru:
>> use a smaller batch for reclaim").
>>
>> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
>> ---
>> Changlog:
>> v2:
>> Also yield on lock contention after a minimum batch (Kairui Song).
>>
>>   mm/vmscan.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index 6a1af9b92349..c1231925159f 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -5533,7 +5533,10 @@ static bool fill_evictable(struct lruvec *lruvec)
>>               success = lru_gen_add_folio(lruvec, folio, !active);
>>               VM_WARN_ON_ONCE(!success);
>>   -            if (!--remaining)
>> +            /* stop early to shorten the irq-off section */
>> +            if (!--remaining || need_resched() ||
>> +                (MAX_LRU_BATCH - remaining >= MIN_LRU_BATCH &&
>> +                 spin_is_contended(&lruvec->lru_lock)))
>>                   return false;
>
> IIUC, Kairui's point[1] is to just drop the 'MAX_LRU_BATCH - remaining 
> >= MIN_LRU_BATCH' condition, no?
>
> if (!--remaining || need_resched() || 
> spin_is_contended(&lruvec->lru_lock))
>
> [1] 
> https://lore.kernel.org/all/CAMgjq7CUMuNSdCXZ7_kDdo9+0BFvPNHuO=mq=ct_Q5YUyyckvQ@mail.gmail.com/ 
>

Not quite.  [1] was about the extra `moved` counter in the version
discussed on the v1 thread; Kairui was fine with the rest.  Since
`remaining` counts down from MAX_LRU_BATCH and one call is exactly one
lock hold, `MAX_LRU_BATCH - remaining` is the number of folios moved
in the current hold, so the condition is just `moved >= MIN_LRU_BATCH`
without the extra variable.

The minimum-batch test itself is a response to Michal's lock bouncing
concern [2].  Without it, under sustained contention the loop could
yield after every single folio: each yield costs an unlock, a requeue
and a restart (microseconds), while one folio move costs a few hundred
nanoseconds, so the migration could slow down by tens of times, with
cgroup_lock and cpus_read_lock held throughout.  With it, each hold
moves at least MIN_LRU_BATCH (64) folios, i.e. does ~15us of work
before it may hand the lock over, while a waiter still waits only
~15us instead of the ~1ms of a full MAX_LRU_BATCH batch.

[2] https://lore.kernel.org/all/avV0IbvSx4iuv0tF@tiehlicka/

Best,
Hui

