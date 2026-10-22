Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792645664;
	b=B+3Cz5Cty9Oxego1M4LaHuunzD1gTGiKulmipAuta2WpQ5WgEt2HqqLk0H96ZSDCMDE/
	 KrRfk8Uasb5kj2/PKuHntl5yry8o+k21X0Bg+K6zKMP85BZGh4pVTq0WqoMAiJGd+DXKp
	 zQIVwJJ/RxGFbjpcv+6jC5djNvXiU7m5BP7UlKLdfJjsaYqtpmMINikf2aEhEXs19L9Um
	 VZDBV38/03tXcojqdwDQzBDM0tzQVN9TSW8LXZq94UShvBIjZDE/3ddNqkA9ATR3mE8RR
	 gXW6QPfyIM0Cpm9EGBi5jCdRJ3JiFD/ZGkVZI+/uIQf7L3b2Tm387nJyQybyqk29ccg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792645664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Sgg+G8XeM2PfG9AtbRKOTPbh1eb2lzeKqqM4m/533Ag=;
	b=wZKYp2JuDwgUAv7oxopvc+vEdddMEk5Kvd0/oLs28ZmL4LdTM+oweskqS4M9AnTnl8dm
	 xJd6HBxsvRnMQTQWp28BwiZLxdHOSWblgfxFEOzMGhHz5OJuYyBscgi4OIilNvwz9u28h
	 v6YmaK4Tp0YJF0G00hDTlml9AYGDTcah+QkAgzm5CXbW3z2AuN+MtcJqsibaW6czQgQY6
	 wx1I8FEpZzj5CCLYDDzrHCOyEKNIbtJG1RZE4UVabETjHTwdwYXXb0clYvu9MVibpQ4Ch
	 zObRnb4ICfA2l9+KpXAYpAmsD8r0MtplrdN+/Qfp5oeTLbER+/VRw38MPReOzvV8w9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l85Qwa9+;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB33606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB33606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l85Qwa9+
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dee593f18so1118121f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792645661; x=1793250461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sgg+G8XeM2PfG9AtbRKOTPbh1eb2lzeKqqM4m/533Ag=;
        b=l85Qwa9+spqQeCliClaktgAKW1w1lKYu+A5yFZL0kPGxM5s6EykghBPtvvF7/Obsd+
         67htLKDIG+NDMNT8zQRG5HOZUoAZrT8hkJln01n6gSkWqlOKbAD2/NHHy/dUWZE3+zoM
         AmxqW3xCu52Ojtzcs4o03ppsXejnWxq7An1iwXPMgi9sFvHEJarkXnpLVWaIhaR+Omt5
         T8jp49doQp3DLpzwQ+is1IOvsi6DvBVElHEcegz/8UWDiF2+2swUB0UNnm8S6Bw0/13y
         JAWK9blfIg3ZQozELksHwolu4reAjS4dtKCpb/MN+mVwMnysXuaEhyAFizOTPO/jn4ev
         rTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792645661; x=1793250461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sgg+G8XeM2PfG9AtbRKOTPbh1eb2lzeKqqM4m/533Ag=;
        b=23rGDHTTk+wqjJDWtQUarP0hAaSBuLYoosy98xAmh5uHIhUlNeUWhXyqA6AoHm8n9A
         UfwJMKT1JjMNcQCCBpSMqW5PkRqx0GEnXmfw9FN4ph8dcIMKtqj7xVk8OU/jgPL0TVqS
         PfVd2MxmSX89OMoKP+1bRi2aB1/nIWgKOXvRyvhHoMTI3T6kGC+f0Nyh1CTjaPRwKmsv
         ZDruEHp22DMpFLnfUmKq3bNFl8yMv7WYc5SrjQFyHyPqPvgSfhJyntkvI9/EkiVCTL0n
         gyyCj0ImyvUT28jRG0p7qvQaeiMwwUVwlXi3yttiodmBABvEtwjykqoKefAw1+eyQ99M
         r5JQ==
X-Forwarded-Encrypted: i=1; AKwUvBwc1/ZpDLaQRVJ4/ahqVAEfb60VWXgn4IS3C0R6yOk9SQtSpVOotT99kYkXXlPKca1Qo0Pp3G6HxBOONO0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQuBcxC8EO4qrMNv9VYvMMVPKYcwYgQZfOQde8sVitS7Xg0qVQ
	KQMvytWn5w8Fqi3WdbJz8QM1XIYpgYyXWrCkwVdzqMmXJ9cDoqWky/MW
X-Gm-Gg: AYBFou2yr2wDXRPjXLpv7APQvu/5DAKShznS7fIj7Y2LRJctVPnfVCV0MCwGxCSELuE
	Viemej6UjANL3fONWOZAuN7t5oxx3i2LqJVX5mDqBTsi9qeUXu5X/uhwmOf4PETKUd/E+DUMs/F
	mvfNP9d/q7wZALfjYVMQTQsbRgHo88fSQS4138B8EJQE9JYkZ1sjdZUcvqo+jA4aWrL9r1nZFEM
	9VqHakVTf6QCOyE4ap3Q3pfXaBL972OCaYT6fSvfvBONT71GUSKtiT42uGmYjlIR92jgaz0nqpV
	dgiS3hFs2wkfN9/0g7QsPfXtvNMsgCffjhtFW4n4jEwZGsL5yejwKi2F4wGe3vBHQz7PZaQhtJ0
	9TS9P06P8KNGSgoALci2oGumqSd1UoQX5gEd7SUKRHmA6dWAQQiKrBx5R+mJBwj1/TrvuXZyjTv
	qpGr80LPU37J7yacvoSHD7BeS9jV9F3h/1QPwZDRghm/Fm7Kz0SzHvqktLBp3Ht7mYHLZC5eGKC
	EZKj/9kVRlFNgpZCdZ2ooMXTx7Ve0BH8Ca3lqgahDLhzG5+aXZMmZyH+F4OIHw8d+M6jDXPgZxc
	jyQyib2wEWVgjSoxirdnFOHiy/yWUYIUMqB4KdQJWMrxociEg1+Jn89MpP83Q3PFzx+EllxX8bq
	Z5NwinhqG8h84ria9AbArUebWTw3UZ4ddidTc9yEAB97Jz3rUrypue0Hzh3E=
X-Received: by 2002:a05:6000:1801:b0:48c:7387:6b88 with SMTP id ffacd0b85a97d-48e264cb7abmr5434419f8f.37.1792645661144;
        Wed, 21 Oct 2026 22:07:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254eeef6sm9994979f8f.8.2026.10.21.22.07.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:07:39 -0700 (PDT)
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
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 5/9] docs/rv: Document the IRQ-entry monitors
Date: Thu, 22 Oct 2026 07:07:08 +0200
Message-Id: <20261022050712.75035-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022050712.75035-1-kmehltretter@gmail.com>
References: <20261022050712.75035-1-kmehltretter@gmail.com>
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

Document the irqstate and irqexit models, their synchronization rules,
PREEMPT_RT behavior, tracefs interface, and coverage limits.

irqstate observes hardirq contexts whose boundaries pass through
irq_enter() or irq_enter_rcu() and irq_exit() or irq_exit_rcu(). Direct
__irq_enter() and __irq_exit() users, raw-only paths, and
architecture-specific intervals before generic entry and after generic
exit remain outside its coverage.

Clarify that irqexit monitors preempt_schedule_irq(), not the complete
interrupt-return path.

Assisted-by: LLM
---
 Documentation/trace/rv/index.rst            |   1 +
 Documentation/trace/rv/monitor_irqentry.rst | 279 ++++++++++++++++++++
 2 files changed, 280 insertions(+)
 create mode 100644 Documentation/trace/rv/monitor_irqentry.rst

diff --git a/Documentation/trace/rv/index.rst b/Documentation/trace/rv/index.rst
index 29769f06bb0f0..6b0c7db790786 100644
--- a/Documentation/trace/rv/index.rst
+++ b/Documentation/trace/rv/index.rst
@@ -15,6 +15,7 @@ Runtime Verification
    monitor_wip.rst
    monitor_wwnr.rst
    monitor_sched.rst
+   monitor_irqentry.rst
    monitor_rtapp.rst
    monitor_stall.rst
    monitor_deadline.rst
diff --git a/Documentation/trace/rv/monitor_irqentry.rst b/Documentation/trace/rv/monitor_irqentry.rst
new file mode 100644
index 0000000000000..f2bb9ed2c0029
--- /dev/null
+++ b/Documentation/trace/rv/monitor_irqentry.rst
@@ -0,0 +1,279 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+IRQ-entry monitors
+==================
+
+- Name: irqentry
+- Type: container for IRQ-entry context monitors
+- Author: Karl Mehltretter <kmehltretter@gmail.com>
+
+Description
+-----------
+
+The ``irqentry`` container groups monitors which compare interrupt-related
+events with the execution context recorded by the kernel.  The monitors are
+architecture independent: they consume generic tracepoints and do not require
+an architecture assembly hook.
+
+The first monitor deliberately observes only safe, instrumentable events.  It
+does not cover the interval between physical interrupt entry and establishment
+of generic hardirq state.
+
+Monitor irqstate
+----------------
+
+The ``irqstate`` monitor checks the ordering of hardirq contexts whose entry
+and exit pass through ``irq_enter()``/``irq_exit()`` or
+``irq_enter_rcu()``/``irq_exit_rcu()``, and of complete serving-softirq
+contexts. Each boundary must agree with the corresponding preempt-count state:
+
+.. list-table:: Event and required context
+   :header-rows: 1
+
+   * - Kernel event
+     - Model event
+     - Required environment
+   * - ``hardirq_context_entry``
+     - ``hardirq_entry``
+     - ``hardirq > 0``; serving-softirq state selects the source state
+   * - ``hardirq_context_exit``
+     - ``hardirq_exit``
+     - ``hardirq > 0``; serving-softirq state selects the destination state
+   * - ``softirq_context_entry``
+     - ``softirq_entry`` or ``softirq_entry_from_hardirq``
+     - ``hardirq == 0 && serving_softirq == 1``
+   * - ``softirq_context_exit``
+     - ``softirq_exit`` or ``softirq_exit_to_hardirq``
+     - ``hardirq == 0 && serving_softirq == 1``
+   * - ``sched_switch`` from a serving-softirq task (PREEMPT_RT)
+     - ``softirq_suspend``
+     - ``hardirq == 0``
+   * - ``sched_switch`` to a serving-softirq task (PREEMPT_RT)
+     - ``softirq_resume``
+     - ``hardirq == 0``
+
+``serving_softirq`` uses ``in_serving_softirq()``.  It therefore distinguishes
+a serving-softirq interval from a task which merely disabled bottom halves.
+The hardirq condition uses the hardirq component of ``preempt_count``.
+Softirq events also report whether hardirq state was replaced for inline
+processing during interrupt return. The exit event reports whether hardirq
+state will be restored.
+
+On PREEMPT_RT the serving interval includes preparation before
+``handle_softirqs()`` and teardown after it, not just handler execution or
+CPU-time accounting. A worker can enter and leave this context even if its
+pending-work check finds nothing. The RT entry event follows the counter
+update that sets the serving bit, and the exit event precedes the update
+that clears it. Processing inline from ``local_bh_enable()`` has the same
+boundaries; ordinary BH-disable nesting does not emit context events.
+
+RT worker entry acquires any blocking BH lock before the counter update.
+When the entry tracepoint is enabled, the update and event execute together
+with local IRQs disabled, then restore the original IRQ state. No new IRQ
+disable/enable pair is introduced when that tracepoint is disabled. RT
+decrements already execute with IRQs disabled. Non-RT retains its existing
+IRQ-disabled processing-loop boundaries.
+
+The model has six states: ``idle``, ``in_hardirq``, ``in_softirq``,
+``hardirq_from_softirq``, ``softirq_from_hardirq``, and
+``hardirq_from_softirq_from_hardirq``. It accepts these outer-context
+sequences::
+
+  idle -> in_hardirq -> idle
+  idle -> in_softirq -> idle
+  in_softirq -> hardirq_from_softirq -> in_softirq
+  in_hardirq -> softirq_from_hardirq -> in_hardirq
+  softirq_from_hardirq -> hardirq_from_softirq_from_hardirq
+                        -> softirq_from_hardirq
+
+The fourth sequence represents non-RT softirq processing during interrupt
+return. The kernel replaces ``HARDIRQ_OFFSET`` with ``SOFTIRQ_OFFSET`` while
+the handlers run, then restores hardirq state before completing interrupt
+exit. The fifth sequence represents a nested hardirq during those handlers.
+
+On PREEMPT_RT, serving-softirq state is task-local and the serving interval is
+preemptible.  A switch away from that task suspends its CPU context
+(``in_softirq -> idle``); a switch back resumes it (``idle -> in_softirq``).
+The adapter reads the outgoing and incoming task's softirq count at
+``sched_switch``.  Interrupts are disabled there, so no hardirq boundary can
+occur between representing the incoming task and the actual context switch.
+A hardirq in a task which preempted a softirq therefore starts in ``idle``.
+
+Hardirq depth greater than one is collapsed into the surrounding hardirq
+state.  The depth comes from the existing hardirq component, so the monitor
+does not maintain a second counter which could wrap independently.
+
+The boundary events run after entry state has been established and before it
+is removed.  A false transition or guard invokes the selected RV reactor and
+emits the monitor's error trace event.
+
+On hardirq exit, ``hardirq_context_exit`` runs immediately before removal of
+``HARDIRQ_OFFSET``. Hardirq accounting ends earlier, before inline softirq and
+tick-exit work. ``irqstate`` returns to the outer model state at the final
+boundary event. The event does not represent return from ``irq_exit_rcu()``,
+the later reschedule check, or the architecture return tail.
+
+Hardirq accounting and lockdep hardirq state have separate lifetimes. Lockdep
+can also create a synthetic hardirq interval without changing
+``HARDIRQ_OFFSET``. ``irqstate`` models the preempt-count context and does not
+report those lockdep-only intervals.
+
+Synchronization
+---------------
+
+Enabling a per-CPU monitor does not imply that the CPU is in task context.
+An outer hardirq or softirq entry from a known idle context starts the model
+and consumes the event. An outer exit can instead establish the idle state
+without consuming an unmatched event when monitoring starts in the middle of
+that context. Provenance-marked softirq boundaries do not start monitoring:
+they belong to an enclosing hardirq. If attachment occurs during that
+sequence, its final hardirq exit establishes ``idle``. If monitoring starts
+while a hardirq interrupts an ordinary softirq, the hardirq pair is ignored
+until the enclosing softirq exit establishes the idle state. On PREEMPT_RT, a
+softirq suspension also establishes ``idle``, and a resumption can start
+monitoring directly in ``in_softirq``.
+
+On PREEMPT_RT, probe attachment waits for an RCU grace period before the
+monitor can become enabled. This drains BH preparations which sampled the
+entry tracepoint disabled before attachment. Otherwise an intervening IRQ
+could synchronize the model to idle before a preparation publishes its
+serving bit without an entry event. New preparations see the attached
+entry probe and serialize the bit update with their event.
+
+Monitor irqexit
+---------------
+
+The ``irqexit`` monitor follows each task's invocation of
+``preempt_schedule_irq()``. It consumes ``sched_irq_preempt_entry``,
+``sched_irq_preempt_exit``, and ``sched_switch``. Both boundary events must
+observe zero hardirq count and disabled local interrupts. The owner saved
+in the invocation's stack frame must match the current task at both
+boundaries.
+
+The boundary records carry preempt-count and interrupt-state snapshots
+taken at the scheduler call site, before tracepoint dispatch or ring-buffer
+reservation. Sampling in ``TP_fast_assign`` would instead include tracing's
+own context changes. Disabled hooks do not take these extra snapshots.
+The RV adapter still evaluates its original live-context guards; the raw
+record is an independent diagnostic channel, not a replacement verdict.
+
+The model has three states: ``idle``, ``rescheduling``, and ``suspended``.
+Entry changes ``idle`` to ``rescheduling``; return changes it back to
+``idle``. Switching out an active invocation changes ``rescheduling`` to
+``suspended``; switching that task in resumes ``rescheduling``. The
+incoming event cannot require its target to be current: ``sched_switch``
+still executes in the outgoing task. Local interrupts remain disabled
+until the incoming task runs.
+
+Instances belong to tasks, not CPUs. Two tasks may have independently
+suspended invocations, and resuming on another CPU must use the same task's
+instance. An interrupt or IRQ-exit schedule in another task cannot return
+on behalf of the suspended owner. Ordinary switches while ``idle`` do not
+change its state.
+
+An entry starts monitoring and consumes the event. If the monitor was
+enabled during an existing invocation, its first valid exit instead
+establishes ``idle`` without consuming an unmatched event. Switches alone
+do not synchronize a task. An exit with an invalid context or owner must
+not be skipped as a synchronization event.
+
+The helper can also run on a kernel exception return. Its events therefore
+do not prove that an invocation followed a physical interrupt, and they do
+not describe architecture register restoration or context tracking after
+the helper returns. The existing helper entry assertions can reject an
+invalid caller before the entry event; such a failure is not a violation
+detected by this monitor.
+
+``irqexit`` does not associate an invocation with a preceding hardirq. It
+cannot observe work between ``hardirq_context_exit`` and the helper entry or
+between the helper exit and return to the interrupted context.
+
+Relationship to sched/sts
+-------------------------
+
+The scheduler ``sts`` monitor models the ordering of IRQ disable/enable,
+scheduler entry/exit, and task switches.  It uses ``irq_handler_entry`` and
+selected x86 vector events to refine that scheduler model.
+
+``irqstate`` does not consume IRQ action or scheduler entry/exit events.  It
+observes generic context boundaries, so multiple actions in one interrupt and
+an action dispatched through ``generic_handle_irq_safe()`` do not change its
+state.  On PREEMPT_RT it uses task switches only to follow the active softirq
+context. ``irqexit`` observes the surrounding IRQ-preemption loop and its
+task owner, rather than inferring that protocol from individual scheduler
+entry/exit events used by ``sts``.
+
+.. list-table:: Monitor coverage
+   :header-rows: 1
+
+   * - Property or event
+     - ``sched/sts``
+     - ``irqentry/irqstate``
+   * - IRQ disable and enable ordering
+     - yes
+     - no
+   * - IRQ action entry
+     - yes
+     - no
+   * - scheduler entry and exit
+     - yes
+     - no
+   * - task switch
+     - yes
+     - PREEMPT_RT softirq context only
+   * - ``irq_enter[_rcu]()``/``irq_exit[_rcu]()`` hardirq context
+     - no
+     - yes
+   * - complete serving-softirq context
+     - no
+     - yes
+   * - hardirq interruption of a softirq
+     - no
+     - yes
+
+Coverage limits
+---------------
+
+The context tracepoints are emitted by ``irq_enter_rcu()`` and
+``irq_exit_rcu()``. Softirq boundaries come from the RT serving-bit updates
+or the non-RT generic processing loop. Consequently this monitor cannot
+observe:
+
+- the early architecture entry interval before ``irq_enter_rcu()``;
+- paths which directly use ``__irq_enter()`` and ``__irq_exit()``, such as
+  the arm64 APEI SEA irq-work interval;
+- architecture or special-vector paths which use only
+  ``__irq_enter_raw()`` and ``__irq_exit_raw()`` (including x86 simple system
+  vectors);
+- NMI entry and exit; or
+- work after hardirq-count removal, return from ``irq_exit_rcu()``, the
+  conditional reschedule check, and architecture-specific state restoration.
+
+``irqexit`` checks ``preempt_schedule_irq()`` separately. It does not join
+that helper to the preceding ``irqstate`` instance or model an architecture's
+entire exit.
+
+The standard hardirq tracepoints describe individual IRQ actions rather than
+physical interrupt boundaries.  They are deliberately not used: synthetic
+dispatch and software resend can execute an action outside hardirq context,
+and one interrupt can execute several actions.
+
+These limitations are intentional.  A later architecture hook may provide a
+deferred raw-entry marker for the very-early interval.  Such an addition needs
+a separate event contract and does not change the meaning of ``irqstate``.
+
+Enabling the monitor
+--------------------
+
+With tracefs mounted at ``/sys/kernel/tracing``::
+
+  # cd /sys/kernel/tracing/rv
+  # grep -x irqentry:irqstate available_monitors
+  # echo irqstate > enabled_monitors
+  # echo irqexit >> enabled_monitors
+  # echo nop > monitors/irqentry/irqstate/reactors
+  # echo nop > monitors/irqentry/irqexit/reactors
+
+Use the ``nop`` reactor during initial qualification.  Select the ``panic``
+reactor only after unexplained violations have been excluded on the target
+configuration.
-- 
2.39.5 (Apple Git-154)

