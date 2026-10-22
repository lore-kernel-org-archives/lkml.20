Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703280;
	b=WDxBpGzvsDQmj7A7Q7EorIHPRPMisLNUp934RPg9jECibKrdX4F4IO0SEdQKo7vPOQgo
	 46CVLEEuIeeA9HQabUpSCYl23eak64tOCKOIcXGssvN2w6qHxl4pWvu2xApBAWW5+YuIw
	 KvHVoCZa2NqnQY9xGuBDpOqqYQhNIVGpT9rsceqPw4mqoeKygJK56sz+8GaxnVU3s7xZS
	 +ly5zuIhgeWrXVW+swAI5XMncThYAQrABdSAwPiCQ59zM/Uoj9VnmqCZ9zrowtBzJfDsj
	 u9sTcFeo+GYnDf0hEhX1z6E/yUGc2oNXxAeYh6MlKKJFuSpis61AKTlt5SEDs/3sOTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=jKw4jeb5she+TCjNL++4qL58FUp4JHa8SatGZluz1Ho=;
	b=Pff7GKk3p/aYCRioRuCEB3NgFQA9R36WY6rhN7NMvNDqEHKi2PTk0CmPCsL8xjnvT2Fp
	 /c9yN+ZM2RXCP/gmJi0rCV8igNBWiVBo2Fly+qpamK7kYDcM9DW39DliLzE6uPxhqfB9y
	 9pX9fwX4mZfzwx4X5uESEjUrDfdThqBHB4H/ASeeL8wa6SEUrShFWCaod+WniczcJL5ai
	 P60oT8JAl05ufkK4dMaP2GA6i27zyYSqr4LVlPMOqwpEcIYNo8f/QA2M6/DuAwdAG5z4r
	 xKcB6eJ+fHLdZhT5QIF9nsASsJ3YHQC9K64SLtqbGoUsqQ62RpizPrh1dLRqPJdbVRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bWTWmjKL;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FB4606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2FB4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bWTWmjKL
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-193b5eb133eso236665c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792703279; x=1793308079; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jKw4jeb5she+TCjNL++4qL58FUp4JHa8SatGZluz1Ho=;
        b=bWTWmjKL1a2A93vx8MRnFUdcww9htHXE7z8Z/pmNJB/ac5YLcPU/yId4toCLzkzP+Y
         A5Gqz9bZS3B+4iL6VV73IyG3sVq/7A9L6x5pudUAlaqr0bC0vn347J5xm4MbUDv3ya2V
         hy1060lfo7KDdnary6ufPi7fdmmwYlsa9PwxeFU23MmSzq+9SaHLZcoYXctqFrt69s31
         q/HhLl7Mgw48PwF9M7N2EXFqjKh1pJV1+Gghwt5SPI1s6H/svGB7lCxj/h4U/sSBB56t
         ccbEmDna3s/IcPvIs/CnqpEUhrlFzVvrY2MFh66Kf+XMpWWpvSVeqdYkS38dTSNlQnIu
         eIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703279; x=1793308079;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jKw4jeb5she+TCjNL++4qL58FUp4JHa8SatGZluz1Ho=;
        b=As/LnBImFaLUsqVlNaT6sZxt5naMdd9I3spotabCd94AX1TfLbyqrKX/TNebTJAy9l
         ZEIh7cqsQWPMYA9fZHEGyosZHYXHUKvYG7TSDoGbtP6kgB9XRIb7f74qvtXbut33Qx8o
         LfU195ZVtJx8QRUxiILOb9Zein0l/J+DBIz2AfgCc/PDDl8OLEkXbSImrOnNUSE5YCDn
         BeLhnp3XEtlYYX8FHHw01DMhlUD23VGqfpxU0PlQiTDz7AcNabpXtoalgVl2NFtKWqjg
         Xg2BicJHXEbYq65Y5DNQ5Cs05tYd9DucZPMVcNPVtGRRmbw3asdvxakghoag+L5vi5iy
         EWpg==
X-Forwarded-Encrypted: i=1; AKwUvBwaKi6MO4zpFPswE8FGoQY2yltDXgFk77PsZQ2emaxjIAEFos0gkCiemZcWJk9lIvMJF9OFItUnqXq1Mv8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnMzOQAkkV8YXmFvUML9iCzCpos90W4g8hYyfWB6YBtFiCu0rW
	noDeTPenaugbMv8NHgmSdHp4FpCQWFFrX2QGTq4ne0UUbAPLDJI47aHAtBCX5Utfx+TRk/87aZ+
	YosVc+gPUug==
X-Received: from dlea17-n1.prod.google.com ([2002:a05:701b:4211:10b0:191:592e:bf3b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4201:10b0:194:f017:5a01
 with SMTP id a92af1059eb24-1959a47a42amr743965c88.42.1792703278359; Thu, 22
 Oct 2026 14:07:58 -0700 (PDT)
Date: Thu, 22 Oct 2026 14:07:50 -0700
In-Reply-To: <20261012234724.721224-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012234724.721224-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261022210753.1851597-1-irogers@google.com>
Subject: [PATCH v5 0/3] perf test: Per-test timeouts and JUnit XML schema compliance
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
 tools/perf/tests/builtin-test.c        | 645 +++++++++++++++++++------
 tools/perf/tests/tests.h               |   7 +-
 3 files changed, 523 insertions(+), 141 deletions(-)

-- 
2.56.0.307.g5fe7bd680c-goog

