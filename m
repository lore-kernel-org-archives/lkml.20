Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896E848CD41
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808917; cv=none; b=X984kWjbDe2lUGRj+GPJUK7r4/UIdTOP+7R5JaActSjH8vgRoNXMpz+kdvwHdK/lWvU0oQLsDdDFoCq6LR5lMkYS744UvlknMP3xaMm+YA055j+NeeK+50TLVWVj4oEXU4zFYPsiPdPs0YNdaofkR2qd+XAVAiQ/yqfO6jOFNrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808917; c=relaxed/simple;
	bh=fTbE9jEKzwFilVsT1wBMbrJGGOMy63D3FXQUrSYtsOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXqJjJzWXbrPGXmKSKuIlRCehzmnyklpXs8A5IGJBrYAefDZ7Ecvi222An3Ou+qtOC/HV03t9fI3dVchAhglmX41SiHE44M6g8oMAwTTJQcdwU3wNukzm35ix9OSDqIu0asIo2X/uSlE34Gobxe3193YNt5keI42nYcgOSNZMxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O5PWUpTI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=j8VZI+pX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O5PWUpTI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="j8VZI+pX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791808914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q0FDVH7bS9jUSQCplEP5poIwYU+n+m1RgShCpvyE0D0=;
	b=O5PWUpTID2R73iOz3GYmlzrFNf9TKor7m70So7CVPdLgIhEhf0W6x+dmIBJehFnwcLYZZo
	EOJgzDTodNqZxoax7DTyCURo2mWBjzCUfbEHQwiowkBlVr4q0oJLoSQmXvBg8U5+7fyBT5
	/x5JtU319iBVm+Tdd+z84uQTYaIh/gE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-VVAj6UL4PMKHP2Q7CV2x-w-1; Mon, 12 Oct 2026 12:41:53 +0000
X-MC-Unique: VVAj6UL4PMKHP2Q7CV2x-w-1
X-Mimecast-MFC-AGG-ID: VVAj6UL4PMKHP2Q7CV2x-w_1791808912
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a16fefb7acso14645215e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791808912; x=1792413712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q0FDVH7bS9jUSQCplEP5poIwYU+n+m1RgShCpvyE0D0=;
        b=j8VZI+pXWH9yXelVuYaCn8t6ipBqyFSs56sSb6AmDzFlQ2/Gpi1k+uLYoZq4LALMsK
         emkqUSNVGU1ky5XnBDTuoJ79X+dJ2np6TK9wC66wxzQPDQx1b7OPA9HoA2yJzRb7jtmI
         eceC8UULeUnGs9ejgmB2tV9spJe6VK8yJ0+1YIGdi6MQfUgMOkuR5IDV6epH7RhYwSG5
         LHxCqcBBo5Qju8qS64DgD7S+bX7NmtfgCg9FCGzSgURqbkQ15CRsc/ILkdOsqdd7Cknx
         jMVYmpIwI+eNHzDrq2qgE5PNZHD/8mWwB/nRO1X7XEo3CVv+r+OUhJT+vOTIoP7mqcND
         9T3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808912; x=1792413712;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0FDVH7bS9jUSQCplEP5poIwYU+n+m1RgShCpvyE0D0=;
        b=cUV1DYGszNAerTMsRWkGXeghZblCdqQBtFhWw9w73OasUnn1B2tUngJmtKYgY+jniT
         TyHjYtgrMN29xZal1QSbV8T0HhIjDWVRCEFqS6UpeWlWwI/yURTh5qkmlR1a1BmCYq4A
         Mks8z97uVHQ5ymbcq2lz2LiI2THxUpug7WhTn41qlufsBHh6wl5oBpePvqo08gxI6ZkK
         WF86Aqyv9EEWvqIParu73lpYjru/UTAIiuF4+Q41dhSPDU7MzGb5gilH/KU4RKwgVi0C
         7pXNJeh7HT8a3upXYmnagcDnjABh/BXgCNWBVxXlZ7Mc3l8JNHGs5QEjsg13L0DNqIFK
         jAVw==
X-Forwarded-Encrypted: i=1; AKwUvBz64MKRm0p+tHQfnaehcT34dBrxv/OwM1r6gO0N988C03lEL5H0eVsvHV5NeakYEHRYFwrIr67J8GtGmrM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmKQPD31lsHgVW+e+F0v+CLPvCGqTFh9TKdAz2SRyGd3Gzk9Lk
	XzzOw2l+to/JeRih2dCwd/kQPwn8UqtTFDv8WFjUMuIkhBpScPKLO6fwLmvaDaNje6+JCvVwYRG
	bxnYgWOjPlQcozb6RDKsawYx1vM5TI4i2b9UaG9MIr2yF5AxXWUVT6PZScgFLRErQCA==
X-Gm-Gg: AYBFou0Jm0xYROrek3x5s6dU4F7ifOgY1neKKJeeNFAt4eJwHP+UAclyEO/Iuyy6o8Y
	K6fUATpR34SPepIr8lHXhF+4DfcpBeFtJjaSL8HpE7/7vdE21txOL9IbLGjjHyc2cfhkrU0u0Sh
	wyHqbfCjUS1/VyHVsWdCGc/HM6KcMinlu5Dh4MYn7OGEPU2Sh4rceyJpjuzXZrFI5BAVRkHxtRk
	kG6TEiF4Cf+WS0DplnPDccWcF4E9UTLlvEcmsMcgL0PmH/cQJEueqRARKolJuIatmtLrHZMiNMA
	8EY/TriXOll7uIzKTXfRfOWYp+Qn6J0X4CKhXMYZVYFD6EFrosn9hk1bfeTz4cFV7BmXEKqq9r9
	GSRV0qpSb4bEN68cxjOiw0qUeDSIx
X-Received: by 2002:a05:600c:3554:b0:49e:6778:c2bd with SMTP id 5b1f17b1804b1-4a18e4a01a1mr185138825e9.6.1791808911993;
        Mon, 12 Oct 2026 05:41:51 -0700 (PDT)
X-Received: by 2002:a05:600c:3554:b0:49e:6778:c2bd with SMTP id 5b1f17b1804b1-4a18e4a01a1mr185138475e9.6.1791808911641;
        Mon, 12 Oct 2026 05:41:51 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.14.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm118181005e9.2.2026.10.12.05.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:41:50 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:41:45 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>
Cc: mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	arighi@nvidia.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, dhaufe@simplextrading.com,
	create0818@163.com, frn1furkan10@gmail.com
Subject: Re: [RFC PATCH] sched/deadline: keep nohz_full tickless while the
 fair server is deferred
Message-ID: <aszViUxPLBuH0h7L@jlelli-thinkpadt14gen4.remote.csb>
References: <araOR8aTAU_R5lwQ@jlelli-thinkpadt14gen4.remote.csb>
 <20261005132038.353661-1-ionut.nechita@windriver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005132038.353661-1-ionut.nechita@windriver.com>

Hello,

On 05/10/26 16:20, Ionut Nechita (Wind River) wrote:
> From: Ionut Nechita <ionut.nechita@windriver.com>
> 
> On a nohz_full core, arming the fair (dl-)server when an RT task coexists
> with runnable CFS tasks is needed so CFS still gets its reserved
> bandwidth (default 50ms/1s). Doing that from sched_can_stop_tick() by
> returning false, however, keeps the tick running for the whole time the
> CFS task waits, not just while the server runs.
> 
> The deferred server spends most of its period in the zero-laxity wait
> state: throttled, off the dl_rq, waiting for dl_timer. That wait is
> driven by an hrtimer and needs no tick. Measured on an isolated
> nohz_full core with a SCHED_RR hog and a CFS task visiting the core
> about once per second, the tick never stopped again: 200
> irq_vectors:local_timer_entry per second, with tick_stop reporting
> dependency=SCHED, against ~19/s with the fair server disabled
> (fair_server/cpuX/runtime=0).
> 
> Split the two concerns:
> 
>   - sched_can_stop_tick() arms rq->fair_server when RT and CFS coexist
>     and a runtime is configured, but does not force the tick for a
>     merely deferred server. A non-deferred dl_server_start() enqueues
>     the server immediately, which is rechecked right after and does
>     keep the tick.
> 
>   - inc_dl_tasks()/dec_dl_tasks() call sched_update_tick_dependency()
>     for dl_server entities. Servers skip add_nr_running()/
>     sub_nr_running(), so until now nothing re-evaluated the tick when
>     dl_timer enqueued the server or when it was throttled again. The
>     tick is now started when the server is enqueued, so its runtime is
>     enforced from the tick, and dropped again once it leaves the dl_rq.
> 
> The server is deliberately never stopped from sched_can_stop_tick().
> dl_server_start()/dl_server_stop() carry the running_bw bandwidth
> accounting of rq->dl.running_bw through the "active contending" /
> "active non contending" state machine, with an inactive_timer in
> between. Stopping the server from a path that runs on every enqueue and
> dequeue cycles that state machine at a rate it is not meant for: a stop
> that finds the inactive timer still armed subtracts running_bw that the
> matching start did not add back, which underflows running_bw and trips
> WARN_ON_ONCE() in __sub_running_bw() and WARN_ON() in
> task_non_contending(). Teardown is left to the existing lazy path in
> __pick_task_dl(), which stops the server when it has no fair task to
> pick. The cost is that a tickless core keeps taking the server's defer
> and inactive timers, which is a few interrupts per period, not a tick.
> 
> All of this is confined to nohz_full CPUs: sched_update_tick_dependency()
> returns early for housekeeping CPUs, so sched_can_stop_tick() (and with
> it the new arming) only runs where the tick can be stopped.
> 
> Based on the upstream proposal "sched/deadline: Make dl-server nohz full
> aware" by Juri Lelli, adapted to this tree, which has the fair server but
> not the SCX ext_server.
> 
> Ref (upstream proposal, v2):
> https://lore.kernel.org/lkml/20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com/
> 
> Fixes: 557a6bfc662c ("sched/fair: Add trivial fair server")
> Signed-off-by: Ionut Nechita <ionut.nechita@windriver.com>
> ---
> RFC notes:
> 
> This is the tickless variant I described earlier in the v2 thread, now as
> a proper patch. It is against this tree (fair server, no SCX ext_server);
> the ext_server handling still needs to be added for an upstream v3.

Your approach seems promising. Would you be able to send it out as a v3
(including SCX support) based on tip/sched/core? It would be easier to
review and test.

Thanks!
Juri

