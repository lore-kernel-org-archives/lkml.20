Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792953178;
	b=SerVy6Y0ic/Wi2WbVlALH8hmXMHq3xk7MjE0UB3pWHHLWvmlYbPwIY3fc+Q82NCjxDcE
	 jS5KGjtf0b8kRNrsclUOAFR8mZZbxDwWQ+ltsteTVRmk3x+kQmdQJdVJA0lgZuvoDOXxe
	 atCzVGX/RaEa/kX+3j6YaCM14wYpdbHZxMSoBcdHNhrZfrsaf7BY5e95aQXQ2Nj6PYyZ2
	 +d/M28mxZfL6SGiArNQdYooeVOjujp5DRgRa9WTKbf3oS1THTCEe7LO6KpD5RD6HLnN+1
	 Rf54aIbjm9nyBJccoz/86MDL/WntBVEW/Hihc1qX+0UFkUch6ilcynBB29x3Z0I0D1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792953178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cHnV8YcGeqlxYOjKsLG51tneNJM+mDCweNekVpvy4Xk=;
	b=LIqaGpViow458Qx0xxU+OKRQxgp04kdp0fV8xyTgmm+BbvtOecydb6g/9e+H1sYWIn9j
	 eCCheUGAOYaeECrRfGdbg6bHUZ+1g5zLpDZPj5mhtMVAos5XOUihgE7ZSelhijWwrXlDH
	 p32FJ9EL2pOyJIVQagbmgJg36B0AGCYhhQl7qG+fVNJpfI1wKf3XJnjT/TMdhdfqC3nOf
	 rlex2PuRp1iYX6qq75grKLQFA5L0l2Y2TXTTo568jWVv4QwY52uXHCJszsjGf9UnrOXYj
	 54Rkyv8vWfmQiTzFv2sYaHV/K+G+taqskRfAqDoIOJwBIbRN/oCVi1e2wFoHQP/66vQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TkdaEY20;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFD1606A323
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEFD1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TkdaEY20
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso341613266b.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792953176; cv=none;
        d=google.com; s=arc-20260327;
        b=Yoc6xqyL81+upMCMIjSLD5rNNAaO3lqH3bjl/xexPWeyfpO3KZIWZDNwM9HG994TRR
         H61N40X/O2KuDsBCm7ePAxJARz5+hlQDEE7W8X8wdLlVBWZXRxUnvAi8lBm1VlyAdaSE
         YJJiO37toIb8DND2nU4Oa9sEkhiS8BUYFi02Xre0fbnWgfLqlLi2petaBw9UUBo3Bsms
         z3sLPvKkKhz571BvloR79RrJP14uw25cG4YnNR+zUzkdFIOpEZxU3gN3HnSdmRPxpcEH
         8khPLPvH8UFPZ0l63BXKxI0Ltx4U1uMM5ooYXQflCdAxjxXx4+2ODl7B2Rch1WN1pDe+
         7DHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cHnV8YcGeqlxYOjKsLG51tneNJM+mDCweNekVpvy4Xk=;
        fh=CwFb9oR1yehks5zSR3D+LcaY0ZWy8nWF2rhX2u5ToxA=;
        b=SLswFi8R0BGO+7FfgMZxkO7YMiH3q0lfjY9wDJnvib1XpkchLSQTfLKaC25/qAD5gQ
         0BzqSVocZsU5M8+FZ9gkdaA2qLs6z1Zdv8P2OxS79/o3xlq+EsIsvCnY5bqIC3P9SSUt
         ymr1/Rhq4Q7HVgabdKuKp7VBdsD1Fv+2j4dawo6GCGOzjYUOlCTaG7PSCvZ1iZjxVIOt
         qkCF1Rm45Av1Mp099y2sehLQTxjQVoQqeDW6mP51UzuffrN2qsASPoTB4g0jCAOU5Nqv
         PGmd49XU5Ot7CS4pvKiZKRE/BL1TFeQMGQKpE4Io7q23JSyZHRaYISAxO971F7Oq2C/L
         o+mQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792953176; x=1793557976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHnV8YcGeqlxYOjKsLG51tneNJM+mDCweNekVpvy4Xk=;
        b=TkdaEY20As3ISZFDUG5YHBlqBF3FD75KBS8Dw858E6znrd6AL1k95VE6R6Q7HZbfF9
         DSKPFslUfFhTEwjGkHSPM+NwsZ7PabiuQFPNbz5eDr5SDdGluFzGFaqNf5UrnX7ZPQsn
         NxbWVh9zz5bIm/D2JNv5HkbXCjKdAZBdKqxenB1EDCU3AiIBoeO1uFvfv3hTMRaIsIjf
         uhUNjUKHrySYnSdvjDzoLkhTPsBhO0nwL+AdZ2uSgfSeTAngUhF7SMr3zF+bKZzhxWPj
         jbHDz6FVt0FUMDdGj/KW5gAkwdwADbmz2u/WLu0F8X91yfbkYQlLTivMSmAIwoDLfEwr
         FvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792953176; x=1793557976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHnV8YcGeqlxYOjKsLG51tneNJM+mDCweNekVpvy4Xk=;
        b=I3S23I03r4Do94YrDk+uxh0hjjZbAwbMuN44TYYm7y2OIrHfRsEkWbW72kmFgogc/A
         M54Ej42L1eG+IOg8zcWbU6eIIcWAjsmylIQn48ZqA5Y1UASCeH/oVlexUyuN5LkkCOKR
         LclfuTyfc9IFkYkvAAVZslDLDJQ8mcnAD5YUg2oM0lADBxorEDE8wzM07aPmMIHSWcKw
         bqp5zsBR21ZP91Z5S0Te7gD4BrpPtE/pMPxLeUkpMW8tRWo6CWO6la62GE9GNZY6ZQbK
         1XwAY6l5auhgiotoXG9PRUt5xjurV+vaOVo6ELp3P3wWIk2NK3n38ZdyCBFNzCb5uRB4
         XpKg==
X-Forwarded-Encrypted: i=1; AKwUvBwQp6BrEXvjg7Kw4lKIlP9xCD+97/HgpfLvp90I3fWzTi0hev+psOxLsnVDB21DAoEbZpBQh6dxfGbc8s4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUHItBLqbRDeEvaflZVJPAQnfuqDieVc9rbKV/MVHlJd/3Aklz
	VWL+HRGNV0wHupDyQKpuo5GIR0U5Wvgqk0wW4wX76ulMYoLTeACOznvHk9gPPCToIbd2Da8vD0g
	xkO2GldOU/AmKpjFNcujF35C3PE/8kCM=
X-Gm-Gg: AYBFou0TKaEERuyWUqAFCFneJk449u9OL6vREdhIkwhUhIt9P/uu+STRE10q+ievTz/
	asiXlaA+PiBT5ugSrQOWI8a+b/mS2eURYbIM3sK+uKKKhJ7jG/MJ+DT4ewLkdYgqs7bUQu+a8JY
	jiRrp32gcCl9PELL0dQ+Z/X0IjdoJ9PvVClg56E7VxBrp/+Cq/xtJTElGUYBx3ESBkLl0/Nxdgl
	DGY6V8SUhCcyDS4TrTWag1zK5osFUuutPrqaWywIS7w8ffBdp9WpGN4oZN3+qydCENil6giFX8c
	qfSdkgVxNq1xJ+gG6dfH3bl4IMMpAJOJWXBxbnHvBtbxraYAMDbtMkLPK+WnNrq8FcS9Vxhj05l
	hhwIQQgrI5xUJfdBa9QDpxFROVaNYn5IxUrnTSA==
X-Received: by 2002:a17:907:3faa:b0:c24:6f60:3f7e with SMTP id
 a640c23a62f3a-c46bdacd03fmr618060466b.2.1792953175995; Sun, 25 Oct 2026
 11:32:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024140854.25664-1-a.shimko.dev@gmail.com>
 <20261024140854.25664-3-a.shimko.dev@gmail.com> <20261024-dw-wdt-shimko-v4-resume-imbalance@iav.lv>
In-Reply-To: <20261024-dw-wdt-shimko-v4-resume-imbalance@iav.lv>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sun, 25 Oct 2026 21:32:44 +0300
X-Gm-Features: AclHuK_uk5ewP18MJ4wJQiIWyDu_xkRz4DfpyBdkJPDFnOGsejWdEyAsYxw39Eo
Message-ID: <CAOPX745u-2S4V_HfwPjkeiC+SLn6Z1GxQOTE3SqMFX75eZRKTw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] watchdog: dw_wdt: manage reset line during system suspend/resume
To: Igor Velkov <iav@iav.lv>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, p.zabel@pengutronix.de, 
	Sergey.Semin@baikalelectronics.ru, mika.westerberg@linux.intel.com, 
	andi.shyti@kernel.org, Tzung-Bi Shih <tzungbi@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Igor,

On Sat, Oct 24, 2026 at 9:46=E2=80=AFPM Igor Velkov <iav@iav.lv> wrote:
>
> On Sat, Oct 24, 2026 at 05:08:51PM +0300, Artem Shimko wrote:
> >       err =3D clk_prepare_enable(dw_wdt->pclk);
> > -     if (err) {
> > -             clk_disable_unprepare(dw_wdt->clk);
> > -             return err;
> > -     }
> > +     if (err)
> > +             goto unprepare_clk;
> > +
> > +     err =3D reset_control_deassert(dw_wdt->rst);
> > +     if (err)
> > +             goto unprepare_pclk;
>
> If clk_prepare_enable() fails in dw_wdt_resume(), we return with the rese=
t
> still asserted. The _deasserted devres then asserts it once more at unbin=
d,
> and on a shared control with deassert_count already at 0 that is a WARN_O=
N
> and -EINVAL; the next suspend hits the same. Deasserting before the clock=
s
> are enabled (or on the error paths) keeps every exit balanced.
> Not tested on hardware: I can't make the clock enable fail.

The official datasheet DW_apb_wdt_databook says:
The reset must be de-asserted synchronously after the rising edge of tclk.

That means we can't switch the sequence of clk and reset in suspend/resume.

At the same time, we can't do a deassert reset in the error paths by this
reason as well (when we have errors in clocks).

Given this, i think the WARN_ON on a clock failure is a minor concern
comparing to violating the hardware synchronization requirement. I'd
prefer to keep v4 as it is and not to send v5.

Best regards,
Artem
