Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794071591;
	b=1lCA+faVPOQCXgkEb3rddKOLU8cmndSreBG3RKsCUp0+rSAWM1D/YLTbGjqqgjYHpXeP
	 N74AaAaq1fdYAP2PmwtAb+3gQZxQF5w2PWzm7hjhfvAbILB7OFzIt9Z4rkkX/qKYFnPtF
	 KcjJYekQHud6nbokSbnRBwXGWSzdVeiVb6Na/DdW2cRSP0zmFYWNWsQbHtA3zM5LNj321
	 t3mcSnOgHIHvGIiwjIMJ5Wo8anE48zvs87lIJ4gYdVzjODJXLUw2MHnRL59NPPjByq22m
	 ISKpTKlKMMsx82vTgJj3KROOV02Z74pEVy9El7BuMX/VzRha8uTrg4lpzEpDfmTloGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794071591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TIc6+YNxVXhGA8deHKYHd4FZyrT7f/jlj0igPXFCOsE=;
	b=FSLQnHz2CgumBF3nSWE8xvfOddPHGRtLIaWNTz4LKKXn1tmRQfOftQPGhqovxB9cxPVf
	 oHRwc2KuofidsjdS6gtP+yeglVALHeMC6NBQQec3CEV2MMqpKlMFk+sXl8cWYCN+16juC
	 Dwfx+lJsMo+SLCv6IhsCtS8ARfBLGSOdPBbWoT0QzMEqykl5RslY4UQOBlAifQBxdUWEI
	 AD6jan2ASRr4B9ZykLFLTuwWqfXMsAF5fMpSijo56n3XiRn15+Uwg30lrhop4j2wioBHM
	 0nwUwC3mZq4mBMROzeVGCsAQsSsA829EKo/4FW8Ur1DUdjz83J1jWlBSqcedPyTs8gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6OSU7Ir;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1D7606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 17:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD1D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6OSU7Ir
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48fd2e38825so984179f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 09:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794071588; x=1794676388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TIc6+YNxVXhGA8deHKYHd4FZyrT7f/jlj0igPXFCOsE=;
        b=x6OSU7Ir21f6GzY3BamV86ebskkhQEG7OSMk1lTI9Nc1pNOHgHZ1lYDP5dTByyQXQq
         pnVsizsC04hWjoEHcNOwKXoZx3hYdyuDm3u8Rr1r6LSkWoClZuTasWJQtvqbksHMUTH+
         6o9rhfmCTfAQ5wkvWws3P4WzmcKJnM2fP4hwwPhHEGjbMeEPV2ZXU2KBKaZ+zIt78g5q
         pZuC4zdWGnvbUAXkIPC3tVFK+8NFV99ba3CNQW2T0ePSTIOvzRKvXo5ivVAxeBvNtuS/
         LSJCxqa0jl/W9OVD0I5dwsG1Za1gubmG7eYtCjrKPqOGmYtYLTx6Qis51cWznqkdGCi5
         wqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794071588; x=1794676388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIc6+YNxVXhGA8deHKYHd4FZyrT7f/jlj0igPXFCOsE=;
        b=oseM39qgm71oDP6+cN4KnBRkT19ytOraytUP+NZ74ZuYEm089t1w5g3JiWu1U66ekN
         rRYxiPYShIr/w0xQ8/UPGojHx/0Zrg6pwytsRRLsAdndYl41ctHXjbjb8NLVhkgF0BzE
         3Tzj7ohv6Z4t85RFokzXPJUegzx098ShSJJXPvEqPupFIUQhR9wXl7wlh1XNkfQyPN9D
         PrBuhDNfEdHwJqa81TOZm98xwbXexaK0NQ5TMoPWTg//R7zt3Xd6GfMQuvPgwy8YJG/8
         0AL9b6WwY/OL8kUMnvvHx4txtCnzt16SPTR6f2AZFHLSsOfGJC3NO38EKmce65KDIwVP
         cNBA==
X-Forwarded-Encrypted: i=1; AL+hErHMC6ExAcr/NCrYosP9SbZxmRsl/f4y4Bnb9uIBpMqFVeFLBqkxkew8hMB0hwWqEb8kxBhrqxm60QLDiys=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qc1APAhq+eTTKxfqZEjmNUUIwJcq/VfZYhHiAgjBBN3f+sm5U
	0UQpeTDPP3gUtHUzE16H7Ul0kUIseNFRFoRuiA+rB68KrIQIXOXg9s5V
X-Gm-Gg: AYBFou0ohy8o86OeWF8LEqUQsWU5i7SjuU96kR+RAz01ueP/psjZSj914vyx6kgZ9PP
	RWyTGRgLJzdMq7APcDoZrv3+V2QTF/nt3s68YU4P8dwkd/T5dF0epYjBgXPNo1vO3MUSeUegLUC
	RfH060HiDuge2pdQSJlRHQoPr6Yxqz2XnRNPGXZi5NR4eAcECJvKVb5v4Mdf0QE6evVvMUF4z48
	4LP10M3pKAwIHaF+lfQdGf46njjNUiE9zQcIVGm0rkwl4erxTdcmKCT0ZCtMFiQHDmb1o77KmZu
	g3uzo2/B396A0azt/Cr4ir5YQfhan+4owU4za92vreqFuG0pS3+aREA8HHFlw30TgRiPBBlY+Rj
	yxeIawsTe/FURzT3+MUu707J5AVCLKHcT7wWvmoSSMKW0T+qdNG09uex3cdMAd9OT05F5Hvg7x9
	m4rGYmv8MsH0i7XGkFEKo2KUHSo2dacf/d514QfPlRKyXFYo5KxraudtB39AJa9EvGONwqMqIkK
	E3SIOfqnzOi/bG26S6yxMbhlIvzIyHmlQ7xZyvXXwRyRGZNpCImFwozwj2e00tuAnYbjeI0LC0o
	y02HFdLW/rT45sUPC8Qcb08QWhpE1Q3OfLrFhSpcxqfyaqzoEB9V1RxF7Yszc3AIHPCPQGiY4Dq
	Wq8FSwm8fZ/8pxXns0X0Ac9F345fZQUXnKwZSUSi5XSdxvLQ6a++WXwRN2yTw2lNSmyzLqwkiMq
	fL+xb4UVUm4JjKCTJLehPnXZ4TkH6cBfY=
X-Received: by 2002:a05:6000:490d:b0:48f:fcac:a5e2 with SMTP id ffacd0b85a97d-49277404453mr10990954f8f.38.1794071587759;
        Sat, 07 Nov 2026 09:13:07 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10627105f8f.21.2026.11.07.09.13.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 09:13:06 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Wen Yang <wen.yang@linux.dev>,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/9] rv: Verify generic IRQ context transitions
Date: Sat,  7 Nov 2026 18:12:43 +0100
Message-Id: <20261107171252.25090-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

IRQ action tracepoints describe handlers, but not the lifetime of the
enclosing IRQ context. One context may run several actions, and an action
may be dispatched outside hardirq context. PREEMPT_RT may also enter
serving-softirq state without invoking an action. This leaves no generic
event stream from which an RV monitor can check IRQ-context transitions.

This RFC adds tracepoints at the generic hardirq and serving-softirq
boundaries. The irq:irqstate RV monitor checks their order and agreement
with live kernel state. irq:irqexit follows the owner of a
preempt_schedule_irq() invocation across task switches and CPU migration.

The hardirq tracepoints cover paths through irq_enter() or
irq_enter_rcu() and their matching exits. They do not cover direct
__irq_enter() and __irq_exit() users, raw paths, or architecture-specific
entry and return intervals. irqexit covers preempt_schedule_irq(), not
the complete interrupt-return path.

Boundary callbacks can raise softirq work after the pending-work check.
The series wakes ksoftirqd or ktimerd for remaining work. KUnit covers
nesting, monitor synchronization, PREEMPT_RT worker intervals, provenance
and late-work handoff.

Gabriele answered two of the v1 questions [1]:

  - The boundaries are now bare DECLARE_TRACE() tracepoints like the
    existing RV hooks in include/trace/events/sched.h, so they add no
    tracefs ABI.
  - irqstate and irqexit stay separate automata because one is per-CPU
    and the other per-task. A hardirq or non-RT softirq belongs to the
    CPU it interrupts. A preempt_schedule_irq() invocation belongs to
    the interrupted task, several tasks can be inside one at the same
    time, and it can migrate before it returns. Each RV automaton has a
    single monitor type. Both now sit under an irq container, so they
    are enabled together by default, and the irqentry/irqexit naming
    clash is gone.

Questions still open from v1:

  1. Are dedicated scheduler tracepoints the right way to follow
     preempt_schedule_irq() across task switches and migration?
  2. Is the KUnit-only hook for an empty ksoftirqd invocation
     acceptable? Outside a KUnit run, its worker checks take a disabled
     static-key path.

Patches 1-5 add the tracepoints, monitors and documentation. Patches 6-9
add KUnit coverage.

The series is based on v7.4-rc1, which contains the v1 prerequisite and
Wen Yang's reactor lockdep fix:

  commit feb5c9a2447a ("softirq: Preserve interrupt context on return from interrupt")
  commit 39ccedfd9e55 ("rv: Use LD_WAIT_SPIN as the reactor lockdep wait type")

The series is independent of the early-hardirq series [2], which
installs hardirq state before entry tracing. Both change
kernel/softirq.c, so applying one on top of the other needs a small
conflict resolution in __irq_exit_rcu().

Changes since v1:

  - Use bare DECLARE_TRACE() tracepoints instead of trace events
    (Gabriele)
  - Rename the irqentry container to irq (Gabriele)
  - Add text schematics of both models to the documentation (Gabriele)
  - Document why irqstate and irqexit are separate automata
  - Rebase onto v7.4-rc1

Testing on v7.4-rc1 with Clang 23.1.5, GCC 14.2 (x86) and GCC 16.2
(cross), and QEMU 10.0 TCG, with lockdep and the locking selftests:

  - Each patch builds with W=1 on x86_64 without new warnings.
    RV_MONITORS_KUNIT_TEST=m builds on x86_64 and arm64. kernel-doc
    reports no warnings for the changed headers.
  - The rv_mon KUnit suite and the reactor suites passed without
    failures on:

      x86_64   PREEMPT SMP4 and UP, PREEMPT with nohz_full=1-3 and
               threadirqs, PREEMPT_RT SMP4, PREEMPT_RT SMP8 with
               nohz_full=1-3
      arm64    PREEMPT, PREEMPT with nohz_full=1-3 and threadirqs,
               PREEMPT_RT, PREEMPT_RT SMP8 with nohz_full=1-3
      riscv64  PREEMPT
      ARMv7    UP

    Each configuration ran 13 to 21 of the 29 rv_mon cases. The others
    are skipped because they need a different configuration.
  - RV=n kernels boot on x86_64 and arm64.
  - On top of the early-hardirq series, the same suites passed on
    x86_64 (PREEMPT, PREEMPT_RT), arm64 (PREEMPT, PREEMPT_RT) and
    riscv64.

An LLM assisted with the patches and the testing.

v1: https://lore.kernel.org/all/20261022050712.75035-1-kmehltretter@gmail.com/

[1] https://lore.kernel.org/all/FACA54EC-F846-4051-9ADD-DB46E7665FAD@redhat.com/
[2] https://lore.kernel.org/all/20261028033127.82193-1-kmehltretter@gmail.com/

Karl Mehltretter (9):
  tracing/irq: Add generic IRQ context boundary tracepoints
  tracing/sched: Add IRQ preemption lifecycle tracepoints
  rv: Add a monitor for generic IRQ context transitions
  rv: Add a monitor for IRQ-exit scheduling ownership
  docs/rv: Document the IRQ monitors
  rv: Add KUnit coverage for IRQ context transitions
  rv: Add KUnit coverage for IRQ-exit scheduling
  rv: Test empty PREEMPT_RT softirq worker intervals
  rv: Test IRQ-exit softirq provenance and handoff

 Documentation/trace/rv/index.rst              |    1 +
 Documentation/trace/rv/monitor_irq.rst        |  475 ++++
 include/linux/interrupt.h                     |    8 +
 include/rv/kunit.h                            |   34 +-
 include/trace/events/irq.h                    |   56 +
 include/trace/events/sched.h                  |   26 +
 kernel/sched/core.c                           |    6 +
 kernel/softirq.c                              |  324 ++-
 kernel/trace/rv/Kconfig                       |   11 +-
 kernel/trace/rv/Makefile                      |    3 +
 kernel/trace/rv/monitors/irq/Kconfig          |   13 +
 kernel/trace/rv/monitors/irq/irq.c            |   35 +
 kernel/trace/rv/monitors/irq/irq.h            |    3 +
 kernel/trace/rv/monitors/irqexit/Kconfig      |   14 +
 kernel/trace/rv/monitors/irqexit/irqexit.c    |  172 ++
 kernel/trace/rv/monitors/irqexit/irqexit.h    |   85 +
 .../trace/rv/monitors/irqexit/irqexit_kunit.c |  540 ++++
 .../trace/rv/monitors/irqexit/irqexit_kunit.h |   21 +
 .../trace/rv/monitors/irqexit/irqexit_trace.h |   19 +
 kernel/trace/rv/monitors/irqstate/Kconfig     |   14 +
 kernel/trace/rv/monitors/irqstate/irqstate.c  |  289 ++
 kernel/trace/rv/monitors/irqstate/irqstate.h  |  139 +
 .../rv/monitors/irqstate/irqstate_kunit.c     | 2339 +++++++++++++++++
 .../rv/monitors/irqstate/irqstate_kunit.h     |   25 +
 .../rv/monitors/irqstate/irqstate_trace.h     |   15 +
 kernel/trace/rv/rv_monitors_test.c            |   30 +
 kernel/trace/rv/rv_trace.h                    |    2 +
 tools/verification/models/irq/irqexit.dot     |   21 +
 tools/verification/models/irq/irqstate.dot    |   32 +
 29 files changed, 4737 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/trace/rv/monitor_irq.rst
 create mode 100644 kernel/trace/rv/monitors/irq/Kconfig
 create mode 100644 kernel/trace/rv/monitors/irq/irq.c
 create mode 100644 kernel/trace/rv/monitors/irq/irq.h
 create mode 100644 kernel/trace/rv/monitors/irqexit/Kconfig
 create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit.c
 create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit.h
 create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit_kunit.c
 create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit_kunit.h
 create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit_trace.h
 create mode 100644 kernel/trace/rv/monitors/irqstate/Kconfig
 create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate.c
 create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate.h
 create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate_kunit.c
 create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate_kunit.h
 create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate_trace.h
 create mode 100644 tools/verification/models/irq/irqexit.dot
 create mode 100644 tools/verification/models/irq/irqstate.dot


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.39.5 (Apple Git-154)

