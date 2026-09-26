Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541BB37F74B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790441777; cv=pass; b=r+ZpGzADcUWdb+HI2yOGfewK5GDBmFUF8DvLDGEs1rOVaXhUQZEb9n7oxvKSAtjWa2F3t2RriCkkfcVUQHmmCLOsAJ1EAvC84C3SDV8FdkDPqwqFE8KysM6dmgemw4kiYbLHfzxHSFmzWPQ4ec+De51vZk1CdQducv2rc7XN79M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790441777; c=relaxed/simple;
	bh=BFLuuX4oE73MpHMuvzlTcQtgZLxzLskCRkVBezS9eyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOuPpZ+YY91spKqQDXZU0BG/ZTz6smovwDH3ki3Nlvykh3vCTxzLM3CuFwdGa6CsbPkgNYjkf01TyLICXzcCnxJadAkNb5bCsu3lnAWnolMG/7ObQXiL83le55Z6pSZcvrUwLG7KU/TfbUUabHRndjdpGElkgnd5qZ3I/duz4Nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWTgj+tf; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWTgj+tf"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae1f2cedfso2270871a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790441774; cv=none;
        d=google.com; s=arc-20260327;
        b=KihMe3HN3hoRSj4OWi1Q3xd8pVm8n0Ie2HmPjI0PoT+6mUTPhorSFH+kpmEIANSK6d
         oNTUmApZ3niZV3JYJQLLt5pmmfg0QC9nIKzU7qlz5bO7jZP2YUqL+GVTa6FXqROfRqKk
         Q3Vd2OolMRhN7RkmZITutKGTH7cnTiETjhIzTzvmhbU7LwcHYywZpnor45OT9PZICAM6
         Tzx2klEHmCgqeguGlprTXjCFV4Bp+bIP0rvDavHsm6An1vxIjZTeafKxlEQgVU6xiS+H
         h8I7XATc9Jvd8zY34fGZbsoMFkXvXdv4yvQmyu2Xa00ODrhPsFsh45xO9CyXDLCEfbho
         ohWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/jNPRD3oMVaVsh6veaw1NKnURjzIQQ+FNTYBf29LQZ0=;
        fh=CIBUKNwwvr5uitQbmNowel37uOv1kbPxz+2o8M2aUoA=;
        b=mvEZCYY1mgZ8WfH/ASkPtyvmaQlN4pqIssSi+2VA/HLiBkQ9O4+LWj/GEj2P9Y1fsI
         lg+n/gqCnSDvloJrgpCp7wQky+zyvJ3aNZ2aq90GusIy2nrcQuKymvQL6GD9rBgmY28f
         GRTmQWjtcjtHTBGfVuojkLvE0ZHBmS+ilIbopSExkYZfs4BnqRHrmvuYv5EzowOvbeXL
         HZDasCiiKc+3kvhwKF3xN6hPtolqeOIHkLOkMRt+OOut2lahwV8+Da++oXvntt/V6J7u
         eDT5V8rF3dS2vZyFRxwwnulKxvE4YCsxXhycUqbVgG0OMTfIHM2HTd1lWZxhuak7kxeD
         MsSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790441774; x=1791046574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/jNPRD3oMVaVsh6veaw1NKnURjzIQQ+FNTYBf29LQZ0=;
        b=WWTgj+tfnSi0s6N5lHGiT/XRCdCfI3g0HaQu/G8o5aTo+Wc7GlINB9zMtywfVuOpjY
         uMPAp72AcPHc7adl5gWmtot8ylurOcNZhYHzFv/HEjFiR6jcGNUsYJqtW6ZNE4DjVMxZ
         TsqZgz3NG6sFN7Du9hwbgSmUQLslsSJddjafQVoJ2LuXiGuuXNuIElX3l5G46nU6wDgP
         GZicBk241AHgrOY+PcEvRbMSm8wCCm34ShgNoEEKDsf8D8quo6bBT8ZdAbs30WzRE0+o
         pcS9zMQiVc5OhPXde3BCTsQofBsaqcT8JYWfCCIYV2VB9BnrSYdoC2caXxdeVb3s8P+0
         5LnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790441774; x=1791046574;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/jNPRD3oMVaVsh6veaw1NKnURjzIQQ+FNTYBf29LQZ0=;
        b=TZQN63UZalIOrRvL0S/PLZ49gNanoBxFlO0y9RJxrwy6j1zUMNPh+GYhg20RpR+WSX
         x2AOG0sEFURvx/P5Re8g91XW6jpO1RlquUb7+uusVA59qqGqWo9yy7JtnAxincQfXRBv
         Rplyz5ZQ+Og2O/kkYwqanvFeYtfJwg93jRFLY3UqiaC7QMWSv8/pvT3gMos9wELZFI8Y
         zpDEqguovM6T7B4nBxU6QCeo5hwlp3JP+Lbc1LZp+qeVW9jwDilUr0xUwoO9DyaKfXJx
         ZKiSL+tG2KXaCbit4CRkkGcoGssd/1efbRP+FD80AOEVJy/jkXa5Wbj4j9M90Ak2Z8O3
         FXOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUFGgjByv60EjCxc1UKEtu/0ZVxnqPKbw/96OME/LJCLAtquGNcTmpAuJ7fqrsm5+OQR37AOK2QCzGpA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRFMyAZv3+KBHbTZAitNAgEESpa9yYqsORouLPZWRUWuOFu/FN
	lsb8a61pFul9dztDX+K2gyg6QDRJlq3wxOZchxyhwd12QSWwqY9K0qVi1k+tizO+F/ZIP//K77N
	hw0fs9fYtOh+tFl0+UueBAtI+y0DzhMw=
X-Gm-Gg: AYBFou0e8pWwGU9wHPYzrhg+LKCCRWtDxacYE70OiIGj3ynVSTq0xPBbP3KfSq1BW4d
	eQizx5uyvecKo4W74+ByI8rz9a+L49ODdiT5yLlRqlFxHAKeHqU9fpc7KrMDvdNSoQNojhJ5YJY
	SHKtl8phXQQ1Q3nZTyABqW4b0kYow8C9Xm5frucTe4jUfE8YQZvMvBuyRylZ2d7CIerG3AuyE/4
	7+v6uHG4QmAt/qP8QucFVGuMRsNwgoN2FoClnnQL8exxfL77IC7hTB93iSvfiZUJUV2Hy6/0i2z
	/ypVtnqvXhs//E7vHZGd6zfpSkCDt+kLuSNywzHuuekD8GhEqRpJXeBx1tvPVIuor2Q/Oi9Madr
	kQuoP/HUpbdfDnLWZzl5JoabqsM1elmCxT4MWSgDj22A3ZKzk35owDJ6i5STsGSgyJyoKcPQHxC
	7snvFCJGzaePqjFnIWn6VrtHRZUnKoJA/CMfWZ1+aSLK48c5BDeWo=
X-Received: by 2002:a17:907:e153:b0:c2a:c793:be00 with SMTP id
 a640c23a62f3a-c2ac793c83bmr563678266b.15.1790441774263; Sat, 26 Sep 2026
 09:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
 <20260925160913.1648565-2-andriy.shevchenko@linux.intel.com> <ardbPbkc5IyZWsZo@black.igk.intel.com>
In-Reply-To: <ardbPbkc5IyZWsZo@black.igk.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 26 Sep 2026 19:55:38 +0300
X-Gm-Features: AclHuK9n5gUoraVKhWUuGL_-FGzi6edyz4lY6gv-HdsfU8bjWPEV9o9jeXqIE0A
Message-ID: <CAHp75VdUHTZstgOWTGxyYua_PayNXnikgo=iM6kUCWjsTkqb8w@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] gpio: Move Intel GPIO drivers to the dedicated subfolder
To: Raag Jadav <raag.jadav@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Junjie Cao <junjie.cao@linux.dev>, 
	Runyu Xiao <runyu.xiao@seu.edu.cn>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	William Breathitt Gray <wbg@kernel.org>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 8:42=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> w=
rote:
> On Fri, Sep 25, 2026 at 05:57:03PM +0200, Andy Shevchenko wrote:

...

> >  drivers/gpio/{ =3D> intel}/gpio-elkhartlake.c |  0
> >  drivers/gpio/{ =3D> intel}/gpio-merrifield.c  |  0
> >  drivers/gpio/{ =3D> intel}/gpio-tangier.c     |  0
> >  drivers/gpio/{ =3D> intel}/gpio-tangier.h     |  0
> >  9 files changed, 50 insertions(+), 38 deletions(-)
> >  create mode 100644 drivers/gpio/intel/Kconfig
> >  create mode 100644 drivers/gpio/intel/Makefile
> >  rename drivers/gpio/{ =3D> intel}/gpio-elkhartlake.c (100%)
> >  rename drivers/gpio/{ =3D> intel}/gpio-merrifield.c (100%)
> >  rename drivers/gpio/{ =3D> intel}/gpio-tangier.c (100%)
> >  rename drivers/gpio/{ =3D> intel}/gpio-tangier.h (100%)
>
> These are already in good hands but I'd like to be atleast informed
> about these. Although I'm not sure if it's worth a dedicated entry,
> so I'll leave it upto you.

The patch adding the respective entry to MAINTAINERS is welcome, if
you think it worth doing.

--=20
With Best Regards,
Andy Shevchenko
