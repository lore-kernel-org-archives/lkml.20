Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794276349;
	b=MrodejACocMq20yIiBqwXopGmprIdmjx2OqjbdBANPHBkV4pIDFFQtDqb/hVX8t4M9+2
	 DtOnGOB2rlYBcYw9F4VDA4sAhiyk6vsBWzFQHnqY6uljQfYl/BtAuCuhAJ/uLVK6KetGq
	 21gK6tlRK98ot1jCIRk5/+L2ghTjxyNXa2Kkt5XJn7LSPCCrDL/3a6srOFrxCocrKs9BQ
	 6SgcTwYxglBpbNYNqQJxoNOaf5TAW01BZlU4mwoZrO/BJjfhZ5uXDY3C3V3+1HWc+qYni
	 e7s8x87+tIq84D4uN5myHg6KDPAmS4lMWCi1jRzdv3JFfI1+85G4h1fbP3/PBIzcUHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rvBtJIxhWUVb0UP6eLGnrGtj2/MrbT/J0MltdyjUmf4=;
	b=k1ZdmvEMgMfOCZWfmLOVR5HT6swVaE9kqPxFNGT3zRZ+tMOqgafWKcp4teYcjHPytz2x
	 IaP6OD0Vk/jtt5qr0Z/mWn1NyqjnJzDgWmF5Gq9CnZBCdmvCEMOA3HYIqFL6Ii3Ad2FMS
	 myt/urgb8a20wPkCEvFpHHyrY3BRA6MVnTUArttdgD6L/hs+pX2rdWneBbofHmpIghqkn
	 kcrJpw8/Dxz9p0BxVScMjXWbmIWoV6ms94FxC8cU+kHKdt1zvctV16IykVps/pRmwTlqn
	 ciqvPOmYKCDhASEMdFMmF5f9I6Y9vzXO35a++leD8obRjLC7wN7rcxFUbxQbjwIOOOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdDn4sPz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD61606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD61606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdDn4sPz
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3adf9b1f5aeso13146831fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:05:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794276347; cv=none;
        d=google.com; s=arc-20260327;
        b=fqX7FzwYEF3hbsDG1eOSXRAIj1s1IeXvq0IXElEz/2tl70Mdd6tlDzUTrZr9MbRH97
         5zABCNmVpgZHCyh2AS9Gi4U8fY1zrUNPFBCIQgvYj3pFVoFr/AupLsTYDXPbXzWav4Dv
         0W41216zgAUYa70RWpvQMq061wgFFWeMkKXTwBO6A1dSWT66dIoEnIbyuHeYi5LKT3Dv
         DnlSTAFnlVNx7JFhGokkVODDiS6YF/YEmU1jZQemXZ+nBehVAi/q2o34ElfUUwyXnyQr
         SUZBwV3H/4Gwpvp213ROlCS7tg2ERPyxlMhAp1MVhFA91nmuO+TT+l3Md/UF8waz1Fy4
         9o4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rvBtJIxhWUVb0UP6eLGnrGtj2/MrbT/J0MltdyjUmf4=;
        fh=UIhe8c8gWHqi3yMRrhTzVl7Fhn+Mt1HPIoHL3DsceqA=;
        b=CgzqLUpPJGXk0TYTMUJ4rAqpzqlEprQSOh8JX13ieJ5RwIFFh1yBPsLVj+YwQDqHXc
         CHGvShuinsLaIJAMOg0w6qHy+5XvbNOTp1e7/0kF2dZ1CKDF6i6aKY4mln4HPmab9Wfp
         PW3EKm5OzbBqP/mE/SlPJBaAyNNFIQeqF5ZWyji+nSoF9d1db87y1pSBJFtiWgMCqVVJ
         F/GDENP8kAXqtcZhMhqTxHHkN7CBJCkMan5vhGhjpMLvQ2Xyjuq/RYVtuAyRTUqNxqUt
         m/ObeOACA6OZNkH3X7GVyV71i+q5MVOlivlkcb0l9YrLABCTY7JxKB7DVd152PD/zHmL
         JJKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276347; x=1794881147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rvBtJIxhWUVb0UP6eLGnrGtj2/MrbT/J0MltdyjUmf4=;
        b=tdDn4sPz+qE4U3fnx0xZx3mtokkTI2dZkE5ZSClQ+Gl4tiacu/wnJJrvejDCXPlGHs
         oQ2BfLCA0G7CK0YrVZAsXZ9nxYNUUuRrqD1nypJBMB/JFyQaT1BCoqJnY2+e5KZ+bJ9p
         q6/EypUVz42tB6F7U4UftfDvco3E1M029FTpNzFiXYOJo9x3zD/cZF/Y9CLH/7KWUyYz
         XaqKvW8PTUcXLWeQ3yttCYuwD6L/pMdgiUdvS7Mttfr97m+jRhvDgxD62gQAIXBQO5fu
         Spnae0MCiTw9NMhIouThLRFY1G3jHATu63+Q3dAYD36+tckN1yzyk8GOf4rVVWMq5Sd2
         QNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276347; x=1794881147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvBtJIxhWUVb0UP6eLGnrGtj2/MrbT/J0MltdyjUmf4=;
        b=uNdsoCIECOEnbpqtTZQT8D9z14YzdurvhGBA0nmF7szyafNTnTZ44J/rN1uEi7fbUM
         YCz6RFKDGC9QS1evN7BvU+n6BWfywvdQQqb996e13ThpHYUAEgJLdLvWSI2SgYzLh94V
         QYNt9dLY/AqSs4fvoEX1NSFk3zKI7ophBdCS5TIUnayHIhch4AkUcSgQdbeb3odSxsJ7
         NGtUFy2LLbbJGktxZNLqrN8fbln44mtPBxGZ2ar2WaXjbMkaTYR/Pbm0msquTuL5Tv5p
         lq9BbFjkc/jeqB3hCVU2PoKtLL10Rts8WeTtzPr8Zc+C54DDMDItbmscQJqz3hlYksmM
         Tfvg==
X-Forwarded-Encrypted: i=1; AL+hErG/SRjJRBCCWLlWT3hSzxXhTcAWEPp1tqPI5Nbb9LxL+VW1FVRxjvIRVi9VVsd0zt9K/sDHCfKGcMgChgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P94XVgL1wEG9us028mL99NOE4TF6tU8RQ2vDY7owq6SxvzTUZ
	aE4Y8qnRANR0e6ayAw5nq9KJFFjPHl4J+i3bpl4y46cCbGvqCRL/bH0S/2DYpR/r5Y41NT6RsCh
	LCKZ6YhXd4MYO1ChUoJIzJGkB80eGR+YiefFC3XY=
X-Gm-Gg: AYBFou3yLvEtsUMj+FvC4SnYKh+KpoZoxZMi9J+tewaVbVW7HSg9WWPS51PnE5MYYAV
	IWJlgWtbSzLc+NmLeU5ndmIfmaZSOT73106VtXEiMeeUYDwYXpvqkWXOT6cXkGoSLKUO8AoWdOQ
	8JFxlrqAXnwCp+12f7dTFFLzMZFOZffRlJC4Ce9+cBddqT8RMDhWDHykecP+HO1mv79QTCEw8j/
	nRIcyc7bwN4BQTJB9373s+5wcchD3Urq/hs+9t2yyZscrjnU2bosLOXYagGu1WcNNzxiIabDPFZ
	AH/wHoXgKqelPy9xEKtOhLfjCNPtOafWJTqLBhXIXr/557W9QWeN7zUfUGGkuGMQWS3uElo53fD
	4Zp9ND/PLQwYHeY/8WyIfdix4tU9iCjxRgIGAIFV7WGFa3J3wDLbC8GE6qV6ESGN3/hHun1Bg6/
	QG+cFqiDVJoQRlyiu9korx82unnZvPvFzVMoHwFZKvFzzfC9tb7//k
X-Received: by 2002:a2e:a98e:0:b0:3a9:7c85:a16d with SMTP id
 38308e7fff4ca-3ae090e40b9mr2048221fa.5.1794276347097; Mon, 09 Nov 2026
 18:05:47 -0800 (PST)
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
In-Reply-To: <547ee20a68b3f2d848d451c69ad023c0361f41ee.1794040317.git.linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 9 Nov 2026 21:05:34 -0500
X-Gm-Features: AclHuK_rqFRFpVgh6MA1aE6J-sPjlpj-Y4wuItG9aVYgITuJ8lbM2pcP42HV0Y0
Message-ID: <CAEdQ38FkLVgK2rhvqL9WDxvGkSu455ETYWvd0zVw+PML_5Cqgg@mail.gmail.com>
Subject: Re: [PATCH 1/1] alpha/perf: Account for time spent handling PMU interrupts
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 4:19=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
wrote:
> Alpha does not report PMU interrupt duration to perf, preventing its
> adaptive throttling from reducing an excessively costly sampling rate.

Nice find, and thanks for the thorough testing write-up. The logic looks
right to me: time_init() runs before early initcalls, and since it zeroes
est_cycle_freq when the HWRPB value is within tolerance, the
"est_cycle_freq ? : hwrpb->cycle_freq" idiom picks the same frequency it
did. A few small things below.

It would be worth adding a sentence on the symptom from the cover letter
(short sampling periods leave the machine unresponsive with RCU
grace-period kthread starvation reports) so the commit stands on its own.

> +#include <linux/math64.h>

On 64-bit, div64_u64() is just a plain division, so this include only
serves that one call. See below for an alternative that drops it.

> +extern unsigned long est_cycle_freq;

This is already declared in arch/alpha/kernel/proto.h. Please
#include "proto.h" instead, like the rest of arch/alpha/kernel does.

> +static unsigned long pmu_cycle_freq __read_mostly;

Since this is only written from an early_initcall, __ro_after_init seems
a better fit.

> +     u32 start =3D get_cycles();
> +     u32 cycles;
> +
> +     alpha_perf_event_irq_inner(la_ptr, regs);
> +     /* Unsigned subtraction handles a wrap of the low 32-bit counter. *=
/
> +     cycles =3D (u32)get_cycles() - start;

cycles_t is already a 32-bit unsigned int on Alpha, so the cast isn't
needed. Declaring these as cycles_t would read a bit more naturally.

> +     if (likely(pmu_cycle_freq))
> +             perf_sample_event_took(div64_u64((u64)cycles * NSEC_PER_SEC=
,
> +                                              pmu_cycle_freq));

Alpha has no integer divide instruction, so this compiles to a __divqu
millicode call on every PMU interrupt. It's small next to the handler
cost you measured, but it's easy to avoid: compute a mult/shift pair
once at init with clocks_calc_mult_shift() and convert with
mul_u64_u32_shr(cycles, mult, shift) here.

> +     /* Match the calibrated frequency selected by time_init(). */
> +     pmu_cycle_freq =3D est_cycle_freq ? est_cycle_freq : hwrpb->cycle_f=
req;

Not for this patch, but this is now the second copy of that selection
(show_cpuinfo() has the other). Having time_init() store the frequency
it chose in a global would let both just read it. Fine as a follow-up.

With the proto.h and cast nits fixed (the rest at your discretion),

Reviewed-by <mattst88@gmail.com>

Thanks,
Matt
