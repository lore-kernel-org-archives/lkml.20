Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792609275;
	b=nhwFnhb0GLETBaSeIDX4q5gtArGCr/Yb4HwXeIZ0RwYDis/t7PGyKhCpoxJj1GCatm/b
	 6FKxG5yq0xTaMdk238m7Lmm9kT6Na6zGe/thLLyjho0iEXwrheTjnMe8IAPChibH/2QHl
	 +DFgrmq+i1hWl2fj4dkc0aR8+RaYUC6vuTP9eu23X1MUYM91+9uriAMuLZvqbc6ncpEXw
	 QZdwbjKpU4KeA2xCLphm3TwsmPdYAF7gr/+dqCPJRuNuFFpupBK6nRZSx796EYNibHKT4
	 8S3K5t8IFxuh/HuxvOHCLZMTAGtILa17wPawL2IFxUNSh6gT/zbVda21ZuhPxFmHX0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9nl2HPUAB4GZROseu8b1E9yRA3CL1woLhHlCGGN68xE=;
	b=wdnQ3kITMRUeXdhAQ/oVKknisTWSVVVzBkcrzgW1QFeyLqZhgPogdm+D6w5Sm4oFovbG
	 IHHD1N+ZaVyq6emVb+Zgut2wl82ronyPRZWjamdeNxUMDUljNMMjU6E7nnkXmG7RH2Mz3
	 Je2usEeV43jGrd44N8DswqpbczraGTTEMptt031uKkVAs9xvhf1DVromy5SCnB7z/S/Ii
	 bPVqs2xBPteBB1pkBdUm2eUKnyXVDtrzBBEYU8jO14lAwGS3WcB5i1Y9P62Rx0RvtlTcx
	 RKdp0OD/1tGN/okGD/EHcL/RPY9VdGD/QqzYS0UYkwRwTPRK1zY4rxvsGDU4dS09rHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RQqtNIOq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E4C606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E4C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RQqtNIOq
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b0584ad71so770809f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792609273; cv=none;
        d=google.com; s=arc-20260327;
        b=E0cd7+23py8qioYcbiYxN6pk4/37SD9MTga/LEjHdvN/MujzJgkXqLPdKMpVmvpBJa
         wS+gV9mZ9mh2+CkkSG4b0NVzbohqvhr70tiOGbc5VgDLP0jDZxL+LHnYXm7SvZSI5TAB
         TwVyQgNtn48XYqvkJKgmcBEss/aGjU0G5P1BBceoIOJMd7JYu9ZlzP2N4+Gqm5gPA7VE
         ZWdAUa7DV5n6CTj/q25kOv2/uHpbGA2qScLfmv+8Y/rCM+VjDC+HJH3RUVvdsysAnHsi
         XDwMrEgT6AHwK0ehCYEdPYmoHn2o+02iSG+s+dFphZtqAENp7KkiyDYm0q1/L60yoqA5
         jqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9nl2HPUAB4GZROseu8b1E9yRA3CL1woLhHlCGGN68xE=;
        fh=5tHeo+qyuBymy2865jxijpMP5bAb/MWmCCxXCMwZVF8=;
        b=mV3P/InGgxFsfKck57ifOR0NnQOYzRdsFlD+rfmZ0BAsBaoRNYr0zpuC7aqpFgtk3P
         wpkN/kKTsmDCMw1a73lHBw23w4khFQI+bOF+dZmelh9EgyxaKZ4nuaqRQ52yYX4ZC1E7
         RVKq+/SuYBKU9UfWI2jwYLNj6JVXU5z1+iBJuGsk/HFk23yEa6R4u2RCbIt7/ZSYYc9E
         4ZXiio+/fLiajdtIFZEI6Aj8S6168MX6ail3OXCMB2iofk7PJtj2NVlbDihVi3r+cH/J
         pW/dIPtDaxTDjQuVCr10ISjcpYIGekQN8GraSqJxYM0Ub+0+N6xggkjjszTiJeiJGWY9
         atZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792609273; x=1793214073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9nl2HPUAB4GZROseu8b1E9yRA3CL1woLhHlCGGN68xE=;
        b=RQqtNIOqA//GnOjCWETa9euI+WWIqU441Mpi0i3x0QD5jjGdRQeLaq7+0RHIm+2k7p
         QtBCuwo8U85OrnfAFiQdSXUVsCAut+AR/QV98LVB2MVIlbMP3zZ43c/pEjXb2o/bRRUK
         JNDit0csLZtdn18/pie4Zg/Xhtw+eqkeqGDAm8Zp/1ZICDjUUs+44xKk7NHNUz5DeRza
         OsYZ57EwSrJ5KfzbgjZfuu2Ky3P89kKB9XvLyiQRHAAH07zCS66bdHG/zFCMABgzLeyc
         i9ba1DT39K49JCTiZIjQNRBYJk6UGWeJ/YAKFr68COcBJJnyTJPYh3JLdQMdebFsrPYc
         QSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609273; x=1793214073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nl2HPUAB4GZROseu8b1E9yRA3CL1woLhHlCGGN68xE=;
        b=xuOT7r1IsEWnYHhTAhAnTFlAJRYJxEVyQP6U41RYcbouDSHrPffFdRGb4hMUBzwCc6
         a4/mibAyortLBBaxsRCkN57/2g45UZpq+KdsfgAfbM6YcRVvugwoXGKW8fwpHC48eDww
         M+6fDMu1kZXN2sbS2MQMhK0ZVbSrqaWBiYJ6f7XUrcESwvWkRcyymdO05GrW8mhOup/P
         s6Hr6skjwuhHAJhCm3sa/VxiIt8pJPdFfunGnChXngXRGiM1taJDPcbpgoDXtrCAoRW/
         lStEGLdvSNxLx29cJY2RyS0RLGNssU7Unoq+3YBS5dkDsTgwKDUTJZVXgHftC26Tdlp/
         cjJw==
X-Forwarded-Encrypted: i=1; AKwUvBxH2QSLyv5p/Yebv4gzG3+0igSkxZ5aaX4kda0m5h8XJ9QqM92s/GvTK590ptss62PDKzO3Lip28HNPTGw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDhnSTN0GkmCX+05wi+TduBMM1kId/2QmnCYHuipf5kmtYJJJo
	p2yFy4rebA01yDQBFQ14xf2iKf/Xkmn+fg0lv3SMr76GpssKDMEWwYT+2g+YeMi8l+E8q2dxmth
	hiI++HdUxC3lw+Ok3jeNofrK9Z2qL3u2OG9+eIEw=
X-Gm-Gg: AYBFou2pAmOc2FRaICsfYDhn925c/NkhFh2joZbL3j9GdfqCl4fXo3ljIJzJM6emQkV
	3uNnjpyh9wK+9jyP/N2+TlRVaHAamab/3QR0lCHVMPu2pUrP1zFJSeGmqa5CV6RrrJ7Uzeqgx6N
	HtRBgB5rXKO6lK6uxoG011WYqgIgZFc91f5P0wF2oJE8MThtb7giPFnrPahzrvxhf7rmcsqagEn
	xUOfu8OTsI0eeRBAVY5izMlI1RIEXqhteuOWWKsZYmFXjBS7Fsp7rSZA+SzxTWAdDgHBzPMSrKD
	3C/wgy5gbdUxpGEKIPTJO8XF612AmPGBLRzM71H77E3qOdbQ6Av2+bvU+OcrO6ScRfg6C4A3R0C
	5feveYdbX3l0Jy99Ut+RwTshWDSr0snWDQ32S38b4H65PHz/4k12SU3y1xy6i51JKMyUlJbeZOf
	iqMJXFHrZkoY39mJlofPRNJmdVEOAay/8pTes3V5bgYrQh5HNu/pB89r279vEcFzK3DOJCVKsl5
	1UJBBWcu9aKetrVYfmpw3AXhVFCT2RZQipjsXovh0t4TWI34if3IA==
X-Received: by 2002:a05:6000:290c:b0:48d:c178:f6e9 with SMTP id
 ffacd0b85a97d-48e2649d796mr7104292f8f.20.1792609271764; Wed, 21 Oct 2026
 12:01:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001202134.33929-1-dwmw2@infradead.org> <20261001202134.33929-2-dwmw2@infradead.org>
In-Reply-To: <20261001202134.33929-2-dwmw2@infradead.org>
From: John Stultz <jstultz@google.com>
Date: Wed, 21 Oct 2026 12:01:00 -0700
X-Gm-Features: AclHuK-I-V7ry1L1GRBgZDPgyPKEAcSrfE_2GqQkMGC1rabLZyJUGN31XrbZG10
Message-ID: <CANDhNCqY+RRCCXV+HfMNKf5Rmco7Y+kZ0RHv5sYC2dnw2U+V=A@mail.gmail.com>
Subject: Re: [PATCH 1/5] timekeeping: Allow tick_length changes to apply mid-tick
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Rodolfo Giometti <giometti@enneenne.com>, Ryan Luu <rluu@amazon.com>, 
	Julien Ridoux <ridouxj@amazon.com>, linux-kernel@vger.kernel.org, 
	David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 1:21=E2=80=AFPM David Woodhouse <dwmw2@infradead.org=
> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> When the NTP tick length changes, timekeeping_apply_adjustment() applies
> the accounting for the new rate to ntp_error retrospectively for the
> partial tick which is currently in progress. So the ideal line of the
> clock conceptually changes from the moment of cycle_last (which can be
> almost a full tick ago), and ntp_error grows to show the difference
> between that and what userspace actually saw already.
>
> This can lead to a significant value (10s of microseconds) landing in
> ntp_error which can take *days* to drain through the natural mult =C2=B11
> dithering.
>
> The slow-draining ntp_error then applies a consistent bias to that =C2=B1=
1
> dithering, meaning that the precision of the effective frequency
> requested by userspace is limited to integer 'mult' values, since the
> dithering is no longer effective to achieve the fractional parts.
>
> Fix this by allowing the rate change to be conceptually applied at
> 'offset' into the partial tick, rather than the start of the tick.
> This means that the amount of delta which gets accumulated into
> ntp_error remains low.
>
> Rather than factoring this into timekeeping_apply_adjustment() which
> already makes my eyes bleed, pre-correct it when the rate changes, to
> adjust the 'intended' clock position according to the delta between
> old and new tick lengths (but leaving skew as it should be).
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Assisted-by: LLM
> ---
>  kernel/time/timekeeping.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
> index ea2e6e55f37b..e2f7e28dc16e 100644
> --- a/kernel/time/timekeeping.c
> +++ b/kernel/time/timekeeping.c
> @@ -2444,6 +2444,8 @@ static void timekeeping_adjust(struct timekeeper *t=
k, s64 offset)
>                 /* Revert to the base mult rate. */
>                 mult =3D tk->tkr_mono.mult - tk->ntp_err_mult;
>         } else {
> +               u64 old_ntp_tick =3D tk->ntp_tick;
> +
>                 tk->ntp_tick =3D ntp_tl;
>                 tk->skew_delta =3D skew;
>                 /*
> @@ -2453,6 +2455,21 @@ static void timekeeping_adjust(struct timekeeper *=
tk, s64 offset)
>                 skew *=3D NTP_INTERVAL_FREQ;
>                 mult =3D div64_u64((tk->ntp_tick + skew) >> tk->ntp_error=
_shift,
>                                  tk->cycle_interval);
> +
> +               /*
> +                * Rate adjustments are conceptually applied mid-tick in =
order
> +                * to avoid accumulating large deltas in ntp_error which =
can
> +                * take days to drain. Offset the ntp_error that will be
> +                * introduced by timekeeping_apply_adjustment(), accordin=
gly.
> +                */
> +               if (tk->ntp_tick !=3D old_ntp_tick) {
> +                       u64 old_dividend =3D (old_ntp_tick + skew) >> tk-=
>ntp_error_shift;
> +                       s64 old_base_mult =3D div64_u64(old_dividend, tk-=
>cycle_interval);

Total nit, but splitting the math up this way makes it less clear to
dim-old-me as to what you're calculating.
Maybe instead:
s64 old_mult_w_skew =3D div64_u64((old_ntp_tick + skew) >> tk->ntp_error_sh=
ift,
                                tk->cycle_interval);

Might more obviously visually match the logic above where mult is
calculated (or alternatively you could alter the mult calcualtion to
match what you have here)?

> +                       s64 mult_delta =3D (s64)mult - old_base_mult;

It might be useful to add a comment clarifying exactly what the
mult_delta here represents vs the (mult - tk->tkr_mono.mult) value
later passed to timekeeping_apply_adjustment?

> +
> +                       tk->ntp_error -=3D ((s64)offset * mult_delta)
> +                                        << tk->ntp_error_shift;
> +               }

Otherwise, I think it looks ok, so with those changes,

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
