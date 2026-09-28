Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6F04E5325
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609101; cv=none; b=JP2AImdk+hzg0EX3s/ODIy10LI870gxlrrQZe1De5QJUTDFDk+3i8/3w8GDtYL4tfV/NZTpab5oMm0EAH3muOOEikjXfsfLdIAKD1NQbI52x7ZSztXuq134HU3JyWLWxuueSBwOTmZc/IUtSFocxamjxKJf58TyH2sbGXE+wsbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609101; c=relaxed/simple;
	bh=/VQ3fqUhh49nLCdgEQJoV2CyAZARRzfusQcsGoOd7Fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ux8iMf1pb5sem9ZW2D7Z0pPW8mtQqfWyw08wZez7ZtszCx1dPZpXChhcKMHoPOpNH3GlujxEBlSdb8FdtTOr105bcFewI+Z9CYpggKE3Ee1kAm4cCGxP5jFccActBiy9BpQy4MXjopgg5OHj8SfOJTieVBg9J7onRHp/NFO2nVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F+D/tIOU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F+D/tIOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790609099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/xGAD9IHLV2TQkxQUKw/DnmPiWWqzG5ITGqnf+Ikieg=;
	b=F+D/tIOUU1tspcrvztqEDzWCflBLdqVomWUr1ZFJFU1rElBLWpruWSZeuS5b7DGbSgSMzz
	OfqJZe46+cEz/omdJe3ud+Febajij4Ol1iCGb630Bhah1Km7gbnMZ174yjKbapZ4qJBlh/
	aAblGELi+1fth5u6cTPN6Y7SLwU5pzo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-Edda-aa9MxuKhChUsz_f9Q-1; Mon,
 28 Sep 2026 11:24:53 -0400
X-MC-Unique: Edda-aa9MxuKhChUsz_f9Q-1
X-Mimecast-MFC-AGG-ID: Edda-aa9MxuKhChUsz_f9Q_1790609092
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 73C251800635;
	Mon, 28 Sep 2026 15:24:52 +0000 (UTC)
Received: from [100.91.18.181] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 166BA1956047;
	Mon, 28 Sep 2026 15:24:50 +0000 (UTC)
Message-ID: <bd5d5869-9435-4a42-8b27-1a3b31ea41ac@redhat.com>
Date: Mon, 28 Sep 2026 11:24:50 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] locking/rtmutex: Handle empty waiters tree in
 try_to_take_rt_mutex()
To: Quchaosheng <quchaosheng000406@163.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org,
 syzbot+917245f59371bf1d27f7@syzkaller.appspotmail.com
References: <20260915014222.13423-1-quchaosheng000406@163.com>
 <20260916073356.40360-1-quchaosheng000406@163.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260916073356.40360-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 9/16/26 3:33 AM, Quchaosheng wrote:
> The waiter branch of try_to_take_rt_mutex() reads the top waiter from the
> lock waiters tree and passes it to rt_mutex_steal() without checking that
> the tree still has waiters.
>
> rt_mutex_slowlock_block() calls try_to_take_rt_mutex() in a loop with a
> waiter that was enqueued before the loop.  The loop drops wait_lock around
> rt_mutex_schedule(), so another task can acquire and release the lock and
> dequeue the waiter in the meantime.  The loop then calls
> try_to_take_rt_mutex() again with a waiter that is no longer part of the
> waiters tree.
>
> With an empty waiters tree, rt_mutex_top_waiter() returns NULL, so
> rt_mutex_steal() dereferences a NULL rt_waiter_node and reads tree.prio at
> offset 0x18.  syzbot reports this as a general protection fault in
> try_to_take_rt_mutex on PREEMPT_RT:
>
>    general protection fault, probably for non-canonical address
>    0xdffffc0000000003
>    KASAN: null-ptr-deref in range [0x18-0x1f]
>    RIP: 0010:try_to_take_rt_mutex+0x177/0xac0 kernel/locking/rtmutex.c:1138
>    Call Trace:
>     __rt_mutex_slowlock_locked+0x1fe5/0x25b0
>     __rwbase_read_lock+0xc3/0x190
>     down_read+0x132/0x200
>     inode_lock_shared
>     lookup_slow+0x46/0x70
>     link_path_walk+0xd2a/0x1910
>     path_openat+0x1ce/0x1d60
>
> Take the lock and skip the steal attempt when the waiters tree is empty.
> rt_mutex_owner() was already checked above, so the lock is free and the
> waiter is the only candidate.  rt_mutex_dequeue() already returns early for
> a waiter that is not queued, so the skipped call is a no-op, and
> rt_mutex_set_owner() clears the transient RT_MUTEX_HAS_WAITERS state.  The
> waiter == NULL branch handles an empty tree the same way.
>
> Fixes: 48eb3f4fcfd3 ("locking/rtmutex: Implement equal priority lock stealing")
> Reported-by: syzbot+917245f59371bf1d27f7@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=917245f59371bf1d27f7
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
> ---
> v3: Add the Fixes: tag and use the wording suggested by Waiman Long.
>      No functional change.
>
> v2: Reword the comment.  No functional change.
>
>   kernel/locking/rtmutex.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
> index 4728631ae..4a6b22027 100644
> --- a/kernel/locking/rtmutex.c
> +++ b/kernel/locking/rtmutex.c
> @@ -1131,6 +1131,16 @@ try_to_take_rt_mutex(struct rt_mutex_base *lock, struct task_struct *task,
>   	if (waiter) {
>   		struct rt_mutex_waiter *top_waiter = rt_mutex_top_waiter(lock);
>   
> +		/*
> +		 * The waiter could have been dequeued while the lock was
> +		 * dropped. In that case the waiters tree is empty and
> +		 * top_waiter is NULL, so there is nothing to steal from.
> +		 * Take the lock and leave the transient state to
> +		 * rt_mutex_set_owner() below.
> +		 */
> +		if (!top_waiter)
> +			goto takeit;
> +
>   		/*
>   		 * If waiter is the highest priority waiter of @lock,
>   		 * or allowed to steal it, take it over.

Nit: It does not clearly state the top_waiter cannot be NULL when the 
given waiter is NULL. So NULL check isn't required in the else branch.

Anyway, the change makes sense.

Reviewed-by: Waiman Long <longman@redhat.com>

