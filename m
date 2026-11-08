Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794129263;
	b=UEtAkr6x0Spch3OvPtOXtt1iNzgKs/cWXhGSU34TMusBkmv0tyogN3Le+yq9qUkQPFZQ
	 oNZVVAbwbs3J4U0314fcPqKSJMBtczPOCqDrXm59ff4E+nFvk8N2N7FCvRo/+BtL2ShKA
	 9LD6n4DrlcI5Dva4Rmv56Zc7N/IfscoKJ60wEee+fKCTiLjenQ+NVpk6cNP3TXnb2aXtp
	 9cTQcNWpoCHLyf0EFwtwBNHIIPlbHYSNvhyraansIQnd5U9sg/OpIE7Ox2d4jvYJOVTeP
	 xsIa37iDkBjFw9OGjA7jFwpTHSL8a22I4jA0jVLQ2QWHw7USjIpWGE37UjgJkySkGJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794129263;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=IgFGlLI9XrfXd9NEiuo4qQJWxm/PrXGBBLH3JpgpHmo=;
	b=TeQ9KcrQKlxpULCoIT9DWOwyZ9f/hQBrsunTBBMnFI0PHBtRQ34brZe4L26vbuTlHLIZ
	 gzJd26FR/KPJNh7vmIoT62z7gSQ70EB14t+wWSoJh9QitNBMJXgv9C6m+JRV6XgABQBNK
	 Qxf82073AXIUcLPQnAxHUuKIkBVuQZsb27Uu2CLTPTjXW0IBKXWhgSSWWzneGn46HKYpR
	 jxYTZY4WHHEPQFwgUwvs3ywBsIYxS2pRF0hHA23Icvcrk5pjATGNUtvRuGYqJZR/DJjXn
	 liJRlqsUV04yA3hW+p17o+fOJ8cu4r9i3Eauu7MJ7t5b36fMPuGVSj8r2evOHM/nUqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6gGrwvm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134FD606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6gGrwvm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98AD1F0089F;
	Sun,  8 Nov 2026 09:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794129262;
	bh=IgFGlLI9XrfXd9NEiuo4qQJWxm/PrXGBBLH3JpgpHmo=;
	h=Date:From:To:Cc:Subject;
	b=S6gGrwvm6szvdelO0tQpIm1NWp70aIbtN/BrzejkXo3VurSUF94OMbuGV+jQRdUj/
	 kC7sXk5FsEFCmY1F1v0nthBv/F1mpSTGqUmzEUJtdwJaN1XK7ZPJCN2RzMcXF3TSvX
	 D2twtsma/fcXFmAt5K0ZQIo0U9hKpjYUMeyjQwkYyYuhNwd2OKy4qYRSa6ZvFkkHou
	 ePXe0YhtRK322l9o31pTxLPh94yjSfQxDW5u5HPRYBidIp5dTAHElBOCA5JR1+i9ts
	 kojAShwxAUQbPdJsfDZXEkyJzAcrD0BcWXQQkx2B50vhMsz7th9Tmfw8HzZgo9gbYq
	 kJE5OOxKUrY0Q==
Date: Sun, 8 Nov 2026 10:14:16 +0100
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
Message-ID: <avA9aDPBDzVlUqcF@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-11-08

for you to fetch changes up to 006991aa89974378ee579416dba87adc22cd60fd:

Scheduler fixes:

 - Fix this_bw on class change of a dying SCHED_DEADLINE task
   (Nickolai Zeldovich)

 - Account I/O waits independently of delayed dequeue
   (Christian Loehle)

 - Clear throttle state when leaving the fair class (Daehyeon Ko)

 - Fix u32 truncation of the PELT period count (Hui Su)

 - Fix imbalanced cluster static-key updates that can mistakenly
   disable cluster-aware scheduling (Hui Su)

 - Fix active load balancing logic to ignore non-fair current
   in alb_break_llc() (Kayra Cizmeci)

 Thanks,

	Ingo

------------------>
Christian Loehle (1):
      sched/core: Account I/O waits independently of delayed dequeue

Daehyeon Ko (1):
      sched/fair: Clear throttle state when leaving the fair class

Hui Su (2):
      sched/pelt: Fix u32 truncation of the PELT period count
      sched/topology: Balance cluster static-key updates

Kayra Cizmeci (1):
      sched/cache: Ignore non-fair current in alb_break_llc()

Nickolai Zeldovich (1):
      sched/deadline: Fix this_bw on class change of a dying task


 include/linux/sched.h   |  2 ++
 kernel/sched/core.c     | 33 ++++++++++++++++++++-------------
 kernel/sched/deadline.c |  2 +-
 kernel/sched/fair.c     | 13 ++++++++++---
 kernel/sched/pelt.c     |  2 +-
 kernel/sched/sched.h    |  5 -----
 kernel/sched/topology.c | 16 ++++++++++++++--
 7 files changed, 48 insertions(+), 25 deletions(-)
