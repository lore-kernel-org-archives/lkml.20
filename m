Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0543D4CDDC1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602950; cv=pass; b=ZqzkH+Ml9fo1cB7jKIgA/yuWZbG8YzY2ZOHp+dCc0e4Jzh1VNUo9+/Qx51l9ijYLT8tnh7vWHu4XuG/fHWKsYCTg+qTrO1RULv6iHfK1JU7QtjtuLxOpv4Sm6VUAlupkjV4ysNcxKdT6EeC2dQNJ91+JuFQMOgz4JLw7qAQBMRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602950; c=relaxed/simple;
	bh=k2uwa9kfpmX/6oBhi2iMilr4w0fmi3EZ1DNQBIYEhZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AT7LgiNpCJoY3Lg15c2ykVEMTMOu/vE+UYG57YfYecU+ASwedHY8Jjv0JiEXi6ppR5fn8gyNzMT7YtiP0R5lMlGYAOEtvKiPB4NoyAXc3e2nsSzkLL5lLc52Id/fcAjXQdLIaqvqJejXQHGmt+1nQLSNfzO7P/MkRhPdA/MmY6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=fLJpZYv6; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="fLJpZYv6"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so16681355e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790602946; cv=none;
        d=google.com; s=arc-20260327;
        b=Ql7kehyiWBL1imV66r2grhd5KnXXwelnTytrF0AnS9nk97TgTuWOgG1WMKwFReouLE
         ilq1hNi70nnSTEBNKjpAik7gbkfKqYyeWBoQpc8UK77Y9XCzSr0iGLJpEFPmeY/8uTHQ
         EVGJrDl4woozLTpn/Fj7Ar6IcHghEHW+X1p3CrCmGc6P7w45rtuoXmzQAHg3MDNOG47q
         3U8xEyihI8mB56KwUBLCoCHcHhFmXBN6GqvcxnFneVxtX6oGKH4lIEEFSpb+8JQnEZtz
         WHbaEiRNI5s2xPLnyjCFnsJIYWV84Nfmhxl7WBvd63yPQ6N9cDbm2WmLHCZWfdi218FM
         r8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BQVE+Yt78Z3pfyI+mWf7Zu1XcCvdZQxX7b3ZOkZzIX8=;
        fh=C4wTbzkbVf4BDIU6WJOLsrh6dHjZRN2sQxM63v2682E=;
        b=VrzDgCKFFLQRqetStcUWbtDtSfv7J03rw4bc6Q2szYfqjGohBJVVvSmf06xQMsPSDu
         yLXIm0R5P/2GsPb+3uplChN/c+kb2hwq81x34vvB0KP88S78sUw2HlhXtznqCy5uxZ+8
         dkJccmbFos9qEJF28z3NgELus8CaNVx3JSiE875QC3aZEqJPdNP0sE1zeXP248zgBG3A
         fbWOAGNNiBGT4G3FrCcr9ZTccxYkuyVmS0ocfHfdVYLZQR4debYOyJo26fCmS9e21MBl
         Ix0anXikAvC/3pclSsMFLY8mAPXRzlt2pLcqV2nqgxaS6o8Ixg5zwPUTPCtMCqW5Ubb0
         W22w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790602946; x=1791207746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BQVE+Yt78Z3pfyI+mWf7Zu1XcCvdZQxX7b3ZOkZzIX8=;
        b=fLJpZYv6JMSV8xL3CAMW9ipZIwFhydjwC4jIHZb35FoQ3GbSVmcehaLelYJuiukDr/
         6YoI9XcdeRFpl2KyKZ5o4aBFZcM+P5Ic459MlVFWuBPni76FHPBFPyMcQX2sA1gwuExG
         vZXg48pdk/iY/fOa+62zxE3xMdkXdSWh6d9rbb8XBuM3CYbryZfD735vbsGx1XEn7Lgr
         1S/iiYROOTJVTNAxV9fqjR1l+8WaQ1PTaiZIDgI11PgCGRQCNh1wCNWhnvqRaqxH8IbP
         g+wKxr+Uo8oAk00Q0wY6caqEj4AwLwwpmsjAPkKVpTfxl6E7kqgkz10f9kfgp8e8avQt
         gQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602946; x=1791207746;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQVE+Yt78Z3pfyI+mWf7Zu1XcCvdZQxX7b3ZOkZzIX8=;
        b=mKdLEVtji/Pofk9RJQP5bYtvCKofe4L3odJJ5/MdHrufUBWsMpcTgyGbaZSzDiAT9X
         DjeHpgOTtr8DIzgQ1WOQ82hPv8aQEvzZK6vfhb7GlEg4IiTo2lsgAmBlaGpmFc+BtwHp
         zL6epiNQfUaHetRs1oWiW2qhjL0hOHkoQXT6S3Hhd37vK6jwFEIV0Kzbhd+VJEbgHF8s
         f5OklaoMuvu3Y/C05dUXXHEB+nGbJtPh6NMQ7X6aZrNpbu2eeKn3jKFERT5ImfH0zxCA
         hGSqRzHdMgCjHrvDw6fTslKnTxRP9uw1CXsDF7Dz2aJGwJcJEdmqGKRAFNnb6WAjbAYD
         cR3w==
X-Forwarded-Encrypted: i=1; AKwUvBzyT1ETJsRpuNQy053NoUg7rcBdemr6VtBCAAIK93KTG/R65bG6T+oi84XQKy/HF3swzeg4rXrspRPPMFs=@vger.kernel.org
X-Gm-Message-State: AFuF++nSIofeRsL49Gza7P7TH/RNIo91uQsmc48n/lyBLZZu2Zmsry1o
	DAvPCeWGloPK2mu6AJHcKUmueJTzDrSEaS5ck6zdpoMicjzdZq3Ju7U8Ul65dSOwcbsrNC9SXR2
	E8umNqR1CpY20vVev3G3m49BFfDxHI9UOyrI2ak6TEQ==
X-Gm-Gg: AYBFou0xNazoriS4c/Cl+bl5eCVaV8hXkVUU8VabqHCxJ0jLyLmqvPHwT4clswRbmHP
	1le98H7ZR9VgMEBvyrxppDRgVqxscIDS42UrXyzqDKs0klu5ZagvIDohlWIrP+1Cug1OgLjxhtN
	kHNpinjArNEEp7eFevRWSGpqtCkHIOt5asKuyDHMJtYaLcX5jEGhovIUAxyZ9hwXZTg8MJDUxYk
	U00y3ihiRxhoDOVJuibeNppuSUQAINPTa5Zwk4+lYUsDeaHUMLKocUheVQDGpQyElL7U90Hr8Zi
	q9AVi1RuBWWvUeWEIhYYASzYwleoR72MPU2lHfHRDqcHsrPlfO6a6VzObptcDnEdcYakCW7FGst
	aDcwl4XyqM/KO8RvkfhSvkl4sGnyVNG3EI2bJ3Ptp/iZXHJn0u67LGCDahDkOnaKBaTsUdS2ixi
	3kC4LA8F1U1g==
X-Received: by 2002:a05:600c:46d4:b0:49f:ec98:f030 with SMTP id
 5b1f17b1804b1-49ff06f839dmr165880955e9.33.1790602945896; Mon, 28 Sep 2026
 06:42:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928094739.2605-1-cp0613@linux.alibaba.com> <20260928094739.2605-2-cp0613@linux.alibaba.com>
In-Reply-To: <20260928094739.2605-2-cp0613@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Sep 2026 19:12:14 +0530
X-Gm-Features: AclHuK9NQvFd0dqx39FONs2gN8zrhWEmLq1wAOlPjaDEqyssj2Y5zQw81EJtk-A
Message-ID: <CAAhSdy2JhEoG2-hrtN63ZF3sj6Uyqrs8G4Gj+P3Ut2f5h+v4fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] perf riscv: Implement rdtsc()
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: acme@kernel.org, peterz@infradead.org, mingo@redhat.com, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, john.g.garry@oracle.com, 
	will@kernel.org, mike.leach@arm.com, pjw@kernel.org, palmer@dabbelt.com, 
	guoren@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 3:20=E2=80=AFPM Chen Pei <cp0613@linux.alibaba.com>=
 wrote:
>
> There is no riscv implementation of rdtsc(), so perf links against the
> weak stub in util/tsc.c and every caller reads a constant 0 that is
> indistinguishable from a real counter standing still.
>
> Implement rdtsc() over the time CSR with rdtime.  The time CSR is a TSC
> equivalent on riscv: it is readable from user mode, it ticks at a
> constant frequency, and it is the same counter that riscv's
> arch_perf_update_userpage() builds the user page conversion fields from,
> so the counter and perf time share a timebase.
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

LGTM from RISC-V perspective.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  tools/perf/arch/riscv/util/Build |  1 +
>  tools/perf/arch/riscv/util/tsc.c | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 tools/perf/arch/riscv/util/tsc.c
>
> diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/uti=
l/Build
> index 2328fb9a30a3..52cd6a481de8 100644
> --- a/tools/perf/arch/riscv/util/Build
> +++ b/tools/perf/arch/riscv/util/Build
> @@ -1 +1,2 @@
>  perf-util-y +=3D header.o
> +perf-util-y +=3D tsc.o
> diff --git a/tools/perf/arch/riscv/util/tsc.c b/tools/perf/arch/riscv/uti=
l/tsc.c
> new file mode 100644
> index 000000000000..7cc4710ac38c
> --- /dev/null
> +++ b/tools/perf/arch/riscv/util/tsc.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/types.h>
> +
> +#include "../../../util/tsc.h"
> +
> +u64 rdtsc(void)
> +{
> +       u64 val;
> +
> +       /*
> +        * The time CSR ticks at a constant frequency and is the same cou=
nter
> +        * the kernel feeds into the user page conversion fields through
> +        * sched_clock(), so it is a TSC equivalent here.
> +        */
> +       asm volatile("rdtime %0" : "=3Dr" (val));
> +
> +       return val;
> +}
> --
> 2.50.1
>
>
