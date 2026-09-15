Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611193BE179
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506868; cv=pass; b=rMkfKjSE0G+kGf/yKg/9pS/5KghfMNWOWhVbOWLhK18lBs7yLn8IoNJAkFtYvWD5C5AZmp2CppkGtuJggi0f9S4fnl1HzKQfDrWQLI+CQVKVMzXe/cNNg955he16FWPHm3WCByLquRcEfRvU7oMTe2RJ68gPGsxRrdIe57Fg+TQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506868; c=relaxed/simple;
	bh=QNmG5GgewlFBWPJxTq5LZn0y4Pgh+2nWnbyHqUhkWUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=suDeZjhFuI+QD2VpqUHNFD5XWm9fZ0mvI23jN2XFdOOa4N5/7K6lGYiPG+NVQFInFbZwKOn1PTDov/Y3u9ZK+lILcBNT5EAhpoTD7nP0miO95RviagKNuftXG9/Q6ZTqczuS4LYzu8GxSNPlCj2gAg3KGdMov/JOa+WetuPd2WU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JouPDo01; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JouPDo01"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-939f5f82829so125130185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789506866; cv=none;
        d=google.com; s=arc-20260327;
        b=D9QOcEzhM26N8R7O6KCTmSDsS36jxdGphX0pdxXAgQARp4+Nta9OAYZ5V1n+EMn0ve
         vY+xHsoqETGZtWm0cAb55xPIst6FoF90cnzMssW41Ynamzzencw6tiFoOpPBzPeVBi7D
         M9j8d6wUxtzFW8gMMDizzGOJhKBWIThGtjrzwORhnq+oNt4HD1VFsklcaBNTvN0ChzpK
         jzK8gBkEPz97uq9oJvsXwTCfL82wGAcetPOxUJEHQVCAXqm0nC1Av/0APtZd0jSMO1jW
         lqgozmQuFOPY5DnOukxG7leOu0sjODG2f2Q5xsXWzPwaXjUwyjYPXTI1zqG5rCS0YMv2
         KwBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZVe04XZjK+KSdvjTZCzcBxC5Sq+YHQdldpTWQ+9/EVw=;
        fh=k0KnEzt8AhnQ6kJFRaVl4ka2FPu2IpB6pj42W148XvM=;
        b=mORVVEaEVhB8pPnX0Z9ov+eD9WjdrQdmHRDVoMKqrAXOh1Y6geCt2ItFd1NYKdaEHw
         71UI+B84raHdTqzgvNjK3TUwUZkNlkfYVbWdTGD+mj7vGbYo+qokvWAuNOYeZGUvqDsy
         TPrVslXQGgRlzZcZmwZakTkkcCUADSjTCv7nh8Y5Q6hFDMIxHoZKKqD4KpC5CAvKvdkJ
         CuFeDPDCThzvRxezmyl6Jnn4XzIN0oF3fyz5VyHTNB03tLKMqdt+1Pbs4IVI4JuwsVNv
         aY2Y2o5CDyXBUmhxCi2djFDJb9l05u9V0BcnFPDUSbCvPyyf0PXQAsgWzIYem2g2+X8G
         bBbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789506866; x=1790111666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVe04XZjK+KSdvjTZCzcBxC5Sq+YHQdldpTWQ+9/EVw=;
        b=JouPDo01/+VVrgqeYtF/epdzTXug++k9IADZE6g/Rx+fQgcZJBOSlzbxEwR2Id2M1X
         I/91rfWly7JGdUXOfXWLfhv5G5HBH4U0PbEi+i5JuDNGCjYYw9LbSZoAeWMwoKGRnBLr
         HZisVogM40p3ZskocrgKXCdrjWA2keUJMXrpFnr3YH5OBe307ItRgm/jTRMWwWVixiO9
         RB5v6U/UHIWVpfLl/JcC3fIcCpqrDe45h755v3l1XpETFkz2qDVu9O11cvpT9cHXf/yu
         Brh534+/O3hFlwJUEbS3bqxhYQqu7D94IoLa4ApyycYfmb7a6p/VOXxaWeq/8fDjWsYd
         aCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506866; x=1790111666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVe04XZjK+KSdvjTZCzcBxC5Sq+YHQdldpTWQ+9/EVw=;
        b=d4RO7Hn34CWBY3wkrK00jhK1Wv4tdXjOQtRBNzrvSfoTiIGx4+a6p4CC2FR5RdSrrx
         sekqwUNHYCLMQvzDsL0EgmUn5WVOVd1RQ1rbFei3kGRxqU1yimD2pU3Rizgaqp7MsDwM
         8/Hywlkzbv96lRWSjsTpQTlWjj6zPbKUfeSIKk3E+3QZ57ohzqXpvwCnZIfwYgU8O+5h
         9QGcHRWHUPcr9NGwsektS/WnhbaB8MfOCzmCu9dlrU8s08Rx9UdyRvI5zXHQBbSk0MT3
         PNs3Ep9Jifygj3VkK4oGV0wqwGWBzN6wq2FmBlQd6RN6/Kq0NarA5ehAK4kwhQQBlxnA
         4Htw==
X-Forwarded-Encrypted: i=1; AKwUvBxx+kRXDF6FFaJpc8Z/79Go8NK2HmvPNzGAqrJOZefRPigXUFF1oaEjIeMFZgZ3XxoxGyTeTE2IhULh3mI=@vger.kernel.org
X-Gm-Message-State: AFuF++mZs5bYP/sTpzhctqvsEEMm3nOoeKKIvqKyVsJpJ7QcDOVZhmvR
	Fx2O39Rlp8BPb0RjLjBTQHmZMSlTM6rcDScKYAxfsvOptD2AyLo49gSzksigvZ4vti9NNswkbLH
	S3LWVVj+LjYQf/r8K2YTvhAP62nin8+6lx0ciNWg=
X-Gm-Gg: AYBFou0EH39bmGyFqNVcAiy0mFEXAvTSAH2nTocmrIxRz7HiBdxi4r9Bv3OcbnlIBcw
	uiVoMD/qVDe2Vl6uGhenqjUw0sbXRQkBn7QcQms19zntxpUIN1sjL/ka6VOmoSSghuiYx/Uywzs
	5R1K174Y+PDB+Zvfef4Zja33p26QrxqzwGH1Pj3MFSgczy6zFF/swR6kD8/ewtwLyglNCf0Te7T
	TKCquEhgxbdu2N/lc1FWG6IwVwZfWmnQI+3fdQrFLX3qBGc39sl6h7LQLuwIa6byOXkEsE1wrM9
	+GxSK9uSIYgxCiymDerIonOBG7xb+rOUEMgskwXDyOn5dAIo8qLeJUP9BJcIUaEx30hFFx1rk/t
	DGllfCswUIAwBI0khD2j9DmsWnADrBphKVM+H783YEsDVD6lO+mfVUObgVERpSjR8D6x/Ee/FXS
	R7DKqRpg==
X-Received: by 2002:a05:620a:44c7:b0:939:f1c2:7df7 with SMTP id
 af79cd13be357-93a3474acf9mr759579985a.41.1789506865533; Tue, 15 Sep 2026
 14:14:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831134338.1531664-1-arighi@nvidia.com> <20260831134338.1531664-9-arighi@nvidia.com>
 <20260910104528.GI4120091@noisy.programming.kicks-ass.net> <aqmw0OT5cCtge-QI@gpd4>
In-Reply-To: <aqmw0OT5cCtge-QI@gpd4>
From: John Stultz <jstultz@google.com>
Date: Tue, 15 Sep 2026 14:14:11 -0700
X-Gm-Features: AcwNN1VMX_7ktPPiVAsPMREf9lXyECJY-Re-ECGI3fsOR84NWtLvN_oG1il_JF8
Message-ID: <CANDhNCqN+mJdrjgjRD_pMQYssHCrmrnE9CW8cMprPQm0dZPtWw@mail.gmail.com>
Subject: Re: [PATCH 08/18] sched: Introduce WF_ON_RQ wake flag
To: Andrea Righi <arighi@nvidia.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>, 
	David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Christian Loehle <christian.loehle@arm.com>, David Dai <david.dai@linux.dev>, 
	Emil Tsalapatis <etsal@meta.com>, Lee Trager <ltrager@nvidia.com>, Richard Cheng <icheng@nvidia.com>, 
	Koba Ko <kobak@nvidia.com>, Aiqun Yu <aiqun.yu@oss.qualcomm.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:55=E2=80=AFPM Andrea Righi <arighi@nvidia.com> wr=
ote:
> On Thu, Sep 10, 2026 at 12:45:28PM +0200, Peter Zijlstra wrote:
> > On Mon, Aug 31, 2026 at 03:42:18PM +0200, Andrea Righi wrote:
> > > ttwu_runnable() handles wakeups for tasks which are already on the
> > > runqueue, but scheduling classes cannot distinguish that path from a
> > > full wakeup activation in wakeup_preempt().
> > >
> > > Pass WF_ON_RQ to wakeup_preempt() from ttwu_runnable() so scheduling
> > > classes can handle already-runnable wakeups separately.
> > >
> > > This is a preparatory change to support proxy execution with sched_ex=
t.
> > > No functional change.
> > >
> > > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > > ---
> > >  kernel/sched/core.c  | 2 +-
> > >  kernel/sched/sched.h | 1 +
> > >  2 files changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > > index d578dd635f2eb..f142ab455b797 100644
> > > --- a/kernel/sched/core.c
> > > +++ b/kernel/sched/core.c
> > > @@ -3908,7 +3908,7 @@ static int ttwu_runnable(struct task_struct *p,=
 int wake_flags)
> > >              * When on_rq && !on_cpu the task is preempted, see if
> > >              * it should preempt the task that is current now.
> > >              */
> > > -           wakeup_preempt(rq, p, wake_flags);
> > > +           wakeup_preempt(rq, p, wake_flags | WF_ON_RQ);
> > >     }
> > >     ttwu_do_wakeup(p);
> > >     return 1;
> > > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > > index 56ac104f1f825..f30d122909e7b 100644
> > > --- a/kernel/sched/sched.h
> > > +++ b/kernel/sched/sched.h
> > > @@ -2538,6 +2538,7 @@ static inline int task_on_rq_migrating(struct t=
ask_struct *p)
> > >  #define WF_MIGRATED                0x20 /* Internal use, task got mi=
grated */
> > >  #define WF_CURRENT_CPU             0x40 /* Prefer to move the wakee =
to the current CPU. */
> > >  #define WF_RQ_SELECTED             0x80 /* ->select_task_rq() was ca=
lled */
> > > +#define WF_ON_RQ           0x100 /* Wakeup of an already runnable ta=
sk */
> >
> > I are confused again... help?
> >
> > wakeup_preempt() can only ever be called for tasks that are on the
> > runqueue. That is more or less the point of wakeup-preemption.
> >
> > Even the already-runnable distinction would mean things like
> > move_queued_task() should also have this. The task is new to this
> > runqueue, but was definitely already runnable before.
> >
> > What actual distinction are you needing?
>
> Hm... yeah, WF_ON_RQ describes the wrong distinction.
>
> What sched_ext actually needs to know is: did this wakeup use ttwu_runnab=
le(),
> changing the task back to TASK_RUNNING without calling activate_task() /
> enqueue_task()?
>
> We need the distinction because a retained proxy donor remains on the run=
queue
> while blocked. When it wakes, ttwu_runnable() can clear its blocked state
> without calling enqueue_task_scx() again.
>
> sched_ext must therefore request a reschedule so the newly unblocked task
> is reconsidered for dispatch. We don't want this extra reschedule for a n=
ormal
> wakeup because that path already called enqueue_task_scx() and performed =
the
> required sched_ext bookkeeping.

Would it be sufficient to just drop the if (task_cpu(p) =3D=3D
p->wake_cpu)  shortcut in proxy_needs_return()?
(or conditionalize it on the sched_class?)

thanks
-john
