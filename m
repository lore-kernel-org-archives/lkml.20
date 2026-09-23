Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F1B579834
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195929; cv=pass; b=GCeBcEk3wGaPer8/AvC43UU1bV3kkcXbu63toK04p0SSTDdSp6PPiwQOuBlBUJWsHEUZiFG9ljOgnClxh/H+dLJHlRbDFrSTv32M/j+d2+YcFkvpXcvDxkjfG6y/lvO92Z9D8AZQc/Bwk1Le8DrH+tWa+bC/Jls5V8HUWwEIRaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195929; c=relaxed/simple;
	bh=1323NqL3CnlUce5XBrIJSLy43Ws8JZBp7hMlzmPHrRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tETWwBcnS3fFjxvMLbjRptY/4OTy18uIRoyJHzmCpukWH3UjO49se9Ft/QBUf8CuWwHoCVQVPQKPXFlWZsVM5ay7ezlZHwszAW/qJRCd3yxBUnIynBpzJ7F3pidv7BzSzXekYQFMdjZ3kW7qe2Ey4UBmXTJlVVFTqOHKvk9UUmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UTK9jh5A; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UTK9jh5A"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d3b445a84fso4935ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790195917; cv=none;
        d=google.com; s=arc-20260327;
        b=AyjjRWLMJ1znII+pQkvmUJkAgBXrmbCIp9H4HkEVO44DYX2KfhG2/L/GclkIVD1tpk
         bBcK4+5QTRTm6t6Aj9MZOjZIFW3evWE13/CzcQQsfQbg+OeMZxzNqcvFkaOUvPU05S1X
         +Rzwg0HQyPKPj9A5vFxoAYJZa7jSFQTJSAM0Dp6yYQ7kMvIE8DkppcGN0YLqz6waLuYD
         o5S1C8hu4iQes0ihGlvrBFux8WofoHxrwTaMMFRYxpR+3u9xAoA6G68be2WLozLQ2wqJ
         /ZL7GjHeaYrPhNMoRtQZnpJXtwrt7mND81t5mqFjPNX+WmL48VWhd/5Il7QOjd9geYvM
         seyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J915CxCyoQiRvBpeSoeKGmPezPQTdfg1IocPf7kC9Cw=;
        fh=cdMWYZWu7KD03KouifDcf++lbrMuwIukn4uGWyS637o=;
        b=QZSfiuwYuat7DlS+L+qcn/G+If5sIfQorJmJxXKJAocQLuhI/cnDiD97kTmMBxYScc
         99ej2k48x3gh1cYfJMbsj1fNB+cAYHG8mO42Ak1zJhYt7U7zH2Ispa3XkMI/INHwZO/r
         JnZXVv5GkYc3nt+BknmTVvOQMxncDbVhXeuFbr2psqQdxWPsGkC5ChM9V/Aqo0kA3iws
         NvLBduemH0nnhxYWchPXooNBSpDLuNk6cCB8TY9W6BlXppzpM0IqgwjEcI5ZUSGl4mSm
         PSn3COk+Xw84QQXyxnFVIUsVDS52i/g4I7E7ShMMRDXuz2NWw21R0jJxkBwPqBsv5Geq
         qGNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790195917; x=1790800717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J915CxCyoQiRvBpeSoeKGmPezPQTdfg1IocPf7kC9Cw=;
        b=UTK9jh5AVVPYAgpwE98Cq9VszKtqOjO+4QCEih0/J4NpXCRWlSJkfsCe+vtjnlDbHG
         69baWXT6tHwAlZUtTDrb0ednkMLW9EazC9un0TgODObSjX1m1bDrOoruD1+Qp5GkiJ57
         BEx42dvy0cFvkDs+5EToZCljzI0uv/yHO1YWJxKEFEDXVco+Wqy9mfifTwRE3gCzQyd2
         TWjES3E8euDKKfC98Tt9NVFz/DIUjuT0s6YGKaRfjaMx73+GTZhHWO2xWqkPlOIfBir6
         AkEmVGx8sKXkY/rfSg8SV6nQVsdapJOEHDAw+SniHjszsJ3FLI0OIq+khZshgZ4kJcIv
         p3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790195917; x=1790800717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J915CxCyoQiRvBpeSoeKGmPezPQTdfg1IocPf7kC9Cw=;
        b=x6nnUbAgjToxrECQ0kpkJcjt+p0GdDMiUooHqUOUGYJOSA6NstZZiEtzD1xnT+OWYv
         I4TYGtSuZpVBD0tRqKOd5Qbme7fUoi5fJgWJLFsJ9KZrDgqeIEUdabZSSh/jelCZD/L6
         j8B7IAV+OltrM6Pw6DGWMr7H3d1IDtOztnGf8EHwNgiVoHfySmODadSY9ulp4pZU+g28
         O96VW9sm4pFZ39sqS0Sw7xJ4wckE2sy8HTyoV2SzCDJ335TUt731tzP0jvmkJAdDWtBf
         KWjlsO3HkvRoP0MvJM4UH5EDwBf3314Clv7Iw1C8lufHqaQLAC4U45YB2eUoPSfsjlIj
         I2ZA==
X-Forwarded-Encrypted: i=1; AKwUvBzqjooRe/jQv+3mJuvALF4aUHeSuk6YY2FGP6skANyCuoAIzX17EVHxdh2AguwTFmAGssRwbWMZR7++lhM=@vger.kernel.org
X-Gm-Message-State: AFuF++kPomQoh86HfVJh1KwK9NQwFR6RnMMekleisQmPkKNo8dB0ujmw
	ZEFihOB61I3WCUut2xRM40tVBpFdyhe2iZsJng8+EKk1IlaXr6dPIbQbZwO8ZJkHIJ8MytEVp8b
	kywbZC37BOBUcw+8/yWL4tG3DJRA45hjL0Y2FwxJD
X-Gm-Gg: AYBFou11GshtMUVGqoofLqYbPvSDkHLzLU+ot062JjSqFhYkL+paNZMqx8wJy4KeCss
	BavELAO3XjThJxH9INIw5JC0THZPSZ+r0IVrStXICGa6Z9jU49afufJMIqzTB/BSb5uYG70pIkC
	4XI9rku3JvJ+bUVVKNSL2xlw/9jBJ2fMaScl4xJQLFrTN+tYt1z+T87+Msmf1dNgcH4fhL2JlEK
	mHDbxxwEuI+ss56sLlVCRKEnNQfO+IAQuKh+/D9Jw6YGzi1B2dcf6Sb32ruufv8S7b4xlTo9wPk
	IpYqIFM1NFUTe3fm2zC/+4oW9cmB202oBS5UeEWJC7GOlkCAz2IB4tXD1TgPgVlyJjWoOFC4NCR
	4CYaCz1m+Uw==
X-Received: by 2002:a17:903:3546:b0:2d5:db3d:1a43 with SMTP id
 d9443c01a7336-2df7b543459mr2096965ad.16.1790195916082; Wed, 23 Sep 2026
 13:38:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923090429.2026529-1-stian@itx.no>
In-Reply-To: <20260923090429.2026529-1-stian@itx.no>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 13:38:22 -0700
X-Gm-Features: AclHuK9IEgUm7kI4_piSGvTKV7diZ2jvf8wc2SM-hRRU78_gdW8Ka0g33Qc7YwM
Message-ID: <CAP-5=fW4bzmy5_6a-8YucOy7JGKg+izRbq+7TaOGKV5aG0oYcw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/3] perf: sparc64 user regs and stack dump, with
 arch hooks
To: Stian Halseth <stian@itx.no>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Andreas Larsson <andreas@gaisler.com>, "David S. Miller" <davem@davemloft.net>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:04=E2=80=AFAM Stian Halseth <stian@itx.no> wrote:
>
> This adds HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP to sparc64, so
> that perf record --call-graph dwarf and elfutils' eu-stackprof work
> there.
>
> Two things about the user stack dump do not fit in arch code. The
> sampled register window's %l/%i registers, which hold the frame pointer
> and return address the unwinder starts from, stay in the register file
> until a window spills. The kernel already flushes them wherever it
> exposes user stack memory (perf_callchain_user(), ptrace), but the stack
> dump has no arch entry point where that could happen. And a 64-bit
> sparc stack pointer is biased by 2047, so a dump that starts at the
> register value begins 2047 bytes below the frame, and is empty when that
> page has never been touched.
>
> Patch 1 therefore adds two hooks in the style of perf_arch_misc_flags(),
> both no-ops by default. Patch 2 is the sparc64 implementation and their
> user. Patch 3 teaches tools/perf the sparc registers and DWARF unwinding
> from the dump. The matching elfutils changes are attached to the
> tracking issue:
>
>   https://github.com/sparclinux/issues/issues/99
>
> Tested on an UltraSPARC T4-1 on 7.3-rc4: register values check out
> against known contents, --call-graph dwarf unwinds correctly for both
> cycles and cpu-clock, as does eu-stackprof, and perf stat/record/record
> -g are unchanged. Starting the dump at the stack's actual address
> matters in practice: with the dump at the biased register value, 94% of
> the user samples of xz -T4 had an empty stack dump; with this series,
> none do.
>
> Changes since v2:
> - Patch 1: add perf_arch_user_stack_pointer(), so an arch can start the
>   dump at the stack's actual address (sashiko review).
> - Patch 2: drop %g0 from the uapi, as trap entry does not save it; the
>   PC takes its slot, as on mips and loongarch (sashiko review).
> - Patch 2: start the dump at %sp + 2047 for a 64-bit stack (sashiko
>   review).
> - Patch 3: follow both, and comment the max_dwarf_reg adjustment (Ian).
>   Drop the memcpy() change to memory_read(), which the unbiased dump
>   start makes unnecessary.
>
> v2: https://lore.kernel.org/all/20260922201507.1719668-1-stian@itx.no/
> v1: https://lore.kernel.org/all/20260922135653.1622301-1-stian@itx.no/
>
> Stian Halseth (3):
>   perf/core: Let an arch prepare and locate the user stack dump
>   sparc64: Support PERF_SAMPLE_REGS_USER and PERF_SAMPLE_STACK_USER
>   perf tools: Support sparc user register samples and dwarf unwinding

For the series:

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

>  .../features/perf/perf-regs/arch-support.txt  |  2 +-
>  .../perf/perf-stackdump/arch-support.txt      |  2 +-
>  arch/sparc/Kconfig                            |  2 +
>  arch/sparc/include/asm/perf_event.h           |  5 ++
>  arch/sparc/include/uapi/asm/perf_regs.h       | 34 +++++++++
>  arch/sparc/kernel/Makefile                    |  2 +-
>  arch/sparc/kernel/perf_regs.c                 | 74 +++++++++++++++++++
>  include/linux/perf_event.h                    | 11 +++
>  kernel/events/core.c                          |  2 +
>  kernel/events/internal.h                      |  2 +-
>  tools/arch/sparc/include/uapi/asm/perf_regs.h | 34 +++++++++
>  tools/perf/arch/sparc/include/perf_regs.h     | 18 +++++
>  tools/perf/check-headers.sh                   |  1 +
>  tools/perf/util/dwarf-regs-arch/Build         |  1 +
>  .../util/dwarf-regs-arch/dwarf-regs-sparc.c   | 12 +++
>  tools/perf/util/dwarf-regs.c                  |  4 +
>  tools/perf/util/include/dwarf-regs.h          |  1 +
>  tools/perf/util/perf-regs-arch/Build          |  1 +
>  .../util/perf-regs-arch/perf_regs_sparc.c     | 67 +++++++++++++++++
>  tools/perf/util/perf_regs.c                   | 18 +++++
>  tools/perf/util/perf_regs.h                   |  5 ++
>  tools/perf/util/unwind-libdw.c                | 37 ++++++++++
>  22 files changed, 331 insertions(+), 4 deletions(-)
>  create mode 100644 arch/sparc/include/uapi/asm/perf_regs.h
>  create mode 100644 arch/sparc/kernel/perf_regs.c
>  create mode 100644 tools/arch/sparc/include/uapi/asm/perf_regs.h
>  create mode 100644 tools/perf/arch/sparc/include/perf_regs.h
>  create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-sparc.c
>  create mode 100644 tools/perf/util/perf-regs-arch/perf_regs_sparc.c
>
> --
> 2.55.0
>
