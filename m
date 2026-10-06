Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08023B7749
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281221; cv=pass; b=Y+yf9lFsQYAke+XwG8Z8em3/benUciS2ocrEyzcHX9N2my+4wAtPoVXMgPs5Ru2t7yQNv5tTlm66aw8Km9Ldb4BGrlTQMvEYi+wWhZfrAev5z2rm59+Lcp2vvTuBy0Hnd8PvF0SC5ti24WPzts+f//MiYg2DL+3ynlYd4t4KvCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281221; c=relaxed/simple;
	bh=jXoCJSmZrRsEtjPvzR6W3LtMbjIzm96pCRvUzmkQjw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mxti4sO4AClEtvqkvBghX20dM2NTJHZO3UJvITMTxySvDRzTa0T8JMTpZVLANBwEmT/kg5QQMtbnBesGyWdrozcC6F2+tSAKbrKKhaIdofvl7tZ9PlFCXMlXzVbsK0VUVOWKC6VWy13stnrOsJxixIP6qmNwsE9FzDIKq8jIt+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQvktCp8; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQvktCp8"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35127e848feso672490eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791281219; cv=none;
        d=google.com; s=arc-20260327;
        b=Ch2gHHCQhrlKk06LMuhODd64lJcZvE6sn5g07XSPBKh84SX/IWhX20EZbPlSdK1o63
         VRfNEfb8Kt/7APtyygtpp2bmumjBuOXUlCbCacrPVzLDRvohnfUMqOR0uqjokdEOjwIK
         pVr4ItvQYc67S0pdfVulaf9HqZKwPBDPRn3QcR/jhv0YCOdANNS44azN4e3+kT0+1ILb
         tgpDXYB7+3+o4W4Fe/p4FRN2zwjDP+m70exOnqYzukeXnXXi5YufCTpeWdiUfICNi5Va
         LCdeeQoZnIH5HIWLL3M7fzZePKNtUQpa0POsg+p1foBARq4dv+gVcvUa3VMVWYwewU4Z
         EZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6NBVbMbxanh8syK4XzpA91skjBSLQAwKVvNkTlGCE98=;
        fh=CQrNcCwaWM9hRjmjOLyENkJ+/7Ab4vojmN9ID/AP/Tg=;
        b=CPBzo+E3pTvLhysw/BVVlv9JgJKUV/1kjgEpDA215YH6Sb7pakWQg/efEq+CZZsTDN
         MCZ9IpMPrKgEIkKLZWwvGh08S/QZpjfog8bPJQMXGqcDRsMTGSn+pMpOB8+Lwlb5FtHO
         HBo9OKOwQnCScC7HcnsorU3WRXmvTYPTdON1vEcuK8m/1UARcA1AHRR+fsPiEvdmhjDx
         YkjzcuzBCJMl2caFJEOMgtzHNNp8QVrBFM0PafQbvzcZQwbh670x2lmxuxO3gcZIpUT2
         0OII32AWnaMipLAHaCqcp2z7LJ/kGiapNOnt7HFHj+csJRRzLwQkLfDMZtywQBG1PoUL
         Jb2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281219; x=1791886019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6NBVbMbxanh8syK4XzpA91skjBSLQAwKVvNkTlGCE98=;
        b=NQvktCp8eEOXlgz+kjY7UmNhYqTf65ja4qKCDyllIKb58fSr4ZdIiBp39imPIIKEAM
         +zbscR9PG+akcAyWbw5+NtFT/UG/2SXz/b0qJtNrgT/vOQjqyh3DOh7gzfycr6d56T69
         Zy7V1AJe8Sy5wQkqmE+5fGgjpAjsRG3ul6sVyVrhbfdJXCgyEaPdKGXNCEJVb9Ti8TMh
         b2d+WXnjzoKpmbb8XpWrhvmNMwijSNYxMpYAvr5h8xk6qvWoh6Il9FVd60VQnRwg9Zs4
         2DWCkNHylDfGFw266DXaY+uy/D9Wo94FZz5LZkn/W6OJk1v6+he0ya8LEWD5Z8uiOzMF
         LGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281219; x=1791886019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NBVbMbxanh8syK4XzpA91skjBSLQAwKVvNkTlGCE98=;
        b=jB+nAYFp/vyev+kaBjx+wRnSJ60x7sNsIvjvTmT1O5L+lg8Yodk7NLvbC1Yvfcyt9T
         1BcWjrif/vUo6AaGxG+F/tvyG8xkxhy5gaqUWbvneGGN4DUqhPpVsSKqq4U+L0pE+gwF
         klMIqlDRA/UKXwdWdZGI8gyTvHhdbaUNjHR1ouyCvJWKzwqzM1Sct2YB0qIN8gmJhVAt
         69srJI5YgjBA/RKwazf2TSt75ZQk2PFnuRwzNeFuUqrLUJ0cPseBMTWF24tm9PymEg+3
         V7nHjQeq1ylmgO5xXYQU+BKsO/kBvnVkDRkGrWrJ+1zKguyjxAE/S7JgufojNp+PRbj+
         NVsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFB40maOkDUPEaovNoMDEnZQ284wOOhYHJSttklFHjNWMn4pd4YgHLeny7XGIvomkWmN0bhkhjs3PuqRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFYR3grx+afXBoMcTLonah1X2RxTBXpNwCq0aN240CPcgtzLOA
	dmE7x+py0c3Y0je5cGDyJFym8I4znoir5lRCy/xFuKduh+frHr0hvBK7DMAeOx9VzV0kBZDT1ml
	grEBFXdO+MoTjkpgqYhLImq/ReOF4OoA=
X-Gm-Gg: AYBFou1oLAT8t4petiBQ5/NYJqr5ds2JoO38dWUTJBpbEgNmubTYvrcSq3/pluUgHHN
	sN2WUVjngELIl4nPdto6QZCuXFBWAz2tokxOnRlWDFMdGPSoWq6Ed3dDVm6W2hcn7/zNtVXmVnf
	gNS4dBRRepF4Z4+ZhAo8j/VpC02og8BwIkhDLa5wOyA2w0gMWVQajvK4/PvFNgi41u+pEGYhGwB
	T+fSxyH8fhKctihLuOB0Crdx5P/T0VGXbBY/9Oxho3jPICTzjdTs50lDlzuhINUASwOTNLc020q
	TY6oNSV9S6IdwzjTupXJLKmzNUQi8wOIeS8Aq+knw6LoksQfG0QYisazWHY4m8ybZaGSyFOAYts
	qLOHXUvjtA7esJ8ZgkhSt3W4=
X-Received: by 2002:a05:7300:fe83:b0:34d:2c1a:9881 with SMTP id
 5a478bee46e88-3514e2e4731mr1077709eec.36.1791281218726; Tue, 06 Oct 2026
 03:06:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004164121.193514-1-clamor95@gmail.com> <20261004164121.193514-3-clamor95@gmail.com>
 <asPVmbvyslGgEsjk@aspen.lan> <CAPVz0n29+1yOO0i057RdpUAu+z85hhnm9GGaHkqgf5XW1SPfeQ@mail.gmail.com>
 <asTBp2RPPvsD4AsU@aspen.lan>
In-Reply-To: <asTBp2RPPvsD4AsU@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 6 Oct 2026 13:06:47 +0300
X-Gm-Features: AclHuK9B4BcbljbuUp4qHu8_KC4fu9LyfN3Q8g8blEUDDcIte_SIuNY9L1q_5iI
Message-ID: <CAPVz0n1PMxOoHMJ3viKa-e3=tjZ6AtzffjnHE9kCFrz1tjezOw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mfd: aat2870: Convert to use OF bindings
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 6 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:38=
 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Oct 05, 2026 at 08:18:31PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 5 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
9:51 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, Oct 04, 2026 at 07:41:20PM +0300, Svyatoslav Ryhel wrote:
> > > > Conversion of the AAT2870 driver to use OF bindings requires a few =
complex
> > > > changes that should be done simultaneously.
> > > >
> > > > The AAT2870 essentially provides two functions via child devices:
> > > > backlight and regulators. Both functions are fairly self-sufficient=
 and
> > > > may not be populated on the final board. Consequently, the MFD
> > > > registration API was replaced with of_platform_populate(), and each
> > > > sub-device was given its own compatible string.
> > > >
> > > > Additionally, aat2870-core utilizes an enable GPIO. Obtaining this =
GPIO
> > > > was converted to use modern gpiod/OF helpers, allowing the redundan=
t
> > > > aat2870_enable() and aat2870_disable() helpers to be removed.
> > > >
> > > > The aat2870-regulator driver was updated to register each of the fo=
ur LDOs
> > > > from a dedicated OF node.
> > > >
> > > > The aat2870-backlight driver was changed to populate all required
> > > > properties from a dedicated Device Tree node. Its channel map was u=
pdated
> > > > to use u8 instead of int. Furthermore, because the maximum current =
is now
> > > > parsed as an absolute value rather than an enum entry, the calculat=
ion and
> > > > application of the maximum current were updated accordingly.
> > > >
> > > > All of the changes above allow platform data to be removed entirely=
.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/mfd/aat2870-core.c            | 115 ++++++----------------=
----
> > > >  drivers/regulator/aat2870-regulator.c |  76 ++++++++++++-----
> > > >  drivers/video/backlight/aat2870_bl.c  |  55 ++++++------
> > > >  include/linux/mfd/aat2870.h           |  95 +--------------------
> > > >  4 files changed, 111 insertions(+), 230 deletions(-)
> > > >
> > > > [snip]
> > > >
> > > > diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/b=
acklight/aat2870_bl.c
> > > > index 8b790df1e842b..933a8f728f66a 100644
> > > > --- a/drivers/video/backlight/aat2870_bl.c
> > > > +++ b/drivers/video/backlight/aat2870_bl.c
> > > > @@ -15,11 +15,19 @@
> > > >  #include <linux/backlight.h>
> > > >  #include <linux/mfd/aat2870.h>
> > > >
> > > > +/* Backlight has 8 channels, each bit represents one channel */
> > > > +#define AAT2870_BL_CH_ALL    0xff
> > > > +
> > > > +/* Backlight current magnitude (uA), 450uA current is eq to 0 */
> > > > +#define AAT2870_CURRENT_MIN  450
> > > > +#define AAT2870_CURRENT_MAX  27900
> > > > +#define AAT2870_CURRENT_STEP 900
> > > > +
> > > >  struct aat2870_bl_driver_data {
> > > >       struct platform_device *pdev;
> > > >       struct backlight_device *bd;
> > > >
> > > > -     int channels;
> > > > +     u8 channels;
> > > >       int max_current;
> > > >       int brightness; /* current brightness */
> > > >  };
> > > > @@ -30,7 +38,7 @@ static inline int aat2870_brightness(struct aat28=
70_bl_driver_data *aat2870_bl,
> > > >       struct backlight_device *bd =3D aat2870_bl->bd;
> > > >       int val;
> > > >
> > > > -     val =3D brightness * (aat2870_bl->max_current - 1);
> > > > +     val =3D brightness * aat2870_bl->max_current;
> > > >       val /=3D bd->props.max_brightness;
> > >
> > > What is the purpose of max_brightness?
> > >
> > > Normally it is used to limit brightness but max_current is already do=
ing
> > > that. Is it just being used to reduce the number of steps in the
> > > brightness scale (and if so, why is that useful)?
> > >
> >
> > This is the original driver behavior; I did not modify it.
>
> I can see that but the parameters for these (rather dubious) previous
> behaviours are now being copied into the devicetree bindings where they
> become stable ABI.
>
>
> > The AAT2870 backlight intensity is regulated by the Main Backlight
> > Current Magnitude register. It has 31 steps from 450uA (0) to 27.9mA
> > (31), so even setting max_current to 0 will not disable the backlight.
> > The max current value may be limited for some configurations, which is
> > why this property exists.
> >
> > The max_brightness property determines the maximum number of steps the
> > backlight can have and is mapped to the available current range
> > provided by the hardware. The backlight is controlled in steps, not in
> > uA.
>
> This behaviour does not match the devicetree bindings documentation for
> max-brightness:
>
>   Normally the maximum brightness is determined by the hardware and this
>   property is not required. This property is used to put a software limit
>   on the brightness apart from what the driver says, as it could happen
>   that a LED can be made so bright that it gets damaged or causes damage
>   due to restrictions in a specific system, such as mounting conditions.
>
> Hence the question, why is the current behaviour useful?
>
> If I understand your summary correctly the hardware has 32 steps
> including 0) and the effect of max_current is to ban all brightness
> values greater than max_current / AAT2870_CURRENT_STEP.
>
> If that is the case then max_brightness if fundamentally broken because
> it's default value offers more steps than exists in the hardware.
> bd->props.max_brightness should be set to max_current /
> AAT2870_CURRENT_STEP and the whole of aat2870_brightness() should be
> removed (use backlight_get_brightness() instead).
>
> IMHO the patchset will be cleaner if the weird max_brightness logic is
> removed in a separate before doing the DT changes.
>

Noted, I will see what I can do. Thank you.

>
> Daniel.
