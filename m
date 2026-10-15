Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F114C33D2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792095510; cv=none; b=r9Xyo8MKcFcMFAowqeRvbtzx/lXeCfQ5DlSUQy7dHq/mVB6Y/EPPszVLZKQfYlfUyJLXvRGrv7rTnPNMBsm06ke19iG9iT7rlyNo7nwcNVV+/9M9Hy3gHlvMFT9EbgvJMM8we4fNiYuTE4Q8vgY2c4W5UtycCFTjl/3DK2lmDW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792095510; c=relaxed/simple;
	bh=jrnECgNo7r0SpTQ7QJjUmrWEuJOPvNiFAXIlOfU9hrY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QIDywhPfy1dA2aawwSNOrJYjmyxwwkxV1Egr4u2KfR3DcfZG3ZJluGaRNz3rUz6+fGz5AwSkLrtDM10lFzlWgal4oUkRO7vMtMEDz1FuqB1czVRVwgw+g7RrX2p30e4o5wMVNGUrRcdIIfQlmewZahR0afXMwX2g0EVGJksRd3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgv7fokC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgv7fokC"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so50916025e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792095507; x=1792700307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vQXuJ4chOqvfAgFEMLoAZXCDN0M97boWDwL0KicWGeY=;
        b=hgv7fokCP8byTSMm8RTIcRQEklTOndaeMv3f1zj7PC83ewt2Ldz538gCFUmYVXAmNs
         ns6tzccZFEK4BTw0WWx6zGZyY/yHOnK92Dd6Rfup6dcF+lrk6gPmjAcg4tJJBSjPALOe
         aus114ACbjJmMWHr+GAuaaooWD8q+ugSue4cfaz7UjFqrQhJgsxogTQa1JV2h2h870Td
         3+weRcaLcgjV1u/FUswo6AjFU54HgGUtaM0I2da76AbzHW5QbjhSj9PsVmeHVH2fhOao
         uoDOMDRk8iH18ij5TwayNHDKZjPk8jbTfAErTwPZgiXi8yRqXHA70+2WX5JiuAhADYun
         0HZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792095507; x=1792700307;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQXuJ4chOqvfAgFEMLoAZXCDN0M97boWDwL0KicWGeY=;
        b=SS80i9KhRltMJkwXiQDvSTtCbXrBzzbWaLfEyZN/0jJSoicvUx/sLlM5M2yYed0O2r
         BDCTK1lNDFYhjgXLGI2UWiMYK/48NGLcXORBC70YTVPEM/ESJVI/Q/vDdd/e8CuSvhJ0
         kaMJb882REN8MX6KdEZYiYwdvv9h1VKWjWE2OeYkaB+Rm7DhpXx55nYopZgk7WJd3POz
         M4m9U4ff7LKTz48C2emLpfkol479NaATwtmKQWvPFmwDcTqpPIxpx5vYVXoA0tL288dp
         zGR7gCH7Fl/8L0jLL2bwNBMtXH30eAMh4EodHgGZc/knz1YhFFZVOuGZyJjXr+OoURIe
         IHAw==
X-Forwarded-Encrypted: i=1; AKwUvBzV7cHDl2sNlRBee8L7/scxizsOSui8fh1FIEwymWRo+ewnjkCJXbNknSuuDuIuyRxe4jQyI+ESNoIiDVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoJFeIlTu/jVrAUpFEHweyuDin2jx0hj3avccDfyrljg5u9zKO
	fBP1rCyDmomK6szy56mPoBYEfinHgWeIzJhizkTlq5lwSJsCmMg2FrWP
X-Gm-Gg: AYBFou3JBPPN9EJ+8TD4umRJc3WSsdne0kc3rxl3TyaWc8ZVzCB448FtKNA/Y2fjDzC
	EXN2/eP0vdizMd4wBl6zDGKXqwKQ7X9+sM30lvifN4WeJvp5Yx3id1p3fhN9VqBfx+gcY4Vzs5g
	B4xbDl2weNNWdQXZuEXZitD3fxq3TJ57aqJA81S6g3/0kh3+Hhvi4Mz7QA9nvOWV0HBB5bpeuvS
	BntJHZ0mqCk6Cb7qsczr3Tu7Dx/2Y5YXgzkdza0G3zVPFurRJ3ITcj8vfwy7/7QhcDU7uP0TAfQ
	bWBBAQ9VgEVJfZNlnSnDdJTUM2iK2oKuBifuPJbpQK+xWxWGtaHutGD98gEIgY86sK2EtUKO/6I
	c1ljOcSO5AjR0xWiuiEUHMR1CL+WJbHBh64Yv5teThM33UcMRCVS4no732pp/DtYM4qNbwnp/TO
	CQLYV0+VHm78Ld4yOsq95OoN1C0PvsCeB9e7F6jX2FA1YSiIespWb4rEF8tFmf2qSFSDnSiLrJn
	WBeF/Ohglpcb7A31hhtSk832Uv2xAcNvxHmBzi/q9f6dw2tAESXO+YIkZJ+ds+rKm5sBkL4f5pL
	GyfF7yXbng7q9TegPJZ2hEUIgqRswcGwuWv+1ajxwlGWvyIqyoqHJ0hkKNJUnsj+Dy0VR9anqTM
	3FqCV+utGr9UG8qx06AtJyW5amw5Z9Gg=
X-Received: by 2002:a05:600c:4fcb:b0:4a0:1fe2:d4f1 with SMTP id 5b1f17b1804b1-4a18e4d1686mr398035745e9.28.1792095507004;
        Thu, 15 Oct 2026 13:18:27 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ab8bb2sm2616625e9.1.2026.10.15.13.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:18:26 -0700 (PDT)
Date: Thu, 15 Oct 2026 22:18:18 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Dingisoul <dingiso.kernel@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] iio: gyro: mpu3050: add missing trigger cleanup on
 remove
Message-ID: <20261015221818.09527ff6@systembl0wer>
In-Reply-To: <20261015-mpu3050-fix-v2-1-53f73581e62c@gmail.com>
References: <20261015-mpu3050-fix-v2-1-53f73581e62c@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 21:58:35 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> The mpu3050_trigger_probe() function registers a trigger but
> mpu3050_common_remove() and error paths in mpu3050_common_probe() forget
> to clean it up, causing a use-after-free bug.
> 
> Add the missing iio_trigger_unregister() function. Additionally, change
> the mpu3050_trigger_probe() function to assign trig only after it is
> registered successfully to prevent a null pointer dereference using a
> local struct iio_trigger.
> 
> Reported-by: Dingisoul <dingiso.kernel@gmail.com>
> Closes: https://lore.kernel.org/all/20261010203601.1686148-1-dingiso.kernel@gmail.com/
> Fixes: 3904b28efb2c ("iio: gyro: Add driver for the MPU-3050 gyroscope")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---

Dingisoul, any chance you can test this?

Q to others: better to leave the driver running in this weird
polling mode as it is now or return on trigger register failure
as Nuno suggests?

Thanks.

-- 
Kind regards,
Joshua Crofts
