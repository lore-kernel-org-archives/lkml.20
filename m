Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B66430567F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125504; cv=pass; b=TXmf1LTceqGGHyfuqVb3/93yndFJp7LPk8b19Rg7MHM09h9+S1HngFghU1afJ6pG1qoMlAkHQT5LVMQl28mGZOLF4TV328jmBWNlwdzLj1We2fOVlg+xcusccnCIaWSe9/BbcKl+V3awzuFZxv3uFqNwGnwTxyO2QfKy+Pzl5aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125504; c=relaxed/simple;
	bh=2rlenAEdNau3gkuJLtqbh74S+Iv9a38jmstY8ig7buo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZlD6ohJW4ORiXKUL752BmS1CJYVw5Ytd+2CpqsMMINDfJYNLa1xmzgoE/h75wT6QzDPxC0GWw6SiOeipPxw3PTGRGRpVL6RBLIgI/hMks62QQFz/aEX9pc/YPZH5giFp6CpCjDrhPduMu1W7EW3bKBaNzgz1s6X/5VdfTy34/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5Ys0i8E; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5Ys0i8E"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b2232d8ef5so2766817a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792125502; cv=none;
        d=google.com; s=arc-20260327;
        b=FceYZB2H73ejBUoGXv0BhGReOb8z7OQ+mE8UVongldL94UCQMiuB1Q8SMn9SRiz7iw
         bhQrqF0axIgkVwPblQKdSo0A2ltk+N0+VefvBgfUTL327kaF9AlDXBH9nGQWOasBE7li
         0xZPv4vPoeKRLM+KV2Sm8NQ5g5AKo2fGTCom5OQY7o+O4h8Y4EZJyll00s6yigQRDrlK
         HI/PTFepin4eixou3XIq9gBI6A90qz3szCV6j2LukaPb5XXKiRfFLrqEDbaFcTBThxL9
         yB82KopeQn5SBk03uR3OrJse29Gw2ksm7UuhiaDggA6tKL+pG7aKHABKtae9oHl0Bgfo
         wkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k50iRYZEHIeglzuFdsPLFoaxWBDTeuPE91tn2Q2sZzI=;
        fh=qspaoNsUUNG/aRx4AqThZAlLvYkiJLEyhFDAo3psyUM=;
        b=DF/9aVkfyCBBILiaL4h7EbK7IKA5d6+GTz9La4WzRL3rvnWEb7nCQ25cW8gacG6865
         k21b0Y+amCcxW9XAKLNqvkBiLMhuH/32VHH2S28diRDvrZc0enIMrznV+21BK5lBL08y
         PsC0OR+EKOewjKn1G9PD23jEoicbU2S52cYPIr6aYSQpLRnZfSG5G1S7wlhqBcqC4Zb8
         fmNc3yM34Ht63Kg47VYJGLO9Go2MApmyDuePp0u0dlQoKmTSjJO/iZTQV8ukuVz/sz+1
         +F+8v3pXMj0GOj/WNcncELuez3rMqi1psyjNxk8hwNbCXiaBoIoQmjl1ZDIwbxFqGgWX
         g5aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792125502; x=1792730302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k50iRYZEHIeglzuFdsPLFoaxWBDTeuPE91tn2Q2sZzI=;
        b=D5Ys0i8EXobxcO6CYJeolom//0atFkVfdkFrmLbWuBgVoo6fk0UgcGC66TZdfx3fHV
         s4/RJONSNPM3Fud9BWx3yWW6BpPYHprURdtnYySBhsGesb2glv1bL8cKkfETW7IHXRkm
         S2z7D/W+i2JYHZwgc6XDevQbec0ZxJegz1fB0gCo7gRHJCMg6tM7I7aTwI0dGzTwycal
         cYUjA80gp2YzKK3syWA4J72RINrdRjd1v5r8vE+DrHPPZmkmLW/JXxwEGiJCCS6jTOpQ
         dPW6Ean78mtPlduViQNiVnUupBpwOFjvMY/kzFF4ZXuOEZv/X/32nw/+aK/h4h0GOmSe
         TfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125502; x=1792730302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k50iRYZEHIeglzuFdsPLFoaxWBDTeuPE91tn2Q2sZzI=;
        b=FtDdurY1QNBxrZCGpmvn/mDMvWnevopHsH7OdR2vkfVpCJN/94/vcleEFJIg6cIz9D
         zt2G3Z0zyU0KscuBxXetMevTsaAYE27IEptXS3/h8o9cIKd01pIr3hFm8X7L5OXZIb8K
         rmSL5sYUoaKjwIWTNhYumWSQoF62CFtdTAzFg3CUJ2s7kR7bBjaFVRNO2tCQT0/zRtYE
         vs/AiPZGF43T6vR1Xf1DYJ4uwEYfZ2aJihlczGgo3G8b9n7fE+Gi59+Rzv2C1KwUUluY
         x1DRYp09agkxhVpVU+kTc+1y9U/82d52Jmwdl/qA9wrCV3A0p6k2AEHg/Z5ag2qx8/Rt
         LT3g==
X-Forwarded-Encrypted: i=1; AKwUvBzoUriYHOOiC4jjb5p6sysd3649hNQbcLhmnnU68MNASsUsa4QMf7B7GtUm9Z4y6gL/3kUz0iOf53q3n4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCst/3Dcqg9jUXQdF8bO2IyL9cMGDsVSgnDzs+T4tkofKUOzND
	WyRJzD+z246q2obUcns4ZE2WUtA6m74/WMY739BKuk0GhNPPWgspHXIPio0NgAAbhXyLLWkeq+i
	rvlHu0yu9dkFxg5NVetBvIguHzoJasf0=
X-Gm-Gg: AYBFou0SqmPRZuvEB6qGREErpLprq7fE7AJJ8cSD+qgJxkCeW2kVqLRRtyi4mdTPShe
	rdVysh5ZbUzKH52PzQ2zq8NechrXzz+sdbH4LSPLZI20VGingLiCzWN7rg7yqmUFPbIob80R1mO
	1gc7ayJ6yQDQgX5kkyZRqZJuI+dtxem5kWg+jrIJmMKKFn3wYCOz84Oy+i/GA1mOcR6EBjJOysg
	CQPJVxMxiUk4mHDb/jL/4W2I8ibg8x6Pd5K7hWbVYGhT/mi5luDtbBruBu5zUOyx/nk28FT0fyl
	9bhYRRJnJvFelNGOjfimx8cmOV3WSV5DKCp40FYQpKVNg1wEzRvB+jDER+oD6Z3/B3F09M5b7dX
	lyZj8yMhRIqpC3UQ1TgJ5f9zzmAoaFy8KpKr2lfCZ5hWqvPHlmXGEBIG7eAN9vRAQMYW4ez46L2
	w370v45PzMODHA9UkJX3JciATrnvUovBf6dbbGSt7xySgTVv2UAML6O72TRq83uXXcnA==
X-Received: by 2002:a05:6402:c51a:10b0:6b1:801e:e01b with SMTP id
 4fb4d7f45d1cf-6b1801ee296mr11816181a12.20.1792125501771; Thu, 15 Oct 2026
 21:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926013325.75073-1-rosenp@gmail.com> <179198497618.839288.9266863610003754798@kernel.org>
In-Reply-To: <179198497618.839288.9266863610003754798@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 15 Oct 2026 21:38:10 -0700
X-Gm-Features: AclHuK_rJlPsw1gibHYA5u1PE6PZtVa-1YcLBoIsKBrVYTa4gD5TkF2K5Ui3F8s
Message-ID: <CAKxU2N_b-wxOuugVm7wzgh4RN9oUCNf1jnHYkKN0--MxHHA_tQ@mail.gmail.com>
Subject: Re: [PATCH v3] mfd: twl-core: Allocate modules with twl_private
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	"OMAP2+ SUPPORT" <linux-omap@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 5:05=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Fri, 25 Sep 2026, Rosen Penev wrote:
>
> > Use a flexible array member to allocate the twl_client array together
> > with struct twl_private. This removes a separate devm_kcalloc() and
> > keeps the module data tied to the main private structure.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v3: Capitalize Allocate.
> >  v2: don't use twl_get_num_slaves().
> >  drivers/mfd/twl-core.c | 16 ++++------------
> >  1 file changed, 4 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> > index f86df356d658..0b78fe30e047 100644
> > --- a/drivers/mfd/twl-core.c
> > +++ b/drivers/mfd/twl-core.c
> > @@ -159,7 +159,7 @@ struct twl_private {
> >       unsigned int twl_id;
> >
> >       struct twl_mapping *twl_map;
> > -     struct twl_client *twl_modules;
> > +     struct twl_client twl_modules[];
> >  };
> >
> >  static struct twl_private *twl_priv;
> > @@ -770,7 +770,9 @@ twl_probe(struct i2c_client *client)
> >               goto out;
> >       }
> >
> > -     twl_priv =3D devm_kzalloc(&client->dev, sizeof(struct twl_private=
),
> > +     num_slaves =3D (id->driver_data & TWL6030_CLASS) ? 3 : 4;
>
> What's wrong with twl_get_num_slaves()?
It relies on twl_priv already being allocated.
>
> > +     twl_priv =3D devm_kzalloc(&client->dev,
> > +                             struct_size(twl_priv, twl_modules, num_sl=
aves),
> >                               GFP_KERNEL);
> >       if (!twl_priv) {
> >               status =3D -ENOMEM;
> > @@ -787,16 +789,6 @@ twl_probe(struct i2c_client *client)
> >               twl_regmap_config =3D twl4030_regmap_config;
> >       }
> >
> > -     num_slaves =3D twl_get_num_slaves();
> > -     twl_priv->twl_modules =3D devm_kcalloc(&client->dev,
> > -                                      num_slaves,
> > -                                      sizeof(struct twl_client),
> > -                                      GFP_KERNEL);
> > -     if (!twl_priv->twl_modules) {
> > -             status =3D -ENOMEM;
> > -             goto out;
> > -     }
> > -
> >       for (i =3D 0; i < num_slaves; i++) {
> >               struct twl_client *twl =3D &twl_priv->twl_modules[i];
> >
> > --
> > 2.55.0
> >
>
> --
> Lee Jones
