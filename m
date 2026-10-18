Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F053D3CE0
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339204; cv=pass; b=eUo5lRwkMEr0QqWNuAzizmwxL+yuWHi91x6TZfwSvGX73mtPz418fLsg/wTI39dUtEkTm2ahv3g8ZydTp0WwJ4B4qq+hvHs3v8T8hHq546Ytj5g8llLVraMeC1pLiek56OsUoCs9p6kvsU9euajK3QxcQXIIMnQw9YZdzyDjiJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339204; c=relaxed/simple;
	bh=JzcJJpy2gYrpseHQO+43yHXYRzGIqoHENqgeGBj30xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JokuTL2T21M6JoMD7DTbFD8ZRC9JyxVkducllC2TtkyFZDM6JofD2vVDEtjYwVgYyP0UqAzQgK2A3SBtoGG89Ufcu/SgLcqU8MR4mFAn+8oEm9pF9EVWFAv8bhK9+TzTp4tyrfBVTaiZvJWcBUyGHcOJIa93sEgASCLuUhfcsak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oS4yhCi1; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oS4yhCi1"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4a76d86a3e9so292525fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792339200; cv=none;
        d=google.com; s=arc-20260327;
        b=TLqQ8cF7sRj/nczJVV9nw3LA9vZgY/bynxJEDtqUKUb+/CspW4qMzcogU8MadOtsJO
         sSc95dYRVkTddf+OIJ9nBxuYxxI9Vd9q6j6qL0NqFM+fPbfawLA7GcsFZg6hq0hfqvKP
         rs1YdP/IiCHUHCfPg5f8cn4JEQukCV1b591bgPnNj65JFqJPvtMLXZu/jhpdeXdH3oez
         dcOJVScJD0O7OLIEYYd3bXf3zH6P+Su6WTVdXBJIBQmboJmo8HFE3Gj+vpW9sORlG//c
         MIspDseGWWSDuZkBbzK6ygPVh7pJD8GgdSRuBvzy1pEqvibkkPhYT3+2HWIwIMItlyXg
         v3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PtH3imBx8royFPRkx74DeIp02F8wZK8wqgF5zK1e9pE=;
        fh=WUcivuVHJRayXV/qRrQQFrpGMQlZpmqrFqv6TYzd3H0=;
        b=PBMX/+Z8fNrPRgb8hXr+mVHU0sQciGDMR+FBvfvOTH0gjvCeBNL8ZVAta4TOvV28gI
         R60w+lndzkPDwZduyNvGox7RPa+FbJnSm2XINEXBPnY8la4buJ662jsjTJ2t8nlMYHIA
         KUdPs49bDQ4ybsL3BD0uWdstVZlJm64mXnhYsFuWH0hO3feq8tpvtN1EhQzGI4E+P1OB
         tpl0omXeh0jDedjWkWifYBLalfXCJMHH1nVGX6NOgFYdcKHvtqEBIOV4nRD7vhq6jx6J
         /VQZr5uRvge+c1wiCHdPOUG7SIatzrDaFC+RuXoAVu9g6MpvbUiACy4Ef6M18Gj5UWiS
         6aKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792339200; x=1792944000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PtH3imBx8royFPRkx74DeIp02F8wZK8wqgF5zK1e9pE=;
        b=oS4yhCi1nmvpM+GJRWi5UUY7W3GJm1C0tNtgYv1RjbGBQj52jqt0zNqarucsXvIkyU
         hOiZbDJdxGElO4DwsDzYdN7UOhWYHXS6Sd5siqBhmfIxTtDYvKLE28p/MIBRfUo4ANBX
         AbWf4RB6lQ4Tfp/P0HY7wtiFFhsiGqhBylH5tbQDPqSoG3VPuzoIDm+Uf8nranH+9jsf
         cursgX1HqYHsp0zTG9+0El+6DGmLHqF6mhtiRvQF8/GRok8pU5P/UheoZY0N5yi08w68
         IwX04ODTtBjFD8VNgQWJcrE5qtwVJryRvdc+CsvuspKjJiax/Npi2srO++4CU707wISm
         7GyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792339200; x=1792944000;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtH3imBx8royFPRkx74DeIp02F8wZK8wqgF5zK1e9pE=;
        b=vXTuPrrVtAyTXcnKw2H0HnOkB2VD10w8QQl34ugyoKRBMrz+HK46GXZK468GDrqxGZ
         9nZRE7lPlZQ/r6TcuzNZrwsgj3F/ssuepfQ1W3bIp9cF57OyFCW/E8vCSe/7mwnsgLiX
         w9892IMKqelzdrVWbhcOFa3V2WTvqhg8+rqJZ5mU/+HKb900sekKA+wsJpYNoJSbpUeV
         DlSsTIJz8KV4V1TSZLmju0MQapL843FB6zwNGivRrQk5i4iUbwGssQPzdTfLKZ4fc0lo
         YSo4CXkqvgDNpszLGaM5mXalxdkqeE8HoJmDqLkUkp9UnbhYpIHC5QZgzJcZ1Ijl4bmG
         TFkA==
X-Forwarded-Encrypted: i=1; AKwUvByjONTRI8lppUW2QMEr3pM6OxQett3Wrt1A0xkTwa+yFoCQZdhq/2DKEJWdpHioj6LxLT9LmeEwV3IcP5s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3dVBDqkQkT/sNRVLDLLBYboIJUc65p29Pou5DFPf/q42HXqeB
	IZQZDnyU5a5PyT52iWm+MJvouamyOGhvYjKQKM50Go+QjS8kVoWHmId7BbbE8AFyQu+8EwhLdCP
	4IQYk5gwSX0OW4kutTYwpWB2ea5XQ3wc=
X-Gm-Gg: AYBFou2Z75ibnxCkYqhLczHqBC9+NKzK7TiyFXzxYHS8XBK2WuNeQ+WUdc54lMTaoI2
	PdOVj9e+z60IKgWr/zroJPW80ws5i9/E45p0KscIidsv5HYOFJaQCJ5TphIR9CtFzPYqw2w+/RQ
	01+Jt1DBzrmNz4NRH/uh2zsAh2/itHpYgjOYWp2G6hWTLQwXGbTRM5q/t6dpOGakKgW9T+RRhJY
	lsE+7GoptbdSvwoReye+jnIuCt7lPElS2dOcri0SY55Tpqy13Eum6pS9Gn5CKUefVHmihcJaRme
	FM8l8/iPaOxutSTvfhKAi9pC9neDvqDfkjWAtE7mWSTHTuscse8RSVCn0j9rkOvmbQvm4sm2NN6
	XTkOKg2Wb67Djyw==
X-Received: by 2002:a05:6870:b520:b0:4a7:1cb0:6287 with SMTP id
 586e51a60fabf-4a7579e45f8mr4590240fac.17.1792339200348; Sun, 18 Oct 2026
 09:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-tlv493d-scale-fix-v1-1-69a722176c06@gmail.com>
 <20261017230910.77d1637b@jic23-hlaptop> <CAFmh=S2O7TzFEe5WqH+Te9dQOK5TwAtjB-7GC7uDj7LGS9=w_Q@mail.gmail.com>
In-Reply-To: <CAFmh=S2O7TzFEe5WqH+Te9dQOK5TwAtjB-7GC7uDj7LGS9=w_Q@mail.gmail.com>
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Sun, 18 Oct 2026 21:29:49 +0530
X-Gm-Features: AclHuK-F7jJBC_8i46qI7Dk9IvquedrwAiAZVypGRkNENfn7t7YKgyI5OOzkNIE
Message-ID: <CAFmh=S2mXJLk=V_r_eie3=zDfXXRX+aUba=Kn+5h3PQ9pkwxnQ@mail.gmail.com>
Subject: Re: [PATCH] iio: magnetometer: tlv493d: fix magnetic field scale
To: Jonathan Cameron <jic23@kernel.org>
Cc: Viral Patel <viral8854@gmail.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM. Good catch. There seem to be miscalculated Gauss scale due to
multiple conversion factor.

Reviewed-by: Dixit Parmar <dixitparmar19@gmail.com>

On Sun, Oct 18, 2026 at 9:22=E2=80=AFPM Dixit Parmar <dixitparmar19@gmail.c=
om> wrote:
>
> This change looks correct, the Gauss scale value seem to be miscalculated=
 due to multiple conversations and different reference. Good catch.
>
> On Sunday, October 18, 2026, Jonathan Cameron <jic23@kernel.org> wrote:
>>
>> On Wed, 14 Oct 2026 23:07:36 +0530
>> Viral Patel <viral8854@gmail.com> wrote:
>>
>> > The TLV493D-A1B6 datasheet specifies a magnetic resolution of
>> > 98 uT/LSB (0.098 mT/LSB). IIO reports magnetic field in Gauss
>> > (1 mT =3D 10 G), so the scale should be 0.98 G/LSB.
>> >
>> > The driver currently reports 98/1000 =3D 0.098 G/LSB, which
>> > under-reports the magnetic field by a factor of 10. The comment
>> > also gives the resolution as 0.0098 mT (9.8 uT), mixing up units.
>> >
>> > Correct the scale value and the comment.
>> >
>> > Fixes: 106511d280c7 ("iio: magnetometer: add support for Infineon TLV4=
93D 3D Magentic sensor")
>> > Signed-off-by: Viral Patel <viral8854@gmail.com>
>>
>> I'll give some time for Dixit to take a look at this.
>>
>> Thanks,
>>
>> Jonathan
>>
>> > ---
>> > Found while comparing this driver against the TLE493D-W2B6 register
>> > map for a new driver I am working on. Compile-tested only; I do not
>> > have TLV493D-A1B6 hardware.
>> > ---
>> >  drivers/iio/magnetometer/tlv493d.c | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/iio/magnetometer/tlv493d.c b/drivers/iio/magnetom=
eter/tlv493d.c
>> > index 03415cc2c9b3..234e3ce63ff7 100644
>> > --- a/drivers/iio/magnetometer/tlv493d.c
>> > +++ b/drivers/iio/magnetometer/tlv493d.c
>> > @@ -299,11 +299,11 @@ static int tlv493d_read_raw(struct iio_dev *indi=
o_dev,
>> >               switch (chan->type) {
>> >               case IIO_MAGN:
>> >                       /*
>> > -                      * Magnetic field scale: 0.0098 mTesla (i.e. 9.8=
 =C2=B5T)
>> > -                      * Magnetic field in Gauss: mT * 10 =3D 0.098.
>> > +                      * Magnetic field scale: 0.098 mTesla (i.e. 98 =
=C2=B5T) per LSB.
>> > +                      * In Gauss (1 mT =3D 10 G): 0.98 G per LSB.
>> >                        */
>> >                       *val =3D 98;
>> > -                     *val2 =3D 1000;
>> > +                     *val2 =3D 100;
>> >                       return IIO_VAL_FRACTIONAL;
>> >               case IIO_TEMP:
>> >                       /*
>> >
>> > ---
>> > base-commit: ceb05f22e5cdc3f8bd3f7d5dcfc57843942191dd
>> > change-id: 20261014-tlv493d-scale-fix-5a0b83b52d2a
>> >
>> > Best regards,
>>
