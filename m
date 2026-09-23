Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55D4443E5E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152708; cv=none; b=ipBDuLfUtvM2A1GTIR1HCiIfqcklFpVWzQCBmZPjo5V2YuM/m7U3qe7xp/nGMvD+JQ8HkmpsRpeq4sYxY09/SOD2KF0DkmzrTzo5CYBwgoCrOETc0ISrnqbnoSvKAhx2dRfsMdD0Mfraw67oPMO1tVmhJTweaZ6bQl0eVWAlE2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152708; c=relaxed/simple;
	bh=t9kww1Q1b5Xl+YVCI/ueMA4Bq1SFFpv3OW41Cn8RmFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgeGiCY4KkkKJYUtdbSzVBH/5S9E5QJ7OX/mcLVCRr2e33XSXroTWSdJWMfTpENJ1eZ2ESDEWTAHeWEuvgtohHS3MYAM4VB1sCO/UU4SKpJlji4a1NFDUiFk0veqpTqJC14qzGNGMt0O9ac8gv0sScdbDOLyX/26ls8Jvcjy51A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b0j3ycV3; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b0j3ycV3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Jxp+ulrxKgfR4pPBbXBaJ7a1KO3y5acxdw2tMkS+RMA=; b=b0j3ycV3OpTV+bChPY2EtyRB7c
	inT5+T5s8pDgusMPvcALWHSILMwvdbm4xoeAQLOuiHYHVNmYCJD/Fu9iz/cDz7YW1GP5z8gLR5Pi+
	qH8snq8kU6WxxTMM2+tiAh/qs8eKvmIJsqHt84ty2i3qKWKbHRihg2CKLO3iE7xSniar2owLhGziS
	czSVr89IQarK9cjGOMimCWqNJ6/Rbnqn0aYMZRWePIX5BkTAvaN9z7aN2XcdmRJpzd4axFyr66wB0
	0LP6fogsYIMqA52g8zKO5IXbrdX4dChNwCHN0A+ujqVXJ0pq4G9RFB3PKE+5TZ9WAvKFvfRCDxfwZ
	5e5Asg+g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9IUF-0000000EX9m-3RR8;
	Wed, 23 Sep 2026 08:37:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F3C3C300478; Wed, 23 Sep 2026 10:37:53 +0200 (CEST)
Date: Wed, 23 Sep 2026 10:37:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: akpm@linux-foundation.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, feng.tang@linux.alibaba.com, pmladek@suse.com,
	kprateek.nayak@amd.com, rishil1999@outlook.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/debug, sys_info: Introduce
 SYS_INFO_CPU_RUNQUEUES
Message-ID: <20260923083753.GB4121339@noisy.programming.kicks-ass.net>
References: <20260912013240.545742-1-atomlin@atomlin.com>
 <20260922144027.GT776954@noisy.programming.kicks-ass.net>
 <rqph2yaqdxyu4dmwddmdcakiacmyumjh7adxdl2a6ibjc6wwi4@55oxsrrgjuaw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rqph2yaqdxyu4dmwddmdcakiacmyumjh7adxdl2a6ibjc6wwi4@55oxsrrgjuaw>

On Tue, Sep 22, 2026 at 01:35:59PM -0400, Aaron Tomlin wrote:
> On Tue, Sep 22, 2026 at 04:40:27PM +0200, Peter Zijlstra wrote:
> > On Fri, Sep 11, 2026 at 09:32:40PM -0400, Aaron Tomlin wrote:
> > > When investigating kernel panics, inspectability of per-CPU runqueues
> > > and runnable task states is valuable for diagnosing CPU starvation
> > > priority inversion, etc.
> > > 
> > > While debugfs (/sys/kernel/debug/sched/debug) exposes runqueue metrics
> > > to userspace, these details are not captured during an automated kernel
> > > panic or crash dump. Capturing per-CPU runqueue state directly into
> > > log_buf fills this diagnostic gap for post-mortem crash analysis.
> > 
> > Uh, crash-dump preserves everything.
> 
> Hi Peter,
> 
> Yes, fair point. The intention here is to preserve this state directly
> within the kernel log buffer, particularly for scenarios where kdump is not
> configured, the vmcore was truncated or fails to complete.
> In such circumstances, dmesg, whether captured via pstore or serial, is
> frequently the sole surviving diagnostic artefact.

Ok. So not crash-dump then ;-)

> > > +		local_irq_save(flags);
> > > +		locked = raw_spin_rq_trylock(rq);
> > > +		if (locked) {
> > > +			nr_running = rq->nr_running;
> > > +			nr_switches = rq->nr_switches;
> > > +			curr = rcu_dereference(rq->curr);
> > > +			raw_spin_rq_unlock(rq);
> > > +		} else {
> > > +			nr_running = READ_ONCE(rq->nr_running);
> > > +			nr_switches = READ_ONCE(rq->nr_switches);
> > > +			curr = rcu_dereference(rq->curr);
> > > +		}
> > > +		local_irq_restore(flags);
> > 
> > This seems to want to avoid deadlocking on rq->lock, but then
> > print_rq()->print_cfs_stats() will unconditionally take rq->lock again.
> > 
> > So meh.
> 
> No, print_rq() does not call print_cfs_stats(). It is print_cpu() (i.e.
> used by debugfs and SysRq) that calls print_cfs_stats() and unconditionally
> takes rq->lock via print_cfs_rq().

Right you are. Clearly I got my wires crossed when looking through that.

> With sched_show_runqueues(), it specifically avoids print_cpu() and only
> calls print_rq(NULL, rq, cpu, false, true). Inside print_rq(), it merely
> iterates threads under rcu_read_lock() and calls print_task(), neither of
> which acquires rq->lock. Hence, rq->lock is never taken again, and the
> non-blocking guarantee of the trylock remains intact throughout the entire
> dump.

OK. So perhaps add a few comments / annotations that these paths should
stay clear of rq-lock. It is too easy for it to get added.

> > > +	if (si_mask & SYS_INFO_CPU_RUNQUEUES)
> > > +		sched_show_runqueues();
> > >  }
> > 
> > I really don't know if this is worth the trouble. I have *never* needed
> > this.
> 
> I understand. However, the requirement primarily arises in production
> support. In environments where kdump is not configured or the resulting
> vmcore is truncated, dmesg is frequently the sole surviving diagnostic
> artefact.
> 
> During an NMI-induced panic, capturing per-CPU runqueue depth in the log is
> invaluable for identifying CPU starvation, etc. As with the remainder of
> sys_info, this functionality is strictly opt-in and disabled by default,
> imposing no overhead on systems that do not require it while providing
> vital visibility where full memory dumps are unavailable.

What is the main thing holding 'you' back from enabling kdump
everywhere? AFAIU crash dump can be configured to only dump kernel data
structures, which is a lot more economical than a complete memory dump.

Mostly I just worry about death by a thousand cuts and all that. I don't
have a very strong objection to this, just wondering if we really need
it.
