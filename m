Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61A0356744
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149774; cv=none; b=grAt+kXSdvh1NfAgjyrS4gm3xUprCVaVbCjMEqLN/Wr/g6fxOec3zAn+GUs6nANdGIVxqJpZ+XH3xgRK2+CidWUH7Z4kJDM1I0VMl7mB0C4wZtpv0a0s3C68g/cwj1TtiYeUDmPPLH+oZrzhR22qgE3Tt6aCd08gil29WOPgokw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149774; c=relaxed/simple;
	bh=PZDKXhsnOOm/rg+wPngXQoB46dyeaM5jXlxhi28+X1M=;
	h=Content-Type:Date:Message-Id:To:From:Subject:Cc:Mime-Version:
	 References:In-Reply-To; b=BnnDeubj4CJ3URQT3WhYGm1ZKDIToOiHfTrmIuwobWUIIcPL5ec6hHnNjMwqepNf2Awmea+k6ZU0+OrIqMAkLLmAP51lOVbjay37TkOlWW7qJ6GYVnvID70opnNiL8sR4nhygNvfatZu45L0v33YdwiY6PRmX9uFiFDhnt0IPVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=NsdDXt2/; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="NsdDXt2/"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c13f2685f2so114292b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149769; x=1789754569;
        h=in-reply-to:references:mime-version:content-transfer-encoding:cc
         :subject:from:to:message-id:date:content-type:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKV8pgt3vtSfNHeRUuJb99Ky4+PFPl+5i6O7Gn1H5N0=;
        b=BnlsrV/h1ogSHgaWBtiLei5fw2BDaLOxrbuTsjU7DlHy9XB+UtKujzCBNLyjfd1woO
         UMtHXKdJc6VHNy9BjEaBo51/7e2U7kUCTLDXdvSy6qcposeqc3XTTqq5FbpYJIhwf+mP
         PtBAIJQvxdGPHeOpxe55VNQQejS8uUs65DTnpmHUjE3qseB4tc9rONpZO+FMrt1Ve1er
         iaA8Gr4n6VNYfzI5CP4y+pULXiNfzFgTEWjWgP3wCFFBx9Snxt6O+OuItBjWhuiC3++O
         V95XGAcUAeYyxFQA4XaHoAwKlRNInnKS5hqPKyao161nYHVUnSvWHOA6CIjhPsiLgQbL
         XdeQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6dRxn+SHcElrIVjWvvpWohZwHptGne4R/aMzcEDOn/hUFt34mkb/P/X26P0lWBbW3nYBc3rPPuXEEk/0=@vger.kernel.org
X-Gm-Message-State: AFuF++mTKfeFkmfcWKquOkRYx8txqgQ38469wK3jP9TrkJIwwfI5USFL
	JOfY3poal+Ciuxh9E85hlzHr7JwrT416eCLKER4ZwG6G6lLGG8qWZvaR
X-Gm-Gg: AYBFou0N5kXqOyyWex/uITa/E0171nyh4ADXx+I2+YSGGK34dAdlIVCBffkpYpkmXYD
	pJ+eO/9cSe32lpTvQL/odSkqDgku2X0t6xd3gGsCCAJfqmq2+98Bhvm618PwTZZPmWPMkN8NN8q
	z0QCADXQ69sg95TPcvmoFg7I0nD9ySfd3Yyhj5pBlKmc+9lO/LTJcep3AUwg1c1d+e8Wus7yD03
	ZSHWDilap440jTQ5FKoCn2r4SDZ9bWcOfaZ9s4p8ip5QkEpB2foebTe9KrweRc2XuH0CddySSeQ
	1GURqXYmODSlwALPDUy2mXdHUfo5QrksmwD9n2sXVLkt+eKEMnbfWce1jFibR5ged6Fi3aCdMYF
	zmVIYZoDuFHzoAxpHREYwMkxucXg1C4nNhUnmlNZ7yqqOVNHSAO1J0b04wLxqtlLr06XGsuoI4K
	8fiGPepbX2FGwUXANl9TbGjd9wsztvL5eFIgG7J1dg/idcjM7agXKs+GJrCyaTOewnjjeIAotQS
	PWtdcazmjadv1NTmVqm85kpv6NlDF6RZZ61zdgHy2VT9aBvblcUCrenRUngvJiE7FEQHJb9QRR5
X-Received: by 2002:a05:6808:1924:b0:4c2:a362:13a6 with SMTP id 5614622812f47-4c31bbef0b3mr5744032b6e.21.1789149769417;
        Fri, 11 Sep 2026 11:02:49 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c331bc959csm2853575b6e.13.2026.09.11.11.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:02:48 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CC5560333;
	Fri, 11 Sep 2026 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1789149765;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KKV8pgt3vtSfNHeRUuJb99Ky4+PFPl+5i6O7Gn1H5N0=;
	b=NsdDXt2/QvMJ9JT4J7OMOW13Fh2vAsoS1GBpAxZj3MT2MpjdqQsbmIdKmVqhEK7zWVdSCo
	fWSnEQKqJpXzIcfCZ8K4WLD2VoQkQTsJWwHA6BD1gLE0i+llypS0A7fnTTkDON2ZGUcBWs
	qADv423/e4aiBt7tEWqm2kAQQvTjwe65QfxXxv7YskPH40OpYSxxlz1hZ6hqVFyruBL9dS
	3R2mjYYmEDsMrODBmydo9A6kljYk/kXUbyu3AM2+w3LRMVwWIUgMX3x0lFDyRqUblsWgQU
	VR+qsDcp07u5CLMLMCtkgBmd8dAq76ZGN0vaF4nS1O8ekAyrEfYlm/kMrDmlNg==
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 15:02:35 -0300
Message-Id: <DLCONMRV8YJN.2JBF36K590AXX@marliere.net>
To: "HyeongJun An" <sammiee5311@gmail.com>, <bpf@vger.kernel.org>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
Subject: Re: [PATCH bpf-next] selftests/bpf: Tolerate libarena skeleton
 failures under BPF_STRICT_BUILD=0
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 =?utf-8?b?UmljYXJkbyBCIC4gTWFybGnDqHJl?= <rbm@suse.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Mykola Lysenko" <nickolay.lysenko@gmail.com>,
 "Shuah Khan" <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0-147-g86b4df97981e
References: <20260911141621.1944900-1-sammiee5311@gmail.com>
In-Reply-To: <20260911141621.1944900-1-sammiee5311@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Sep 11, 2026 at 11:16 AM -03, HyeongJun An wrote:
> The Makefile documents BPF_STRICT_BUILD=3D0 as tolerating any BPF object,
> skeleton, test object or benchmark failure so that the remaining tests
> still build.  Every skeleton rule honours that through
> $(if $(PERMISSIVE),...), except the three that build the libarena
> skeletons.  Those invoke a sub-make with no guard, so a libarena failure
> is fatal even in permissive mode.
>
> With a libarena source that fails to compile, BPF_STRICT_BUILD=3D0 stops =
at

Under which circumstances does this happen to you? I missed this because I
was using defconfig + DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT + DEBUG_INFO_BTF +
BPF_SYSCALL + BPF_JIT

>
>   make: *** [libarena/libarena.skel.h] Error 2
>
> while an ordinary program failing the same way prints SKIP-BPF and the
> build carries on.
>
> Guard the three sub-makes the way the other skeleton rules are guarded.
> The build then prints SKIP-SKEL and continues, and test_progs,
> test_progs-no_alu32, test_progs-cpuv4 and bench all link.  Nothing
> downstream needs a change, because the missing skeleton drops out through
> the existing permissive paths and libarena.test.o is reported as
> SKIP-TEST.  The default BPF_STRICT_BUILD=3D1 still fails on the same inpu=
t.
>
> Fixes: a6850fa388f6 ("selftests/bpf: Add BPF_STRICT_BUILD toggle")

Acked-by: Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net>

> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> Assisted-by: Claude:claude-opus-5
> ---
>  tools/testing/selftests/bpf/Makefile | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftes=
ts/bpf/Makefile
> index 7ea5ba1df29e..a9951774e5c8 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -835,17 +835,20 @@ LIBARENA_SKEL :=3D libarena/libarena.skel.h
>  LIBARENA_BENCH_SKEL :=3D libarena/libarena_bench.skel.h
> =20
>  $(LIBARENA_SKEL): $(INCLUDE_DIR)/vmlinux.h $(BPFOBJ) $(LIBARENA_BPF_DEPS=
)
> -	+$(MAKE) -C libarena libarena.skel.h $(LIBARENA_MAKE_ARGS)
> +	+$(MAKE) -C libarena libarena.skel.h $(LIBARENA_MAKE_ARGS) $(if $(PERMI=
SSIVE),|| \
> +		printf '  %-12s %s\n' 'SKIP-SKEL' '$(notdir $@)' 1>&2)
> =20
>  $(LIBARENA_BENCH_SKEL): $(INCLUDE_DIR)/vmlinux.h $(BPFOBJ) $(LIBARENA_BE=
NCH_BPF_DEPS) | $(LIBARENA_SKEL)
> -	+$(MAKE) -C libarena benchmarks $(LIBARENA_MAKE_ARGS)
> +	+$(MAKE) -C libarena benchmarks $(LIBARENA_MAKE_ARGS) $(if $(PERMISSIVE=
),|| \
> +		printf '  %-12s %s\n' 'SKIP-SKEL' '$(notdir $@)' 1>&2)
> =20
>  ifneq ($(CLANG_HAS_ARENA_ASAN),)
>  LIBARENA_ASAN_SKEL :=3D libarena/libarena_asan.skel.h
>  CFLAGS +=3D -DHAS_BPF_ARENA_ASAN
> =20
>  $(LIBARENA_ASAN_SKEL): $(INCLUDE_DIR)/vmlinux.h $(BPFOBJ) $(LIBARENA_BPF=
_DEPS)
> -	+$(MAKE) -C libarena libarena_asan.skel.h $(LIBARENA_MAKE_ARGS)
> +	+$(MAKE) -C libarena libarena_asan.skel.h $(LIBARENA_MAKE_ARGS) $(if $(=
PERMISSIVE),|| \
> +		printf '  %-12s %s\n' 'SKIP-SKEL' '$(notdir $@)' 1>&2)
>  endif
> =20
>  # Define test_progs test runner.
>
> base-commit: af0b84a9215d951d16f26b7ee34353b970cf5d4e


