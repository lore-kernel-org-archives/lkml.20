Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179361;
	b=4zf+jkPLWNoAej/nMD046sV05i5LPi8xxQT23qY2WC+rZJIRI0itqhOIczkmUWunsel+
	 /W5/MyCxX/NcNclMdVZeR0mePyQ1syTPh0F3sDYdoQC00vlFwkyVNQ31ehWMHdyf4uYrk
	 gLAnRDynhr566wLqTgkM2mQNAVaBMVOHnaQsxjQKRNeoln+Ss3N3eDIGhYhuSC4239KmQ
	 1f5/U0Zz9ut+RPXxvVyYts55yxcFvy6nvymV4cfRbGdRrmRynelV+2lzUxd0PI4iteHdj
	 xSpsgWB9zqAaKIMdBgXI7CYvtQ67wYypzbS+8J9VHVmcKc5QG3wUQ7KQgb4NEIS4EMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179361;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=19+eeBNUAmZsCt2+Qrg/7Sbo4WI/mza3DkIk/V28yOY=;
	b=qHbzqVQiqIq8EYfahza5LLnasPmY++cZtwxKvCoIsqJ/jjL7Kjw61YG6nJKap2xu6aF3
	 vFnzX0N3ZCzkPf/HXpD9j3jaW3PP02cU4cigdoiJB7w+EycTMps6hpEKPzGXsZizKtSut
	 oCw0V6TJ+M34EXB7RDNqFVL4KhLytAbWcDQyEYpCLtjVNyU5cy9RpD/OE3KX0xqobMoS7
	 uWKI7Y5TIQBqDR0TFwq68DJ+Oj0lFWTJLzgCb4SoovNuD+1zz5CT8FFlJMzslVQsC91D2
	 72+GzPbJFQrV6eCD1hzB0s5JrVT1kEOM7fx128k8mO9xGqQTPbmucKKo7p2Gl7VcLHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lIylgfas;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABD3606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ABD3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lIylgfas
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=19+eeBNUAmZsCt2+Qrg/7Sbo4WI/mza3DkIk/V28yOY=; b=lIylgfasTg8t/IItuyhwBrv/fB
	/4sNk03XSfF6USkHcPx8bZKwXJIeumxCTcGs+TXJzqxC50h70ysZYcuO9ofVhC/LUQc+BjG35niuQ
	qDqPF+on48KHV7Subkl4fNh4Tu66m38083S+mgE+RSbC8KE4xE7qtqo0ryIeVH80EuvIghn1Ap/cH
	Au9lESXy22yGwQ6bxQYMzyMDL6MNhdH2ikYhhmVfmiIohHlHZR5zuTm9eZIka8TNal6GN8XmVGSHu
	BX/0poDpfjaOGf0Hu01qwF6AIbbJaqMM/d06MxY70QEqNK+npiKrJ5BW5MhICivuKzWq50+7aqvg6
	vSTUIBFg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzrX-00000002SNf-4BwT;
	Wed, 28 Oct 2026 09:22:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 89D9730120E; Wed, 28 Oct 2026 10:22:27 +0100 (CET)
Date: Wed, 28 Oct 2026 10:22:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>, albin_yang@163.com,
	albinwyang@tencent.com, bsegall@google.com, chen.yu@linux.dev,
	dietmar.eggemann@arm.com, juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com,
	rostedt@goodmis.org, vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated
 blocked donors
Message-ID: <20261028092227.GH2668804@noisy.programming.kicks-ass.net>
References: <72a6eb77-0461-477b-a0e9-c06a486e3e0e@amd.com>
 <20261026133831.4111227-1-albin_yang@163.com>
 <36f12b2f-9fc8-46e9-8312-536c918722f1@amd.com>
 <auA7AQ_S9iwPHr4d@scheduler.schedules>
 <4ac4564e-08fb-4639-a89e-a2ad54cee3f7@amd.com>
 <auBEeDRRFKZOGlZA@scheduler.schedules>
 <f23a6e77-58ef-46bc-b8bf-d9f043bcfa57@amd.com>
 <20261027120945.GN2668564@noisy.programming.kicks-ass.net>
 <auCU65gKjdeUOoLl@scheduler.schedules>
 <0d9bce4b-0d50-46df-b865-76511b2670f6@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d9bce4b-0d50-46df-b865-76511b2670f6@amd.com>

On Wed, Oct 28, 2026 at 09:10:00AM +0530, K Prateek Nayak wrote:
> On 10/27/2026 5:43 PM, Kayra Cizmeci wrote:
> >>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> >>> index 04b62c16fa8c..d5758b78b741 100644
> >>> --- a/kernel/sched/core.c
> >>> +++ b/kernel/sched/core.c
> >>> @@ -3956,6 +3956,8 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
> >>>  		 * it should preempt the task that is current now.
> >>>  		 */
> >>>  		wakeup_preempt(rq, p, wake_flags | WF_TTWU_RQ);
> >>> +		/* Start accounting wait time. */
> >>> +		sched_info_enqueue(rq, p);
> >>>  	}
> >>>  	ttwu_do_wakeup(p);
> >>>  	return 1;
> >>
> >> So the normal wakeup path goes through enqueue_task() which gets the
> >> sched_info_enqueue() callback there. But yes, ttwu_runnable() does not
> >> go through that, and needs this additional call.
> >>
> >> There is one more site in ttwu() that also doesn't go through
> >> enqueue_task() and that is the p==current thing at the top.
> > 
> > The counter already measures how much time a task waits for CPU,
> > curr is already is at the CPU so we don't need a call from there.
> > 
> > Or not?
> 
> Yup! on_cpu / task_current() gets dealt at sched_info_switch()
> which will enqueue the signal if the task is preempted.

Can we record this in a comment; so that the people who come after us
(most likely our older selves) aren't left wondering ;-)
