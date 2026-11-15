Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.90
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794715159;
	b=j1F/nrxF7q6SYelFabwsYHVS2qL7bTcBFd70S+bNjfSi/80liwDr30hFNjaLliqzqsip
	 6KWewQGkjWaUn0UcBc45gl5lPW10Xgb12qh29wgkOxb6s5o0n2BwM0rZWCX9nJPw2q7fM
	 fIA8l/Icf49U4O0+j9o2rPs9n2Zzx1aK9np08UyQKQHEKtpsa9mrjny0m2LFlXv8w18XG
	 FoPep2QIzcG+KGR2AruI6ZND1eSibCtwyxH4Hr/LVhGJJvQVhZDoG8QRTi3EsZiDIhG87
	 /v0TqhZzi+yzZdc8B4yzNt4fsTZTJCbI37O9YaA/gYJBako3TGM3Zl/dZTbw13dP85g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794715159;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NuAsvnMR46sR9gI8SLtAR5XP8K/1vM6PT6/lJtess+Q=;
	b=TcZaXzeHq8aMDmhvYiYVBpEEzAlVWC7IgOljgUPvmwc2njolf+rFzEWOymYLstbImB7Q
	 UFULyd0lAvibDgo62+hvJLX6WqM69F2wHeS0oYu24kX7PzG/fSmODg7TZ66hHAgPohYd5
	 4WsPID51mmhNykfi0Au0OzuT57HLEh3QFVwyddQnz05pudjxWyTwth78mxWXC7HbQiWF3
	 MICmVWRmE26TBMtlICjeQs9R7z4KXtjK9qniERO2DbL9u/Q4/wjzVila6QGrUs+k0eStv
	 t4y1e3MRdl9RrPShS2SIb/4BUXvxsDc2vVy4w4QpHPIpbHiZm7wt+Pr81fkIzo3a3qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CCSjqSpJ;
	arc=none smtp.remote-ip=91.218.175.90
Received: from mta0.migadu.com (out-90.mta0.migadu.com [91.218.175.90])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6338606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6338606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CCSjqSpJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mQcoS9Sc2UpTDrIzI6WgudKQuxjCFSShhOz3XNpcbaU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794715155; v=1; x=1795319955;
 b=CCSjqSpJkXYD+ZZgMXqXg2CXi47zfff8c36Uqhm3hg/Kkne/Ov0IVHp3lNX4Gi3Kb5qXpHvV
 PZA8NacX1OSVelXsdpEY+JLcDuUAkf68d2kFQPnoXSyrVjR0Nq2X8EFOvNsOu1mk+c3IcooC54/
 59jOVjI4F8ImdnVSv4cIw8rE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d52f7bc876b3b586;
	Sun, 15 Nov 2026 03:59:14 +0000
X-Mizu-Trace-ID: d52f7bc876b3b586
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched/fair: Avoid re-syncing runtime_enabled on root domain changes
Date: Sat, 14 Nov 2026 22:59:06 -0500
Message-ID: <20261115035906.1185642-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e1a63a3c-3975-4b05-8ab4-518c37d867d6@amd.com>
References: <20261111-bug-sched-fair-offline-active-v1-2-4f54523c5a70@linux.dev> <20261112105624.GM2668804@noisy.programming.kicks-ass.net> <20261112125947.GZ1813469@noisy.programming.kicks-ass.net> <e1a63a3c-3975-4b05-8ab4-518c37d867d6@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 13, 2026 at 11:57:54AM +0530, K Prateek Nayak wrote:
> Question: Why do we need to do rq_offline_fair() + rq_online_fair()
> during cpuset for active CPUs since fair doesn't have any accounting
> linked to rd at all?
>
> For deadline and RT it makes sense for bandwidth accounting and
> rto_mask updates on new rd but fair, and ext shouldn't really
> care for a rd change.
>
> Would it make sense to separate the offline / online bits from
> a root domain switch? It won't speed up hotplug but it should
> speed up cpusets causing domain rebuilds.
[...]

Agreed, fair has nothing to redo when an active CPU only moves to a
new root domain.

Peter, I have a v2 that follows your earlier suggestion: rq_online()
and rq_offline() get a bool that says whether the CPU changes state,
and fair skips both walks when it doesn't. Hotplug gets faster as well,
since every hotplug rebuilds the domains and moves the other active
CPUs. With 4000 cpu cgroups on a 32-CPU VM, switching a 4-CPU cpuset
to a partition root and offlining or onlining one CPU take (median of
20 partition switches and 16 hotplug operations):

  operation         before (ms)  after (ms)  change
  partition root          19.73        1.19    -94%
  cpu offline             44.93       12.83    -71%
  cpu online              37.03       12.94    -65%

Prateek's split should give the same results and keeps the root domain
switch out of rq_online()/rq_offline(), which reads cleaner. One
difference: with it, a CPU coming up gets rq_online() from
sched_set_rq_online() after the rebuild, while today and in my v2 it
gets it from rq_attach_root() during the rebuild.

Which way would you prefer? I can post the v2 as it is, or rework it on
top of Prateek's patch.

Thanks,
Qiliang
