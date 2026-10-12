Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D540357D08
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791848860; cv=none; b=QbjO/MHC+jwhnvcrf/75tHhdKSoKhRWlQh/TSZ+DOsRTzoXgdaRS3igXCtQcrwaF3eI91Z7ZYjBnnjvstboC+lfTL5eDQN213ZeE2KaWIdVnCmUYIXQQoNXWi+pM+J7oRUlnuPMkXoahxCpA43ibGRLZydIF8mvsXLUFYJClUm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791848860; c=relaxed/simple;
	bh=BS+7adD6JaJlx+m/q9r6uvUaMPyQ0CEfgoa5rcMuGfY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K9yjN1K8DRpNI+1aecBC4Ue77FDlhjtU8o19AyB6tugllxQIpTFWj963BDZFDo/uBjY9b8tLFy4g0YvzHITloWHi7NWVqIAOp7/Qvpqo4stgnr+dFO9/o+WsMzLx2qAD0OWPmOdX8cwcCAjVZYg2o93jPYtZj9WqpurUc8HUMsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tJ07bbVb; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tJ07bbVb"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so6806214eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791848856; x=1792453656; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhoKAKgW2UnYHdcBLKjBFWI63vcozY1ag7JKlvjpeLU=;
        b=tJ07bbVbHn9glEYr9/QEm2mdnTiBLNePknd3zhIevAQ3DNYu3xfW0tpVeNGlyjpf3u
         hjv099B8xnjGhPvECEVPtYmLEoUpqibDvzxPQaQD2RyftXEkWjZIWp3hfrQ3NWeUr68U
         MX+hwc1mVtD43D7ct77D+za0D/HP1uWb6CVSMqCJy+xPiN+Aa6pIuneSkG/DAiuCNlRf
         NgFeBy9hpd+qPPuZGUzmcPSAoJsfs2zsZVVX94A2NW+u6wbR1HQW4lZ+qKUdeNq786c6
         WpNawzFnDQCb3Bh1KwmZb2+QDiP4Ki2k1b4/ick3Y2EWAZilCwxF+FkjxsQNBbN8zV/3
         cP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791848856; x=1792453656;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhoKAKgW2UnYHdcBLKjBFWI63vcozY1ag7JKlvjpeLU=;
        b=FU8beuPod8g8G7OvhJt3/u/jy6CJ6p3mz1uKVBV/CPfk1dQZ5iAVNYFX8EINhGcWHn
         9dd3h7YrTXKVfkRiKdLr2TXaQCVqiX6iDMKoTleIZNfUn/tMq6PzKAuJlmx2XH+gx9iC
         oOwlac8felFMHSCtp3HbA/86F+3KPvSksLwQmvFu6TF4JbYeAH33pruXz3OUQy31JF6i
         Im5BtPZ3SG/8X7JoEPHYBYP9KzbMCSnrrv+I+nwnpQysrvAVNYBg2TFRIIyXWqIaDjxP
         0t4EdYlLkGRtVjJQM9KWPZpXCqhLCim8mKb4ucybFEL63OSjII9xAyUF0u+5oAWuxcod
         hi3g==
X-Forwarded-Encrypted: i=1; AKwUvBw8uILGu2QkCSBtDvYN1TCgQyfiZ59xRPAzMH8Sjj9vI3GLPfqmheJHwuRNVQFTxdSP6hWFomgcA99Zgd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYII4KuNNiEma5c+/2N14qXMmM1S02+Am/zVy9SpX0eHa6GC3Wj7
	F4gf/IbLwsQijFZOsYOb6bPb7TkE+eZCCwjWNk/MA8RiiEhfG8t9ibRm0xwRHhsscbKFM4TKcD0
	tgiVYZJ8ocQ==
X-Received: from dyz18.prod.google.com ([2002:a05:693c:4092:b0:34d:46b2:7513])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:88c9:20b0:34c:79d4:ba0d
 with SMTP id 5a478bee46e88-3537dffd5b2mr17464604eec.14.1791848855765; Mon, 12
 Oct 2026 16:47:35 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:47:21 -0700
In-Reply-To: <20260929025345.88829-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929025345.88829-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012234724.721224-1-irogers@google.com>
Subject: [PATCH v4 0/3] perf test: Per-test timeouts, JUnit XML compliance,
 and snippet improvements
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: irogers@google.com, 9erthalion6@gmail.com, adrian.hunter@intel.com, 
	james.clark@linaro.org, jolsa@kernel.org, leo.yan@arm.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

This series adds per-test timeout support to 'perf test', improves JUnit
XML output to validate against strict JUnit schemas, and refines the
verbose=1 failure snippet output when tests fail with a signal or time
out:

1. Add a per-test timeout (default 60s, configurable via '-t'/'--timeout',
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

3. Improve verbose=1 failure snippet selection in
   print_test_failure_snippet() to skip blank and stack trace lines
   when selecting context and scanning backwards from the end of the
   log, and prioritize the test output line immediately preceding
   '---- unexpected signal' so trailing test progress is shown instead
   of outermost stack frames.

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

Ian Rogers (3):
  perf test: Add per-test timeout support
  perf test: Improve JUnit XML schema compliance and completeness
  perf test: Avoid stack trace noise in verbose=1 failure snippets

 tools/perf/Documentation/perf-test.txt |  12 +-
 tools/perf/tests/builtin-test.c        | 668 +++++++++++++++++++------
 tools/perf/tests/tests.h               |   7 +-
 3 files changed, 543 insertions(+), 144 deletions(-)

-- 
2.56.0.385.gd3acb90ef8-goog

