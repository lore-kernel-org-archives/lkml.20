Received: from sender5-pp-o92.zoho.com (sender5-pp-o92.zoho.com [165.173.182.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE744908CF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815741; cv=pass; b=YMoDBnfnRKkiXc72yPFA4rrbviYypZZYBzyDGHL76G0JAE5XqqgwlTNik3+yQPNZ6892RFng28v0E8VP4ghQGNkBxBbyla6LxGuWMbWZyPuYOMaYTlZwTMN8Lda5Z94v9RDlplACoTgrKRz+7A1F0RfAwBxEnqT4TaZWrR+bXVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815741; c=relaxed/simple;
	bh=HGLyQmWVR68qS0z25Hb6CqPJXYyjmIBz2DlBCEvViPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPspcHvwnuVcsOreoGBkj2qxDGT5LDgXtyeWc0THuU9b9ezLaH2gjN65opSVdF5VTCStGoNS8iKUVTntEUxRQKs96m9zy+UzAHSkA5fKnjeUSkEfgzrG7uKB2g5KyMYKY6SeEpxJOoLSzyfAfAg/ri2Ylj9e+7jbxl0HiDk6Vsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=T+ExXVq3; arc=pass smtp.client-ip=165.173.182.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="T+ExXVq3"
ARC-Seal: i=1; a=rsa-sha256; t=1791815712; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D64GW5sQUfTtclqzOslqE7jO1eeclI0fIdJU5H2VQR61Gamp1HxpWxbBrTk1cg/+QfwOUwdhBFf+N9tGWZiPU9wcYUIe7mYnro2uz064sVxAeBv9r+Hn6JKXJ3mw/7YBP/g0clKJIMCSZSYHoI4SvGZ+JC8YUlMANqWdR6Gh4DM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791815712; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pHM6ohKDa+PVmZmUWUXUKvPlV6BCQpiSR6hNIGr9tw0=; 
	b=bJPwygFEqHRw2hLEnVW1Yn+Ru3dUW9HvA+ixw4hDaP5r8fViXssaRmojnFOa3+Vxs4ezGtI/LUPPg2U7beaWDhjF7nma1Qn8+IpsZVjMYiyZsaxvsice59x/UjhZ1cdQnhECmiFt3R8gmZJcVCt0PPVH5yZNkwsE4HpgyDov0/4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791815712;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=pHM6ohKDa+PVmZmUWUXUKvPlV6BCQpiSR6hNIGr9tw0=;
	b=T+ExXVq3w7cS6RnrtUAzm2jLlDVQ1tzvLlPKsLhRbsq0A3y1wp8XevDVXCYK7zuG
	IZLBXU+u0eSmp8eYZXFkM5eoVdjnThmgbl26n1XCy/oDjHp1sYsaaOI2dRV0t4+IQz5
	t53hZyDHzZipHNB3KYytuk3zLojYbU61011y9awQ=
Received: by smtp.zohomail.com with SMTPS id 1791815706871470.10213256379734;
	Mon, 12 Oct 2026 07:35:06 -0700 (PDT)
Message-ID: <ab001a53-e2d2-42e9-ba40-8b43a71a7d64@zohomail.com>
Date: Mon, 12 Oct 2026 22:34:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3] sched/proxy: Defer donor commit until after proxy
 resolution
To: K Prateek Nayak <kprateek.nayak@amd.com>, Ingo Molnar <mingo@redhat.com>,
 John Stultz <jstultz@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Andrea Righi <arighi@nvidia.com>
Cc: linux-kernel@vger.kernel.org
References: <20260827-sched-proxy-v3-1-1af63ac5ae56@zohomail.com>
 <0fe8a0fe-68f5-467b-be82-cf631e00fd87@zohomail.com>
 <832e9395-49e9-40dd-a4db-1c1bf9753100@amd.com>
 <d5cb66ce-9d96-45f7-a07d-5dc3ac70e8d2@zohomail.com>
 <adaa5bee-bfe9-4a03-acc7-0e41c5242e7d@amd.com>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <adaa5bee-bfe9-4a03-acc7-0e41c5242e7d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Feedback-ID: zu080112273d7f3dc9790b70536147f10e000099319a4f0db88f014af97ecb4f34d3367176e5abfc59637911:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External

Hi Prateek,

Thanks for the detailed reply.

On 2026/10/12 17:21, K Prateek Nayak wrote:
> I see. I guess, proxy_reshed_idle() would be a better spot to
> consolidate it rather than juggling it in __schedule().
>
>> The next pick clearing rq->dl_server does not undo that assignment,
>> since the pointer has already moved to rq->idle->dl_server. It is only
>> cleared later when idle becomes the prev task of another
>> put_prev_set_next_task() transition.
> Which should be the very next __schedule() since we retain NEED_RESCHED
> except if all the tasks migrate away and we genuinely select rq->idle,
> then the dl_server lingers around.
...
>> If proxy resolution returns NULL or idle, the saved value is not
>> restored into rq->dl_server for a donor commit that will not happen.
>>
>> So the intent is to keep the DL-server selection made for the candidate
>> out of rq->dl_server while proxy resolution is in progress, and restore
>> it only if that donor is actually going to be committed, while keeping
>> the state seen by find_proxy_task() consistent with the pre-patch path.
>>
>> Do you think rq->idle->dl_server being set in the second sequence above
>> is harmless, or is keeping the save/clear/restore the right way to avoid
>> that state?
> I assume it may take the dl_defer_idle path but I'm not super sure. I
> personally prefer resetting state in proxy_resched_idle() since it is
> all in one place to refer at any point.

I agree with your suggestion. So I removed the save/clear/restore around
find_proxy_task() and now clear rq->dl_server in proxy_resched_idle()
before committing idle.

This leaves the successful-resolution path untouched, while a NULL
retry lets the next pick_next_task() reset/recompute rq->dl_server.

> On current tip + sched-ext changes lined for v7.4 from
> https://lore.kernel.org/lkml/20260922165445.943315-9-arighi@nvidia.com/
> some sched-ext bits will need rq->donor to already reflect the next
> selection before they are called

I rebased this onto the latest tip, and also applied the patch on top of
Andrea's sched_ext proxy-exec changes through the curr/donor split to
check the resulting ordering.

The rebased scheduling path now looks roughly like this:

```

pick_again:
        donor = pick_next_task(rq, &rf);
        rq->next_class = donor->sched_class;
        next = donor;

        if (sched_proxy_exec()) {
                struct task_struct *prev_donor = rq->donor;

                donor->blocked_donor = NULL;

                if (unlikely(donor->is_blocked)) {
                        next = find_proxy_task(rq, donor, &rf);
                        if (!next)
                                goto pick_again;

                        if (next == rq->idle) {
                                scx_proxy_reenqueue_retry(rq, next);
                                goto keep_resched;
                        }
                }

                put_prev_set_next_task(rq, prev_donor, donor);

                if (donor == prev_donor && prev != next) {
                        donor->sched_class->put_prev_task(rq, donor, donor);
                        donor->sched_class->set_next_task(rq, donor,
SNT_PICK);
                }

                rq_set_donor(rq, donor);

                scx_proxy_donor_start(rq);
                scx_proxy_reenqueue_retry(rq, next);
        } else {
                put_prev_set_next_task(rq, rq->donor, donor);
                rq_set_donor(rq, donor);
        }
```

and proxy_resched_idle() now does:

```

proxy_resched_idle()

{

    rq->dl_server = NULL;

    put_prev_set_next_task(...);

    ...

}

```

So the proxy-specific handling stays in one place in __schedule(), and
the existing sched_ext hooks remain in their current order.

I also looked more closely at the rq->donor dependency
in do_pick_task_scx():

```

static struct task_struct *do_pick_task_scx(...)

{

    struct task_struct *prev = rq->donor;

    ...

}

```

Suppose A is the currently committed donor and the first SCX pick
selects blocked donor D.

With the current early-commit ordering, the sequence is roughly:

```

    next = pick_next_task(); /* rq->donor is A */

        |-> pick_next_task_scx(); /* SCX pick with rq->donor
is A, selects D */

        |-> set_next_task_scx(D); /* D is removed from the local DSQ */

    rq_set_donor(rq, D); /*rq->donor is D */;

    next = find_proxy_task(D); /* if next == NULL */

    if (!next) goto pick_again;


pick_again:    

    pick_next_task(); /* rq->donor is D */

        |-> pick_next_task_scx(); /* SCX pick with prev is D, and D may
be retained through SCX_DSP_PREV. */

```


With the deferred ordering:

```

    pick_next_task(); /* rq->donor is A */

        |-> pick_next_task_scx(prev=A); /* selects D */

    next = find_proxy_task(D); /* if next == NULL */

    if (!next) goto pick_again;


pick_again:    

    pick_next_task(); /* rq->donor is A */

        |-> pick_next_task_scx(prev=A); /* D is still SCX_TASK_QUEUED
and still on the local DSQ, because set_next_task_scx() has not run yet. */

```

If find_proxy_task() did not otherwise change the relevant runqueue/SCX
state, the retry therefore starts from the same committed prev=A, while
D remains the local candidate selected by the first pass. Since the
first pass did not retain A through SCX_DSP_PREV, the retry reaches the
local DSQ again and selects D through SCX_DSP_LOCAL.

So the internal retry mechanism changes from `provisional D ->
SCX_DSP_PREV` to `committed A + queued D -> SCX_DSP_LOCAL`  without
changing the candidate in the unchanged-state case.

If find_proxy_task() deactivates or migrates D, then the runqueue state
has genuinely changed and the retry should of course select against that
new state. In that case it seems preferable for rq->donor to continue
describing the last committed scheduling context rather than committing
D provisionally and repairing that state afterwards.

Similarly, if SCX dispatch drops the rq lock, the existing
lock_drop_seq / SCX_DSP_RETRY handling already restarts selection
against the new state, so I don't see a need for an early rq->donor
update there either.

For a successful proxy resolution, the existing sched_ext ordering still
works unchanged:

```

find_proxy_task(D);

put_prev_set_next_task(..., D);

rq_set_donor(D);

scx_proxy_donor_start(); /* ops.running(D) is still issued only after D
has become the committed rq->donor. */

```

Given this, I don't see an additional sched_ext complexity introduced by
deferring the commit; the main difference is that rq->donor continues to
describe the committed scheduling context while proxy resolution is
still provisional.

Also, I probably wouldn't characterize the main benefit of this change
as a performance optimization. The end-to-end performance impact I
measured is indeed small.

The main benefit I am after is the scheduling-state semantics. The
invariant I am trying to preserve is that rq->donor and the
scheduler-class current state describe a scheduling context which has
survived proxy resolution, rather than a provisional candidate which
may still be deactivated, migrated, or cause the proxy walk to retry.

In other words, the intended ordering is:

1. pick candidate

2. resolve proxy chain

3. commit donor / scheduler-class state

rather than:

1. pick candidate

    -> commit donor / scheduler-class state

2. resolve proxy chain

    -> possibly discard that candidate and retry 1.


The reduction in redundant put_prev_task()/set_next_task() callbacks is
a consequence of keeping that commit boundary after proxy resolution,
rather than the primary reason for the change.

The sched_ext integration also seems to illustrate why keeping the
commit boundary after proxy resolution is useful. In Andrea's
'sched_ext: Fix ops.running/stopping() pairing for proxy-exec donors'
commit (5f882051efabaf19f9b4dbe4b50cee1d250ac19e), set_next_task_scx()
has to treat a blocked donor specially and defer ops.running() to
scx_proxy_donor_start(), specifically because proxy resolution can still
fail or migrate the donor after set_next_task_scx() has run.

> Thank you but I'd wait for Peter and John to chime in regarding the added
> code complexity given the visible benefits of this optimization isn't
> too much.

Thanks. I'll wait for Peter/John's thoughts before sending v4.

-- 
Best regards,
Xukai

