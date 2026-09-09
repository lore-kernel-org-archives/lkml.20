Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796EA2836A6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929342; cv=pass; b=fLmnWySP7oh4bkWgz8Ce97OX+ughMjstK+Slt290FzjmOkdlrg2F5P71VJzImfDZe9qzQDpup0prKPCFudMZvfaeCdACHRJt/3sWBggcEHnLwoqMPzghDtuIAKK3Zsc9LqifP6YfOgFDTxieqc+ndI8FtV8+l5wJZdy+zqPAvmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929342; c=relaxed/simple;
	bh=zMboit8VBmBJO5j/FGn3M+CjIQAKpSpQ3p2BDMHjBOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/fCi1pIawEidIhklZ5ceGRR76x76wtNOwwkewFNVJ1//zMcg99BXInHXI2NKxa1eUE1maHg/kr7DFMuFwEDkGY0L96DquHexNC+zNyacy0nJsQ2Mm0AvPLTFTRSyTjmdOXNfRa1LArM9To26kd2Pdq3f3j1fA9H3a7+1EiZslY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vZSOhP6y; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vZSOhP6y"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5307425f44bso90301cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788929339; cv=none;
        d=google.com; s=arc-20260327;
        b=NEBlwXYEcXwUvpGSgcr0rrKH6FC4DG1uam+9TZBN55r7htWob6WQaEpcXcKvAwJogd
         z4ooFHiE+nh8hYWwqc+Dw7NMeH4/AQMcHtNY8CQ3j3LnSIwbXZqP/jwZieBmCvdwAB9I
         zDzVMhI+DEW821sPqpSsc7FbOGO3elLYWUPGAmAOluPnXnlnbg3ZvCaxahGfVss6z//l
         H+vMRfqRZVnWPxQrgIvREiJzzvnhkVFcSHgB6WTm0XaBkU5tI4CWRKR5AdNDBA04d/Rb
         +kU8pMDDfF/gs/Yt6YMn8HbHgX/cC/AD20CSkUunTeDKdYtOCfs124uDOwyl2sF/2hub
         2fQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9IU7DSZlDc7odt3VqXzAKBFfZeMsyZ0GhQB/5srV17c=;
        fh=7SeKpGe28+gsWGbUipJnLx5AWzWYCLYhgdwl8GlpzfU=;
        b=K8kqSOWk8c1YTBwEV/VLBFda9TMrs8YNCUTohhcwNnVzyVYWuEl96COetqInjjnlpI
         DcVSxVzTaAyu7d9K1a44ITfAnjIcDGeM19V0cW9oCITkKWoo+Uoyv7PHH+GwbGJctM+l
         YU4M9T9CAQ9OpU4mRgv6g7P4N06DAwnHRFPNbHmEHMo22FS1zowK48k5lLDiM2YHzk9d
         h+nQ4P1T1DxiVFrqaUPkXQbT37gdC1HdoHMtY+wQQwpQ+uKonLKBoF0L6KbN12Fh23ud
         7C0JEm2xrnFn4uggHvr+EQdt0EKdFA9idoK08f8wkBzXnbbvs1pk5cYwkQjcFUhat1aY
         351w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788929339; x=1789534139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9IU7DSZlDc7odt3VqXzAKBFfZeMsyZ0GhQB/5srV17c=;
        b=vZSOhP6yykcr3+9XOk1JQCmuAu62L7l1EFfYKA+KnXEtyWB4LVT4vr2kP1fFZKxVCi
         EnmZ3zlpq0N+o6PHxDaTD8aUkcQUTd4EgtCBNR+gKs/68a78LTKzXKl+b8rjXlUOGXpy
         Dc4loNyaWY3fltjF0cKTeU2EmPGYThoPUcIHjs78FQpPLeO4IuXmgQ3LcxaLbRrq7+8S
         i0sWVnib6KsCu9AC6ga5xaPwKjL37/U7IhdM/lqtsHwsYiX369sV7Ek5x/Mz+eKz5MH3
         z3N0SHZW9bysDObPl8Pivtxx1d22yhV9ckFgZmMue8+9cLlwTOTS1JQLps9xysW4Bb/m
         0dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929339; x=1789534139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9IU7DSZlDc7odt3VqXzAKBFfZeMsyZ0GhQB/5srV17c=;
        b=YQ40Kdx6foCKHmTFzkPa6d6EKd+OyDEWf5tm0b7R7ZPW8GV15p25o16xu3ZR3tGZpP
         NLWGiZEQW4gUWbDmNC46glYapzAmLj8Vu0/SkcOS0af770W9UL8khz2jre7Rs4gDXhcp
         LWzDbMHtsqL5ofQtgFhNlbXcKohPtpciaPk8xbAXgoVVNCn9nbd+6Id8GFYX0b6+mUcD
         wl/oVPRWyupH2/D+66bcRoDgL2hHTVFOFWFraSF8CUGSTfT/mI/zVgUooZRXWb72AqFA
         HUrhr1H8JvUdwSNX5FTc8OD7MhPZW1qqIq2ebgVH5daVgwNV5Gx58GBp8k/zKxMaBFcQ
         mDww==
X-Forwarded-Encrypted: i=1; AKwUvBxCpIeOF6oZ/Yk/zCLneyMH1E2b+7vkcRu1LLmJOiCZ1dF15pkKWd8zYCGIVX81wE2kCN+GS0xCFsfiXGY=@vger.kernel.org
X-Gm-Message-State: AFuF++l0b1F20rAQHViKuOIbVmkJNWoxUBdd1d1NollpYjyCYC67rJ1P
	yUkWI8Yq4yL6B7HPcbRgr60IO6XkTVjQNt07mmsDKa994qyM0s6bkRIeOsR4eZPthTlimsQc54g
	8sCSrBFkBTJmRKhAQ0ypz0IUDbAJD8AWleF3V/TjK
X-Gm-Gg: AYBFou0hO4WHufHShIs7ZNcs6413hrLPlmwNCXlOEoy39UacaTuQu4tT7WlaU6D4m2z
	cz//lVUlpPuTXKWbtbq9Ft7M9TUnXPkvuezn73dckdnMWF8VMatAt6i2spy+vIFkEcXYzCn/ZN/
	gimqnM3U1gUAfnH20RK8FM76poDPQwWGkThWNhj0dK/oQ54lF6rJ1GRkXSzsDU7yKKCLKJAbfzw
	QuEHe0uGL60BbnMpcLeu4zh1J35ghK4skrt/08rdFNHAKpCNe/0ahYPPBMRcAH9FfdcEjbmuMh8
	tF6xB4+E41k9UYx2IcRCf1cYaapWBNuo5erJp3mi7DibO0IAAEQ+Jgs=
X-Received: by 2002:a05:622a:a58b:b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-530a5f00c86mr7767931cf.7.1788929338637; Tue, 08 Sep 2026
 21:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-perf-evlist-uncore-cpu-b4-v1-1-604b55c025ee@sifive.com>
 <CAP-5=fX1uKg8AncsP5BVFtchgns5TquOTB10-mR5ury2CaH0sg@mail.gmail.com>
 <CACpYXwATq8nU9mB2SuNO6kAUNrj8bH3UjQiHd5X6=9VX4YZJgA@mail.gmail.com>
 <CAP-5=fVw0+Xh6Xovj_Vt1XnTT8Y0fK-+wia=oxwFmPaT06MTBg@mail.gmail.com> <CACpYXwBiF12==Ct1voU-0QcXzMCVqkd3vVJG+4MkYPnZ8rd=WA@mail.gmail.com>
In-Reply-To: <CACpYXwBiF12==Ct1voU-0QcXzMCVqkd3vVJG+4MkYPnZ8rd=WA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 8 Sep 2026 21:48:47 -0700
X-Gm-Features: AcwNN1XqR7AwfQ9OP3lTFlTbBKBw6EtRm4Ut7NNY7TeY-7U-oVFTUGHy92dbuoI
Message-ID: <CAP-5=fX7v5bREWoWBEf7vuhpm93XDE1Rfd8tAOZ8oxubtL4GNg@mail.gmail.com>
Subject: Re: [PATCH] perf evlist: don't restrict uncore events to PMU CPUs
To: Nia Su <nia.su@sifive.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Thomas Falcon <thomas.falcon@intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 8:57=E2=80=AFPM Nia Su <nia.su@sifive.com> wrote:
>
> On Wed, Sep 9, 2026 at 1:11=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
> >
> > On Mon, Sep 7, 2026 at 8:23=E2=80=AFPM Nia Su <nia.su@sifive.com> wrote=
:
> > >
> > > On Fri, Sep 4, 2026 at 11:34=E2=80=AFPM Ian Rogers <irogers@google.co=
m> wrote:
> > > >
> > > > On Fri, Sep 4, 2026 at 6:45=E2=80=AFAM Nia Su <nia.su@sifive.com> w=
rote:
> > > > >
> > > > > The PMU CPU map has different semantics for core and uncore PMUs.
> > > > >
> > > > > For core PMUs, pmu_cpus contains the CPUs on which the event can =
be
> > > > > opened. Intersect the user-requested CPU map with the PMU CPU map=
 to
> > > > > reject CPUs unsupported by the PMU.
> > > > >
> > > > > For uncore PMUs, pmu_cpus is just the default CPU to open the eve=
nt on,
> > > > > not the set of CPUs it can only be opened on.
> > > >
> > > > This isn't quite true. On a dual socket Intel machine, `pmu_cpus` w=
ill
> > > > contain a CPU to open the event on per-socket.
> > >
> > > Yes, I agree. My description was not precise enough. What I wanted to=
 say
> > > was that pmu_cpus provides the default CPU(s) used to open an event. =
It
> > > is not necessarily an allowlist. A user may specify another valid CPU=
,
> > > which the PMU driver can resolve to the appropriate control CPU.
> > >
> > > > > The user-requested CPU may
> > > > > override the default and be used directly, and the driver can red=
irect
> > > > > the event to the appropriate control CPU.
> > > >
> > > > Agreed.
> > > >
> > > > > Currently, __perf_evlist__propagate_maps() intersects the user-re=
quested
> > > > > CPU map with pmu_cpus for all PMUs. If the user-requested CPU is =
not in
> > > > > pmu_cpus, the intersection becomes empty and the evsel is removed=
 before
> > > > > perf_event_open() is called.
> > > >
> > > > Could you give a command line example of the perf tool doing this? =
I
> > > > ask because I'm surprised the uncore specifying a CPU behavior has
> > > > been broken. As well as `perf record -C` there is also a somewhat
> > > > newer cpu event qualifier.
> > >
> > > I tested both approaches, but they still fail whenever a perf event i=
s
> > > assigned to a CPU outside the uncore PMU's sysfs cpumask. for example=
,
> > > assigning the event to CPU 1 fails when the cpumask is 0:
> > >
> > > perf stat -C 1 -e <uncore event> -- <program>
> > >
> > > Here, for an uncore PMU, pmu_cpumask() reads the sysfs cpumask into
> > > pmu->cpus. When the event is created, perf copies pmu->cpus to the
> > > local pmu_cpus variable and then stores it in evsel->core.pmu_cpus.
> > > In this case, evsel->core.pmu_cpus is {0}. The CPU specified with
> > > "-C 1" is stored in evsel->core.cpus as {1}. Then, in this function,
> > > __perf_evlist__propagate_maps() then intersects the two maps, resulti=
ng
> > > in an empty map, so the event is removed before reaching the PMU driv=
er.
> > >
> > > > > Skip the intersection when evsel->requires_cpu is true, which is =
set for
> > > > > uncore PMUs. is_pmu_core is also false for other non-core PMUs, s=
o
> > > > > gating on it would have loosened this check for them too. Core PM=
Us
> > > > > continue to be restricted to their PMU CPU map.
> > > > >
> > > > > requires_cpu can also be set for BPF counters regardless of PMU t=
ype,
> > > > > but only when has_user_cpus is false, so this guard has no effect=
 there
> > > > > today.
> > > >
> > > > So the separation between libperf and perf is frustrating, and libp=
erf
> > > > lacks the necessary PMU abstraction. Using requires_cpu as a proxy =
for
> > > > an uncore PMU test is okay, but it would be better if we had a bool=
ean
> > > > flag especially for this. Given this, a comment should be added say=
ing
> > > > that requires_cpu is used as a proxy for an uncore PMU. The real
> > > > meaning of requires_cpu is that the event doesn't support
> > > > perf_event_open with a thread.
> > > >
> > > > Thanks,
> > > > Ian
> > >
> > > That makes sense. I=E2=80=99ll add a comment clarifying that requires=
_cpu is used
> > > as a proxy for uncore PMUs and keep the current approach for now.
> >
> > So I think the flag we can use is `evsel->is_pmu_core` which captures
> > the !uncore behavior. I validated the fixes tag is correct.
>
> I did consider using evsel->is_pmu_core, but it is false not only for
> uncore PMUs,
> but also for software, breakpoint, tracepoint, and other non-core
> events. For uncore
> PMUs, cpumask is stored in pmu->cpus and copied to pmu_cpus; for other PM=
Us
> without a CPU map, pmu_cpus falls back to the online CPU map.
>
> Thus, with perf stat -C <offline_cpu> -e task-clock -- sleep 1,
> pmu_cpus falls back to
> the online CPU map while evsel->cpus contains the requested offline
> CPU. Intersecting
> the two maps would therefore filter out the offline CPU, which seems
> reasonable. For
> this reason, I don=E2=80=99t think this flag is appropriate here. What do=
 you think?

I guess we could either add a new bool to perf_evsel or do something like:
```
bool is_pmu_uncore =3D !evsel->is_pmu_core && evsel->requires_cpu;
```
it seems this will still be wrong for BPF events that set requires_cpu
and could do on a software event (from builtin-stat.c):
```
 evlist__for_each_entry(evsel_list, counter) {
/*
* Setup BPF counters to require CPUs as any(-1) isn't
* supported. evlist__create_maps below will propagate this
* information to the evsels. Note, evsel__is_bperf isn't yet
* set up, and this change must happen early, so directly use
* the bpf_counter variable and target information.
*/
if ((counter->bpf_counter || target.use_bpf) && !target__has_cpu(&target))
counter->core.requires_cpu =3D true;
}
```
So I guess the only way to go is a new bool.

Thanks,
Ian

> Thanks,
> Nia
>
> > Thanks,
> > Ian
> >
> > > Thanks,
> > > Nia
> > >
> > > > > Fixes: 811082e4b668 ("perf parse-events: Support user CPUs mixed =
with threads/processes")
> > > > >
> > > > > Assisted-by: Claude Sonnet 5
> > > > > Signed-off-by: Nia Su <nia.su@sifive.com>
> > > > > ---
> > > > >  tools/lib/perf/evlist.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/tools/lib/perf/evlist.c b/tools/lib/perf/evlist.c
> > > > > index 1f210dadd666ff818a23712ab95acaa659ccf8dc..a1064175f12ba655a=
9f7fe42e7c7e4c49ae60423 100644
> > > > > --- a/tools/lib/perf/evlist.c
> > > > > +++ b/tools/lib/perf/evlist.c
> > > > > @@ -80,7 +80,8 @@ static void __perf_evlist__propagate_maps(struc=
t perf_evlist *evlist,
> > > > >         }
> > > > >
> > > > >         /* Ensure cpus only references valid PMU CPUs. */
> > > > > -       if (!perf_cpu_map__has_any_cpu(evsel->cpus) &&
> > > > > +       if (!evsel->requires_cpu &&
> > > > > +           !perf_cpu_map__has_any_cpu(evsel->cpus) &&
> > > > >             !perf_cpu_map__is_subset(evsel->pmu_cpus, evsel->cpus=
)) {
> > > > >                 struct perf_cpu_map *tmp =3D perf_cpu_map__inters=
ect(evsel->pmu_cpus, evsel->cpus);
> > > > >
> > > > >
> > > > > ---
> > > > > base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
> > > > > change-id: 20260904-perf-evlist-uncore-cpu-b4-418af0f17c80
> > > > >
> > > > > --
> > > > >
>
