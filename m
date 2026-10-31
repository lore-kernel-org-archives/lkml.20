Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793469830;
	b=xLmiqKxzK9jG2AfA2lxCFWz1EMRdqaqKcWnc2jC/jpGOJk5Jdq4A8NriQfiwQORmAUng
	 KPqv7d2tcK1VyHhQKFcxqDBpxlX4o/KBYJ0ULN9wIhOtwwEZremj3pbrtExUxo30Z5YVr
	 rpcjm4TCUXb/6p/TVLZDh9AJXgEg4LRLEqDDQXZXOjB62YUXNyHJno3XqhsAlZ24jTxL2
	 CRkNlS33t4383Tfny5s0oR0WpslOvcEgYRhDTKcY+g++XFmMoQ1si4GPH/bq6x+5YPcfL
	 2fgpEIS78hEDxkR2qg7ud3k97LKHGaQZY/t5a/z/Hd4gThDWzCu23jKjSR4bup6VDZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793469830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KsRgGWz/X3xi8qWx3igkiGXno4m33kSDjYAblwsQQBU=;
	b=1LdVLiFFHq+IT3FrfDpR4wVBFgvyKaemLrwklWNwPV4lvB54qTV+S3z6ZwnopgH4k5uS
	 +KzfheYbzzPMWsrMhppDn8MJKh+cUSERYm9tZCJgiTzWTDPhUGBRb+8MKw+wd2WCd+bhT
	 bFTeI8X5irUCsIYsvfJcbf2MFq3LZ5gDnaR8ZiFdHDT73Aktls4BWb/EF+jl2TTPZwqcg
	 AggALJ4nv8/Ss8Q5UwnN41MCY0oAsSqcIA/kc0zWM1cCTgtv29QMkVTB8WjRhatdzEfrI
	 ZSF7I9si8wx0fxn173VCrNos/e5pxHtnFZS+9Y+qlYLs+d4cXIbxOGHfa2V6triDtXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivF6hTm7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A6C606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A6C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivF6hTm7
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c450ab1483cso279703566b.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793469827; cv=none;
        d=google.com; s=arc-20260327;
        b=F28BFPE1WeeemcGpcJd6uUNJ23hxFE2d27qi78NJ4WfyT8+Vg7A8P7+nHhDgop8GNi
         vTX6ZfJM5JIuHLAD3LcuGqb2Fj18pqY+rtlOqV9n09Ahl5t02UlCoH2aR9uporUj4tba
         QsRMH4tA5JNejs/mcCa0OUg1yMslTyD5cxpXzeMe49uaWt0cfxfyDiccv7mP0QXrzC/n
         WOYWpU7fNHjjyGw27YdumjdQX7v3aGmNsu3JtvZe/pQcuQLQVgcrecnAQrSHwLOjyMcW
         duMPIDzHGwqV6Ikbs6VsGyPUjkkn7QWdwsOIk2EgWHzet0HZShplodjD9uHx+e2YOV7s
         KIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KsRgGWz/X3xi8qWx3igkiGXno4m33kSDjYAblwsQQBU=;
        fh=e9UmSykqiH3RcoEgaAEO9Ap4Drp/+rh0Scyadzy4sno=;
        b=Twt2JA9fj8RljwfyJQrx7uZf9Zr/VWYVAC78/OmAwvqKKcg0xuaj5DuoAhJqeAygU6
         epADRzJGK6wJKCIs6eGmbPRpseYFs8K2+XHhw7sMY6wbCj+hhSwTws9U1mlYN6RpbT5e
         Z1tJfdESfAI7EDTfXYJ1NMsLBVbUlQCkF1LqaHH7tkih+lTu0jJ6qiM45koHk4C0JLXM
         k+z46iX1mm/ICXsOeY1LIYA98LpDabR5n+9j44F5vNiZMM2I9WX6vkiWqiRcFwHs2WTC
         hLG1JOECG5YLK0joeYtStYbDYVBB419mZa15CFDgnLWDqUqv+dLRRDQrYOn5Q5lu2g7s
         wxaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793469827; x=1794074627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KsRgGWz/X3xi8qWx3igkiGXno4m33kSDjYAblwsQQBU=;
        b=ivF6hTm7ojLBkCtPeDxUMFvVjjBGvjzBCp0mrKwqSbTef3NeJp+9G42b0jQGAqXEBo
         lvNaGl3EU8fPK6LLrAgVZriMtHXxBEdyK++H0m4M7FVJz0AZTcQ5VaZj8qQ8eTd74vuQ
         JfhsQi1hW04gDO/Ba/8R1a4vUAY+JnwBjiBYxrFGPQTQTD+qAg70lJ2HZr3eHQ1Ep+7v
         K2gPs0cqNqDW6afoO6p5T21W9zNtowh6KAKgHSWplBDvg7HL1ZH3n4JM7kjD5GpkKGqK
         wAnAG03X+pKLgLIGg1tUVi0pYBh8HOGo3rKrZTNbcoDJlY7RtVos3Ak5LQDF0LWllAVl
         JgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793469827; x=1794074627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsRgGWz/X3xi8qWx3igkiGXno4m33kSDjYAblwsQQBU=;
        b=bZIxsaz5t0vgcVibkMH0JGqfTDrSchGMZjEgEiP/u2Cn7X9j+Y0Y4Jl036Y68ZD1ty
         wolKwQM7/wsbA+/NaMt/zH96HIZHALh4VIF0mxJu0XsOIfWj5gs5coH3/n53a6pyccoS
         URuKvF1MY6rUpjhztbjLw5IFXZ+sxdgv0gqSUeWEkXI/vWh6Ma7hRDm7RLzYR0Tr7tXF
         pKMt+GNDqGiTUD/BCbYpgXZCuGyhEe1r/8EKBhsfTZekWDeqpwTGrN2m3EPcejEwRA4U
         QGFdFURbXyFVze8XHnm4oaBZiX5G8gC/S6Az8adA5vNFOaukp9s10ymuYMT0BxtKrX/6
         /puw==
X-Forwarded-Encrypted: i=1; AKwUvBy984gjL/iNLz026SZWu3PcpHw5UslAH3uv83xq9peQ4uCqwFXUfeOgWifwY/qc30pTjpayYNIpt01zju0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+YG1htmQMFOTL+4m7BtXX86qvZ7GoNbQizMDbfIRhHSFtmMlj
	7PxGG6zOk6ioa7/hqrfal/3oxqQU2OZQJzLRCeZuGbJNnKWbwykvgz4AdQbzARRKZpzv5IBcLwE
	ngC0+vlIepQViYgLywgyiX+h+PYBPGOw=
X-Gm-Gg: AYBFou3mfQf1WSgpPxXqb8fnzDYd0zDXp3v0MwcEX+IKy35SUQEIcURDQjdmihMDjJc
	E72YrrWerZm0S7Pti2BIT+b5PJ6bCS1OYRsUTaK7pt2OjjCP+aJhfu0yH7Ng+72yyGhatWq3N+S
	QrHpyCIu8nwGu9kf5Yyppjjf9+wCxYOjj9q2zVtEzwmD9t7SHxo3PYhzmmqILAXIX8HsWRL3haZ
	KEkQq4PefE5TLzzyKMm3nGY7lRwhwfVTsgfyOfSy464US3VnkB2ym9bpjNP8PK13u3JumHaeTdW
	PWGTejIULwI/8Ruz+5TIxbAL4KaelkvKBevKoilLOazUEjSgsN2bVsheTxK07EtDmllpaBaYd9G
	Eu0H8jk35mjhWRSvFjzCDWeqq2OyWN0yl0cj3I0gUjsGmW0JmGTomBEo7HD5axPCf/5XorfRDXl
	SBFja1iZvrGs6IL7OmQPFF6xaa
X-Received: by 2002:a17:906:9f92:b0:c41:5970:2360 with SMTP id
 a640c23a62f3a-c4ca7ad1d1fmr471184866b.41.1793469827497; Sat, 31 Oct 2026
 11:03:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-perf-alpha-profileme-v2-0-9ce2f0b0e622@gmail.com> <20261030-perf-alpha-profileme-v2-1-9ce2f0b0e622@gmail.com>
In-Reply-To: <20261030-perf-alpha-profileme-v2-1-9ce2f0b0e622@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 31 Oct 2026 19:03:36 +0100
X-Gm-Features: AclHuK-2odKuRuZw0XWsQTnkwcBT5erymxjVl5ceNWr0gjZ23ZPZzqRmnILbas0
Message-ID: <CA+=Fv5RrvppOmw8ra41A0SzTpX_sNs9dWEL15r-Di8TeQ3_ECQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] perf alpha: Decode ProfileMe raw samples
To: Matt Turner <mattst88@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Fri, Oct 30, 2026 at 5:09=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> The Alpha cpu PMU attaches struct alpha_profileme_sample to each
> ProfileMe sample as PERF_SAMPLE_RAW data: the profiled instruction's
> PMPC along with the I_STAT and PCTR_CTL status that says what happened
> to it.
>
> Decode it in perf report -D and perf script -D the way AMD IBS raw data
> is decoded, naming the trap from TRAP_TYPE when TRP is set and from the
> PALcode entry offset in PMPC for redirect traps, which TRAP_TYPE does
> not report. The payload is copied out of the sample and converted from
> little endian, so that it decodes on strict-alignment and big-endian
> hosts too.
>
> Copy the uapi header that defines the struct into tools/arch and add it
> to check-headers.sh.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  tools/arch/alpha/include/uapi/asm/perf_event.h |  31 ++++++
>  tools/perf/check-headers.sh                    |   1 +
>  tools/perf/util/Build                          |   1 +
>  tools/perf/util/alpha-sample-raw.c             | 145 +++++++++++++++++++=
++++++
>  tools/perf/util/sample-raw.c                   |   2 +
>  tools/perf/util/sample-raw.h                   |   2 +
>  6 files changed, 182 insertions(+)
>
> diff --git a/tools/arch/alpha/include/uapi/asm/perf_event.h b/tools/arch/=
alpha/include/uapi/asm/perf_event.h
> new file mode 100644
> index 000000000000..aa0eff5a917c
> --- /dev/null
> +++ b/tools/arch/alpha/include/uapi/asm/perf_event.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _UAPI_ASM_ALPHA_PERF_EVENT_H
> +#define _UAPI_ASM_ALPHA_PERF_EVENT_H
> +
> +#include <linux/types.h>
> +
> +/*
> + * PERF_SAMPLE_RAW payload of a ProfileMe sample from the cpu PMU.
> + *
> + * pmpc, i_stat and pctr_ctl are the values of the PMPC, I_STAT and
> + * PCTR_CTL registers when the ProfileMe window closed. i_stat holds onl=
y
> + * bits 40:30 and pctr_ctl only bits 47:0. See the EV67/EV68 Hardware
> + * Reference Manuals for the field layout.
> + *
> + * In the sample record the payload follows the 32-bit PERF_SAMPLE_RAW
> + * size, so it starts 4 bytes past an 8-byte boundary. The 64-bit fields
> + * are packed after the 32-bit version so that they are 8-byte aligned i=
n
> + * the record and no padding follows the payload.
> + *
> + * Fields may be added to the end in later versions.
> + */
> +#define ALPHA_PROFILEME_SAMPLE_VERSION 1
> +
> +struct alpha_profileme_sample {
> +       __u32 version;
> +       __u64 pmpc __attribute__((packed));
> +       __u64 i_stat __attribute__((packed));
> +       __u64 pctr_ctl __attribute__((packed));
> +};
> +
> +#endif /* _UAPI_ASM_ALPHA_PERF_EVENT_H */
> diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
> index 531c0e0e84df..de66bb148754 100755
> --- a/tools/perf/check-headers.sh
> +++ b/tools/perf/check-headers.sh
> @@ -36,6 +36,7 @@ declare -a FILES=3D(
>    "arch/x86/include/asm/msr-index.h"
>    "arch/x86/lib/x86-opcode-map.txt"
>    "arch/x86/tools/gen-insn-attr-x86.awk"
> +  "arch/alpha/include/uapi/asm/perf_event.h"
>    "arch/arm/include/uapi/asm/perf_regs.h"
>    "arch/arm64/include/uapi/asm/perf_regs.h"
>    "arch/loongarch/include/uapi/asm/perf_regs.h"
> diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> index 2c1f880c4c47..2ab63bbe4a05 100644
> --- a/tools/perf/util/Build
> +++ b/tools/perf/util/Build
> @@ -77,6 +77,7 @@ perf-util-y +=3D sample.o
>  perf-util-y +=3D sample-raw.o
>  perf-util-y +=3D s390-sample-raw.o
>  perf-util-y +=3D amd-sample-raw.o
> +perf-util-y +=3D alpha-sample-raw.o
>  perf-util-y +=3D ordered-events.o
>  perf-util-y +=3D namespaces.o
>  perf-util-y +=3D comm.o
> diff --git a/tools/perf/util/alpha-sample-raw.c b/tools/perf/util/alpha-s=
ample-raw.c
> new file mode 100644
> index 000000000000..b4e336d8fc8f
> --- /dev/null
> +++ b/tools/perf/util/alpha-sample-raw.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Alpha specific. Provide textual annotation for ProfileMe raw sample d=
ata.
> + */
> +
> +#include <stdio.h>
> +#include <string.h>
> +#include <linux/kernel.h>
> +#include <linux/perf_event.h>
> +
> +#include "../../arch/alpha/include/uapi/asm/perf_event.h"
> +
> +#include "evlist.h"
> +#include "evsel.h"
> +#include "sample-raThe v2 decoder passed the unaligned-payload test unde=
r Alpha QEMU
with SIGBUS enabled for unaligned accesses. On my ES40 it also
decoded recordings from all four ProfileMe modes, with the expected
selectors in each case.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>The v2 decoder passed
the unaligned-payload test under Alpha QEMU
with SIGBUS enabled for unaligned accesses. On my ES40 it also
decoded recordings from all four ProfileMe modes, with the expected
selectors in each case.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>w.h"
> +#include "util/sample.h"
> +
> +/* I_STAT */
> +#define I_STAT_OVR(x)          (((x) >> 30) & 0x7)
> +#define I_STAT_ICM(x)          (((x) >> 33) & 0x1)
> +#define I_STAT_TRAP_TYPE(x)    (((x) >> 34) & 0xf)
> +#define I_STAT_LSO(x)          (((x) >> 38) & 0x1)
> +#define I_STAT_TRP(x)          (((x) >> 39) & 0x1)
> +#define I_STAT_MIS(x)          (((x) >> 40) & 0x1)
> +
> +/* PCTR_CTL */
> +#define PCTR_CTL_TAK(x)                ((x) & 0x1)
> +#define PCTR_CTL_VAL(x)                (((x) >> 1) & 0x1)
> +#define PCTR_CTL_SL1(x)                (((x) >> 2) & 0x3)
> +#define PCTR_CTL_SL0(x)                (((x) >> 4) & 0x1)
> +#define PCTR_CTL_PCTR1(x)      (((x) >> 6) & 0xfffff)
> +#define PCTR_CTL_KILLED(x)     (((x) >> 26) & 0x1)
> +#define PCTR_CTL_STALLED(x)    (((x) >> 27) & 0x1)
> +#define PCTR_CTL_PCTR0(x)      (((x) >> 28) & 0xfffff)
> +
> +/* PMPC */
> +#define PMPC_PAL(x)            ((x) & 0x1)
> +#define PMPC_PAL_OFFSET(x)     ((x) & 0x7fff)
> +
> +static const char * const trap_type_names[16] =3D {
> +       [0]  =3D "replay",
> +       [2]  =3D "DTB double miss (3 level)",
> +       [3]  =3D "DTB double miss (4 level)",
> +       [4]  =3D "FP disabled",
> +       [5]  =3D "unaligned",
> +       [6]  =3D "DTB single miss",
> +       [7]  =3D "Dstream fault",
> +       [8]  =3D "OPCDEC",
> +       [10] =3D "machine check",
> +       [12] =3D "arithmetic",
> +       [14] =3D "MT_FPCR",
> +       [15] =3D "reset",
> +};
> +
> +/* What PCTR1 counts during the window, by SL1. */
> +static const char * const pctr1_names[4] =3D {
> +       "cycles",
> +       "retire delay",
> +       "bcache misses",
> +       "mbox replays",
> +};
> +
> +static const char *trap_name(__u64 i_stat, __u64 pmpc)
> +{
> +       const char *name;
> +
> +       /* Redirect traps leave TRAP_TYPE alone and are named by PMPC. */
> +       if (PMPC_PAL(pmpc)) {
> +               switch (PMPC_PAL_OFFSET(pmpc)) {
> +               case 0x481:
> +                       return "Istream access violation";
> +               case 0x581:
> +                       return "ITB miss";
> +               case 0x681:
> +                       return "interrupt";
> +               default:
> +                       break;
> +               }
> +       }
> +       if (!I_STAT_TRP(i_stat) || I_STAT_MIS(i_stat))
> +               return "none";
> +       name =3D trap_type_names[I_STAT_TRAP_TYPE(i_stat)];
> +       return name ? name : "other (see PMPC)";
> +}
> +
> +/*
> + * Copy the payload out of the sample, since nothing guarantees its
> + * alignment in the buffer, and convert it from the little-endian byte
> + * order it was recoThe v2 decoder passed the unaligned-payload test und=
er Alpha QEMU
with SIGBUS enabled for unaligned accesses. On my ES40 it also
decoded recordings from all four ProfileMe modes, with the expected
selectors in each case.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>rded in.
> + */
> +static bool is_profileme_sample(struct evlist *evlist, union perf_event =
*event,
> +                               struct perf_sample *sample,
> +                               struct alpha_profileme_sample *pm)
> +{
> +       struct evsel *evsel;
> +
> +       if (sample->raw_size < sizeof(*pm))
> +               return false;
> +
> +       evsel =3D evlist__event2evsel(evlist, event);
> +       if (!evsel)
> +               return false;
> +       if (evsel->core.attr.type !=3D PERF_TYPE_HARDWARE &&
> +           evsel->core.attr.type !=3D PERF_TYPE_RAW)
> +               return false;
> +
> +       memcpy(pm, sample->raw_data, sizeof(*pm));
> +       pm->version =3D le32_to_cpu(pm->version);
> +       pm->pmpc =3D le64_to_cpu(pm->pmpc);
> +       pm->i_stat =3D le64_to_cpu(pm->i_stat);
> +       pm->pctr_ctl =3D le64_to_cpu(pm->pctr_ctl);
> +
> +       return pm->version >=3D ALPHA_PROFILEME_SAMPLE_VERSION;
> +}
> +
> +void evlist__alpha_sample_raw(struct evlist *evlist, union perf_event *e=
vent,
> +                             struct perf_sample *sample)
> +{
> +       struct alpha_profileme_sample pm;
> +       unsigned long long i_stat, ctl, pmpc;
> +
> +       if (event->header.type !=3D PERF_RECORD_SAMPLE ||
> +           !is_profileme_sample(evlist, event, sample, &pm))
> +               return;
> +
> +       i_stat =3D pm.i_stat;
> +       ctl =3D pm.pctr_ctl;
> +       pmpc =3D pm.pmpc;
> +
> +       printf("ProfileMe PMPC:\t%016llx %s trap %s%s\n",
> +              pmpc, PMPC_PAL(pmpc) ? "PAL" : (pmpc >> 63 ? "kernel" : "u=
ser"),
> +              trap_name(i_stat, pmpc),
> +              I_STAT_TRP(i_stat) && I_STAT_MIS(i_stat) ? " mispredicted"=
 : "");
> +       printf("ProfileMe I_STAT:\t%016llx TRP %d MIS %d LSO %d TrapType =
%d ICM %d OVR %d\n",
> +              i_stat, (int)I_STAT_TRP(i_stat), (int)I_STAT_MIS(i_stat),
> +              (int)I_STAT_LSO(i_stat), (int)I_STAT_TRAP_TYPE(i_stat),
> +              (int)I_STAT_ICM(i_stat), (int)I_STAT_OVR(i_stat));
> +       printf("ProfileMe PCTR_CTL:\t%016llx VAL %d TAK %d Stalled %d Kil=
led %d",
> +              ctl, (int)PCTR_CTL_VAL(ctl), (int)PCTR_CTL_TAK(ctl),
> +              (int)PCTR_CTL_STALLED(ctl), (int)PCTR_CTL_KILLED(ctl));
> +       printf(" SL0 %d SL1 %d PCTR0 %d PCTR1 %d (%s)\n",
> +              (int)PCTR_CTL_SL0(ctl), (int)PCTR_CTL_SL1(ctl),
> +              (int)PCTR_CTL_PCTR0(ctl), (int)PCTR_CTL_PCTR1(ctl),
> +              pctr1_names[PCTR_CTL_SL1(ctl)]);
> +}
> diff --git a/tools/perf/util/sample-raw.c b/tools/perf/util/sample-raw.c
> index f5ae9f468983..f765429a481d 100644
> --- a/tools/perf/util/sample-raw.c
> +++ b/tools/perf/util/sample-raw.c
> @@ -19,6 +19,8 @@ void evlist__init_trace_event_sample_raw(struct evlist =
*evlist, struct perf_env
>
>         if (e_machine =3D=3D EM_S390) {
>                 evlist__set_trace_event_sample_raw(evlist, evlist__s390_s=
ample_raw);
> +       } else if (e_machine =3D=3D EM_ALPHA) {
> +               evlist__set_trace_event_sample_raw(evlist, evlist__alpha_=
sample_raw);
>         } else if (e_machine =3D=3D EM_X86_64 || e_machine =3D=3D EM_386)=
 {
>                 const char *cpuid =3D perf_env__cpuid(env);
>
> diff --git a/tools/perf/util/sample-raw.h b/tools/perf/util/sample-raw.h
> index c8d38c841c8c..8df0bd3d02aa 100644
> --- a/tools/perf/util/sample-raw.h
> +++ b/tools/perf/util/sample-raw.h
> @@ -14,6 +14,8 @@ void evlist__s390_sample_raw(struct evlist *evlist, uni=
on perf_event *event,
>  bool evlist__has_amd_ibs(struct evlist *evlist);
>  void evlist__amd_sample_raw(struct evlist *evlist, union perf_event *eve=
nt,
>                             struct perf_sample *sample);
> +void evlist__alpha_sample_raw(struct evlist *evlist, union perf_event *e=
vent,
> +                             struct perf_sample *sample);
>  void evlist__init_trace_event_sample_raw(struct evlist *evlist, struct p=
erf_env *env);
>
>  #endif /* __SAMPLE_RAW_H */
>
> --
> 2.55.0
>
>

The v2 decoder passed the unaligned-payload test under Alpha QEMU
with SIGBUS enabled for unaligned accesses. On my ES40 it also
decoded recordings from all four ProfileMe modes, with the expected
selectors in each case.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
