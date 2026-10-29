Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793244493;
	b=4aC7IdwsIjtS5Xd/OLycYyyBV9mQgy2QdMeM0XgX5ZToXNnfLeEYx+QZslMOONMs4jul
	 XWSN/Pu4B1CRKrLXcSof/m+OHAd227ljmPfWXNGHGWFSoXtMjZnrjIVR/jPwMyPD7U8S4
	 lzi70LlM4y9Zh6sr/F0fBgktz3uz3YWOsdnoNYX3js93PrKftaps3I3+OvBcUEa+XhHTa
	 SCiYvtKT2KOOWvCgakIdasXo3+mXKMSeBaFLYRX+OeT6fdBK8gyDeywSxWGLzg+A3KJdI
	 DcPeJz4qUtggVxdC1Nrp1//y/Xzyqi2qar0nOcP5YQidqyZOL1ZxJZY/gwyd7rOiR3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244493;
	h=DMARC-Filter:DKIM-Signature:X-Original-From:
	 Content-Transfer-Encoding:Cc:Date:Message-Id:Content-Type:References:
	 Content-Disposition:In-Reply-To:From:Subject:X-Lms-Return-Path:To:
	 Mime-Version;
	bh=bTSyegZt127U9fiQ53s7STX74brFuVvUiSNO16OEQO0=;
	b=mi1HagtyGLe49eaKvXY+isK1ie6PQdZ8eQQYL82YblutcaBDdv4HcncoCnbqYwMQ2Naz
	 NNsYCLuBhYJ3Dt7gDVxq1t5Bv5CIlrsv3OkA6eM3Ds1+rjGfGGy3fGJx/NMJVauaOIMT3
	 xsRXSt1ZtT6vmv/Zedchp2KEmZpiMI1iYpkugfxuMikb1m099AIsBz1Y4sq+w1S7jTCZx
	 IkTaQCSsWeZTjs7NEbTcNogFNPfFvqgibnqTzcy9Oqfiw4OTVuh062CfLS8xvPXklNU/W
	 UOyAn/3e2jGQmUzY7KMpT6wlNh3f0NNdQYJ1BviLBj/kERl9aYE0wXm32i7h2RZBh6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=T+Nv2LJc;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2979606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2979606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=T+Nv2LJc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793244487; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=bTSyegZt127U9fiQ53s7STX74brFuVvUiSNO16OEQO0=;
 b=T+Nv2LJcYOgEHiQdI05RomAV8gcBDnHmDds/3Ry8ygXivWnpKgQ/sTZw/0HLCS3gJwEqoE
 8aOUEGFCzq7tWloKoyGYG1EUqLQk++YeSRsDY1nSbjTSpl7b38G9mfe3yJ49tJJvEi2lDh
 YgVlxd1UoBX70GoJjjXEklC7DcZsNSnGb/A3dQbQuY/d8vNXAKrGe6N5L9lxbWLXEx1kQe
 yEIyCUFX/D9gwPPC3vSQk+i87QkOOZMcB3e+Hc9CbA/PAbNn+ApJKKdyCuHcX8p6xZslRP
 0uyvEbrK0Zjx4MFP0XzQi/eXkx4T6u8eZvEM1Tw8TvEeJ8ynAYhYfWamYdQEog==
X-Original-From: Aaron Lu <ziqianlu@bytedance.com>
Content-Transfer-Encoding: 7bit
Cc: "Daehyeon Ko" <4ncienth@gmail.com>, "Ingo Molnar" <mingo@redhat.com>, 
	"Peter Zijlstra" <peterz@infradead.org>, 
	"Juri Lelli" <juri.lelli@redhat.com>, 
	"Vincent Guittot" <vincent.guittot@linaro.org>, 
	"Dietmar Eggemann" <dietmar.eggemann@arm.com>, 
	"Steven Rostedt" <rostedt@goodmis.org>, "Mel Gorman" <mgorman@suse.de>, 
	"Valentin Schneider" <vschneid@redhat.com>, 
	"K Prateek Nayak" <kprateek.nayak@amd.com>, 
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Date: Thu, 29 Oct 2026 11:27:40 +0800
Message-Id: <20261029032740.GA2901802@bytedance.com>
Content-Type: text/plain; charset=UTF-8
References: <20261022235234.150957-1-4ncienth@gmail.com> <xm26ecd9ihv8.fsf@google.com>
Content-Disposition: inline
In-Reply-To: <xm26ecd9ihv8.fsf@google.com>
From: "Aaron Lu" <ziqianlu@bytedance.com>
Subject: Re: [PATCH] sched/fair: Clear throttle state when leaving the fair class
X-Lms-Return-Path: <lba+26ae2bd45+a6ae2c+vger.kernel.org+ziqianlu@bytedance.com>
To: "Benjamin Segall" <bsegall@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

On Wed, Oct 28, 2026 at 03:24:11PM -0700, Benjamin Segall wrote:
> Daehyeon Ko <4ncienth@gmail.com> writes:
> 
> > Task-based CFS bandwidth throttling removes a task's fair sched_entity
> > while the scheduler core still considers the task queued. p->throttled
> > carries the fair-specific state across dequeue/enqueue operations.
> >
> > DEQUEUE_CLASS removes the task from cfs_rq->throttled_limbo_list
> > but retains the bit. If the last finite CFS quota is disabled while
> > the task runs in another class, it is absent from the unthrottle walk and
> > the bit survives.
> > Returning to fair while cfs_bandwidth_used() is false then performs a real
> > fair enqueue with p->throttled still set.
> >
> > After bandwidth is re-enabled, a class-change dequeue treats the
> > stale bit as limbo state and skips __dequeue_task(). p->se.on_rq therefore
> > remains set, and put_prev_task_fair() places the entity in the EEVDF tree
> > while the task moves to RT. On exit, the fair picker can select the
> > TASK_DEAD task. __schedule() then returns to do_task_dead(),
> > which hits BUG().
> >
> > Keep p->throttled across migrations and group moves, but clear it on
> > DEQUEUE_CLASS because fair-specific state must not outlive fair-class
> > membership. A later return to fair uses the normal enqueue path. That path
> > still respects a throttled cfs_rq.
> >
> > A KASAN, LOCKDEP and DEBUG_LIST v7.3 kernel reproduced the do_task_dead()
> > BUG in 3/3 root and 3/3 delegated uid-1000 runs with CapPrm=CapEff=0 and
> > RLIMIT_RTPRIO=1. The fix passed both matrices plus a 3/3 class-switch
> > control with bandwidth continuously enabled, without a scheduler warning,
> > KASAN report, lockdep splat or crash.
> >
> > An AI coding assistant analyzed the state mismatch and drafted the initial
> > reproducer, fix candidate and this changelog. The source paths, trigger,
> > controls and results were rechecked against the cited revisions.
> >
> > Fixes: e1fad12dcb66 ("sched/fair: Switch to task based throttle model")
> > Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
> > Cc: stable@vger.kernel.org
> > ---
> 
> Yep, sched_class switch lets you smuggle ->throttled into
> !cfs_bandwidth_used(), and then that check on enqueue_throttled lets you
> smuggle it onto actually being enqueued, which leads to corruption.
> That's fun.
> 
> I think we need to use switched_from_fair though - if we are currently
> TASK_ON_RQ_MIGRATING, sched_class changes will skip going into
> dequeue_task_fair at all, so we will not see the DEQUEUE_CLASS.

sched class change serializes with migration I think, with task_rq_lock()
which waits for migration to settle, so this should not happen?
