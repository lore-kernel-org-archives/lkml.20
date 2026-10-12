Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D99E46A5EE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797449; cv=pass; b=QDJ9SyopMITv8UOIwX13TF8mk/M799462HvfRrT0vbg6P8gys4aE8YlIWm9fZ/znoQAsnlo6EB+zTZ4XchYRr0TlUgs764m7Z/k2uyw723a7B61YCE/pkijWY+UnbHD20FbBihPoU+K6WRG93KTXbbqbaClAbHFczI9snbcarNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797449; c=relaxed/simple;
	bh=z49hML89cIN3imf7VrsC7tsy8ZMFjhTuJK1MAzYH5qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4fMlJLgEXfHWmq7sKs+7Awo0oQoBxnuVouNsy/w5vMqub18u/N3YHk1ORO0m5ipFDWDUNxz681mRwd4NSIHdcSSRo/YiKjc2OiDJ/xoWKL7JSriukyMcfXQJWmSdDH5qmOMXgHj+KPyZk3XwBGyxzChhYlIu4jl5a+WBS5pqtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqamOTHn; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqamOTHn"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso12252051fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797446; cv=none;
        d=google.com; s=arc-20260327;
        b=KxDdsVm02VSP5T4CmAPDbarkLjk0XPMWMXyHW5PVGc+GQ5iEl9AsMq9NljuhI1jZsq
         ZWDx9iE+lRPyFNys3y/mofD5rWAQYLRsYe2ntqP3mn+fy9SsgvUxQ1wgGQ7znx26+Egl
         /O5uhlJeizVbyrbVhHdEM6PN84ExLUQZDAcmQ2w/LMabFbyuwxmNYzS8kYPRCLLjHOy5
         qPWI7zIZ9t4fNQ6uvTjP2g558/tVxixZvYcauXb89zjNA/IUe5WBDFaUKBgXQl2RkbIx
         hB3Sf5zsiRyLA7TCMBXCTLYZlf/ikwIeL461wPSLIw86UUtHIMP9DFII7QHrgleLhoas
         kJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kV/daCkEcG+SwQxwP8rLI06AhxP77k2xK+9iHAJSDFM=;
        fh=bY6AkAYADe+/ahJO2Cnw2IyC0UEKkLY3p3x3l/v61dM=;
        b=BTEc8m7PGKer6U2VH8gPmbwqioZ9YEYb9ZTOfHibtpDCZV/toExZvxJmVE3Yu/pJNT
         vNcTC+vDvbFynj2B62o7DquSG5yzGP/ongKsBpeBg1CavhWbtEsjSAiCKgZ8D1Z/U8JH
         a1KYhpIpwVz8a87EEI/mYdfdfAya3VX6nh3dQPzkLeT7fwJh9jn2SxEWjbu3FMyKF4Js
         WB7BiEQihGvlMUraFaK1IY5upjBl+I2T4Dl5IG2DPq39wavaKezH6OMK6IOWYr88vVes
         Jqf9UAX2COSlWnuVHk5xw6hqjIvhFoISsmQQ0BfBLfHewJlcWUP9OXsckiBDSp0FAoYr
         L8uQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797446; x=1792402246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kV/daCkEcG+SwQxwP8rLI06AhxP77k2xK+9iHAJSDFM=;
        b=iqamOTHnYT5wtxoTw/cH8Wf/55odU75yA9D0HYYAjAeiW3HjX5YsYeBVyBjzOTUQW+
         49W/RYx1FvJbr8X1odDwtU1h5KQbnGIlWAp1XzjiZ5ePVILUivYDhV8ZgjoeL94q6DBC
         UrB6sFas3aehCsYoQ0in6meFtR3wAzsDauKwd8PD9R1vO9NArzxDjvYrcsCjT8Vh3A5+
         cEdJJwPyP4nhlfC3iyTuqoZHa9bhFqMpeO2ar4GWtudpGd3gQ4O3ZAJ/KqpN8eegWiFj
         y4iByI8Fz+d0fi0fI9KUvQV89Bz3RKgR3yDezxLgyIknfat7HtlZyjguK8Hz3mWcjNWc
         C8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797446; x=1792402246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kV/daCkEcG+SwQxwP8rLI06AhxP77k2xK+9iHAJSDFM=;
        b=VO9vbjzFRtrDrI5Hi56a8rEhmHcMAW/X+/wpFaD/sFj0zQNpI5tgl+u/YETZFDkByq
         Nv/ggHVuYscrzUKZYGzXwPArQwXFbFvlua6k9+BSbPAjsnym49ABeXAMY0Fol+oCqQgY
         L3OEV6aZPpemkDfXCJ1LKwizHdVpV0+Tb7tll8hsUzykprW3xZVKHcSx5uH/jzL0ZCLe
         ca/5Z/tF8AO811FH7pk3OpML/V4/dIg5kWdUe8kSLu0Bfbwb5i2xuTUK4F+CSqWUq8Hv
         0ep/X1dRdf82XVojkEqmyu5cFyTCLJEJSgvrOF23/iD+iY612HpWjvoIf40MmgxQiwaI
         2AHw==
X-Forwarded-Encrypted: i=1; AKwUvBxf5xRJs00+yUV/Y26iQoDgm4c1njIwn+mr6pfUKd37ueEemkgpuCybWpJjBYpo9QaCrwYSpIgENbxzzZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTIJN6u/479qGN0bUDTqV3Acxu/zsWVi9URMHuZh3azG6xR4PL
	aEKSTW9lsy6GEE1n7oY62Bi8yDEm4zDAS+scjGDZs+2/9gm3VMkB01J5NOYq2Kh0U8P9Q4jg3il
	U86fBdeuzBkjiuQqqyDnUswXbMvR7BWs=
X-Gm-Gg: AYBFou3sTL5oEUwlrqsmCM2jDfPdNFcE3UXfkV4iRbATm23HLU8rTM+0p56LtLNhFb4
	oMTcNKq8OAJg8nrusu/BJl5kUzw4OvJQhuj39I7ZJ1yWtRhLds+FfB3c3BRb3LWmh2BtHQQV2rK
	8P2fCzQjPbJA4CyD5V2sUUL3QsahSkKGMsawuHgDava6y5eJI4jpCSfpbxuhkxLPZwEPgqhpp56
	y3F3SqUonL+mtju355Z1pi9TT14cMUuPYGfvzTMQAQ7XD+urnp5Ss1RiofQ3lxyEdjVe2phVCvv
	H6Sp11RUz6AwHbK8CRJiFo62UY9kgIIQEIa+hNlzfRqFHDzOrT3nrUHW+Nc3fY/9ddXolW0LUpN
	YseT55wrTvDKkHfORz6WgSD7SvEOFPf5V18rRHyOuu8ukOXE+0XwVgQV0KPFwKQgXlCm0L/5VET
	l1Scl7e/N5OsAzSfShAZYGLyFLq62HYF6QOpWVca1t
X-Received: by 2002:a05:651c:3251:b0:3a9:8167:62a with SMTP id
 38308e7fff4ca-3a9c539d80dmr19489771fa.28.1791797445959; Mon, 12 Oct 2026
 02:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:30:07 +0300
X-Gm-Features: AclHuK9e_oZT5Sa46rEJHVX3lFg1Q7os3EVH632mfdiuI60h5GYQ15qLL0jo-NM
Message-ID: <CAHp75VeonKZtX8moOdXrmTJbjH5Ew5iVdDDc3KfqQ9r_tvHg1g@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] gpio: mxc: use local dev variable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> Introduce a local 'struct device *dev' variable to replace repeated
> '&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
> readability.

...

>  {
>         struct gpio_generic_chip_config config =3D { };
>         struct device_node *np =3D pdev->dev.of_node;

Why not this one? Is it even used? Perhaps you want to have

  struct fwnode_handle *fwnode =3D dev_fwnode(dev);

here?

> +       struct device *dev =3D &pdev->dev;
>         struct mxc_gpio_port *port;
>         int irq_count;
>         int irq_base;
>         int err;

...

> -       dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
> +       dev_info(dev, "%s failed with errno %d\n", __func__, err);

This message simply needs to be killed, with initcall_debug in the
kernel command line you will get something similar from driver core.

--=20
With Best Regards,
Andy Shevchenko
