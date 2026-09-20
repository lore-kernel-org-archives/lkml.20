Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295C2EC54A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912989; cv=none; b=Q5klDIhF2qN5hFdULvQBM+Ds9IYeY9EyUuxxugyyB7TuodxDmiakxXv8qZhIbl+HtwxpTm0LEq5qm1GDDvQE9LxpkBlHcvrDXkPml1Rrf5AFQtjre3QykxO2joEM47R+ieeel/B8rJV4SVNwnJ9LmsXxDMyk2oy193avvs9NCkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912989; c=relaxed/simple;
	bh=KBEWERMKVz+kidmKpZBAbGJ4UDpVNu5XhVT7ZOFCQzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pkyus8tetXJpwqJ35g0EeH3S91C91GFKJ2PJLfYBxhjpSBpO6q/DHjv6AN4PdhA/N7kGBhVP9HKuNlsDVy2brjYtnXAbXwR9hUeyAkjNpUB3+jYgKyKZ20pckgZfi/dKN8W0+rz+yrRitRT6PrdxbWPVE7mMS734TDJHrxuV63w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GON9N5Wc; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GON9N5Wc"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059faso705907e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789912980; x=1790517780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qGOBrazGO1SbR4ysdjTYnrXtGS2lZGrR+BRy6J/y9+M=;
        b=GON9N5WcvHM7eFRvs3WcRnvJgzR6x/XaxoD24qFvtw4+bYOiEcGXSBlkXWZ6NwuiIy
         ARomCfyCUniapcQOfG6OQjTUyoIwc736eKofRtrmnBWDCE8zAhW9/vLUrPFEvAJGm7IX
         99yMcPmTkZkcc7sbNHFuUWTRM1dEpg2oLpwLLskogQXo0tgdSJ0W2BHhRAzI3cEdSYiZ
         7AShXmnNAs/R/LlMUcpwzc+TJ98FuxifQn6CnyIcbrKBMil6be23WxbIalE6simVmRP/
         X59G0uMz0Qe2eUE/rlKn2NnUH1W3pf0ZB3k5NKnpblofDtq4j0LY8mDqaowwqkdFnCwq
         A9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789912980; x=1790517780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGOBrazGO1SbR4ysdjTYnrXtGS2lZGrR+BRy6J/y9+M=;
        b=Kwr/PzrJB32V3Zu/TQfqay3VLeXttpkMU2kWpV9g/rrlttuinGUW3uxfYC5LPdX18E
         BivggJMT9T5orSFN+POVLcsk+1Pa2oQO8pwX7ycAzZX8FpOFxzM38Hfz/CtUltJkOOox
         iqoDrqvuPXtNxk+7XA9RviVCNAHTklv0XUCt35YBog85dAHxWCZYSLPY7UHd/BCqxTKV
         qGP3Z5pP7i/oJqhVXvNUoo8wh/3uDwTIRUHSfkpRUSnXosdCPY5HFhcf/8ze7NsrCeoL
         3VzfYtKzbyUp/9fv7XrLTdqXMnW/cfk1K3+/q2hFPRoCRfmxTrGbZmb/JdKR7zYY9JKS
         /vdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoiTvbMLezm7SbwR697Nt2Nl+OwqClPtjh+goV96PHVPiE+cmaqFUt808qzO+qh+nlBYciTnbXzYT/Ubc=@vger.kernel.org
X-Gm-Message-State: AFuF++mSIbGdnVtayII0dlrp90tsZ5x7MUpLaeVS1nF8J0PVTnHf90hu
	lfjukvLinSETdoqu18LJ9+L48yK3TYcczHdb3sc44GnvkVAI5TYgItzh
X-Gm-Gg: AYBFou11RkIc6HgP8g7x/NUKiG3dE4h9zbjpTZvXSTeMsqWzegqrzEyAEO0v+SrlxkN
	hVJrbkPJV/SD+/nN73V4A2/z8HoC73daOZslGP8HUl1+WHhtCq5X/tJTcm5dMqoWcHQ0FPetpfI
	H0VxvoP5tt51nUumzX0nNmpdV3rbnPwS79Kvmrzrb966Z1emqQ1ySigOq3R3CZhxxgUlohEjjdk
	aYwFI/cfoXUG2pXsLlV0Wdm54B8RiXtK+yTtVSuhdRU8xeaQpM5LOyeIb9oqJwKDclnD8e5RqQH
	98yNA6H7F2Svp4YjautgNt2MjqH+IahAYy4XKTu1ER+XOf2pPgnG5RYXJd/+2QqwP61HdU0HXnG
	BRrocLuH4YOp9tmw3uIXuAVGWdPCKys9wBYy35JqHu89U+CgvnxXIx4x3ZqN5pAeYyLXmf4mYA3
	341g1BQSe1qghITqpPzdnsJAo4o/4QP6Tmx6D0kxgIVh//ws9MvrHltlPKD3YLiCFGZeAv9Bm70
	nQBd1eACRds0UU=
X-Received: by 2002:a05:6122:3291:b0:5c9:a617:580c with SMTP id 71dfb90a1353d-5c9b8b29d50mr3290274e0c.9.1789912969770;
        Sun, 20 Sep 2026 07:02:49 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9c198f790sm4743292e0c.18.2026.09.20.07.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:02:48 -0700 (PDT)
Date: Sun, 20 Sep 2026 11:03:55 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Henrik Grimler <henrik.grimler@axis.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>, kernel@axis.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] iio: imu: inv_icm42607: Add support for
 ICM-42370-P
Message-ID: <aq_nyxWauKzWQwFC@debian-BULLSEYE-live-builder-AMD64>
References: <20260917-b4-inv_icm42370p-v4-0-fd9373f123c9@axis.com>
 <20260917-b4-inv_icm42370p-v4-3-fd9373f123c9@axis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-inv_icm42370p-v4-3-fd9373f123c9@axis.com>

Hello Kanak, just a couple minor suggestions to this one.

On 09/17, Kanak Shilledar wrote:
> Add support for the Invensense ICM-42370-P MEMS MotionTracking 3-axis
> accelerometer with built-in temperature sensor. This device is almost
> identical to the existing Invensense ICM-42607-P IMU, but lacks
> gyroscope. The device supports I2C, SPI and I3C, implement only I2C
> support.

The device supports I2C, SPI and I3C, though, only I2C support is currently
being implemented.

Would sound a bit more natural.

> Provide basic support for raw sensor reads via sysfs. There is
> also a built-in temperature sensor but it can not be turned off similar
> to the ICM-42607. Return with `dev_err_probe()` when WHO_AM_I read
> fails.
> 
> Datasheet: https://www.invensense.tdk.com/en-us/products/3-axis/icm-42370-p
> Datasheet: https://www.lcsc.com/product-detail/C5129967.html
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
...
>  	/* Warn, but don't fail. */
>  	if (val != st->hw->whoami)
> @@ -630,15 +648,20 @@ int inv_icm42607_core_probe(struct regmap *regmap,
>  	pm_runtime_set_autosuspend_delay(dev, INV_ICM42607_SUSPEND_DELAY_MS);
>  	pm_runtime_use_autosuspend(dev);
>  
> -	/* Initialize IIO device for Accel */
> +	/*
> +	 * Invensense, ICM42607 and ICM42607P both have accelerometer
> +	 * and gyroscope functionality. Whereas, Invensense, ICM42370
> +	 * has only accelerometer.
> +	 */
I would specify ICM42370P (with 'P') here. Since there is ICM42607 and ICM42607P,
it wouldn't be surprising if ICM42370 (different from ICM42370P) eventually
shows up.

>  	st->indio_accel = inv_icm42607_accel_init(st);
>  	if (IS_ERR(st->indio_accel))
>  		return PTR_ERR(st->indio_accel);
>  
