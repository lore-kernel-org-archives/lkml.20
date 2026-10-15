Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DBF30EF91
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089707; cv=pass; b=Xtu6Jqvd4xT4MUZ2sTmBdIBdc3QqA/6ejDyub6X5kzBo1nf/oX52PLUB3BY9bUNCsxFpruaa4/UlwUT+pOAZ+aU6TAA6ReWChJMlSqfVwyDlQQjdau1n0enqhTrGi5r0obe7cbp8JrwqZ2BsW4DJvmYjZ5ZwFJVC9lrRQ0Adjb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089707; c=relaxed/simple;
	bh=xauoRU92rayWXBiUnhY4lqEI/RzVYWTkJ5X0x3hjblE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQW1gZbISfsF+zlNuqZec9P57ZpOdUSIoJRA7SbmHsK2Z/z3SIKkzh8UP0P5bxBAlDo/4yn8oRlpilNGUUR6H1O/P6Vcc3eZcotm4HPcnDjU8Q8zKVEF2pFv/K5ljrcPxqwJOuhutzK2He3/Ic/YdfWWq/G/O1q/I0HhhLfRdj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+x9goKG; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+x9goKG"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35ef6b49813so2522409eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792089704; cv=none;
        d=google.com; s=arc-20260327;
        b=p6PLRSPZfaGDdORU7Wc8TreuIordH6nYpKIQCWmbI5f8E4eqaOZOFNVxbVy9AwqDat
         LX4UOeZDWhpA45Ek1oI3/jadWos4n3GzhtdumJhgw+Gn9CcctrjEOJynXLfZZF9OLPFt
         4UXDwKD6YGMaoVlGM+MWD7W1hEDD1mwMB43HxH+7lR2vM70YMJJOTtFrh/Vvj5ZQa7X8
         +GL0U2/9wG1J6i/e0cZbb5JnPqiw4RxaSmhF6/J7VexMqJ61LZqZYSUbjD4U9Fl5sybG
         XXMooICL3+bobFZ4Mx/5F+NyaCEXRue/Pd0WbpvAh7VYv989lHgD9poEIiYvqpDxWwHR
         jy4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rsIPZgYgrzIClGBhGTKauA1e1WQnsO82rJ+gDiB7nEg=;
        fh=kR0V/ufxCovv0x9jujWmG8lVEIAldMx6z6yr35F2tdQ=;
        b=AByJYvUqs3sigtxGqpJrvnobxUvMdXGVgGDYvsnf5CRIuKu9cAZ079DZc2ZPjEvkQj
         ZeLzVvco4LNPEChl46Wj3ynNHGEEo6Qb0fgF4+I7E9p3HsGFYHy4hiCdM7bBwN7Q6cJW
         Yfv+Z0+ASgbvzLBFETy9LtpDB0cfgDU3k4TVaMOPjJcDZnwRUXjDVA7js+ckiElB80S9
         krRtLOqMAxWfZnGXmfHJVo0fLbt2BwizxST4/3BkSF9Y0UeLOpmD7XxwE+VG0p+9o7yK
         rjEoh0cCwOg9Ac2Iust6ShdUxfWbl0lNwgiszJ0TGs2zvcoLT9Tqe0iyPRzf2aYBstZ9
         B/2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792089704; x=1792694504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rsIPZgYgrzIClGBhGTKauA1e1WQnsO82rJ+gDiB7nEg=;
        b=D+x9goKGpfvnl9hCynIoU/Y+0NFqZ7WirIuX6nMhBfHcDA2HUKIJVwq665QzT/6/Ap
         A/+Lm1PdYvR37sHqfiRmmbNUORvFIIqxOzbKh1NPcc9zHysO1RKfLlxwVDQoPLblq2BS
         oYRsCOP/iKDu9u7N4MRx1K2zgUKTkrr7oj0dHgtC76Dp+qycvi7ewwrGSe6r7RAsgwh4
         x15HDivoawBFaFdgcmvz5+L5fOTcV6n6Rxuq+wPN+O7o+0UuIiw5PyKLfWrUtlb0G9O8
         wIyrudOcUFKeZNt1XX0/P4qWEJm4QmV1xnN0lPQVDNi56AwZamHh+5OL5h8eaUxEhO/K
         EytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792089704; x=1792694504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsIPZgYgrzIClGBhGTKauA1e1WQnsO82rJ+gDiB7nEg=;
        b=QAoKRVbbgUP0H8LYnPthX0mm+rW2jvkF8DviXVZvvUjd3JDDEP9CvhyuqkYbqwziku
         wHkVthBqNSR7dpC6GDxV8XDR2wzwQEmMCtCfLQhgHN+CIEaVTnylczOZTpdeIGZVTne2
         ENeojp1UTIPGh5j9dNOZs16f/jj16yTjVcht5PqqAbfix2RzOtPsv3ltMioEaNGpD59i
         5kTNLrDuAtAmtW9A2AHKdnR5S9HQJmeS5JdqeRpoxPwebDpbkj5TX0E1x1gMdl3XidkB
         7+8yh/9lxVl2e5lmZMVttfcFFwpWlyTXm4DmoB/RfZvX606kFQKQ1uQrzWWKX4v/711L
         pdRg==
X-Forwarded-Encrypted: i=1; AKwUvBwgigE+VdLQb4PyJjIbATGAuA0AHDNQ8PTMrhxdcAvnrsnFzsgOE2knxIRsJ0gCe10Un5XTqH9+BS9wMuI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTtuDwvnNo1NiN7SgGtfBnP5bqFt5HeQHWM4SNwbk/CzxLIuWe
	3MMhcM4Ye6RjAXemcOOKIHeyLyiHRBLD2eG3yzVuZb6fCnd0kZ4oYpjZ37R4aihh5Srmy9XVl+F
	R2iGiKAEfxrMjTySfpQFpz6LTVQJ6CV0=
X-Gm-Gg: AYBFou0GpJ+OKko4f9bC10+ys9+2P4aBfJQVkk5Ovds9ffMo06JQiTuUt4WREh+kHCU
	ivRuPYwRkpJKMdXQu+DN7v5VdVk+bAcIgYtmUTghIZqJcwiBFtxhlLGNHFY3odvUoy6x0ZayGO2
	ALC4gXUnJl2apqC102YdwyUaGWR1+EN6SDcMKV1Tqa+Beo+8mv8DQiO1ucEO/YFdHtSNWlTSkwP
	DxtJW/JZ0fgMaRKaTozGE9dqmQI+KE1QhgVLRhoTLN3TurC2WJL5BjSkg7xx9ZiIKOSQCovdM2g
	XcdHUBA7FS1Kg/F5YB4TNnoqDJwdvg/f040eJFwjcDqRSWxp8fv2gI1sfH2blNW1fff6LUnZpRK
	eCTJHr8ISQWoO
X-Received: by 2002:a05:693c:2a12:b0:35d:2c2b:215a with SMTP id
 5a478bee46e88-35d2c2b2220mr10102451eec.35.1792089703889; Thu, 15 Oct 2026
 11:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013173504.451391-7-clamor95@gmail.com> <f26b6bba-2c2e-46b3-9350-0ba0785cf3ba@web.de>
In-Reply-To: <f26b6bba-2c2e-46b3-9350-0ba0785cf3ba@web.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 21:41:31 +0300
X-Gm-Features: AclHuK-9dwgzuV_rOZ05ZsN-0-b2YgDg6QoraK02oNxRoGvJeYL0q4NRa-SbCE4
Message-ID: <CAPVz0n2ubBgOGO5q4ZBYkw-eDSuNh-MpdBk7uoWW69m2QduSgQ@mail.gmail.com>
Subject: Re: [PATCH v11 6/7] power: supply: Add driver for ASUS Transformer battery
To: Markus Elfring <Markus.Elfring@web.de>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	linux-pm@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Florian Krischer <florian.krischer@fkr.dev>, Ion Agorria <ion@agorria.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:0=
6 Markus Elfring <Markus.Elfring@web.de> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =E2=80=A6
> > +++ b/drivers/power/supply/asus-transformer-ec-battery.c
> > @@ -0,0 +1,289 @@
> =E2=80=A6
> > +static const unsigned int asus_ec_battery_prop_offs[] =3D {
> > +     [POWER_SUPPLY_PROP_STATUS] =3D 1,
> =E2=80=A6
> > +};
> > +
> > +static int asus_ec_battery_get_value(struct asus_ec_battery_data *priv=
,
> > +                                  enum power_supply_property psp)
> > +{
> > +     int ret, offs;
> =E2=80=A6
>
> The referenced array provides unsigned integers.
> Would you like to specify a more appropriate data type for the correspond=
ing variable?
>

This is a nitpick, it does not affect anything.

> Regards,
> Markus
