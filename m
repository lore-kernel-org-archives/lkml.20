Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D58B4963D2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871918; cv=pass; b=jDsZ+yH2Kb5qfgGI0fwibwNhOn8LnTx9jZbd50EI1mRKtgumrEDqG7O8txbhAnbtg2jzfxyKZJYV65BZAHYKpWzfNmtwUbx4UaZQ5Yo7AK+o/VPfrCQXsWQjJoi7HZAhZ0K22vstqgwQCVe3CrHPW2cI1HJ1ktSmWEDG+wacNHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871918; c=relaxed/simple;
	bh=0dgwBSyY5kwnxQy2MvUtG+uRtBie81JFchBqXisMEdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dj0gXXmGYcgEystB1pENoeVbJszXmHEXxvFZLYcc5tZIrZrsGR7ItWTSTxmtRNGBiM1cEkdR+82qgJ0izAIrd28foRT6S9E/ALo2OfPalurqaFj2OM7hIEq0wIYiGmCxKTtfyHhs5Ns3dCehM0XqHwtUIkEaLyilIpyry7KHTSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fDa8+Gtc; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fDa8+Gtc"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533202fe429so401511cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790871915; cv=none;
        d=google.com; s=arc-20260327;
        b=fBEShjQjLShhSeCVh/te11BVUbGzaqHizrUNTo/KA8+c2u7yOp/Bb7tplxGyFCUtbM
         vVmL99iGq8+6KG42r9q97WYRdXGi/OSyr2SR4gLyyFjFbA5XoBplt+o38KJnOo2yKj83
         /MZjdQeRKyp1xzCnjD2wUfu9gUdb30Dc0QbfoEUQQZzivfSOZEwD1/UMCP2kFGI69hxt
         HCKWBN/d10OXYhuOs7z5dXgyxrkv70pPsO1wXwdPvdsPKTLqVqbQprD5wqjLSK2M8XJ5
         laLfB/ly2yJki/1UFFc4/R77aDpWWY7KF0B+ihCPAtUWjRpOHB2VSrHfWUvK7zwscDlJ
         56Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bbdg8a5GCBabcFyDaNgExjUkDEX2FeQ8tqfqWqJxGjk=;
        fh=TBnfJ8k/RYm6LfIWp0RmNuhAo3IHgcyW7dtqMdSGi/M=;
        b=AJNujick9Wk7Ar8cA9p5xxwhrFubQXTnhB3H+lIibhA+F31Iv6f5cGaN/A/RJauUTz
         AX4h8FBLgORo2vzIPNJfCPU2dZZvNMJE//+BDHwqW3oxTp9XwX3xUfZ9NyPaQv1kyd7o
         FewUqys9F4MuBSCFBupZHa6gLA1WoDjHj6q0m72b7H28WagLD02//vziOBy7EbKcXRFN
         BjO3RjnEbOYHBCs7N7THF2DmKFyq29hAnhqzh/6Fr3c4EOVLxaiGusOAXGezAOQRvU05
         BabVQpXKXcv9q8lj7NQNXDuxccss6XCVURnKiaqBsIP3lCvmvx+JxTESONRWCIJcZax3
         6TXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790871915; x=1791476715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bbdg8a5GCBabcFyDaNgExjUkDEX2FeQ8tqfqWqJxGjk=;
        b=fDa8+GtcoKBV4yQR030DcD8kgToU+0zuMwyJPPPSoWXlftX5/tQFndSYhy0JmV0Kg7
         nphPVi/deVXYjzbCld1NT5Mn+iISnzAoTHKFZxfm+EV9nWfL1ATD/KUNNkY06AbXdqfF
         G+RJpkfmCQKnxSxBczj9PHLEKj12HugHW8UKWChM7VHztC0IZRbP/hrXjgn9qpgTK7wK
         BIY+/KLYDKZ+wbdr+XW4N2YjJ9ahIqVy6WIXUrhyB1UZZaqa0BKwbcxKbHwFbjVywbgS
         xeZAHHM8w+LdfGLyxYhWrem+36pZn4tloO06z7i4EZww7rGC2G93i1tH7mCTi1cFULho
         c2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871915; x=1791476715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbdg8a5GCBabcFyDaNgExjUkDEX2FeQ8tqfqWqJxGjk=;
        b=diduSXQ/BLvzZCc6jbG7P/KNWepPLf+onO4l6SFsuZFtOrpmBA1qAuiQUWWGilNPdu
         sDct26ymcfISQ3qITHo3Hut1G4yrwYw+wvHkP9e8Q9cN/juhoNFb3ng24Ngi62t/gvrm
         mxMwz6+KUuBTR+5MvZX0qB1kuiLe8hKTYwOomrW0GfmF3UDh+vjSXZkgKYHTqfpY1CSp
         brCarHdoF3RD1FFyZd9pN7YySbEjS0ixo73mUUrjCMqSQEr8RJYlnvGCL0Dx8BIm5xaA
         gM/d1Nz1jTtayOqyeFg9ptUUEfAQQhDfmzSKXWUoryr49REJ+PHrNnNaqH2YD/Z8eGNI
         dBGA==
X-Forwarded-Encrypted: i=1; AKwUvBx+a6uULDcjlZCcRpGnT2ZMbewEfflNY4moX5Dnif/KLB9wm2NY2coyGb9rmnkyZMKpFZv8mhkEUHYv1A0=@vger.kernel.org
X-Gm-Message-State: AFuF++kt7skNgCSD+CnixKZzIZoQeqO0xsXB8QBm5RmVJ31Q6AVKbJhO
	AMtY0592wZIxmhhZEHYU/S71sLIt/iivqovtnetSOzbFeznMocGH0JFmRUjNHk/QKux/afiNTC9
	1fIJJ7HXiO6iAaWEGqkbf3gxnrvOIs0wh/dBMf0c6
X-Gm-Gg: AYBFou0JAS3khYrD6miQYJnCnjwAxYtUp7KxWst2IOR67rCXOTD/7GvecuzdMzsFNSN
	Mix4XDVWuWfEHZg7bqG8QDHaYbxvLmAUAs+tvfMjRLDx7LDYUeiJAnpArVl0Ey4Ag+gzGuulwnH
	oUbMNDY45038heZXvI801yb45o+gvUGuKc2jbUuZazPsfyKaL+sX0L3xHSYtg0g84Pp/Xb1wVNE
	7GXFPfo54/AKWUe1NrwxeAoKYd0YX4BVaqjadTgL/f8V+zZ6sRyvBt8Q1dTNxc3m9KlHiGVgs1C
	IZ5udrtP4xXyJLDZdJ6gHJ7JvaRK4VKc2GvQB1olht7iIWR12JnXuEFz7/9OEa2/
X-Received: by 2002:ac8:5ccd:0:b0:532:ad75:e432 with SMTP id
 d75a77b69052e-53388dc70aemr15514341cf.8.1790871914780; Thu, 01 Oct 2026
 09:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-james-perf-stale-python-build-v1-1-dd3b14644606@linaro.org>
In-Reply-To: <20261001-james-perf-stale-python-build-v1-1-dd3b14644606@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 1 Oct 2026 09:25:02 -0700
X-Gm-Features: AclHuK_fw2PnQE0lbF_B_VTbCQ5lekCKf5AOeTJerQ2_L1zY0y03w5J85D9iSag
Message-ID: <CAP-5=fVsTGp+_gsk-yCiK58A7O3LuK0okOuHwuVr+xgiSHVGLQ@mail.gmail.com>
Subject: Re: [PATCH] perf python: Track linked libraries as extension dependencies
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 8:48=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
> Since the Python extension switched to linking perf libraries, setup.py
> only lists util/python.c as a source. The libraries are supplied through
> LDFLAGS, which setuptools does not consider when deciding whether the
> extension needs to be rebuilt.
>
> When a library changes, make invokes setup.py, but setuptools can skip
> the build and the recipe copies the stale cached extension back into
> python/. This leaves perf and its Python module running different
> versions of the same code.
>
> Pass the linked library paths to setup.py and declare them as Extension
> dependencies so that library changes trigger a rebuild. Include
> EXTRA_PERFLIBS in the shared library list so that both make and
> setuptools track those inputs as well, preserving the existing linker
> order.
>
> Fixes: 9dabf4003423 ("perf python: Switch module to linking libraries fro=
m building source")
> Assisted-by: Codex:GPT-6-Astra
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
>  tools/perf/Makefile.perf | 5 +++--
>  tools/perf/util/setup.py | 1 +
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 7ceefc1da774..dbf7cceaa005 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -526,8 +526,8 @@ endif
>  EXTLIBS :=3D $(call filter-out,$(EXCLUDE_EXTLIBS),$(EXTLIBS))
>  LIBS =3D -Wl,--whole-archive $(PERFLIBS) $(EXTRA_PERFLIBS) -Wl,--no-whol=
e-archive -Wl,--start-group $(EXTLIBS) -Wl,--end-group
>
> -PERFLIBS_PY :=3D $(call filter-out,$(LIBPERF_BENCH) $(LIBPERF_TEST),$(PE=
RFLIBS))
> -LIBS_PY =3D -Wl,--whole-archive $(PERFLIBS_PY) $(EXTRA_PERFLIBS) -Wl,--n=
o-whole-archive -Wl,--start-group $(EXTLIBS) -Wl,--end-group
> +PERFLIBS_PY :=3D $(call filter-out,$(LIBPERF_BENCH) $(LIBPERF_TEST),$(PE=
RFLIBS)) $(EXTRA_PERFLIBS)
> +LIBS_PY =3D -Wl,--whole-archive $(PERFLIBS_PY) -Wl,--no-whole-archive -W=
l,--start-group $(EXTLIBS) -Wl,--end-group
>
>  export INSTALL SHELL_PATH
>
> @@ -559,6 +559,7 @@ $(shell [ -d '$(OUTPUT)python' ] || mkdir -p '$(OUTPU=
T)python')
>  $(OUTPUT)python/perf$(PYTHON_EXTENSION_SUFFIX): util/python.c util/setup=
.py python/perf.pyi $(PERFLIBS_PY)
>         $(QUIET_GEN)LDSHARED=3D"$(CC) -pthread -shared" \
>          CFLAGS=3D'$(CFLAGS)' LDFLAGS=3D'$(LDFLAGS) $(LIBS_PY)' \
> +         PYTHON_EXT_DEPS=3D'$(PERFLIBS_PY)' \
>           $(PYTHON_WORD) util/setup.py \
>           $(python_setup_quiet) build_ext; \
>         cp $(PYTHON_EXTBUILD_LIB)perf*.so $(OUTPUT)python/; \
> diff --git a/tools/perf/util/setup.py b/tools/perf/util/setup.py
> index 8380980ade4c..3b6a59f66944 100644
> --- a/tools/perf/util/setup.py
> +++ b/tools/perf/util/setup.py
> @@ -173,6 +173,7 @@ def main() -> None:
>      perf =3D Extension(
>          'perf',
>          sources=3D[os.path.join(src_perf, 'util/python.c')],
> +        depends=3Dshlex.split(os.getenv('PYTHON_EXT_DEPS', '')),
>          include_dirs=3D['util/include'],
>          extra_compile_args=3Dcflags,
>      )
>
> ---
> base-commit: 705da5b15ab89ba97b11eedbe507c2fd83d31cb9
> change-id: 20261001-james-perf-stale-python-build-d6b17da2f231
>
> Best regards,
> --
> James Clark <james.clark@linaro.org>
>
