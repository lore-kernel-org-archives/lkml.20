Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792707773;
	b=zOlN5bqVNVwjtjCWwIUoZ5SwBTTET+RI2oHr+YibxTYfunHlwQ6nsaGMEbVcUZGVxnyX
	 EdbY/SOq3dgHGmfP8Pa5FWm98UMVu/BkF32GxwKRVGXipg7BUzOHaxqLGh2Hj0VKcF5ga
	 czNn8xkkQa9LVPlCC217QZyCALKpqJWZtNJuBb0LE2HEv4C35Mm2y7Ai7XP5vk429Q+H7
	 B3u1cNFyN69yMPDvDOAIGgtJpv8Z+NYu7076N36GJuvktSBhw3Q709suYk1rSbLYAcAE4
	 chnHUa1jvUVdFB/dadyyFx1yVCRUwJXYDFV7RdJJAc/XaqdLpfFj9176NQTtGTbZjEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792707773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=UVxjYxR2Ga4AD1SUiwzSODCyhRYwmhdSecMtJaDvwRE=;
	b=Ryxv0cvvPwgLJiuhxUMoq5NXlmV6jmijGKQGuCbbl01EGyNQ4FNsMOsGWpRPlxH1Aq3/
	 dCXOp+ZOVYkzcWcNu2+lldU04CrD19jagFtW5akxACcHg90WOS1r0JjnKWp2mg9ss7z17
	 n4WiXuQUVg4qo4ziRRl7yBdET9luYWUV+mSNwqxx1LkoXMIb29jf1dfl8NofhjSD62+Gn
	 TntjtAlUdsjMgTHHQUjc+OeM5wGp8AC7aWny5+rWFfWMKb2sLzlyHUGGOIzX0fr3dS6on
	 iLMSjtSWDVdenvvFApqhqI4Rl6Fvj71gqq0iWpsFN7dnce1u4WQPqD45wxtPfaRdMRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nujha08u;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06788606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06788606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nujha08u
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-186c1aae818so808810c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792707771; x=1793312571; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVxjYxR2Ga4AD1SUiwzSODCyhRYwmhdSecMtJaDvwRE=;
        b=nujha08uBiHV9yNntrjzSxB9TFEnEdtdpbZIFap4x/qc94zp3xb6278/2a75sjiezz
         4ipvrbFLRAA5oICqipsnR0TY263OOlQvINncxfVgszKS7zWARrrbZgBndJXAU7e0kM79
         xKrcSrB+TuIgn2e7aVtRyh2N83z0Ujo22LzV+KvS7U0FMGMJEbx0RWRhMQajmst5YZCo
         /4EOFYoK2eQMhQILzx6leHRH3Nd5igmUcwYot1ZfuKJFJwyQ+Z3XJ+GaLKRWF98pBLQq
         HHDWAov4fWz5iBOXSbsLKiyTRK+8SCbXl9yE94npbHT+Qxlglo/A6EIMR0Ue5alDvEWM
         ltEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792707771; x=1793312571;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVxjYxR2Ga4AD1SUiwzSODCyhRYwmhdSecMtJaDvwRE=;
        b=XylFl8u5wxbgnF5drWIJDj3UhrZLjXHEfmFz8WB1AvihfR7Nq9O1H+Z8QMC+eE85pR
         08HZkkJPZ2SA50IsWT6+kvL8Z9jMoouMS1MFcNK0lC7zMzHYF04lgdJ0djCDRSGzxL3I
         AtcqcP/fOzh27z3XVEtNid5+pEvqHj3L+3ijqnf2C6FXUDkvhX2KcRbECrdD/DNGQxDY
         p07bX9QWZ1/EtaXDQtB2EilCPsEoqtrru6hYLK/Tnvjq332gOHbmBtwW3UAb+6guBhxl
         DOV2LIWx2uFjkEYojqBaQBZEA1qUaSmqsdEm4zWpt3o0B01RU6+FvRqZKxaDcmX+DUHr
         DMoA==
X-Forwarded-Encrypted: i=1; AKwUvBw3v2qLB7UzD7NaQTEuBMI9uwoOn5z3n4xPzMOf4wwVFQL5GN29CeBccLxx3Kbdhm1m/BdqKe1oXPcLCs4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/0uUZur6807QoMH7coN+dHYs/5qCOJdFeUR1sJ8Mwi2ZyG17B
	lbLAvrPMln6GkiRTSEr3Yw4TGC79CGOUADZNWSmNGrE0ffKnvGN71WciQrkroViqmWXadGjf1LL
	kHBqNJlz+hw==
X-Received: from dldnz14.prod.google.com ([2002:a05:701a:ca0e:b0:183:f9d:1eaa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea51:b0:14f:505d:813
 with SMTP id a92af1059eb24-195c3654b31mr670501c88.41.1792707770695; Thu, 22
 Oct 2026 15:22:50 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:22:42 -0700
In-Reply-To: <20261022210753.1851597-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022210753.1851597-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261022222245.2064964-1-irogers@google.com>
Subject: [PATCH v6 0/3] perf test: Per-test timeouts and JUnit XML schema compliance
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: 9erthalion6@gmail.com, adrian.hunter@intel.com, james.clark@linaro.org, 
	jolsa@kernel.org, leo.yan@arm.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

This series adds per-test timeout support to 'perf test', improves JUnit
XML output to validate against strict JUnit schemas, and ensures time
spent waiting for the shared mlock budget does not count towards a
test's timeout or reported duration:

1. Add a per-test timeout (default 120s, configurable via '-t'/'--timeout',
   0 to disable, disabled with '-F'/'--dont-fork'). Forked tests run in
   their own process groups and the existing polling loops in
   finish_test() and finish_tests_parallel() check elapsed runtimes,
   sending SIGTERM on timeout and escalating to SIGKILL after 1 second.
   Timed out tests are reported as 'TIMEOUT!', listed in the summary,
   and recorded as '<error message="TIMEOUT" type="timeout">' in JUnit
   XML output.

2. Update 'perf test -j' output to validate cleanly against both the
   Apache Ant/Windy Road JUnit schema (JUnit.xsd) and the Jenkins
   xUnit/Maven Surefire schema (junit-10.xsd), including required
   '<testsuite>' attributes, '<properties>' from uname, '<system-out/>'
   and '<system-err/>', self-closing tags, apostrophe escaping, and
   UTF-8/XML 1.0 codepoint validation.

3. Record each mlock-serialized test's start time in the shared
   mlock_budget mapping when it acquires mlock_budget->lock in
   run_test_case_mlocked(), so tests waiting for the mlock budget do not
   time out while waiting in line and their reported elapsed time
   reflects actual execution time.

v6:
 - Reap finished child tests (invoking kill_timed_out_group()) before
   draining process.err in finish_test() and finish_tests_parallel(),
   and skip draining in handle_child_pipe_activity() once a timed out
   test has finished, so a noisy surviving subprocess cannot block the
   pipe drain loop before the process group is killed.

v5:
 - Rebase onto tmp.perf-tools-next (patch 3 of v4 was applied upstream)
   and add Namhyung's Acked-by to patches 1 and 2.
 - Add patch 3 so tests waiting on mlock_budget->lock don't time out
   while waiting.
 - Increase the default per-test timeout from 60s to 120s. When running
   the full suite as root (where CAP_IPC_LOCK lifts the mlock limit and
   mlock_budget is unused), all ~180 non-exclusive tests start
   simultaneously at t=0 and contend heavily on CPUs, /proc scanning,
   and vmlinux/DWARF symbol resolution. On a 28-CPU hybrid machine, a
   60s timeout resulted in 33 timeouts across the parallel burst and
   large sequential suites; increasing the default to 120s allowed
   longer tests ('kernel lock contention analysis test' at 115.3s,
   'task-analyzer python test' at 94.7s, 'perf data type profiling
   tests' at 92.6s, 'perf metrics value validation' at 91.2s, 'perf
   record tests' at 79.0s, and 'python profiling with jitdump' at 62.7s)
   to complete, reducing timeouts from 33 to 2 ('perf record LBR tests'
   and 'perftool-testsuite_report') and overall suite wall-clock time
   from 503.5s to 363.9s.

v4:
 - Drop the ITIMER_REAL timer and SIGALRM handler in patch 1, relying on
   the existing 10ms/100ms polling loops in finish_test() and
   finish_tests_parallel() to detect timeouts.
 - Only fall back to kill(pid, sig) when kill(-pid, sig) fails, and
   ignore SIGTERM/SIGINT while waiting for subprocesses in
   run_test_child().
 - Add patch 3 to avoid stack trace noise in verbose=1 failure snippets.

v3:
 - Block SIGINT/SIGTERM while a test process may be reaped and until its
   pid is cleared, and skip already reaped tests in the signal path.

v2:
 - Reset SIGALRM to SIG_DFL in the forked test child.
 - Replace the blocking waitpid(-1) loop with a bounded, non-blocking
   wait that only runs when interrupted by SIGTERM/SIGINT.
 - Ensure the SIGKILL escalation reaches the whole process group before
   the zombie is reaped.
 - Factor out timespec_diff_secs() and TEST_KILL_GRACE_SECS.

Assisted-by: Antigravity:gemini-3.1-pro

Ian Rogers (3):
  perf test: Add per-test timeout support
  perf test: Improve JUnit XML schema compliance and completeness
  perf test: Don't count mlock budget wait time towards test timeout

 tools/perf/Documentation/perf-test.txt |  12 +-
 tools/perf/tests/builtin-test.c        | 662 +++++++++++++++++++------
 tools/perf/tests/tests.h               |   7 +-
 3 files changed, 535 insertions(+), 146 deletions(-)

-- 
2.56.0.307.g5fe7bd680c-goog

