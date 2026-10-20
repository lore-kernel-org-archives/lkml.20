Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792539449;
	b=jshzbqYgGWByPFdd+a2G1EQDHtgHT5Rzecd+Vld6ijeY7z6NnQolusPppW2WmyAs7qFu
	 EYV3+GElp30k5ZUQa0zmxFK6q1bHQPg2+/cGO/PcJKvkpw9nGr//Yq9sM73tWvBV5rv8S
	 gQisVSMswXkre3uf7Or1BNdMAJCqFd92YWd8TIZxGC/zZ6JsgnTEHgYj1w4hAkdi+IEhq
	 6FX0rHNcHBE1FbnmJ8R26qyyQ2YhUGZcSgYdfTmEdPHlUzLLRAMISVmQpqN3ZfDiR8u7M
	 59sIX0cQ4sdHTvIjXEtWbL3mw3ujoeyWyS4MYIXYslMW2mS48HbAKl6fj8RjzixCEBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792539449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PMi+PnFccvaD8+yCUa0N3gNkTUvskvlBPr4LLDyPhEg=;
	b=H/V/tPz4dQemr41ycw57rkBB/CCKM0nBBc7uNjwn6pyJCTG4MmDaHDpzTpmOWFXj6Rf2
	 wyhhn3zRNZfhXZ7W/5MXg92+FT10BlagqaLPc2HrL/Dn7AM/sSbfAb19PkoCquPKAoIUt
	 12tlSSly0YPK1JEuUImpOC7Jw+QMTZciDS/sEDM90UP8ouiXRAJgzxfjjSuGPgZbhYLSw
	 piHOFq0+/E9Tp607WIHJsW7Al3tPQAVQh5OFPmHab5FeNEAmLGJnU2gy1GnziZb8WpNtd
	 cXQqvElmsDY00eos1p8Aw7erXZQS7M56BgxZjJgW0uEPk05n/3kkt62wSOMFrzr6EZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Fn/kkC7j";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75DB606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E75DB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fn/kkC7j
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c40f29667e6so12754366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792539447; cv=none;
        d=google.com; s=arc-20260327;
        b=HGogDHdWdHW1zTYwFr1SJyg4tOF+p8OLgtUtv+l/xGeT4+13PQmjOnHdNHAKXBZ05R
         xqygdETbtdXkx5ra+ChB0LatvOoOaCw3siQ6aWRRvzbbfUMPz6TMoqT12UMpp2uckiit
         +vqfUDYP06THcfaWjvWDGB1p2gBwbg5tGvLKLUTITE2BGMi1Sgrub8MgXicCP6DFnYe7
         lcHDuRz15v00B0QznHtXLtxB0XPI2I6t2IQRmfKxwhB9WnbaDtrGs9F9E5pEb9hbS38+
         UsvpYCWMDf/bfKeIlwH/As4U1BhKqmHDCqDpHFJ9zfp37tYVtwe8lBdZ3SzbmadZaaH3
         6hzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PMi+PnFccvaD8+yCUa0N3gNkTUvskvlBPr4LLDyPhEg=;
        fh=QqZuppkIyr2MJMSh/4GwonYMlyMkhdnfoQD6knAvHXQ=;
        b=NhG8xz83uijhtD0taq/tmUoyYduEOo5stZ4nmSiOoJi6n0U+gSKplQExcWfqRHoWWh
         1MF6c9h+3FJaqM+Iu2NqP0J2iC30LmHkC3v6cCQRVmffgmtVjyuows+kC+m88vjzQJCC
         NYhz9gMIsrRnGdTeC+cG1LZlM1xRCndKiaZFAZCaHuI1iXBOI5MzGJRbZYZInl6COqYi
         IUycGnHWw8Tbt3xigLwp9jw0LADDewx4Qpa9YpQ74aa/Hqw4kvN9+7BFGL10VndzR+wv
         oryRqQA9dmS/V1lbIWCJxauEUxvjFWFVi4bOY+2gVAGeBYOxzoIOHilnXQ7eZu/CzPaH
         soFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792539447; x=1793144247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PMi+PnFccvaD8+yCUa0N3gNkTUvskvlBPr4LLDyPhEg=;
        b=Fn/kkC7jilFMh3hObGap6hKFVeaZdwAT/S0wkVhlugZvayllm0CzCFpB2QZd+CRVBp
         b3YCQbGvhbkZcwZ5Lu54P5tTj3+f9CSdETfDD0gxQh0SqWfL1NZUvJ9jwCfTQED3TyNT
         JuTACtnABg9mmSIKiRbr3NZFqxLlqj4rgq3Ld2DoA3cUImyezxrMfpqFyukHc5mS6cvh
         GOqCuvvXtLD8bFt+9QYxEA/68skY0Tsg89Hw6IJZQblEvP/mz3TBm8OkGpg3JqVTvEhK
         923OAaxQttUQYGvJqCo5NFcviVtpsKC9SbWxfAJpln6QDgynzrRyV0Jll1FkvPApaALA
         Yj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792539447; x=1793144247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PMi+PnFccvaD8+yCUa0N3gNkTUvskvlBPr4LLDyPhEg=;
        b=iWjRSNfPhQ5KxzBdAFfkDnD8otELAC0sI6wV8qlj1vQDCOfgw5DPNeQBKHXg9TA9bk
         bdxiM9qQUx1i7Hol06F+k+GICE470BMXEkFufgm87/2UPNeqgjWb6FrG+2GQ/UWkIEFi
         Xhy2/bt8XPBHMgxN5/ApyQXd7BCpUTXPaQlVZzABqmXXVI7UWyl+Qg1vNfV+Go0MMOJt
         kaO8A3Ah8T/lCDzADCDwV5OwVxMMf5aq+JO/u/ogbmW8QR2IsA8Eu1BeOtHr263i5VC+
         jvS/IBTKSFSbuBvirECiIrnCM1CCEMEIqUO7SbdArL5nNy13+UmEo06+JH8gHY4s38gh
         OW5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzDVv6d7mo7mzYFvSMj531ukHBb1DRGmtxb+XRPa79ByNV74LlZ1iZ3FJlgMqi9PjeZptFpg3D2of2Dlis=@vger.kernel.org
X-Gm-Message-State: AFq9FYJatvk1LK3CFmz+X6Ax0enLNQUy7gJD7zPvyTIWIzv33F3NDN1D
	8GTjHkNE1qJDf0zkD7JUoLPjgJ6w/SS9uOVh0WXFKtsx5+AkiwecUw8k/oMlK9rAUbMza24W0oa
	olm66gJX5UBnBJ5J1c36OPbwrIgJr5ftmGPdlRw==
X-Gm-Gg: AYBFou17rNJprjY+FdruncK6KvhSZJaeK4gnUHOw/ONG8Nyhrt8qmAM4o0a6JsTfn4A
	8llZQ9DcVgXQVh7kKMReYNq92Gy4ODyRwe7OowMjuWZVwEkhPwbycrQ7yKRSd/njZr7mN/hdGdO
	PbqZvzT7elKL5r46o6T/kb8PrmJ6ZV5u+fAHKWZtIZXwEeAQXhLeFbukCopRo4QcFhezYZBlCFN
	6oJn1pfvpc0qISY9f0gZ9oGjuAcaQFX7719Y1e6oWASG5pOSj7Bj4qwL3RlHMgJ2yvigsqTPtYf
	sWtcFNy76Cnpp2yB9X5B6liMGDLDZgb43dFi1JSoO8VQQoU2RaAhpyVU+ZWvXEkJIP831swH1sx
	PRaUiSxzS06hJmVmxZf8p76bkN0W+u+E3s+jfniDfRRr4FYssYx0ArfHj3qjz1OFIv1Cp
X-Received: by 2002:a17:907:6d27:b0:c40:dead:7466 with SMTP id
 a640c23a62f3a-c4679597fd2mr47255966b.20.1792539447062; Tue, 20 Oct 2026
 16:37:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019234402.805759-1-mhun512@gmail.com> <1fe09bc6-2341-48f3-80b5-0d9dc02796a9@roeck-us.net>
In-Reply-To: <1fe09bc6-2341-48f3-80b5-0d9dc02796a9@roeck-us.net>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Tue, 20 Oct 2026 19:37:14 -0400
X-Gm-Features: AclHuK-n7HXTrGRNTLUJKxTldJMnq9XQIWZa_22ydo7BcJ8gXvzDr2Dnbozk5vY
Message-ID: <CAGEsz8EtusjcLXrUV7AP+5DvXAY42g8xnCQHSTR6sz8xkrWHHg@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (sht15) Stop deferred work before releasing its resources
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

The original issue is that read_work can remain pending after a
measurement timeout, while unregistering the regulator notifier does
not drain previously queued update_supply_work. Both may access
resources after they are released.

You're right that v2 is unnecessarily complex. I'll remove
IRQF_NO_AUTOEN and the IRQ caching changes, and keep only the explicit
IRQ teardown and work synchronization in v3.

Thanks for the review.

Best regards,
Myeonghun Pak

2026=EB=85=84 10=EC=9B=94 19=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 8:37, =
Guenter Roeck <linux@roeck-us.net>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 10/19/26 16:44, Myeonghun Pak wrote:
> > The IRQ handler can queue read_work, which accesses GPIOs and may re-en=
able
> > that same IRQ.  A measurement can return while read_work is still pendi=
ng
> > or running.  The regulator notifier can also queue update_supply_work,
> > which accesses the regulator.  Neither work item was drained on removal
> > or on all probe failure paths before the managed resources were release=
d.
> >
> > Use request_irq() and free_irq() since the IRQ must be released at an
> > explicit point in the teardown sequence.  Disable and drain read_work
> > before freeing the IRQ.  Unregister the regulator notifier before drain=
ing
> > update_supply_work and disabling the regulator.
> >
> > Use IRQF_NO_AUTOEN to ensure that the IRQ stays disabled until the firs=
t
> > measurement, rather than enabling it briefly between request_irq() and
> > disable_irq_nosync().  Cache the IRQ number and check errors from
> > gpiod_to_irq().
> >
> > Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> > Compile-tested (W=3D1). No runtime testing.
> >
> > Changes in v2:
> > - Replace managed IRQ request/free with request_irq()/free_irq().
> > - Use IRQF_NO_AUTOEN and cache the data GPIO IRQ.
>
> That replaces a relatively simple patch with a much more complex
> one, and Sashiko takes offense with it. What is the problem with
> the original code ?
>
> Guenter
>
> > - Preserve asynchronous work drain ordering on probe failure and remove=
.
> >
> >   drivers/hwmon/sht15.c | 47 +++++++++++++++++++++++++++++++++---------=
-----
> >   1 file changed, 33 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
> > index 7bb2105d1ae223e7131ba4cc0523e4e074e01302..c95acec7ae2f8f57a10bd72=
f65a2905e64c3c58c 100644
> > --- a/drivers/hwmon/sht15.c
> > +++ b/drivers/hwmon/sht15.c
> > @@ -31,6 +31,7 @@
> >   #include <linux/bitrev.h>
> >   #include <linux/gpio/consumer.h>
> >   #include <linux/of.h>
> > +#include <linux/workqueue.h>
> >
> >   /* Commands */
> >   #define SHT15_MEASURE_TEMP          0x03
> > @@ -120,6 +121,7 @@ static const u8 sht15_crc8_table[] =3D {
> >    * struct sht15_data - device instance specific data
> >    * @sck:            clock GPIO line
> >    * @data:           data GPIO line
> > + * @irq:             interrupt number for the data GPIO line.
> >    * @read_work:              bh of interrupt handler.
> >    * @wait_queue:             wait queue for getting values from device=
.
> >    * @val_temp:               last temperature value read from device.
> > @@ -149,6 +151,7 @@ static const u8 sht15_crc8_table[] =3D {
> >   struct sht15_data {
> >       struct gpio_desc                *sck;
> >       struct gpio_desc                *data;
> > +     int                             irq;
> >       struct work_struct              read_work;
> >       wait_queue_head_t               wait_queue;
> >       uint16_t                        val_temp;
> > @@ -532,9 +535,9 @@ static int sht15_measurement(struct sht15_data *dat=
a,
> >               return ret;
> >       atomic_set(&data->interrupt_handled, 0);
> >
> > -     enable_irq(gpiod_to_irq(data->data));
> > +     enable_irq(data->irq);
> >       if (gpiod_get_value(data->data) =3D=3D 0) {
> > -             disable_irq_nosync(gpiod_to_irq(data->data));
> > +             disable_irq_nosync(data->irq);
> >               /* Only relevant if the interrupt hasn't occurred. */
> >               if (!atomic_read(&data->interrupt_handled))
> >                       schedule_work(&data->read_work);
> > @@ -546,7 +549,7 @@ static int sht15_measurement(struct sht15_data *dat=
a,
> >               data->state =3D SHT15_READING_NOTHING;
> >               return -EIO;
> >       } else if (ret =3D=3D 0) { /* timeout occurred */
> > -             disable_irq_nosync(gpiod_to_irq(data->data));
> > +             disable_irq_nosync(data->irq);
> >               ret =3D sht15_connection_reset(data);
> >               if (ret)
> >                       return ret;
> > @@ -825,7 +828,7 @@ static void sht15_bh_read_data(struct work_struct *=
work_s)
> >                * have gone low in meantime so verify it hasn't!
> >                */
> >               atomic_set(&data->interrupt_handled, 0);
> > -             enable_irq(gpiod_to_irq(data->data));
> > +             enable_irq(data->irq);
> >               /* If still not occurred or another handler was scheduled=
 */
> >               if (gpiod_get_value(data->data)
> >                   || atomic_read(&data->interrupt_handled))
> > @@ -976,25 +979,31 @@ static int sht15_probe(struct platform_device *pd=
ev)
> >               goto err_release_reg;
> >       }
> >
> > -     ret =3D devm_request_irq(&pdev->dev, gpiod_to_irq(data->data),
> > -                            sht15_interrupt_fired,
> > -                            IRQF_TRIGGER_FALLING,
> > -                            "sht15 data",
> > -                            data);
> > -     if (ret)
> > +     data->irq =3D gpiod_to_irq(data->data);
> > +     if (data->irq < 0) {
> > +             ret =3D data->irq;
> > +             goto err_release_reg;
> > +     }
> > +
> > +     ret =3D request_irq(data->irq, sht15_interrupt_fired,
> > +                       IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN,
> > +                       "sht15 data", data);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "failed to get irq for data line\n");
> >               goto err_release_reg;
> > -     disable_irq_nosync(gpiod_to_irq(data->data));
> > +     }
> > +     /* IRQ remains disabled until a measurement starts. */
> >       ret =3D sht15_connection_reset(data);
> >       if (ret)
> > -             goto err_release_reg;
> > +             goto err_free_irq;
> >       ret =3D sht15_soft_reset(data);
> >       if (ret)
> > -             goto err_release_reg;
> > +             goto err_free_irq;
> >
> >       ret =3D sysfs_create_group(&pdev->dev.kobj, &sht15_attr_group);
> >       if (ret) {
> >               dev_err(&pdev->dev, "sysfs create failed\n");
> > -             goto err_release_reg;
> > +             goto err_free_irq;
> >       }
> >
> >       data->hwmon_dev =3D hwmon_device_register(data->dev);
> > @@ -1007,9 +1016,14 @@ static int sht15_probe(struct platform_device *p=
dev)
> >
> >   err_release_sysfs_group:
> >       sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
> > +err_free_irq:
> > +     /* The read worker can re-enable the IRQ, so drain it first. */
> > +     disable_work_sync(&data->read_work);
> > +     free_irq(data->irq, data);
> >   err_release_reg:
> >       if (!IS_ERR(data->reg)) {
> >               regulator_unregister_notifier(data->reg, &data->nb);
> > +             cancel_work_sync(&data->update_supply_work);
> >               regulator_disable(data->reg);
> >       }
> >       return ret;
> > @@ -1023,12 +1037,17 @@ static void sht15_remove(struct platform_device=
 *pdev)
> >       hwmon_device_unregister(data->hwmon_dev);
> >       sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
> >
> > +     /* The worker can re-enable the IRQ, so stop it before free_irq()=
. */
> > +     disable_work_sync(&data->read_work);
> > +     free_irq(data->irq, data);
> > +
> >       ret =3D sht15_soft_reset(data);
> >       if (ret)
> >               dev_err(&pdev->dev, "Failed to reset device (%pe)\n", ERR=
_PTR(ret));
> >
> >       if (!IS_ERR(data->reg)) {
> >               regulator_unregister_notifier(data->reg, &data->nb);
> > +             cancel_work_sync(&data->update_supply_work);
> >               regulator_disable(data->reg);
> >       }
> >   }
>
