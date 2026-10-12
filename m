Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833AC44F54A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797181; cv=pass; b=Oi2nOcPgpZz5lmoE1llCheltsK23ph9PUbzaCR6pjCV8b+ZYnecnetJl+UA2uoudOyHTOVtPX9Kb0alKFUQW98qS0aBIrz75sucQ7A2ZtXi5ukZTXQmg69yCZgj0fry84wdmBm6esdZEyQ5QuCdpYu954INBC6lT/mVZAj/EI0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797181; c=relaxed/simple;
	bh=DK3zBs5Q5Ki8kuPnph8eZ24Oy0HqvpqhIG3ePWhuHBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uGFSxdpulp2flpgkJwDUtAcy1/pDHmRfkD1kODfxpZLiO5x9JY+ZV8EZchG9e9XJe2msC9o7hJnoXN+jPO8fixOm86J1cGzDe8eQatnIQnhwILcoUf6abr/pFhH6eC82dt9pd6RbMi0BBY/ywgim28b+Qm+zOAcaM755J4JJybo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/z/fuYU; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/z/fuYU"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a1eb6fa0f4so18142261fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797178; cv=none;
        d=google.com; s=arc-20260327;
        b=ToAAB+qqY8XDZkJQj89r49HZMXmVlCH8cazbqL3qPwNSQ8zrBc/91GfyIlmaAN/s64
         fgMj2/EfEoaoWEDVNYk4XC6PjnJl7A2qZc8DJTN06DioTSzd3aio9Voouy/Ww7xR6HXR
         Wh6STfUczANrmIU45/DTQgJehSALm3AQ/4wfWgdkd0T+vSVsGvBaY91UdX1DlGVAH09W
         /02UeMyuRdq2iP30cqa8PqdMEpWZt3fXAvMzCnF4X6xwldvrjN8wOtrtFaUGTWD3HTIt
         b3OzHVBhKTJyotdHiA8pqyccfxA74HwccoritN58B6Suure4hTNlbpK7LWrlLfF5/pUe
         Dbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1DLHRcFWGRMXj45+dEiiprV4k2SPY5qTAHRqmLZ7S0=;
        fh=wKRZk+9TKl7+39hsBIbF7xzg0bLXQltEyo3O1aKWGhY=;
        b=May4S2XmoKQBhfqRvW1yelRoS5P7Mvipz3vmHOIsr/mv5NTuDvdHjCD1rnPpSxk5TH
         H7rmEiB8LVo1YM5Dpw6qguOHjZU9PawocYDutHHhjb82hGmOesWI1Oe4e2dUOw4XRvMF
         k/5CWG6aE4VzaA/x4KQTngEiseLAKH4XNEbGQhK042nibyl4JDSPD0pylcIgiCFClj8y
         NWa/I2LvlpSfj5iw8K53ibmZ5knbLbrAAe12roK8W82rfvKcea2YmWDyp3NHYv0VdX1U
         Faaitnv5KgkVM0ORr/oj2tzpLTHCJr2EoUnh5feVBNNybmNAFeG4I/ZHE7raqJ0x0nkL
         RNew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797178; x=1792401978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1DLHRcFWGRMXj45+dEiiprV4k2SPY5qTAHRqmLZ7S0=;
        b=A/z/fuYUh1wxDQRcYOC0JSCiBb5akQHm2vkscE3JR1uYNxvXq4CkDUyT/kJeQm61ZQ
         XTwYuN7zs0APLCuvy6VNGM7igEvHBt80TRGJAMDRgjzA/ESBRM38XrZEkOuq8XhnLqG7
         OZA2bycqNJMMd9U1kAbAY3Hn+OAzRx1x2wxMpIN01gCAj7OkY9N74gJVnJZ6fcFiBMvS
         uBTp8DTaHtm/gjTxCkFY9v7aj40+8PYnXEUz7wJycwS1jHM3IECB271q6LIEo+c/EeCx
         Ii4U0GGpl0YtsoZfFCYNsehB6kR/+t/c7uxq6Yk+lUnB2oHejikVgOWGoFHnB9V0Xjaj
         qpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797178; x=1792401978;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1DLHRcFWGRMXj45+dEiiprV4k2SPY5qTAHRqmLZ7S0=;
        b=jNOv26opiwt2htyyeX7CzbpQ7FnFCpSz7mH8DP6ZLyX0TqYW2FIkeBTgLZn7qtzXL/
         4pyG9bzWV2HgNEPA00wxM6qdf/4RM88OjQbedWEq3Q3yi4zkuEIgmeqI/T5lFLaR9SnU
         Oh54QCb8NhY00WDgK24j2cC5pHGQOwA6xXJLyxJZMPrlHJvL2Xl18eEhLxhT33HXkse/
         CQomce8/RDo8lCrTYnl4W0jGo2WZZ1wtkigrhrmEUjLbJMIdVq73XOyn7mKEJhqxFwII
         ffw7J42dfZJL2owkk32b5DI5L6ifK8Ly6IibVTNaaz800Z+6nJFY7B48pk+Gm/vHblzc
         oZEw==
X-Forwarded-Encrypted: i=1; AKwUvBzCNkZQXRpE7HHijIhU8ufoPB2fuBRW230k6VyXD7jyDBpSpA4HOLBk9IbP4v0fd1Jsqx7shqLytu9dtzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrpeQAvKJ974jRc7SAorUhFw2O0zrhDU9Yq5zUep43FOdu6jqd
	zljjggZx0ePtjK1qCYbgSzV0rAtGn54UnExLb/sBVj6mICoSTRVfsFEWHO+757zSVa1mhSA6OyK
	1SpRFDbn1lSwhXI0Y9xOtmEPRdB+I3o8=
X-Gm-Gg: AYBFou0v+drPoHCc1SWbM+ItWUjN9vjCTe/MAiVCUbqXuZ1NAp73SoixbcS1X75oPKX
	3UnUk+S4NoAyzIDihcw8NGFJF2qTgSz1wXb2063zvqtEO8kbbXtP+WGeIVzS9+H0q474TxxA92w
	cO7t/aZcRjfZrV537Ou/QphHoNZ27DXWzkXr3RbOx2GoVaZgeQ0pOu4SF8nS2EEYrTrV+OXeaVW
	LOmywrzPuxJJXIaOM24j1HzU0Ua0hJcLpVfk+8EAnGAS5kcBNdd9ukyQGSIVHTEQXXepehE6wjO
	xNjz9e4krCykHzHGScDz2q9HCrdXyas6c7ew/TYH0MP+3R/kwIV2wayhyA9+B8nD5FIv2j0zmJN
	iy8ckWDr2veO3obLmxn4BC7k2qPRiPtHq2XLdRY1dbSI6hONTGgfAna16DjwPayF8GFRjalgI/o
	r2m2vpIvnP5P3HU/jW9pwXihkLWexvOZARjqw7Pcnq
X-Received: by 2002:a2e:b888:0:b0:3a9:9b74:b035 with SMTP id
 38308e7fff4ca-3a9c5352a7dmr19646981fa.10.1791797178338; Mon, 12 Oct 2026
 02:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-6-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-6-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:25:41 +0300
X-Gm-Features: AclHuK9GwblMnTPQvaiV3jDrr3vRaqwQVyHQB-cZx-ew8f4fHdAz2Ca3vyaKuZQ
Message-ID: <CAHp75VcadkqzMxShq1PLzqgNZypB+vqr3a_m1utu-NOx39iK1g@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] gpio: mxc: replace of_device_is_compatible()
 with hwdata flags
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
> Replace the runtime of_device_is_compatible() check for "fsl,imx7d-gpio"
> with a flags field in mxc_gpio_hwdata to move the power-off capability
> from a per-instance bool populated at probe time to static per-compatible
> data.
>
> Introduce MXC_GPIO_HAS_POWER_OFF and a dedicated imx7d_gpio_hwdata
> instance that carries it, along with a mxc_gpio_has_power_off() helper
> that replaces every former port->power_off test.
>
> While at it, factor the register offsets shared by imx35 and imx7d into
> a MXC_GPIO_HW_DATA_COMMON macro to avoid duplicating twelve identical
> initializers.

...

>  struct mxc_gpio_hwdata {
>         unsigned dr_reg;

>         unsigned high_level;
>         unsigned rise_edge;
>         unsigned fall_edge;
> +       unsigned int flags;

Obviously you need another precursor patch to move from 'unsigned' to
'unsigned int' in the whole driver.

>  };

...

> +#define MXC_GPIO_HW_DATA_COMMON        \
> +       .dr_reg         =3D 0x00, \
> +       .gdir_reg       =3D 0x04, \
> +       .psr_reg        =3D 0x08, \
> +       .icr1_reg       =3D 0x0c, \
> +       .icr2_reg       =3D 0x10, \
> +       .imr_reg        =3D 0x14, \
> +       .isr_reg        =3D 0x18, \
> +       .edge_sel_reg   =3D 0x1c, \
> +       .low_level      =3D 0x00, \
> +       .high_level     =3D 0x01, \
> +       .rise_edge      =3D 0x02, \
> +       .fall_edge      =3D 0x03

Why?! Just to save a few lines? This makes it harder to follow the data par=
t.

--=20
With Best Regards,
Andy Shevchenko
