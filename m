Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79664B7A2F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006459; cv=pass; b=ABk53MHwTXVrASV5R4Y6kEBqn5EoptQ0xKyqq9FU660F8utr36t2TDIjee39Q87fbTo7DTiUCbmx+w/CFfmhbUvKYIPQ/jgCfOYFV+inMK+umenW1x1VK8E6SmiB7zzJlPi59h5v1GILmL7TtPFv6MTCymrW/9Uh8H6J/WCTmaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006459; c=relaxed/simple;
	bh=Ga0+ls8FoVxc1c9FhOUzyKw2f3t1sggxGBroQbxq7Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdtVQbbNLdSPz0HxWzKiL2/ie/fcUHG2veB1Tgk7wjOJ51Z/C+yMbxMUSvEw5VF7z50Kat6NkHSrx7lDARH2blut2dOOofCMlvZc+FkVtBjK6iM7SN2ynQ2JLY/i/jCYm0pXreNtKaYrqFiMHCio3G96rhCVnPoAIyfHKxNMrZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=syh0AO4n; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="syh0AO4n"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db33db4de9so193155ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790006457; cv=none;
        d=google.com; s=arc-20260327;
        b=B4UDSqPSM1a6rJKrvB+NeC09SsRD+0mcH21NHvxx6aP5NcaBGNLMVWHKPRNN9D9yjb
         NLghnbPMIIDYOGL4tOQ0SCWfhuFTLhi7/QarrBCEf8MhWWz/FZiskAOeVUiITVuGlYgg
         VLOCgOKsz2vYlOTqksoU6CGHnnB5UrePZLpyfISy20v4KfnlpKpZf7oF2I1kajJi7X5Z
         ydtzJlVuyMGFjv1F3Pm+EB34mxXAq5rkMem+ZBorT9TlhUN9BrlPLhSbOiilrSq3r0nx
         Q+c7dE7TbcocTjuEfKZS7AtGEZHvIl4J8QpFtdKGMOd76YVVibbUCd60++40mZsQOYhC
         1P7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OKk6v14E/puXf6C6/5MlJvluyYna1IXMIRlveuoXEKc=;
        fh=EVPCzdgs5FCXTO5PtHaRKwX2GfQNmGQ+OJyE2bKLB/c=;
        b=ShvjwkNWiacmBYvoWPWVC0V28VBX5jagsi/+SP7Oj3j19QJym3ULnKIrmP2RQRMlyD
         FfG0jycH0LQNLXGcYvg6UdADKXzjKv43GGaU53mo0W6vPmHf6H4xDSOWFXnLfkAhpukQ
         4znAKRkE6PSmpirc+Aj5UArlc4/RAH/fP07P/NTymRCrRkkG4e38PXenxOrHJ9liGL95
         W4wUs1w0cAiVmUKA2sVKNQW91DXfmvxwZopcybJcjKyoR7342GcbIXCA+/ZeZ2e8gIXK
         nfs2OGwArBzhgjoDk9Q9nDaEMAdLanOuA44Ti841mStJBSDhiLYjXj4y3mOVrKb+iQFo
         E8hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790006457; x=1790611257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKk6v14E/puXf6C6/5MlJvluyYna1IXMIRlveuoXEKc=;
        b=syh0AO4nHIjL3+OKjgpzX4oiCwYXUWPuSo1F9epTPdxG3O8jk2GDE9+xDHXjPQbRR+
         5AOpHCDdA/E2p4eYTh54+NRjewUYkdWHtTE/jv6k00Q3WSf69exLZjflJjFyUtxsdQ5N
         +VpD32zFFvbfiUPRvtCuauJiqaHmtRh9XlbwbzHQ9NgtTv0aLvSMvEBJ5gq3VB/tLHmL
         cXutx0nXCBAbq5Wz33FTJNg0uejnTa4vFLxlhx/ovNaCIiukul6t2dgGi86j0LdGHoKP
         cWfRO+/SzY6oKzLpxekaHETUBSg7WARPY+9P60U1gcUOTv0LGkusPqiYtpjPtAuExEyC
         dxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006457; x=1790611257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKk6v14E/puXf6C6/5MlJvluyYna1IXMIRlveuoXEKc=;
        b=lXmu0MwGoDOL+Yz1n7+SGJsIPMM9PQqkPQSagXSrGwYSNSy/wIHjGm11T1Xhcw/TJL
         wfGmEp9pUwPgNBUP4owOUsVXYOa+imrnA/vMKcDbZzgnb5OVkncFYJ+0Qa/jdMTBs5SO
         cjtGI4X+pO/xMsEG+lQ4nNe3hBtmvwxgdiQITgwFi39ORy8h5dMIcup/hQ7dzINCRX9v
         GjJr8M+eABRYFsOklNeWN8pN4D4F3du980bfz/X6yIIAVYIlph5psl3FkAYntONfVzv6
         vyMChWauCIH5AMKyyy3NYc5/YEKjC679JFzHwJNJzXtO8FUWmk74VsjE4GCdgVyGhAsC
         vgow==
X-Forwarded-Encrypted: i=1; AKwUvBw7vbM+Q1zr1n3fzmt+vvQ/x1R5XmrADJF+h10V8RTMRsY9Ytc02ENh/CPhryeIUDOH30NK2n0iB6b9Iws=@vger.kernel.org
X-Gm-Message-State: AFuF++mN25o1JrYAvFFBdjxepGtWlIQuzRsr4LuIDzHVLt7jUDbguefd
	xjIt2UpW7w/+PrU8iAMtQbphD7UmzC50BI5BwiDVvlwTgBOBA4dqVH27R/l39QAZie9nTZ6286F
	vl7zJxgqvreXYBRQGf5jjWFoBJu+I57UUYNQErdD0
X-Gm-Gg: AYBFou1AptBUQm7l0tyTyTRnqq36lskFHxx4KsZFEFR5Oa4nooS+y8oq0athCxpMB4b
	kYOvB0XfVUa/DuLZUvyOYueKVUp9X5EooBx8ftyiasFVTToWPM7258Hk8X3SWIv2vmTE/HLQSb1
	dUMTZ+AEBk1ozfsiw/MF4kTnoxLN4+R16nBsTKyS354h85m0Ctloh4zOuV4Es5eu8iz+o07ggVn
	XPccSSpcOhQaTWMkHnoz47A/wlo1V0BUQ+oOrQM0v/Zxe7Omm+3t6aWah1rlZSVR46R1R8J/5Vr
	iWKIbIMCHKV0K3SQbbvLi/OvNYy5N/NQCzZAjFtgPbOhB4/jBSifkHgz9gXqd+KQfSiLfJqqQ75
	UoKO0+DA9
X-Received: by 2002:a17:902:ffce:b0:2d5:db3d:1a44 with SMTP id
 d9443c01a7336-2dec1f19e92mr10907155ad.17.1790006456032; Mon, 21 Sep 2026
 09:00:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912031112.1814574-1-sh_def@163.com> <aqdLFApaxDgj1mtZ@google.com>
In-Reply-To: <aqdLFApaxDgj1mtZ@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 21 Sep 2026 09:00:43 -0700
X-Gm-Features: AcwNN1Xzy5ghpFcSPnaGEG5eLF1maptCJOzM5lZ6FhWA2mEb-8LcSDaLUsh75NU
Message-ID: <CAP-5=fUWC6F+_HCqW7eFuaw5StZpdcpb+pXPdHbXE+auNdMdTw@mail.gmail.com>
Subject: Re: [PATCH] perf evsel: Restrict incremental open error unwind
To: Namhyung Kim <namhyung@kernel.org>
Cc: Hui Su <sh_def@163.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 6:17=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Sat, Sep 12, 2026 at 12:11:10PM +0900, Hui Su wrote:
> > evsel__open_cpu(), evsel__tool_pmu_open() and
> > evsel__hwmon_pmu_open() support opening a subrange of a CPU map, bounde=
d
> > by [start_cpu_map_idx, end_cpu_map_idx).
> >
> > Their error paths, however, unwind using "while (--idx >=3D 0)" all the=
 way
> > back to CPU index 0 regardless of start_cpu_map_idx. If lower CPU indic=
es
> > were opened by an earlier invocation, a later incremental open failure
> > therefore closes those existing file descriptors and overwrites their
> > slots with -1.
> >
> > Before this fix, running the new incremental open test demonstrates thi=
s
> > corruption:
> >
> >   $ perf test -v "Tool PMU"
> >    12: Tool PMU:
> >    12.1: Tool PMU                                                      =
: Ok
> >    12.2: Tool PMU leader                                               =
: Ok
> >    12.3: Incremental open error unwind boundary:
> >      FAILED: CPU 0 FD overwritten: FD(evsel, 0, 0)=3D-1, expected 4
> >   FAILED!
> >
> > Stop the unwind at start_cpu_map_idx so that only file descriptors
> > opened by the current invocation are rolled back.
> >
> > After this fix:
> >
> >   $ perf test -v "Tool PMU"
> >    12: Tool PMU:
> >    12.1: Tool PMU                                                      =
: Ok
> >    12.2: Tool PMU leader                                               =
: Ok
> >    12.3: Incremental open error unwind boundary                        =
: Ok
> >
> > Fixes: 4804e0111662 ("perf stat: Use affinity for opening events")
> > Fixes: 240505b2d0ad ("perf tool_pmu: Factor tool events into their own =
PMU")
> > Fixes: 53cc0b351ec9 ("perf hwmon_pmu: Add a tool PMU exposing events fr=
om hwmon in sysfs")
>
> Maybe we just need to last one?
>
> Acked-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> > Signed-off-by: Hui Su <sh_def@163.com>
> > ---
> >  tools/perf/tests/tool_pmu.c | 79 +++++++++++++++++++++++++++++++++++++
> >  tools/perf/util/evsel.c     |  2 +-
> >  tools/perf/util/hwmon_pmu.c |  2 +-
> >  tools/perf/util/tool_pmu.c  |  2 +-
> >  4 files changed, 82 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/perf/tests/tool_pmu.c b/tools/perf/tests/tool_pmu.c
> > index c6c5ebf0e935..667160f9e2cd 100644
> > --- a/tools/perf/tests/tool_pmu.c
> > +++ b/tools/perf/tests/tool_pmu.c
> > @@ -1,8 +1,16 @@
> >  // SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
> > +#include <errno.h>
> > +#include <fcntl.h>
> > +#include <string.h>
> > +#include <unistd.h>
> > +#include <internal/xyarray.h>
> > +#include "cpumap.h"
> >  #include "debug.h"
> >  #include "evlist.h"
> > +#include "evsel.h"
> >  #include "parse-events.h"
> >  #include "tests.h"
> > +#include "thread_map.h"
> >  #include "tool_pmu.h"
> >
> >  static int do_test(enum tool_pmu_event ev, bool with_pmu)
> > @@ -100,9 +108,80 @@ static int test__tool_pmu_with_pmu(struct test_sui=
te *test __maybe_unused,
> >       return TEST_OK;
> >  }
> >
> > +static int test__tool_pmu_incremental_open_unwind(struct test_suite *t=
est __maybe_unused,
> > +                                               int subtest __maybe_unu=
sed)
> > +{
> > +     struct evlist *evlist =3D evlist__new();
> > +     struct parse_events_error err;
> > +     struct perf_cpu_map *cpus =3D NULL;
> > +     struct perf_thread_map *threads =3D NULL;
> > +     struct evsel *evsel;
> > +     int ret =3D TEST_FAIL, fd0 =3D -1;
> > +
> > +     if (!evlist)
> > +             return TEST_FAIL;
> > +
> > +     parse_events_error__init(&err);
> > +     if (parse_events(evlist, "tool/user_time/", &err)) {
> > +             parse_events_error__exit(&err);
> > +             evlist__put(evlist);
> > +             return TEST_FAIL;
> > +     }
> > +     parse_events_error__exit(&err);
> > +
> > +     evsel =3D evlist__first(evlist);
> > +     cpus =3D perf_cpu_map__new("0,1");
> > +     threads =3D thread_map__new_by_tid(getpid());
> > +     if (!cpus || !threads)
> > +             goto out;
> > +
> > +     /* Step 1: Open CPU index 0 successfully */
> > +     if (evsel__open_per_cpu_and_thread(evsel, cpus, 0, threads) < 0) =
{
> > +             pr_debug("Failed to open CPU index 0\n");
> > +             goto out;
> > +     }
> > +
> > +     fd0 =3D (*(int *)xyarray__entry(evsel->core.fd, 0, 0));
> > +     if (fd0 < 0 || fcntl(fd0, F_GETFD) < 0) {
> > +             pr_debug("CPU index 0 FD is invalid (%d)\n", fd0);
> > +             goto out;
> > +     }
> > +
> > +     /* Step 2: Intentionally trigger failure on CPU index 1 */
> > +     evsel->core.attr.sample_period =3D 1; /* Not supported for tool P=
MU -> -EINVAL */
> > +     if (evsel__open_per_cpu_and_thread(evsel, cpus, 1, threads) >=3D =
0) {
> > +             pr_debug("Unexpected success opening CPU index 1 with sam=
ple_period=3D1\n");
> > +             goto out;
> > +     }
> > +
> > +     /*
> > +      * Step 3: Check that CPU index 0's FD was NOT destroyed by CPU i=
ndex 1's unwind.
> > +      */
> > +     if ((*(int *)xyarray__entry(evsel->core.fd, 0, 0)) !=3D fd0) {
> > +             pr_debug("FAILED: CPU 0 FD overwritten: FD(evsel, 0, 0)=
=3D%d, expected %d\n",
> > +                      (*(int *)xyarray__entry(evsel->core.fd, 0, 0)), =
fd0);
> > +             goto out;
> > +     }
> > +
> > +     if (fcntl(fd0, F_GETFD) < 0) {
> > +             pr_debug("FAILED: CPU 0 FD %d was closed by error unwind!=
 errno=3D%d (%s)\n",
> > +                      fd0, errno, strerror(errno));
> > +             goto out;
> > +     }
> > +
> > +     ret =3D TEST_OK;
> > +out:
> > +     evsel__close(evsel);
> > +     perf_cpu_map__put(cpus);
> > +     perf_thread_map__put(threads);
> > +     evlist__put(evlist);
> > +     return ret;
> > +}
> > +
> >  static struct test_case tests__tool_pmu[] =3D {
> >       TEST_CASE("Parsing without PMU name", tool_pmu_without_pmu),
> >       TEST_CASE("Parsing with PMU name", tool_pmu_with_pmu),
> > +     TEST_CASE("Incremental open error unwind boundary", tool_pmu_incr=
emental_open_unwind),
> >       {       .name =3D NULL, }
> >  };
> >
> > diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
> > index d4cb455f4a7d..eb429087ebfe 100644
> > --- a/tools/perf/util/evsel.c
> > +++ b/tools/perf/util/evsel.c
> > @@ -3127,7 +3127,7 @@ static int evsel__open_cpu(struct evsel *evsel, s=
truct perf_cpu_map *cpus,
> >                       FD(evsel, idx, thread) =3D -1;
> >               }
> >               thread =3D nthreads;
> > -     } while (--idx >=3D 0);
> > +     } while (--idx >=3D start_cpu_map_idx);
> >       errno =3D old_errno;
> >  out:
> >       if (err)
> > diff --git a/tools/perf/util/hwmon_pmu.c b/tools/perf/util/hwmon_pmu.c
> > index ed544dca70c3..96aeb379e169 100644
> > --- a/tools/perf/util/hwmon_pmu.c
> > +++ b/tools/perf/util/hwmon_pmu.c
> > @@ -803,7 +803,7 @@ int evsel__hwmon_pmu_open(struct evsel *evsel,
> >                       FD(evsel, idx, thread) =3D -1;
> >               }
> >               thread =3D nthreads;
> > -     } while (--idx >=3D 0);
> > +     } while (--idx >=3D start_cpu_map_idx);
> >       close(dir);
> >       return err;
> >  }
> > diff --git a/tools/perf/util/tool_pmu.c b/tools/perf/util/tool_pmu.c
> > index 5c30854b4644..d2f7591747d9 100644
> > --- a/tools/perf/util/tool_pmu.c
> > +++ b/tools/perf/util/tool_pmu.c
> > @@ -349,7 +349,7 @@ int evsel__tool_pmu_open(struct evsel *evsel,
> >                       FD(evsel, idx, thread) =3D -1;
> >               }
> >               thread =3D nthreads;
> > -     } while (--idx >=3D 0);
> > +     } while (--idx >=3D start_cpu_map_idx);
> >       errno =3D old_errno;
> >       return err;
> >  }
> > --
> > 2.55.0
> >
