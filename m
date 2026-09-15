Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DE640681A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494801; cv=none; b=VqXotCgSM/D2itooJ5Y9LcAFJjDnOjC3aSKy+MWlMBkeogd1slkdhy0MwqIjHFOmeJoW1RfQqMWPY9wlxwTxYUn5FsddMjdClslrg6avTGKpm/KgZeP/uHdyc4OIUPTePvXKt7A12JnUxftgHUREcDFANY1oxQj9Zr10moZiDYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494801; c=relaxed/simple;
	bh=v3wNVkWkkN/EzfCplaLcr5AT/e0B7Vd0wREKxVa6DLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4vnHKjuEOCMhzJMnNfD2Qy/Lkm7ADDzloBqBebQS27jcvqRjY6Q7hkvIBC4RDiF3DSeKTp6ZvtNLKJzG0zlY7TXGojY2dcYOrZbFZi0azkvnxuDk5oKuI2yneh4zPepm5bmxUcTHy3MS9EoCzOCJZQXJ8nm1H3YNa38kM2IqIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gL1kNHtO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gL1kNHtO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789494797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EPS6LpYPDrRZ7uEznT0WYQvf+3yiiVKnwbADij39zcs=;
	b=gL1kNHtOFdf+TP6DUsdpS4eKHEMxIZz20aNkitFGoj3GXNwv8imcuTKFI4Incd8V7zYooy
	ZFyl1PHq3QzXtQgVEd8IbULROOlid0QCEvoDuPGeZG9LvIf5ACD9k3R7/Y4LwgpXA50DED
	0r1i2bQN34EX+LeWnNMFMHnT4k3tFLQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-191-gUAWjOZiOkmVdeOC8s2PrA-1; Tue,
 15 Sep 2026 13:53:11 -0400
X-MC-Unique: gUAWjOZiOkmVdeOC8s2PrA-1
X-Mimecast-MFC-AGG-ID: gUAWjOZiOkmVdeOC8s2PrA_1789494790
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 78E361800870;
	Tue, 15 Sep 2026 17:53:09 +0000 (UTC)
Received: from [100.91.18.181] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6A9D119560AB;
	Tue, 15 Sep 2026 17:53:06 +0000 (UTC)
Message-ID: <89a400fa-f23d-41d4-9a82-df8697eed0b3@redhat.com>
Date: Tue, 15 Sep 2026 13:53:05 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] locking/osq_lock: Ensure proper locking semantics for
 osq_lock/osq_unlock()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org,
 Davidlohr Bueso <dave@stgolabs.net>, Haakon Bugge <haakon.bugge@oracle.com>,
 David Laight <david.laight.linux@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yafang Shao <laoar.shao@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
References: <20260914202102.551333-1-longman@redhat.com>
 <20260915082655.GX4121339@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260915082655.GX4121339@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 9/15/26 4:26 AM, Peter Zijlstra wrote:
> On Mon, Sep 14, 2026 at 04:21:02PM -0400, Waiman Long wrote:
>> The osq_lock is special in the sense that lock transfer from one CPU to
>> the next can happen either over the common optimistic_spin_queue.tail
>> value with uncontended lock or over a lock waiter's own percpu
>> optimistic_spin_node.locked flag when the lock is contended.
>>
>> To ensure proper lock synchronization, we need to provide
>> the acquire/release semantics for the osq_lock/osq_unlock()
>> functions in both cases. This is currently the case for the
>> common optimistic_spin_queue.tail value, but not for the percpu
>> optimistic_spin_node.locked flag as the proper barriers can be missing.
>>
>> The "node->locked" read in osq_lock() was relaxed by commit 036cc30c6b6a
>> ("locking/osq: No need for load/acquire when acquire-polling") a while
>> ago as the smp_load_acquire() loop was causing a performance hit due to
>> the repeated acquire barriers in the loop and it argued that an earlier
>> atomic_xchg() call could provide the needed barrier and reordering
>> wasn't a problem in the way osq_lock is being used by mutex and rwsem
>> for queuing purpose only. That atomic_xchg() barrier does not work
>> as a proper acquire barrier for osq_lock() if the lock hasn't been
>> acquired or isn't ready to be acquired when the barrier ends. So an
>> acquire barrier is still needed in order to have proper locking semantics.
>>
>> The performance impact stated in that patch is due to repeated issuance
>> of acquire barrier which can be expensive depending on the architectures
>> and the actual processor used. It was not clear what machine and what
>> benchmark was being used to produce the performance data. Anyway, with
>> the new smp_cond_load_acquire() helper, only one acquire barrier is
>> issued at the end of the loop. So even if there is a performance impact,
>> it should be less than a repeating one.
>>
>> As for the two percpu optimistic_spin_node.locked setting in osq_unlock(),
>> they are currently preceded by a full barrier xchg() call which can
>> provide the needed release barrier. Add comments saying that a release
>> barrier is needed for the proper functioning of the unlock operation
>> to alert people from accidentally remove the barrier when the code is
>> updated.
>>
>> Fixes: 036cc30c6b6a ("locking/osq: No need for load/acquire when acquire-polling")
>> Tested-by: Håkon Bugge <haakon.bugge@oracle.com>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   kernel/locking/osq_lock.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> [v2] Reword the commit log and keep the WRITE_ONCE() in osq_unlock()
>>       with comments.
>> [v3] Fix the comment above smp_cond_load_acquire().
> I still see no reason why this should be applied. Or even have this
> Fixes tag.

The main reason for this patch is for addressing the locking test 
failure reported by Håkon due to missing barrier. I do know that with 
the current osq_lock() use case, it is not a real problem. I just don't 
like inconsistency that an acquire barrier is just missing in just one 
place. I don't mind removing the Fixes tag though.

In your comment to David's "locking/osq_lock: Set prev_cpu=0 instead of 
locked=1" patch, you suggested adding smp_acquire__after_ctrl_dep() 
after finding that the lock had been granted which is exactly what the 
change from smp_cond_load_relaxed() to smp_cond_load_acquire() is doing. 
Right?

Cheers,
Longman

