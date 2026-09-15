Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEAC36F8F2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439429; cv=none; b=UPwD0SJALGWHLJ2dbw4DPS5HhyEwFMPDxglLVUQadhLSYCxSrzmijPXN5l5rmmmD0WSglKlzg2BG1t0jvtIqubEG7Fq6K4xsLPvYnPxweEQcvmN4lNBF75kWKQRAUyG8EpmbrSQ0M+PAalVfd7P82zzD7/2dSW9xngrDIL2BuPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439429; c=relaxed/simple;
	bh=1FyXN626oeFH8WKUodvBWZqkwWeO9DQPJqaCj/tzCOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FU/aDItUe+3tkxCHB01q9t/FBj03Ky+jOYowlIwL3pdVzF2Ji0V8ijcSO8FJL1Suk+aZosLYCo1nfdoE4YL40oBPAl/OtC69lUQppupkXCylnDtuuOuw83mMZ7bdpG0Yh93MG+F5WmESR/brFfwA2PcjjkQ0Bw7QGYwU/McYaUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=goqTcz88; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="goqTcz88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789439426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LVpmQh9v7LgpojUuNlEDgudeAsg27AVjJ35EGuYcpUo=;
	b=goqTcz88JzCS3M+fXxuwIdA/D8E1zH3zX80TNxHVggIq0pBf2BJk6s0B+O52iz+tMiokAe
	12xeE1wJlYz2qS9AS7xOnJJj0LhW8+OXHYUHHl/Cci9EP0Xsrt7vu7zeytHuKQCjRtWfD+
	fcmifRUtgtm4H2HFuhCcT38Q4kFbbVo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-508-uQCMQemgPpKmEcflAOpwSg-1; Mon,
 14 Sep 2026 22:30:17 -0400
X-MC-Unique: uQCMQemgPpKmEcflAOpwSg-1
X-Mimecast-MFC-AGG-ID: uQCMQemgPpKmEcflAOpwSg_1789439415
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6208918512C1;
	Tue, 15 Sep 2026 02:30:15 +0000 (UTC)
Received: from [100.91.18.181] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7112C1800579;
	Tue, 15 Sep 2026 02:30:12 +0000 (UTC)
Message-ID: <eeb26779-1423-4487-80d9-bcf6d6fbe097@redhat.com>
Date: Mon, 14 Sep 2026 22:30:12 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking/osq_lock: Ensure proper locking semantics for
 osq_lock/osq_unlock()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org,
 Davidlohr Bueso <dave@stgolabs.net>, Haakon Bugge <haakon.bugge@oracle.com>,
 David Laight <david.laight.linux@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yafang Shao <laoar.shao@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
References: <20260910141908.592414-1-longman@redhat.com>
 <20260914112225.GA3500130@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260914112225.GA3500130@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 9/14/26 7:22 AM, Peter Zijlstra wrote:
> On Thu, Sep 10, 2026 at 10:19:08AM -0400, Waiman Long wrote:
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
> You need to substantiate this *should*.
I don't have a good benchmark that can show any noticeable performance 
difference by adding an acquire barrier. My suspicion is that a 
repeating acquire barrier can be expensive depending on the actual 
processor used. Anyway the other osq_lock/osq_unlock() entry and exit 
points all have suitable barrier. I doubt adding one more acquire 
barrier will have a noticeable impact given that it is one-off at the 
end instead of a repeating one like the original osq_lock() code.
>> Currently osq_lock is used only by mutex and rw_semaphore code for queuing
>> purpose. As a result, the imperfect lock synchronization support does
>> not cause harmful consequence as the new osq_lock owner of a contended
>> osq_lock will still have to wait for the real mutex and rwsem lock to
>> be released by the pervious osq_lock owner before it can acquire it and
>> go into its critical section. For correctness, we still have to fix it
>> in case it is used elsewhere which doesn't have this inherent protection.
>>
>> Fixes: 036cc30c6b6a ("locking/osq: No need for load/acquire when acquire-polling")
> This doesn't make sense. You cannot argue that the code is correct as is
> and still add Fixes.

That is true. I added this paragraph to show that it is not a serious 
bug, but I still think it is better to fix it or we have to explicitly 
say that it is not a real lock in term of how it can be used. I have 
taken it out to avoid confusion.

Cheers,
Longman


>

