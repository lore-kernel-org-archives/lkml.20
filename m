Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C8A3939D7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351272; cv=pass; b=O3FhI/zUjH+ho5lYEQeQW8yeLN37t5R/cdTQhA+P+KQRYZ38Tjw1x9aqgHyvNTwlsuF3dH1Xj40AKFnHC9t7cD5sn3A89oYhscHanK1NxP1q10XyBQ1q6vJqqGcVO14NaeRU88Q7qVv2zMyAFndtcJ4GZIlQs2NtT/7g+UVlKM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351272; c=relaxed/simple;
	bh=/ZxCthWVQLi80Q8ToT+iLne/1bHLZhdKaWMea1fHLm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDQUXRForivqtkaqWP4Lqyw0cWqyOdznQgVFTVzZ80Z6k1ztwy15fhkHMO9CzLJLAnT/I/elLtUuKr4YJXueyIMXWoPCwq9eeuKzMh2POIAtazGdB4SgogIuw+rBdGtyMoRk/AlPrb1HnrzVNCargmDXr1QK7/F82eONCJmjF14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ASPTWO7b; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ASPTWO7b"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-530e8c6fb80so268451cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790351269; cv=none;
        d=google.com; s=arc-20260327;
        b=CziShazoSJqP2aJuH25pBksV944lXUY89FTUmcRx9STW8Y4zwwEXa260u1KJndnjeb
         R+8zCvwhfo60MFDXZcmOpC1oEBmGgWMg+rWSmXxG7E5jkaH8uTj5qZC11tD+JD8S1PcY
         LiEIaubYo+6GdQ+5CMdEnSOY1w6+Nf8mfCCMEt7tngajCtBRAIszWUdwim+MN6a8+GX+
         tg67ySZkPyq2KQWtxWxdvFvnKidXxOx2ZHy2PKWDC8Rp3VC015BrvqgCZ/0zKCWG4EwX
         LFBnupNDaNuNHbXXizYtDPdOCADQxovXBJBS0DCsEMk5UVxy2U5YYg1vJl3RQWKknTQ1
         GXRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=by084NqSG/pTnJ7x7+ZEKqaDLVSnHeDTMzS0Y6Mbr0U=;
        fh=RJD7Q6cMXLnuVJ7+7etrr2qCwtAcwupVxJAwCjfjQcI=;
        b=MHzvaAMmtDefZzlZf1hVdT7Wm44VTlARpsi24ByTYqKRLWf/ZN15GqA+OD7w9LOpOf
         /xY3t2+2KjR9EK/LNzeRuqb7kRkF7ZpKT1L1zR4d9igOv8qC76LOxjcYTqlUsdcq781B
         jIPzzJBf5Sif/GJjtkL9hnZAI3VNihHYlf7TJ8Kmrz1q+mo4aAC0ZkROvLHAzn/5RtJS
         6IfMatT7NG9V+ctgTwa7Yp17zE8cbkMdasAOqEC5TFBZEf16ITMu9eKJk+uEUSjnAmwl
         WSnQxURFVR3cE5umJe12kNUeKkHK+7FwYCSyldZlpUkOvYUFqmX9ZLGHVwPr006vARbj
         MYIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790351269; x=1790956069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=by084NqSG/pTnJ7x7+ZEKqaDLVSnHeDTMzS0Y6Mbr0U=;
        b=ASPTWO7bTY5KxYlvxQ1iR0L9InWnkZxGehRiPLQaTl9TAf4HzTsPP0XDHimuvVqSPo
         NfKvCIMqM6Eq+uHQQZv++ANG2YIvLjVBdthEajP/PBI83icsLV+rwxwMe6mkQKoDf9o6
         tSnBGUnpVqzf5QPmkmEXaKQcFp5avqgCc5ZCud3YDgrbqvpmxpgwDr7Gsg1dJLZYjih2
         rM2w7OaOA2mA2ZexJy8PRh/KzpIg6mM63uqN5NwFpcgCzskpbWnu9lOjQJ82chK3sf7V
         nyrojOAzoSVkMWR6ahsoTnuk3yfp4XSkvByXoIpX/Orslco68Jbto2+ahXJou+67dyXe
         qMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351269; x=1790956069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=by084NqSG/pTnJ7x7+ZEKqaDLVSnHeDTMzS0Y6Mbr0U=;
        b=jMQSPwJ0bwwOtoOtTl12xqmyhpXesgaQSzLEwdaFrtt04iB5RwX69wT0wR5GurUaCF
         U2QiFdgEz7GnXRaC6gDzK5BPDOgbJJPqfYznbYIntjsR5PwLMdR7LOn+oYfB/PRm69fn
         yDeNVX4fquuExK6LGoS+Eb4YvmHHA/Mjfng+QhXsEimIMvZ/RxuwIBBrOHh3eWJV3AuG
         37HnoKevfwtdPeRQuGI9tp/84VrRlUs1et8dxgXafC6JEs+kU96zD3ZF5g6AI+09HTTB
         A7YsoDcC2ybJq6P52+/Gr4l15+8/O2lajFynte9+OPQ+ScNtCVqkmS6ULD3Kp7Ehwk+H
         h72A==
X-Forwarded-Encrypted: i=1; AKwUvBzhr3cH2QmsErcX0sSGuw1ZSw1aJbqwjirzUjVzYfYXqxw+pcgK29txVsQsVKEdE+veGQXq8wnxAMWEN5c=@vger.kernel.org
X-Gm-Message-State: AFuF++l80F6yO/ZKmFtihJU6SATcKvOX9gUULPZKg7GmGja5yRthtgYQ
	qQ+qYVShoeKJeX1a3KNFz7FjluubPkNHdQqKqdh/F28MSbTaUUU1e7Ewdvwfo0bczNdh+a+gwWX
	4Ph2Yqeqz5igm7C4FaI6Wvv377HGwWfQput2RZcWR
X-Gm-Gg: AYBFou1SK+upRI1sbOSbeYQqlIed7yertsrqN1irmU1LRZzE154DF+xgsvL3WdCIMVv
	iiiE1slP9HE82Q04jnNUOv52vbfCuLyYJDBfT5ky079egrIfM8n2gScLIzm3+iRwdKPGuWYoTCb
	iUndu1TYxoJOCVbHixSweRGm03XUf1lUGgo+/t0Vi2I0JOPflAMLovloU8ibg02L5edFIN6wv96
	QGuvVBYafEt/1pmhDYlz074/wuxwsMgY+FjErbA/jRgRmPXdXx0dSty+2FgAmvF44prKj58VeeA
	Jsq7mtw3RhRGj9uCLkv4TL5C+jKkxazaMbI1BLDn1EpqbG9Ifaundc84glG5qZkJW+H60Abucat
	oP1x1o1QMPw==
X-Received: by 2002:ac8:5f95:0:b0:531:6de:6028 with SMTP id
 d75a77b69052e-5331a84dc4cmr4321831cf.13.1790351268496; Fri, 25 Sep 2026
 08:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925150657.1826942-1-acme@kernel.org> <20260925150657.1826942-6-acme@kernel.org>
In-Reply-To: <20260925150657.1826942-6-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 25 Sep 2026 08:47:36 -0700
X-Gm-Features: AclHuK-TlPFDsA96ifQRolrsELZLPsldk2o7CjCkF10lPuk2QTtf01ea887PV-c
Message-ID: <CAP-5=fW1gppdAiUEuRxBsB6LMa2EqxhEwbfjMOp=245Wb0VJJw@mail.gmail.com>
Subject: Re: [PATCH 5/6] perf mem record: Request PERF_SAMPLE_CPU by default
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:07=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
>
> The data type profiling per-sample stream keys cross-CPU contention on
> sample->cpu, which without PERF_SAMPLE_CPU is the "no CPU info"
> sentinel, making same-instance accesses from different cores
> indistinguishable from same-CPU traffic.  'perf mem record' already
> passes -d and -W to the record parser, add --sample-cpu and document it
> in perf-mem(1).
>
> Also grow rec_argv: the new entry overflows it on PMUs with separate
> load and store events, as the space for the fixed arguments was not
> reserved.
>
> Assisted-by: LLM
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/Documentation/perf-mem.txt | 4 ++++
>  tools/perf/builtin-mem.c              | 7 +++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/Documentation/perf-mem.txt b/tools/perf/Documenta=
tion/perf-mem.txt
> index 4d164836d0943119..fe51c5e3333dc4a0 100644
> --- a/tools/perf/Documentation/perf-mem.txt
> +++ b/tools/perf/Documentation/perf-mem.txt
> @@ -14,6 +14,10 @@ DESCRIPTION
>  -----------
>  "perf mem record" runs a command and gathers memory operation data
>  from it, into perf.data. Perf record options are accepted and are passed=
 through.
> +It also requests the address (-d), the weight (-W, where supported) and =
the
> +CPU id (--sample-cpu) of every sampled access by default; the CPU id is =
what
> +lets per-sample analysis tell reads and writes to the same data from
> +different cores apart from same-CPU traffic.
>
>  "perf mem report" displays the result. It invokes perf report with the
>  right set of options to display a memory access profile. By default, loa=
ds
> diff --git a/tools/perf/builtin-mem.c b/tools/perf/builtin-mem.c
> index 6101a26b3a781e69..ade53688ebcd0f10 100644
> --- a/tools/perf/builtin-mem.c
> +++ b/tools/perf/builtin-mem.c
> @@ -99,8 +99,8 @@ static int __cmd_record(int argc, const char **argv, st=
ruct perf_mem *mem,
>         argc =3D parse_options(argc, argv, options, record_usage,
>                              PARSE_OPT_KEEP_UNKNOWN);
>
> -       /* Max number of arguments multiplied by number of PMUs that can =
support them. */
> -       rec_argc =3D argc + 9 * (perf_pmu__mem_events_num_mem_pmus(pmu) +=
 1);
> +       /* Max number of arguments per PMU plus the fixed ones added belo=
w. */
> +       rec_argc =3D argc + 8 + 9 * (perf_pmu__mem_events_num_mem_pmus(pm=
u) + 1);
>
>         if (mem->cpu_list)
>                 rec_argc +=3D 2;
> @@ -135,6 +135,9 @@ static int __cmd_record(int argc, const char **argv, =
struct perf_mem *mem,
>
>         rec_argv[i++] =3D "-d";
>
> +       /* Cross-CPU contention keys on sample->cpu, -1 without PERF_SAMP=
LE_CPU. */
> +       rec_argv[i++] =3D "--sample-cpu";
> +
>         if (mem->phys_addr)
>                 rec_argv[i++] =3D "--phys-data";
>
> --
> 2.53.0
>
