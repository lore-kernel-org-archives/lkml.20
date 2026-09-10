Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A3A4657D8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041533; cv=pass; b=pdKZeDKVjJz6GGHaWeqItQcCN98fOO+MvrYsTJESCuyFSRSrquwRboaLgitW1pL97MIyv8Q8zy2aNGyMJTZjw7u6nWcVdeBa45+CMxzhyOdXsi/XFOwj8eX/PvZigv/BSbihzvMuZ15pvih0eWJF+/EZ7q28sO/Rz9celabmEiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041533; c=relaxed/simple;
	bh=Oz1LulEoZCmAxqUQgT4oDLzqt525f0rp9poj1VjkB2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZs4ZOHWsHluvSHHkOpnQcpPWXwP4WNToUvC4kSkFA9a/hJnoHOxT3oTFXgS4JQFXUzRHdkxPu8uBI/ESXQeE3dkKyElbirrI4kUG+JG5D6qXM86uPVk7auG+XGpQjLcCy7Uw8KEPJqdUg3xcCxpvyktF7LEUHB5uCMWN7T2nQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fo38h6a0; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fo38h6a0"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso6734089e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789041530; cv=none;
        d=google.com; s=arc-20260327;
        b=P6Hy64I9JisumVjKbuMoTxh+ZdSKOlvRrdbmpRMsDfBeb1Xo2m6XDbIT862nbODU/M
         yos4IT/e+tpQkVW2GJ/BPm+HD4JVNtOyZQH2APF2j0xMK9MML8D2V+O0zy15lgXa9Njp
         SFRToTYJlzsMKRfUpw2Qp21ojfn4wEcBaajZHbO5PoVXVCpOCmAfxqlVpkA/8qz1ilU7
         Y5jBh3toXVXULC2fQUDtt4S4Y878/A7eW7tdXA5oMGqpd0B9PuWcVZMLiDndV3jnVXKh
         vElSzvlp6eP7PwqpZ/O6COAUk8BfWvLEF1Z8kHjxLku5q7FCp/3qutt0IimCwV02MHb2
         Rg8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CdCq+JZDbLIOXTO7pq6t6EN3rk5eBziqfXX3TMvHcq0=;
        fh=VDhGFsR/s3Q3CuY4md/fW8uPqDuC9n8BC7d4yXPhrzI=;
        b=ZX2YF/RzLAichq79T6R+H1jfI5mlK9RaVQ5dsSRL/MNWEQCq5hgLVW3hnu9Rp0ec5r
         uHi87gXaAomqRUUT+xehFeNjebCMnNURu844Y8LRQnZBdKaVWxyKHmDfVIEprGjKrbN9
         ylgM8MehYUsYN9XUlOOJPukGPk7+8ose0iL0DoM3pBpQFNA06D82ACf4bAJR9JC6XwIE
         0MQOhAelKB/YNqdeklaBAvPJKZka5Hy2IKEsbsGhwwA1q+SgAAULgH1VKpVwNaigAqeJ
         Sd2q21jFztSWwmcvakqyyd+dpxZ1s/aEoldwOQOWqgTlRmvt1rg6JNqxCtzvkKpDpLkj
         Qnbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789041530; x=1789646330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CdCq+JZDbLIOXTO7pq6t6EN3rk5eBziqfXX3TMvHcq0=;
        b=Fo38h6a0r7iI7X0QMd1FPpIj0gwze4yJeSaE0RJqAz6t1N+UEM/w+ry/7IFot56JOe
         XirarPsDCG7ENDd9C65Uc/dc01REHh+wbiBPz6tLPZ2dvX0FqU3LJkCmi9VXrFgF93M5
         UilItQfssXvSdyBkRdO6nL8BeFUplLahyOnmFphrXUPI25sSuePZhIutXP3oQ+2riJWm
         vYCJuNOrswKRlzCzcEqAgriQ1XyzDipYIYcgUswFM0FQjHaoOoaLKzAJKYJU2QQ/cZZL
         oAshEpQDNY5ggLonBybzrF5O0AYkQnl+SwnGzZ52AAD/lAPWzaoT/04MP3UoUXj+IqVL
         /iFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041530; x=1789646330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdCq+JZDbLIOXTO7pq6t6EN3rk5eBziqfXX3TMvHcq0=;
        b=fOGLPJs4Im1TrkOetibe19+EYSKprk6Yu/c7yahcS64X/Z2QL6f9b+YJsuJ6Wz4bc0
         V7zAg3ofUGodEBZ60fRL5REPPSuJtN/4J+HKdW+as2ye2nHpyLMySaJmoa+bFl9JzrMp
         clTXNKX5BCm5K+cX3CLHgzr4nL28Gf37COFxZSqG/q8LbxBg2jG+BJHLOGkrds3EHuzx
         SDgjH2JUWBSwBVtWqBDllo1hBs2/oGk8cGCKKAK+fqCzvCcQ36+mz/ktdNanZJ845mhc
         ur7474WZiFyYqbukG9J8lJHrgQTkxMdVW+49XY0o0ovOEMrXbpdD5Tmr7jnn+x5vbUdh
         B35w==
X-Forwarded-Encrypted: i=1; AKwUvBysuWimMNOz1rHuMfWxR+XFJQqgxedAjf/MD86GWTk9DkFbiVHEA7I7a9PwJgn/+uqImfSVmsrJE+wgaew=@vger.kernel.org
X-Gm-Message-State: AFuF++mJROwvBJdGX9bvgRCsCqhoKyZ9EHStSLSMZ8NIc3jUW6IpXw//
	fYSI+/FC8B8qUHY9nwcVLVUvsNbBFAy3wv5Ktvku6NSKyJOXAgW4yZIBSq0Dcf2Z2uxcJvmqTAb
	BkIehFTdYtaKsSqSShZWwiW77fETqxHQ=
X-Gm-Gg: AYBFou3R9fmteVtzUtWyTQKi3KHee+g9+Qd2EK+JTSYGy0T2cYlEIAtJf5E1BjbSRvC
	s5Yhi4rdMiydUENuUmprQGPer3TmkNFNZ9gJ4h5Joj4fkY8q7XH1txxUhCXVByam1YvA4zowesd
	cE8RPN25MHi7WQ81XreXKZ7erEmGjz1B8ay9DFqnr5CWFvdqwJx5IcFh7zYa5mlDR9JL3WKV9Do
	2ydHpfeT+ZqkZ1+nFMGYkRp900cp7mNBBmardSEocsEw/lQDrTpWvkQrj97cBRDTE5Zo3FHcNXK
	KjecxMzaiL7C4kkijiuPnKMhV10VnqhBz/+93KOLKBx49e9eTNsux6guO5Q4Rk84gF3LyGpjpUR
	bkw0iFO3RYk48K41LE9vK/vTT+VuViivZi4ZaC+d6wg==
X-Received: by 2002:a05:6512:39c2:b0:5b6:1a7c:aa0e with SMTP id
 2adb3069b0e04-5b61a7cac9bmr6765207e87.38.1789041529833; Thu, 10 Sep 2026
 04:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715-pwm-loongson-fix-v3-0-0aab2847eaa7@gmail.com>
 <20260715-pwm-loongson-fix-v3-2-0aab2847eaa7@gmail.com> <ap6Ciw_sMALvlROd@monoceros>
In-Reply-To: <ap6Ciw_sMALvlROd@monoceros>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 10 Sep 2026 19:58:12 +0800
X-Gm-Features: AcwNN1WqM76-1CTCi4acvnKmIrksLRk8Bw3Ze42EYukAfTFF0nd55VZdBmlvKUE
Message-ID: <CAJhJPsULo0S5c6GKQvRqLtVx3nixZLuqRrh7hi5yJ7C5BuwLUQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pwm: loongson: Reload PWM configuration through
 counter reset
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 5:33=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@kern=
el.org> wrote:
>
> On Wed, Jul 15, 2026 at 07:05:24PM +0800, Keguang Zhang via B4 Relay wrot=
e:
> > From: Keguang Zhang <keguang.zhang@gmail.com>
> >
> > The Loongson PWM controller latches the LOW and PERIOD registers only a=
t
> > the start of each PWM period. After disabling and re-enabling the PWM,
> > the controller resumes from the previous counter value and completes th=
e
> > current period before re-latching the updated LOW and PERIOD values.
> >
> > Reset the PWM counter when disabling the PWM and release it when
> > enabling the PWM so that the updated LOW and PERIOD values are latched
> > before the PWM starts running again.
> >
> > Fixes: 2b62c89448dd ("pwm: Add Loongson PWM controller support")
> > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> > ---
> >  drivers/pwm/pwm-loongson.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/pwm/pwm-loongson.c b/drivers/pwm/pwm-loongson.c
> > index e703217a6d5e..c317d62fe813 100644
> > --- a/drivers/pwm/pwm-loongson.c
> > +++ b/drivers/pwm/pwm-loongson.c
> > @@ -103,6 +103,7 @@ static void pwm_loongson_disable(struct pwm_chip *c=
hip, struct pwm_device *pwm)
> >       struct pwm_loongson_ddata *ddata =3D to_pwm_loongson_ddata(chip);
> >
> >       val =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_CTRL);
> > +     val |=3D LOONGSON_PWM_CTRL_REG_RST;
> >       val &=3D ~LOONGSON_PWM_CTRL_REG_EN;
> >       pwm_loongson_writel(ddata, val, LOONGSON_PWM_REG_CTRL);
> >  }
> > @@ -113,6 +114,7 @@ static int pwm_loongson_enable(struct pwm_chip *chi=
p, struct pwm_device *pwm)
> >       struct pwm_loongson_ddata *ddata =3D to_pwm_loongson_ddata(chip);
> >
> >       val =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_CTRL);
> > +     val &=3D ~LOONGSON_PWM_CTRL_REG_RST;
> >       val |=3D LOONGSON_PWM_CTRL_REG_EN;
> >       pwm_loongson_writel(ddata, val, LOONGSON_PWM_REG_CTRL);
>
> I applied this patch to
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fo=
r-next
>
> , but I wonder if the fix is incomplete. If at driver bind time
> LOONGSON_PWM_CTRL_REG_RST isn't set and there are still wrong values in
> the shadowed LOW and PERIOD registers the first period will be wrong.
>
> This would need:
>
>         val =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_CTRL);
> +
> +       /*
> +        * Ensure that the values of LOW and PERIOD are sampled into
> +        * the shadow register when the hardware starts running.
> +        */
> +       if (!(val & LOONGSON_PWM_CTRL_REG_RST))
> +               pwm_loongson_writel(ddata, val | LOONGSON_PWM_CTRL_REG_RS=
T, LOONGSON_PWM_REG_CTRL);
> +
>         val &=3D ~LOONGSON_PWM_CTRL_REG_RST;
>         val |=3D LOONGSON_PWM_CTRL_REG_EN;
>         pwm_loongson_writel(ddata, val, LOONGSON_PWM_REG_CTRL);
>
> I think.

You are right that this patch doesn't handle the initial hardware
state when the driver binds.
Would you prefer that I submit a follow-up patch to address this, or
are you planning to fix it yourself?
Thanks!

>
> Best regards
> Uwe



--=20
Best regards,

Keguang Zhang
