Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793516872;
	b=he0xyynj15+afDkh4R8aytowmmIIjh59FmH0vqyYVyaMOUmUDD9ged7EITnWpuWsVPpU
	 MJJZl3MITlfazu2gK7zaw2O3giY/m51EmsRNeh49oAJJcxhF5jwmw6ERAMLFjgoS1R0gk
	 6Z5amf2p1OhqH6cfCdmyqg+Nhxs1WVBynX3lN9hAb12CwCx9tS3u52cPREf0c5Xb4Kqqi
	 cS9GNhcp04DNPuTLXVIFQNPiRw1+nyon6CmR/1cdJiP1rJcJoRl/cKx/0fKqpavs+XOyb
	 WM1oUdm5YdFmcFAPvhFyVfPxCU3UkMi9aIzgQ1TNux9fQraG4aU48A/MW5d57F8lGQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793516872;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=AT8gcl6fMCEUtNq2tHaXBeodJpdeUB0r97Dq8y85SxE=;
	b=uFFv7sTSFyAr0/Ohwq8189gwgmNv1U9WU2KBovdDxOfoRHljfoQ37ODhqlOpGxwodlzQ
	 a6jry2QSq9w+78GXqUdB+b9ZWXd3qblWQ1rDUMCC4XUzyMLUHv8AAt1YZkpM+l3gJ8dig
	 lFgFaOclzJMhNq46m/SGeJHRJfD3qHudrMuIdU4WDpQW8WJ8AkyWBHXXRKmtuQqownCPU
	 5NVjtAcHHHMY1vmNm/QbhUYfWaDeZt1T/kZ55+EBWkPGgLhCkhozoL53xo5i/WRSUhy/E
	 M6zx3KrEqt4eEgipRArF1XlbsFepLkK00x4Os8BNvYrIFCm1nXt2vSHtMT9Hno+phyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SavHoC6g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0314606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SavHoC6g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4751F000C1;
	Sun,  1 Nov 2026 07:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793516871;
	bh=AT8gcl6fMCEUtNq2tHaXBeodJpdeUB0r97Dq8y85SxE=;
	h=Date:From:To:Cc:Subject;
	b=SavHoC6gHlsThH6jOUm/vqruthTYlLPJFHbp+ySqQwQdVaFQTbNYDoBBSBBi6uCl6
	 dBKUxHHKMq703VWbacPRU/jsGBLMknoiAdM4QqRvbhemp+4a36E5qBtsQkYpyCagJR
	 HUFRUZ/ZiaN6UTPVpkdqeTg0Pfe6v2xqa3DGP62KPoKe0pYdYYhALxaMS09iDu1OYg
	 nWgEXdow8/REtg3b6ZWZNxFlm73897JRDFhjf3JzoTJ18jalQeiSYI+D1DUxIYYb2+
	 PHLSpP0Z+PjaeB23XuUY/2k6Fv9ixyxXFACMoqgfJQfena87kSeJvw9pCuT7NTPqyU
	 b5/dhStYs/Nkw==
Date: Sun, 1 Nov 2026 08:07:46 +0100
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
Subject: [GIT PULL] scheduler fix
Message-ID: <aublQi32yfcCKZ98@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-11-01

for you to fetch changes up to b327e63683a2b894b500027375342c25222b58ef:

Scheduler fix:

 - Fix a false positive cputime related warning in kcpustat_dyntick_stop()
   that can trigger sporadically after a clocksource switch (Stian Halseth)

 Thanks,

	Ingo

------------------>
Stian Halseth (1):
      sched/cputime: Don't warn when the tick period starts after idle exit


 kernel/sched/cputime.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
