Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587541;
	b=LK/GNAZpKBZR1rnYLTWUaezBWZ4x0WCkGmHVvRFBxffKj5zVC7TRsi9q0KpMhyL/OyxU
	 GyjMVUkKffmAKgXTMaUtF1XRrnQKoswx6nWAdMZnpXHjnV4bIGosew+WTxlgAp/TC2Fsh
	 t+XV/CmEwvQJiJmb9IseszH8IInkx15Q+MosrU5XGe3Soau3INghOtFuwF2iZu6pUYmNm
	 uWXNogF3JM6OzV6TiJXfpyxejbvJrliAPPjP8B4rrTheHteVR5SDitGT9iSuVbWgkC9Vo
	 icGb3A/+4CawXGy/55r4Uc+0k1uhUdNn8LKbgQKP6JQadWAqWMB3GWFMNZNODWMH8Dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZW/ulXbPYhjI2BnnmxNm9CpFmpm9yyYOMi+EkQ8/Vcs=;
	b=HRMAfU+T9vSSYMwhoYorCrbywqT2PDz13IroarWFzPC8tMObeFRe9kg1YUeadiG3K4kt
	 +KlEyQCpJfSk8w9ze/WmPGgjLr4kzJU1OinjsmV93NSfVOMVa7Pqefb91ijpQS1b7SVQa
	 OTisyZ9lsN1A7G5T/ZJ6v4ZXZVPbyCIG6LMSfHc/UJkkFcgvIaUsHQbBYXAqVghaq0Ar8
	 7IpofAFkmrciKmzx4lvZTaksGPUNsSBaiJk2iVj6W/Lh7aFdyQ4SPg4+p1qp9s0Z6664y
	 o/UpGBuL9XJ6QP7JeKP5ifcBVjcc45DJGMQKzYBdMhMmdyv24QB7XdolaRgorkZz0Kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pSTPzZ1I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94144606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94144606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pSTPzZ1I
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533202fe429so424331cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:32:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587539; cv=none;
        d=google.com; s=arc-20260327;
        b=Ku9RwJRsMVaUcUeWfjCJAFxBpHh0kEILFiLPmspe2UWnt0NYGvWT9KLTfl06x3CfPR
         RM2+4/kpEK45rT97T7EbhTIP8z1leeUS+adUf1oszgAjOV/k84frLUQf9I0DM9bo84MU
         a7WsJeOdY2TzCae4AtWIEjMZNtXlakppkIJls0KfmNwUfP+b3FRa8dtwBnj32ivsNGDO
         WtgFH1BhrMgClPFmAkubZcxQPvGliyJCNk6F8G1ss75nn6+w7jfzX0gqDQll6ZknbOEs
         bIF7BLAWjEu2meGq20mPNls+lIHaKk3Of3P+ATE/r0xNBzPBjII2PBjSB6ZTe+bcafIg
         fy+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZW/ulXbPYhjI2BnnmxNm9CpFmpm9yyYOMi+EkQ8/Vcs=;
        fh=wxvpWfqGHScXoUWLgyE65sCpMPyu8cnFN4COZSEi+BE=;
        b=POFUO2ldoLDIm7wNyOc01AVNe4n5T+Nib5R8R6CME+Tcqs4oSZItbBsUM8Mzn0+cWF
         J0TRktxHLAHZlfbDshrqyXdGzQo/rhBJ9k6Asy2WAUzS12FQPJvdsGgRRzJ8hqUHmUox
         Fwst85ogjV0BuN2Wg/6rMZdSup2q//gI9KzoA/hVz+tTNOveYzqt4wNxwO4EwmP4GBlc
         SMIociiNtpXmsu+viSbmkoNP4XU4EdKWOtEPm8Dx/OMvXYjmEjiwQMuQzNHhcVqLBw+T
         A7dZqt/LoZyudxUkWbXrEf7Bhh6FUXx9AmpliZhyn7IFyakHqKXE/Gy0pSfIberMGreh
         itGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794587539; x=1795192339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZW/ulXbPYhjI2BnnmxNm9CpFmpm9yyYOMi+EkQ8/Vcs=;
        b=pSTPzZ1IX5DjETyhOBEDTJXF+5mmSU8Lnop13tWZ56BLXZ96ub2cQ7Cw4z/ou8sHk3
         8MwBhlkHDfJeU4CmyqGG8PQ4rf5lD/J4a0tPVHrofaD99d+ukuqg9eZ9GFZ79CU9rcA2
         R1T4SHsqnUjxL0F8lNP2O80rC9S10uaLpKwpCVT4z25kLRN9L3/1azeSNBsZVdg/f/ms
         FsI4sWIFPURkkQETdsrKgd0J6gRRoOzsyLmUqH9G0mDpWhBW8jqzQVsu0Zf8qPHXow7V
         pmw+m4wU7WGYBCWsqyTb+tkNoq4AvszjbQm7NUetxm+8X9GhcGbAFwcnLmf19e5okIZ4
         /Juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587539; x=1795192339;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZW/ulXbPYhjI2BnnmxNm9CpFmpm9yyYOMi+EkQ8/Vcs=;
        b=Kivzejb9KXCCt31IssHL5TSx8MTsG74m4VOkbXHJeOuoMHqfAw4WXOFmevzIRotsA7
         2ZLB1LRb9dTUe74w6Rd8MuSLBusrCmbudG+UtxSTkD9h1f1MrcylDzyix7VKRdBWXfzG
         3SGvOlLoPlr/Brzo2NkNvKr0T66qVq5awUvSqhJuWV72X1UfI1pSxrcPYOBh5oGYa321
         lY/VPDY8OHe0eSnSsZ76elqjPSQgzItOy/WBAzUC1bwz3eYzJXUhpJGvuQ1a+goHDk0Q
         eZosXIQxxsHCPkvzzaIA+rfEGln7IVGdbxbx8zPUkxZZ+dD0TZXC3XvR6vESmZRZGlaL
         a9MQ==
X-Forwarded-Encrypted: i=1; AL+hErGX9tQu0e12uIY4NTSp0NwN9DsT8T4d8e8koczFJcW/5Y8ALBimUIA6oxK5eumo0gbI/IxRBXjQmA3ssp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9b60vFh+6HT3nTT7EfmCIYkLoXHg+Nw44FtMvYiEcgNEWZxppQ
	9LPkWpECxdC6eFXPq0jZd5ifEDO1/uhLmaZqwZFupGv1dXbQbn7HKylDZUTH3PjvQ+7oQH6Wk5F
	8yx1RzyOFo8VAaUM8U7jcdsjvccZu0M4tjbpAfGa3
X-Gm-Gg: AYBFou3OH5FBiz50Wc67uyBfUmzVh0a7cpP5i/IHIUZrBPsuVZPeAa8tIgkZFluoeHI
	qd0/toqY32uxh37EFFiuCHJnHVDWpdLEp49WEytTFlDxnRKx9iY4d5p+kg968P+fRmew06uVNgq
	ruujgWIG+DvtVlX7pAWKukxXAeULfvz8B0W+tO1O2bHoVHFVU/nMbqpW6R3T3u8Y47O3K1VYw1j
	eJ1XxJbtGYmx+WwPMh4R2b7VVTKAuUG87KXuXRWs+M9RhlNlLwqtTamIxcC0Pauq78bXjPVW8vc
	jAZvfFEu8xQioEl7hgjfAhsEgIvG5CszDOPA2fxNtn3UESg2cBV/eSGsXhQAB4sJggRjSmt0ZwX
	Aihwh34xPmndlQ+itmFm9y7JF+nWm7aO4gNRVFd/ZEi8Ds28vs+IGig2f4qKbd6I18FE=
X-Received: by 2002:a05:622a:124a:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-55adbb72c40mr15062001cf.4.1794587538562; Fri, 13 Nov 2026
 08:32:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com> <20261111174213.3526604-3-irogers@google.com>
 <avVdS5oMaBnqYlyE@google.com>
In-Reply-To: <avVdS5oMaBnqYlyE@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 13 Nov 2026 08:32:06 -0800
X-Gm-Features: AclHuK-FYliLfeQVudbxbHqQXCKRr44t1WWqUitEpfJBqGl-reP7ALR2TW1ovOU
Message-ID: <CAP-5=fVYmLMkbR1ehEDKt08+AN6sm+HxkuExLULd8YF-H_F+rw@mail.gmail.com>
Subject: Re: [PATCH v12 02/20] tools headers compiler: Synchronize
 compiler_types.h with the kernel sources
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 10:31=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Wed, Nov 11, 2026 at 09:41:54AM -0800, Ian Rogers wrote:
> > Synchronize the non-__KERNEL__ sections of
> > tools/include/linux/compiler_types.h and
> > tools/include/linux/compiler-gcc.h with the kernel sources (including
> > ___PASTE/__PASTE, BTF_TYPE_TAG, object-size helpers, asm_goto_output,
> > ASM_INPUT_*, asm_inline, __typeof_unqual__/__unqual_scalar_typeof,
> > __signed_scalar_typeof, __native_word, compiletime_assert, and the
> > __diag pragma helpers required by compiler-context-analysis.h), and
> > remove the duplicated definitions from tools/include/linux/compiler.h.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/include/linux/compiler-gcc.h   |  72 +++++++++-
> >  tools/include/linux/compiler.h       |  50 +------
> >  tools/include/linux/compiler_types.h | 206 ++++++++++++++++++++++++++-
> >  3 files changed, 275 insertions(+), 53 deletions(-)
> >
> > diff --git a/tools/include/linux/compiler-gcc.h b/tools/include/linux/c=
ompiler-gcc.h
> > index e20f98e14e81..e005e8d5dfda 100644
> > --- a/tools/include/linux/compiler-gcc.h
> > +++ b/tools/include/linux/compiler-gcc.h
> > @@ -1,7 +1,7 @@
> >  /* SPDX-License-Identifier: GPL-2.0 */
> > -#ifndef _TOOLS_LINUX_COMPILER_H_
> > +#ifndef __LINUX_COMPILER_TYPES_H
>
> I'm not sure if it's better to keep the TOOLS part in the macro guard.
> It would make the sync-ing a bit harder.  And I also see other files
> already don't have TOOLS so it seems ok to drop.

Agreed   tools/include/linux/compiler_types.h already used
__LINUX_COMPILER_TYPES_H for its guard, and since it now includes
<linux/compiler-gcc.h> directly (matching the kernel), compiler-gcc.h
needs to check __LINUX_COMPILER_TYPES_H as well so direct includes of
<linux/compiler_types.h> work. Kept as-is in v13.

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> >  #error "Please do not include <linux/compiler-gcc.h> directly, include=
 <linux/compiler.h> instead."
> > -#endif
> > +#endif /* __LINUX_COMPILER_TYPES_H */
> >
> >  /*
> >   * Common definitions for all gcc versions go here.
> > @@ -33,10 +33,76 @@
> >  #define __packed     __attribute__((packed))
> >  #endif
> >  #ifndef __noreturn
> > -#define __noreturn   __attribute__((noreturn))
> > +#define __noreturn   __attribute__((__noreturn__))
> >  #endif
> >  #ifndef __aligned
> >  #define __aligned(x) __attribute__((aligned(x)))
> >  #endif
> >  #define __printf(a, b)       __attribute__((format(printf, a, b)))
> >  #define __scanf(a, b)        __attribute__((format(scanf, a, b)))
> > +
> > +/*
> > + * Turn individual warnings and errors on and off locally, depending
> > + * on version.
> > + */
> > +#define __diag_str1(s)               #s
> > +#define __diag_str(s)                __diag_str1(s)
> > +
> > +#ifdef __clang__
> > +#define __diag_clang(version, severity, s) \
> > +     __diag_clang_ ## version(__diag_clang_ ## severity s)
> > +
> > +/* Severity used in pragma directives */
> > +#define __diag_clang_ignore  ignored
> > +#define __diag_clang_warn    warning
> > +#define __diag_clang_error   error
> > +
> > +#define __diag(s)            _Pragma(__diag_str(clang diagnostic s))
> > +
> > +#if __clang_major__ >=3D 23
> > +#define __diag_clang_23(s)   __diag(s)
> > +#else
> > +#define __diag_clang_23(s)
> > +#endif
> > +
> > +#define __diag_clang_all(s)  __diag(s)
> > +
> > +#define __diag_ignore_all(option, comment) \
> > +     __diag_clang(all, ignore, option)
> > +
> > +/*
> > + * clang has horrible behavior with "g" or "rm" constraints for asm
> > + * inputs, turning them into something worse than "m". Avoid using
> > + * constraints with multiple possible uses (but "ir" seems to be ok):
> > + *
> > + *   https://github.com/llvm/llvm-project/issues/20571
> > + */
> > +#define ASM_INPUT_G "ir"
> > +#define ASM_INPUT_RM "r"
> > +#define ASM_OUTPUT_RM "=3Dr"
> > +
> > +#define CC_HAS_TYPEOF_UNQUAL (__clang_major__ > 19 || (__clang_major__=
 =3D=3D 19 && __clang_minor__ > 0))
> > +#else /* !__clang__ */
> > +#define __diag_GCC(version, severity, s) \
> > +     __diag_GCC_ ## version(__diag_GCC_ ## severity s)
> > +
> > +/* Severity used in pragma directives */
> > +#define __diag_GCC_ignore    ignored
> > +#define __diag_GCC_warn              warning
> > +#define __diag_GCC_error     error
> > +
> > +#define __diag(s)            _Pragma(__diag_str(GCC diagnostic s))
> > +
> > +#if GCC_VERSION >=3D 80000
> > +#define __diag_GCC_8(s)              __diag(s)
> > +#else
> > +#define __diag_GCC_8(s)
> > +#endif
> > +
> > +#define __diag_GCC_all(s)    __diag(s)
> > +
> > +#define __diag_ignore_all(option, comment) \
> > +     __diag(__diag_GCC_ignore option)
> > +
> > +#define CC_HAS_TYPEOF_UNQUAL (__GNUC__ >=3D 14)
> > +#endif /* __clang__ */
> > diff --git a/tools/include/linux/compiler.h b/tools/include/linux/compi=
ler.h
> > index 03ecf9086643..505fbb0080d0 100644
> > --- a/tools/include/linux/compiler.h
> > +++ b/tools/include/linux/compiler.h
> > @@ -1,41 +1,11 @@
> >  /* SPDX-License-Identifier: GPL-2.0 */
> > -#ifndef _TOOLS_LINUX_COMPILER_H_
> > -#define _TOOLS_LINUX_COMPILER_H_
> > +#ifndef __LINUX_COMPILER_H
> > +#define __LINUX_COMPILER_H
> >
> >  #ifndef __ASSEMBLY__
> >
> >  #include <linux/compiler_types.h>
> >
> > -#ifndef __compiletime_error
> > -# define __compiletime_error(message)
> > -#endif
> > -
> > -#ifdef __OPTIMIZE__
> > -# define __compiletime_assert(condition, msg, prefix, suffix)         =
       \
> > -     do {                                                            \
> > -             extern void prefix ## suffix(void) __compiletime_error(ms=
g); \
> > -             if (!(condition))                                       \
> > -                     prefix ## suffix();                             \
> > -     } while (0)
> > -#else
> > -# define __compiletime_assert(condition, msg, prefix, suffix) do { } w=
hile (0)
> > -#endif
> > -
> > -#define _compiletime_assert(condition, msg, prefix, suffix) \
> > -     __compiletime_assert(condition, msg, prefix, suffix)
> > -
> > -/**
> > - * compiletime_assert - break build and emit msg if condition is false
> > - * @condition: a compile-time constant condition to check
> > - * @msg:       a message to emit if condition is false
> > - *
> > - * In tradition of POSIX assert, this macro will break the build if th=
e
> > - * supplied condition is *false*, emitting the supplied error message =
if the
> > - * compiler has support to do so.
> > - */
> > -#define compiletime_assert(condition, msg) \
> > -     _compiletime_assert(condition, msg, __compiletime_assert_, __COUN=
TER__)
> > -
> >  /* Optimization barrier */
> >  /* The "volatile" is due to gcc bugs */
> >  #define barrier() __asm__ __volatile__("": : :"memory")
> > @@ -48,10 +18,6 @@
> >  #define __always_unused __attribute__((__unused__))
> >  #endif
> >
> > -#ifndef __noreturn
> > -#define __noreturn __attribute__((__noreturn__))
> > -#endif
> > -
> >  #ifndef unreachable
> >  #define unreachable() __builtin_unreachable()
> >  #endif
> > @@ -68,11 +34,6 @@
> >  #define __naked __attribute__((__naked__))
> >  #endif
> >
> > -/* Are two types/vars the same type (ignoring qualifiers)? */
> > -#ifndef __same_type
> > -# define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typ=
eof(b))
> > -#endif
> > -
> >  /* Enforce static storage duration. */
> >  #define ASSERT_STATIC_STORAGE(name) \
> >       static typeof(name) * const __always_unused \
> > @@ -242,11 +203,6 @@ static __always_inline void __write_once_size(vola=
tile void *p, void *res, int s
> >       __u.__val;                                      \
> >  })
> >
> > -
> > -/* Indirect macros required for expanded argument pasting, eg. __LINE_=
_. */
> > -#define ___PASTE(a, b) a##b
> > -#define __PASTE(a, b) ___PASTE(a, b)
> > -
> >  #ifndef OPTIMIZER_HIDE_VAR
> >  /* Make the optimizer believe the variable can be manipulated arbitrar=
ily. */
> >  #define OPTIMIZER_HIDE_VAR(var)                                       =
       \
> > @@ -263,4 +219,4 @@ static __always_inline void __write_once_size(volat=
ile void *p, void *res, int s
> >
> >  #endif /* __ASSEMBLY__ */
> >
> > -#endif /* _TOOLS_LINUX_COMPILER_H */
> > +#endif /* __LINUX_COMPILER_H */
> > diff --git a/tools/include/linux/compiler_types.h b/tools/include/linux=
/compiler_types.h
> > index b3adbf5682f0..31e9f7d2a466 100644
> > --- a/tools/include/linux/compiler_types.h
> > +++ b/tools/include/linux/compiler_types.h
> > @@ -2,8 +2,6 @@
> >  #ifndef __LINUX_COMPILER_TYPES_H
> >  #define __LINUX_COMPILER_TYPES_H
> >
> > -/* Builtins */
> > -
> >  /*
> >   * __has_builtin is supported on gcc >=3D 10, clang >=3D 3 and icc >=
=3D 21.
> >   * In the meantime, to support gcc < 10, we implement __has_builtin
> > @@ -13,6 +11,23 @@
> >  #define __has_builtin(x) (0)
> >  #endif
> >
> > +/* Indirect macros required for expanded argument pasting, eg. __LINE_=
_. */
> > +#define ___PASTE(a, b) a##b
> > +#define __PASTE(a, b) ___PASTE(a, b)
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +/*
> > + * Skipped when running bindgen due to a libclang issue;
> > + * see https://github.com/rust-lang/rust-bindgen/issues/2244.
> > + */
> > +#if defined(CONFIG_DEBUG_INFO_BTF) && defined(CONFIG_PAHOLE_HAS_BTF_TA=
G) && \
> > +     __has_attribute(btf_type_tag) && !defined(__BINDGEN__)
> > +# define BTF_TYPE_TAG(value) __attribute__((btf_type_tag(#value)))
> > +#else
> > +# define BTF_TYPE_TAG(value) /* nothing */
> > +#endif
> > +
> >  #include <linux/compiler-context-analysis.h>
> >
> >  /* Compiler specific macros. */
> > @@ -20,14 +35,101 @@
> >  #include <linux/compiler-gcc.h>
> >  #endif
> >
> > +#ifndef __compiletime_error
> > +# define __compiletime_error(message)
> > +#endif
> > +
> > +#ifndef __noreturn
> > +# define __noreturn __attribute__((__noreturn__))
> > +#endif
> > +
> > +#endif /* __ASSEMBLY__ */
> > +
> > +/*
> > + * When the size of an allocated object is needed, use the best availa=
ble
> > + * mechanism to find it. (For cases where sizeof() cannot be used.)
> > + *
> > + * Optional: only supported since gcc >=3D 12
> > + *
> > + *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Object-Size-Checking.html
> > + * clang: https://clang.llvm.org/docs/LanguageExtensions.html#evaluati=
ng-object-size
> > + */
> > +#if __has_builtin(__builtin_dynamic_object_size)
> > +#define __struct_size(p)     __builtin_dynamic_object_size(p, 0)
> > +#define __member_size(p)     __builtin_dynamic_object_size(p, 1)
> > +#else
> > +#define __struct_size(p)     __builtin_object_size(p, 0)
> > +#define __member_size(p)     __builtin_object_size(p, 1)
> > +#endif
> > +
> > +/*
> > + * Determine if an attribute has been applied to a variable.
> > + * Using __annotated needs to check for __annotated being available,
> > + * or negative tests may fail when annotation cannot be checked. For
> > + * example, see the definition of __is_cstr().
> > + */
> > +#if __has_builtin(__builtin_has_attribute)
> > +#define __annotated(var, attr)       __builtin_has_attribute(var, attr=
)
> > +#endif
> > +
> > +/*
> > + * Optional: only supported since gcc >=3D 15, clang >=3D 19
> > + *
> > + *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html#index=
-_005f_005fbuiltin_005fcounted_005fby_005fref
> > + * clang: https://clang.llvm.org/docs/LanguageExtensions.html#builtin-=
counted-by-ref
> > + */
> > +#if __has_builtin(__builtin_counted_by_ref) && \
> > +    !defined(CONFIG_CC_HAS_BROKEN_COUNTED_BY_REF)
> > +#define __flex_counter(FAM)  __builtin_counted_by_ref(FAM)
> > +#else
> > +#define __flex_counter(FAM)  ((void *)NULL)
> > +#endif
> > +
> > +/*
> > + * Some versions of gcc do not mark 'asm goto' volatile:
> > + *
> > + *  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103979
> > + *
> > + * We do it here by hand, because it doesn't hurt.
> > + */
> >  #ifndef asm_goto_output
> > -#define asm_goto_output(x...) asm goto(x)
> > +#define asm_goto_output(x...) asm volatile goto(x)
> > +#endif
> > +
> > +/*
> > + * Clang has trouble with constraints with multiple
> > + * alternative behaviors ("g" , "rm" and "=3Drm").
> > + */
> > +#ifndef ASM_INPUT_G
> > +  #define ASM_INPUT_G "g"
> > +  #define ASM_INPUT_RM "rm"
> > +  #define ASM_OUTPUT_RM "=3Drm"
> > +#endif
> > +
> > +#ifdef CONFIG_CC_HAS_ASM_INLINE
> > +#define asm_inline asm __inline
> > +#else
> > +#define asm_inline asm
> > +#endif
> > +
> > +#ifndef __ASSEMBLY__
> > +/*
> > + * Use __typeof_unqual__() when available.
> > + */
> > +#if (defined(CC_HAS_TYPEOF_UNQUAL) && CC_HAS_TYPEOF_UNQUAL) || defined=
(__CHECKER__)
> > +# define USE_TYPEOF_UNQUAL 1
> > +#endif
> > +
> > +/* Are two types/vars the same type (ignoring qualifiers)? */
> > +#ifndef __same_type
> > +# define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typ=
eof(b))
> >  #endif
> >
> >  /*
> >   * __unqual_scalar_typeof(x) - Declare an unqualified scalar type, lea=
ving
> >   *                          non-scalar types unchanged.
> >   */
> > +#ifndef USE_TYPEOF_UNQUAL
> >  /*
> >   * Prefer C11 _Generic for better compile-times and simpler code. Note=
: 'char'
> >   * is not type-compatible with 'signed char', and we define a separate=
 case.
> > @@ -45,5 +147,103 @@
> >                        __scalar_type_to_expr_cases(long),             \
> >                        __scalar_type_to_expr_cases(long long),        \
> >                        default: (x)))
> > +#else
> > +#define __unqual_scalar_typeof(x) __typeof_unqual__(x)
> > +#endif
> > +
> > +#endif /* !__ASSEMBLY__ */
> > +
> > +/*
> > + * __signed_scalar_typeof(x) - Declare a signed scalar type, leaving
> > + *                          non-scalar types unchanged.
> > + */
> > +
> > +#define __scalar_type_to_signed_cases(type)                          \
> > +             unsigned type:  (signed type)0,                         \
> > +             signed type:    (signed type)0
> > +
> > +#define __signed_scalar_typeof(x) typeof(                            \
> > +             _Generic((x),                                           \
> > +                      char:  (signed char)0,                         \
> > +                      __scalar_type_to_signed_cases(char),           \
> > +                      __scalar_type_to_signed_cases(short),          \
> > +                      __scalar_type_to_signed_cases(int),            \
> > +                      __scalar_type_to_signed_cases(long),           \
> > +                      __scalar_type_to_signed_cases(long long),      \
> > +                      default: (x)))
> > +
> > +/* Is this type a native word size -- useful for atomic operations */
> > +#define __native_word(t) \
> > +     (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short) =
|| \
> > +      sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
> > +
> > +#ifdef __OPTIMIZE__
> > +/*
> > + * #ifdef __OPTIMIZE__ is only a good approximation; for instance "mak=
e
> > + * CFLAGS_foo.o=3D-Og" defines __OPTIMIZE__, does not elide the condit=
ional code
> > + * and can break compilation with wrong error message(s). Combine with
> > + * -U__OPTIMIZE__ when needed.
> > + */
> > +# define __compiletime_assert(condition, msg, prefix, suffix)         =
       \
> > +     do {                                                            \
> > +             /*                                                      \
> > +              * __noreturn is needed to give the compiler enough     \
> > +              * information to avoid certain possibly-uninitialized  \
> > +              * warnings (regardless of the build failing).          \
> > +              */                                                     \
> > +             __noreturn extern void prefix ## suffix(void)           \
> > +                     __compiletime_error(msg);                       \
> > +             if (!(condition))                                       \
> > +                     prefix ## suffix();                             \
> > +     } while (0)
> > +#else
> > +# define __compiletime_assert(condition, msg, prefix, suffix) ((void)(=
condition))
> > +#endif
> > +
> > +#define _compiletime_assert(condition, msg, prefix, suffix) \
> > +     __compiletime_assert(condition, msg, prefix, suffix)
> > +
> > +/**
> > + * compiletime_assert - break build and emit msg if condition is false
> > + * @condition: a compile-time constant condition to check
> > + * @msg:       a message to emit if condition is false
> > + *
> > + * In tradition of POSIX assert, this macro will break the build if th=
e
> > + * supplied condition is *false*, emitting the supplied error message =
if the
> > + * compiler has support to do so.
> > + */
> > +#define compiletime_assert(condition, msg) \
> > +     _compiletime_assert(condition, msg, __compiletime_assert_, __COUN=
TER__)
> > +
> > +#define compiletime_assert_atomic_type(t)                            \
> > +     compiletime_assert(__native_word(t),                            \
> > +             "Need native word sized stores/loads for atomicity.")
> > +
> > +/* Helpers for emitting diagnostics in pragmas. */
> > +#ifndef __diag
> > +#define __diag(string)
> > +#endif
> > +
> > +#ifndef __diag_GCC
> > +#define __diag_GCC(version, severity, string)
> > +#endif
> > +
> > +#ifndef __diag_clang
> > +#define __diag_clang(version, severity, string)
> > +#endif
> > +
> > +#define __diag_push()        __diag(push)
> > +#define __diag_pop() __diag(pop)
> > +
> > +#define __diag_ignore(compiler, version, option, comment) \
> > +     __diag_ ## compiler(version, ignore, option)
> > +#define __diag_warn(compiler, version, option, comment) \
> > +     __diag_ ## compiler(version, warn, option)
> > +#define __diag_error(compiler, version, option, comment) \
> > +     __diag_ ## compiler(version, error, option)
> > +
> > +#ifndef __diag_ignore_all
> > +#define __diag_ignore_all(option, comment)
> > +#endif
> >
> >  #endif /* __LINUX_COMPILER_TYPES_H */
> > --
> > 2.56.0.542.g3ef89b7020-goog
> >
