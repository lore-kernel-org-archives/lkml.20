Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794779285;
	b=gc9HLwSeqz68BROIdD326hY9+so5jNcsuguOya9bpRVMbFiZhfOPRKCrkU5jUmK0nqdX
	 HbKXFoISMiAYO7dL77B1vOZInvZKCkfzsPqJoiOZluHWA4s05H75y0Zc9uVdnHYsAmKJP
	 PXFv/vMNZoFWstgcNB2PZBSoJ9QtqXCFu1M0+7Olu9AD/F82uHyDwx0UwO0+Bxhgg5fzY
	 WGfs68+SL7zaedkU6VNXKzXxOxO+zw+jbOZIsW2CT3GzAyt4ZHXmTuoAwkbuk9bDH9dVi
	 O/BG0KB6T4XF4In8yte7IdKNtFTObSybIg+C2hzDuW8tupIDP9P9IoMBBv64xOUpplw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ljN6SGuoiRBY5PtAOwAHFb9VP3FqrLxtIxFUMqL78oA=;
	b=ygC2go+DM0wnoDiPo8K0MvD8gDNYJHEj1ksxfnN/x88CVhquG4f/XAA/Izam+5TTC2Rz
	 MmteN4wQjsWloiJeqfWWXKBFroizoLTJTfgQgmgoo6W1Q5ojR4gIndm3kF+mUmNVCZtJV
	 2j5H/v8pPCDtFt0UiPRk7Hfyf0wjZmzXlAyt498yisDqUZ00vAvmOIwO1/mCxlO30V1YI
	 HckbvhIaO5hiNGgF8+ujOnPQ0N5uycP7rrDI7F3cE/yMx3WxJx8Xf1L4KWvLcna+JTa2d
	 5oVedagQ4mNq56AoI6U/gw+l94T+Spe13K1rhoPsfm/fUShJB2JSDYJ9+L+Nj7+BTmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="BGqj/a7X";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0719D606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0719D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BGqj/a7X
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55be673e029so210841cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:48:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794779284; cv=none;
        d=google.com; s=arc-20260327;
        b=rDi7IQYtXbF+g1nQEt3FAd+rHkgMbip09svwOtPBkbw5J9PQTCFsvo2Xz19XNhorbG
         /vgPnG4dGJgt+DsvtfFMsZI8ymGr4S5O3LUohevwd/6Fie6oN+FGWy5N8qyikN9hpCNW
         M/Cl4pzy4z44D8hbeRUBN4nBeSH9QyA2nfPfLCgZwJwng+qA2peYlLlffZK1L8FTcxg2
         fDB8tLqVM9Na8FYEfzaYXYo5zfnlvpIWSkYMN5sLEsf8/ER3tB+Fz5Z2sOuhxDy6sgjs
         baF+u25CXCQjCGt76C5kXa+/0zxcwjnqySTmbP5YJ3XttovwRHFY/xAQkOl22VvBqlt3
         POYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ljN6SGuoiRBY5PtAOwAHFb9VP3FqrLxtIxFUMqL78oA=;
        fh=V6W+07I3JQzc25D15LsiVoLbLPHJ51LPEG8828tCQKo=;
        b=mhTPDh+8XJ06fHwjcSBA0mEMSoBOzc0BNf9OQMtgUn7nXHKaLuESlB5EMVMjmVQVYx
         y/QYsgUbTheIJziuzvkP0HReH2YfkGxkjIJEC5ypq9gA+tte49XRZHICTt3b4aXTD95T
         ZAjyW6yFPDuuy/angdBj1sJVVlTKjxGd7k/9l3lB3paJIU18sHVsOj4S+mZ5AMSZN8O+
         335/pOuYPfVXfwbsJpGbe7HBHVNAgL3hLFODFjg/bduRbmaG3NY2Ju7oG6Mi9OxSfSw1
         /MKMKEwTYN46x5gjsfy21Lh/TWZBTrPgZlwLpf7/YhmDwtqeaWsbkBh8BaMJbGIYdBAO
         dYjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794779284; x=1795384084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ljN6SGuoiRBY5PtAOwAHFb9VP3FqrLxtIxFUMqL78oA=;
        b=BGqj/a7Xdpt6jjmSRSiMpaIkC5OjXCjruiN2GUK3GPq86vtTB5lGkcYGe2c3nhQNIe
         9lCAQXS9BGCBo2zxAm7ue0FAIScPDkiFf8Tu8kM71BA0naC8V+h6v0SRfuX8YyyWQHcU
         6Bw1GmyFyrfCiKMXocDKViYauybk/r0GSGemNvZA2bUrGmAc/GZgDjB0aF32FjbnbzN4
         jD6D9UinJF0SEFiqxyKj14U+HRz4pqnGGgmWh/aboPNs0q4zuZWqEsu/Nbz8kCbqyPXV
         WQhh1dTPwH41DE3ZO/JiirC3n3lf3JuNBf69j3zcEvTdk0KWAbBJ5ggN/NUbysMcWUHn
         VZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779284; x=1795384084;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljN6SGuoiRBY5PtAOwAHFb9VP3FqrLxtIxFUMqL78oA=;
        b=sM11xRgo0bjw0DckqIvVFPMyLzc2oqtL4He550n2+4kV6m9VQaWc+A8uqFfgOb17ZF
         MLL+t2MR2hgVRm8WsMzKN2X7J4f9A8t2qUdhpcHODvDtvfIJINnRSVnrO7YoTG9AP2dC
         twdyuV4+I1sTl/aCXrJcKTBbPfuSochAoUNnjxPdBZXDav9KeVpV0knWt+cmxB4BcrUw
         r08mjYh7oOWXXMRpGL7V8esuPZOfXYu8fO7QPoX6OxopvGRRqWkyYGJipr8kk2Tdk7MU
         sMjVki6HvO/8lGkOOq+0538a7bJOw4GQ1kmmsiSYLIm7/5JEG1kVfpo/ie1xaxzgXj27
         VDjQ==
X-Forwarded-Encrypted: i=1; AL+hErGMVjigJcaNRMfqNKDQ7PIT0DN01fOLNaN17oSbqX2J707HxGNa2RJDmryf4vZ4rpCq/jor5phdrZO07e8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cf9JgzYsnXuwRdNlz4gyVK/Tw8thTOVuY8DaZsXo4XuoPrGFp
	PPUMJvnrx08Mvx486X6sYTQhcXobYr5ay5iuud6Sr0dUqhYsbIOpPwCvy+FyuA3HdyXCrai+kPy
	oIJdjc5KkX2RKVeiUdSsUDUOjGbAVbytds8BpQ9JK
X-Gm-Gg: AYBFou0PITLgCZVNhX1ZlYYYoFkpkjFLuC4JFyJTDEK34fiBkBf7iGDtnOqi6qyP8du
	aNJScPLOXhaN0E0O08TUE8Hk5cSAKzRGkWMAFGpq+YDXEMyt1ze608zUmkfH1dzzDiKhLGI+8iT
	GqHCJkJSePmvGbsrW8Y0zNj1asvgkCNXyJnFOSBmc72oaaHCWKVo9cooa1he20pihuoWx+wDZu9
	ja+qcHviQFEH/Dp10YmCfQwU0JUeycBtrmeDVXtLGId6Ij4ERzVOvnS2S8hnjczUKMwJPCXudqh
	/Vt0NtlqFhoBidFoql1R1UblU9rpRtGhJNGHFH6DWytvUrDPuLL3QP9pF/0ZBGyDC3CkKEfwP/B
	Za1q0hBbqIkH+RiV9Tw8rVqvvBT6qM3p14skV
X-Received: by 2002:a05:622a:230f:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-55c6888bc4amr25392681cf.8.1794779283515; Sun, 15 Nov 2026
 13:48:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115014102.2879372-1-acme@kernel.org> <20261115014102.2879372-9-acme@kernel.org>
In-Reply-To: <20261115014102.2879372-9-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sun, 15 Nov 2026 13:47:51 -0800
X-Gm-Features: AclHuK_IYVF9TNn2P3848BZK59RLBacsy1GSQiLJ2BeBGoKLmKRR2ByiO4eH4yI
Message-ID: <CAP-5=fXr6NceuDbTbJWnBn-pJJvDSB+pFUJESfgt7psOTwTx3g@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] perf tests: Silence the libbfd probe in build-test
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 5:41=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> build-test evaluates the libbfd probe at parse time and the compiler's
> stderr isn't captured by $(shell ...), so without binutils-devel it
> prints "bfd.h: No such file or directory" once per tests/make
> invocation, five times per run.
>
> Redirect the compiler's stderr; the empty result still skips the
> nondistro tests as intended.
>
> Fixes: 523471c5163659c6 ("perf build: Skip nondistro build test if libbfd=
 is old")
> Cc: James Clark <james.clark@linaro.org>
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/make | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/make b/tools/perf/tests/make
> index 7524de5228029e7e..e6d7ac49b5b1693d 100644
> --- a/tools/perf/tests/make
> +++ b/tools/perf/tests/make
> @@ -128,7 +128,7 @@ make_minimal        +=3D NO_SDT=3D1 NO_JVMTI=3D1 NO_L=
IBZSTD=3D1
>  make_minimal        +=3D NO_CAPSTONE=3D1
>
>  # binutils 2_42 and newer have bfd_thread_init()
> -new_libbfd :=3D $(shell echo '#include <bfd.h>' | $(CC) -E -x c - | grep=
 bfd_thread_init)
> +new_libbfd :=3D $(shell echo '#include <bfd.h>' | $(CC) -E -x c - 2>/dev=
/null | grep bfd_thread_init)
>
>  # Whether libLLVM can be built, which needs the llvm-devel/llvm-dev head=
ers and
>  # libraries of version 13 or newer, not just llvm-config. This mirrors t=
he
> --
> 2.56.0
>
