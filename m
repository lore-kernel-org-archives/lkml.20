Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FDF36E477
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797284; cv=pass; b=X7PvvGq3Ee77Av4f7jRj5OIBYhPq61pJGwYFNCTPTfygTu9FgChrXE8c6xLFIhNO3Q1CAz75+KWIx628UbD2EXhZjByxBEBCCjwr2CHvP/TaP6D8HgS3/mllRzclbEJ2PJkO/rvhei1AD6H45TrijNfOjf1ZDeE7A87otmTTDF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797284; c=relaxed/simple;
	bh=ZQmvARbCgXiJ/YFm0TMPhZiaIp+RRWfinoq77aEij7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4OuA+ZI0XHtAip0rGwBOV4T7t7Smjxi2jNRrWpGzOzMI3cOk9TX67/q9ZCEV0OmsBjof2Dt3pmGj+MzzieCP3bIXw8pqXdt7w9saxNsosPsvHgILHN+S75poysbTYRnlHnlNS5+k6G3jfBx2jnV6tSCiMWcQm0mUG6x0sJ1skg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4YodQTI; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4YodQTI"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a5a26c8412so16528661fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797281; cv=none;
        d=google.com; s=arc-20260327;
        b=KyQ/0QzVw0zEd5af7OHq5xVTTfEPdIz7vrJxZDyINkd7AN6WzLFtyWe3i1yI2pAIrJ
         M2x2i27BhAqsUAoGRYQ8VpVWlnI6RFFtHuow8WLh+N59f1sQXUvIAUQxZxi3vYB/zIWp
         49wK8o6XxuGkLwPXz9bbsEhyu/dABFkQvT1dKOIhxoegl3T50oBpMi3PyKtAKQL4KuLU
         dI53c+7xDyyH5LZDd3BWsuPEa4jJcKfrztJnBM+XSOzYe9otfFMcHQ/2nAz8jruyha4R
         ViqmuvxCU5TbbdnCuBe39fjYXADdPI0ZzU8F/RNXzRF0bmKafIkjyh9Si/8Zs1Pz5tg8
         J/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DvmpQMhsElKYIhMGMYI2OVNGAllui7WBWbcRWxS8qE0=;
        fh=kIdxoCAtxiHippgmJCLUW95ROzM42KpzzDUszRUdPgs=;
        b=Y8jYBhWuKrATKLcxEvVIcJq9SfWO7mA9+0Mc6yl72NgriM7gJy/Y+U2UP+DBB+l9b2
         0nOOktTY05V9dgcMZd41+skVktotBTZEKR4gU6UQYl1tSV8FAHC5KFLi8dzoOk7nzcud
         yEgt3PpC1J4EtHW4DzL5vE3rS+x7rdQx1BNb6LO6ntUt6w/sRgHpXncwuLh+ae8Z/YMK
         NMZmhomNjr+5ztyF7htlRQ7yVDVkLigvvX16KJ5Brx+JXSP8QRk0jH3s5C1LxMV4WEmM
         ov2R9DeIm+d00ofq4tMyM2G4UI9wFxjC7ukLMcHQSq6E8wbpzMaHlBpa0BWWnz/T6JKT
         wQcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797281; x=1792402081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DvmpQMhsElKYIhMGMYI2OVNGAllui7WBWbcRWxS8qE0=;
        b=B4YodQTILQ9zaXAyR16qT0/VXnzTFnxW+BQsml7Pn3+4umy5Lr2GzLElACjcGU154w
         PaJY8bd8Xtr8tEL5pw2TUOLvcIxEPCC06aW8yrpEzISSTfftlWeRDWXrmOGk5d1QgKN/
         mwKDw6CyOwl6jlc4SMb6O9u1660zfL72aqwVyS7LAupugIqW9A3mD7A/DBde/TXNm9fw
         s75CS2tfvscCVlDzUSgTvtu83FgKIqNqoTWPaZPuAtIyYpvfo+yCzdqjP9gSQJ62kPIz
         7r+GACd1frCvRFEFAZYCuyfV6hjl3Aw/hx4acYdzwLYHAJQMfpKcA+Sfxy96r9hLhgg2
         KgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797281; x=1792402081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvmpQMhsElKYIhMGMYI2OVNGAllui7WBWbcRWxS8qE0=;
        b=B8kOo3jGZkHmklGESmf7JYlBvLImRdj7zCr+DYTKi24lDKkU0zk0csUHZBLpQq5BfT
         qcjmClnaPKKWHdjKxyTDAbiQxqSe3ma5Y+QIeNGYhpN9uvNywrYwSFH//njFBMQ9kGZs
         IulDk1NjPeagzV5uAwyleiam3X0zZOfQsRfWzr+8gmVVdJcXYL3z8GJ1YcA8r+jEwIcH
         ZLm0iztFdfXmQfyBIleNMquhdtDGWCWfS8dM+ek9WxgcTc+13Qy/AHtn/3VMck2i3hbE
         Cqf2eIGdbCihDQ4lIUvf5EAowtIvkdANF7Jtnhk/r6Dvt81Ku7W3v+NOqvDysirvCTBO
         SEyg==
X-Forwarded-Encrypted: i=1; AKwUvBz4srlK4CXh8X4Xf4PEfWOA4p+z3VLfJ+6X3EFdAx42A3CKhlDNKxStaSX1LRbUbiEblWI0gxurM45c17I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcaLDuRGO/qKGlHPFTXVVpgU0DeWG5PAEHb+KL+A36H7572gQk
	uXhEnuk09RKGNrF9SRpD61qvTVIv1COQLUErjd49VOHj45SpqpicGNHBKbdS88v/T2e7qIRSs9G
	ygcgN39e8xAfqs3o3bXuV+phWKHqQZsc=
X-Gm-Gg: AYBFou27BnCRQqKDQRZss+SN9jzHQnRYCA1RScoLZBPAldvuuTtgdfEC+BYW+9yb8KC
	3Ff9MOyskZhp6u8Fm5VDXNj8t4BQHbE51dzpuDYwIch2pbXp9lRUnoifo9KpvqmUBvy5TH9VGM6
	to7GGUGRwFnc3x/Dj6KhX5riRNqw7TQYwqRxIBJy+tzQGfr75XbxTdEaDNFKMpnca89RmvLwxSM
	+K6QW5E4r/XlciKyhnO+Om9v+4c+efIGbNGmAFZ9DcflG4vlzU4A1p8Qma/u+1qGTRrCToW0jNj
	j8FWC74sbsMgv0f1IVhPmd2Qz2sk/qVuH0bOgtu+/cvJzIDPloIwj1WaSVj0rUH/iPAp1aJRNeT
	Gm1GgHm6HEl05g/UIiEYtQNtnniI9JZoIZLueES8XbcN/ynIpdRoPEvGY2DQ/mq53aDkafbJk7d
	5E02yoaV94OIW+dKWoH6lyCstVf001Fr2r9S8HGpOVHDRp5Va0NoM=
X-Received: by 2002:a05:651c:2105:b0:3a9:7244:e861 with SMTP id
 38308e7fff4ca-3a9c512683bmr23826781fa.3.1791797280833; Mon, 12 Oct 2026
 02:28:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:27:24 +0300
X-Gm-Features: AclHuK_r2Y_fKFcYo0k3f82kRis_dPW1IUC88HSmLwzwEEkzairYJHYuqRzAsKY
Message-ID: <CAHp75Vdkh50W7j6oh9mg=DqyNu0ZZYX-aA0goqW+Knf0MmJ1ag@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
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
> mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
> of_device_is_compatible() on every invocation to determine pad wakeup
> capability and i.MX8QM-specific behavior.  These properties are
> invariant for the lifetime of the device.
>
> Extend the hwdata flags scheme introduced in the previous commit with
> MXC_GPIO_HAS_PAD_WAKEUP and MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN, adding
> dedicated hwdata instances for imx8qm and imx8qxp (also used by imx8dxl).
> This replaces the repeated device tree string comparisons in the
> suspend/resume path with simple flag tests on static per-compatible
> data.
>
> While at it, clean up mxc_gpio_generic_config() to use a local ret
> variable for clarity instead of the =3D=3D 0 comparison.

...

> +static struct mxc_gpio_hwdata imx8qm_gpio_hwdata =3D {
> +       MXC_GPIO_HW_DATA_COMMON,
> +       .flags =3D MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN | MXC_GPIO_HAS_PAD_WA=
KEUP,
> +};
> +
> +static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata =3D {
> +       MXC_GPIO_HW_DATA_COMMON,
> +       .flags =3D MXC_GPIO_HAS_PAD_WAKEUP,
> +};

Okay, if you want to deduplicate that, make another data structure
inside hwdata, or wrap hwdata with flags. But really, kill that
definition.

--
With Best Regards,
Andy Shevchenko
