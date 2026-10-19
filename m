Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2684E533B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411753; cv=none; b=HGJVjhwTfkG+0NFJikk71PNK/IVUTGBubmH8CzjWFSFkH0KXEOP6SJp1WP+wzqDQzF4Gk6YU0Ne5/S3ydVZnmcrBlmYA4+WbzgUznh+k4E3S9Fm/gdw7DhDRe/dS3nWEJf8Mi8XgxbYx9PKl8JcFfqE14deeAlsYShBTz1msm8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411753; c=relaxed/simple;
	bh=B6PGmkEOmOTvRMG4KJSxa+Qi5H7nSmTaQb5cEDlkSyE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NelKdIqjY2HlaWbrzPbM8WgeCeNzxYHgXMOEvybQncn7+4eGSHxg4HWnxlOhqPUcSlTNj9ubhsM+GUlIYRUQelZ0Rc0UPf/dxIEYGswXlczsnKQEMO/ksIYmDNkN1JjuMR1akeg9XQdfh0bDnsMeA1/xOcVLUrlhS7xCTUVYfe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aG0nZZZc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aG0nZZZc"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so11925415e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792411750; x=1793016550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LQMT+oVedzgIQTTgsSc7H1Q1yfN1sP8EFn/tjZr2lw0=;
        b=aG0nZZZcNESLfrAJZ88dTK2CwmbB/xFE0YTlAIeNI3JH6AS3EtXBYYqJoUXNa8t1OG
         bqu+9nzydFdpZsPMtljMGEz+EiPasNyyN4v/N1BANtsJK4lvHZKV2eb4ZrQlJtO9rJU8
         GFhQ3uza5XhDizUYFWGt5eBMbZ9yje0ZAu3f7wPxHJ4FAYenBwEUWiOQNhW530wuXpPm
         9VHoao8d5EYpwOz/C+HiFlDbKhBOIPo6n/Yx9QGMntzEML64Ymn21T7jNEtcniUGz1It
         yEDNJaxe/uHBodggLQvTtIQYBEd9Rn52jeFLPKO+zG5qLQ9G1LurnbC/hq/sJpE7pCVW
         Vodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411750; x=1793016550;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQMT+oVedzgIQTTgsSc7H1Q1yfN1sP8EFn/tjZr2lw0=;
        b=O/WbZ5yUmxXv6v1vDP5yOnfnw1ssMseNzfMCAGsA0Pp/a3FbxH7RdR3PWclFZgovrc
         67X0EqDB0E/fMaXlTdnTZ+Rr4Jh8JzCVUQXAgxpnUT3EuN3UGOfW6me9ccBNHlJjp0oc
         DIVekU1B3Etox4pxWLHzTIJdy8QiGkgKO/t+GA2IE73p2rHr1qH2D0CPn8lt9bXhA9az
         rKJcmVjV9QYN6jXvJUwpvnmp2TyQUmMrxV4w0teoDIqcvKUjYLfJCAFon64HsUWhUwzL
         PeFzPiNG6l7HotO+3Iw0m1i47acsQbXV6GeSsQ5EpBbd/Bfrs5HjxnjBXIF10zlGmztE
         iz6Q==
X-Forwarded-Encrypted: i=1; AKwUvByrwWmHSn0gJsUyJWGHIapmALxTmXBltcZWpwjIvh6Tcc+0m57n6J4mLd31RORIz4RdwoH0hJ6oAqxB3GY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4SfM7Sph5Bg/9eQHUTUvaWnT9247dKvaYw28E2R/V4F4Wtepp
	3u6pXmZtoP7pAbzdnp1CZdaSy3KJ7cZbMB+gTAAqXBbus9E09cB5Iur6
X-Gm-Gg: AYBFou0gttAxoh4VeJMIjubxD7zjb1u8o43+OrsWQ2mbotqR0rPycciz3kejM5WYyLa
	eIHrxUTsduYlTGkjxDqlVG30/DyKaWymUzCDQBwsnSw4xiXApla5SFjSA6IoMb/uLy/A8PsYqAy
	xtZTp8AONwOFkTtfbnpHQAHP+XipVXOHtu8GacJ82xgLg1ruRwrqz0cANxifJk9+gaCI31g5gRA
	b0ANDQScQyGUntSi2FGVYU6BUJkR5O0D9US93ixm2ft19/+kpxvN+sxR+H+liQTBef1ZCoqw2kV
	Jo0XcvitsR4GhWX1tgU7xHZBO3dT9Z/J2FosCsoQkAKQiuOIV8XMln7fTJ6TCRpLud5ZyrItDc6
	wzk62PrAjgkHaRDrGOWdFWPpQ6Vyeq3fWrCP2aKU50Ko8zy7PcwPSyso35bFkWR32PvwOs+2MI9
	exWFZHZ+XQ2XyTahvnQyETjDFS0J8G9OQwwUYYEfkG+RERWnSMD/TBf5AgAIpJq+Vnl3dx4rx1H
	OzwXKYOPUJ7WCmNZQHAQlF5DSWfXFmcjIbiRqDZ3l2eZBLioESElI/MOPbbjW5UkMPAX8wU7RiM
	QOL90Tl9IHrmQ+7AF1EtxO6beqMtSitJL7D8sbeRbOTkc431lW5IvZnn+jjVc0a22fq3bDZNMt8
	XlBEfyFvsV4qvjIY6S5Wsw5tMgz7ri3gFBJw84CXUwZYYOZcVLCJDNG8bH2rPeEYMbZ6c0GADwd
	9+PZV3
X-Received: by 2002:a05:600c:4e8a:b0:4a1:8961:78dd with SMTP id 5b1f17b1804b1-4a1d7616464mr168857525e9.27.1792411749417;
        Mon, 19 Oct 2026 05:09:09 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6245sm279022375e9.3.2026.10.19.05.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:09:09 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:09:05 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: Linus Walleij <linusw@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Dingisoul
 <dingiso.kernel@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: gyro: mpu3050: add missing trigger cleanup
 on remove()
Message-ID: <20261019140905.00000094@gmail.com>
In-Reply-To: <atX1alPtnByIsGFr@nsa>
References: <20261017-mpu3050-fix-v3-0-d6f29f335a2b@gmail.com>
	<20261017-mpu3050-fix-v3-2-d6f29f335a2b@gmail.com>
	<atX1alPtnByIsGFr@nsa>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Oct 2026 11:54:41 +0100
Nuno S=E1 <nuno.sa@analog.com> wrote:

> On Sat, Oct 17, 2026 at 07:19:21AM +0200, Joshua Crofts wrote:
> > The mpu3050_trigger_probe() registers a trigger but
> > mpu3050_common_remove() and error paths in mpu3050_common_probe() forget
> > to clean it up, causing a use-after-free bug.
> >=20
> > Add the missing calls to the iio_trigger_unregister() function.
> >=20
> > Reported-by: Dingisoul <dingiso.kernel@gmail.com>
> > Closes: https://lore.kernel.org/all/20261010203601.1686148-1-dingiso.ke=
rnel@gmail.com/
> > Fixes: 3904b28efb2c ("iio: gyro: Add driver for the MPU-3050 gyroscope")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> > ---
> >  drivers/iio/gyro/mpu3050-core.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/iio/gyro/mpu3050-core.c b/drivers/iio/gyro/mpu3050=
-core.c
> > index 879caf3b729c..9e747836df3e 100644
> > --- a/drivers/iio/gyro/mpu3050-core.c
> > +++ b/drivers/iio/gyro/mpu3050-core.c
> > @@ -1262,7 +1262,9 @@ int mpu3050_common_probe(struct device *dev,
> >  	pm_runtime_get_sync(dev);
> >  	pm_runtime_put_noidle(dev);
> >  	pm_runtime_disable(dev);
> > -	if (irq)
> > +	if (mpu3050->trig)
> > +		iio_trigger_unregister(mpu3050->trig); =20
>=20
> Yeah, I think sashiko is right... I think we can just reuse the if
> (mpu3050->irq) condition for unregistering  but then this patch depends
> on the previous one. And such dependencies can be set for stable so
> don't think it's an issue.
>=20
> I already pointed it out and Jonathan seems to have said the same. If
> you do have the time, converting the whole thing to devm would be nice=20
> - could be patch 3 :)

Bad time to be lazy :P I'll have a look.

--=20
Kind regards,
Joshua Crofts
