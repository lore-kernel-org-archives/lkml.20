Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792698030;
	b=oNYg48nf3wR4wIwTkdkOF8kh1fHVUW1Pk5l164JKnOL6RRU/pGHcR64DaTfbbCoNo8cO
	 X4XDV8rN9xw52dJ/kTGI4+QRz5zYZZbqC3XNo9VD9XEwrv2zko0WJVl4S3O5EanzDBnDe
	 kgC07JQ+r3ZN74bOHiqgK9YMj2W2jnJRG1TyoxV2ki0o1jADkS9KvxkyrVcX/CoZy4NB4
	 u47VPayRg9kRXZTEISfu8bYeJIXj6SAdDJmd1CaEx2e349NuJSMD5r733syTr9FCX5YCU
	 DYXd/cEgoP5W09SQyBPEFdudlYUgrjqtbVWI11y0OkCsP+4GsydnAsPkny+v5rdyeRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8hxs4TrxX5lYvfX14BOz5cWH8dUM/3a4x071nu+Tnwk=;
	b=FnrcPlqJacSAF7ERed//o8USqKkqsNrwd6tBpo61V7W+xViyEi1CtSSbJuU5RuVfbhwc
	 QOHy88DIaexjViKI4iRaZwbjcN66SbjR9mIcaxtfACE4QfISDpRzxzjCMBx/kLcEtC4Xt
	 /bGnVLzJwoSc7w4DgKjMtChRWqUuCOBX6t64kAOU/mJzepg8yfisTb4Pu+mlagnZe5BZT
	 JTxm4wtj9oFWB/IDCxSwgyvCwZ9X5EEK0+JITGYaYnHiwPZ+wtQ0B3rPgRgvZjsS8j8i4
	 3ubYXJYlPDhwd9FNSZZLo9Kll/9j8ZBT0R4tSXFN5ifgdeub0EBuKc7/b11c7HFai2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=T1lLPDaY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FF3606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06FF3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=T1lLPDaY
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so119661f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792698028; cv=none;
        d=google.com; s=arc-20260327;
        b=j2OuZvTwXl2Of6l0ccRIFH25AT/g9hsOQI+1ryyoBnehBFvKOh3+v/uc4W7KrMHpPi
         ktnu2A2kjwfx7OSjo+VGzmqDGfwzJpkOS/xESNyM29MV4DmZHrKd16NcePhecH19GFa+
         eumjKxPW3SdOs5rbYs8S5cy8q5RJPQO+p6yJMVKQjJY2SSGy+S01P0HEdStTIpwUYBXB
         XAifWL0TfTuOEzseWYiEPcqXDpu+RB50gwS8B80gLU20qV2T/fzEOlLHTmkzTY1xvVq+
         nAoGKYhzv1dEwDVzJ83r7OvBokEgB38s6/NVLeD2UqE5Y/4+iDz55sXqPzqHNEr0VQnI
         85oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8hxs4TrxX5lYvfX14BOz5cWH8dUM/3a4x071nu+Tnwk=;
        fh=y6dCt8JWF5Y6IcXpCoJKpT3sZfKXifIODzvMzP+YCYA=;
        b=i6Q0VBLyvigUcIrWox7S/irkjepKnLurUXGJA8kS6YL2mVHokXWeMVocBoGwgw8+hr
         jqBBN8HfFH0ux3xBH8WT8QYw9PQBAuHFEAu/PfsY4WZKvDC/0zxR7qTmlO/w2ycjQHIz
         yipDsuo7ZM1gXxEsaHGzRncYQZRuhVeYuotpBEzXRJKOqI0sT0hj9ugXHObfgbQyAle5
         eknEKmZhpcMqe5GjzAXxdv1D187T5REXk6X4NSN9t5Q4GBpAW2K5rBGXXxreDrMHrH7F
         aFIz8gNGrvnIslByjbv651S6FLXvVHnwWKOc2S/adW3+jEMAapeKQCiv2rfvIeJcODMC
         acfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792698028; x=1793302828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8hxs4TrxX5lYvfX14BOz5cWH8dUM/3a4x071nu+Tnwk=;
        b=T1lLPDaYvmBOPdA5OmZx8OEpO1Js1jRJcuew23139kLNW9Nhbzn4dQ+FkjDWXgD00v
         aKjcP4xDcu+ivwJTmBachMXal2gUdraLYN8W1aCY3lKvsrqsUhXyTM5/3oR9K+qwvms2
         kRQx7QnXPTIJHvZtjrxBtdFu79NkK5hr6/8oo+rlJhDDP6zy+5GjfJtk2+CjOzwHW3Az
         YdfVSvG8ZCPjTGWyz6lEygfaQNASYbUMzjx1KsCRKJbEyGjSwOsch1p10Rwrd03DISBV
         ruvzzo/iqzgy4na3N/zmZFc5zGX//UCtW/6umQIQT1oM+y+5vrCazqu/sqhfLQ35Og99
         k8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698028; x=1793302828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hxs4TrxX5lYvfX14BOz5cWH8dUM/3a4x071nu+Tnwk=;
        b=yp17Ndpyp0POiYOZdF04Ko15vjMzWvHtJfH6cdMs7M6kRgPnfw+9B6CYu7rTm+cE8b
         FQAjrKe7KFbSPM+0B5S4t82JdHew/bY75WMfon1SqeDcagOw3DPaNzKUBXefZD18tpHX
         Kq+WnTc70UVjKBGyE7ncVKTp0om7aEla3ew3WgcCLUIZoaMhDqIBUF10zgsHDUhNVdOW
         8VKUGLHrrTPatQWJqLYZxOEGGb1vGfJpGVWw/K+QFq0huftLNGkWPInzgI+soA8vTIEJ
         GgDN/GhEa6DO7FqT602gcloKnB+jNRuiL8Ktyujhqouk5v1sC8aPA7J+Hai/X+xRbfX/
         rbag==
X-Forwarded-Encrypted: i=1; AKwUvBxcUU2JcX73a0ZVL1CSA9c5p4lazMdJfDtTQMWMXNScXyT8+3IQ8VlG/NR34e3VbqIAbhNWETr9/ENaz0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKO4Nz0lrLmcETmtpolg3RKzJrwm51eBCvdOHtjeQE/LLan7P/
	RKxErvQsFkvywtE2t+vbStut2j9Hru9gmWM5W8k5+tEGdv9GZEIW3xGwf9RzgaPGZ/g5as6TlQD
	64CXKoVIFTFWB0WvMcedyeN/e8cIpZI7HVdCuKSqZByti9OwbD0k/hyI37A==
X-Gm-Gg: AYBFou1PYTmDRCrYJeglNC0yL02rDUCVNuQ+gyHZ0K6+sX73j0frsHLZKRcLN/3cR5G
	QRR0+ZdNDYPmNe6DyLLMjsm+FGdZqmUMk74f1Svx24u5rWitFicbmkLVyCGZwIsiVDxuC3xEqBe
	mN+w7AtqGpc0GigPD3vplhd76gc6Bc+Rcdy/+aFZMcHAHpqp3ALGJsxIGecc/o2EGgmA+4bk4pe
	B5FFCx8pZuf7m1sSFOWu417MndGjNE12rQZ6G1dF1o+Hfmm5iVG2gg+jlMzQkrBiv4Lkf1YAmAm
	rJQ8kO4/1/k/HIIckB8EVVA5by1mgul5tNtNQmYPUp8Jy4PM5bh3eeYpIxLDFMvIAo2LiSfpesq
	kMEtXIGsSnbrm3eDZuTyf6rtvwKG9CX4iijvOl6sPO8GcMhFJRSeLEpvRyBkXVqt9iQExLTQYwG
	tbAXbMfPFoOFhTANIRO1fDP9nLhfwgjbtN4U48KN/XVxGXKdvvDpn20yiWYOUo1rpeKCHUh0FXV
	NMgiUP329x7XR74vJj7MkfCLrwO9Yb3oVOS0jB7fG6a7zZascOajQ==
X-Received: by 2002:a05:6000:2889:b0:488:89af:e95b with SMTP id
 ffacd0b85a97d-48e264309bdmr11332103f8f.8.1792698027826; Thu, 22 Oct 2026
 12:40:27 -0700 (PDT)
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
 <CANDhNCqY+RRCCXV+HfMNKf5Rmco7Y+kZ0RHv5sYC2dnw2U+V=A@mail.gmail.com> <16216028b040ea38556bb59b3a8ce6e588ac5b38.camel@infradead.org>
In-Reply-To: <16216028b040ea38556bb59b3a8ce6e588ac5b38.camel@infradead.org>
From: John Stultz <jstultz@google.com>
Date: Thu, 22 Oct 2026 12:40:15 -0700
X-Gm-Features: AclHuK_AM8c6su67k7dc-de-MmfEh5OH1dUcSXM1RFDkFS6PKTLUThbT5T_F7aU
Message-ID: <CANDhNCqepZ2eFohk05GJHC6XAyLkEcrus01poE6UsK4GmLsTOw@mail.gmail.com>
Subject: Re: [PATCH 1/5] timekeeping: Allow tick_length changes to apply mid-tick
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Rodolfo Giometti <giometti@enneenne.com>, Ryan Luu <rluu@amazon.com>, 
	Julien Ridoux <ridouxj@amazon.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 6:39=E2=80=AFAM David Woodhouse <dwmw2@infradead.or=
g> wrote:
> On Wed, 2026-10-21 at 12:01 -0700, John Stultz wrote:
> > Might more obviously visually match the logic above where mult is
> > calculated (or alternatively you could alter the mult calcualtion to
> > match what you have here)?
> >
>
> In fact I already do the latter in patch 5 (as I need 'dividend' again
> to calculate the ntp_err_frac divergence rate), so it ends up looking
> like this, and does match:
>
> =E2=86=92               dividend =3D (tk->ntp_tick + skew) >> tk->ntp_err=
or_shift;
> =E2=86=92               mult =3D div64_u64(dividend, tk->cycle_interval);
>                 /*
>                  * Stash the fractional part of the per-cycle ideal mult =
that
>                  * the integer @mult discards, scaled by 2^32, in clock-s=
hifted
>                  * ns per cycle.
>                  */
>                 dividend -=3D (u64)mult * tk->cycle_interval;
>                 tk->ntp_err_frac =3D div64_u64(dividend << 32, tk->cycle_=
interval);
>
>                 /*
>                  * Rate adjustments are conceptually applied mid-tick in =
order
>                  * to avoid accumulating large deltas in ntp_error which =
can
>                  * take days to drain. Offset the ntp_error that will be
>                  * introduced by timekeeping_apply_adjustment(), accordin=
gly.
>                  */
>                 if (tk->ntp_tick !=3D old_ntp_tick) {
> =E2=86=92                       u64 old_dividend =3D (old_ntp_tick + skew=
) >> tk->ntp_error_shift;
> =E2=86=92                       s64 old_base_mult =3D div64_u64(old_divid=
end, tk->cycle_interval);

Ah, apologies, I'm still having to review this in drips and drabs as
time allows before my magpie brain gets distracted by other shiny
issues.

>                         s64 mult_delta =3D (s64)mult - old_base_mult;
>
>                         tk->ntp_error -=3D ((s64)offset * mult_delta)
>                                          << tk->ntp_error_shift;
>                 }
>
>
> I can happily pull the cosmetic part up to this patch, leaving those
> first two highlighted lines exactly as they are for symmetry, before
> patch 5 adds the extra bit in the middle.

Sounds good.

>
>
> > > +                       s64 mult_delta =3D (s64)mult - old_base_mult;
> >
> > It might be useful to add a comment clarifying exactly what the
> > mult_delta here represents vs the (mult - tk->tkr_mono.mult) value
> > later passed to timekeeping_apply_adjustment?
>
> Rather than "add a comment", I think that should actually be "rewrite
> the existing four-line comment cited above that clearly isn't doing its
> job".  How about this...
>
>         /*
>          * In timekeeping_apply_adjustment(), the mult_adj value is
>          * retrospectively applied as if it had come into effect at
>          * the *start* of the current tick.  Any discrepancy due to
>          * the fact that time has *actually* been counted at the old
>          * mult rate between the start of the tick and now ('offset'
>          * cycles into that tick) is dumped into ntp_error.
>          *
>          * When tick_length is changed by a large amount, that can
>          * lead to tens of microseconds of ntp_error being accrued.
>          *
>          * Fix this by conceptually applying the tick_length change
>          * now (at 'offset'), rather than the start of the tick.
>          *
>          * That means calculating what 'mult' would have been with
>          * the old ntp_tick length (but the *current* value of skew),
>          * and pre-adjusting ntp_error to compensate.
>          */
>
> It's more than four lines now, but if we want it fully stated in the
> code rather than just the commit message, I don't think it could be
> much smaller.

Looks good to me.

Thanks!
-john
