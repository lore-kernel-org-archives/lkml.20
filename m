Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B02283FC4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 01:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788744070; cv=pass; b=WunNzs2U0NbujKXPXpnqpR4t/9f7ZAfzpviv5cxGwygt5JuiCDXECWPeZzJ1bAC0VUxNJqOBiKgzbEwUDweTm/HvZJdEXIpoNBrX9mbFHCVC4LI9cbJPe/lmHsCBWqbSp3ylj87gTRc/xoCkhVzIQH8/zuNDQE76CcaUIiIbUZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788744070; c=relaxed/simple;
	bh=dLy4e1qHLcvoLadjjzsNDriWy6dgQR+5gciIFi63BmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQjdqPQGjiio/e/5I6N6BiNLJ85vkWNhak3Jqw30dGchPJqGS12zntzL8Q0hXHAHo6WJTUxwuLzIIAm5sH5omxt5cjh6YvBQw2a1C61+UMK8FxrChzJV1yWWPQGGOwxq2DCTbcfWs2OeULmufeXmkijHfKEROPmI9krlVDNOEjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSfE/pg3; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSfE/pg3"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so4560474a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788744067; cv=none;
        d=google.com; s=arc-20260327;
        b=J/SOF7feuEoxxDONYelT88PvM2SK7NS9CXRMZRy7GaJ8eMlbUrhLHTKp4Y+wGGxcZh
         8kXaAabCmFuiCXyHIAFpC9DV7SqAWoyrmoYp006nVyxi9nsfL8ze9Vw/Gg9BrQQQKKZh
         wRkGVlDkNWl2LakK+NkkSyLNCIro52vYSldXgMGINcboFm5o8AWQShLs4HXnn+W6JlVl
         tFa+vvQVxBKnQZIXAOsoxO6Nvjr0VvaCHlYeX4jMCjSyLC6ne3RfTnv0RHF4HJGYtwlt
         L9+oz41ULL5XVI0K6qUe2P5cylRlpYxzVkorh+QD9piPwqCwlrbbraBDpQDTlnzu8WI5
         vpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EJdnZa7puyaFnP7aZ2zyhYbn4tJFzehkq2tCfsTQdIc=;
        fh=Tm0VlLrFS0kRGJKxxzAa+IuGpteApiHMcdDcno67+Ws=;
        b=hPOya/KIhrRwx2fJvP2f7ZVAlQnVdkZSqW92rHQuy5Jin1jdHigfjqL208cNjq4JeV
         6R5+1cKIcukpRrRvQofyGrUNObyIcYnEvdL2xDcqjJD6j5ALfHQDYgMgMb8h3WOPm/Sd
         PUtMWEN4YCPAfOownzIJMVJnDOc9lETzrzCfWNyYBr7DeWUyh1Y3ONWHkSkebZ38fFDs
         OM8bzS0kiqUTI7ATrb3JOYWJzQzl6MvvIWrxE3LfkbLwkhdrJ59whe6dOJ5dMtI8AO8Y
         YCQ5HOwxCfiSHWiPrTXHbOsc58OZ2dzMNabu0XpJIMOW6e+3v0/PFttHuoI4gIqQjpMO
         r+zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788744067; x=1789348867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EJdnZa7puyaFnP7aZ2zyhYbn4tJFzehkq2tCfsTQdIc=;
        b=CSfE/pg3v3t1UmDVqGC1Nf5YSCDwr2TzUaSV2BmkIt9K5eR9eI+ntyZ9GFJb3cFsUx
         OSgAkhz16/5x45UaBypYBWBHUT/Mnm9ThI1ZokzRqKwTCT3ZrH3KJkn+NG4DlPHP3IRT
         2D7vV4PbTHZ9YkpZLjzoaTtFLt5KpB7Y264FdJooAAjGEh2wAozY5cHCGUQ7mKma4S7h
         Y68YzQtBejsvH7T1yGn9s95glb/vq9is3pwlcebIs1CWef08YoF5EtX2YuDXhqhst66a
         VIJp4v3q3v/vWfJiufFKpqvmoLb+SscF7P0JzDFESClYJoN5hNn7a2+Km6LN1RFs1Qxr
         HYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788744067; x=1789348867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJdnZa7puyaFnP7aZ2zyhYbn4tJFzehkq2tCfsTQdIc=;
        b=p1xRRrhSbz6rk4feJPwx847NMALCPCk7GouPCYFWJSLDJ50YEg+xqH7ut7mcrdle9g
         9xd3sSotiSiIO/g95SV6zWgYht69aMcoHSR+3pBCkJ654RhBm0Utk14AAPins1eEm1rP
         KOdPpt9B1fdADJvgmiQrj6WTTf76KgnWknQInEeoDjKT1D+3TR//TagV5fpZdh8t6xBe
         0jiGIxZQO8iDakKYXPQflfJIfm1SZ3zPzj6Cnf/IXW5Q11yh01CsRuYS2ayghbngW4px
         M+7yjI4ob/jO/ZzmPsgi1moa+n9RsHrLcMmsOIfewA36hfZwYWc9uPJ3Q8oG/GDZ+xFy
         ZKUg==
X-Forwarded-Encrypted: i=1; AKwUvBznfm+e5TL9fVwnih6oPUtOhyAE3IMMI0sdj31oGu9HuxIAdAgwjLt4cECQwgZP2QxcN/bqUwk356i+zkw=@vger.kernel.org
X-Gm-Message-State: AFuF++nuNVjMJBEGUuav1m+r0zf8qsbA3+zndg1+X2BpbjdfnXF4k9SV
	nv6c28snbD1gmapAOlFiyvg4G8HI6va00ur5T7md4mA0zlyApIl8etwXuucb8LKohAu5kJbDrDE
	QkG80P3sbm9Ya/JowweuuAbLwbt8b3HQ=
X-Gm-Gg: AYBFou32Db2eA383+E4TurvPF2btHV9PeZuSnpUYPnYwKfUhN6g15pODUIYdReuZawj
	MAGFiXh9dBKgrJKYQ9VKEulNdihX1E0RMl1loKH+kliORfdJyazA2sk/dH6YXrHMfHZbtZ6NZum
	NIB/ngqCGOL2lsqrnWkQZmoicf+hLoCB9Bh2qkwuEUgzP4J1ije+IW0Rz95inQQaic3fg3Sfwpv
	s1vlU4c12S6AXJWiqdxq3Gpq2sL1Ox+F4kSslZI3u3pzAigdW7KFtXUol/cZZukbDzpaVtTFpU1
	ZyvkSAs5nQG2XXvh4W7R2MES93+GZueBxLzYZLBhBGc79S4SsOIyrcc+EARcvlgMqMXdnocT1bt
	6f0GhJ16EipZLgJc6oMwUxGE31O8qdSDObdhGJBAsnpylVtKcI2VX2Apd1rWg3619Ab1kSNwY/E
	8umqMuHxoQxrXHIOfZIBv5hBDa3FlMYrWL1ey1EvQoFnP4D/Ds/THw/aE=
X-Received: by 2002:a05:6402:454d:b0:6a6:7305:2dff with SMTP id
 4fb4d7f45d1cf-6a7e8e95808mr5594031a12.12.1788744067371; Sun, 06 Sep 2026
 18:21:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710070704.60680-1-rosenp@gmail.com>
In-Reply-To: <20260710070704.60680-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 6 Sep 2026 18:20:56 -0700
X-Gm-Features: AcwNN1Xq_5QVaYhUhaquQ0B-Wpws9p3xwYr1tiY25wcmZty-OeFp50QPfSbK6uQ
Message-ID: <CAKxU2N8uVimJ09aaRz2o6pY+yh7VpE0G6fBXdERnquoTPYcYXg@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: convert to noirq suspend/resume to prevent
 interrupt storm on resume
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 12:07=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> The driver uses the legacy .suspend/.resume callbacks, but sets
> IRQCHIP_MASK_ON_SUSPEND on the irq_chip. During resume, the PM core
> runs dpm_resume_noirq() first, which calls irq_pm_resume() to unmask
> interrupts, and only then runs dpm_resume() which invokes the driver's
> .resume callback to restore GPIO registers (GPIO_IN_POL, GPIO_IO_CONF,
> mask registers).
>
> This ordering means interrupts are unmasked while the hardware is still
> in its reset state, potentially with incorrect polarities, causing
> spurious level-triggered interrupts before local IRQs are re-enabled.
>
> Convert the driver from legacy .suspend/.resume callbacks to noirq
> callbacks via dev_pm_ops. The noirq phase runs before resume_device_irqs(=
)
> on resume and after suspend_device_irqs() on suspend, ensuring GPIO
> registers are restored before interrupts are unmasked.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: add __maybe_unused to fix compilation
Should I resend?
>  drivers/gpio/gpio-mvebu.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index 7094ab34020c..bd31acf779e6 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -979,9 +979,9 @@ static const struct of_device_id mvebu_gpio_of_match[=
] =3D {
>         },
>  };
>
> -static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t=
 state)
> +static __maybe_unused int mvebu_gpio_suspend(struct device *dev)
>  {
> -       struct mvebu_gpio_chip *mvchip =3D platform_get_drvdata(pdev);
> +       struct mvebu_gpio_chip *mvchip =3D dev_get_drvdata(dev);
>         int i;
>
>         regmap_read(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
> @@ -1031,9 +1031,9 @@ static int mvebu_gpio_suspend(struct platform_devic=
e *pdev, pm_message_t state)
>         return 0;
>  }
>
> -static int mvebu_gpio_resume(struct platform_device *pdev)
> +static __maybe_unused int mvebu_gpio_resume(struct device *dev)
>  {
> -       struct mvebu_gpio_chip *mvchip =3D platform_get_drvdata(pdev);
> +       struct mvebu_gpio_chip *mvchip =3D dev_get_drvdata(dev);
>         int i;
>
>         regmap_write(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
> @@ -1339,13 +1339,16 @@ static int mvebu_gpio_probe(struct platform_devic=
e *pdev)
>         return 0;
>  }
>
> +static const struct dev_pm_ops mvebu_gpio_pm_ops =3D {
> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mvebu_gpio_suspend, mvebu_gpio_resu=
me)
> +};
> +
>  static struct platform_driver mvebu_gpio_driver =3D {
>         .driver         =3D {
>                 .name           =3D "mvebu-gpio",
>                 .of_match_table =3D mvebu_gpio_of_match,
> +               .pm             =3D pm_sleep_ptr(&mvebu_gpio_pm_ops),
>         },
>         .probe          =3D mvebu_gpio_probe,
> -       .suspend        =3D mvebu_gpio_suspend,
> -       .resume         =3D mvebu_gpio_resume,
>  };
>  builtin_platform_driver(mvebu_gpio_driver);
> --
> 2.55.0
>
