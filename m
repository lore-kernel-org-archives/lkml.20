Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77AE4A207F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057359; cv=none; b=a/ukI5YrEX5u7moA2cvYruR79gW4x0rIhOcvJUlRRmd9gkdsvHwv4++kVi282PKiirL5uSVEQ0SW/UJJ6kOxwPpDYNl0jdmItEgLtK+URr6e9eGjb0EXRR4+UZu+hzazKjvGA8MxxyX/7imC/OiLeszcbuKk4/qYmB6ypjdkEqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057359; c=relaxed/simple;
	bh=jBN8TRyCDKAQ9/DDhIiXO4jDA5sseUac6PzS0fymOnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=heYBVwfQ7hHVrol0t94tfjY40r9kUaO+Sxs7LqNNAaf03EM2i2jWyTCZeCmxEgkbUR5CLxpJPwatgk8RFZzgFqEQZjo+LPLQQxmG1eDBiXJjlfXyEAoE2eCJ5j2mtaYRmorkAQI1kOAPzWr3RA1ap5z4kyf/i71W9yEXVki/5Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IcXmHvZj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IcXmHvZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789057355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D9gnGcUQJaBIzpnTu1wUDwoH12yZQz14MwB/lcDpIXw=;
	b=IcXmHvZjBd36Z2f64XvHfxUZ/5Zpe1HNrv9AaBzFhT6j2wABrIiaplgl9Rr66RCGsTqxJ3
	UiYoHv4lIV7Inytf08WL/530lpsu7fb7mKoREhNljSSVfbIgqMaNFH7rS8sR5ad0J6liVt
	y+P/d8oq3SeSZDPh5xpFEgaRGWr5988=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-356-0kZnHKz4Nc2rSVkB25lleQ-1; Thu,
 10 Sep 2026 12:22:32 -0400
X-MC-Unique: 0kZnHKz4Nc2rSVkB25lleQ-1
X-Mimecast-MFC-AGG-ID: 0kZnHKz4Nc2rSVkB25lleQ_1789057351
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BCC8F19540CE;
	Thu, 10 Sep 2026 16:22:30 +0000 (UTC)
Received: from [100.91.18.181] (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1D9F81955D84;
	Thu, 10 Sep 2026 16:22:27 +0000 (UTC)
Message-ID: <77253fe7-7c0c-4fe1-8155-477e67d6145a@redhat.com>
Date: Thu, 10 Sep 2026 12:22:27 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 next 0/9] locking/osq_lock: Optimisations to osq_lock
 code
To: Haakon Bugge <haakon.bugge@oracle.com>,
 David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
 <20260907182705.54585f73@pumpkin>
 <89F7CD08-2BDD-424D-AA2F-77D72647D93E@oracle.com>
 <44bdfc4b-4729-4dc3-b7b0-53c671c5ee34@redhat.com>
 <dd6a7873-7d23-42e2-adbd-b59c43141d96@redhat.com>
 <0ADD6DCD-6EF1-469D-ACB8-EC7D6A94CC2F@oracle.com>
 <20260910120016.04ba8ae1@pumpkin>
 <C81B298B-E8FF-4F96-8216-CFC21D167EC8@oracle.com>
 <20260910130557.74e1ae45@pumpkin>
 <E2131B35-DE77-41D3-85C7-521143FF94A5@oracle.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <E2131B35-DE77-41D3-85C7-521143FF94A5@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 9/10/26 11:30 AM, Haakon Bugge wrote:
>
>> On 10 Sep 2026, at 14:05, David Laight <david.laight.linux@gmail.com> wrote:
>> On Thu, 10 Sep 2026 11:31:19 +0000
>> Haakon Bugge <haakon.bugge@oracle.com> wrote:
>>
>>>> On Thu, 10 Sep 2026 09:45:47 +0000
>>>> Haakon Bugge <haakon.bugge@oracle.com> wrote:
>>>>
>>>>>> On 9 Sep 2026, at 22:33, Waiman Long <longman@redhat.com> wrote:
>>>>> [snip]
>>>>>
>>>>>>> Could you make that change to the existing code and rerun the test
>>>>>>> again on arm64 to see if it can pass?
>>>>>> osq_lock/unlock() is special in the sense that lock transfer can happen
>>>>>> either in the lock cacheline or the node->locked cacheline. Try the
>>>>>> patch below to see if it helps to pass the test.
>>>>>>
>>>>>> Thanks,
>>>>>> Longman
>>>>>>
>>>>>> diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
>>>>>> index b4233dc2c2b0..51cecf297692 100644
>>>>>> --- a/kernel/locking/osq_lock.c
>>>>>> +++ b/kernel/locking/osq_lock.c
>>>>>> @@ -143,7 +143,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>>>>>> * is implemented with a monitor-wait. vcpu_is_preempted()
>>>>>> relies on
>>>>>> * polling, be careful.
>>>>>> */
>>>>>> - if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
>>>>>> + if (smp_cond_load_acquire(&node->locked, VAL || need_resched() ||
>>>>>> vcpu_is_preempted(node_cpu(node->prev))))
>>>>>> return true;
>>>>>>
>>>>>> @@ -224,11 +224,11 @@ void osq_unlock(struct optimistic_spin_queue *lock)
>>>>>> node = this_cpu_ptr(&osq_node);
>>>>>> next = xchg(&node->next, NULL);
>>>>>> if (next) {
>>>>>> - WRITE_ONCE(next->locked, 1);
>>>>>> + smp_store_release(&next->locked, 1);
>>>>>> return;
>>>>>> }
>>>>>>
>>>>>> next = osq_wait_next(lock, node, OSQ_UNLOCKED_VAL);
>>>>>> if (next)
>>>>>> - WRITE_ONCE(next->locked, 1);
>>>>>> + smp_store_release(&next->locked, 1);
>>>>>> }
>>>>> The test passes with the above patch:
>>> Confirming that a much more thorough test (permutating the test array
>>> size and padding) passed.
>>>
>>> What concerns me is that I am unable to observe this bug testing
>>> mutexes or rwlocks.
>> The explicit test will be a lot more aggressive.
>> Especially if the lock hold time matters.
> The algorithm is the same for all lock types. osq_lock failed, whereas mutex
> and rwlock, based on osq_lock, passes. Weird.

The purpose of osq_lock is for queuing the lock waiters with minimal 
contention on the lock cacheline. Even when the locking semantics isn't 
fully correct, it won't have an ill effect on the locking behavior of 
rwsem and mutex.  We may have 2 waiters spinning on the lock cacheline 
instead of one, for instance.

>>>> Do you know which part matters?
>>> No, but now that I am able to test the OSQ locks as a module, I'll
>>> quickly find out.
> Only the first hunk is allegedly required:
>
> @@ -143,7 +143,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>           * is implemented with a monitor-wait. vcpu_is_preempted() relies on
>           * polling, be careful.
>           */
> -       if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
> +       if (smp_cond_load_acquire(&node->locked, VAL || need_resched() ||
> 	    vcpu_is_preempted(node_cpu(node->prev))))
>                  return true;
>
> I say allegedly because a passing test doesn't prove anything, it just
> gives a good indication that it is working.

Yes, as said in my patch, the other two hunks are not really necessary 
for arm64 due to what how its barriers work.

Cheers,
Longman

