Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341817;
	b=jrWLLDJsyQNYgY0JePx5W56LCCFmhNbbDAy0PoXyWugVw9EIZFmiVIw2sidWwQgNo0rd
	 x+lyqBmc1luAXvt53D3cglX1lr32MZT9VV2Qne2MGpdN+jrqwSEW/VEdsql1lLf8X8Zsh
	 vgQQqcLaq9Nb0R+c31McayKzN38OPvbtL3Eqsv00ykRQFUVc42B2h+1cC7CCJdffFzuFt
	 LY9LqhRiGwXIrpIzwbTfiqMY4fkHNY5HMw8n1qSOxBEQel2PG23QLr/dDGR7wTgmgC/S0
	 /h4GHTyNL2k4QmxCByUgVfpjVFdGcQ81NLsHWs5cexwKjCzbBmAHh4QNM+Q4hae00tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341817;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pYtPkUI7Dh1RNH2VeAVgBJNKX/twRK/Upm9OW0R/ajA=;
	b=TokCI/Y+EIXN1AIkB/OGGXycXfhDzzAqaG73d8aWisdNkgrDr45hpX/LRb4FDAq5+MLI
	 v2Z6WP8wQ3oGNOgmiviuDzOjkdK5kwmD3W72sxJOrRhkxbUVQmY004Nk2Hes4Analm9ay
	 9YeHeqGMEsv539NZEWxEG5Pa3knlMR+B6pl70iHgtb1opZ4CSzj4+3WZCCVIysWBudY4O
	 0ZW1B4RypfSPZBpyWMR2kDT7bV4VaPL25oMANacus8YNZdpAgTd0PRFlCjINSDTGmAeO9
	 q04OlAhzs35wOBg2em8RAxUHCv0ROyW902ofUqd0c143TcXKFx7q3p/xSDGglLU4PDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JPyEeTdp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31D7606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JPyEeTdp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3C61F008A1
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794341817;
	bh=pYtPkUI7Dh1RNH2VeAVgBJNKX/twRK/Upm9OW0R/ajA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JPyEeTdp5bt9iCZOQpam9VLMdEB5QqWAZ1YX9qFW1gsRHd3woufZ20K9R2MMKsx8+
	 6T8Jg2A4VPFgpbKZzPEPnLl0BA9QI+F9aKVAfj3s0lxm+SojJD68ILjVolTFi/4xDu
	 7zTxXY3E7Bpi9u4pSqi9R2mBqczOzC5XTsYNI5yiZhMIlmCB9qxsY9YgQDS7Gzzh+B
	 c5+XKCjbOpurvf21WxizpL1yHvXjhWzISS4vB1HAqYGRMEN2S7nw61mbUHX4fcNLpl
	 6/xBxICEk0LZrNDRwyrnuqyC9bj8acZ6uAi+320NKngjOB+lBHXjxSGUBPDe4LSOW1
	 Y1oygoOxxkmYQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so21443981fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:16:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG0XgewcEWKrhUE4ReRrCxGbHRUNafp4/LSwEQcB8fAEQH4r0XW6wnBKc909XeB2QCo7k7LiUBC/+ZuVRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lKzZS8maO1BytMKrGZgH4Gp8RoUekmzq2J+qK3tH71miuDUdO
	JdC3FtZGC2jvj91de3eqcv1oatA+RQjYs3FZT/AcqPOIQ8C5lPGS+KbIBqAPmmLZdv/ksC4r+xm
	mL7JgovykgN2MuZSYZ6Ya/c4BAKpKdqo=
X-Received: by 2002:a05:6512:b88:b0:5bf:b93e:89f0 with SMTP id
 2adb3069b0e04-5c15d6539bcmr57933e87.62.1794341816005; Tue, 10 Nov 2026
 12:16:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030083633.1699270-1-christian.loehle@arm.com> <20261030083633.1699270-2-christian.loehle@arm.com>
In-Reply-To: <20261030083633.1699270-2-christian.loehle@arm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 21:16:43 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g7gZH=Eod5xXcP0adN1r=-eLqpKA-CpS+hYXjgndZFHg@mail.gmail.com>
X-Gm-Features: AclHuK-c2tERy5hYqLMoSBtQDXi7bKgCvm_08vbDsnBplRnFCjtcI8dpHRK7M14
Message-ID: <CAJZ5v0g7gZH=Eod5xXcP0adN1r=-eLqpKA-CpS+hYXjgndZFHg@mail.gmail.com>
Subject: Re: [PATCH 1/2] cpuidle: Skip miss accounting for timer broadcast fallbacks
To: Christian Loehle <christian.loehle@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 9:36=E2=80=AFAM Christian Loehle
<christian.loehle@arm.com> wrote:
>
> A failed tick_broadcast_enter() can force a shallower state than the
> governor selected. Exclude successful broadcast fallbacks from above/belo=
w
> miss accounting while retaining their usage, residency and governor
> feedback.

Is this a theoretical problem, or can it be observed in practice?

In either case, it would be good to add some information on that here.

> Fixes: 04dab58a39d4 ("cpuidle: Add 'above' and 'below' idle state metrics=
")
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> ---
>  drivers/cpuidle/cpuidle.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
> index 2d2f40a2cb81..faa29f58738e 100644
> --- a/drivers/cpuidle/cpuidle.c
> +++ b/drivers/cpuidle/cpuidle.c
> @@ -222,6 +222,7 @@ noinstr int cpuidle_enter_state(struct cpuidle_device=
 *dev,
>
>         struct cpuidle_state *target_state =3D &drv->states[index];
>         bool broadcast =3D !!(target_state->flags & CPUIDLE_FLAG_TIMER_ST=
OP);
> +       bool broadcast_failed =3D false;
>         ktime_t time_start, time_end;
>
>         instrumentation_begin();
> @@ -232,6 +233,7 @@ noinstr int cpuidle_enter_state(struct cpuidle_device=
 *dev,
>          * CPU as a broadcast timer, this call may fail if it is not avai=
lable.
>          */
>         if (broadcast && tick_broadcast_enter()) {
> +               broadcast_failed =3D true;
>                 index =3D find_deepest_state(drv, dev, target_state->exit=
_latency_ns,
>                                            CPUIDLE_FLAG_TIMER_STOP, false=
);
>
> @@ -306,6 +308,13 @@ noinstr int cpuidle_enter_state(struct cpuidle_devic=
e *dev,
>                 dev->states_usage[entered_state].time_ns +=3D diff;
>                 dev->states_usage[entered_state].usage++;
>
> +               /*
> +                * The broadcast constraint forced a shallower state, do =
not
> +                * account for it as a cpu_idle_miss.
> +                */
> +               if (broadcast_failed)
> +                       goto out;
> +
>                 if (diff < drv->states[entered_state].target_residency_ns=
) {
>                         for (i =3D entered_state - 1; i >=3D 0; i--) {
>                                 if (dev->states_usage[i].disable)
> @@ -338,6 +347,7 @@ noinstr int cpuidle_enter_state(struct cpuidle_device=
 *dev,
>                 dev->states_usage[index].rejected++;
>         }
>
> +out:
>         instrumentation_end();
>
>         return entered_state;
> --
> 2.34.1
>
