Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909022;
	b=O7WHKA8sw71h9LxQ6QribMDrlclV8Xreo9qTDt/slGY5qDkUcA2EdvMTvalyvgCg3rnI
	 zh4LcxTsBUPQMjrTGwAraVIJYxU/8TvwX0XIlYkfzzL5Z40/PWM623LiaKE+hf8MEalTk
	 VlI9PuSM/vZhGdwDUKV1jI271e4pZ0jtwJsRUW2VfoyRlt9CQ5mnFAQMi4fmAYZtUm7Q6
	 6ziHnblNsZGRimNec8ZO72sRV43uG45WTu5x281NylMTd4g8fg2XM085DPUav3p/XmxLE
	 VKdnVywg5SFEVrcNWAushzov/2GVcknfLcpiIfaxAdxkN9RmCNw2QS/92LNCyhB+HsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eUndeKM1lXiQmSrjKdK8oJ85MDpRLlG3+Df5sxKGbO8=;
	b=2Y+z6VusG0VVDZ3ZQquNltGN3BDkxzetb7sVYMPXv+6INVsLCQ8ZQgZkt5YGFlxoCAf5
	 b0p8PoIzCR40fcJCYBiCCl2HtDSIMIuHd/xHlRNz0ON9BehR0R5lKsVrzo+Id4jX2lf/o
	 H5VNxjxIMxm8iCN9NIJavyX6ZGIcPeGGdTI01GxYh7oRpqUpDbfT/h9ev7TidlYKdQTzX
	 dB3Us9BgJ7XMgpeSBjISHQcwrYP2lZ92HPVqO4Zh2ThQyJdPbB1Fac6kACGmK/97aB36m
	 GQeR56OgyqGTUW454WY8FDDT1Ij960V7LCvVqHPDpe3Bg0Mk30ZxAH3wRujLQ1GNFQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FyLhVA3h;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B78606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B78606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FyLhVA3h
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so14670295e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909020; x=1794513820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eUndeKM1lXiQmSrjKdK8oJ85MDpRLlG3+Df5sxKGbO8=;
        b=FyLhVA3higTwf5j8yNZStaTFJMQ0Bu63uqVNRR5uYYuSwcQzSg/+2M5YGHh+no5U9M
         eCIh6CqLeen+oVp2Z0Ojlhilk4FuGxCXSRNO56oFf170g5Ubij5Nlgu5Ac0itY3birb9
         C4PgZSbv5Sijq5U/3Mg7g+MCVITnTm4Hpuh8xdDvXO8zzdjtktpvzjGjiFMV4XpfmOi7
         /71ym6Dj1eb6zDiUDbzsoRc5bTb0EnQBsxcu41d+ty55k43Gesd9yZw9NHnEjsuBTknH
         QhI6VRYzaMiX4pEI/67YgcJndCMNCFmj9XwbJobLT6Al6NLVPbfEBPJgMZprbTUOaXMw
         f5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909020; x=1794513820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eUndeKM1lXiQmSrjKdK8oJ85MDpRLlG3+Df5sxKGbO8=;
        b=OrqT7EU3Io7xlwmOnmeCfUoNouAKRzdz9YrQVG7F12zwzNVzwnRUsUxtmzTBLnQQJp
         mNDJwgdDNafHL/lJwyZY8HV5Z6C4wAorbIgEtr98OZvjj4vlHU/X3o4wOT5k5gcuAXC7
         lmqdArqJAaw7rCr1iafpYgY4pw1kPzYyJW9MH0Yy86C6luMR74U/4c7eRECKnM9k70+h
         YbUy+QmA0OU1c34R9ZwpZ0Vixr9ZUfikpAOjWrmLe3D/uXyZbD2dUbEIz83GRZdkx7X4
         fFUIxWX0v6YbvAMUbj1rcfqmLCDLlEo2J8W7kcn9G931CzlTvItvG+aa246ghE7IqTs1
         1MsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbhZpaMY5WQEMPGF0YLxAhjW81CgJaY7yKz7eVRzJ58XZtisBPhokX+Hvdhxnejz8MyzcgodyhzeNqZN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aNJv5wELkwCW0f1MIhFr1/AVw8CXlkfYGyKrSDuTSj7GY8WGk
	7bJqOETpu0Fpw2CdvYd4E9+lOOxzqiE/Damd4xeF5ZoQMzl8x5MBwBp6
X-Gm-Gg: AYBFou0qdjMVjholr3oqI8bpCJQTaSh4vmdoE8dBl2pn73Ke8o46zxhhGyfMxnMlH1r
	evtA1Of+U5+eNldQ432DL279WS1ChG2oGwh8B7SmA6g0Ia/ODb1CUzR1iFpeKmxnxDDuQwFId24
	0N4Z5hwhZd1xFKnn0YtZKZKbNeeQB6rU57CQZvKMrzvdw3uYS+LPoE4KFo2Of5J58KcaeUq2tA4
	TTG32zn7GlvpWvfq+MhV8OPqk5euyEL30j0kHjKWUBiJbnPFDqWzkYSzf/Gixuf086deIvn/Xsw
	Azn/G0rNcx+qmhAvfm/hwmWkvhW9DM38i4n7DsawxWgpuBgtVly4mKFWiKNUEVALhQDe+iSaPrj
	tRQfCsdalEiHdpHXNHmvxq6CnuaaH6sB5ZXBWJHYjDm6S9KRrg7Jd/ZdcXuVcVhLjwXOmZ4locl
	QNwCiMTbjvfvoXasL6FxPbPRNcG0P2bmyDY/u+6C7YSev1hXEIA1rRw06FN8atfcJCz0kuPJWaF
	WBGeSjACRE1kEkBMocsWdTMuWPituFcRVarPl1rz73kBNFXGOJHZ7x9ruvFs3xebIv/OcO+kcXK
	Nclw/ZKYb8Ypp+n//lPdEfjocRsp3WkvjJVJ1G2QJ/C929NPNeaYnZ25SnmaWPs9I0V8P0fX9nA
	FUg==
X-Received: by 2002:a05:600c:6385:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4b6e0549157mr3090895e9.34.1793909019547;
        Thu, 05 Nov 2026 12:03:39 -0800 (PST)
Received: from localhost.localdomain ([86.124.84.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57317cb8esm88965055e9.13.2026.11.05.12.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:03:39 -0800 (PST)
From: Radu Toader <radu.m.toader@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	frederic@kernel.org,
	anna-maria@linutronix.de,
	tglx@kernel.org,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Radu Toader <radu.m.toader@gmail.com>
Subject: [PATCH 0/2] softirq: fix idle accounting for an interrupted idle task
Date: Thu,  5 Nov 2026 20:02:03 +0000
Message-ID: <20261105200205.1178097-1-radu.m.toader@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tick_irq_exit() skips tick_nohz_irq_exit() whenever the CPU's run queue
has tasks on it, even though the CPU is sitting in the idle loop. Under
sched_ext that is an ordinary steady state - a BPF scheduler holding a
runnable task back, e.g. a cgroup at its CPU limit - and with an
unstable sched_clock the CPU's clock is then never resynchronized on
the way out of idle, so the idle stretch is charged to the next task as
runtime.

Patch 1 adds scx_tickbug, an example scheduler that holds one tagged
task runnable on an idling CPU for a configurable stretch. It exists
because the in-tree example schedulers do reach that state but leave it
within microseconds, so nothing accumulates and the bug is invisible.
Patch 2 is the fix, one line of behaviour: ask is_idle_task(current)
instead of sched_core_idle_cpu().

The patches are independent in the files they touch, but patch 1 comes
first because without it nothing in this tree can produce the state
patch 2 is about.

Measurements
------------

Two kernels built from this tree, differing only in patch 2, booted in
turn on one 16-CPU x86_64 KVM guest with "no-kvmclock tsc=unstable".
Both are needed: tsc=unstable alone only marks the clocksource,
because mark_tsc_unstable() clears sched_clock stability only when
using_native_sched_clock(), which is false under kvm-clock.

Load: one thread spinning 10 ms in every 100 ms in a cgroup, pinned to
the CPU the scheduler holds it on. 20 s windows, three repetitions per
cell, arms interleaved. The figure is the cgroup's cpu.stat usage_usec
over the thread's own CLOCK_MONOTONIC measurement of its busy time,
which is an upper bound on the CPU it can have used, so correct is
<= 1.00:

  hold (ms)   without patch 2   with patch 2
      7            1.32            0.964
     13            1.21            0.963
     23            2.00            0.963
     37            1.69            0.964
     53            1.33            0.964

  control, fair class, no BPF scheduler loaded:
                   1.005           1.006

Nothing in the fixed kernel's figures varies with the hold, and none of
the unfixed kernel's is within 20% of correct. At the 23 ms hold the
matched pair is 0.087 CPU of real work charged as 0.173 unfixed against
0.084 fixed, with 173 and 172 releases respectively - the same work,
accounted twice over.

The unfixed kernel also understates how long it held the task, which is
the same bug from the other side: the scheduler measures the hold with
scx_bpf_now(), the sched_clock that is not being resynchronized. For a
23 ms configured hold it reported a 5.2 ms mean hold where the fixed
kernel reported 15.2 ms for the identical configuration. So the fixed
kernel accounts correctly across holds three times longer than the ones
the unfixed kernel gets wrong.

An earlier measurement, with an out-of-tree sched_ext scheduler that
caps how many threads of a cgroup run at once: one thread spinning in a
cgroup limited to 0.1 CPU in an 8-vCPU guest was charged 0.27 CPUs, and
four such threads 1.12 CPUs, while a sched_switch trace and the work
completed both showed 0.100. With nohz=off, idle=poll or a stable
sched_clock the three agree. That scheduler is not part of this series,
so that one cannot be reproduced from this tree; patch 1 is what makes
everything above reproducible.

What is not shown, and what was not done
----------------------------------------

No loss in /proc/stat. The sum of that CPU's fields 2 to 9 over the
window stayed within 0.6% of the window on both kernels, so in this
configuration the kcpustat_irq_exit() half of what tick_nohz_irq_exit()
does has no visible effect, unlike the forced idle case in 548796e2e70b.
A kprobe on tick_nohz_irq_exit() filtered to the idle task counted 998
calls per 20 s window on the held CPU without patch 2 against 1321 with
it, n=3 each, but those ranges overlap and the two kernels run the load
on different timings, so that bounds the mechanism rather than
measuring it.

The ttwu_pending widening described in patch 2 was reached by reading
the code, not measured on its own. The control arm above bounds any
effect on an ordinary workload (1.005 against 1.006) without isolating
that path.

There is no automated test, and I do not see how to write a useful one.
The wrong number only appears with an unstable sched_clock, which takes
a command line, so a selftest on a machine with a stable TSC would pass
on an unfixed kernel and prove nothing. scx_tickbug reproduces the
state and reports counters, but it asserts nothing and is not a
selftest.

All of the figures come from one 16-CPU x86_64 KVM guest on one host.
No other architecture, topology or guest clocksource was tried.

Open question
-------------

The Fixes: tag on patch 2 names f0e1a0643a59, the commit that made "the
idle task runs while nr_running > 0" reachable without
CONFIG_SCHED_CORE. 548796e2e70b is arguable instead, as the commit that
fixed this same gate for core scheduling with a predicate narrower than
the problem; and the ttwu_pending case predates both. Happy to retag.

Tooling
-------

The bug was found, and both patches, both changelogs and this cover
letter were written, by Claude Opus 5 (Claude Code), in a session
measuring cgroup CPU limit enforcement under sched_ext. The prompts
were about why a cgroup's measured CPU usage disagreed with a
sched_switch trace by a factor of 2.7; the model localized that to this
gate, wrote the fix and the reproducer, ran the measurements and wrote
the text. The content is tool-generated throughout, per
Documentation/process/generated-content.rst. I have reviewed it, I am
signing off on it under the DCO, and I can answer for it in review.

Radu Toader (2):
  sched_ext: Add scx_tickbug, a scheduler that holds a task on an idle
    CPU
  softirq: Treat an interrupted idle task as idle in tick_irq_exit()

 include/linux/sched.h             |   2 -
 kernel/sched/syscalls.c           |  12 -
 kernel/softirq.c                  |  12 +-
 tools/sched_ext/Makefile          |   2 +-
 tools/sched_ext/README.md         |  13 ++
 tools/sched_ext/scx_tickbug.bpf.c | 364 ++++++++++++++++++++++++++++++
 tools/sched_ext/scx_tickbug.c     | 166 ++++++++++++++
 7 files changed, 554 insertions(+), 17 deletions(-)
 create mode 100644 tools/sched_ext/scx_tickbug.bpf.c
 create mode 100644 tools/sched_ext/scx_tickbug.c


base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.43.0

