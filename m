Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446424AE138
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493240; cv=none; b=GZc4gBiR4QX8eU1SGqLr/MLAuWwhez6F0qP+rDkO+uitpCJ4HztUt+MJzysBYj1JgEhF3Gwo59lxqDVd+zMQQH40bTaQP9B74lS2YNEUGzfp26Tq9k/LhfRaXW5uzevFR/MM4I/ayTG/8qgI/ggC2V87Om9K8nq2O5nrQJGAFPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493240; c=relaxed/simple;
	bh=vTfvR7mM9ROAreg0dGxbxtoPCXNtK0YPw5fGzyYDkW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHB7khXFBUsKii5JPeDOcnE/uxpm2V0Nk6g6FcwF53FD4Aw0efwKJMdRfaiEGgUyOTbOpimh0lthy/LURtAPKPFvuR8yYH6+JKnahu4swZSHFOOWkWH3liQ7B5p59EkInz792JrZ/7WP2YyWUGpENXVEGM3P7pAdi9mf1Db39cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VDKQTYMa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VDKQTYMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789493238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=47YM1DyTG9fIX1KN9+k167mXpsXG/8tW4aZJ5fAW360=;
	b=VDKQTYMa/SLFunu+SDBCdG6cu9dt2f4KjpQgZpoPNlYsy7QG2XPj6QgEjUa81HZV1wDQ8A
	IhsrECbMNzbVJDXftmeVym8zkN5wFnJE+7OSqdwBXPMZJ+wEeLmeAI544HTIGYg+c4TN2p
	x0mWMWg00JZ2tMoTgThMB2CJcat1n4M=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-231-YTZx8bOAPd6iAKxiMca_Ng-1; Tue,
 15 Sep 2026 13:27:13 -0400
X-MC-Unique: YTZx8bOAPd6iAKxiMca_Ng-1
X-Mimecast-MFC-AGG-ID: YTZx8bOAPd6iAKxiMca_Ng_1789493232
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A014B180075E;
	Tue, 15 Sep 2026 17:27:11 +0000 (UTC)
Received: from [100.91.18.181] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DB9BD1800576;
	Tue, 15 Sep 2026 17:27:08 +0000 (UTC)
Message-ID: <5448a38f-ae1b-47cb-8805-d4110be4ac5c@redhat.com>
Date: Tue, 15 Sep 2026 13:27:07 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 next 2/9] locking/osq_lock: Save the cpu number for
 'prev' not the node address
To: Peter Zijlstra <peterz@infradead.org>,
 David Laight <david.laight.linux@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yafang Shao <laoar.shao@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-3-david.laight.linux@gmail.com>
 <20260915083340.GY4121339@noisy.programming.kicks-ass.net>
 <20260915102602.GC4121620@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260915102602.GC4121620@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 9/15/26 6:26 AM, Peter Zijlstra wrote:
> On Tue, Sep 15, 2026 at 10:33:40AM +0200, Peter Zijlstra wrote:
>> On Mon, Sep 07, 2026 at 09:41:26AM +0100, David Laight wrote:
>>> The cpu number of node->prev is needed for both the vcpu_is_preempted()
>>> test and to update lock->tail.
>>> This saves reading the cache line for the other cpu's per-cpu data.
>>>
>>> The cpu member of optimistic_spin_node is no longer needed.
>>>
>>> Merges patches 2 and 3 from v3.
>>>
>>> Signed-off-by: David Laight <david.laight.linux@gmail.com>
>>> ---
>>>   kernel/locking/osq_lock.c | 33 ++++++++++++++-------------------
>>>   1 file changed, 14 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
>>> index b17aa704c449..01988d00c480 100644
>>> --- a/kernel/locking/osq_lock.c
>>> +++ b/kernel/locking/osq_lock.c
>>> @@ -34,9 +34,9 @@
>>>    */
>>>   
>>>   struct optimistic_spin_node {
>>> -	struct optimistic_spin_node *next, *prev;
>>> +	struct optimistic_spin_node *next;
>>>   	int locked; /* 1 if lock acquired */
>>> -	int cpu; /* encoded CPU # + 1 value */
>>> +	int prev; /* CPU number offset by 1 */
>>>   };
>>>   
>>>   static DEFINE_PER_CPU_SHARED_ALIGNED(struct optimistic_spin_node, osq_node);
>>> @@ -114,13 +109,12 @@ osq_wait_next(struct optimistic_spin_queue *lock,
>>>   bool osq_lock(struct optimistic_spin_queue *lock)
>>>   {
>>>   	struct optimistic_spin_node *node = this_cpu_ptr(&osq_node);
>>> -	struct optimistic_spin_node *prev, *next;
>>> +	struct optimistic_spin_node *prev_ptr, *next;
>>>   	int curr = encode_cpu(smp_processor_id());
>>> -	int old;
>>> +	int prev;
>> I'm not a fan in the asymmetry of the naming, that is very confusing at
>> best.
> Maybe something like so?
>
> ---
> --- a/kernel/locking/osq_lock.c
> +++ b/kernel/locking/osq_lock.c
> @@ -34,9 +34,9 @@
>    */
>   
>   struct optimistic_spin_node {
> -	struct optimistic_spin_node *next, *prev;
> +	struct optimistic_spin_node *next;
>   	int locked; /* 1 if lock acquired */
> -	int cpu; /* encoded CPU # + 1 value */
> +	int prev_cpu; /* CPU number offset by 1 */
>   };

Yes, I like the prev_cpu name better than prev. It makes the code easier 
to understand.

Cheers,
Longman

