Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793465732;
	b=m9pF2ACS7ahEod6lOoCJlX+Ft0f/f5HJUmxbHOXKOEQHMLDyGRLRosV3urq6VsWwh6ZF
	 1jgOEEkCwCXbLE7I/Y7FZe/+iyhNAAiDwKwmmOFCKf2GBVYT6EQcABSZmhiR5Wxf8vvzi
	 H3WSVOWLhrA4aMkN8sDKpCAi87u7K2pljXwhuZTVh+Y261s5EXDeKMuOT1o+WcIoVzJMp
	 5LEEJeoImH8661WBTjeTrQS5UZhrsJUuIF2zTbxCB/9Vv7dXfb/zFgmbhmQlDAZJwIzYh
	 nMF4udmN0bcpGnxYRAuEm+nG/puC2O9g3hqPdk+l+NQykh+HjDVDefXs7lA1TUQ1U6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K3AF4yhejw1zi/AA2enCSIBecmS/SX7iKrYz1efJHMs=;
	b=qPdoqRqMxzVqo5i7SgYfWv5Y/R4PUxhnQxRORdBkesE+bj1Ag/0DkFgltaJDTgMKSiIi
	 V7/9UUQnHJZwOmBXCqT5OSgq7Bx3MPxmI/FT5Jta7OjLBVygv9Re/j9itl3yN2sEXXCaG
	 rQ2P/cGMoWjuvr45r4OBEV/etw0kTLljiJ2MUHTAbnckGERTX9vz41Hr92ukzAdLFeJWk
	 k1fc5MXPMqQu7ExbIUD9xPezVk+YlwAQHKj1e8auy42xRXM/6gZPKW+jxBM/081/WO/AL
	 CXXxdvRii8DO0MnyNQhCTfQcRov34HLovGC7OnY4cavtvrVzEN6qZZaJ9Q01AMv8DBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iKfmBFaO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F2B606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F2B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iKfmBFaO
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c46822eefb6so228253966b.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793465730; cv=none;
        d=google.com; s=arc-20260327;
        b=RwCIqsuUqDQMfFqncWw+VGYPxF04/DU2MIy4c58MUUOJpxJ6To85MP/psiX/y1Qsal
         AcASkizkPyveBOg0h2UskBPzc1shiwj2z2TAgqsUGszhKD9kJibU+1KOonCd3iMzZa2D
         A1jzCfVnIRfuI3yQqgiTPX41As6wMSJusa0SS7DjjaH9zE96tvU/MZX+/HZMpGZx6aqx
         ZHyZOPAjEzkj+pNhAPQunRYDmRbKTGkD0uzdkxJkJkIg/CreSTZf2xmR34q4QpazAxPm
         Nlq5Tf0jIWzcFijArRa0+RGOGNRCJ/DvLmvTraOInsnovB3N1sIkaVWpmqNOKEOqoNTM
         LuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K3AF4yhejw1zi/AA2enCSIBecmS/SX7iKrYz1efJHMs=;
        fh=Pylzzv9wF38hA6iCKI7IMeeK35vTVZVEfbp/39VVfRQ=;
        b=B+Ftv/dT9WT1Nvoqoa2SZ8AzzJbsepPhspJmSGkIq9Q879sbD+bIXmtzZldQGdduJc
         EAu8SaUQfuP5/ErqNjkvr7MmMlMNB/Fny6sfz7u63AGEaycXXneaqeNuV/ifhYPiL2zk
         33mKL2VVDJEjETb5NAir+3TnnF3Usf839Dqy57/iHVOzzQ6XRgZAtF/aOugzYtEQ10gk
         8wjMgnnfXGriYqi9/rM7xNabMZ1zZeSdErH5r97RHPdOTvddDz0x1RPTgBt4HC2aWwZ8
         PLQWB+S2VxZ9TAMYNI3lt+u0JhVNuXiqNAgUk16axI9PjiSEPX0HcBtt+E9+UBI1rXGO
         uSMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793465730; x=1794070530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K3AF4yhejw1zi/AA2enCSIBecmS/SX7iKrYz1efJHMs=;
        b=iKfmBFaO1qcZGGI4H7JNSxj7oj8c5/6s7Vax8sgKFZjJlHrMQS1enaClD4f3FDXMnt
         dtwvj9gSO3p2T7lAjAT/31qSboEVvGvkl5P6aGoAa6ES+/bCPlB/77KHVyrC7nccZBDz
         lxTIzCVgqCCNLLpatpcal7M+Z9bgteex6lf55JqgMVK4xPaejgccN+E+wUb99IUY6GeX
         TXPXGvrBcrtIpBwXpxFRXwCy7Fgysrsvl9n7xPyeLMPeaHhRYq/xFOshB5l2pheVevu9
         d9GDq25zA6BNagVZ5BT6/GrphzSqigB0XH4grQrtryxT3UW0JBpAMW1E2LDmy/lQfcb/
         lOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793465730; x=1794070530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3AF4yhejw1zi/AA2enCSIBecmS/SX7iKrYz1efJHMs=;
        b=THJr9P1WIef6eS0QcsVivfdVqQO7tiRtYjQmQGxjmDZ5iUM15jVA+sLYSfPvNE1xJY
         1Z8z+INenAEkXKxSGo5DeXqU3DlWVdzZEUFFkKYHDkxB/7P/9vMRew9NttTXVY8LuCjC
         1iszUIy3eq5pTkpJnSSUIEtDFsL2WI1lVVL7ergzrWmHQ7ZlNkh6PJs2CgaPkficoTuM
         ccAGPSL4GCUWgvsTKFxXAd1ABJkc0Y2cyKa1NO4/Z6waifoCWSZtPHp6YxCbzoQDAYI3
         DV/JEv15vNDKcUMvaKkoYQdkGQiwS3AhU3D9/TRm080FzQ/VePIaKBKZ7cfZZqkFC8Vd
         NxpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4p/vqS9wytVFF/Y/iuzbS58zPfp7IO75472JuzTcnMD0DblatncZ6/DNYcjRq5wgW1lTI/ym4QxjOVBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyIMUmIg4a0/XMblHFXl8B0X8b7WZT0dauWPaXlxmLqnBZ/VAM
	URHMSNHsTtinej2n+0oJurXbZgpMSYrKUDl9pH3RzlMZwcJ1cKwWe/CZlQiMLF8rBS/L6OAavLK
	tRvabdDocLIaZiy48/p09oHpEyzib8Nw=
X-Gm-Gg: AYBFou13cEZS8EI03cOVMWQaYeSl0WJeQOxwzwp9pQN8fYGgIEunad88HIGWrG0c15F
	lrVVH0FbewICMq5oi525hmCeAb3p7dDiGl+ooynqbNj6ivvS0PVn1ziI2scsoy2zIvD4+/gr/8R
	zndvMJcM7mRem8mzcAQphS/J8BLGWF0cD9HPVsLkBvmyTnYS+seNpqsXBi3bNXUdtAC5A0RbUdQ
	6IN3/7mTKPH0Xk40ocmy2wo6Bny6IqWnhXfX29PnBzhlCrlJnD1e4VNl5dcsqq3SXkWeQ5RvJxP
	CdUuAGRse0yn7+po1dO1/c027k9edKpLqFKvl6B8iSzb6PepYzeo0mwTTIwr4D2cgUS7cb5i3lu
	znBfQvlnqETkdm+XtL37ZypLJp1rSYGLcYF/ImMxofnRwpRjaWHE85xDG8vCwG8dA5zv+iERU5N
	EEHmzZ9YrC+xtL1zqSd2dlaqY=
X-Received: by 2002:a17:907:d9f:b0:c40:b477:dfa0 with SMTP id
 a640c23a62f3a-c4ca7a46ab6mr449889766b.18.1793465729824; Sat, 31 Oct 2026
 09:55:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com> <20261030-alpha-profileme-v2-4-c702f1c65272@gmail.com>
In-Reply-To: <20261030-alpha-profileme-v2-4-c702f1c65272@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 31 Oct 2026 17:55:18 +0100
X-Gm-Features: AclHuK9VG7SljAuL-qamMShABUtKfhaQI7d13gpXjDolIqZkv45p0cl55F8_LIQ
Message-ID: <CA+=Fv5QT6MwHYwXzX5ttrH=XWQHZV0xdjoe76YD9BjqjTwAMCQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] alpha/perf: attach ProfileMe status as
 PERF_SAMPLE_RAW data
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Fri, Oct 30, 2026 at 5:04=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> A ProfileMe sample's PC alone does not say what happened to the profiled
> instruction. I_STAT and PCTR_CTL do: whether it trapped and why, was
> mispredicted, stalled, or was killed on a wrong path, and what PCTR1
> counted during the window.
>
> With PERF_SAMPLE_RAW, attach PMPC, I_STAT and PCTR_CTL to each ProfileMe
> sample in a versioned struct alpha_profileme_sample. PMPC is included
> because a PALmode PMPC is not the sample's IP. Killed instructions can be
> told apart by PM_KILLED_BM and VAL. The 64-bit fields are packed after
> the 32-bit version, since the payload follows the 32-bit raw size in the
> sample record: they are then 8-byte aligned in the record, which needs
> no padding.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/perf_event.h      |  2 ++
>  arch/alpha/include/uapi/asm/perf_event.h | 31 ++++++++++++++++++++++++++=
+++++
>  arch/alpha/kernel/perf_event.c           | 22 +++++++++++++++++++---
>  3 files changed, 52 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/include/asm/perf_event.h b/arch/alpha/include/asm=
/perf_event.h
> index 72536566014a..f498c1d47c07 100644
> --- a/arch/alpha/include/asm/perf_event.h
> +++ b/arch/alpha/include/asm/perf_event.h
> @@ -1,6 +1,8 @@
>  #ifndef __ASM_ALPHA_PERF_EVENT_H
>  #define __ASM_ALPHA_PERF_EVENT_H
>
> +#include <uapi/asm/perf_event.h>
> +
>  /*
>   * Software events have no trap frame, so perf_fetch_caller_regs() fills
>   * in a zeroed pt_regs. A zero ps already means kernel mode; only pc is
> diff --git a/arch/alpha/include/uapi/asm/perf_event.h b/arch/alpha/includ=
e/uapi/asm/perf_event.h
> new file mode 100644
> index 000000000000..aa0eff5a917c
> --- /dev/null
> +++ b/arch/alpha/include/uapi/asm/perf_event.h
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
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index c7f0ccf8ec80..c9d4b13817bc 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -944,10 +944,13 @@ static void alpha_perf_event_profileme(struct perf_=
event *event,
>                                        struct hw_perf_event *hwc,
>                                        struct pt_regs *regs)
>  {
> +       struct alpha_profileme_sample pm;
> +       struct perf_raw_record raw;
>         struct perf_sample_data data;
>         struct pt_regs *pm_regs;
> -       unsigned long i_stat, pmpc, ovr, pc, saved_pc, saved_ps;
> +       unsigned long pctr_ctl, i_stat, pmpc, ovr, pc, saved_pc, saved_ps=
;
>
> +       pctr_ctl =3D wrperfmon(PERFMON_CMD_READ, 0);
>         i_stat =3D wrperfmon(PERFMON_CMD_I_STAT, 0);
>         pmpc =3D wrperfmon(PERFMON_CMD_PMPC, 0);
>
> @@ -982,8 +985,8 @@ static void alpha_perf_event_profileme(struct perf_ev=
ent *event,
>          * happens for ITB miss, Istream access violation and interrupt
>          * redirects, and for instructions inside PALcode. Keep the
>          * interrupted PC, which for redirects is the instruction that
> -        * trapped. Do the same for a user PMPC in a kernel thread, which=
 has
> -        * no user frame.
> +        * trapped, and report the real PMPC in the raw data. Do the same
> +        * for a user PMPC in a kernel thread, which has no user frame.
>          */
>         pm_regs =3D regs;
>         pc =3D pmpc & EV67_PMPC_PC_MASK;
> @@ -1001,6 +1004,19 @@ static void alpha_perf_event_profileme(struct perf=
_event *event,
>
>         perf_sample_data_init(&data, 0, hwc->last_period);
>
> +       pm.version =3D ALPHA_PROFILEME_SAMPLE_VERSION;
> +       pm.pmpc =3D pmpc;
> +       pm.i_stat =3D i_stat;
> +       /* PALcode sign-extends bit 47 of PCTR_CTL. */
> +       pm.pctr_ctl =3D pctr_ctl & GENMASK(47, 0);
> +       raw =3D (struct perf_raw_record) {
> +               .frag =3D {
> +                       .size =3D sizeof(pm),
> +                       .data =3D &pm,
> +               },
> +       };
> +       perf_sample_save_raw_data(&data, event, &raw);
> +
>         if (!alpha_perf_event_set_period(event, hwc, 0))
>                 return;
>
>
> --
> 2.55.0
>

I checked the raw samples from all four ProfileMe modes on my ES40.
The selectors matched the configured events, and I saw the VAL, TAK,
killed and stalled bits set in the recordings.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
