Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DE83090C2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745522; cv=pass; b=tBoceqU0ePvQe4yicGJBqCgGaCnt8tXm9X6pd+wp8SlpDdW3PKiwdsX7H2RSVi1yXbYp67fQjNfCcaunwhyg1U1rzG9p55r17Jcg+8qICGIZ2fqMWPkuwmCG9tM04dFbJIfJuWenzIyJaWS0Pxt203Dnwy5uEBYfICc/imRlYAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745522; c=relaxed/simple;
	bh=hp8K6SrwBdoU+e2wO7+eb7bUKjXFK4WIfUnNEL71uAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2z1HVCQBUl7BtnJdJ2kvNOBLhEL0Uwt52sqvlsgGGrq250TqfPq7M9BSkSwzKi8aq67A6Z4SNbRKl5H6Bl0wSx2uPlFna5LhjXHGbPjuh/5DlxAUFjQbnRrYtoh7n4yJKX6iHTZWV5GtpnZTMUtR9km5Qmx15KPVNMNBpV0foc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KG4xJnAG; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KG4xJnAG"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-530e8c6fb80so288211cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789745519; cv=none;
        d=google.com; s=arc-20260327;
        b=JDQeIS+rzO9WRq74nHnSolcgGjDmYKtv3H6tF7jq2+XpQzfaaScU6t0g6hvJ0KMw4g
         SVG2zF8wJ4ZML/8+/5vaUI/dVq+5vNR3OmaWFhGoUuRobx/p9ysf5AvFeB2j+Pd706uC
         SWN8TRjoMO5DuFS1Efq0qyem2MrAptwlHT0pHwgxaNv96tuzt6dCMCnsVDUAvcN8T6qJ
         4tPz0SggKoqtQC1ATKTap0CKBnypujt3KqtG1SSwCDyzyq7Oh/FOJoUAj+X2RYGieQhN
         XVCmMiPUf4oMkuS6Nxr9IndPrRq5xm70WcvPfL+IqjM1C4DuG2xIAuWpn9vHo9SGoFIZ
         5x+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dewjtoIEBFOvSiAWpjFtBX+g4LwL5kovJX9ITwRujXM=;
        fh=ZBZKYAWv24Dx7S/mu7f/63Jgi/G56AiytAbtfJYYZ1w=;
        b=bwcmEyFxi8tKEJZNWaD1t1Ua1moVtS3SAYYx5YkQZvLgidOvEhEOafuOzQwJwnT7A3
         cMOcvfJwcVBM06G0adc57CelhjruC37ZYJ1M0Pbi0K7iP7b1HGf2he5Liu406y4o8hXy
         nFYdEq6GQ8onLcu+YfgHOewYP+V4C17K/V+sY9jLg2/ErHFsrLzGCjWMoDKQeIueY0fa
         WGH0+4mxiV6y9APGXUPJoeo1MW7QWGgVYAxH2RWwIp+xbs7jfqiwmtZW985kMfgf7KP2
         RfZ4/OKwouuUUxcCE09Dxjg/BA+o9cXtCsPcRuKuuIqYkMPu4FXwhlW1kjOgFGf23NvU
         86GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789745519; x=1790350319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dewjtoIEBFOvSiAWpjFtBX+g4LwL5kovJX9ITwRujXM=;
        b=KG4xJnAGJMrJ8gW8EI4ZeGU3FMSdZx4mMIr3Z7sCD46Fa8bELio3zMBYh++n1k0HPR
         k+YZ4s9okUNM5A9uMpzAU6dVpFs+u4deImFUAUGkL8c8RkH3ppkqFWvwC7A04CDVA9xC
         1lenyarPGhMCQScjWbqk7MR1FdmRX6OMTESFCsEZgSRafhOAShPAtPwfNWNNCCc4Z8Y+
         V6+uwShcLEUf3WCsfQDmlt8Y2gK6OzWd5ZwzMJi3HjSL5w11bDj50a876pYTskGjZp7m
         uNg/stAJA1vUR51e2D2q+Pktv20OY3eJy9dIvzr88RHz5mhCOIb8nJjz7AZHrb7Jr3Nv
         ddNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745519; x=1790350319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dewjtoIEBFOvSiAWpjFtBX+g4LwL5kovJX9ITwRujXM=;
        b=FhTihuWWzc25MLqVRXd/NaFQAmU8g6+5mqYwDUBeLOWLqIHllXcNsErfvoyv4dPN9p
         qMDOT2RRas+H78DshDtWUSN0+ztbGX0i6xLDY+ZAO8Eyee/G8rZUyU4GtN+K58qWjWKR
         1wAdsADI3qxXVqdUzeNCY0W+Sr4XBjHiULWd/RB/4GuOcWi/85d/mn7lXJbJrd4LHYG0
         Y9cJOfhnNKOScexNxUSQXtgMAGujmqH6P8bfx6VoqGlycyScR9fG9gohQtMNuPvqEIe5
         O+e1NuYeBsqwpQR22EpxMgsrtOMwMDeICexfD85UkSjoLsL92JPpTMij2Npue7Tv3CKC
         lgcQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/CjkMz81SWmkyfrLioKjE8vgJv/8gNEdvV+xe+wZySMU9hO1ETF+CbMdr2gfQ+H72dzTdf99OL36xFgA=@vger.kernel.org
X-Gm-Message-State: AFuF++nEpAGvvKaYr6ZjO1dOElT5KOp3ZeGCTdqrRGPsw4rNJRVKLKvY
	dFlxme6mEzn1kt3LYheVHkEymQmtzHJMPX+c4CKdKWrJhbtvmUCXHbsR3ahVsaGCojwk094Fa0s
	iJ2RIp3OfAvcmgqDh8jWC2K6mIVYBejL4sG89wmGc
X-Gm-Gg: AYBFou0guiPB3ji4dwqYMW2UfvlRI4G62reg/E4tR0NXNrRiiohNvnjeEv6iw9UhbHN
	NbgeJF8JMqtSbcfrd+bFuAC2ENgEXyOyDgx+vhORZ3CGOOUbnv/X4u8KqqZ2RlnRQngeOpLNwmt
	hV71zgUPhozctJ+BS+ezI1rnk44A0arriv+YC8PmZgP5IwKekmPvSZgXtkCUb1hPcfisV1Trfuh
	qkR/1YHb+MofpinFD/I6fVUsa0HF5x+4TvFvPeQXLdE0GZhl94grZ3r9fFwkTE5PA/6X96Clqh6
	12ZKQF5scVnBcszfl0fGl1AR0ZPNoUJsK06F7Xstd3h2a+EI0M+YHxkf/ePSOeOo
X-Received: by 2002:a05:622a:14d0:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-5329d2e1093mr18247261cf.0.1789745518385; Fri, 18 Sep 2026
 08:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917095921.2802275-1-sandipan.das@amd.com>
In-Reply-To: <20260917095921.2802275-1-sandipan.das@amd.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 18 Sep 2026 08:31:46 -0700
X-Gm-Features: AcwNN1Vf72XtsGyuzBFuyeEaR4yzTJKkeyCI8WH25n0dlkARhAdbTcppBKif0qY
Message-ID: <CAP-5=fXcDT7Vi32odox1_gSbiGakN8KQMjXCZjmh=SyxuaVDZw@mail.gmail.com>
Subject: Re: [PATCH] perf jevents: Limit the number of JSON reading workers
To: Sandipan Das <sandipan.das@amd.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Borislav Petkov <bp@alien8.de>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Ananth Narayan <ananth.narayan@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 3:00=E2=80=AFAM Sandipan Das <sandipan.das@amd.com>=
 wrote:
>
> The ProcessPoolExecutor is created without max_workers, so
> concurrent.futures defaults to one worker per CPU and forks all of them
> when the first task is submitted. Each worker costs the parent a few
> file descriptors. For systems with high core-count processors like the
> AMD EPYC 9996, the pool can easily exhaust RLIMIT_NOFILE as seen below.
>
>   File ".../multiprocessing/popen_fork.py", line 65, in _launch
>     child_r, parent_w =3D os.pipe()
>   OSError: [Errno 24] Too many open files
>
> The error is reported, but jevents.py does not exit. The workers that
> did start stay blocked waiting for work and are never joined, so the
> build eventually hangs. Other targets keep building in the meantime,
> leaving the traceback several lines above the point where the build
> stalls.
>
> Limit the pool instead of sizing it against the descriptor limit, which
> would mean relying on how many descriptors concurrent.futures needs for
> each worker. At least for recent AMD EPYC processors, reading the JSON
> files does not need many workers to be fast and things typically stop
> scaling beyond 32 workers. Hence, a small upper bound keeps the speedup
> and stays well inside any usable limit.
>
> Fixes: eaab2eb09dc2 ("perf pmu-events: Parallelize JSON and metric pre-co=
mputation in jevents.py")
> Signed-off-by: Sandipan Das <sandipan.das@amd.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/pmu-events/jevents.py | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jev=
ents.py
> index 860027bb71b2..d81fe6757915 100755
> --- a/tools/perf/pmu-events/jevents.py
> +++ b/tools/perf/pmu-events/jevents.py
> @@ -1450,6 +1450,13 @@ const char *describe_metricgroup(const char *group=
)
>  }
>  """)
>
> +# Upper bound on the number of workers reading JSON files in parallel.
> +_max_parallel_workers =3D 32
> +
> +def _parallel_worker_count(num_tasks: int) -> int:
> +  return max(1, min(getattr(os, 'process_cpu_count', os.cpu_count)() or =
1,
> +                    _max_parallel_workers, num_tasks))
> +
>  def _parallel_read_json_events(task: Tuple[str, str]) -> Tuple[str, str,=
 Sequence[JsonEvent]]:
>    path, topic =3D task
>    return path, topic, _read_json_events_impl(path, topic)
> @@ -1549,7 +1556,9 @@ struct pmu_table_entry {
>      preprocess_arch_std_files(arch_path)
>      ftw(arch_path, [], collect_json)
>
> -  with concurrent.futures.ProcessPoolExecutor(initializer=3D_init_worker=
, initargs=3D(_arch_std_events,)) as executor:
> +  with concurrent.futures.ProcessPoolExecutor(max_workers=3D_parallel_wo=
rker_count(len(tasks)),
> +                                              initializer=3D_init_worker=
,
> +                                              initargs=3D(_arch_std_even=
ts,)) as executor:
>      for path, topic, events in executor.map(_parallel_read_json_events, =
tasks):
>        _json_cache[(path, topic)] =3D events
>
> --
> 2.53.0
>
