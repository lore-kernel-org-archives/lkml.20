Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50839489FC0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049793; cv=none; b=VGKCWC8XPpqW8ccIKjEz9EMpjybdZnQZniynoMwmvvjBrzkrhAjV+o3bQiBrFJ6a1ugAlDwgyjEBBu4hizdhW+ShebR0Hcp0qcx5geu63hf6T3gkDueOUd4C2hIAjYoHyGxmh22xzCYTBYxIIFvBGlyPnVC0J03MKpvHcr7ZTJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049793; c=relaxed/simple;
	bh=eFCMKFD1nyvitbDUh76JsqzJHFb1idtGqAx0Xd0O7Rc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l3+yPN+DU2DcFiXgjpkvJDWjv0uHiWcgxMNDayVJo3DcEBdM4j8Tvx6Ve7X8zqYrgtjG1g4nlfnEQVpRP7T5tQ4CYqiGgQuhXqK2/Kyyi1cjI5lvDtpQ51WAW6ARNkBkEfP9za2w+LlUHXUCbsi/MQKWWvEGFihZ3uHPfNlVqvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GKosabL7; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GKosabL7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=RZ
	Q0l+/mhu/T5mevbWqACUFS7SAT3X86dLH/yrYHTCQ=; b=GKosabL7opYODmJqRl
	XfWgoPXk+VNPdHA12XQg2Go8XoVIsF7kZGJkyZQiI+ZraKx0ne1pu90aYGeDiL0n
	2LWk3oVajnTHDLJHZykjsCep1uJpgu5TLLlSwZPqmLClpr1HQWZqBNqL1160PCGw
	Hw27Nm11sE9ABnAFZg2e0WD2M=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wC3DIV0u6JqDjttBw--.40972S2;
	Thu, 10 Sep 2026 22:15:17 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: kprateek.nayak@amd.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	jackzxcui1989@163.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [RFC PATCH RESEND 03/10] sched/fair: Clear active_balance at the end of active_load_balance_cpu_stop()
Date: Thu, 10 Sep 2026 22:15:16 +0800
Message-Id: <20260910141516.1977498-1-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f771bdd6-3e4b-47db-bfa9-b04bd58b9a06@amd.com>
References: <f771bdd6-3e4b-47db-bfa9-b04bd58b9a06@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3DIV0u6JqDjttBw--.40972S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFyDAw1DCryxWF4DJrWrKrg_yoW5Jr47pr
	W0yF1Ivr4DtryFkrZ2ka1DWayI9rs7JF45GFnYq3yfZ3W5Cas3t3WfKay7ZF45ArsYka4Y
	y3yYyFyUCas8CFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRl4iUUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbCvxVPWWqiu3WG7gAA3S

On Thu, 10 Sep 2026 13:39:10 +0530 K Prateek Nayak <kprateek.nayak@amd.com> wrote:

> > The rq->active_balance flag is used to prevent multiple CPUs from
> > simultaneously dispatching active balance stop tasks. Since there can only
> > ever be one consumer of the stop task, it is not strictly necessary to
> > protect the setting of rq->active_balance to 0 with the rq lock in
> > active_load_balance_cpu_stop(). Therefore, we can move the action of
> > clearing rq->active_balance to the end of active_load_balance_cpu_stop().
> > The benefit of this approach is that the task load of dst_rq will change
> > due to the execution of attach_one_task(), which helps avoid prematurely
> > clearing rq->active_balance before attach_one_task(), thus preventing
> > unnecessary dispatch of duplicate active balance stop tasks.
> 
> Aren't we moving tasks *out* of the busiest CPU where the stopper is
> scheduled?
> 
> As soon as we do detach_one_task() within the rq_lock, the load is
> reflected correctly. There is no need to wait until we attach task to
> a remote target_rq. TASK_ON_RQ_MIGRATING will immediately detach its
> PELT signal from busiest.
> 
> That last statement seems to be inaccurate.

The load on the source CPU is indeed updated after detach_one_task, but the
load on the destination CPU is not.

Suppose that while sched_balance_rq() is being executed on CPU A, an active
balance triggered with the source being CPU B and the destination being CPU A.

Meanwhile, CPU C might also be executing sched_balance_rq() and changing the
destination CPU to CPU A (referring to the code related to

env.dst_rq =_rq(env.new_dst_cpu);). 

If the active_balance flag is cleared to 0 before attach_one_task(), then CPU C
may trigger a duplicate active balance from source CPU B to destination CPU A.
If I'm not mistaken, I may need to add this explanation to the commit log.


> As soon as we enable IRQs, a timer for a remote tick may go off which
> may want to push the task from this CPU again but it sees
> ->active_balance still set.
> 
> At the very least, I think this should be done before IRQs are enabled
> but I'm not convinced by the justification for this in the commit
> message.
> 
> > +	busiest_rq->active_balance = 0;
> >  
> >  	return 0;
> >  }

I understand. Indeed, the action of clearing the active_balance flag after
enabling interrupts is completely unnecessary; it should be placed before
enabling interrupts.

--
Xin Zhao

