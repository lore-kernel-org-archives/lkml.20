Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9C8274B46
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789287573; cv=none; b=NeAqUBgYAja5v9XnLoAS+uVo4QQyOTM3ErQ4+V7K9EBTCbPYAOU4kFGcU3tbfvygH3Q9gE/D6Z6Z+6MBF5KRoTCp+8DGSMbPQK4GSKE72mLyP94hs11q/1aupggNtpy5+SvwaGtTW9W1u/AhX/I7DSPjlBJKuTeSNaln+//iYr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789287573; c=relaxed/simple;
	bh=dNRCNVJ3jYAHHTSTMvOMF6HvjysfTi3UaXpVf6UTE8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L+E91KAP712MVALyWAhck32I4rMA4/uYbbWInbNmagVSyH+pqtWqgz/RLGnFIcHpSACE11OsZVf1+CMRSl8+AXV1Vmjg4NTAr+0s5HRFQEiFLxecE/0ntqU2AvWcN1sLGmhrhfkhhuGUx/eo9rdI71628oLtaER/ROQiBU58UuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKjL+HXT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKjL+HXT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F2B1F000FF;
	Sun, 13 Sep 2026 08:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789287572;
	bh=XdiqcpqHjrWJEd2zWLvDqAaRf9b3B5cZRSc2psk2H0s=;
	h=Date:From:To:Cc:Subject;
	b=dKjL+HXTV999QUmV6lr8tB4nVP0UzNU77IUZhldHgHCoShVuv59NBC1M36KPFDHFw
	 Ecs5PtjrZowxrldfgHxP3alDJ9oz4nFxiUgznj+AtJUebjfJMz79qK4UXUMLgcAEgi
	 c9LdXAIg4Kk8XNYu0UOD8th2ftLzIJ0UaZGDOlD4hBvdlqwWjcKKW3NyG22XlE2Q4X
	 GERCrAsQUC0oFAkuxAMwzWFxTRWczezGC6y9i8eGUk65iIXglMSTkoOe5W8Z+sfYHi
	 ntNRBRQkQf9IK57KHThtIhZbG9hvAwGU2F8EM4DTCVLwdWvn258N5LGay+O2ZH6NQY
	 J7rWCPdLSoeCg==
Date: Sun, 13 Sep 2026 10:19:26 +0200
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
Message-ID: <aqZcjrj6NEVj6Vgq@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-09-13

for you to fetch changes up to f5741d2b34519d387edf6e9798fc7030c20a35f3:

Miscellaneous scheduler fixes:

 - Fix EEVDF se->max_slice value on enqueueing (Vincent Guittot)

 - Fix EEVDF augmented rb-trees re-balancing with
   multiple fields (Vincent Guittot)

 - In proxy scheduling, account cgroup CPU time to the execution
   context, not the scheduling context (Hui Su)

 - Likewise, call wq_worker_tick() for the execution context,
   not the scheduling context (Hui Su)

 Thanks,

	Ingo

------------------>
Hui Su (2):
      sched: Account cgroup CPU time to the execution context
      sched/core: Call wq_worker_tick() for the execution context

Vincent Guittot (2):
      sched/eevdf: Fix augmented max_slice
      sched/eevdf: Fix rb augmented with multi fields


 include/linux/rbtree_augmented.h | 35 ++++++++++++++++++++++++++++-------
 kernel/sched/core.c              |  9 +++++----
 kernel/sched/fair.c              | 18 +++++++++++++-----
 3 files changed, 46 insertions(+), 16 deletions(-)
