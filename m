Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249584FDA41
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631130; cv=pass; b=PwavH/BEdHhQu8jAHEU7ZQL8jBFBTuhQKx8v6lNH8IsjopkucwJ7LcdgvYXX0sxwTHgHnnpLBS7a35xHKW5UZvQqOHlzX2nYM8eJEHQlWAHBEUCkNq/f2+zKya9PE4cSckZG2+TJbf4Nn8OU32CGMZLnrq5EU0VJ9pZMLPJg9vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631130; c=relaxed/simple;
	bh=p1RBWTYNXB1ayt1mjn73C403W2YSUfo7GSBkq13gnuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMRqqiiumFucv5hxlMG0IRFLxbLuNP/vj0ERxOVe4Jx/MTuKqF5Nk2vViIPfTJG40GzVsbwRkYDqqYU5PZEnzXlAPQNRgG7lB8ucfiQkQAqP6zHrTM8Is9XPteCoxjIT16o5A572TDMdS2bRcuu18zqsBHzABo8re8baRj9PQKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M+dg0mRb; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M+dg0mRb"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d3b445a84fso10625ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790631124; cv=none;
        d=google.com; s=arc-20260327;
        b=HgetnDvO8IYV8WwPV7WGFQjlwG0m+1/c3cEbKjxIi3CddngBZ0rinyLISF4u0ekcfP
         JTE0heF+/WpclKb20U/KVfPcruiTgU58AbLsQYRGeEzYQhxwd1ufJdN6rnkvmeyV5slA
         kOwA8YlDalkwtN29ifgxhnTsMNh52W3rBiaG8ygU/hkUoC18QQGutECNeW/maijqQEL7
         rsOgRYHGf+HHimv+vdwOQTjQ3Dwmo2Qvv6QA41ozFVVqP06uhRmukx/zm9n5rKGK4Fey
         CKKf5qEqwxZiA/gAySDlAYo5rsDqnu4UEC1vxVHUJbMqNqVhdPhN7fj860eABaGVv4NF
         jLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+lE1VGJm7uxmdcjGqZxkzLy2YHUwYwaDzNyp54coWZ0=;
        fh=ssmtYQ7cxzzo07KhfMMSQjJxwWOJxo/3xC6Mv92lero=;
        b=EFw3Ix2FL3SO2gb2NCarHKliS0yLPVcYlZ1t2OZu7oBUVHkAfDgBQXnEucQoQgh8A3
         mDKEOcV5WzDwrgRkx/77SchcmlVcJ8j4dp2cuW5PmwAVyozN45rRvTfM1XbL6R0qoBP3
         65tdhhG+J1ebXGFmachsR/5qJFXqh8gFm5SgkjrxwUAQpldclx001G7rdH8QBau6sUB8
         G1UE7P3WlTp+faZiQ/CcNcHkRZu1mXZZMwii0FG9B59hF/qdR1bu8cVsqCZBmHdVspYZ
         aqb/BDmCd3NPMAIVNlo+Vb4xv4RGJqjaAj84NYCltNpwm0qvXvavBkmZci54ys07Szft
         pPKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790631124; x=1791235924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+lE1VGJm7uxmdcjGqZxkzLy2YHUwYwaDzNyp54coWZ0=;
        b=M+dg0mRbsyQ/tPSCr+GFl01fo1ArXZ//eEh0Nsa+XUexwNiHZZiFRJjWJKFkqajCqN
         08DqXy7WyKldSY60pd4HEjPJjeqsZvvXN3d4Lr13baXawHnSSnQdOM46iXCCK9uoJRyF
         bDftiJqY6j/eLqMH17O1VcAoIQ9w9lSZI1d4VkPFFm60+DC8gXtaM8LrWqJMCJ2MWubN
         m7WkYMjiQyfDZjZcM0B9IMVuCc+EO77nwHeiEq/wHx3jH+t8fkPfD/V80jBnRpGdJjv2
         qwSbfnEXBwKhW/4DiNPrOH8AYIF7HPZKGSgGmo/lcwEIBuyA8IxHtgO7cN67o7m1NSQ/
         BzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790631124; x=1791235924;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lE1VGJm7uxmdcjGqZxkzLy2YHUwYwaDzNyp54coWZ0=;
        b=YGRLNByFpJ4sBKCFL5o4l7bTyH8RLkN5w/+kXEnwGLcmuGcqGHX1DjiyL7BM26yOH/
         fiPd7lQyvugfP9mxUw/TOuPWQrv5GNu2TTwNIFyQECB5BRXd9RvR7RmXxnJ8yCqgrJKU
         Gwc4Vr+KnD1KDWrP/coHfY2nXdFNntRv52wxc9RZAO4DDIw0UIVajJcTydpg+RcWR2RM
         MwZhiRxCzeO+OdMH5mO0v1zdMt8JGfwQorI0N74iKgLmDWoXnw6RrQhOGLPh5llWxXVk
         SjztZA3j9MHllfTW3bKDrdLFcSNchOXaGUimtnhN+PGLtQdzfGEKYCjgIuq8Oe1EgMnM
         i0qA==
X-Forwarded-Encrypted: i=1; AKwUvBz1t0DNXBA1PG00zQQHVo/9A8KP/BwttMHfp31+Su/FSQO/9BQIZ8SsWVosfGi3ZKfnWp9Nu5ftQP81Ikc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIq6kbvUq7gHJt6i4p0rv10RBFF99yqsFxPX0PmGWcozQ0KH2jO
	d+NSI4xsIGyYiNC+OGtL1nQbno0iVezuTCZ8mEtcFwKA9Q2jWRJG9Z/2yTHp84yloLZ533OEwMU
	LyMFPoeLn7QqFYWY6aRgHuECZOfLi1apdwRkmpchm
X-Gm-Gg: AYBFou2oD+YyitZNnxkjQlz+jIstbErjt3tM7f7PgqMheO1HF4IAnJiatGetiNbw5Ec
	AfIV9STiLfwX2zAY8Ofxu+9/jgx2ZYXVa55ZLwoc9C771Xog7QnU7yPm2ZzUvsGQeQhq0M+SxiF
	6zsLku4yEkkvo/pd8Os2uEz5W9mPqBjh1bFLH0w2GK1X/VK6Cp0FtqIGtRTUPzDp7T6w+miDHH9
	A6xPCoQ0uiZlEUWPh5tof7FVE77tROXGxVa4TxWQADPk6WKiXVvBTUbSxm7KfX3kpJtE1r9Eo6I
	eXPuM2FXeuSak4vfomXBu0q9UCAYLWd+mZt183SMeJ2aJxz2H/UfqCw7qMl8Y9pIiY1XAYsuH4x
	3UOoLQ1znqA==
X-Received: by 2002:a17:902:e551:b0:2df:9957:d1bd with SMTP id
 d9443c01a7336-2e2c7a2d7ccmr288835ad.18.1790631123861; Mon, 28 Sep 2026
 14:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928010227.1903673-1-michalpl2003@gmail.com> <20260928010227.1903673-2-michalpl2003@gmail.com>
In-Reply-To: <20260928010227.1903673-2-michalpl2003@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 28 Sep 2026 14:31:49 -0700
X-Gm-Features: AclHuK961jia0Cign6WJrnpm7yNwXw1WkLXNkziDawCLyR5WWyWV5QS-KMIVEBs
Message-ID: <CAP-5=fWs6xu53uBqCpWvTtqSAx+kySoMM06pbJyaNa=L_7evQg@mail.gmail.com>
Subject: Re: [PATCH 1/5] perf test demangle: Fail when demangling fails
To: Michal Pluta <michalpl2003@gmail.com>
Cc: acme@kernel.org, namhyung@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 6:02=E2=80=AFPM Michal Pluta <michalpl2003@gmail.co=
m> wrote:
>
> The Rust and Java demangle tests only log a NULL result from
> dso__demangle_sym() and carry on, so a symbol that fails to demangle
> doesn't fail the test.  Set TEST_FAIL.
>
> Assisted-by: LLM
> Signed-off-by: Michal Pluta <michalpl2003@gmail.com>

Fixes: 07f2b1287c97 ("perf test demangle-java: Don't segv if demangling fai=
ls")
Fixes: bdf05ccd1841 ("perf test demangle-rust: Add Rust demangling test")

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
>  tools/perf/tests/demangle-java-test.c    | 1 +
>  tools/perf/tests/demangle-rust-v0-test.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/tools/perf/tests/demangle-java-test.c b/tools/perf/tests/dem=
angle-java-test.c
> index 0fb3e5a4a0ed..a8eb0f4effad 100644
> --- a/tools/perf/tests/demangle-java-test.c
> +++ b/tools/perf/tests/demangle-java-test.c
> @@ -33,6 +33,7 @@ static int test__demangle_java(struct test_suite *test =
__maybe_unused, int subte
>                 if (!buf) {
>                         pr_debug("FAILED to demangle: \"%s\"\n \"%s\"\n",=
 test_cases[i].mangled,
>                                  test_cases[i].demangled);
> +                       ret =3D TEST_FAIL;
>                         continue;
>                 }
>                 if (strcmp(buf, test_cases[i].demangled)) {
> diff --git a/tools/perf/tests/demangle-rust-v0-test.c b/tools/perf/tests/=
demangle-rust-v0-test.c
> index 904f966c65d7..ee4ddb61174b 100644
> --- a/tools/perf/tests/demangle-rust-v0-test.c
> +++ b/tools/perf/tests/demangle-rust-v0-test.c
> @@ -58,6 +58,7 @@ static int test__demangle_rust(struct test_suite *test =
__maybe_unused, int subte
>                 if (!buf) {
>                         pr_debug("FAILED to demangle: \"%s\"\n \"%s\"\n",=
 test_cases[i].mangled,
>                                  test_cases[i].demangled);
> +                       ret =3D TEST_FAIL;
>                         continue;
>                 }
>                 if (strcmp(buf, test_cases[i].demangled)) {
> --
> 2.43.0
>
