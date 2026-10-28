Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793226257;
	b=RgS8FSdjTTAEBZQQBAluDheNHficI65OCWnckgw6Ba0XygFhshFaCEVqK5f17gfG/ZhN
	 W9Xanpnlms9+DscKuwumgSTHy85UgEfWwWNkhaiKu4s+159kSLESRq/l+rIDHpImUM2Hi
	 8o/9NoxhTknafIJxU0f7hjcji3JcRXFpK61movvHc6lioi4G4IAzBfzrG9nAJWTyYQrpj
	 MnAWMtfOUGxuO9UiJJR6EPhSDK2DIE8j4jbq8jQbfTEG8o5QjpfGZ/yqSnl2cYPQZwpoS
	 GMUJlFGBgiZZtziibsIx6yqerbr8ZKi8l7IIh4lTWosndavE84ChcSc2+hg7dDP42VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793226257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type;
	bh=YxkFo0m8uYIuFYrzng7/iz3sB2Vb47UYtGgBwYvfCHQ=;
	b=NKKuqzlYCeVXzzPErlPVssJU6B/AYHlLl6VLphZ3jC6l2jaTktX6KWr/LZiOOxbGRuo9
	 CpbtCMbYoQEJJ9RbMRwgDbi4wtQAgunx4WgiCfUajKEr2F1/Ncp8wU78ZioocC4wEfs74
	 +9J0qeQr5t5i/50BxiXU/kLM1617XjLU0KEWyy6KCgdFc2od9A4mTSXXYI6exucI8lsEy
	 2nsYHW3uRd+EZVMc1S/21d9alGWE5VkGsC/ca8EeiytzUnoG4OHEa9iJGq4apsrX2eG4c
	 HFpcb7jRGW6runPvPnZ6osNwkoY5utx6HO/5+Y0tf5BBd4ocjMA4eC3YDX5bMLRhAVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nQwaxXT0;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30507606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30507606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nQwaxXT0
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so1719552eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793226256; x=1793831056; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YxkFo0m8uYIuFYrzng7/iz3sB2Vb47UYtGgBwYvfCHQ=;
        b=nQwaxXT0mm7nS/6hb9DeQtrGurwkBIxhg89QyFyP4MMyLhRMEpYUI4nQ8MaaxLfYHR
         ZJHMmZNxrK6bxw9tVm4G/H0wOHlLH4hKJ9ParxHozMUMYBBFsgIl1PDWIJwEauebGaES
         CeCOAn0jKSrmD0loIpWvBwT4XLLTv3pPmZqgZp6YyVjf68u7mcUf3fvCxBruq1cbWK9u
         7UrIJhHl5LwS7BEyZpdvJ2Shs3IR68i0JRgp6v67tQ6HD5khJrmFxAbmeT9qB2M9PuBx
         LgBqGPnwJbEdazdHk3rqc0bHWIz4IwR6Aj0Vw+I9rbLvvPSM1KFr8X01Q02yzin2bm2m
         h5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793226256; x=1793831056;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YxkFo0m8uYIuFYrzng7/iz3sB2Vb47UYtGgBwYvfCHQ=;
        b=n4XOU/MpJiU04vQCnII9kgWgcDVlVGiyPL4JjEfyZKbDdaLSUIxxcJUFvO9jpUENWl
         c8QR1XHE4AzUQ4OvEvbk9Owf4p8ytirBOsgGTWlHUEMmSrpzD8ss1D3vMm+Fp6P7IRUt
         34QDVMOnxqvRUyk+K3DFJZvuMLkPdSLghb9pCWlaECJLFt+9BOh0yauhk7rTYjqkOsNs
         0F8rWJoruo9O2U18XFuypYIAfKSOMA2pwABhqSaGVGGL0YlRSmUKXHPOElOJl0XQoE68
         RQnkBtMYVlSAYiMIl6DU56FSv0wlCh6iPIp7SKP2cT2XkUuCEy7gD8dZn+a5tz4hzU4p
         FGIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWQ8x5zd7Vj5vAG5mSo107mgufevglSnQ2DaBgDP0I8g9I3I34niS9UPg5KEnN7N8Xsf//DX0RFjjMgSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhsTEmsH7iiTL0J5KUTiyGr/wJy24ccwWFKnloRWYBEAL0ClZ8
	7vd+MvVMwxYbpRakm8kExONLFp1qXMhzXHnfDQhOmFj1en9LgH01naLKMnO9mHgsx82w0UR7XL2
	t8uQnOnts
X-Gm-Gg: AYBFou1Z+6/6gzRVtSjt8+yZnXiQmbuABu5LR7nxe9rmP62+wlb8cPqncTfODrvrGXb
	oL6ZfC5C4JO+Tx6wUrmoskL2C/BEBKMxoAPpIfRxg8v59MYGurmBkpeUTLA3s/LYnT4Tl6q5uKm
	EMxudtcfIqqDgkHfjwauF6+mYm3047JVrQUY0ReOQTVHO3PeynZlj8tpGPQNHvk308DVdN6n3Af
	Gq1ejIYKkfbbxZrlAHCI+h+9FkTX48IQaGv35s39PjgJgjsk4bPRs+u7nIFTN4H5Yb2cDys4aXM
	8YK91MVjjLm/3Z3E8LOhYNIjuYjdBGQAijufZoBOgFLBlv/XnboVHOfmY6LveYqsBiGsOAVKLKt
	/k+tiLry1wIAIQYsgRNhhnJ5KpZKtC3X4DdVUNVob9QH1NF25e8jLrcty21D2RroQsPoivuS64Q
	qPxqtGL/aT02PazIss+NXl50fLTahtgYaJlZSg/jURIX7KqLfrjhsR8GsH+aMfRS3XKSXaf/WyT
	UGXhVJc2c4bokOdD4IQMhv9Bjc3pst/9SbLotz1guaraIjhYvU11DISR+h/feJdTNFwT1l8QvEM
	1dGI/Nt9JyGHi/OxqP9l39SqSOVrkuKL/BQel+cKK4zfiQB9+AqnJLyzEBFLOzMKV0p3x9zV4g=
	=
X-Received: by 2002:a05:693c:20cc:10b0:369:779c:6e0b with SMTP id 5a478bee46e88-36a2044b0d1mr5540052eec.36.1793226255215;
        Wed, 28 Oct 2026 15:24:15 -0700 (PDT)
Received: from bsegall27.localhost ([2a00:79e0:2ed2:d:8aec:c5aa:cce5:3a17])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238dc80dsm11198772eec.9.2026.10.28.15.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:24:14 -0700 (PDT)
From: Benjamin Segall <bsegall@google.com>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>,  Peter Zijlstra <peterz@infradead.org>,
  Juri Lelli <juri.lelli@redhat.com>,  Vincent Guittot
 <vincent.guittot@linaro.org>,  Dietmar Eggemann
 <dietmar.eggemann@arm.com>,  Steven Rostedt <rostedt@goodmis.org>,  Mel
 Gorman <mgorman@suse.de>,  Valentin Schneider <vschneid@redhat.com>,  K
 Prateek Nayak <kprateek.nayak@amd.com>,  Aaron Lu
 <ziqianlu@bytedance.com>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] sched/fair: Clear throttle state when leaving the fair
 class
In-Reply-To: <20261022235234.150957-1-4ncienth@gmail.com> (Daehyeon Ko's
	message of "Fri, 23 Oct 2026 08:52:33 +0900")
References: <20261022235234.150957-1-4ncienth@gmail.com>
Date: Wed, 28 Oct 2026 15:24:11 -0700
Message-ID: <xm26ecd9ihv8.fsf@google.com>
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

Daehyeon Ko <4ncienth@gmail.com> writes:

> Task-based CFS bandwidth throttling removes a task's fair sched_entity
> while the scheduler core still considers the task queued. p->throttled
> carries the fair-specific state across dequeue/enqueue operations.
>
> DEQUEUE_CLASS removes the task from cfs_rq->throttled_limbo_list
> but retains the bit. If the last finite CFS quota is disabled while
> the task runs in another class, it is absent from the unthrottle walk and
> the bit survives.
> Returning to fair while cfs_bandwidth_used() is false then performs a real
> fair enqueue with p->throttled still set.
>
> After bandwidth is re-enabled, a class-change dequeue treats the
> stale bit as limbo state and skips __dequeue_task(). p->se.on_rq therefore
> remains set, and put_prev_task_fair() places the entity in the EEVDF tree
> while the task moves to RT. On exit, the fair picker can select the
> TASK_DEAD task. __schedule() then returns to do_task_dead(),
> which hits BUG().
>
> Keep p->throttled across migrations and group moves, but clear it on
> DEQUEUE_CLASS because fair-specific state must not outlive fair-class
> membership. A later return to fair uses the normal enqueue path. That path
> still respects a throttled cfs_rq.
>
> A KASAN, LOCKDEP and DEBUG_LIST v7.3 kernel reproduced the do_task_dead()
> BUG in 3/3 root and 3/3 delegated uid-1000 runs with CapPrm=CapEff=0 and
> RLIMIT_RTPRIO=1. The fix passed both matrices plus a 3/3 class-switch
> control with bandwidth continuously enabled, without a scheduler warning,
> KASAN report, lockdep splat or crash.
>
> An AI coding assistant analyzed the state mismatch and drafted the initial
> reproducer, fix candidate and this changelog. The source paths, trigger,
> controls and results were rechecked against the cited revisions.
>
> Fixes: e1fad12dcb66 ("sched/fair: Switch to task based throttle model")
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
> Cc: stable@vger.kernel.org
> ---

Yep, sched_class switch lets you smuggle ->throttled into
!cfs_bandwidth_used(), and then that check on enqueue_throttled lets you
smuggle it onto actually being enqueued, which leads to corruption.
That's fun.

I think we need to use switched_from_fair though - if we are currently
TASK_ON_RQ_MIGRATING, sched_class changes will skip going into
dequeue_task_fair at all, so we will not see the DEQUEUE_CLASS.
Triggering a migration on a throttled task can still happen I'm fairly
sure.

It's too bad, since it would be nice to just add to this existing
touchpoint, but it's at least it's trivial:

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cfc982205b98c..db57ac52eb7f7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15500,10 +15500,14 @@ static void switching_from_fair(struct rq *rq, struct task_struct *p)
 }
 
 static void switched_from_fair(struct rq *rq, struct task_struct *p)
 {
 	detach_task_cfs_rq(p);
+
+#ifdef CONFIG_CFS_BANDWIDTH
+	p->throttled = false;
+#endif
 }
 
 static void switched_to_fair(struct rq *rq, struct task_struct *p)
 {
 	WARN_ON_ONCE(p->se.sched_delayed);


(Or we could pull it out into its own function for cleanliness if it
seems worthwhile)
