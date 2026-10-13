Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D988551D523
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898166; cv=pass; b=hV1vt1UEphn6b/vVZpcRXRD3SC27BUO3xSIBLuaz5i+88XOMS9IDOs0TEy4F4NsiHl1l00TBrRZBcIt9W3gndGU81+VO7VnsMNFN7sNhTVMdYH/GAFfmtHn2x82po7KEEWsC4++sk1b7RDjJFG/3pn8zvKEH8YSEcolpRrs+Nh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898166; c=relaxed/simple;
	bh=xFG8pRzJwqHSYz1ahl0Nv6+CxBGkp2FcavjQZZvSvWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDwifmb3SUwxAUZEQFeddwEwN9wk2jI84MbppkarGZwVT2dJPV7DQ/iHObiZ7RESlCHaVBhA2JkCmtvAHq0dpZg+F014beg4uou+EabSLwhs8R2S779SnEuSQUyZ4/X6u61XDc88P+sys7MektrbIxhIFHQTvJ6xLMZRGopTMuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YtNH8fIT; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YtNH8fIT"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533202fe429so739001cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791898164; cv=none;
        d=google.com; s=arc-20260327;
        b=H6PZfoueZ61jpSQA2U6htDIRCNQZRx5OZltCGIiJKS7L/cuHahpul2S/UFWJon+cYa
         K7evAejhXfbdKJycx9k2jv2XY62xutqWymWzGvCQvtNtnCG45Rp+ZOy8wfmeCAE2sRg7
         pR9x8dpK71O5QOa0LxWDIbEO0j7p2fmmbu7U4Jfkb/Afgef0bWkP1vpo+ufRrTG0qQlR
         rnPiuETsddi8TSeIl6nbIyoVtieQZnPggNSgz/KQ9u2Cg76tLfHGxkhLiMvsmPtml1ju
         2bX90doDUu9SDJF6YrLvyIwKBv3r8DnU3lS5KMovXXq2IA++D06VeEw6CnOiMAdeg2ma
         ThAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k2ZJ67cl4IO2/wFBLGAmZXVM6FrfonA4qhd6y3/BX5E=;
        fh=VeZSPjgUiR5/yTX2sfprcvU6IRIAU56aI7s2zmads4s=;
        b=WKaNQU9iEjVfBNWeXtdyztIO0a1o76/nbPXuc+8TOaHlTufM12W8JSxxBYtk2/l5yx
         cO8a7+mAiLHbmY2ftwOlyU9z+n7xfQxPiDZs0PaL2tda/BFAQOV+wNjQmkfpT0AdEHDc
         6airNbfc77K04dGU6YISdLQF0XrTlVwH0PKdEh3X4/qW9NX1ADKBvR1GTiUXocM7Z3NZ
         8qUyfdA4aVgP2K61hNk+a3kO37KST3MQVy2zgbk+2DW5rqtguxU6/3IBDypFVxjpQTTQ
         zEk1imifH18iv/My7G4eONSUPzCKp626Af3eN3FcVf9IDDT4pdOMfMb+JX+qZitq7SD9
         2Yzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791898164; x=1792502964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k2ZJ67cl4IO2/wFBLGAmZXVM6FrfonA4qhd6y3/BX5E=;
        b=YtNH8fITsvMujN7RZkU30AVJ43qxbhH8Nscqj2RI3xtLnFjxUaAYK/U4oupekgX9Rs
         r6ONbx7WMkpPaWhf/NfIIz5H6hcpUUqBJ0zZtgmJHr5uWo8rOVvorpYFeLkpD0kaa3mv
         5Xoee0IU5P7A0XKwIVLl0F51vFlj7nh0wA3npOJTVrP6nTl9ZZOgsozbMjlcpaKOkx75
         l4oaVwhSOaFVW9SSDvaP2S7/7nEOBHjb801f4ynipHdNXz81JPJlHNSgVr1jaaDbDCAx
         aydpreIqB1AZ/dgThdL4fOa2JoQF2cGsPZfZbcH8shngkilrDGyEjX3++vcU/GyH6Tim
         FZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898164; x=1792502964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2ZJ67cl4IO2/wFBLGAmZXVM6FrfonA4qhd6y3/BX5E=;
        b=xiRPzxcCD8UPpQp475vozMFUNETxMIXW+UfgZwIHu03EyWnFxI4EptsFCVkwZCG4ae
         vMTkywjGvmjHMlZZFRlnB/pR9MZFGqtkT2v4od+e5ORB2bABCzlJRZhB8+4qe4WSTrQ+
         qpiugt70znuFIwXJg1IxP26YVLNMLia211YtnDfip6IGGZMZtFF+tdIFUSGP/s72+cxh
         +tLyiBS0akhovojnaHGs/NY1umDD8tYQ/K4yGlxHOGECijvSiZl2Y4djVVITe2uzolzY
         OrJLxET0EuU/0gatUkLBbX1aIcI+t4IYRhFNJZmzTEKvuc8VOwpuY2tAC+4lgVqM1J4P
         e6fg==
X-Forwarded-Encrypted: i=1; AKwUvBz5hTUhZ3TAGaZwi/OUY0MIVHsKDEMon157FYPxuae9sEGgYmhkVqhm5v+kKgO0tvOaygBwHvk5RiNHi2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN7ygtWNMlXn/Atpu7FNKoyzX18DPDUrg5uxQs59TMsg8vgpmY
	E6ev+qss93CISx50MxARwjesVqbKFQpyp85GIyjXbYF2OfH0litkUk/wo8ADwzZ/P9F9j452j/v
	Fjh/j2hcAf2jTvChs9rnfpqlFWs6Ms5rwLhs9ewph
X-Gm-Gg: AYBFou2HgDv0RS5Buhsb2fpBQTOAb2KICT7X4353U2jjbkNRb4/5GHjwLjSPlgwTUoU
	+4p/A5D+Oijkla0L/P7snsCnzeMSFGnS2A3OGd/QR+aq1hoQF04hLqVEId62+cR1xmYOKTNc1QZ
	zFJsWE6SE2ZAbjGuj4fuDi0ZPY8kbpPZUS/hGb3lQSev3wwLx77UopIqmPGaQcL1ki8m5WhP0Q8
	jQEaWsSmm8RPTDnK4omBSdQY+TFmzV29pbCxZ1Ij5F0PkqVmcMJzHrgJpVnF253pP8etdumppiv
	zniq1nOJ0IMifYq4GRHoGUvrbWF1v1WUeBJeY9Fkzt6YczjTonF9ybTl
X-Received: by 2002:a05:622a:1f0c:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-535b4eca219mr52262061cf.8.1791898162935; Tue, 13 Oct 2026
 06:29:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013130052.3012773-1-max.kellermann@ionos.com>
In-Reply-To: <20261013130052.3012773-1-max.kellermann@ionos.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 Oct 2026 06:29:10 -0700
X-Gm-Features: AclHuK9sirKJ2K2WjUv42s8M4AHEmquQGSkkZvKFoqEcv8urLNEiHGZTNG_l-lQ
Message-ID: <CAP-5=fVPtjkxcjEkR9r6QZGsoKe=_rZssjZp1FcJ7rCgntpPng@mail.gmail.com>
Subject: Re: [PATCH] perf: skip unnecessary userspace map synthesis
To: Max Kellermann <max.kellermann@ionos.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 6:00=E2=80=AFAM Max Kellermann <max.kellermann@iono=
s.com> wrote:
>
> Reading `/proc/PID/task/PID/maps` for existing processes is expensive
> on systems with many processes.  `perf record` already allows skipping
> these reads with the `--synth=3D` option, but `perf top` has no
> equivalent option.
>
> Skip userspace map synthesis by default in `record` and `top` when all
> events exclude userspace and no sample feature needs user mappings.
>
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
>  tools/perf/Documentation/perf-record.txt |  4 +++
>  tools/perf/builtin-record.c              |  8 +++++
>  tools/perf/builtin-top.c                 | 19 +++++------
>  tools/perf/util/evlist.c                 | 40 ++++++++++++++++++++++++
>  tools/perf/util/evlist.h                 |  1 +
>  tools/perf/util/record.h                 |  1 +
>  6 files changed, 64 insertions(+), 9 deletions(-)
>
> diff --git a/tools/perf/Documentation/perf-record.txt b/tools/perf/Docume=
ntation/perf-record.txt
> index 178f483140ed..cdef14f22df3 100644
> --- a/tools/perf/Documentation/perf-record.txt
> +++ b/tools/perf/Documentation/perf-record.txt
> @@ -696,6 +696,10 @@ Available types are:
>    - 'all'     - synthesize all events (default)
>    - 'no'      - do not synthesize any of the above events
>
> +By default, userspace MMAP synthesis is skipped if all events exclude
> +userspace (for example, with --all-kernel or -e cycles:k) and their
> +samples do not need userspace maps.
> +
>  --tail-synthesize::
>  Instead of collecting non-sample events (for example, fork, comm, mmap) =
at
>  the beginning of record, collect them during finalizing an output file.
> diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
> index a57987851cf0..f8b4e5279fca 100644
> --- a/tools/perf/builtin-record.c
> +++ b/tools/perf/builtin-record.c
> @@ -2574,6 +2574,13 @@ static int __cmd_record(struct record *rec, int ar=
gc, const char **argv)
>
>         evlist__config(rec->evlist, opts, &callchain_param);
>
> +       if (!opts->synth_set && !opts->full_auxtrace &&
> +           !opts->auxtrace_sample_mode && !rec->off_cpu && !rec->buildid=
_all &&
> +           !evlist__needs_user_mmaps(rec->evlist)) {
> +               opts->synth &=3D ~PERF_SYNTH_MMAP;
> +               pr_debug("Skipping synthesis of userspace maps for kernel=
-only recording\n");
> +       }
> +
>         /* Debug message used by test scripts */
>         pr_debug3("perf record opening and mmapping events\n");
>         if (record__open(rec) !=3D 0) {
> @@ -3412,6 +3419,7 @@ static int parse_record_synth_option(const struct o=
ption *opt,
>                 pr_err("Invalid synth option: %s\n", str);
>                 return -1;
>         }
> +       opts->synth_set =3D true;
>         return 0;
>  }
>
> diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
> index 570410599f1b..d85ecc140eda 100644
> --- a/tools/perf/builtin-top.c
> +++ b/tools/perf/builtin-top.c
> @@ -1017,14 +1017,6 @@ static int perf_top__start_counters(struct perf_to=
p *top)
>         struct evlist *evlist =3D top->evlist;
>         struct record_opts *opts =3D &top->record_opts;
>
> -       if (perf_top__overwrite_check(top)) {
> -               ui__error("perf top only support consistent per-event "
> -                         "overwrite setting for all events\n");
> -               goto out_err;
> -       }
> -
> -       evlist__config(evlist, opts, &callchain_param);
> -
>         evlist__for_each_entry(evlist, counter) {
>  try_again:
>                 if (evsel__open(counter, counter->core.cpus,
> @@ -1265,6 +1257,14 @@ static int __cmd_top(struct perf_top *top)
>         if (ret)
>                 return ret;
>
> +       if (perf_top__overwrite_check(top)) {
> +               ui__error("perf top only support consistent per-event "
> +                         "overwrite setting for all events\n");
> +               return -1;
> +       }
> +
> +       evlist__config(top->evlist, opts, &callchain_param);
> +
>         if (perf_session__register_idle_thread(top->session) < 0)
>                 return ret;
>
> @@ -1296,7 +1296,8 @@ static int __cmd_top(struct perf_top *top)
>                 pr_debug("Couldn't synthesize cgroup events.\n");
>
>         machine__synthesize_threads(&top->session->machines.host, &opts->=
target,
> -                                   evlist__core(top->evlist)->threads, t=
rue, false,
> +                                   evlist__core(top->evlist)->threads,
> +                                   evlist__needs_user_mmaps(top->evlist)=
, false,
>                                     top->nr_threads_synthesize);
>
>         perf_set_multithreaded();
> diff --git a/tools/perf/util/evlist.c b/tools/perf/util/evlist.c
> index c3d784727810..6636edee0d2b 100644
> --- a/tools/perf/util/evlist.c
> +++ b/tools/perf/util/evlist.c
> @@ -1990,6 +1990,46 @@ bool evlist__exclude_kernel(struct evlist *evlist)
>         return true;
>  }
>
> +bool evlist__needs_user_mmaps(struct evlist *evlist)
> +{
> +       struct evsel *evsel;
> +       bool has_kernel_event =3D false;
> +
> +       evlist__for_each_entry(evlist, evsel) {
> +               struct perf_event_attr *attr =3D &evsel->core.attr;
> +
> +               /* Tracking events do not produce samples, regardless of =
modifiers. */
> +               if (evsel__is_dummy_event(evsel))
> +                       continue;
> +
> +               if (!attr->exclude_user)
> +                       return true;
> +
> +               /* Kernel samples can still contain a userspace callchain=
. */
> +               if ((attr->sample_type & PERF_SAMPLE_CALLCHAIN) &&
> +                   !attr->exclude_callchain_user)
> +                       return true;
> +
> +               /*
> +                * These may reference userspace even when the sampled
> +                * IP is in the kernel.  Keep maps for opaque trace
> +                * payloads and AUX trace decoding too, whose address
> +                * requirements are PMU specific.
> +                */
> +               if (attr->sample_type & (PERF_SAMPLE_ADDR | PERF_SAMPLE_R=
AW |
> +                                        PERF_SAMPLE_REGS_USER | PERF_SAM=
PLE_STACK_USER |
> +                                        PERF_SAMPLE_BRANCH_STACK | PERF_=
SAMPLE_AUX))
> +                       return true;
> +
> +               if (evsel__is_aux_event(evsel))
> +                       return true;
> +
> +               has_kernel_event =3D true;
> +       }
> +
> +       return !has_kernel_event;

Thanks for the contribution! I can see if there's a user event then
evlist__needs_user_mmaps will return true, otherwise we'll return
false if there's a kernel event but true if the list is empty or just
contains dummy events. Why do the empty list and dummy case need the
user mmap events?

Thanks,
Ian

> +}
> +
>  /*
>   * Events in data file are not collect in groups, but we still want
>   * the group display. Set the artificial group and set the leader's
> diff --git a/tools/perf/util/evlist.h b/tools/perf/util/evlist.h
> index 838e263b76f3..b208bf7211e8 100644
> --- a/tools/perf/util/evlist.h
> +++ b/tools/perf/util/evlist.h
> @@ -631,6 +631,7 @@ struct evsel *evlist__find_evsel_by_str(struct evlist=
 *evlist, const char *str);
>  struct evsel *evlist__event2evsel(struct evlist *evlist, union perf_even=
t *event);
>
>  bool evlist__exclude_kernel(struct evlist *evlist);
> +bool evlist__needs_user_mmaps(struct evlist *evlist);
>
>  void evlist__force_leader(struct evlist *evlist);
>
> diff --git a/tools/perf/util/record.h b/tools/perf/util/record.h
> index 93627c9a7338..1317ddce3cf0 100644
> --- a/tools/perf/util/record.h
> +++ b/tools/perf/util/record.h
> @@ -80,6 +80,7 @@ struct record_opts {
>         int           ctl_fd_ack;
>         bool          ctl_fd_close;
>         int           synth;
> +       bool          synth_set;
>         int           threads_spec;
>         const char    *threads_user_spec;
>         u64           off_cpu_thresh_ns;
> --
> 2.47.3
>
