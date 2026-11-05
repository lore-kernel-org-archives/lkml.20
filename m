Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793906312;
	b=hfoZSsVGo5dVkUGafdpPcuZYTDGcht3OaYgNFHBhLwLfMAdTpAzwq/61MqLffkxfBNwa
	 Mqrzk8fsTuILhNDtyZ8HkTj+Rh9ixp9QnOL7yWBTOkJDvdEqmKA9vWVecmt8Edx0JF5bW
	 4gFURSbSX7tOrbUwaWxisAtJN7JU4Jpbc0jatGy5TuZQLF2oy0mE56rbETdxqdodRoh2X
	 sRW0rkipG7TShnYFrM+CrMDs8taJK8nWr6Do9yvLa/B17lox5PgZJgvfC1r0SMRsqY+CP
	 WtPz8SikUz2i77fohwlyyCimg4il6S/+APwHfFJuNHfF4+e0NeRn2VLocbYIQ0F/1ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8ul0rjJXaoWeOZXo5MyeFSNXQ8Y5r/rKYGo2ypC12Mo=;
	b=3cvrJNYTuFGSU+NhQwVZv8F72Hg79zMbXK3SeybJTKZ2Lr7QLJA5eGOrvItOae+MwQTe
	 7LVfx28Q2ytYrgGYU5fg/KJAl2jmWzcfJYLhMevC0Yelvy5GzkpDq6c57i9VclMfsbeVh
	 FKrPmW7tM67A1a4+OaXAVfdZdnWPFBJVU4UH5zJLfxeYzT+XWqQgadzwK+KwCIfDXikDs
	 YENzFSzN6yv+R8OsPrEOJnhVDufEqY0jxwkmMY8qFXXji0r0L9Q9xex88cCTRflZPV36V
	 B6YCwsvA8ozaH9QnwTn1gkpRkwJFpC3WTjaqZuYNnMYlRsxeU2IsZK0zO7djTOC+9gA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mX4sNr6Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C15606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C15606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mX4sNr6Z
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so2130131a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:18:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793906311; cv=none;
        d=google.com; s=arc-20260327;
        b=crAk9jefUeXj5a9wwM9rnwFHzzSkaDKdOnSl7/u1TAmgAWHuB8/7wh+Amn+AOGpaeX
         Wo/va1R9Ef7/mdeWeQBcrta2lUHaMqzp/9CbD0Mj3B/IXddjEuOvD3EcklnOsWNm8ipp
         qGKortKksp0KNzy7zcPbpMOclh4uw3b7Yy3J1yiAb4h4EntxaxTGqqd4vmCggqzRNi0P
         exhFqyS8jeJn3XLEahfKgDMpfSKAxAHGt4C9JATZO5qY0IsLxLTpj0aCaUp7L7+dqfTF
         a4BjCpyP1AU14BdmmI7h93UI4wvDlz3uamxC4gGUvE2jwFBSogaXsjpIbQDFI3BrArGJ
         va3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ul0rjJXaoWeOZXo5MyeFSNXQ8Y5r/rKYGo2ypC12Mo=;
        fh=V+322M3nRBTAQbAQe+1+9hJqh9qBFXUhZlrp7UkNyqM=;
        b=hlXiFWKznFaUzIrL/eKNEbBYTwkOjO/pkG9imwBL9die7zLCYR+qLR4jKzI+EdUN1a
         38AZgJigWnAKiXeHvcQHhTG4pCcRDswNz3y2JigF2uxUKtlxZX+ZOBqZwywemnqTAE/v
         D/McT25AbLWZvELE9pHE9Bp8qPxcB6JpgAAHEE9x+AJM9pvYJDOFqpBQwaZGorpBBHo3
         es2bj4Xrv6he1saG8r0J1izLsKPEdM9bm5i+U+8osXyPg+f4ncLTNlwY5QskWZpffZGP
         tHg1SbAhlhnubgNkVlqY1sUBVkt/x3GzTBnHgR+mA+20lBbB6mS4GFerwddckAACMZQz
         wSIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793906311; x=1794511111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ul0rjJXaoWeOZXo5MyeFSNXQ8Y5r/rKYGo2ypC12Mo=;
        b=mX4sNr6Zkw9XI2yPtlzXIuJu74w6sORU67ccRBFHdANMCFmWqqLC57E5pyPsKb7T/+
         uuzA09tFEdgwV7FnmM9l64n7BEq4wguoY0cuDSedCwv9N10rd4nCz3F993e6jQEOHLRf
         c2fEq07kueO+WL1xxtGbWoGHOPdxNhmWvMozF26p/+7H6oidkaZIhXrrAmfW5oFNeL6i
         tnQREi+ksIH0h+fbQzceeBDfOwr/X0CxDfTojVdzPkUGaX+7jfuChVR1u6HrIgg1izT7
         fi4KDrGulEJSmerkA7P/raIOOQ0g3v/59DVa8zp6mkXwnIcEhwa//eykqLpiytZugINd
         Mrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793906311; x=1794511111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ul0rjJXaoWeOZXo5MyeFSNXQ8Y5r/rKYGo2ypC12Mo=;
        b=CevVU4Mt5DXVeJhVkvNKC7ICRakMTWKM3PV+JX7N5VToKmybDDKtjD2ByU1cTih+LJ
         irJXpYSW3kkYWyYt8kC63PIe0SnA+2sJ481zSRd74BXmDlGaNS6XuztS2Wb7OU2Yw0wl
         Q20K7vZJLcowT1A/6MJnDNlVjWX9l/pfkVOA1v9boviAujUgSFrv71hYp99VK5/Z8mk7
         KkySx7LEVpAnvOtsKjE4uZ7m8m0vIVlpX/7zkNInTScllWrYlMSGX2nI0A3efu6p4g31
         4PjNWvjwU1fhbBwFUmlE0HxCMc9SwPZdJoqh0HeUldfvNXoJa1B0nNOvF3mP2y3cImXd
         suqw==
X-Forwarded-Encrypted: i=1; AKwUvBzYBe6YqLibO5AyGVfetLlLPm2YExUrAxE4t4uNGrH7F/uLDlv3mvAYp5U7OpfpOd/G4D8AnwL/w1PYiO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aLpV6QbJfIV9G63pmK1cCM8fQ2XwVhdM1nc1n2Ec6ZiGYJLya
	dFJaLp/9HHcnBeIwIzc4Ss9CjNPkChIMdbtb1jAWmNoajYW8OlaS5cpnrKkqbBSVwgQQFrsv4+Y
	5OLIKsWcvb/eiz8A3hF6YeCF7MUW+b/Y=
X-Gm-Gg: AYBFou2s9nb50K/EjSnvAZf6OqjmqlIwZPn0lsoay75F9gByFT7Wm4w0iBOPt3wobm1
	z77QU5OUKrgE342rCMU4TJiZB0Yy25FsieEFG2lFdD2jljExwFJxSJ5nADej0xY2AaoSU6xo0AT
	jm8aNlh9ZfONAZegrvlN38MvA9+EiaySvCPk5zNLloVah1C5r6VvV17H8rs6FreZRKdmBzEuUHu
	b9rRrmP1Wf/UCnNlfV6B7iuZhmo4znzVfGePkRsmw4VnmLh22LXXgrbOvNEaQE/ZD+lYd6ewyBC
	RzBpdjJXGP+739MIrhrPEsVfPGBTUX1UIq0qlMsEcAPV4fIymfEH6HpQ4ABa3NwAegzJ5HaN0ll
	xUDKsPRqcWZNVngEK9bpcIXmGCgp3DtoBJSVGEcoqWw9fBexMEpDG4jITs+qM1GkgE+KP20InWF
	96c4CRIa+a5gYS42IJqaTdKF8=
X-Received: by 2002:a05:6402:2809:b0:6b5:8247:7bd2 with SMTP id
 4fb4d7f45d1cf-6b59752e5ecmr192245a12.3.1793906310496; Thu, 05 Nov 2026
 11:18:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com> <20261104-alpha-profileme-v6-13-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-13-63362e9290a3@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 5 Nov 2026 20:18:18 +0100
X-Gm-Features: AclHuK9rqLSlmxxFUHUNKij2bInqq2qoTL5wATrmtOQUvBJn0UfhkLxA_3fmAGs
Message-ID: <CA+=Fv5Qi9R=+0fkPsKrJBRThYfdUQdH3hvQ6+0oW-1UjeNm8_w@mail.gmail.com>
Subject: Re: [PATCH v6 13/13] alpha/perf: honor exclude_user and
 exclude_kernel for ProfileMe events
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Wed, Nov 4, 2026 at 7:49=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The PMU sets PERF_PMU_CAP_NO_EXCLUDE, as the counters count in every
> mode. perf record then fails for unprivileged users: at the default
> perf_event_paranoid of 2, the tool sets exclude_kernel for them.
>
> A ProfileMe sample says which mode the profiled instruction ran in, so
> the excluded samples can be dropped, as AMD IBS does with swfilt. Do
> that for ProfileMe events, counting PALmode as kernel, and ignore
> exclude_hv, as there is no hypervisor. A sample that falls back to the
> interrupted PC is dropped if either its PC or the profiled instruction
> is in an excluded mode. Aggregate events cannot tell, so event_init
> now rejects their exclude bits itself, along with exclude_idle,
> exclude_guest and exclude_host for all events.
>
> The event count, and what PCTR1 counted during a window, still include
> the excluded modes, as they do for IBS.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 47 ++++++++++++++++++++++++++++++++++--=
------
>  1 file changed, 38 insertions(+), 9 deletions(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index 7e34eac0ea47..c75d204076fa 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -832,6 +832,18 @@ static int __hw_perf_event_init(struct perf_event *e=
vent)
>                 return -EINVAL;
>         hwc->flags =3D profileme ? ALPHA_PERF_FLAG_PROFILEME : 0;
>
> +       /*
> +        * The counters count in every mode, but ProfileMe samples say wh=
ich
> +        * mode the profiled instruction ran in, so those that are exclud=
ed can
> +        * be dropped. PALmode counts as kernel, and exclude_hv is ignore=
d, as
> +        * there is no hypervisor.
> +        */
> +       if (attr->exclude_idle || attr->exclude_guest || attr->exclude_ho=
st)
> +               return -EINVAL;
> +       if (!profileme &&
> +           (attr->exclude_user || attr->exclude_kernel || attr->exclude_=
hv))
> +               return -EINVAL;
> +
>         if (attr->config1 & ~ALPHA_PERF_CONFIG1_FILTERS)
>                 return -EINVAL;
>         if (attr->config1 && !profileme)
> @@ -983,7 +995,6 @@ static struct pmu pmu =3D {
>         .stop           =3D alpha_pmu_stop,
>         .read           =3D alpha_pmu_read,
>         .attr_groups    =3D ev67_attr_groups,
> -       .capabilities   =3D PERF_PMU_CAP_NO_EXCLUDE,
>  };
>
>
> @@ -1140,6 +1151,24 @@ static u64 alpha_profileme_status(unsigned long i_=
stat,
>         return status;
>  }
>
> +/*
> + * Whether exclude_user or exclude_kernel rules out a sample of the prof=
iled
> + * instruction at pmpc, reported at pc. A PALmode PMPC counts as kernel.=
 The
> + * two differ only when the sample falls back to the interrupted PC, and
> + * such a sample is then dropped if either mode is excluded.
> + */
> +static bool alpha_profileme_excluded(struct perf_event *event,
> +                                    unsigned long pmpc, unsigned long pc=
)
> +{
> +       bool pm_user =3D !(pmpc & EV67_PMPC_PAL) &&
> +                      (pmpc & EV67_PMPC_PC_MASK) < TASK_SIZE;
> +       bool user =3D pc < TASK_SIZE;
> +
> +       if (event->attr.exclude_user && (pm_user || user))
> +               return true;
> +       return event->attr.exclude_kernel && !(pm_user && user);
> +}
> +
>  /* What the memory instruction at pc does, or PERF_MEM_OP_NA. */
>  static u64 alpha_profileme_mem_op(unsigned long pc)
>  {
> @@ -1250,14 +1279,6 @@ static void alpha_perf_event_profileme(struct perf=
_event *event,
>                 local64_add(ovr, &hwc->period_left);
>         }
>
> -       /* A dropped sample still counts, for throttling and frequency mo=
de. */
> -       if ((alpha_profileme_status(i_stat, pctr_ctl, pmpc) & hwc->config=
) !=3D
> -           hwc->config) {
> -               if (alpha_perf_event_set_period(event, hwc, 0))
> -                       perf_event_account_interrupt(event);
> -               return;
> -       }
> -
>         /*
>          * Attribute the sample to the profiled instruction rather than t=
o
>          * wherever the interrupt landed. perf takes the sample's mode,
> @@ -1303,6 +1324,14 @@ static void alpha_perf_event_profileme(struct perf=
_event *event,
>                 memset(pm_regs, 0, sizeof(*pm_regs));
>         }
>
> +       /* A dropped sample still counts, for throttling and frequency mo=
de. */
> +       if ((alpha_profileme_status(i_stat, pctr_ctl, pmpc) & hwc->config=
) !=3D
> +           hwc->config || alpha_profileme_excluded(event, pmpc, pc)) {
> +               if (alpha_perf_event_set_period(event, hwc, 0))
> +                       perf_event_account_interrupt(event);
> +               return;
> +       }
> +
>         perf_sample_data_init(&data, 0, hwc->last_period);
>         if (pc_only)
>                 alpha_profileme_drop_regs(event, &data, PERF_SAMPLE_REGS_=
USER |
>
> --
> 2.55.0
>

Tested user-only and kernel-only recordings on all three CPUs of my
ES40. I checked both the raw PMPC and the reported sample mode.

With perf_event_paranoid=3D2, an unprivileged process also recorded
203 user-only samples. Every sample had a user PMPC matching its IP.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
