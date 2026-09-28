Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9947F4FDA70
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631816; cv=pass; b=HFxCqK2S7YeFjznKZtmHG49s2TnmBogIjVjSFD5HfIxfezAtZpquG6OO1QIG2KgRAGwaOksCdHHqa09hFDhwFxFQJRHkRae+Fv6G6QXU5LEREUS/F3AkZqIrgaT3SSWImx3MztCwKxLlEDyv0M5CyJUQjIK+Qkx22Eld66rJD8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631816; c=relaxed/simple;
	bh=uxXHa2WIztnT4HhW7pDRg1DvGrnilnU0CK36R7LnMwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pLFfWXiaFZlV7S+W5UJsgKI4DB0ZNq+iBQryVyEda+lqh5TDjfCXW0tOWJEAi+opK5MQCGpYK+f5/s4aVgTP37sTk1Asn3rixIlo6vlVf6QoJ0AgD/VbVxnE4KKpo9/MLH+1rvz+9uFAAhykG4n4XduhNPNoJvm2JNhVntc09ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VJXiyqwy; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VJXiyqwy"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-533202fe429so105181cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790631813; cv=none;
        d=google.com; s=arc-20260327;
        b=hAqzeys+udi2/04eQEC/dIyh85PJp3qWTQjIU4I9dA1sm6z9v5MYvdjhuQXD2OTxBG
         wDZWDCLEW31Ob2cyEgp7gQSAVAkAGp3h2/s0nge3LE3V7dhOEesKGwwYR/CF4zQXXjFo
         tbO1zc4kSE05a18lEe3UkE9RtQZnlrbpRIEXLTWQIylorm9dFk8FKdZa0iHsPqATHynb
         1+5kmhAEJoCgnvvyFh34L7YBcadgUK6v3mQEX/L0kBwspjVo8FBn9wCnFDAo8/siiP0X
         9yqDr4UHJGbJ1e9D2aSTFq0HoLINFG89gWXsz43s3edgRn6fVbeSppB2LjkGm/oZ1PHc
         DV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zq6u8NSORsqGMSwXt2PUCa3ICMXA5cI5C7VtQ6r/oCY=;
        fh=sQJ+J7IYiPa1bKqx36zxgiw1DpTp3Bq9qv6QikVN1MI=;
        b=syhTXa8PXnG7BOeOiUDnQhRmWCV1TdKx9jRUDkZMwtuxZIcohOZI/Tnf5APRSuj05p
         q0SSi7Lzxbi+kCaW/+OVcfxtsOvExQdBrFRp5DRgmlhTs0HXJgxIxxLfJeMdchWuTAeq
         CRcAeeXFp6ou9rm6092lpjZRravOS5ZHUTU3J/aKgUxYhOKLhQVt5W99YIZ/3iX/vWrP
         ba3wS6u8csq7IXEUmxh3H+s97C+znxry3F1ZnR5WBZgRQP6kNYhVMXs8/d0Vj+c3v9Bb
         XieQZYm6b76PCJXzhUp420FHxihLMbTmftHZIXy0ZW19o++x8Oi5rWH/qwDwV3S5M+/P
         4ISQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790631813; x=1791236613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zq6u8NSORsqGMSwXt2PUCa3ICMXA5cI5C7VtQ6r/oCY=;
        b=VJXiyqwy+FAksPkGbEJAwQP8WyLKyPML1t2GTpjSuZ5ogWkE9Bw+CPzPZgl3mgaGNU
         I73Gm2p0T9CK+b7mz+u5PHTjlcZxBi3TIqCbiBgNpjd2UJV87VgPL5JONorQ3Oqc7CLD
         thRULVoB+JBAsN2yyvcjNGCgH/RJdP8HVKgciUdy366KDiQvBkf/IP6hO/hH04disejF
         6E2ZBf6Bp4Onegpt7wISUWFdLeGALGYNUKr5xoFkv6zcorqUOoEwdB4PFlzujxOihCw5
         a4Sv2qcRvLDJkmWwZBNyxEj1/TzJzraHixxZhwGevTz7gdScETPIIgwp9CwlrSXhTnDR
         2R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790631813; x=1791236613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zq6u8NSORsqGMSwXt2PUCa3ICMXA5cI5C7VtQ6r/oCY=;
        b=BdY4LYuv3Tu5nJKaustgN3ClAaSCHQBSdXjf3v1nPG4XDr4noOFtZoviDhiQN1Lc9Q
         229dft/SjTvdcdUssAWMggDtdfxA9Dpa5CUKLdVmDyvNH389XfSwx5dJoieovwoqJmlE
         Nsz3uyqhNmWIOkT3AsBFxJdv41g3dDXKgyGI0/8N0XeNE0mBEkvaXhuVFtr1/e9TrIGc
         22JXjvlLOK77CS+Dx9ADRac4fVPbEeaVMmyTbsfNCZC/uZq0E4NPjojknjIa+jPE7ytg
         a27xB4+T11EO/g8CH5B99Z8RVqARWVy/s8PYy8CNW/Jste46NvIkFWfjKqks+unZR4zd
         xMpg==
X-Forwarded-Encrypted: i=1; AKwUvBwi0hV6cWNybzCoKep60v+WBLOT5A6ZSMIlvmZkfVhYYkU9GWcpTiTdCXuyUhebrwaRsswW+ddN1UzFPBc=@vger.kernel.org
X-Gm-Message-State: AFuF++nHyCAPEhmh2vhQoSArjT1GB1ZhTOGjmIIVtwbBhunnGUq/nj+U
	dDwgeq1OlVrvMvcTsiBIqpgaI+NToYJ4NWxfgqAeaxz/dhoIyS59XdoZ3I0fcjCQDyMneufo1/E
	AnkRp9Vjze/iPd7QxHC/y37/hKbQAZqzEfY0v7ONm
X-Gm-Gg: AYBFou0yeGtN9xF/SoLV/U4fHLM9NFkq+SkV6QJzRmqHFT4Y9ZS4icdq50pYZhZJ+No
	tKX4W9XIHti22iT95bIE/dnvn5RMAYTfrSlJEp0+Rs1PABpKOyMrclbjlAyPjUwGFd/qN9dSyRt
	iJVW4ULQIw/4zvSN6DcG6cEc50DgAA6uHoV6tYCGOxbY74vDaQigI0hS251NPb2JczQ4l72IfjJ
	vcRL49V8ZPNJQLvtXgZBpu9KykCzSiRcSVdW1GSfQlgnYH8PFl31GWQ81EBEiT5gHfRP4Al8gwp
	4R2a0YG8pYHZrn9p0FJNGmS3YzKTXs4UU2Xz4fOmRhJmRRYpCZG5wllFwFYjofNi0ZZ72YpCRBv
	nenw3GxJwQIgWvLuCCrU/
X-Received: by 2002:ac8:59cf:0:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-5335a1ee1camr910641cf.10.1790631812598; Mon, 28 Sep 2026
 14:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928010227.1903673-1-michalpl2003@gmail.com> <20260928010227.1903673-4-michalpl2003@gmail.com>
In-Reply-To: <20260928010227.1903673-4-michalpl2003@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 28 Sep 2026 14:43:21 -0700
X-Gm-Features: AclHuK9fVr94fSWHmMdmC0x4TwWwZQ06SsleQuOajbCBbXd937esFBpLzMS7qJM
Message-ID: <CAP-5=fVe=VxnxypQYNt1h-s+3=Me8D_fpBL3LD1Eeb1cGvUc3g@mail.gmail.com>
Subject: Re: [PATCH 3/5] perf symbol: Grow the Rust demangle buffer geometrically
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
> When a demangled Rust name doesn't fit in the provided buffer,
> dso__demangle_sym() adds 32 bytes to it and formats the name again from
> the start.  The number of attempts grows with the length of the output,
> so the total work is quadratic.  Names with deeply nested generic types
> need many attempts, leading to noticeable slowdowns in larger programs.
>
> Double the buffer instead, reaching the maximum buffer limit exactly
> rather than stopping 32 bytes early.  The demangled names are
> unchanged.
>
> Add a test for a symbol whose expansion exceeds the bound.
>
> Signed-off-by: Michal Pluta <michalpl2003@gmail.com>
> ---
>  tools/perf/tests/demangle-rust-v0-test.c | 12 ++++++++++++
>  tools/perf/util/symbol.c                 | 10 ++++++++--
>  2 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/tests/demangle-rust-v0-test.c b/tools/perf/tests/=
demangle-rust-v0-test.c
> index ee4ddb61174b..d1e0636d73bc 100644
> --- a/tools/perf/tests/demangle-rust-v0-test.c
> +++ b/tools/perf/tests/demangle-rust-v0-test.c
> @@ -69,6 +69,18 @@ static int test__demangle_rust(struct test_suite *test=
 __maybe_unused, int subte
>                 free(buf);
>         }
>
> +       /*
> +        * A symbol with more lifetimes bound than fit in the largest buf=
fer
> +        * must fail to demangle rather than give a truncated name.
> +        */
> +       buf =3D dso__demangle_sym(/*dso=3D*/NULL, /*kmodule=3D*/0, "_RINv=
C1a1fFGZZZZZZ_EuE");
> +       if (buf) {
> +               pr_debug("FAILED: symbol larger than the buffer limit dem=
angled to %zu bytes\n",
> +                        strlen(buf));
> +               ret =3D TEST_FAIL;
> +               free(buf);
> +       }
> +
>         return ret;
>  }
>
> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> index 3cb42805a82f..1a52bc2980a0 100644
> --- a/tools/perf/util/symbol.c
> +++ b/tools/perf/util/symbol.c
> @@ -2737,29 +2737,35 @@ char *cxx_demangle_sym(const char *str __maybe_un=
used, bool params __maybe_unuse
>  }
>  #endif /* !HAVE_CXA_DEMANGLE_SUPPORT */
>
> +/* Buffer limit for a demangled Rust symbol name. */
> +#define RUST_DEMANGLE_MAX_LEN (1024 * 1024)
> +
>  char *dso__demangle_sym(struct dso *dso, int kmodule, const char *elf_na=
me)
>  {
>         struct demangle rust_demangle =3D {
>                 .style =3D DemangleStyleUnknown,
>         };
>         char *demangled =3D NULL;
> +       size_t buf_len;

It seems changing the scope of this variable is unnecessary.

>
>         /*
>          * We need to figure out if the object was created from C++ sourc=
es
>          * DWARF DW_compile_unit has this, but we don't always have acces=
s
>          * to it...
>          */
>         if (!want_demangle((dso && dso__kernel(dso)) || kmodule))
>                 return demangled;
>
>         rust_demangle_demangle(elf_name, &rust_demangle);
>         if (rust_demangle_is_known(&rust_demangle)) {
>                 /* A rust mangled name. */
>                 if (rust_demangle.mangled_len =3D=3D 0)
>                         return demangled;
>
> -               for (size_t buf_len =3D roundup_pow_of_two(rust_demangle.=
mangled_len * 2);
> -                    buf_len < 1024 * 1024; buf_len +=3D 32) {
> +               for (buf_len =3D min_t(size_t, roundup_pow_of_two(rust_de=
mangle.mangled_len * 2),
> +                                    RUST_DEMANGLE_MAX_LEN);
> +                    buf_len <=3D RUST_DEMANGLE_MAX_LEN;
> +                    buf_len *=3D 2) {

Thanks for digging into this problem and exploring a fix! Previously,
we guessed the demangled length was twice the mangled length, then
added 32 bytes for each retry. These were numbers I pulled out of thin
air, so I'm glad you've found them to be wrong :-). Could we estimate
the initial demangled size better? Could you get data from Bevy and
Typst? I'm a little concerned that a demangled symbol of say just over
2KB might require 4KB with this change, instead of 2KB + 32bytes.

Thanks!
Ian

>                         char *tmp =3D realloc(demangled, buf_len);
>
>                         if (!tmp)
> --
> 2.43.0
>
