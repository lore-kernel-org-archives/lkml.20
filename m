Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A541E5B68
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788926269; cv=pass; b=HAdTS9I/qFgIRcQFl7ochq6sOtFxSIFRGAwkF81YGNqH2Wc/Tli77qIC1vmUJQTdLVgObHkWuHCyetLTokuktHP9agP0IVanubGfvb3N31xROoW9ipoyK0yLeJxDUQrfXw3a1b6WdcrUsvmZ5mqd05PwrsGuB2+EULHfORSPc2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788926269; c=relaxed/simple;
	bh=7xxtT/FL6qpKYeNTfwtqCOBrCCkAL1A25OTh5eI51tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQ1t5P7576pQXHX+sTVulOvlTL8+H3SLmtVnp0nv93rfjG+yLoWSuNNq+vaigTzSN7xOj3nih6jn1Z1ZVJEjhQh6NBByeGMD90aq+dtPOzg6A+NEgpWjOAYy9Kmcawoehg5FnEaWtB9poQGJ/AOiuIUFHOPHovU86hlB/3RHnxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=ApAN4HpC; arc=pass smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ApAN4HpC"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so6972456e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 20:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788926266; cv=none;
        d=google.com; s=arc-20260327;
        b=BY/gjoRmKwuuRY4FcV4giYaCZFze03NaXpeFg/I3w9oa2W8Uts+iDQ5Lsq78xcf7tm
         ynQiYTgt+l57UWlgo55k+KrPNgXmNBSy9tQIu2UZuigYFr0PEw7YXKSm9A/PYPFpLYa4
         lBAc2sxye619bYzOZ/TAV8iuI0Tx9A9vcYx4L+AmTqAZ5mTE69fJ8ULNvHRuM9d11hkk
         axU49ts+clMHBAE1P+MG7Ij8Dnd8u6Krs3J+3lg345d9ZHNtWwYkeaADNAiBn20DWmOD
         +e11jkja8+nHTyWYBOI33G+be19YN/vwvotbwNIP/v3Fqzn/VnO7pOUnEJ9sJQ1esvrn
         zDdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6kH0tSRloKBsA9qiF3oHk70jTIj3t7dVydxj2ubMusk=;
        fh=GUEXLngrA58nj1xTd1v0cTTTGtcyM7ExT6yMYmAua0M=;
        b=nDDoDHNw54nRtnZouuFeDF/QMqvpTkpsBbhLKzGPfAiPb7EUL8FqRPFGzwa0CtehWV
         ByKjOnxSbOmhAjf6VJWLSOLzklFHkp8uEDiMJDxOAbSkq0QZP9LZJa8z/7EA4J6hE4BB
         smM9uvcR6GsdQiq1s404uEM7VcKqy8fvn9+M3r5WY9IHn2gcLm3NO61VrAy23rsn98NJ
         8ay2FcIAoDy9teYOCM1Vy4FQLs1wgDFwkhoFd5uGKcoqtq39Uwwsi7nTj97optD2I04V
         OXAd5/57p2owK9h0LIiC0EKRWV1mma/UDwlFnFQGjPr790/rw+wmE8ajBdgwhXFN04Tw
         CdqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788926266; x=1789531066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6kH0tSRloKBsA9qiF3oHk70jTIj3t7dVydxj2ubMusk=;
        b=ApAN4HpCUt9W3saYcLuJUkh6CYkvHHf2/UG3VSquNYIjxCWnEkgWmVX5lzXXgELxv/
         wPw7cYrUxZw8osV0iBawmGrUCoTgfguQMt/5IPkv1MzipBGNkrZjYmm80gQwKVQgGQO3
         /pCSWSaHM/7xM8fwsmPEteFIbPuj9JcJCgVm9yapoyg6CYZT5IpburPUDbXxxvC0mXx+
         fUaWpA5UmoMdFSEL6vbGN028y5TieoIF88XByJyuobwN9CRXgUp5vPaCxQnGYZEi9Tzz
         NOXQTGgSGXdc9Z3JYN1YfyPYTM5AbkKxo2Cs2T0mNWVoexkA/Gb5Rys31BVBblHsxEbi
         7X+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788926266; x=1789531066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kH0tSRloKBsA9qiF3oHk70jTIj3t7dVydxj2ubMusk=;
        b=Dwrp3Y8BO28Tdf7OhQISNExZxr5yXO2c2j/4OOacruq/CRgTaIAqQkc22fKJRe1eiy
         AdcbUBDIksoH5IUe13Ne8PwRcQ29D7WF7x4/P4o9noO0it9yampnvN2CQ14DyAHEepue
         z5z9zOBcijEuXuyOrIyFhzwCr/xsGZiWyRx9/zx8ytCs7WZJjfFFCxHhqTw65rLWGrGF
         5KHKKkZ3/Y5AVJHjl2jDk5xSViUtykxle6FN4K8EXdnVyMqAxJjNR9uwMGR1EHVsTMHC
         A0ANo4oougWrCvAYD2Wtl3SKDK995Vr3n/SRzI5GQOlcgCR2O8tXZsEyKOLpyjLSgjC1
         TP2Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6yx9yQgFFAXHHt9A/T9W8v70LmIYB4crOlmCDfmPuEIXwALPJTB9uPMPTKaPCXYsdot986ENez1kXsXI=@vger.kernel.org
X-Gm-Message-State: AFuF++nkba8AxbRMCEVjMlFqBTr6w8vC6N6KlhtZMarmScmHQnvtLuHf
	e20W4wblA3y4qOCqC0UgwrPZpLjtJ7qVJsC9KSB6hBRxltHLBenLrjhfY0p0og3Wdtq4fS4/ce9
	sNUDJq7v3GtR9piApeRBZSds/guvcfOeyHebYIsPXSQ==
X-Gm-Gg: AYBFou1FLx0URjUwpctXul+olwcmaULXNug/BXuMTV0wGNrzaRv5Vn8H7gjpkOv6AG2
	zxIfANRhMD1nHXBrfSvsrc1eo8KTdOrtTVJOPWSxket1jSQnvLu5zfT3ip1LSbjxuaVA3jZTvsh
	dquO+3fWdkXp4NulAWlhMJUkchDgkTqDg9b/MqsbSC3k+zCSVgnDEqleeCVsm2JyYtFVyzUBTdd
	df3Ym293Sx6KoAf3OHuxLJO4WREWoR4yesQ8v4NNJvaDiIoQfJ/yR5Z/EKdum1SiXkhbXAUz76m
	x8hKi8GeMKUc/wauONLlzYmlYqaOi58tkFICQ2NMqSpR7dAMJLn84gc7vg==
X-Received: by 2002:a05:6123:4204:20b0:5bf:6dd0:36d with SMTP id
 71dfb90a1353d-5c7dcf768e3mr8710710e0c.8.1788926266507; Tue, 08 Sep 2026
 20:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-perf-evlist-uncore-cpu-b4-v1-1-604b55c025ee@sifive.com>
 <CAP-5=fX1uKg8AncsP5BVFtchgns5TquOTB10-mR5ury2CaH0sg@mail.gmail.com>
 <CACpYXwATq8nU9mB2SuNO6kAUNrj8bH3UjQiHd5X6=9VX4YZJgA@mail.gmail.com> <CAP-5=fVw0+Xh6Xovj_Vt1XnTT8Y0fK-+wia=oxwFmPaT06MTBg@mail.gmail.com>
In-Reply-To: <CAP-5=fVw0+Xh6Xovj_Vt1XnTT8Y0fK-+wia=oxwFmPaT06MTBg@mail.gmail.com>
From: Nia Su <nia.su@sifive.com>
Date: Wed, 9 Sep 2026 11:57:35 +0800
X-Gm-Features: AcwNN1V-pmoH-l-Gdzi-F_XGEUOx1dfZ1iZtFNeHFPHBZclF60TC6XrjBJcvGDY
Message-ID: <CACpYXwBiF12==Ct1voU-0QcXzMCVqkd3vVJG+4MkYPnZ8rd=WA@mail.gmail.com>
Subject: Re: [PATCH] perf evlist: don't restrict uncore events to PMU CPUs
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Thomas Falcon <thomas.falcon@intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 1:11=E2=80=AFAM Ian Rogers <irogers@google.com> wrot=
e:
>
> On Mon, Sep 7, 2026 at 8:23=E2=80=AFPM Nia Su <nia.su@sifive.com> wrote:
> >
> > On Fri, Sep 4, 2026 at 11:34=E2=80=AFPM Ian Rogers <irogers@google.com>=
 wrote:
> > >
> > > On Fri, Sep 4, 2026 at 6:45=E2=80=AFAM Nia Su <nia.su@sifive.com> wro=
te:
> > > >
> > > > The PMU CPU map has different semantics for core and uncore PMUs.
> > > >
> > > > For core PMUs, pmu_cpus contains the CPUs on which the event can be
> > > > opened. Intersect the user-requested CPU map with the PMU CPU map t=
o
> > > > reject CPUs unsupported by the PMU.
> > > >
> > > > For uncore PMUs, pmu_cpus is just the default CPU to open the event=
 on,
> > > > not the set of CPUs it can only be opened on.
> > >
> > > This isn't quite true. On a dual socket Intel machine, `pmu_cpus` wil=
l
> > > contain a CPU to open the event on per-socket.
> >
> > Yes, I agree. My description was not precise enough. What I wanted to s=
ay
> > was that pmu_cpus provides the default CPU(s) used to open an event. It
> > is not necessarily an allowlist. A user may specify another valid CPU,
> > which the PMU driver can resolve to the appropriate control CPU.
> >
> > > > The user-requested CPU may
> > > > override the default and be used directly, and the driver can redir=
ect
> > > > the event to the appropriate control CPU.
> > >
> > > Agreed.
> > >
> > > > Currently, __perf_evlist__propagate_maps() intersects the user-requ=
ested
> > > > CPU map with pmu_cpus for all PMUs. If the user-requested CPU is no=
t in
> > > > pmu_cpus, the intersection becomes empty and the evsel is removed b=
efore
> > > > perf_event_open() is called.
> > >
> > > Could you give a command line example of the perf tool doing this? I
> > > ask because I'm surprised the uncore specifying a CPU behavior has
> > > been broken. As well as `perf record -C` there is also a somewhat
> > > newer cpu event qualifier.
> >
> > I tested both approaches, but they still fail whenever a perf event is
> > assigned to a CPU outside the uncore PMU's sysfs cpumask. for example,
> > assigning the event to CPU 1 fails when the cpumask is 0:
> >
> > perf stat -C 1 -e <uncore event> -- <program>
> >
> > Here, for an uncore PMU, pmu_cpumask() reads the sysfs cpumask into
> > pmu->cpus. When the event is created, perf copies pmu->cpus to the
> > local pmu_cpus variable and then stores it in evsel->core.pmu_cpus.
> > In this case, evsel->core.pmu_cpus is {0}. The CPU specified with
> > "-C 1" is stored in evsel->core.cpus as {1}. Then, in this function,
> > __perf_evlist__propagate_maps() then intersects the two maps, resulting
> > in an empty map, so the event is removed before reaching the PMU driver=
.
> >
> > > > Skip the intersection when evsel->requires_cpu is true, which is se=
t for
> > > > uncore PMUs. is_pmu_core is also false for other non-core PMUs, so
> > > > gating on it would have loosened this check for them too. Core PMUs
> > > > continue to be restricted to their PMU CPU map.
> > > >
> > > > requires_cpu can also be set for BPF counters regardless of PMU typ=
e,
> > > > but only when has_user_cpus is false, so this guard has no effect t=
here
> > > > today.
> > >
> > > So the separation between libperf and perf is frustrating, and libper=
f
> > > lacks the necessary PMU abstraction. Using requires_cpu as a proxy fo=
r
> > > an uncore PMU test is okay, but it would be better if we had a boolea=
n
> > > flag especially for this. Given this, a comment should be added sayin=
g
> > > that requires_cpu is used as a proxy for an uncore PMU. The real
> > > meaning of requires_cpu is that the event doesn't support
> > > perf_event_open with a thread.
> > >
> > > Thanks,
> > > Ian
> >
> > That makes sense. I=E2=80=99ll add a comment clarifying that requires_c=
pu is used
> > as a proxy for uncore PMUs and keep the current approach for now.
>
> So I think the flag we can use is `evsel->is_pmu_core` which captures
> the !uncore behavior. I validated the fixes tag is correct.

I did consider using evsel->is_pmu_core, but it is false not only for
uncore PMUs,
but also for software, breakpoint, tracepoint, and other non-core
events. For uncore
PMUs, cpumask is stored in pmu->cpus and copied to pmu_cpus; for other PMUs
without a CPU map, pmu_cpus falls back to the online CPU map.

Thus, with perf stat -C <offline_cpu> -e task-clock -- sleep 1,
pmu_cpus falls back to
the online CPU map while evsel->cpus contains the requested offline
CPU. Intersecting
the two maps would therefore filter out the offline CPU, which seems
reasonable. For
this reason, I don=E2=80=99t think this flag is appropriate here. What do y=
ou think?

Thanks,
Nia

> Thanks,
> Ian
>
> > Thanks,
> > Nia
> >
> > > > Fixes: 811082e4b668 ("perf parse-events: Support user CPUs mixed wi=
th threads/processes")
> > > >
> > > > Assisted-by: Claude Sonnet 5
> > > > Signed-off-by: Nia Su <nia.su@sifive.com>
> > > > ---
> > > >  tools/lib/perf/evlist.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/tools/lib/perf/evlist.c b/tools/lib/perf/evlist.c
> > > > index 1f210dadd666ff818a23712ab95acaa659ccf8dc..a1064175f12ba655a9f=
7fe42e7c7e4c49ae60423 100644
> > > > --- a/tools/lib/perf/evlist.c
> > > > +++ b/tools/lib/perf/evlist.c
> > > > @@ -80,7 +80,8 @@ static void __perf_evlist__propagate_maps(struct =
perf_evlist *evlist,
> > > >         }
> > > >
> > > >         /* Ensure cpus only references valid PMU CPUs. */
> > > > -       if (!perf_cpu_map__has_any_cpu(evsel->cpus) &&
> > > > +       if (!evsel->requires_cpu &&
> > > > +           !perf_cpu_map__has_any_cpu(evsel->cpus) &&
> > > >             !perf_cpu_map__is_subset(evsel->pmu_cpus, evsel->cpus))=
 {
> > > >                 struct perf_cpu_map *tmp =3D perf_cpu_map__intersec=
t(evsel->pmu_cpus, evsel->cpus);
> > > >
> > > >
> > > > ---
> > > > base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
> > > > change-id: 20260904-perf-evlist-uncore-cpu-b4-418af0f17c80
> > > >
> > > > --
> > > >
