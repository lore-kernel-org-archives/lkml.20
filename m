Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C741234AB03
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501455; cv=pass; b=rNj2esLJM1WT6klfC+O8Rech0DFGJ7VTaVgLzuMVrTlGEJv+mZsKN1/m7gN/sMtHvIeD9DdW0QwrZrb9wdP2VVp+LYtNKfc2XxoBsFCCJ9LtyQ/oi19D5HrXPDu2hmjwJELD4udg48MMHDdG1hSlR88hMrmA7+YNjdV5S2IMDZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501455; c=relaxed/simple;
	bh=H3qSjQGi76PgVHeND0Z40zDpqLslWmiK07Q51ZTkBWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eEru8CIzCrPFvOc1+XZZTs9JhVvLZ8gGqRb0NSs2+gE0141ee5Gp+dzNastgszrZfczs7rCALgUOGFEFVHfyS5npmuXe45gPufciQ9Bw756oRuSEaWZ58qpRkVz5DHG4JB8dBheQmKRyOMhm/FEDaVrP9/49fF+xcn4l0A9lYsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TwmGE52Q; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TwmGE52Q"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so67941cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789501453; cv=none;
        d=google.com; s=arc-20260327;
        b=crcfebpez3lku6SgkRzJ798xPRwi+WqPxRCy6NFsimq09r3Ee8ytbJcIT7fePM0VHe
         Dtd799VEXLwTaZbmZcJXHePkGyewNSJA4/7J+BAiTwQanfVVVYs3zvvi6UJc+uhVh0JW
         7vwuHZflKqBbOcETpC8XiIya1+8S305Wi7DoFX2GH0mqJBX+4sS1KdEPqMGugsyobOWF
         VHgTf2hr3R8KRRbzgEPZfMG8tNhx/NeCYz3bQVjbwGSoOpfJf0CW3jdU7aIn+NrR+nhm
         AAsMVDWMAUSikMmVCEH8O1B5S3IA9avAg1nXjSn6zeSn0wAFvJPsxo8cqWZWrhi3nY8T
         EyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=STuNBH/M2NDqA51kDqdq9V/ip/zqwavA2GBjIvz0ZeA=;
        fh=iYvFSfhKkIUguUvM6DSP3h9RIIOXUasxcPnS36ztIzw=;
        b=mFbgZXqa0zHKSOVv21hgjfYWlY00RF+0KodR4UMTLrENv6CZPXtnPXzoU2gQEZBExW
         lGCFa9Hi38K4d84EfUxacX2dNpGOzD24Ihu6/K5wPKBwskTncT1JwNaYLPuLAbZTjfpI
         6ixZ7FEyS0gPzSVRKS9iHWn6fEwVhywOl3sCMxQXWBpm4loMMRvKYUaTiWmBwfui43/B
         CKb/vpAjLIOUOwwYlCFIF9iCq2CIJXPbFufbv5tddeF8hZVh/Nq8QtPAHW5osjjogfBy
         JUK4meTc+JbrQPQSJg1W1dcn7ouAdqUBTXFnPQoySKEHWjxjBYGyUfrcuB0JOkB3bKdW
         vGlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789501453; x=1790106253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STuNBH/M2NDqA51kDqdq9V/ip/zqwavA2GBjIvz0ZeA=;
        b=TwmGE52QVqevX+CIr2YvoqOxDfAEWaSiCuf5eNF2Zvr8hO3Jct0D/qW73E9eAGm/Pv
         IZnIm2jHcJT6F/dS9cBk/DiY9clpDnKKZIwxXZNriZ/cTELVNMBbcnTwktTrluF4rkoN
         Yh8oIVhXEoEMlJAkr25biocsMJhEzMkThhADcGQuzn1BRWbIDlSa5osyp3gkDlOLJfaq
         CQf4LyO8BoklJxCiikLuNYlSKYJVJgnOh+KUdlcAx1JSGuY2TuGULSjIZjsPLKXlA0dg
         3/+4/aT9qZH74DjkJg/xSTnb4FM6a17/S+nQdenKXC1FesS3C5vnb2BxFXpGrT+hX3W9
         qNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501453; x=1790106253;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STuNBH/M2NDqA51kDqdq9V/ip/zqwavA2GBjIvz0ZeA=;
        b=xQ2TcB0Y61JMAADTiX76K1IAg0B6Ucv5ZzFT+75WOrvHfWpYhYp0A4O8n8YhR6pn2p
         jEJGuB6855e/E0srnE8ZocEK//5nlCQkpARqzMhkr5ziQ8hk5xe6xph7iU/ACQpdlmjv
         HJFhfhEYZF87KEd78Yh8K1wNXcQJzcmM0kug5Fai6rz/xhCZVtcmjsGhMZdX8QKNZUd5
         7ZPYt59vpOHuzj9UgQkDOTiuvVGqbu7gf8VE1YSutk0j7FskKzAI+rt8g13W0gONcNWY
         CP8c1xoFai4CRFnNp9ISFNKgOmeH3tgUWgdH1D/1j4fuxmRBH4yEC3P2px5ZCXo4RQG2
         oj0A==
X-Forwarded-Encrypted: i=1; AKwUvBz5xd4OPdvMRR0Jl7xOevqkNSppk/cBtj/CpoYtzotcGSmOpJgEXI0eoG0OHpluqGClI0B41/jFUJnA6gc=@vger.kernel.org
X-Gm-Message-State: AFuF++k6iK2h4uELh90YNydpFmwxcrRJqQH/9/ymCWnl9BsLK+qTbE5a
	IASV+GtbWLV/LxGiBeTcSpZ7x8UhiCK+v/7IgU3xhdta7HmFaLu0LsjSr9Ptn44W5rQAqTEUUIw
	PKcn0evfAGIH/DcSHP/N59uvIbF8IS08/68s+dBFE
X-Gm-Gg: AYBFou3UFisZ6gq3R4gkYO0Locd/xTEekRY5d01oJ1QjN2gPXW4yEd3Q9q1DdnDVvHZ
	1jwKmqnZyrFx6ktReNg5RtRW7Ri3/xqmF3iuZ9vHU6gcqry4p9hflTX61lgpiwV3MXOF3vj3aUx
	NzDPkci7gk8V8uxZDLJCcjCKwaPY3vgVtu2D+NxtZgoRbORAAcniRsoFbxeyIWS5efvn/0DA3DY
	mo8VOcVa/Kjy4XqR9cgl0UFiFATktTDtHbnyTH+9o/iZ4CE3pTNPe4773Gyl0ZH1C98EqEzfer3
	SLdTt7W9SkfXvm6RCVcTs5V6Gi7QscY8TOkteaG8JHhPBLLp3B71WJop4dpauAe5zAOUIxc01KL
	wn83N7oD5dQ==
X-Received: by 2002:ac8:5a4e:0:b0:531:282:6560 with SMTP id
 d75a77b69052e-53259b49c10mr2158041cf.15.1789501451815; Tue, 15 Sep 2026
 12:44:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903112835.1694260-1-nanshuaibo811@163.com>
In-Reply-To: <20260903112835.1694260-1-nanshuaibo811@163.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 12:43:59 -0700
X-Gm-Features: AcwNN1VVU0mXc4k_HpwEgXzGNEMH97BhLgpNu8B-eFOs4SAp8P0d4b-6zKavSUc
Message-ID: <CAP-5=fVBi=VSnGQ_uNAb5+Y=mVi5mBz+Zazgw-kS173hR5vDrQ@mail.gmail.com>
Subject: Re: [PATCH] perf sched: Make output_name variable static
To: nanshuaibo <nanshuaibo811@163.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 4:28=E2=80=AFAM nanshuaibo <nanshuaibo811@163.com> w=
rote:
>
> The output_name variable is only used within builtin-sched.c for the
> stats subcommand, so declare it static. This fixes a sparse warning:
>
>   builtin-sched.c:4140:12: warning: symbol 'output_name' was not
>   declared. Should it be static?
>
> Signed-off-by: nanshuaibo <nanshuaibo811@163.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
>  tools/perf/builtin-sched.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/builtin-sched.c b/tools/perf/builtin-sched.c
> index dd39a4fb..22486df2 100644
> --- a/tools/perf/builtin-sched.c
> +++ b/tools/perf/builtin-sched.c
> @@ -4137,7 +4137,7 @@ static int disable_sched_schedstat(void)
>  }
>
>  /* perf.data or any other output file name used by stats subcommand (onl=
y). */
> -const char *output_name;
> +static const char *output_name;
>
>  static int perf_sched__schedstat_record(struct perf_sched *sched,
>                                         int argc, const char **argv)
> --
> 2.43.0
>
