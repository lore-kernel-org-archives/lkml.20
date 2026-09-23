Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B65E4078F6;
	Wed, 23 Sep 2026 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152822; cv=none; b=C3IA0Ku797CZMHCW41p3puIBWf8iHSBn4LVbSyQe2eZFJVSPgFoMlvUAPvF04Z5Xz5YRMTOKz5TO9P/tLjOlAuajxY7wo6OXLwZDSqFn3EHVdLg4GT+U6GxS4KNtJMES1+iYnVvhcnKE0Y7l/+1Zbsq4t4yBgDZk4qfykTLKBxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152822; c=relaxed/simple;
	bh=WDmVMBxNtZoqe8B1iJFztvVeVay/oqxzqi46bPUBE9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KLF31dXIQE8l7C3IJA/w5i9WFP13tzC1ahqSkiSlqGOHC9OS7ApZBX9+JpFfaiJXVvSw0xMcJBzD0fxYTgKh1Pri5eEN5eKj3EPm1Cof8lUdCSMkElvAdi9PlYpm/qa1GuSNT6/k/1uw1gUKAeDTM/9GaG01CCln17khBgEeKu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jkqJqA/1; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jkqJqA/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=XZ
	E+QkUAmkoyVN+fmkTGlzh4BaCq0E2Vg5USuy/CD+4=; b=jkqJqA/1+UY15+VjNw
	lqq30kx/5WsYuYWSV5IGOlO9iHaohs4rAu4pmYe1E5tM7PsggPJdVKV6Qthkmx0q
	QoW5lzJlgVAHSkqqdxCvFepl3qkrD0jCYyon6dmIFcDaQ5sg1staua3U4pS9DGRQ
	R+CWrwZd70bljY5ZlPtyN9eDU=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDXX4EwkLNqftBNAQ--.59852S2;
	Wed, 23 Sep 2026 16:39:13 +0800 (CST)
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
Subject: [PATCH v4 1/2] sched/doc: add a preemption model overview
Date: Wed, 23 Sep 2026 16:39:02 +0800
Message-ID: <20260923083903.616271-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXX4EwkLNqftBNAQ--.59852S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKrW7XF1rCr1DXr43GFy8Xwb_yoW7tF47pr
	Z8XrWfJws3J348KryxZw1xXryrZ3Z7JF4ftryktry5Awn8WF1jyr12yr12qF1UCr1Sva43
	ZrsYqw42kw1vyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pitEf5UUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC4xK3LWqzkDIGbAAA36

The scheduler documentation describes the individual scheduling classes
and various tuning knobs, but there is nothing that describes the
preemption models themselves.  The only place where they are documented
is the kernel-parameters entry for "preempt=", which explains the boot
time parameter but not the models it selects.

Add a short overview of the models, what separates them, which of them a
given kernel offers, and how a scheduling request is honoured under each.

Assisted-by: LLM
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
Changes in v4:
- No change to the diff. Re-sent because the second patch changed.

Changes in v3:
- Spell out what "such a call" referred to. It meant cond_resched(), and
  the wording did not make that obvious. Requested by Sebastian. The
  Reviewed-by is kept because only this paragraph changed.

Changes in v2:
- Reword the entries so that they describe the model rather than the
  boot parameter.
---
 Documentation/scheduler/index.rst            |  1 +
 Documentation/scheduler/sched-preemption.rst | 85 ++++++++++++++++++++
 2 files changed, 86 insertions(+)
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
index 000000000000..bfa22559c29b
--- /dev/null
+++ b/Documentation/scheduler/sched-preemption.rst
@@ -0,0 +1,85 @@
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
+	a ``cond_resched()``-style scheduling point as well, through
+	``might_sleep()``.
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

