Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794559690;
	b=ANm0Q+fjxHPTIgSKM8dK5Z7VQ3TC+vKu5S1S0blPK1j3QzQHr+zBRR4loTlXi5SZvFsw
	 Y3MBG2YwKrc/6f3FIJIt4OeThlwokYVhMX8dkSWCynXN7g6tcPJAXvuxqy75p3UAe8hSj
	 YaeqAnUA9m4bzIkeMTtlYd5blsj1EyrVGRK3LGqAGI+nI9igPuh5/z2s8sGCBmiBdY7m4
	 bcWFMEnb1hocc8aVQvYukFatblekGM5UDG+XCgJd2DUlvZ/AS9EpDK2wK/CUlHQsXXQ0Z
	 3+e85uD/2jWsGvbDlqGHzeUPufXZGriyz73Wv/RqSVC5mzB6PIPsK+7wsxaEiaFYzBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Sb4C2w/d5w6+ocGzHVnaU8bpcCXtQ0zPQIONnx/cfo8=;
	b=oRcuk2cswSH1iIpbytmpOWIX5OcFu5JVJncCfYHX8A7xmCishkWr4Ud8tzL9nzNqauHp
	 p+WvDIjSzi1jdSbS41bLNInjDP7UQDnVK3XOVl0CEZGQGlLC6vbJ2vS8yMxl8afqY9HPx
	 Cf2ILfW769rxL9iAOUGp5cjqdbhl2ORzO6z9WsQNVjuOovThMkt8EKuMyFAQtWZTto+vY
	 di+F8d4w7OIIex7u53DlM2ik5RYblCy0B/dQXbJl9dNpd82gXoFQ7U/QKi67NlnlHBArT
	 u9L1Sy3au/ih3hELOVLCGyhlYgUGWEZI7yCXR0fgmhrZE7iWs9uE8NoOD7ZUtWU7r8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QSZlkHq+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE80606B37F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE80606B37F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QSZlkHq+
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-675617e81f9so635903d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:48:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794559689; cv=none;
        d=google.com; s=arc-20260327;
        b=GLWo7X3mNiZQTbA6EfePNz4jGyKvsoTaeVcOOIxgK9QNYLTTmVVn+1XeLYqbN9zt4a
         nnMS7aAWRB+lTiq/e8fcXDZMwng13HzQc/S8Zv0d1SQlpIhusNCdRSc7GQI5tdeETtpy
         +9KcgHD7iWyJuRrFx5XBRP0eZlfC/Qo2mqkkevZsgPhoHqm4U2N04n4payf40ITrMnYz
         xS+n9+botBTxiiYcR5XNmmy11+TCr3Ct2b32fzQJ0YybyIWbFGQvs0EKE9KLjEL7JNhj
         Harqysmf7GYYzuY4aPNv0BsJ7NjRyWajBFvFcL+lwfbhReDpLosrtc1WtUDzU9o129rB
         3dFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sb4C2w/d5w6+ocGzHVnaU8bpcCXtQ0zPQIONnx/cfo8=;
        fh=ARwoMLnzD30WLO8YCDXS8Jx7N+t3UBxzAv7hLjcdn1U=;
        b=PMjwF73ueU1jqrGbhAAJVKeFEiA4v4ySUJ+b3K/6v6YSZoInySU6ebN4lP5t/kpPRJ
         ig3WZEV+hW6KcUvXr/ICdJcXmy+ZYEBJdROt+SAYYynBca3RbmYjVPQOrmV9g3kd5B99
         6fapI4OZq78gnrP/C0e0qmnTG1q0CQjOIKLOniIdLdFBkq4j20dghb4QU901fbyxOPPf
         a9e1qd1UjyZM4Gy9T1E+UchQvFAr2RvFHCLfp3WalmHKk+Q1PbntZ7t/flTUradAjOfd
         fQIrccTwPgb8ygwVfXqEGy9Ewrw1BIAJfQQOJoR7G3MjclZSA0SoMj0TGQ6SGUqUsX50
         7FoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559689; x=1795164489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sb4C2w/d5w6+ocGzHVnaU8bpcCXtQ0zPQIONnx/cfo8=;
        b=QSZlkHq+cmszNgUi7FcavufnIwocDZOFiFULftEhiI2WI5o8l0XNNv2JA9f7ikENig
         M4VUV4Pn8ONiz52MKMdn//q0tre9wN5Olo5ZPdpCqt3tNXa+W5oSpH5dyue0D5wUVffv
         hVqAxRW0RrWGJcgrTWsV+gyzqcPapFKQTa7Jibcih4pcg3mItoSOGxVce1wmIfmCVNko
         szZOKA4dVpwlC7M7ckSnTzFwB+nKkBtyVXDjHIhY2+rySyJfsIO4PBb/v8cqPmU4LwJQ
         /YyHy5JP5bZceFKfXrcCyaBx4iDcQUQTSAprwE6PMJZSdYhzPGNb1wzJRCh+BVTzTSHJ
         w4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559689; x=1795164489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sb4C2w/d5w6+ocGzHVnaU8bpcCXtQ0zPQIONnx/cfo8=;
        b=IYsUDn9TEkusrAk4lJsXvuidzQe7tYbA0SXl31fNm8/qcgq45cbhGHpAvOFvp5/J/r
         Ke60EylNgRJ8sQsIauPJmACSW/rND54Zodo+brMwpC5xlOyzZHyuhK0RdzFK7rEtfyZf
         qJnYwQnuZVN5UEKuKeJdcD//mN9yQumaNYSD3xEPh1BiedP835ZpFE0D+31RcWF6IeL2
         znVsX15YDxnmrpT7Yv7wcNKb63bVExuOqDKVMGU9NZC/ncbhKlGSQTmsnn482ru2n6/Q
         pl625rE+ma/Stm75VtqGWzm4p/2uIXgXVxLIGADuo0lqyJiFNYqlaH1E9GOE/dFArthz
         rOWA==
X-Forwarded-Encrypted: i=1; AL+hErGlXhOeD/gHC0AD0nPNTuuZe5qUqotVM9kKo92bx6L3Taq0yhBGunnV3r21XMN97yUX9JpzV+zW3LQvhxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+crYE0lKLlLtVRYWwF8Wg0mQgXrWGdX7vL2rH9vataHAF8BfsM
	5hrwhW0SxoqoRXqzkXU3oK+Aqo/QRUtCT9GVLK+OFoCDE06yJjnioDslT7wfzMgR/I7Q/hCpjd6
	mzhX/EYvUT02zR9NfWzs/xZ+6+IkbNFY=
X-Gm-Gg: AYBFou3+KZsdNXwuxoQ7fc9IMNxfzBm/uphzm8DBJ6lPB2X6nrKprFQMuK23BXJw0ki
	JLFroYarKquBkEM+8rs5skQmncMFfXZAVul4uXcq65x/fOijqqnp3uBkvXWrNz4Mj2cp7ockaU9
	hdM4JGyObsLsJ6RdZFF1ibbdO8WvSWmOUMRpFAYlp4iYxRvfmwVe9cvU7N05Ds5XoaWR6z77Ogn
	SgtsYeukedm+3n1wVmjbsYioJjv0YTI5GIjSN5W7tYSf8Vz0+7cemEZPs0mda+QvWlBaYgEsE/M
	fYEQtFme5wu+BqFZ/URLV+MGf6Y5Yd0H+FgNIXZl0OdvXYj/d33b9vfFX30BHsy4b8veEO218PK
	o3qaoivOYkCEbS0rRWhfMc+Qp6RQCV+znHdV7i+0lThqViuSqQ2Rg1vukcHlyC2iUEpksmgWYF+
	jl7Z/rVv5pHOZ5OoOQ51xVD1QIs3T2ZwrEOiLv1yg8q+pEwT7HIJonrXXc+WloWAmvXMG1fOmkS
	I2w80mA+29Kb9Ci/Gj/7gIt8tyQme8QoPyOs6GDhxXjP7l5tG8acULVXPXzLpHTVpYzex8Vg/Vv
	101XVLY=
X-Received: by 2002:a53:d682:0:b0:67c:1d73:fd3d with SMTP id
 956f58d0204a3-67d897d5059mr810181d50.108.1794559689013; Fri, 13 Nov 2026
 00:48:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113082546.176582-1-zhujun2@cmss.chinamobile.com> <CAHp75VeOjqWoEM36OMgtiiwu3XWiu5wfJf59vYFuGSApbWpPaA@mail.gmail.com>
In-Reply-To: <CAHp75VeOjqWoEM36OMgtiiwu3XWiu5wfJf59vYFuGSApbWpPaA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 10:47:32 +0200
X-Gm-Features: AclHuK9rjEqJxLRL5SgQJUJktkIm-qEWvtfM6EjpPfAvf3U0-d31BCeAdrVtQ3o
Message-ID: <CAHp75Vfy97JHMaURigbF92z7Eypfuny8PUk94=-43S6p6PhknQ@mail.gmail.com>
Subject: Re: [PATCH v3] iio: potentiostat: lmp91000: Handle configuration
 write errors
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 10:41=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Nov 13, 2026 at 10:25=E2=80=AFAM Zhu Jun <zhujun2@cmss.chinamobil=
e.com> wrote:

...

> > Check the configuration writes and return the first error. After a
> > successful unlock, attempt to restore write protection even if a
> > configuration write fails. Return a relock error when both configuratio=
n
> > writes succeeded.
> >
> > lmp91000_probe() returns either error before registering the IIO device=
,
> > so the caller does not need to distinguish their source. Preserve the
> > configuration error if restoring write protection also fails.

Btw, this is still unclear. See below.

...

> > -       regmap_write(data->regmap, LMP91000_REG_LOCK, 0);
> > -       regmap_write(data->regmap, LMP91000_REG_TIACN, reg);
> > -       regmap_write(data->regmap, LMP91000_REG_REFCN,
> > -                    LMP91000_REG_REFCN_EXT_REF | LMP91000_REG_REFCN_50=
_ZERO);
> > +       ret =3D regmap_write(data->regmap, LMP91000_REG_LOCK, 0);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D regmap_write(data->regmap, LMP91000_REG_TIACN, reg);
> > +       if (ret)
> > +               goto relock;
> > +
> > +       ret =3D regmap_write(data->regmap, LMP91000_REG_REFCN,
> > +                          LMP91000_REG_REFCN_EXT_REF | LMP91000_REG_RE=
FCN_50_ZERO);
> > +       if (ret)
> > +               goto relock;
> > +
> > +       return regmap_write(data->regmap, LMP91000_REG_LOCK, 1);
> > +
> > +relock:
> >         regmap_write(data->regmap, LMP91000_REG_LOCK, 1);
>
> What's the point of duplicating this?
> Before label you can easily do
>
>   ret =3D 0;
>
> relock:
>   ...

Ah, okay, I see that the relock error is returned only on success of
the configuration update. Why is this inconsistency? Really, you need
to elaborate first on what the caller is suppose to do when
1) unlock failed;
2) unlock was successful, but configuration was failed;
3) unlock and configuration was successful, but relock failed.

In all of these cases the user gets an error, but it doesn't know
which stage was failed. What is the caller supposed to do?

No need to send a new patch, let's keep discussion here to understand
the code flow better.

> > -       return 0;
> > +       return ret;
> >  }


--=20
With Best Regards,
Andy Shevchenko
