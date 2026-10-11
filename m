Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12541213E9C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791755223; cv=pass; b=KOx3hF8rdgaPlaJsgWdyD3Px8CzIeN0IToxke/q5rAgdyRCsWhZ7ZI5V5tARASYZBucQ3YNOpEdePCvlLq70qxSScM279PQPXXcI2L2nLvdZnLxtYwX7TK/yxikFXsP+489xfkUIjLfZenB27XD7l/PuHx1wLOQfu4J8v8PtiTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791755223; c=relaxed/simple;
	bh=/kmIl/C/OdZheQShA5j3E2yu//NEblNTVmml9F5R3QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPiI5OkZXMM13ddsmXdm7OBsexOdp8WdZqijC3K2pqLG8suw4irin99Yx0O80hyAVzRr/6IIPHpxnWUDOxBLth8tLi6dsrBBMnnGjaNJnlzPc4OPfH25LGULzswwrU9whCQz/05adjlpluNg+Abi5QK/SceUGcFYTj/GPXL1wVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hP+oJFM9; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hP+oJFM9"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53584e7c349so184401cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:47:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791755221; cv=none;
        d=google.com; s=arc-20260327;
        b=kRGNM3gHytQXZo8WfXNUTd9xi73JZhURw1icsnftGj4e3DbFRI+U8z/Mp1ngJZv121
         tmyUzRhPaD5ZA/tZU4ppYTFR+zeY4myF+q3YfposqrhbUBf+xjhBb2Rvqn0P5cdER4ke
         lYIlUaRLteyGXIKHHVdq0J4yK0qaeRSVTCJu/xyY9XLJBPjzit5F8WnGfa/sBzKFrOOw
         JziEwH1tcIgWaoIHcnvjzJVKf/GeAbClIwgiX+HQzY8u6UVFR0aioPAWS6YZ8P/xQZ5A
         c9+Jzh+5bPq9KN1uWmQ32C7cbzPbJ+ZtDKA0eRemvnMYo2XFrgsEHO6NPMm/PLYjlvGd
         p/9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FXJ1ycf3F4wB+DoBhvNqI35MkSgpSSXgszMeM3bzHxM=;
        fh=EqzV0xTGWYJfHdtZ7VgPBEkMWUVdEl8yphFHu20EUa8=;
        b=MGihCmNuglEvjnEazEmwhZuB5t2EZQhhtSF89JYREHk4MeGgXkR+FrPtLjM1ywbG01
         aGFsHAt1n/x2BDQ+fbt5F3Xs0mUZQNQ7PC8u40IQ3SFqjJAGAWXyRZfHXYkzObKxw1Tf
         saIooG5WNfZxMwTwbFYrRaE107GzQvKESMrDQmbMvUG79kO2ZzDfT3dZcfckyekpngfd
         E75BZPCop7TZL0zly6mqCioywazpDNRDbdCacDhIEVjA5cO4UywGlWvGWR8K+/JmWOOs
         mlBeTw9k7ff199GoyWxAbLS+dw33CERUKUaDrUZVVwSEGgZMRiVDlGb6qmAH1RQMERxZ
         vU9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791755221; x=1792360021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FXJ1ycf3F4wB+DoBhvNqI35MkSgpSSXgszMeM3bzHxM=;
        b=hP+oJFM9W8LcXxkTpMz9tve5HRTmfTIz4twjMvsZIGM58H1ucYAvQMLpfXmxQ3QIuC
         wwEb2ikUTLErTTybw+44OwcLYzCFKCMHSdPXxoE/ZEUC+ZYPRvY/swr4PrXISHU+kl8+
         1x6D5sicr8OtSbNaNP5Vn3ms53KHv3uxmr9XXzqT/uaWhG6OWBx29WYgXWi6hs3+1p45
         EWTesD8ICqLHZsXdfStTSehrFsDLRY8E5CS6NlJs5fX5k14CA5lxbx3Ab3w6iMrNoXtZ
         J9I1igS+k6paWmshvlo1vBD1PYJrW7zWn7LH1d5xOj0xHfqRsVGIIzL7w3m4oh4YhX5B
         PwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791755221; x=1792360021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXJ1ycf3F4wB+DoBhvNqI35MkSgpSSXgszMeM3bzHxM=;
        b=Uu0mqzuJ/ha9DRQQz84pMQ8GzYvdISX/w/PvGzOC6ZdJxqmLhY2r2/2QLIdmJ57wi5
         OE0M1+5TOKfRaK75MtApQAq0ijt/eYSebnDADILXGmqxV03R7HQnn2+LZIhRN8X0ZGGX
         Y8WKHJjkW4P7+339dc8nrTIS2UoAkBdETnfOngsd4jku75OAZdPC3gjKVWf329uQA8Jn
         RFg4tHCpHIYZkpblc3YPwsqgCvT7QGDqvpGIKxGA8fnXa8FKuORwbC4mfT4nWjaL5D3K
         tqivcfQTpok+3dYS6X/fP2hy4UL8fEOq6zmrUC3mBtjsDeXlh4IYi8bDha2ypqvLlbWl
         btpA==
X-Forwarded-Encrypted: i=1; AKwUvBzA4pyR7OSgigPKdPxkgrC73OWk9x+MOybepCIxO+i9sAZPgEx1/9uWO8fpqJ88OGsV4F5k86jM24NCrCg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEgCzJDyT00LWVsvWycQN6awZ/s18IwJqf0ZEnMNgKiiRN1KhN
	RaWN8h5LXaBQnENW6osTpcIrFgSc/1WozYkIldx5IbyWhW/B1GWIY9tFL3iEI9eHSTzy8JoDplq
	KvZY28VoA48o+0Vl1b40LH6Aq+eaxdQMJ0ZzTuQib
X-Gm-Gg: AYBFou2fXWGmksTUkX1T5UU7eDSYAq+6+3+hjggiupzeg8BEZTRRTvBuD3tfUUa/ODF
	dEGIiBrKRHmkX/DHhsMqFz3C+YlIV/p24Gh3polNDni+k0Qaf4BahURK/HQqRycaKQpTVZVhu3H
	J8Sf5EiQqqP9Hn6sX8fCKAI1yR33rSUA8s2zXV53oQtzjQrB/0dSVQCFqHf+8QE7c4tUSEK4Prn
	dh5mtDoXlpe/8QjdvQaernMdEgRiCX8Udd2KC8RlViPidqZ1oyQC5inaO2qH+L3mM5lTGlmj9d9
	E9up5HnBF7Ht33htZxWEGykJ1UC1uNrmFKgAhgCcVNQ3dDEqcxHZcTfT
X-Received: by 2002:ac8:5a91:0:b0:532:9003:35b1 with SMTP id
 d75a77b69052e-535b2e1f48emr20652761cf.2.1791755218845; Sun, 11 Oct 2026
 14:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-tools-regs-v1-1-2a5940e22548@gmail.com>
In-Reply-To: <20261011-alpha-perf-tools-regs-v1-1-2a5940e22548@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 11 Oct 2026 14:46:46 -0700
X-Gm-Features: AclHuK8fHOuYezppp8l6kmW3ZlcepkFEvJMTVB-VPvbJI-O5w9YniV3JHZyYU7s
Message-ID: <CAP-5=fU8s0EW4Kb=PY6nVomh-pbS7mT=vLLRF7M47h1tK7qjGA@mail.gmail.com>
Subject: Re: [PATCH] perf regs: Add alpha support
To: Matt Turner <mattst88@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Magnus Lindholm <linmag7@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 1:37=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Add the alpha perf register tables so that -I/--user-regs and
> --call-graph dwarf work.
>
> r9-r15 cannot be sampled and are left out of the mask. Perf register
> numbers 0-30 are the DWARF numbers. The pc is DWARF 64, the column GCC
> uses as the alternate return address column on alpha, so libdw's
> frame_nregs is 65.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
> This depends on the kernel side, "alpha: add HAVE_PERF_REGS and
> HAVE_PERF_USER_STACK_DUMP support", posted as part of:
>
> https://lore.kernel.org/r/20261011-alpha-perf-regs-v3-v1-0-3354d135d972@g=
mail.com
>
> --call-graph dwarf also needs libdw alpha unwinding support (abi_cfi
> and frame_nregs), which I am sending to elfutils-devel separately.
> Without it, libdw rejects the thread and perf reports the error;
> -I/--user-regs work regardless.
> ---
>  tools/arch/alpha/include/uapi/asm/perf_regs.h      | 45 ++++++++++++++++=
++++++
>  tools/perf/arch/alpha/include/perf_regs.h          | 16 ++++++++
>  tools/perf/check-headers.sh                        |  1 +
>  tools/perf/util/dwarf-regs-arch/Build              |  1 +
>  tools/perf/util/dwarf-regs-arch/dwarf-regs-alpha.c | 14 +++++++
>  tools/perf/util/dwarf-regs.c                       |  5 +++
>  tools/perf/util/include/dwarf-regs.h               |  2 +
>  tools/perf/util/perf-regs-arch/Build               |  1 +
>  tools/perf/util/perf-regs-arch/perf_regs_alpha.c   | 34 ++++++++++++++++
>  tools/perf/util/perf_regs.c                        | 13 +++++++
>  tools/perf/util/perf_regs.h                        |  5 +++
>  11 files changed, 137 insertions(+)
>
> diff --git a/tools/arch/alpha/include/uapi/asm/perf_regs.h b/tools/arch/a=
lpha/include/uapi/asm/perf_regs.h
> new file mode 100644
> index 000000000000..da96a31b12fb
> --- /dev/null
> +++ b/tools/arch/alpha/include/uapi/asm/perf_regs.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _UAPI_ASM_ALPHA_PERF_REGS_H
> +#define _UAPI_ASM_ALPHA_PERF_REGS_H
> +
> +/*
> + * Indices 0-30 match the hardware (and DWARF) register numbers.
> + * r9-r15 are not saved in pt_regs and cannot be sampled.
> + */
> +enum perf_event_alpha_regs {
> +       PERF_REG_ALPHA_R0,
> +       PERF_REG_ALPHA_R1,
> +       PERF_REG_ALPHA_R2,
> +       PERF_REG_ALPHA_R3,
> +       PERF_REG_ALPHA_R4,
> +       PERF_REG_ALPHA_R5,
> +       PERF_REG_ALPHA_R6,
> +       PERF_REG_ALPHA_R7,
> +       PERF_REG_ALPHA_R8,
> +       PERF_REG_ALPHA_R9,
> +       PERF_REG_ALPHA_R10,
> +       PERF_REG_ALPHA_R11,
> +       PERF_REG_ALPHA_R12,
> +       PERF_REG_ALPHA_R13,
> +       PERF_REG_ALPHA_R14,
> +       PERF_REG_ALPHA_R15,
> +       PERF_REG_ALPHA_R16,
> +       PERF_REG_ALPHA_R17,
> +       PERF_REG_ALPHA_R18,
> +       PERF_REG_ALPHA_R19,
> +       PERF_REG_ALPHA_R20,
> +       PERF_REG_ALPHA_R21,
> +       PERF_REG_ALPHA_R22,
> +       PERF_REG_ALPHA_R23,
> +       PERF_REG_ALPHA_R24,
> +       PERF_REG_ALPHA_R25,
> +       PERF_REG_ALPHA_R26,
> +       PERF_REG_ALPHA_R27,
> +       PERF_REG_ALPHA_R28,
> +       PERF_REG_ALPHA_GP,
> +       PERF_REG_ALPHA_SP,
> +       PERF_REG_ALPHA_PC,
> +       PERF_REG_ALPHA_MAX,
> +};
> +
> +#endif /* _UAPI_ASM_ALPHA_PERF_REGS_H */
> diff --git a/tools/perf/arch/alpha/include/perf_regs.h b/tools/perf/arch/=
alpha/include/perf_regs.h
> new file mode 100644
> index 000000000000..409f3a08af9b
> --- /dev/null
> +++ b/tools/perf/arch/alpha/include/perf_regs.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef ARCH_PERF_REGS_H
> +#define ARCH_PERF_REGS_H
> +
> +#include <stdlib.h>
> +#include <linux/types.h>
> +#include <linux/bits.h>
> +#include "../../../../arch/alpha/include/uapi/asm/perf_regs.h"
> +
> +#define PERF_REGS_MAX PERF_REG_ALPHA_MAX
> +
> +/* The kernel rejects r9-r15. */
> +#define PERF_REGS_MASK (GENMASK_ULL(PERF_REG_ALPHA_MAX - 1, 0) & \
> +                       ~GENMASK_ULL(PERF_REG_ALPHA_R15, PERF_REG_ALPHA_R=
9))
> +
> +#endif /* ARCH_PERF_REGS_H */
> diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
> index 531c0e0e84df..9baf83f79e23 100755
> --- a/tools/perf/check-headers.sh
> +++ b/tools/perf/check-headers.sh
> @@ -36,6 +36,7 @@ declare -a FILES=3D(
>    "arch/x86/include/asm/msr-index.h"
>    "arch/x86/lib/x86-opcode-map.txt"
>    "arch/x86/tools/gen-insn-attr-x86.awk"
> +  "arch/alpha/include/uapi/asm/perf_regs.h"
>    "arch/arm/include/uapi/asm/perf_regs.h"
>    "arch/arm64/include/uapi/asm/perf_regs.h"
>    "arch/loongarch/include/uapi/asm/perf_regs.h"
> diff --git a/tools/perf/util/dwarf-regs-arch/Build b/tools/perf/util/dwar=
f-regs-arch/Build
> index ceb68ae86fd8..026b7b5ca895 100644
> --- a/tools/perf/util/dwarf-regs-arch/Build
> +++ b/tools/perf/util/dwarf-regs-arch/Build
> @@ -1,3 +1,4 @@
> +perf-util-$(CONFIG_LIBDW) +=3D dwarf-regs-alpha.o
>  perf-util-$(CONFIG_LIBDW) +=3D dwarf-regs-arm64.o
>  perf-util-$(CONFIG_LIBDW) +=3D dwarf-regs-arm.o
>  perf-util-$(CONFIG_LIBDW) +=3D dwarf-regs-csky.o
> diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-alpha.c b/tools/p=
erf/util/dwarf-regs-arch/dwarf-regs-alpha.c
> new file mode 100644
> index 000000000000..50fd17096597
> --- /dev/null
> +++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-alpha.c
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <errno.h>
> +#include <dwarf-regs.h>
> +#include "../../../arch/alpha/include/uapi/asm/perf_regs.h"
> +
> +int __get_dwarf_regnum_for_perf_regnum_alpha(int perf_regnum)
> +{
> +       if (perf_regnum >=3D PERF_REG_ALPHA_R0 && perf_regnum <=3D PERF_R=
EG_ALPHA_SP)
> +               return perf_regnum;
> +       if (perf_regnum =3D=3D PERF_REG_ALPHA_PC)
> +               return 64;
> +
> +       return -ENOENT;
> +}
> diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
> index 09aca6304002..3fd71787c658 100644
> --- a/tools/perf/util/dwarf-regs.c
> +++ b/tools/perf/util/dwarf-regs.c
> @@ -185,6 +185,8 @@ static int get_libdw_frame_nregs(unsigned int machine=
, unsigned int flags __mayb
>                 return 74;
>         case EM_MIPS:
>                 return 71;
> +       case EM_ALPHA:
> +               return 65;
>         default:
>                 return 0;
>         }
> @@ -228,6 +230,9 @@ int get_dwarf_regnum_for_perf_regnum(int perf_regnum,=
 unsigned int machine,
>         case EM_MIPS:
>                 reg =3D __get_dwarf_regnum_for_perf_regnum_mips(perf_regn=
um);
>                 break;
> +       case EM_ALPHA:
> +               reg =3D __get_dwarf_regnum_for_perf_regnum_alpha(perf_reg=
num);
> +               break;
>         default:
>                 pr_err("ELF MACHINE %x is not supported.\n", machine);
>                 return -ENOENT;
> diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/inclu=
de/dwarf-regs.h
> index 1da915c2683a..8d1a981ab8aa 100644
> --- a/tools/perf/util/include/dwarf-regs.h
> +++ b/tools/perf/util/include/dwarf-regs.h
> @@ -105,6 +105,8 @@ int __get_dwarf_regnum_x86_64(const char *name);
>  int __get_dwarf_regnum_for_perf_regnum_i386(int perf_regnum);
>  int __get_dwarf_regnum_for_perf_regnum_x86_64(int perf_regnum, int abi);
>
> +int __get_dwarf_regnum_for_perf_regnum_alpha(int perf_regnum);
> +
>  int __get_dwarf_regnum_arm64(const char *name);
>  int __get_dwarf_regnum_for_perf_regnum_arm(int perf_regnum);
>  int __get_dwarf_regnum_for_perf_regnum_arm64(int perf_regnum);
> diff --git a/tools/perf/util/perf-regs-arch/Build b/tools/perf/util/perf-=
regs-arch/Build
> index be95402aa540..1fbc299775f7 100644
> --- a/tools/perf/util/perf-regs-arch/Build
> +++ b/tools/perf/util/perf-regs-arch/Build
> @@ -1,4 +1,5 @@
>  perf-util-y +=3D perf_regs_aarch64.o
> +perf-util-y +=3D perf_regs_alpha.o
>  perf-util-y +=3D perf_regs_arm.o
>  perf-util-y +=3D perf_regs_csky.o
>  perf-util-y +=3D perf_regs_loongarch.o
> diff --git a/tools/perf/util/perf-regs-arch/perf_regs_alpha.c b/tools/per=
f/util/perf-regs-arch/perf_regs_alpha.c
> new file mode 100644
> index 000000000000..cb9c8a1cd74b
> --- /dev/null
> +++ b/tools/perf/util/perf-regs-arch/perf_regs_alpha.c
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include "../perf_regs.h"
> +#include "../../arch/alpha/include/perf_regs.h"
> +
> +static const char * const alpha_reg_names[PERF_REG_ALPHA_MAX] =3D {
> +       "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
> +       "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15",
> +       "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
> +       "r24", "r25", "r26", "r27", "r28", "gp", "sp", "pc",
> +};
> +
> +uint64_t __perf_reg_mask_alpha(bool intr __maybe_unused)
> +{
> +       return PERF_REGS_MASK;
> +}
> +
> +const char *__perf_reg_name_alpha(int id)
> +{
> +       if (id < 0 || id >=3D PERF_REG_ALPHA_MAX)
> +               return NULL;
> +
> +       return alpha_reg_names[id];
> +}
> +
> +uint64_t __perf_reg_ip_alpha(void)
> +{
> +       return PERF_REG_ALPHA_PC;
> +}
> +
> +uint64_t __perf_reg_sp_alpha(void)
> +{
> +       return PERF_REG_ALPHA_SP;
> +}
> diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
> index c8242b7e1db5..6eb5824f5521 100644
> --- a/tools/perf/util/perf_regs.c
> +++ b/tools/perf/util/perf_regs.c
> @@ -43,6 +43,9 @@ uint64_t perf_intr_reg_mask(uint16_t e_machine, int *ab=
i /*inout*/)
>         uint64_t mask =3D 0;
>
>         switch (e_machine) {
> +       case EM_ALPHA:
> +               mask =3D __perf_reg_mask_alpha(/*intr=3D*/true);
> +               break;
>         case EM_ARM:
>                 mask =3D __perf_reg_mask_arm(/*intr=3D*/true);
>                 break;
> @@ -86,6 +89,9 @@ uint64_t perf_user_reg_mask(uint16_t e_machine, int *ab=
i /*inout*/)
>         uint64_t mask =3D 0;
>
>         switch (e_machine) {
> +       case EM_ALPHA:
> +               mask =3D __perf_reg_mask_alpha(/*intr=3D*/false);
> +               break;
>         case EM_ARM:
>                 mask =3D __perf_reg_mask_arm(/*intr=3D*/false);
>                 break;
> @@ -129,6 +135,9 @@ const char *perf_reg_name(int id, uint16_t e_machine,=
 uint32_t e_flags, int abi)
>         const char *reg_name =3D NULL;
>
>         switch (e_machine) {
> +       case EM_ALPHA:
> +               reg_name =3D __perf_reg_name_alpha(id);
> +               break;
>         case EM_ARM:
>                 reg_name =3D __perf_reg_name_arm(id);
>                 break;
> @@ -198,6 +207,8 @@ int perf_reg_value(u64 *valp, struct regs_dump *regs,=
 int id)
>  uint64_t perf_arch_reg_ip(uint16_t e_machine)
>  {
>         switch (e_machine) {
> +       case EM_ALPHA:
> +               return __perf_reg_ip_alpha();
>         case EM_ARM:
>                 return __perf_reg_ip_arm();
>         case EM_AARCH64:
> @@ -227,6 +238,8 @@ uint64_t perf_arch_reg_ip(uint16_t e_machine)
>  uint64_t perf_arch_reg_sp(uint16_t e_machine)
>  {
>         switch (e_machine) {
> +       case EM_ALPHA:
> +               return __perf_reg_sp_alpha();
>         case EM_ARM:
>                 return __perf_reg_sp_arm();
>         case EM_AARCH64:
> diff --git a/tools/perf/util/perf_regs.h b/tools/perf/util/perf_regs.h
> index c9f461b6f11f..4134e4eed802 100644
> --- a/tools/perf/util/perf_regs.h
> +++ b/tools/perf/util/perf_regs.h
> @@ -34,6 +34,11 @@ const char *__perf_reg_name_arm64(int id);
>  uint64_t __perf_reg_ip_arm64(void);
>  uint64_t __perf_reg_sp_arm64(void);
>
> +uint64_t __perf_reg_mask_alpha(bool intr);
> +const char *__perf_reg_name_alpha(int id);
> +uint64_t __perf_reg_ip_alpha(void);
> +uint64_t __perf_reg_sp_alpha(void);
> +
>  uint64_t __perf_reg_mask_arm(bool intr);
>  const char *__perf_reg_name_arm(int id);
>  uint64_t __perf_reg_ip_arm(void);
>
> ---
> base-commit: bc01105ed65d15787b2eb93ac26e8624a2139e35
> change-id: 20261001-alpha-perf-tools-regs-c206a84dec7f
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>
