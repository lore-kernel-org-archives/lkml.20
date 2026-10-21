Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588865;
	b=2PYvSUPq8RuE9ofkYtaGRGHgxkHA6tdCaSzadj8hJ2Cc2WITxjLdEEMEeeqYjy7U9LOh
	 +TO27HuXQyk6FCkvibJ1oNEWPnde8fuGgr9iIFGu8Kvk3yZLGTi5DfMQ90K2hoinP0IE2
	 pcaq+lkZUqBJ5BVcNLFkmYeICEIU4L/WXd66W/O88mFuZx7KWKW3emj+kxX/PlaTxfT77
	 v0UMlvVLzzCtfx/mri5Js2PzXYwBYQ6PXywApEe8XMdBvjh7VTusxuWRvF7tCEbpcxTX9
	 n6vz8QZMnep0mrCgFLDG3WXeauzWiyiOLISawqw3NeKfBa78I4D6X6nPj0jZg1LAQBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xC4xAbiLg6CytUlNpO4Ei+Vweej4lzDzu5cXBQlGibQ=;
	b=O9RibsxUKFmKpi+sji1OodLQkAiRSXwZ9+AxlcQFNJBWG6WpZTtoNgYAlrWW4yPafuaC
	 M68TE3I59dVG80X/EQmTHF1wNjvX97kZpZ7qTiYeD3kR+oNm8JbOo+aDUsHjMQKBc6Pdp
	 FGIvsNWODGItwANeYhrMfQDkBs6uHriTKhYCRLEo6eBdfYycUna5oTTqToCrWfsIPYA7J
	 EDfq9MdKvZIPwHUcRV2JdmEALoFgckbcaux/RAAxMZ2e12csXXPX3ihPIL1Y6BsdwZv5N
	 qFTUcpZh0P4cOeV+xMHpBzqoQ9SJJrKblIDM0iZ+yGX5Y9dr5WsJ6CfjF15GogcDVwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20251104.gappssmtp.com header.i=@layalina-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oUciJjPB;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD19606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFD19606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20251104.gappssmtp.com header.i=@layalina-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oUciJjPB
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso3850065e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20251104.gappssmtp.com; s=20251104; t=1792588863; x=1793193663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xC4xAbiLg6CytUlNpO4Ei+Vweej4lzDzu5cXBQlGibQ=;
        b=oUciJjPB2x71YXGP8H/ZgbX7BveaedTOmzfopAunvbrYYu7upKfpYUjSW4Sokj9ti1
         5GbJ1w5McemPm7fViWxdYjFEeCjVzM3bPF5cen138kKl76wPH5RjpXXQ6VfWMvqHfd40
         P1tpjpqUSzX4jdy2L+aW4lZv3GloVQoj+JCIV0E2UrWbQqmik5ROhCnw/4wukuKmewj+
         hXFCVRugKmbC2+CCbqFJd+UhbMiAG8ggKV6S8ODMOpFStr70K9IMacjh4cjNnJ1jOydx
         sfY6MOtQZ2Jx0gnl258ySMJ8jL3E8LJ1ZQtDLi5kZfrkwXMZTwmAmohEumtWziTBHOaL
         2LCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588863; x=1793193663;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xC4xAbiLg6CytUlNpO4Ei+Vweej4lzDzu5cXBQlGibQ=;
        b=Ofk+QQkPBLcIYVOckDWHGoy56IBzkMNnJcx9XneSnWMBK5uSPVwK5kIgmOvOnFILo8
         Ls266Bo2DAoZ3Nrw0AdRAxq1Ji0AoK+KDhcPCJDYKk8Hb0BGQI1dk/Ma204kiwmo4zsq
         gF3EsS1f8YReg6tuYyg7L/fO/pifYJKxWmocoUw5mNa3YxPT90pDtBVces5FPGaeZ31W
         0/vxszLYMKy+q1TUqb2ELJr1F/BncfFrdmTwDCkNhQzUlhi9Ch74hOrBoa71kfBuKiUq
         UgJGqrBP4Yi216hIkWAoaahCoMRUgidAqjjqLyF7jvMfnz7WZYAAl/No7rpyPrbpNuxj
         YgjA==
X-Forwarded-Encrypted: i=1; AKwUvBzOrTTLlGHz3h2NWtVGzrXKeWdQWbZ4BuzWE0i9ICXjoepqo1PxYLCa5XSZfnD/lgv7fczzltEWGv1/hm0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq/vRsOtO+WntvRQhPgvWWi+Whwf3XYg1E/tW6DRlsMOPBF5JM
	ruTiQyP7GWGGlfvS5rEq++6IiS9PZ7RWnnsFEXUtiU8tpJ3+w7MI37q1wn7usSbO584=
X-Gm-Gg: AYBFou35bmdKwwv+qVzn8ue2+spy6Dan7cYV/lCTQBqEWmCiy945kinU/3fIa1pazIy
	r+87Q/x/IBhwYOxcmtK8hgdcAoJ84VvlZELoIu8zK2XnJiY1SYcA9jnsFUoqn/LTAZgkCL9bQuC
	afzObAefc94GSvYMk4nfUyC1seCpDVO1prW3X/s8aQ65qtLpAqXCfArd0rzmIFi1jZD8giwbD8R
	5wrx2hOBcEWqn17I3xvXtNwFJ5mpGpOABKQqSBzIdOrjhGMK1X+9KxDAcY1k1KbzB+NTtPzbMmr
	M6FTR7W5Dpp2HwJxcL6oRRkP1fForoafQSWsTJmzwB/PtrpuMJS0PvGFCh3x8GtCwqoT9zEYPln
	w9NWQE7gE8Zlq6zJBY4rfxWFDSlTppsxwraMO4szXWbn3MXZLdQHThv8a3fCdfNBOnjrugZOjIf
	HWto8wJBXZkCemxinbpfRZoPSYM+w4NFOPW8mKDAvyONwbv6DuyU7hclObQasFYZ191KM1m5iqd
	V6cyoGgGGX3ydJVo4BYEDKfAj/DjwsF1IAuPvCZm6VaqRsBMa0=
X-Received: by 2002:a05:600c:6094:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1fd89daa9mr42938105e9.4.1792588862605;
        Wed, 21 Oct 2026 06:21:02 -0700 (PDT)
Received: from airbuntu ([149.40.63.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm48032135e9.3.2026.10.21.06.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:21:01 -0700 (PDT)
Date: Wed, 21 Oct 2026 14:20:58 +0100
From: Qais Yousef <qyousef@layalina.io>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Qais Yousef <qyousef@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Hongyan Xia <hongyan.xia2@arm.com>, Ingo Molnar <mingo@kernel.org>,
	Wei Wang <wvw@google.com>,
	Patrick Bellasi <patrick.bellasi@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: Re: Uclamp races due to non-atomic static_branch_likely updates
Message-ID: <20261021132058.kxzyumgxzir4jzi2@airbuntu>
References: <CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com>
 <20261020152933.16989549@gandalf.local.home>
 <20261021113806.GE2823843@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261021113806.GE2823843@noisy.programming.kicks-ass.net>

On 10/21/26 13:38, Peter Zijlstra wrote:
> On Tue, Oct 20, 2026 at 03:29:33PM -0400, Steven Rostedt wrote:
> > On Tue, 20 Oct 2026 11:53:47 -0700
> > John Stultz <jstultz@google.com> wrote:
> > 
> > > Maybe should the jump_label_update() logic be using something like
> > > stop_machine? Or should there still be a conditional on key->enabled
> > > in the unlikely case to make the behavior consistent? Or is there just
> > > something about the uclamp usage that is off?
> > 
> > There's never been any guarantee that all call sites would update
> > atomically. The first user of jump labels was tracepoints and I really do
> > not want stop machine involved with them.
> > 
> > Perhaps we could add an api like static_key_enable_atomic() and
> > static_key_disable_atomic() that would go through a stop_machine() and
> > update everything that way for those locations that need an atomic view of
> > the updated jump labels.
> 
> Argh, no, we do not want people to 'accidentally' add stop_machine()
> usage, which we then have to spend tons of time on removing again.
> 
> And yeah, its always been the case that jump_labels (and static_branch)
> updates are non-atomic. Most of them are init time, and don't care.
> 
> Now, I'm sure we've ran into this particular problem before, and it
> always requires care.

My memory is hazy but I remember auditing the code that the non synchronized
enable is fine. A cpu has to see the enable and increment, and another cpu has
to dequeue without a decrement for this to be a problem IIUC - seems a pretty
tight race window and the task has to be super short running for it to be
dequeued before the static key was flipped on the remote cpu.. I wonder if this
is a symptom of something else going wrong..

Decrement without increment should be safe - we'll just bail out and we have
a comment documenting this.

> 
> Also note that a simple global boolean has the exact same problem.
> Adding runtime conditionals isn't going to fix this.

I have something in my memory that could be complete garbage that tells me all
cpus should see the new update after a grace period, did my brain invent this?

If not invented, can we do synchronize_rcu() once on any cpu seeing the code
enabled for the first time to ensure the rest of the cpus has seen the newly
enabled path?

eg (not even compile tested):

	diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
	index 7d2ec527b8a2..a6093ec88103 100644
	--- a/kernel/sched/sched.h
	+++ b/kernel/sched/sched.h
	@@ -3715,7 +3715,16 @@ unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
	  */
	 static inline bool uclamp_is_used(void)
	 {
	-       return static_branch_likely(&sched_uclamp_used);
	+       if (static_branch_likely(&sched_uclamp_used)) {
	+               static bool do_once = true;
	+               if (unlikely(do_once)) {
	+                       do_once = false;
	+                       synchronize_rcu();
	+               }
	+               return true;
	+       }
	+
	+       return false;
	 }

	 /*

The other alternative is to just accept this race can happen and do some sanity
check and reset/cleanup on going to idle - which should be pretty cheap and
straightforward.
