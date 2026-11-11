Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419545;
	b=Hqa8rAjjs9K8beScGkz+ka6sUFzvik4UB9IyMjo8XdvK9B6PGuXzpy5uDOZoETfDDZ5U
	 NqD+pJ8uGsbi1QE2U7Hq8DCsKZt4dMeRCh3OtQBYAcUlnQvDkhAfUlzDcUOcb54/73vl/
	 xbjve+afaeg1aFdMYNrlJLeEXPJoHhmmXLhb6osHn2toMjc2pJjLOeOmZrwms19OgzjPo
	 YSCXMPbBfJdGaYDx5bauiO76sDU9xaiB9LuEKAAT/68XJQuUUjPF/is66/R+Hivy9WLb+
	 xavMRG3MQ9piLnSRNjx5+3O/DB1f5pnHiKbirwBtM0qL3XLq4vQErKyXiZrduuNLBOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=P5+w84baakYMlxmurzGdxKb0ESJofLuo3Amc1fBjJPk=;
	b=h3s3hu4x2uwtbJDd/xZjSbFutDXJpG7QQQCr+z2RrXh80wz9C2b6bat7SuIjz3CKgUKB
	 QrCVAoOQZZ3okaG0pa6KcS9c52eIL4voPfb/vWR0B6Xe2RZg8Lpd9paAokWyxQHxUyzyI
	 czztVklnJ629Vlz8p4e3Pys9EZwD91A7pHbcWiqHwyhGx3PKsR17xD3dvE/s/E68vzRkH
	 RnT1NQW0CsxBhhJ/B0C66jUsmiY9ulHpAw0SirToVMzW09tMOKmmeS4cFFFQb1b34cApq
	 UctFlMjDmTO/mS8iTvBrEJ8SRfaj5nRgEvcPUUFcBNzchFjtKhLwganrnmLrcL0EYlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ac//Hv76";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBCD606A896
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBCD606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ac//Hv76
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-533202fe429so611cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:52:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794419544; cv=none;
        d=google.com; s=arc-20260327;
        b=K9EGN5UjRFnvWLYCG8zPqcnKYtRkodJLsZfkyhIAi1m8u9Cb4TemSxIz52ndGFFFY5
         bMKN+JmOQICEBzaUA0dsD4yI3LgWbjvpQIbfAjwpR6Zv5CBRmx9+9zJmjpuQlpQG6UMG
         ekL/icf+65zyMv4/yn36lgTSb5ZpGxaKOTCsBgf9R/w++rDQiobIN+gtQu6/+CaBf6A8
         6ZBxaMLbadXsL17Q8Cpu3pf6cP5+d6Gf+fxpxfLDstX0mB74HipyTdypAHGuccQjV2lO
         m2Pcwb0m4O8iFFGMXjSUDDQCOWxa9TsjfmqiTliH9EyWnmwP224DBHTeoyHqQMaoCVgz
         aHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P5+w84baakYMlxmurzGdxKb0ESJofLuo3Amc1fBjJPk=;
        fh=OLXD3+Qjqfq0jMYk21N4xYvOnnvsSsfKKWUO1CZKtZ0=;
        b=TOSz9OUvRDNCQhWe4M2HhZK3t51F40/Q+8+DJz2rvilx/fy6IjLgCgenb4cPri8f/D
         I03/LeP8si7JA0vUKAVAg5AD96exB4VDX0glInnJ0KmhgFLc4o8zpza8jPxw/udgHKsK
         sqZepMXH5sKTp1Ey0g0V20tVNsi1FOL3whQNvgrVjJxjJIGqXXGrEc0gHrw4ju8lJpkM
         oQ0kaB3dHCqeUfWBySbsSCtSKJVuIQ/2R+fpxHfXKc0yHx6q5TTA98oc3f+GC5D2sdjH
         UdeXpehpaQSGhs1pdHu/0MFzmMqbgdnOgTg4UsfV182DYU5zLcIa3IhW2EaCH490M0Co
         N3mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794419544; x=1795024344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P5+w84baakYMlxmurzGdxKb0ESJofLuo3Amc1fBjJPk=;
        b=ac//Hv768QBgjIMkKBQSe54tGbfGIWcrRokZwPy5ktkunMulxm5DVyzeCwOKBg8vIw
         MTTxVauDIB6+ArJ4IccBplhXG8Y/7uK3H+Q0j26CuHhjUo6jKbJw0RzUG5VwPBmeR25C
         8fR4Z6z9PZ0YhrdQS3uXpKtHLYyYyhutXKKHl+7lTNAxpxR6dwVuWEomce7GOvDE+sMZ
         9RicP8fANz/GMOuQmXyWdcbWHZ0WfFOaIZzPjQ1+SSL8YOXLQirisZyCkoQAoP1DM5RL
         7LdV+syNfW8N0LuX+0Y9Kks2+db+OkaVonoeOFsIvLbM7JmoEbfpg5yWjcYlM9Ts+0tN
         TePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419544; x=1795024344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5+w84baakYMlxmurzGdxKb0ESJofLuo3Amc1fBjJPk=;
        b=wSraywyy/QBNaC/E5QtFj1kCEyLOlaI+xI4Pq3a8oGoSSyjgJWfVmE3KWpuCoB+BDN
         IHMfiOdjsnPjH5mGXZ1282jLPPe8SjWbObhlemxZP//Cqi77KzIXq8SDkrJhTRitNhL0
         ZMrdaMf5RsPRv4EwDA6I9S0ZnXTpanh+9mZzmsfIm//82wQO/apUoRI2tqs4qrRSdUfv
         7YQENEIE8f2muRkPyrgcQIZMv+3N+P49jVx4AvCGxK6wMZKlRWaWVmUS8MesenRxhjf2
         m9RDOvcfZOwtLUmW9RO2yTxDmpUu5dMKCGK+luZF/jB5XTCD5NfpLAjJ203y9bfSJMSY
         ABkA==
X-Forwarded-Encrypted: i=1; AL+hErEbQXYDB3jVOGWKdyp1hiU5iEywjiRAnyaYMoUD8qV2KpByB6vYZBtNQCjdewq7pAUsAE2KUZa7xngleQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dvKX657qcPTYn/0IiNWOlm+fJnAomQxlOekjf4Cnit4scnaox
	G9MDfUn7fqSp/c2Ul7Z/GiHZV5TeB3VkvOsyKTkli6KXV4CKMSdYAYcf7SDpSP8px3zO1tIvmrD
	MdkkDnynZQsEfMJK0aUsnxiUajyP75IdaFTtT5UZo
X-Gm-Gg: AYBFou0DxSSJcufEL7ehyICNOiG+VP9PB2Sdjg2u3x7XwZ5o1NxnZfISSGHIJE356EJ
	I7fo6nWrDdNaUNw1BBWWsW/MpoJX59vVe+jFeI9/HLAyIi9uRorJvfdJC27N6+jzQgxNd+nL1iR
	cEM/omrGwg+0eHdTB1uu0tauV0NthDpmefv/1LRNHExCgKALiNBlhT4QF9mjcQRbDl9fCnzTBHd
	QxWyJkRewPuhc1xTpLlqP7l1+rqmh+mgzXTdHUy4YQPebp5zqutdId+hnYNohqni9PrleZAZnW7
	Cv353rmTLCn0yWMQ8Wp9nh8kHlzrUc7jZkqex+1l/tzbFeQlJBxfftqMuos1KqDMLIUkxbjmZA9
	AYmHXD6xlQBmYte76B9oJulnarIwERnN5Bypizo4EEJkFEtzvOc4V7br0uA==
X-Received: by 2002:a05:622a:4d91:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-5569e71ab9dmr25300801cf.2.1794419542771; Wed, 11 Nov 2026
 09:52:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022210753.1851597-1-irogers@google.com> <20261022222245.2064964-1-irogers@google.com>
In-Reply-To: <20261022222245.2064964-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 11 Nov 2026 09:52:11 -0800
X-Gm-Features: AclHuK9DRkfOycmjU6BBrM6wRCKLw_GMvonjO2tOpkb71cEcT3xPaK4tPgJs_wM
Message-ID: <CAP-5=fVgSpx5nS5mXthvyAkjHVJSGGVxr6W0NRB2+ekOUHjx7A@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] perf test: Per-test timeouts and JUnit XML schema compliance
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: 9erthalion6@gmail.com, adrian.hunter@intel.com, james.clark@linaro.org, 
	jolsa@kernel.org, leo.yan@arm.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:22=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> This series adds per-test timeout support to 'perf test', improves JUnit
> XML output to validate against strict JUnit schemas, and ensures time
> spent waiting for the shared mlock budget does not count towards a
> test's timeout or reported duration:
>
> 1. Add a per-test timeout (default 120s, configurable via '-t'/'--timeout=
',
>    0 to disable, disabled with '-F'/'--dont-fork'). Forked tests run in
>    their own process groups and the existing polling loops in
>    finish_test() and finish_tests_parallel() check elapsed runtimes,
>    sending SIGTERM on timeout and escalating to SIGKILL after 1 second.
>    Timed out tests are reported as 'TIMEOUT!', listed in the summary,
>    and recorded as '<error message=3D"TIMEOUT" type=3D"timeout">' in JUni=
t
>    XML output.
>
> 2. Update 'perf test -j' output to validate cleanly against both the
>    Apache Ant/Windy Road JUnit schema (JUnit.xsd) and the Jenkins
>    xUnit/Maven Surefire schema (junit-10.xsd), including required
>    '<testsuite>' attributes, '<properties>' from uname, '<system-out/>'
>    and '<system-err/>', self-closing tags, apostrophe escaping, and
>    UTF-8/XML 1.0 codepoint validation.
>
> 3. Record each mlock-serialized test's start time in the shared
>    mlock_budget mapping when it acquires mlock_budget->lock in
>    run_test_case_mlocked(), so tests waiting for the mlock budget do not
>    time out while waiting in line and their reported elapsed time
>    reflects actual execution time.
>
> v6:
>  - Reap finished child tests (invoking kill_timed_out_group()) before
>    draining process.err in finish_test() and finish_tests_parallel(),
>    and skip draining in handle_child_pipe_activity() once a timed out
>    test has finished, so a noisy surviving subprocess cannot block the
>    pipe drain loop before the process group is killed.
>
> v5:
>  - Rebase onto tmp.perf-tools-next (patch 3 of v4 was applied upstream)
>    and add Namhyung's Acked-by to patches 1 and 2.
>  - Add patch 3 so tests waiting on mlock_budget->lock don't time out
>    while waiting.
>  - Increase the default per-test timeout from 60s to 120s. When running
>    the full suite as root (where CAP_IPC_LOCK lifts the mlock limit and
>    mlock_budget is unused), all ~180 non-exclusive tests start
>    simultaneously at t=3D0 and contend heavily on CPUs, /proc scanning,
>    and vmlinux/DWARF symbol resolution. On a 28-CPU hybrid machine, a
>    60s timeout resulted in 33 timeouts across the parallel burst and
>    large sequential suites; increasing the default to 120s allowed
>    longer tests ('kernel lock contention analysis test' at 115.3s,
>    'task-analyzer python test' at 94.7s, 'perf data type profiling
>    tests' at 92.6s, 'perf metrics value validation' at 91.2s, 'perf
>    record tests' at 79.0s, and 'python profiling with jitdump' at 62.7s)
>    to complete, reducing timeouts from 33 to 2 ('perf record LBR tests'
>    and 'perftool-testsuite_report') and overall suite wall-clock time
>    from 503.5s to 363.9s.
>
> v4:
>  - Drop the ITIMER_REAL timer and SIGALRM handler in patch 1, relying on
>    the existing 10ms/100ms polling loops in finish_test() and
>    finish_tests_parallel() to detect timeouts.
>  - Only fall back to kill(pid, sig) when kill(-pid, sig) fails, and
>    ignore SIGTERM/SIGINT while waiting for subprocesses in
>    run_test_child().
>  - Add patch 3 to avoid stack trace noise in verbose=3D1 failure snippets=
.
>
> v3:
>  - Block SIGINT/SIGTERM while a test process may be reaped and until its
>    pid is cleared, and skip already reaped tests in the signal path.
>
> v2:
>  - Reset SIGALRM to SIG_DFL in the forked test child.
>  - Replace the blocking waitpid(-1) loop with a bounded, non-blocking
>    wait that only runs when interrupted by SIGTERM/SIGINT.
>  - Ensure the SIGKILL escalation reaches the whole process group before
>    the zombie is reaped.
>  - Factor out timespec_diff_secs() and TEST_KILL_GRACE_SECS.
>
> Assisted-by: Antigravity:gemini-3.1-pro
>
> Ian Rogers (3):
>   perf test: Add per-test timeout support
>   perf test: Improve JUnit XML schema compliance and completeness
>   perf test: Don't count mlock budget wait time towards test timeout

Ping.

The sashiko reviews are clean:
https://sashiko.dev/#/patchset/20261022222245.2064964-1-irogers@google.com

There's an additional patch for making the mlock waiting time not
count as timeout time:
https://lore.kernel.org/linux-perf-users/20261022222245.2064964-4-irogers@g=
oogle.com/
that is missing any tags.

Thanks,
Ian

>  tools/perf/Documentation/perf-test.txt |  12 +-
>  tools/perf/tests/builtin-test.c        | 662 +++++++++++++++++++------
>  tools/perf/tests/tests.h               |   7 +-
>  3 files changed, 535 insertions(+), 146 deletions(-)
>
> --
> 2.56.0.307.g5fe7bd680c-goog
>
