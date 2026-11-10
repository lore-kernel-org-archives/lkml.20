Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794338829;
	b=N0y5vTzoVvB2xzLfPxLtBJOM5McJXfhodQlLy+0BoIwP7N0a4dZHB2haJIz0Dbc4CVxH
	 BBebpIdA6P0T5ZvExJ6626J7l6Ex0ed4KO4Jyezquxolq7fMYY5/fEGujUyJadl+W88ot
	 JFgftQI1hQJQ4DI4o+NUT/IKcvwEqNze6GTNPT/nCIoWJdYWZQWv6R4AF1r8kkXJcecAE
	 g0nA641yl66dD7C5ZMWWyJD5YcszKhejJv9fbuOTtMbweaiL5Vp9CN9AL6rv3GwRWFecm
	 nRKUeGF6O6JebBSQQrMBL9tSzrZmTWM2PHtisTVtqw06uEi6HcSkHoI2FLe3NWh7sWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
	b=EhKZtmKs2Q61/sGS8k78IP0zlxD6EbdmVVXzxdacuHr9nPnd4fk4Mse1+EU80uK9KLIh
	 xmvbkV5qe2FLjyYqVlLszzVHH9DDA7BPqg3w1LK4zKpu6Xr0pFlk2A9j0pNj/5hrwM5ar
	 /rCN6DQN3nnRzUxrHAfyOyrjn+m9LeIWBjQ3YPVtpadr/unNqu2jcGKVR1JYS7TC/HLcE
	 WerjQQ1AtbJVovtjlEQLa9gerk5fnKrB+vG8cTBm9AYa2lugcCYxd/P5VT5FVldLJWTCI
	 EPydaUv/ygEpGh0LL6q5roP/p247jkd7l/63pFwxvx5wHlHAfE0B3Ln4mXqVL9lt5BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dnMneL+X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F2E606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F2E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dnMneL+X
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b305312e4fso20951857b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:27:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794338827; cv=none;
        d=google.com; s=arc-20260327;
        b=N2kmCXoZl6aA5xhQ0UY8loGysUQ5FaKNUGCVGLIgl0tvU1Sl1OgSUED+vWqCaM7YT9
         mpIGym3vISfg2kxDxz9A/38tqrBWXkBLcrfvb3u68ATVpdQm8IMhruk1JxkQFpEhj2f7
         bQPg0yrme4GXS87cZ9TZbg4PD0/lJ42LXxphm/g6DV2UpXWLvsNf6IidSBchmcFvJTuD
         NpkrjCTucqOxE4UffeMZcvzw+Z6JT8sLJCLTt26geicQHVFTG7gvoy2DJcetvr8hkKU2
         aKmT78xz2teeytTy/A7OCrU94b1s3CphC1R+ds8raMKXLZjUMu8z4hKujltc1W15EZkv
         dJ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
        fh=j6pVWzhW81QmJ8xsPEogDiEDHFiMJ235jLDbNNy3rdg=;
        b=RCS0q53pywENdYCUhbUnWWXuu7F6JpygdYdAUTfonVZ1F2bqgpCr4SvC8OF9n4EnJB
         biphsoYTEqtYoypYO1k6nQ342gkO7KApbXzwzqG1KNHEXWbPiQ36QrnLVdRF5U7ayasy
         a5vF3GGpgookL6gQCjBkFA2HOr/ndvJcdWrts2cs1oNbXZ8WFS0vDIOLNYYgZIXWg5EM
         3y7CB+NOw+HTNMyrPD/DWGaMjY0zmJHrV/r05TzV3IrXKSE3RQZv7Jcl+tUEayAyxkk2
         LTs4F/CrLhn3xQP8UhQT1yUbi2IwjQRllHgv8cU3TII27jOLzS4F96o0WtX3sH3qxJuM
         UDog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794338827; x=1794943627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
        b=dnMneL+XJ3b1M4ASEHVeuj/dVeY2gNNpVmeesPydhdAKdVnhdMuWsMS2adyErQNl5+
         6TVNx+2AvYKqYe/fl5pbLnjtqnejCsJ21xsM99vnAbhbg5Ho+l9qrYeZad1mMorI/Gz1
         i5JcBPTsWk4EGjljE9dFTRiF8ILW9SYAd8yrz3vKTc6qVuRGY6R6ZKgJS17+GBFRONMG
         HmPfc7YHrg6mnYIusa5ZjjYxi9sMHWe5DnLwf3LQf6cjJiMdesu309BbEhoDV5gD+vrC
         /w7NI7KcdAggclYNuqWrzPHH6nEQuax1wWB2Lj2k2BAVU1VCUYKr1VD51VJ5W8W25Xao
         mZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794338827; x=1794943627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
        b=WIYSWKaTxDEUPdMq7hcgziu2LBCvtvIzx/ktcV1YklIsiHZZcsmSYiNEMiSBK2nQ6u
         bCzQ4SMn7WpYkG4ysB+bUnmX1RnRqi8vyLUSe1a60gbuLa7usHM2/98tJTE54ItVcV69
         WCGgWb58MIdUWKq/lQd5u88JCo90HMr0oCQwy2QGqumA/qLhAcZ0wZe2s1MNyT35ParB
         GfkCzOJmz5za4aF38ENRZsOBehK+8YhU46R0OQigDqkBflmFpmRSmPRFJx2xNqDUBUJO
         AIPWIe01GLaiEY4H575dNDHcLo/Y6kfya1Nfka7sg3jmfjNZe4VNYn/ZT95P+vdLvgV0
         e85Q==
X-Forwarded-Encrypted: i=1; AL+hErHDrzXKv0ZhXjHxRQYKBilos2E05ijvQlntboxMjbpWAoRhPj5qTHuBeLfSVpGnf6X3Uu1k07j5LNmqJSg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c/0oEtH9oDC6EpxGWtKu167jkl+J1D3561QQAkiSun8uUultX
	nqVXipIasRea8+xY+8hxb3dAthoHr5XK+JuEnqCw1/0AgWssZzWR7VrrjuAxR8m/cJDboWGKF5V
	G6pWVrUW4CdrXLGGHQ4dUUIJNVqadtV0=
X-Gm-Gg: AYBFou1nLuhHx9Y23TJTzGdbTtKK+X+29baiLN6yzyNc3hz/Trfu0Ipnq9EejfqHtPA
	qIh12e6Uj90EZ5kiWUCeDHWPYmBknK+yF18vT7j6VCLo5MypRNerRuIvFMrs1sJy+42vytoXKjv
	1RLgHicZzeJocHSn/lYuJY+dbEcWjhZLJ08glOP5/HeFSeIm8FIIxUH0W3z6eB0BBd0RoSdl6fj
	BcO2KlhJ9C1bufL/ax567JCxOIQY8DXSHN8A+5jLEu2zqmo/iGwyOxm74r95CLWcehEUpQ7mAfn
	N5oCNUG3JTS8w8yCB38SQDxudVNnz9ieFNlhslswEckOetQQNUIKWCtqecRxb077GOtnFZAb2qe
	VC4jmNfb17L/03w+ZVJQELyrPp/t9lFHqHQRR5w==
X-Received: by 2002:a05:690c:438c:b0:8a4:be24:f233 with SMTP id
 00721157ae682-8b3a80e6b9bmr1379417b3.46.1794338827449; Tue, 10 Nov 2026
 11:27:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org>
 <20261108-04-k3-pm-support-v3-2-b9dc0857039b@kernel.org> <DMQHSDTR177I.1HWHAF4FWTFQ5@linux.spacemit.com>
 <20261110105658-GKA2005@kernel.org>
In-Reply-To: <20261110105658-GKA2005@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 10 Nov 2026 20:27:00 +0100
X-Gm-Features: AclHuK9GBj1g-yv_7rKhtj60GYCKBcJP3tjfjvEauHRa7ZWcjceK1ew77-uBX4s
Message-ID: <CABdCQ=OGejVS-r2Cuod+0EZf148g_-2Y8=tkLqbK-QRn8UH+4A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pmdomain: spacemit: Add power domain driver
To: Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for addressing the feedback. The series looks good now.

Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El mar, 10 nov 2026 a las 11:57, Yixun Lan (<dlan@kernel.org>) escribi=C3=
=B3:
>
> Hi Troy,
>
> On 07:12 Mon 09 Nov     , Troy Mitchell wrote:
> > Hi Yixun,
> >
> > On Sun, 08 Nov 2026 10:36:02 +0000, Yixun Lan wrote:
> > > +config SPACEMIT_PM_DOMAINS
> > > +   tristate "PM Domain driver for SpacemiT SoC"
> > [...]
> > > +     Say y to enable device power management through PM domains.
> > This is tristate now, so "Say Y or M".
> >
> Ok, will update
>
> > [...]
> > > +#include <linux/io.h>
> > > +#include <linux/err.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_domain.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/auxiliary_bus.h>
> > io.h, err.h and platform_device.h are not used right now.
> >
> Ok, will drop them
>
> > [...]
> > > +static int spacemit_pd_power_off(struct generic_pm_domain *domain)
> > [...]
> > > +   if (ret) {
> > > +           dev_err(&domain->dev, "failed to power off domain %s: %d\=
n",
> > > +                   p->name, pd->pm_index);
> > > +           return -EBUSY;
> > > +   }
> >
> > -EBUSY drops the -ETIMEDOUT returned by regmap_read_poll_timeout();
> > why not print ret and return it? Same in spacemit_pd_power_on().
> >
> Yes, I think it's ok to propogate the err
>
> > [...]
> > > +static bool spacemit_pm_is_off_state(struct spacemit_pmu *pmu,
> > > +                                struct spacemit_pm_domain *pd)
> > [...]
> > > +   return (reg & bit) ? false : true;
> > return !(reg & bit);
> >
> Actually, there isn't much difference, your version is slightly short
>
> > [...]
> > > +static void spacemit_pm_domain_cleanup(struct spacemit_pmu *pmu)
> > > +{
> > > +   struct spacemit_pm_domain *pd;
> > > +   int i, ret;
> > > +
> > > +   for (i =3D 0; i < pmu->genpd_data.num_domains; i++) {
> > > +           if (!pmu->domains[i])
> > > +                   continue;
> > > +
> > > +           pd =3D to_spacemit_pd(pmu->domains[i]);
> > > +           ret =3D pm_genpd_remove(pmu->domains[i]);
> > > +           if (ret)
> > > +                   dev_err(pmu->dev, "failed to remove domain %s: %d=
 - state may be inconsistent\n",
> > > +                           pd->param->name, ret);
> > > +   }
> > > +}
> > [...]
> > > +static void spacemit_pm_domain_remove(struct auxiliary_device *adev)
> > > +{
> > > +   struct spacemit_pmu *pmu =3D auxiliary_get_drvdata(adev);
> > > +   struct device *dev =3D &adev->dev;
> > > +
> > > +   of_genpd_del_provider(dev->of_node);
> > > +   spacemit_pm_domain_cleanup(pmu);
> > > +}
> > pm_genpd_remove() fails with -EBUSY while a consumer is still attached,
> > but pd is freed by devres anyway. Set suppress_bind_attrs like most
> > pmdomain drivers?
> >
>
> No, I won't add suppress_bind_attrs
>
> As I'm also aware of this problem, but intend to address it in a differen=
t
> way, and should send a patch in another separate thread..
>
> In my opinion, Adding "suppress_bind_attrs =3D true" will only mitigate
> the problem, in the case of this driver, it will still trigger a problem
> while unloading the driver with rmmod command if built as kernel module,
> consumer side won't get notification with the event. Ideally the device l=
ink
> machanism should solve this, currently I'm working on a patch for this..
>
> --
> Yixun Lan (dlan)
