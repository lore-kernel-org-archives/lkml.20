Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405AC233944
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961249; cv=pass; b=BzhIfpTNeLOEQXt2C0d1HbsiHTsN7G9CKTPWMVXLdTOOnX/O1p1kfPA94cmMsEGZtomjgoJzB7QKz9AVjpRjhj+Emx9wPKF3NRNNdxuj3AMYi3fMw4I8Ui2UvNIoR8J/kYxwX4BLCf07ia4fxX/kPvQD+ytC6/TCBV0cBgKhiL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961249; c=relaxed/simple;
	bh=V1geDr4Q9jb3CHPs03vi1oxUrTZqJBIQgowXVd1lGE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jxASd6a88et3kFHB7nr27luJ/SNAyfEw2uHBTpjc+gDlVeaK14WbV7PebvKPKFAF97X7wufPMFAFEvYH3CPdd6B8+Bxr00ChkXe8HGR5JaME1rqyBaLXotjBRBD13ZWcc6awBHLXBeYsNDDU5su5T688Uy5Jzm7C3AJ7liDhtms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eOJU3Jyt; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eOJU3Jyt"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b3e517e6dso2324163eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790961247; cv=none;
        d=google.com; s=arc-20260327;
        b=lR0NkBXsFwA4h84IA+0Vzvv25cZ+dXe4hagyl3JWehsUQ1nrrbYYJhy3cwLxBVKvn9
         +S4aZ3nykxHlyB/eYuXV2UEkEdfdxtZ9hiH7BZ72EQhXVePnwbqB2QgPDuCxxBjwhWEK
         cxUVOBot2MAY85jMHgodZDzmJ2WriyrNUR6BDpnow20NpZq9HAP8CBhrbVDpDnJiPcLZ
         TfpxE/fMKmDUIlakHMSb7fWP9/yGuZS3iBZTHL/zqO8y5LrJSgFS1MX5vM2tCjN9+giY
         1deGaAaWJVKCBqNPD57bL4unz0/BMddII1CrR/LQWv71deh+KxM5cQOJEP5Ou5wqJMDw
         oW4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6PocmUxgWMjbbvGJ9B7t0eFYaL42gWwJOSSvEAluiu4=;
        fh=/TwWtvnXypRdkSibJzzwkItw3dXE25L2MM2KLYyYATg=;
        b=spVT7mRnLH0tL6BMLC27Ed/J9GOfycQF6qjtQ/jpV9+IKN/K31ZG8g1uN18GcH5Pxv
         Ra3A/bfOjWNbeNnyjwEzVEO/nrIy0WJCXNuzD0hBKdI+m9mMDLjrfJI98RR18uuF/WLR
         ICP9xV9GwgEd9SzEHDRy0jKyvtGNAhX5l8trE04QT7oAA0zROQazZTiWCgBH93f9EOJa
         wtE6vjS/aUTxKzideLBrHrKRIxmlahbPQkw3wvkTTzf+Cm/1byFRF5WBBdZtnYGhUT9Z
         193/KTMAOpd+bMNNW59XHmaHPLUoQCIy4r0SUJld20B+Q2YDYJ+VLelC4PQ0u0+nA2L+
         Ou4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790961247; x=1791566047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6PocmUxgWMjbbvGJ9B7t0eFYaL42gWwJOSSvEAluiu4=;
        b=eOJU3Jyte5d8ySoZ0xhWAIqIjGNtmgbt3M9ra3cQsUG8NdPttcDlJFCmWGx1Cjexy8
         GOYxwgTmAiOIRjZgFzRHJQJMN4EmKtiS3MFG5aenIIne3t1BaPKQBURMB5t4THWqd1qj
         lECPlCihVGjkBPYRlsYSyF5kOKlDxFmxOn2ry84U4SxpX8BzSWGcYJJa19dG7NQbhdtE
         T0bz/Z11GVO1NYwzYoDINLVYkBHBxbqARfnl68ypkDt0Kmz8VfzjtWedTrQ4R/OGNlNn
         kKx8ZaOVR5Z07+8f5Qvb+uMK/2tffSvRBUtJPlz0eSiLDKU/YhxvOJMqRYYU9TwG2HV8
         Z4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961247; x=1791566047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PocmUxgWMjbbvGJ9B7t0eFYaL42gWwJOSSvEAluiu4=;
        b=gDC/yHXCZKZjMvpPL7DUXioYAS92PMPpK4kC4J3Mz8rzOdZ2FOkNdv4yCyhWrBGDPQ
         3mN1kOykzVmQA+eW2AIVPoGVku5AVSdURubf3tpRI3/FqrB5amtau+jVZLClS8J+27Gu
         9esJael9rLNrAMZCYZBW2+8daHw8lqbQKpM6832JeIci1uIWE2lOPsPhL8YpazB6VCHx
         zy/dGi13DyYi617UDAz+CoePM8TpUUS/29SoIQe3lf5BgZMpVrW3HpnaHqvKpjkJuwCf
         k9Zo6YehTQTCJUb+IHtXC2/rz6+VLc+jQB8OahkuzUrTmWZpQCpuxF/JfjYG5dH5KT5C
         L8Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwhQLYaFONOEsWxDndqOZYHewujz0IOuALaiWwFW0PJiuOXjYqC1g656o7cnACVcfsmztm/CwOW9E3jn2M=@vger.kernel.org
X-Gm-Message-State: AFuF++lgFsKPcviq6ZN7x6SUTsPmsr/88jyd7QROXLeSKjBZPUz9vrQe
	BDrSzEwcoyUJKgfDRUee0ZAIWzffFcVhPpeoAUtL8mwlij42M6Bbe9cPtXpr9ePwwMPsikBVSXJ
	3qzmEnD58BudQblmE/OyqBQQG5VaCafO5pQGVQg9wLqPPgO2ddDzpkCE+dks6Kw==
X-Gm-Gg: AYBFou0m/Bko9EWgCwdXzTsEVxV+r3JZidR1fr+kd8/afUvGcUuGnYsvhEHIPRHlD7A
	CfmWOWo+UoEKXdcBn9+W1M3Uv2I5lUrnQ/74x9leG9KsZOm5jBJD7qF9exjiJssu1JPAJILBVAo
	sAJ4DiuhtyvD1X1LB59Ii7pRIPcRFW9AXTUqWwIsL16kVIRqL6iY/kZTl8hJlK5ROVyDSGynn47
	RwhaYKusqmBbX1wZ+HKA1+s8b3LIVP0UiVze+wEMmngnlh3L1UyrMPDm9sqVD+vhg2zYOV5uJq/
	AIFvuH4XU82xnNaDyTa/qiPYQpWx0+MqWWrdaAKOM6MV0jmOUL57mP6aJi2bBQrCYBTE4dBy6ik
	0PyqNL8t7Rg==
X-Received: by 2002:a05:701b:240b:b0:14e:ef2:87a9 with SMTP id
 a92af1059eb24-14f5c7e226dmr3813823c88.37.1790961246440; Fri, 02 Oct 2026
 10:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002054832.64980-1-namhyung@kernel.org>
In-Reply-To: <20261002054832.64980-1-namhyung@kernel.org>
From: Chun-Tse Shao <ctshao@google.com>
Date: Fri, 2 Oct 2026 10:13:29 -0700
X-Gm-Features: AclHuK9VhxPkDkfZkrrejoavaGoHEbztoCol2C-Wir0VJ8hdF5f0ZEuZfD3egGA
Message-ID: <CAJpZYjXK2qhkCn_ixge_1vEKjXzn_4tzPT=i9NqYg6HbYdWG6Q@mail.gmail.com>
Subject: Re: [PATCH] perf stat: Fix aggregation of cgroup events
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 10:48=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> I got a report that perf stat with BPF and cgroup is broken with
> aggregation like per-socket or node.  On my machine, running the
> following command shows the problem.
>
>   $ sudo perf stat -a --bpf-counters --per-socket -e cycles \
>     --for-each-cgroup /user.slice,/system.slice  sleep 1
>
>    Performance counter stats for 'system wide':
>
>   S0       12      <not counted>      cpu_atom/cycles/                 us=
er.slice
>   S0       16      <not counted>      cpu_core/cycles/                 us=
er.slice
>   S0       12      <not counted>      cpu_atom/cycles/                 sy=
stem.slice
>   S0       16      <not counted>      cpu_core/cycles/                 sy=
stem.slice
>
>          1.002798147 seconds time elapsed
>
> That's because there's a logic to make the whole event failed if result
> from any CPU looks bad when aggregation is enabled.  Normally it
> considers bad when an event has no enabled and running time.  But it's
> possible for a cgroup event to have no chance to run on some CPU during
> the window and then it will have 0 enabled and running time.  Let's not
> treat them as errors.
>
> After the fix, the same command produces:
>
>    Performance counter stats for 'system wide':
>
>   S0       12          5,094,112      cpu_atom/cycles/                 us=
er.slice
>   S0       16         28,075,944      cpu_core/cycles/                 us=
er.slice
>   S0       12          1,516,568      cpu_atom/cycles/                 sy=
stem.slice
>   S0       16          5,569,575      cpu_core/cycles/                 sy=
stem.slice
>
>          1.003231856 seconds time elapsed
>
> Reported-by: Chun-Tse Shao <ctshao@google.com>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Tested-by: Chun-Tse Shao <ctshao@google.com>

Thanks for the fix!


-CT

> ---
>  tools/perf/util/stat.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tools/perf/util/stat.c b/tools/perf/util/stat.c
> index 25f31a17436828aa..6da3dbbde0e2ad8d 100644
> --- a/tools/perf/util/stat.c
> +++ b/tools/perf/util/stat.c
> @@ -381,6 +381,10 @@ static bool evsel__count_has_error(struct evsel *evs=
el,
>         if (config->aggr_mode =3D=3D AGGR_GLOBAL)
>                 return false;
>
> +       /* cgroup events may not be scheduled on some CPUs */
> +       if (evsel->cgrp)
> +               return false;
> +
>         /* it's considered ok when it actually ran */
>         if (count->ena !=3D 0 && count->run !=3D 0)
>                 return false;
> --
> 2.55.0
>
