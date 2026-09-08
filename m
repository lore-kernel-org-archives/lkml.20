Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7F65921E3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887506; cv=pass; b=eZIQW1iWBRV9+hOMccbfWyMEWSelTG6zi4i6wp38Hj4PR3P7F0+JFfIw49j25Cd7n4CL66YiBb/JTSd3EBwpJUhZGolZ9ciekvofmDCoyMMzMmPcC4SEX75zY24+Gv/6LVAM2yo2dwJlB1PBCYHaHLgEqE8VkGwVflSgJSDG+O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887506; c=relaxed/simple;
	bh=EsSaRGvIxD63ugwBKEyi2i+Vt5mUM4Sz6FUce0h4zBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGinTdRCJnm4kABfzmtI/d+6+eiII4JlADuQtGnZEMlTxXnPMmcx2o8MuB0sRYX91ay/O+w4FS2KqcCXwxyWWCavYaISn+ZAxvATX9cO5ijTp0tc6VsPSHkFW3pEVm2mVG4nP6VZTmennjVzWqIX4pQcXypsaIOELXDnsAS53vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lyzEzKRj; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lyzEzKRj"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso757581cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788887502; cv=none;
        d=google.com; s=arc-20260327;
        b=pCd5KhmZFFh0v7yQ5bI3BtU90eKUiyiI/3xavSXthZo5CmDTBjc0JOxa+7Z5I2dKat
         tU6lckePQZ7uZtUIv7Fo8rUdiZlp6+X3ZVcxhMX9KyQFwrCSBZHtfOUbSD3TbZKJ4T1/
         /mkXeSa+lY86XIaNBqoKjL4bLGZNdh6AoojE8d8pSoJOB6nxnxxutf9mrVJZqfhH1ZGZ
         Qb8N7BqiPlnNShHhup4CkkNINxtaCWhw7Kgruzy0VyPwfz0aC3URk9a8bOZmnuiH3zpM
         sEvxuKYHTTpm1dfNqEXrvQEIBF0G0Qc50JUcIw18x3/7Av15DNYRgkI4Ar0UuSrQsq95
         NbLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zrmv8bXE0okXwbTlSHoQW+GmP7+eHityU98CjsAMjJQ=;
        fh=dTxp1Wp2Fbas+EXfMfmzW2fxMjPSjpTKJm8JPT5DqHM=;
        b=V2rpDZ+JR4a70iirLNPutvYoR8ZeWCp693whyHFGmtDqKCYrQAgwFxB62EdA/4JTk/
         dxRvISGhRkXJv/l+E8v5oOhrhGyoj29LJdoTjTNGmNlqOc2CQAyILyJwgxhRt8/D2CsO
         v0c5M7YzLZbKfx48KDWpdueF8XogJ//KuugYeR7GN2qq9EdZOOAPYRT0xDiTuulRvf98
         /h4PfwF3utNJaPETFTL+nogcdRE1lOWhNeUktvVneb1xY6h8f/TYaB745FaP5/VNOEjx
         aqFVG79NXlI64XUA+2rOW6lyZ4vKX5q7Oh2OUguzjC2Z1bUz+1E+gWnHziCRVi4gSzxu
         XK8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887502; x=1789492302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zrmv8bXE0okXwbTlSHoQW+GmP7+eHityU98CjsAMjJQ=;
        b=lyzEzKRjvSuAxWx7P7RutK/Jinicm/Iamy1bNZgyWe+Tv+J7JnKSG+zdZPs/iKHheZ
         LXyIVoABQwwc/PFayG1XmBPicuCrUc7tmYJGykamo4/yZwl11/teV8GkNG39fMqFD56z
         X9o+W6ljWVjaLUdgzZN78otkUXm3asFMbk2vqRWWv/XBsD/Q6DIUG7ej01Vy5dfURuvM
         jfXi621lFujbZ1LjQ2NJoADA5fokGsJwo59uXHG5E5L+QOBX+TngtWS0cqRvJF4YWXD2
         WP85jlmS8aIYv6FY8e/+DCigPQczPUSPhf9Lke135IHYGIUK9RvfQRTCQ9OxamvaxqNP
         rzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887502; x=1789492302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zrmv8bXE0okXwbTlSHoQW+GmP7+eHityU98CjsAMjJQ=;
        b=WWiD0nKRxmm7D3cUAJ5NYrg/uNp6wKlgAiFI4IaBp6D4H5Wtcw5Y9H1ApE84vrW/ut
         MYhNbynpMp5Pf+wV6C8vF4KuQ3eAQn9TRp1oTjKJqpGAO+BjwZ2amFSw7gcLSL9C0mh3
         3pwb/p0ZB5K5j5qUJk8HdE2bh3MKxiiwF6k+c+kux18a5kCbApVF5fK9WuEVtRnS+vsR
         cUtztOqa0Hz3Q5rqJ19cZsoi+LQsFNt5K5hUk7sbbG4d5wM06M6S3y6xu9u9Lt3zojD+
         6xq3LK3SwfzYyeVbaxBZplEryNZ45f5NVx73pLGgLtrLlLruZRqnvbeGG5jxiXjuV9hN
         MGZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMHRL8ufnoFs53qkXQGD4g2NMbZWFSLADvw+hor3pnVG1bHm/mpUMjdwvKlvjhSGDzM7duJ85m9Xva9Lk=@vger.kernel.org
X-Gm-Message-State: AFuF++mtZWRkKHGeNX2Cri8iCv4ZuR24l7yES18XiuAQCH8N9ZxF5R1Y
	DJUui6AdtFKNvROshRu9llOgVKouKIWyqDBmdUrnEHNr1RkVm+yhZjMe839PUf1imQnWF1etwYn
	DDwgwQx8KXtLm8FQzynm7MjetAEnDMV4Pyzg2ovWz
X-Gm-Gg: AYBFou3cWFhLlgmXyFGmGmfXy+a2djf9Pe0UPN1y0x5jnCkarZmhkiodZdEqgS+3BQC
	C8uD5pKCaRtEnKbmp3TnpUWCTpd54GeliCQk1cBjg3GPY6SkdeDBkJVxWeGmkpFktNbfrPGqLKx
	9MQnJ+7rwpdxlcEN671DFKJheJordYM52+0cIFiUAMv+yx3Yk1x7lmF5IQL3o7Fpi1bQhUmB3GZ
	0OKo/ta0gefAlRXxbaUX5pfyhtkS9HNxML3tUCC0SyHzQ85mSrYvGpx4ZoKdNk02zEPzASicBeR
	2sg0E1neBC0etFVPvCOza3SAvodDhdsx2QYOvBFMN5coQCO6cWUJWELXnBcaUMh9r7V4LMjhPA=
	=
X-Received: by 2002:a05:622a:2589:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-53065d7943emr51763311cf.4.1788887501596; Tue, 08 Sep 2026
 10:11:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-perf-evlist-uncore-cpu-b4-v1-1-604b55c025ee@sifive.com>
 <CAP-5=fX1uKg8AncsP5BVFtchgns5TquOTB10-mR5ury2CaH0sg@mail.gmail.com> <CACpYXwATq8nU9mB2SuNO6kAUNrj8bH3UjQiHd5X6=9VX4YZJgA@mail.gmail.com>
In-Reply-To: <CACpYXwATq8nU9mB2SuNO6kAUNrj8bH3UjQiHd5X6=9VX4YZJgA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 8 Sep 2026 10:11:29 -0700
X-Gm-Features: AcwNN1W_7TbKFmLSN9KMzfgyNcfZZaPeZ1089C38oYWYBJyJNhXAnE8ie59-N6k
Message-ID: <CAP-5=fVw0+Xh6Xovj_Vt1XnTT8Y0fK-+wia=oxwFmPaT06MTBg@mail.gmail.com>
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

On Mon, Sep 7, 2026 at 8:23=E2=80=AFPM Nia Su <nia.su@sifive.com> wrote:
>
> On Fri, Sep 4, 2026 at 11:34=E2=80=AFPM Ian Rogers <irogers@google.com> w=
rote:
> >
> > On Fri, Sep 4, 2026 at 6:45=E2=80=AFAM Nia Su <nia.su@sifive.com> wrote=
:
> > >
> > > The PMU CPU map has different semantics for core and uncore PMUs.
> > >
> > > For core PMUs, pmu_cpus contains the CPUs on which the event can be
> > > opened. Intersect the user-requested CPU map with the PMU CPU map to
> > > reject CPUs unsupported by the PMU.
> > >
> > > For uncore PMUs, pmu_cpus is just the default CPU to open the event o=
n,
> > > not the set of CPUs it can only be opened on.
> >
> > This isn't quite true. On a dual socket Intel machine, `pmu_cpus` will
> > contain a CPU to open the event on per-socket.
>
> Yes, I agree. My description was not precise enough. What I wanted to say
> was that pmu_cpus provides the default CPU(s) used to open an event. It
> is not necessarily an allowlist. A user may specify another valid CPU,
> which the PMU driver can resolve to the appropriate control CPU.
>
> > > The user-requested CPU may
> > > override the default and be used directly, and the driver can redirec=
t
> > > the event to the appropriate control CPU.
> >
> > Agreed.
> >
> > > Currently, __perf_evlist__propagate_maps() intersects the user-reques=
ted
> > > CPU map with pmu_cpus for all PMUs. If the user-requested CPU is not =
in
> > > pmu_cpus, the intersection becomes empty and the evsel is removed bef=
ore
> > > perf_event_open() is called.
> >
> > Could you give a command line example of the perf tool doing this? I
> > ask because I'm surprised the uncore specifying a CPU behavior has
> > been broken. As well as `perf record -C` there is also a somewhat
> > newer cpu event qualifier.
>
> I tested both approaches, but they still fail whenever a perf event is
> assigned to a CPU outside the uncore PMU's sysfs cpumask. for example,
> assigning the event to CPU 1 fails when the cpumask is 0:
>
> perf stat -C 1 -e <uncore event> -- <program>
>
> Here, for an uncore PMU, pmu_cpumask() reads the sysfs cpumask into
> pmu->cpus. When the event is created, perf copies pmu->cpus to the
> local pmu_cpus variable and then stores it in evsel->core.pmu_cpus.
> In this case, evsel->core.pmu_cpus is {0}. The CPU specified with
> "-C 1" is stored in evsel->core.cpus as {1}. Then, in this function,
> __perf_evlist__propagate_maps() then intersects the two maps, resulting
> in an empty map, so the event is removed before reaching the PMU driver.
>
> > > Skip the intersection when evsel->requires_cpu is true, which is set =
for
> > > uncore PMUs. is_pmu_core is also false for other non-core PMUs, so
> > > gating on it would have loosened this check for them too. Core PMUs
> > > continue to be restricted to their PMU CPU map.
> > >
> > > requires_cpu can also be set for BPF counters regardless of PMU type,
> > > but only when has_user_cpus is false, so this guard has no effect the=
re
> > > today.
> >
> > So the separation between libperf and perf is frustrating, and libperf
> > lacks the necessary PMU abstraction. Using requires_cpu as a proxy for
> > an uncore PMU test is okay, but it would be better if we had a boolean
> > flag especially for this. Given this, a comment should be added saying
> > that requires_cpu is used as a proxy for an uncore PMU. The real
> > meaning of requires_cpu is that the event doesn't support
> > perf_event_open with a thread.
> >
> > Thanks,
> > Ian
>
> That makes sense. I=E2=80=99ll add a comment clarifying that requires_cpu=
 is used
> as a proxy for uncore PMUs and keep the current approach for now.

So I think the flag we can use is `evsel->is_pmu_core` which captures
the !uncore behavior. I validated the fixes tag is correct.

Thanks,
Ian

> Thanks,
> Nia
>
> > > Fixes: 811082e4b668 ("perf parse-events: Support user CPUs mixed with=
 threads/processes")
> > >
> > > Assisted-by: Claude Sonnet 5
> > > Signed-off-by: Nia Su <nia.su@sifive.com>
> > > ---
> > >  tools/lib/perf/evlist.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tools/lib/perf/evlist.c b/tools/lib/perf/evlist.c
> > > index 1f210dadd666ff818a23712ab95acaa659ccf8dc..a1064175f12ba655a9f7f=
e42e7c7e4c49ae60423 100644
> > > --- a/tools/lib/perf/evlist.c
> > > +++ b/tools/lib/perf/evlist.c
> > > @@ -80,7 +80,8 @@ static void __perf_evlist__propagate_maps(struct pe=
rf_evlist *evlist,
> > >         }
> > >
> > >         /* Ensure cpus only references valid PMU CPUs. */
> > > -       if (!perf_cpu_map__has_any_cpu(evsel->cpus) &&
> > > +       if (!evsel->requires_cpu &&
> > > +           !perf_cpu_map__has_any_cpu(evsel->cpus) &&
> > >             !perf_cpu_map__is_subset(evsel->pmu_cpus, evsel->cpus)) {
> > >                 struct perf_cpu_map *tmp =3D perf_cpu_map__intersect(=
evsel->pmu_cpus, evsel->cpus);
> > >
> > >
> > > ---
> > > base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
> > > change-id: 20260904-perf-evlist-uncore-cpu-b4-418af0f17c80
> > >
> > > --
> > >
