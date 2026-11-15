Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745068;
	b=NpzBAMSeSLhFHzro1uSVmIZTqLhEmhbiAHsz7ea0HhFtlC6yqetUKPEWj272d2WVK92S
	 ERnNv78l6dszjHCxM196B2QpOEiOclBPbxCycOdFpOgZQjEzSdMqS/DOFGt9KKCzwX6FV
	 dlKaSBq1vBJD+vfES5ZDNQED19fMgqF9xCazwK9gueAd5DXKVBQRtrQTmzuZVNhRalgRW
	 MvzGUaa0LQWVKVIiY/P4U29tvMwu8uOzJ47vFhb8ASGdzvq40TMFUFGszaA0tyLW9iH9N
	 BBkSnmI5B1R/EyWm14GeS+WO2TPlc2UiNlriVZvL9Ii5JlHEWGfp8mjvOhTrukfCemg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745068;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=5T3ruSwUweL6drExgs1r6DW6fK39cLivdPtc4idNspc=;
	b=SgD1tSk51yKaMMmsv4caBByLKXixV4p5/IoEbpH71ujhAj3J/mv2gXmp1ArDkzvxPCx5
	 Fj+32xGXxGvP043ltYVTsn435MXVYtlKMLpeG5kiwbf7DmCjBh8olOK1IBRYxIOZQO5sm
	 QF+aFOL6WKfV3HP1S0EDkEQE7aNLCVBesbuqtCOVmjJeVXOoz5wqpv6V/yA92w1o5K/QH
	 omdZFdCBlsnDWovHqRlfCBpyHerc6xPG5Q4X+/jbtFF33tOnDUfoIAWFqhKJig/aNyVh5
	 ht4PFZwBYSra0EjAPyvgJfIdKt1+Z/EWZ6z2ePQabGzf276NxdFmv+PWzEkPW+ToNvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZMxOO7n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96F5606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZMxOO7n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA8B1F000C4;
	Sun, 15 Nov 2026 12:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794745068;
	bh=5T3ruSwUweL6drExgs1r6DW6fK39cLivdPtc4idNspc=;
	h=Date:From:To:Cc:Subject;
	b=kZMxOO7nn1p+mheJzSMMGIQ7aybPXF4NbbIgU/n6ghvtxr+QeHhsUMY1HxnQmP0kZ
	 HqhZ8kTtXHA0GrJleO4KoMb0irLdjvi15e52XaC8xDltFNkBWHVAC+1RD0kkysFWiI
	 UoLw7YmrnmhAjMAwdiOmeXOYR7+sTM8c/iDj2yf29mrtLOpMCuK7B5519bZ4/yE8BL
	 2Ran1EXtE3EzHaUFumVRnGXB+p02EAvTcrgQ027qzRLieov+xBmUIPHjJI3iao6VJk
	 eyHf53UJpfaqpIWKtN1rtOPHNDNZbwiJA0ntJk5KhyV68cwqG5tvv+MwtfxWsTfjo0
	 lgUp2EKqj86TQ==
Date: Sun, 15 Nov 2026 13:17:42 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [GIT PULL] scheduler fixes
Message-ID: <avmi5linMgdLjgsD@gmail.com>
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

Please pull the latest sched/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-11-15

for you to fetch changes up to ec6f6731538e0d45872eb279fdeb477bed152d6f:

Scheduler fixes:

 - Fix spurious SYS_sched_setattr() -EPERM for migration-disabled tasks
   (Andrea Parri)

 - Reject clamp values above SCHED_CAPACITY_SCALE (Andrea Parri)

 - Fix cpuset_mutex double unlock in __sched_setscheduler()
   (Andrea Parri)

 - Don't use fits_capacity() to compare thread and CPU counts in
   invalid_llc_nr() (Zhan Xusheng)

 - Do not touch SMT siblings that have not joined the core yet
   during CPU onlining (Seiji Nishikawa)

 Thanks,

	Ingo

------------------>
Andrea Parri (3):
      sched/deadline: Fix spurious -EPERM for migration-disabled tasks
      sched/uclamp: Reject clamp values above SCHED_CAPACITY_SCALE
      sched/core: Fix cpuset_mutex double unlock in __sched_setscheduler()

Seiji Nishikawa (1):
      sched/core: Do not touch SMT siblings that have not joined the core yet

Zhan Xusheng (1):
      sched/cache: Don't use fits_capacity() to compare thread and CPU counts


 kernel/sched/core.c       |  9 +++------
 kernel/sched/core_sched.c |  3 +--
 kernel/sched/fair.c       | 10 ++++++++--
 kernel/sched/sched.h      | 19 +++++++++++++++++++
 kernel/sched/syscalls.c   | 10 ++++++----
 5 files changed, 37 insertions(+), 14 deletions(-)
