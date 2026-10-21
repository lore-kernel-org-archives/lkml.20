Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622353;
	b=faoGJwse0AaMpYxJMrw64jFUV67J9Y4giZpqKCTmZmOmdetU/18x467zvCIzoCfJNpq6
	 UX9/VQArJmb6sfFlXsRE4RImOJPH+koRoAxnNP37WWCTi1VN4pTjQyh1pIK9gT0iRGLsu
	 PujgSar1A3UejZot4XR+bJCS5BMoKmeZhND0HVTSsJEjFXs7CCOhYQmMMSeWL/p7JW5z4
	 l2xEFuzggI4AqKREu8Isssb+vs5knY82NqwEFLpPcD5iUWG22Xu4muKHH9uhHJkm2nPWM
	 zAKJ5LmQfssFcK34Ml/uF2j1CUQMDbuy2W8SdctKC52pFzQNGntlDd9cUZLhtyWyrbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YP/JfyOYWmz90m2NwbazrCLMBQ4ptjaQHMjiASdFN+Q=;
	b=j6brsWbam+NQ5CAoAKuRDxEZnp2hcBb4PmpsHZKdw8BlBnooM1EXfcE1B7bwjQZjypRJ
	 lJ7X0umB+xfi9JuUPdBKQu328LD+gZdzkLScqybnGRJM9BLTI9Nhnt+F/FdxEjiIr/NiJ
	 WO2kcNQpZNsqbGJoSha4YYyQllYuXlNgdskHlRgGhS4VIiFq/vbQzAUHHT+w325WXeSOX
	 JIK2UPhkuHN2dIx4+xwIHq64QMR3FO7b1rxJqXhhDzLLHdF2gLnAb/sG4YuLqYEtpOVoT
	 I01OlxsySFwSdlinZuMh2H5kbZy6ltwcojVulOqHTpnkCC+a190TRg5XX2mdghKEsPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LxDyt1kN;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF51F606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF51F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LxDyt1kN
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1663fb7e005so1789718c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622352; x=1793227152; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YP/JfyOYWmz90m2NwbazrCLMBQ4ptjaQHMjiASdFN+Q=;
        b=LxDyt1kN/PRQcQqx4VLrMcB1O9N0slWjRfan8BPSnLgOhDVO8Xeps8ZbeU2wCAUTYM
         U1asqbifWPOvSlPvFZH8/85cLj8vByMXxYIt2ZmzBrbiRgqwNqpb11UZgBp0lshuIAEQ
         DH7iO9RYL4FmRl1vVVPKfzJW+NFy+n3mtlwnNp5omEyOppSRLSBjX3j3jPpZ7bvO+E1R
         y9emZo5J/U7VchtZhk5wKQ6JceJf4azXey2y9emrQJsuyjRo5D/+p7WHSdKoJ4XE6Twh
         JmUJtkXZlNG91cdKWxSnuu35PF6OzAObFhJdL1syH3OtP+RBplihUunqNZ697r08ru1m
         kDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622352; x=1793227152;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YP/JfyOYWmz90m2NwbazrCLMBQ4ptjaQHMjiASdFN+Q=;
        b=PSwBgjVkSjDf4APmaWuNirFHxAM0uVw98odI47HZZrVljft2oq2OUcmQplH/QoSf/c
         2Zu5hlEpT3KsP5G71QdSwDNSYxjK+v+8/WfVsOy94AP1nHOkRra6V+et6+TuFJTkWHP/
         ScXGow9RiXWo6SnqcZ+I2anZ7DEYABeYesu4vNg3vVWh8pO9H0kxIFGJIfT+apJ+J5tJ
         r/mTsKDDn0Dde+gciGucw3GxJR/EnKXa+C8gCLVl4jRjxdjkf18YlBt8Sh8GaxSpaDn/
         7aLKYP+oFHnd95VJ6BZ6HqBZz21a1swyqFFF/Z4Yhx57/UUrbU0wrZTn8DG0CErmPRzz
         st1w==
X-Forwarded-Encrypted: i=1; AKwUvByMmkxRneayp8ua80Vg69pUzYvKkgLdURfGNMzIJVknvfnmTpq/dQokPUKfoKdC/D0yjIzVgi4JrgE9mlg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/93HBFWC2XAWU/2icT0JuDC/xdY/C7G/zPAhkqYUDNLKEWIEz
	mOw4pW+C3af6rwJZGGl/SgKYxfxSpEOjSWmpF25vI0Tf+W2ilQ1ZZRLE6X6tpEmmU3/2YJSHzq6
	8sFN+n9TfaA==
X-Received: from dled6-n2.prod.google.com ([2002:a05:701b:42c6:20b0:191:8b40:a632])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:21db:b0:153:3c50:ab85
 with SMTP id a92af1059eb24-190a456636fmr3329466c88.12.1792622350969; Wed, 21
 Oct 2026 15:39:10 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:38:48 -0700
In-Reply-To: <20261021171044.155240-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021171044.155240-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021223905.715051-1-irogers@google.com>
Subject: [PATCH v7 00/17] tools/perf: Adopt kernel compiler-context-analysis.h annotations
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

v7:
  - Add newly created DSOs in machine__process_ksymbol_register() and
    dso__split_kallsyms() to machine->dsos so assert(dso__dsos(dso)) in
    dso__list_add() always holds (patch 8).
  - Add __guarded_by(&config_mutex) to function-local static parser
    buffers in parse_value() and perf_parse_file() (patch 15).
  - Remove from maps_by_name before calling
    map__put(maps_by_address[address_idx]) in __maps__remove() so
    callers such as maps__remove_maps() that pass maps_by_address[i] as
    map do not use a freed handle in maps__by_name_index() under
    REFCNT_CHECKING (patch 16).

v6:
  - Rebase onto perf-tools-next.

v5:
  - Hold machine->dsos.lock in write mode across machine->vdso_info
    initialization and temporary file creation in
    machine__findnew_vdso() and __machine__findnew_compat(), and
    annotate __machine__addnew_vdso() with
    __must_hold(&machine->dsos.lock) (patches 7, 11).
  - Reset tpebs_cmd.pid = 0 and return early without setting
    t->started = true if start_command() fails in
    evsel__tpebs_start_perf_record() (patch 13).

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
 tools/perf/util/config.c                      |  47 +-
 tools/perf/util/dso.c                         | 140 +++--
 tools/perf/util/dso.h                         |  15 +-
 tools/perf/util/dsos.c                        |  31 +-
 tools/perf/util/dsos.h                        |  12 +-
 tools/perf/util/env.c                         |   1 +
 tools/perf/util/env.h                         |  19 +-
 tools/perf/util/intel-tpebs.c                 | 133 +++--
 tools/perf/util/libbfd.c                      |   4 +-
 tools/perf/util/machine.c                     |  14 +-
 tools/perf/util/maps.c                        | 157 ++++--
 tools/perf/util/mutex.c                       |   4 +-
 tools/perf/util/mutex.h                       |  90 +--
 tools/perf/util/rwsem.c                       |   8 +-
 tools/perf/util/rwsem.h                       |  10 +-
 tools/perf/util/symbol.c                      |   4 +
 tools/perf/util/thread.c                      |  10 +-
 tools/perf/util/thread.h                      |  30 +-
 tools/perf/util/threads.c                     |   4 +
 tools/perf/util/threads.h                     |   6 +-
 tools/perf/util/vdso.c                        |  53 +-
 36 files changed, 1224 insertions(+), 492 deletions(-)

-- 
2.56.0.218.g1ec904b173-goog

