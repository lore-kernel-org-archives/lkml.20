Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4973CC9E9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496291; cv=none; b=ahSrYKHBV8ARFsTyW1XyEDyf7ei0o8pySByaFC7svdwVexwmx1p5iJgNQWjOyYqVPnaOMCbjJH8Ict5Y6dinHxwfdB4laZsOqEnexW4O7vW9ty5DAkOaqZJCnU5yV6yLnbZWfnTl6Uh6m71E0iVr1IMsLbjcOJFY0SaFor+ijhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496291; c=relaxed/simple;
	bh=ygwbijgsZVoeEHgZUYhuQdoyXdHjl4/w8UsrqyyOhKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OPKHrs9/zsHNSryG2flsFeouCVlhV6Fb4564oGSHMg7fWpR9r7oBgsAlkjYd7yahJbUWGoIxzAvvtgroV42MSs28SKBqzfuXlpQGqE9sI6bCLUkHQD4AdX2pjTJTK/poQjd7uPH3IBKl61KcINXsmpNSNXiMN5E7u3EWgy80Ct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2aqNBcr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2aqNBcr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545451F000FF;
	Sun, 27 Sep 2026 08:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790496290;
	bh=b4eMTjCfJ1PIfqlLGJOi0pYHkTbDgiFQK7ZHuOPTfF8=;
	h=Date:From:To:Cc:Subject;
	b=K2aqNBcrZLX47j9rQr6AZoyNFSFedP9rffRzlccXIr7FTwZdXNx+3c9NMQiyoeWnD
	 AP9LqUyh/OhzMg922g35QbwQSwoufZSnBqED4B1fOO4WXQXUtoIC2veyRuTs0H7VCN
	 RIay6XISjWb62f9ZXSZIeTKtotqe+b/ZQjnv+jH1g4y7eri4ot9nfgpiiFroqWbLHJ
	 ulLmAlog0/jqJNpbu31Xwv2ZwLVnah7wICSmleeazg67M/Q6+bo9i9HibTxfrB3iQL
	 5HR0rMAAd7NeP1yrygNE75+NwUuI2W6vR7+f1a7/zCMEJ5aED9+52osSKl739+5egs
	 earhpvFctxBEw==
Date: Sun, 27 Sep 2026 10:04:44 +0200
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
Message-ID: <arjOHApB_TyTUsCY@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-09-27

for you to fetch changes up to a0bb6fac53fa7cf1cadb487b43d4c9276a6b82e3:

Scheduler fixes:

 - Fix LLC mis-scheduling bugs (Tim Chen, Lu Wang)

 - Fix cache-grouping related scheduling statistics UAF bugs (Tim Chen)

 - Skip kernel threads for cache aware scheduling to rubustify the code
   (Chen Yu)

 - Refresh LLC capacity across CPU hotplug, to fix capacity
   underestimation bug (Davi Chaves Azevedo)

 - Account PSI IRQ time to the execution context, not the scheduling
   context, to fix proxy scheduling accounting bug (Zhan Xusheng)

 Thanks,

	Ingo

------------------>
Chen Yu (1):
      sched/cache: Skip kernel threads for cache aware scheduling to rubustify the code

Davi Chaves Azevedo (1):
      sched/cache: Refresh LLC capacity across CPU hotplug, to fix capacity underestimation bug

Lu Wang (1):
      sched/cache: Honor migrate_llc_task semantics in active load balance, to fix LLC mis-scheduling bug

Tim Chen (3):
      sched/cache: Keep nr_pref_llc_running in the runnable domain, to fix LLC mis-scheduling bug
      sched/cache: Decouple sched_cache_group from mm to fix UAF
      sched/cache: Introduce task_struct->sched_cache_grp to fix UAF

Zhan Xusheng (1):
      sched/core: Account PSI IRQ time to the execution context, not the scheduling context


 drivers/base/cacheinfo.c       |  11 +-
 fs/exec.c                      |   1 +
 include/linux/mm_types.h       |  15 +-
 include/linux/sched.h          |  20 +-
 include/linux/sched/topology.h |   4 +-
 kernel/exit.c                  |  28 +--
 kernel/fork.c                  |   2 +
 kernel/sched/core.c            |   2 +-
 kernel/sched/fair.c            | 417 +++++++++++++++++++++++++++++++++--------
 kernel/sched/topology.c        |  22 ++-
 10 files changed, 388 insertions(+), 134 deletions(-)
