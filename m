Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792628083;
	b=BIqlBvgQe1aAr2xLyQGxNB0XbBVHcqkPHKGLcb71p5SQiFZ6liizaTiNt+MZ6vtG53zs
	 U9yyt7gV1fg0XaR+CaqfPkzD+pVjk4Kgus+wic+iWRd2ESug4pIVYDLwLNeB5fkxBugpy
	 pjjAzcO4jgNbiMmukL6sM0RcF1VSye2NFo5/mz88K+fiEMw5K3H2OX8S4IHX4HFkhO3b/
	 sJXyKzEPG4AmxSZDa/2nJ+KnwE9tyBpoObimU76labt9PnDBU8r9NuwKasbWyQWJBMkFs
	 TuzPMo6EHv6gFYUgXKhWuLXsIyhsm4KOQbFjdKw6PxgnufXdnmRq1w1pvn3hbJjEEuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792628083;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Yary2B3+AvkCTWuwyw2FVw6t9AlzkZ33z+KZj4P4Wy0=;
	b=JIfV1zR+QFaxBFbUITyFhnmMkO0z6wuIhUJxIbqxZJXbcAUOHcqrY52np7G8YmN5Ag8E
	 DiuPFgD+3ptTU7l+Kh78GfDl0iMJpSsNwmyKTW4Z5IH7lJTHCFMCgJNijtjbeCtOU1bgV
	 e3oDnNNo0Z3q+0eur7WOo/f+X20H9BvDLUoKRiauo6U7fyC6ZAGM2IeEYTzSU96KR0j1i
	 AtKYFjqmvKSeCrJPVRyP4zg7Bj4Dg5996IasKPJ9/ta7Cp/pInqO2u/ivZcCGpeBnH7DB
	 Ok5VJmovWfiu215oMYdgBbRYpoV/Btaq5ZJi3n89putyatrGb2xZJ0dRRByml6KuI+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ww4foUgB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29003606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ww4foUgB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740471F000C1;
	Thu, 22 Oct 2026 00:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792628082;
	bh=Yary2B3+AvkCTWuwyw2FVw6t9AlzkZ33z+KZj4P4Wy0=;
	h=From:To:Cc:Subject:Date;
	b=Ww4foUgBWkM52NHjL1EZlI/B+ct6M6sez5u3nh8LKFU5Ymci9T6es46mG9EAk/MH2
	 /jAvKsbLgp/1A6i2fuZ3KnMFmHseUtsHtWrcl0hftm4T6pRwdT6HKdDR6KeyYO66V/
	 e/kZaBS0IfBBFub/xyk1usyA/GARVZ5+Jjhr6q0PH/izWbSGQ8LDfMXdmTnmGCfr/3
	 Ngioh4AZojIu+W/hd7rQmU6mGI3zERMLq6l4nSgmclKwYDNVgOpmdJQvw9m7b+X485
	 EOR4EqhtAi/0p/EC2SbNXMjVGsL0rOE39Buc4B0Syy5VJjl0GeTehJrBuZ3qhK1BkV
	 yf+tTsY59yemg==
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, Bradley Morgan <include@grrlz.net>, Kees Cook <kees+treewide@kernel.org>, Masami Hiramatsu (Google) <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] probes: Updates for v7.4
Date: Thu, 22 Oct 2026 09:14:39 +0900
Message-ID: <undine-1792628079992901620-26cbf02f9abd66d6@undined.local>
X-Mailer: UndineD 0.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Probes updates for v7.4:

- kprobes: Asynchronous optprobe optimizer and cleanups
  . Make optprobe optimizer multi-generational and asynchronous: Rework
    the optimizer as a state machine to avoid calling time-consuming
    synchronize_rcu_tasks() while holding kprobe_mutex, text_mutex, and
    cpus_read_lock(). Uses call_rcu_tasks() and a fixed ring of generation
    slots instead, so locks are only held during the brief instruction-
    patching window.
  . Use DEFINE_DEBUGFS_ATTRIBUTE for the kprobes enabled knob: Replace a
    hand-rolled debugfs read/write pair (dating from 2007) with the proper
    DEFINE_DEBUGFS_ATTRIBUTE macro, removing dead code and the stale XXX
    comment.

- tracing/probes: Code quality and documentation cleanups
  . Add const qualifier to new_argv allocation type in trace_probe.c,
    preparing for the type-aware kmalloc_obj allocator conversion.
  . Clarify btf_find_struct_member() container parameter: Rename the
    misleading @member_type parameter to @container_type and add proper
    kernel-doc documentation for all parameters and return values.

- selftests/ftrace: Boot tracing test framework and testcases
  . Add a generic boot tracing test framework under
    tools/testing/selftests/ftrace/boottime/. The test runner builds a
    minimal initramfs with busybox, boots QEMU, and runs tracefs checker
    scripts, supporting bootconfig, kernel command-line options, and
    multi-boot crash/reboot scenarios.
  . Add boot-time tracing testcases: Verify dynamic kprobe, synthetic
    events, eprobe, fprobe, tprobe, and trace instance creation via
    bootconfig.
  . Add kernel cmdline tracing testcases: Verify ftrace, trace_event,
    trace_buf_size, trace_options, trace_clock, and trace_instance kernel
    parameters.
  . Add persistent ring buffer testcases: Verify memory reservation via
    reserve_mem= and trace data retention across guest crash/reboot, as
    well as backup instance creation and boot log preservation.
  . Change non-unique test symbol from name_show to init_once in
    kprobe_non_uniq_symbol.tc for more reliable cross-architecture
    testing.


Please pull the latest probes-v7.4 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
probes-v7.4

Tag SHA1: 81b0103429bc0286c4ea57ba2d496b452f653a44
Head SHA1: d4d028a7ae6401ce70825a3eb663f0a2dfc49db6


Alexander Gordeev (1):
      ftrace/selftests: Change non-unique test symbol to init_once

Bradley Morgan (1):
      kprobes: use DEFINE_DEBUGFS_ATTRIBUTE for the enabled knob

Kees Cook (1):
      tracing/probes: Add const to new_argv allocation type

Masami Hiramatsu (Google) (6):
      selftests/ftrace: Add generic boot tracing test framework
      selftests/ftrace: Add boot-time tracing testcases
      selftests/ftrace: Add kernel cmdline tracing testcases
      selftests/ftrace: Add persistent ring buffer testcases
      kprobes: Make optprobe optimizer multi-generational and asynchronous
      tracing/probes: Clarify btf_find_struct_member() container parameter and add kernel-doc

----
 kernel/kprobes.c                                   | 514 +++++++++++++++------
 kernel/trace/trace_btf.c                           |  34 +-
 kernel/trace/trace_btf.h                           |   2 +-
 kernel/trace/trace_probe.c                         |   8 +-
 tools/testing/selftests/ftrace/Makefile            |   4 +-
 tools/testing/selftests/ftrace/boottime-ktap       |   6 +
 tools/testing/selftests/ftrace/boottime/Makefile   |  10 +
 tools/testing/selftests/ftrace/boottime/README     |  74 +++
 .../ftrace/boottime/bootconfigs/01-kprobe.bconf    |   4 +
 .../ftrace/boottime/bootconfigs/02-synth.bconf     |   4 +
 .../ftrace/boottime/bootconfigs/03-eprobe.bconf    |   4 +
 .../ftrace/boottime/bootconfigs/04-fprobe.bconf    |   4 +
 .../ftrace/boottime/bootconfigs/05-tprobe.bconf    |   4 +
 .../ftrace/boottime/bootconfigs/06-instance.bconf  |   5 +
 .../boottime/cmdlines/cmdline-01-ftrace.cmdline    |   1 +
 .../cmdlines/cmdline-02-trace-event.cmdline        |   1 +
 .../cmdlines/cmdline-03-trace-buf-size.cmdline     |   1 +
 .../cmdlines/cmdline-04-trace-options.cmdline      |   1 +
 .../cmdlines/cmdline-05-trace-clock.cmdline        |   1 +
 .../cmdlines/cmdline-06-trace-instance.cmdline     |   1 +
 .../cmdlines/persistent-01-reserve-mem.cmdline     |   1 +
 .../cmdlines/persistent-02-backup-instance.cmdline |   1 +
 .../selftests/ftrace/boottime/run_boottime_test.sh | 403 ++++++++++++++++
 .../selftests/ftrace/boottime/tests/01-kprobe.sh   |  25 +
 .../selftests/ftrace/boottime/tests/02-synth.sh    |  25 +
 .../selftests/ftrace/boottime/tests/03-eprobe.sh   |  25 +
 .../selftests/ftrace/boottime/tests/04-fprobe.sh   |  25 +
 .../selftests/ftrace/boottime/tests/05-tprobe.sh   |  25 +
 .../selftests/ftrace/boottime/tests/06-instance.sh |  30 ++
 .../ftrace/boottime/tests/cmdline-01-ftrace.sh     |  19 +
 .../boottime/tests/cmdline-02-trace-event.sh       |  26 ++
 .../boottime/tests/cmdline-03-trace-buf-size.sh    |  29 ++
 .../boottime/tests/cmdline-04-trace-options.sh     |  23 +
 .../boottime/tests/cmdline-05-trace-clock.sh       |  19 +
 .../boottime/tests/cmdline-06-trace-instance.sh    |  24 +
 .../boottime/tests/persistent-01-reserve-mem.sh    |  28 ++
 .../tests/persistent-02-backup-instance.sh         |  40 ++
 tools/testing/selftests/ftrace/config              |   6 +
 .../ftrace/test.d/kprobe/kprobe_non_uniq_symbol.tc |   2 +-
 39 files changed, 1289 insertions(+), 170 deletions(-)
 create mode 100755 tools/testing/selftests/ftrace/boottime-ktap
 create mode 100644 tools/testing/selftests/ftrace/boottime/Makefile
 create mode 100644 tools/testing/selftests/ftrace/boottime/README
 create mode 100644 tools/testing/selftests/ftrace/boottime/bootconfigs/01-kprobe.bconf
 create mode 100644 tools/testing/selftests/ftrace/boottime/bootconfigs/02-synth.bconf
 create mode 100644 tools/testing/selftests/ftrace/boottime/bootconfigs/03-eprobe.bconf
 create mode 100644 tools/testing/selftests/ftrace/boottime/bootconfigs/04-fprobe.bconf
 create mode 100644 tools/testing/selftests/ftrace/boottime/bootconfigs/05-tprobe.bconf
 create mode 100644 tools/testing/selftests/ftrace/boottime/bootconfigs/06-instance.bconf
 create mode 100644 tools/testing/selftests/ftrace/boottime/cmdlines/cmdline-01-ftrace.cmdline
 create mode 100644 tools/testing/selftests/ftrace/boottime/cmdlines/cmdline-02-trace-event.cmdline
 create mode 100644 tools/testing/selftests/ftrace/boottime/cmdlines/cmdline-03-trace-buf-size.cmdline
 create mode 100644 tools/testing/selftests/ftrace/boottime/cmdlines/cmdline-04-trace-options.cmdline
 create mode 100644 tools/testing/selftests/ftrace/boottime/cmdlines/cmdline-05-trace-clock.cmdline
 create mode 100644 tools/testing/selftests/ftrace/boottime/cmdlines/cmdline-06-trace-instance.cmdline
 create mode 100644 tools/testing/selftests/ftrace/boottime/cmdlines/persistent-01-reserve-mem.cmdline
 create mode 100644 tools/testing/selftests/ftrace/boottime/cmdlines/persistent-02-backup-instance.cmdline
 create mode 100755 tools/testing/selftests/ftrace/boottime/run_boottime_test.sh
 create mode 100644 tools/testing/selftests/ftrace/boottime/tests/01-kprobe.sh
 create mode 100644 tools/testing/selftests/ftrace/boottime/tests/02-synth.sh
 create mode 100644 tools/testing/selftests/ftrace/boottime/tests/03-eprobe.sh
 create mode 100644 tools/testing/selftests/ftrace/boottime/tests/04-fprobe.sh
 create mode 100644 tools/testing/selftests/ftrace/boottime/tests/05-tprobe.sh
 create mode 100644 tools/testing/selftests/ftrace/boottime/tests/06-instance.sh
 create mode 100644 tools/testing/selftests/ftrace/boottime/tests/cmdline-01-ftrace.sh
 create mode 100644 tools/testing/selftests/ftrace/boottime/tests/cmdline-02-trace-event.sh
 create mode 100644 tools/testing/selftests/ftrace/boottime/tests/cmdline-03-trace-buf-size.sh
 create mode 100644 tools/testing/selftests/ftrace/boottime/tests/cmdline-04-trace-options.sh
 create mode 100644 tools/testing/selftests/ftrace/boottime/tests/cmdline-05-trace-clock.sh
 create mode 100644 tools/testing/selftests/ftrace/boottime/tests/cmdline-06-trace-instance.sh
 create mode 100644 tools/testing/selftests/ftrace/boottime/tests/persistent-01-reserve-mem.sh
 create mode 100644 tools/testing/selftests/ftrace/boottime/tests/persistent-02-backup-instance.sh
---------------------------
-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>



