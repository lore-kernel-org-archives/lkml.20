Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416225;
	b=3y1Cb2ZKTaZpad+MtltjuiC5kSFL4mH2IG5KE2H6nzjrZcFvN1BG182JnvIYrWFEcDeP
	 YeGhXvJWY1eCzRamv5uTRsQXpLMgpF1FQi4bpR+m3E7oSc535dB/d/qmzSQcu93USb3Zx
	 qm5iFpkLf1rhw6MoBpUVgaYR7qWM6ZXmloXv19U4xYESgKGPtESuTpAkO7FbDkk14WBVD
	 6ob543Zxag0gNm3dDLD4qEOhjLEyr7x3TkfJZq4rpgIjdgliPJmVIoJdU8SmeNwccz2q4
	 CjS6GwAS4U8NfxlkgZMFk1HedhzWOODeH3r5Y/dEH4wsxC8Dfz8UzujItDcSzeIl9oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416225;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=DRnG07+MML/nLLq4qs6X9lcjbdBka9Mq9PjPAM29EKc=;
	b=j6vTQjT83K87Yo/N2SBSRBROmtnkDFGiiAoYUWoL+s0HYvaQe/YWq3+0olRs3V/zatBP
	 UqdI3mq3x2+C8JN5PNmElWCi2VUyqc8cWkhUwxxmDcBg1DNUqd2Kk8N7V1zbdADQND9YX
	 Mh4l2qQNWYQAxY8Js/bnSD+lG6uz/EW5NDYvM1UWaloxccV9gr6eafoWhxTJL/cdCZppV
	 7wDspShF93aEnOHoVGMkEKXlLIYEivw1g/ejKVtEodGn2RWyll4cZAnVKySYKSwG8toBN
	 SSGmyi/Hiw0UNA+S0fjjByXHerEGaUX64RNxGaTpS9Kn7x7hQAexo5m5trnNEMl6a2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ul6SI24x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F623606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ul6SI24x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF171F00A05;
	Wed, 11 Nov 2026 16:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794416225;
	bh=DRnG07+MML/nLLq4qs6X9lcjbdBka9Mq9PjPAM29EKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ul6SI24xHE+TN0inGqrA4Rlo72M65ovH61mPY8Ofi3QiY/l8Ny8QJkiBhpoG8ltve
	 FtpjoDE5o1sETrXdxS7vBUa34+HM/yiDsHIr+zxAX6cTq1XPNmKPMfQlxEu5uiwfkq
	 e2kqCwE5Svx/SXFPFHEHMbYXTsstwXVUN3MTeIuezpYLmaZdH173sFwQMGp7l6TvBX
	 fzsJBXfzeli4Wf4+ZtHEM+MCP3uS94B16jf5KQ9tjb3SORco7DPD2JL4hI/NbXAZfd
	 ZGCvJoCsujbEsDnc59L7wxX8FRGjsARStbHCM++6jv2RSQxEdy3+tNCa98aT++xlZu
	 VOjvenfchOziA==
Date: Wed, 11 Nov 2026 17:57:02 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 2/4] sched/idle: Don't handle polling idle as dynticks
 idle
Message-ID: <avSeXluNMl_XGPEw@localhost.localdomain>
References: <20261111114406.346953-1-marco.crivellari@suse.com>
 <20261111114406.346953-3-marco.crivellari@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111114406.346953-3-marco.crivellari@suse.com>

Le Wed, Nov 11, 2026 at 12:43:48PM +0100, Marco Crivellari a écrit :
> TS_FLAG_INIDLE tells nohz whether the tick is managed by the idle loop or
> on IRQ exit. With idle=poll it is set while polling, but cpu_idle_poll()
> doesn't run the idle loop again on interrupts: a nohz_full kick or the
> expiry of a stopped tick isn't re-evaluated until something sets
> TIF_NEED_RESCHED. The tick is therefore restarted before polling, and on
> nohz_full CPUs it then keeps running after the wake-up and interrupts
> userspace.
> 
> Enter dynticks idle only on the cpuidle path, from cpuidle_idle_call(),
> and leave it before cpu_idle_poll(). While polling, the tick is then
> managed on IRQ exit as for a running task: on nohz_full CPUs it stays
> stopped if possible, and nothing is left to do on wake-up, so the task
> doesn't pay for a tick stop after waking up. On other CPUs, leaving
> dynticks idle restarts the tick as before.
> 
> tick_nohz_idle_enter() may now be called on each idle loop iteration and
> always runs with interrupts disabled; tick_nohz_idle_exit() may be called
> outside dynticks idle and with interrupts disabled.
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> Cc: Paul E. McKenney <paulmck@kernel.org>
> Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Link: https://lore.kernel.org/all/aQiWfnnSzxsnwa2o@tpad/
> Suggested-by: Frederic Weisbecker <frederic@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
