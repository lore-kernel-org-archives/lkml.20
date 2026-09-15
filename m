Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF739426431
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789444561; cv=pass; b=tBuhdu/EIPDlsZbmKAqRxxLaUanLgJG++epbSGzJt4SlhR6iMZFqaqoa2bJYmsnnaANUjttDupiySlqDdifd3rIVSlQ9IjdpjIKxOks9vBx6aAnF9ggC3kd0JX7yHXYUpdh9xF2SZJk4sIRLMwH+hrBDHh1wlQFnlHyjoR7hWT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789444561; c=relaxed/simple;
	bh=IQ8qzRaj8tpoW8rhpnZaW1weLubpSHwKHelZMz6tzLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNmDMDB5CXEznm8g99P+PvyM6VuA6bb4vTwxbBmEcYzrNJP4bjLBwf83Z+wJqQMcVcsICR8au2tki6oLl5ECrT2KqeU3ZQ+XkNPYOznODwp++9EyOLXF8z5kEpayvL+tFNbESAvY4VR5p2FAno6pw+cYJtZbF0cJJux5nxKnr2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcTGU1dQ; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcTGU1dQ"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43ac6089so22697737b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789444559; cv=none;
        d=google.com; s=arc-20260327;
        b=kGx2mooJTgk7ceqohqj+l2TrRnDvvmV4GVN62EB3oo9lWbg7pjKsgS2TR1eluXezc/
         hpjV/NdaqxP7dMQ4oO+3Q9UlU+/xlubTd/GZkgRA8lm3oJ9XjwxTmRiSqHKG9BFj8g57
         Cotg8oLUu2qGWouduTOlUvb1nzUqUJkdifTm2co9u5uIUJYyqZrS1K/5iihPdCfpr+kr
         qQ33/7fyKA4Np2ddZ8VNnqRYsktRxpZIPO+FZrkykW9qtzmGSD8YGiZuDXly2F9q0v3w
         VZ+k5vxpbm8YXWn9dMp81KuKG5kgywFXiIC5Bs5uLYYRqevD73qXNPlg9AnXBVU2CIO9
         9ACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eO/9u+qepRyuWo0/nmbsdH5lUnNgat0VZD6Mn6ZV5GU=;
        fh=e/M6A+1qrbd8OITc0wTamAvxhxp3cEIcxWlq9ZL+hbg=;
        b=cT9NOsyPXk97S9vhiFrpduN6O0kSzbcf6HnXYbIpwGReNerrYw6HGPzoaCerJkYm44
         HVIQkeI6FaJBehbeCS1Dxwk8qpN9wO/Gc+z91yp8Vk5ZHtGh4tkU62gbnkXkwNTj3xvC
         89lQwCenGU/tTzzhZXSWbz/rnQkjIl96w4tw1Wtv1n0gkfypEb/8yxVueGYpuBwbRGP4
         dhS7X3xTBCfZtnOxBWgP5W36hg3maTMcKAtUAo/5/MR/JS+rvWha/sfO9Cy8SysUiSo4
         gNqjhKHPJo5QNEDCAX4UohthY904QRVwE85a7DEO3eVpybPeBN0ECzyShZov/PRKNuCP
         ck4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789444559; x=1790049359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eO/9u+qepRyuWo0/nmbsdH5lUnNgat0VZD6Mn6ZV5GU=;
        b=QcTGU1dQUv1oNo96CC5Vs0PfG+Orbp+0mINQuUW26XAsULHKYyYIRCkMDrJ67pme8t
         xaOkUc2F1pZk7Pqsfkz9++vqsao/ysg1pxxEq7Xdyei+ZeM8+iHsaSJgYnQStbmmO3Hm
         vZ5OdVAvrUPkth24bG/Lqy5eUQ4UjNYFAK52n+efm3xqX9POJN8BYcSN91SVNvF7TyUr
         BD36TjQA4wC8+BPvuCO5v7UikKiLeQ9sifZjtJrczNyRPRVtIaYD9mj7Lph6PbRklts8
         UfPThKedX4zO45jO4lk0PXzOo9XDB1igcSN3VWaynCugKHcr5L/q9BYU3tGkrTil8TZz
         yYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789444559; x=1790049359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eO/9u+qepRyuWo0/nmbsdH5lUnNgat0VZD6Mn6ZV5GU=;
        b=TGJPPSUhk7YA2qZ7UTvuLrAsc8yL4PQFR5AnzcuFiQeXnnl7LVnJs820pMG6MVdZNE
         e7x7gGzUhsX+rAoG6s7BqodWylRIcNPVrUddsx0K0/6qprcsecD4yPsZsYPhH4m6LZth
         ejPPLls9H4XPu4WqJaFCMEHwhc6CjgSHB9MFy1b4HJ+FZVKS9nhBEUBhageW9yugUaT5
         2ouw/+S+aMEcWPfIsNGnrSbMtgKO4PYD0BbF3+tAM2206zTqUhZA5OF/x8A91XYj4EpY
         qNOjYeasiIJNlt/j/yrqFYY5DHYvXcfOnqRycdm3mLdZMuPS94QoJ/EyA0kOdMVZGfAV
         rzQg==
X-Forwarded-Encrypted: i=1; AKwUvBxcpfKAqdYqqkyb7ybo6fY/4XpaONs+IINHsNxSBsqg4UHtsfkCWHHNXqDhDXGcB5SNXnH9rgXfCeWJoi0=@vger.kernel.org
X-Gm-Message-State: AFuF++kPkVMFYXL8/o3Ppzaq2XmP0H7DbPEXueO/gQRTclPqGh9ESVD1
	P3Xd8tqGgvNtPZlr/A8HFpxoAi0T48X6EJ7LQ3f99fp6VRpnX0IbINk6ZDpbl2CduyUbFSlQ+gu
	ajOTfer6UltVKPujPdNcV4Zcfb84zVpg=
X-Gm-Gg: AYBFou1bcIwe8FyIP7GKOn0lci9VL6itnrWZv64nQvv4B2sHnXns8uzynM9pV67DYSe
	V/qHTUS+x/go+ys2ZzPARxjSpsfCj/qZo8PpMXzw9LSgOyKW3jOdCa6/JOVHi7bztRBl4Be/b1d
	88VY4v03zw95vR6jhBNjakdIjjTOaxOOzoJQx0TpBmPvcX52jmSJO4FlHwlW8OXXjR2FtTHFqzR
	E1PBrXmadLv+7j6WbZ3WNg/J2d9X+lNXHGHHyRC3jz0pjCFUa4Rd6RwpJ/p3O5siHUB+KNT6H1u
	xxbyrjLAGk63IA3VeVW6hLdc1qnzxfJqlXMMSjhW32GgpyeJLvEgidV+kmDyHNf2og==
X-Received: by 2002:a05:690c:a79c:b0:873:5c7b:c0fc with SMTP id
 00721157ae682-88d22cdc932mr13897057b3.52.1789444558685; Mon, 14 Sep 2026
 20:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914115448.2039438-1-congnt264@gmail.com> <44026532-e454-458a-847a-9e66e7ddc3ad@roeck-us.net>
In-Reply-To: <44026532-e454-458a-847a-9e66e7ddc3ad@roeck-us.net>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Tue, 15 Sep 2026 10:55:47 +0700
X-Gm-Features: AcwNN1UQndXSIj7-fzZashgJyte07l53UHSD32h1DonXihx6AU1VTZUaNN2VuGI
Message-ID: <CAJpJ=Gvz0_kFZ2UWKA5qss07z+jbOdf7BqLEnpt7F673ZgE30Q@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (gpio-fan) fix use-after-free of alarm_work on unbind
To: Guenter Roeck <linux@roeck-us.net>
Cc: Simon Guinot <sguinot@lacie.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 10:40=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 9/14/26 04:54, Cong Nguyen wrote:
> > fan_alarm_irq_handler() schedules alarm_work, but nothing ever cancels
> > it. free_irq() (via devm) only waits for an in-progress IRQ handler,
> > not queued work -- a pending alarm_work can run after fan_data is
> > devm-freed, dereferencing it in fan_alarm_notify().
> >
> > Cancel it via a devm action registered before devm_request_irq(), so
> > teardown frees the IRQ first, then cancels whatever's already queued.
> >
> > Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
> > Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> > Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel=
.org
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude:claude-opus-4
> > Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> > ---
> >   drivers/hwmon/gpio-fan.c | 20 +++++++++++++++++++-
> >   1 file changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> > index 084828e1e281..b1b57bb63a33 100644
> > --- a/drivers/hwmon/gpio-fan.c
> > +++ b/drivers/hwmon/gpio-fan.c
> > @@ -81,9 +81,16 @@ static ssize_t fan1_alarm_show(struct device *dev,
> >
> >   static DEVICE_ATTR_RO(fan1_alarm);
> >
> > +static void gpio_fan_cancel_alarm_work(void *data)
> > +{
> > +     struct gpio_fan_data *fan_data =3D data;
> > +
> > +     cancel_work_sync(&fan_data->alarm_work);
>
> I think this still leaves a window on teardown, if an interrupt happens a=
fter
> the work was canceled. I would suggest to use disable_work_sync() instead=
.
>
> Thanks,
> Guenter

Makes sense, sent as v2 -- disable_work_sync() instead.

thanks,
Cong

> > +}
> > +
> >   static int fan_alarm_init(struct gpio_fan_data *fan_data)
> >   {
> > -     int alarm_irq;
> > +     int alarm_irq, err;
> >       struct device *dev =3D fan_data->dev;
> >
> >       /*
> > @@ -95,6 +102,17 @@ static int fan_alarm_init(struct gpio_fan_data *fan=
_data)
> >               return 0;
> >
> >       INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
> > +
> > +     /*
> > +      * Register before devm_request_irq() below: LIFO teardown must f=
ree
> > +      * the IRQ (stopping new schedule_work() calls) before this cance=
ls
> > +      * whatever alarm_work is already queued or running.
> > +      */
> > +     err =3D devm_add_action_or_reset(dev, gpio_fan_cancel_alarm_work,
> > +                                     fan_data);
> > +     if (err)
> > +             return err;
> > +
> >       irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
> >       return devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
> >                               IRQF_SHARED, "GPIO fan alarm", fan_data);
>
