Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794608181;
	b=iJvtvMCBCkT5jIlOuFP+bDurhBNUYkjhNC7R3ObdSi74dn3Tr0un6EYpWFvllDJft64w
	 WamRCMUuz2BaBII9EIyzWfLSu9Kx4cOMHSTrV8IbRgHqUBuzVpblYMhzy+bpzgTohdflB
	 Myda0X7vUah9cM/fLR4LGrntL/49rtOK3AvrCMzmF1sQmf2/uY8VqevCIz1cq1sRzkkaj
	 zkCDioLr43gRTgVgOAogS3kUEIO9uyQ1rQsSpRD0x0ExgXd8ZR4Oi1UDJbJkw39UF/VNj
	 IB+5J5iW+futMl+sxRmcDRoPfx6fBacGWX4gaQOzSTY9ITaQ32cVtWtvjJ6lbAM2LHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/HbOdkXMag7+QwoV4l3OE5fq7viwxSbwmRnha1ZYaRM=;
	b=oOsmAvZms9CjSVTBClUfFtQG362KL8CNRgegqBleSTNI+4kOBA0lu+k+pOTrxD2LGbdc
	 2BNb03yANY30cb6M/Q9S72oK+tYEmgFzcnFHACQilWUnWVMBmVC8TnOUmdZv6TNSfToEZ
	 91/YfTzXWtpcqTVpwg5/NcQ5xEt8dHWKCV8evaC9ddauFjDE2TIpoAMIu6VWYx2Ew/ffE
	 u1KDnDFmaVOwz0yU8OwKli0axIHyo1Uvm4jwzVbxkBzFoIM/vBCE8fF6n51a3szOkHN0u
	 hj7E7jPJ6sZCwUeGCLZ/TbcpkiB4OcQQgmU+TQ2RoKlQl95ADmTvmDqER37ibvOoIZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DnxpxuYq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56EE606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A56EE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DnxpxuYq
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533202fe429so29601cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:16:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794608179; cv=none;
        d=google.com; s=arc-20260327;
        b=EHj+cQa8tktiF0MHaSzctKP3T8q+3xmzbHHDYsqLYS7b70/hCScJIdaLKAxl6Ex8fS
         WxJBrWFj+Sv04xx2YgmAxqUEvlPVs1sGiEMz+y9mIm5NrQRuwNma2gpgKsULPlJhtvyd
         MN6BH84Ua/pVt9Rup+epMRI4oe3WKngxShPGR1mjmkMeadOGkZ0Cic20478mz1XO1Fbm
         nHkKgY1hx3wUqOVK2085IN0NfBdYoGSI6ypGFtlG6uTq9UbLLdJ3/8gYZjG2MVuOI9Yd
         px02zKDW86y8FLZqNSeDMvKxa0gSci163waQD8YdUoZWn9ixU5hIZYfr0FJyeriBo7SA
         sKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/HbOdkXMag7+QwoV4l3OE5fq7viwxSbwmRnha1ZYaRM=;
        fh=E9ETogZZmeCHy9ztyD3QYKNyWxlN65RahNqBGLZCdkg=;
        b=jeEmMkO01YG0iQtbLI4SuJ2Uyrph0OaUlgQ9f2GhyH1zgHW5BL4TzSE7ZpNRMHcWBR
         k47affX4VbARzAs+U/pbmW/z9Ri7lShjQ1VEREowgcmsZVzkYRaYQH4itTLLf4NQTxAF
         w8V+OvPXJNHTuVRMTewy7WHitXd6D3YsSK7LkXdYzg7ujEThPDRgFMoh6fqxkKOPG5qP
         ieZLMndpBThTpF0vTB1sxyqdBfcvoEDnPqOKYlVgIsb9i8Ehiyk1lJX+ViFuAkCJ6kTG
         3296VlPZ4dtArgzaYrvjqwHQAvN0m/tjOJkEZ6WN6hI6S8lzju6aI5OW/Y/kYVBh/wD/
         XqVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608179; x=1795212979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/HbOdkXMag7+QwoV4l3OE5fq7viwxSbwmRnha1ZYaRM=;
        b=DnxpxuYqktIGq56jk/ztorfQaoeO/3AU0H8ON9M5XunJV1DR4p/wI6UVMNffyGJQ78
         sREvL8VbwDSTuC0o73RREiUkQEQHHxTwFNh5Lk/fE2G8kWJM1wKNCUemErbh5Y6lRfUQ
         txT6Ufa1cXX38su93nf7jq3WQ6yvQADXEV7ujU9Q+JOUEpVjK8Q5O6aF2Yty1T5rd8yE
         5dhU5pOIanGsBPgfCzPdnSj1Gu5a/LbKiis3YF7WIjxAotKpb7M9xXa8a2XycOpkFw1Y
         U3Hu39wNlEFezo3mpiyqUgZMW+oPQTuYaZUEZF+CrgeMvq7lDXnymGiL9u5Fl6IJRzn9
         oOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608179; x=1795212979;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/HbOdkXMag7+QwoV4l3OE5fq7viwxSbwmRnha1ZYaRM=;
        b=Yg9Y8gVC8Ifuy3MAydeEkB1bJpxcF/5MYqNhyJqEOna9mFblWtnA/v+6ruvQwQ+5QV
         pHA89MPRA/j5eM83pyt0Xr1XkGLZ2g85HVEDcxR8+yZv3m39G83Kq4JV3d4oTzYXh3jB
         hEkwOX9/SHnFdfIBx78tw5ELVWzO9R00zTeaAA+LiRNSVDSs1kvW4mj/gbwC2nbFB0UL
         z613O/gtLbaQ6e5Cj8U17jNfoPSJpy0G1v3AKj6hzqzaTL1dswamqjn/qHXQEdvz90Bo
         iwLlDCW/YEaUvZGjqMvAnnF1cIVH8CKMREXI9TLWdzngtlhczs7WNI89bA7ixnOVOI6w
         smNA==
X-Forwarded-Encrypted: i=1; AL+hErElPJAxl5g+q9i4QBAZf3VuCCUB33h9Uf3kuVtDsRzVNfCwY1Og1Ob+ReHpbuvKG0Mi/fDwHsDaeGPRyEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OSlIOwyV3qlbo6MamdF5/9y/Rx81sD42iKb2wSC9xkBy2/Qbx
	MtL8lvXEqqOgzqjM84fMnCarif+7mneHl/gxPY+i9Iqyr7fHAuj10FwgapeLQDCs4yo9b10OowK
	nS07H6g7KFwjHQ9rlhEJoxJa+9JJHSPwVTIiHlDg7
X-Gm-Gg: AYBFou334hZOWuY55B+okLrUd1ft7Ne7yOHRDxmRvGc6Ipnl6FZ1h3XkhdrJo1sZXSx
	+OpqXlofYXAU74I+0NcQfBYBo0a0w5S2ASucHM9bmOynM4lHyWbAea6Bl0bm6aifk7TwuT6Y7y8
	3aaE0ISHXdZGsh7URcmIVHrvMrQgCPtUkKmU37etuxZsP4heK6Y27WdiRuYBfsJQ2tc0/JsynuN
	dtQDG1jFJTLFW72KjO6bVmFZd1t28cLcFxkjWzVQQUO8Pb+MqwkiKA4mxKLg8/JWaczumb6G3RF
	RmO2RfQPeZ+4lRpFWQ6gguHs0/6jpkvuT8XhWIrNlv61ZSXax/xXYCMwE0sMGBWRaymtC2LEM1T
	23BqWvm9kcJGxAIGGVZGuef8ymmvoXgROadLWi2XF9h1Wj8gXpvCamFA3lMglUawygfU=
X-Received: by 2002:a05:622a:53ca:b0:536:78de:775f with SMTP id
 d75a77b69052e-55c69c2ff17mr2165351cf.15.1794608179013; Fri, 13 Nov 2026
 14:16:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113200850.2803460-1-acme@kernel.org>
In-Reply-To: <20261113200850.2803460-1-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 13 Nov 2026 14:16:05 -0800
X-Gm-Features: AclHuK9NmNvcoESLqmGVD7lFBNU2Bql3t-oShpEw5-RBrs7NGcZUCfG6SP9QtS4
Message-ID: <CAP-5=fV1FRJcyCHg7vNjptZU996PBXcEcve5m3sYkUtdWSmT8w@mail.gmail.com>
Subject: Re: [PATCH v2 0/11] perf coverage: A harness for perf, and the fixes
 it found
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 12:08=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
>
> Hi,
>
>         Please consider merging,
>
> Nothing measured how much of perf the test suite reaches.  Patch 1 adds
> tools/perf/scripts/coverage.sh: it builds perf with clang source based
> coverage, runs the complete perf test suite and reports line and function
> coverage, optionally against a baseline, with --table and --html like
> pahole's coverage_table.py.  Also as 'make -C tools/perf coverage',
> 'coverage-prep' and 'coverage-table'.
>
> The rest is what the first runs found, in the code, the build and the
> tests:
>
>   - clang DWARF 5 describes globals with DW_OP_addrx, which was not
>     resolved (patch 2).
>   - The flexible array member had no test; one showed the struct row at
>     0.00% while the member said 100.00% (patches 3-4).
>   - A struct pointer that -O2 keeps in a register was not resolved from
>     its DWARF location (patch 5).
>   - --insn-stat was printed before the loop that accounts the samples,
>     so --code-with-type showed zeros (patch 6).
>   - The libbfd probe printed a missing bfd.h error five times per
>     build-test run (patch 7).
>   - FEATURE-DUMP didn't record llvm-perf and rust, disabling both in the
>     build-test builds (patch 8).
>   - The Intel PT virtual LBR check lost every aux sample with a single
>     data page (patch 9).
>   - The dlfilter test kept samples whose IP the kernel now zeroes on a
>     userspace-to-kernel skid (patch 10).
>   - The LBR inline unwinding check failed instead of skipping when the
>     AMD PMU rejects branch sampling (patch 11).
>
> In a root run on this box the suite covered 49.16% of perf's 201,180
> lines.  The POLL_HUP tracepoint regression and the lock contention count
> fail in code this series does not change; the LBR inline unwinding check
> failed there and now skips.
>
> The numbers above are from v1 and are slightly different here: the
> cs-etm patch was dropped and the issues reported in the v1 review were
> addressed, which changes both the tree and what the report counts.
>
> The harness and the tests were developed with an AI coding assistant
> (OpenCode), which drafted the script and the tests and helped debug the
> failures; I reviewed every change and reproduced each failure before
> fixing it.
>
> What changed from v1:
>
>   - Patch 9 (cs-etm) is gone: Leo Yan's series replaces it.
>   - Patch 1: O=3D is accepted by all targets, the Python extension is in
>     the report, -f is normalized and the delta matches its baseline.
>   - Patch 4: the TUI browser counts flexible array accesses too.
>   - Patch 6: the stats test skips without libdw.
>   - Patches 9 and 11 (were 10 and 12): Fixes tags corrected.
>
> Best regards,
>
> - Arnaldo
>
> Arnaldo Carvalho de Melo (11):
>   perf scripts: Add a coverage harness for perf
>   perf annotate-data: Resolve DW_OP_addrx global variables
>   perf tests: Exercise the flexible array member path
>   perf annotate-data: Count flexible array accesses for the whole struct
>   perf tests: Exercise data type resolution from a register
>   perf annotate: Print the stats after the annotations
>   perf tests: Silence the libbfd probe in build-test
>   perf build: Record the display-only features in FEATURE-DUMP
>   perf tests: Fix the Intel PT virtual LBR check
>   perf test: Drop samples without an IP in the dlfilter test
>   perf test: Skip the LBR inline unwinding check when unsupported

Thanks for working on this! Patches 2, 3 and 5 add small C programs
compiled in a shell test. These are a pain for our CI framework; could
we add them as perf test workloads?

Thanks,
Ian

>  tools/perf/.gitignore                         |   1 +
>  tools/perf/Makefile                           |  11 +-
>  tools/perf/Makefile.config                    |   4 +
>  tools/perf/Makefile.perf                      |   4 +
>  tools/perf/builtin-annotate.c                 |  10 +-
>  tools/perf/scripts/coverage.sh                | 722 ++++++++++++++++++
>  tools/perf/tests/make                         |   2 +-
>  tools/perf/tests/shell/addr2line_inlines.sh   |   9 +-
>  tools/perf/tests/shell/annotate_stats.sh      |  64 ++
>  .../perf/tests/shell/data_type_flex_array.sh  | 142 ++++
>  .../tests/shell/data_type_profiling_clang.sh  | 108 +++
>  tools/perf/tests/shell/data_type_register.sh  | 120 +++
>  tools/perf/tests/shell/script_dlfilter.sh     |   2 +-
>  tools/perf/tests/shell/test_intel_pt.sh       |   9 +-
>  tools/perf/ui/browsers/annotate-data.c        |   7 +-
>  tools/perf/util/annotate-data.c               |  24 +-
>  tools/perf/util/annotate-data.h               |   3 +
>  tools/perf/util/dwarf-aux.c                   |  42 +-
>  18 files changed, 1260 insertions(+), 24 deletions(-)
>  create mode 100755 tools/perf/scripts/coverage.sh
>  create mode 100755 tools/perf/tests/shell/annotate_stats.sh
>  create mode 100755 tools/perf/tests/shell/data_type_flex_array.sh
>  create mode 100755 tools/perf/tests/shell/data_type_profiling_clang.sh
>  create mode 100755 tools/perf/tests/shell/data_type_register.sh
>
>
> base-commit: cc905a18a647a8e3ad42cd1596baa0e08fba26eb
> v1-head: 3f5465bea8f5a97a
> --
> 2.56.0
>
