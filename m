Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397466;
	b=ILFeVLDdRo7dSOTuRNQOul+P7Mkv1rYnHboOLaD95WNPLOo5cfEO/sujZuKJ/wtRkY/O
	 HI9jLMbRFRf0VxvuvY2bMKUanoVQc34t5LyvAg8K14VGivrcpPnYXcg1tfQGhbhGVpCmd
	 wH2QxdV4NRlUvwzgNRWI1FX9h+c+w0d3s4geBlzOBIGRGnskUzJYS8D9GR+ozJobR0vUg
	 6EdXPdRZgKkzM30ULEMbsZqM2ziXGTelVYc7NzRoIlN2w6rOhzOQpI+CuveoIRw0UWJjs
	 kZpmZ4mwvd9prL5mHS7lhj7LtZeycvGEx3Cpy23IGf3saTQSXOD5v7Q7JgNHYTsm+NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IdxVXAIRXFMC91l4hOz6RNw1MUgZMM5wLmWSJGwoNKo=;
	b=M02atF3KNYmPku68BQY+DH1MfXQRcMnEH1DeLhfp6dJFMr4X7raZ9YFuePeZYX1CER20
	 2QZHnBIcFE+Q5t3NTw+X140CgOoSU+ps5LQcwA2eLReG+CLN3Yr3oTaQIDof4s6AE+1VL
	 I83BIZ21v/qX1zAjdxfd3ISsqTnY6E7lqngzQoMHv8Fv3QwxngTV+DYtK3esqnBJCVF9z
	 +LwQ4+v48+uQpnosXVauy9eBLXQA6JXx7wr25gIBripa/rg8fXcO185l3tViCECFCc2aP
	 2fBULcFS35h7wGF/sMphmCX8V0LGGSVmyw/lCyhGMNux0OtDlSx/AvfIPNYd9XlLPyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="DN+mV/Z4";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2081606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2081606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DN+mV/Z4
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so22724475e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794397464; x=1795002264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IdxVXAIRXFMC91l4hOz6RNw1MUgZMM5wLmWSJGwoNKo=;
        b=DN+mV/Z4wzMDkCsa7xNKwXzAmEojmWFs11bDnNnPgXRbLBplDH6wgI/Oe7zKe2VcAD
         P69aWC8Fw32cseiueCXRsOWuxsjx8vvS0d0PRNrQ9MNGAMj9WmJ2AlveETRF0fKlywBe
         AoYYKhMgbRirnnF6NbLLAJb2ERT6qnHbvPB0DeBpfuG8MNvfRd+CmVj5LMTknA8APJpp
         vsqtJ9a8V9P2bENv9X1uBZ30eKvBR58o+rwnM4dENXz0Fg6FNsSszqBADxgicq8GnMlo
         CB1KvKDFUNC+DmBbBKcPj56ybSpUXt+PlF4DgQYlpV1TQmvBU3sEjr0leLugjUOgfNID
         QdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397464; x=1795002264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdxVXAIRXFMC91l4hOz6RNw1MUgZMM5wLmWSJGwoNKo=;
        b=dq0TdvvsjKzH9S9HyIkIuMIa+f0fs4zv9zOnxNm5xL4aYycvM54Wz8gcAFRIpkiS1d
         atr0xEwqfpOaNcTKtRAHmYmQLif3qU/yhreGhIoheJNgaU348a6B4SOnJXO4OrN/bW8r
         cU+0OLw72/12aiEFhenVgGS0uBNiFxeLB5rtYoY2b2jv5TrUrjUytiXHaFRJEhi+/usZ
         4eYS66T3K4iKQU3TYhPd5vsOQr/0hQ/aPmI2YPq2dOekBjqt/wKIMDwlha+FeIx8rPfQ
         l0LSoD//lLoPttsS5dxK7jBkrlzJUjJF+XvW31Y6tzfN3mBQLSOZrTLFcon4XYp5GNlz
         A5kA==
X-Gm-Message-State: APuU4Z/GsYn7JROqrtRhWVcayFg23eq/bf9aYfV80JwYpqoWG1re6RSC
	EOJ08YX+MQTocjx5k9VUr/596tdNZrCoeSCsr0i2msM75jRFyik8bPCCOpUi/7/KJiJxSTcpOw6
	45Qnaiio=
X-Gm-Gg: AYBFou0mMzrlXd0EKKUe+SdLUmvT7m6rOjmqSv6s6qkn+h8cfOvLeXRFYpvM6QfKzib
	MFgTApLNuYULFX7gbdLWxq2+anq7d02pWcCf2OATN0kDnrqH1/XQ57hraUVdP0BIyTgEN5Jizag
	D9/4g9E7g7SLeSx1mKG8UghKrwZX2IEDZT6RDRL9BRlwDu4RKH9nxQJT677sdSx5QYpLIIYIsCA
	ATFvuetNJKmIKX82/ZvGw+V53mWkK0WMBcU/SFDxNX9pQ7OZdgVpDeTqFmzynZDjod1+K3BmU4u
	s/1dMaq/hHXE5asmVfvDsdJg3GVYOQV9aiQPMagHnGt7m+uSI8vChEw7kqMb3aKvW3/AVtm82GP
	WhKXRO6g7REMfz86nG3l6VOp8Ew7DeQAOd4D0Ez2wlLGhWoK9l6+bMKxL+y2DZvzx4y3Cw4T/b8
	t3+iSbML/oYOlTYH97ZIKvXVMohDZiI9PERXPeMrEv7vcilDn5Lvhz/kTORh7LGg9v1Wkh95Zck
	vYydCHxxKY9wMsCZUWhtBumLaXtJ+HF4zIfHWE2AObyhz1fZjCoCv6qzhVoi844vvhGYbHDwW0D
	uVSahatI8U3DAjaIs1d7hUou6Lm52wwIvV6TPC/zWR30nOHefFg=
X-Received: by 2002:a05:600c:348d:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4ba0935cdafmr35129545e9.8.1794397464019;
        Wed, 11 Nov 2026 03:44:24 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e354b0sm43238545e9.1.2026.11.11.03.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:44:23 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mel Gorman <mgorman@suse.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 0/4] Stop the idle tick on polling idle on nohz_full CPUs
Date: Wed, 11 Nov 2026 12:43:46 +0100
Message-ID: <20261111114406.346953-1-marco.crivellari@suse.com>
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

[ P4 ] Documentation: no_hz: Add tick stop in polling idle

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
Changes in v2:
 - P1: The only change part of this patch is re-evaluate the tick on
   return to user space.
 
 - P2: Changed as suggested by Frederic: TS_FLAG_INIDLE is only set when
   the CPU goes idle and not in polling idle; tick_nohz_idle_enter() is
   called on every idle loop and runs with interrupt disabled. The tick
   is not restarted before polling idle, so
   tick_nohz_idle_restart_tick() has been removed.

 - P3: Remove tick_nohz_idle_restart_tick(), now unused.

Marco Crivellari (4):
  tick/nohz: Re-evaluate the tick on return to user space
  sched/idle: Don't handle polling idle as dynticks idle
  tick/nohz: Remove tick_nohz_idle_restart_tick()
  Documentation: no_hz: Add tick stop in polling idle

 Documentation/timers/no_hz.rst |  2 +
 include/linux/tick.h           | 10 ++++-
 kernel/context_tracking.c      |  8 ++++
 kernel/sched/idle.c            | 13 ++++++-
 kernel/time/tick-sched.c       | 68 ++++++++++++++++++++--------------
 5 files changed, 69 insertions(+), 32 deletions(-)

-- 
2.56.0

