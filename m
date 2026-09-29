Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F413E5EC6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670535; cv=none; b=MIbjvTPRcISxxpToPT5J2f3IZqcXaznarLk6PS3hHEfA0ABemNT5SqQy7RK6zgiGZeXPy1Cw3QvOmB23TOYUM8HCUvdyTf39e5II75vzbpPUZomsGGcHgxrNqOtLarQ40tUfMZuWalFb8UhdgQIfjbXu/uZTciQMgG8zaPJH8W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670535; c=relaxed/simple;
	bh=lg6FAm4ikt815tMFbn+B5Y5REh1CK8YMVDDQI8pImZI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tHi+0ybqiNcXe3CiuAFDhN1a0k5ULhuSxhN4md+VMZpC6LQRRsogUG0x8Z4Lgy8M4huMS2Ur1z3U4Nm7/D4DRG72WyI7Y4yR3f1LQlJ8IQEiJ+GDLnRCpcRUdgJusvO7R83rz5y+O0ConPxZovr6liS0xc1oZX0a8KBNjRh4lJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aS3ZHM1y; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aS3ZHM1y"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so2199165f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790670532; x=1791275332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dkGqvg8vL8qJpC16ZqaKGFhzOUdsa/w+9z6yCQwg5qo=;
        b=aS3ZHM1yAFdutKWxCIUYK0kaHuQcXBmw2YeLAqQS4YWcSChTsoJ5KC7pwbVSzo2Rom
         zTMoSekiUNcB3R+ifJ+icyL9BoCY5OD/O0kFTNG5bNuam5zfNg1AP6Nc2akvKiFyYW80
         szxCx+z6iy1KU6DB5J4lnJuZBhzW54oWlJfkd5+0WZJ5YepIrrguK2vX8+xx1+8okp8N
         KxAK9VbQQiYjegoYTGNVnf1+fzVG6id8T7t6cC/Ne1HUjJ1U458yUpqfa0s80E+8hOud
         qoCKHVHll95dg8NDx9JzFpXta0GI9P6G3B6c70wdUmpyHx4Oq6ALV/brGSy+TTZgGpmo
         +n6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670532; x=1791275332;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkGqvg8vL8qJpC16ZqaKGFhzOUdsa/w+9z6yCQwg5qo=;
        b=WUzW1nWcrQ7DgAK8LuCqROwQ4qSmctpSXmCU9ZmJgiDlZZNSLoXY7rKWrID4BBENmX
         oLVEy2fOp2DHcXxQxrji5/aIMBnAmBEc+7qPOFjFhrcil/4fCoViw2GlaMVTn5IWpb8q
         jUatz4F0XCoPuubVlNnXpBFIgXnsqSTt2APL84DD3crYSxV0c6JsV+zS3Yvjve0uzPJk
         NwfeBC1iJfCdCuHgbs+LTDKXoHsPjREbetVTT249uCUMZwwFfkNvO79vhem718PRrRMU
         Qze9uQ2YzEqFFb5wcM6Xr004yPwRJMHko0ViXshNWRo63E+eGFdGmlVYTH912GPSRr1N
         60UA==
X-Forwarded-Encrypted: i=1; AKwUvBzHzsMW5HLVuuie7W4YpEwybvnSKJDI+eHukgwQ7SiOYI4QNhhVZ0cs9HrBteAr9iAnkmRzwJg5/6Vb4bA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRZU0M4zpw1BpJV1povlUX4ILc22Vbb/RSw0d4pPSsM9g3LdU8
	fzqpW0KsAPHIEYQ1npVrAsCDsoxLvrh25Mt8405Pw7L7fWr6/d8iPXMg
X-Gm-Gg: AYBFou3FQkHYes9sy80kf/C1mj3diPZ+HGhnVS3uulrEyyjKCUhJWfU3Bvx49Swrion
	a+sqs289CQ4vJfMEA6/xVoKCC9x816+vpPVyYI5ysa03d0ot1HkDeSJtqwJnMKxDs1SeafAxNVl
	UfFVqw1aEdtE6cKX0aPs7gZS62g5L1W4OrQtZffX1pmo96Xt9Vo3bI17ldnrbo/RzhFihPcbOkp
	xp8TyWks91f31b51qgndHyv/kkPayk+xzwT6A7gbKrPbLxfQD+SXIf/oJ80xeZR5WbMbqoKmXz/
	mlbEftUHCg3brJm1lu8EqFxagF35+dr/Y9uBp+DsO+mJBEJYy7q8twiOmAUfM+eaL5WsG+QwsTQ
	jjgkZhnW6x0OmgDvaBvYdB+q3xpXUaabSuRj5ljvuLhFwukCqSfGxsnST9dUuJR/y96gD+WwZMf
	Y+pHlx0eQCUUYAsffy5UFzpDiDVqle5m7LquWjw4khOgbOuq85HJmO6bP1otLz9b1tPDUU63SCr
	BYUy5M0q8atOFDk7cOlIM1ycBV8sDJIAdk=
X-Received: by 2002:a05:6000:25f7:b0:487:40a:5ba8 with SMTP id ffacd0b85a97d-48af5e29b48mr821503f8f.15.1790670531954;
        Tue, 29 Sep 2026 01:28:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50513c7sm2242165f8f.16.2026.09.29.01.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:28:51 -0700 (PDT)
Date: Tue, 29 Sep 2026 09:28:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: acme@kernel.org, peterz@infradead.org, mingo@redhat.com,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, james.clark@linaro.org, leo.yan@linux.dev,
 john.g.garry@oracle.com, will@kernel.org, mike.leach@arm.com,
 pjw@kernel.org, palmer@dabbelt.com, guoren@kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] perf tsc: Replace the compile-time TSC support
 check with a weak hook
Message-ID: <20260929092850.697bce16@pumpkin>
In-Reply-To: <20260928094739.2605-3-cp0613@linux.alibaba.com>
References: <20260928094739.2605-1-cp0613@linux.alibaba.com>
	<20260928094739.2605-3-cp0613@linux.alibaba.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Sep 2026 17:47:39 +0800
Chen Pei <cp0613@linux.alibaba.com> wrote:

> The "TSC support" subtest of the "Convert perf time to TSC" test decides
> whether the architecture is covered by matching compiler macros for
> x86_64, i386 and arm64.  That list has to be edited for every new
> architecture, and it can drift apart from the set of architectures that
> really provide a counter: util/tsc.c already ships a weak rdtsc() which
> an architecture overrides with a strong definition when it has one.

If you mark the prototype in the .h file 'weak' you don't need a
default - instead check the symbol for being NULL.

Then you can do:
	if (!rdtsc)  {
 		pr_debug("Test not supported on this architecture\n");
 		return TEST_SKIP;
 	}

David

> 
> Add a weak arch__rdtsc_supported() next to the weak rdtsc(), let the
> test query it instead of the macros, and have x86, arm64 and riscv
> override it in the file where they implement rdtsc().  Support is then
> declared next to the counter it describes, and a caller can tell a stub
> apart from a real counter without keeping its own copy of the macro
> list.  This follows the pattern of the other optional per-architecture
> hooks in util/ such as get_cpuid_str().
> 
> x86 and arm64 keep the same behaviour, and riscv starts running the
> subtest because it gained rdtsc() in the previous patch.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  tools/perf/arch/arm64/util/tsc.c    |  5 +++++
>  tools/perf/arch/riscv/util/tsc.c    |  5 +++++
>  tools/perf/arch/x86/util/tsc.c      |  5 +++++
>  tools/perf/tests/perf-time-to-tsc.c | 12 +-----------
>  tools/perf/util/tsc.c               |  9 +++++++++
>  tools/perf/util/tsc.h               |  1 +
>  6 files changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/perf/arch/arm64/util/tsc.c b/tools/perf/arch/arm64/util/tsc.c
> index cc85bd9e73f1..fd7fba50d0a6 100644
> --- a/tools/perf/arch/arm64/util/tsc.c
> +++ b/tools/perf/arch/arm64/util/tsc.c
> @@ -19,3 +19,8 @@ u64 rdtsc(void)
>  
>  	return val;
>  }
> +
> +bool arch__rdtsc_supported(void)
> +{
> +	return true;
> +}
> diff --git a/tools/perf/arch/riscv/util/tsc.c b/tools/perf/arch/riscv/util/tsc.c
> index 7cc4710ac38c..312b0c755439 100644
> --- a/tools/perf/arch/riscv/util/tsc.c
> +++ b/tools/perf/arch/riscv/util/tsc.c
> @@ -17,3 +17,8 @@ u64 rdtsc(void)
>  
>  	return val;
>  }
> +
> +bool arch__rdtsc_supported(void)
> +{
> +	return true;
> +}
> diff --git a/tools/perf/arch/x86/util/tsc.c b/tools/perf/arch/x86/util/tsc.c
> index 3a439e4b12d2..6c01e96b5c2e 100644
> --- a/tools/perf/arch/x86/util/tsc.c
> +++ b/tools/perf/arch/x86/util/tsc.c
> @@ -17,6 +17,11 @@ u64 rdtsc(void)
>  	return low | ((u64)high) << 32;
>  }
>  
> +bool arch__rdtsc_supported(void)
> +{
> +	return true;
> +}
> +
>  /*
>   * Derive the TSC frequency in Hz from the /proc/cpuinfo, for example:
>   * ...
> diff --git a/tools/perf/tests/perf-time-to-tsc.c b/tools/perf/tests/perf-time-to-tsc.c
> index f8f71fdd32b1..c91e22d93b53 100644
> --- a/tools/perf/tests/perf-time-to-tsc.c
> +++ b/tools/perf/tests/perf-time-to-tsc.c
> @@ -22,16 +22,6 @@
>  #include "tests.h"
>  #include "util/sample.h"
>  
> -/*
> - * Except x86_64/i386 and Arm64, other archs don't support TSC in perf.  Just
> - * enable the test for x86_64/i386 and Arm64 archs.
> - */
> -#if defined(__x86_64__) || defined(__i386__) || defined(__aarch64__)
> -#define TSC_IS_SUPPORTED 1
> -#else
> -#define TSC_IS_SUPPORTED 0
> -#endif
> -
>  #define CHECK__(x) {				\
>  	while ((x) < 0) {			\
>  		pr_debug(#x " failed!\n");	\
> @@ -49,7 +39,7 @@
>  static int test__tsc_is_supported(struct test_suite *test __maybe_unused,
>  				  int subtest __maybe_unused)
>  {
> -	if (!TSC_IS_SUPPORTED) {
> +	if (!arch__rdtsc_supported()) {
>  		pr_debug("Test not supported on this architecture\n");
>  		return TEST_SKIP;
>  	}
> diff --git a/tools/perf/util/tsc.c b/tools/perf/util/tsc.c
> index ebf289bf6b9d..815621b1d112 100644
> --- a/tools/perf/util/tsc.c
> +++ b/tools/perf/util/tsc.c
> @@ -113,6 +113,15 @@ u64 __weak rdtsc(void)
>  	return 0;
>  }
>  
> +/*
> + * An architecture that implements rdtsc() with a real counter should override
> + * this, so that users of the counter can tell a stub apart from support.
> + */
> +bool __weak arch__rdtsc_supported(void)
> +{
> +	return false;
> +}
> +
>  size_t perf_event__fprintf_time_conv(union perf_event *event, FILE *fp)
>  {
>  	struct perf_record_time_conv *tc = (struct perf_record_time_conv *)event;
> diff --git a/tools/perf/util/tsc.h b/tools/perf/util/tsc.h
> index 57ce8449647f..83e76b207365 100644
> --- a/tools/perf/util/tsc.h
> +++ b/tools/perf/util/tsc.h
> @@ -25,6 +25,7 @@ int perf_read_tsc_conversion(const struct perf_event_mmap_page *pc,
>  u64 perf_time_to_tsc(u64 ns, struct perf_tsc_conversion *tc);
>  u64 tsc_to_perf_time(u64 cyc, struct perf_tsc_conversion *tc);
>  u64 rdtsc(void);
> +bool arch__rdtsc_supported(void);
>  u64 arch_get_tsc_freq(void);
>  
>  size_t perf_event__fprintf_time_conv(union perf_event *event, FILE *fp);

