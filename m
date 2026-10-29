Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286127;
	b=4hQhEzE7IlX3M0XvihtGoqw23YfKEURU7rXfwnyaQO4AEEvWmStEO9TThW9MRID6Of7Z
	 wbu0153C1W4e2tsY5seJ1fu+FatPIo8vkqL+AZoMKZn2y6Fe5kmhki7HoVYufOPfihHsQ
	 2CvlN4wBWnaXLXSFQ0GP2xSQ3qIagZ5a/OBGqiP6vtZsCV3XzNx23aDk3dmvRzpXXW9wi
	 nC+IPrAFvJO7mwOikGdHjsPAgUDx4jLonI5l5+0R8vjQTWvu6tZ2H/aKtxvAVZPF7KT4f
	 oq8raiuerGXhYjpMv5K5l1oUo0ko9lTbPNrahJwZdRIg/b6RHW5rtM2lsnZ8bo5c89A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3pv54lpPQ42UJPfl7NiVIVr5xpTo5h1NIoL6uWP0Qlk=;
	b=gA7K9bShNQK2oTGDJTw0w2ly3wINmcTdJ+25OpdWS7T5QOdSodpfNSTMFiaZJNBT4lms
	 /laVjaw6FtYiMHCeWFXCVPYRwXxvGyl9rzz0oSGJrmKhS4n+T4yR7D9x/B3txSomw/wmP
	 m9ZINfL3mU0iWLehA1TsZL3vxzb2LT/0ltygRR788ko/dsL+U4RRcz0w9/d9MerpH++AC
	 6YyGRSDUzJ3E35FIQxy+9P2f6WEu0N5LIMwevIT/kJnQ7P5nrjAwxv227VPHhYM5ZG6Np
	 Sa2rhY9PFyf7Df55lTK8l/6ARprVqDFEkIWn2LT0iOBNVDV00h6tnkz43D/1CFOtt6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At8KQKvW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6DE606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D6DE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At8KQKvW
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40f29667e6so303613766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793286125; cv=none;
        d=google.com; s=arc-20260327;
        b=Fg4wlWeQ96qyJQqkXKc5n7tLbKqqfCEqGIt81QXiKyCGDXh2n9hDAfaKQJamARCRO8
         Mj7o2+J5jf/lVdELQ0oebH4JEX5f6Chxe8edJoS2GJvvn46Cni6PxRR56f+f/xVVqPgz
         j7ovZO3Oqnak16kjVWOkkRDcXymi/9AEr3cgxRkf9GqyMrNyPGKlQifNHBduRpy+IAjt
         d2AOqccJTsF8DPU3u/iwEYHwzbvS2i+ETLiXoh/J8Feu3dRk1YTLa1BsxSqtAutSCpdh
         3H29uTX5ef+jvBWCHxwAtruoFkuUww637iw99X23Is0paXx4uGuQqHGSuOYeT8NkTbRa
         dP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3pv54lpPQ42UJPfl7NiVIVr5xpTo5h1NIoL6uWP0Qlk=;
        fh=jhrYOcTmilC/awejfgh0SAigwh1z8+2rsfhaE5X4MNI=;
        b=Sn/l/rNwZbowE9uy9wOaJCWSeKDbDgKDUiAo7cVO/VaF9XpViE4V6r7cuid3YV/8OK
         iyjuHgaHGiZCN68I0pBYjIn/59dFtV2r7V8jyYKilBN5SH39U47P7rxzZeY4rQx3esdi
         2pJcmg+Vwh8b8on7EUgiBZqeE5MK/f9GD4z+XnS5lc6ZoNyHnesICdA45UsKXhF9nxUg
         sVEWn6lsqqC+DE0C4nYd8Ly2UHoefSC5tIuK3daXL7pw2vJpjXT1FadeO5PIluAxp5GS
         MRQobND++JOegenAaFU1XcLw4PNRCz9M48jmjbFQsFMQcidnvAugFSTyzrnPFWIMFp9B
         LRPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793286125; x=1793890925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pv54lpPQ42UJPfl7NiVIVr5xpTo5h1NIoL6uWP0Qlk=;
        b=At8KQKvWo8fhNk7ywdT7FNDhpC3ba7IwiYlI7QmFy7Zh3uJJY4cGFeNFCR7BjY9ix0
         Z0LycXeX1d7ozowebTUnosQYM3e0PA4OBDFuKc8XhQQWprwTpYgrRgeFq5c5YRtM+/J1
         APL9/PifUoPMDSW0FVca4S4a4DhjU85h6eVasm15MpBB4SSd/uFe9e2USgS0tVMxtSom
         N/qyqp6LogRmNVZxui1J90unNeWqvpYBjFg8EMdUWe/bycEmgEEmkx8XeMd2U5/u01EQ
         3KuGQZpZJe+HCxk16t3EEUK9x/XgzJHEVq2C7X7nbLxwzAcE2FV8kKPE3ctva+3ZPMP1
         7V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286125; x=1793890925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pv54lpPQ42UJPfl7NiVIVr5xpTo5h1NIoL6uWP0Qlk=;
        b=Mamk7O3wTHdBvIUboZ9hf32d3ZFFGoL+VQ7ftjegl4OKSs/resir9c6mhuVxsG+eIY
         BeIIBxzaeJqL/AwJVyu7pNz5jU6VTla8Y8arzD81dFnWfZ+h6Gy8bSDp6MWnY616y3bE
         qKr+TeLDNvckysBnoVyKKgvERs4GSVeern1K0uwuogAkCoTX9tah9r9rkoK4MyK4q1GO
         IEi+7bmVAn4SVhlJJlajFTw58bfKf/DmD+sNKzsIV7BxuhKmbhn4a0dSQoYX2FKvikMl
         D1uvSDVeA6CPL4l2aaG5EWkzBtBGLyxFA1O5NES2nAIa3GMZfK4Q26X1o0DwMfS9C71G
         yAeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzoDgfrxLLRBa5DY9KxLl4Re4MoBAtq0QSbyme7t142SidZ9puwB50QcI80WHGD9/qVa0TakALw72NAiU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP8grakrJd/1PifejvjHshYVjO+z+6dFCfSFGylf+nlwGnUPro
	ZPEqK2yXUBdR/uXeN9oJ3rcmdfzaFD2S0DH4NT7cI+N1B2uzVIqDFZqWZfulYCdV27KvA+D1/ZL
	ealAZJYBbK2x4XPXmFbGXi6NgsE8ADG0=
X-Gm-Gg: AYBFou3NFEZXV+jNbpIlk5rUJHv2bILWRy7i/zrljsVfeKK8gvieqiUaqmqNIkKA6GB
	MK5MVDs4b2dn9pwPS9Tqi+kKFeQt3MJ6owflzj0O0z+QXIEFmAreHsph28TTOEWz8yBEk+e6LKJ
	0tGo9jE43S/YlokjS+IL3z4po+7T5qyYFv/9OTNxtad4u/uiTSTbPEkCcAN5Q2xR9JCsWU3kU3m
	gd1hcikpG3uWDzVo7mPKWG8YUY/vL+LYHxgNFgGBOmgLxYuwB10Pu6MG4NPbOp3OXedap2fda/o
	nj1ewP7A9VXUVlH7f720th50yFoTBO1u8bjW0NHwglh5bHztBy9q9OC1lFKC6oe/FJoUX3yqcdC
	vMEJbw7XmhGWtzImvsIYbA1Z97SG78M4YlfSTFoP/My+shtIGVKIq2PSDicR8/6eUUntN
X-Received: by 2002:a17:906:794e:b0:c33:ae8b:817d with SMTP id
 a640c23a62f3a-c49bdf9016cmr515625366b.46.1793286125001; Thu, 29 Oct 2026
 08:02:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com> <20261028-alpha-profileme-v1-5-d44b52bf2500@gmail.com>
In-Reply-To: <20261028-alpha-profileme-v1-5-d44b52bf2500@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 29 Oct 2026 16:01:53 +0100
X-Gm-Features: AclHuK-GNrjKeGtxUttAzHxHHU9r3Wn59K2y6AwVpRTg9_F9nYsnOjJyieFCY_M
Message-ID: <CA+=Fv5S5S3o1=2LetFuLQNqjtuw0DTgxVWAYAiAVvsdUNgNEyQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] alpha/perf: optionally randomize the ProfileMe
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

On Wed, Oct 28, 2026 at 7:09=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
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
> already records the value actually written to the counter.
>
> The jitter comes from a per-CPU prandom state rather than
> get_random_u32_below(), which takes the batched entropy local lock and
> triggers an invalid wait context report from lockdep in the PMI.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index 06c9afeb7c05..da8262c74d04 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -16,6 +16,7 @@
>  #include <linux/kdebug.h>
>  #include <linux/mutex.h>
>  #include <linux/init.h>
> +#include <linux/prandom.h>
>
>  #include <asm/hwrpb.h>
>  #include <linux/atomic.h>
> @@ -33,9 +34,11 @@
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
> @@ -59,6 +62,9 @@ struct cpu_hw_events {
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
> @@ -246,10 +252,12 @@ static int ev67_raw_event_valid(u64 config)
>
>  PMU_FORMAT_ATTR(event, "config:0-7");
>  PMU_FORMAT_ATTR(profileme, "config:8");
> +PMU_FORMAT_ATTR(randomize, "config:9");
>
>  static struct attribute *ev67_format_attrs[] =3D {
>         &format_attr_event.attr,
>         &format_attr_profileme.attr,
> +       &format_attr_randomize.attr,
>         NULL,
>  };
>
> @@ -360,6 +368,20 @@ static int alpha_perf_event_set_period(struct perf_e=
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
> +
> +               left +=3D (long)((u64)r * jitter >> 32) - jitter / 2;
> +               local64_set(&hwc->period_left, left);
> +       }
> +

One minor corner case? This  multiplication can overflow for very
large  sample periods. I guess normal sampling periods are not
affected, is it worth using overflow-safe multiply/shift to avoid this
limitation?

>         /*
>          * Hardware restrictions require that the counters must not be
>          * written with values that are too close to the maximum period.
> @@ -715,7 +737,8 @@ static int __hw_perf_event_init(struct perf_event *ev=
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
> @@ -740,6 +763,14 @@ static int __hw_perf_event_init(struct perf_event *e=
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

I'll report back once I've done some testing on real hardware.

Thanks

Magnus
