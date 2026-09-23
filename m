Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241B0480DF1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790205021; cv=pass; b=a9NCNpQu3nt8sDnZC3Ib4SsYWdZvWplATGl8Ho18J6Zp3lEAUC/uAOv2n8HBEpxFmFVpuYxwMvp5w8wBOzo8ZoVECE5gTyoGSNQNpAHtkMsFFt5LHHSaPfIvGQhMNis1VnFbpTxYGfH82+QmPkIN4dYauxEFosnw1e85FSToNPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790205021; c=relaxed/simple;
	bh=pA02lskqEBJ7xcsCEpir2dIlgRb+8WSAXZpU/r56rPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UN3H924Vry3Vy7VjpoJKhT5aUTzksqERRu3GlZ82FyuorjJGBZHvHfK/QvI20Wt4O80o5oz79HSwv/1TZchRIn+xqjLGBjTKUanjg70HI7jlfH+sdgso4Db6oJULHFehm1d/nA3DJEwaaD9yMOZY5sZqR4ySXE2fb/+xvHwNzHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QORHoqjV; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QORHoqjV"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso2779420a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790205017; cv=none;
        d=google.com; s=arc-20260327;
        b=aWsYb7xWxbNokZcELRiiM4M1aF96YMcHOUusdRqe+jV/61nS4foqemcKj95UF/6wgv
         U7hUtaxc4i4QbVmFB+3vicrrDKMg4swXNYb0oqqPG9Rn6BlFSERbYngnJjgm0Qq4BFPp
         K+MDWjs/wlsfnzumQX6UAYd0pipWbx8lL+RedKm/XMrATHLFvLXgB8grqf/wsdcJAroE
         p3qh4Q/YdB6y8L4O2teBgbvcYx38/RGcIA+bwBlckxGwKf2E9H16ajnUy1QEbtfaaicj
         4ergK5o5F6w1t6DNz9iP2juJ5q4Yz2FGeBdpF0SkFQ01M1lhK/vGlP8iVPpUr+XUciYd
         YkKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v8CDt3YaPNv1qQdHjAb4WFBPEg/nrTUGnlyKUfZeYLw=;
        fh=X5NwFvRr6mFIWvOUmAcuqVx0pWc6VcqUrlwHmJXBcZg=;
        b=I2HHSf2LYIlLJv92HFqp+lBynb2UbCLFRtm7RTnQvYmEjY8KC06wjRM689Xs6iIG6k
         xfEmsF0ZgSLH3v2hKD4LbOZHMhne5MKOSIs4dkgOEbPZAhn/sI+CcHBv86KPGBHGOyZY
         N6TYuo2oxAUyn9p5MW83kp4RQkiEbAByR9xEzGM+JdEi0sYXT3rjruMPviXUi129zY7p
         DI+k8i/fkP6TD0+cmX9pX1Swbe7fL8hG0OT3S2GWwbauQHOqkM/QAJNIEZd++Hg9IWH6
         KRGaf0xPr4tsbyNMyjQg5G+97SzeU3iYvQu7NRSzooMFCZVXUKczBbt5KxFLCQWOEaSz
         kcYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790205017; x=1790809817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v8CDt3YaPNv1qQdHjAb4WFBPEg/nrTUGnlyKUfZeYLw=;
        b=QORHoqjVPTTcJfyGc1AeBOqQ3nh3x5JsvFUo29nuD8Kf1uqSsim/YDnrBtP0mf6/nJ
         j9A2so7EEBaDxmCZ3rTCx3yA1GMY7TkRdYBYrPHc7Gba3YRWt2aSowYqxZIDWtBa/JNz
         e7KKwG5p09dXcUTtJKoMtqDvLLEBXn2qtIhUZrB1zBfb7XcS7lv3MtZY08StClB3UyU2
         ty7BZcOEuzIP3C+R6LF1fzgpdLXqrxgMfpS5Lendu9G+oh8+e5ostj05fIbWGgzanlQW
         uBNwn9arzBfgD7cVdDLKRlvGlX4iIgu6O7rZCLZ5hqqXM7JTFBZeuHwHJYrCize1Z33R
         NMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790205017; x=1790809817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8CDt3YaPNv1qQdHjAb4WFBPEg/nrTUGnlyKUfZeYLw=;
        b=PmJsf6YZtSJNmNT34WNzJN1mTNPPYt5Qvz1MeCe+4YGnelzHnHE52kvUKd6GttUbBi
         icRHBr6eYtOrBA8oLhxSli0fxBPpdIbBdS26HOLJp6+fh7SX46O7NTok+Tt6Aobbi4XO
         jh8Wj10uecD5bW8jDFghpHmiJS+ILkiOVrdOtZQRukD1MkySQKr7s7yYU63uG+OiRGAF
         kHgPnSgXlDZGFgrolRy5itffcj4fDkgONItWeCfhD+ZCN4ulmeSZI2wEGpjPMahPtyYQ
         j4w3nr2CY3Zpekn4zHpijjQ4PNlZxUc8WpWtYHGXtOo4FWfxNzSIfX6oVQyk0qIPN/ia
         hcuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwd/Ky/HZYotVuXZeZ9LK08HpEDNt9HKt/mc0mUlacpsLJsmI1MAfgXnJp/z5Q+kKGDiOMQNL+1BfQ1woM=@vger.kernel.org
X-Gm-Message-State: AFuF++l+LJ0lL+i6OD8oPiNrLxzN8dgNgbzKTZ7WBO1Omng2LwqNqvuh
	7Kg8Grc8bd6mvVCQV7fV1gGElV70trSi8Fi5cxLO0hk8GNXmM0Rz6eF+mbyGrMceY1d73uoyF5N
	mNHHsbLctrx3wxaF2K5JaSyfXTqCoURk=
X-Gm-Gg: AYBFou0I+KUJPgW25zfpU+dntY2rTg3rN1oTRk8/fUEadAzaT/iYxrtlwekU0ixR33Y
	tzDSOUQbsFFWIGVbsUqgeMZFdBR7GXiRH6Z2jO3ZiL6wuxd1Anb/sL1oabKRfDhdXcM1xjmiRw1
	toWxftC3AQWO8Y25x6Al4oFGEYOHVdIxLerUpws2wi9EgKxW/GlDid5oedPQJr3sPz2UNsJceAr
	lEatwccNs1RStbmMKyvxpIOryjeEWv9AayMN8bIg9CP4U3GA5ziuwXdzM+98AZXU17bCLYJNFyj
	hLSZQuzjQiR8/pnSlVzJPawzjgYKP/EpzhvZKcNhg60pzjKvfWrPZ60wHWrm73boYMWsvM4bDm/
	/0edt+eJf3c/wkc/N9kpfDMZRS3c0N0IU+uhvRvrNQ35xWfLhoTU=
X-Received: by 2002:a05:6402:51d0:b0:6a9:adea:42e2 with SMTP id
 4fb4d7f45d1cf-6aac90b61ecmr489913a12.39.1790205016790; Wed, 23 Sep 2026
 16:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923090429.2026529-1-stian@itx.no>
In-Reply-To: <20260923090429.2026529-1-stian@itx.no>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 24 Sep 2026 01:10:04 +0200
X-Gm-Features: AclHuK-KybeTuS6nn3jFipLShTCPHEka3TcKpFAC6yT0fDrbo9S-DWDh19_uFiI
Message-ID: <CA+=Fv5QKMaMGaLO3gKymSv7FVhHMMYxM8ux0S5dTKB26nQeAQw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/3] perf: sparc64 user regs and stack dump, with
 arch hooks
To: Stian Halseth <stian@itx.no>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Andreas Larsson <andreas@gaisler.com>, "David S. Miller" <davem@davemloft.net>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stian,

On Wed, Sep 23, 2026 at 11:04=E2=80=AFAM Stian Halseth <stian@itx.no> wrote=
:
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
>
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

Hi Stian,

I tested v3 on real hardware. I haven't noticed any regressions.
I built tools/perf from this series and tested the new functionality
with software cpu-clock events.

Basic perf stat/record and the existing frame-pointer callchain mode
worked normally.

PERF_SAMPLE_REGS_USER also worked, with perf successfully recording
and decoding the SPARC register set.

I then tested:

  perf record -e '1:0:u' -F 99 --call-graph dwarf,8192 ...

This recorded 443 samples with PERF_SAMPLE_REGS_USER and
PERF_SAMPLE_STACK_USER, using the full 0x7ffff register mask and an
8192-byte stack dump. perf script and perf report were both able to
unwind the resulting callchains, and no samples were reported lost.

I haven't tested 32-bit compat tasks or hardware-cycle sampling.

Tested-by: Magnus Lindholm <linmag7@gmail.com>

Thanks,
Magnus
