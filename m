Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234614;
	b=b+yTrVy3kalFa0Kcaq4YAWM/urgvwV7G8N8pI3qckPWdKpt9hrSUvk3AXUc4k8bsI9Aa
	 28yoMqemVxG5iUe5nCR1X6m/JT5LMg/FW1ELpC4+2wMRo/REYMs64j99s2cTgVkdKT249
	 wNV9KRjCfS2BZpn7l0IHqlaU0h3J/reGnXKj4MQmbmVep71zBIBuAmRQtJW7VYnNaYidh
	 Gl887kZffElAyZ6Hv/dbWSX68qQSRP7CNlGhBZOQ5DWribai7+G3FIA7UlVszxYZbdw3r
	 +eNmRhiFDMOBBdrRH/Ub22UclHGviu+eSAV9vTfSepSCmQxhDr6LvHfX6E5h7QsXpQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234614;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=I/6OXbgLV4bCZUWKV0/koAsoiTh094pqrHlSP0k4YPc=;
	b=LH8U+ltLD5xSlB5dolNt4JR4r+6hBn6z53HMpVeUaMNR+GvjvBpWtEnwz3jOWQr+Igbv
	 A/2kgj4BGkkMlGXcxh4rC9lsEdr6PVQuofPyE7ET3WgDtcmDu/qB5rTI17zzb1ane4fno
	 J5oyfs1Xp/zHD8hMZLqcMlAEAgitwAIaN45TWWKi0l+F8/9cND/W9AmVOPwFzBD1IZybC
	 hXqrivX5ULfehcvmql3eM9V64TOQe0lFrzaGUxrOWBqdl/tuF6HSDf2u9e60Ty1DD7G+a
	 LMrBooPJhu3RapUgPBAb7x+L9bYPklGty9IJ8FB0cPxR1oV2wWOn1f2kdmq76e2kHxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gjh+K8CB;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dd43KXn4;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962BD606A336
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962BD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gjh+K8CB;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dd43KXn4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794234612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I/6OXbgLV4bCZUWKV0/koAsoiTh094pqrHlSP0k4YPc=;
	b=Gjh+K8CBtHRplJUjh8Z6lW55vteLw/9Cfmmob4fXONPeuzLIzivkKJlQCRyxcgT++kYVJ0
	toYWOli8le+po3/VN0OMIXrY7S+DehqUdKu0WZ7mhX3dwwVBcFJcx/yCR4+ErXnkF5plZT
	MgtzY7PjWYbRK2R2hdvqI7t6u9aa2kA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-EpMm4xHsMRax1dj-G39kdg-1; Mon, 09 Nov 2026 09:30:11 -0500
X-MC-Unique: EpMm4xHsMRax1dj-G39kdg-1
X-Mimecast-MFC-AGG-ID: EpMm4xHsMRax1dj-G39kdg_1794234610
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so9504875e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794234610; x=1794839410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I/6OXbgLV4bCZUWKV0/koAsoiTh094pqrHlSP0k4YPc=;
        b=dd43KXn4Wy1tYHjLd9a3rPrrv+UgG2J+eWe+fLmAlxk98/M0IFu3WKA8QurADR4kCk
         AvoV2ea57h1fbdzNTEXULZ1LTeQW80Ewn5std7hx7eI7Ef2F9405Jwe47KF4JD5bc4Av
         XtNS1k0LB6gEHlqO/gSgNE95zbODfcBJrmnYUQsDM2ytbH2M1GPMHCMZQQqa66GcfZk5
         Ll8QaGrAf4wPtCHQu829NHJ0EGSRRnCwwhIXNoCg5CD8v5M4bRe/tlu0woD0dhK52s/u
         kyiL6abg5nhUEVVYVcrC9tAQWCHEgXz/99Xp0OVbUrrm/sTCxYE0/azR0dzB9EunBA9x
         pHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234610; x=1794839410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/6OXbgLV4bCZUWKV0/koAsoiTh094pqrHlSP0k4YPc=;
        b=nKjz3qEHJdlJPvY8t8NwtCCOxOcCG3CXPYGWyvcqP8Dw3Z/5JrnGCqRLozSg7HJKiS
         dXxD8JVD5QaN3NB4VN8nuFd93VTxAXUMXKlMDSzhCdETWyxWs5+TCsHx4UJlM3AnWHcP
         7Va9LxL8XCI6TCQygAOjLmgX1JN6AFCbs1VTxbbfeuJVyUOJMWuQL5zq1mrcZnYxoaJk
         fyNin+KpkmHDSLChwe0P30f/8+gf3Mvj1AAaVCpQfPPdp+BfSV0ERdALfGmu3GBO2Czy
         6n58dHeYDsLSsrYtpgWaeE/55H1ZKJ4BQSDW1pVj/BJ/qnM74jNwBkogyG8fqmZ3z9LV
         KJ0g==
X-Forwarded-Encrypted: i=1; AL+hErFTgJDdhtcz7XR+a5EjIdmNap64dFQfRdLOJMzeXl4ih4AmTmJBWCF4B0VUy029WT388wgVl6IQcTTSnlU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AMdMMysXEUyl3PdPMcqshvu7DhM/AnsCnQHDYrVasj31s6Yx+
	eeoMU7UtBAhPG5e3PPG+vSWvONkuCW/vQxeL+dj9dAk5qs9aXANssSWNhGu0uj67+klJbTuFJ6y
	BPY9lOifr2a2g532dlWQwDugEbLGWfrJmJN896FLx+cDHcrUouFvodIt3noNWcPsPnw==
X-Gm-Gg: AYBFou13/jqTw3Cy0Cyv4c9MoQ9jjhcH/HQeCSTdorw3VyK6kzLg+/2zOIUCy7bxuOD
	JcxqznxFv/YSjsbx9sAMEQORVbrbhSRk8uJhjviG6nNkZrqTHRUC2ai9/gUZ2iDWs6oJoMKHcOD
	TYOvImdiSWPyxWDfn3nPzKW/S8N3MDshqBPw+aXqtUqHhA28NZA0YUuxZgzwhttkN8+47Cf2JlK
	hcpWRSJZ+ol+kqAiqQu0wahfYzYgcKo342U/bUWSigtPlsGcn4GZouUFen5jkfi64JUJuYBhN9T
	RA6zXJAACAURNX3aCJeHgVADCUE3gtZTfCbwAvpfNL5R4/Cb3OI+30ZQ4udGN6teSzS/e0Xkwoc
	ZlBSH2qw0nQZQhpUj91aY6ng0iQAD90h5cghvXRVjkt2cEa4t6LD4hQAD4OHc5PQ=
X-Received: by 2002:a05:600c:1c09:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4b963c858d8mr92853735e9.31.1794234609915;
        Mon, 09 Nov 2026 06:30:09 -0800 (PST)
X-Received: by 2002:a05:600c:1c09:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4b963c858d8mr92852865e9.31.1794234609470;
        Mon, 09 Nov 2026 06:30:09 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm553074535e9.3.2026.11.09.06.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:30:08 -0800 (PST)
Date: Mon, 9 Nov 2026 15:30:06 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 05/29] sched/deadline: Do not divide by zero active
 CPUs of a root domain
Message-ID: <avHY7oNeuvjsLT4I@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-6-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261108185406.1549770-6-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> __dl_sub() and __dl_add() divide by their cpus argument. Most callers
> pass dl_bw_cpus(), the number of active CPUs of a root domain. That
> number can be 0, and the division then traps.
> 
> Commit daec57983670 ("sched/deadline: Reclaim bandwidth not used by dl
> tasks") added extra_bw, the bandwidth that deadline tasks can reclaim
> on a runqueue. A change of a root domain's total_bw is shared by the
> extra_bw of its active CPUs.
> 
> During hotplug, a CPU sits in the default root domain, which can then
> have no active CPU. This lasts from the rebuild in
> sched_cpu_deactivate() to the offline, and from the online to
> sched_cpu_activate(). A debugfs write to its fair server's runtime or
> period divides there. Commit 4043f5498416 ("sched/deadline: Reject
> debugfs dl_server writes for offline CPUs") refuses the write only once
> the CPU is offline. A write of the same bandwidth passes admission in
> the window. In 8-CPU VMs of v7.4-rc1, a loop of such writes oopses at
> the first offline and online:
> 
>   Oops: divide error: 0000 [#1] SMP NOPTI
>   RIP: 0010:dl_server_apply_params+0x335/0x380
>   Call Trace:
>    sched_server_write_common.isra.0+0x1c0/0x260
>    full_proxy_write+0x58/0x90
>    vfs_write+0xcb/0x550
> 
> By reading, two other paths would divide by zero:
> - inactive_task_timer(), for a task that left SCHED_DEADLINE or died,
>   if its CPU went offline.
> - sched_setattr(SCHED_DEADLINE) on a task asleep on an offline CPU,
>   with admission control off.
> 
> Fix this in two places:
> - Refuse the debugfs write while the runqueue is offline. The server's
>   bandwidth is not counted then. rq->online is set under the runqueue
>   lock when the CPU joins a root domain that counts it, after
>   cpu_active() is set.
> - With no active CPU, have __dl_sub() and __dl_add() change total_bw
>   alone. This covers the other paths.
> 
> With this patch, the reproducer survives 20 rounds with no warning.
> 
> Fixes: daec57983670 ("sched/deadline: Reclaim bandwidth not used by dl tasks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  kernel/sched/deadline.c | 11 +++++++++--
>  kernel/sched/debug.c    | 10 +++++++++-
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index dfae08625342..b614d5fc1a1a 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -189,18 +189,25 @@ void __dl_update(struct dl_bw *dl_b, s64 bw)
>  	}
>  }
>  
> +/*
> + * Spread a change of total_bw over the extra_bw of the active CPUs of the
> + * root domain. @cpus is their number. With no active CPU, as can happen
> + * during CPU hotplug, change total_bw alone.
> + */
>  static inline
>  void __dl_sub(struct dl_bw *dl_b, u64 tsk_bw, int cpus)
>  {
>  	dl_b->total_bw -= tsk_bw;
> -	__dl_update(dl_b, (s32)tsk_bw / cpus);
> +	if (cpus)
> +		__dl_update(dl_b, (s32)tsk_bw / cpus);
>  }
>  
>  static inline
>  void __dl_add(struct dl_bw *dl_b, u64 tsk_bw, int cpus)
>  {
>  	dl_b->total_bw += tsk_bw;
> -	__dl_update(dl_b, -((s32)tsk_bw / cpus));
> +	if (cpus)
> +		__dl_update(dl_b, -((s32)tsk_bw / cpus));
>  }
>  
>  static inline bool
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index e6a3b516c703..e0d6cd3bd607 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -410,7 +410,15 @@ static ssize_t sched_server_write_common(struct file *filp, const char __user *u
>  			return  -EINVAL;
>  		}
>  
> -		if (!cpu_online(cpu_of(rq)))
> +		/*
> +		 * Refuse the write while the runqueue is offline. This
> +		 * includes the windows where the CPU goes offline or comes
> +		 * online. The root domain then does not count the server's
> +		 * bandwidth, and may have no active CPU. rq->online is set
> +		 * under this lock when the CPU joins a root domain that
> +		 * counts it. cpu_active() is set before that.
> +		 */
> +		if (!rq->online)
>  			return -EBUSY;

This 2nd hunk complements and tightens 4043f54984161 ("sched/deadline:
Reject debugfs dl_server writes for offline CPUs") which has Fixes:
d741f297bcea ("sched/fair: Fair server interface"). Do we need both
fixes (if that is allowed) or maybe we need to split this change in two
(as this second part won't apply to old kernels w/o dl-servers)?

Thanks,
Juri

