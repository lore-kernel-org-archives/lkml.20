Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2893AEF51
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790221513; cv=pass; b=PRIsxzKEzF3WqhhVv0k2Kg7FPu0HUTTFpBxzeFCVXQBtlJHgVDWSIVaA8oqxrkOdO7YmHQGm7+e6gSejkRc13CVJD4jk/07s52VMCZCwmfSaAQIfOIdMFmygLN1K7Gb39U3q4HIaVv5zM5pqiP7hLl5mHf2jMazdsWkCrxyh/Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790221513; c=relaxed/simple;
	bh=cblw2L3Lly1bfOrTwtv9wwW6sp0Yy1Z8DPipd+koq/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhEZCH0lNrg215504AOWZQJjSp19BAQS+uImEPiQDhrqnSF9xv0Q0+8txfI4yafm73q8dROb/ItCYfuTwIhbXbQAkhOaijL243KGYMTNOgK3ypCe+2wAi6wpw1XLxNNoMBOJufaq1O8fqVlhkF88+AOJsM021BerlytxojdJEJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rkzqr21B; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rkzqr21B"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-532e9ad9a1eso92291cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790221511; cv=none;
        d=google.com; s=arc-20260327;
        b=AIzJTvWyYmA+fjKrBjaMUZ0F09XCBlBXABCsGLcRFcaSGlY8yIH3KvjTkmR71Gj2D0
         GF78jncdbn1WT3DvANJ3Q4f2fxxGTtsIoU4icdXKBpxsarRnE8mcU1anEOcK9Ws+d072
         gei0j0OzZ+vaHn1xhOB9YA/emt0rm5eFh/0OZV/ghtAyl0NnJNkthUGGSupcK5GOZlAG
         tBd9GRWOtxWeHcwdNqi4v+le1NYHy1kfmuqG0hKy7znYPv0OpReu0WTYMzMZ/cPG8LCi
         2GH3V4wMzvKo1sG+FhLGtSMF2PtEGoGDD/MA17qn6PHUk22v7jTxILol0ArsauPhDXmx
         4SjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ahhn9Ixub6HpvaUVFMs+V5RjUmob1chtIW49SrIC0gw=;
        fh=GZjtVylvzqRJtxB1loFdTZVszkMyKlnhG2MIybiSOgQ=;
        b=qIjIB4Ua/Z4x4U3vYEqsTfF/YurjOpGLusbulWlAOmPY1TLhQmp8041awv32c5l7Yv
         OZgaZJXr1wt6N6FiiqeHVxG2G5wfDgVeKYqpSElRg/HJiRJVa9Iu5YAZ3pYiqetcef10
         N5wRhQMdkUknqjbLluOHA/FodP+bPMQayAk2oDT1hpHc6mhJc64i7cXLvuw9n6Tym7Wq
         Ns6vWhybcW3sMOcPuzcUXw1AEn6IxCWiqGju4wFco+jzCLaMRQVy+ABA3Ao5fydQ7mmo
         sT5XCBRTmbYqOmcci47Sfg9tmtsd96wf2z++cAEli3SZvMSyP2MBOqC/hFGnkTA3QcKk
         VjkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790221511; x=1790826311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahhn9Ixub6HpvaUVFMs+V5RjUmob1chtIW49SrIC0gw=;
        b=Rkzqr21BXUEH41KA1oJGegWvKIAiaehvy0nLj+ForWDheLmbjjuE36xIzMidJqX3/C
         zfgq39FgCFKXIKMaDhScnWwNR8zLHWi/vX7qAsYAvp+/Ihss/rtrtAnogkvJUekEeTn3
         C9QNTO/iUJzBthjaN35c0urvJLyZ4nE35Ul80pfKi7DpJQwKX4GLuT5p1bffSefU9RkJ
         AeqJRC8g20Ullm4E50z24JDHzHNAf1yh2nSyT37jBdqT7p9z9TDOxQR/rbO21XV7jcf4
         UTuj2rKqg4qiFqGwPCTGSpP1VRoMmfOriQYoqegHB2whPXz1i986KqZrFAUM/CTNHnyd
         aXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790221511; x=1790826311;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahhn9Ixub6HpvaUVFMs+V5RjUmob1chtIW49SrIC0gw=;
        b=2y9sWj9d0lNH+yQDyS0DZr2k9KWbhho4sHRe3vF496alRbDzIDNuTrM+/Hx+6s7Zpd
         61wiKfLuHcPE0euKeZcO3cyUNRpG3ZI6MMaC9ymqtQHU5EbKsuYQO1p/nHld98hRS9jL
         oEbTjuP6HYI+/1OLi5agVitzOgasakr+9aB2E1KanCkUZB6xjv2/tcNlxDtDuPiNKOG1
         pEtFJ0CbDRqv6kZ2djdjeK49ujZkDgOVXR2efWBjvPKl1ybY4Dq+7m1YgIOx+1RQLhwj
         ZxPyyGRdpsK0vLL8GmkL0zWhdP/Np0gVQwzKxkdOJ8PNNfpEQvbimVdsj8SsJ+3ufVLO
         ulbA==
X-Forwarded-Encrypted: i=1; AKwUvBzIEZw37M7RrjTJmTDYfP4/b5gCwPI1WqN2sSwUuM7b9hnGKqhWyDlAIwoyVoXunuoOkD4rp1ToZYijMX4=@vger.kernel.org
X-Gm-Message-State: AFuF++mYKesn0dCt01iy560wtfRlifD8b/1bdy5X/wWwAVTTI4UDlXcT
	PUfvvgbE4GK8cKM5Ss1lks7UfJkGxiIe2Mq+p/w9XNTfGh6qPUensuScKvFO13aH4cdS5VRA2AG
	AmkcCqyLWKSH9Q+UO/vja5T7MFPEh8f4DwlMmduif
X-Gm-Gg: AYBFou1KWtZlSI0it4j3E9fVC/ZcIXN4oWqHX2gZop5bvfEFZu2ipgBegUqixFa/rtC
	3OCYmEV1WiUawB5yDhCLDKARbX8SNqV2kIKiYIwCv0z9Zs1RFdB+YjxGnSBBIxjiF27glSgazM5
	CVdqMoRq9v4uffoECbvHIufnmmBCoDtoxFyCf8cHFjbp5gKSLX0fmurqAh8g0mDnTbkVe6Bm2d7
	uy96bTxswlG3gty9bBkiv8pujQbiTRTZPXa72GEqAyhrBY9HdIZ4vozM/y31//m6EfZeK+emev9
	fbHToIuiiRuvg8Nwsl+CeOxf7zxJgJ8sA6DKYxKHJ/fsGtfNBMweDac=
X-Received: by 2002:ac8:5907:0:b0:532:ad75:e432 with SMTP id
 d75a77b69052e-532fea67702mr2347951cf.8.1790221509874; Wed, 23 Sep 2026
 20:45:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923215255.3329181-1-namhyung@kernel.org> <20260923215255.3329181-3-namhyung@kernel.org>
In-Reply-To: <20260923215255.3329181-3-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 20:44:57 -0700
X-Gm-Features: AclHuK9-SW3SsPxggKRW-bBT7Xws5jnPdZXD9H9xBhIitaeMKg6WFdky4YeB22w
Message-ID: <CAP-5=fWX_LY-0de0=LPc2wPpvu7L70LL1zh0aocxGLopbWMqfQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] perf test: Fix record tests on hybrid machines
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:52=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Currently the leader sampling test looks for "cycles:" string to match
> the event and retrieve the value before the event name.  But it won't
> work on hybrid systems as the event name is different like below.
>
>   $ perf script | grep -m 10 brstack
>       perf 3322152 1873980.978431:     625379 cpu_atom/cycles/:      5582=
00cc40cf brstack_bench+0x31 (/home/namhyung/project/linux/tools/perf/perf)
>       perf 3322152 1873980.978431:     625379 cpu_atom/cycles/:      5582=
00cc40cf brstack_bench+0x31 (/home/namhyung/project/linux/tools/perf/perf)
>       perf 3322152 1873980.978598:     612177 cpu_atom/cycles/:      5582=
00cc4082 brstack_foo+0x17 (/home/namhyung/project/linux/tools/perf/perf)
>       perf 3322152 1873980.978598:     612177 cpu_atom/cycles/:      5582=
00cc4082 brstack_foo+0x17 (/home/namhyung/project/linux/tools/perf/perf)
>       perf 3322152 1873980.978762:     591859 cpu_atom/cycles/:      5582=
00cc403d brstack_bar+0x0 (/home/namhyung/project/linux/tools/perf/perf)
>       perf 3322152 1873980.978762:     591859 cpu_atom/cycles/:      5582=
00cc403d brstack_bar+0x0 (/home/namhyung/project/linux/tools/perf/perf)
>       perf 3322152 1873980.978948:     628505 cpu_atom/cycles/:      5582=
00cc403e brstack_bar+0x1 (/home/namhyung/project/linux/tools/perf/perf)
>       perf 3322152 1873980.978948:     628505 cpu_atom/cycles/:      5582=
00cc403e brstack_bar+0x1 (/home/namhyung/project/linux/tools/perf/perf)
>       perf 3322152 1873980.979146:     669816 cpu_atom/cycles/:      5582=
00cc40e5 brstack_bench+0x47 (/home/namhyung/project/linux/tools/perf/perf)
>       perf 3322152 1873980.979146:     669816 cpu_atom/cycles/:      5582=
00cc40e5 brstack_bench+0x47 (/home/namhyung/project/linux/tools/perf/perf)
>
> But we can control the output format of perf script using -F option.  So
> we knows where the period is in the output.  To filter by symbol name,
> "ip" and "sym" fields are required as well.
>
>   $ perf script -F period,ip,sym | grep -m 10 brstack
>       625379      558200cc40cf brstack_bench
>       625379      558200cc40cf brstack_bench
>       612177      558200cc4082 brstack_foo
>       612177      558200cc4082 brstack_foo
>       591859      558200cc403d brstack_bar
>       591859      558200cc403d brstack_bar
>       628505      558200cc403e brstack_bar
>       628505      558200cc403e brstack_bar
>       669816      558200cc40e5 brstack_bench
>       669816      558200cc40e5 brstack_bench
>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Tested-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/shell/record.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/re=
cord.sh
> index 04df35b30b0c15fd..fa8d17e389a0116d 100755
> --- a/tools/perf/tests/shell/record.sh
> +++ b/tools/perf/tests/shell/record.sh
> @@ -537,7 +537,7 @@ test_leader_sampling() {
>      err=3D1
>      return
>    fi
> -  perf script -i "${perfdata}" | grep brstack > $script_output
> +  perf script -i "${perfdata}" -F period,ip,sym | grep brstack > $script=
_output
>    # Check if the two instruction counts are equal in each record.
>    # However, the throttling code doesn't consider event grouping. During=
 throttling, only the
>    # leader is stopped, causing the slave's counts significantly higher. =
To temporarily solve this,
> @@ -549,7 +549,7 @@ test_leader_sampling() {
>    tolerance_rate=3D0.8
>    while IFS=3D read -r line
>    do
> -    cycles=3D$(echo $line | awk '{for(i=3D1;i<=3DNF;i++) if($i=3D=3D"cyc=
les:") print $(i-1)}')
> +    cycles=3D$(echo $line | awk '{ print $1 }')
>      if [ $(($index%2)) -ne 0 ]
>      then
>        if (( $(bc <<< "scale=3D4; r =3D ${cycles} / ${prev_cycles}; r >=
=3D 0.99 && r <=3D 1.01") ))
> --
> 2.56.0.rc1.310.g51773c2048-goog
>
