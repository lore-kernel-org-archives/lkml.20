Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3C94CC294
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842845; cv=pass; b=r5N+hT6X+Sa92lb6jPVdK9Hk6Asy+cg/QsmkYh6uzQr8h+oEn6YNctT+c1z3yTNPWTIt7Lb7iZLZe5WIpQ0/88hwGUskJ82V21Ywf9V+h6n4HKSZfi75ttBafVYVeJAFFIuxaPaH3yanSRAgBaej0nw7D9R2EQa6SbtPI9zmEV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842845; c=relaxed/simple;
	bh=9Hy/4qi1pvOId1S+omXSYSIW36PU+S8k2ljSvieLxAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D75PeqPGMVVxkSozysj1asZP0zYrPv72n2VOEBRZQNkUYqdFe+WFdS5csQhRZPTO75zZicusLHkbWOBkdauIzpuIYgrn1PG/B/DGu4ZOYpweKHsBlSbRCrMMD3ShwFAlZ0e3nGI1r/wW3a7P3zE7sJWjSYY6268fBnCxK+zvmAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TpnRnLml; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TpnRnLml"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53584e7c349so567991cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:07:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791842842; cv=none;
        d=google.com; s=arc-20260327;
        b=MzjQQ3nIzi9+XZjrtOjk0gzXrInrLpS4GrIkxT9BbxTkWt2J+LWPcDCwKqxlEWlNuD
         +FZEy5HnTsvKeeWW8Gsn8uV50sDqeafbSx4G0ATi/ctPKRrOfU3n5G0h/FC72yRcBlah
         KXKAFnPzOXM5hnwT2Su+U+OfimAUwHtZZugD+z7n0T94HEsWztPEi3dILHgbYcs57Bi1
         9mHaCeYGgc7YTw2OerXMGb896L2hreThY6qj7ELDAWVhEWPGJbKIYVqmtdvS9k4ZDskc
         pJsLJRI0/D2So08W0KjVXZtaELXNzNPWI5KjE5uDxasqJa3Qn/nkJY6KwKZvrMJ+4t9J
         0btg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xfJFs2TCZcZgagXkA7e7DWhX7aMQF/GsCS0/iiphVRw=;
        fh=JUgSD1XubvuiKB5BkhPJ23UVYnWYDMSv/bTQ5TaUVHA=;
        b=QGAf0Z4GGNizd7XJCxgzCS3nWnL6PM/XWjJMdqoRQyKpulFdZsYkPRVT2vkJ/s2Bn/
         OtDhAWARI5/vU40fgVQeWi+LER1+q7sU7kDrxSIeJSgm/9X3t8A8e0GT1PqLpAUn0lt2
         G/iSU77MJHtn9O81TuzQkR2mtB2vQ7Ps8hFR5G8rG6soqhylTCcWpfrMVVZMTR5KGXnD
         NbC3lSfZHb9Ohr441q6AarJz7WhJ5Qk4ZYBguT2nEYgAJFyYpBYDN6b+OiUHqMg48ejS
         czDQpTurE8snL4gdbot7cFSUBDSJtxxJxD6gFDrZr9F48MHyH9eLklbaYuMpx0v0T2oI
         vTiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791842842; x=1792447642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xfJFs2TCZcZgagXkA7e7DWhX7aMQF/GsCS0/iiphVRw=;
        b=TpnRnLmlqhaKUZfz/GJ5a3rcKXygjgsimL0KpuQx+kvhImdHv4P+dCGDftDL2pXICa
         8pDlQpusJQ2YIU3J85m+n77r4cOHi8mcBhRR1axttPYPCtzTcteWlBJo7+reJKvfyo/o
         dgcvRS7dofofLjh4b0uisNkDLKjHafw9faWY1LE5CNRmHiHO8q04MPuDFV8REG/Pj2I+
         oTku59Fcq1bXvneNZq107dmU1eQfpy+f7iAFZcit7kj5xx7MG2GSXl6qX29WZyjZQH5k
         nDY6V8+BLhG7C8EwoDpebfViwsZyvZRRLcwI1v89islnsumQ11dKn1AiA/lG8Adm9byP
         Yv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791842842; x=1792447642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xfJFs2TCZcZgagXkA7e7DWhX7aMQF/GsCS0/iiphVRw=;
        b=afhnjcAU1vJTI6KfcAcaIyyNuBxu13eNNDAfIdY72RNSngEBJsdQh76h8lMbXQex2O
         omyO8JCJ+z64FHGXiWeV81pWzZirHl1DEQqiFq4tBO4qb7La7cnPcG/JoO1k1b6fWi9X
         /bt7lzmPF699o4G9+mGpnzZ0THkz6UbPY6rXSisWJbvYzm5WkMhVg5QRCYRLs+cezGdG
         ovSqqKUMEBzXopN9DJPmpK4ktqNJOSH3TjhDOVDRn5zxzX7HsvJtNwBB76yVCeEP5zjJ
         s/i+sjpniAjHxSDkhj1xq7lcV8D/Bfa/HqR+XX7W4K+QVtgNULH436aMylCX7+CKv4Uu
         DBpw==
X-Forwarded-Encrypted: i=1; AKwUvBzIxLQSSCgWOwhGDotU7VRaHUDHTp2ee/eLDRKFXHaylyZ4CzuZrbT1pmSUFnJbHp17e7EOpqjWKpovQJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4t6+A8sXRRA/7wBfo/m9KZ5qmcla7CWw08baZrRBH0YTXdF52
	a4p9abby0AsoSQ09+NM5qh1/P7iI5RZs2aUberLJ0EyTJ/U8dp/TgEUTrsQakmeLqc0C63Q00kq
	LCVqDYjP7STYrBOvLJ2ylUVGoSRx43++wd3hrQD6p
X-Gm-Gg: AYBFou2NfQJKCZXOmLbo685EmYkOCQnGYIW0hZydldWpXEIeUGxOGe3a22clauyRv/j
	MnX0pDQfyXztMPl+SMcPD2dxNfVlkHRUg8aNrN0ICMN28/XMg6T5O7m4GfI3Qev/joEV2WadsPH
	uNlQO0ifzZBFpPPzQWMFDQDkNGan4rnq/5vMRzuqkVjPtE4MolVhKh2vroLmR07J7j0myBsHNma
	iF/Ahx9RsTf7zfFc6YY37QKK4slWKbS6C8iXIQS1nFssFO7Rrz5Z/F/cEcXjyflHpd1OwD94x9e
	pUJMMxNNHkjFElcNgMEQv2vZ0/qmxmuxhudoGnlaxOaRcZsd91CkdKWUi5aD/vyMy0cJ9wY/fcU
	qMb8osXu3tA==
X-Received: by 2002:a05:622a:581a:b0:530:2f98:cebb with SMTP id
 d75a77b69052e-535b4f31acfmr40093421cf.11.1791842841851; Mon, 12 Oct 2026
 15:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011233647.2454648-1-sashal@kernel.org> <20261011233647.2454648-4-sashal@kernel.org>
In-Reply-To: <20261011233647.2454648-4-sashal@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 15:07:10 -0700
X-Gm-Features: AclHuK8mlJBdkDo_qjZnD8vvswEhWWRcu7xDXqAmSuD53qO6NxMidI4YTyg40zw
Message-ID: <CAP-5=fWFY-tpJz2vcBZvurwdZY5gwd8cuTemE9q1rtZ0Vi0dng@mail.gmail.com>
Subject: Re: [RFC PATCH 3/6] tools: build perf in tools_build
To: Sasha Levin <sashal@kernel.org>, linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 4:36=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Add CONFIG_TOOLS_BUILD_PERF. perf is built as it is built standalone,
> with optional features enabled when their libraries are installed, and
> with -Werror following CONFIG_WERROR. The feature table is left out of
> the kernel build log.
>
> CONFIG_TOOLS_BUILD_PERF_MINIMAL turns every optional feature off
> instead, so the result does not depend on the build machine. allmodconfig
> and allyesconfig turn it on.
>
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/Kconfig         | 15 +++++++++++++++
>  tools/Makefile.kbuild | 19 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/tools/Kconfig b/tools/Kconfig
> index bf0643b39b86e..488f439592150 100644
> --- a/tools/Kconfig
> +++ b/tools/Kconfig
> @@ -59,6 +59,21 @@ config TOOLS_BUILD_IIO
>         help
>           Build tools/iio (lsiio, iio_event_monitor, iio_generic_buffer).
>
> +config TOOLS_BUILD_PERF
> +       bool "perf"
> +       help
> +         Build tools/perf. As in a standalone perf build, optional
> +         features are enabled when the libraries they need are installed=
.
> +
> +config TOOLS_BUILD_PERF_MINIMAL
> +       bool "Build perf with all optional features disabled"
> +       depends on TOOLS_BUILD_PERF
> +       help
> +         Turn off every optional perf feature, so that the result does
> +         not depend on which libraries the build machine has installed.
> +         allmodconfig and allyesconfig turn this on, which keeps their
> +         builds the same on every machine.
> +
>  config TOOLS_BUILD_SPI
>         bool "SPI tools"
>         help
> diff --git a/tools/Makefile.kbuild b/tools/Makefile.kbuild
> index 820a2d9a3893b..62fd494253eca 100644
> --- a/tools/Makefile.kbuild
> +++ b/tools/Makefile.kbuild
> @@ -73,6 +73,25 @@ PHONY +=3D $(tool-targets)
>  $(tool-targets): tool-%: FORCE
>         $(call build,$(outdir)/$*,-C $(toolsdir)/$* O=3D$(outdir)/$* CC=
=3D'$(call escsq,$(tools-cc))',,TOOLS_BUILD_$(shell echo $* | tr a-z A-Z))
>
> +# perf, without the feature table in the kernel build log
> +perf-flags :=3D CC=3D'$(call escsq,$(tools-cc))' FEATURE_DISPLAY=3D WERR=
OR=3D$(if $(CONFIG_WERROR),1,0)
> +
> +# Every optional feature off, so the result does not depend on which
> +# libraries are installed
> +perf-flags-$(CONFIG_TOOLS_BUILD_PERF_MINIMAL) +=3D \
> +       NO_LIBELF=3D1 NO_LIBTRACEEVENT=3D1 NO_JEVENTS=3D1 NO_LIBPYTHON=3D=
1 NO_LIBDW=3D1 \
> +       NO_LIBBPF=3D1 BUILD_BPF_SKEL=3D0 NO_SLANG=3D1 NO_GTK2=3D1 NO_AIO=
=3D1 \
> +       NO_BACKTRACE=3D1 NO_DEMANGLE=3D1 NO_LZMA=3D1 NO_LIBZSTD=3D1 NO_ZL=
IB=3D1 \
> +       NO_LIBNUMA=3D1 NO_LIBUNWIND=3D1 NO_LIBLLVM=3D1 NO_CAPSTONE=3D1 NO=
_LIBPFM4=3D1 \
> +       NO_SDT=3D1 NO_JVMTI=3D1 NO_LIBDEBUGINFOD=3D1 NO_BABELTRACE2=3D1 N=
O_RUST=3D1 \
> +       NO_SHELLCHECK=3D1 NO_PERF_READ_VDSO32=3D1 NO_PERF_READ_VDSOX32=3D=
1

It seems unfortunate to maintain this list here, we also have a
minimal target as a build test here:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/tests/make?h=3Dperf-tools-next#n123
I wonder we should just add support for a MINIMAL=3D1 variable in
tools/perf/Makefile.config and have that set these other variables.

Thanks,
Ian

> +
> +__tools_build: $(if $(CONFIG_TOOLS_BUILD_PERF),perf)
> +
> +PHONY +=3D perf
> +perf: FORCE
> +       $(call build,$(outdir)/perf,-C $(toolsdir)/perf -f Makefile.perf =
O=3D$(outdir)/perf $(perf-flags) $(perf-flags-y),,TOOLS_BUILD_PERF)
> +
>  PHONY +=3D FORCE
>  FORCE:
>
> --
> 2.53.0
>
