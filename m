Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793465817;
	b=mwL5NccIRhfHlW4GfeF0trQjz2ROj1PzbL/+vKZp7CJ4al1fqO4z5rNxhTRbV+fkcvUm
	 1gITxz/lK9lZEbGEISyF4BNAPyjqo80pIVaiy/fdXd+e9Wd1WCvHWdtzpu8Yf72/ID3wr
	 OyYw9xXpdPlQY+tdJ0EsqnP0AE0OYKQg555VFtp2e0423azBC1XKdunKh9xa+szrbsGyN
	 u0klAHCgLI+adLFoRhPq23Q4lgjxhAw1vXOpMGnX7Hr1mkVP4JL2kJ2XefnpuZ6MtcML6
	 doVOZs7yDOsc5M62zbfGT/DnAZtrzAJxTzZjtodiBWcjkDk2ZJahXB+z8cQqN7wn+jQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5HsQn+K8WRVcTEBks1X7UbNy0Qj9FUVgHxdKvavTijw=;
	b=vEg2b65pcpcoqK5mZdw2KvcgDNyBHvyt9/NICtYAxqUjaaibGFpWE4kmMh4u0gb7zLbC
	 GX0ICF1slCePpEa2KHlTPJ3nhOF1yfDergd6SemJN+u1hNiA1HKlLKeoimB7WAyqPcSqP
	 U4VWKktXST321szK8z+dccfRdoKNCGtMQnIT2JIIO0hcpMIs35lAzLBYQ4+pjmJbE3NRt
	 yiRy7XgHhUkpZ1b5K60U5Gxu6om8EGvMy5xgrPJAO4Kg2isnymTKcXJz0L1K+UgrvrbBM
	 EMoYCBq7/ew2EzEWNcvMI9jnt0hd4oiAozt2t/r/eSFbzdzmD302E1RbQeWRof/5dRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pRhNZdpa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4906606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4906606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pRhNZdpa
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so2241399a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793465815; cv=none;
        d=google.com; s=arc-20260327;
        b=MC3hd3G3FRxzDrtP/Ymvta+2uCDZUPsaYT6P+MRxofb5WY4O1V1S2JoRk/Ro3dCDvw
         ohhstNRqmv8XZYUEoGdJU1wiHyw7tr0Jumrlnb3ik63Ve4It9GJSJlSmjkDfEQNut/lu
         HBE5K8BWxAbI3/n3Sg/J8RkAbolAh/xWjbWNlo/OjMs+nh6Wn/BF5JkCmIZCNrugwYp8
         NH1wM1sSXDnHGlJkZjYF28v+GynNC8ExkB62SdsRAl3zGFkfWA+P8Evx4vB8+F+Pi9eP
         zyPeICxWuApMFIB+ca1qAjYZ8yt1bLmIYURS1TIWTuzeicb57pRkLfzTyPbpdVi8BFzv
         EwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5HsQn+K8WRVcTEBks1X7UbNy0Qj9FUVgHxdKvavTijw=;
        fh=vdgq2HJB2AFSMqIOeL/YKdVEmiZrMxNb33zI6w7NLhk=;
        b=Ayk7EWQbnCwF+oJECtCSExxuThJycrXCOWRKjyxtHwtejWlZWl5Xm1bPud+7oHjab2
         2k23qvQgdlULIJTah8ybnZ5DaCCOiWAwOs63kbWQHA5jQwrLyreIiJcdb6HPhxWTssI1
         ZATa/CIVGvu2VM1LlGo07QAhVMDF/gymEd1IMjNBVJQX8O71Gf+XsGOEGcJUT0T7li/v
         V/bmds/vFLOUps05Fb0H4ptswtoimv8/51588HsvZY7zbwNOE7XHt/qgWdHIhAbhuqXU
         yCvmBKpQJzIwjAfYOjiYSn/KIx4HgBaNeLHR8MHSw9zAoj4RjQTHh0mI9sC717DqtqH2
         258A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793465815; x=1794070615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5HsQn+K8WRVcTEBks1X7UbNy0Qj9FUVgHxdKvavTijw=;
        b=pRhNZdpaQpuD/DUfFEwMnU+S4r8hXkZIlNiw05lpKyGMFbu03Yn0xOjPZK2W+NXcsX
         vpv6J0xZwT+fseXy+hry9PYW9akel5JR6dDK94C3l6CvvoV5rjRDDQur7yGUJ84IB7TB
         Vq5U2qLARabEaHBXA6orhMC+zcjBKYM+MDX5CL+eErqkjG2n3QghA6G89U2DAz4AwY5j
         t9qydXkaS/lca7N8CM8yhdveM4aGUHBLfBHfiBWsDBj5aIoNM+/N+xtgkC6GulXMpbPl
         PR1xG6fg+OLJV4r4HVfASJb73BjxpLXSBS8Mp08pCNYk2MwPqY5OwboE7XoS1K/BRSV0
         tHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793465815; x=1794070615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HsQn+K8WRVcTEBks1X7UbNy0Qj9FUVgHxdKvavTijw=;
        b=K946FJFaXtUmyVbAPdNkcD7+ffpAb9M6d8ok+pblkL6qrCFQfe2zIsnpn/yedPBN0k
         /ALYlf2YFjfnVLrIY14KVm1ZbVIxKbRK+rUCs/PE5UzVnglMgFuTXYHhIiQKB0LQEJGO
         y1KrnyapnfzyfdMNSHHKx7Cgw4fIg8ADaNiaxqJ5h8rsx69b0xsrA/ivIVGkILXlkb05
         Kby6MByp+LeXHEMntkJ1Efkm3/Jm0taTIxq/K6UObjgq2Ebx0nXCw71Vq1CJ6xs5T/h/
         eztQZwEb9SBOhmrxO0IJQ3FLcTn2zpzxwr+bJvsh+oGoBpLkNyuYHKJjDjFwN0khzvva
         wTdw==
X-Forwarded-Encrypted: i=1; AKwUvByFt73YdJ/aCGQ00bQ+nkRzArdf4cb4o58oxDS9MGwNfwBD033HJpdFfzIyApQeuVDXpi/oT2NmpWgQtaM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvd8idvQDsFNnOKEU9MZEuYGxCkbvC+LhjgTzjPBJ/E+2JZt3b
	MG5JLmI33IpgNuNw8LZE9dq5s2CQs/auzpBPi2zURZyeA7JVl575OqKpsg9W+wVlin19WNTtzxz
	Q4vqEVHZbRSRUlxy5xpL47JtUZyxc7yI=
X-Gm-Gg: AYBFou2RogdrziWGk69W/NoBgfQHl3fNoSOf+Bk8RisJfraZ6DcjF2+nTdEgT6XMZFi
	KwX0dsBmE3NuoHW3P0/vHUJKQ1lerEbqwWhrd/Kz3Thl/EnFAuqfBRVC4rgMEwgD6z1aActw19/
	pu7xHvbcxZXEIugFS89O/Q3WoW/8FFimbWH/6Eio9eHpH0NfjZZknVRogaqfyzp4KDO9sY6Ef7X
	wG1Bud5tUuDcGBuh8JbGeLJvS45cx9Qj7G5TJgKdnA4Tfh2KY04aVsqT0MJITGqv2vRTeTrM+eA
	CA1EBUuqbhFOQK4bDCxb2XhC8RzH/KeyIyQnfqBypvK/vqZObmQlZ6cb693RohBMWK2S7ycaFHH
	gPvXXnZ+7qgINL+U7dbvn3Js/uYDU9/Vr0/OUkdTVYQncCT3hjJgCKHL6I5pfa6E89HzrIRtrA7
	bw+Rz+i0p7DEtS5MkdcXX7sag=
X-Received: by 2002:a05:6402:5007:b0:6b4:d1ed:95b3 with SMTP id
 4fb4d7f45d1cf-6b4d5727afcmr4034555a12.41.1793465815192; Sat, 31 Oct 2026
 09:56:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com> <20261030-alpha-profileme-v2-5-c702f1c65272@gmail.com>
In-Reply-To: <20261030-alpha-profileme-v2-5-c702f1c65272@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 31 Oct 2026 17:56:42 +0100
X-Gm-Features: AclHuK8up6u9Y3pPa0-yJ_2iRNWdsswN4WKtEkOWWp8jiOXqmU8vIfOM971mbzM
Message-ID: <CA+=Fv5QJqj0azuYhFE0PNZp7EqBgDzxvuTiW498kptnGBz1pHQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] alpha/perf: optionally randomize the ProfileMe
 sampling interval
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

On Fri, Oct 30, 2026 at 5:04=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> A fixed sampling interval can phase-lock with a loop whose length divides
> it, so that the same few instructions are profiled over and over while
> the rest of the loop is never seen. DCPI avoided this by randomizing the
> interval.
>
> Add a randomize config bit that varies each interval by up to 1/16 of
> the period in either direction. Only ProfileMe events accept it, since
> Aggregate mode samples already land a variable distance from the
> instruction that overflowed. Counts are unaffected, because prev_count
> already records the value actually written to the counter. The jitter
> is computed with mul_u64_u32_shr() and the sum saturates, so that a
> period beyond 32 bits cannot overflow.
>
> The jitter comes from a per-CPU prandom state rather than
> get_random_u32_below(), which takes the batched entropy local lock and
> triggers an invalid wait context report from lockdep in the PMI.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 37 ++++++++++++++++++++++++++++++++++++=
-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index c9d4b13817bc..c553cbd6c7a3 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -16,6 +16,9 @@
>  #include <linux/kdebug.h>
>  #include <linux/mutex.h>
>  #include <linux/init.h>
> +#include <linux/math64.h>
> +#include <linux/overflow.h>
> +#include <linux/prandom.h>
>
>  #include <asm/hwrpb.h>
>  #include <linux/atomic.h>
> @@ -33,9 +36,11 @@
>  /* Layout of attr.config for PERF_TYPE_RAW events; see format/ in sysfs.=
 */
>  #define ALPHA_PERF_CONFIG_EVENT                0xffULL
>  #define ALPHA_PERF_CONFIG_PROFILEME    BIT_ULL(8)
> +#define ALPHA_PERF_CONFIG_RANDOMIZE    BIT_ULL(9)
>
>  /* hw_perf_event.flags */
>  #define ALPHA_PERF_FLAG_PROFILEME      0x1
> +#define ALPHA_PERF_FLAG_RANDOMIZE      0x2
>
>  /* For tracking PMCs and the hw events they monitor on each CPU. */
>  struct cpu_hw_events {
> @@ -59,6 +64,9 @@ struct cpu_hw_events {
>  };
>  DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
>
> +/* For randomizing sample intervals from the PMI, where locks are not al=
lowed. */
> +static DEFINE_PER_CPU(struct rnd_state, alpha_perf_rnd);
> +
>
>
>  /*
> @@ -246,10 +254,12 @@ static int ev67_raw_event_valid(u64 config)
>
>  PMU_FORMAT_ATTR(event, "config:0-7");
>  PMU_FORMAT_ATTR(profileme, "config:8");
> +PMU_FORMAT_ATTR(randoThe v2 arithmetic handles the large-period overflow=
 case. I tested
randomized instruction sampling with a period of 10000 on all three
CPUs of my ES40. Repeated runs completed without hangs or kernel
warnings.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>mize, "config:9");
>
>  static struct attribute *ev67_format_attrs[] =3D {
>         &format_attr_event.attr,
>         &format_attr_profileme.attr,
> +       &format_attr_randomize.attr,
>         NULL,
>  };
>
> @@ -367,6 +377,22 @@ static int alpha_perf_event_set_period(struct perf_e=
vent *event,
>                 ret =3D 1;
>         }
>
> +       /*
> +        * Vary each new interval by up to 1/16 of the period either way,=
 so
> +        * the samples cannot phase-lock with a loop whose length divides=
 the
> +        * period. The count stays exact because prev_count records the v=
alue
> +        * actually written.
> +        */
> +       if (ret && (hwc->flags & ALPHA_PERF_FLAG_RANDOMIZE) && period >=
=3D 8) {
> +               long jitter =3D period / 8;
> +               u32 r =3D prandom_u32_state(this_cpu_ptr(&alpha_perf_rnd)=
);
> +               long offset =3D mul_u64_u32_shr(jitter, r, 32) - jitter /=
 2;
> +
> +               if (check_add_overflow(left, offset, &left))
> +                       left =3D LONG_MAX;
> +               local64_set(&hwc->period_left, left);
> +       }
> +
>         /*
>          * Hardware restrictions require that the counters must not be
>          * written with values that are too close to the maximum period.
> @@ -738,7 +764,8 @@ static int __hw_perf_event_init(struct perf_event *ev=
ent)
>                 return -EOPNOTSUPP;
>         } else if (attr->type =3D=3D PERF_TYPE_RAW) {
>                 if (attr->config & ~(ALPHA_PERF_CONFIG_EVENT |
> -                                    ALPHA_PERF_CONFIG_PROFILEME))
> +                                    ALPHA_PERF_CONFIG_PROFILEME |
> +                                    ALPHA_PERF_CONFIG_RANDOMIZE))
>                         return -EINVAL;
>                 ev =3D attr->config & ALPHA_PERF_CONFIG_EVENT;
>                 if (!alpha_pmu->raw_event_valid(ev))
> @@ -763,6 +790,14 @@ static int __hw_perf_event_init(struct perf_event *e=
vent)
>                 return -EINVAL;
>         hwc->flags =3D profileme ? ALPHA_PERF_FLAG_PROFILEME : 0;
>
> +       if (attr->type =3D=3D PERF_TYPE_RAW &&
> +           (attr->config & ALPHA_PERF_CONFIG_RANDOMIZE)) {
> +               if (!profileme)
> +                       return -EINVAL;
> +               prandom_init_once(&alpha_perf_rnd);
> +               hwc->flags |=3D ALPHA_PERF_FLAG_RANDOMIZE;
> +       }
> +
>         /*
>          * We place the event type in event_base here and leave calculati=
on
>          * of the codes to programme the PMU for alpha_pmu_enable() becau=
se
>
> --
> 2.55.0
>

The v2 arithmetic handles the large-period overflow case. I tested
randomized instruction sampling with a period of 10000 on all three
CPUs of my ES40. Repeated runs completed without hangs or kernel
warnings.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
