Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE33A446060
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501284; cv=pass; b=PXgfqYKxznrwBoQsdBBf87C3gVW9imcXNAjp3UIQexuyXzDKVhdQ0k8WesA4fq9G82lvlhc3WlRrhckI6hq4Awz6i4xRC0SfBqp3U0TA5dJFQ7ddJ/7VFmjpNFDUZ16eMVPsHwy3sFIJbH1YDV1T0zuqtxqZLhbxZiOfiI6vA/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501284; c=relaxed/simple;
	bh=Ej8KoSGeQxcULu7TQzQUynSHUdtMBfWtTqc1vw1YL5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9p+p6pqggVDyYCSaW18PceSRkwRtzpjL1c9u1gyU6SnzgxNjeAUCmX3WnJe1pJPvs937gzj8Kntxn6G9eIZNlj8S3OHi/Xk0tP1Urb0nlDf+vN/1bc/vb0DFHm+djQjKq7jgC9fOpkzNG6ZrogfVUVIQRPzNe9n0tpWqdFuzhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hF8qjw1u; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hF8qjw1u"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530d5fc2cd8so61251cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789501282; cv=none;
        d=google.com; s=arc-20260327;
        b=gHthc6FhcKzLh7n9zZmSnoqaxEl5/y6BLCCCsS8H1am1U17jY7Kblnk29ldKL3CZtc
         jdVSEUBHpCKCVxm3ynToi1E+u4yRT6p0VJ9AxRvYv2eRkcsaJcPsbfpW4B6iXOTQyqmL
         n8XskXnlVRil4s/wbqCnuS7SybN8vLolmJdLz1cORhxpzjiAPRgCzd8+R6skF/szSRz6
         E6CiM8HqTAMtGNYGCUolO/uEhqA5gZSQoYuSh+sfFMh9euRqHXq5YvJvnAcPpn7LCZFk
         5BzYF+IiHEJTIXICjnu2jYyNOln5hUWu3aTYetRld6oXmE06mBuYhuIVwvbO3IZfpIKJ
         KOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SC/BXcHW8jtefC9sLazfapcUVxrIRpfnR3KQcEsZeeg=;
        fh=8m5gQu2RSB8hYWmYoCiFEtyUaSP4kFml0iDut8yBDA8=;
        b=MxAcKMkK3FHz+/9TjCevXTyi95hg+xwpci31rXO2VVYpQdOmE7fINQ4hUhXF15YfYp
         9RK+mTrpF1qfiHQldRKcpO7sZkAjUS+boSu9KCN7yuUjGtfo92WS6mG0YF8Kssbb4Yg7
         cvMLwcgaEloy3spxIdZpc1JYqiAufMQqhR9GxT6ausj+mqb9sTVCGILIoY/mfgcqDbWz
         UvDHN9YQz/nl9KqxScNRywhVqlt8lrIz2DSV1e070Fqgg6RY0c5SxwKCWYHlo1ybgxbD
         PYLGZG4Mq+X/uGzR+qtaAAlrx2j0RmV+D5FOWrmocfwuGRrLuSArwYcF56NPlsk5uGFi
         aV+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789501282; x=1790106082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SC/BXcHW8jtefC9sLazfapcUVxrIRpfnR3KQcEsZeeg=;
        b=hF8qjw1u2vCM7UclK2xScfzFUaFcZOdz/J5ymhd+PAWAwsUUFX54Vyd/5MQCHT4izq
         RgZGcD1AVK0FJhVKy61okXkkZw5zs0CzDwIqZobtghxI9mVIseaCHpH3lzARZMhwSFn1
         aT+IIcie6yew0SxURpKNsy3k7LWKQC0qIBPOc9aqRedKVaKUp59ff+g4XIQTleoeHAid
         Por9tEhEmIbAnwdPrzmQZV9iS99NNMBgG55MiMeZMp9NDDY5WxNgaJcDG1pP9zEGXx8f
         zq7pp/7VsYQ9HiE2577m8glm8PuZYcnfqFhuxfudrostIUv0epZHUfoJhVoVjsJOiAVl
         Qg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501282; x=1790106082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SC/BXcHW8jtefC9sLazfapcUVxrIRpfnR3KQcEsZeeg=;
        b=p6ct1MygHqNPCKDf/Psz+AvqF1znU2HS3glDKWmojy1MInCSbDM1D5bDfsEBFoTaPI
         TqLBMbtPvHA1nUQjLAZZzzvn5fPLmOmU94Rp7jBooibpKvBU8hNhBmj2dNJaag8I8ANl
         RAfb7Nbpv9AxgvgMgvcuxwjYhsP+kHXdloFAlIL0/O7eQC2BJCtHoDwSClP7s+8j/ISQ
         nS90VdaEAB6EyIVT5PbDZxqI7WnA5eyaZxGFAGwxfb+Lz5QKvY/+mRgzXRCZ2zs4Fz+s
         IvZAUQgVpbf4Aq5pbEUuxleN1f/JPl+91CVJvdLEexoXU0djs4LAp9gJjqdQVKEzlMav
         kP3Q==
X-Forwarded-Encrypted: i=1; AKwUvByY9o51hUtFI4MP6vBOSXPXZ9UdetqSQ+Mw/4trVeLnxFeE6rDuBuAEHqlVCiKHOCigHIIfFI6aQiK2SI4=@vger.kernel.org
X-Gm-Message-State: AFuF++nqtjk7epkxdtMBBzJFdFgvQ3lX8KPLETlQNj2DeVWDtHQoVGx2
	8CwtFPIzzBCWhG2sUzkX7e2AP+EYCvM8Z6B6ejEyk+OazmsWf4zGJlbsrhzhKDznRXLerxktdHP
	3LVMlRtVn0DkwA0/r6B+lCWJ+eERfYT8gO79U9Ja8
X-Gm-Gg: AYBFou0qDa/I0/yxhLqIT8J24b7WVNpP5tYkWudZHjxTtuYpqo/E9+ef2IBVK9XCt/x
	vUsduC8qVaWpqF++iic0zmoLGRgPM4rz9ebPy1OJmXstJkEopEu1UW8PjKTAZdBm1dN2CxcK1gC
	LvR9WMg6q3BmykHvCVLsFPE3dv6G1+Z91p1FqgLPsyjsQLyjPMvRNgAZJ9PiDR1I/QJSNJhUNqL
	AYh5V5KxBrfTQ8/XEvfAFCjyeJqh8W9lKrptrj7L4sZMKwYh94gii5xwcpNbnJZRRsLIkpt4NiA
	lJf3HcI5GDRwxp36YEhnu3c4FiWqjVpritlr8i3ZpeIlT7GcMBL+CGT+OOlq/GB4g8bBqZob9zi
	zT+QjfjcBQw==
X-Received: by 2002:a05:622a:1b14:b0:531:a85:69c1 with SMTP id
 d75a77b69052e-53259a90915mr2530131cf.5.1789501276092; Tue, 15 Sep 2026
 12:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912055619.2284443-1-sh_def@163.com>
In-Reply-To: <20260912055619.2284443-1-sh_def@163.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 12:41:03 -0700
X-Gm-Features: AcwNN1VHVa5QCumRu92Zeyc87_NMbjXv1GcU2uE0TNV-q1jJtI9u_WX-kNBr56E
Message-ID: <CAP-5=fUCDeC+mAi_cVpNr+WoUXvpMG8948GVnb8OQV95PhVQ6A@mail.gmail.com>
Subject: Re: [PATCH] perf synthetic-events: Fix schedstat event lifetime handling
To: Hui Su <sh_def@163.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 10:56=E2=80=AFPM Hui Su <sh_def@163.com> wrote:
>
> perf_event__synthesize_schedstat() has two event lifetime issues.
>
> After a successful iteration, event is freed but retains its value. If
> the next iteration starts with an unrecognized schedstat record type,
> neither synthesizer assigns a new value. The stale pointer then passes
> the NULL check, may be passed to process(), and is freed again.
>
> In addition, when user_requested_cpus filters out a synthesized event,
> the continue path skips free(event), leaking the event.
>
> Make event local to each loop iteration so it always starts as NULL.
> Also avoid the filter continue and unconditionally free each synthesized
> event at the end of the iteration.
>
> Fixes: c3030995f23b ("perf sched stats: Add record and rawdump support")
> Signed-off-by: Hui Su <sh_def@163.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
>  tools/perf/util/synthetic-events.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/tools/perf/util/synthetic-events.c b/tools/perf/util/synthet=
ic-events.c
> index 0c150193cca8..2eac2310a01d 100644
> --- a/tools/perf/util/synthetic-events.c
> +++ b/tools/perf/util/synthetic-events.c
> @@ -2817,7 +2817,6 @@ int perf_event__synthesize_schedstat(const struct p=
erf_tool *tool,
>                                      struct perf_cpu_map *user_requested_=
cpus)
>  {
>         char *line =3D NULL, path[PATH_MAX];
> -       union perf_event *event =3D NULL;
>         size_t line_len =3D 0;
>         char bf[BUFSIZ];
>         __u64 timestamp;
> @@ -2858,6 +2857,7 @@ int perf_event__synthesize_schedstat(const struct p=
erf_tool *tool,
>          * for filtered out cpus.
>          */
>         for (ch =3D io__get_char(&io); !io.eof; ch =3D io__get_char(&io))=
 {
> +               union perf_event *event =3D NULL;
>                 struct perf_cpu this_cpu;
>
>                 if (ch =3D=3D 'c') {
> @@ -2872,12 +2872,12 @@ int perf_event__synthesize_schedstat(const struct=
 perf_tool *tool,
>
>                 this_cpu.cpu =3D cpu;
>
> -               if (user_requested_cpus && !perf_cpu_map__has(user_reques=
ted_cpus, this_cpu))
> -                       continue;
> -
> -               if (process(tool, event, NULL, NULL) < 0) {
> -                       free(event);
> -                       goto out_free_line;
> +               if (!user_requested_cpus ||
> +                   perf_cpu_map__has(user_requested_cpus, this_cpu)) {
> +                       if (process(tool, event, NULL, NULL) < 0) {
> +                               free(event);
> +                               goto out_free_line;
> +                       }
>                 }
>
>                 free(event);
> --
> 2.55.0
>
