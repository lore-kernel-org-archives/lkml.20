Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474082;
	b=3pTPxVmSo3ofasbxfIN2IxmXEccLwWKpIOP1pi8QMJ/14jc2WLqy4uI1fZ+eGj8o+pJE
	 V7rLs3+32Eh6QV+sD2tRCoTVz7tHnlqBaaEjqIyYqaFvyK2b0Iz5XpSud1rNNfbqRHJIO
	 loTbhIyKB6uF81LCF9K4uuIJa6wlsKKZqzMawFejPgof3caq/tJ8Yw+yKPKeLhMUkElRT
	 86fy3SVc+3AqwsBbDAa7YoE1SdPB0Wc2GhM8YaFrIaeHql/FV30p3LQTqmqg6DQupZF5O
	 R348fzf6Nh/PiKrBvUEcKdqLQn2zo9bo5wXnWGS+zL0FSKZMWI6dOzB7hRPkCa1ocfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474082;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XueNigRXrNVQbOmN4VACMi1GudjntNvPC9ZLfnYMjrU=;
	b=vI2IhkGJe53dZOAXBEGIwyRTxCoFdAbbcO85y+oPWVNly5Y3R/R2I5JNQlA0G1Iq/WAU
	 ICW1kMbAxdEnYAT4byDfZvk6G4xwtLY2BEsBzYNwF4/+xRRtomxVK9MKkzPZWHuYqSdhQ
	 Zyb9APQVLMByBHCc/1FjaH84eVPYthKPkAnlY198U+4i/DOa1uSk3Yqf9xCuhyFxmSP6w
	 0zsb0O0tAQc+qZk1ENtwn1nszxOmkXvbN5tTZqARB9Crv+dIFu3u+lhK5SsGbmYyjW23U
	 nU49YCn+tCR1SjAup0N+3IuePNRyHU2Hj55KTEWcKtLdw+CdvPJRRFhcU9D1C6kmhdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Cv3iFa2W;
	arc=none smtp.remote-ip=95.215.58.199
Received: from mta1.migadu.com (out-199.mta1.migadu.com [95.215.58.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E155A606A881
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E155A606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Cv3iFa2W
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ou+k9MfEfVyFsna30Jg2u9TW8pwId0PWBe5K6vBd12Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794474079; v=1; x=1795078879;
 b=Cv3iFa2WgJToElLQhNcVRYpZIh4t/yePr6xD0CcQrvFX/0ZuaCfEvj5LeiV1b3cudpOWWUAT
 yU2Adui+XIQNZxEQJnZr7nJ3TzN9KzDsI8GsG5m2Wj/7jFZVjiHmIr/bDhXLUqiben/hamG4J6E
 c5PU/T3RJ8lLCwK/RXzoqHco=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f320f4b38b6a1e59;
	Thu, 12 Nov 2026 09:01:19 +0000
X-Mizu-Trace-ID: f320f4b38b6a1e59
X-Migadu-Flow: FLOW_OUT
Message-ID: <7718d4d0-58bf-4281-8256-fa726f753159@linux.dev>
Date: Thu, 12 Nov 2026 17:01:04 +0800
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
Subject: Re: [PATCH] mm/mglru: check need_resched() in fill/drain_evictable()
To: Michal Hocko <mhocko@suse.com>, Kairui Song <ryncsn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
References: <20261112075827.255602-1-hui.zhu@linux.dev>
 <avVx_1BEP7fIzGDK@KASONG-MC4> <avV0IbvSx4iuv0tF@tiehlicka>
Content-Language: en-US
From: Hui Zhu <hui.zhu@linux.dev>
In-Reply-To: <avV0IbvSx4iuv0tF@tiehlicka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal and Kairui,

2026/11/12 16:09, Michal Hocko:
> On Thu 12-11-26 16:03:54, Kairui Song wrote:
>> On Thu, Nov 12, 2026 at 03:58:27PM +0800, Hui Zhu wrote:
>>> From: Hui Zhu <zhuhui@kylinos.cn>
>>>
>>> lru_gen_change_state() migrates folios in batches of up to
>>> MAX_LRU_BATCH (4096) folios under lruvec_lock_irq().  A full batch
>>> keeps local interrupts off for up to about a millisecond, and CPUs
>>> contending for the same lru_lock spin with interrupts disabled for
>>> that long.
>>>
>>> The caller already reschedules between batches, but a batch itself
>>> only ends after 4096 folios.  Stop it early when a resched is
>>> pending; the caller restarts the migration where it left off.  A
>>> remote resched_curr() sets TIF_NEED_RESCHED directly in the target's
>>> thread_info, so the flag can still be set with interrupts off.
>>>
>>> This follows walk_pud_range(), which already pairs need_resched()
>>> with a MAX_LRU_BATCH cap, and commit 6e9be217a3ce ("mm/mglru: use a
>>> smaller batch for reclaim").
>>>
>>> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
>>> ---
>>>   mm/vmscan.c | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>>> index 6a1af9b92349..47f2cb25eb46 100644
>>> --- a/mm/vmscan.c
>>> +++ b/mm/vmscan.c
>>> @@ -5533,7 +5533,8 @@ static bool fill_evictable(struct lruvec *lruvec)
>>>   			success = lru_gen_add_folio(lruvec, folio, !active);
>>>   			VM_WARN_ON_ONCE(!success);
>>>   
>>> -			if (!--remaining)
>>> +			/* stop early to shorten the irq-off section */
>>> +			if (!--remaining || need_resched())
>> Hi Hui,
>>
>> I've been thinking about a different design, what if we just
>> delete the `--remaining` check completely, and check
>> spin_is_contended on the lruvec and need_resched()?
>>
>> In the optimal case we don't need to keep lock/unlock the lruvec
>> at all so this is faster. And it still avoids lock contention or
>> blocked schedule, and it might be even more responsive as we are
>> release the lock earlier on contention.
I like the spin_is_contended() idea and will add it.  This file
already uses it (lru_gen_look_around() bails out if the PTL is
contended), and security/keys/gc.c uses exactly this combination in a
long list walk under a spinlock.
> Wouldn't this result in too much lock bouncing in the end? Would it make
> sense to reduce the batch instead?
>
This worry is fair.  Under sustained contention each yield costs an
unlock, a requeue and a restart (microseconds), while one folio move
costs a few hundred nanoseconds, so the migration could slow down by
tens of times, with cgroup_lock and cpus_read_lock held for all of it.
Requiring a minimum of work per hold bounds this: only honor
spin_is_contended() after MIN_LRU_BATCH folios in the current hold.
Each hold then moves at least ~64 folios (~15us), and a waiter still
waits only ~15us instead of the ~1ms of a full MAX_LRU_BATCH batch.

I'd still keep the batch cap itself as a backstop, though.  Both
triggers are event driven: with interrupts off the local tick cannot
set TIF_NEED_RESCHED, so it takes a remote wakeup targeting this CPU,
and spin_is_contended() takes somebody grabbing this lru_lock.  On a
quiet system neither may ever fire, and one batch becomes the whole
lruvec: 100GB of 4K folios is ~25M of them, i.e. seconds of irq-off
inside a single rcu_read_lock() section, enough for an RCU stall. And
toggling MGLRU on a quiet machine is a common case.

Reducing the batch alone would also work and is simpler, but it pays
the unlock/relock round trip even when nobody is waiting, and on a
loaded machine the unconditional cond_resched() every small batch
stretches the whole switch more than yielding only when somebody
actually wants the lock or the CPU.

So how about all three combined, like jbd2_log_do_checkpoint() does
(batch cap || need_resched() || spin_needbreak()):

     if (!--remaining || need_resched() ||
         (moved >= MIN_LRU_BATCH && spin_is_contended(&lruvec->lru_lock)))
         return false;

Should I send a v2 with this?

Best,
Hui

