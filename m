Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793459932;
	b=McRphvqoBlesecAkGUJK4rqwJW9NQALiXZ8NFiat+hzePCObrH2cZLl+qAO7P2lAeUer
	 vtJWK9fwiKe3UBzYz/3/b+eJ4LhdzKABTb4tH0mxuP4V2DWEsYC57NsiJqBgofXfZXMc4
	 VKBNUMc0PzPulCieYjtf46u/NVPfOenbqVIe9YlqKxjxLF347ahBFbGXCX0j20A2JRtFB
	 AdMYwtSqvj2sIoAVk96CeZlGOglvKIwC/e5F1R4QiD70Cd6GPUVjPOny4YR0WFvEfpsjY
	 Mug1hHvr2pVjMPtBB1+gAdHqN5XS2x27mTZ5Nd4H3jac+v5N+ERgvHX6xNfjWhyuNow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793459932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pWROUaQbGzutORUjoHU2j5EievY+f7Xwsbb9sewJ+VE=;
	b=quxbDOFx8tu6M9MO5+BVEw/05KjqClhMNywImVOZB+LajDsWX5n8h6Y2/gX4VNrOtCOi
	 TwhmVtESNWYF6WvgRrhxeFg5PmGcPAzAZ1o4cJ6dIY4I9N0UWlA1NUBGNdw0a+pj36czQ
	 DKYID+I38PhhSI22M8+RXYk+E+rCMBfp3xD9oSnBKlg4EZaXD6ryPbLgZFI3Pw+e1DHuP
	 qxgq+sHTf8G/BecuEs1LTJ2fQmNK/oCxYj08D+rELSuDLQV12+mupZfM0Zs5V1NkTJX6X
	 n7ldBEIl9OkAYOFdqoE3CJ2vE/95e3z7PQDg+wutFQ35b/c2aZVdIldRxEfOAxgGbXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRC70ElT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB90606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BB90606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRC70ElT
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so2074735a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793459931; cv=none;
        d=google.com; s=arc-20260327;
        b=cW6a4QDUSg70bBL29BcvB0j+u1XLxvV0U/qwePxJDeG+2Wxi8YBC+fi/jaUq2Y+bJp
         czOV1LhFDQZVE++UZu0/+Zy+LI8Q/pyn/wpOSXlLr0ea7vtbrKRAz36D0SO818arp4OK
         9tYX06RXlS9vOMXRtihgTo0pVy8MvAKiQnEeaT7pMBeYaVBD2KaX419+b6yAHe8yHkBV
         n3Ry+76UwWd9W+WyZ40+nsg9OZoN7AcRWqgXcE6wmxYUjKVT6kJNi4lpPPZZ4cNfJmDk
         WxXCNCPTkpB4zT477PZKVa/J1tm0UzjYWI90yCmaD/TcAWzdz0qU7nVsKS8BY8ZMVXWJ
         6GTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pWROUaQbGzutORUjoHU2j5EievY+f7Xwsbb9sewJ+VE=;
        fh=FOLWnNzWBRZZ/VqoyRMqOPvX8k2Rd2vxlRwV85NxZ5o=;
        b=PbPQxnhCp4jawDRqgIICbjXMY5CkR8G+UDoPiqyttBN10DqTzTOKatv884YiHTyKZ4
         kPwqBUgf810HJxm3ZOU9vU7QHFc8vJ0kzhA02/DV5MtRWZUqhmy2BAyPj8bRMc0fA7/T
         85uBGl5AoEH3DoidpSazzBN8te/FAOrofaJeIv16gBprWoHdOXsLPZkaUZsv+XtsuZwm
         gWdJZgvmkLhlFf7NFrftZLRjpmuJpMQbEQib3M7DC2y2GvWOkkdsjXydqId5M8aur2ZY
         tynQzdecfpf13x8UVB/0FmIMwkzTXNBiComnaGJhXv/Dzs0xocB2dNb9IgjZVkIEZIfX
         r9TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793459931; x=1794064731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pWROUaQbGzutORUjoHU2j5EievY+f7Xwsbb9sewJ+VE=;
        b=jRC70ElTjpZC4Vg1gVotImxyxtgyoZo7aRDc6o2t5nSg7r6QLeG8hrjb68LTY8c2p5
         q1wiBjkSw+VolE4LuiszzBip9EitT9gwcWiSv/klhcYKzL+XEA/l8+Mq1K1bp2hwU7a3
         jPPpC2o9NDLj9FMw/ZpwckA56sROEr8lo3UeNvgucN+InNzR3dtxrlwgmYhN+fHXRh1g
         d/6usaK76WvnxqQGGUYobWBDTlwYQbhLPTpvrqozTTyaZb6ifGS12KojgI4KEgCQoddM
         4A2RRBOoRyI541uPo6G1XP6z1GBnkq+oGLwH4FnfhUJu9C9RrC0p8if91GlwfOklu9Qk
         6XbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793459931; x=1794064731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWROUaQbGzutORUjoHU2j5EievY+f7Xwsbb9sewJ+VE=;
        b=Hiawrr8Z5GUVjlRP5S44ZFOPOHBI2Gx0Pbl3igMqr9a7lAUZqenN6qDGahbiX74ZvR
         Ecij46EdslQ03suiBCI0XCpSBAi8YnS6KXD+pZRViaToZocDJTlJFPl6ifT8lSLBNAFV
         L+lBHxq/JQgGHjWFnrzKA3MhedZlTqShNJv8xlp5RBXBtO+sWbFKQ8kzpOVp1IVmtynW
         sYCWKetTR6Ia9ZGqedf92QBX8/u0EfjTiMCPR2mXmtbN0wERYtmO0Hyt9yAhY1Z/CF9E
         v72PA18YR7hRykIpXAiKedJHlT4h1kFCHtxStAkoBsjC8c4g42A7fARy6xTs2pA7EcCG
         j6Mg==
X-Forwarded-Encrypted: i=1; AKwUvByNKRBHBUHNtdw0tLHSicp57RXaT7vaWsox6Uv5Ax6LchtuymEBSG2RhBscTtvH84/5wYIv5F9ZOW0tDl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+fhffr33pvUNH8Nqsk+hYiLgedV9ExBkuERWSolAlDljPTNKv
	QHRciLC/xuRtYFKIsytCz4pdYCYXAa78/agBJfvi5q4lYpHCnX1F5DF2HhvlpPtP+d1ajh8Abou
	/F65WvfmoM5pZLZt3B8xvT9ShUznAdDE=
X-Gm-Gg: AYBFou1Mvpc2KuE8tw5NPKypj1Is4MlYtCQg29YNek+eLthrFroUKFddaGHIKOmTSy7
	aUphA5pIAQRBlgPMgP8wEMUcBg6WNYLcW8LhfBZz+M80nyyqgWZA0Nf7B7IcPHHQFmw4QbowVLn
	rY7PCPQ5w6pa8kbnDKyvCoC7OlW6vfyVtkyZ+e2OAy8hh3E0Yg7x+XlYOQ60IfHqiJEyYnL4u02
	pVGGuAnca9MZlsNHpVGN/4g3qZwKxBKjYKP0Va3EPdAgS/7FphSR1CLJHeZvVvfqgxWG4rgNKXq
	7gU2Sh4l3CHtA8ScG+QhqkSvOl2d7WlHOd3d3m7kTAVP9B4riUHICjzWKzKfDYos8VL/PcS7GZX
	VUItyufkEMs0i7ZxxvvKz5XehpURKsiOkqc81wz3XOVQZZui1QCGOtUmYENnyCu/5dkPXT7duze
	BJ0nIbelRNw5JaTTbMjWnIgfA=
X-Received: by 2002:aa7:d7da:0:b0:6b4:a136:8788 with SMTP id
 4fb4d7f45d1cf-6b4d438bba8mr2984206a12.7.1793459930510; Sat, 31 Oct 2026
 08:18:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com> <20261030-alpha-profileme-v2-2-c702f1c65272@gmail.com>
In-Reply-To: <20261030-alpha-profileme-v2-2-c702f1c65272@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 31 Oct 2026 16:18:39 +0100
X-Gm-Features: AclHuK-fcn4Vq_6bW1E8x2uH1VVvD4ohFBO2dvy4BaT3WU-s5Ewn8vz03NCGQRw
Message-ID: <CA+=Fv5TZQ4O89gd9PU6HOaM6i+ZdpE=8jEN66o3_qSe4r2HCvg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] alpha/perf: add sysfs format and event attributes
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
> The Alpha PMU registers with no attribute groups, so the perf tool has no
> way to learn the raw config layout, and the PMU's own events can only be
> named as raw hex numbers.
>
> Describe the event field in format/event and export aliases for the four
> EV67 event types. mbox-replay has no generic hardware event, and can now
> be named as cpu/mbox-replay/.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 39 ++++++++++++++++++++++++++++++++++++=
+++
>  1 file changed, 39 insertions(+)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index 2d9383425357..70840c05d39b 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -212,6 +212,44 @@ static int ev67_raw_event_valid(u64 config)
>  };
>
>
> +PMU_FORMAT_ATTR(event, "config:0-7");
> +
> +static struct attribute *ev67_format_attrs[] =3D {
> +       &format_attr_event.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group ev67_format_group =3D {
> +       .name =3D "format",
> +       .attrs =3D ev67_format_attrs,
> +};
> +
> +/* Values must match enum ev67_pmc_event_type. */
> +PMU_EVENT_ATTR_STRING(cycles, ev67_event_cycles, "event=3D0x01");
> +PMU_EVENT_ATTR_STRING(instructions, ev67_event_instructions, "event=3D0x=
02");
> +PMU_EVENT_ATTR_STRING(bcache-misses, ev67_event_bcache_misses, "event=3D=
0x03");
> +PMU_EVENT_ATTR_STRING(mbox-replay, ev67_event_mbox_replay, "event=3D0x04=
");
> +
> +static struct attribute *ev67_event_attrs[] =3D {
> +       &ev67_event_cycles.attr.attr,
> +       &ev67_event_instructions.attr.attr,
> +       &ev67_event_bcache_misses.attr.attr,
> +       &ev67_event_mbox_replay.attr.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group ev67_events_group =3D {
> +       .name =3D "events",
> +       .attrs =3D ev67_event_attrs,
> +};
> +
> +static const struct attribute_group *ev67_attr_groups[] =3D {
> +       &ev67_format_group,
> +       &ev67_events_group,
> +       NULL,
> +};
> +
> +
>  static const struct alpha_pmu_t ev67_pmu =3D {
>         .event_map =3D ev67_perfmon_event_map,
>         .max_events =3D ARRAY_SIZE(ev67_perfmon_event_map),
> @@ -761,6 +799,7 @@ static struct pmu pmu =3D {
>         .start          =3D alpha_pmu_start,
>         .stop           =3D alpha_pmu_stop,
>         .read           =3D alpha_pmu_read,
> +       .attr_groups    =3D ev67_attr_groups,
>         .capabilities   =3D PERF_PMU_CAP_NO_EXCLUDE,
>  };
>
>
> --
> 2.55.0
>

Tested the PMU event/config interface on my AlphaServer ES40.
The four ProfileMe event selections recorded successfully, with
the expected selectors in the captured status.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
