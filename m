Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D9646D555
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925600; cv=pass; b=LBAzdDrVqGK3OJWSEiKb4vbu8Qq+ENRqKY9Qpx6hR2j9mkeib5kZEEzHYUzbxJ4noVHc1dHpWT2z8mIO32bG1uaaJcakU6dQJo2UxzqipwwZMdlaTBGVBNNWTvSWtz/aNuU5zYKIUBx8jGlo+jDgrR00xk00fRs5fw3yAXKVito=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925600; c=relaxed/simple;
	bh=PLDkatDMFuj3LfTf/LIfXkKvgu8bZZ7TEdRf9Z+1JP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/RaRc0p7DD6UarU6Riw8R4auXHJW/0LDtjAH7Dtr1XUxDMA0R+LR4sUENWTh8elqu6OLpKk0Z6QSQOo9JV+2a7PCiL22/ugKhv49fNcpReFS6oNcYORXZwCj5Q+KjlwBDjr1AV80H28exl/xnv8FsCeRw/NPiG2CJKuPTlomfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtnER0Bx; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtnER0Bx"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1c7364550so1117642a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787925597; cv=none;
        d=google.com; s=arc-20260327;
        b=LlgBK4ei94UOH/bcJTwLusDfV7uiANoH1nBZ195JUMPmx23gsOa/Fj2vVndmeomHAU
         U45awDaF5cbtnXpWOZzhH0G0YvpOcrhnQY1w50lf3kWqvpLGZ1u7rTqXBEJhsHAKMKE7
         vdeI24zx155AYbr6PQ98tz3ag4vTCQEIYh0mP9KoVInf01fOZSqpnOhbz7r93ji+yIJi
         Lnj5btYGS4BnJqKwvRhcq/EwHLWeYCPs1voU7aUKMNlLMPWmDfEobUgRHArI9UnLrvTi
         zqEYdZxKdWVD/rPphkFWv/Dt8MfCJSz6EeauY6865a9nb7cU9k83CWO6957FQna1+CPn
         i2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2GfMRvhyksSuSYcJwpV/kMHEmDv12BqauazUIu9BuUA=;
        fh=zxXVHNmRLKwVidfcBjbfTtODsD9+C5oZUb3RavvnDkk=;
        b=BqMrOgUaJBwvfjZGdD0QWFLOPKRLNwYuZ9XktkgYNcZhbPWJm6nTN9suqAZ/ydO2Nl
         2RC7ZhFowQc0VtcRilcbtLAIeZeQ4zLgUTMvIvvdBcdmR/XCLz4RaZc4h5j3GaS8uJme
         z9DngyWSZ5Gpx710M9d1sOejwTAbru/TzXhJEqvVqbS2DfHynJVhNn7kvEF/9qonoTJ9
         8++B6FVs8uAya4h7/YViiWoexhlKJp/Mx3Cy95vfB4gWlQ9UxM6uQLPgziLngiJI2AYs
         KmWR6mEpflWNxx2U7qUywBct6wXSMeNYDIYoC7O21N3+2cXoRgG4UAb4XWdtRJ9WvFEt
         rV0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787925597; x=1788530397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2GfMRvhyksSuSYcJwpV/kMHEmDv12BqauazUIu9BuUA=;
        b=AtnER0Bxly1hJYGTtR8GyEKYZH6vPsORM/+OpfltLCq8OBF+4n0jmIPUVGtw15zRwV
         iILX+zxOOiN7uxMcBuhcqkS36vjc5YGnZABQ6bMjl4zVJxncaUhypXJhlcWx3z15LOPn
         YUo1x+pAQqtNRmOJoi+4c5yplNvJY1iwAfpO+rffoWgapXS0J+QeWI9vLys5RMqODo/n
         bC3F4DN2e+EOn7TeZXIEirFh7HV1H4+F4AiBj2Sfto9L82dEbsJpYUSCnQ7pRe9GGi2Z
         8b73nHVkgfXKpxZCmPJvO17yMwukwHY+u9OtcXasKCp4HyQOZRNCv5Jy2P6mlRzVOTZM
         sWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925597; x=1788530397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GfMRvhyksSuSYcJwpV/kMHEmDv12BqauazUIu9BuUA=;
        b=A51WWyEoP236oiWWUEFII4eDDkGmxuuO/HMbgGd3rkgsYaJ2ubPPs107bB8/HZG9v5
         JiVzfsve6nzSqG2CCtYTu1KA6aaQdwlqpNos/NfT5CiA8gmBUjplp0kwu82LyUYmhHwd
         mehUApEkLFH5/T92D930LYOTpkwU9RjP96IjzLKgZenR92pCtYJAL+Skc4xzg0mec6W7
         iGL5jDn8nUAUQe8hsuFUTAo8jgniHWXYEvVFKNpKSZuvjcmGgvolwtHZdWFIUFgnrlAi
         kyO2osQD+GtuPzlH1GzXbhaksMpE0JMKnu9gF5yo5jYd7ztkAVLjA7xzLXBhd8KUMiMH
         bYqw==
X-Forwarded-Encrypted: i=1; AHgh+RrfstWRvNYDmIISAGc0f/J072Ermy0wzWwWmjLHys1/txoxkWoGcF6CxJAZuZMbBW+kz6JDaRAps5Be9OI=@vger.kernel.org
X-Gm-Message-State: AFuF++lLoi+Qb6Noo209+JTPBAH5l7vWQSeYTRgZlcLWvQ+PvVtKLudg
	4wJEg1eOJQOGG7Gza/X8Td/DOywcbPiQi6zCHlNtRQb3ZKdPBsfre7gzB8Ve54QnSEzha+c0gFM
	LlMNykVDYtYj+MQ5TviZw4KAmjxpCjSI=
X-Gm-Gg: AR+sD132FEQyYDlwSrflEqUC9JEtRVIpL/0AUZfhY6/1C+dk2l+74RNFIrtcyaLTFnu
	u7rwTJNgOnywK0gRdi7xT4ZYZo1UdseI7T8TtjowSW8NAmO0Gt6JFp50XMqHmaptQCdRsmXoKbI
	Z5iRGHNnyj8IORnyxk3qo6oFMbHLbivUeHEoJ6c/0oNQJt314suGbxSux2sE+9ywjff3vxgmV7S
	EViOWwBHd2bGqQjVrf8RJ+MYG2m1hQLjr+/1HndwWZr31/Wl1DQ82ZiKntSm1sAQ+qtdmg4SMhq
	qbo70b72x6bOKWTP8OltbPfiIHvewix6BxlkXzDhkUSr6tY=
X-Received: by 2002:a17:90b:2f8d:b0:38e:4114:d8c7 with SMTP id
 98e67ed59e1d1-396d0a3f016mr16289039a91.0.1787925597040; Fri, 28 Aug 2026
 06:59:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828032922.469449-1-xuziyougm@gmail.com> <0db183d7-3881-4f81-9e04-cd2c13d1dcee@lunn.ch>
In-Reply-To: <0db183d7-3881-4f81-9e04-cd2c13d1dcee@lunn.ch>
From: Ziyou Xu <xuziyougm@gmail.com>
Date: Fri, 28 Aug 2026 21:59:45 +0800
X-Gm-Features: AcwNN1WIz7kiRjyaUFUv6xWV9lPHFkUCwWjJHmG3pD7abaxNcROmy-pxsGrQvww
Message-ID: <CAF2gcSUVmn57iSo_Vf08+QWHxAoDRbpuone5MOnMd=4c_GhfGA@mail.gmail.com>
Subject: Re: [PATCH net v2] net: phy: air_en8811h: restore AN8811HB LED GPIO
 after MCU restart
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	bjorn@mork.no, ericwouds@gmail.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right, I'll fold that into v3.

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B48=E6=9C=8828=E6=97=A5=E5=
=91=A8=E4=BA=94 21:09=E5=86=99=E9=81=93=EF=BC=9A
>
> > @@ -1265,10 +1258,19 @@ static int an8811hb_config_init(struct phy_devi=
ce *phydev)
> >
> >       ret =3D air_leds_init(phydev, EN8811H_LED_COUNT, AIR_PHY_LED_DUR,
> >                           AIR_LED_MODE_USER_DEFINE);
> > -     if (ret < 0)
> > +     if (ret < 0) {
> >               phydev_err(phydev, "Failed to initialize leds: %d\n", ret=
);
> > +             return ret;
> > +     }
> >
> > -     return ret;
> > +     /* Restore LED GPIO output enables after MCU initialization. */
> > +     ret =3D air_phy_buckpbus_reg_modify(phydev, AN8811HB_GPIO_OUTPUT,
> > +                                       AN8811HB_GPIO_OUTPUT_345,
> > +                                       AN8811HB_GPIO_OUTPUT_345);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return 0;
>
> That can be squashed down to:
>
>         return ret;
>
>     Andrew
>
> ---
> pw-bot: cr
