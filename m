Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6FE3DA5C5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505910; cv=pass; b=D7V9xvTCZmOlB0KA8r6sTxD/6dMu7I0tjco5jwUY5tKX6AMTAAxnuDQzS/lWllwjXj11jkoL+9Lh+FZXpEgK577dJUO0/OWedX0JGX1X12zI98g7+YahBPQjrtmppIsw1jbli/6vciquu/93FUwe2Oor8oIdo0zNSRJW25EgXeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505910; c=relaxed/simple;
	bh=9CZZ1lSexM+A/bEG0bA93Zp2oQQtwi80WQ/8QFBXiY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nknvkHybAFd0PomHFaw6H0figvEykWRDlrWpAhC7YySGWv7I3Pu5UOo89/VOLLFkzykPOv2tSIJBHOrFutQ/Q0g8MMHcT99Fy+ivr8aA2iLjbokVlTo87KqYyKpuR8PchRQ8HbVKAZ1N1E2/na5zOu3ETpq9uSse6M9PP8K6wzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CfTXO/fa; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CfTXO/fa"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so23191cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789505907; cv=none;
        d=google.com; s=arc-20260327;
        b=eoDz4z1y9Q4WQuuUT5hLD5/gvMZmkKwvej+CnQn2NptdShktzH4INyfIuDVhmddMZS
         i7cpJn7d2Z1E7tmwbouFFHNuzUx41L3rahrjO9aGaYeX5qZBT5sjuycAm+AaYSsrTW+9
         qIjUMIPeT1D/9awHRzUv6dMJPX1hUM7MTrig8ehDWpFdEBZA0Y8Bl9hYeE2sZp20oLUR
         PEPvnBhNbnz+jZBI5pIl/jeoUYwPtL1HA+D8sfLBwrVYXMQR3xBN4yMX3yfiuJUuRbl7
         DyY2LL34m7fE8pr2r7Rl5ftoAvGPHn5Vu/tcUF+lUg1YIMQUytDkt+Uncyw1vFF3yvPy
         DAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RD3YV+Ag/O3rxFgnrxZeCoIY4Orb7ZnIAVjQabSeajw=;
        fh=iYRrvYH83pSUgYtpZiRf07YDQ3IOt4m10t35c+QVlXk=;
        b=XIRfNdjCVNdn8eYz/tC855tjKQ/PWgUpn7RlTdJU2CwkiJ0DWzOdH2viFX2bo3GKn8
         0wo/+Ayeq3LATMvFusWyzulh8vW8ljTgqlQ3W0ZW5oApxFaNfgpeYlkBuEE1taE8eYFm
         1vJ7ACufoMsnRwLrm7mVlRil3ojLFZ3re+q2Xpx75DOqQ8WcihncGbOHDgZEhNCuLC6V
         4H+GXjTTqWD2fvKK09dLakSuDRYQFObUGBq+mMeHyYGMUoMQi2C2mayUUaPS8vP2vzyl
         9ndCIJO7+S1/vGWIgFMxZLY+4auxGX7go/mSRTYgRvkbWjLJh42s3r4/Fa/uI9/RYfjN
         FTfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789505907; x=1790110707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RD3YV+Ag/O3rxFgnrxZeCoIY4Orb7ZnIAVjQabSeajw=;
        b=CfTXO/faH0oHwhIGXFB6xr/Zuv+Lnjy/hyuNoxgWg6WSd6WBBV+DafpKc4bhIoKDiH
         0+o28qtTdQ+V0nF6ow8sQD/YI0iQX3XFlr4yWrMF4BrWPe0FDcPh1hE/N/OvAF4SZ98Q
         0CXWI/7cI276ML3WSoa1oQb7YKfEhqtvKxWKhOwhrbJyk6qKE34sQ3RMfadNqEGaAVAY
         dW/Om/DhrL0sXncmycEsxAMejBMQz34OIsm9hreJLSbqb3vpg0gnRQhSN12S8Qm3R0Yg
         BQoSX22GmnE9qrOjrSYXxkbNKKLDfzgQppCttEWH+TCJQbmvBXLICBN3lCT66cHFEobm
         DtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789505907; x=1790110707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RD3YV+Ag/O3rxFgnrxZeCoIY4Orb7ZnIAVjQabSeajw=;
        b=JTEMFeizz4xorR42hqVHOj2uVfzsMMKUpe18kVxRF92RlBG+QjCuwJ3rIFV+dhGTuP
         Ooq0ssMS2iEPuI5nxutdM/k9WDNAEoO4TXe4qlLjVOHuqdiNb+7fZJleJcj/yAWK/IdU
         yWQaQJnxLeHBF8GUsLHwTjr8xGVn/Ah0YLLd/+zwaQqvDnahjmjrE3s0E1m+/4injIC8
         UNw8Mhy4wdT/vaJ7v3MpxVa/Fs5HYt9tCS5Q05uNuEUVardoStYN+gDUG3mXRAMch/9J
         SjjJNBKrsVzlkJGvdjZz2AFXtQb52gAtvl7G9bpp4keJ4SpQUFRvPf63XhovYo41Yisn
         2wPQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1ZGXu2rQXu1PxwN6YHPJB4GO3jNJN5MUQUUkX07uOEQKOF/PDmUFg53aTO72Tcb9rF84EswEVquhnrgc=@vger.kernel.org
X-Gm-Message-State: AFuF++kRU6AezMr3gbopbWmmb2mg7AKBnS2Z3bnSIpn/Yg2beGHFnWRX
	4IlI22CAQ9SEHdh4/H5YuAAQLdDwe87YiBXm3pZPds1UyhT9zyBJz9DgDO6in8S9JC9bsXfBG1r
	5djskJxdZ6iha7+JZtynO9DS4+mEvYTrR9HHvT2ZC
X-Gm-Gg: AYBFou0y08RxdBQ5DLfmIoKc3NsCp7rPS9ph7jdyAkCKQBcdw8uR0TnE6krAzQHfBRb
	3lljrg/TvZ93lnjAdUzR9z24v00mzcD0TW974xQaNIcQsN03xwdzaISSMc3tnB+VHA5qpA4SZZ1
	FnydTy30Z4uWIXNdXAtgB5uSIUMUMJ9QLwhBrXt4id9XabysO+1YsD7mbKBvzKz9Q9xWewtuqyp
	5DOyCKj97lbj1n9ZL8XMiTuHQ+p/iPeY1rX0rbOiCvF9Tw00uAHnhvmfMZPgESuah3hz6GnADJH
	xw7ib5Lmab+rOvKABYeNTwznPfkqIUyb628qVV3fC7jk9QDA/hFfRptjbAFoyBJDX/9rSUgYuHL
	H5XSN8G1eYg==
X-Received: by 2002:a05:622a:107:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-5327e9c6edamr627021cf.10.1789505906274; Tue, 15 Sep 2026
 13:58:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523011904.101720-1-rosenp@gmail.com>
In-Reply-To: <20260523011904.101720-1-rosenp@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 13:58:15 -0700
X-Gm-Features: AcwNN1U-8WxywffkLLYvhkBcpUNKYAH3OsXKdOrHioO2fViCnDS6cwyFq2mKBN0
Message-ID: <CAP-5=fXyyj6w1mR71B6e+j7sV9GA-Gs1ibfp5pCuY6T+W+xWjQ@mail.gmail.com>
Subject: Re: [PATCH] perf/x86/amd/uncore: turn amd_uncore_ctx events into a
 flexible array
To: Rosen Penev <rosenp@gmail.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: linux-perf-users@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	"open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 6:19=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> The events pointer was kzalloc_node()'d immediately after the parent
> struct allocation, with the count (pmu->num_counters) trivially
> available beforehand.  Move events to the struct tail as a flexible
> array member and fold the two allocations into a single kzalloc_node()
> with struct_size(), dropping the separate kfree(ctx->events) in the
> free path.
>
> Assisted-by: Claude:Opus-4.7
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/x86/events/amd/uncore.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
> index 05cff39968ec..0e265fc1fef8 100644
> --- a/arch/x86/events/amd/uncore.c
> +++ b/arch/x86/events/amd/uncore.c
> @@ -39,11 +39,11 @@ static int pmu_version;
>  struct amd_uncore_ctx {
>         int refcnt;
>         int cpu;
> -       struct perf_event **events;
>         unsigned long active_mask[BITS_TO_LONGS(NUM_COUNTERS_MAX)];
>         int nr_active;
>         struct hrtimer hrtimer;
>         u64 hrtimer_duration;
> +       struct perf_event *events[];

As the number of counters is fixed and events doesn't grow, this makes
sense to me. Dapeng, what do you think?

Thanks,
Ian

>  };
>
>  struct amd_uncore_pmu {
> @@ -488,10 +488,8 @@ static void amd_uncore_ctx_free(struct amd_uncore *u=
ncore, unsigned int cpu)
>                 if (cpu =3D=3D ctx->cpu)
>                         cpumask_clear_cpu(cpu, &pmu->active_mask);
>
> -               if (!--ctx->refcnt) {
> -                       kfree(ctx->events);
> +               if (!--ctx->refcnt)
>                         kfree(ctx);
> -               }
>
>                 *per_cpu_ptr(pmu->ctx, cpu) =3D NULL;
>         }
> @@ -536,18 +534,11 @@ static int amd_uncore_ctx_init(struct amd_uncore *u=
ncore, unsigned int cpu)
>                 /* Allocate context if sibling does not exist */
>                 if (!curr) {
>                         node =3D cpu_to_node(cpu);
> -                       curr =3D kzalloc_node(sizeof(*curr), GFP_KERNEL, =
node);
> +                       curr =3D kzalloc_node(struct_size(curr, events, p=
mu->num_counters), GFP_KERNEL, node);
>                         if (!curr)
>                                 goto fail;
>
>                         curr->cpu =3D cpu;
> -                       curr->events =3D kzalloc_node(sizeof(*curr->event=
s) *
> -                                                   pmu->num_counters,
> -                                                   GFP_KERNEL, node);
> -                       if (!curr->events) {
> -                               kfree(curr);
> -                               goto fail;
> -                       }
>
>                         amd_uncore_init_hrtimer(curr);
>                         curr->hrtimer_duration =3D (u64)update_interval *=
 NSEC_PER_MSEC;
> --
> 2.54.0
>
