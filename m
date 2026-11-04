Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793766353;
	b=w03yy5gaAYlRV69Ym3eUctfSDQpFYELfmJwTzfL9VPq9Eka12MKFt8dY0HkbduPuRqmV
	 W+jX5qHm+aapV3U0/XWElYThxFfFXlChn0cLUtZITLmU/tHzcFstZEL9m4eP8bmNyKqnl
	 i1WARTCMBAXJeZSrGXuUyg0NW4RJ5cfCq7H0uDOhpkWnzvMQfLfPEohmJzzkZKOOr0a+f
	 1n9M5qvielt0v3cJOCthnGJ5F95f1yXAOZu5DGkaAingVzZ28EKgtPGKXlsL50j+J5TjI
	 TUupReqtHxBto6ViA8fCFjGPouVKknf2cK6F+3/tFnrGn44mlP6SHVkeBK+1SQQqm3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type:Content-Transfer-Encoding;
	bh=WI3bB1tWOsWyGOl/zi8tRudvpoSVF4MVl+STRxzjras=;
	b=cxr8AyrMlen2vXI7tb7IiOmkWfyRJS+TcSUhlF1wN5q+Xv2R8vI9Xt/HU4HD9/61dKSw
	 rn7stHgdIlvYXDPcDCKyhZgPjHctIhr32owsRtLzhUmXNiIKrVTKnmd/ATH0TMGe7Bm0b
	 7lSWY77TZxMKSZpMrGPl5DWfzPaoLw4UsnTPptFgNb6kNelVsXz1p3v2S9rl7N5u69hwb
	 c5uDvO1MuacbgIR48SguxWrSPztncvSuBDE5AF6K5Wca8KPdPbm3SLG96MximL0Zz5Sxk
	 bKuXK1MDLk0MUQlErMgjxL86Zs1o5oJ37BnRJbXQYY7M0xtFuDugbpbJmPEYyBveejA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NyYT572y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31D3606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E31D3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NyYT572y
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5383c97c8cfso106411cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:25:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793766352; cv=none;
        d=google.com; s=arc-20260327;
        b=DaglnEA5hrAnnnHWam8KcAS93bzrwKr+v73hO/C5GgmUNIAiD+wP3Dxo7fZtP284st
         y7d8pznDMefJB8gUwPluFsjI6+HvML+vIfg4gNTx6WkoSNe8GXybBfUEM9kpLFGO9kBF
         SmB6wb2AsuYBd7Zox5cEc4TGhhMTyPPF8s49f5sz1Qng2FN4F3Cnw/MXK9pXcKFF2D4+
         oeh52L0i/g8uZJV3krbNlY1FP/Zu8wgetyCgRcn0LGCIps3Blg87nFyFtlmOJ5mgcXre
         up6evbTU+nsmjuhtnsmPoQEs1SHcv1EPZ6ZdxiOfLZJpW+81IvabE5fJR7FYx1qVtsxk
         UF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WI3bB1tWOsWyGOl/zi8tRudvpoSVF4MVl+STRxzjras=;
        fh=RyXww+8hleJfgZrcDzSbIzAWyKO1VaHARCpXGklDJyo=;
        b=nhuUDBJg1mkYITjv2xag3kqOAlDIx9c7umMXjNNjGqrzTHkeJzJCIcBzKiaBG27Wjx
         ULOkwQKLrMBYBkml8Ni0Vvj24vbhxrjQiHrPm4tZUoFznIwK7hUnI6MJPfctWHeyrq6X
         OdSjuGmjUCcJ/LY+ijptXRsaAjcLFahfsVxJwB9ErQtHekEN9RpkVolmn7EwiG+WSELd
         tZqD4ps8s556K+OMBzdVENyOWDSp7q3wKU7AqfmIW5ZUw14YteVPS6/ZGVM756M9TPaJ
         cGi5o0Y2lDYxp/2pR2sBO+5uVeo5nvFavgiGlP/e+Ge2O60NjVNtf9kVZ0HK1v4Nx5Rt
         jqNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793766352; x=1794371152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WI3bB1tWOsWyGOl/zi8tRudvpoSVF4MVl+STRxzjras=;
        b=NyYT572yiCVIxymQGlv8tJ8fyVMUD3PVocJ6lfrX4j8vOyaLRwp6ezM7AtutnQ5A48
         hxgPz+g03r9zNaKsaHFm9hk7uhQ10cylnqorPbqKqVF8S+Gh8mV+k7e3UsbQ/qUu2nA9
         JBntU9ZWNevKZc2kadM2uc2ncX1/skAobHBkl3+wpcogG90TI8IdSEzQd2/Pvxq55GgS
         KshO1YHSY5sDidi4IuafZGGq9r2QUggt238+3Db5fAIE1Q/XFi4sDMnUZamTlJ1BWmxG
         NtHoUlj7nMyrOmyCpmgdYly4pFykaWjGbaIIXPfsC+0M1LFLEoEo9ksc5/ThKG6YXPNb
         Bt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793766352; x=1794371152;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WI3bB1tWOsWyGOl/zi8tRudvpoSVF4MVl+STRxzjras=;
        b=nQsWTWvnFFUtIXxp1cQ13tYA0EZoZqTl2MxJfLAvPmVOdGjx8cN+rYAmlXdQGNMzRu
         HKjuSWo6cFA7QVMwLbxrsd4NtJt26kEE5bMk4XlxBWStY2ibc3mi4U2GGijS98fe7aSN
         ZyYpy+p7F5GrrWVhZu1mjdfrrxeI3rJszIBw+NVAKvl4zHFhLcFaqM2Xu7TmY7j8nmSH
         Vo15Qhsar9066SZkOVYWhxiNT+5wmyuK1Ka5s8XsH10lRE+kCOWSx/Dfy1ifos0c0XQ0
         U6jRdZsI5gBrFpbnY7/VoSQ1k6V2enm3n9OgSFnC123tZRg5HxpIEdk1yEJA6QpnV2wH
         kHGw==
X-Forwarded-Encrypted: i=1; AKwUvBxegqFZoFeRJf9Z1cTtBKBAXHYBOSQe/81mocv0xUBW1tVIPYHm5sUJ4YMbp/kepaSgC+r9d1k2Y+YEPek=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jFomMyeJNfjT7GeWjhCf4a7XOQXX/sAsGfiC7zhptBNrmL9P/
	gmQMzZ0rW1F0oyDaqVf7ptBUMMFzlQJr7dDSySBGhrXkMPAQAz3LU10rzrjT+yPIp+SKbNO5MDS
	RuluN2nSfOahk2mE9yqTD1erS9/wnZLYYBjYaPBsU
X-Gm-Gg: AYBFou1WD7bDmwUTDuPG2o+/eQA+3XAXifJPebkHZWWVxCcePlqTPEJ2uUYLPuJLmOI
	uzR77wOoB5zvtNqwizUHdUawpr3NKiEkGyWiXIMVBGhV8pybPRsAFQPObMZXcPbfqGLqcNtm8bT
	jxJDmwQnkW2czLGIzT/ghTqkOVAGuXJ2gLE8z8P2EKOojntuhMVXa7fVS5F3YTKUl+0vevGEhrt
	UAdvafaNKfqyW/2OwhjpM/lXr4a3vRd7PSy5tkDHCAkP1RDQIrYnWt8Ant218Dt2GezDjLCYkLR
	ld2RBi/IS0owxuNZrMnCIcOrkOUAcJEef/XpoAmWAkG22rBCVfpe//UwDUnDWg1gqE+sSo2zDfg
	u4XhODSiu+dlKe24x6aqq6x54noUeL7ujy/KtkQ==
X-Received: by 2002:a05:622b:d1:10b0:54b:648d:9ab5 with SMTP id
 d75a77b69052e-54b648d9cb2mr5349011cf.11.1793766351090; Tue, 03 Nov 2026
 20:25:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025215508.1237480-1-irogers@google.com> <20261025215508.1237480-2-irogers@google.com>
In-Reply-To: <20261025215508.1237480-2-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 3 Nov 2026 20:25:39 -0800
X-Gm-Features: AclHuK-QZgMOvOFTv8qxkeUkqYgKRZ2Q1nM_6KHU_FH0WEU6VrqodwNE_FTWN88
Message-ID: <CAP-5=fW6gwOZpoVWSdDyi-kHHADHdy3g7oKREgCGn3SCO2Pb1A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] perf/core: Clamp deferred callchain entry count to
 fit u16 header.size
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 2:55=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> In perf_callchain_deferred_output(), if trace->nr is large enough that
> sizeof(deferred_event->event) + trace->nr * sizeof(u64) + id_header_size
> exceeds U16_MAX, header.size wraps while the output loop still writes
> all trace->nr entries into the ring buffer. Clamp nr per event (accountin=
g
> for event->id_header_size when sample_id_all is enabled) so the record
> never overflows u16 header.size.
>
> Fixes: c69993ecdd4d ("perf: Support deferred user unwind")
> Signed-off-by: Ian Rogers <irogers@google.com>

Ping. +Steve and Masami

Thanks,
Ian

> ---
>  kernel/events/core.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index b43883a42566..37824ca7fe97 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -10385,8 +10385,6 @@ struct perf_callchain_deferred_event {
>         struct {
>                 struct perf_event_header        header;
>                 u64                             cookie;
> -               u64                             nr;
> -               u64                             ips[];
>         } event;
>  };
>
> @@ -10395,12 +10393,19 @@ static void perf_callchain_deferred_output(stru=
ct perf_event *event, void *data)
>         struct perf_callchain_deferred_event *deferred_event =3D data;
>         struct perf_output_handle handle;
>         struct perf_sample_data sample;
> +       u64 nr =3D deferred_event->trace->nr;
> +       u16 size, id_size, max_payload;
>         int ret;
> -       u16 size =3D sizeof(deferred_event->event) + (deferred_event->tra=
ce->nr * sizeof(u64));
>
>         if (!event->attr.defer_output)
>                 return;
>
> +       id_size =3D event->attr.sample_id_all ? event->id_header_size : 0=
;
> +       max_payload =3D round_down(U16_MAX - sizeof(deferred_event->event=
) -
> +                                sizeof(u64) - id_size, sizeof(u64));
> +       nr =3D min_t(u64, nr, max_payload / sizeof(u64));
> +       size =3D sizeof(deferred_event->event) + sizeof(u64) + nr * sizeo=
f(u64);
> +
>         /* XXX do we really need sample_id_all for this ??? */
>         perf_event_header__init(&deferred_event->event.header, &sample,
>                                 PERF_RECORD_CALLCHAIN_DEFERRED,
> @@ -10414,8 +10419,10 @@ static void perf_callchain_deferred_output(struc=
t perf_event *event, void *data)
>                 return;
>
>         perf_output_put(&handle, deferred_event->event);
> -       for (int i =3D 0; i < deferred_event->trace->nr; i++) {
> +       perf_output_put(&handle, nr);
> +       for (u64 i =3D 0; i < nr; i++) {
>                 u64 entry =3D deferred_event->trace->entries[i];
> +
>                 perf_output_put(&handle, entry);
>         }
>         perf_event__output_id_sample(event, &handle, &sample);
> @@ -10430,7 +10437,6 @@ static void perf_unwind_deferred_callback(struct =
unwind_work *work,
>                 .trace =3D trace,
>                 .event =3D {
>                         .cookie =3D cookie,
> -                       .nr =3D trace->nr,
>                 },
>         };
>
> --
> 2.56.0.307.g5fe7bd680c-goog
>
