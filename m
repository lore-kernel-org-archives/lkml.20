Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A8059B68A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890926; cv=pass; b=KZGHy0m0irGsPLSfdobRAPWGdLGcJ3m3muu4OCurqMueWCR3AnlLo3g6wHioMpWLsp7nTqANoxogHM8HCrqQEIUp1FGAyGV/UIlIvaULZ7AYwyUM6zJwNBJzfJZw60FN1v/Cjtb5xi6WvYchotSby/gwPSl/B9ZBJwELjnAf440=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890926; c=relaxed/simple;
	bh=z6uNhq7h7RLEB1t0y5S59Hj6nrmwj5oAdNgHqjEJ8MY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnIuebXaRCW/EyStNZY/XuxDBlklujN3flAs82SS2Qg80P3p32Y7ePHANfHF6r2CCOCJBBvizUmXm2QW8K8IUXM8WufwrFGZsvzKsEOOtwSRPHuTFRuffhHsacEuNV4MItzGvusnlUQK4y13EubYpE+5/YZhWhEzfm5qhXlTpA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pKFvowfJ; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pKFvowfJ"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso781891cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:08:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788890923; cv=none;
        d=google.com; s=arc-20260327;
        b=Vhp/yrJhFSknkpeetGkmXI++QpzDmQa3ia9Oi3jAE4FfCAofUeslfPuWW6GnSs7Sem
         jzyf/dU1tHje9TguvAUeL4hZnvVnGwZzRMrVtbhI8b2p4Fm+wM1eKj3wjoRL9stZ9dzG
         3GB6RNhSeiLshhyjKoxtiT1dK6O0awYhhM5LVTpfOOpWL+3cMivOw95hlZDqprNky4gM
         kElauHpQ71JFCUyjwWhl9Bf1RLOLJJAXDmSuobtE83lYtGw3++JK2BD6vbC3EtZfAE7h
         16FfEVH2ty7bLJTE+1m9Q82S2fg2wCE0s1v1FpylgV+NoVPgKzCJnV6PyslR9dmrTS8t
         fPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v56+UIFhP0Dq/iJfc/yfofNPasIIeHeXBkQoDrcfwzc=;
        fh=XtOcjXRFki8Gctu2IyjE1ivDNNgWuKQsVYzaB/Y85jk=;
        b=h1jDKhxWbxnBb8Uk4jIgmT4mUMQlEuLWe888tB0rdSGKIezVE0OxeheNxiEleJ7re9
         RRXm9RaO2p7uQqsvG6zAMljhABskdAWR2dpVzqWOJPKSnXUZYpVVrKXiMtVurUDYJHf0
         kOAlRgh8hmBdFlu/EY2+SBPoCxVpNCabI7E7qzUV+ihCaLFtNPCaUuZ1dxrlwrI96+Pp
         HtXBH3l5t45k7MQ54pYMH43DKoCkAFWyr9ipGXrdFWdyWn5aczYuqyVTGHbF+7WAaaMe
         B185rq1fhY4RNnpbVLyqu1BkyqvQaCc8NUrUlC1OhK/ogAuH3qUHZvmdzHZGssS9NwTJ
         mPpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788890923; x=1789495723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v56+UIFhP0Dq/iJfc/yfofNPasIIeHeXBkQoDrcfwzc=;
        b=pKFvowfJI5Z2nIebOzRed5HMP3JBplWDvc4Gt1KFM4zag77Y+HqbOe1UuVr2tQtrVo
         zy9IRYBOyhx6XRQuXKZAwS2kUQ0huh75TKFMznvuYhP6++2OYh3SJJnx0Rxx6FZu/T4D
         QK1shXGJcgag7LLwdskDvU7sa+7q34Ydx9YWjC6v25zxuWLzQHgRxmmOE7/OKoudS+a9
         T1vp+fN2SdEWSb3CxWSgm6fOrYRqScPWQgbzLl5a6VfYrWeimGM2PTt5h0wAKD3NauX6
         TACijNOjbha6sb7Hl6Bh2TVTPZdD1CJ7hNasBbCoMGV8xssQ2wL28iY3jIpTJeSFxJJD
         1PTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890923; x=1789495723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v56+UIFhP0Dq/iJfc/yfofNPasIIeHeXBkQoDrcfwzc=;
        b=QSMIoJ9+vQFOGIQvC3cm8gKD/9onNSGYJ/8aVel1VPW++bOucqEcshxGapyN9cZZEL
         cFPyVFg4efgJr2MVngLeDXsSVrCpNMCU53dRlhD+M92584QtG6vIsyzcueYNWZhxFUVv
         0nVRgNDfESCMuZwsYzGV2cmJl5rn4etemSuJppohKxa4PW8XSjS9MtjiH7ym4LYX7Vgy
         UWQTszMf0FdjHXXgNuv6HTQJQzEW6FiKW5EQ/o94ICExgjuDaYo+WXcU5tnizsmVJ5Gj
         r/NeSUhIzwyEbplV0WoW5FVttxOpsfbmJZShN9qkE9dRhOwxXH2gSnHttECsvgTvGsjd
         r1XQ==
X-Forwarded-Encrypted: i=1; AKwUvBww7VEMNMoMFyvNJL/zZkjsHwN/5ZLVH5yfDBgqC6RjNQ/0wFf/mNFcP5clIlTnMWZzmO3jxB/FhnBze3c=@vger.kernel.org
X-Gm-Message-State: AFuF++nxdl0YVTh3ohL98JiaFoatM+RhOEVJTM4tMl9iPwciuE0gxV27
	mlAF4OIAdTRzz2b3vf4c5Ofg4gGlVTimwl8QNCVCF7ue9qkUsVPL3qvwMCvhssMCVZPuX/jsOOX
	NSRLM4c+LnxDxJIdDsl2gtgtqq5vPWH4Hi5BuD5rO
X-Gm-Gg: AYBFou0vgb7+8581Cmy4FWlnbKPy+gsFOETea7DGZE1wD0d/q14pCXBb0P6DSqQzdt8
	sWnT8VPQx4AG8g+V7CdUYMlWvwqVOownk1cjVGe8oY84+qEKjPqsjjNVrRAcrxD3pL8xPxKUmsz
	K1FOP5Rm9X+aqVxw75RRIO9TPUNh+ZLUDnJiJunOoy0aVTvTrO0grPRKqHzQr+NYf4FtOjINfjb
	wfzXRQPZbNK4/vpmVlJcSRxE852ZZ9NBuc8Gf9qmTe+0P1rLZ+UaiguFh7It8Vhi0j8jIys3+VR
	6b60nxj3YW1qdNNIE1yvb/4rZ6Fz8SPNP7z+6ISnEi63qj9TQT9T2Q3lFkHzDscQ4cAk2Ezw08w
	=
X-Received: by 2002:a05:622a:4185:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-530a4871371mr675561cf.4.1788890922686; Tue, 08 Sep 2026
 11:08:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908130122.633500-1-wutengda@huaweicloud.com> <20260908130122.633500-8-wutengda@huaweicloud.com>
In-Reply-To: <20260908130122.633500-8-wutengda@huaweicloud.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 8 Sep 2026 11:08:31 -0700
X-Gm-Features: AcwNN1VTV6_LLWyJv25dfFMSu7d8R8mTo5r822djiUuUpu_caviCx94Qd19XsIY
Message-ID: <CAP-5=fUAtw6-waqmF4RJFGZ__J=DSzbNLNsOfWekj378_PnrdQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/26] perf dwarf-regs: Adapt get_dwarf_regnum() for arm64
To: Tengda Wu <wutengda@huaweicloud.com>
Cc: Namhyung Kim <namhyung@kernel.org>, james.clark@linaro.org, xueshuai@linux.alibaba.com, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, leo.yan@linux.dev, 
	Li Huafei <lihuafei1@huawei.com>, Kim Phillips <kim.phillips@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Bill Wendling <morbo@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Zecheng Li <zli94@ncsu.edu>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 6:01=E2=80=AFAM Tengda Wu <wutengda@huaweicloud.com>=
 wrote:
>
> The current arm64 DWARF register lookup relies on 'aarch64_regstr_tbl',
> a static string table. While this works for kprobe-tracer where register
> names start with '%', it is insufficient for parsing register numbers
> directly from raw instructions (e.g., extracting '6' from 'x6' or 'w6')
> during annotation.
>
> Since get_dwarf_regnum() is currently used only by 'perf annotate' and
> does not affect kprobe-tracer, replace the limited table-based lookup
> with a programmatic implementation in __get_dwarf_regnum_arm64(). This
> allows resolving arm64 register names (x0-x30, w0-w30, sp, etc.) directly
> into their corresponding DWARF register numbers.
>
> Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
> ---
>  .../util/dwarf-regs-arch/dwarf-regs-arm64.c   | 22 +++++++++++++++++++
>  tools/perf/util/dwarf-regs.c                  |  2 +-
>  tools/perf/util/include/dwarf-regs.h          |  1 +
>  3 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c b/tools/p=
erf/util/dwarf-regs-arch/dwarf-regs-arm64.c
> index 593ca7d4fccc..720c863d1869 100644
> --- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c
> +++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c
> @@ -1,5 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <errno.h>
> +#include <ctype.h>
> +#include <stdlib.h>
> +#include <string.h>
>  #include <dwarf-regs.h>
>  #include "../../../arch/arm64/include/uapi/asm/perf_regs.h"
>
> @@ -10,3 +13,22 @@ int __get_dwarf_regnum_for_perf_regnum_arm64(int perf_=
regnum)
>
>         return perf_regnum;
>  }
> +
> +int __get_dwarf_regnum_arm64(const char *name)
> +{
> +       int reg;
> +
> +       if (!strcmp(name, "sp"))
> +               return 31;
> +
> +       if (*name !=3D 'x' && *name !=3D 'w')
> +               return -ENOENT;
> +
> +       name++;
> +       if (!isdigit(*name))
> +               return -ENOENT;
> +
> +       reg =3D strtol(name, NULL, 10);

Nit: perhaps this can be a little faster and ensure correct string terminat=
ion?
```
if (!isdigit(name[0])) {
    return -ENOENT;
} else if (isdigit(name[1]) && name[2] =3D=3D '\0') {
     reg =3D (name[1] - ' 0') * 10 + name[2] - '0';
} else if (name[1] =3D=3D '\0) {
   reg =3D name[1] - '0';
} else {
   return -ENOENT;
}
```
Everything else looks good to me.

Thanks,
Ian

> +
> +       reg =3D strtol(name, NULL, 10);
> +
> +       return reg >=3D 0 && reg <=3D 30 ? reg : -ENOENT;
> +}
> diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
> index 797f455eba0d..bacf5c13c3bc 100644
> --- a/tools/perf/util/dwarf-regs.c
> +++ b/tools/perf/util/dwarf-regs.c
> @@ -114,7 +114,7 @@ int get_dwarf_regnum(const char *name, unsigned int m=
achine, unsigned int flags)
>                 reg =3D _get_dwarf_regnum(arm_regstr_tbl, name);
>                 break;
>         case EM_AARCH64:
> -               reg =3D _get_dwarf_regnum(aarch64_regstr_tbl, name);
> +               reg =3D __get_dwarf_regnum_arm64(name);
>                 break;
>         case EM_CSKY:
>                 reg =3D __get_csky_regnum(name, flags);
> diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/inclu=
de/dwarf-regs.h
> index 46a764cf322f..a25f038bbff2 100644
> --- a/tools/perf/util/include/dwarf-regs.h
> +++ b/tools/perf/util/include/dwarf-regs.h
> @@ -105,6 +105,7 @@ int __get_dwarf_regnum_x86_64(const char *name);
>  int __get_dwarf_regnum_for_perf_regnum_i386(int perf_regnum);
>  int __get_dwarf_regnum_for_perf_regnum_x86_64(int perf_regnum);
>
> +int __get_dwarf_regnum_arm64(const char *name);
>  int __get_dwarf_regnum_for_perf_regnum_arm(int perf_regnum);
>  int __get_dwarf_regnum_for_perf_regnum_arm64(int perf_regnum);
>
> --
> 2.34.1
>
