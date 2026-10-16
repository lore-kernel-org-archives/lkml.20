Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBFC4028F2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792186406; cv=none; b=W8e3/uTBPbfehXny1F5+77fGY8Pru5AW02eNJU4H4SdGCDm9pPa5owvVAT+w7tTexVHSMcjHp/x10XJCl4qJljHDDjuMDpHeIjDNnJLyy/665M+BwOu0StPnVW7SO1AR9SoH1SZVKQRlkE6SRBUb/Fjmf3qwntLKU0guEyqvAF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792186406; c=relaxed/simple;
	bh=Wp//8oaYsQswHV80nj1z0uH2+yYKkBMBo0AesxpBtRo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LoYWHvCrK5In3KnYTP2x2YGBaYtyFN+Jj02jpRq2JOvqnp6Nt1dilv33YoXcbvoIinQgnPSPH7nWnA14NEywlBCu63v0TwG/bzTKfUbyy/zsgHqGMwkRGJKccTs22ziGIvu/HrfBBxXOssxTTgccKzAlJewF/RcF+bg8dKsYas0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WjxGe1pB; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WjxGe1pB"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-182fd5bf1abso37162c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792186402; x=1792791202; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRWXY/vPM9FN4lu9hO9Sx7jZwnplsOlTBUjKCiT7MFc=;
        b=WjxGe1pBE8eqoXggIBl3fC9YbMe/kLMhsV3WI57aM0CbNtVlCzw9nJc4HWmLBMZaLA
         1JpfQNEtbNOCx+8nZWYwnlrD+pwLKWpoGxmpm3XOTIZqKkPi+4tumrq009FvItb7E/me
         qVwFCoFKUIZxR67XyrZ2dJK5CduLwoGXtotfSJ6YuRBQjC8h1vJy79T/ojFHD6NFOvDP
         XPjlk4AMTdLUsM56NAn6L5ynvO6j5NcSOYfK8KGUpBV+tn87+VIJQ0OlLcrzAGBfxGzZ
         pSuJILM+pUQMxHKqM+uWgObzhU0XrKTj+PAUnYejFpS7mpm24jUdRlz0jLVACL0Peic7
         r8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792186402; x=1792791202;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRWXY/vPM9FN4lu9hO9Sx7jZwnplsOlTBUjKCiT7MFc=;
        b=1S4K3oW57FrWil57KF7Q7XJrqWE2lE+WeBnMuJUg85DKmMa9M3AJ3Cq9HalWXa4VUr
         DZDNBaR9cKxdEIdXAHueWPIvi+BRndf9rx443b3g4hNUMTJ4yt9qWiIU+7z2k1tVWhb6
         IM+9wN6ptysYJBZVeAJt6i013D9fk/VEyTXgb5DT5sU/4kuEBuRluVI0BF9KgOMASLZ+
         PRwMTkFIz8WwONBEzK/davO5p95ht/oVD1kiYA864l8NKTDlTOrybJ/MXOZfWlA3TVK7
         VZC99E3rN/lm+AHB0i3+jiZ/hBLGreLN3T/b3tWSNW+wN2AsIQsIpQTOYYGV4V95llN6
         g0OA==
X-Forwarded-Encrypted: i=1; AKwUvBzK1LxIAv0jbmQcgWocVFE9+mw79XOmZ0PQUDruyU6NFSHVfxNrfiaENiEaWaFE3SLzxQ2M13RjSLYXnBI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKClmPGpkii2u/9iJDzxkT4b5VkSLf0cqa9lLdFeHDtOhjsVq5j
	oRnQxrdzqusYHXG6Dz9CS2P5c+P0RPy2MEfiDraJQjxa9+AIklyZm9eQ1EWZymTFhAinrnwQCFw
	LuoKZKPkgIQ==
X-Received: from dldyq17-n2.prod.google.com ([2002:a05:701b:4551:20b0:14e:8121:6eda])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:281b:b0:16d:c848:d36e
 with SMTP id a92af1059eb24-1851238b3femr1399005c88.13.1792186401210; Fri, 16
 Oct 2026 14:33:21 -0700 (PDT)
Date: Fri, 16 Oct 2026 14:32:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016213258.945737-1-irogers@google.com>
Subject: [RFC PATCH v1 0/2] perf sysinfo: Add subcommand to probe and
 summarize PMU capabilities
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"

Determining what performance monitoring hardware, driver capabilities,
and event/metric support are available on a system currently requires
piecing together sysfs files under /sys/bus/event_source/devices/,
perf list output, and trial-and-error perf_event_open() calls. Across
architectures and SoCs, support varies widely: an advanced system
provides core PMUs with zero-skid precise event sampling (PEBS/IBS/SPE),
hardware branch stack recording (LBR/BRBE), user-space counter reading
(rdpmc), memory profiling (DATA_SRC), hardware AUX trace PMUs, memory
and PCIe/IO interconnect bandwidth PMUs, and multi-level pipeline metric
drill-down hierarchies, whereas a minimal system may only offer software
timer sampling.

This RFC series introduces 'perf sysinfo' to inspect, actively probe,
and summarize the PMU and performance monitoring capabilities of a live
system or a recorded perf.data file:

- Patch 1 adds PMU environment reconstruction from perf_env headers
  (perf_pmus__read_from_env()), public duplicate-collapsing PMU scan
  helpers, and active live capability probing via perf_event_open()
  (perf_pmu__probe()). Probing tests counting, sampling, branch stack
  sampling, precise_ip levels (:p, :pp, :ppp) and empirically measured
  branch instruction skid across an 8,192-nop runway, supported
  perf_event_sample_format bits, user/intr general-purpose and SIMD
  register masks, memory profiling events, privilege exclusion
  modifiers, execution features (leader sampling, sw_grouping,
  auto-counter reload, AUX pause/resume/sample), user-space rdpmc
  availability/enablement and PMC bit-width, and maximum event group
  sizes (both openable and simultaneously active without multiplexing).

- Patch 2 adds the 'perf sysinfo' subcommand, documentation, and shell
  test. By default, 'perf sysinfo' outputs a colorized system capability
  summary, pipeline metric drill-down hierarchy (via <metric>_group
  chains), overall system rating (Advanced, Standard, Basic, Minimal),
  and any missing baseline features. Passing '-p'/'--pmus' (or a PMU
  glob filter, '-v'/'--verbose', '-a'/'--all', or '-j'/'--json')
  displays detailed per-PMU static and probed attributes.

Example default output on an Intel AlderLake hybrid system:

  $ perf sysinfo
  Summary:
    Core PMUs (2, hybrid): cpu_atom, cpu_core
    Core features:
      Interrupt-based sampling: supported
      Precise event sampling: supported (max_precise: 3 [3 - SAMPLE_IP must have 0 skid, or uses randomization])
      Branch stack sampling (LBR/BRBE): supported (depth: 32 branches)
      User-space counter reading (rdpmc): supported
      Leader sampling: supported
      Memory profiling events (DATA_SRC): supported
      Hardware AUX trace PMUs: intel_bts, intel_pt
    Bus & uncore monitoring:
      Memory bandwidth PMUs: uncore_imc, uncore_imc_free_running
      PCIe / IO interconnect bandwidth PMUs: uncore_arb
    Events & metrics:
      Available events: 3161 total (76 sysfs, 3085 json) across 28 PMUs
      Available metrics: 438 metrics in 192 groups (advanced)
      Metric drill-down levels (6): L1 (TopdownL1: 7 metrics), L2 (TopdownL2: 14 metrics), L3 (TopdownL3: 44 metrics), L4 (TopdownL4: 45 metrics), L5 (TopdownL5: 15 metrics), L6 (TopdownL6: 9 metrics)
    System rating: Advanced (core PMU with precise sampling, branch stack (LBR), user rdpmc, bus PMUs, and metric drill-down)

Example filtered per-PMU output:

  $ perf sysinfo cpu_core
  cpu_core (type: 4 [PERF_TYPE_RAW], core):
    CPUs: 0-15 (16 CPUs)
    Capabilities: branches=32, max_precise=3, pmu_name=alderlake_hybrid
    Formats: event (config:0-7), pc (config:19), edge (config:18), offcore_rsp (config1:0-63), ldlat (config1:0-15), inv (config:23), umask (config:8-15), frontend (config1:0-23), cmask (config:24-31)
    Events: 1563 total (20 sysfs, 1543 json)
    Memory events: ldlat-loads ({cpu_core/mem-loads-aux/,cpu_core/mem-loads,ldlat=30/}:P), ldlat-stores (cpu_core/mem-stores/P)
    Probed capabilities (event: cpu_core/cycles/):
      Modes: counting, sampling, branch_stack
      Precise sampling: :p (1 - SAMPLE_IP must have constant skid), :pp (2 - SAMPLE_IP requested to have 0 skid), :ppp (3 - SAMPLE_IP must have 0 skid, or uses randomization) (max_precise: 3)
      Measured branch skid (instructions from branch):
        level 0 (no :p): min 105, max 174, avg 156.8 (0/32 exact_ip)
        level 1 (:p)   : min 1, max 1, avg 1.0 (0/31 exact_ip)
        level 2 (:pp)  : min 0, max 0, avg 0.0 (31/31 exact_ip)
        level 3 (:ppp) : min 0, max 0, avg 0.0 (32/32 exact_ip)
      Sample types: ip, tid, time, addr, read, callchain, id, cpu, period, stream_id, raw, branch_stack, regs_user, stack_user, weight, data_src, identifier, transaction, regs_intr, aux, cgroup, data_page_size, code_page_size, weight_struct
      User registers: AX, BX, CX, DX, SI, DI, BP, SP, IP, FLAGS, CS, SS, R8, R9, R10, R11, R12, R13, R14, R15
      Intr registers: AX, BX, CX, DX, SI, DI, BP, SP, IP, FLAGS, CS, SS, R8, R9, R10, R11, R12, R13, R14, R15, XMM0, XMM1, XMM2, XMM3, XMM4, XMM5, XMM6, XMM7, XMM8, XMM9, XMM10, XMM11, XMM12, XMM13, XMM14, XMM15
      Memory events (probed): ldlat-loads, ldlat-stores (sample types: addr, weight, data_src, transaction, data_page_size, weight_struct)
      Exclusion modifiers: exclude_user, exclude_kernel, exclude_hv, exclude_idle, exclude_host, exclude_guest
      Features: leader_sampling, sw_grouping, inherit, sample_freq, write_backward, callchain, data_src, weight, pinned, exclusive, format_lost, user_rdpmc, user_time, user_time_zero
      User space counter reading (rdpmc): available, enabled, working (width: 48 bits)
      Max event group size: 18 (active: 8)
      Max GP event group size: 16 (active: 7)

This patch series was generated with the assistance of antigravity and
Gemini 4.0.

Ian Rogers (2):
  perf pmus: Add PMU environment loading and live capability probing
  perf sysinfo: Add sysinfo subcommand, documentation, and test

 tools/perf/Build                          |    1 +
 tools/perf/Documentation/perf-sysinfo.txt |  109 ++
 tools/perf/Documentation/perf.txt         |    2 +-
 tools/perf/builtin-help.c                 |    3 +-
 tools/perf/builtin-sysinfo.c              | 1958 ++++++++++++++++++++
 tools/perf/builtin.h                      |    1 +
 tools/perf/perf.c                         |    1 +
 tools/perf/tests/shell/sysinfo.sh         |   71 +
 tools/perf/util/mem-events.c              |   14 +-
 tools/perf/util/mem-events.h              |    3 +
 tools/perf/util/pmu.c                     | 1976 ++++++++++++++++++++-
 tools/perf/util/pmu.h                     |  135 +-
 tools/perf/util/pmus.c                    |  221 ++-
 tools/perf/util/pmus.h                    |    4 +
 14 files changed, 4486 insertions(+), 13 deletions(-)
 create mode 100644 tools/perf/Documentation/perf-sysinfo.txt
 create mode 100644 tools/perf/builtin-sysinfo.c
 create mode 100755 tools/perf/tests/shell/sysinfo.sh

-- 
2.56.0.212.g129ede20d9-goog

