Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FB6422531
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 22:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790978946; cv=pass; b=jv/bEz69ix7iE+NSLSKoxV2S7js8VvX4YyXhSlowWl18vdzLbCRW5+3rd/hFAuPeWIyj9VrZusvVsbofDYGkKV46HvU+xYKwLTIyTGyexH4TiGMqpZf+PnflAi323PXBg8Bc9gl4Qi6mnZYT5xXoR+FtWN+UpSeYR6l02oYr03s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790978946; c=relaxed/simple;
	bh=JZk2UO6J5xgak7V5AnZT7qjdKDdxO4rP82PfDzyfPBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CEapadpLFdqH2HEbe3J77Ldy10o2RsMn97U5wAp9ilcKHf2i+ZvwQ9jghiHzyP7VgHJPm4UYz09/axP7njLeV7fgfddKW+kg27xqFdvHacam/s+SG4r/D6VPxfF31DkXCka94JY5DvF+2SjGh8uW28q00isP/JLjPr0BIspCk4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t6NBe4vm; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t6NBe4vm"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53113d72966so33851cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790978944; cv=none;
        d=google.com; s=arc-20260327;
        b=GbZtwDfpF38TvhP5fC/PIt13+IN3lKlaT/H2RhpLoUTaw+dCtEeS4ivICqxQqfeQEm
         pxEgP/kVuBP2ER+iVMp5INq+slRLaUUEmek4yr7sq5qV8iC3lu5X01G26GIXBivl3xS6
         z6BTzCieFxzuPZP2Ax/As4ekc7qDudh+EFxi5RRXviZiJp0xLQJMC7DGJQITvZlsMeui
         KpmwHA+vYaI2LgaD/gd4X8Z9wn9Omj7k5AXwvtTC67vrAxLxe9CT3IqpM210aXpAMgt/
         fZ4nccajeMJcy89VfGVPUij3H3V/whS5zrpmlDQ75Lzb0GlLguBLJ5FcWOwdUFnH3jn5
         GVug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZaKFiEEtQM47C9SdzRSWhAvUezyZKbHdFdy+4ktG94=;
        fh=vgvM5P8xk44W4KT/gyUw4ph3MqGrCsPpWE4ZV1rrelA=;
        b=EgET4tEyeBygYheGEWxBNGYJzc4WZINwlvEzoVQxkJAeKqaz25reENqqdj7RykP1Dp
         gHo8IQVgnmPeyMXiB1ssAy6Qln6cUxqbpZadjYTlUeWrJjHUhyU+FABWTbnR4y/OjXDE
         7B9NzjSyEt6oxjVgxAW6VSAhi60zUrRnbzBeppK59TBOz6WFPfJBijlsF4/MXU6wO47i
         0ZvAaXSdpXCFzeb0GShusenftOQ/bPBgwwruQpHSsmcmqd2CPiuta5MFyNoZaaHt0kE6
         WBuNhokWq5P8iZDdKEjpWUki0T5xBJJ6v3mKWLn+hThhONamjJBYjFMRcGrMlVreMTkm
         kN7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790978944; x=1791583744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZaKFiEEtQM47C9SdzRSWhAvUezyZKbHdFdy+4ktG94=;
        b=t6NBe4vmfSgFhv/18xa2mPKD8EiHmbbvpvL0YjHIU0qNgMxjw0OZYAvvqqT4Ndfk3w
         CTYgoHSBWz9FpxssN03TJp7ZTIMhaRs6HGFdwwUTwAg7kw//P9svvma2mJJwPM6XU19r
         nsa1FCr9p+yK2RgdTNEFJwe/Zlr8kocMh967nncIt28iM0DK0NbUT/T4XwjtseieA9ie
         2RLUDZ6TjvOG2I32IvilVS/S5IoHrlDH7RqdL5IJo6TOD0FXVzBzDrPfCO9ZZmBQZ5oX
         19r540xNs6MIW5cXQQOUf39tQxfqMXn2h9H1Mlq1i0vzR9qpj3lz0QojhFuQ8d8bd903
         qW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790978944; x=1791583744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZaKFiEEtQM47C9SdzRSWhAvUezyZKbHdFdy+4ktG94=;
        b=ddxstxz5SUk4tzlS8eWTcr3ZjvOrQ2WrIc9H0Y1uXOHCTyJ0Skipqde+bXR+X4Q81x
         j56F1LecwIA2IeiBamG2Gb4FGd1S/4+A+BnxGEGvLrh4TObVmDa50FZbkLPbzAlrTpZb
         IPE9g6H0/jdcAR8b53WGwIz/3Gm0oJJ/DoUW71KWdwknGjy38/j1WQRfEQULc7mASSwW
         N2ffHN8YIzcBuNZxglhxqBEpuZfypOvN1mXvFQ9scqwYpsY6phijORtf9LGCQOutMcnp
         UOkGsfWmoTR0JlAIHLTw7elxrBivy8j/x9jOhqAzDnzXb/RQpijRiq9yMlJ8QAM2yoyN
         oAVA==
X-Forwarded-Encrypted: i=1; AKwUvBxm2XDgXRg1ZnkvXkfhNE/9ooMEUPnITzsGJRU8PY4EUCdV/cI0FkbhAR8llEEXwnfdnguC+q1LxHqbQ5A=@vger.kernel.org
X-Gm-Message-State: AFuF++nUT2oVr6S57Qu4C9ZsvJq/r+lmMuXnbuhcpZHkvlqDwQNIRtjV
	ZK+IngmYyC2hecdpBSNURccBDEwFYSSTfFzbkkRMG6da/JaDLewNoEXBOlQzrzR049mu6BC0Pxo
	v7c18dhkWk/d6+KF3WjSRlkozNYFda5tBL/7Xi4rH
X-Gm-Gg: AYBFou1/Y3DPJKLPDJ9mp/q7KCzmUoZm8v8kOLmIwVbSttS96UPqtFl5HbPtqCrVQcy
	5IzR54L5SZSI/1IUzry6dGH6kMKMsB1zcrojHefDneytvdEIxXT3sqICjUh2AWnlgtgJdYGh+/2
	EIUsxquiuB7pzToufJWJXe7gs5HUgtj6E5eATBLt1WrMGOe+c1MM4lHU2yMe+JWxTTnbPRAIBVP
	f0RSAl0bpm2BwcCUaOTGOj55+srIuwp/BIrKrfTQIb/EVRk142DG8/gruIyYlWLOAtMiyA/yYFH
	hIgu+ed1XnzC6vusuD1rrbTD6b3sM3czMJTSmS1lvnJFZrMXKTDkTFA=
X-Received: by 2002:ac8:7fd1:0:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-535143a7ee5mr762901cf.0.1790978943386; Fri, 02 Oct 2026
 15:09:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-perf-symbol-memory-send-v4-0-0a592bb2539e@uber.com> <20261002-perf-symbol-memory-send-v4-1-0a592bb2539e@uber.com>
In-Reply-To: <20261002-perf-symbol-memory-send-v4-1-0a592bb2539e@uber.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 2 Oct 2026 15:08:51 -0700
X-Gm-Features: AclHuK-nL6R11wMTAIMaK2Je6hNynjwS69wzUDTPehiav7g8rYtdEWMle8VAaj0
Message-ID: <CAP-5=fX97E5w_NZu4WSBkMM=Zf6upS_UjuzOR4hwRPmh0RGB3g@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] perf symbols: Fix broken ELF_C_READ_MMAP fallback guard
To: haghdoost@uber.com
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 11:46=E2=80=AFAM Alireza Haghdoost via B4 Relay
<devnull+haghdoost.uber.com@kernel.org> wrote:
>
> From: Alireza Haghdoost <haghdoost@uber.com>
>
> Commit 22dd1ac91a77 ("tools: Remove feature-libelf-mmap feature
> detection") replaced perf's compile-time feature test with an #ifdef on
> ELF_C_READ_MMAP. ELF_C_READ_MMAP is an Elf_Cmd enumerator rather than a
> preprocessor macro, so the condition is always false and perf silently
> uses ELF_C_READ.
>
> Perf already requires a sufficiently recent elfutils version that
> provides ELF_C_READ_MMAP. Use the enumerator directly instead of
> restoring a feature probe or retaining an unreachable fallback.
>
> Fixes: 22dd1ac91a77 ("tools: Remove feature-libelf-mmap feature detection=
")
> Signed-off-by: Alireza Haghdoost <haghdoost@uber.com>
> Reviewed-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/symbol.h | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/tools/perf/util/symbol.h b/tools/perf/util/symbol.h
> index d0bac824c79c..46b1649c64fc 100644
> --- a/tools/perf/util/symbol.h
> +++ b/tools/perf/util/symbol.h
> @@ -57,15 +57,7 @@ static inline bool is_livepatch_symbol(const char *str=
)
>         return strstarts(str, KLP_SYM_PREFIX);
>  }
>
> -/*
> - * libelf 0.8.x and earlier do not support ELF_C_READ_MMAP;
> - * for newer versions we can use mmap to reduce memory usage:
> - */
> -#ifdef ELF_C_READ_MMAP
> -# define PERF_ELF_C_READ_MMAP ELF_C_READ_MMAP
> -#else
> -# define PERF_ELF_C_READ_MMAP ELF_C_READ
> -#endif
> +#define PERF_ELF_C_READ_MMAP ELF_C_READ_MMAP
>
>  #ifdef HAVE_LIBELF_SUPPORT
>  Elf_Scn *elf_section_by_name(Elf *elf, GElf_Ehdr *ep,
>
> --
> Git-157)
>
>
