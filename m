Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64C3B0587;
	Sun, 20 Sep 2026 02:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789870860; cv=none; b=hnUTQK+gqO/g0GglUoTQz+oXpUVh17pBb7riX36VAFo7hqY6h74YpuLi/Mf2elpJATzqTHKEvcjh9+sVRGdyJoHFGl6qTA/aPNCxhLpFch0atfcERC/JzSRAWfuLhwBhIi3VI+AVFwlflLvwdTyavhHm6o2QPOoVMCaYGhzhGjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789870860; c=relaxed/simple;
	bh=v2tFFUZacAIDE07ELsxx+Z022t6A/gmR+6MWb1i2Yy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A4mieQOI/UxVwcEFxObajV/N2DeqrloVcXC0EIULt5DKYbLhGxTKXIZFiVGppVVXnCB36UoAHPnxYW4kR0a8F//eVF8An651rrd+zLYbpw3fOtgCpTubeW6jAP6CwyeRiUkQ39kl+kk354mzxhqNRBdwIuuCVidhjtFVmCsvovI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iw1zHT3C; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iw1zHT3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dJ
	olkrAP2de5xkNFpX13adY2hQYvUnJwPkyjePIpKEY=; b=iw1zHT3C38Ekt6NKz4
	3UGBZaAchNXc/SmWOoWS2B6YskI7vrLxWZuWPLeybdJbKppNEWE1PpUXUUurLtr/
	scNlcDX9CGBieJdDw58FF4KefnuoArED3Pyk0QluYn0dr7LQUss4PCAne9WeyxWN
	YrNER7KGk5Lt13df1H90bU/O4=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wB3U9PTQq9qg1hLBw--.56923S2;
	Sun, 20 Sep 2026 10:20:05 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com
Subject: [PATCH 1/2] sched/doc: add a preemption model overview
Date: Sun, 20 Sep 2026 10:20:02 +0800
Message-ID: <20260920022003.1202546-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3U9PTQq9qg1hLBw--.56923S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKrWrKF47uF1rKrWkZFyDAwb_yoW3XryDpF
	Z0qrWfXws3J340kryxAw18XryrZ3WxAa1xGrykJry5Awn8Xa4jyr4Utr1aqryUCr18ZFWF
	qrs5X3y2kw1jyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piaiixUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbDABZMwWqvQtZvGwAA3+

The scheduler documentation describes the individual scheduling classes
and various tuning knobs, but there is nothing that describes the
preemption models themselves.  The only place where they are documented
is the kernel-parameters entry for "preempt=", which explains the boot
time parameter but not the models it selects.

Add Documentation/scheduler/sched-preemption.rst, covering the four
models, which of them can be selected at runtime, and the mechanism
behind PREEMPT_LAZY.  The lazy model in particular is easy to
misunderstand: a lazy reschedule does not send a cross-CPU reschedule
IPI, so it is only committed on the return to user space or on the next
tick.  That makes the tick an upper bound on lazy preemption latency,
and it means the usual real-time latency tools, which wake a pinned
task on its own CPU, do not exercise it at all.

Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
 Documentation/scheduler/index.rst            |   1 +
 Documentation/scheduler/sched-preemption.rst | 120 +++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 Documentation/scheduler/sched-preemption.rst

diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 17ce8d76befc..d6d75421756a 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -23,5 +23,6 @@ Scheduler
     sched-stats
     sched-ext
     sched-debug
+    sched-preemption
 
     text_files
diff --git a/Documentation/scheduler/sched-preemption.rst b/Documentation/scheduler/sched-preemption.rst
new file mode 100644
index 000000000000..fc6fd89789cf
--- /dev/null
+++ b/Documentation/scheduler/sched-preemption.rst
@@ -0,0 +1,120 @@
+=====================
+Scheduler preemption
+=====================
+
+The kernel can be built to run kernel code either uninterruptibly, or with
+varying degrees of preemptibility.  These are the *preemption models*.
+
+When CONFIG_PREEMPT_DYNAMIC is enabled the preemption model can additionally
+be selected at boot time with the ``preempt=`` command line parameter, without
+rebuilding the kernel.  See
+Documentation/admin-guide/kernel-parameters.txt for the parameter itself.
+
+The models selectable at runtime are:
+
+	=========	====================================================
+	none		No preemption of kernel code other than at explicit
+			``cond_resched()`` / blocking points.
+	voluntary	As ``none``, plus ``might_sleep()`` sites.
+	full		Any section that is not explicitly preempt disabled
+			may be preempted at any time.  Tasks also yield
+			contended spinlocks.
+	lazy		As ``full``, except that a reschedule requested by
+			the fair scheduler does not interrupt the target
+			CPU.  It is committed at the next return to user
+			space or at the next tick, whichever comes first.
+	=========	====================================================
+
+Not every model is available on every kernel.  On a kernel that selects
+ARCH_HAS_PREEMPT_LAZY, only ``full`` and ``lazy`` are offered and ``none`` and
+``voluntary`` are rejected.  A PREEMPT_RT kernel likewise does not offer
+``none`` or ``voluntary``.
+
+The model that is actually active is reported in the boot log::
+
+	Dynamic Preempt: full
+
+PREEMPT_LAZY
+============
+
+``lazy`` is the interesting one, because its behaviour cannot be understood
+from the "can this be preempted" question alone.
+
+When a wakeup makes a running CFS task preemptible, the fair scheduler calls
+``resched_curr_lazy()``.  With the lazy model inactive that is just
+``resched_curr()``; with ``lazy`` active it sets ``TIF_NEED_RESCHED_LAZY``
+instead of ``TIF_NEED_RESCHED``.  The consequence is in ``__resched_curr()``:
+the cross-CPU reschedule IPI is only sent for ``TIF_NEED_RESCHED``.
+
+A lazy reschedule therefore does *not* interrupt the target CPU.  It is
+committed later, in one of two ways:
+
+1. On the next return to user mode.  ``__exit_to_user_mode_loop()`` treats
+   ``_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY`` as a reschedule request, and
+   ``xfer_to_guest_mode_work()`` does the same for a vCPU returning to guest
+   mode.
+
+2. In ``scheduler_tick()``, which promotes a pending
+   ``TIF_NEED_RESCHED_LAZY`` to a full ``TIF_NEED_RESCHED`` once per tick.
+
+The tick is thus an upper bound on lazy preemption latency for CFS tasks: a
+runnable CFS task that has been passed over is picked up within one tick, not
+immediately.  The tick is guaranteed to run in the case that matters: while
+more than one CFS task is runnable on the CPU, ``sched_can_stop_tick()``
+refuses to stop the tick.  A lazy reschedule aimed at the idle task is promoted
+to a full one instead.
+
+That is the intended trade-off -- it avoids sending an IPI to every CPU that
+has a runnable CFS task -- and it is why ``lazy`` gives up latency in exchange
+for fewer inter-processor interrupts.
+
+The idle task is never delayed: ``__resched_curr()`` promotes a lazy
+reschedule to a full one when the target is the idle task.
+
+Only the fair scheduler issues lazy reschedules.  RT and deadline tasks are
+still preempted immediately.  ``lazy`` is therefore not a replacement for
+PREEMPT_RT; it is a way to keep most of the responsiveness of ``full`` while
+removing a large part of its IPI traffic.
+
+Debugging
+=========
+
+The scheduler debugfs directory provides ``/sys/kernel/debug/sched/preempt``,
+which lists the models that may be switched to; the active one is enclosed in
+parentheses::
+
+	# cat /sys/kernel/debug/sched/preempt
+	full (lazy)
+
+Writing a model name to the file switches to it.  A name that the kernel
+cannot select (either because the model is not built in, or because it is not
+available on this kernel) is rejected with EINVAL.  The ``preempt=``
+boot parameter rejects such a value as well, but only prints an ``unsupported
+mode`` warning and keeps the default model.
+
+Measuring
+=========
+
+Two things routinely trip people up when measuring preemption latency.
+
+First, the classic real-time latency tools do not exercise lazy preemption at
+all.  Lazy only applies to the fair class, so waking a SCHED_FIFO task takes
+``resched_curr()`` and preempts immediately, whichever model is active.  And
+when the woken task runs on the CPU the wakeup happens on, even a fair lazy
+reschedule is committed as soon as that CPU returns to user mode, which for an
+already runnable task is immediate.  For both reasons such workloads measure
+the same under ``lazy`` and ``full``.
+
+The difference only shows up when the woken task is *not* running on the CPU
+where the wakeup happens.  In that case the waker requests the reschedule, and
+under ``lazy`` that request is not turned into an IPI; the target CPU only
+notices at its next tick.  A measurement that cannot distinguish ``none`` from
+``full`` is usually not measuring the preemption model at all: in the absence
+of ``lazy``, the reschedule IPI is sent regardless of the model and provides a
+preemption point even on PREEMPT_NONE.
+
+Second, when driving cross-CPU wakeups from a periodic source, keep the wakeup
+period away from integer multiples of the tick.  A period that is phase-locked
+to the tick will hide (or invent) exactly the effect that is being measured.
+Add jitter to the wakeup period, and confirm the active model from the
+``Dynamic Preempt:`` line rather than assuming that ``preempt=`` took effect.
-- 
2.43.0

