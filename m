Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B8D3AD52F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417373; cv=none; b=T/nZR6TUv2DM0yfHwr+OwpEpZI1QezTECP0BRfBE0g/24D042B+RxSXMtW6a+4UUCZ7GrlTgoBB/uSqJ5ohLNvM/oFBGsBLGcu/t1DH9FcV3Bce2cWAPnkKJ12qJMsVWciRMSlxqolQt3t9K3JHIXu/a5cISqHej/xpoBo5XEtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417373; c=relaxed/simple;
	bh=zvlpMyfSUrjRz9Di3IssgzDebEemfiRCuSfb7GSOGvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4Syyb/acPQYBEmyw+KNhO+GIf7XrMAQqRRryTnfG6dsZJpPubLjkF2M6rflD4ldL/gZUBf5X97Pgh+X+3hMVEttLK8+JQQ7wWsSjrxgL5WP7nxXTHp4ojqybOqFy1nX6g4rwM64vAcpZwJvbUyCyeI5K3ayMXTaKFrnXyoXTFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WdNU8n8J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WdNU8n8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789417370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8upkNH2O8IYnyasulTlrzDdS2mPY5U+7GMoB4t9ZbM=;
	b=WdNU8n8J3Cr/K9rfGrVnpLGWLcZkah0xZx2QEGeHns9mkR18zH0lZjfFDhBlBTLLYo4t+/
	BJu0zKmy+alhbXCuFjtdMLTIGtV2Ye9zFe1xO4IdAxbLrA7Hi/MGuk20p4lUYQNYiI2lRs
	37zvvO15GSsKoXlUjS6lUneQfU4xMHw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-418-1NwwZKnzPtqg0x3B70M1UA-1; Mon,
 14 Sep 2026 16:22:47 -0400
X-MC-Unique: 1NwwZKnzPtqg0x3B70M1UA-1
X-Mimecast-MFC-AGG-ID: 1NwwZKnzPtqg0x3B70M1UA_1789417365
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2AF2C19C95C9;
	Mon, 14 Sep 2026 20:22:45 +0000 (UTC)
Received: from [100.91.18.181] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 567591956087;
	Mon, 14 Sep 2026 20:22:43 +0000 (UTC)
Message-ID: <2e389029-5abe-40fa-9dba-40ca66189957@redhat.com>
Date: Mon, 14 Sep 2026 16:22:42 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking/osq_lock: Ensure proper locking semantics for
 osq_lock/osq_unlock()
To: David Laight <david.laight.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>,
 Haakon Bugge <haakon.bugge@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yafang Shao <laoar.shao@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
References: <20260910141908.592414-1-longman@redhat.com>
 <20260914105337.576bab34@pumpkin>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260914105337.576bab34@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 9/14/26 5:53 AM, David Laight wrote:
> On Thu, 10 Sep 2026 10:19:08 -0400
> Waiman Long <longman@redhat.com> wrote:
>
>> The osq_lock is special in the sense that lock transfer from one CPU to
>> the next can happen either over the common optimistic_spin_queue.tail
>> value with uncontended lock or over a lock waiter's own percpu
>> optimistic_spin_node.locked flag when the lock is contended.
>>
>> To ensure proper lock synchronization, we need to provide
>> the acquire/release semantics for the osq_lock/osq_unlock()
>> functions in both cases. This is currently the case for the
>> common optimistic_spin_queue.tail value, but not for the percpu
>> optimistic_spin_node.locked flag as the proper barriers are missing in
>> some places. Fix that by adding the needed barriers in those places.
>>
>> Note that the two percpu optimistic_spin_node.locked setting in
>> osq_unlock() are proceeded by a full barrier xchg() call, but the
>> contended cachelines are different. This should probably work in most
>> cases except in some exotic architectures where the barrier semantics
>> may be cacheline specific. Nevertheless a release barrier is still added
>> for safety reason as we may opt to relax the xchg() calls in the future.
>>
>> The "node->locked" read in osq_lock() was relaxed by commit 036cc30c6b6a
>> ("locking/osq: No need for load/acquire when acquire-polling") a while
>> ago as the smp_load_acquire() loop was causing a performance hit due to
>> the repeated acquire barriers in the loop and it argued that an earlier
>> atomic_xchg() call could provide the needed barrier. That may not be
>> enough especially if we have to loop for a while before the lock is
>> released. Now with the new smp_cond_load_acquire() helper, only one
>> acquire barrier is added at the end of the loop. So it shouldn't have
>> the performance hit noted in that commit.
>>
>> Currently osq_lock is used only by mutex and rw_semaphore code for queuing
>> purpose. As a result, the imperfect lock synchronization support does
>> not cause harmful consequence as the new osq_lock owner of a contended
>> osq_lock will still have to wait for the real mutex and rwsem lock to
>> be released by the pervious osq_lock owner before it can acquire it and
>> go into its critical section. For correctness, we still have to fix it
>> in case it is used elsewhere which doesn't have this inherent protection.
>>
>> Fixes: 036cc30c6b6a ("locking/osq: No need for load/acquire when acquire-polling")
>> Tested-by: Håkon Bugge <haakon.bugge@oracle.com>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   kernel/locking/osq_lock.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
>> index b4233dc2c2b0..ef1bbd914917 100644
>> --- a/kernel/locking/osq_lock.c
>> +++ b/kernel/locking/osq_lock.c
>> @@ -143,7 +143,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>>   	 * is implemented with a monitor-wait. vcpu_is_preempted() relies on
>>   	 * polling, be careful.
>>   	 */
>> -	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
>> +	if (smp_cond_load_acquire(&node->locked, VAL || need_resched() ||
>>   				  vcpu_is_preempted(node_cpu(node->prev))))
> The comment above needs changing to match.
>
> David

Thank for noticing that. I update the comment in v3 patch.

Cheers,
Longman

