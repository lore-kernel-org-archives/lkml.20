Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321D249D59C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671103; cv=none; b=KFfWZM+blt2YVEjJtTeQEfF8A4r7/87cShuUHSPod66Gn4ZJ2sMLVqLcRPEnhL0UFe5KhfylLrX1eCZPrTeWMkigjbaKdOqxjUDCaopRuKZwQkgbm+dWNXPlJEY51QeybquzcfUEOCjj0hCAwhQTQYuFobpEQ2zd4k6QSzP8I0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671103; c=relaxed/simple;
	bh=uqWbq0nqaLy93Pw6xZwpgHqJRBhzckULPQwdrsllZVI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B6oNMQFvnbo6a8oj5rJi3FzkjCYxZJ0VYryMYw+jwX9jxuxQq50ABo9UWHAKIAnLamgwrOS6ABNEuOoABX5BbF2iXcxQJS29WkqiVZg5s4391st5JznMn1jezefpB494sce2hJumfh+dLj/OrryY/GFOUpPqKM/mBhLJGwh7Ops=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=gwNrQxZQ; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="gwNrQxZQ"
Received: from omf10.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 5F3A4A0489;
	Thu, 17 Sep 2026 18:51:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 36DA244;
	Thu, 17 Sep 2026 18:51:27 +0000 (UTC)
Date: Thu, 17 Sep 2026 14:51:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: John Stultz <jstultz@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Suleiman Souhlal
 <suleiman@google.com>, linux-kernel@vger.kernel.org, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
 <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, zhidao su
 <soolaugust@gmail.com>, Qais Yousef <qyousef@google.com>,
 ssouhlal@freebsd.org
Subject: Re: [RFC PATCH 00/12] FUTEX_PING: A stealable futex using Proxy
 Execution.
Message-ID: <20260917145124.43eb2102@fedora>
In-Reply-To: <CANDhNCp0fufkpOSRQz15YQNDKkR=1-CC9QAsXujikz-DY05EoQ@mail.gmail.com>
References: <20260917043339.2093426-1-suleiman@google.com>
	<20260917085805.GD2009045@noisy.programming.kicks-ass.net>
	<CANDhNCp0fufkpOSRQz15YQNDKkR=1-CC9QAsXujikz-DY05EoQ@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: xtkkonnbx1p7mqtfqo75te4z4qa8wsgn
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 36DA244
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+rg1uD50AGkQg+A346olxPkgz5FFo8XBA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=MuVBJCGS9f34k/HrKJK2M5jpwqtnl5bg9zwk3zZvQqI=; b=gwNrQxZQbcoYk4oQTmNZ+A/QZuEDU5WakIllZUyW7uRPOjNb322jTdIpGlpFN0D9P3KfdjG+acju5LATdgYlfAkHIk/qbk8UwamShZMyst9aIUjm37F/xDg/H+6JrYsipEmmu+wLvHC+rJhrMLiATWns0hG+WZRAvZK8NxLXtug=
X-HE-Tag: 1789671087-276141
X-HE-Meta: U2FsdGVkX198RpKX6QTaiol6eIwgRCrj+QjORHZfQH1thyR3FF0/B8umYb7nZJFEVGDQu0geaJ92aXfg+z2Oh3QMc6PVcDCWT2iRxY0nYhYGRLEwdt7kV2wDGUKsk55yZpcrMU1ULRjyUmzehi7hgZ14D+qBwTv7GQrgYYEfUKoP5dpIFPbzr/icRKlALFTixsidPlTSEKPY+6zoQNeraIcFOFULoXZQx4bOGQdUPuOD/lGG+BPALF2I5JvlwdjwYIyTcSboDDR3z1F33Hzk998m5rj8SbAY1+vyKjaM6dmxnK1r9+YiPUykMQv9nzCAqyUg4uY/oOw/LTbzJL7Yvfq3+7ubpSpI0ER+v8w96osrpKtbHk5fRYkmVdLV9BMq

On Thu, 17 Sep 2026 10:53:47 -0700
John Stultz <jstultz@google.com> wrote:

> Indeed, moving rt_mutexes to proxy is a goal.  Though the performance
> concerns from FUTEX_*_PI have to do with the semantics it (and
> rt_mutex) promises: strict RT prio order handoff - esentially FIFO for
> SCHED_NORMAL.  Not so much the mechanism it uses for boosting.

I started working on this while still at Google on the
ChromeOS/Android-on-chrome team. The biggest issue we found with
FUTEX_PI was that it forced all users of it to be fair. Even
SCHED_OTHER which did not even benefit from the PI code. The result, it
killed performance, and nobody wanted to use it.

What I recommended was to have a new futex to allow SCHED_OTHER tasks
to be unfair (just like rt_mutex is in PREEMPT_RT), and also to allow
more to be done in user space and not require every contention to go
into the kernel.

We had a test (Suleiman, can you share that test) which emulated the
code in Chrome and by switching to FUTEX_PI the performance dropped by
a large percentage (I don't recall the actual numbers but I posted them
internally at Google). By switching SCHED_OTHER to be non fair (that
is, when the lock was released, if the next waiting task was
SCHED_OTHER, and the new SCHED_OTHER task coming in could steal the
lock), and the performance almost went back to what normal FUTEX had (I
was assuming that going into the kernel on all contention was the cause
of not getting closer to normal FUTEX). That alone was a big
improvement over FUTEX_PI.

There was talk about changing FUTEX_PI to allow SCHED_OTHER to be
unfair and to steal, but that would change the semantics of it and
there may be some application that requires FUTEX_PI to be fair for all
tasks, even SCHED_OTHER. This is when we decided that we need a new
FUTEX_PI (new generation, which I coined FUTEX_PING, but kinda of a
joke so feel free to change), so that we could change the semantics
without breaking backward compatibility of applications requiring the
current behavior of FUTEX_PI.

But FUTEX_PI requires all contention to be handled in the kernel, where
as we can get even more performance if we could change it to allow the
SCHED_OTHER case (which can steal the lock) to be handled in user space.

I haven't looked at Suleiman's code yet (I'm currently traveling and
don't have time until after Oct 10th). But I would expect this new
futex to keep RT tasks being fair. Otherwise no RT task will use it.

In summary, the motivation of this patch was that we had a few RT tasks
suffering from priority inversion from hundreds of SCHED_OTHER tasks
over a shared mutex. The problem was, if we switched it to FUTEX_PI,
the few RT tasks would perform correctly, but the slowdown from the
hundreds of SCHED_OTHER tasks made it a show stopper. The goal was to
have a futex that allowed nice PI with RT tasks, but still allowed
SCHED_OTHER being unfair and stealing from each other.

-- Steve

