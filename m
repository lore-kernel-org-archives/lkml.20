Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672AD3B05AC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792190413; cv=pass; b=fe0wB6Gx1/RWbf2mKhkWfJ9SemIOuy8AoPFIgVZvlD8Gpo95HOkGeU5zuHlW180jSjp8zIsX7tVhJZDybSxISZJiBVfZcb3jAoyY6tXp0kC0IsN3KIZXjIg+iDwgKQMqKfXfZAQf8SmhkWVZtZLbqYwrLJHfqVjuM+Qml06i9zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792190413; c=relaxed/simple;
	bh=sOxRw7t/BOr+eYjAr6skLgDIcCguREfjWgJFe8K79n8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIG8l5XFz9VkahVtXTggWnb2NFYLw6J1SLT/LILicrdieKlYUIYLchCqmHN4vyEwgKqjTe8qSxqPK0Auvqm101fIQ9jUlS1R85UO/S1We81j8H1eBsyerdz02rbdcr5jf/6Q8nkRLoGnD6eQ97mBJZDTCJYhD6VjHXGwIcdKmWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pB6Tk6Sy; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pB6Tk6Sy"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-533202fe429so111511cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792190410; cv=none;
        d=google.com; s=arc-20260327;
        b=JA/xgAdM0INjiMWIshEQf9f0AuHef05gICo788Dd+6rCY0OsNysfyKjSJ+uz11XYMc
         1ptLYHZQiz8TdHUUIIwKJW2osbsK7MDKQSQo/UbkRt3O7bd2T7WcZLAuhAHbvslUekbw
         9ofrpCGLXKKFAjk+cEXl1nJaepRky9Teso+13QVk/L+ZbZUKyj+Wk1utroO356eDOWBN
         P9UBVInG0XQ6AmVvwQPjYubzB6UjsP2GNlapj8LggJftxT/Ap0XeYJ7Dh567jXvmdoV2
         p6Q1nVK6xgkGhri7Q+oKS5z2sUUhr6/RrH6D/rtSLwTSt4Pz65RwbvtkpVvbajDQ1sUG
         InMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bYKvIaOSQo1etNkfi5cnEjAGlr0xdKQPE2+oAXGa52Q=;
        fh=ytwpPtOue0pX2X+dnD4ZODnAt2SKKhizBCyM0kMTEl8=;
        b=LkOczM8aYMpvRE0aOzlk7DIQUzVQNXBSR5TO74gDhnXSYltFZIgqLh3o/GezhECwq2
         iyC0B2bw9WOl6lCGAdp1OyILGF7Wjxh4NBebMkH1tQpwvBb1cdLjSoMJ1Ltr9B/RFCk9
         cN4RvjM7eTkd8ZemXP0tmMY2XXEtHoTeqBxBXxHB4i7ic2Qwq3uHu5aT+3N4m8YiQjc8
         S5LGhXuXalBGOf5MQ9KrhCT/MQXANExe4mWRJ/Mh6ZRDrlCKG9eNT4p0nvQAwjsZV5QT
         CjB9iGjNbkcrN8xoTtFXWMgIxdiGs7M1ReUZIMH8Jnep8rJk9FoYXMINSjsahrai0AdH
         S2TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792190410; x=1792795210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bYKvIaOSQo1etNkfi5cnEjAGlr0xdKQPE2+oAXGa52Q=;
        b=pB6Tk6SyM2enKY9JSFcStS7jvsln/oXoEDI3BZzlkK6q0l7ivETUMwYoIDBrtKlJOp
         bCNe0M68NGOtm86D0bPNKvw+sgkPlWloZTgFTGJdPZaNcbzaHD2GYhYarazY7F/k7YVn
         609WUiutK2E7oRlmm03icmhgMLR4oQjo3KfxOQnPcjaQQnJa3Ne3u9OMCGD2HGvaOazE
         oFaA0celnWgqXM5QjWMruyvjx4en6KeREKPSsvGiZeAmjIdKK9E4+jvGjM7oi4srX2Jw
         tdSL4dxZfXIAmrTqKCXCvHBunfMlLNKY8R0/zRfn0/vuGduLO5flO5OrNdLdP+xPR4ru
         RXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792190410; x=1792795210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYKvIaOSQo1etNkfi5cnEjAGlr0xdKQPE2+oAXGa52Q=;
        b=FirwntG1efp1spcUWhqWRcTDfWRyUI42IcnDR3SkLmjj0fW8GTjFsvgS6CS/IstOGC
         z8+5xwg75f78PkQEOya++pHpt2mBqvQjsNoezX/rGH5+tLj2bfGqSkm6qSClPUKL6x32
         6g8KobszeAQbtjOzLIJsI1aqTXHdClAhoyt01UxmwCWJ+vNjB2FExmfGoWI6CyLvUrSL
         Ic/0OWb6IU0L8Cztf/Ovy+5sHzvnnzmRu8aMiQRVkftfzK3GdQuqxxpmQHvwETaAPAHp
         450WB0b48VhEkTX/P3Ps5HPhmM2WdfuHGReTlmN2kzQv7JSRuCGZ1dcZxFGDPEvnGVpA
         7Mfg==
X-Forwarded-Encrypted: i=1; AKwUvBwwtKJEISL9OqS6CsjM8J6/H5Cgvb1jgPMLrkoovMwWO1VvINQItz7YXOdB+CKxpw7g4AvpmkCkzFKRuYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLj1T2KIs88GsDCdydxurLvtG4UIEy+ytqTbq3jx/aEU9Wcbwz4
	/XMCBQjfPsabfRfXgD8lnFVwfS2abXxjy8IWCSi6f70JKGil1q9FKbhZpL2QazjKObEoOiTMvyO
	plad78QZjhKYqvjjH76v4qHJQFBhBoYQKFB/NJFFy
X-Gm-Gg: AYBFou0p3Cu3JBOlvICoRS68CJ7kJrhmi4OnPVSFZk0RD85lSQvV1j5BLObB3TJRes9
	S+L36/WYREP1yxXdMwVZlin4/2miXt8AAc6o0/IwnULUk06nUH2xWUn1ChLFuQf79aRSTScc47f
	lMa0bEm7GC/EqZWjWf2lY1E0+2L2VKK46M9ne166Mpb3ANrCjzUlS3A6C57wVEVfRMZ3YFhKrxz
	ymOTkxLM9uKDChuqtRNL53OcnTeose3grN5HEanYJx6Qf+TfdbdSHdKSrMenLynKeBW6x+Sil1c
	aj53qOqpKDWleoJV3jQeKyU4UzcrYSrdf1mE9cL3ne5i6vXP7smFW36rtYHvdVnlU4otfNqVJ3Z
	OjuLVzGyh6hI=
X-Received: by 2002:a05:622a:1cc4:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-53649add080mr3143661cf.0.1792190409459; Fri, 16 Oct 2026
 15:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016212102.76550-1-acme@kernel.org>
In-Reply-To: <20261016212102.76550-1-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 16 Oct 2026 15:39:57 -0700
X-Gm-Features: AclHuK-MEuWjlJ8yO85tgEMt9BaqGLsii0fCsvv3-V-2yk-LOQnt9p6AcltChzk
Message-ID: <CAP-5=fVy1WhjYXKj8vZBYorE13L1XyF-ornZ3QLRQbSTO+fM3w@mail.gmail.com>
Subject: Re: [PATCH v4 00/21] perf test attr: Report the failures again and
 cope with more than one core PMU
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Michael Petlan <mpetlan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 2:21=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
>
> Hello all,
>
> perf test 82 stopped reporting failures when it got its shell wrapper
> (8519e4f44c2af722), so expectations that no longer match perf went
> unverified.  The prerequisite fixes are upstream now, so they are not
> repeated here.
>
> This series updates those expectations and makes the test cope with
> machines with no core PMU, or with more than one.  Asking for one event
> on the latter gives one event per core PMU.  The expectations ignore
> what that adds; the commit messages say what and why.
>
> The tests that map ring buffers take turns on the per user mlock budget
> (kernel.perf_event_mlock_kb) through a robust, process-shared mutex.
> The sysctl is left alone.  A test killed while holding the budget does
> not leave the next one waiting.
>
> Tested: 'perf test -vv attribute' Ok on an Amlogic A311D (aarch64, as
> root), an Intel i7-14700K (hybrid, two core PMUs), x86_64 (AMD Ryzen 9
> 9950X3D, kernel 7.2.10-200.fc44) and riscv64 (Orange Pi RV).  On
> riscv64 the stat tests run and the record tests report unsupp, as
> sampling is not available there (no Sscofpmf).

On a hybrid Alderlake:

Tested-by: Ian Rogers <irogers@google.com>
Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> Best regards,
>
> - Arnaldo
>
> What changed from v3:
>
>   - sashiko-bot's v3 review: the python binding no longer leaks the
>     parse error entries it prints when parsing fails.
>   - sashiko-bot's v3 review: attr.py no longer compares an event against
>     itself unrecorded, and masks both sides with both events' types.
>   - sashiko-bot's v3 review: evsel__open_cpu() no longer leaks the fds
>     of an attempt abandoned to disable missing features.
>   - sashiko-bot's v3 review: <stdio.h> included where FILE and
>     snprintf() are used, in builtin-test.c and tests-scripts.c.
>
> What changed from v2:
>
>   - sashiko-bot's v2 review: a one-component kernel_since or
>     kernel_until (f.i. kernel_until =3D 6) no longer crashes attr.py.
>   - sashiko-bot's v2 review: mutex_trylock() and cond_wait() now take
>     over a robust mutex left behind by a dead owner, as mutex_lock().
>
> What changed from v1:
>
>   - Namhyung's python fix and Michael Petlan's two fixes are upstream
>     now, so they are dropped from the series.
>   - Namhyung's v1 report (test-record-branch-filter-any_call): probe
>     events are no longer dumped, and the core PMU fallout is masked.
>   - New, not from review: the 'requires =3D core-pmu' skip, the skip
>     reasons and the mlock budget part.
>   - New, not from review: the events of the other core PMUs are left
>     out, when the expectations name a core PMU.
>
>  tools/build/Makefile.feature                  |   1 +
>  tools/build/feature/Makefile                  |   4 +
>  tools/build/feature/test-all.c                |   5 +
>  .../build/feature/test-pthread-mutex-robust.c |  18 +
>  tools/perf/Documentation/perf-test.txt        |  36 +-
>  tools/perf/Makefile.config                    |   4 +
>  tools/perf/tests/backward-ring-buffer.c       |   2 +-
>  tools/perf/tests/builtin-test.c               | 174 ++++++-
>  tools/perf/tests/code-reading.c               |   2 +-
>  tools/perf/tests/keep-tracking.c              |   2 +-
>  tools/perf/tests/mmap-basic.c                 |   1 +
>  tools/perf/tests/openat-syscall-tp-fields.c   |   1 +
>  tools/perf/tests/perf-record.c                |   1 +
>  tools/perf/tests/perf-time-to-tsc.c           |   1 +
>  tools/perf/tests/shell/attr/README            |  10 +-
>  tools/perf/tests/shell/attr/base-stat-group   |  45 ++
>  .../tests/shell/attr/test-record-graph-dwarf  |   2 +-
>  .../shell/attr/test-record-group-sampling     |   5 +-
>  .../shell/attr/test-record-group-sampling1    |   5 +-
>  .../shell/attr/test-record-group-sampling2    |   5 +-
>  .../perf/tests/shell/attr/test-record-group1  |   3 +-
>  .../perf/tests/shell/attr/test-record-group2  |   3 +-
>  .../perf/tests/shell/attr/test-record-group3  |   3 +-
>  tools/perf/tests/shell/attr/test-stat-C0      |   1 +
>  tools/perf/tests/shell/attr/test-stat-basic   |   1 +
>  tools/perf/tests/shell/attr/test-stat-default |  91 ++--
>  .../tests/shell/attr/test-stat-detailed-1     |  99 ++--
>  .../tests/shell/attr/test-stat-detailed-2     | 111 +++--
>  .../tests/shell/attr/test-stat-detailed-3     | 115 +++--
>  tools/perf/tests/shell/attr/test-stat-group1  |   3 +-
>  .../tests/shell/attr/test-stat-no-inherit     |   1 +
>  tools/perf/tests/shell/drm_pmu.sh             |   2 +-
>  tools/perf/tests/shell/ftrace.sh              |   2 +-
>  tools/perf/tests/shell/kallsyms.sh            |   2 +-
>  tools/perf/tests/shell/lib/attr.py            | 461 ++++++++++++++++--
>  tools/perf/tests/shell/list.sh                |   2 +-
>  tools/perf/tests/shell/perf_sched_stats.sh    |   2 +-
>  tools/perf/tests/shell/probe_vfs_getname.sh   |   2 +-
>  tools/perf/tests/shell/python-use.sh          |   2 +-
>  tools/perf/tests/shell/schedstat_snapshots.sh |   2 +-
>  tools/perf/tests/shell/stat+csv_output.sh     |   2 +-
>  tools/perf/tests/shell/stat+csv_summary.sh    |   2 +-
>  .../tests/shell/stat+event_uniquifying.sh     |   2 +-
>  tools/perf/tests/shell/stat+json_output.sh    |   2 +-
>  tools/perf/tests/shell/stat+shadow_stat.sh    |   2 +-
>  tools/perf/tests/shell/stat+std_output.sh     |   2 +-
>  tools/perf/tests/shell/stat.sh                |   2 +-
>  .../perf/tests/shell/stat_all_metricgroups.sh |   2 +-
>  tools/perf/tests/shell/stat_all_metrics.sh    |   2 +-
>  tools/perf/tests/shell/stat_all_pfm.sh        |   2 +-
>  .../tests/shell/stat_bpf_counters_cgrp.sh     |   2 +-
>  tools/perf/tests/shell/stat_metrics_cgrp.sh   |   2 +-
>  tools/perf/tests/shell/stat_metrics_values.sh |   2 +-
>  tools/perf/tests/shell/test_ilist_python.sh   |   2 +-
>  .../perf/tests/shell/test_stat_cpi_python.sh  |   2 +-
>  .../tests/shell/test_test_junit_output.sh     |   5 +-
>  .../shell/test_uprobe_from_different_cu.sh    |   2 +-
>  tools/perf/tests/sw-clock.c                   |   2 +-
>  tools/perf/tests/task-exit.c                  |   1 +
>  tools/perf/tests/tests-scripts.c              |  85 +++-
>  tools/perf/tests/tests.h                      |  17 +
>  tools/perf/util/evsel.c                       |  42 +-
>  tools/perf/util/evsel.h                       |   1 +
>  tools/perf/util/mutex.c                       | 101 +++-
>  tools/perf/util/mutex.h                       |   6 +
>  tools/perf/util/pfm.c                         |   1 +
>  tools/perf/util/print-events.c                |   1 +
>  tools/perf/util/python.c                      |   2 +
>  68 files changed, 1256 insertions(+), 272 deletions(-)
>
> base-commit: cb9dba6f4764fc68ab75c36e332887332339f9c3
> v1-head: b1300831ecc4503d
> v2-head: da166ef7a002
> v3-head: c5f0897aceb01743
