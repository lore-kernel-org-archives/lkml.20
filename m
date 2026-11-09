Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794240894;
	b=o7XjgUgPv5hAacY4ab9aIF5k8Dc77GdPNdrAfX/D8pgRGOIWL8NfJ080AfLBY/J8Zf8x
	 glsOvHwnw3oYVpAR34OdzIRAMHjcnUMmOgsEhSi1dGA/TD2yENd91nhtCnAdn53RCJ/CH
	 FWifXmlzMN57Yr4a/4Wcf5HxFT817cQ75mwSjro2guK92w+sYNHNpFElPBs1e9XFDMNxh
	 N2J/PhCpJ8P78TOCplYmpro4GhKsU6bwbkUwaok6SioFgdBHQnyl6xrzRH4TTd0uTJw+5
	 1hWm8oavExxEKjpsZN/KuFxtTranQx51XNCtCJTTk32vfpdHIH1PpI/iIfmt8kgeqqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Iazb6upx9SUGzyZFOTqETYh5xGwU5uNLEyV8UXrgEeE=;
	b=BT0e0j6dVUj7Ghvmf9fJ66zRJHOsZ/heHOXtuG2O6RtyDdENf2N5vRQOxrhChIXucnl4
	 UVJxz+kzi+pQ4+Ix7qMs7eeKoJMo/12okGzDe09ZOfVciC6EqSpzzADRPySNeQEiSgfL/
	 Lrpt4b2MPovVA+S7156IFSnQpxODmBQrE4Kln84ncsHj2MBSIsImpk8q0nqG5w+ZxUqui
	 LZEleTtHXvs32tCHOnKxexgORMzPTQ95T0fGWCopO5QD1jKYo5qBEvDRNMZg+omFU4zwa
	 Qw6a/9WZ+t4EfuAAqK/dap0j84vhC3yq4x8Uo+UahqR3dI/ZneTooMm7t8ob9RKz1MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IKT4xzwd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E08606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E08606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IKT4xzwd
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so1413381a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:14:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794240893; cv=none;
        d=google.com; s=arc-20260327;
        b=sF+RyKTTsr69iA9jhB2LJEMpDzkQIox+I8cTCEz3RdCiO0II4hLz0uh+iZuxD0h9lr
         oPkLYLE1cMudofwTfOQ8JI+S39OK9NIIu0aTCo/xJybDtbXqhZXu+tjIda/ZI6Yzt2+D
         DW048OtbF3v1tJ3vkTBKDkzflSIeQxlTXg3hta4f9f86Tjppc8iOrzV5tmhpvxsC+7pt
         uPegg5Up/xORXbedouw7dvAnTMaC4Je1LzBk+CxFYvbC3eb7y+7pxPVyi4H2vZdCzbZv
         /AXi73QZWOSKvgS6r3aPa6rdBZifuo3hC+rbQ2OY727iM4cA1BVNg6Z1uR+sL6BmtHhZ
         haSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Iazb6upx9SUGzyZFOTqETYh5xGwU5uNLEyV8UXrgEeE=;
        fh=kCnRocTZdN1CQdsa/dGbByRI6ln4Agp5g/Tp/ZB2iGI=;
        b=MFRDIQo+PB93WLkD7VMQc37x6V/E2bvZMMRiLGlnaKEWeCTM8xrcRNbW33TZDYiB6Z
         U3riUXMu1GcPuLiYZ6shwqMnGJTBFCdHLYfak8SDlTA1jBM3OZ306eS3suQM/mBONArV
         LFy5uG1/F96kakGvGUYhTsIntdswGRpjW213m/8TaOym/NV9yzwoIgZPTDaHGP0PK234
         wo+vUaiQ8jHNBxYdkH8z0sXi+TptJkmsmlrTFQ2ESEdaidM/23GEvoTZRodYilijoClK
         KUZ8/tGGUF4yrxH8uRY6DqCufDW/QAt71KLgS5o1j8aPwMo3mdzESJCpDKN8tgmitr1L
         GdPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794240893; x=1794845693; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iazb6upx9SUGzyZFOTqETYh5xGwU5uNLEyV8UXrgEeE=;
        b=IKT4xzwdBITINaAmi9Te00xNxWBY8gPeyVTW7S5qwm51AkeDkhtCoh5jhu7fGcTHR3
         6QTN8dTJ2oR3dvu5TVx5U/BeCfqy8FOonrfaekGc1/+N80gsHUkjbwnGL/Ox6Lce6IuW
         CohYZ++fW208MYiAW877VmLQLzbXNIYl+hbW144I5sp5ErPT0HPckXjp8otNdzyyCZSB
         8m6vQzu5PvMtPN+Ca4gQvLUyOU6bmNQqcipW7Jm2aJCT2/FJXgVQKdzHHByoztNKGXSc
         Tb7zY9NSZKhtObVjil9Es9DolX02wmyjl4OJ5FqNkskpBSgPccF3K/vIAQmt7VfarSl7
         89Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240893; x=1794845693;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Iazb6upx9SUGzyZFOTqETYh5xGwU5uNLEyV8UXrgEeE=;
        b=v2gpOUPY5mWWbUXeatZG46M8xdoog7eaqRfj5+ds7nnhVpJZ1did+xwMkBBLMZNSu1
         ZG8jDwMSqPhdfkXGSMmMa6KVFyZq+oSF3ZIsjr4m/rhSF4o+ywXPactddyVEjCdFgOes
         zTm0XXN3O0RQMXtJFQclioDISpqnMbv5LQwul5N6rWgbDQXGyWXU5QfhSfTxUxsfjjaB
         TnkDJaQBTnZP5VtNOegGKiWNMkqkIfwOgPzcu/9A3BqSHhv6HmMbARs+fNCE2TI0ljT4
         PbVTo5b8ji661BWdaL2lBvWr2LxTNcziZw1dzbPf15E0D70B9mgOUvJ8DDb7se4tBXbp
         YT/Q==
X-Forwarded-Encrypted: i=1; AL+hErFogaSgzCbFlOJI5KR7ybISOCm8D0vRQMQPePvLEXQpe3naWrmHFb+C196MSUTCgHaW0JCO/BDOcYXPhQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xJOm7SzOzvuIdwCqIF5K/fnMUyCe2nNv2eZyHvhLBlKjKNd5N
	zRTrSQCL1rCqQT+RZEMdEOqgexSEjfzPlU8BXQgfU38WusuT6wK2PkwF4wRHFprceWXPCXtgbgX
	/LXfpr3y/mbRXxXx9xVnJiGjPzXbkBbqhAq50zp2BdA==
X-Gm-Gg: AYBFou0FXjhebow9iz4tGI0M1JrMF1WZVOU2S5o3uSimNCz7eUvAzEmGj/fho/nYi8F
	gyDqZxy+ux+v8MUe9601Fzo/czHq5/ddws5x9nhKvoAokgjedfwfvK7p2ic8DU6Hf6Zp081YoOf
	QqWfjf3d3pJdhAUc4y3TxlmzqOU+b8P5Oz5bbHBT+hh3KyjTRGPW7YCqbnF+Ej4NY4fg2ko9BUd
	5d1LmF81bZaqB2DADGng5RDHLvUI9S/tmfckx9khofN1LG23unL9UyODaaQKt09cfE0ssNNZqwA
	1KmoCCQaK1exwYhECYvb0Di87cE6uOxaI+QBhvr0Y31cEboKQiOnJqVkhrCHt4ZkcHm6VBOmAEU
	vuTs6SsmrzLmhGFhPIc+3OjL4nzEAzB6O73x1uWhsEGDZVIGtf1OiXoDEBGfYY91sPDf8Kw==
X-Received: by 2002:aa7:d7d5:0:b0:6b6:e808:9701 with SMTP id
 4fb4d7f45d1cf-6b755e6b4aamr53584a12.1.1794240892542; Mon, 09 Nov 2026
 08:14:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-9-vincent.guittot@linaro.org> <20261109155418.GL1779021@noisy.programming.kicks-ass.net>
In-Reply-To: <20261109155418.GL1779021@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 9 Nov 2026 17:14:39 +0100
X-Gm-Features: AclHuK8Lril_R7chVytS1fQiJPDmi6Vo891N6VuKxGIj8nfdzRAKgkQea7WMEGA
Message-ID: <CAKfTPtA-nrgGQGcBPqNoPk4atOHakyZK9Fk-4AsrHBrnvPXTLQ@mail.gmail.com>
Subject: Re: [PATCH 08/20 v3] sched/fair: Add push task mechanism for fair
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, lukasz.luba@arm.com, 
	rafael@kernel.org, linux-pm@vger.kernel.org, tj@kernel.org, 
	void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev, qyousef@layalina.io, christian.loehle@arm.com, 
	pierre.gondois@arm.com, sshegde@linux.ibm.com, kayracizmeci@gmail.com, 
	tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 16:54, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Nov 06, 2026 at 04:19:35PM +0100, Vincent Guittot wrote:
>
> > +static bool __check_pushable_fair_task(struct rq *rq, struct task_struct *p)
> > +{
> > +     if (!task_on_rq_queued(p))
> > +             return false;
> > +
> > +     if (p->se.sched_delayed)
> > +             return false;
> > +
> > +     if (p->nr_cpus_allowed <= 1)
> > +             return false;
> > +
> > +     return true;
> > +}
> > +
> > +static bool fair_check_pushable_task(struct rq *rq, struct task_struct *p, struct task_struct *next)
> > +{
> > +     if (!__check_pushable_fair_task(rq, p))
> > +             return false;
> > +
> > +     if (next == p)
> > +             return false;
> > +
> > +     return false;
> > +}
>
> > +static void fair_remove_pushable_task(struct rq *rq, struct task_struct *p)
> > +{
> > +     if (sched_push_task_enabled())
> > +             plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> > +}
> > +
> > +static void __fair_add_pushable_task(struct rq *rq, struct task_struct *p)
> > +{
> > +     plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> > +     plist_node_init(&p->pushable_tasks, p->prio);
> > +     plist_add(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> > +}
> > +
> > +static void fair_add_pushable_prev(struct rq *rq, struct task_struct *prev,
> > +                                struct task_struct *next)
> > +{
> > +     if (sched_push_task_enabled() && fair_check_pushable_task(rq, prev, next))
> > +             __fair_add_pushable_task(rq, prev);
> > +}
>
>
> Can't we add the 'p->nr_cpus_allowed > 1' condition to rq->cfs_tasks and
> use that, rather than adding yet another list? I mean, its used for
> migration, so excluding all pinned tasks actually makes sense.

rq->cfs_tasks can be quite large (we even take a breath during LB)
whereas this list should be 1 task most of the time (except during
wakeup)

>
> Also, I'm still not sure why we need a plist. The rq->cfs_tasks list is
> MRU per set_next_task_fair() moving the current task to the front.

The plist was only to reuse struct plist_node pushable_tasks; in
struct task that is already there for RT

>
> So reserve iterating rq->cfs_tasks, skipping blocked and current and
> such, should get you much the same over-all.

Yes but I was afraid by the overhead of iterating this list which can
be very long; We have already seen email about bug with thousands of
tasks queued on the rq

>
> That is, why can't push_task_fair() be something like:
>
>         list_for_each_entry_reserve(p, rq->cfs_tasks, se.group_node) {
>
>                 if (!can_push_task(p,..))
>                         continue;
>
>                 ...
>         }
>
> This would result in pushing the task that has not ran longest; which I
> think makes most sense. Hmm?
