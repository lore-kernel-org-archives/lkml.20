Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A393783C4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975391; cv=none; b=mDsGiagnMMxEMM527+v+83RVxJPu6BPIidPc0bHNOkseTPe5BasHRah/SOV7rBBQ9DVJ0kjiVCMRmtpEHnBwdzUQwiYpuMIMrSVSBGp/MFHEgt0dTiJo2KR9ujwWUQfCJ8LH/DzBLUG9alkRqvVyzIKhPvOebMlGWpVzRZItpKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975391; c=relaxed/simple;
	bh=lagpjJkr81/tnGkfeNgz18bBty2mMx1bvk/1ohygWvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ngi6YZuokjPtA4ROv/XK+sEAs23M8bJcs90FPV7VzHeorTbbRLVdCzyVXRdUWeP72wSk1DrDbH6Fduk+zdI5Rrq0+Lclqf/jo6UU3HPmBp433jPgXkOoIi2RFdwpqq0dySa02NoKsnOTTxipSkAqnFs68GfGD7G6MA06SdlN1kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q4r+XuHz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q4r+XuHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788975388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WSh6MdpArjYrM7Kn0fSHLL3Qy9PfCoPnbjgv1QH7L/A=;
	b=Q4r+XuHzNXC5SMOoNY0LuqjUTWoyJzveRypdXJE2GKLH3SCOlx5xQE7u1CCX6dSmo6Ms7N
	21tZ9KSC5na+q+lxzbZmrWFpgZkNzsRs9Ja9e9iUrkapcDdzgy9gg6jsLyeoLC9aOIVkne
	3bAUqh++3xH34mXPG1iI4WDmQ18lPuo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-496-84F6LtqgNCyA2JYaPunlZQ-1; Wed,
 09 Sep 2026 13:36:25 -0400
X-MC-Unique: 84F6LtqgNCyA2JYaPunlZQ-1
X-Mimecast-MFC-AGG-ID: 84F6LtqgNCyA2JYaPunlZQ_1788975383
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B75A01800758;
	Wed,  9 Sep 2026 17:36:22 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DAE2B30001A2;
	Wed,  9 Sep 2026 17:36:20 +0000 (UTC)
Message-ID: <68519b71-eca4-487d-b8ae-3e9cbb55ef63@redhat.com>
Date: Wed, 9 Sep 2026 13:36:19 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 next 2/9] locking/osq_lock: Save the cpu number for
 'prev' not the node address
To: David Laight <david.laight.linux@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Yafang Shao <laoar.shao@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-3-david.laight.linux@gmail.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260907084133.3696-3-david.laight.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 9/7/26 4:41 AM, David Laight wrote:
> The cpu number of node->prev is needed for both the vcpu_is_preempted()
> test and to update lock->tail.
> This saves reading the cache line for the other cpu's per-cpu data.
>
> The cpu member of optimistic_spin_node is no longer needed.
>
> Merges patches 2 and 3 from v3.
>
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
>   kernel/locking/osq_lock.c | 33 ++++++++++++++-------------------
>   1 file changed, 14 insertions(+), 19 deletions(-)
>
> diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
> index b17aa704c449..01988d00c480 100644
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
> +	int prev; /* CPU number offset by 1 */
>   };
>   
>   static DEFINE_PER_CPU_SHARED_ALIGNED(struct optimistic_spin_node, osq_node);
> @@ -50,11 +50,6 @@ static inline int encode_cpu(int cpu_nr)
>   	return cpu_nr + 1;
>   }
>   
> -static inline int node_cpu(struct optimistic_spin_node *node)
> -{
> -	return node->cpu - 1;
> -}
> -
>   static inline struct optimistic_spin_node *decode_cpu(int encoded_cpu_val)
>   {
>   	int cpu_nr = encoded_cpu_val - 1;
> @@ -114,13 +109,12 @@ osq_wait_next(struct optimistic_spin_queue *lock,
>   bool osq_lock(struct optimistic_spin_queue *lock)
>   {
>   	struct optimistic_spin_node *node = this_cpu_ptr(&osq_node);
> -	struct optimistic_spin_node *prev, *next;
> +	struct optimistic_spin_node *prev_ptr, *next;
>   	int curr = encode_cpu(smp_processor_id());
> -	int old;
> +	int prev;
>   
>   	node->locked = 0;
>   	node->next = NULL;
> -	node->cpu = curr;
>   
>   	/*
>   	 * We need both ACQUIRE (pairs with corresponding RELEASE in
> @@ -128,11 +122,11 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>   	 * the node fields we just initialised) semantics when updating
>   	 * the lock tail.
>   	 */
> -	old = atomic_xchg(&lock->tail, curr);
> -	if (old == OSQ_UNLOCKED_VAL)
> +	prev = atomic_xchg(&lock->tail, curr);
> +	if (prev == OSQ_UNLOCKED_VAL)
>   		return true;
>   
> -	prev = decode_cpu(old);
> +	prev_ptr = decode_cpu(prev);
>   	node->prev = prev;
>   
>   	/*
> @@ -147,7 +141,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>   	 */
>   	smp_wmb();
>   
> -	WRITE_ONCE(prev->next, node);
> +	WRITE_ONCE(prev_ptr->next, node);
>   
>   	/*
>   	 * Normally @prev is untouchable after the above store; because at that
> @@ -165,7 +159,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>   	 * polling, be careful.
>   	 */
>   	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
> -				  vcpu_is_preempted(node_cpu(node->prev))))
> +				  vcpu_is_preempted(node->prev - 1)))
>   		return true;
>   
>   	/* unqueue */
> @@ -182,8 +176,8 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>   		 * cpu_relax() below implies a compiler barrier which would
>   		 * prevent this comparison being optimized away.
>   		 */
> -		if (data_race(prev->next) == node &&
> -		    cmpxchg(&prev->next, node, NULL) == node)
> +		if (data_race(prev_ptr->next) == node &&
> +		    cmpxchg(&prev_ptr->next, node, NULL) == node)
>   			break;
>   
>   		/*
> @@ -201,6 +195,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>   		 * case its step-C will write us a new @node->prev pointer.
>   		 */
>   		prev = READ_ONCE(node->prev);
> +		prev_ptr = decode_cpu(prev);
>   	}
>   
>   	/*
> @@ -210,7 +205,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>   	 * back to @prev.
>   	 */
>   
> -	next = osq_wait_next(lock, node, prev->cpu);
> +	next = osq_wait_next(lock, node, prev);
>   	if (!next)
>   		return false;
>   
> @@ -223,7 +218,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>   	 */
>   
>   	WRITE_ONCE(next->prev, prev);
> -	WRITE_ONCE(prev->next, next);
> +	WRITE_ONCE(prev_ptr->next, next);
>   
>   	return false;
>   }

LKTM

Reviewed-by: Waiman Long <longman@redhat.com>

