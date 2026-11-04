Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793830294;
	b=uuVF3mA4E88FdVXAqDfLXcTxVe0Dih0FP17XmR+jO+o4nHxb5oOtzJslX6sn3NLdufV4
	 8I0fqEbW3rF1LwwJiBkd9gUvZFhfdCDoY2wpILOl8XW5Cc5oHT9u71jaMz52+3vktCMvw
	 2lL4u0rwq8C3+4jCbBxIlZXO8HSvNySZX0f3HdDASPduJ/a+tcbo8IOVkFjnrtlsEPU5E
	 6hXMd3dN9q2PDZmy3UZ7M5uBY/URLiEUFM0Da4To8dPrzxyfOsHWqQDuvBeYTRnAOghwV
	 O6cveL+RLj5IgxcqVetNNJMv5qTTDYEAs9mKdv/OtJ9vKHWPWWj74alFPWyKPtlipdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EGlBiCE9y1aipHpdTJ2cp7Guo9/hRSALY5Dt5GVDzPI=;
	b=xfO5SgwwPSZLLZRmMIEljwMVzV7VR+3TDzSCHE8R+qUzaZXpbIGdzN2vYnciiNZH3l7V
	 560aggUELzwLm7SaY99MY2U74qPPp09e4CrhuM1QEDVPqOcoi6kda2gouk619XFiqTsH4
	 fhrYq3RObVakBV+2PcwAZTazyT9W3Ua+55UF9tFRMfrBxjy1ApdL5JSCzmX2iYHKgjsHw
	 oCm9IA27aDACYqhXz3UvY+ObbVxKBan8SnxIUkbW3/8N+1R/VINlTHbanIWAwfHGyc4xS
	 RzYhEqZBwGHigGjjNpjucxGYIwwih9aEdkmJ/hq3cSoh1mYlFjU+CfA42rASXOknttQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBBDdSja;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFA8606A33D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AFA8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBBDdSja
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so1921878a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:11:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793830292; cv=none;
        d=google.com; s=arc-20260327;
        b=eu02tz1UrC5ruPhSOJ9kNXy8WHC6VcTLrth3dx6P0gRqzArBf+qR9p4vmLK1/Vbj0N
         XIQBrNJvM9dJniNnrq+N70BC7i2Fu4//BaAiWi9FvX91REefLWnURrN+GaLLBeKCcryM
         69SPVB2BVBDXF6HTBa6+cb6qhtB4mSJ2ZFBJMCwcq1IlEOl9fViyfX3EmDkjl9XJPVLE
         /XjynThl8Ja6fT+bMGNxUZntcWD3MVUnql+pfzNqA5mM5NWoOKqFAPWHJgkxtW4bZNKp
         TN5ga0LZHixkzSyYHBFDhm+NnOw668vTBVLYwEFE2SE+8qgvhPuFCBqiw4CRjh0NGQwb
         AYYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EGlBiCE9y1aipHpdTJ2cp7Guo9/hRSALY5Dt5GVDzPI=;
        fh=aykuR80Tyxx1Bh6Wgjnh/bNu7IR7XE7MZqQX0SrlHOs=;
        b=JhWfNlv0zA24OBLc0AyyFsUpjGOl6U3fHOCUK5v4FKGVuZY1erG9rQVdM+ckU4FqOt
         ZevKHZyLmnPuu3H/g4Mj/XPr+1NZLp+/B+V7RoY+SLj8KKanIpUjga+zTAceoTTDs5Lh
         YP12dkwp1Avg50WQKvRt/ZWI0YPOT7atuTUkECkQByp1DOb1gdBAPnq3xklALSjAbNgP
         hJ5cmvPQprd0oAX1/+5cQyZbrbdN3VAwohT48IXdhmO9zT4VMaAE+16sXb7BGR5Rp+6G
         V0aCsPPz5uZopRvYjXGVCmtoGj4Os/JcXBBG+j4molTN1NwR3wujZOjgUzQcx0RH05og
         F5RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793830292; x=1794435092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EGlBiCE9y1aipHpdTJ2cp7Guo9/hRSALY5Dt5GVDzPI=;
        b=uBBDdSja+STCfVqALRK7rclaXxEKAivtHrRY6liSZxvT4tW2UPkEnpTCB9YUAZHAyy
         yh6jK4sh5jG18piBsbOxg5fyHPXBvpFlczChcjTBd0m0dPn+vMeBIZYJ/4Jwu8mpGUma
         0diqU+KkvF94+LJBH3k6F1qIGczNqSkkBaf2J7n0CTFAI/8+wqAej4CW551XZ1jy/bld
         yPe61/ZgQ0SDAyFpkNttxP+6vKUZpWiA6TS8hAT+Htr+YN5aTMyHCBUls4X4DkPrK83o
         9yX4C1JDEGBC7KsU6hWj2S7hH+rMIgFPDotvoxkUffRts2/kCj4769B57sgubzV7iSd5
         M3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830292; x=1794435092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EGlBiCE9y1aipHpdTJ2cp7Guo9/hRSALY5Dt5GVDzPI=;
        b=SA5+scT32c3HUnDigw/QWoGLPoZzcibdxRgVX0fpON602QaSXPX6gh3/qGp1oputZZ
         mwJmrmfq1nwbnHy7nuvUvOSyK5nZccBIq5g+lAT5L/Nqw3sFJFlxVh4er1n3Ep1B0gst
         oIaKDnjbW3T6DjrBKHte8XfxEFWVa0T1T2cX4sUlVkL2sAxfPH9P4YwKU3eSuq36c9Ir
         dAnbkGeSd5enWQxmUJJotnrZ5qUviwZcrP7+Hee8uffup4NRxO3rd1kWWyBDQPylshpF
         I62qxFL1EVC1WrOcaqAyO+fR+P1+gKgTRLsyV8SeGHx1IvrAPsOyVYd3F7BmcmNLfjFe
         pFPw==
X-Forwarded-Encrypted: i=1; AKwUvBxyP17XPb3OJmaBIB+y5sZpuvZ/rYNMDJhXlUjoLsb/qyfFnUKlfXgnW+OmwIqitTdw392A2qEvnN1VLNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9euOM9Xy7XR/EaUe7TIA79P5M1ZuLs3rZg6T/EyZG4dx2cMigp
	CwTfYh7h534DDkbkgV3wlwvyQv6QSiWqEAp4FY5MLw0vvCzGhfUHtxy+BID1SrrV1tVEIRNO4Bg
	y4ZwJQ92aVi7f2ExuZT+EYVVA/66iCbo=
X-Gm-Gg: AYBFou2TZ18tbrig874FElmUgcvkNl6l9nsNNuPr0KdEorqYRDYubpSEIzR3lNdSumF
	S16KU1XEzYsn7EZpqrieOpW5h9nL4rs0eW+zYTV/a/7ZVDohdsAfr65kJ9SFPd1zR2DThM8V/Sp
	+zu/6PT9gg25UVqHTFk02Cxhn/yKiINnVicJtz+vGr7C3OofA+d4Q8N/8CPkpn0Qw6Xa79Ky7pN
	zVq7nmlKx8KcG4ydBTjAQdfvzF1jq0xzBG8jkolxl2k1Pjpo1yrHsDSEd7/dBm202SCFe9duOKP
	nr6dAGhQ+S1kzchAa9unfv8SGrOyaI80NMxYIuGy/QIhU1MkoUQp+UvKiGfZ8VWDNh7xaOnaq2S
	0WCgE274eLiuTBJrAWTKSN14Oh3s2HIe7Y/2VJ5CCfQN8/b5jGVc1ka2ilo5+XYT7NoMsZ3yhlh
	nC/IwkBoaThJ9g8fh0IHZy4uY=
X-Received: by 2002:a05:6402:27d3:b0:6b3:fc71:fc29 with SMTP id
 4fb4d7f45d1cf-6b4d33aafabmr14094964a12.6.1793830291784; Wed, 04 Nov 2026
 14:11:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com> <20261104-alpha-profileme-v6-9-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-9-63362e9290a3@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 4 Nov 2026 23:11:19 +0100
X-Gm-Features: AclHuK9rURAADFMaHKSa3C6tUNWpCMLgBwWXXb11rOWiWxNNie3COpwPoW2A6qs
Message-ID: <CA+=Fv5Sp7wkgZ0PXS2RNfVPZ3z8PkFe7zesGgVOUM6oQP9Q1FQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] alpha/perf: report the ProfileMe window count as
 the sample weight
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

On Wed, Nov 4, 2026 at 7:49=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> What PCTR1 counted during the ProfileMe window, the inum retire delay for
> cycles:p or the window length for instructions:p, is only available in
> the PERF_SAMPLE_RAW data.
>
> Report it in var1_dw of the sample weight, which the weight and
> local_weight sort keys read. It is 20 bits, so it fits. As Alpha is
> little-endian, this is also the right value for plain PERF_SAMPLE_WEIGHT,
> which is what perf record -W asks for. Samples that fall back to the
> interrupted PC get no weight, as it belongs to a different instruction.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index b33677cc23ca..c9ab40ff76ad 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -1068,7 +1068,7 @@ static void alpha_perf_event_profileme(struct perf_=
event *event,
>         struct perf_raw_record raw;
>         struct perf_sample_data data;
>         struct pt_regs *pm_regs;
> -       bool pc_only =3D false;
> +       bool pc_only =3D false, exact =3D true;
>         unsigned long pctr_ctl, i_stat, pmpc, ovr, pc, saved_pc, saved_ps=
;
>
>         pctr_ctl =3D wrperfmon(PERFMON_CMD_READ, 0);
> @@ -1115,6 +1115,7 @@ static void alpha_perf_event_profileme(struct perf_=
event *event,
>         pc =3D pmpc & EV67_PMPC_PC_MASK;
>         if (pmpc & EV67_PMPC_PAL) {
>                 pc =3D regs->pc;
> +               exact =3D false;
>         } else if (pc < TASK_SIZE && !user_mode(regs)) {
>                 if (is_user_task(current)) {
>                         pc_only =3D true;
> @@ -1124,6 +1125,7 @@ static void alpha_perf_event_profileme(struct perf_=
event *event,
>                         pm_regs->ps =3D 8;
>                 } else {
>                         pc =3D regs->pc;
> +                       exact =3D false;
>                 }
>         } else if (pc >=3D TASK_SIZE && user_mode(regs)) {
>                 pm_regs =3D this_cpu_ptr(&alpha_profileme_regs);
> @@ -1157,6 +1159,15 @@ static void alpha_perf_event_profileme(struct perf=
_event *event,
>         };
>         perf_sample_save_raw_data(&data, event, &raw);
>
> +       /* The count belongs to the profiled instruction, not the interru=
pted PC. */
> +       if (exact && (event->attr.sample_type & PERF_SAMPLE_WEIGHT_TYPE))=
 {
> +               /* perf_sample_data_init() does not clear it. */
> +               data.weight.full =3D 0;
> +               data.weight.var1_dw =3D (pctr_ctl >> EV67_PCTR_1_COUNT_SH=
IFT) &
> +                                     EV67_PCTR_1_COUNT_MASK;
> +               data.sample_flags |=3D PERF_SAMPLE_WEIGHT_TYPE;
> +       }
> +
>         if (!alpha_perf_event_set_period(event, hwc, 0))
>                 return;
>
>
> --
> 2.55.0
>

On my ES40 I compared the sample weight with PCTR1 in the raw record
for all four counting modes. They matched for samples attributed to
PMPC, and samples that fell back to the interrupted PC had weight zero.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
