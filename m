Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A926535FC7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663162; cv=none; b=m5DvtkvEubuP9SJ2pDs9adLfE37FZkB6B+8EYELfc+QA3mR8TFhHj6d3cB5Aep7yJemKC+4lrfKXmucbETWVWq0OiOAbFcBFTWhuWrZbO4gCP1QDvS4s9Kxua42S5qzhzNt/1x+CQ+q/IXUKyY6OB+vxO8hJNloZKaDP7sRDa0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663162; c=relaxed/simple;
	bh=eSh+Od2Brt9WALE+73HznbeDtODL3pp5+z5MTOQkjXc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QQRlcXZAJw5qMUoBilGV9UWi27RNDzMY+pREBZH1qy0fa/DUL9zkDw+s9cpKLE7eFcpIoOe1t6aVd9hF9766rKqVltqNMVviwkHiSc8gL8CuvbzuEHPYupCzoo2KCIYArFGUk5RFP0ws/7D9QEQ02TEI/Qx2MBHoA5dYHqnKjjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fbLqf47u; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fbLqf47u"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396901263b6so1962426a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789663160; x=1790267960; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZuAkAIegyvJXHrWuDGz+S8eID/jyc9+D0dd/PTkvdU=;
        b=fbLqf47uR45EWIDGw3AKnjkAYSwDiPpf1KDOCJNBfjnVdAClcv3pn+LbYhZZoQ+3fo
         ML3BcqZ3e2VXy+B8KmPlwIfpFN1AUue00ztkx2NN3vobM172ugVpKp+Nw3+2lZDAzfr9
         yebQkq6skQIW4Rk4BjVGK1fe3y5raUgl/UQVQ+xYLkEghxQocWnxuYqDYI/9B2Ao4qDU
         NilsCURcAZFZDGD93x4jQeOJ3aFYPOqKhk5/dEnNiZRpx0U3KL0d/1c5onMxA1f4jjUS
         TH9qbBgkELy1mDVbnxEaStuMX/ysBdL4QNLbwmx5RkY7O7wwjZmFD2os68kdugNA2RjE
         MPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663160; x=1790267960;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZuAkAIegyvJXHrWuDGz+S8eID/jyc9+D0dd/PTkvdU=;
        b=Tqu6DMQ4fhHlIP5BlpDVxYtXX/pMUt3vwTvGqq+HZgSGQAw1tcUM3rNy55V4dM/vbz
         MLtx03CDfSvlpp+L6XAhvDTqa93s75xLToGIN5t1p1loqtrQgTH1du2vm99n8QrtkTJr
         Yj+15He6rNUKlV2fCL521pnGsEl4a6gH1u/KrcAnzXF/os2nwHloos0hVyuwTBrDWVee
         3fZHAjDJ7pgLuVp0Nf33QKhgkJ3N6X5Dattc1msWy0dQzrAmCucGvtdwIwz9Q18f9fbS
         E1suFeu54h8fYojZNJKB2WKqJw9Rtw9H0KjEdg678YC6FQI2+cKXjXzivyt9OmSBEbQ2
         sE5A==
X-Forwarded-Encrypted: i=1; AKwUvBzq8/J1rPlDDVyK+d4HjUWCsza2zupL2EptK9rfJq5QPb/Uy1VOZULynvjJTwj24Nov36X8Yf4+7s9hDGg=@vger.kernel.org
X-Gm-Message-State: AFuF++llkjhfS8BqF+wkhbF6BkNbvPDPYOr2uBYnIIlC8cp6cXoLufFt
	0eUR3MbPEf/W9FBBeNGr5Qu6YdcjVpfavxuTEzgHe/xIJhSAvjVzgdeArUjU46MkG9iajr8jKyt
	Fd3paEELMrw==
X-Received: from dldz19-n1.prod.google.com ([2002:a05:701b:4193:10b0:143:5722:79ed])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a81:b0:39d:f773:37b5
 with SMTP id 98e67ed59e1d1-39e1df6193cmr22073374a91.0.1789663159634; Thu, 17
 Sep 2026 09:39:19 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:38:48 -0700
In-Reply-To: <cover.1789626977.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789626977.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <cover.1789662556.git.irogers@google.com>
Subject: [PATCH v2 00/14] perf trace: Fix BPF filtering and make tracing tests non-exclusive
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
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

Patch 1 is an independent build fix for the two files the rest of the
series goes on to rework.

Patches 2 to 6 fix perf trace. They stop the return value being used as
a filter and do the filtering in BPF maps instead, fix argument handling
for the __data_loc internal tracepoint fields that syscalls:sys_enter_*
gained in 6.19, stop the sys_exit program array tail calling a sys_enter
augmenter, and replace the userspace PERF_RECORD_FORK/PERF_RECORD_EXIT
bookkeeping with BTF-typed raw tracepoint programs on
sched_process_{fork,exit,exec}. A task is then registered before its
first syscall and evicted in do_exit(), rather than whenever userspace
next drains the ring buffer.

Patches 7 to 14 deal with the tests. Several collided with each other
through global state rather than through perf trace: fixed probe names,
clear_all_probes() disabling tracing events globally, and perf trace's
hardcoded "probe:vfs_getname*" wildcard pinning probes belonging to
other tests. With those scoped to a pid they can drop (exclusive) and
run in parallel again.

Tested on x86_64. The trace and probe tests pass under 'perf test -r3',
which runs the repeats concurrently. Every patch builds individually,
and the series also builds with BUILD_BPF_SKEL=0.

Changes since v1:
- New patch 1 includes <sys/types.h> and <string.h> for the pid_t and
  strcmp() uses that were relying on the include chain happening to
  drag them in, which does not hold on libcs such as musl.
- Patch 5 no longer returns success when the event qualifier filter
  string fails to allocate. err now defaults to 0 because either
  tracepoint may legitimately be absent, so the ENOMEM path has to set
  the error itself rather than rely on that default. It also includes
  <stdbool.h> for the bool parameters it adds to trace_augment.h.
- Patch 7 removes the temporary directory if the cd into it fails.
  That happens before the cleanup trap is installed, so the directory
  would otherwise be left behind in /tmp.

Ian Rogers (14):
  perf trace: Include the headers declaring pid_t and strcmp
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
 tools/perf/builtin-trace.c                    | 335 ++++++++++++++----
 tools/perf/tests/shell/common/init.sh         |   1 -
 .../perf/tests/shell/lib/probe_vfs_getname.sh |  34 +-
 tools/perf/tests/shell/probe_vfs_getname.sh   |   3 +-
 .../shell/record+probe_libc_inet_pton.sh      |  83 +++--
 .../shell/record+script_probe_vfs_getname.sh  |  18 +-
 tools/perf/tests/shell/test_task_analyzer.sh  |  16 +-
 .../shell/test_uprobe_from_different_cu.sh    |  11 +-
 .../tests/shell/trace+probe_vfs_getname.sh    |   9 +
 tools/perf/tests/shell/trace_btf_general.sh   |   8 +-
 tools/perf/tests/shell/trace_summary.sh       |  14 +-
 .../bpf_skel/augmented_raw_syscalls.bpf.c     | 291 ++++++++++++++-
 tools/perf/util/bpf_trace_augment.c           | 174 ++++++++-
 tools/perf/util/trace_augment.h               |  27 +-
 15 files changed, 888 insertions(+), 141 deletions(-)


base-commit: 91b0782fc9e9d2f0a40b5256146e014802fdbb36
-- 
2.55.0.1082.g2b9226bbc0-goog

