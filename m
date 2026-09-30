Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B0451DE1D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790300; cv=pass; b=Na+Dm+XOSNm7uLBo8VxUuZFBfsi8Xb58YJnkfwfD/lk0ezsBXjssKtDuwg7kzRsaCke/+hJbqpaK5zaZ8MA/51JMtAX9UdO48u2nRa0tdJP+DHyBYJoOD5gKKz4NbShTa7pHBb72g4AZ7b7jmBPVnCDsRWo+pF677TZzMcFYU8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790300; c=relaxed/simple;
	bh=dTMeDWBANZwX4zFzq7MAqH9ZhFq7Chw/56eNHl++Lw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c0lHZH9shSLFDHDb/k6GqsEvw/6uiXFFVQfsI9m+hflkb9t3lP71/bC3jb85i2ZRjpsbSfhnLmPzmfeVXiGQfmWuCnxhXPdQEvkBsIUd0RhTHHk4cqbQorr3uEncstLVyzhVc6raIf+NDutZAOwURovL/TxhUAgblw4cjGGKCRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aEmEfaBd; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aEmEfaBd"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e2e4ef20beso6685ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790790298; cv=none;
        d=google.com; s=arc-20260327;
        b=Xtcccf/A0H1Wx51ZqSOTuQbA2Im0wGqHzN5C3nOG5KKP98VkPSVr+QIeDHb6yz8PlF
         7nzldsVW7FlcU/jC0SQyoBs/BwZrX2Em5Q3nPey9THxbTX7aD2GBE5NrqV1N0j92FD6D
         GWhZCg2otDuUUiZWEnhsZkPDbxwUDGgzptV6M+we+sCizOim6sXp4iuSHFd98s+FbpW/
         8d9CIhmjPiIcPbqJ1yjpq4iLVOiWbYaSfhIqseGj8biTZirpN0BKStteDa9urDXIIbTj
         4o6gJltY2CT/OhAaztztpmAqjtMqJtzC2d4dfa2i8zT8vW5LlS6u7y808xzLaQH5pEOx
         6NYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vngjmlHD1xi99YkDD1eun3vfRJyktfk498bj+4C7248=;
        fh=r6fuRPG8BJfSrBvxK6xB87Pes6COaOnWXjGKZh3POpY=;
        b=gRvNSXUlKgXKLtwpL3Bb3VSDeq9uB8Q9MybCyq293KKXPpf+UHgQDnLhVuiWe+Yw2z
         IOBkSsEgSule+GuEy0TTFs4Jyj4e083pAEJNnNrdjD2FfcEyJ5ItQ+lfq5bdvy3ZsDrn
         8nC6xfFdvflU0A/hHfRyKixpaoMV4ki1GYDts+11Rjr5vtuLGvaT0o6v8unVAtyp6j82
         Xga3SFRAHEd/n2uuWdPJdxyniTp7rgvAfp1Cz/o5b7VByyV0Vs3hlCcONDJwpohftlIm
         OnERUdY0q4szvpAEJ4LS6tYz/qpejZ6cQQaQo6C/C4wbVdxbQsHgH7Yfy21pRogq8z5Z
         QtuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790790298; x=1791395098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vngjmlHD1xi99YkDD1eun3vfRJyktfk498bj+4C7248=;
        b=aEmEfaBdRi1bvohp0k0CgcmSYMB9bBPTOVPMGa3b12RwXohDhrDrc4J7o+aKZ8nLg6
         NcMj0hmX3Hz1NmRspa/fQ3i1YimdscIwU0oQ0MOZUq5A7V9N+9NSPrCdIZcDXgiAcr8k
         ofCPvjpsBLstwl+jPw7xSv+IWy80ROBx9DJTZCvNcgwlbedt9SaVeNFiQ1DGZZ0lxC3n
         jwIzMA0WjjVZtergorxUoP1a20w0k3CPh6D/7lWiKlT1HOp0dXB9i/LY1awQdjf0Ri80
         3IatRmy11MqdJqMpJcjGIgr49F+UqVV2DfLXZep6Rt+omQ+02gXytBXUm0er9pAaFVeK
         NgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790790298; x=1791395098;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vngjmlHD1xi99YkDD1eun3vfRJyktfk498bj+4C7248=;
        b=nE1NxdfjZy1bTD0gSApVpfQ6uxvT0fgOU5ExFKLWhJoI3gaRw3F2xPpN4u/JoGY2p+
         BxKhO8mphwzr1mEUMdP2oqtSVO+Jtw3Tol4D4BK7NNGHQcO0Kx7M6qQx5u99/N96yAN+
         20bMmeh0M5LA7CTE1pt3d5ZXI9mCtEXSbZisQBilG5vSsluUmPAxr9oMFfHnr4Uyazkn
         ekH3dXtUdQQJk3CWjFIiSSNW3W8zd5tTy44iZqxxNaIoKfy5NlNCTa6E+LlpqpWd0GDj
         I6k0KJ3rXrKeDJuxGFOWg4s6iNBB7GwzudF67FuFWv6qKieKwuV7e8TBsk2A4O6gfhp5
         R63g==
X-Forwarded-Encrypted: i=1; AKwUvBzgavY+Vs76bnv30aH2Ti+Aa3RkGRJJbIdZhcrO51WrtErKeXaELh9Q8bObincwNWAJNd7iLsovp5bByhQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR6iZ477KiGDMxrondf2musAsQyqk38Nhv2xIFd7beADicFG38
	5cILnhdzKjHL26PevBWG/AyQZ5eQuj5edz17PnKTiLeo7G8tmUmraAnrJt70XGuw1gPv+Z1XFX+
	96vTvLwCQYb73iuoWYZR/bEfxZTDjf5dFy7ckOaGB
X-Gm-Gg: AYBFou32VtSA9tXclLRZu4tPAwypgo43mvt11iXAzlVHtH5OSvQwEsO5NwcKtGi8361
	ktln0zJEoHwOrXpX8T5LzxUN7g+PntxVBAjNS2PizSndLjAVV2id7fZnEPraVYYKJxJQlXyy9J3
	XIxj9eAN8tsiCzacWqPcNiMlUWS2slKU2esSZwMTBi0Lz7QaGV7yUpu6AV45Qp5NCuhXiIOoyR3
	XZjqSeQkHPUe2XzjtEjK7QMJSkh2or6m88uW/ylf9m/bO6gff8jBWHzXlRrEvX7r5OioJtJcWLq
	Y1JUKDxCHns18bhNv+9DNneK6TGv1EdYk4GSb9A5BFn8EZ44Tq6EVu1tebIzl70d3JpwlSKLU1D
	1tCCKPIHZAg==
X-Received: by 2002:a17:902:e54c:b0:2df:96ca:d7c7 with SMTP id
 d9443c01a7336-2e301dece82mr251145ad.10.1790790297249; Wed, 30 Sep 2026
 10:44:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-perf_fix_pylint_errors-v2-0-945cd526576b@arm.com> <20260930-perf_fix_pylint_errors-v2-1-945cd526576b@arm.com>
In-Reply-To: <20260930-perf_fix_pylint_errors-v2-1-945cd526576b@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 30 Sep 2026 10:44:43 -0700
X-Gm-Features: AclHuK8Q8xPg6i3xX-fz2gQbZHAvDFk-QDgWrco9bghsWQtgt8BR2aK1_aiIAF0
Message-ID: <CAP-5=fWco1iTWud2Z19bpBQMgNC1E6TcyZU6unjdZsi7NJgz1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] perf build: Build the Python extension before
 pylint consumers
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Aishwarya TCV <aishwarya.tcv@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 6:11=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Pylint checks for tests and standalone Python scripts can run before the
> perf Python extension is available. On a clean parallel build, an import
> error can stop make before the extension is built.
>
> Run the script and test pylint checks in separate sub-makes after the
> language bindings are built. Keep their rules in the respective Build
> files so the perf and perf-test C sub-makes can compile concurrently with
> util and the Python extension. An isolated make perf does not need to
> build the extension just for these checks.
>
> Fixes: 8a54784e708b ("perf build: Add pylint build tests")
> Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks Leo! Should we do the same thing for mypy and shellcheck? This
should help overall build performance.

Ian

> ---
>  tools/perf/Build         |  4 +++-
>  tools/perf/Makefile.perf | 15 +++++++++++++++
>  tools/perf/tests/Build   |  4 +++-
>  3 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/Build b/tools/perf/Build
> index 8a0b5592a973384deafc5bb5cc7ed0cc91e0257e..09fd88f5aca54118a9b089e9c=
20124e23de77517 100644
> --- a/tools/perf/Build
> +++ b/tools/perf/Build
> @@ -102,4 +102,6 @@ $(OUTPUT)%.pylint_log: %
>         $(call rule_mkdir)
>         $(Q)$(call echo-cmd,test)$(PYLINT) "$<" > $@ || (cat $@ && rm $@ =
&& false)
>
> -perf-y +=3D $(PYLINT_TEST_LOGS)
> +.PHONY: pylint
> +pylint: $(addprefix $(OUTPUT),$(PYLINT_TEST_LOGS))
> +       @:
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 0102c3468a0b79fb22966d8cbd8fa8525d2ff3ae..0eb4e7c29c400021907d3da71=
6bc4871f0df8d88 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -578,6 +578,7 @@ strip: $(PROGRAMS) $(OUTPUT)perf
>         $(STRIP) $(STRIP_OPTS) $(PROGRAMS) $(OUTPUT)perf
>
>  PERF_IN :=3D $(OUTPUT)perf-in.o
> +
>  export NO_JEVENTS
>
>  build :=3D -f $(srctree)/tools/build/Makefile.build dir=3D. obj
> @@ -633,6 +634,20 @@ $(SCRIPTS) : $(OUTPUT)% : %.sh
>  $(OUTPUT)PERF-VERSION-FILE: .FORCE-PERF-VERSION-FILE
>         $(Q)$(SHELL_PATH) util/PERF-VERSION-GEN $(OUTPUT)
>
> +ifdef PYLINT
> +# Run Python checks after the extension is ready, independently of C bui=
lds.
> +all: pylint-perf pylint-tests
> +.PHONY: pylint-perf pylint-tests
> +
> +pylint-perf pylint-tests: | $(LANG_BINDINGS)
> +
> +pylint-perf:
> +       $(Q)$(MAKE) $(build)=3Dperf pylint
> +
> +pylint-tests:
> +       $(Q)$(MAKE) $(build)=3Dperf-test dir=3Dtests pylint
> +endif
> +
>  # These can record PERF_VERSION
>  perf.spec $(SCRIPTS) \
>         : $(OUTPUT)PERF-VERSION-FILE
> diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
> index 8fecd539012429c0f517d95f145a91137333322b..05c545aac73232a322652a611=
9c3178f39b83145 100644
> --- a/tools/perf/tests/Build
> +++ b/tools/perf/tests/Build
> @@ -119,4 +119,6 @@ $(OUTPUT)%.pylint_log: %
>         $(call rule_mkdir)
>         $(Q)$(call echo-cmd,test)$(PYLINT) "$<" > $@ || (cat $@ && rm $@ =
&& false)
>
> -perf-test-y +=3D $(PYLINT_TEST_LOGS)
> +.PHONY: pylint
> +pylint: $(addprefix $(OUTPUT)tests/,$(PYLINT_TEST_LOGS))
> +       @:
>
> --
> 2.34.1
>
