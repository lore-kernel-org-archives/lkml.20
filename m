Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D3F4EE847
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536067; cv=pass; b=QEplWTJgOIfDmDaqtEAzTdrFJqJyrJlQJOOPxjypN4jC0wQ9kw0x87ycgEQF6hsRCnBZ5wYIMBjVc2Nen1MpgzlI/ESmkNEVi9kfBu/Y64GtlaUMCI2/OzDI/n0zCp0pAUvGQMSDkvwZ3sMX6j7oYI5BUT2b1jzhZq2PE49M4zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536067; c=relaxed/simple;
	bh=FzVf3j0DElpuxBm+UFR84uBp4/6OPZNVJ6LWKu6fr+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SAfMXlUlexC0fnCBYsJpQFybl7Xw3LcZdT0fRyhc0lxJBEg6MOfr3OK4fFbXxzgiveTiRDqNeQ31XO+RW1R8n0yLlW9I/fzhZ4AFsSC5WSHjAP70+j4ckPkPCgGGUT7iGtVfHaxPr+g26/AZKLkfd1BiCvQJOJYBAApFIUeUQHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xnc/zpZM; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xnc/zpZM"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so243061cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788536064; cv=none;
        d=google.com; s=arc-20260327;
        b=MKZyv5VAsD+LhgcKsYzaxCRI5y37otWibOOQVtj7Sdx4Tzrh+RXdiuK1sHaB3KM7pS
         Y1abGxPH2O7kWfc78+cBGxTW8E5375AhGT5uxcUwiDhmPvp++pVBnZQPhPTkOWQVroDJ
         +9HJe8naf73NG4TbhWo3gVqgXsJAnx6jdGG/hh3beClHZDRBbJFno69Kr9YjSukPPIzd
         CeIXj2Xbvsq+YXy3vIuBuXrgzGTv1sI4QDgznUj2w2gW+lpv5XCvFRRkg+S+qhxQJ8JH
         y7vT37WuILwoC3djfJ875fblh+NP653VxvOuD4V4Y4KDODOIZoaEHNzowJnDcO4iQe5k
         5SVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lwu3BnDRwXYFAITY0rwPd5C8ikLKwVXNsQBsrH3pHvo=;
        fh=Ct0WJUpoDzkSsZ6AyzsMUJuwNkS86yTtuvJp+Q7ZmXU=;
        b=bdW0cKSjRsVDHgteFiInevxicQfs56md0lw1ozw77MmRdEidLDaRqZ/m0eytN2PGis
         AJE4BJulqXWpgiw1sttCukyAixSegXz7VuyOzZPGsekUf9zitwzGuMpdQsgBYPE+6qO/
         /wdRdrwSws0Ja+rrkjQJF9QZNXbIG+OAh8FSrX578fiYtqpbCtiOrW2MCEXYffhG8iPR
         MxlJf0jjUWfKK5z9jyVPt1bpE00jV8NHeNy1BcCaJ9wt48iNLCDoo6ohrlXK4YVZW08X
         qEs/4AVcDyO5+HPymwqOo15it8DmIScpX9DpnhEHYJ52voTSZmbnBait7cMPwoul2naC
         gXOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788536064; x=1789140864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lwu3BnDRwXYFAITY0rwPd5C8ikLKwVXNsQBsrH3pHvo=;
        b=Xnc/zpZM1HzEoTQ3cI/tBYsqVVG2Ohizys7WP3pCQfQNwBzCRkyu3crgSw0USw+e//
         f8gEpjew722TgDFigxVsCdvoSfJTwZno9746jXirMRFh4QoCDlIbCN7/sD3E+9T6XMuc
         OF6RyQyyKDPTzGhcrlx2+aQmVZkvaFt2DtIDF3P/3qudcPC1zy7L4AmArBHz+iEemTGq
         R1+h5Rxg1mfcx308w4YIjSfr725LevFGXuc2QXf6VGmP8zQki73z1CojNNco660KpTcL
         sOmtpiJn2GvGVDfALeCFUHA1ArZKHSAoQU3cK3IoCgjPiyJTK6gyH6L+RYyTT/PTe0R8
         ksLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536064; x=1789140864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwu3BnDRwXYFAITY0rwPd5C8ikLKwVXNsQBsrH3pHvo=;
        b=eiutgWyegZx1rCXQzxVU6Q/JlNovxivom6M8/dxPtlMe7CxyIQHJFZFdnhxntNDHt7
         Ma2f9aqbERRShLnyz3v1q9mPzkWqMynEIS1MtGq6e6S2/oCQzuJLnUCu8N5+eoHUejbP
         mtqLdb1Hr6OGvJj8U1PexgjivnjD2bFRKIOHgHfgiBIb2BW3sHwx93/G4RN1Sp74zq69
         ydqkQf64vfdwO33uIPepMQsnnZryg3UUe0ABRmKehPSGxarrnxODtE8VYg37V0NGOUrR
         /OZYatuaM/U1OV86MzI2m1i7Y29hBmvLby2QPhpWZcduKWPgFAppJSOppmQN0Q3y3oLE
         u49Q==
X-Forwarded-Encrypted: i=1; AKwUvBx4vgXUExKW4u/n139GBsIqduyrFA36s9acMAfYhAteeXN9XjWy5c/4z73eCXoWSY49uvMo+wnriIrv34Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lOXjccC7/Fjwr3oyhYka3fcPQq/xQlsHG41MdmbBNwtmO5qPf2
	tbhFS98zKQ2Sw+EMvJa7eYy1dZ0BBIVxJ9HdCL58qXDGT42YolMuYx8D01D9cyAnobDFVDAWKtn
	94U+OidmaIAsWASX0oSWMaPHbM74IQxqg6GRrQGqf
X-Gm-Gg: AYBFou07hiiMneqH/RbAs1UpvgpDG9/KDhYZ3B5SUHp32Gr2KqX/XQFKNHPpcpkaiH7
	jjYdTXo9EVWStGaBSWkNypga4PSbJXx3MDWvfMAmJycjl7bKYjgOcJ6+q5/JE6UWRQIhSo2+9SY
	/Mv1yKP0sOwqJCnmiW7kd3UOIcQjdLHidVoFQH16TOcLB1yhMvuzhZzUAfrJgjWrfxa62mcZcCo
	0YBFNFNfZXSi5dE5b7Nd9T9+QRez1j0ylop6ybnMnbNOLCYutpXu+ViNzF+4NiLDTy8OAZzHHgu
	dSqGGbwVrv2cvmns+WzChxqvdLQlqog3kblNsRJtDyQOox2NAUC3CjrwYmipv9u7vGa9A0XB33g
	=
X-Received: by 2002:a05:622a:2307:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-5305583dc85mr14566791cf.4.1788536063097; Fri, 04 Sep 2026
 08:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-perf-evlist-uncore-cpu-b4-v1-1-604b55c025ee@sifive.com>
In-Reply-To: <20260904-perf-evlist-uncore-cpu-b4-v1-1-604b55c025ee@sifive.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 4 Sep 2026 08:34:11 -0700
X-Gm-Features: AcwNN1X8l7vZteLsC6B1Tn-ATbiYvd-I2Xq0o5cYs2PrOkgmh6Tezl23AbEdnMI
Message-ID: <CAP-5=fX1uKg8AncsP5BVFtchgns5TquOTB10-mR5ury2CaH0sg@mail.gmail.com>
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

On Fri, Sep 4, 2026 at 6:45=E2=80=AFAM Nia Su <nia.su@sifive.com> wrote:
>
> The PMU CPU map has different semantics for core and uncore PMUs.
>
> For core PMUs, pmu_cpus contains the CPUs on which the event can be
> opened. Intersect the user-requested CPU map with the PMU CPU map to
> reject CPUs unsupported by the PMU.
>
> For uncore PMUs, pmu_cpus is just the default CPU to open the event on,
> not the set of CPUs it can only be opened on.

This isn't quite true. On a dual socket Intel machine, `pmu_cpus` will
contain a CPU to open the event on per-socket.

> The user-requested CPU may
> override the default and be used directly, and the driver can redirect
> the event to the appropriate control CPU.

Agreed.

> Currently, __perf_evlist__propagate_maps() intersects the user-requested
> CPU map with pmu_cpus for all PMUs. If the user-requested CPU is not in
> pmu_cpus, the intersection becomes empty and the evsel is removed before
> perf_event_open() is called.

Could you give a command line example of the perf tool doing this? I
ask because I'm surprised the uncore specifying a CPU behavior has
been broken. As well as `perf record -C` there is also a somewhat
newer cpu event qualifier.

> Skip the intersection when evsel->requires_cpu is true, which is set for
> uncore PMUs. is_pmu_core is also false for other non-core PMUs, so
> gating on it would have loosened this check for them too. Core PMUs
> continue to be restricted to their PMU CPU map.
>
> requires_cpu can also be set for BPF counters regardless of PMU type,
> but only when has_user_cpus is false, so this guard has no effect there
> today.

So the separation between libperf and perf is frustrating, and libperf
lacks the necessary PMU abstraction. Using requires_cpu as a proxy for
an uncore PMU test is okay, but it would be better if we had a boolean
flag especially for this. Given this, a comment should be added saying
that requires_cpu is used as a proxy for an uncore PMU. The real
meaning of requires_cpu is that the event doesn't support
perf_event_open with a thread.

Thanks,
Ian

> Fixes: 811082e4b668 ("perf parse-events: Support user CPUs mixed with thr=
eads/processes")
>
> Assisted-by: Claude Sonnet 5
> Signed-off-by: Nia Su <nia.su@sifive.com>
> ---
>  tools/lib/perf/evlist.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/lib/perf/evlist.c b/tools/lib/perf/evlist.c
> index 1f210dadd666ff818a23712ab95acaa659ccf8dc..a1064175f12ba655a9f7fe42e=
7c7e4c49ae60423 100644
> --- a/tools/lib/perf/evlist.c
> +++ b/tools/lib/perf/evlist.c
> @@ -80,7 +80,8 @@ static void __perf_evlist__propagate_maps(struct perf_e=
vlist *evlist,
>         }
>
>         /* Ensure cpus only references valid PMU CPUs. */
> -       if (!perf_cpu_map__has_any_cpu(evsel->cpus) &&
> +       if (!evsel->requires_cpu &&
> +           !perf_cpu_map__has_any_cpu(evsel->cpus) &&
>             !perf_cpu_map__is_subset(evsel->pmu_cpus, evsel->cpus)) {
>                 struct perf_cpu_map *tmp =3D perf_cpu_map__intersect(evse=
l->pmu_cpus, evsel->cpus);
>
>
> ---
> base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
> change-id: 20260904-perf-evlist-uncore-cpu-b4-418af0f17c80
>
> --
>
