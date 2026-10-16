Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BA23BFACE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189093; cv=none; b=i/DuCA3O902BpnyrhLZXTbltO+AJIuH3GPhfndIPnNjMYowTZvJhsLxF7i7On9tTeCapmYoDlabPNZQsp5NypmW9AaGlYqFeJ///8lO6eniljpAeN1NBXjp91mLeQJEQYrs5Y4LJi65QHMfZfT5yWdfeh/Tl79Gw4u/rwT4Ge6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189093; c=relaxed/simple;
	bh=TSC8xct7CPjCdOh2QAKkGMk09bdyMNvmRPtbKR70ipM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jeEdHYg/0T7wc9CFQk7fYwWf3TcP4VE0QvjeDRZvYDmuiI9NuPCFjEZx/6+CK1Gon4XNRv3gf+ecrdZOCj9JCS4oscnVTCUZjgeyztUyo5CxGiK1S2opF7P9Tvo+ynPkVAK+n/2h+55WSHeHUJftYt2jyn05bOKPuDGmQbfjvp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AL3p3rPR; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AL3p3rPR"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso763939c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792189090; x=1792793890; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlO3NbwHdj3PU8c4bbM/MsYGnPzoh+/o0HZvALykYYs=;
        b=AL3p3rPRrWZevKx/2+UKfPR78vLGP5Q8RVShjc+kysmL2vSmZTvRalNJUaw2v8oDWD
         d4Tt7fqxaTNM8hsBAMzyLN4J4VnkzSlkrmg0rRSSHD8elsi7tHZphKE0xjSt4qTjZMt5
         nTjtzscoQfn3V7IsOkCJgA0G9B/dOMctomnbvUdEkZnILsu9WgxKvScCtEixb93fgksX
         WUZPLA0osEyd4pzT2xQ2fb/VSY+7N8heR15VfpFgbksj8EQF1ApWeF3FIWfydvDJThDQ
         0oODg25sxVw4aSAynFskQJRo5tOYSEtyQPkdKXcIXQq5i+5aRdFq1BxQY8UyY1Za8MXk
         ut7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189090; x=1792793890;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qlO3NbwHdj3PU8c4bbM/MsYGnPzoh+/o0HZvALykYYs=;
        b=bi1WmbGLROB1EhcdzYDUG6YG2bjRJ0JMvKk5dqL4KSQ3fjnjIvjctXt2MWSdMEXIBX
         btONoTvGs6PdgQ5WZ7I/eMGaEi4qY3mgUsPKE7Yd/hKxmwOowLnpY0mkUrHf4SpMQVOn
         VJ5b35oGmOSyWtei+6mW2uqXPfGfVr6cikfkfmnN9O5VQaK39pgc6DNZlVpFJx8570DC
         201H7ykZOmuHdNLlbNsy7ZG4rKh7CAHM0CmPGMQmS/rqjrKW4G4BVpr2UBDjjBjX+XDD
         WVsAvIOp00S9OIyLXiSPsxBLkJkwpWo7hTOQrY8ToGDi+5IiUz1531ro42jYNUiKyCVR
         vZ6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzSExh8VeO5DjT67IiiuUBYkkwfuUxmrQBA6G/ctttQjrXFwOM/kf1tyXA5Q0jmjfPXS8BXG00h3F7h0EA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmBhujo1MnDWxPufaZdReQDCSC8A5HjIrXn4LSUwBZl7SAfazH
	Z9scmm3h+9j3be3wwLHo9pwBuiP49X+XlL+hr4o5z5C3OXFLbeQ8BKXBXJzxjM7zo7Gp5nSSYKq
	1nX+rtFkHAQ==
X-Received: from dlbrl9.prod.google.com ([2002:a05:7022:f509:b0:166:1a44:a89])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1706:b0:16a:f5cd:365
 with SMTP id a92af1059eb24-1850d087fd9mr1394614c88.5.1792189089758; Fri, 16
 Oct 2026 15:18:09 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:16:43 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016221700.1282659-1-irogers@google.com>
Subject: [PATCH v4 00/17] tools/perf: Adopt kernel compiler-context-analysis.h annotations
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

The perf tool previously added Clang thread-safety annotations in
tools/perf/util/mutex.h (GUARDED_BY, LOCKABLE, EXCLUSIVE_LOCK_FUNCTION,
UNLOCK_FUNCTION, etc.). Since then, the Linux kernel has adopted a
unified set of static context analysis macros and attributes in
include/linux/compiler-context-analysis.h (context_lock_struct,
__guarded_by, __acquires, __releases, __must_hold, etc.).

This series makes tools/include/linux/compiler-context-analysis.h
functional by synchronizing it and the required compiler_types.h helpers
with the kernel headers, converts tools/perf from its custom mutex.h
macros to the kernel-style compiler-context-analysis.h annotations, and
expands context analysis coverage across comm, dso/dsos, thread/threads,
config, intel-tpebs, env, and maps. Along the way, separate preparatory
patches fix an unlocked __dsos__add() call and TOCTOU race in
__machine__addnew_vdso(), avoid dropping _dso__data_open_lock in
dso__list_del() under REFCNT_CHECKING, switch dso__data_open_lock and
tpebs_mtx to DEFINE_MUTEX(), add a read-lock fast path to
dsos__findnew_id(), fix an unlocked read of tpebs_reader_thread and
double-close of tpebs_cmd.out in intel-tpebs, and avoid a potential
read-to-write deadlock in maps__load_first() and out-of-bounds access in
__maps__remove().

This series was developed and reviewed with assistance from an AI coding
agent (Gemini 3.1 Pro) and reviewed with Sashiko.

v4:
  - Place the DSO loaded in addr_filter__resolve_syms() into a dsos
    collection so dso__dsos(dso) is populated (patch 8).
  - Join tpebs_reader_thread on error in evsel__tpebs_open(), document
    why tpebs_cmd.pid is cleared before pthread_join() in tpebs_stop(),
    and include <pthread.h> and <signal.h> in util/intel-tpebs.c
    (patch 13).
  - Include <string.h> in util/maps.c (patch 16).

v3:
  - Rebase onto perf-tools-next (converting the newly added
    dso__find_binary_type() lock annotations in util/dso.c).
  - Separate bug fixes, DEFINE_MUTEX() cleanups, and improvements (vdso,
    dso_data, dso__data_open_lock, dsos__findnew_id, intel-tpebs,
    tpebs_mtx, maps) from the annotation patches.
  - Move AI coding assistant attribution to the cover letter and drop
    per-commit Assisted-by tags per linux-next
    Documentation/process/coding-assistants.rst.
  - Add Marco Elver's Reviewed-by to patch 1.
  - Define __diag_clang_23() and Clang ASM_INPUT_G/ASM_INPUT_RM/
    ASM_OUTPUT_RM overrides in tools/include/linux/compiler-gcc.h
    (patch 2).
  - Probe for -Wthread-safety-pointer/-Wthread-safety-beta in
    Makefile.config (patch 5).
  - Pass write_locked to __dsos__find() (patch 7).
  - Pass struct dso_data * to close_data_fd() and dso__list_del() to
    remove the REFCNT_CHECKING dso pointer from struct dso_data and
    avoid dropping dso__data_open_lock in dso__list_del(), and include
    <assert.h> in util/dso.c (patch 8).
  - Re-validate DSO lookup under the write lock in dsos__findnew_id()
    via __dsos__findnew_id(), and handle NULL dso_id in
    dso__needs_improve_id(), __dso__improve_id(), and dso_id__cmp()
    (patch 10).
  - Reset tpebs_cmd.out = -1 if start_command() fails and include
    <stdint.h>, <stdlib.h>, <string.h>, and <unistd.h> in
    util/intel-tpebs.c (patch 13).
  - Bounds-check the index in __maps__remove() (freeing maps_by_name if
    out of bounds) (patch 16).

v2:
  - Use -c rather than -E when probing for
    -fexperimental-late-parse-attributes in Makefile.config to avoid
    -Werror,-Wunused-command-line-argument.
  - Acquire machine->dsos.lock in write mode across duplicate checking,
    dso__set_long_name(), and __dsos__add() in __machine__addnew_vdso().
  - Avoid dropping dso__data_open_lock in dso__list_del() under
    REFCNT_CHECKING.
  - Pass tpebs_cmd.out directly to __sample_reader() and set
    tpebs_cmd.out = -1 in evsel__tpebs_open() to avoid a double-close in
    tpebs_stop(), and clarify the config_set_mutex comment.
  - Drop maps__lock before calling map__load() in maps__load_first() to
    avoid a read-to-write self-deadlock when loading kernel maps inserts
    additional trampoline maps.

Ian Rogers (17):
  compiler-context-analysis: Avoid unused parameter warning in
    _context_unsafe_alias()
  tools headers compiler: Synchronize compiler_types.h with the kernel
    sources
  tools headers: Synchronize linux/compiler-context-analysis.h with the
    kernel sources
  perf mutex: Use kernel style compiler-context-analysis.h annotations
  perf build: Enable additional Clang thread-safety flags
  perf comm: Add __guarded_by annotations to struct comm_strs
  perf vdso: Fix unlocked __dsos__add() and race in
    __machine__addnew_vdso()
  perf dso: Pass dso_data to close_data_fd() and dso__list_del()
  perf dso: Use DEFINE_MUTEX for dso__data_open_lock
  perf dsos: Use read lock fast path in dsos__findnew_id()
  perf dso: Expand context analysis annotations
  perf thread: Expand context analysis annotations to threads and
    namespaces_lock
  perf intel-tpebs: Fix race in tpebs_stop() and tpebs_cmd.out fd
    handling
  perf intel-tpebs: Use DEFINE_MUTEX for tpebs_mtx
  perf config, intel-tpebs, env: Add __guarded_by and __must_hold
    annotations
  perf maps: Fix lock inversion in maps__load_first() and bounds check
    in __maps__remove()
  perf maps: Add context analysis annotations

 include/linux/compiler-context-analysis.h     |   2 +-
 .../include/linux/compiler-context-analysis.h | 518 ++++++++++++++++--
 tools/include/linux/compiler-gcc.h            |  72 ++-
 tools/include/linux/compiler.h                |  50 +-
 tools/include/linux/compiler_types.h          | 206 ++++++-
 tools/perf/Makefile.config                    |   8 +-
 tools/perf/builtin-sched.c                    |  16 +-
 tools/perf/builtin-top.c                      |   4 +-
 tools/perf/check-headers.sh                   |   1 +
 tools/perf/tests/dso-data.c                   |   4 +
 tools/perf/util/annotate.c                    |   4 +-
 tools/perf/util/annotate.h                    |   8 +-
 tools/perf/util/auxtrace.c                    |  16 +-
 tools/perf/util/bpf-event.h                   |   5 +-
 tools/perf/util/comm.c                        |  10 +-
 tools/perf/util/config.c                      |  43 +-
 tools/perf/util/dso.c                         | 140 +++--
 tools/perf/util/dso.h                         |  15 +-
 tools/perf/util/dsos.c                        |  31 +-
 tools/perf/util/dsos.h                        |  12 +-
 tools/perf/util/env.c                         |   1 +
 tools/perf/util/env.h                         |  19 +-
 tools/perf/util/intel-tpebs.c                 | 128 +++--
 tools/perf/util/libbfd.c                      |   4 +-
 tools/perf/util/maps.c                        | 148 +++--
 tools/perf/util/mutex.c                       |   4 +-
 tools/perf/util/mutex.h                       |  90 +--
 tools/perf/util/rwsem.c                       |   8 +-
 tools/perf/util/rwsem.h                       |  10 +-
 tools/perf/util/thread.c                      |  10 +-
 tools/perf/util/thread.h                      |  30 +-
 tools/perf/util/threads.c                     |   4 +
 tools/perf/util/threads.h                     |   6 +-
 tools/perf/util/vdso.c                        |  17 +-
 34 files changed, 1181 insertions(+), 463 deletions(-)

-- 
2.56.0.212.g129ede20d9-goog

