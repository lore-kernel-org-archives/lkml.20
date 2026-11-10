Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794335874;
	b=nYVH6DpnUSxIY3v5QeLAo+MnWobsBLAXCPI7TfFoNNjs7g+Kx4tiG2ticvVC8ZegEu2b
	 e9Lbjh3kVmakp37TTnWEDdzf06ZjthBzwNe0HsQXYAVcLZnQi/X5B5Nb2hg6cbgDRc724
	 0nxetajugoqWuErGlZmnLgpYJ1HE6tSTx6+ZYpFKMWK9lrCmVnURLwtXuAlY5OY1bjXXQ
	 9NCd2fnN1MuyFgq1iJ1Bb0C0nhL08vFjAkbjfV/m1yNelnFnDQZXJmgsWUm35Y0CUTUp1
	 O4Pb7dSDROtsrX1tu8bIqpnMl8oFZXEKz1ZspMGrtWt/m1sLAPJEvoRgXgyFZN77Sew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aXbSmfqp0QsWZwY1ePq7n+E1/WjLTTdEEmX75883FJE=;
	b=d2agZmd8s6l/33I6Boa+vF1bCF/WHOzsqVPY2IV7ojaGmueqybg8ky9igzCilUtN5gP1
	 BbnsriNZi5Ca/A4rrlw56/XUq6DcSK9x3yBW0agJiImWJK1Ty4YHDI5uqq9c0QBmIAs+u
	 gCbYeg9z8GV3xRM7l49nEoXCuU4HS1baItBUJVrcC5VjHzL/4lOX945G8SEOgIkXVj2vL
	 v1KUtx159eqQ/Wy2WWdBP7KQZRLV4sdgGeby1v37wbX86YlAUwVp/rk3NbZEp++IJA0F3
	 kij3FF4NL93t7jiz96A1XubkYL9LjWXfLVcl1YAcdpYaWJo3f5OVFTfmXx7oz4zbDeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnteZnK5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF18606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF18606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnteZnK5
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so2902404a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:37:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794335872; cv=none;
        d=google.com; s=arc-20260327;
        b=rdfxxq8Ya389Hl14ol9U350f4ZiH9gOtkYoWOdUXVcfPhnJ+irzgoVx7I7fepePYW1
         PUj/gyFMPIyD21Yw8E70gW2OHl9BtLUG8snTmguKgt4VbtHleKT3mlwUTfMImX4n085e
         KvzrDsmEy5o7hEGCQGl13dHYxyoTnCO95bpiDdR25LylPeJSf4230ysQVlUOK/NP9skW
         urHx6xRS7DC0S9s8YKcrh/TJrts8+5mfnZD/UrCn6eF5s4BLw0W6Pzg3aCZu5Us1C+SB
         HvMzAbaBHhRhZbVfGev2Zx2Hr9d0bJBwqKzY3BJ4pTVLD2BMcs67S1/i5W3L07JaRo8u
         uZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aXbSmfqp0QsWZwY1ePq7n+E1/WjLTTdEEmX75883FJE=;
        fh=pO2JxGljVp8oceTqqLzm6drWExf/BpsvZeNlbYaC/ro=;
        b=HBdkYLYywFHfS8lKgTqZZMVFRGtmOYRLbjs0SJwA2K3WvGgQBsiS1QX8PHSQVkz1E4
         MEtqVHV1GHU5Ev/X8i1mdg1TwcJCPP49W6m1om/9UFPadWWWHKaenXx/ovOOngftCC5w
         +WbcuFBY+nYBS8zplCUevew2juyi82wiU9GyihYyjGNmAKNSmBGV9Rp3jntCFvu4j/49
         adl6HXe0mh/VACY8hu+VIIzU7OR4k2nOpV+59S1rLbJ81JCJ4HUxYzylD5r8sbee7wS/
         5YuBtVtBISVVoPxo7oOD8Rz3p7OxPyttJAUzaqGI7CaXUTHCg07W0SUHVP5nXt/IrfKV
         nIgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794335872; x=1794940672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aXbSmfqp0QsWZwY1ePq7n+E1/WjLTTdEEmX75883FJE=;
        b=fnteZnK5Y62ib4kOKlV0wWxe+tAvWLrVHmjMtvRMjfdMPhc7LLAeH0pYLzva8xIQ2W
         vEnlda49dWZNCFpCoPCq4zDWPJOf07K8KBy8n/lko0GnD2eG9EDFwnPbFy5h4v5qAvEy
         LlcelBG6T02PsqgUvHV7JyB07IRTFt0CozB1Wv0zdnwjG/nfrcY0MCor/FLtQfwomXuG
         1w5JZiAHb5i2R+NvNtLJ4UpfuWgfn5CbErB0W6GCh76Ts33P1X8q1FFZWmqAoMvnVZfN
         2HD5VZ7h5gZAJOtwekSN7eUmXhk2YzVIsBYNcc2tvio1EYl5bl9PSWGUrkUDVd4HRRNk
         m09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335872; x=1794940672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXbSmfqp0QsWZwY1ePq7n+E1/WjLTTdEEmX75883FJE=;
        b=EyzDFptXUtJeMtHwHGZotiLrLBh7cxa1OW5iCbcuGvmem7eZQgk8HB1qJJ3oG9U0Bm
         QZI6Zw+kJRKUXmeFAFIG2DDcKwzDFCEZGUuUYzraWzKtHYI6cNBLNaJ43IrNV8dDbKJP
         lfC3WQgK3lslpxtE7LCjYMNne6rAnLdPywh8TcevidCnzCvWNrvSNgfcO4lDpxVj+psW
         +3xv/JWbB2OWsP6VqAPBHAMFhNrGMPo8Bq43Twk8CQHiOOayfz9l0CJOmvpAuAVCmzWU
         GaPZqKdEqkzkfhenLCRuJ5Bx63Lq6h90aVmfyPZBC2NTYCOlZ8vphdVdUzNfUyPM+D/p
         5wQA==
X-Forwarded-Encrypted: i=1; AL+hErGE9lCyZ+H/Q7RQ04Z5A10evTDzqvPQDzQWKgVCso2kv5IoIWlqG9qp9wW6jEFxXAM8mm7IpgVFGap/MJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cMG8ltYL4OiSwrwtsOKkeCax8tFUNoHyDRebJ6nl75r1KGT/d
	v13d3s7y1n16x8PJyLSwLTqpt+lirhCmaAu5vyv635QGvCHjVzn/UoBMdD/Ji9KAUqMsie5tG1L
	aS3uhqG1Ngn1QLBhPHPfuqoiBwKASxtY=
X-Gm-Gg: AYBFou3ZWLHia1ChXtb38R2wFQfzkrya+U1eQ8w3wU8dVd4ZLK5b6mF3mj2515u6JlN
	0KjeKKmW554w6W1i6UzzxQOX0ra5G9PONdQRYbqkbCGg1hAhP4i/bN4G+zjnYB2jhTbkbA3XJ+K
	WVMvonb8nGadtPdUhZ1F1j/kecqQof8ZhnTOHo4NzwbBjUD2liG8TJW70AGjsNmUXmbTVRdZ24c
	zRF0S4RLom0HEBdPYEzvNo9dTRbPjbWMrLL6uFYvXc301LRm8PGu6EEG2FVLQvOJ3ttcdrLcp5W
	hVxWHmhD6VET+i2B6Zqv7C49VcTuo7ZncvyHQJB3Tf9jU+Usez2VHLaFY2kyjuaYtUO4TUk61UL
	w69aEs0IL06NmsWIW+ISkChxbqjBsshJ2xjk16R+84+LGo6Ez5SifB0xAWvahGCZH1XwLHPctrz
	EDNFgbgCwfpaEcrnN9nxrkUlo=
X-Received: by 2002:a05:6402:2756:b0:6b7:1d62:3916 with SMTP id
 4fb4d7f45d1cf-6b777083013mr174379a12.0.1794335872243; Tue, 10 Nov 2026
 10:37:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794040317.git.linmag7@gmail.com> <547ee20a68b3f2d848d451c69ad023c0361f41ee.1794040317.git.linmag7@gmail.com>
 <CAEdQ38FkLVgK2rhvqL9WDxvGkSu455ETYWvd0zVw+PML_5Cqgg@mail.gmail.com>
In-Reply-To: <CAEdQ38FkLVgK2rhvqL9WDxvGkSu455ETYWvd0zVw+PML_5Cqgg@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 10 Nov 2026 19:37:40 +0100
X-Gm-Features: AclHuK8ye6DC0vP0CIqj2Kxi1_mqxAUWe4I4SZTYnzI5onSho51f034roAGQ28c
Message-ID: <CA+=Fv5Q2bVUT490ED06yUNxp126Bk+c9_hFBTE8n4vQLuTrktw@mail.gmail.com>
Subject: Re: [PATCH 1/1] alpha/perf: Account for time spent handling PMU interrupts
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 10, 2026 at 3:05=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Sat, Nov 7, 2026 at 4:19=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com=
> wrote:
> > Alpha does not report PMU interrupt duration to perf, preventing its
> > adaptive throttling from reducing an excessively costly sampling rate.
>
> Nice find, and thanks for the thorough testing write-up. The logic looks
> right to me: time_init() runs before early initcalls, and since it zeroes
> est_cycle_freq when the HWRPB value is within tolerance, the
> "est_cycle_freq ? : hwrpb->cycle_freq" idiom picks the same frequency it
> did. A few small things below.
>
> It would be worth adding a sentence on the symptom from the cover letter
> (short sampling periods leave the machine unresponsive with RCU
> grace-period kthread starvation reports) so the commit stands on its own.
>

Agree, I'll update the commit message in next version.

> > +#include <linux/math64.h>
>
> On 64-bit, div64_u64() is just a plain division, so this include only
> serves that one call. See below for an alternative that drops it.
>
> > +extern unsigned long est_cycle_freq;
>
> This is already declared in arch/alpha/kernel/proto.h. Please
> #include "proto.h" instead, like the rest of arch/alpha/kernel does.
>

yes, will do.

> > +static unsigned long pmu_cycle_freq __read_mostly;
>
> Since this is only written from an early_initcall, __ro_after_init seems
> a better fit.
>
> > +     u32 start =3D get_cycles();
> > +     u32 cycles;
> > +
> > +     alpha_perf_event_irq_inner(la_ptr, regs);
> > +     /* Unsigned subtraction handles a wrap of the low 32-bit counter.=
 */
> > +     cycles =3D (u32)get_cycles() - start;
>
> cycles_t is already a 32-bit unsigned int on Alpha, so the cast isn't
> needed. Declaring these as cycles_t would read a bit more naturally.
>

you' re right.

> > +     if (likely(pmu_cycle_freq))
> > +             perf_sample_event_took(div64_u64((u64)cycles * NSEC_PER_S=
EC,
> > +                                              pmu_cycle_freq));
>
> Alpha has no integer divide instruction, so this compiles to a __divqu
> millicode call on every PMU interrupt. It's small next to the handler
> cost you measured, but it's easy to avoid: compute a mult/shift pair
> once at init with clocks_calc_mult_shift() and convert with
> mul_u64_u32_shr(cycles, mult, shift) here.
>

True, that makes sense. I'll fix this in next version.

> > +     /* Match the calibrated frequency selected by time_init(). */
> > +     pmu_cycle_freq =3D est_cycle_freq ? est_cycle_freq : hwrpb->cycle=
_freq;
>
> Not for this patch, but this is now the second copy of that selection
> (show_cpuinfo() has the other). Having time_init() store the frequency
> it chose in a global would let both just read it. Fine as a follow-up.
>
> With the proto.h and cast nits fixed (the rest at your discretion),
>
> Reviewed-by <mattst88@gmail.com>
>
> Thanks,
> Matt


Thanks for taking the time to look at this, I'll post a v2

Regards

Magnus
