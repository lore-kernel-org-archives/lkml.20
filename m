Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80C93955FE
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050384; cv=pass; b=UFEGDe9VB4pABTZK5/9mXgTU273ikzoJhIis2N8WYryrrN35EivsclQVGy6cSItymsg4PUH2xjM3YV7jXveF9+gyd+d6WOyDi4luI2X7fFPsUkKlAQ3uiu/6QohNAhYAliA8UzAsnhkfazw8BIXDGeLitSVcfyxSxz1WMXWJOXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050384; c=relaxed/simple;
	bh=izuBF8S1Jow9r5hzBkHRDbHLg5CQ1A34xxxD1x1CJtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2ZBZONIah4m+V7i8QPCfXH0nvfti5J/gbaJqinC3BVDHZigs8GTKmbVZzqoSIMHMvSIMxdKcxmPDg+iLZcY7eYJZbrgBSniRh3Oe6cEKlQiTmoWNZa6KQKXLECmzdrF/YCkAkGV24PLvEFf8FrOpfxHLsRiaP3Adcn14sPDDt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iqz2UoE2; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iqz2UoE2"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ff2313so50939366b.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791050381; cv=none;
        d=google.com; s=arc-20260327;
        b=B4GWsvq4EQX6r9HkWbQFy4BrldulsmqNnubGAO/d6ZGVTljUJHrqba01/JJvBKYcYp
         vQURN2VBhigvl42TFR8ZsgRPLEMF1hTBlr3yIGKjpM2Cu2jMwcQmUK46dVp3PC4CECep
         wWL68HxIoGN6ZbH09jUjk8kDdI+E+AmFi0q++aOK29Fb6CViiUNP1zdBeJ7OX1c4bTXC
         6DIepa4jyBnp4BKpqjFgPHui1wGgaDzwPBNdBPZKwmxA4KPxIbSqyWletq01Inj6So3P
         zvSCQ9JEUvwCQVwCK6xjZfhY5IvHLX3FV8THnE/fNncaTG+Blx8vXpsJJi8nYA3u2SL3
         aC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZnj3SSIl2LiwkfFgN70DpIUxoFz8apLMgOo9Neg9z4=;
        fh=2v0LKAkPAXPeUQArRbxZGHNisFhWYLgOH/5tXYbifZU=;
        b=IxRWazWKmKLo/AF0r0H50W+jueDWZXLwkrKDdGiMy7Wy4a3A98CzxeXdrjPFAi4VgY
         2sTINSWabMZF3K9AzsNh0BOYwRpUPmKQcKreT1xTXqkyapBj5CxrzT88d06Jfr1JOC/K
         MVlC0JfFxUV8f7C0yrOoXRH6Nxb2YCqNwcwKOBPTKZeMpM4KAJvifqH0QOPnEdaqNFdA
         yQvEITqDCL8h1uMk9YJ8W3WxDeqCyvWzTH/bSIafhL4pWeozfTySagFU4CgjgeJEZAK9
         RH1xC751cQHxH+qbeGo0zpLO7DdsQyFCkhh+TC4tkiR54cFUX5rxNPj/dSnBjMrfQCkZ
         Kvjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050381; x=1791655181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZnj3SSIl2LiwkfFgN70DpIUxoFz8apLMgOo9Neg9z4=;
        b=Iqz2UoE2/6vUNWCJ0tXZN4NAKJc0/Gwy0GwDIGZXW+V0186brxC4mKq0lMZ0CUrtUQ
         95O0eAg6IC/8eTgQogpKku+JT7msTJ5fU2e/8jjCrzPWIsWUf5ixaVRGxLSbjDhOdDsJ
         1hZVMX0YlXZQ5JqupHvOX1ZZyDJJpBN0YG19pJJ/rQ0X+dq5Lkk1YzNNSegY/VqZbN09
         TJ4oSNoCwEJbPYCfazh7g4AI8YSLX+fHa6WXniZe68ZXZSdAeXAFeJUjboaP7kf0Ac1r
         8/PGyelQ2ik6X9xf7iAkpnKLxWdEJr+7Ozpe489KOLzCSLOMcybYbzON2k79whmdT1ph
         Zr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050381; x=1791655181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZnj3SSIl2LiwkfFgN70DpIUxoFz8apLMgOo9Neg9z4=;
        b=Y3s2XYST9nHyWBSIKe671wY3JgqLaL52sGm1Amx6blZFJ1bl5uZSmJ5spcHyuBIHGo
         2el3xmCr0ZNejUGXGhr23TjhGlN5mcQsyYOeb4BYGteMrhrICw2TIqYVQcwKjrs4UAfo
         6bJubZRxaO3XiTc+Zf4HqNIWrVVEGQM2V6lfGJTaCABtEoIon4QTeQmUIysXKa10LIZa
         t3XrynVi9jdVn0uP4tEQVucXKRi+sxHIj63ZU3jy1vYgp80U6YD+VY4wpJoNYAEI9pmF
         NnCyhGXjLsnbEKNMcMH0P7Un4Ko198nyv7YrtuWQexBvTg+p8MqXItUU+0wXnOMdEno3
         Eqmg==
X-Forwarded-Encrypted: i=1; AKwUvBxmNmI4vvFM50AKRxRzNbLDVZHdVIf25dNvSZz5J+sSYVdT+3mQz1132gZ2KsFZrVLWxpA3OYvcUIO/ffY=@vger.kernel.org
X-Gm-Message-State: AFuF++lUl5i9aQFp1GSW2dwk7COOlNspk2xgZvbOCtbSx+ByUS4elNia
	0VC6F7Wl4PJIzDItpGh33MadLVifXNBQY6FYggckzmkZr5I5ipVdckr/47FYgdqJlSlrBInJSjZ
	eUYlD18Cjp5alNt6roPUVp4pRj2+LlEc=
X-Gm-Gg: AYBFou211ylsXTQqAaVv88hoR4DS503CeBpwdSRrsFtbp2JY4iEPDEWFkyd7jAkVPGx
	9DdmxoJr9XYPdb2NUgOm+Wa9D/WC5ndy6BDIVYIKFKJMjXPKUYMvqpZoCQx7/ahCPaqi1C5DBFo
	uJieYBPgZmcI94QhRRyi9RF1vgzYfNV+3mnW+U0utRRc2nXML6BZucTgvfoV0PH/3ae2KAn+KwG
	0n5nYeBnsIwR5n0vtwSnr3FREMYsed+UeEn1CzuYfKWnLe9PAHPeVKwwCXxP9SqnDEwpJqNtF9+
	uYNX7i/fiLZkX0IdCd4XXcQKhOk0RiU5aEQSquCpQfoUFZdEYBu7o/KvbESGUJf8fPz3QADpZXh
	Q0cBHXwsYstHSZKx9MQ/4AnkoxA9rDZzLjIELCscHjTrnQUsLR8ue2Wix3yqKxRUeQl+1lBmFNY
	hTBbCJoWajg5bc2GdSKjnwm+k9vKvryi6MsrTYH1dUt9mc+MPZVmQ=
X-Received: by 2002:a17:907:3cc2:b0:c25:f7db:4bec with SMTP id
 a640c23a62f3a-c2e4ad53be5mr531992466b.18.1791050380759; Sat, 03 Oct 2026
 10:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-9-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-9-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:59:04 +0300
X-Gm-Features: AclHuK9OR6BXTLgAb_C7YKLGSH3aGu_DtrvC657Cue-9gwAbeSx8tKkdBHiKuRM
Message-ID: <CAHp75VcRG-LzWSsg8neDOS7qj0wfp3QMoKkDKEYhoobRbfv+VQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] gpio: mxc: simplify gpio_set_wake_irq() with
 irq_set_irq_wake and assign_bit
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:10=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> To simplify gpio_set_wake_irq():
>  - Replace the enable/disable_irq_wake() if/else branches with a single
>    irq_set_irq_wake() call which handles both directions internally.
>  - Replace the separate set_bit()/clear_bit() calls with assign_bit()
>    which sets or clears the bit based on the enable parameter.

...

> -       if (enable) {
> -               if (port->irq_high && (gpio_idx >=3D 16))
> -                       ret =3D enable_irq_wake(port->irq_high);
> -               else
> -                       ret =3D enable_irq_wake(port->irq);
> -               if (!ret)
> -                       set_bit(gpio_idx, &port->wakeup_pads);
> -       } else {
> -               if (port->irq_high && (gpio_idx >=3D 16))
> -                       ret =3D disable_irq_wake(port->irq_high);
> -               else
> -                       ret =3D disable_irq_wake(port->irq);
> -               if (!ret)
> -                       clear_bit(gpio_idx, &port->wakeup_pads);
> -       }
> +       if (port->irq_high && (gpio_idx >=3D 16))
> +               ret =3D irq_set_irq_wake(port->irq_high, enable);
> +       else
> +               ret =3D irq_set_irq_wake(port->irq, enable);

> +       if (!ret)
> +               assign_bit(gpio_idx, &port->wakeup_pads, enable);
>
>         return ret;

This uses an unusual pattern, we check for the error first.
But also this part should not be ping-ponged over the series, it
should be from the start like this, see my comment against the
respective patch.

>  }

--=20
With Best Regards,
Andy Shevchenko
