Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7892629B795
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309233; cv=pass; b=oF/+Jt0x+UcbfnGxeCUsWnWkv8ENguBMcRIxgFdPiB0RzRmVlpeA0ESfaxoimRZal8ZchSpr7VjP34M3u4LIXVxCb/jZi/tWi9u7jz+SHFrItfOgmv2m11+usCEmy2kw33NmsM/kpBBMCilX2VSiOe+4ODLLbgrGFG8tXbGbEwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309233; c=relaxed/simple;
	bh=iNH5cBPj5R6PgQA/TFvew1uzSSWMiMYGGjLD0JtSrhc=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+ujGP9uDXVhQQQredB33HyEM5MnKOqnHbhxSXxOtMENt3B6X1ua/0dwavlj3KpWYV4pYx+Kw7lyngip2z1RtVJN/rPT9ciJHf3idGTIJ1TaNq1PQwSlrxBpar8+6kAAROpT6R8Eg6EHCHFPEbGSTuwbcrckhLC9Y86GIvDpo+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUMPJJZF; arc=pass smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUMPJJZF"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9851592ada1so276904241.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:40:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792309231; cv=none;
        d=google.com; s=arc-20260327;
        b=VI/jFWxwWQSpHVxVF4kKxHA2S97aycLtQVB73X3TqjRWpJSijIk9XepG/W0m/rqDNh
         8tMW5meMVSD3F/GPy2Bgs9loGKpNCWcT7GLRbFwfTvl8PPt+UaN7kihi/tzUY9EtyKB7
         bkALkcMaA1EsnyMus4NwlBuNZo3y1yuVtKl7ZJouiI004UaR08yWQYGz+6B0z3eGxt/4
         Y4ePLYHeVabJPO2gJKoByvBLEhLwwmwUwjeCw/DstpHpUM0ptcgwDe492zELDhV6HGen
         NRENEUVtSB+pmHVyKFZATPNZ25uPqeYwVikzzQxKTH7aDQKNo0AHBuIlosbLT9F/HpIh
         og5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=PiknuQleKQZdkN7TMk/Fm0FoygQpJUvDYZ+IhR/rFZk=;
        fh=aiNNwAQV5Zq8v40Gj7p7rTvPGBV8W2nm3UEICrswGzI=;
        b=YtdBr6ujwKYFwL+XF5i3W53GJoJ+tGnl2GDSpUffluEHRrfHwxokw9Rat1T4D89vDa
         tWDv4AtWLbjiLAjahPUYe6N29IzR2hSr3rpd+eFNMHxJemqyCBXPjI2WPYa3La4oMxwE
         0jlL5TRIWiFY9AJ0iWGLPRAJ2fHLPXlOg7ARvokZ++1sxxnLBGHZ8Q7EImLPHjtKWIks
         Llr8m1juvzXFEj5smOIxha8DB4QaRQkCjf84giUakByYb8vyYbZH9fcBDdMKOokFofHI
         9RPTL8XHBRfs7KxszPHjVy7uSAA2t8lI+qT3nrpVwn6DT/9uYL86nxzd+Pd66sTDfhqO
         u2Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792309231; x=1792914031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PiknuQleKQZdkN7TMk/Fm0FoygQpJUvDYZ+IhR/rFZk=;
        b=dUMPJJZFUsHAqIAnqkBGj710qM01j0e9BlFqpmfzkJw1qVGbIZhDpfFnQpI6fM8DVT
         saAXD6X3RLz54C3eQWBrJnFUAImBTlaLeh66RibM1cDPC1aGprXRD63rWRMRI6hffWSr
         svdBszhHtGop3gEqr5ci13L2kOZMOTdtYzohlDNYsKL/XcpZAEgbXnuxryL0gbupd09l
         2QKXZTXG2st16+agn+sj0S2mKgs7oiV6dmyTItqBSDm4NmaXLGmFXFoFdbjJpNvWz6Uz
         sTFnVqF8v/JgrT+/D26cUIjg3dfpB2/UYA9MuFQpAH9CVZ+Jdf4haA23x8jSz6L7IX0l
         F3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792309231; x=1792914031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PiknuQleKQZdkN7TMk/Fm0FoygQpJUvDYZ+IhR/rFZk=;
        b=j1HIyKFbwFd6Ay+bMOi1hHYTsJ0RtdpdBoCbOKMBAXzw1XvG3mkOWAHaGgMrNiD20M
         OauGdx9aRgE1kVe1oMlUelXkGFIbJY87tfHL6wpwSS6DgOsW3z3m/uOHP0cHQn7GRPTc
         FNnpFjFJ5SZWzR40QGkWhZN5MJGL4Dk2aOXfplbLdDSSfT5FpLRqAxVYgbjoyrdP1cBj
         fvRgopmqTpUJB037t4pxIXECQgRCMuleg2lCatLA6c/LjNWlXYLxZNXPl8eEvAdmtkk/
         8MB+aZn2Gwxn9+WXuhzff3veH+i/Rxa3CLPgOkiIeWltG1jUYOdz57X1I2g1xYkTxqWU
         dBUw==
X-Forwarded-Encrypted: i=1; AKwUvBwkEZaj1rTBEf1Dm9VhjCc2TJSQmkdqIH7Mgc6D09gkSjdH/Di4XMOeZ1knYonRAGhBNE8YoqVLkw8sbXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpoBnK7/sOXb8vHQ9lzFqITnRYxFMehmC5/KBiA4/2NmT0JLPU
	20dfkyD4qTjiwfzTJFmxyF0E4s+ail3SA/3EFWd2fvs8Dcbchzp5NC9xmu/aDQAO8dAMf+Nedem
	pLBwxqH0cLz/0pu4rihZdbtQVAuJDnow=
X-Gm-Gg: AYBFou1mXce+xknJx7qCwjpNwZxz3MaBELHN2TZUXXpYE1f7gMDfnPNDk2tvzp/bqvp
	pP8JEhVZHhjuhr3p2bHYBmA3SXNq1GLzvpvw7WLXWIGZWLtz8NbdE7jUR01Ds7InaleOO4lNPxz
	WcMawESNMLKRmFR4bjNrBPCJIjtwNtVF4/5YfqhmvYNPh6Lg11n9afFjX05GzTsmFq3pVrE7VZd
	YkPm/Dwg3Xj/ZRa7n6/lP5iIBiPN6kBBc8Hs9/R/e7UN/llEq4CoVEepEk8Kr3p0UOMdI44odWL
	m2MshBOj7i7yowcYrd6ab0rv0lui15NMb9Ufmng5GDtzhn+rLGOLzqLZDbbHjdDhdQ4=
X-Received: by 2002:a05:6102:5346:b0:7cc:23e7:e742 with SMTP id
 ada2fe7eead31-7cc369dd213mr1367935137.21.1792309231278; Sun, 18 Oct 2026
 00:40:31 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 18 Oct 2026 00:40:30 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 18 Oct 2026 00:40:30 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Wenqiang Zhao <berringtoni36@gmail.com>
In-Reply-To: <20261017191310.3164205f@jic23-hlaptop>
References: <CAF2O-sPfK96Bvqtu-reg+y--nuV35tM57Med9irz_a3RK1xhsw@mail.gmail.com>
 <CAF2O-sO3OJH1sNnm0TkDXkEwWPKM21+s0_iNgU-VAmF+kMWtLw@mail.gmail.com> <20261017191310.3164205f@jic23-hlaptop>
Date: Sun, 18 Oct 2026 00:40:30 -0700
X-Gm-Features: AclHuK-OmAEWgu0Yh6eWar_vIcBjdibwFfoT4ZkuKroHrklemOgvlV5sMBQrDcw
Message-ID: <CAF2O-sPVdSPuwvGp8vrNNZ=y+pbBw5BkPniT_chHFPBWpVNeow@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] iio: accel: adxl345: propagate errors when reading
 event configuration
To: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lothar Rubusch <l.rubusch@gmail.com>, Joshua Crofts <joshua.crofts1@gmail.com>, linux@analog.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Cleanest solution is probably to pass a bool * in as a parameter and
> use that to 'return' the boolean rather than mixing up bool and error
> codes as it currently does.

Thanks, Jonathan. I have reworked both the enable-state and coupling
queries to return status separately from bool output parameters, and
updated the event-read, disable and link-bit callers. The 534 host
function-chain cases pass with UBSan; no full kernel build or hardware
test has been performed. I will send v3 after the final review.

Thanks,
Wenqiang


On Sat, 17 Oct 2026 19:13:10 +0100, Jonathan Cameron <jic23@kernel.org> wro=
te:
> On Fri, 16 Oct 2026 19:39:08 -0700
> =E8=B5=B5=E6=96=87=E5=BC=BA <berringtoni36@gmail.com> wrote:
>
> > adxl345_is_act_inact_en() returns either a boolean state or a negative
>
> Returning true or false to a function that reports to return integers
> is rather nasty and is probably what lead to this bug in the first
> place!  Would you mind also changing that as part of this fix?
>
> Cleanest solution is probably to pass a bool * in as a parameter and
> use that to 'return' the boolean rather than mixing up bool and error
> codes as it currently does.  That will keep the return value for whether
> the query succeeded or not.
>
> Thanks,
>
> Jonathan
>
>
> > regmap error. Applying !! in adxl345_read_mag_config() converts every
> > negative error to 1, so a failed register read is reported to userspace
> > as an enabled activity or inactivity event.
> >
> > Return the helper result directly. Its successful paths already return
> > 0 or 1, and the IIO event attribute read path propagates negative error=
s.
> > This also covers the adaptive magnitude events using the same helper.
> >
> > Fixes: 66a1af6d8a63 ("iio: accel: adxl345: add activity event feature")
> > Assisted-by: LLM
> > Signed-off-by: =E8=B5=B5=E6=96=87=E5=BC=BA <berringtoni36@gmail.com>
>
> > ---
> > Validation on macOS ARM64 with Apple clang 17:
> > - Compiled the three relevant driver functions verbatim with the driver
> >   header, using a host regmap stub for deterministic read failures.
> > - The original code failed 36 error cases; the patch passed all 53 case=
s.
> > - Covered activity/inactivity and DC/AC coupling, each of three regmap
> >   reads failing with -EIO, -ETIMEDOUT and -EREMOTEIO, enabled/disabled
> >   states, mismatched coupling and an unsupported direction.
> > - Checked read order, early exit and unchanged register state.
> > - Used -Wall -Wextra -Werror, AddressSanitizer and UndefinedBehaviorSan=
itizer.
> > - git diff --check and checkpatch.pl --no-tree --no-signoff --strict
> >   on the code diff passed with no errors, warnings or checks.
> > - The full patch draft also passed checkpatch with no errors, warnings
> >   or checks after fetching the introducing commit for Fixes validation.
> >
> > Also compiled adxl345_core.o, adxl345_spi.o and adxl345_i2c.o as
> > x86_64 ELF relocatable objects using clang and unpacked Debian Linux 6.=
1
> > headers supplemented by upstream IIO/regmap headers. This checks syntax
> > and types; it is not a full Kbuild/modpost build.
> >
> > No in-kernel KUnit execution or hardware sensor test was performed.
> > The checkout is sparse; --no-tree disables checkpatch's tree layout
> > check. Initial draft checks used --no-signoff before human review.
> > The final signed email also passed checkpatch without --no-signoff.
> >
> > AI assistance: Codex reviewed the event-read path, identified the errno
> > conversion, drafted this two-line fix, the reproducer and changelog.
> > The request was to prepare a driver/BSP/kernel contribution related to =
an
> > ADXL345 SPI/IIO vibration-monitoring project, with reproduction and che=
cks.
> >
> >  drivers/iio/accel/adxl345_core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl3=
45_core.c
> > index 6c9080d..5983fc7 100644
> > --- a/drivers/iio/accel/adxl345_core.c
> > +++ b/drivers/iio/accel/adxl345_core.c
> > @@ -1176,9 +1176,9 @@ static int adxl345_read_mag_config(struct
> > adxl345_state *st,
> >  {
> >  	switch (dir) {
> >  	case IIO_EV_DIR_RISING:
> > -		return !!adxl345_is_act_inact_en(st, type_act);
> > +		return adxl345_is_act_inact_en(st, type_act);
> >  	case IIO_EV_DIR_FALLING:
> > -		return !!adxl345_is_act_inact_en(st, type_inact);
> > +		return adxl345_is_act_inact_en(st, type_inact);
> >  	default:
> >  		return -EINVAL;
> >  	}
> >
> > base-commit: 9ee8306121495d2a25aa5d1bfd519f2748786b83
