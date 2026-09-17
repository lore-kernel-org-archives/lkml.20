Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6150A4E50A6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619626; cv=none; b=Z2v5jn4p22zyWKcaTiwljCoBk5h7DIT2qxzZ03Q92OXLOeMiNVKWrmwkefnGn4ZEopFCK0sBkMGOroCIYibc7lOehXe99NSG7lAdi4GaSENqLjI1JJUxKTF3/+PgWq+FfxfHt2VMbT0I+mPt1PPEJ6axuvMtaplod8VEW5D7KwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619626; c=relaxed/simple;
	bh=bONhAKMN4yLircIlQCPyl6b/Q5mf9u2zDUVZerX3l+c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gRAxAH/baKW0axBP9kHK/2/8vh16CuUEFUy+IZ4gAS3XSWxgn1yoHxON2zn1zeYEhBYFOIFdezWUZs8yZYnWhOYoLpu+cT5CCyn2lewTpuXK5xNxMNeRE2q/ed4/wQcIXFZkftEOQpUEdfMwgIPHFK5tsY3w7QreMvPmlhNlHx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MUSwz4fQ; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MUSwz4fQ"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a59faf521so715665b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789619625; x=1790224425; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NF/mryPhjQatr6x7ddjTQ502qjmm/qeAehaox87C6hc=;
        b=MUSwz4fQ9ALrlXI8qkuDqmV4JJ87ApkXs4hhzsjkyHe7HAtJ04gjfmfM6luHx6XHch
         rFOG6lGI6AKkuWE81T5SLSoRZENnz2hcyGeBbKDnnCK5fNQt/46NDiGJSrZSiFQBwDcJ
         5XjX1fHYPvyQ0t0deu9j+jkkoo92Q3uIUahTqyvCtwjR3YLBB8GPg7CKNNxBnFAQEAxY
         D7LXyjDXKodQnRtrRdApxldhlsyGKJpFizlwOEeptri8FbhLcwFVsb1MO9fd9VgMnHmr
         OXYi7MHROSbmDqMfoI57iNxX5c7d1QhSbHPEw8sgE6QPR9y+qQd1CnyF8lZeTFWMB0fb
         aS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619625; x=1790224425;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NF/mryPhjQatr6x7ddjTQ502qjmm/qeAehaox87C6hc=;
        b=Lh2G9Q97k7L4KkU9+KORLHuEHCbdHq4xlnuTcbOoO2Ft43zu7u74Z7+47TBica7enT
         WDq+z269LjrbBDelhsv3fCcGuHOR4v5xLrNePymjN/ZYIwUPOndV8tAl4DBMWU8TUPb+
         F+Z1/fN5kPqcTxhXCoJ1ha5Eb8t8vwKDTbX5LkMi/XdDu8OnzYVwQtmZFYbYw51NO5J3
         9OQMpZWOSFPZXEp4CAen4d7o14bcYqdUkHCWkyrpkWqRRM6gYFKQb46c3CR7+IHHw5rj
         HcET1kpDf2VzPcBdsu/r79vLyogIxvpnwNuyRdOPbgI46YGK+zVUrA06DfVPHTQVrs6A
         ZKuQ==
X-Gm-Message-State: AFuF++n5t/I90hHKOM2KPca0cOgRcS4ykkeV+1j36/qt4V7bCDvQXtTy
	JWQxJlgFohLdssX/Viz9FlYzKkCeWmw1ZhM8mw8ne4ScH3mSXwrvpld6MFQoj2bHLqWirEKGsmF
	nurw4MZ8j6JocBP3u9so3ZJoopotlJY7xf6oxm4FQp6TvBekMQWP16NGMLqsUG/6SG2pwmEZBbC
	t2VEPAr3f8HPgIy1Q4ddpLNdA0IgUXmPAPe+QCmnJq2T77xN82rKT8Yq0=
X-Received: from pfbfh24.prod.google.com ([2002:a05:6a00:3918:b0:869:37f5:4d1d])
 (user=suleiman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1888:b0:84a:60a4:2651 with SMTP id d2e1a72fcca58-87238c8aad3mr10253222b3a.6.1789619624329;
 Wed, 16 Sep 2026 21:33:44 -0700 (PDT)
Date: Thu, 17 Sep 2026 04:33:24 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917043339.2093426-1-suleiman@google.com>
Subject: [RFC PATCH 00/12] FUTEX_PING: A stealable futex using Proxy Execution.
From: Suleiman Souhlal <suleiman@google.com>
To: linux-kernel@vger.kernel.org
Cc: Suleiman Souhlal <suleiman@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	zhidao su <soolaugust@gmail.com>, John Stultz <jstultz@google.com>, 
	Qais Yousef <qyousef@google.com>, ssouhlal@FreeBSD.org
Content-Type: text/plain; charset="UTF-8"

Hello,

This patch series adds a new type of PI futexes, PI Next Generation,
or PING (name coined by Steven Rostedt) (but other name suggestions
are welcome!), that differs from classic PI futexes in that they can
be stolen from the top waiter, and use Proxy Execution instead of
rtmutexes internally. 

The reason to allow the futexes to be stolen is that with classic PI
futex's strict handoff to the top waiter, new contending lockers are
now forced to wait in queue, which means that any locking operation
now becomes a scheduling event. With stealing, a contending locker has
the chance of taking the lock without blocking. The longer wait time
of blocked tasks can be mitigated by forcing the lock to be handed
off to them in a way that can't be stolen, when they've been stolen
from too much, to ensure they don't get starved.

The use of Proxy Execution lets us also get Priority Inheritance for
for fair tasks, which PI futexes don't really allow.


PING futexes are used similarly to FUTEX_*_PI, where the owner is
expected to write its TID in the futex.

The main user-visible difference with regular PI futexes is that the
kernel is allowed to set the FUTEX_WAITERS bit with an empty TID.
This is to allow for a new locker to steal the lock from the top
waiter, which is supposed to improve performance in workloads that
don't need strict RT handling.
The user is also allowed to notice that the futex is unlocked but
has waiters, and steal it without going to the kernel.

An example of how they're meant to be used:
Lock:
        static __thread pid_t tid = gettid();
        uint32_t oldval = 0;
        if (atomic_compare_exchange_strong(ftx, &oldval, tid)
                return;
        oldval = FUTEX_WAITERS;
        // The user could also spin here a bit.
        if (atomic_compare_exchange_strong(ftx, &oldval,
            tid | FUTEX_WAITERS))
                return;
        if (futex(ftx, FUTEX_LOCK_PING, 0, NULL) != 0)
                err(1, "FUTEX_LOCK_PING");

Unlock:
        static __thread pid_t tid = gettid();
        uint32_t oldval = tid;
        if (atomic_compare_exchange_strong(ftx, &oldval, 0))
                return;
        if (futex(ftx, FUTEX_UNLOCK_PING, 0, NULL) != 0)
                err(1, "FUTEX_UNLOCK_PING");


Why did we opt for a new futex type instead of making PI futexes
and rtmutex use Proxy Execution?

PI futexes have strict rtmutex semantics, which while important
for RT workloads, could also potentially result in performance
penalties in workloads where maintaining those semantics isn't
as important. Since we don't want to break existing applications,
creating a new futex type seems appropriate.
Making a new futex type also lets us change the user interface a bit,
to allow for userspace stealing.

We do hope to eventually enable rtmutexes to use Proxy Execution
but the rtmutex wait_lock and pi_lock ordering is backwards for
Proxy Execution, so a potentially complicated rework might be needed
before rtmutexes can use it.
In the meantime, Proxy Execution boosting and rtmutex boosting
can continue to coexist.


Some features of PING futexes:
- Uses Proxy Execution.
- Optimistic spinning (can also be done in userspace, similarly to
  FUTEX_WAIT futexes).
- Allows for userspace stealing.
- Starvation prevention with handoff.


Some performance numbers (lock acquisition time, in nsec, lower is better):
(The numbers were kindly gathered by John on a machine with 11th Gen
Intel(R) Core(TM) i5.)
(How PING performs compared to PI and FUTEX_WAIT seems to vary a lot
based on hardware and ping_bench parameters, and the results look a
bit more impressive on my device :-), but I did not include them since
they are based on an older kernel version.)

With all fair tasks:
"ping_bench -a -w 50000 -s 1000 -t 16"

x FUTEX_PING
+ FUTEX_PI
* glibc pthread_mutex_t (using FUTEX_WAIT)
    N      Mean    Stddev     Min     25p     50p     75p     Max
x 159984  214377.3 859183.23      21   13703   15580   75343 1.15e+07
+ 159984 240690.75 23090.391  234635  237833  239962  241565 1.07e+06
Difference at 95.0% confidence
      26313.4 +/- 4211.65 [22101.8 30525.1]
      12.274363% +/- 1.9646%
      (z 12.2454 p-val 1.77893e-34 crit val 1.95996 se 2148.84)
* 159984 203941.44  14257763      17      20      21      21 1.21e+09
No difference proven at 95.0% confidence
      (z -0.292232 p-val 0.770109 crit val 1.95996 se 35710.9)

With priority inversions with a RT foreground task:
"ping_bench -t 8 -b 16 -r 1 -p -w 10000 -S 500"

x FUTEX_PING
+ FUTEX_PI
* glibc pthread_mutex_t (using FUTEX_WAIT)
    N      Mean    Stddev     Min     25p     50p     75p     Max
x 9999 615.55326 3387.2647      21      50      52      54 8.2e+04
+ 9999 701.18222 3450.3964      21      49      52      53 3.34e+04
No difference proven at 95.0% confidence
      (z 1.77087 p-val 0.0765815 crit val 1.95996 se 48.354)
* 9999 205935.36 2881211.5      24      53      54      55 1.24e+08
Difference at 95.0% confidence
      205320 +/- 56473.6 [148846 261793]
      33355.327862% +/- 9174.44%
      (z 7.1258 p-val 1.03486e-12 crit val 1.95996 se 28813.6)


The patches apply on top of Linus' HEAD.

Any feedback is welcome!


Suleiman Souhlal (12):
  sched: Abstract task_struct->blocked_on by locking primitive.
  futex: Switch PI futex to use p->pi_futex_lock instead of p->pi_lock.
  futex: Add "ping" parameter to pi_state management functions and
    export them.
  futex: Introduce stealable PI futex, FUTEX_*_PING.
  futex: Implement exit_ping_state_list().
  futex: Address aborting from futex_lock_ping() while owning
    ping_state.
  futex: Make FUTEX_*_PING use Proxy Execution.
  futex: Implement PING futex handoff.
  futex: Wake up donor in PING futex unlock.
  futex: Optimistic spinning for PING futexes.
  futex: Allow userspace stealing for PING futexes.
  tools/testing/futex: Add ping_bench, a tool for benchmarking futexes.

 include/linux/futex.h            |  22 +
 include/linux/futex_types.h      |   1 +
 include/linux/sched.h            |  53 ++-
 include/uapi/linux/futex.h       |   3 +
 init/init_task.c                 |   1 +
 kernel/fork.c                    |   3 +-
 kernel/futex/Makefile            |   2 +-
 kernel/futex/core.c              | 102 ++++-
 kernel/futex/futex.h             |  27 +-
 kernel/futex/pi.c                | 132 +++---
 kernel/futex/ping.c              | 707 +++++++++++++++++++++++++++++++
 kernel/futex/syscalls.c          |   6 +
 kernel/locking/mutex.c           |   8 +-
 kernel/sched/core.c              |  69 ++-
 kernel/sched/sched.h             |   2 +-
 tools/testing/futex/Makefile     |  13 +
 tools/testing/futex/ping_bench.c | 428 +++++++++++++++++++
 17 files changed, 1484 insertions(+), 95 deletions(-)
 create mode 100644 kernel/futex/ping.c
 create mode 100644 tools/testing/futex/Makefile
 create mode 100644 tools/testing/futex/ping_bench.c

-- 
2.55.0.1082.g2b9226bbc0-goog

