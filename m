Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEB84E532B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608386; cv=pass; b=gmiGRwrtULGg1rOiDf0vToh8Sqnph5HAkcP6a0GfYotQFHn+8sSSFz0aELDONaKsfDDQivVXH+S5JDudCccX40ApPXjExJKyLEx6DzU1TjaekVS48khMjAiUoc1YsNvz6/QaY/DWbK4aUGl2Ctga14UXY2+ExAejoyjqs9YWb2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608386; c=relaxed/simple;
	bh=xGXH8gA4YLaFLlzq3NLaecAhmu6TsaN59vOAD8sxWAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEfYGt30GqS2pOh8MciDWy4uKzFp1YnFtNZpWJ93yyKiZpw66Md1souzDR63zv/G5MwtddlHhiGp13YWd60g3rDYVDhPCf0ZEHkg+UUwtY+rVrnHQsuQt+WNfoYasFaA2/xUow3QgXtydpibnJsaZz7yzlXE1wlfloL5Mpp7Pos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOhGv+nt; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOhGv+nt"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2c570f6f36so269566166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790608382; cv=none;
        d=google.com; s=arc-20260327;
        b=U/KXGu09ozQo7fg+G+gP8+Lu1u9V5PlDkWgv3GqojxvdZEUVECZJ0aPr2gHFKl1p0C
         jTi4AqIlNWzm86mMZDCudz80i8pctE736G0EVbpReLiftvShOkH5+1Z/oS/SKvUqpRy9
         7jvZYSHa9wL12/e4TCGjQIWOlRZGYbKFVM+/ikjvrO5Y0kCx8fOUGcVgzQOV6mdnzIJG
         NMWc03ZsyEusg/+4BWL5hOltL5Y9d/lHXcU7aBg8oVK0gYxnMk2OLi12CDIByy6tf0YF
         HhY05wbUMOzOuzB8IloprpaLzGwc+nkzmoD1la+H8b7d8rWFp4ALyVjVlT3AJIJB01Np
         yYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5E4PEyWO836dD+odQ7JIg00tViBX/8MB5nfEafgD1g0=;
        fh=K+J5yoxRXbkdUch8chgcz98mlqf1CDAAWigKkNvvSmI=;
        b=e+kZe/0zHxXwiCM3UPuYB8wuIzes1QxI2p66Uilt10gkAQB9aMJFv7FghkXCn+Ag09
         fhjpn5CD5EInY5R4XIM+TglSDWXm6NGNX+LuuDFZNsSZpdMtP7gkljnwANo9xcqrPvAk
         9W8iB8AmsAEk/lnOiFl8Ot63SIU2F7CowefVeUrpJOqTPsMoJvZw0vAgFj6OqZD85tGg
         1PGc417j7FjSKOV9/sVfRzvZLFjUP9Ww5dePm3jEB4RDRkNIG6c3EK1wToWqCfYu92+m
         6nLT5dk2sDrVocgTsNUGhnFKvPs/wSTmEl+D54ZqHP//mOl8+xqrJ2K892UXKFezjtPA
         98AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790608382; x=1791213182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5E4PEyWO836dD+odQ7JIg00tViBX/8MB5nfEafgD1g0=;
        b=JOhGv+ntB9jLJ/1Dn4p78pWXRZupcrUafzEz6rVIjfSd3H266tc8y9AWqLG+1lRUoW
         Hv2r/8ppahCzzLuXmeZ9fQ04IL+qVEi4ZElWuCA+KdZI2Kzc8wAr0McRfhqpAN/gZtr9
         l0mQAYagxxM5b+dATcTMT/9ane7O9P18b+D78U+645mU4t3qoiDdQdyDzwt6plZI96li
         9cu07w/02ryl8Hfy22h/GFL+w4QGiE4j/aWxqw5BCYkL7q0fELhbytBo6p9hU0eAz4CE
         FdnyN9vUND7g9v32GfVibyN2TeP38t5WCCaA/YVoemcUedCgQ1HUbAIKdmVqOpRMevJp
         4QhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608382; x=1791213182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5E4PEyWO836dD+odQ7JIg00tViBX/8MB5nfEafgD1g0=;
        b=mo8TGKIihG0d6bUts/sCBOt4SrfI0RE0HcPk1VGA+MDddjqtQ7eLTVGhATTQaHpzqa
         my2P38CrBsffrVv+nM13wNpuw65WMSEPF0Lt0tLZIvAZhVEdov2VYK8cLDt0jfBHV0rC
         w1YBbZm9DPICk2HRAQYj0Td5RyK8qhG6yQ8zvqPFIMBbC4CyRKYu2KqDZdP0ONgFE2A9
         mzPq8zIIXE0BygkiBe4zhV7EM+PMr5ALONwdbkcMHMMPCIWNrb/LUy+RDJruW/2sKVZR
         ASf0LJFcIJSyOiEWIFcjXtWisY/pc8xqvzAaFG3FQnokoNl6hIR4DCeGg3R43HJrAIOd
         fjrg==
X-Forwarded-Encrypted: i=1; AKwUvBxncpdFT1j33px3tB99Md2cBHyc2vnNTkRL1sqMIyR0puBRLtyDbfJo1MPVJIOfqGRW/AeUGcAZtQhTvQQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nDBBiBTEt69ZXOxXbzHEiO13wwEO56wKrfdjukjCmC1ojrHQoW
	jI+dNcdmSLL8JSdeTMzqEznLRnRSLa2kWRnqod8bo7gJW/vRyR2t4DvP2YsezTBw4ihp5ZHG++r
	Bc1etTYI9j+5lRrEgpmrqUi8qjjMGjqg=
X-Gm-Gg: AYBFou3kSFCoFseVg6HkbknV7Xe9HSxTdHolgHIHilnsATRX3APFu+LZbwmcrvOJ60q
	mXh8/0c0FTkxIDEPZyG+Oh9ed5QKPi5qkybbuqFQgVF9Dv7Awkqj/t9I3k3ZSt8vFcdBI+Sf+9O
	V/nwSzzhSG9yjKPlehd69XYuIPCrVIsO91RRrhb07SQb01S6CycQGi/EeMOoUlKskQc8R32ckB5
	1PVQ7YBvZk0sxqjTxo6VImGWwa0XV88uv/R5+hB20GFzp6twzEXI3I0I3CGJHhmbP6zPe6q51vY
	HLKqFHG+MwVpKE/xbdVIPKLzgeb/PQzBwxJn7wCFeIept8SELyy4xsilJSa11kpyYLyuHT7CJpG
	z+nk6WkgDCRKef9tkGjv1g7hoM7c2BoTNEeyWV34vF2fb82i2MXSr71Wv4zZruA5yc/DnzxN8Sc
	lOCNK5WceZmNsvwWoe5Labrr0LLR+6CGwaKR0+5Qjl
X-Received: by 2002:a17:907:c589:b0:c2d:c6e7:9ea5 with SMTP id
 a640c23a62f3a-c2dc6e832a2mr406896066b.48.1790608382274; Mon, 28 Sep 2026
 08:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local> <20260926100727.GB106095@black.igk.intel.com>
 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
 <CAMRc=McKAR7VadTYtTfU1kAHSRidj_AdhBbDh+2zNpFWhjA2mw@mail.gmail.com>
 <CAHp75VdGwVf2pCXzmQoY5zvgSf0KsRH8hU9Qt45iZmEG0KMzCA@mail.gmail.com> <CAMRc=Me_sAdbqLq6s9sQ+Ti2_CfE8uHbAVqhe=PPpu8kPGkn9g@mail.gmail.com>
In-Reply-To: <CAMRc=Me_sAdbqLq6s9sQ+Ti2_CfE8uHbAVqhe=PPpu8kPGkn9g@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 18:12:23 +0300
X-Gm-Features: AclHuK8lJS10KkKdFcCgLuRsXmydms__7cM4iW5YRwldJw9VEyq9-un9oy7m0aY
Message-ID: <CAHp75Vf=2nN1xX=2jB5nj8AO4VQSAcXBg+xFQe5qk_A+Z0Uq_w@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 5:13=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Mon, 28 Sep 2026 15:12:18 +0200, Andy Shevchenko
> <andy.shevchenko@gmail.com> said:
> > On Mon, Sep 28, 2026 at 3:25=E2=80=AFPM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> >> On Mon, 28 Sep 2026 13:34:44 +0200, Andy Shevchenko
> >> <andy.shevchenko@gmail.com> said:
> >> > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski <brgl@ke=
rnel.org> wrote:
> >> >> On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> >> >> <mika.westerberg@linux.intel.com> said:
> >> >> > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
> >> >> >> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
> >> >> >> > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrot=
e:
> >> >> >> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewsk=
i wrote:

...

> >> >> >> > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
> >> >> >> > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
> >> >> >> > >
> >> >> >> > > These are interesting drivers, not sure where to put them
> >> >> >> >
> >> >> >> > IMHO they should be there too. We are maintaining them both.
> >> >> >>
> >> >> >> Do you send PRs to Bart or you just rely on him to take the patc=
hes?
> >> >> >
> >> >> > I don't expect these two drives to get too much attention, and th=
ey could
> >> >> > be contained nicely inside intel folder and that would help Bart =
to
> >> >> > identify that these are Intel drivers. So your bandwidth would no=
t suffer
> >> >> > even if these two are added there. Your call.
> >> >>
> >> >> I'd like to avoid a situation where we have Andy's Intel drivers un=
der
> >> >> drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I'=
d prefer
> >> >> to move all of intel GPIO drivers into drivers/gpio/intel/ and have=
 Andy
> >> >> gather changes to them if he agrees.
> >> >
> >> > Okay, we have two parts missing:
> >> > - Nova Lake driver (I would need Adam or Mika to step in as at least=
 a
> >> > designated reviewer for that)
> >>
> >> Acked.
> >>
> >> > - USB IO (I think we need to agree which tree it will go through, my
> >> > bet that media tree is the best), for that we need Hans' consent
> >>
> >> So far the initial commit was picked up by Greg and the other two were
> >> signed-off by me with Acks from intel people.
> >>
> >> I'd do the same thing as for nova lake: Israel, Hans and Sakari as rev=
iewers
> >> and you queue the changes?
> >
> > I'm fine with this route as well. Since Hans replied, this all depends
> > on Sakari's answer.
>
> Does this include moving this driver under drivers/media/ as well?

I didn't consider that. But if Sakari wants that as well, I won't object.

--=20
With Best Regards,
Andy Shevchenko
