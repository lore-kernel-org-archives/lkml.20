Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26AE368D5E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788459437; cv=pass; b=JoqFegCgnYhD9mvnN+79Go2fBw9+F7CH67m5oeiR1qIV4k7MHNFcG2lJsYp1s3v2j/5i0BWDyZNfXKBP/6V+l2qVIUYQLBG+Ja8ZL4y4Mq0eM02U85u3b6ORdx5G8rUqmD8q26pYKTGl5IGcN4mLrzcXndF7B8W8wVie9NuLPUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788459437; c=relaxed/simple;
	bh=uvE5b/EiDpNgiR0Kg/L+ZSuEvfLCiq/r/YNySx3RI8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYpyNcJCqDanaPsbCFiOipZJN1bx+pH+kUXJPa4DVQMaNh1S/p+sveU397/W2YI76ezEWZwlzUv8aoumGhYkVchpLLPIB2grQ8qqr/az57Wi9XP2GRypZe1T51SlLXRgihSnB5THe37O4AKK0TA4BktP/Oo/Ofn1rU3oHwHxwUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=glfB8ogb; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="glfB8ogb"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so313231cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788459435; cv=none;
        d=google.com; s=arc-20260327;
        b=CVE19x0WTExNS/yVhFEoCkpC9OqCADfkpQi7paCCen5IgDOX36oqVs5X2rKvCMcaMo
         rnHbfJjm3ugk1BUs82/paEZ7lnXGzdhbNNe5XpgdKycVIbOpp48RBgxoi2k2pryCHJOd
         3G/myAQgkZUhJWezQFMTuBhkwSwFhV5eSFMFYRYTBXWwtWrorcZon7VLT6bK37y/YC0p
         MxNW+Z4xG82WUBh0OchjjKDXPmSYPU0vXoqHyDbxJ3apUiJTuuoLWzCbrxxex5rq9nMv
         AfjTD2DcHx0UUXlkdpgbe8VF4QIspRvtWty0aHOX0u5/Dm/2RQNgxj2vGssV9B9qTbik
         Cj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TYPdkHe//ABCrrcrY9PNffZ5lOpN9WmoX92PzRYdpRw=;
        fh=XaFjVacSJ0dl1x1ligZZHa2qLo8oQzb/d6IDzUfkfbQ=;
        b=FPfaEb43+EJRmTI6YiALnzRb66v3ff0CRDdJGQKUtxLDg68y6Fwcbuc68YIBwJrX68
         HMDzhXxS/1NWOj633UVe0fHZ/mFZeKjod3la/fhaqYqbA+dc7Ae4Q4EOWhCdJAjsU6Kz
         a9kF5TfgN9MNp0lQDHi74paX9BaGGiwz4O8+WJXN2KIA7jZyrDGeLZqI7YvMUVtZfD1T
         L0mq5ltWAdHccrpMarp79e83YQjqjQXCdPDBBbOu2oWIYBOOfiJbQLO15VXZBG06HJ2q
         +DBc6nJD9KFtHhyM/Kk0SAbebXTVm3hGEpssHHPk2FeAuU6eTbb3GDXd1TSTQR2ao3b4
         g4xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788459435; x=1789064235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TYPdkHe//ABCrrcrY9PNffZ5lOpN9WmoX92PzRYdpRw=;
        b=glfB8ogbiW1UrHVbhgTdWbl9g9W8SsJkTDLlIYtNd+PHpONFgsxqjg3QM9pLw5fQ1E
         cnAh5pjiwnHczQYIqu17zcG17LEGdwvdc79aoYHYzP9pqjCwO97co8JpY5Ri29WQycSr
         +sKnnXjHT10V/cF0xC3ROJwlN7gwC4XVFnVGtoa5j0NBFUKURTazcMWX0Y8CLs+wRurO
         5FJ2kC0bfaHRK29KcH89652PWKUqDB4nYAwrRtm7oHota79QAe7lD+TYv32muzDpzLoU
         TAhBXQqShVtyjQr7AUVdi2g+1Thd2OjmTmEHmr4awBOiQMJhvY/6ixfIWoquRZU28jRC
         LTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788459435; x=1789064235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYPdkHe//ABCrrcrY9PNffZ5lOpN9WmoX92PzRYdpRw=;
        b=gIOcldBm4+csGKBMvwWdzueS1i8emsXQWk+NCeuuBNKKfqPENc+pJWb8XsurczsywW
         sSzm9GP8BH3wwUxsTmX0ZLqmD9Fli8qcHBbwshalbFyQtAisOJaAXatw73L5gEDK9HKT
         hD9nL/EcwsA0Bj9TedPdqU7ji8aiOL5ZI/5IitRG7RgP5Nu8sa86WQ/VFrpkE2B9FGLY
         Sh36ZZGMiQtIzzPVDlMP6uqGif9m1Z69ZJ0WoNTg4A37luoHRZt7vkVQjAk9UdIq2Lil
         zHCFOgWNsvAp6BByFb16x3L3RBfYTpcx9/zSd5YOeKyp6ouhtjY+3RxvoQknAC4prBZv
         UaUg==
X-Gm-Message-State: AFuF++k/WN6RQsfFaZLSNIjHEzn6POYLHAH5dL/CWjJOAs7poo+LzoDi
	k5Lx6rHlQot1du2SQoZyhB3bbbpFJndAUGWe2LZOpX+tA2bqDW2INz97f3G/SqEorkxFviZ/usS
	+A0fagjELKXGtuOBc8wWZK+NA+x9Euf85NroZwMJodUJM9CBGMf6+N0pR
X-Gm-Gg: AYBFou3OspB2Ki2NiOm3oolv7rA/Z/FupXAblZrOXSB4aahioQm6ZdBTRpkUepqvjrL
	M/OKgkYWYurvg43e3m2UspltLGtyoqxqkm4wQWdN1jMY1GSIHyN3JF7VOwg01SW+V4HTVirRU3v
	3HJFlDHxgB9BblaOs4rOvjFMrh4VJKyfsnAQD8Y7Nye2mP80cwoNCiUxAuQbkrpFN2djzEyaNTR
	X/Pr8X0P/r7kDNn3FBim4s57aZUuM5kfG2HG4+mAQRMHapzcRBt7xgM8vucgetNzaZ7QzLnu3nX
	FSizY8s80roZed5DJFxN0rbi9AbQNn1CyovTGwCmlInPh4gd0DVoQC4Ay7LHgaSdkjdFJ026+Rk
	=
X-Received: by 2002:ac8:5992:0:b0:52f:4a75:f840 with SMTP id
 d75a77b69052e-53055567dccmr83931cf.9.1788459433648; Thu, 03 Sep 2026 11:17:13
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903073554.1300334-1-tmricht@linux.ibm.com>
In-Reply-To: <20260903073554.1300334-1-tmricht@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 3 Sep 2026 11:17:01 -0700
X-Gm-Features: AcwNN1Wj7onVlAWq82ttAz6rRWHfVF4Ef3_xa9bxcnd8LJ60UxXFqlzVG2puzko
Message-ID: <CAP-5=fUtW=EfB5SOt8iCSsyt4pg_2NhoWvTr=Qf5vEKU5CwZRA@mail.gmail.com>
Subject: Re: [PATCH v2] perf test: perf stat tests fails on s390
To: Thomas Richter <tmricht@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, acme@kernel.org, namhyung@kernel.org, 
	agordeev@linux.ibm.com, iii@linux.ibm.com, sumanthk@linux.ibm.com, 
	hca@linux.ibm.com, japo@linux.ibm.com, Aaron Tomlin <atomlin@atomlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:36=E2=80=AFAM Thomas Richter <tmricht@linux.ibm.c=
om> wrote:
>
> The test case 'perf stat tests' fails on s390 z/VM machines. The
> root cause is the unsupported CPU measurement facility on z/VM.
> Therefore the events cycles and instructions do not exist and
> are unsupported. This cause the subtest
>   Hide zero events stat test
> to fail.
>
> Output before:
>  # perf test 116
>  116: perf stat tests  : FAILED!
>
>  =3D=3D=3D Test Summary =3D=3D=3D
>  Passed main tests : 0
>  Passed subtests   : 0
>  Skipped tests     : 0
>  Failed tests      : 1
>  List of failed tests:
>   116: perf stat tests
>  #
>
> Output after:
>  # ./perf test 116
>  116: perf stat tests  : Ok
>
>  =3D=3D=3D Test Summary =3D=3D=3D
>  Passed main tests : 1
>  Passed subtests   : 0
>  Skipped tests     : 0
>  Failed tests      : 0
>  #
>
> Fixes: 64724095a33f ("perf stat: Add --hide-zero-events option to suppres=
s zero-count events")
> Cc: Aaron Tomlin <atomlin@atomlin.com>
> Cc: Ian Rogers <irogers@google.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Signed-off-by: Thomas Richter <tmricht@linux.ibm.com>
> Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/shell/stat.sh | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tools/perf/tests/shell/stat.sh b/tools/perf/tests/shell/stat=
.sh
> index 298ce454b45a..1f5d4cc05807 100755
> --- a/tools/perf/tests/shell/stat.sh
> +++ b/tools/perf/tests/shell/stat.sh
> @@ -583,6 +583,11 @@ test_hide_zero_events_stat() {
>    # Check that --metric-only works with --hide-zero-events
>    if ! perf stat --hide-zero-events --metric-only -e instructions,cycles=
 true > "${stat_output}" 2>&1
>    then
> +    if grep -sq 'No supported events found' "${stat_output}"
> +    then
> +      echo "Hide zero events stat test [Skipped - events not supported]"
> +      return
> +    fi
>      echo "Hide zero events stat test [Failed - metric-only command faile=
d]"
>      err=3D1
>      return
> --
> 2.55.0
>
