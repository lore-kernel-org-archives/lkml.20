Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744618;
	b=wPecwRJmhtTKIPBKkbSYP9CLOjsf3HoDOjtyDzCwv3VX/2f2wPeFSnhFwmGeW9QqsLyC
	 JtdkdZMyWkhrPpLRneQUM8LphS4pctf+Lfe33SoyX0aeNmxv3I0vUehWi7Pa/BTK6/DHC
	 TmZPZcPOKC4U3RIdM/KnUamtSamdGixG6NkqM9KEEMppEZ8c0NmluxHq4dIoONoT8jd+P
	 VXapAc49wvfY9QH4cTwBkooBX6RZnT1jdpyI6NVGjwIv80alEvCtof8O7/FWJ5OlURngO
	 e7W6eMltGxN4wWs+g4KOkQ0M0GUi4LYJM07i9ZpYGWKf23BoYyJZ2F7OKmBHelvPRxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744618;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=7i4iLvAe3hzEp563252AJs+OVpuLwe3aLkaA48q7KA0=;
	b=fBHpuhs6qfw8EZTxmQpoZgazBUIx/fuRcSolqSkS2fwsmkWwwWZrygOT6GSu6BmfFzSK
	 vmma4vl/Z5dys/Vvl9JfWHlOI4AOLM99InSWvNiw6O6NkaB6DC6uqKzuhnxCKRCUnSXzZ
	 56KK5LYeH5lbCLDVAnt1Gq4nBzZFxRVXiGcofrJ/d46cianmwZB3AGZGtzBbzYwg/wh06
	 A4uDJ3GP4XRdqAbTRlBeu5hpRCjvcTwnJhUktuI8BGoEWtcWlaygLI1AxtxV0bkBX5Eqy
	 X8fmZKkK5bWkd04F4gaz7WQSEAhXkR01qalSk9xq36hiVyN8OrEdtEz8bEqM+z9gHCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d3ZKZRW6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C340E606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d3ZKZRW6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0651F000C4;
	Sun, 15 Nov 2026 12:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794744618;
	bh=7i4iLvAe3hzEp563252AJs+OVpuLwe3aLkaA48q7KA0=;
	h=Date:From:To:Cc:Subject;
	b=d3ZKZRW6kejTA2bQaso/xwaIu+3u3AaAgexwVlznWInU48TND8YWBcSYlZ1cOVrAN
	 rJ0JDuCc6xdwKwV5xATnUoU0iAbYAsOCRMeZo3Fe9/czs61aHVJTiX5K7CQvtVPxE6
	 t24hh7DfmrShnK5+eqTvmUA1BhhNZ6a+2effSVx7lhYHJM8BfLrHud7ZzmDjEYr/OG
	 moKdGSJ7cx+gvyjlsbBhCArpSAp6SwJR589VyZMiaAmRdBHe3gEdYUqxekGy1ogCu2
	 rbKZGnTBhf6i1e+oyDtyR6cDL7+lpTpl5xpKkPmQ4cDJlYGluYuR86RKyovYNm+2/q
	 2NcePK4KBcL8g==
Date: Sun, 15 Nov 2026 13:10:14 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [GIT PULL] perf events fixes
Message-ID: <avmhJk_EjYcCvAZF@gmail.com>
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

Linus,

Please pull the latest perf/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-11-15

for you to fetch changes up to 59f1398140869432c7171b9a2a279ca315467c4e:

Perf events fixes:

 - Avoid AMD uncore context migration from non-owners (Sandipan Das)

 - Clear stop state in perf_trace_add(), to fix self-profilers
   such as async-profiler. Also fix a similar bug in
   hw_breakpoint_add(). (Paolo Bertinetti)

 - Fix racy update of cpc->hrtimer_interval (Benjamin Segall)

 - Do not resurrect cpuctx->cgrp after last cgroup event exit,
   to fix UAF bug (Phat Dinh)

 Thanks,

	Ingo

------------------>
Benjamin Segall (1):
      perf: Fix racy update of cpc->hrtimer_interval

Paolo Bertinetti (2):
      tracing/perf: Clear stop state in perf_trace_add()
      perf/hw_breakpoint: Clear stop state in hw_breakpoint_add()

Phat Dinh (1):
      perf/core: Do not resurrect cpuctx->cgrp after last cgroup event exit

Sandipan Das (1):
      perf/x86/amd/uncore: Avoid context migration from non-owners


 arch/x86/events/amd/uncore.c    |  2 +-
 kernel/events/core.c            | 29 +++++++++++++++++------------
 kernel/events/hw_breakpoint.c   |  3 +--
 kernel/trace/trace_event_perf.c |  3 +--
 4 files changed, 20 insertions(+), 17 deletions(-)
