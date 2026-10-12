Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66E12D5C7A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841927; cv=pass; b=LdSS1DRsdI2tadWAWj0+4hq7xlW7+7nHbjMr2ketqGrlMs4HkjlXnMkbjQaruMnGeuUYqwrlEBPPx8M63bPqWtJ60+fNQi0kzC8IxrbK+cuELDCAvmBKiK8yOl4y2pcB167qPTsJdPn+2ldNClAFiKPtfmdUh3YweD615D4JG+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841927; c=relaxed/simple;
	bh=DIL5UuZhGTA2pRNXRbjhs4HWRHo7MrRLOSBM7IepAYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W09eLhUzFnzKCqFY7ltxKCSRA79FnUIZhZOM5cj5lINc6GRQnbW82u2f6tKVPgExm5KiPZKbcoPMQMYqwXb1BqOouoxit5Y2sjvzkoXc0Uv5AaaFwDqMP5kPQZRDHCV+rIIbkr+LdaOfYPGmwqu63qYrG/Q/XB4xW1voD4f0tuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vaiuofci; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vaiuofci"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533202fe429so543881cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791841925; cv=none;
        d=google.com; s=arc-20260327;
        b=TdckJ4sOqPuyoPbPY+TDlUF4i2tZYOfMSNSJ1/Ns9zP5gnhQTv9s1Okx8ZGz8LNj7h
         G2tW06CZCbcBIr8De/r5iui8rwxTAkCOTTsZ2NTqPxBm9QDtqkjSI1G/7DfdbEi28JgO
         MiOC0BnW6YxQSGEbT4EmzYfWBhU8ImF4vDS+vbAIGPQfXHItasBs2KhyRHDsORCr5vv4
         NSlE9e9ZxTdmBzYzJtzEmESgf3yMKO9QxYPbmQT0rqVXuTKxoCBAo6y7uSLIOJj5nzAF
         6NNljWCwl6SdYBHZiC6ss2aGk8LckNRyVriVk8lVi3etuuKTLyRvwFz4P9zX6LUJJ9Pw
         vTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YLoAoEeE0ibBzPThB0BLma4hgq+eUQQ3jaPTysHvBC0=;
        fh=NRmfV4K1KRQmKPhoP6f4bWxjGMxfqa0xbOh8WUPp040=;
        b=heIlfDZhoWgaWo9n9jlhWb2uoq8FSDR54mKRHMLidjXxxZnR4PIDmB+vsGMFarHUap
         jKoyVRm9DbjXt4/zRCZg5CGPw7FyQ49M+3FVVf/5pVsayn3C3+kxq3jQ5p/KTcUUpaGs
         QaPhILICfWXLbvR+PbSdYq37jTcHciYDMR31trHAqMM9bwUOfAqEmjzDKeo4XYTah6+O
         sGeu3Bd6KrxjFHGG81Uud0j5hcDREQg7pNF8o6EGskxKuwzCwzWuoH5TwjsFp5rWyLcC
         IVVpN05mBa35Co1e7092670VFLm66zUqqu0ZttVLmV2D+OytPzsy06d7vQS5EJ6uizG9
         Zycw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791841925; x=1792446725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YLoAoEeE0ibBzPThB0BLma4hgq+eUQQ3jaPTysHvBC0=;
        b=VaiuofciM1NPp/ND4T0HN6N92O1EY4zQZrZ5VmQbuV7GqZMSiKFsj0LVq8tWIyhdUH
         IepGmxX75BmT5g1TkHEI7AQj4ZIddR0m8++ndvpbaeyZ10mR7hW58Jko4q6ga3+OpBvX
         T4HyEIu2fscD5r51TgUVZ3bZQM9wmoLNlE5Xj8bcztg16g+BdYH4j4T7+20vE34GR4Nr
         b23bYajCDA5skuwvcyWVBJ2zGGcaQGp7F736F4SOty/tKGm303/izuwwLZrgB/Z0ouO4
         UX6HGYSfSQKeJC65z8JXDdENqlro6e/zUvjtweyoKNvRVNX4Ipg7wx9KSZ3RE4EMywZt
         i6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841925; x=1792446725;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLoAoEeE0ibBzPThB0BLma4hgq+eUQQ3jaPTysHvBC0=;
        b=lkt1gsldqbk1SI1A6MaBgVU7aGEEWgXda8NnT87lRzK5ZesMYp2nhNwllvyLSzo0LD
         hTzYbR3RSYazHKfYGS4eN3E1m+qOtH12PSvENv241GE18STU6d9E9TwNgF+VTbLl+wMt
         ZpCpOw9F8NyX+DSbkecfR+miBQQ3OrzTL1spD/s2U0KpZlFIJzqtQVkLhnxro8xihEzT
         4lOX/Bx8OE/kSOasM7Ws3SoiI22SDPFtjC/4YO3CAw0i+UNHzTB5aySD/o8i4QEuoYUs
         hc6REJNRtY7yiHmdBqCeRMQKXooM1xe1LoVU17K+DxXRwX57g1Z/mVZZFT14dhjfYh5g
         x8zw==
X-Forwarded-Encrypted: i=1; AKwUvBz9+q4rtCgMZ9geTpsNM46dFWPu7nhEEX6Uhcnns/WNaow6rduyzpvaQFinaUfUF8ZhQ5VmVn37NN2hKhM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7Wrd0bllLzqZXPw+UnXsCU34dDxNPQzUoEBjNQrle2jn768TP
	xjx2BQHDBJ62JwVkg7mSRdyMi+lW0HWe9gk6Hld3FiW3Oq86Rp5R8Mux3WHc2zUJuIZQ9AmPSo4
	lAsU8B0KXIe7FmM0dWOA+P1FX0L0VTNeBVzQy/iwc
X-Gm-Gg: AYBFou1I6Foo8gjeQw6J/CmIPMN88rC0B7EFT2eBaitkYPxZai7VUdOZUJJHrB6VSxG
	RonJsDpCFTNv/jGfDE2c35mqzixR70BGpC/nH7hEMmkBQ2ahviJ4Ho6O/z4lWdWpDcB5MYv2n/x
	Lcsx7e/H+eJ10ZZvaJSlaPTf+3ezr5pDBQ2aeYrxWBVQBaNw3FvrSHBYpT8x3FzQkuwy5RqjRiQ
	uvd/CR0demmV2cjY3TLZglsS556sX5O8D1ULVCbkIphwLheAU1l2Sxwz+Af8tNFDgdP71M1n/5J
	+lhYOgwmx2z8xC8BM90e3a56/wigAtIZq3/skMeDv4O0fB0K4MxI16ge+5kvi9Ixh+pjAuu30XK
	zimCkhywZiA==
X-Received: by 2002:a05:622a:345:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-535b4f9b8d1mr34243711cf.14.1791841923948; Mon, 12 Oct 2026
 14:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012053013.14378-1-namhyung@kernel.org> <20261012053013.14378-4-namhyung@kernel.org>
In-Reply-To: <20261012053013.14378-4-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 14:51:52 -0700
X-Gm-Features: AclHuK8fSmSW9prYIWpNexYiVkZwA9i8SN5Rf1NNY9lV-sUOfaw0J3zWzFUeo0c
Message-ID: <CAP-5=fW1SSoyGKjaujZewF=b3rJ-0vp4kJ-friWNzOQWk+ki5A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] perf test: Update PE file test for other locations
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 10:30=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> The test__pe_file_parsing() expects the test is in the tools/perf
> directory, but it could be root or a separate build directory.  Let's
> update the logic to try other paths like in the shell_tests__dir_fd().
>
> Also add some debug messages to inform users why it's skipped.
>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> ---
>  tools/perf/tests/pe-file-parsing.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/tests/pe-file-parsing.c b/tools/perf/tests/pe-fil=
e-parsing.c
> index 3979f38bf127c218..78dae7e43603b9f8 100644
> --- a/tools/perf/tests/pe-file-parsing.c
> +++ b/tools/perf/tests/pe-file-parsing.c
> @@ -74,10 +74,17 @@ static int test__pe_file_parsing(struct test_suite *t=
est __maybe_unused,
>  {
>         struct stat st;
>         char path_dir[PATH_MAX];
> +       static const char * const tests_dirs[] =3D {
> +               "./tools/perf/tests",
> +               "./tests",
> +               "./source/tests"

I'm not sure where "source/tests" comes from?
nit: could we add the exec_path case to the list?

Thanks,
Ian

> +       };
>
>         /* First try development tree tests. */
> -       if (!lstat("./tests", &st))
> -               return run_dir("./tests");
> +       for (size_t i =3D 0; i < ARRAY_SIZE(tests_dirs); ++i) {
> +               if (!lstat(tests_dirs[i], &st))
> +                       return run_dir(tests_dirs[i]);
> +       }
>
>         /* Then installed path. */
>         snprintf(path_dir, PATH_MAX, "%s/tests", get_argv_exec_path());
> @@ -85,6 +92,7 @@ static int test__pe_file_parsing(struct test_suite *tes=
t __maybe_unused,
>         if (!lstat(path_dir, &st))
>                 return run_dir(path_dir);
>
> +       pr_debug("cannot find the tests directory\n");
>         return TEST_SKIP;
>  }
>
> @@ -93,6 +101,7 @@ static int test__pe_file_parsing(struct test_suite *te=
st __maybe_unused,
>  static int test__pe_file_parsing(struct test_suite *test __maybe_unused,
>                           int subtest __maybe_unused)
>  {
> +       pr_debug("libbfd is not available\n");
>         return TEST_SKIP;
>  }
>
> --
> 2.55.0
>
