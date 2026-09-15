Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888F94CDA0C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504210; cv=none; b=c1xxCyWVB9yNOSshWXO9L4hTFpQAFzA3EijRvtYY/5COxjV4lFvBjf21iAQVJGncDm8fQP+6CwHJneKid4v31Z44bNkEtAe+ouIGm00Os8W2d88h4sAUQl6EhaKD5evY8QRJPgXG6I+h1Ti9uvxFH7ANje9CnI17kzfwNa3tZBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504210; c=relaxed/simple;
	bh=PTFa+PnQCj+dOfUk/S9NPYkuaQZaYFsUKWRWuhNO0v0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFsLMrX2O3p/UHPAxMj825qbYb+bnZFfsOcayCiNfYETaSrZHANXQUmTuBQrgt5okGyAu2CrZJlxhzz7kLH+ZT8OPsKpiDt340PRIb0g6mk0v3zPKwSWusSWFW8BIZCPnkHmuebF100z2bMfgopZLtegnvlynSf0ClFAWvfm4w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ke77PKNx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ke77PKNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789504207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvYqq44ddTL2g8t2x6ufn5iVYyiBjbz9DDDsqw6tWXw=;
	b=Ke77PKNxBRajY1jxYYrfvYAZ2KNs4aAFOPqP3CZmm0sSBqWuyF9NV7kkojLY7/Gy4qqAZ0
	LwNwZb9nG7U7RbJ94sujaXWcFdGWUjpkx6aP2kc9jgjuJX1V3vbydON2CTpxmCQZlm4NmM
	T5kSrjP/fKkxlDRrWc8i2STH728REE4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-CAO8pp7XPI-fdxE99AkU_g-1; Tue,
 15 Sep 2026 16:30:02 -0400
X-MC-Unique: CAO8pp7XPI-fdxE99AkU_g-1
X-Mimecast-MFC-AGG-ID: CAO8pp7XPI-fdxE99AkU_g_1789504200
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 80B2E195DE5A;
	Tue, 15 Sep 2026 20:30:00 +0000 (UTC)
Received: from [100.91.18.181] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F33333003EFB;
	Tue, 15 Sep 2026 20:29:57 +0000 (UTC)
Message-ID: <5394299c-1552-4b98-b3bf-8164a78149fd@redhat.com>
Date: Tue, 15 Sep 2026 16:29:56 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] locking/osq_lock: Ensure proper locking semantics for
 osq_lock/osq_unlock()
To: David Laight <david.laight.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>,
 Haakon Bugge <haakon.bugge@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yafang Shao <laoar.shao@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
References: <20260914202102.551333-1-longman@redhat.com>
 <20260915082655.GX4121339@noisy.programming.kicks-ass.net>
 <89a400fa-f23d-41d4-9a82-df8697eed0b3@redhat.com>
 <20260915190852.6ab21493@pumpkin>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260915190852.6ab21493@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 9/15/26 2:08 PM, David Laight wrote:
> On Tue, 15 Sep 2026 13:53:05 -0400
> Waiman Long <longman@redhat.com> wrote:
>
>> On 9/15/26 4:26 AM, Peter Zijlstra wrote:
>>> On Mon, Sep 14, 2026 at 04:21:02PM -0400, Waiman Long wrote:
>>>> The osq_lock is special in the sense that lock transfer from one CPU to
>>>> the next can happen either over the common optimistic_spin_queue.tail
>>>> value with uncontended lock or over a lock waiter's own percpu
>>>> optimistic_spin_node.locked flag when the lock is contended.
>>>>
>>>> To ensure proper lock synchronization, we need to provide
>>>> the acquire/release semantics for the osq_lock/osq_unlock()
>>>> functions in both cases. This is currently the case for the
>>>> common optimistic_spin_queue.tail value, but not for the percpu
>>>> optimistic_spin_node.locked flag as the proper barriers can be missing.
>>>>
>>>> The "node->locked" read in osq_lock() was relaxed by commit 036cc30c6b6a
>>>> ("locking/osq: No need for load/acquire when acquire-polling") a while
>>>> ago as the smp_load_acquire() loop was causing a performance hit due to
>>>> the repeated acquire barriers in the loop and it argued that an earlier
>>>> atomic_xchg() call could provide the needed barrier and reordering
>>>> wasn't a problem in the way osq_lock is being used by mutex and rwsem
>>>> for queuing purpose only. That atomic_xchg() barrier does not work
>>>> as a proper acquire barrier for osq_lock() if the lock hasn't been
>>>> acquired or isn't ready to be acquired when the barrier ends. So an
>>>> acquire barrier is still needed in order to have proper locking semantics.
>>>>
>>>> The performance impact stated in that patch is due to repeated issuance
>>>> of acquire barrier which can be expensive depending on the architectures
>>>> and the actual processor used. It was not clear what machine and what
>>>> benchmark was being used to produce the performance data. Anyway, with
>>>> the new smp_cond_load_acquire() helper, only one acquire barrier is
>>>> issued at the end of the loop. So even if there is a performance impact,
>>>> it should be less than a repeating one.
>>>>
>>>> As for the two percpu optimistic_spin_node.locked setting in osq_unlock(),
>>>> they are currently preceded by a full barrier xchg() call which can
>>>> provide the needed release barrier. Add comments saying that a release
>>>> barrier is needed for the proper functioning of the unlock operation
>>>> to alert people from accidentally remove the barrier when the code is
>>>> updated.
>>>>
>>>> Fixes: 036cc30c6b6a ("locking/osq: No need for load/acquire when acquire-polling")
>>>> Tested-by: Håkon Bugge <haakon.bugge@oracle.com>
>>>> Signed-off-by: Waiman Long <longman@redhat.com>
>>>> ---
>>>>    kernel/locking/osq_lock.c | 12 +++++++++---
>>>>    1 file changed, 9 insertions(+), 3 deletions(-)
>>>>
>>>> [v2] Reword the commit log and keep the WRITE_ONCE() in osq_unlock()
>>>>        with comments.
>>>> [v3] Fix the comment above smp_cond_load_acquire().
>>> I still see no reason why this should be applied. Or even have this
>>> Fixes tag.
>> The main reason for this patch is for addressing the locking test
>> failure reported by Håkon due to missing barrier. I do know that with
>> the current osq_lock() use case, it is not a real problem. I just don't
>> like inconsistency that an acquire barrier is just missing in just one
>> place. I don't mind removing the Fixes tag though.
>>
>> In your comment to David's "locking/osq_lock: Set prev_cpu=0 instead of
>> locked=1" patch, you suggested adding smp_acquire__after_ctrl_dep()
>> after finding that the lock had been granted which is exactly what the
>> change from smp_cond_load_relaxed() to smp_cond_load_acquire() is doing.
>> Right?
> I think it is a smaller barrier - since it is only in the 'lock acquired'
> path.

If you look at how smp_cond_load_acquire() is implemented in 
include/asm-generic/barrier.h. It is just a smp_cond_load_relaxed() + 
smp_acquire__after_ctrl_dep() at the end. arm64 is the only exception 
with its own implementation where it uses smp_load_acquire() in the 
loop. However, arm64 also has its special __cmpwait_relaxed() 
instruction which ends when the processor detects a change in the 
cacheline and can wait for quite a while. So it is looping much less 
frequently before it breaks out, probably a few times at most. In that 
sense, it is almost the same as just having one acquire barrier issued 
at the end.

> Whether it is enough is another data point.
> I don't remember anyone saying which memory reads are getting re-ordered.
>
> I really do need to find out exactly what the barriers do (or rather which
> feature of the cpu hardware makes them necessary).
> They might be stopping out of order execution and speculative execution,
> but the re-ordering of reads might be a feature of the cache.

In essence, the acquire barrier at the beginning and the release barrier 
at the end of a critical section is to prevent all memory accesses 
within the critical section from flowing out of the critical section 
when viewing from another CPU's perspective while some memory access 
before and after the critical section can theoretically be viewed as 
happening inside the critical section. The rules are slightly different 
for read and write access which I can't recall right now.

Cheers,
Longman

