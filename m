Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993704582CA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406419; cv=none; b=uHxg5P/URiRJHdgCuJ5CAptdynGsgxbthqkpkEjRpiq1vDShpHD0xO7KLhagC8Vd72uYxtguf/A4j1k2kHj8Re8EDA9M9Oia19ApTBf2rUzXPteiOIyz/REtlDmqN0kmpZVkxzdLIGh9kFqAwuuDMWkXrHJQClCp0gllkrAWrP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406419; c=relaxed/simple;
	bh=higuyYlVWIbyA9rDGoD06b63THlS2q2sR6HApTR+254=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqLXkaScEX/vfH5ZgwwgPyzMXUQxPwxT36K1BtO1OOUnrY6p5/JrmpcHYVZSVE3ZOOh+uwPAz9gmFD8o0rHTJNcw8uN48IdaM7rDhOcv/stXRLoauAdNFdNYR31fexW63SxHo+u9lDxY1vY7L3zTQ3EzbK/gXFpdnnIH7p4fbiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=itaLqfOQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="itaLqfOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789406416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2NFH5ct2UNvKSVNzgd3MUI7pwdGPIQhAUeNw4o7aaDk=;
	b=itaLqfOQXc1j+UcxijR7plGgWFthOyKFtzr5e4PVG3i0YBSMdXaPGmDT94lTOwyI6vNT4J
	f0T4XlGZJuYzACZqeOHDqdYP8v1wqNwPt/+aPRBh5N5aAwKfmvSh6NwgLuVg6ANnJmxpXp
	iIKKqkTJHOUoqvc2aJiI9ESfXCgM9PY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-505-pXZaAtwbPieQvyQTLHK9xg-1; Mon,
 14 Sep 2026 13:20:13 -0400
X-MC-Unique: pXZaAtwbPieQvyQTLHK9xg-1
X-Mimecast-MFC-AGG-ID: pXZaAtwbPieQvyQTLHK9xg_1789406412
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 001BB19541BA;
	Mon, 14 Sep 2026 17:20:12 +0000 (UTC)
Received: from [100.91.18.181] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A5AB41956089;
	Mon, 14 Sep 2026 17:20:10 +0000 (UTC)
Message-ID: <d582de03-b483-42ef-8ae0-f8d94fbccc58@redhat.com>
Date: Mon, 14 Sep 2026 13:20:09 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] locking/rtmutex: Handle empty waiters tree in
 try_to_take_rt_mutex()
To: Quchaosheng <quchaosheng000406@163.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org
References: <20260914120941.63968-1-quchaosheng000406@163.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260914120941.63968-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12


On 9/14/26 8:09 AM, Quchaosheng wrote:
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
> Reported-by: syzbot+917245f59371bf1d27f7@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=917245f59371bf1d27f7
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
> ---
>   kernel/locking/rtmutex.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
> index 4728631ae..d6c4a8377 100644
> --- a/kernel/locking/rtmutex.c
> +++ b/kernel/locking/rtmutex.c
> @@ -1131,6 +1131,16 @@ try_to_take_rt_mutex(struct rt_mutex_base *lock, struct task_struct *task,
>   	if (waiter) {
>   		struct rt_mutex_waiter *top_waiter = rt_mutex_top_waiter(lock);
>   
> +		/*
> +		 * The waiter can have been dequeued while the lock was

"can have been" is a term that is not commonly used. It should be "could 
have been". Also why the same 2 patches are sent out twice?

Other than that, this patch looks good to me.

Cheers,
Longman

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
>

