Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254653C061D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309241; cv=pass; b=S+smWljHSRT8CU45+wB1Uw85Lx2DAvMv98yGepNHEK8FaXDTZ8Ju20PoHT+o7ka/k6R/JdulsmPi0n2PnJekafyaWQ5iMVnuLBokIY4UVImPqVjGLjbOVaBXdBO1VurgVuloHrueJUbmKIe6Mg/XZnt0LhSkYlJRJzbB4fAnLzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309241; c=relaxed/simple;
	bh=OC3+EmPLTEor5PVw47zL3BXkFlIvHh3rzC0GTriEJqY=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/jmWi4p+8igW2WXiUynH9l3/O41P4dT4oUyVUNQknATmnt/qu/vqOvx21f3ySa8j1e2gJKBtXzQKq0xk9MLUqR+a6jMM0elStGcYNFGRZLgDfIxndRMf0riKuo+v39qAYLKRrIeFeqZjKl7gF8jKGCvxhzTBzQaMEcThz9GRy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spjKT3QD; arc=pass smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spjKT3QD"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5e9528732b4so1054628e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792309238; cv=none;
        d=google.com; s=arc-20260327;
        b=iFUC9BcUhP8PRQWgCKihY6WCHfevzIsAat9TnLnL/xol1c/2YzJCbmkmbD/KObX6Oz
         2Wwoj4E1EF7rg0U+QvpIDp9kLuWHYNa/QrDN+Ow8TKGmebp3iRJaOy67Fcxgj4kpZ1KE
         3/6xt991RsPvmIdxrOHyzpElNKfllVX9UpMl6gMn1FR6YYzJhisdnI7OOyy4C93g/ZKx
         ANrYiFDWYDybTs9aoy4fxa2ElYOz+LFvy9j7huneElca929rWlbYp+cimlsVHw6G30Xk
         fDhG31f9QvTS+Z+UQONaAiXc30ppLiJshiALs8nNt1eJZxfA230h9BeKkj2Odo/2LU14
         qjvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=W3zkFDAliGrfZVNHab7+yemqgQKzuzRr7Soqpwrq/Ts=;
        fh=4Ucef4/x8rmerb5sDP8SvnXpRNVupoW3RsxvLS9JwK4=;
        b=rFfXtpjc3Mv4j1eNLgfH2HhOJblbjc7tV6jA1hItRUt/0gu+ikmW1bg1/B0q/eB875
         DMS6msm3/wJfTWWzuJGjDPLFw+MQKYx8AvuC9aHc1QvcRidiWvF9ZfaOAHZ2rmLX718f
         hNH0nNryXwhKPucO3PE04y8VkeT/4kDwFaBAH9Gu5278D0KMGrZD0zI9QeznWVPWWpCx
         Fp+gwmW+2fUtLxSJqvjpzTGmMnHgsR/LYyx4VY71vPp4KBBMadgKngJX1jcyCbYrQh8Z
         l1dzY/TDx8Ze8KqyV2zpEdsjIcQhGq7d/8gjzQQ+pNTFuA7QgzaTyRq6LRBWdfs2x6Ba
         dM/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792309238; x=1792914038; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3zkFDAliGrfZVNHab7+yemqgQKzuzRr7Soqpwrq/Ts=;
        b=spjKT3QDeLFQmJbNoxjfqU01v4f3kc7Z3W8U5aIdkhjyUUC05Mxzi15EGgIr7R+8m+
         SVBFKAMbDu7Muh4bDr6KES9fJykZ8t6SI0FjpkBSk49+2ugBmw5frwWfxNoBMDM5MPt9
         4+lliaTPEy97DWodukof/20S3JpHf3cXPYDtx72SsGyn4spZ0D93j5iqcjgF6pjJIa6W
         hCQ6aXACoJntDU0JZ+CYFhne/VAwiZQx9EILE3WuTKZPCaU+9cSxawRBB2avQi9ZEZAs
         CHJVpCpzB2/ssZgZ3iaR3PT7yBoGfwuMyNyv5BQHxgChGffgMYFm5zyxygZnHT5as7SE
         UcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792309238; x=1792914038;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3zkFDAliGrfZVNHab7+yemqgQKzuzRr7Soqpwrq/Ts=;
        b=fuaYIAxmjMVUSghD0nSDCFycTPsptn7e2OWrjkil2mOcR/MLqajYqDbc+OXZPcn6Pn
         cbcj0ihfA7s7soJCz31mHu5BO3BvppkSRpwHeoHCDJzr1lOxa9FRh0hlasYdv+fPfjqw
         rYcnDJpXZg5J3O50b2wAJXU+RQdCGOuOoXqKMTrJLjcMzsn0CROtAhaCd+Mfb1DfTthX
         3uf0BJv52AcHHRSgUe4cAVCtFWx32N0kDltpJvM3ff57mqJqM2/lxcUDyWmQkLNNRczr
         TB3HWobbgI+HHY8FpcZWRtJ7Wl5fi9S3+tD4XYX+a7hM3ubSWVNDi1kygmjog/ukWowm
         KnCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNGSN28QQ5YuH8mbL7tpoOupNcFxMxTwjIih9UkmwHfAhiBinMWCY3hc+I8Kjo5utahRkXwNiyswfplXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ75aWVZZIdbpcLelcDLFG+bcJhUi04DQuklRE98OYWnM6s3cGw
	f/eI+SoftrCHgWShSHZuFPiHTjrTyE35IbN06kDDxJYB2RINvx3OhYOi05GK8cBghD5DlCfR/+k
	FX5H7x9IJmgJDUYDQLDWrdLFG+Img88E=
X-Gm-Gg: AYBFou3u/hE1H6hfwDO5WiFz4Wpe4BHTcjG8YHFParHfsY2PIQ3x6TK2buVyDCtVk59
	lvxQGSheIqYl0KXvaYdfFptE0Rk5c29hNs/BAzhwQyNMaaSen1zBGqmXpubFmAEY+n+vyyQUlbj
	7LN//0iUkcaIuOtQkmOqpVFYjr9HypL6Vzl+K8c2YFIqZVQtpGU0MgJdvzDA2gkw6KOzkKQL7Oa
	Om3RrQlEKUg6iJNjTDFptZNGlkD4frsOOoWujGd4u37sfOzSutKCRT/UsncY7R8YyVpZzmq9fM2
	AclNpW4jYMEU9cJx5NIizgWPoiouQkWQAapItWMuQWoiZXYfVA49qPiV
X-Received: by 2002:a05:6102:1625:b0:7af:fef2:8ecf with SMTP id
 ada2fe7eead31-7cc3691cf50mr1706262137.8.1792309237980; Sun, 18 Oct 2026
 00:40:37 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 18 Oct 2026 00:40:37 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 18 Oct 2026 00:40:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Wenqiang Zhao <berringtoni36@gmail.com>
In-Reply-To: <20261017195037.5501e184@jic23-hlaptop>
References: <CAF2O-sN=PM1MUaWzv2r3zT0TozZZje+0eYPiJLQV_LHB3-Qj6g@mail.gmail.com>
 <20261017195037.5501e184@jic23-hlaptop>
Date: Sun, 18 Oct 2026 00:40:37 -0700
X-Gm-Features: AclHuK8JKWALdvzAXKzaA9KhVvONm7cTVLuGr-8oL3l9JjZbRIhf609lS0VNoFI
Message-ID: <CAF2O-sMFDgcgGFTPvga_iwkyqTX8bHUmsTp9rS8Xc9_5c3zFvQ@mail.gmail.com>
Subject: Re: [PATCH v2] iio: accel: adxl345: update period cache after
 successful write
To: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, linux@analog.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If that isn't easy to fix, look at using b4 and the
> web gateway that can use.

Thanks for flagging this, Jonathan. The sent-folder checks did not
catch the corruption seen on receipt. I will switch to b4 and the web
submission endpoint, and resend the unchanged period-cache patch once
that setup is verified.

Thanks,
Wenqiang


On Sat, 17 Oct 2026 19:50:37 +0100, Jonathan Cameron <jic23@kernel.org> wrote:
> On Sat, 17 Oct 2026 04:48:25 -0500
> Wenqiang Zhao <berringtoni36@gmail.com> wrote:
>
> > The ADXL345 event-period read path returns st->inact_time_ms. The setters
> > for inactivity, free-fall and the ODR-derived default currently update
> > this cache before writing TIME_INACT or TIME_FF. If the regmap write
> > fails, the sysfs write reports an error but a subsequent read returns
> > the requested period even though it was not programmed.
> >
> > Update the cached period only after the corresponding regmap write
> > succeeds.
> >
> > Fixes: 8a1536cc4a1c ("iio: accel: adxl345: add inactivity feature")
> > Fixes: f6f22950d925 ("iio: accel: adxl345: extend inactivity time for
> > less than 1s")
> > Assisted-by: LLM
> > Signed-off-by: Wenqiang Zhao <berringtoni36@gmail.com>
> > ---
> > v2:
> > - Keep Fixes: tags on a single line (Nuno)
>
> Sadly I think your email client or server is fighting back. I'm still
> seeing the split one. If that isn't easy to fix, look at using b4 and the
> web gateway that can use.  Avoids any opportunity for email corruption.
>
> > - Use a Latin-script name in From: and Signed-off-by: (Nuno)
> > - Drop the long validation notes; build-tested only, not tested on hardware
> >
> > The missing serialization between concurrent sysfs callers that Nuno
> > pointed out is a separate issue and will be addressed in a follow-up
> > patch.
> >
> >  drivers/iio/accel/adxl345_core.c | 27 ++++++++++++++++++++++-----
> >  1 file changed, 22 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_core.c
> > index 6c9080d..cd58304 100644
> > --- a/drivers/iio/accel/adxl345_core.c
> > +++ b/drivers/iio/accel/adxl345_core.c
> > @@ -391,30 +391,47 @@ static int adxl345_set_default_time(struct
> > adxl345_state *st)
> >  	odr = FIELD_GET(ADXL345_BW_RATE_MSK, regval);
> >  	val = clamp(max_boundary - adxl345_odr_tbl[odr][0],
> >  		    min_boundary, max_boundary);
> > -	st->inact_time_ms = MILLI * val;
> >
> >  	/* Inactivity time in s */
> > -	return regmap_write(st->regmap, ADXL345_REG_TIME_INACT, val);
> > +	ret = regmap_write(st->regmap, ADXL345_REG_TIME_INACT, val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	st->inact_time_ms = MILLI * val;
> > +
> > +	return 0;
> >  }
> >
> >  static int adxl345_set_inactivity_time(struct adxl345_state *st, u32 val_int)
> >  {
> > +	int ret;
> > +
> > +	ret = regmap_write(st->regmap, ADXL345_REG_TIME_INACT, val_int);
> > +	if (ret)
> > +		return ret;
> > +
> >  	st->inact_time_ms = MILLI * val_int;
> >
> > -	return regmap_write(st->regmap, ADXL345_REG_TIME_INACT, val_int);
> > +	return 0;
> >  }
> >
> >  static int adxl345_set_freefall_time(struct adxl345_state *st, u32 val_fract)
> >  {
> > +	int ret;
> > +
> >  	/*
> >  	 * Datasheet max. value is 255 * 5000 us = 1.275000 seconds.
> >  	 *
> >  	 * Recommended values between 100ms and 350ms (0x14 to 0x46)
> >  	 */
> > +	ret = regmap_write(st->regmap, ADXL345_REG_TIME_FF,
> > +			   DIV_ROUND_CLOSEST(val_fract, 5));
> > +	if (ret)
> > +		return ret;
> > +
> >  	st->inact_time_ms = DIV_ROUND_UP(val_fract, MILLI);
> >
> > -	return regmap_write(st->regmap, ADXL345_REG_TIME_FF,
> > -			    DIV_ROUND_CLOSEST(val_fract, 5));
> > +	return 0;
> >  }
> >
> >  /**
> >
> > base-commit: 9ee8306121495d2a25aa5d1bfd519f2748786b83
