Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE023D649C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791755291; cv=pass; b=qlSBhhoAxx/ypxSC2+OHRdmHgvRXg4381QNVpxx0iwI6AzGjGC5EwT8mp3djxGFj9R2EgBkQ97n6nZzJqcK1fcnpTBevvTj370mFJR7YartOK6AS1zmQimufktzNNezpsm5hxTCdgrWqpDamBUKg/x4jZaJk4lO126x6f/HN1k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791755291; c=relaxed/simple;
	bh=yGC7Wvk88O3E7QKKMndYn3qemkncNe4qFrBd2PU6+HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h/wzQzuiN125bosJ+IpJiu1Oxgx1rRzPZjsaNf9ZtJwml1/TEQtPVls619uctqK56mrORxeGr4/kfHoBPiS21SvYfMwDYG/yDKSQ5oRxl5KWz+qbT9QHDc/1pRnyXxQ23uo1ghuwqqj8ETHaJ7FWD9UFzRyRqy8Fgk7GstUhbIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BUdDBLpa; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BUdDBLpa"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5337c7b9937so196011cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791755285; cv=none;
        d=google.com; s=arc-20260327;
        b=KElURARPnFUi4/OZ12R8J5Itzjk5S8ZJVM/nFZnWUjOwze+VPK1k2Xi0vx7vONkLoF
         VPZ9mH3qOGf9KGMaAHlaf22lAF7NLWnt/m5DZRZD4CvvAoNNnRlQWxwCROZCRWLJHe/l
         dskFqrbUH+BG5gsTFHXm9u9HPbFxEpXmgPwBCVmtAmbygcJ43GjmgQncQ466BZNjQ2hQ
         xQCEzaldjqjz9Qd1Xr5V3+mh5K9DwUbLvZxjXYp16548Dc4XvTTxPdDWIxHF+VLjgCzo
         2VPA6bM0nSVXBces7d/tNtE2rkHamHwKd3FNn3G7oDhsFu7CasedV1NEwRji478tKj8B
         L43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pSoGFJkMmBNVwjYD5umh+SpMh3+8g4woByg9LqJWVSM=;
        fh=sbAjoyUBPOKnQ3srunE+jDn8dJsGMAa3q15yA4g3MWc=;
        b=jmhHE6VYKwAA2JI2mud+47kfICt3wsNn5OZFzc/taCphgv944WoGLhbaSLkQLYP+lG
         g/G9jW28scsJ6KQJAT10RH7mmytfUZagl6zJz+ZjCJbakizjW/N7RCiZ1pMR0bAOpQ4k
         NZKFoBpITsVvpytG7JgoRmPtQlWyfpKZcz9UoFxMdyvxGdmZrjVXaTBxizO6pg5nUxiG
         Svoz9PJ0ufcLmIrwGc+kpp368OsswVSwqJJXYvzd2UR1aIPZFjYHVslnl/XM7iU7Y1eI
         YVYNEmc0lNpEqr5YEZROk4VYDdUXtkmcPJwDK25lMxnUgjQQVGJ+GWEhga6kMjad/gRw
         4RhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791755285; x=1792360085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pSoGFJkMmBNVwjYD5umh+SpMh3+8g4woByg9LqJWVSM=;
        b=BUdDBLpa/EXu3XY/NMqf0FVbyOWfBWcg3IKBW9JrN9IycTJv7WMpeccYUXkabFFJ4T
         bF34KCdNrCaXht5ItucP7FhVQ8ZADG95VsRfXUn2kcfyFL7P1kEoTGRvQtlYnHJELvB2
         GN4oQp88szYi90EG45FVUpDN0If4ettCJyJQFu9yism4yI8Q/q24b5ZutzWBXK5cwKJX
         rMjK+5GBqxsqnZY4qK/NpZ1Cbb2gMC8MEteKyNhdI3YFIkvJe4Y8ukdw210YVkwss2Os
         7FGMVGgZGPfWJ3kVFKbXr5SQqH4ZAWgz5zL1nasseg8jqhfKfvx23X0oqC8bFqc1YQuM
         smjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791755285; x=1792360085;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSoGFJkMmBNVwjYD5umh+SpMh3+8g4woByg9LqJWVSM=;
        b=s6w9BiESP7OUQoVhwsvGhyKIiLyRoh1VciEOOGpHMGhlLNQ+SzuyNM/y3yytkE4NBh
         P/x3x3cLoWy+dM2KxbdPKWo5rGGXMAAS/w1GY8bAdv0dudbfp64ntIO5l41uYZ8LnSvF
         quvtgyUnWFwyF07CpqA1muSPUTe1NCfgdA130Ij8IRws2TxxoISr2mAIdEDCaAbyvfAl
         oVF5aNL9iwxB5qA1IOtG1rM3AMM7URjCv/Jx7azyeo3VrqAkRBxhOcujjsRVUGshnHbx
         CHUORZudQPjcnQhM9QVQzZ4ySScLa+E77N134zpzhugFEGLTyvw1pT15jBx2AuqudFrJ
         aFrA==
X-Forwarded-Encrypted: i=1; AKwUvBzQUQxBXsIUYkBZrXXynTkcOcuIM1rD13Iu+l7hdXCQIq/Q+Nz8s5tJPOiow1iBwxA5ALs2+jeXWP0O4HQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjQc9LV+wiep6d8UTwyE8RVfx8xK/Wy+kPjU/jrnur+yokoLR7
	ODQdRpdjkLIWmqT2TtUtesE7ZpttNlT5L4w+s/DMciW0/1/Two7La6bNbXmvJ3EW8w1ZbfkC+lq
	9WPTU0xZVkIiT1fnmQ3W90+NOnbmCkbDEcSe2ofts
X-Gm-Gg: AYBFou0+EL5RrPGIbp75MIZzcrsu8gmhEEFtMgl1WBgFHxMyMvnNWsFewd5Fmji9T/f
	kZbKFReuHi2Nl0aO3+xuf6JNcDdo14Xj6v/4Mp8oPf4MmctimJiLFcCaejsttG25Dbb9+GPZWz1
	uswdq94aKwu5KKtGYAlZVIn1VLM9oJdFuge1TkHlrKLYxPRmPc9xjjMslC0sj5vaB7NaK7rVjFb
	0fCThS6mU456O55ndBkfMJpLnHlt9rWLgiGtGiacPdAhtW4XahJboq4DsWjvyx1M2OSZuDGYCH1
	lmDYBAzRVk6qNYwJo5y1zNIDI4+LpQCEnUHQKgSZAwzvPc7KznJI3OCn
X-Received: by 2002:a05:622a:1116:b0:532:a17b:9581 with SMTP id
 d75a77b69052e-535b3122949mr20485051cf.3.1791755284649; Sun, 11 Oct 2026
 14:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 11 Oct 2026 14:47:53 -0700
X-Gm-Features: AclHuK-IE1KAcxUEfRF4ivWBjkQ6viea8MAPDf15Zv9dPut0fJ3asy0p1dyVVfk
Message-ID: <CAP-5=fXcWRrsxYMCmb_2BK58PHMtGwQx2iKDE0hEZLc+7_DHBA@mail.gmail.com>
Subject: Re: [PATCH 0/4] alpha: perf register sampling and user stack dumps
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 1:16=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> This lets perf sample registers and dump the user stack on alpha, which
> perf record --call-graph dwarf needs to unwind user space.
>
> r9-r15 are not in pt_regs, so they cannot be sampled. An unwinder
> therefore cannot get past a first frame that uses $15 as its frame
> pointer (-O0 code or alloca).
>
> The perf tool side is a separate patch for perf-tools-next. libdw also
> needs alpha unwinding support, which I am sending to elfutils-devel.
>
> ---
> Matt Turner (4):
>       alpha: fix stale user_stack_pointer()
>       alpha: stop storing the user stack pointer in pt_regs
>       alpha: use user_stack_pointer() in KSTK_ESP() and dump_elf_thread()
>       alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support

Acked-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

>  .../features/perf/perf-regs/arch-support.txt       |  2 +-
>  .../features/perf/perf-stackdump/arch-support.txt  |  2 +-
>  arch/alpha/Kconfig                                 |  2 +
>  arch/alpha/include/asm/processor.h                 |  3 +-
>  arch/alpha/include/asm/ptrace.h                    |  7 +--
>  arch/alpha/include/uapi/asm/perf_regs.h            | 45 ++++++++++++++++=
+
>  arch/alpha/include/uapi/asm/ptrace.h               |  2 +-
>  arch/alpha/kernel/Makefile                         |  1 +
>  arch/alpha/kernel/asm-offsets.c                    |  1 -
>  arch/alpha/kernel/entry.S                          |  5 --
>  arch/alpha/kernel/perf_regs.c                      | 56 ++++++++++++++++=
++++++
>  arch/alpha/kernel/process.c                        |  2 +-
>  arch/alpha/kernel/ptrace.c                         | 12 +++++
>  arch/alpha/kernel/traps.c                          |  8 ----
>  14 files changed, 122 insertions(+), 26 deletions(-)
> ---
> base-commit: 8f5dbfb93440d1aba216a1a34369a65654b94be9
> change-id: 20261001-alpha-perf-regs-v3-7e23508c1ca2
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>
>
