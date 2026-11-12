Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501506;
	b=h81TDJgpSbwkDyrOyiGKFx7KXlBMXNycFhWnQYCNNXPSEykWcryaBcO0c4hVdF2kGczW
	 ksCMlL22ho7maHudWQ8dlkkdXKbB9VVnIC6NASYOXVpp4lBZPovlxzOjZ54Pb3edCvV5T
	 Oj8ZbtaTLharif7rez+nQedVrniPB3IE+mGMtfnpYZZI3e4sFAXiJsvVC6MqJBMJCyyFO
	 Xe1DAq+LEA7SlK75U1ZVjP26YmDcwxZ5K1UeAj9sChSbl1/Vx0ijkSuJ5XP+MsvVSrIvQ
	 5f7ikslO3OC8ms5EK0dE7rys3bxfqzY1nWR4C7S6PxRQ2AH+SYWzIH6+ZXjYQ/6rv0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Q8/FASn08ce1wwL6478CAmvhpcArWX9CxkgPS+xhg8k=;
	b=ECfe1O6j7F0Gb5tejZVMdyU7wgGTv7nukGzfskjQ9b/Trzuus9OSj6ZbbCYAyl/5xDv+
	 UZyNakS6sseSo5Qz2SdwDF1OPZ0O0FWVLuor4imMHBPPZOSwDWytaYsAhiIgB/meYTfs+
	 2oU2O+Mh+gRJ2zx3rZjlyLcTO82DbUIO92cjN5BjFUFDDliLcswDldE8ApXstLVQ7plhP
	 LATRPAWCx75qgyNKi7OTO8wzbH3K7210CTn2Wk5pRxOoIPpLzHIdl+6YfiCNb3N5+CAfg
	 c1HoGxUA+3bsGdmdx4PbKwf3PIzogcOKs3L05hEZHo4/WyYuXGnSYvgj6euC2SgrL5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=M7TcOTrV;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728CF606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 728CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=M7TcOTrV
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so47942755e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794501504; x=1795106304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q8/FASn08ce1wwL6478CAmvhpcArWX9CxkgPS+xhg8k=;
        b=M7TcOTrV5WCiZXUexPHRt8+xKHl6M2OtEjS+wgJrh4PIZopk/2DT9OHq5byy6ipaUh
         Hxm7ddLjzco5avstuO0MydMZbJa5hu0XOIhcqXEtYT42ua3PpRIScE7aE6MeY6x08Tfd
         C1ZVxz8GvKvfOrdXEf1dQ4K1PhAwf9mMJJT/oXJuJIx3Y32Hj1ZeOhWFpEPjcK3BSAFQ
         c2cT/agGbfnzvNVW8l6kF7Kca5gfUtYflRSc7wSYtF9soinbFeKbRWOU6ZT38AZcOvGV
         ElAccGS2GtM6DNzHo6YtzC1lprJ6ub09oa2SPBV6svoC1YahMzJVn4UhcRndLxk7SJ0/
         2HJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501504; x=1795106304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q8/FASn08ce1wwL6478CAmvhpcArWX9CxkgPS+xhg8k=;
        b=fTqC/xx77c87IQj7Jwj86FhaWewyyvPqqefKITt1sIwrhkryyLO/YDWc4q4nD63x1Q
         A+T3tB92m+IDPVjLnIGET9kjRgmsgA6YAB8Sz72Ztm3CEiRyj3IQMYtfNDlaT78eV9ED
         tgOqKqRZG6vvbu5xQcHf4muU4/cR4AcpJYm8Be79VChEHNgx4Pq01eMv7X1PL8I/OMP1
         LoJtc2pq1VQJCh+SG3nwuHDe2F9B5EP1qMuDn4kISpLnVaSCa08kBLak7dULVIf8CtRE
         cXcZUsl0qAoWqsg0lK79o1+qVkPNiI6ZNZBf7pGTC23cNhGqCpJj/c+pQWTp5wcMM7KZ
         zWAA==
X-Gm-Message-State: APuU4Z/6c3qkME95YBoR+crJdLMHNPxtPQP5wAmdASGIxzsWhiAyGmk+
	5/IySHAGwn2b2DNR9ZrpyfqWrPLORbPEtVRII22RGV/2+iiwEOj4Ut6aJFQtQP0kPpBEXzFaC0C
	i74TUwEQ=
X-Gm-Gg: AYBFou1uRrFggmU8MrHBaIKWqDl8vm+/gDvqWwk2tUys2NKD1oNFcbBIkY+TRwXH0IM
	RbaBoCDUib8gFEaLI4p9AtckBCiwE0iCX/K+Z5DxTNaxiWuNIpOYKYHzU9sAakCaqxut4PZxZVk
	tb5B++A7xKbjV1K4sVAvn01szmM/l252/kRVxqo76ktc0y8tgSVjBXLauvsJWAfkR9lSBbo3SWh
	bAmQG+mzuTwVDwmVgNh4oeMFya7LjwoYxgFIptZsXnZjYuR72uJLb8rhNO/S3BR1L4qCU1+YKYe
	hKiwJiBPulZuEIwvwxjJTZgGiD42beu4fTWoEem4rTmfiRE9pz4vqxzmkWoTV1NqbPrwShsXDct
	oFR4KjULNhnQj4C77X+psjcnTTW6u2S84csqUpbolbv7gQeXLXE9i7hKk03eYB9a8Xe2+dolH/7
	f5z3hG0yJsrAUa7x22YghfZr5NNBFLqmOsHjpFkKJpuaEFwXxB6iDICiw8Pc/RjNqiSpPV9G7xe
	dxLjhw3fhJIAc3pqi24QyyPtOvc2PXTJxBONe3+l+V84IpFAyRzp9BIDv1ykMx4ICVYRk8tbFrQ
	tDFxZkP6lP5bVDJrlDfBMo87aSchrg1bPgXhsgsxHW9q
X-Received: by 2002:adf:e19e:0:b0:48e:7e15:406d with SMTP id ffacd0b85a97d-499c6027cb8mr10503073f8f.11.1794501503426;
        Thu, 12 Nov 2026 08:38:23 -0800 (PST)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm226827f8f.8.2026.11.12.08.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:38:22 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH v3 0/5] Stop the idle tick on polling idle on nohz_full CPUs
Date: Thu, 12 Nov 2026 17:38:08 +0100
Message-ID: <20261112163813.524336-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
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

Hi,

On nohz_full CPUs booted with idle=poll, the tick interrupts the task once
after every wakeup from idle. do_idle() restarts the tick before polling,
and on wakeup tick_nohz_idle_exit() only re-evaluates the tick if it is
stopped, so it keeps running and fires in userspace before
tick_nohz_irq_exit() stops it. Without idle=poll this doesn't happen:
since commit a5183862e76f ("tick/nohz: Conditionally restart tick on idle
exit") a nohz_full CPU leaves idle with the tick still stopped.

Marcelo Tosatti proposed stopping the tick on polling idle entry:
  https://lore.kernel.org/all/aQiWfnnSzxsnwa2o@tpad/

Following Frederic's review, this series does it only on nohz_full CPUs,
and handles on the target CPU the cases where stopping the tick in polling
idle would leave a timer unprogrammed.

[ P1 ] tick/nohz: Re-evaluate the tick on return to user space
  On nohz_full CPUs the tick is re-evaluated on IRQ exit and on idle exit.

  This is not enough on return to user space. If the tick is left running in
  the kernel, for example because a tick dependency was cleared
  (tick_nohz_dep_clear*() don't kick the CPU) or a timer that kept it
  running was cancelled, it fires at least once in userspace before
  tick_nohz_irq_exit() stops it.

  Stop it from context tracking right before resuming userspace. When the
  tick is already stopped, the common case, this costs a few flag tests on
  each return to userspace.

[ P2 ] Don't handle polling idle as dynticks idle

  TS_FLAG_INIDLE tells nohz whether the tick is managed by the idle loop or
  on IRQ exit. With idle=poll it is set while polling, but cpu_idle_poll()
  doesn't run the idle loop again on interrupts: a nohz_full kick or the
  expiry of a stopped tick isn't re-evaluated until something sets
  TIF_NEED_RESCHED. The tick is therefore restarted before polling, and on
  nohz_full CPUs it then keeps running after the wake-up and interrupts
  userspace.

  Enter dynticks idle only on the cpuidle path, from cpuidle_idle_call(),
  and leave it before cpu_idle_poll(). While polling, the tick is then
  managed on IRQ exit as for a running task: on nohz_full CPUs it stays
  stopped if possible, and nothing is left to do on wake-up, so the task
  doesn't pay for a tick stop after waking up. On other CPUs, leaving
  dynticks idle restarts the tick as before.

[ P3 ] tick/nohz: Remove tick_nohz_idle_restart_tick()

  Polling idle now leaves dynticks idle through tick_nohz_idle_exit()
  before cpu_idle_poll(), which restarts the tick where needed.
  tick_nohz_idle_restart_tick() has no users left: remove it.

[ P4 ] tick/nohz: Reset got_idle_tick when entering dynticks idle

  A tick firing after the last tick_nohz_idle_got_tick() and before
  tick_nohz_idle_exit() leaves got_idle_tick set, and the next
  cpuidle_idle_call() then assumes that a later dynticks idle period was
  ended by the tick. Now that the CPU leaves dynticks idle before polling,
  this can also happen within a single idle trip when it switches between
  cpuidle and polling, e.g. when it polls because the tick broadcast has
  expired.
    
  Reset got_idle_tick when entering dynticks idle, so that it only reports
  the ticks of the current period.

[ P5 ] Documentation: no_hz: Add tick stop in polling idle

  Document the above in the idle=poll item of "Known Issues".

With big effort on the Claude side, I made a test suite to help testing
the work:

  https://github.com/DispatchCode/nohz-full-polling-idle-tick-test-suite

The following is a short summary of the results.

On x86_64 guest, HZ=1000, nohz_full=2-3 idle=poll), a task alternating
100us sleeps with 10ms of userspace work, 200 times:
  - ticks in userspace:              200/200 -> 0/200
  - ticks while polling:             35 -> 0
  - housekeeping CPUs:               unchanged (tick runs while polling)
  - P2 without the kick change:      15 of 20 timers enqueued from an
                                     interrupt on the polling CPU lost
  - P2 without the stopped tick fix: the second of two queued timers up
                                     to 1.9s late
Tick dependencies (POSIX CPU timers, two tasks on the CPU) and CPU hotplug
were also checked.

Thanks,

  Marco

---
Changes in v3:
 - tick_nohz_user_enter(); moved outside of CT_STATE_USER so that also
   guest can benefit from this.

 - __tick_nohz_user_enter() has been moved after
   tick_nohz_full_stop_tick(), so that the same #ifdef is used.

 - P2 now uses guard(irqsave)() instead of irq_save(flags) removing also
   the "goto".

 - P4, Documentation, now is P5.

 - Introduced P4: reset got_idle_tick on tick_nohz_idle_enter().

Link to v2: https://lore.kernel.org/all/20261111114406.346953-1-marco.crivellari@suse.com/

Changes in v2:
 - P1: Only for re-evaluate the tick on return to user space
 
 - P2: Changed as suggested by Frederic: TS_FLAG_INIDLE is only set when
   the CPU goes idle and not in polling idle; tick_nohz_idle_enter() is
   called on every idle loop and runs with interrupt disabled. The tick
   is not restarted before polling idle, so
   tick_nohz_idle_restart_tick() has been removed.

 - P3: Remove tick_nohz_idle_restart_tick(), now unused. 

Link to v1: https://lore.kernel.org/all/20261106160621.347228-1-marco.crivellari@suse.com/

Marco Crivellari (5):
  tick/nohz: Re-evaluate the tick on return to user space
  sched/idle: Don't handle polling idle as dynticks idle
  tick/nohz: Remove tick_nohz_idle_restart_tick()
  tick/nohz: Reset got_idle_tick when entering dynticks idle
  Documentation: no_hz: Add tick stop in polling idle

 Documentation/timers/no_hz.rst |  2 ++
 include/linux/tick.h           | 10 ++++--
 kernel/context_tracking.c      | 12 +++++++
 kernel/sched/idle.c            | 13 +++++--
 kernel/time/tick-sched.c       | 65 +++++++++++++++++++---------------
 5 files changed, 70 insertions(+), 32 deletions(-)

-- 
2.56.0

