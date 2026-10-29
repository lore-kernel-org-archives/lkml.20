Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793295525;
	b=ISKHkB/HpxyG41mZNCW3Z98p5LlE1d/IUAb8cGeiMCdejxAzZutRgIeRoOWv6fL7IxBd
	 SJ7dYt23mehWHWISTBeqZ0THvz4lL0NcpJicwR6Pklsm/+tOZ1zZdqXvhcGx+h3I1GpYm
	 r4dnU2aDZZWUPiBpsHWuTLLrw0LFSvLulJmDB+u+CHA4mDo7RO5R/iDz2fotpgzNptJHA
	 /jStOjBKc7Q3zHFKqIdOjSFwZpqR1qicggcKF4ZFLYbPMcoClcqmDz98dPW967LHmeZyS
	 MOzBhdo6PvIJaT73LmE8nkJbwuhaJKyiOyeFmQB8GTw13i1BCifMEO8Wz2P79ONt1/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Jnb2ggFy/68cuPuLhBQIr9m8EgIXZTngDYovAtQO7jc=;
	b=sVxlO30eC9Vy95/rHjGQ7N67sPEcMhwLQVAIfOW0ILV6kYhRlsGGFGFA5b9NqnjdwYVF
	 Hj7r3g9C6re5YmoZzReTQxgXzfqnhQQmU8MDt9nTefui82AKLZ1VRvkSSXSW3HQFBBqan
	 +OJEwqeQwRCzWp9eD4c4DcDlgpsc34tNQT/6qFltRgU+WsPTeqhL3Tnz48+8LbgsbZBsB
	 hostE53tgAq1r62DAx75P4baRh/CUZtabfN5hgZ/K0FcYizx/kajwuJaSwWT2mat+fuWC
	 pdEW74lGNXLnuD14RhfGRp3gtDcOqk+aHMlemTONZtzbjHm2ZfYV0y5riyP3NqZM8jQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WdOK/Nmn";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D889A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D889A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WdOK/Nmn
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1690151a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793295523; cv=none;
        d=google.com; s=arc-20260327;
        b=LFsRazHwg4M6x1w6BK47dXsdUgngZcPL5AmobCaq0Q1+g9xxJ+rfyxq0zBlR7i4Kk0
         3s4ZZVwnRut1/ovwfCJ3ZnYJKkblGG48AUfB/uCtabEhXvonghCVt5HYQ1Xl/ocO0Nrn
         JYaAP6f9e1lWxqMVstBcZ6Tm8l7iQZTPU6Y+gQSpt1XKSg7HqeaBRfbu8gAu/fsJvQSv
         AGpnar6Lh5ZJGmjTyTiZzMDPMuFR2MRdyD7UqTHmv2pU/buGXiG807HePjdl4Dud2ZO4
         njrEj6PFQU3mCl1wWcFDPjHeukogq57txgTP5GTV/hAOaMYO263GASCuRBAB0zVPDBpo
         +VJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jnb2ggFy/68cuPuLhBQIr9m8EgIXZTngDYovAtQO7jc=;
        fh=AtwC/qKzyBty4i0w2jVQ8ddcHjy/beqvN6tT4y/f1N4=;
        b=Wy3sz2swf3K/XZdB5QjkZhoGTWY4kjvUitiyn8lD9cpWNiRWI6E4tOF1vAeb5qNlOu
         /ymL4ffAXGKIbbKzAE0atrM8kM8aWgeH2KVa2/3nt26ixl4KPcLMqffGT4Jpjf4/hSls
         UWxiopzfGDRSgY4mEZjX+3js4mfHW6cELkDCHSrwpUDh3Cd8tG1zIJ3rhMeq+u2qytU5
         ZkPDvDOmKgNH6bjOIE3lHE9Xeze39gtjXbbQPZ2FOuMFTJAWhoZQ9RC8FCK/wkp8HHC7
         keI6j9+I9CQaJr0LcI2Y9WxqBPfom2RAUoFFu03U9B6n/Gbkf2dJk0s/kxUcjr7pEuvQ
         k/Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793295523; x=1793900323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jnb2ggFy/68cuPuLhBQIr9m8EgIXZTngDYovAtQO7jc=;
        b=WdOK/NmnJj+0TX8YV8z1q/DKcXpxJQbfndklH5sBCCZuKZZkbRxchJkx3BGXfHQwEb
         DfNN7ahPHVpaGDCk+IdV+0yyCfm+HfbrkHuzDB0Fw3+jfFh0qKBRiEWWf75WrAAtkqeP
         f5KFxYFeqd1WGB/MQ46ddbDg6FGFHpWB91irCwQfFiim+dOMQTG4BKBI+xYsKwBDKOW1
         3NNofkg4yKoEiCQ33IC+d8JpnAi5vs1v7Foca1Liog7Lc7f2B/vRKWsJoh3Ttz5U7Qe4
         EHkh768OqJwGj3M0KwrRp/7JalebOMV6sdVb8MkYmw/2YYj3dCAh0EbaOW0rsCcXenS4
         TOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295523; x=1793900323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jnb2ggFy/68cuPuLhBQIr9m8EgIXZTngDYovAtQO7jc=;
        b=XS2RK5XA3R19M49BHKrcWdifaqnCcEMZOnkG/5QtsFZODNW0cjqBmFPE5mITfrWihO
         xnxXs+FdvwTqptKphVFwuw7UFkS8Ne28MA3XmajsLZtfOYwIO5bIQ8No5qXIXMroQr63
         v0UfkDe25o8UrafILMXKXQWMQWge4HspOR70doTZ3KofTpRIBqI3k4OGGiiLV9h+yopl
         Ep1QY6pW+gJDLG0SBenPqQfx30midNEaE9SL9Jz1wCVRy7QLaeArLNUgIXbtMzMNlvV5
         RvDK9j+I/z8TwMF2eDAt3tafwkHrlS3gElDPI0Lg4yhFQV/e0TVzlL5rWDWDUhtZpdIT
         0Gxw==
X-Forwarded-Encrypted: i=1; AKwUvBxT2RuGBtjCLRX9bztgyCbsoh9kYTk9Vj5ETGBtzb75PyzEM1ehSXa6mbksg6iGAMYTR2kD7rGLHytjtQk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4svXCJDxOeKOs45f0ky8JG5A+hSQBX65KWf7Lo6+9hpiGUI6z
	foinnwjcAsli5rBHVaGE97LatGRUuHewBJ+FobEtYdAaP/JVf+xxJ/g89sAL8qu4oEv3gxSxEpB
	+5vEAkA0AQyE97MWXFSqhYWRr4XFJaVI=
X-Gm-Gg: AYBFou284GT/CII5ggcq3tRNodFRkQ4OO27+2sQiEkJnajzaTxp20OjB5JoewbIOIhs
	VHdvkrZyuuUrvmLPJD86IzJybGUVdbDJy816WkSa+62QxiV+ZNqMO08b1tKu6P7A1iEpcwNBiH1
	S8MxMdichD/YdpZQny8kJaGveDqwrdgNWYV88A4B0u6m9MMYn0/1/BYDjPENUO8cFuwyHPbr0kR
	NFbcGvHk8ral43QZDHE3Mm1W8AbTGmQ1+m0nXcY2+GnCaoW8q9RnhuU6ccvEO9PPKoCD3Z9Y8nC
	+f7Sk8sYQCTaLS//5/H56BkiHa24E2DcCORTPRl8Uhan4dlBGwtCCvIWAo9WDAm0anJwUDi5yyk
	nuIQte/Sxxp2fntA/EAfjIeyC+XGUO/j5eCluhyOD/8dqRfuUlWo33csLIkH0pZnE6m+Z
X-Received: by 2002:a17:907:3e19:b0:c48:a838:c17e with SMTP id
 a640c23a62f3a-c49d1307e11mr311139066b.14.1793295522951; Thu, 29 Oct 2026
 10:38:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com> <20261028-alpha-profileme-v1-1-d44b52bf2500@gmail.com>
In-Reply-To: <20261028-alpha-profileme-v1-1-d44b52bf2500@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 29 Oct 2026 18:38:31 +0100
X-Gm-Features: AclHuK-SY1_Xa-c9wgWP3q7LRAU1TLOJcpcznXRsfIIxmsCY3IoLxSzQH8m4NoQ
Message-ID: <CA+=Fv5TsDjMcd8+ZPPAXWzw-ox5yhvYJqiCBUfj-6Jm0Lxf9aA@mail.gmail.com>
Subject: Re: [PATCH 1/5] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
 logging options call
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

On Wed, Oct 28, 2026 at 7:09=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> alpha_pmu_enable() passes EV67_PCTR_MODE_AGGREGATE to
> PERFMON_CMD_LOGGING_OPTIONS. That constant is the counting mode bit for
> PCTR_CTL, which belongs in the PERFMON_CMD_DESIRED_EVENTS argument. The
> logging options call takes a flag in bit 0 where 0 means "count all
> processes". It works only because EV67_PCTR_MODE_AGGREGATE happens to be
> 0.
>
> Add a name for that argument and pass it instead. No functional change.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/wrperfmon.h | 2 ++
>  arch/alpha/kernel/perf_event.c     | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/=
wrperfmon.h
> index c97b82a1f7db..1fa9bc813263 100644
> --- a/arch/alpha/include/asm/wrperfmon.h
> +++ b/arch/alpha/include/asm/wrperfmon.h
> @@ -23,6 +23,8 @@
>  #define PERFMON_CMD_I_STAT 8
>  #define PERFMON_CMD_PMPC 9
>
> +/* PERFMON_CMD_LOGGING_OPTIONS arguments */
> +#define PERFMON_CMD_LOGGING_ALL 0

The Alpha Architecture Reference Manual, Table E-18 (page E-24),
describes bit 0 as:

  "set =3D log all processes"
  "clear =3D log only selected processes"

That appears opposite to the changelog's description of zero as
"count all processes". Is the manual incorrect for the PALcode
implementation we use?

This preserves the existing value, so there is no functional change,
but a short explanation would help reconcile the name and changelog
with the manual.


>
>  /* EV5/EV56/PCA56 Counters */
>  #define EV5_PCTR_0 (1UL<<0)
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index a3eaab094ece..2d9383425357 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -728,7 +728,7 @@ static void alpha_pmu_enable(struct pmu *pmu)
>                 maybe_change_configuration(cpuc);
>
>                 /* Start counting the desired events. */
> -               wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, EV67_PCTR_MODE_AGG=
REGATE);
> +               wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, PERFMON_CMD_LOGGIN=
G_ALL);
>                 wrperfmon(PERFMON_CMD_DESIRED_EVENTS, cpuc->config);
>                 wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
>         }
>
> --
> 2.55.0
>


WIll test this all later on my ES40

Magnus
