Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B66A3E5585
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789897998; cv=none; b=BZ+aKLuB+HYG34No2y3HGsaFJLBjBH+506R3DNg3hdKZk3rTw5O6cbIM+s8mYTT0/4Z4gLETHIRbel30hfnLGXhde/hmv/7eOv9mUOupIk4zkZP2RTR71HmuGKTFezzbP5TFKyPjiXh+9kKqwey7H6DcwCIUx6FYMfCC+ZKCmiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789897998; c=relaxed/simple;
	bh=9ygKFcOlojdZWzoU1qKqGTa4F7yC6+fr1K6R1n1RW8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qfLfabjz+nOYZDfbItdBwTiDHH3zw/YxCMggLxtlNpJ5WiPUTt9gNKzlSqZXCxl3abBBWhxOnKtGViq2Q7zgPJMD9YwxfjiSgf0Lx1W2rSnHmivz1isLUbK8PWnyaR4FGkgFu1mJ7KeXS0PT1/rKa4Q9/Os5Hg6Tig562nvFrnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4C4GUdD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4C4GUdD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7F11F000FF;
	Sun, 20 Sep 2026 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789897997;
	bh=XiqOondV+5ya5odf51UuFZiz4HgSI65VSbDpvsQXId0=;
	h=Date:From:To:Cc:Subject;
	b=M4C4GUdDCJTAGv78m/rM0wwd2kTAs5XdcRtDq1E2CgXM3WPt+LyUYFR81gJ36tNDm
	 RKbJhzoDr7zGRfWhydzcjR+Zi53V8/IcHDmhc85cMD7Wt7u67YqYhP45VBNQaTcSdA
	 Q9szKOw7930Che3ORrpvjHK6pZQ3N0chffpGqVnuzWYKpYFIL2PjXQgQwtPIpzPjM4
	 JcV3xbgsE2/f+tHeO2kmYu0X6PMUETBI831uK1VBI4B+jdRfhVoWWGQfJY95ooORwG
	 cnp9zXrTBjVp8/StggRkCgE+FTCKEWuk6IL/58gbw2RDp2XrHca8XqrIAY8AfqOjkK
	 MX7Kq8FKI1j5g==
Date: Sun, 20 Sep 2026 11:53:12 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [GIT PULL] timer subsystem fixes
Message-ID: <aq-tCM9m07b_1kvR@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest timers/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-09-20

for you to fetch changes up to c21eaa72f02fc6e85621cbe09d303d8fb8bd39cd:

Timer race fixes:

 - Fix timer signal <-> exec() race, to prevent UAF (Thomas Gleixner)

 - Clean up POSIX CPU timers right after de_thread(), to prevent UAF
   (Hyunwoo Kim)

 - Fix POSIX CPU timers race between expiry and timer_settime(),
   to prevent UAF (Thomas Gleixner)

 Thanks,

	Ingo

------------------>
Hyunwoo Kim (1):
      exec: Cleanup POSIX timers right after de_thread()

Thomas Gleixner (2):
      signal: Prevent exec() race
      posix-cpu-timers: Prevent freeing a timer which is queued on the expiry list


 fs/exec.c                      |  29 ++++++++---
 kernel/exit.c                  |  11 ++--
 kernel/signal.c                | 115 ++++++++++++++++++++++++++++++-----------
 kernel/time/posix-cpu-timers.c |  40 +++++++-------
 4 files changed, 134 insertions(+), 61 deletions(-)
