Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE5844A3F8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501379; cv=pass; b=g1yvyfcmH+B/l6Rigox9pLdC+W6NBRiMH/L8GXMMxz8x6yR8YMhjAkwxce9GPM9hA7hQjepGkVRJJkR3RFZVWIMiIERpvOPI4F6LjMz5UbC/bzpMG6oxyc2PHO/ZUehYzAd5XebN/dt5JQWjYcyDiiXvMeLpems1vJZpqObRqJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501379; c=relaxed/simple;
	bh=vO7okh2vQbhR08LoTBO4HBqEy5EyaQZuhnLsn63yUwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fg1ijw9IcaQBeEWt82DpftDIQwFk6MynZYu6rs+XQyn21aGRVRYpB6T902XlJajYfFtzg9V6aWUTRbm4RNSCFDFtu2PEvTaFFuFCfIum/5U35atjPbbM5HWOfgT4mNCR/VrUppyLkRglXyWsvVAy1nUWCEQgZ8p4hcUGRAciqvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qd65gPYe; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qd65gPYe"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530d5fc2cd8so61671cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789501376; cv=none;
        d=google.com; s=arc-20260327;
        b=ZeZOwonw/OIRDkBdeqUtNRCWr/ZQOCWSh6NpG59n8i/K2pTZGypQ7qm/Vja3/n9B5d
         5Gi4kSwk5AD45wBTQsKOhcd9sFoINTvdnvLQLoTVHedBGifJUuF1epg+/WIiSV4NcFJK
         RcqZ9ov9cz01TM0B0SVmN1DUDK+Gk/84xwzymjSdEYvxNFmZ2l65FKBaA4Jo1kh8+013
         ap5A02Cwmq6fmLphaZMMJlMmx8PBRA1+URoZqrhEQTKIGyPsvx8lgCMsgB8iOMelXwlo
         fjn0Rls4feSclvujSgaBuz0bKAqv0dI6xbELZKIhmbPiu/VetXlAst+aCtZwGJ4xtqXw
         vNTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0glIWluP5FGU2sO8Ta+IsEFm6YUeekCYft6+osOvJ5E=;
        fh=WUVjicNgnPBtrIMewdIwBSsB1iFgYfS5rPMo8LcmsnM=;
        b=b32koFXXKhaeuKDgWwpFQLwl5M1VEdq/tpKofYywJGCkeaxe0w/tZTgZCTQ+FtxwRj
         8P/MpM1Stumd1IkFB3y2FdobCKcXltrVnR6xtdfhMUcaafdniNoIZcbIO5bsrSlWsLo6
         iJOZL02TkMEAj6e9TKA3KZNjItEUundJXk3/8zGAWLZkxX6HtI9X7U3oJqN2SGgO9DYy
         pweZJ1Ybl7ACw3ZKAKow1IZyafzA5oK54Q3lO7+wJ6uAL1VOZsZOYYOGlu+muP3WaRLP
         49sRktTVNNVTPs8ALHafSlEEvLici45BmwRf/G128UzHeyWtNO1NR2VfGFmsjUQ3oRhW
         22Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789501376; x=1790106176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0glIWluP5FGU2sO8Ta+IsEFm6YUeekCYft6+osOvJ5E=;
        b=Qd65gPYeoykvN8CP41ifSf04RLD092Hz5wbcaPEZMK5AYHshY/6nEFdIFyi8DsK2E6
         60u64dof21vvokwONXF121lVYzymEhmy1+yFwguu8rSbVG41PWjYl4PdWWzbPPrr6Q8Q
         nf60Ybd53CTb76R12ntQx2Bai1zs2WDqKO/oCe8+Qi3pJ+LiJZb7+Kj0SyT7POGAjIDI
         SIAp5lE/rWodDBYpciUaKKlnCcD5RSvM0rfCEgTL0rQlbVQhuB+piRjyhTXr1VKNQQW/
         sNA0d6a7h8MAwDvH/k8XsGfxtwphJV0Jy+0/6vCA0Yj7S1Q79T3/h5+WAfu3gz9eN9d3
         Olqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501376; x=1790106176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0glIWluP5FGU2sO8Ta+IsEFm6YUeekCYft6+osOvJ5E=;
        b=fEuyaqTeUqYhlJFEXrAYO6Il2qRaNUJ0a7RUfUWZFgqVN4vQvyrKOivRONWhxQbvzY
         rmcSj3I9WTIHVDgnF6GuZH8+x1p5bBdJ9a7uK7J4dI9xqxAXiJPg6/jEp8Qdu3QXKu59
         jSCsrn9qlW2ix7IkOpkgEfTnJaNp6OY9Y0XZ1Qw6CbFLgIe/RN5jgYL72GW8GeONjfGp
         +ffO2M6+crv5xsaLfzj3ZNeipAzqd7/BqlnqBF1nlZAQxEPlfQG48tq+u7wkn6s7TVsB
         j3EtEfFhguD1iLlTxCfYJzpGs+350U4nK+vBnMVMv0opq4AGViTZIOUewkOW2AcK+cXE
         yiKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHiMo4lJpVqvmbp8A2ApdzXfpUZYE6YYbPBo3Iw5BqZAKdOGFkTCYcVj5x7WwNpIR1wkhIIRUjZFKYHTw=@vger.kernel.org
X-Gm-Message-State: AFuF++mkXbG+n6R4TBN5zo3LWdXmBbTBsFY+7qyC57e4Oo0Pc1bUMtB7
	Fw1sNtmqgufc2OgwWrB4FuQcEW+L61bWl5X7hG/IGw5y2GyUzuRqSmNpznPTJTolIDhjLJL4c4q
	+KuQLOTawX8cUlTTF4kR54aYAQJ6Jutaol6eSUGmw
X-Gm-Gg: AYBFou11mG2uZbVaO71iuCWFyIR+rh+hqJKG8tVCmR9YeHLFwcshaGrz0aV7labgxyd
	+fBgJwguf8lIaGlgj7ddtR7eIFLBnfNQ8/UgtK6X0J7h94tfNC//D3CEb1y7lMTapFNh9DMR3AX
	ozJoImWq/nfbgR2ftpHhLNx2Y0fZkcX1cF6frizH3cu2XKOW8grFls8BNbUK175fZYfTON8F1sl
	AiZQEETMTwDc1BftAhqCdat+8R4XFpO3RRIb4aqZcn2qQSh13JkB95xdW2pRJGdrynjztsuKnil
	euqWSeJ1r3k18yXBoNKz/cGZiewviuVmJ3gCU2lfdVoAOTHQhoUsxAmJrrGXhTTCWohVps/YabI
	JI7SqMIykpA==
X-Received: by 2002:a05:622a:1486:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-5324676bdaemr3014131cf.0.1789501375250; Tue, 15 Sep 2026
 12:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909-perf-evlist-uncore-cpu-b4-v2-1-dc673a1f4592@sifive.com>
In-Reply-To: <20260909-perf-evlist-uncore-cpu-b4-v2-1-dc673a1f4592@sifive.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 12:42:43 -0700
X-Gm-Features: AcwNN1UGZ6n_sZg-onyE6NMfT9OvN_z0Qh3xvwIs8LxoT2UpRZJByUaNFcVFDjA
Message-ID: <CAP-5=fU2UOT8pZFLOifxHo7U4XsPv9YbYnAitjdvxsB=0AYuoQ@mail.gmail.com>
Subject: Re: [PATCH v2] perf evlist: Don't restrict uncore events to PMU CPUs
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

On Wed, Sep 9, 2026 at 7:31=E2=80=AFPM Nia Su <nia.su@sifive.com> wrote:
>
> The PMU CPU map has different semantics for core and uncore PMUs.
>
> For core PMUs, pmu_cpus contains the CPUs on which the event can be
> opened. Intersect the user-requested CPU map with the PMU CPU map to
> reject CPUs unsupported by the PMU.
>
> For uncore PMUs, pmu_cpus is read from the PMU's cpumask sysfs attribute,
> which lists the default CPU to open the event on per socket/die, not the
> set of CPUs it can only be opened on. The user-requested CPU may override
> these defaults, and the driver can redirect the event to the appropriate
> control CPU.
>
> Currently, __perf_evlist__propagate_maps() intersects the user-requested
> CPU map with pmu_cpus for all PMUs. If the user-requested CPU is not in
> pmu_cpus, the intersection becomes empty and the evsel is removed before
> perf_event_open() is called.
>
> Add evsel->is_pmu_uncore, set once from pmu->is_uncore at parse time,
> to skip the intersection for uncore PMUs. Core PMUs, and other
> non-core PMUs such as software events, breakpoints, or tracepoints,
> continue to be restricted to their PMU CPU map.
>
> Fixes: 811082e4b668 ("perf parse-events: Support user CPUs mixed with thr=
eads/processes")
>
> Assisted-by: Claude Sonnet 5
> Signed-off-by: Nia Su <nia.su@sifive.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> Changes in v2:
> - Add a dedicated is_pmu_uncore flag instead of reusing requires_cpu,
>   since it more precisely represents whether the PMU is uncore.
> - Link to v1: https://lore.kernel.org/r/20260904-perf-evlist-uncore-cpu-b=
4-v1-1-604b55c025ee@sifive.com
> ---
>  tools/lib/perf/evlist.c                 | 5 +++--
>  tools/lib/perf/include/internal/evsel.h | 2 ++
>  tools/perf/util/evsel.c                 | 1 +
>  tools/perf/util/parse-events.c          | 1 +
>  4 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/tools/lib/perf/evlist.c b/tools/lib/perf/evlist.c
> index 1f210dadd666ff818a23712ab95acaa659ccf8dc..c1c5b0684eedb7a6ab8f3df85=
f326fbd5ef809a2 100644
> --- a/tools/lib/perf/evlist.c
> +++ b/tools/lib/perf/evlist.c
> @@ -79,8 +79,9 @@ static void __perf_evlist__propagate_maps(struct perf_e=
vlist *evlist,
>                 }
>         }
>
> -       /* Ensure cpus only references valid PMU CPUs. */
> -       if (!perf_cpu_map__has_any_cpu(evsel->cpus) &&
> +       /* Ensure cpus only references valid PMU CPUs, except for uncore =
PMUs. */
> +       if (!evsel->is_pmu_uncore &&
> +           !perf_cpu_map__has_any_cpu(evsel->cpus) &&
>             !perf_cpu_map__is_subset(evsel->pmu_cpus, evsel->cpus)) {
>                 struct perf_cpu_map *tmp =3D perf_cpu_map__intersect(evse=
l->pmu_cpus, evsel->cpus);
>
> diff --git a/tools/lib/perf/include/internal/evsel.h b/tools/lib/perf/inc=
lude/internal/evsel.h
> index b988034f13710ec4d49d942d486c4b9afe21a1f0..35447bed0f9586b538dad40c2=
23e70d50486c5f6 100644
> --- a/tools/lib/perf/include/internal/evsel.h
> +++ b/tools/lib/perf/include/internal/evsel.h
> @@ -128,6 +128,8 @@ struct perf_evsel {
>         bool                     requires_cpu;
>         /** Is the PMU for the event a core one? Effects the handling of =
own_cpus. */
>         bool                     is_pmu_core;
> +       /** Is the PMU for the event an uncore one? */
> +       bool                     is_pmu_uncore;
>         /** Does the evsel on read on the first CPU index such as tool ti=
me events? */
>         bool                     reads_only_on_cpu_idx0;
>         int                      idx;
> diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
> index d4cb455f4a7d45ae2f9133709ff3248b54163ce0..5acec3f6345099ef9e46e8161=
4b9df2595925b1c 100644
> --- a/tools/perf/util/evsel.c
> +++ b/tools/perf/util/evsel.c
> @@ -551,6 +551,7 @@ struct evsel *evsel__clone(struct evsel *orig)
>         evsel->core.system_wide =3D orig->core.system_wide;
>         evsel->core.requires_cpu =3D orig->core.requires_cpu;
>         evsel->core.is_pmu_core =3D orig->core.is_pmu_core;
> +       evsel->core.is_pmu_uncore =3D orig->core.is_pmu_uncore;
>
>         if (orig->name) {
>                 evsel->name =3D strdup(orig->name);
> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-event=
s.c
> index cc7ad331a49f34536f66724370b8bb94ab65bacd..8302be207c1d6ecf8ae6fd67f=
54d66d08d50e01c 100644
> --- a/tools/perf/util/parse-events.c
> +++ b/tools/perf/util/parse-events.c
> @@ -269,6 +269,7 @@ __add_event(struct list_head *list, int *idx,
>         evsel->core.pmu_cpus =3D pmu_cpus;
>         evsel->core.requires_cpu =3D pmu ? pmu->is_uncore : false;
>         evsel->core.is_pmu_core =3D is_pmu_core;
> +       evsel->core.is_pmu_uncore =3D pmu ? pmu->is_uncore : false;
>         evsel->core.reads_only_on_cpu_idx0 =3D perf_pmu__reads_only_on_cp=
u_idx0(attr);
>         evsel->pmu =3D pmu;
>         evsel->alternate_hw_config =3D alternate_hw_config;
>
> ---
> base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
> change-id: 20260904-perf-evlist-uncore-cpu-b4-418af0f17c80
>
> --
>
