Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB533D6479
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792315545; cv=none; b=d6uyKOh9O9YcZKnX/ILDLCw2nITd/0sXIAkPHdJr+bW8pUpvOoJeWTD+E/kEy6oXDouxaNuIeiKgeTy8L1AvlwdvcmmfZdR6IJld/DsCTKDLSZgJOXAXGW+GyCY9pWO8i9z5PjtmjGMM7k3q88EVqNEYvh/1TXlb2eUKINR8R9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792315545; c=relaxed/simple;
	bh=EkugPDF3iWbc+c2YJJp5sg8upF3bCm8GtC6GNNEvUUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sqxkor7qgII7Kcju/c16IGypLcWnjJYeHOP5MILK+xR4j6FHjsc0d1LpVBAXeekYbcPZkfSd6E3TiBPmJlY+Y/uDENQGNYgesUM9xv7b8ykOBVy9xPEOdnBCvEUE8q8s9ngx8Q0go2XRL3OGHB7C+EZaWA+F2dXdvzlxyzgGXYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YisyiO/h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YisyiO/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFB91F000C4;
	Sun, 18 Oct 2026 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792315544;
	bh=UPR3ozeK0PC84aP01r1UIYcgJhbxN0Dm3wqKOoKPgj0=;
	h=Date:From:To:Cc:Subject;
	b=YisyiO/hpAsP0N7FrXudJUjYR6GlZeMxQLE52u9zgLwY7p+NpvBGOqutN0m1cUEoq
	 aejhEHDTX/KWdZG+oti3v8jQV3QdjQm+TkcunUyAWQxEN9SuUVBjFFpWMZPBVeddLZ
	 w1Rwxu4+chqEoqn8LThHJHzyIM6WOJ0d9qXsL2v3zrUyxFhqdIY4Z6oV10P1ED2F8E
	 j5oIJXqsHdANPPWwLwxdxj+f9Yt7tof/vzowZwOs/zNhmhP60uj2ZOaDSszs1Cvx7M
	 UBvbyMnuQ8VWJvWJ5Em+HvEEift5W5FBlRWsJjGh8sIDz2vZR0yI9qnq8+T9Ag3sXi
	 jXGPyhlgwyY7A==
Date: Sun, 18 Oct 2026 11:25:38 +0200
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
Message-ID: <atSQkrxwvS17naGH@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-10-18

for you to fetch changes up to 2f93bcb3f9aaf6ceee1aec0a97d4fe386d48e781:

Scheduler fixes:

 - Fix __sched_setscheduler() class change race causing
   lost reschedules, exposed by recent RCU changes (K Prateek Nayak)

 - Fix s64 multiplication overflow in place_entity()'s vlag
   scaling code that can corrupt an entity's placement (Hui Su)

 Thanks,

	Ingo

------------------>
Hui Su (1):
      sched/fair: Avoid overflow in place_entity()

K Prateek Nayak (1):
      sched/core: Call wakeup_preempt() for queued tasks during class change


 kernel/sched/core.c | 19 +++++++++----------
 kernel/sched/fair.c | 16 ++++++++++++----
 2 files changed, 21 insertions(+), 14 deletions(-)
