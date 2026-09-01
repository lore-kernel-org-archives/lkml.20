Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA47836B90E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304855; cv=pass; b=Qy/J2/OEhsd6lwwGfgBK1oKLnkVDuFwhx6OHDnsSTKRQ0kNvzjQsLF/NfOPp6npji6369747EpPo+ib5Y+P8lrljOedDugG9xPNVdGBpXqmRj+PF/TAvwR2ksSEGM0oB2gsJZbp1ZZ/++CnT064lEJwiUv6mGNsfKA51tX7gCyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304855; c=relaxed/simple;
	bh=m4WYWmpto9XzX3GRSm05r54OR/qeUwP6VipL3NxPpQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sWO4PVGd6PkD5kAbJPrIsvydmSjsLfl/R5aqKzzqTndgCAmcJbWFHVeH97Ts9sff401SFskFeCfbt3EelXy0GB6I0NiLYNsUBrKdK4E+appIi6AMg9VwXXAdHzIrOV35Sf5AIXMrlRRRF1dQt+OEDW2tz6y00z5+Ekjei1srILA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcG4cOl+; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcG4cOl+"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so640986a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 16:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788304852; cv=none;
        d=google.com; s=arc-20260327;
        b=NMLpVQnSK6Np291C17spbauX0CKKteRCT43GwAgnoUhobsM1bEVlDSs42PDKRxo0Cr
         uh5Kvtcb77Vw6tlXQAeGgcDXEkRxSXazmzDFwCvKS//ZqWVJg1PUtff2y11Jp1ObKxv8
         P2dk6iWRzh5p7OAkjtgUvZKqVi7EZaH6KviTNlK99N/4irazkZaGgsc2H+kvEX1RynDo
         saj4GYn5RHNZGrT6CLuXokO0JKugN2RUSInXSgc60Z0QdU0aNSwFZhk8NL5beeWWZjyH
         IEsR2eDGMUzoon81iLiSq73IQioWjh2KSGsHufmHeRnEp0OrlTwuzGP7IrI+cES+9EHY
         f3lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hTDDNvmuJ7sxDXiEKyMab4jWJTRs9ZKSqT7pTFye/Cg=;
        fh=LIL6D44n7Y/jP7HRwYmX03B8lT2l0S2YDnfiyMOKlgw=;
        b=snSY/quTN8omRVT1uzTkbkb/hBkzGSd2E+MiUEjXiJkV3hQ3Hr1WoSmgZajOEjgGYR
         p5CoE4NBk7/E6LHolfSEISWFQYdGdITXwNZ4nyz59JuSowXuVwUnoWWn/HrWW5H2gK4e
         IsXa3cWzs30byqHmmumyFu7BlN96gmyqlfoSTKxg8xPM/Dkr90Od9KRcmVaMzWIK7ri7
         UUONscF14rFJbGkmEh1C2O2rDvH606rp2YcgwG3+IIcgk+MfaX5fdwABvRXQLI2Oreyj
         k+PRO6Df8uXbEaTI5FPnBplxhg68aTnkCAtL7vaicTFSIhIFp+sJovEx7BKHzC9wek9V
         Dx/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788304852; x=1788909652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hTDDNvmuJ7sxDXiEKyMab4jWJTRs9ZKSqT7pTFye/Cg=;
        b=fcG4cOl+BTuOxWFDa7lDEgvqmlx9O8lNZYWAb11N6OgCCrc2EwCswyBJEPl9CgSuzO
         sUF3qwwAsqtE87f0hIcmBc/CFVqJ/gB3aji0yYLg/YtAyp/2WQj935ecfdzwL0lVa+rH
         NfchWt1D8b/HpuYzVb3Ynhc9h2eGbbWpiQXLjC1nngownefDiGxneyAgY6sQW4LBlpQ3
         kmrKV3eq5tRRXUD1sOQZdBzJxKKWuR1uRVKXLBHnKTrAOfCCA4VIDqrn0iOq8np31jIT
         2tOne0H0Jlu8kFqTyRmwDTR0BlsNkJIqilZofe0hxU1v+3VfOtnc6k6Je70OmZ3IXb+8
         dPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788304852; x=1788909652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTDDNvmuJ7sxDXiEKyMab4jWJTRs9ZKSqT7pTFye/Cg=;
        b=rNIpIMWFyMvNHhYc6+eOtdKvE5dpU4lCCWsfaKm1JsOPeHAlZXmMpo1FK7MuWQg5Lh
         Xma+U/YvLPRM/KkBxbZDU/FKu9sEppdDsaAYiRxgSexp8+UseFrpQVmAZffR9ErxJwv0
         TNZz/YWlVS0fKvQuKVUIB4JQRaHIOb+ULG/eeUJQbeFiaOANDpZ69OWueLzyQeckMA3B
         6FPnqMnP9LO3oAO1SeZqx9Mq6fX0y4OLvModKNCaOc5TBlyJCEhm10VocrOIc6DG4+h8
         icsZQ1jN0O6SLsO0SETEdRmN3iHlsaeZFWqb2SsE5qHUSzaxgV8QkMojDxnXeo7x4Vkr
         CXcg==
X-Forwarded-Encrypted: i=1; AKwUvBw2MDLf10Y7FydpffqYcg9Y/EaETHaUMZ8HC1Fu1BVnVcwX/pOe6uNzk0khrIlwFTzRmm6M1ZJE//r0hSA=@vger.kernel.org
X-Gm-Message-State: AFuF++lrKCKE4ktZKsN/DMOdxZ3+fi4o4RfVPXe30YvhLKh2VNhxHJE0
	/+EXJG7lvfNeZTd9iH8Ultr3BaXVRNE7+n/9dnZ5uZeqWncLPKHQlJNvvlJKgfayI2W5bxR4AmW
	JhTL/CKto6BJNP9XjZ06v6u428A/jEDQ=
X-Gm-Gg: AYBFou3ASuQ0yanE3tuW969L8IrLpj3vxUtj+++0hPmiEMcO5G1z9AeXe9uzsC6t96q
	Q0wymmcMVXEM9bGRXntEUGj+MkmLmtp5mrCW77q/aD9TwkLjkaOC5X1p9Rrrce9xWdTnXG0ohIA
	jaTYr+uoj/Z0kAnVUxqgjhaOJOmpCtRA7nyESop0QuIEvkYI1o1p1Z/YbBf8uBoMqfcbe0d54SF
	0H9VjPvAVLCXYbqwEUrehfQfQiKsIT4/JI9a5BpOi+3beBDmjdrd9c2OHGNOG93NAfLqSOHFD1X
	6y5Ra75klXi324McuP1M35OIAVYBL46oW0Tb4b5H/JWr9kOXMpXeWB/f/fcySydnAz/WFSEm0lU
	SHEMOWdErmgJ79m5OjgvZs9F+i0NUGj4=
X-Received: by 2002:a05:6402:454c:b0:6a1:b515:d2b9 with SMTP id
 4fb4d7f45d1cf-6a6831cf33cmr484617a12.14.1788304851925; Tue, 01 Sep 2026
 16:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <50d449ba9c3d1f6b694fafd82f2b3f72db63d202.1788277742.git.mattst88@gmail.com>
In-Reply-To: <50d449ba9c3d1f6b694fafd82f2b3f72db63d202.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 01:20:39 +0200
X-Gm-Features: AcwNN1V9d1XOE1ZXjAbtGAPkVmsAORaeREbPjoWNQZgz231Ab7OUnZnXsiGjBRo
Message-ID: <CA+=Fv5Rr-6VR=L3s8PcK3ogVUMhBLmVyRBqukR6A4cUeGGLL3A@mail.gmail.com>
Subject: Re: [PATCH 01/24] alpha: fix arch_irqs_disabled_flags() to treat any
 raised IPL as disabled
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Matt

On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> arch_irqs_disabled_flags() only reported interrupts as disabled at
> IPL_MAX, but the kernel is not the only thing that sets the IPL.  PALcode
> raises PS.IPL to the level of the interrupt being delivered before
> entering the handler, so a handler entered for a device interrupt runs at
> IPL_DEV0 or IPL_DEV1, and the timer at IPL_TIMER.  Interrupts at and
> below that level are blocked, but arch_irqs_disabled() answered that
> interrupts were enabled.
>
> Treat any IPL above IPL_MIN, the level arch_local_irq_enable() restores,
> as interrupts disabled.  This matters as soon as lockdep is asked to
> track hardirq state, where irqs_disabled() is expected to be true inside
> an interrupt handler.
>

Hi Matt,

Thanks for the explanation, but I still do not think that treating every
raised IPL as "IRQs disabled" is correct.

The Alpha Architecture Reference Manual, Section 19.1.2, says that an
interrupt is delivered when its IPL is greater than the IPL in the
current PS. Table 19-1 in Section 19.2 documents the OSF PAL IPL range
from 0 to 7. An intermediate IPL therefore masks only interrupts at or
below that priority; higher-priority interrupts remain enabled. Only
IPL 7 masks all OS-visible interrupt levels.

The 21164 Hardware Reference Manual, Section 4.15.3, states the same
rule: an interrupt is enabled when the current IPL is less than the
interrupt's target IPL.

Thus, IPL_MIN means interrupts are enabled, an intermediate IPL is only
a partial mask, and IPL_MAX masks all interrupt levels.

I therefore think arch_irqs_disabled_flags() should retain the meaning
of fully disabled local IRQs:

        return (flags & 7) =3D=3D IPL_MAX;

If lockdep or generic entry requires IRQs to be disabled on entry, I
think the entry code should first raise the live IPL to IPL_MAX, rather
than report an intermediate IPL as fully disabled.

Regards,
Magnus
