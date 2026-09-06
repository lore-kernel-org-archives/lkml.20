Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4BA2F39B5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788693784; cv=none; b=rpJVBSkz7MjsowAH7zNByuX3ALA18vQwRqEbyVZLoLYEquVnmu0rwfa9NQ3JfVZoeX3l/cGbImlYvqhXyBUtPI/4kcWrmxZfB35bcakkqUy6/gNKJD3o8YcbZBBmViDYqFW35Zo2r4gQo1sPC1YLgSsTuSPwnFEl4DtRgQ9g9iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788693784; c=relaxed/simple;
	bh=Z6iiUvi/NwjFjf00MtTWGwOrrdQ9JJ0RFhfW0P0VhV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hB/OCmsYuSZblRrq9x4k0txdd7Hzdh/d8RIqR2Ct2d/+3VKSGLan1psOuCY+eSm4mS8EJNtwxi9tTdXHqDhZXNhWV95I3SBPXRF9zfWlRQ9r7SjIzxmQetnxLuhh9EesZY1Y2AuaYAhtDgaLuSJrgXXORvaXKLn32OAIVKhAK7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5UyrzHi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5UyrzHi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C301F00A3A;
	Sun,  6 Sep 2026 11:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788693783;
	bh=u2iXvKvc6CUozMI2NWOEW0XjzhtVQ3GkBSCvZvERE5E=;
	h=Date:From:To:Cc:Subject;
	b=n5UyrzHiHgGRzk6jVvTzGb7q4hqCR4sBpc6q/PPFIP53568/EqN54JJCyGohexxBO
	 GSmnQxdVWNJQMpnDi/bMuGndxQqgUVcx2ix6Vw4KZ0EHUzB3QFPEyZRVItCBJfFiNJ
	 XRmfs0nXDbg3qZf4iDzB2qb2WnDt6CCE7yYtp9R21JMMFKi2Z1sDEvovDvhEd8/yl5
	 /VRlJmCiQSuUYk02q0lkISg8xbqKbzRgPE93nMPwX90xiX2LjUmYE8qvHFh0+HfGrH
	 kXOhd5FRlhbbiWVEovOMhztgyb15juxT/5qAG9XDD1x3qBl6/sGqFUtFG1vlpiPfDI
	 rhUSeT9EwIutw==
Date: Sun, 6 Sep 2026 13:22:58 +0200
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
Message-ID: <ap1NEllrD8nMsFiB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest sched/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-09-06

for you to fetch changes up to f0d243a96f2684ad771d678767d17972cf840bd7:

Miscellaneous scheduler fixes:

 - Fix a timestamping bug in pick_task_fair() and
   yield_task_fair() (Zhan Xusheng)

 - Skip migrate-disabled tasks when picking a push
   candidate in the RT and DL schedulers (Seiji Nishikawa)

 - Skip rq->avg_idle update without a valid idle_stamp
   (Shubhang Kaushik)

 - Fix throttling bug in throttle_cfs_rq(), caused
   by the recent single-runqueue conversion (Wanwu Li)

 - Fix bandwidth calculation bug in distribute_cfs_runtime(),
   caused by the single-runqueue conversion (Wanwu Li)

 - Don't make x86 ITMT enablement depend on debugfs (Mario Limonciello)

 - Avoid creating misfits during cache-aware load-balancing
   on hybrid systems (Tim Chen)

 Thanks,

	Ingo

------------------>
Mario Limonciello (1):
      x86/itmt: Don't make ITMT enablement depend on debugfs

Seiji Nishikawa (1):
      sched/rt,dl: Skip migrate-disabled tasks when picking a push candidate

Shubhang Kaushik (Ampere) (1):
      sched/core: Skip rq->avg_idle update without a valid idle_stamp

Tim Chen (1):
      sched/fair: Avoid creating misfits during cache-aware balancing

Wanwu Li (2):
      sched/fair: Use cfs_rq->h_curr in throttle_cfs_rq()
      sched/fair: Use cfs_rq->h_curr in distribute_cfs_runtime()

Zhan Xusheng (1):
      sched/fair: Use update_curr_eevdf() for the remaining root cfs_rq callers


 arch/x86/kernel/itmt.c  |  8 ++-----
 kernel/sched/core.c     | 10 +++++++--
 kernel/sched/deadline.c |  4 ++--
 kernel/sched/fair.c     | 60 ++++++++++++++++++++++++++++++++++++++++---------
 kernel/sched/rt.c       |  4 ++--
 5 files changed, 64 insertions(+), 22 deletions(-)
