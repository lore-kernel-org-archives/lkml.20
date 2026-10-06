Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBC53C6A57
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275816; cv=pass; b=YQQ4zqcPHqQ1qa/GTtQAXXUmbClm/vRCLWaLHJi2J+mwbV/NISCOT3TuqNhX/JVcVQR89sduhj0h7BRivTbgKUs6OQG9Wso9+TnVbe9NQYud2FeDjjQ/HRWfXnFDrK/h06lZw4C6ypL5tFdrWBfJ6JIu9TSD1cSKm3HM1/OObFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275816; c=relaxed/simple;
	bh=QLEBVnIW+aFeWqP804aoo9rQfAzOmPivw26f4x4A/wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqmG5HIdJretPZVXEHA4Vffyly5bf1mEpg+Rna9W7nJMR38lg/Lg/pxtCGNXpAXKDZdCebmCNs+Wopl9jsoCtTWHjX5+9MBQMzXt5vfZIVl+7rDhjYGLVvBOA7OKV0J5K4uFN3GCEe1dLaUtleefwqZASd8GqQlwGCbE006F20A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9TBv+5c; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9TBv+5c"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c315869241fso201536366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791275813; cv=none;
        d=google.com; s=arc-20260327;
        b=CG1jBTXrUxB64EoHtly9bXHknzEzlvrp8sIeldg1pQOvpJxi/+lIKKxRjopp3Lw/by
         Dhf9h16ztieqROLHkCUQqw1aRr+RJOKTRC/7oRkgCtPPoTQlYtLrZ8Gi0u9l+GIq5cnj
         rR6GyD/aG9CJ/ileFzZ0N2Xm4eKCEDJ7xGa4e/T5KiQQ8IkFneo7wGiy76BqBZ3ZW05H
         96IwGgN1DH544eIVeMoB99CvdywHCP0M7RKrjRRkqw81m/cXw1QnyDYW0dg989m1AS1W
         u46fAe3Jh7dbEECjSNpceBbTgwMYL4hEH5uB2sIiDyQoYZSDlWqzXVbBZQ0B5ymBY+Gt
         HalA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dPUBVtwXpkjB73xJy9d9sGCYrAAokkcesa5s+T0NIQc=;
        fh=RqS/IxsV1TYP7ptEOHsFSDK6hAyRY1jqr2SP5j/Jzf4=;
        b=faikSgg2Lsr9Zko8s/L/HdtqZ1winT5d7uD/5Av+w++GI9HB7+o+DGIq196OGyAyeI
         KaPssrsrM8sA3zPEAp7/o/1/S51zQewssMa05A69Dqs2S6zPuCMaNw452XxzsEvjLz41
         leeOuIUyNSFlXdGeIdZWdfZZAEEhHPEvi+gcxJjsBOngukXBWb2IyhF5U8i73xUNRAxu
         HfuAUMeU/tFOZXyguYFKQ0cbTxq5esNI+a8IdoJ5wAwh2vvKOhBcESmMqh5ldRdH1cjr
         tm3eWs2LVRkk4NU2M5UUcPc1I/iRp8Vob6Il5jCNFo7pDbc9IU6dZIfpsS+84KXpPkCG
         XQ+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791275813; x=1791880613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dPUBVtwXpkjB73xJy9d9sGCYrAAokkcesa5s+T0NIQc=;
        b=e9TBv+5cXsj1ahyM9umZgzC8HYb5dPcrI/ktr1JgcjHoO1Ij93tc2tHW8Gom/gASP+
         XVQDFM3dMpkVjT18Beccx7hDavaR6pxiBDC/2urHuxO0hJqVBIP3G5DVbIP7QBousxuZ
         e6DWPNCDuJPPXtCSKvl8HZJ+u/GzEEmxFKNVe7gdMSZP6WSZ9iQTobLXFsa6FmkrB+ID
         tpN8n4cbLjFeB2o4eJ5PQfJrPVVArkzLB6ukyf7QiJUtQVDorr0XG4rCGbksMj+WEJ0M
         B9cgWrzZE8bryZMY2jxNsyjGXu1AcjUYy6i+CI9MErtIlEFGhjV9ldqC493Xh+zan67/
         vkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275813; x=1791880613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPUBVtwXpkjB73xJy9d9sGCYrAAokkcesa5s+T0NIQc=;
        b=dFkgJdxNqvHn+coY+hyoYtUdNMZ2IqEVqqPVlcnx+KyTE/xBIZwQw5vLYX7g0mVjZG
         g/GnfI6LTa+SS1aLDbdfFVBlhQzR7HoFF0uQMFaBCDWUf5wm6w62897Fi8LzBE9YHgKx
         lYzhA364GAHrLWGZ07fY9s4eW1TY6Jp2TdUmcgPLoOvffr9HQPC9fa4j/CcI00SNH1vd
         sGiFWtUkuDUAC24xwHGGpXVXqTNmNo39uQVSKmSzaGkXsb8u53AnrmoaACvmdO34ObOi
         OqlnmsDa35TOB9yrRzgX2WNR/gTUIgvWoFmKsw2IkLLBU5CgXcqZ7RVSEOJ/e81yM/+Y
         6uRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhHzbLwUkHfAaOVCM5Sy9zH8nD+9AgZEIhxlJOFCx+JfxqckG0A4RJtYIf7RC+ZWFmI60rRkGFR3iWWfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkYKO9jYjb4bx0aam6vzdNqlbkPp4YL8T7Nu95psf3TyOZ9+o1
	s4HvS62GgZCYfwkyi2XTeS5cKdeXuvE+uRqGxD8xi4PcEqUhOdF7mDLvVhVU3sOSD4/KVU8IddF
	MiTqIjxY8LfdZdd6nsNDXGPeCuQIPD30=
X-Gm-Gg: AYBFou2a+klqwlUrWv/BATcFX7EVVKDyI8XKbs194/P3exPpeUAy677RW9Tt4t9K6xp
	dujWJ/jivgurrW1qCbZbcyDBOZrV/m4TgcX6Kn07O0vGWgRNUajL3rOOdS98okXy+/wqGDVQjPa
	EjfEkt2yhhNtlixE9KanXCY+euAPteQJBfOfmnbtz/Aum/ZLKaLnklXWUxPla2L122LjBDgiHdZ
	IciJKVg2fX5zVimPrBZB9HR1nXRUsvU8bgHz7ltpB8y5tya60v7SI4AlmxQyRGIrX/uUafEImWK
	Q8xilaWruU7MyFn/pj7jRQhmeXyt8XidSsPs7Kjus5Wf5JhYrc4CRrXIzIEZkaHgoc1zB5ph1mg
	fceJbMHhNlbk4aEeDV2rveDtE9KgPslPd3F8uKyiImK/eKkDf+u5gIz9lNJUEKGp0pNeOCCSise
	J97uVDAC6fksjv2JY7nW2+BpC3/Uyp1sQ/R7bqDw==
X-Received: by 2002:a17:907:72d2:b0:c25:5d2:acf0 with SMTP id
 a640c23a62f3a-c2e6edd8780mr930969566b.8.1791275812937; Tue, 06 Oct 2026
 01:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com> <20261005-gpio-mxc-cleanup-v2-2-bdc3afbb35e2@nxp.com>
In-Reply-To: <20261005-gpio-mxc-cleanup-v2-2-bdc3afbb35e2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 6 Oct 2026 11:36:15 +0300
X-Gm-Features: AclHuK8Hq92bjRrFR2TwWslr-iyvEz8Se8OVWpb4AqiThf6eR9JzszKQNdfvLEQ
Message-ID: <CAHp75Ve+p6TMr7MwQw0orGdjxLgNBN8gfTw2SY+EKBBgCyYXgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] gpio: mxc: fix wakeup_pads bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 5:24=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port, so need to use atomic bitops when modifying wakeup_pads.

so we need

> Since wakeup_pads is u32 but assign_bit() operate on unsigned long

operates

> pointers.

This sentence doesn't sound like it's finished.

> On 64-bit platforms this causes an 8-byte read-modify-write
> on a 4-byte field, corrupting the adjacent is_pad_wakeup member.
> Change wakeup_pads to unsigned long and reorder to avoid the overlap.
>
> And the enable/disable path unconditionally sets/clears the wakeup_pads
> bit even when enable_irq_wake()/disable_irq_wake() fails. Only update
> the bit on success.
>
> While at here, simplify the logic by consolidating into a single
> irq_set_irq_wake() call based on the enable parameter.

...

> +       if (port->irq_high && (gpio_idx >=3D 16))
> +               ret =3D irq_set_irq_wake(port->irq_high, enable);
> +       else
> +               ret =3D irq_set_irq_wake(port->irq, enable);
>

This blank line may be removed.

> -       return ret;
> +       if (ret)
> +               return ret;

...

> -       for (i =3D 0; i < 32; i++) {
> -               if ((port->wakeup_pads & (1 << i))) {
> -                       type =3D port->pad_type[i];
> -                       if (enable)
> -                               config =3D pad_type_map[type];
> -                       else
> -                               config =3D IMX_SCU_WAKEUP_OFF;
> -
> -                       if (is_imx8qm && config =3D=3D IMX_SCU_WAKEUP_FAL=
L_EDGE) {
> -                               dev_warn_once(port->dev,
> -                                             "No falling-edge support fo=
r wakeup on i.MX8QM\n");
> -                               config =3D IMX_SCU_WAKEUP_OFF;
> -                       }
> +       for_each_set_bit(i, &port->wakeup_pads, 32) {

This change can be done later, can it?
(I mean in a separate patch)

> +               type =3D port->pad_type[i];
> +               if (enable)
> +                       config =3D pad_type_map[type];
> +               else
> +                       config =3D IMX_SCU_WAKEUP_OFF;
>
> -                       ret |=3D mxc_gpio_generic_config(port, i, config)=
;
> +               if (is_imx8qm && config =3D=3D IMX_SCU_WAKEUP_FALL_EDGE) =
{
> +                       dev_warn_once(port->dev,
> +                                     "No falling-edge support for wakeup=
 on i.MX8QM\n");
> +                       config =3D IMX_SCU_WAKEUP_OFF;
>                 }
> +
> +               ret |=3D mxc_gpio_generic_config(port, i, config);
>         }

--=20
With Best Regards,
Andy Shevchenko
