Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900C158497D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986002; cv=none; b=fOSERLJ93WuxCPH38rzh/tL8w4mOJKlZ0lHhPEXIjakPSP0nUbSdeGypSAL46ideACMeNi1X2ppw0ZZIfRx4hSUzTaLd0pNl5LJfVHYSSgWUZegBE8Er/3zPiQi5B20ft8W8ETSEE0EqnxnLUwMKLtgKWyuBB+NXZr/Z+fqtxg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986002; c=relaxed/simple;
	bh=Hz/wEHZVuANbcFaqhzAg/cW3iP5UCa8nl7ocLZPELc0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Dlb3jeKmiX+Qm92fCPI9PV0VcXRr/nnaW21LQgW8kkckX7Xxn3TD1U8hBwoLmu7zCyajhV1zN9/hz52qIF+qr2gnRKlhFDrgmhJoehQjc68vJ0QFtJuZ/EEK2cKBh8hSl/oc2KJ9H0aTIBQ3mLC7LGRRQ/penJ/zVgXHN1NKcdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FiFw4CCc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FiFw4CCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788985993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vn0UgkkFoO66m1Xj6ffizyG2v2F7MCA507X08i6/2us=;
	b=FiFw4CCcVLPRZ14JIhN3zz2ZLsHF4IQUs5jG61oH5mq5OFHf04dMOXdKPdVHdxuohIGYj5
	h/ZnQluxz24V1/4p0U9dYdZHDQNm6zpgcJWLJZiSOG6waR7o5jwAMJz5x3l8+2psD8/xnM
	NSpt3TgSb9Qz15zizTBeJ3XIuJt9aTY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-139-2147Xw3lPmia_L1ZuUFakg-1; Wed,
 09 Sep 2026 16:33:10 -0400
X-MC-Unique: 2147Xw3lPmia_L1ZuUFakg-1
X-Mimecast-MFC-AGG-ID: 2147Xw3lPmia_L1ZuUFakg_1788985988
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0CCB318004A9;
	Wed,  9 Sep 2026 20:33:08 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1794430001A2;
	Wed,  9 Sep 2026 20:33:05 +0000 (UTC)
Message-ID: <dd6a7873-7d23-42e2-adbd-b59c43141d96@redhat.com>
Date: Wed, 9 Sep 2026 16:33:05 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 next 0/9] locking/osq_lock: Optimisations to osq_lock
 code
From: Waiman Long <longman@redhat.com>
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
Content-Language: en-US
In-Reply-To: <44bdfc4b-4729-4dc3-b7b0-53c671c5ee34@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 9/9/26 4:14 PM, Waiman Long wrote:
> On 9/9/26 10:15 AM, Haakon Bugge wrote:
>>
>>> On 7 Sep 2026, at 19:27, David Laight <david.laight.linux@gmail.com> 
>>> wrote:
>>>
>>> On Mon, 7 Sep 2026 09:08:28 -0700
>>> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>>>
>>>> On Mon, 7 Sept 2026 at 01:41, David Laight 
>>>> <david.laight.linux@gmail.com> wrote:
>>>>> I've fixed some broken/missing memory barriers but left the 
>>>>> initial xchg()
>>>>> when acquiring the lock as a full barrier, I think it could be 
>>>>> relaxed.
>>>> Well, it should almost certainly be at least an
>>>> atomic_cmpxchg_acquire(), since that's what osq_wait_next() uses for
>>>> the contention case.
>>> I'm not sure, but am no expert on acquire/release barriers.
>>> The 'fast path' osq_lock() code only has one memory access so there
>>> isn't anything to sequence it with.
>>> The important one is the smp_wmb() a bit lower down that ensures the
>>> list tail (or head) is written before the back link.
>>> When that was missing things went badly wrong.
>>> (I think the WRITE_ONCE() could be a store_release() instead.)
>>>
>>> The ACQUIRE semantics were added to ensure the 'node->next = NULL'
>>> assignment happened before the xchg().
>>> That assignment goes away in patch 5.
>>> But I'd want someone who really understands arm64 to comment.
>> These are preliminary results. I added osq_lock's to my
>> mutual-exclusion selftest [1], which has not yet been reviewed. The
>> test is based on v7.3-rc2.
>>
>> For lock acquisition, I used:
>>
>>     preempt_disable();
>>     while (!osq_lock(&el->mx_osq_lock.lock)) {
>>         preempt_enable();
>>         cond_resched();
>>         preempt_disable();
>>     }
>>
>> with the corresponding release:
>>
>>     osq_unlock(&el->mx_osq_lock.lock);
>>     preempt_enable();
>>
>> Assuming that this is a correct use of the OSQ API, the OSQ test fails
>> on a 160-CPU bare-metal Arm system. The same test passes on a 512-CPU
>> AMD x86_64 system as expected, showing at least that the test is
>> capable of passing.
>
> osq_unlock() must provide the release barrier. I think the two 
> "WRITE_ONCE(next->locked, 1)" should have been 
> "smp_store_release(&next->locked, 1)".  There is an xchg() call before 
> the WRITE_ONCE's, but it is on a different cacheline so it may not apply.
>
> Could you make that change to the existing code and rerun the test 
> again on arm64 to see if it can pass? 

osq_lock/unlock() is special in the sense that lock transfer can happen 
either in the lock cacheline or the node->locked cacheline. Try the 
patch below to see if it helps to pass the test.

Thanks,
Longman

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index b4233dc2c2b0..51cecf297692 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -143,7 +143,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
          * is implemented with a monitor-wait. vcpu_is_preempted() 
relies on
          * polling, be careful.
          */
-       if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
+       if (smp_cond_load_acquire(&node->locked, VAL || need_resched() ||
vcpu_is_preempted(node_cpu(node->prev))))
                 return true;

@@ -224,11 +224,11 @@ void osq_unlock(struct optimistic_spin_queue *lock)
         node = this_cpu_ptr(&osq_node);
         next = xchg(&node->next, NULL);
         if (next) {
-               WRITE_ONCE(next->locked, 1);
+               smp_store_release(&next->locked, 1);
                 return;
         }

         next = osq_wait_next(lock, node, OSQ_UNLOCKED_VAL);
         if (next)
-               WRITE_ONCE(next->locked, 1);
+               smp_store_release(&next->locked, 1);
  }

