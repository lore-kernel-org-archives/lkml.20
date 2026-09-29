Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE9F498926
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686001; cv=pass; b=ux8KwJM+8nYQMnEPPz1xRQlfMym1WvLlAfiu2PlDnbVy9tFdg6cc4fVjlUiY68nafjhLe6Mb10OKJJp6v44dWw+wQP0NAbNkWtChpb/ga36NnaOVUrOcxV5HmWEgX4HqV6vxRQuZX0dAGbF+UIq/RMk0uUAdoatoo3JonlsX9Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686001; c=relaxed/simple;
	bh=epuukrWfLwY64O+T6DJ6mUEc5U2I1eEXmIgEk9P4IJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O182bPa9jnyqoE2CWISHVi8nY1NmbMvwT7aFSDZrqpKZion2WGkiEVJYPk7pWBJHu1WHEYYt+MGFCJV+mohC7XYZxw4HyceD250K1TgtWq57gOAETYO8L0hTd2HWL1YGvCe06QhVfB83eyp54+whrTa3Z5jcm7D60xtSTP8LoM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLuQ8Gfg; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLuQ8Gfg"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2cd04e72f6so452141966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790685998; cv=none;
        d=google.com; s=arc-20260327;
        b=Vj4S5liAvt8I7zrDD29ycbD5kDuQR/QHvxmYdmstRzKCTWOzy/cbsPr/7LKKqLC/PI
         It6R6W/9oAMB20ysWZae4jaHoi4vYLscJRsbJaHWUoLk6mMU4nNoMXPgw6henqvoSZp/
         wK//WiZTbSm5yY3KUQfR5WJDseoOuqXubTBQbneVxbulOzjKA2gtlZ7aOC2marVgP1tY
         dKiwcNRGOV5tlD2+J2xXLc/rxFwROEzte3Xt0U2KI2UXWEqVfW9itMflWbdFa3RjokXP
         3GGWLIVsTVTpgaECFXJXF6FpDDj3ITdv9GvnvimK0nZIl4WA2Zh5KZNOSedNgEEZPrrb
         jHGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YwGp6LLrC6+cNnTMLzub9cppjx2HiEgd8s5IY+o7TjE=;
        fh=G4SQvAr/C+lbPRFbXDDie6Ol6y0ggd19CZryzwR+Pjw=;
        b=k4kp1NX7W1twsGPR0eIlvAL5zwmUQ5PwWbzGUxfkgh8gw6apE8PdrgJ+8TE/7JRCd0
         rpdSx2DJhVbKfUO/wtLTT9Z9CQNi2H6PZzNesT5vKQhgAQGbh0vmB/vEtYNAXWYv/+Zw
         xdmCCESCU28iSvUF54REB17XtWmv5LDQ3dw1dU2gpPljKmZf9mX9yCd63hZvDq5spaDF
         RbcrJfTxavUiToYCtujusDS9w/wCkfzzWqyju9Jr8IskMfV8VMlU//oe3Pv1ahKNEJ7a
         KVjG6Xf6dVIaS8URoxi+VYNXdwjm/Y0tkDctFCVprbdyFyUi5ZJhKoCWhDlgJjKjmzO3
         rPuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790685998; x=1791290798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwGp6LLrC6+cNnTMLzub9cppjx2HiEgd8s5IY+o7TjE=;
        b=oLuQ8Gfgzg7xyNmfGMunZZOG5CIwh/g7grvyAl0Tzjqoo/T5v+J1IGlRMOqY3tNK1Y
         uP/8Zdy69EPjKkhET1rpM7gsdknfmg+8QQnbkIw1djV4CQm1t2biskGMN5ZVuvIfr4FH
         4ZIWWXVe8f6GvpIkYPKW/Bjqu2CNLT12rjbTJreQgqd/D1K4me0nWrJVB8/RoreDU24z
         LUp0XT5hz5rEqkCkdJ54Ef32N69l4oAKe5p8vc1Ate/ZWkZzk9dBHuoOllzLmLsQAx7Q
         xWUqHtieADtgPBqGca6YV1wiowq/fJuYNUdWxQTUSYyK/eB0DdlXGqhh3de/rgn1W3eg
         xQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685998; x=1791290798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwGp6LLrC6+cNnTMLzub9cppjx2HiEgd8s5IY+o7TjE=;
        b=NBzCsGHsXU4aPeFiklR23AP1gTkHBtEtHLJqELROT2td1RRofU20+uIH5Q0JSDuTSg
         bVwDunRqEXf0lsj+LdRnERZKcCt1zeqrz+IiwYFpXKd1pfGBePzmJ0aj3Wqzng64d4Gb
         9SsGU34bwUBK0FQySNCt0Wvhka1wchvC/4q9HaV1D7LwW139rBQaMy6YKzjJTIeyTRBk
         rSIz8PRltOcrlRLvvW1wgnD+zd4KUTJThpLW4oRsY0xAW7M3AfDntoTV0kjahHRlzY6y
         Nvtu1lRXv9/o3uCja4jRhhlZPw82qdvlyg9vczkQw1kfhAZ/8OpG6WMwmW4fq9nFFNjZ
         DvUQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/enmEVcN8/4RCwXvYghsn3AesY0/lv0+Z4qIjQks2LSzqaboc65OC75mjbwNTHumQQ5pAO+NS8GfGUDI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7zQZ9WIz/3yIRb+DH0ug9Pzja0wMj6iurvbw8/veiN98LqOch
	olDk7qVXnDzThOuV+W6TUFZhuExnhqybrw/vP62WDwb9dXEBfR88RDyfiIkqlfeWVNFfHawHbDV
	rqWIIPwLs5cVuByrS3qmDu0rVWDHpeLo=
X-Gm-Gg: AYBFou1NOBg23zwaKtRmliD+6RdLpQyl+ZUqp+nRnP+KwijcqVnM2Ca5HL+lE3+7vTL
	hizxV1iMe2bjYbGFDtcZclRNmcy/yDZAkvtMD8tPAhPpOcMwz72zj7fR11sSsfpKR5//RAh+2Ak
	NqOYokJ4hpHgpfEqnFDRR8tAfEzyQyaQWggsfTW6ZB2ONfpKbauyrh2zNbUYBhHYxCJvxX6UcW/
	gsn/N8CZIOdUOpu70WleyEuToeLqHLf3CX7wAI3OkxRWqX3bb3lEwPsI8TZ/qr+vOznNappOxef
	BMW2IG/RVD0NxmlRLgolba22L0pw9YBIuIwMCSUdw95DtIdGB5VEhvb/JZuy91cv4vpx4pYCYVa
	z44UPCSlQ5cBqtRUVBneaquZcoUX+Nr/yhhXSgbeZ3MkiKSNKxxrPIfAJMzbmYFnivAAvTF9WbS
	4jVjIwoi9GaPxcblxiZMJ6rQRgSYcv0NIjny3etHR0c9A/p7QiXWI=
X-Received: by 2002:a17:907:9811:b0:c2a:46a2:5b57 with SMTP id
 a640c23a62f3a-c2ac2375464mr1261369166b.10.1790685997699; Tue, 29 Sep 2026
 05:46:37 -0700 (PDT)
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
 <20260928123446.GH106095@black.igk.intel.com> <CAHp75VfxMwLMPDQr9f=3ea8Z+5zja=kT01o-fhkyrc-V1rh3Hg@mail.gmail.com>
 <8fa77d7021ddf66f344c139d3bbeebcdb47ebfa8.camel@linux.intel.com>
In-Reply-To: <8fa77d7021ddf66f344c139d3bbeebcdb47ebfa8.camel@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Sep 2026 15:45:59 +0300
X-Gm-Features: AclHuK9eM-z23tmTxWp3mB574OeAxAx9uEP4yofS4FOytnllOZRupTj8wqenUOo
Message-ID: <CAHp75VcqqsTSiyGxeZeNXHAVM2ujux26Nmc5C4CNJA-Fqxn5Kg@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 3:15=E2=80=AFPM Alan Borzeszkowski
<alan.borzeszkowski@linux.intel.com> wrote:
> On Mon, 2026-09-28 at 16:13 +0300, Andy Shevchenko wrote:
> > On Mon, Sep 28, 2026 at 3:34=E2=80=AFPM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > On Mon, Sep 28, 2026 at 02:34:44PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski
> > > > <brgl@kernel.org> wrote:
> > > > > On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> > > > > <mika.westerberg@linux.intel.com> said:
> > > > > > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko
> > > > > > wrote:
> > > > > > > On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg
> > > > > > > wrote:
> > > > > > > > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko
> > > > > > > > wrote:
> > > > > > > > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz
> > > > > > > > > Golaszewski wrote:

...

> > > > > > > > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
> > > > > > > > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
> > > > > > > > >
> > > > > > > > > These are interesting drivers, not sure where to put
> > > > > > > > > them
> > > > > > > >
> > > > > > > > IMHO they should be there too. We are maintaining them
> > > > > > > > both.
> > > > > > >
> > > > > > > Do you send PRs to Bart or you just rely on him to take the
> > > > > > > patches?
> > > > > >
> > > > > > I don't expect these two drives to get too much attention,
> > > > > > and they could
> > > > > > be contained nicely inside intel folder and that would help
> > > > > > Bart to
> > > > > > identify that these are Intel drivers. So your bandwidth
> > > > > > would not suffer
> > > > > > even if these two are added there. Your call.
> > > > >
> > > > > I'd like to avoid a situation where we have Andy's Intel
> > > > > drivers under
> > > > > drivers/gpio/intel/ and other Intel drivers under
> > > > > drivers/gpio/. I'd prefer
> > > > > to move all of intel GPIO drivers into drivers/gpio/intel/ and
> > > > > have Andy
> > > > > gather changes to them if he agrees.
> > > >
> > > > Okay, we have two parts missing:
> > > > - Nova Lake driver (I would need Alan or Mika to step in as at
> > > > least a
> > > > designated reviewer for that)
> > >
> > > I suggest Alan to be the reviewer if that's okay for him :)
> >
> > If he agrees, he can provide a patch on top of my series to move Nova
> > Lake and add himself to the MAINTAINERS at the same time.
>
> I agree to be the reviewer. I have the patch ready, I can send once
> your series is applied.

Just send it now, in any case my series is blocked as I have not seen
a consensus on what to do. Or do we? Bart, Sakari?

--=20
With Best Regards,
Andy Shevchenko
