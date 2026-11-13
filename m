Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794613066;
	b=d13zzVOP+lGz2ysovPPQEc33bPVTAosXQKi/b5c6ULtPHlSN1cQge55SrcVDvt8QcqXW
	 gH4LcZMk0vFepBrux3vDv/4qDe9rmptdStZ+JNpbcJN2Ko+fEOEMk15GyVhtTPZtR6vnK
	 CX7E4VfOKBkhQWliIT3C6zENDaDdK/GxJoGK1DyB9CNstttL9tDZ/DQECVgTfj+MP2uE5
	 CLXnRQS97Zhu6hEKnl7rDUXmc+2Ryud59eXzUELlSHffoOF7qe0oYU+1xFP8R7Z+mgXU+
	 pkF+ucI7GALMNKHE+psfJdb5tumBbUL6g8AzK7ZGhtZ6nXp8x3ZVDS8Y7Tx9c2dSNjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=pLVDazk80F7b1+gU0y/P4r2tn7cr2nu0Ac2cq7/r4wY=;
	b=uqTo6BbOWK4kBlJnCkdsullKD3PyNP5GFGMrHDMZotCovaO5yI5h6Y+PNXNxju+5Mel5
	 68EOl9vJV+OJQjRbfuCZ9HuWjMiVTuPLggnidEUAMJ88cFL/L8wK183TO2ryZKQTPnuBH
	 jaWo/DhetZZ6Cr03hZsUG8TJ5ox5RnrmbkdNNIKBIenVydxSb5YdgIhIUYU5QWLLo7LSZ
	 jC9uITMsjbrrHLQzMSFeUEiQsZiVa2ctCxV49DaEFRwbh4rVI5JJ9ymnnOy5KfAxeg/sw
	 BKitpxgWeGrQmiY3UBbQHcJBTLdgXyNl6T7936G3ZhNEKdZySJAgiqh5KJKCaY6OaLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NzY50ccz;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58162606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58162606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NzY50ccz
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25d977b91so1296438c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794613063; x=1795217863; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLVDazk80F7b1+gU0y/P4r2tn7cr2nu0Ac2cq7/r4wY=;
        b=NzY50ccz/hhazGI8QtYwyxsiLQbMVRZD29wX/MqU7LgmYwR1bMnL71saNXWA4ajLhl
         ZAYr9xSzYwlDurFqyVrHqYXf1q05Tg6dIlQhY25O8sNZp74I3RxSst/zjS7FQa9dEF1y
         dOw5cg36g0UZ7BMLAiB6HfZETsS1DyUgPHvzkCSwmiAPNANCLYwC8WYkB9fpUimDSQMy
         0Y+BF8kw+KLoWl2Tuw/kCUUydTzx0p7h6QMCU6CJeAh0Oom00nuWKNCfrAuQ5psmCDPl
         wgpFqhHB1OeszrevL7ZuxAYP9s5B8OGyLUR3jlv3HLPpOvU1NlRcKA7ithsVdIzp2oa2
         vGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794613063; x=1795217863;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLVDazk80F7b1+gU0y/P4r2tn7cr2nu0Ac2cq7/r4wY=;
        b=eU59Aan6bCBy82QkuPUO6EPXHk3KgfUzmShY1TfqxLrvdusav9mnPvPm9kbMjuJV74
         tP31o2k5p0Xr0N6n4q72Tv5cG7CMDSoFNys2R3KNGpTCIcqe43J98ryqtGrpK3Sdq4Jw
         pnk882O7ddB9jnZlOmBFAlY3JmwS6XzkAPWji34q5KGJMVHfH1dGItslzb9QGXJ/bH5n
         jKFfe2kMInWvDC8UOILXB+z5RujYRpYjdC65Lu4FQpBdmw0C+rUJYuqhxVRXlm7mbewT
         x3QFEkhXxr5E6GPquSi38M1l6XpcJA1d2GXOWODMbhrNFaHyLRHlstKFB1yMOwnQw+OW
         1Acw==
X-Forwarded-Encrypted: i=1; AL+hErEDWkb56fRT3Ad2i4L+AbPdlikErLqORt9M4uzsg89Yb3uJPj3XJ99ABoDvopZzsOExWL36kAbgpw7wi38=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z5EsG7cmRshGl+tcBYiNd2sFVi6q30G5LAQQyvrwmlccrRglB
	uEq3np42E5dzKaWmV720YboBZ05kumETlRp1t7kgNYqCprfBFbsq+a1v39ghMRoL6yRwJSoBfrN
	nmYov4wRvIg==
X-Received: from dlbur9.prod.google.com ([2002:a05:7022:ea49:b0:1b3:b4b8:1a68])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ed02:b0:1a3:9936:d11e
 with SMTP id a92af1059eb24-1b50313d85emr3571276c88.41.1794613062929; Fri, 13
 Nov 2026 15:37:42 -0800 (PST)
Date: Fri, 13 Nov 2026 15:37:35 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113233739.3626499-1-irogers@google.com>
Subject: [PATCH v2 0/4] perf tool_pmu: Add procfs memory, network and
 schedstat events
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Falcon <thomas.falcon@intel.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Andi Kleen <ak@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Add tool PMU events for memory usage, network activity, and scheduler
runqueue statistics based on procfs data in /proc/<pid>/statm,
/proc/<pid>/smaps_rollup, /proc/net/dev, and /proc/schedstat:

- Patch 1 adds 26 memory_* events (such as memory_rss, memory_pss,
  memory_uss, memory_size, memory_swap) aggregated across processes in
  system-wide mode or read per-process. Per-process mode holds a
  /proc/<pid> directory descriptor and opens statm/smaps_rollup on each
  read (observing post-exec address spaces without PID-reuse races),
  deduplicates sibling threads sharing a Tgid, and falls back to wait4
  rusage ru_maxrss for memory_rss when a forked workload has already
  exited.
- Patch 2 adds 16 system-wide net_rx_* and net_tx_* events from
  /proc/net/dev, tracking deltas across enable/disable transitions and
  handling mixed CPU-map event groups safely. Per-process and cgroup
  modes are rejected with -EINVAL since /proc/<pid>/net/dev reports
  statistics for the entire network namespace rather than an individual
  process.
- Patch 3 adds 8 per-CPU schedstat_* events from /proc/schedstat,
  tracking per-CPU deltas across enable/disable transitions.
- Patch 4 extends the 'Tool PMU' unit test suite with tests for memory
  events (including multi-threaded Tgid deduplication), network events,
  schedstat events, and mixed CPU-map tool groups.

Because these events are exposed on tool_pmu with JSON descriptions,
they can be used in metrics, listed via 'perf list', and inspected in
the Python ilist application.

This series was developed and reviewed with assistance from an AI coding
agent (Gemini 3.1 Pro) and reviewed with Sashiko.

v2:
  - Rebase onto perf-tools-next (adapting to reads_only_on_cpu_idx0 and
    tool_pmu enable/disable support).
  - Restrict net_* events to system-wide mode (-EINVAL on per-process or
    cgroup open) and report deltas over the enabled interval rather than
    cumulative boot totals (Namhyung Kim).
  - Fix unpadded /proc/net/dev column parsing after ':' and fix memory
    unit scaling and statm field offsets.
  - Open /proc/<pid> with O_DIRECTORY for per-process memory_* events so
    post-exec mm_struct changes are observed, deduplicate threads sharing
    a Tgid, and refine the wait4 ru_maxrss fallback for memory_rss.
  - Handle non-leader attr.disabled and mismatched CPU maps when single-
    CPU and per-CPU tool events are grouped.
  - Add per-CPU schedstat_* tool PMU events and 'Tool PMU' unit tests.

v1: https://lore.kernel.org/linux-perf-users/20260104011738.475680-1-irogers@google.com/

Ian Rogers (4):
  perf tool_pmu: Add memory events
  perf tool_pmu: Add network events
  perf tool_pmu: Add schedstat events
  perf test tool_pmu: Add memory, network and schedstat tests

 tools/perf/builtin-stat.c                     |  81 +-
 .../pmu-events/arch/common/common/tool.json   | 300 ++++++
 tools/perf/pmu-events/empty-pmu-events.c      | 422 +++++---
 tools/perf/tests/tool_pmu.c                   | 689 +++++++++++++
 tools/perf/util/evsel.c                       |  53 +-
 tools/perf/util/pmu.c                         |   4 +-
 tools/perf/util/stat-display.c                |   8 +-
 tools/perf/util/tool_pmu.c                    | 916 ++++++++++++++++--
 tools/perf/util/tool_pmu.h                    |  52 +
 9 files changed, 2316 insertions(+), 209 deletions(-)

-- 
2.56.1.703.gf848ed807c-goog

