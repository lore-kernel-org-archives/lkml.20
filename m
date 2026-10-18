Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F1139733E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792355641; cv=pass; b=d/CC3NMdA2uVohT+XcUA06wSFMLdbg1hQFAiERMSfiAKj0tl4zRAG7Dc8h51v3E94ls5r0mDYHlXXZNHbK0g14O0m0tNeLcKPFIXkXhE+Dspdcwdx+EEq2wXFp7uTTnCekWSImov/qyk20pjhSrReqK6ZcxuWxBkZu/16OrWkWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792355641; c=relaxed/simple;
	bh=RFgQrkdBBoSzqRJg6uyFYGy9xtoJxOpfXrhpBF3Bg9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QaMmLG74BK2x/nDYWVEFXS7rgtCDC9SrUcdDUJ7yk1xDGuLYmQJrcNOMD16hmgWWdvsFFmulGiwHTXdA0SzWQ+CqJRpryJvwolMnNbS4O24npemigYISr87RuC0FmrAiBhyVCYv61kCiZ6uk9UOcYTrtAA7cxGvaGvV5d35l/w4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LVZIIG+q; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LVZIIG+q"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-535f598d126so206061cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792355637; cv=none;
        d=google.com; s=arc-20260327;
        b=XyizZILK7VC0+g6ND7tFHX4osRKfrwBdgL4H3YcH1EqVWqmpVAgMPutufjmlsxriWl
         Gr6ffbiyDPTRB7HF5i+2Tb+UvCCOYLNyqgrVofXrI/ph2NyfBJJ9FKg+mzuRc/kxxlu4
         QNJA9yWnHmtLW3CozqFzdQQZisEGY7WweSreNAkLAerZ78+SY6cwHTXJ2upTBnfsTgQQ
         1YFYSztm4bgLVK6CDJ3ZgbgjtHwYS2M2/ydL2Lz/jsEjHBzGVckycgjDTdy1zAAmtgzv
         xFNyt/G14CqvULhNsdTDC8XasyFxxcdp5O2TxcP268A02u/6xNX5mudSAgnqbRQWY6m3
         MLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U0yEFYFRImHyutXHpD0puy2q2sce26+Y2mx28kTrK4Y=;
        fh=tPvkVRi3LGcncDumiwnMfyIQqa9Qfnv+kjeDDhelD6g=;
        b=XcicjkpJe2wJIUwykLJ7HIulBAVKHBbCgo/GSEIpF6u+UJykwUrO841wJ1euuy8JGS
         MNT40AMKcOlJleo//tjvNrEI0pKe2yaDe9M/oedDBY/6YCEoLXCJxWBBWF7/kT4Hyw0w
         JmpgnOq9IAJPgac0+ldAwxNe2PCutM05RK3+YfnJUp4gxfYNFTkWX2G87hdEkM5f+UTH
         DoYN1Fo5T1SNvLiNkCI6XG9FvT6NywMMM/TI30F3SLPmAb2SDtykLdzXm8GdSPR3lbFu
         DBfy77Ca5nmlxUo0tcfRC5Mc7Bkj73QlF2ZSBdWdytI9jujwJHMZneYWL1iQebVDf/3R
         pfww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792355637; x=1792960437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U0yEFYFRImHyutXHpD0puy2q2sce26+Y2mx28kTrK4Y=;
        b=LVZIIG+qqnAcURfmMEeonWIDylU9U8tcAr+Wdd5p5JSTNgUlE28fOCnGufZuqr5xF7
         tUv9CBXdcxVlvHTIdkVNgzpc2h055kF9YoYuwoi0qobCrABIayOesUpsltb8sU9r0/qV
         PzQipiGAkEHN3ep+52S97/XhS0VFF4EBHr4g2op5xlLSuVwpUbc90dm0p9YO/wwuPvxG
         kVkZWCEIHeXXjkdijauV8aEI0y011C51Rc4vJWkrfvZsSEAJ8Hpe04U4a03RSvR8I8Vz
         fN9c8s5MwLQ8gxpIA91xDQW9tIYFSk6ICgGhsmdRsclTho/jzbzAkbgslbjHOBdcw9jA
         0inQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792355637; x=1792960437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0yEFYFRImHyutXHpD0puy2q2sce26+Y2mx28kTrK4Y=;
        b=13y7jqEgpywTw3bELUzjz5CAWMJnXTdt3y3ikdaCoZth9NkRATC254sbidaqhafXlj
         84bmd2npF1J0FQq6MUXOojNCZJUmsbZ7sIQEccvYfaMxynQgNjZ56Ibj3NT+ui/Utals
         C2mADWKvCKaVc2EFLd+iM1xXFUmmbeyApAfeNSMWKlKWgRBxqogVEuHcSdJlMVDmNQmE
         GlSupcbXbJIPRq79qzA3RB1X4st1zX1dfyiXKb2sJeJ/IUphrsiHffGKSDOB5jzJ63Wz
         I5QCX86qo9SaEv9ECP0Ucl5EuuHNcqh26SZnm5COzm0XTFtfM4cW6r/jJiGYGOQwglEJ
         3s1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzrwodywfwL8mPXZJB3/DWKVzaYw8EL8GYbZYKwuIe684p5WElDI31gQ2xwazrBHDUFMSMC/bEL3o368Mo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZMWrac7dODL3nWywWZFVKtkrsPsZhP5OZLIoxL8nCalScNuHr
	sG6pezn9+tJsmoK9IickJ/m3AcYgo3ZxDjfoxZBOpDJkorN3N+1mskUD8QeTIx5rD6db9K+rcce
	jiN2F3zFPruhKkSUMhecKlz8tjB2gFIVZL0xdb6Ua
X-Gm-Gg: AYBFou1Tg9WGMgOntktiMW6l2GmKKsTWCG9A22AMt7z+F3D375Qij5K899qhHv5VwdH
	ewC5Ozc98G/eZ0+kMSODsFkv89C543EnPdMu6kATAvM/6tFNdrcTQMvfZ0IGJw//QwNCEkS8msE
	2iJ/JLQso/RV93an27guhBIgFSgwZOV5VNxaKw59sgyMCatW6EK0bMdMVjKoqEGjJc8q6C3p8l7
	vq5+J+nCL4ZhZ2IOWSgq+yXj0HUbg7jXuBk1oH7RXncUw75ZUF63cVUnGoIdK6wVbhDOqh6EySM
	XAIElsINxOhiLbroUGe23ghBpm0zAU4tqfY6BR1FjADhsTYkebj+aY0m
X-Received: by 2002:a05:622a:15c2:b0:534:d386:c3f1 with SMTP id
 d75a77b69052e-53646271decmr27164221cf.9.1792355636727; Sun, 18 Oct 2026
 13:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018163741.850434-1-namhyung@kernel.org> <20261018163741.850434-2-namhyung@kernel.org>
In-Reply-To: <20261018163741.850434-2-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sun, 18 Oct 2026 13:33:45 -0700
X-Gm-Features: AclHuK8V4M0U4M5iq4S8ju7FIqL_Da28CgHw9_xNkRgcxcyq4pB9WpORoP3ni7Y
Message-ID: <CAP-5=fWt5r++c1=BnM+459WsiZiwvihGpcjZ+j5_6Kr4P7sDUw@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] perf test: Make sure maps to have a machine
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 9:37=E2=80=AFAM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> It's be easier if we could guarantee that maps always have a machine.
> IIUC this is true for all real use cases, but only the test code has
> an exception.  Let's get rid of it and make sure they have machines.
>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> ---
>  tools/perf/tests/maps.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/tests/maps.c b/tools/perf/tests/maps.c
> index 2c05d62f40dcdf72..f40b68f5fa5fe2c1 100644
> --- a/tools/perf/tests/maps.c
> +++ b/tools/perf/tests/maps.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <inttypes.h>
> +#include <unistd.h>
>  #include <linux/compiler.h>
>  #include <linux/kernel.h>
>  #include "tests.h"
> @@ -100,8 +101,12 @@ static int test__maps__merge_in(struct test_suite *t=
 __maybe_unused, int subtest
>         };
>         struct map *map_kcore1, *map_kcore2, *map_kcore3;
>         int ret;
> -       struct maps *maps =3D maps__new(NULL);
> +       struct machine *machine =3D machine__new_live(/*host_env=3D*/NULL=
,
> +                                                   /*kernel_maps=3D*/fal=
se,
> +                                                   getpid());
> +       struct maps *maps =3D maps__new(machine);
>
> +       TEST_ASSERT_VAL("failed to create machine", machine);
>         TEST_ASSERT_VAL("failed to create maps", maps);
>
>         for (i =3D 0; i < ARRAY_SIZE(bpf_progs); i++) {
> @@ -159,6 +164,7 @@ static int test__maps__merge_in(struct test_suite *t =
__maybe_unused, int subtest
>         map__zput(map_kcore1);
>         map__zput(map_kcore2);
>         map__zput(map_kcore3);
> +       machine__delete(machine);
>         return TEST_OK;
>  }
>
> @@ -189,8 +195,12 @@ static int test__maps__fixup_overlap_and_insert(stru=
ct test_suite *t __maybe_unu
>         struct map *map_split, *map_eclipse;
>         int ret;
>         unsigned int i;
> -       struct maps *maps =3D maps__new(NULL);
> +       struct machine *machine =3D machine__new_live(/*host_env=3D*/NULL=
,
> +                                                   /*kernel_maps=3D*/fal=
se,
> +                                                   getpid());

For completeness should we pass in a host_env like in builtin-top.c?
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/builtin-top.c?h=3Dperf-tools-next#n1661

Thanks,
Ian

> +       struct maps *maps =3D maps__new(machine);
>
> +       TEST_ASSERT_VAL("failed to create machine", machine);
>         TEST_ASSERT_VAL("failed to create maps", maps);
>
>         for (i =3D 0; i < ARRAY_SIZE(initial_maps); i++) {
> @@ -230,6 +240,7 @@ static int test__maps__fixup_overlap_and_insert(struc=
t test_suite *t __maybe_unu
>         TEST_ASSERT_VAL("eclipse check failed", !ret);
>
>         maps__zput(maps);
> +       machine__delete(machine);
>         return TEST_OK;
>  }
>
> --
> 2.56.0.176.g3575e65682-goog
>
