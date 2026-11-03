Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693515;
	b=hDgyixQk5g6DDSRRGKj5H0vf5Wuxtm8HElB0PIuxKyR+xKH6Ti6UR3Ix/P6fVKWjLSyL
	 Zb8YUya2DUKeHzqCUNOXvQdiCmsHGm8nZGW5e+Sc/4PGWz1SzJVK1qKaBU5Mym/0Fz2eC
	 SaFLbKRKzatCmE5ajdRRxfyQ/KdtUX7/3bZNJKdpvzrdoW2lw39Zm72G0YJhHjynSyPjw
	 Iw2mb6TXLelOggjFFR4JUIVs7gHhEFzE3b5arcvplpfVCRDkqth6YyFZkOZpq4gfyg23U
	 y8bjyt/UqEq3GbeoyqAFdbGJLK+ZELqERjH4/IGnYPzs3FX1OdgRZNtmSLTtVOF9rlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693515;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=HWHjCDaJOo5JyfbAzChFMw0H7Jj/ipterv1TFKU6BAI=;
	b=k0YshQggFzhrTLYaSJJXQMSo71G9Bi7/8Qkf3fWs75v37ROHMFNElNJkRalW6HpJL4qW
	 gBmuf0Nwl8b4sqayqX/NxqpRDYt/Fv54t5DFpDD7Ig2ohkc58/5mvwfbRQSlsZ9OKkRF5
	 13fxcfJeVu3tm52hDz1yqDyhYQbYMldb0XMVeQqg3Bf1kWLblykFo3OnYRKotvsOdFR1T
	 BLfKMQzAmvR5yC3BZY3HAFhk74EPQzxDFPokFP0lnrsx+n6nzlLeLTMtWB91yJLSG10A6
	 8PlILBsdGwgeUOu87ghT/HtVE/eqECJm5smpNXgUp4n2yPeVou+rKtK7SLpnwNVtykQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Se4uKvp5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=z93SV010;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535D5606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 535D5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Se4uKvp5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=z93SV010
Date: Tue, 3 Nov 2026 09:11:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793693511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWHjCDaJOo5JyfbAzChFMw0H7Jj/ipterv1TFKU6BAI=;
	b=Se4uKvp5dOU5iN/zYf/bE4zWagFx8rgG4Qg6eWdYLqE5NrMjD0xZpWFCbM+9dGivi2Z+t0
	zsZzXIST9Ws+gdaQ/SIFPmSFcWYjkhBZgAhgpKEm5XA+WaSkqaqgH2CBHmq10s0oXtzD6a
	o7d5RGOApsp/zUz6rvzO4hds8gAOasac2UIGUDy9Z8Hvbe6Q8niwRsW9mMMLE2Kc/YBMLL
	mtqai9frPwai282tSm3wMJ66OaUxrVKF+8bxlKDXtshx67U02KTSi1l/Gi8dfK8L/+Iyns
	rnOQXkW8LnZ/Er2sZkUqmYddns0U/YYo4ePS4+SDxaOWUmx3fL1EqqT4dLeQIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793693511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWHjCDaJOo5JyfbAzChFMw0H7Jj/ipterv1TFKU6BAI=;
	b=z93SV010ZECHpJWbxZsrQ1aF2AVMp318MTR7S8Ueyme1UCECjKOZEZiKUZMULMSJTm9Xzj
	ef7cz/bQUY87aKBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/deadline: Fix spurious -EPERM for
 migration-disabled tasks
Message-ID: <20261103081149.DuyWNhVe@linutronix.de>
References: <20261102135420.244745-1-parri.andrea@gmail.com>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261102135420.244745-1-parri.andrea@gmail.com>

On 2026-11-02 14:54:19 [+0100], Andrea Parri wrote:
> sched_setattr() can refuse to make a task SCHED_DEADLINE with -EPERM,
> even though the task's affinity covers the whole root domain. A retry
> can succeed, but the error blames an affinity the task does not have.

=E2=80=A6

> --- a/kernel/sched/syscalls.c
> +++ b/kernel/sched/syscalls.c
> @@ -628,7 +628,7 @@ int __sched_setscheduler(struct task_struct *p,
>  			 * the entire root_domain to become SCHED_DEADLINE. We
>  			 * will also fail if there's no bandwidth available.
>  			 */
> -			if (!cpumask_subset(span, p->cpus_ptr) ||
> +			if (!cpumask_subset(span, &p->cpus_mask) ||

The task's cpus_ptr must share at least one CPU of cpus_mask. But it is
not a subset if more than one CPU is involved. So the problem is that
while it is in a migrate_disable() section after it has been scheduled
out, it will see only one CPU via ->cpus_ptr while span may have two.
That makes sense.

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Looking at sched_setaffinity(), there is dl_task_check_affinity() which
makes the same check. It is skipped for !task_has_dl_policy(). This
looks time like there is a small window in sched_setscheduler() where
the affinity check passes, the task is not yet DL, and then
sched_setaffinity() makes the affinity smaller.

>  			    rq->rd->dl_bw.bw =3D=3D 0) {
>  				retval =3D -EPERM;
>  				goto unlock;

Sebastian
