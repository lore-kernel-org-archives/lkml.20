Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001951;
	b=vVfXTsQIGDY07N1TDyeZDmu0M9cptNtmy/Yo0h5QdGmhUvcni1heRGkSLi13rt+sthFb
	 PIcO2PrTuz2AlPpeCTv+pGaD2K+QM8jAf5xJuHQ0hPO/osCKlILz54gq1CjhQNia9HK5O
	 TWZ8bLAP13nWdJl4lncI80Q6HzFv0U2yPhwypM3Wge9ZCOzF6q1MO4afrNGJMB6wO6hr8
	 ASlf1dY2YoMyfTv+K6wLmJyPeqJ45FwQPo7qdODLPzFS1Il4QIoHiU9kKC5Cg00r/3lgL
	 XoqusSbDYcIg1bSQ+gOD6896m3AXBP/VIudQKE9fTg8Lj5UtzxFjT+I4eyDe6ganIzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001951;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=D242ShT8h8RdqZ5L8WmZvCimBf9zTP6sn6+Cdrpwgt0=;
	b=TEGCHIHSbFA4efcVAYo6sZTefxyh3ihsndxMuMaRFokbRffaN+IRJv598Y35JRXznVaD
	 N5IfaKt3N/FW38TLjLbX9qLWKY/qHj/niT5aQMXB2B3xbkYQN1MUOhUv/7MIW4RKZnvCc
	 u/Xb6E0zJxDMomBZhIe3UBte224SS8TdJ8YG/JK9Xf7uVEGrJp/gYBfrI7A5C+NeiYy2N
	 nKa52otkA4Bhl+W+vnQP7LtJmhuM1QnOAN3Muw1H61wb1qF2Wim/iw2x3EwInfHnpiB3s
	 pac63b3mMcSBnb+1Wmz3RqpsHHhTiNn38tbCMwxtnXzpXyG861NlTznpHYmXQmO4ENw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jAiYLg0s;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pZn0c9x1;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9097606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9097606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jAiYLg0s;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pZn0c9x1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793001948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D242ShT8h8RdqZ5L8WmZvCimBf9zTP6sn6+Cdrpwgt0=;
	b=jAiYLg0s61TgnZB74CwjHsvZIqpZg795AXoa1YW8fAj0RZXqF+kAm66h1GQ2mOx/Nm82oP
	xMuMW4DmS9kyykpTyoNc9axfPzMQNJ5ndZgSts1MRzZ2d4FXcesiUKaBckw7PTGflcrl7I
	9kXDhkwnXRy876yLNgZuMxE9OAPMqYo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-trl-VoS8OiudxQjAMI-06w-1; Mon, 26 Oct 2026 04:05:47 -0400
X-MC-Unique: trl-VoS8OiudxQjAMI-06w-1
X-Mimecast-MFC-AGG-ID: trl-VoS8OiudxQjAMI-06w_1793001946
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso16069335e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793001946; x=1793606746; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D242ShT8h8RdqZ5L8WmZvCimBf9zTP6sn6+Cdrpwgt0=;
        b=pZn0c9x19i2Jzn6WpHDEv0w6vcP24mrCUqX9G42FaZKw5gDo0b4v39pFtLiJc4Wj6/
         eZPEDQGqyDX0JyhVROS9mUT9Qp1Y3uF4HVZMNqJVQZ1e2KOrCdXszX70uALz0fiS45dj
         lfUiSxWltXlNPLLKG5W/nPvzAOk9S/pi0DnoAAb2ddZuCRGBucr5ub9Q1BZ7atbrjTEv
         rpEikrtesRUQE69BDE0oESQxbHehoI4eFCWS3M8zdx95ypbYZtQxnKG05dpPotoUct4O
         m6gJh+od3OljhD74IEm4gyOxP3OUBTVMv85bqQ/X9jqJFr4AoOtHEQpIz1zlkzTVMskp
         UHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793001946; x=1793606746;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D242ShT8h8RdqZ5L8WmZvCimBf9zTP6sn6+Cdrpwgt0=;
        b=HP1b3b4sCuKhumcmZ6MLbwkeyDY5H2kSJXSqBvHXpDgBkBF5G5buqM8drWve4FpWY5
         SZEcasKcrZyl7jrYz9y8KpA+2Z5hnJw8FDpZ5Ow9jjRURQS2ogbiTDCeIfJnO5Zys/Z4
         i7I8PkqoTMJqSC1PTg97f+8DvfAW2xXfNi5kNaoY70CAvhNO6f9w3dP+G1o7rhOuuSML
         5/+CDjUgxp2VJd286DoQMgMfGQtbq/IM52DCbyzc+34iytxU+4bYhML61lDmyRIydyrX
         0fc0/DaTylZqQukB6TdW5ui9z5F95f05ZAxP73Ew6E4mJG3UnimVogTKhtMaYRkXEE/F
         HXxA==
X-Forwarded-Encrypted: i=1; AKwUvBw80dCbkiTuIXC0jFxe9DvIoIGIGbHvVB11QMDiapOPsY11S7rMCr3Ty5/xfn4DOqAEHkndO7snQMzb844=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFAVObRt+vEvQVU0vvRVfYk2DGXyzeW+tSHXvM0NRVHJFJ1jjQ
	3bXuVVOMMr7K9VuvFnfUgtm1ieeMoUdRIyQ0kmGv7fQjalfLblDwosyxs9fqS9rS0o6m+NVAi6p
	XXvWYz1/+coylUBUpR1Vh11dpmrCeveWCCk3QscqsyYyKYlfoG2EGK865I2ayqMgGnw==
X-Gm-Gg: AYBFou0FzGmJl+zTmokkYd0IspxpIqoSbXdVZgK0C7FDgEcgedDzRWxfA+60jzFD1fh
	+q0zPGdcjHfoWkOf1qTqV6MBUnDVgIQCc3xzFUH4j4JtWjF/ywHRUsVYxlJoPBByS/sojeTdWD/
	OzA5EDVy8viTsqlMubN6+doqU6MRHlZbXyGAXWPYUGD/y1vg+PUa/tXL0CqB8zpXpFIGhD8Asxt
	VnVbPaSDbaaOQBNYL+AFW0qoaUiyhITUJqFP/lPrqpZEzYAo8wz0TiwCXtJSHy6n9br7IdCalwj
	toyxNKOeCAbxQNAIW8ho3iJ8Wpaim6KLbSbjIL5ZbhMDL7TbISjFFfxwRNIgToFr0pxz/6wjQ54
	WPQaTNq4iWhANePZTcZDNm3UFngr+ml8=
X-Received: by 2002:a05:600c:190b:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4a50d0b6418mr72057965e9.33.1793001945638;
        Mon, 26 Oct 2026 01:05:45 -0700 (PDT)
X-Received: by 2002:a05:600c:190b:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4a50d0b6418mr72057595e9.33.1793001945189;
        Mon, 26 Oct 2026 01:05:45 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.35.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm14911211f8f.17.2026.10.26.01.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:05:44 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:05:42 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-rt-devel@lists.linux.dev, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	John Ogness <john.ogness@linutronix.de>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [RFC] RT throttling, DL/ fair server, RT_GROUP_SCHED and
 everything
Message-ID: <at8J1mimeQ2oPZDE@jlelli-thinkpadt14gen4.remote.csb>
References: <20261023161348.t3lpPLQZ@linutronix.de>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261023161348.t3lpPLQZ@linutronix.de>

Hi Sebastian,

On 23/10/26 18:13, Sebastian Andrzej Siewior wrote:
> Hi,
> 
> this is about the old RT throttling mechanism, the DL/fair server around
> the RT tasks, the /proc/sys/kernel/sched_rt_* mechanism to control the
> former and CONFIG_RT_GROUP_SCHED which never worked as it supposed to.
> The current status looks like a mess and I'm not sure if there is a bug
> somewhere leading to my headaches or if this is just not meant to be
> working together. If so out with it.
> 
> tl;dr /proc/…/sched_rt_*, sched_rt_runtime_exceeded() probably
> CONFIG_RT_GROUP_SCHED should be removed. A bit of docs should be added
> for the fair server (or the right place).

Thanks for putting this recap together!

> Now. Details.

...

> Without enabled RT_GROUP_SCHED the files can be set. Are they useful?
> According to Documentation/scheduler/sched-deadline.rst it used for
> "admission control" whatever that means. Anyway the fair server still
> kicks if it is disabled. So I *think* this is just something else and
> not part for the docs there.

Right, confusing, but for a root_domain comprising M CPUs, -deadline tasks can
be created while the sum of their bandwidths stays below

  M * (sched_rt_runtime_us / sched_rt_period_us)

and writing -1 disables the check altogether. That's the "admission control"
the docs hand-wave about, and it's also why the knobs can't simply be deleted.
As you noticed already, the servers are completely independent of these knobs:
writing -1 does not disable the fair server, it only lifts the DL admission
cap. In principle we could move this to a different interface that reads closer
to the underlying purpose, but I'm not sure how much breakage it could cause.

...

> Anyway. Could this interface be moved to /sys/kernel/sched/fair_server
> away from the debugfs part? debugfs is not for stable kernels/ ABI. Is
> there a reason why this might be considered debugging and not final or
> restricted from productive?

I think this was raised already in the past, but at the time maybe it
was still to early to say if dl-servers will stick around. They now have
got more users (sched-ext), so it might be a time we discuss a stable
(non-debug) interface for it. Your suggestion doesn't look bad to me.

> Just to summarize:
> - Remove /proc/sys/kernel/sched_rt_*
>   [ ] Yes [ ] No, because
>               _____________________

Yes and no :). We need an interface to tweak admission control, but we
could find a better/different one.

> - Remove CONFIG_RT_GROUP_SCHED
>   [ ] Yes [ ] No, because
>               _____________________

Luca already commented on this. I believe the plan is still to come up
with a DEADLINE backed RT_GROUP_SCHED for Cgroups v2. If cleaner, an
approach could be to first merge the removal of RT_GROUP_SCHED and then
reimplement the whole lot as Yuri and Luca are proposing to do. The
series is already somewhat doing that, but it could be made more
explicit/clean I guess.

> - An additional trace sched event for fair server preemption
>   [ ] Yes   [ ] No, it is silly to have

With 820725b0eb59f ("sched: Add deadline tracepoints") we already have
some of that: sched_dl_{throttle,replenish,update,server_start,server_stop},
which fire for fair/ext servers too (there's a type field, DL_SERVER_FAIR
and friends). They of course require something like this [1] to be
activated. We could add more if they are still not enough to get a clear
picture about what's going on.

> - Fair server documentation needs to go to
>   [ ] It is fine where it is
>   [ ] To ____________________

Not fine where it is: the servers (fair & ext) work independently of
RT_GROUP_SCHED and deserve their own description (defaults 50ms/1s per
CPU, what they guarantee for fair tasks under RT pressure, how to tune
or disable them). Either a new section in sched-deadline.rst (they are
DL servers after all) or a small standalone file works for me.

Thanks!
Juri

1 - https://github.com/jlelli/sched_tp/commits/deadline-tp/
    from Qais' https://github.com/qais-yousef/sched_tp

