Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019A8436BC9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627370; cv=none; b=gGM7/omBhulUW3DaQeha/OqYpDFr51ubLuO35DQQ2l6+xVjo8moU70jwnehJ44rh8LFSDT/1LcV4qP0DuDQDSRdpH2ol69xmygd6161xZgMVNnvg3sCtMBk/uVtfQzkmE23yKPRPflIrqIEa3cUij7bbUOyAcYA3JuDBAhbYz8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627370; c=relaxed/simple;
	bh=1F4xn74JBLA6wUlJVVObLBv5hpYT0V2wD0p/aP523aA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LdJHoTefMPNyy+iXO/+C87E6ztpvrVh7E2JWgxL9nRWoLalI1ij0vMDthfeViVD5S0vOPcvP5L6ZRVE3H3OAtaQGRgEHOgIuUyaCVVQ0quUXRINJmdxPQ9u5VVdM8b9ycm6fM5CWIDLw5tcSpEKL1u3p7wHfrRYsAu5S+zLcot8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sdLVHOOS; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sdLVHOOS"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so441531a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789627368; x=1790232168; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLP2pHow7aH/6DDUYorwbnMW39rR3Y5UV5SgdvfVZzo=;
        b=sdLVHOOSVmem8wQqqWpaEzBQJLcovMZcgKLfkWcPXTKUIQnLmm3rTNyIf442DM0mju
         Sn6OjUpeNiYr9atQ+dVqJa5v9aMqDnqQFQzUW7uK0FspABjf+xpStJXDUNPq/pmZcgqv
         bJ6gJ1l3eeBQ4WrWz+dv87fll9Hkeupaq13cEJCDDs2wIVtlmvyHWyVu01293Z8B63Pd
         uLV0acHNHDVMwX/FGN1aWctQUVSAVY0/F7ptge6/ogZ4DVEMvNeUVqKLKDaVrGL8UIlF
         obehS5t2BoTALndroUF8F5kpTru4r2PHT1zt9bzt7AB4N8HSV/rP8QCk8Y8hIkoS0Spn
         hwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627368; x=1790232168;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLP2pHow7aH/6DDUYorwbnMW39rR3Y5UV5SgdvfVZzo=;
        b=pAdmU1USW58n12J02IQPGEsL+SgpJWU5fTrEZ4D0BWLAG7QEMmQTIz4dNHNz0W0Z/Z
         vWhv7uA+VgWsWuW1H7Hefs4+mVCbP9fAW9rgFhGUfUAmgCd1UheiVfT8U0ALShITEAgh
         IbbPKisLIFAN/uBatKLDktcG0QR9G6CrTrQxqHYXk4UjZKv2xuRBbBL8ROKilw3UOEgz
         eFOsPl1u/6BdfKOJ+QM6DcBC3RKLRT4h2BOuyDa7ESJiG3Po40r693oFpVanENcsIIgn
         kkBQPt/8HFwM5HLnh2toipnq8GwuX+nRTOfV+djLGweOx5+I27pxb4cnTCNSnblbHzXO
         3Iuw==
X-Forwarded-Encrypted: i=1; AKwUvBwxiPETiGmxBPdZlc4p1KiVlHCgdkrJA+kt+ijsQKfumsqRrmqQ0I9lV+M1P50ETfAIYuTHqRd3YGiyVmw=@vger.kernel.org
X-Gm-Message-State: AFuF++k0Vx6jGN0+E1t8QHdMMp97233xA3ijRlVuo3cp7yDReT5ETLp+
	br4FIq1Mp7K3NRx4FoxUL4v9L8btizoHxkmu1eJBqAJ27K2bWplyH87ZK6ni8bt3dy1A8OcON7o
	Sy+77iKrwvg==
X-Received: from dycok4.prod.google.com ([2002:a05:7301:db04:b0:33b:9d11:a879])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:430a:b0:3da:6bdd:2308
 with SMTP id adf61e73a8af0-3dd5f5d673emr13320532637.18.1789627368047; Wed, 16
 Sep 2026 23:42:48 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:42:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <cover.1789626977.git.irogers@google.com>
Subject: [PATCH v1 00/13] perf trace: Fix BPF filtering and make tracing tests non-exclusive
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

perf trace's BPF augmentation attaches to raw_syscalls:sys_enter and
raw_syscalls:sys_exit system wide, and used the program return value to
decide whether a syscall was interesting. Returning 0 from a
BPF_PROG_TYPE_TRACEPOINT program makes perf_trace_run_bpf_submit() drop
the event for every listener on that tracepoint, not just for the perf
trace that installed the program. Any concurrent perf trace, perf record
or ftrace session watching raw_syscalls therefore lost events, which is
one of the reasons so many of the perf trace and perf probe shell tests
had to be marked (exclusive) and run on their own.

Patches 1 to 5 fix perf trace. They stop the return value being used as
a filter and do the filtering in BPF maps instead, fix argument handling
for the __data_loc internal tracepoint fields that syscalls:sys_enter_*
gained in 6.19, stop the sys_exit program array tail calling a sys_enter
augmenter, and replace the userspace PERF_RECORD_FORK/PERF_RECORD_EXIT
bookkeeping with BTF-typed raw tracepoint programs on
sched_process_{fork,exit,exec}. A task is then registered before its
first syscall and evicted in do_exit(), rather than whenever userspace
next drains the ring buffer.

Patches 6 to 13 deal with the tests. Several collided with each other
through global state rather than through perf trace: fixed probe names,
clear_all_probes() disabling tracing events globally, and perf trace's
hardcoded "probe:vfs_getname*" wildcard pinning probes belonging to
other tests. With those scoped to a pid they can drop (exclusive) and
run in parallel again.

Tested on x86_64. The trace and probe tests pass under 'perf test -r3',
which runs the repeats concurrently. Every patch builds individually,
and the series also builds with BUILD_BPF_SKEL=0.

Ian Rogers (13):
  perf trace: Start BPF summary before starting workload
  perf trace: Skip internal tracepoint fields in formatting and beauty
    map
  perf trace: Do not set unaugmented BPF program on sys_exit map
  perf trace: Filter events in BPF and avoid tracepoint vetoes
  perf trace: Handle fork and exit directly in BPF filter maps
  perf test test_task_analyzer: Isolate in temporary directory and make
    non-exclusive
  perf test common: Do not globally disable tracing events in
    clear_all_probes
  perf test probe_vfs_getname: Scope probe name to PID and make
    non-exclusive
  perf test record+probe_libc_inet_pton: Scope event to PID, add
    retries, and make non-exclusive
  perf test trace_summary: Improve error diagnostics
  perf test trace_btf_general: Drop --max-events=1 and make
    non-exclusive
  perf test trace_summary: Make non-exclusive
  perf test uprobe_from_different_cu: Scope probe name to PID

 tools/perf/Documentation/perf-trace.txt       |   5 +
 tools/perf/builtin-trace.c                    | 330 ++++++++++++++----
 tools/perf/tests/shell/common/init.sh         |   1 -
 .../perf/tests/shell/lib/probe_vfs_getname.sh |  34 +-
 tools/perf/tests/shell/probe_vfs_getname.sh   |   3 +-
 .../shell/record+probe_libc_inet_pton.sh      |  83 +++--
 .../shell/record+script_probe_vfs_getname.sh  |  18 +-
 tools/perf/tests/shell/test_task_analyzer.sh  |  11 +-
 .../shell/test_uprobe_from_different_cu.sh    |  11 +-
 .../tests/shell/trace+probe_vfs_getname.sh    |   9 +
 tools/perf/tests/shell/trace_btf_general.sh   |   8 +-
 tools/perf/tests/shell/trace_summary.sh       |  14 +-
 .../bpf_skel/augmented_raw_syscalls.bpf.c     | 291 ++++++++++++++-
 tools/perf/util/bpf_trace_augment.c           | 173 ++++++++-
 tools/perf/util/trace_augment.h               |  25 +-
 15 files changed, 875 insertions(+), 141 deletions(-)


base-commit: 91b0782fc9e9d2f0a40b5256146e014802fdbb36
-- 
2.55.0.1082.g2b9226bbc0-goog

