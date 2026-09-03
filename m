Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ED138F255
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411869; cv=pass; b=uYd1dkYMhrXl6o/ldK6/x/8TonSMSY+OhUT2QZjAV5/4sxWDCUxh3Q/EONF0kJYvCU7pEO1IH0ZW9OSgUilydtc6cuvf7vss4qE3cH6/D8EGyIKaHkix2wa6pQobTD80bQZJ2r0vAI6Evk6FGuBW+Z9aNT7QXl/eFE79Ebm1Qqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411869; c=relaxed/simple;
	bh=sgnNYk9h4pIk4/DDM5OnPDb+W31jLGx6uPQ1r12d9qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZaMeSUco71WqUdGkqPN6+09pECWwFQS37xn6nrETuYmo8WXpGUmIcMi71V9WRpb03+HlGY1AW7RcwmfwDHVIc/BTnGUxZunhfVGX+Dx74REfBougP65QVrC57YQX0tA4TOcxAZYyBBr+yFATvqIxOz4QZH1MypV7WXWhzpqlys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NvqnI8zH; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NvqnI8zH"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so64961cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788411866; cv=none;
        d=google.com; s=arc-20260327;
        b=jhvcFkRd2PSLk7L9S9CtGdssupE3JGne+tfxubLAEEV8KlO4LWc6diSXOypdp0uGaN
         d59YK/cb1UQ3iXoxd7Mvn/w7FmfdWG0W4bDal8knAX7PomhkLpf1CPCJmUmhBkMyTruU
         mw+PJP59AMpf5BohYNyBrAAkB6vQR7/NLIW8Jk5Iv3ATuLW9PlB4lWBi277pRFFHdtdB
         ch9gvs/ILCelSx6LXBSU9wJhvTnQ00kd1NNDf72BTJES6epjzjmodXastsz0KIKxsMfs
         Jd7nfWxvzmrFeOEKUlpld8AWPq8JwS5jDUJKLjjpoPsgkCd03JaeOcDv1Z4EnKdN4PFd
         sTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KPklHbxXeJDxNdoiQqefpW644DYAeavucLCni6Pnx4I=;
        fh=cPjjEBl4l0J3GkkjimN8Kvjts6u1/khwOsyc1Wg7mq4=;
        b=KwDYmQ7QjzPnubLAdirTOt+WkHPJ+15kNlxxIThKqIpWjrGrhqpPbjGhpnGMNEHxn7
         6BnZycIFg0JhqTZPuUTQTz4kTX4zVrQTQ51QqlI+4w8Vr+/85629y9Rr6Zs3hH2AB8rw
         HTgSALSA89LaWrv9BkCmayweT5TnA0x90+SskvQg5exCyeiVqu+76gBEcnlPBjLcbU1X
         RBmZ9eUBtPuiHhTpa1H68k7Ihu/TxqSbFdqZw0U5bNlcJlQ35Ba+o2m8ZdC0Sgb8YZRS
         HLMKsr1IejBFeAQGkUV7e8LGZK/N1jlnxg4u2FO8uY0yrimH/4LfK0JSN1vsLuYYbqBb
         XXgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788411866; x=1789016666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KPklHbxXeJDxNdoiQqefpW644DYAeavucLCni6Pnx4I=;
        b=NvqnI8zHm4vu/modJxNV6hv9e5OHlBSLoCaC75QIhr1jz9vKbaviy6DoxZBwSBA2xj
         OS8RJgy+7fWmPAghHn1dZx2DOqODzHt6b6BIsKZplkmicWJ7qxUqa3oN0JJuUazWeAfG
         cPIc15UUNBDC2egC9o4+7YUW4n/9Al29+AnPib0FZSmu+YcDdiBPXx0A88bZoO9L8OMg
         zlFRW2g0F+vaVFHcKoNp+t66RS9h6/cGZv3HDQkcEKW7BkAmZO9wt2k36iTv858udJmx
         a+MPUpCjuJQaHG9EyhoDLv+UuOREgKCAIarZW+WNBYlD7YzoLs2QtSHaWNDGx3hxVp3u
         sT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411866; x=1789016666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KPklHbxXeJDxNdoiQqefpW644DYAeavucLCni6Pnx4I=;
        b=NukTfmEjT5iWtVK3uSIxIB9jjz/ITDtwT5mpWIf27XQHCA2wWjZ4DZL94xPlCztQ0B
         tT/j1DfPHpxtNyHxDJW9Iylect83O5jM4lH9URS1i0ktJmLPW5epc5TbdeWGUDwCsp7l
         VaiZd+BfmdHmkWm8koYor6S2z3x7CdPR/BMKnkgc5M2+C77p09+ThaW17CajEiNZQTgo
         pwRq6x3zqsVoql8Y0kIlXzn/l/OJYwR1FnVRQBt1g/x/7WtRegdv84JH7epvoldC/nrw
         81OElgA2t1dWPI31pdGyZyObABKlisVoNbYVT/DAfKWaeZBZrkxbSKxC0EtpngZQmptx
         hs4g==
X-Forwarded-Encrypted: i=1; AKwUvByurzWcT/RHzKPHcjna0xaVZO0yKQ74z1tnz+tQwMc1EAO6nnQH8+G16Gu5jO5z7NL7ckgo12pI/tJtwls=@vger.kernel.org
X-Gm-Message-State: AFuF++mdFE26l41d/YknuoZH937tY8tc094fVDUphcX2C601eZE8X7sb
	kq3tQnWT2u2K+Xy8uSMvBRlCmnTdOtt9xoKyoJ03l/7B5kYXqt7W1zHW5EosRiQIn4gg0aP9Tc6
	war2vFOqicHMPpFQ4d7idtHydmu2dw1HhuzI7soJz
X-Gm-Gg: AYBFou1qPpAX0jyjUmlxz93RJ+eDrMtImNVDQCcHbgo4BiCN9BvSvixYJ6SLp8iJAV+
	McfhVUhJL+znmKv/jZLcEuUEOztj64IBGjdG6PhYYAhne8tcr4QcTQbWxMmQvL7Dui1u92kS08S
	riKTGS+Sc4uPCj9S5YTEg0gvtvhm3iBe7WAxxx7IJHYVbDqskHWEfUj5c28c8oqJTa7JUiJT512
	/zefvSDsQUyBC54I8PcEH12cRfVnKgvB95v7TOjayP6Vieygu7hJxSEoFGDWnFp4fMmnTxnSKms
	z2uRYrV+Ta7a+Smnl3letiWjKGHfPyhhINh3+60m0rC4gw==
X-Received: by 2002:a05:622a:a0c:b0:530:2f98:cebb with SMTP id
 d75a77b69052e-53045879fdamr7780491cf.11.1788411865734; Wed, 02 Sep 2026
 22:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902093210.3571958-1-nylon.chen@sifive.com>
In-Reply-To: <20260902093210.3571958-1-nylon.chen@sifive.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 2 Sep 2026 22:04:14 -0700
X-Gm-Features: AcwNN1WOa23S96LNVp309j3VaLFfZ9MpfJyynTE8hrogcm-8TGXhXoba-fFjNmc
Message-ID: <CAP-5=fUzqFPfN+xH8uqERugK9xsauUoxZTVr+YLGGXVRi6UC9w@mail.gmail.com>
Subject: Re: [PATCH] perf bench futex: Define SYS_futex on 32-bit arches with
 64-bit time_t
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 2:32=E2=80=AFAM Nylon Chen <nylon.chen@sifive.com> w=
rote:
>
> The kernel does not provide sys_futex() on 32-bit architectures that lack
> a 32-bit time representation, such as riscv32. Consequently glibc does no=
t
> define SYS_futex there, only SYS_futex_time64, and perf bench's futex
> benchmarks fail to build:
>
>   bench/futex.h: In function 'futex_syscall':
>   bench/futex.h:77:18: error: 'SYS_futex' undeclared (first use in this f=
unction)
>
> Define SYS_futex as SYS_futex_time64 when only the latter is available.
> The guard and its comment are taken verbatim from
> tools/testing/selftests/futex/include/futextest.h, where they were added =
by
> commit 04850819c65c ("selftests/futex: Define SYS_futex on 32-bit
> architectures with 64-bit time_t"), keeping the two futex userspace heade=
rs
> in sync.
>
> No timespec conversion helper is needed on top of this. glibc lays out
> struct timespec on 32-bit architectures with 64-bit time_t as
> { int64 tv_sec; int32 tv_nsec; 32-bit pad }, which is compatible with
> struct __kernel_timespec, and every futex_wait()/futex_lock_pi()/
> futex_wait_requeue_pi() call site in perf bench passes a NULL timeout
> anyway, so no timespec ever crosses the syscall boundary here.
>
> Note that an earlier and more ambitious attempt at this was
> commit c1ff12dac465 ("perf bench futex: Add support for 32-bit systems
> with 64-bit time_t"), reverted by
> commit ba4026b09d83 ("Revert "perf bench futex: Add support for 32-bit
> systems with 64-bit time_t"") because it included linux/time_types.h,
> which is unavailable on older distributions. This change deliberately
> avoids that dependency and adds only the one guard needed to fix
> compilation.
>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/bench/futex.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
> index fcb72d682cf8..6df8837b365b 100644
> --- a/tools/perf/bench/futex.h
> +++ b/tools/perf/bench/futex.h
> @@ -14,6 +14,17 @@
>  #include <sys/types.h>
>  #include <linux/futex.h>
>
> +/*
> + * SYS_futex is expected from system C library, in glibc some 32-bit
> + * architectures (e.g. RV32) are using 64-bit time_t, therefore it doesn=
't have
> + * SYS_futex defined but just SYS_futex_time64. Define SYS_futex as
> + * SYS_futex_time64 in this situation to ensure the compilation and the
> + * compatibility.
> + */
> +#if !defined(SYS_futex) && defined(SYS_futex_time64)
> +#define SYS_futex SYS_futex_time64
> +#endif
> +
>  struct bench_futex_parameters {
>         bool silent;
>         bool fshared;
>
> base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
> --
> 2.43.7
>
