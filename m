Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794559300;
	b=4SSdKFIKvCdiDsQwBJjBQH2uIm+xzNZcWFJJlsuCeEb5kmpDx5U4g/HcHrTpeBZBZlzF
	 5MHJ1FqT/Kon7mdvzniW6s7hLkn0xVw7QQZiDe82fXlq0NybkJRhh23F3d5qovgFlGt/d
	 yLaY+scajTk2sedQV97nIgln9UkjdV4e6qRGIV/lhlF6j+nErr8G79HTTHau27OJaC7WT
	 pTSJHBPDkG5O2Quf5IbZeHfnCOBnlVeIyVny6Ul2H/+mZXrHfKcT47BA3IwOZw8UCyTIi
	 9MsIUpO5qRHoFTiyzA8DHJ2QBpRgnrdsOunLIUZ2Mz5t7VQ3DkhjIW+x6dBRo5CGboQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wd0IqbdzMVGbW4Cv9X/8BHQcGew4KeP8LilkGkVj9Sg=;
	b=lfT+H3cytOvPkC3CrxqVVnQkP7IkfITTWEghLW19Zl6a5TeK7ccSofWqHzO9QOmdrAt+
	 8MJ7emoktUoMgydJuqdqlv9hNBSc3FF8rf/uzFfCedFKaa47zGVHKXo4iO3LEcfWTHChi
	 gAW2RuF2y8OaL/VMZ4ggy73RymlgmS5ssc8WZyNSSmVELDPQDwUKwxQgs1SBmz4DHHxCC
	 bnai2awXTzeCHInfCAHpu/4Rp8VdacrNdANyob3tnNMqN0u/2KNIP/lZHYiMfWXj2ERmk
	 Q1nbGr8/AWRoXAMsUCjUsZBBQVmSPSj4GeDMPee+TnoQW2bep2yBT+6D+Y6NkvQWCNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jCLIKd5D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783BB606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 783BB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jCLIKd5D
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0cf2c0785so7549127b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794559299; cv=none;
        d=google.com; s=arc-20260327;
        b=ALsRdM1y1lAiVBMnVJDpf9yIb1KLGfMZC6DrtxUB0JVgnaTjWZpeKlHrlXEkZikLsP
         zJP9oAF8bTzxzNgsWU/7oJThPgdhKHkAcA4EzKYBshXjwwlrsR1la3bjNv2/F5VZuRRs
         SM61GXj2b8fnk0V3ia5bIj2W5b3iGaMuqjo60YS0wx74powZI2JdhVHygeyglqL41dfH
         Bg44AC5rZBIkeaSBlA08kB1EWf+hbESPVIGPPKqoKsvBwBVR2nwoKvUE7hFXTdXHjCTc
         dn0vc1/CcEg7tnv7xF4eDMZ5SsvE3AaYjq5vd/YMRFgxj47rK5t2JJkWYQmyY7LEtQD2
         29ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wd0IqbdzMVGbW4Cv9X/8BHQcGew4KeP8LilkGkVj9Sg=;
        fh=5s4XH4qi37JS9pf4Xr/BFmBCm8njZzCRmq55DfDgw04=;
        b=cJTXawtFrmixX4ZlVGklf0cEFAg52UI3+7/pMAcKiU3f/aD54q1E95uGBGiMQ1S8cc
         CtdhsDN+rmHd07GWdzVkNCs1qGQm9ouLfJrdslSGyTbj0it8K8nuY2V+O4FdjyVj1CEu
         A9eDqfN5FfUiZMvVr/xRxf8VN9oNpHBLtNv1dG2J4hhiTfziQPP88Rb7lQyHG+1RZhc3
         nzxz0OnGXKlCluEbroS+S2DbZs4sVyQbYQpBZH0Rg82UI6udWBC532Z78VKa2Trmg0Wd
         UbANwBGrZ9SgK4Vqvy/cDkx3uM+FYWD60eJV+FYLXdV0wV1noQCZziHUN/2blKzdGXtJ
         IJAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559299; x=1795164099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wd0IqbdzMVGbW4Cv9X/8BHQcGew4KeP8LilkGkVj9Sg=;
        b=jCLIKd5D6I3EwIEB+X/90+AoVDHX1PQjWfFDVSM6zeCrHsshbbHkEGIUmV1Ih8LmEB
         We+Ma3bCbQeSXig8Czb4BQGw9fRaH/K4GFQ98Op00ZvstvjGTunUBqOSnR6IrRsFQACn
         /y6xcnmek78TX1xKtyUwynUw3iwVgKqv8xXxQFreK/bpVKdzEI3P5SKC9TdfgRVUzEpk
         NuaYOK5mszsuZPTuLruCwbOtV91ykbCTthn7/nteUITBC6XKxUUH7buXtwBeHxqUu5a1
         dHNEe3MYkWmR+S/LRrpfjTk6jbUZm6Wb47Gw9eaJV7wHIzT4+tz8QID0X9fQ2hxsfpMA
         17hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559299; x=1795164099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wd0IqbdzMVGbW4Cv9X/8BHQcGew4KeP8LilkGkVj9Sg=;
        b=RJUxnrc/FR44iuQ86sEg8OB5YDP0fV/nso9SIyrwqARThdrV8+0VflqA9LnO3di60T
         tLULBvCr8bzbyBuxnd5xsKNIKP/HDwx7Mr9nsRNbk5VkO/7d7bFEMeafMqw4QbtSYxMW
         MgxRfo2PB7gDvOpTc4GaaXsmN2MXnJHx+Ls/ChT3om50vNSCpaDDmc2CSNweV6SK3VcR
         pi5Aaw6PqQtPbYBkeqyVJjvffgjFOWONOp78sCwxj2WA3eyfgvZy6/e2Nzc62+mVU2Nd
         b/V/0wP+361KczqmGW491xhUcFHy/KxiClsSxuHfUnOmcUfrfCNczlZyGuYN5RJXpkdx
         1iwQ==
X-Forwarded-Encrypted: i=1; AL+hErFGclq3R26eGWDiQxgBWcZad69afwIytQ4Ex4/j11HehGUaHUDJntAgYq34ezv74G3iVUnO/1MKAkNafY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aBgfNr+MOPAKVnK5Ndg5QZhkZbiAvkp9oNlxbUXlF/yCu/txk
	29rqJpAfPW4F8nowc7prmErxRQaUtpiGbGP6sv+qU3H0jJmrm2bOxG+KmjTtr84PHtrcTV7PV7i
	D2I8nO7mlFjdzPpKBnY1dGdwUTTj15vY=
X-Gm-Gg: AYBFou2jlByOBygCKg026Chb9fZFF0Tu+9WRxNCKxIQ2k3aQR11W/xwY4q+DBezi6DB
	34L3wzNcB702+BFY8X+QOY+TRIqeMw7YTZo8IpNRSOsrccak1GX/NTO8oIZH7elN4/agsxC5kTO
	gMoKadTfLD38zgoMLQoOtFQyIwxMN9U0ujgXsFxbKcPd9F/2m02U2VRFvVr9qVeZUSA1yrDqMbb
	X4QfiLL+RNpRvv3sHL/BAns5UTHjQPetDRbjQu0Cp6IbpEf+0aqfLrVwm69HXnpGDFzY5dyUIZ8
	tUcnQKGPs+5g5X46VH+dvOZ9IGM2y71svwnRMOWpzE9MLliPHjpRFzjK3pEjwlezjIG4IvzyUgn
	d/vv4VSEWTpPA6uePiglusLakPrvzERhE1jrWvKxlze19Z5oZMCpVW3VwAitEqZV7uFSbAvJpRU
	KKhJsjMWXFnP9bqPZbmnnp0F4+RfhSCekJ1nwRFBkGiOaINd5JWylphJaRyNvYmxzjBT3Sz+zsK
	HvjXsYewYDy7BHNj4IDU6Xfl10mdCB4a76aUOYbYoACRfL18PVO6Sjz3GmE/g==
X-Received: by 2002:a05:690c:e20c:20b0:8b1:86ae:9006 with SMTP id
 00721157ae682-8b4aa360702mr7180297b3.89.1794559299407; Fri, 13 Nov 2026
 00:41:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113082546.176582-1-zhujun2@cmss.chinamobile.com>
In-Reply-To: <20261113082546.176582-1-zhujun2@cmss.chinamobile.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 10:41:02 +0200
X-Gm-Features: AclHuK-CGa8WOMkBb1Qpf8ygg13eYkgeuepypb3hDt2OnjdY0mSX6Vxr9tc94VQ
Message-ID: <CAHp75VeOjqWoEM36OMgtiiwu3XWiu5wfJf59vYFuGSApbWpPaA@mail.gmail.com>
Subject: Re: [PATCH v3] iio: potentiostat: lmp91000: Handle configuration
 write errors
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 10:25=E2=80=AFAM Zhu Jun <zhujun2@cmss.chinamobile.=
com> wrote:
>
> lmp91000_read_config() ignores errors when unlocking and programming
> the TIA and reference registers. Probe can then succeed even though
> the hardware configuration does not match the parameters used to
> interpret measurements.
>
> Check the configuration writes and return the first error. After a
> successful unlock, attempt to restore write protection even if a
> configuration write fails. Return a relock error when both configuration
> writes succeeded.
>
> lmp91000_probe() returns either error before registering the IIO device,
> so the caller does not need to distinguish their source. Preserve the
> configuration error if restoring write protection also fails.

...

> Changes in v3:
> - Declare the loop counter separately from the return code (Andy Shevchen=
ko).

Now this makes no sense as you haven't added any new variable.

> - Explain how probe handles configuration and relock failures.

> -       regmap_write(data->regmap, LMP91000_REG_LOCK, 0);
> -       regmap_write(data->regmap, LMP91000_REG_TIACN, reg);
> -       regmap_write(data->regmap, LMP91000_REG_REFCN,
> -                    LMP91000_REG_REFCN_EXT_REF | LMP91000_REG_REFCN_50_Z=
ERO);
> +       ret =3D regmap_write(data->regmap, LMP91000_REG_LOCK, 0);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D regmap_write(data->regmap, LMP91000_REG_TIACN, reg);
> +       if (ret)
> +               goto relock;
> +
> +       ret =3D regmap_write(data->regmap, LMP91000_REG_REFCN,
> +                          LMP91000_REG_REFCN_EXT_REF | LMP91000_REG_REFC=
N_50_ZERO);
> +       if (ret)
> +               goto relock;
> +
> +       return regmap_write(data->regmap, LMP91000_REG_LOCK, 1);
> +
> +relock:
>         regmap_write(data->regmap, LMP91000_REG_LOCK, 1);

What's the point of duplicating this?
Before label you can easily do

  ret =3D 0;

relock:
  ...

>
> -       return 0;
> +       return ret;
>  }

--=20
With Best Regards,
Andy Shevchenko
