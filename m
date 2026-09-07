Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D2D3630BF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 23:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788824850; cv=pass; b=kgqrVH/O466qJn1hAThhBuHWOgX3dr5i9sR75BxRtR5Uh+sPXvl5OrsnfTxB3SKc8ZBWP6sbevkjLOvN9XNlzKNwpatAaAu+rStrAlvyioDfQ3RjQ4Y3laF+N+jIQkWBIPV1XgbX3qn8RF/bXzpQeNIbmm/M774Q8RcHTYPgA50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788824850; c=relaxed/simple;
	bh=2EyfSlQO0clqzumSKQfW/GYjtcW37BsCA4kY/zFACCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFBfyVUvKq+5IYgQSNtC+t/nHECuMyVAVRTl4x9fWE0Tp0oGD/5UjKbZc76SI6/d/mvpdEUsjteparL87dnTJtMpJ+p4wOA9KIx7hJWtsF0Bs+MoWkqBdIbY0MBr3jnZb0c3Oj3+UmYLBX9wVz1iFfSjxSjePyaxMxS73yEYQuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOvzJOnh; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOvzJOnh"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aec201b582so2096553e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788824847; cv=none;
        d=google.com; s=arc-20260327;
        b=mZBDo48b2wby4VL/hDNwynn01DS7R0awGJBpnYkGcZy7xrG9JYKsb135VljIN2HOxv
         KnPNzrLhSA2931I9C3BuLTYVxbr4ql7XTQDbqDvgBFwgaOIkJlHHni3Bsc14HZ1HYHqO
         cwfVmnfq7JsrD2zsL5zhmhUrois3aLvuXt825Pe1X/HpGCf0oW3il8oS2xNwhjdkxPSJ
         nW0uEQdCmccf1Oryhl7tByAtn6l+LG9nZdmZrfVH9bMDN5ULApl8Pqh96bnuGQqB3Ey6
         hFoJxhEBuJlDS1uS3dXZuJn0unByXiuO7SPIermB+Nu3Usnhrdc9sqkrl/5+b2yudm7s
         sD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jTCuKKWDruWBkfsdKrv4fLLGZb+hviUjoHhtnBESK6k=;
        fh=iOwuwLQ4iUCO/0nm2hzP0bBbmXPLodqZOoPXWsS/cco=;
        b=Wqppj68kj17AXkIYg/nJZJ46PP0bdI3+xms2Tr8e/NNBk3F6xXzoNdH5CDn/Wdkxel
         fUPDS2MiHLl4RX9GMLpA6qlDDTbMtmrWgx4+6FPik2iCkWi7JNP2sxCsqf+gUyS+cSQX
         IvCDKNQHr2av5n9Rpbm5RLK4nlE3WmHkBItgubdcMxzyhgjiwoa5YkTpie8Gn3ZnEKuH
         NSJlmL3ep8espdyMDeXlEd7JapMkRckw5rLGotxP5pT8NkHisTNOQWKNgxsIMquJIE5I
         LPLmPz17iiud98cb0IfY2T/ZAspNpR1EvVYYZ1djMWjys6lHqeKoUIJAV3AhuTjUuJ1k
         SBQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788824847; x=1789429647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jTCuKKWDruWBkfsdKrv4fLLGZb+hviUjoHhtnBESK6k=;
        b=WOvzJOnhsQSI/TxkbzukH3TehQUw6GU18hRoXdV6zAYqD3fpk7450jduCwiXnSnEIC
         uxkfYKlmkduvGgLdCXtKncHE4TekBPWa4ShCgFDItkiSfmC4YOOTci6jfelYIMDOkGsO
         K+PVIdQsbbI1+ClPg+pflpXP5lQ6P7G3aJMOnyIyO0Cu3nkAIwZLlJu15PfxhSVaISPi
         w44bMqTGsi/7gLS/H7rQJkpJtJmCKTS/zFDHfMsI1ji1/+mJjM0DINIDXIwA3BuJGaI3
         p1AzEy4Uu/YfZHYmYsiDYCiAd/apYasJVeVk9UOtLKV+9/QCvFvrghPVc9i/lv4C46UN
         7whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788824847; x=1789429647;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTCuKKWDruWBkfsdKrv4fLLGZb+hviUjoHhtnBESK6k=;
        b=S9Lygr55GS7JkFiELLwfE0VbthvNvcqDaHlae+3e20HIYniPwIGMEEv7CCDVJquxew
         we94aGYqbns10sAC8zsb6FmQFn/UuahpSVPDtpBJJ6pIRb4rol2NgV2uR77YGnG+nk2G
         s/l88kLRHS1DxYRiVZc1yOvDzkF6nEyreZPU6IFWkCxyy3FQvsYA4dJmboqDBcVZAn3N
         +m7JYSTtyRlidNdB2o0ROF1iLSmywgPGM4TzSQXy+rvKnac3w5crrIkN53iVqqGDnLs+
         rvfoksNgRjpiqzUrwBiG9Q2Z4s+ONcEZKOO82EQaoNJ2eeK9dRlCCkZUX4WXCCgFb3K1
         xvnA==
X-Forwarded-Encrypted: i=1; AKwUvBzKFBqm5mM2VzL2IUWUl9N56u5nZkuziOXwx68rvnqrY7XHf799zjmHS3WrZAtWqNV02k89Sbl3/o+4RGY=@vger.kernel.org
X-Gm-Message-State: AFuF++kisJtbDdu18tUR0iWOmqNojrWHT2Jh7dSkr2HItdtGy/VnFk5e
	LZXCDLB/oiRM3pGR6/vQhIRw24i2ZxBYJ7DNDNwanZfn3zqo5KriMMzxUB6iLfMtVI7lbVjwJxY
	0/ihT3v7M0sDpt2eN7wuwcj6JwAYrFf8=
X-Gm-Gg: AYBFou3x8wXSLTOehqcnile3eG01F8EeHGL/vE0ATJ/4T2G3zm6y9BBXAClCDCygFxn
	EW1mqsq9L+FCpDiuE2hJj4K7ZAssQMY7t68iZ7VOkl1vL1SdDteQy9U1EYafil3VorJo4DjJORl
	nhrO7hk9RTKNdky/TeGUQUwr+m9si27sGxFFab+M9B79MBhl/266gdsVjbdFPqhZ8SZTq7E8/ov
	lcfd2Epo7GJ69oDYLSFlRVbz0JbZvH61RHYmDgBd+ZI+RXoK0FlAIL1A9/kvIT02jrwLK++X7ik
	lwz7prLFPnKdlDroq2liBVaA0si6uUCMIxcZhyCdE9ZI9g==
X-Received: by 2002:a05:6512:159c:b0:5b6:184c:7da3 with SMTP id
 2adb3069b0e04-5b6184c7f4bmr3704951e87.44.1788824846969; Mon, 07 Sep 2026
 16:47:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEsQvcuaNZvLxyxNH_NOy5qwTmkrk-A9QdVtZD0GiCtPwk4A+A@mail.gmail.com>
 <20260904182023.4486-1-hhkieu@gmail.com> <CAEsQvcuMFt=m=njsPzRtKarz04Gwbds+f8p2S+SdSQmaiW1fLw@mail.gmail.com>
 <CAEWo5SpV6eyHo-tn+hKX4s98uCjGJg5Dz9fMkoWNDNqgofJ5og@mail.gmail.com>
 <CAEsQvcsG_Q2uZQ8Q_MBhUyhY+n4HymMsuowSHfk-CHCBj6mbzQ@mail.gmail.com> <87pkyp335m.wl-tiwai@suse.de>
In-Reply-To: <87pkyp335m.wl-tiwai@suse.de>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Mon, 7 Sep 2026 20:47:15 -0300
X-Gm-Features: AcwNN1UbsFMatNHx-EvOf31Raf8TPF1FHo1fYOxEv7oO3TuMZ2Ndt22rR4QZ3VY
Message-ID: <CAEsQvcuZm_1DmR8gFGi3ec6++Eo03ruUJHc-RxuqaWKh8o0aXQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: add Pioneer DJ DDJ-SZ support
To: Takashi Iwai <tiwai@suse.de>
Cc: Hanh Kieu <hhkieu@gmail.com>, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Mon, Sep 7, 2026 at 4:57=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 05 Sep 2026 08:19:37 +0200,
> Geraldo Nascimento wrote:
> >
> > On Sat, Sep 5, 2026 at 2:35=E2=80=AFAM Hanh Kieu <hhkieu@gmail.com> wro=
te:
> > >
> > > Hi Geraldo,
> > >
> > > I looked further into the is_pioneer_implicit_fb() check you pointed =
out.
> > >
> > > It seems the DATA case is intentional. In the original Pioneer DJM-90=
0NXS2 work, Fabian Lesniak described the observed behavior as:
> > >
> > > =E2=80=9Cthe playback streams also tries to start the capture endpoin=
t as sync source.=E2=80=9D
> > >
> > > https://gist.github.com/flesniak/074ab23bbc833663b782f44174eae6a4
> > >
> > > Takashi Iwai later formalized this in the Pioneer implicit-feedback h=
andling, explicitly accepting either USB_ENDPOINT_USAGE_DATA or USB_ENDPOIN=
T_USAGE_IMPLICIT_FB for the secondary IN endpoint before passing it to add_=
implicit_fb_sync_ep():
> > >
> > > https://github.com/torvalds/linux/commit/167c9dc84ec384c0940359e06730=
1883ad2b42a8
> > >
> >
> > Every other Pioneer device has that USB_ENDPOINT_USAGE_IMPLICIT_FB
> > on the IN endpoint. Yours would be the first without it in the IN
> > endpoint. Unless
> > your hardware doesn't rely on implicit feedback for syncing then there'=
s a good
> > chance that implicit.c short-circuiting and still picking up implicit
> > feedback for you
> > isn't correct, but what you need to do is cool down now and wait for pr=
oper
> > maintainer response which takes time.
>
> Accepting both DATA and IMPLICIT_FB usages is intentional, yes.
> But I don't follow what's the problem there -- in this case, the
> bmAttributes of the secondary EP shows it's DATA, no?  Then this check
> must pass.

If you check the original patch submission by Hanh, you'll see he did not
bother to include USB_ENDPOINT_USAGE_IMPLICIT_FB as a flag for
EP attributes, claiming it was unnecessary and the implicit feedback was
picked-up regardless.

Hahn already traced the functions return values, he is getting a true value
out of that function (and thus picking up implicit feedback for his device)
even though he does not add USB_ENDPOINT_USAGE_IMPLICIT_FB
to the IN EP Attributes on his original submission.

>
> The condition is:
>
>         if (!usb_endpoint_is_isoc_in(epd) ||
>             (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=3D USB_ENDPOINT=
_SYNC_ASYNC ||
>             ((epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=3D
>              USB_ENDPOINT_USAGE_DATA &&
>              (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=3D
>              USB_ENDPOINT_USAGE_IMPLICIT_FB))
>                 return false;
>
>         return false;

Yes, and that means when that first inequality is false, C short-circuits t=
he
logical AND and never checks USB_ENDPOINT_USAGE_IMPLICIT_FB
like it should.

>
> ... and maybe it's better to be rewritten like:
>
>         sync =3D (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE);
>         usage =3D (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK);
>
>         if (usb_endpoint_is_isoc_in(epd) &&
>             sync =3D=3D USB_ENDPOINT_SYNC_ASYNC &&
>             (usage =3D=3D USB_ENDPOINT_USAGE_DATA ||
>              usage =3D=3D USB_ENDPOINT_USAGE_IMPLICIT_FB))
>                 return true;
>
>         return false;

But then, again, you would be disregarding the meaning of the flag
USB_ENDPOINT_USAGE_IMPLICIT_FB and in practice just making
the first check.

>
> So it should return true.
> Please double-check which test actually fails.
>

The tests don't fail, the function returns true and implicit fb is engaged,
it's just the second test never runs.

Should Pioneer release hardware in the future that does not need implicit
feedback to be engaged, provided all the other particulars are equal, this
function as-is would enforce implicit feedback on a device we don't want
it applied. It's a bit far-fetched but do I see what I mean now? Do you see
the logical error now?

Thanks,
Geraldo Nascimento

>
> thanks,
>
> Takashi
