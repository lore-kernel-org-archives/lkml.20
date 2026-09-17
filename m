Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E534CDDFE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667644; cv=pass; b=K8yrd45Jn7zGUeUUXlDsUPgzlFHTGTQd83GKtVqb9pJBcImNLDySIu9DRqGe4TGuyfDSp9mcKqilwzTLTvVyG5awPASsxIkKIcaL55TQULj9wNoag1Ar/njl726fTDSqVhOneBKjCYp8hAip1rM+I9lvTjrVRbQLJ/ktoShAguQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667644; c=relaxed/simple;
	bh=IS9D+TLpfpc2Bj2GEFKo9FFCZuN+GGyYFZtnrMjlJcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VgmIQ08ORt8tyEAP/vN3UB2FsGVZLRuWdGvhFXv3UqXAnVLdOCGyndnMqad73eUepUC7HmBNpBVe9HAzrOIcRpb+T93omdatEr6M84bvRPMUiirM880btjtUOLk3o6/U9LCM3aIj1fwi/A5zJ95ik8/ZcAmFZM5aYQoB/8pM/VE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g9q2MCzm; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g9q2MCzm"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so973090f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789667640; cv=none;
        d=google.com; s=arc-20260327;
        b=U51P+0lxlYY+TNyy+CRWMxau1615atQmvui97bTPR9nvWgP8kXJQOLWGp4K+Wowai1
         KZ2DzjdppPfRbr9RWE0pG2ZmDHGoQipxuHfLypJgzBPfr3ApSNTkSBIJgMVkB1Yr3dy1
         WZbKtIXsm8AM/miVUETCokYE8214vIX7Ti7rY4HTAqrSJ4Eq4UDIJWzy000aTSMdbMbg
         cLHErN8MgUYPN9diwd2YEMfeNUUIBjqtHMKw3EARmxbEtAFeYwh6B8vnvjY0OwmnwSGZ
         uJ+ssKWTLaBnuxhE3zT2YGnuTmU0kmWMWskS2aUXyiMOu9apCu0+Il4djKfN+gaf70cY
         7XmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NBUntA6XnetLIHSwHzywNE5ItGjByb7JgKxOppnvP5Y=;
        fh=jnCYbZtkdNAHCNfzEojzp8cxNnPTDPJDdCzFs5ZjAxQ=;
        b=LAcktDOzaZPJiB3t6gXcoUp3JFX8q47+V4btNdUkRTjnbRhY5qCn/v/hZ2nHjzu7KE
         8PNBFgKDBj8JDlVlx23n40U8WXHPSPWBphNGqsjVyXaX0/1PtifnUaMXezamx9fpv7K6
         hYsSD4cU/SeOMalnb3g+XlcGyEQ3ynR4D4NM1u4CMBy6mn/R3ygRb0JUK9EInmhDF1vW
         y2fsWHq/ctRG8dskQ6ZyB/LMkFsjJXS1uRc12RQ+fGXsu2jItiBg4acuWs9N00DUcew6
         6OgJGAZemVq09cda9WBE73s1F4oPm6o0h8Sr5IFHRRr0xvAQMUNYf3/C8d/HIKGL/7jU
         H3Dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789667640; x=1790272440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NBUntA6XnetLIHSwHzywNE5ItGjByb7JgKxOppnvP5Y=;
        b=g9q2MCzmtTNy+v8tUTqCwMthxb4PTs+omcItcRbbrOCpmT6ki77Vv3qcFyG6RAnZfV
         a600eG27/zo0BtwGWT+LjgLcJFX7WEMhP0q4qRgge2qJswSB3lblrUVte+qzhk4y41uE
         WVeiTm6Vr7rFMHbL+up+X29s6KDmTN98y9fj26CvL22XJY8HnqvFEBL3ReQfHhA/lK68
         ocpEoG2YFEpTX5GQ+FB5VXvkwc5bEcpRvazjDul2cUVDTzypF/g+IGwL1GNNUcWbyNzw
         GOZNTr/u269lrBL4OSgXrUm3Yl1rzPfH7FKIRxHxbWursNBFsP+UK/BV3LeIb44LWHrV
         d52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667640; x=1790272440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBUntA6XnetLIHSwHzywNE5ItGjByb7JgKxOppnvP5Y=;
        b=cZQHceYW+0taXH8tIaNV7sRBxDZaZAfx1gIL3AKVmco/Zkk6hl1j4dbpMPgM4Z9W2v
         evmhtBgjEEwtUyQlPFdPpn/WPxsLa95eLZVmKeToMHQ16VCFicahFNVIdlTeaE88QksF
         KvJpbQCy8vmQ/YIkh43+F8ff3JlY5gyPgVqWfEepvAq+b3I3UA5wiG60npVJNHBzBVen
         NWzcYkHRXNlLtFkT8nZA4EJvjhZRVg/7+d1LPHA8JDJa2daVPJuIrJYG6mVp7gIIGPvF
         hX7nYpDN7oPofCl8m3DgC7kpWkkfPJjYvTIq/f1NPqnu1nwm0qyRjQyrbryl9hu5b1+f
         Gi+Q==
X-Forwarded-Encrypted: i=1; AKwUvByCmqWoDlCjcnBMZQHMZ8TfnQuhjmS4SIxmb3+HKfYWRo1nB5aRXrcV6l8zgJWVPBED0SxYzLb0Bfuvn8o=@vger.kernel.org
X-Gm-Message-State: AFuF++lnRSbxFOz65IQFZIzwp46k4TzeYYDq27ivd3OmJEQf0zepGqgW
	aXomdddnk8nr+7ogpdQ3S72RwmiZ99cxXi6Fdo8Cwil4EGyCZtT35fPZ57Rfhp+Fcij96TY++fT
	QbgODvV+QNnxnTJ//oPdUuN2k29OqYRk/UoBR0ho=
X-Gm-Gg: AYBFou1TP1W1WIQe9WXAWRvSwjEqgdLBKHqqVU+OiYxIX3kOtBjhoOuUIul6kLtICZk
	a7kxGawtrMr/zLAO2i5087zdxBdsHALwd4QEqmjiydGOpA5/xQOyyrnw09kmE1gxqGPB2Ekgmi5
	ilAS1jMw5zVwY2OPZRmPokhFTT8CVHUD03MdRPGIbAcgt3HYdK2uTXVZKWE4Xe4sbnbiYOjHGLB
	jlXXtITBgttrgTOhPEVYrwItG1SJEA7sK63FTPk3+Y5LLp+noCvd1u3wobd7pKcFQ00t2D9OG0A
	QANVj0sIqKzpy5OsI/EhX3/aI6ZbE/MjLilSTiDGDs6HdD3yhwuUj+G748b8RdEzb53tQVBHMm5
	020zhNpF3nUK9ldB+DfzkalEaTNu1ZefVFdlY5FCZDZkBQEmlswGLCvmzQRFvM13NcvKHZKE9mM
	t0EfkjYg==
X-Received: by 2002:a05:6000:1842:b0:487:36a:c870 with SMTP id
 ffacd0b85a97d-4870cf0a4e0mr10752436f8f.11.1789667639766; Thu, 17 Sep 2026
 10:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com> <20260917085805.GD2009045@noisy.programming.kicks-ass.net>
In-Reply-To: <20260917085805.GD2009045@noisy.programming.kicks-ass.net>
From: John Stultz <jstultz@google.com>
Date: Thu, 17 Sep 2026 10:53:47 -0700
X-Gm-Features: AcwNN1XBQjQe6G1zj5SHDRwoIM_6B-O6h323u-InqcNGlLM137E3Por3CDeqil0
Message-ID: <CANDhNCp0fufkpOSRQz15YQNDKkR=1-CC9QAsXujikz-DY05EoQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] FUTEX_PING: A stealable futex using Proxy Execution.
To: Peter Zijlstra <peterz@infradead.org>
Cc: Suleiman Souhlal <suleiman@google.com>, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	zhidao su <soolaugust@gmail.com>, Qais Yousef <qyousef@google.com>, ssouhlal@freebsd.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 1:58=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
> On Thu, Sep 17, 2026 at 04:33:24AM +0000, Suleiman Souhlal wrote:
> >
> > This patch series adds a new type of PI futexes, PI Next Generation,
> > or PING (name coined by Steven Rostedt) (but other name suggestions
> > are welcome!), that differs from classic PI futexes in that they can
> > be stolen from the top waiter, and use Proxy Execution instead of
> > rtmutexes internally.
> >
> > The reason to allow the futexes to be stolen is that with classic PI
> > futex's strict handoff to the top waiter, new contending lockers are
> > now forced to wait in queue, which means that any locking operation
> > now becomes a scheduling event. With stealing, a contending locker has
> > the chance of taking the lock without blocking. The longer wait time
> > of blocked tasks can be mitigated by forcing the lock to be handed
> > off to them in a way that can't be stolen, when they've been stolen
> > from too much, to ensure they don't get starved.
> >
> > The use of Proxy Execution lets us also get Priority Inheritance for
> > for fair tasks, which PI futexes don't really allow.
>
> https://patch.msgid.link/1490204338-1856-1-git-send-email-longman%40redha=
t.com

Thanks for that reference! I'm sure we can learn a lot from that series.
(I do like the straightforward FUTEX_LOCK/UNLOCK over the PING name here :)

> Also, the goal is to eventually delete rt_mutex and have it be the
> normal mutex, in which case the existing FUTEX_*_PI things will
> automagically work.

Indeed, moving rt_mutexes to proxy is a goal.  Though the performance
concerns from FUTEX_*_PI have to do with the semantics it (and
rt_mutex) promises: strict RT prio order handoff - esentially FIFO for
SCHED_NORMAL.  Not so much the mechanism it uses for boosting.

That's why it seems a new FUTEX op is needed. Since we 1) need to
communicate the owner to the kernel 2) want different semantics for
lock-handoff and stealing.

Even when we get to moving rt_mutexes to proxy, it seems to me we're
likely going to have to keep the rt_mutex itself (even if the PI
boosting is proxy based) as a distinguisher, since the users likely
desire the strict semantics (or at least we will need to add some
behavior flags to the mutex struct so it can still satisfy those
semantics).

> So I'm thinking all of this is way premature.

So it is just an initial RFC, and we are looking for input.

But there is a strong appetite to solve this, as we're already seeing
vendors doing less ideal things, like passing who the waiter thinks
the owner is (racy) in via unused fields of FUTEX_WAIT, so that
out-of-tree custom scheduler boosting can (temporarily - as again it
can be wrong) try to get that owner to release the lock. The longer we
go without a usable upstream solution, the more entrenched these less
ideal solutions become.

thanks
-john
