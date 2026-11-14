Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794689031;
	b=jTGejn4aHtDMRP6RKYyXxLV1Qa08nGbcTBIZeVldeARF1WiS3MpZ45Jx1uOxRZ9q6UYw
	 0ILREF3zTdTp2MtFOuxJ5PtRMWo3Lkk06MzbMheIy9Fk/mpc1PibhKIHHjT3f9mtdu+I4
	 NE+w0mDSzu4qdnBPPMTgrQr+fBVLbdSbW9yHF4wPoUbqgmimnAqaJFnwQLHnH3zlrpKeX
	 r0V0ttvx2sxSfcBN/obRgY+fCNvubypaxyHapvJ6EmohU/yPGLv+FPyrGYoK5Z+1d8XJU
	 5uKIrseTAAC/vOtPjctR39jfsU68wdTjZC5PQlEZHZdiWCSs1dvsiXEF6iO16LSKRVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794689031;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ae85HXpImDgpggvMA4E9yJjliLieeGQImS4fCaV2tnk=;
	b=dX6nE6lJQcvq+XpzGxjfrqXzvG4OoSbm8sH2f++xkMfmyBgtk4k/ZmrrT/ZZh37pO0dc
	 JVVgDqIlOep02/K01yenBcV4GGfOs3SamtkW5GkQdmtIP2Ru4Uc2Uhb2535SLYMZ4KBRT
	 aiLV13OBwPYsrlSZbfC/pRJTcbbvt/EbiM4Otk40MPuzFCV6m5kGXjDnZyyuaf791agAM
	 xbYPC5fhe6OIBK9DkxCuJJAp7bJas+D+NU20uQid1dPbVMuu5OK3nwh7Y7p09BoWh614f
	 A6piTezq4rLnbSpCkg0fMC0LRw0RxRxBzJUWs5wMpRLRrIyxezKOKStgsnrAWoLOA3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CDyzTc8o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2FB606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CDyzTc8o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440A11F000C4;
	Sat, 14 Nov 2026 20:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794689030;
	bh=ae85HXpImDgpggvMA4E9yJjliLieeGQImS4fCaV2tnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CDyzTc8oEMSmK6JdZuxnl5JT8TZ+yjIiy9OArw/TVBieCVMLEc7jib/AWugXDMshs
	 dVsGmpBzVWOWtE0WqRKHhvPN+YjS03ojxP6VQ+9bc3OTMkaDFs9fZLSsLLw2NDsI/H
	 7h6N+oA7JiehEgMEeFaJozgNNKz9ienxlDqSJivDCBfm8OqVYarPGYsGKsOWyESj6s
	 jJf0qq9MTNgIgy3auQmlTvfHvSjOPMo7u2tSp3Ie/RrCYiua7x95jC6CmMC09zn6MW
	 exQC0EPogrV28vZLPFS+8DAlYAB3lxYw2izNImfICcejOhpniRfw8ax0sf9gnu5Ycz
	 gcXj76VGHJlZw==
Date: Sat, 14 Nov 2026 21:43:47 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Michal Hocko <mhocko@suse.com>, Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH v3 1/5] tick/nohz: Re-evaluate the tick on return to user
 space
Message-ID: <avjIA1bSaAmNcRcR@pavilion.home>
References: <20261112163813.524336-1-marco.crivellari@suse.com>
 <20261112163813.524336-2-marco.crivellari@suse.com>
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
In-Reply-To: <20261112163813.524336-2-marco.crivellari@suse.com>

Le Thu, Nov 12, 2026 at 05:38:09PM +0100, Marco Crivellari a écrit :
> On nohz_full CPUs the tick is re-evaluated on IRQ exit and on idle exit.
> 
> This is not enough on return to user space. If the tick is left running in
> the kernel, for example because a tick dependency was cleared
> (tick_nohz_dep_clear*() don't kick the CPU) or a timer that kept it
> running was cancelled, it fires at least once in userspace before
> tick_nohz_irq_exit() stops it.
> 
> Stop it from context tracking right before resuming userspace. When the
> tick is already stopped, the common case, this costs a few flag tests on
> each return to userspace.
> 
> Suggested-by: Frederic Weisbecker <frederic@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
