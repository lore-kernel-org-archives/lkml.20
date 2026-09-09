Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2B73932C2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976936; cv=none; b=r0IcZUpBwsCsVrnr+Mk73HULYo3FdRRWBFchPc2tvLwXg0NMiZHP72TZa8geSInGt1o5PnSoc28O/k08rUoRv7lRVL40rgvm3JZ6Iqgq7xelCqWykWlIe8ZSL2D4kMBlSoQBPsTZ+fTLek1hivQdsfHjwsXm3EP4bCZvZuhpUh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976936; c=relaxed/simple;
	bh=2l72WeLoqRvO0Y1dq2NPK2w76yasS8vk3ixu7pZTIvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=rXuVDCyFi2zLlVeJhZUKZ86HzZXl/FB1R2tE6ByNynXD6z3mJr1XXT9DcZvJywq8wAZrhHCLyQqsiOteOptqF27lovwCc28JbV56gNbBZnpyKls77/Am8p6jvyhkME880NVdM9zkvfQIul5Rln+CGvHp1eLUzsrheRZOtfSu2Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ekoyA+iG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ekoyA+iG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788976933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k3D7rU/drG9XWCkGT53lE35To+j0gsA8G1kWD+XhRTI=;
	b=ekoyA+iG+QUoppnjONt9VJV9Y/83DFTu3JMVjh6nK307LR6HlOCVRc+31Gj050M58Z9URy
	nDU+ugvDUVp3JQsCrK+bCfAGJb6o0L0zLxkqlnPwgVa1OrwxtzMitHVPsY9zm74P4K02/Z
	nA0nOoLTEkZK36fcWxPzB+/Sen9qZJ0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-9vznlbgvPAOkUeLlh_oEPg-1; Wed,
 09 Sep 2026 14:02:07 -0400
X-MC-Unique: 9vznlbgvPAOkUeLlh_oEPg-1
X-Mimecast-MFC-AGG-ID: 9vznlbgvPAOkUeLlh_oEPg_1788976922
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 038AC195410D;
	Wed,  9 Sep 2026 18:02:02 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 04DEA426;
	Wed,  9 Sep 2026 18:01:59 +0000 (UTC)
Message-ID: <ac626425-08d8-4967-bbe5-2ceb971af668@redhat.com>
Date: Wed, 9 Sep 2026 14:01:59 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 next 3/9] locking/osq_lock: Set prev_cpu=0 instead of
 locked=1
To: David Laight <david.laight.linux@gmail.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-4-david.laight.linux@gmail.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Yafang Shao <laoar.shao@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
In-Reply-To: <20260907084133.3696-4-david.laight.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 9/7/26 4:41 AM, David Laight wrote:
> There is no need for separate prev_cpu and locked members of
> struct optimistic_spin_node.
> Using a single field simplifies the code slightly.
> It also removes any possibility of the two values being out of sync.
>
> When cancelling a lock request explicitly set prev_cpu to zero.
> Nothing actually looks at the field, but it means that it will be zero
> after a subsequent 'fast path' osq_lock() call making things consistent.
> The cache line is likely to be dirty (or be dirtied) so there shouldn't
> be a performance hit.
>
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
>   kernel/locking/osq_lock.c | 57 +++++++++++++++++++--------------------
>   1 file changed, 28 insertions(+), 29 deletions(-)
>
> diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
> index 01988d00c480..23f00c670507 100644
> --- a/kernel/locking/osq_lock.c
> +++ b/kernel/locking/osq_lock.c
> @@ -35,7 +35,6 @@
>   
>   struct optimistic_spin_node {
>   	struct optimistic_spin_node *next;
> -	int locked; /* 1 if lock acquired */
>   	int prev; /* CPU number offset by 1 */
>   };
>   
I think we should document the fact that prev=0 can be viewed as a 
marker that the osq lock has been acquired.
> @@ -113,7 +112,6 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>   	int curr = encode_cpu(smp_processor_id());
>   	int prev;
>   
> -	node->locked = 0;
>   	node->next = NULL;
>   
>   	/*
> @@ -158,46 +156,47 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>   	 * is implemented with a monitor-wait. vcpu_is_preempted() relies on
>   	 * polling, be careful.
>   	 */
> -	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
> -				  vcpu_is_preempted(node->prev - 1)))
> -		return true;
> +	prev = smp_cond_load_relaxed(&node->prev, !VAL || need_resched() ||
> +				     vcpu_is_preempted(VAL - 1));
>   
What is the purpose of assigning the return value to prev and 
immediately read node->prev into prev again in the next statement?
> -	/* unqueue */
>   	/*
> -	 * Step - A  -- stabilize @prev
> +	 * Step - A
>   	 *
> -	 * Undo our @prev->next assignment; this will make @prev's
> -	 * unlock()/unqueue() wait for a next pointer since @lock points to us
> -	 * (or later).
> +	 * Loop until either node->prev is zero (lock acquired) or we
> +	 * atomically change prev->next from node to NULL (stopping prev
> +	 * handing on the lock).
> +	 * Note that 'prev' can unlink itself concurrently with this
> +	 * test so that prev/prev_ptr can be stale, but since it
> +	 * is per-cpu data the memory can always be read.
I don't quite understand what you mean by "it is per-cpu data the memory 
can always be read".
>   	 */
>   
> -	for (;;) {
> -		/*
> -		 * cpu_relax() below implies a compiler barrier which would
> -		 * prevent this comparison being optimized away.
> -		 */
> +	for (;; prev = READ_ONCE(node->prev)) {
> +		if (!prev)
> +			/* Lock acquired */
> +			return true;
> +
> +		prev_ptr = decode_cpu(prev);
> +
>   		if (data_race(prev_ptr->next) == node &&
>   		    cmpxchg(&prev_ptr->next, node, NULL) == node)
>   			break;
>   
>   		/*
> -		 * We can only fail the cmpxchg() racing against an unlock(),
> -		 * in which case we should observe @node->locked becoming
> -		 * true.
> +		 * 'prev' must have unlinked (or be in the process of unlinking)
> +		 * itself from the list.

Should we also moved the deleted comment about cpu_relax() to here?

Cheers,
Longman

