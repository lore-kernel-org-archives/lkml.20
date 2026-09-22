Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2500043C043;
	Tue, 22 Sep 2026 08:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065926; cv=none; b=uYjKSs/8Jf+dr2TL9uksngEsXOVuOarc9QV0WDvdF08BX0xVbS+itzzLX+2EeMZxX5poc0o8hrjAR+NYRy/pywn71J0y8GE24/qpGvwu517wxExaYn81qYXb1tBPrdLvuS7OXgTA466HeSwEaN8UnIVgh6gR09wm9exvYejMMuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065926; c=relaxed/simple;
	bh=yel+Y5OeV/AyONm8qT3l/yT2HVqRmCiVNN1vENnh6gM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UOBiv/f5qHenxCL+DiZib/N/UA4NgyItfTY3uneeHuCuV6t2cmfsuU/ZreHCYgZGHwUhTrK5Ss+g8DPO47xT22GqAMkDups0Hek4GYZ2A3drxoRyeHCnWLXa2TIGJHpFV5rRqTrCU1qO38k9xg7lkvIIdli0Jb9jgG4e9z0X57c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jlmM0Xq/; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jlmM0Xq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ug
	akWYgqFTy9hncCii5MOyfniW4YObHyDkAqm2Qj3t0=; b=jlmM0Xq/dlqcg9TSyV
	jYgRzBSqZkjjTVtFRR/jpEGlmaVdoAnbOnVOENO3fVSmgOj5VbSm1ZVbf3hv9Bdv
	01MF6bNLp/RLOizOX1q+orsWOrTd6S34GlyfICujD0uO5tkGEc74YrDcBvrcFfkQ
	I/en2xS0JUW4JBPF/Drv1Upww=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3137OPLJqg7FaAA--.45299S2;
	Tue, 22 Sep 2026 16:31:11 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com
Subject: [PATCH v2 1/2] sched/doc: add a preemption model overview
Date: Tue, 22 Sep 2026 16:31:00 +0800
Message-ID: <20260922083101.99685-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3137OPLJqg7FaAA--.45299S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKrW7XFyxAFWkGw4fGF4xtFb_yoWxXw4Dpr
	Z0qrWftws3J348KryxZw1xXryrZ397JF4ftryktry5Awn0qr1jyr1Utr12qFyUCr1Fva4a
	vrs5X3y2kr10y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pim9aDUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbDABCKAGqyPNA4rgAA34

The scheduler documentation describes the individual scheduling classes
and various tuning knobs, but there is nothing that describes the
preemption models themselves.  The only place where they are documented
is the kernel-parameters entry for "preempt=", which explains the boot
time parameter but not the models it selects.

Add Documentation/scheduler/sched-preemption.rst, covering the four
models, how a scheduling request is honoured under each of them, and
which of them can be selected at runtime.

The overview follows the scheduling request: a wakeup makes a task
runnable, the scheduler decides what has to leave the CPU and sets
TIF_NEED_RESCHED or TIF_NEED_RESCHED_LAZY on it, and the preemption model
decides where that request is honoured.

Assisted-by: LLM
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---

Changes in v2:
- Rewrite the overview around the scheduling request instead of walking
  through resched_curr_lazy() and scheduler_tick().  Sebastian asked for the
  bird's-eye view; the code-level walkthrough was not an overview.
- Drop the measurement section.  It claimed lazy exists to avoid an IPI to
  every CPU with a runnable CFS task, which is wrong: a cross-CPU wakeup
  targets one CPU.  The point of lazy is run-to-completion, so that in-kernel
  work finishes and every lock is dropped before the CPU is given up.
- Drop the "tasks also yield contended spinlocks" wording from the model
  table; that belongs in kernel-parameters.txt, where it already is.
- Fold the debugfs file into the section on selecting the model at runtime
  instead of giving it a section of its own.
 Documentation/scheduler/index.rst            |  1 +
 Documentation/scheduler/sched-preemption.rst | 84 ++++++++++++++++++++
 2 files changed, 85 insertions(+)
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
index 000000000000..e40c4f5f7476
--- /dev/null
+++ b/Documentation/scheduler/sched-preemption.rst
@@ -0,0 +1,84 @@
+=====================
+Scheduler preemption
+=====================
+
+The kernel can be built to run kernel code either uninterruptibly, or with
+varying degrees of preemptibility.  These are the *preemption models*.
+They apply to kernel code only: a task running in user space is always
+preempted by the scheduler, whichever model is selected.
+
+When CONFIG_PREEMPT_DYNAMIC is enabled the preemption model can additionally
+be selected at boot time with the ``preempt=`` command line parameter, without
+rebuilding the kernel.  See
+Documentation/admin-guide/kernel-parameters.txt for the parameter itself.
+The active model can also be read and changed through
+/sys/kernel/debug/sched/preempt, which exists for debugging purposes and may
+change.
+
+The models selectable at runtime are:
+
+	=========	====================================================
+	none		No preemption of kernel code other than at explicit
+			``cond_resched()`` / blocking points.
+	voluntary	As ``none``, plus ``might_sleep()`` sites.
+	full		Any section that is not explicitly preempt disabled
+			may be preempted at any time.
+	lazy		As ``full``, except that the scheduling request is
+			delayed until the return to user space or the next
+			tick, whichever comes first.  This delay does not
+			apply to real-time tasks.
+	=========	====================================================
+
+Not every model is available on every kernel.  An architecture that provides
+lazy-preempt support offers only ``full`` and ``lazy``, and ``none`` and
+``voluntary`` are rejected there.  A PREEMPT_RT kernel always offers ``full``,
+and ``lazy`` as well if the architecture provides it.
+
+The model that is actually active is reported in the boot log::
+
+	Dynamic Preempt: full
+
+Honouring a scheduling request
+==============================
+
+A wakeup makes a task runnable, and the scheduler then decides whether it
+should run.  If there is an idle CPU which is suitable then the task is moved
+there.  Otherwise the scheduler has to decide which task to preempt, and the
+task that has to leave the CPU gets a reschedule flag.  In the tracing output
+this is the ``need-resched`` column, ``N`` for TIF_NEED_RESCHED and ``l`` for
+TIF_NEED_RESCHED_LAZY.
+
+The kernel then has to honour that request.  A task executing in user space
+can always be preempted; a task executing in kernel space can only be
+preempted where it is safe to do so, and how that is decided is what
+separates the models:
+
+``none``
+	Code paths with long loops contain explicit ``cond_resched()`` calls,
+	which perform the scheduling.
+
+``voluntary``
+	As ``none``, and functions which are known to be able to block gain
+	such a call as well.
+
+``full``
+	Explicit preemption points are no longer involved.  The kernel tracks
+	whether it may be preempted and schedules once the request can be
+	honoured.
+
+``lazy``
+	As ``full``, with one difference: the request the fair scheduler sets
+	is TIF_NEED_RESCHED_LAZY, which is not honoured immediately even where
+	it could be.  It is delayed until the task returns to user space, so
+	that the in-kernel work runs to completion and every lock has been
+	dropped before the CPU is given up.  If the task has not scheduled on
+	its own by then, the request is turned into a full TIF_NEED_RESCHED on
+	the next HZ tick; this is visible as ``B`` in the ``need-resched``
+	column.
+
+Real-time tasks always use TIF_NEED_RESCHED, so the delay above does not
+apply to them.  ``lazy`` is therefore not a replacement for PREEMPT_RT: it
+keeps most of the responsiveness of ``full`` for SCHED_NORMAL tasks while
+letting them run to completion, which avoids leaving a lock behind that
+another task will immediately ask for, and avoids pushing cache-hot data out
+that would have to be pulled back in.
-- 
2.43.0

