Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793516586;
	b=OZc46vT9UUiLhJHj0OOcbyhOi0sQqOlyMV+CejQwgc7Ai5AcCUW4S99fg1Y79PrCrNdy
	 Rjg54/Y3OZcYNAvKBB6UXtz1khv4UfvRvZi6UlmCsWR0JHy08Yf2beBeMYSggyXKcdP/8
	 j+i/KzMcJhsqlShF8DUx/F8bP+VbtatL9ygFsDq4NWMKGYyJL6zT8YCupcRv3wlFHb72Z
	 u0QVe+Mo+vUMbv4FwsBZEWadjpOmDRwTY/dDABf4IaWXnhppbSn4pXWsZQhZxNUrcuJAi
	 eSrru46NVsI1GLeP4Y/RRSYkxSlcdkYxhjWpKgj5kpZbU1tvdC1WjzeLOeNWVQLOQNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793516586;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=xefD5yJsZWu8UMrt9rhQoPs2hEuVqyy07IueG2TWb40=;
	b=gl9BtnQILrWnXZ4RfwyxGh9wSxeR0u4LKfKdj1XEIBRqSkDc4MbmUxfb+95mxY0l2j7n
	 V8yFpBsjjyePc3QtHx2ZhzjdiRn4/ltk1MIMt2OPBuUlgD3zkZZKjB5hHhFe6YptuuL7F
	 jC7xxHU+2L+ocLb5BBvYlPO5834ol2BwUb0ovNOQysifUggtLgfNJguPU+nI5o+EFWo9p
	 4zIkhIyVq2SiVTk6klX6FowYZdWAtvMXSSqIer37BDoqSy0RthnlUijbTxB+/hGiI2UeC
	 S+EKuBvBwr8JyhNlXg/+RY0u5w6Hu9V5e49+zPudtzG/mtdv+O3OV6m1H52Xru3tvPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aATfQ0rc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4F0606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aATfQ0rc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD611F000C1;
	Sun,  1 Nov 2026 07:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793516586;
	bh=xefD5yJsZWu8UMrt9rhQoPs2hEuVqyy07IueG2TWb40=;
	h=Date:From:To:Cc:Subject;
	b=aATfQ0rc9Iwe8G7nyaBxUQPUl/SPZPqkJre0LkdzZhg4Jod3jbUHUz98qY2fTTYMv
	 MYmGdAX4e2w1OoDRg5MSfzwP5zKnyMFwjfII8lDoPvPKJcJTpWZhXGqbPf/A7QjoIo
	 RRMmI8R9RL5u3QMD3kQ+5iOnHp3D50rOx6ps/Fk0m+yTY7TKr+9lcYWVOZRMES2byo
	 xabgGKZq4Qbi2vB01LIAG7tkkAzGCwz4zPzm9eGeiw9Z/Aucm6kQ/fox6LS/g9CDp3
	 6qncTFYFQEC9i3Ls6L1SjZlB1a/kgtqWIoqbVFFe15/HCbvKjG9B9xtzpMKYRV4kUK
	 hWLa62XdSRczw==
Date: Sun, 1 Nov 2026 08:03:00 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [GIT PULL] timer subsystem fixes
Message-ID: <aubkJIGfvTyJYAAY@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Linus,

Please pull the latest timers/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-11-01

for you to fetch changes up to f322d7f7ae56bce728ba03a387e35380bc4ad939:

Misc timer fixes:

 - Fix on-stack hrtimer cleanup in play_idle_precise(), and
   add the hrtimer_on_stack cleanup class to facilitate the fix
   (Hui Su)

 - Fix clock_getres() system call's handling of NULL output
   pointer in the !CONFIG_POSIX_TIMERS case (Hungyu Lin)

 - Fix get_cpu_itimer() to return TICK_NSEC when the sampled CPU time
   is exactly equal to the nonzero expiry (Hungyu Lin)

 - Fix do_timens_ktime_to_host() time offset subtraction underflow
   check (Hungyu Lin)

 - Report zero remaining time for disarmed SIGEV_NONE posix timers,
   and add a self-test to detect this bug in the future (Hung-Jui Lin)

 - Fix NOHZ 'full kick' handling bug that can cause missed
   tick updates (Peng Wang)

 - Fix field access bug in the vdso/gettimeofday code that works
   only by accident (Thomas Weiﬂschuh)

 - Fix & prevent immediate clocksource watchdog rerun after a delay
   (Karl Mehltretter)

 Thanks,

	Ingo

------------------>
Hui Su (2):
      hrtimer: Add cleanup class for on-stack timers
      sched/idle: Use hrtimer cleanup class in play_idle_precise()

Hung-Jui Lin (2):
      posix-timers: Report zero remaining time for disarmed SIGEV_NONE timers
      selftests: timers: Add a test for disarmed SIGEV_NONE timers

Hungyu Lin (3):
      posix-timers: Accept NULL clock_getres() output in stubs
      timers/itimer: Keep a nonzero value at CPU timer expiry
      time/namespace: Fix overflow when converting absolute deadlines

Karl Mehltretter (1):
      clocksource: Prevent immediate watchdog rerun after a delay

Peng Wang (1):
      tick/nohz: Reevaluate the tick for kicks flushed outside hardirq

Thomas Weiﬂschuh (1):
      vdso/gettimeofday: Correct the read of tz_minuteswest and tz_dsttime


 include/linux/hrtimer.h                       | 24 +++++++++++++++
 kernel/sched/idle.c                           | 16 ++++++----
 kernel/time/clocksource.c                     |  2 +-
 kernel/time/hrtimer.c                         |  8 +++--
 kernel/time/itimer.c                          |  2 +-
 kernel/time/namespace.c                       |  2 +-
 kernel/time/posix-stubs.c                     |  4 +--
 kernel/time/posix-timers.c                    | 25 ++++++++--------
 kernel/time/tick-sched.c                      | 14 ++++++++-
 lib/vdso/gettimeofday.c                       |  4 +--
 tools/testing/selftests/timers/posix_timers.c | 43 ++++++++++++++++++++++++++-
 11 files changed, 114 insertions(+), 30 deletions(-)
