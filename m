Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306382;
	b=u8zOStDGn+DVtT6Ssj3q5U7Nyc18WN562JcBj5AF6POzuauULGPZoV+BpFF0ZNUwRtzr
	 TiEYZZbsxWd/t20bOIF+r+lurqT692UJQ6rn9hXjzMmC0vcC1X9ds7/LHixcoHIP+rMCm
	 zTiqq4b0kn3SMMaLBln8vZ7xMX4eUECZTkm8EXECZiZk7+EwWy2QbeVKaKqAbzDzIXP4Q
	 AHbCLDzLmhTO/1vjjEAe/h3hj5XnESfPFLeo/vgVmMKDB8OGz6zJY+Lsvoz8WHgEcQY5g
	 P8xrhLvWlAd5Ji0v73pGZLptVSC7T91t3H29L/uAYdOF6U+PZYGtCH+mq84fiT7W5/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type;
	bh=zZ98LDJa1IE/oN6cTPpb0GoN4V76v/7mFaBGKH4x77k=;
	b=Nh6bsxlZClChNs4+yGWjBcX6aHIvjY8VBIeCXdaxvR3z81Y9vEfjksH927We7bqoJSEU
	 CHQgchTcUgdzrYrq67DJPFtgCPrwHrmTIfqdetyPQLiJeLlyMZYTwnO9ZzrzSQ9qAZ629
	 OJEIKk4IGhOT4VSzHLo5flhNOr7mLMxRpi7/NSaT6BvyX72PVKWXnHnY+7i4DBLwCOygE
	 1kTx7K3JYuUMwr/TzhNIF8JSl/gyXOqOhDTPrwCwwBnLPQoT9HTsyyN8H/bJSl+Bl7y8X
	 CncTVQdXT7J3eL+CVq9DHeImJuewGe5iSZ/qpn/gMq3FWgPoMVVwzlg9Y5C5Xf0wM8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lAkm9XIa;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BAC606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28BAC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lAkm9XIa
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso195560eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793306380; x=1793911180; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zZ98LDJa1IE/oN6cTPpb0GoN4V76v/7mFaBGKH4x77k=;
        b=lAkm9XIafJ32D5jpH3y47xA0Lyt/iZujWDQlydsE1AeX8igESOpEMbvwqu3Pz2HDm4
         JS+Fc4fMAJrJKoYv4nn4LK8I6YbnYOUN+JP4jJUbhSodrB49sLMdiYFzZ5v50A0Uy3YQ
         zXNlqOOYIA/13lEvnNVBEq5GZySO9u1YcziG/xRarI3/BU8eBQrnHlrzRUH9iLH5AWCz
         VYj+3S+vAkeFVUqsyIBzP3W/eTCrxWF7x6gnZf7gkDnin67Fc/1lHDbK/j2WvvuGeqgo
         BW1yTfthoirf2sGs5V0xGz+T5p7nGZXxnfjgZ/0JztvPMgqZCGuPN4dQfSuGddr3ksSo
         iJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793306380; x=1793911180;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zZ98LDJa1IE/oN6cTPpb0GoN4V76v/7mFaBGKH4x77k=;
        b=zPcAgDuTAkHTWawvn7GrFupcLMPtlyjo6DI95deeK8i4praV0S83UDo0UDjh0f3w4U
         a+ktjct1G3niOoG3sDQKn8PJzt23ZO6Yd8HrM5AkvGxDEW+8jMoUkwteCds6tvSxNbfw
         USmvq1W5+JCB2YCCBUXICOfJAzVbhdbZzBlki8/utnodHAadrRr2xi2Yio3WgHXpwgmc
         gFowaYfhqVzEwv6qvnmiQMuiXZSSiL1ZA6+e9QPlyf++BKIdDdt/phAo4orqj3Ydx1Tx
         4fZruWP4npKqg4OsrMtl4YGEHV8I15zXorDCEegD/InjKjTvWgsmCrIHRkMX90m1B5vx
         evKA==
X-Forwarded-Encrypted: i=1; AKwUvBx/udzPc/a4M/h/X4LBbjviwAZunkGARq55rWP3UL9bEt7qUL2h3SeXvp+qbdfbchmfvgA95tZrU5b6gh4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8F9fajrhDT/6vNp/6H114KoqZNcRtVijxO4zL0mB9cMsSSfoU
	Gg0yj1ZeGRO55xKTF/4riFo/NdgqxHbgx3bdqmh6FMbo9XfP0Mu/j4jUfZY3ckwZJCtws02fdUH
	H8dQPsEru
X-Gm-Gg: AYBFou3SHfHsbeZvkVphW6x1lA6/gtY7aHMS0q/ijYDx8JCOfPuB9TPxALRaPRe2gc5
	iOU2fItcLeEpg+A2GcS3O61L2hDFuyWD6tvFCs101C/2vUeZ/5MdkVW8FXI2tjKS0oRbFGWCRlg
	KWaSMuvQNv+JVdjkT+28LhdB/pfkRai39oHXelDXCWZpfIJaH9DxAwE9Kwz7ESTKF8ImD6lDLOD
	0kqaETx9TbgXQHTZSZ+9YloWPXI9Y/8ZHOxtD17P1deVRZQUa6kdr/khk+XR8II1pswgowR93Hs
	GMvDVQGBMMAfhjsyAwPJRO05WZkvVqv1HEanDFOgkr68sQTdij1kl2t9bXEjUeqZ2INZimjaH8G
	Be/eFHwmuTF4jXHpVvPNDjBVDLk9DqHjgIBL1Jh9rfAC9DUKEC/i+h+WdJvWpIqb9NJ2yOfXmXD
	8Ox64Xwxb7ochboSq3SCetetPNl8c3H5nH3MqzY2P/OEH3p6YUidhh2LXovHyrpw3zMIdVOBjzu
	5XU1RVpXjLarG2kolj7l2aDSON5t9cWHiCuRZwpvyYKPQadtwpl4I/Q0U32POAICM9LvjIdS9jx
	3k5n4Y+zLZE/0ckI1I3WdEDcmktrc0uVytyMjTxyRJ2UiFIKcRF3g+DZfme4
X-Received: by 2002:a05:701b:424f:20b0:149:d501:b990 with SMTP id a92af1059eb24-1ac5eea2ea4mr189708c88.25.1793306379177;
        Thu, 29 Oct 2026 13:39:39 -0700 (PDT)
Received: from bsegall27.localhost ([98.45.141.147])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458fa3sm1090743c88.4.2026.10.29.13.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:39:38 -0700 (PDT)
From: Benjamin Segall <bsegall@google.com>
To: "Aaron Lu" <ziqianlu@bytedance.com>
Cc: "Daehyeon Ko" <4ncienth@gmail.com>,  "Ingo Molnar" <mingo@redhat.com>,
  "Peter Zijlstra" <peterz@infradead.org>,  "Juri Lelli"
 <juri.lelli@redhat.com>,  "Vincent Guittot" <vincent.guittot@linaro.org>,
  "Dietmar Eggemann" <dietmar.eggemann@arm.com>,  "Steven Rostedt"
 <rostedt@goodmis.org>,  "Mel Gorman" <mgorman@suse.de>,  "Valentin
 Schneider" <vschneid@redhat.com>,  "K Prateek Nayak"
 <kprateek.nayak@amd.com>,  "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] sched/fair: Clear throttle state when leaving the fair
 class
In-Reply-To: <20261029032740.GA2901802@bytedance.com> (Aaron Lu's message of
	"Thu, 29 Oct 2026 11:27:40 +0800")
References: <20261022235234.150957-1-4ncienth@gmail.com>
	<xm26ecd9ihv8.fsf@google.com> <20261029032740.GA2901802@bytedance.com>
Date: Thu, 29 Oct 2026 13:39:37 -0700
Message-ID: <xm26a4nwi6ly.fsf@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Aaron Lu" <ziqianlu@bytedance.com> writes:

> On Wed, Oct 28, 2026 at 03:24:11PM -0700, Benjamin Segall wrote:
>> Daehyeon Ko <4ncienth@gmail.com> writes:
>> 
>> > Task-based CFS bandwidth throttling removes a task's fair sched_entity
>> > while the scheduler core still considers the task queued. p->throttled
>> > carries the fair-specific state across dequeue/enqueue operations.
>> >
>> > DEQUEUE_CLASS removes the task from cfs_rq->throttled_limbo_list
>> > but retains the bit. If the last finite CFS quota is disabled while
>> > the task runs in another class, it is absent from the unthrottle walk and
>> > the bit survives.
>> > Returning to fair while cfs_bandwidth_used() is false then performs a real
>> > fair enqueue with p->throttled still set.
>> >
>> > After bandwidth is re-enabled, a class-change dequeue treats the
>> > stale bit as limbo state and skips __dequeue_task(). p->se.on_rq therefore
>> > remains set, and put_prev_task_fair() places the entity in the EEVDF tree
>> > while the task moves to RT. On exit, the fair picker can select the
>> > TASK_DEAD task. __schedule() then returns to do_task_dead(),
>> > which hits BUG().
>> >
>> > Keep p->throttled across migrations and group moves, but clear it on
>> > DEQUEUE_CLASS because fair-specific state must not outlive fair-class
>> > membership. A later return to fair uses the normal enqueue path. That path
>> > still respects a throttled cfs_rq.
>> >
>> > A KASAN, LOCKDEP and DEBUG_LIST v7.3 kernel reproduced the do_task_dead()
>> > BUG in 3/3 root and 3/3 delegated uid-1000 runs with CapPrm=CapEff=0 and
>> > RLIMIT_RTPRIO=1. The fix passed both matrices plus a 3/3 class-switch
>> > control with bandwidth continuously enabled, without a scheduler warning,
>> > KASAN report, lockdep splat or crash.
>> >
>> > An AI coding assistant analyzed the state mismatch and drafted the initial
>> > reproducer, fix candidate and this changelog. The source paths, trigger,
>> > controls and results were rechecked against the cited revisions.
>> >
>> > Fixes: e1fad12dcb66 ("sched/fair: Switch to task based throttle model")
>> > Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
>> > Cc: stable@vger.kernel.org
>> > ---
>> 
>> Yep, sched_class switch lets you smuggle ->throttled into
>> !cfs_bandwidth_used(), and then that check on enqueue_throttled lets you
>> smuggle it onto actually being enqueued, which leads to corruption.
>> That's fun.
>> 
>> I think we need to use switched_from_fair though - if we are currently
>> TASK_ON_RQ_MIGRATING, sched_class changes will skip going into
>> dequeue_task_fair at all, so we will not see the DEQUEUE_CLASS.
>
> sched class change serializes with migration I think, with task_rq_lock()
> which waits for migration to settle, so this should not happen?

Right, of course, sigh. So then this should indeed be fine.

Reviewed-By: Ben Segall <bsegall@google.com>
