Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B7B3911A9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363577; cv=pass; b=pMQgBmGjoTCmIZjsLpQJ7oJUqwGbkkkYz0FNGVLkov8xlYVraxwS+fTt2G8cPG5BsdyxW1t7eF5uenSN8JNu+07WBbSUt3Wmox2/2huWlmFqf9OOFTHp+zAJd085zg3m4d23gB4sV5vRPT/WcnA434dlNMGZrT8VH5iUltJBXZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363577; c=relaxed/simple;
	bh=EAMjyOpIadbTNwO/tz13iEMNLmVb+GEL9o+oPDkJh1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4qkTTYEl3PBNiZadH6ITt6h4QtUsJrUBr4+ghFNeCfDNhPN6zxamVj1T0S/pgP4YzhuMQHtA44fzsMBlB5+Ei20onfjzifkBWDTV5iK7m0S3dxRG0rDYQiD1QepzMKzNR3rrsCEKfUIGkDa9IUT9MrDuKvoIoEAZapjbfS5ChM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0H+8yxc; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0H+8yxc"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35154cb9de2so1841493eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791363575; cv=none;
        d=google.com; s=arc-20260327;
        b=TS1ySxg80jiqV3ppXJhIfv88L4HXoIJTK8vWbx5Frk5lf2r5Uh6x7j36D0tnDzkaxN
         0if+4S56u+Jz0JJdrefvwIz2eBjHy7tmixm1aZ6E1uq/nKzQtoQRDWCbkBLzb68kV0e+
         o6sfbpPwgk1k6Abb5n4/EoSvecp0mSxK+4DXMt7/Mwim8ghf0Rgira3/+v3OMlk9cTAq
         M6WGuirVuKJg2k4IUfdVcbyJqjRyM3cxplX3sG/CQeos5E2mVp3OAHu4268DJvkf7+F1
         zBA6aRKE84Qx8kkyfr6ew5iyAei+eYrC1WOOygnbDdjA1rbR7XBtpbvEUYYuDZXB9Q14
         oDbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1KETL+EEchgdXWGQqndAVph82q227zViCBlnrcx3jTs=;
        fh=1NIGEzSPX+ELer1Dae5unI8Z3lMqNAXtnfDSGD0r8xQ=;
        b=knQ9FrJ0RFgEv3+9jPbMKDDyi9tf51IDqQsm+bL7UKxTKwI4U413MoAGh7Tz6UR9lp
         o+LZcQogpG7tN45X/Rs3uCAfHX8fsCQiQnLUG+Hx6SZ/p8YzHYSm8HFoR8Kn1S5FRwjX
         1bI/KsGt/BLX/oVWAZFGK7L5usIFxzd39ApOek90/yKsiRshrbqNqDxsQ3EObzXh5spk
         k3c5pTYG055cbBYLSqUID+Y5mEcLsFuLY+gr4dLFGMaGgocofIShIPuSklsr3QUpWPPB
         EGKrZ0/l7sb6TczdEq2Q0vnscBxu1rJLwIkYBVZ8ZEdYfpwclJPSi3wUV2pXbWV6vbgF
         GJEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791363575; x=1791968375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1KETL+EEchgdXWGQqndAVph82q227zViCBlnrcx3jTs=;
        b=W0H+8yxcCqvlfzG+2rrdd+ixkCz99e2hB10zGcJk76XjsDI5KpY23vDmlYfWxAKMDJ
         DkJexEIED3B5zJTd3cBj3d7YPVvxVV1bIWTyY3v7MncAFNyhHsyFEFvH962KMMSWjyyq
         n1sYXN9RQ79+vPoPSGS/0V+4gYvxD9E//RQt6N1za86QKTZQzV5b4QcIlct7p3S2b9ZN
         c0vkrqZ42YhtecPer6MiKnnwfCO+OA6h5SqtFxmMMXDEQgs7rfaAbKPqZ2+VhfERRM1/
         M4QcjJS0G8ePSG08BaE/XE5nY79Q7lX1/ZknVHygppJiD4SqdqiCjRaKp3zS1wlR6Mnr
         JaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363575; x=1791968375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KETL+EEchgdXWGQqndAVph82q227zViCBlnrcx3jTs=;
        b=Sht9MDtxjFc5Ju8Wyx9u74aQ5GblEa9NWdoLBckbpAfw1ndjS29Mqp53gSOzZgQGy4
         9vQfXDrozhg0R1zbnVgkKMQiZ5sVRnAvspXNOe83Lio8xnHmPgM132rBAhyT4dj6JmUj
         Au2wyJ5r6RId6ohUBCHhCgYFMiB6ynimZkOS6ydT4x0vzftQ9D3KpS0gNxqWNYSTZFiR
         +Dgtoei3ViKZwgHjfBMwxZAx9QLfHPJBSEuZIGfHEfS6p1Z2QDxavPT6sviXPwqHPv6b
         xWwAkW9N5EA4ClGrfpL+xc+2avMZ0yRJYw8S1EYOEYDv7Dv/Q9kHq3ykLD//ZDV4tzWN
         vhSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKEfA6CDLFbnYRSwFvi9pjmWt4ByMf2pfHdwHZkoF69Cxbixz3/TwxOuVYxHsraQdxQbI5qK9M3EK4RsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQp8la5WlINu1h2QDuxWXzZGoN1vTO6m2YPqORNokMJOBRoQ+N
	59xzddFE9MbVzGHI1Ow6s0ZfxsIeldTincfE752r99f8yfgS4pgcL6z4gBH0OK4QPiZH+tWtRwi
	5erdK9qsW186s+I7igEp7WrHFaxJ8bZ9D9WUk
X-Gm-Gg: AYBFou1bTDnr5qq+Ue0rhvhVmULZNRRUaQvyj83oSrzr4e/0U8q95h093Vq4+0w+y8h
	CeKdO6Ae/4jnMHl1WRjxzhlhCglgynSmfOItU76nMPMzsLKgJQnZqmwFHQx/nm2Km6bWDdTbM4O
	YqBFYrq3CyIVRcNW/+CCc5QQdK2lMmLfgiAcckPEu8STxZSAv/ijRwSsRop3wp9r6nVDnzzbfWJ
	JG8c0Oib/3hiwprKaU7c0t4raav5Fj90TKARDZYe5d9ionv1nau/+1+i5+hKBGyAFZyTEbhIhv6
	/ein4FRBwQBY8TckgdcEab7ennqwJ8Ty5UxXtyLvuW4r3v/zWmAQP9QX2MlVUeOujjrgQI72Hsa
	a7XQosVbsJHUl
X-Received: by 2002:a05:7300:f792:b0:34c:d55e:a752 with SMTP id
 5a478bee46e88-3515ddb78edmr1522796eec.8.1791363574792; Wed, 07 Oct 2026
 01:59:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006154431.318936-1-clamor95@gmail.com> <20261006154431.318936-6-clamor95@gmail.com>
 <asYFNNwVRAcX1V9o@sirena.co.uk>
In-Reply-To: <asYFNNwVRAcX1V9o@sirena.co.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 7 Oct 2026 11:59:22 +0300
X-Gm-Features: AclHuK9aXt9IRdQT6nESmarE1wVeJx-V2PAtwKk3EA3FnuACDsVmbpc4zTjEbXk
Message-ID: <CAPVz0n1LidN0MZFbgG6GoX2wea9R8Ga7=Z_S99bTR2j7me6zgg@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] regulator: lp872x: Remove platform_data based probing
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 7 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:39=
 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 06, 2026 at 06:44:29PM +0300, Svyatoslav Ryhel wrote:
>
> > The platform_data-based probing is tightly integrated into the lp872x
> > driver structure itself; removing just the platform data support is
> > impossible without remodeling major parts of the probe sequence.
>
> >  static int lp872x_init_dvs(struct lp872x *lp)
> >  {
> > -     struct lp872x_dvs *dvs =3D lp->pdata ? lp->pdata->dvs : NULL;
> > -     enum gpiod_flags pinstate;
> > +     struct device *dev =3D lp->dev;
> >       u32 mask[] =3D { LP8720_EXT_DVS_M, LP8725_DVS1_M | LP8725_DVS2_M =
};
> >       u32 default_dvs_mode[] =3D { LP8720_DEFAULT_DVS, LP8725_DEFAULT_D=
VS };
> > +     u8 dvs_state;
>
> > +     device_property_read_u8(dev, "ti,dvs-vsel", (u8 *)&lp->vsel);
>
> Since you're updating this we should fix to read into a local u8 and
> assign the value - the cast won't work on big endian.
>

Noted

> > +     device_property_read_u8(dev, "ti,dvs-state", &dvs_state);
>
> If these properties are absent then dvs_state won't be updated...
>

I will init dvs_state above then.

> > +     lp->dvs_pin =3D dvs_state ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
>
> ...so this will be random.
>
> > +     lp->dvs_gpio =3D devm_gpiod_get_optional(dev, "dvs", lp->dvs_pin)=
;
> > +     if (IS_ERR(lp->dvs_gpio)) {
> > +             dev_err(dev, "gpio request err: %ld\n", PTR_ERR(lp->dvs_g=
pio));
> > +             return PTR_ERR(lp->dvs_gpio);
> >       }
>
> dev_err_probe()
>

Noted

> >  static int lp872x_probe(struct i2c_client *cl)
> >  {
> > -     const struct i2c_device_id *id =3D i2c_client_get_device_id(cl);
> > +     struct device *dev =3D &cl->dev;
> >       struct lp872x *lp;
> > -     struct lp872x_platform_data *pdata;
> > +     u8 general_config;
>
> > +     device_property_read_u8(dev, "ti,general-config", &general_config=
);
> > +     if (device_property_read_bool(dev, "ti,update-config")) {
> > +             ret =3D regmap_write(lp->regmap, LP872X_GENERAL_CFG, gene=
ral_config);
>
> Same issue here with general_config being uninitialised if absent; this
> is a buggy DT but we should still handle it better.

Noted, I will check default values in datasheet then, thanks.
