Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627FC46A5FB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391147; cv=pass; b=VlF9/2EhNbohIBpZZShD3xWBTkZnpGPmoFYmQb9kt7u0XUsAiVCBWPAXP7HTAe+MibBHUtYCbEsdNlYXljbz5+wPj/7fJ10RZltS/HsmgpCm5UQQAHOAMY02Xqg+zv+ccZwEermQsv6jR2BaMX2if2m0rs+OSU4qxGqe+Ufa9x0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391147; c=relaxed/simple;
	bh=bbQUKXpSrm8Dumgxw0+FiKY3C3ThRr3S/59ssFTR3yM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQSvuk3CcZnQaAysAX7+gu+uQzj8FrNN+pyyda75tN64NMg1bIVFB0WFZdgIeazcX6WyUc0+UEzn4hnMH5DvKjG6z03IXQbWoeC7x6MtW1u239Vr/WxqXzuseASdMjZZgAJkdRXmp1+H4eeu/0VGTtpQhcfZddPEiyqHKwHGBzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ogHRB5ZO; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogHRB5ZO"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66f943b286fso1463820d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789391144; cv=none;
        d=google.com; s=arc-20260327;
        b=ieg+NKU73AFgzOExsNK8WrF+eCGubglWzPkCP/lGSZRokzfS1LmA092Wl4vsJsU8uT
         XursPoc5Ys8uFWukZU/lccn/F2m2rePQ04WZseboq58PmxqggW3IMYN9qTr4+hK2sKlv
         JDIPt1mAn4H7vWRLLt7KsU1OrXne8Ta9Ak95aHlOEGUS6+TBCa6rdD8klExrAtMarIAX
         TJgQm/C5YfgV/+cA7baDdKNCzpG/Mejh/H39/iogktVf75neL7ntUIvy8SPWI95oQG5x
         d6GQKeXxamXQpgpXLE05D62AUiyLs24hQzxUMUMw/9KITxHqLUVJNNtKyfdC46TMAoLs
         YUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ATb80abIxzRNOcrbBCbD0LbdOqIeRMoUZA0iOkkMQfc=;
        fh=tME8qBdDLfSEzLVAj30h8RDUMT3ZCkGItPcatKHFXKk=;
        b=lZA3CPIA1RAjIVIxm5k8PWamHe8P9kPJ9id3Ba9NV5U+XZpwhS4e6kzJErFDME3B+1
         OSE8s91SdE/ZYUxdQ9WRr9JeKqeWmzp0k+U4+6IlwqglwcjVqc144FQKvat85P8vtRRC
         Or+6PjS1XbCfb9K4BrrRet1o69esPbvaN9ZkhCfmpscrd6hwSMYa7AB3GYgdakXmuQrk
         BlTyruq8Ub3blR40/9QF13AolJhww+sY9UQlQFNWGuzye1yi53SyEgzKBKritj8HF3v/
         lpGXgIZ+FRWpNtPaQFQrx6TpwhDTzOqXngiZr/TWvVCRo2rHkCoWBXPwWSk/UfRaaUby
         2oIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789391144; x=1789995944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ATb80abIxzRNOcrbBCbD0LbdOqIeRMoUZA0iOkkMQfc=;
        b=ogHRB5ZOyCPHNpfgDyoO64GCdqzJkMtH4uRpkGUnuKEv8tdSRaXXKlnrk54ydY5hek
         33hjOJuCNAutwfTmkACgEsYyQxjK6EYzmcVpDkJogYTamk09ceeYQJ8gFySWvg8k73As
         hxisvrVY4aB5qSp7QS2SJQMY6+rg1Egyz6ePag7DQOEW0sQDoICgvlZc87Iyv7vN+QRz
         HPkaZdR3rF89+5ZZOJ9kJ7UYmVcEEJW/g7Fw7qaYJwq/8wVo9xpb7V0NrwBNfOthLISn
         zhkOg/Ch1MxfHxGrqh2MI0A37d/ykJ2MN08EsZvX675HvfbZ8hign4oU7jBMXEc37CYR
         v2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391144; x=1789995944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATb80abIxzRNOcrbBCbD0LbdOqIeRMoUZA0iOkkMQfc=;
        b=OcvMY5jx1bZwpWtgIbQ/f5Nuo7mnxiYhgfz/Xc5fly+m7YzbW47C5kEFGEbYTMrmFO
         a0KNCcv//un4K+MU/ipu3E3EiL+0+GvcA5LomW4qAun3U4w9XcwhYtYGPSjhJJwL6mIZ
         CoD3E7utVcDgKapVZIkk4/5wwdicPefKQvPy9vCDMWMAUteqcYySF6mj8hgbFI7/ccdI
         bT30cux3NVtXe31qRwqXOPz48hvL6pAxKA+4wz3bd+fSHy7cE3dldWDAn7HJYGIP1f4c
         IHeYaDbG8cT6c81DwTRGrIytBNTHOLZVEOujix04GdY2KlutLOtBsVTVRF8mH6iYkn2M
         +FrA==
X-Forwarded-Encrypted: i=1; AKwUvBycJ8pRvXpgZYOc5pb2vUxGxDM8r/muyBInhQlppgPShpTANdEKcuFfNAZzY8ZKfbRE0Sb4Ag+uHke40zI=@vger.kernel.org
X-Gm-Message-State: AFuF++ncJmv0aAn19hEpQLYQ2sCUUiJUwP0LxlIqvhZkSQSj1yPsnPFg
	rUUq24COs6P1MDTklqBT/e5wmIjgvPJseyMXL0pA6d3ndl5xyk4HVfNG8qLJ9liHE/VSzN3HMNu
	+iiF+CPwYJh8BcpDl9to6d7UMo9+J+HE=
X-Gm-Gg: AYBFou2kAA92IUEqmAjPKpa1QeKnSKKZNicLexr7KDBQiRYoKh13tkXpr0Dt63uVYxI
	llvK18tDLAIgaiHkbCCTz1FkVDYNT32TDyFDjGt2IxbrPUYYWJgF+ZZlhSw6N7DRxgoUYpkfCvi
	R7xZoMQccNr4Msg2WMEaZorQuLRkhw8v6SroVKkHwwawjIkTUvt9R8ag4RE7Bh8MketxK/uLi8l
	icLRH+qz+eJPJ/Xyclhzs6b8BTk0poaynzvSqoCOHz1qVFMBLH7fG52a+zXAJ/dEvAuc4cGBIt6
	XteAEilQOwk9ectRYbtp1Oej4BL781AE+NXjiyComnheCCXbnBx71qwvvrQ2H+woq97CdDhXxER
	m10jKVAm6Dz5Z
X-Received: by 2002:a05:690e:4390:b0:670:f743:6eb0 with SMTP id
 956f58d0204a3-6714e30999amr315323d50.98.1789391142036; Mon, 14 Sep 2026
 06:05:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827172100.39176-1-architanant5@gmail.com>
 <20260827172100.39176-7-architanant5@gmail.com> <apCP7TkGVZ3I4jFO@ashevche-desk.local>
 <178813067693.2788519.14185731509268102204.b4-reply@b4>
In-Reply-To: <178813067693.2788519.14185731509268102204.b4-reply@b4>
From: Archit Anant <architanant5@gmail.com>
Date: Mon, 14 Sep 2026 18:35:26 +0530
X-Gm-Features: AcwNN1Xeq6_r3LCXmWL2fFSYRWYfvRHnKfx33tbn8arVaRIb_7x0aHNdDWvjW8o
Message-ID: <CADJHxWB1EyM0q=qDx9f79XMkTkX6ngiswFA7++A3oZvzMQV3Bw@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] iio: adc: ti-ads1015: Convert to managed resources
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, dlechner@baylibre.com, andy@kernel.org, 
	nuno.sa@analog.com, u.kleine-koenig@baylibre.com, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 4:28=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On 2026-08-27 22:28:45+03:00, Andy Shevchenko wrote:
> > On Thu, Aug 27, 2026 at 10:50:58PM +0530, Archit Anant wrote:
> >
> > > Use managed resource helpers for the mutex and runtime PM setup.
> > >
> > > Replace mutex_init() with devm_mutex_init() and replace the separate
> > > pm_runtime_set_active() and devm_pm_runtime_enable() calls with
> > > devm_pm_runtime_set_active_enabled().
> > >
> > > This simplifies resource management and ensures resources are
> > > automatically cleaned up on probe failure and device removal.
> >
> > ...
> >
> > >     data =3D iio_priv(indio_dev);
> > >     i2c_set_clientdata(client, indio_dev);
> > >
> > > -   mutex_init(&data->lock);
> > > +   ret =3D devm_mutex_init(dev, &data->lock);
> > > +   if (ret)
> > > +           return ret;
> >
> > This part is good and maybe introduced in a separate commit (depends on=
 the
> > resolution for the below).
> >
> > ...
> >
> > > -   ret =3D pm_runtime_set_active(dev);
> > > -   if (ret)
> > > -           return ret;
> > >     pm_runtime_set_autosuspend_delay(dev, ADS1015_SLEEP_DELAY_MS);
> > >     pm_runtime_use_autosuspend(dev);
> > > -   ret =3D devm_pm_runtime_enable(dev);
> > > +   ret =3D devm_pm_runtime_set_active_enabled(dev);
> > >     if (ret)
> > >             return ret;
> >
> > This should be done with care. There were some changes lately that actu=
ally
> > moved from devm_*() back to regular calls due to some races in runtime =
PM.

I reviewed the series again. Considering Andy's concerns, I looked
through other patches that included this change and the concerns
raised there.
However, in this driver the runtime suspend/resume callbacks only
update the conversion-mode bits through regmap. The existing
ads1015_power_down() devm action also only switches the device to
single-shot mode; it does not manipulate runtime-PM usage counts or
shared resources such as regulators or clocks (as in other cases).
Thus, I don't see a runtime-PM reference-count or resource-balance
issue introduced by the conversion.
Is there a type of condition I have missed? If there is a relevant
thread, I would be happy to check that out.

>
> In particular here, the patch description needs to say what this
> changes.  It is not a noop change.
>
> I'm not saying it is wrong, but I would do it in a seperate patch
> where you can clearly talk about what changes as a result of this
> and what affect that can be expected to have.

I understand now. Although the cleanup callback itself is simple, the
change to managed runtime PM also changes the teardown semantics, so
it is not a no-op change. I'll move this to a separate patch and
explicitly describe the behavioral change.

--=20
Sincerely,
Archit Anant
