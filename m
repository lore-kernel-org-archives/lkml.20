Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D849638F954
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049338; cv=pass; b=JRIEgtjOf6Afq6lDqOqjAZfehkAGBaQI/b5zgsc9GxSe8FUoJWZ8TfQ0Ypn6eZwtaIu9TDmpLzG00LVmpEknTTqJx8gAa8BVo1RFoJYgFQB2Xc/MvXDJPToZ32BtycFRje25UwNfdzqhC4A7ZFZnWeGZV0kiXkFzPnFUtQb4FuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049338; c=relaxed/simple;
	bh=N5fbkltW7ZPmNluYPIoQJuzlfwoaYBrbM7dscA21fgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOmWuwW2dNp85PvkdkAcWBlIcOZIjmdzcO1E45Z7vQOgnVVK+Q2OpUn0klDLn97aznCnBDKOLZKirXmdJUQQ43ITXN8qXATTd7c+CVIjDkAsqmMFxOr3fpCnHyZkoI5OLJ9fZD3nlvwElhN5tyDi7KEh5HSJJLuLnZBWfz4CuuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHzIOSHC; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHzIOSHC"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e01f5c0aeso98598566b.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049335; cv=none;
        d=google.com; s=arc-20260327;
        b=XfRYVkn3ym9aNzZccGXdurpveo4sNuoXNtufGiNuTpEpawqvNSE3neCMD2iBL3YQyO
         mjAGqS8qoERthgtthINKV/YdgTPMGOOCNJuDkE7nNxnpqCmzwBx4cjVpWmRT0OcMZ/2k
         nHvE88ZTEwRqAT1zwp/+2VSon9HaQkhs74PPCa56n5vh8JOfcmYSzAiSyEeUHi3P1jdR
         h2iW+gF9CUw7Mtgg8tR8jgiH+2B7PKTnEK1Rc5QIkMLCTjL8J8FO0k5FtnCXGrGyZ+H1
         pru9D9XwUXP10jZEQm3ju0UoMQ5U+LOZEMvXrXGrY2ljQvg7XMPDfFZJgRBH0Dr+faJL
         nRxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wb0uZA3G4W3HP4zsAOWx40esmjqDsaAyOseskYQ6rWw=;
        fh=mwb5Rvrzxf0XHlzns+dH0plwVoe9fhqUCkl2JmbeWLg=;
        b=a2G4HskWZ5VkYhutGPQHNkQdc0P96Pz/ozNvSEUcF+UGFbsCOQ2wtoKnCe8f1nU/vd
         p7hWHpM5wNzMmAjuGWYzY1mG7VMVgUKPsXAQ5OG7hL2AKPhXKaTUtfiadUEqpiP5zxex
         V0XUXywoUmaGTzMz1W+t7u2428fYADXV1iJP96T66hJlNLKLTQJJ2lRLqD6aHT6nqMMF
         P6hkHGC8XSfd7GmXSxhwCtxlan18gzWbjYka1LVzXDLiBUw897zHwtUYynJUhFJRZpyl
         W7DZGl9ICQlDVZdUbXra4vJxf+pU3ueWg/W+YE0lJXcEbAwnlTtWlBbBKGwgANP5rmaT
         2BDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049335; x=1791654135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wb0uZA3G4W3HP4zsAOWx40esmjqDsaAyOseskYQ6rWw=;
        b=lHzIOSHCAaFU2lNp042dgOs+jDGyzL8k1Vzk3XHc/nnKBrbreMytiXo4/f5wFcaOeN
         wBTPES41ICAukY+OE+CioV0LIg3hm6p8KFHHh9EyvbxRJlJ3TVC0EHapRgIFzuTiBvIf
         Zzm/WVLC6ZbFWjCgIM7h+LkjDU1tnz4LNk35/8CfGOf955wLy3/IDnAyUPfpOaCRIpMn
         L0VaF3E5OGPIXa7XEFlCvhzEjIYmY3ZsCafR0aWZZHMZ92/ha8OaS9kRSyyU13Wslq9A
         HJJ+Qg7f0XBIPCVBIlGsX2yjEWilT5YlZUyrVBIHQGD/+9dwBwQ/JYmtQ4z5rftgEkXr
         690A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049335; x=1791654135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wb0uZA3G4W3HP4zsAOWx40esmjqDsaAyOseskYQ6rWw=;
        b=JFMqhYJ5DA3/9ioa0QJgA6ZlfOPjSSwNINZYkaMDn0YHWkn2mlAP0fHJbXm4GTAlf6
         ph1/sSoXxvxujAxqjeUufAmaszEKDgJIwgditc37pDFK8SuG4yGtA/XaQIGfcAMRzGEG
         9HxSWJb+kr2LxnZvbxvkeq0ytvDmIG+NKCfoR+jSsdu+DJ8dJsEv1wQcwNC+wXzTBn/0
         jEk2+6sSZIZ4C8pY+3WgDyjo6LhgYKOdk+MHNa0s4B4DKx7CrObTxIfO2aKdnAPJFVd1
         S5ZwZ9+ehr9tT3lJnSX0ACCQt0JgAyvJEfF5Z2hZjuqgCkkdKehL0F/ednbwGms6bEZJ
         fQqg==
X-Forwarded-Encrypted: i=1; AKwUvBx2v7oCNgpXDrg+QBRBMgpyZ72bHtnI+n3LvTP4MATIU+a6oVqy4Vxy5kB160SmgYZ6MJf/nj2WHHOBaeE=@vger.kernel.org
X-Gm-Message-State: AFuF++nrTgdufWZvDQB/9+seiHxDHZswyTCp2uRT4TfwddUGAgvjBBdd
	jARmrl8cc9KqxWoY9DZro6dBka89FmwiOvqJUhXyRaRnerIjCUa6WFXXoG2gE19AyMa41J1qHCK
	Ji58kh75i+rDbZY78qf9CNN5xV/uqoU0=
X-Gm-Gg: AYBFou1giMY3GEBRUwRcyjtk2Vwckw2PjGVCTtUYgsxeQT+SvGq0QCuFoqn1sFaC9GD
	ZEuJ6lKjIGw1ST5IYQ/BNXwdCod6asIbQQ00t9usO8G5T50V3RYqTsm8EmCcDIEqqnrjkM5Wemp
	pcqdhH8n4KpHEttR4gh6jlFv8w0Skv9qUNTyu8CJuuBg98CrOeUoe9t/OztGhELGQJZmoQHfKOQ
	8fMA/ntVSL/52HLNwpyQ8YQR3K+CO0TWcycA2PX05N6zr17M2/ZJpRdLAvW0FRZ7G5LTUNIA/Vf
	S4lYyFxnYbPTJ/1fzformFNSQ+c3RoTUV59J3MljzQWqepN3dIetBCzZAXtQNhhCgEUOBypYx4Q
	GX8/TJq2QNCd0r4YEdJNZ01cD/aTx4qjBENuvGico36YVku204FfWCavpLoEai5AK6S0kcUPnwl
	iMUbWVCGmtjtHrCuJNGEbUulnct6ytch55+sSkUYXtMg==
X-Received: by 2002:a17:907:3e93:b0:c26:1649:47ab with SMTP id
 a640c23a62f3a-c2e4af30556mr531245666b.33.1791049334807; Sat, 03 Oct 2026
 10:42:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-2-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-2-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:41:38 +0300
X-Gm-Features: AclHuK-YbJvYMQ90snp8Z-brjwfCdtteRLBnw6C84XXIIOdG-WKJaroDt_HV2CY
Message-ID: <CAHp75VcDrc0a+79HuUVQw77ALVywxag5hXrzjg8mZ7vALZ99Uw@mail.gmail.com>
Subject: Re: [PATCH 2/9] gpio: mxc: fix wakeup_pads bit operations for correctness
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> Replace the open-coded BIT() / mask operations with the atomic
> set_bit() / clear_bit() / test_bit() API. Atomic variants are required
> because gpio_set_wake_irq() can be called concurrently for different
> pins on the same port - irq_set_irq_wake() only holds the per-IRQ
> descriptor lock, not a per-port lock, so concurrent modification of
> different bits in wakeup_pads is possible.
>
> However wakeup_pads field is typed as u32 but accessed via set_bit() /
> clear_bit() / test_bit() which operate on unsigned long pointers. On
> 64-bit platforms this causes an 8-byte read-modify-write on a 4-byte
> field, corrupting the adjacent is_pad_wakeup field.
>
> Change wakeup_pads from u32 to unsigned long to match the bitops API
> width requirements.
>
> Also fix the disable path to only clear the wakeup_pads bit when
> disable_irq_wake() succeeds, matching the enable path which already
> checks the return value. Previously, a failed disable_irq_wake() would
> still clear the bit, causing the driver to lose track of the wakeup
> source.

The above is too verbose, try to squeeze it to the point.

> Also fix a latent signed-shift bug: the old (1 << i) expression in
> mxc_gpio_set_pad_wakeup() has implementation-defined behavior when
> i =3D=3D 31, since 1 is a signed int.

Too many words for a simple (non-critical) update.

...

>  struct mxc_gpio_port {
>         u32 both_edges;
>         struct mxc_gpio_reg_saved gpio_saved_reg;
>         bool power_off;
> -       u32 wakeup_pads;
> +       unsigned long wakeup_pads;
>         bool is_pad_wakeup;
>         u32 pad_type[32];
>         const struct mxc_gpio_hwdata *hwdata;

While at it, run `pahole` and update the arrangement (of the members
you touched here) accordingly.

...

> static int gpio_set_wake_irq(struct irq_data *d, u32 enable)

>                         ret =3D enable_irq_wake(port->irq_high);
>                 else
>                         ret =3D enable_irq_wake(port->irq);
> -               port->wakeup_pads |=3D BIT(gpio_idx);
> +               if (!ret)
> +                       set_bit(gpio_idx, &port->wakeup_pads);
>         } else {
>                 if (port->irq_high && (gpio_idx >=3D 16))
>                         ret =3D disable_irq_wake(port->irq_high);
>                 else
>                         ret =3D disable_irq_wake(port->irq);
> -               port->wakeup_pads &=3D ~BIT(gpio_idx);
> +               if (!ret)
> +                       clear_bit(gpio_idx, &port->wakeup_pads);
>         }
>
>         return ret;

Instead do the following after the if (enable) {} else {} block, namely

  if (ret)
    return ret;

  assign_bit(..., enable)
  return 0;

...

>  static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool ena=
ble)

>         for (i =3D 0; i < 32; i++) {
> -               if ((port->wakeup_pads & (1 << i))) {
> +               if (test_bit(i, &port->wakeup_pads)) {

Instead just start using for_each_set_bits() from bitops.h.

>                         type =3D port->pad_type[i];
>                         if (enable)
>                                 config =3D pad_type_map[type];

--=20
With Best Regards,
Andy Shevchenko
