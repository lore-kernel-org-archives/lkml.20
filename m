Received: from mail-ed2-f0.google.com (mail-ed2-f0.google.com [74.125.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212714B53F2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553488; cv=none; b=e0iGeCTEncAQzdiyqy9Al28678QitS5gjghQ8OkfnVA8tz/1x6GCH/qLok34q4tvNefEFFNLHkgGTsc2Me+jZkUSgZraN50AIEfD6RvaGL8WczFciHl/nncZQJvu0LpCO6toYTlmlyAM+u1qqN3od1rcBjV6styjVFU7lmUTBUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553488; c=relaxed/simple;
	bh=qcK8mVSLEgWHYfVxcypZ4shTT751evsoUA85cs2h7s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rg2L8NZPgDrZKdxGRfNrYs2w1ToJPogJZq8t9c+BGw1tioLun6EMBRedFjBjiaQTuCqr6PXfG44ARZ0tGrMnRJB9kovaY+oizIvI5s3tsAzSjnRNa6+cvwhN9eaIikBtl55fglsqop0spemCI0rRCIdc3ehCjQ/dZ5j9y/0qFDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OMMg/HBC; arc=none smtp.client-ip=74.125.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OMMg/HBC"
Received: by mail-ed2-f0.google.com with SMTP id 4fb4d7f45d1cf-6a8a84cf27eso3373413a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789553473; x=1790158273; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e622UGf8ZvPqnsgwsEF1KHHm7KMF1mCNxmUVRgHGZJI=;
        b=OMMg/HBCDVn4KsbXs69eTm2TCIR+jwgeKK7VR+V91orgJhwJHYbMr34fl5TTmRYStg
         GQOUPlnXM6v511/2RaQYK+Vsjb19lGW3hDZHG0tPhF/eSSr266NYKbPGQn6jd2j9zG91
         XEnNEUWj1G0P9xkebfqmfdkrZ3tKgOE1G8glM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553473; x=1790158273;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e622UGf8ZvPqnsgwsEF1KHHm7KMF1mCNxmUVRgHGZJI=;
        b=087IOiAntwjunocwV5mFJgA02G5hyfsC7Ni6wot2flGsokxuiqFLU5i/6Bk616uIJR
         vCS4JOMwtkwxHarWPAc6w+GOI2PrB04GnHsOd8RyyMJHJC2ddyGgr5eQJU/ciLBBbaqI
         JhYbAZ4IrXO8G7YsK1K0oHaqrH2rCknTAecFaXg20wqE0Tc0FgAIRHTZiNFkHkVz/sHV
         HSfUV6aKx4u/EK1S/apHwet14uK7rEGDWUyZl2wiiSpjmt+2C8W46mLdgCrlVKxn6FLl
         NveHCNl1cZ+xnoCSLIMyCOqfj+PpYOLEngPAUMSRKrCFpX8zvjRUFHjq2X84KwhopP0E
         MrBg==
X-Forwarded-Encrypted: i=1; AKwUvByRVBoA1Aq/HKnylJpDAzOrSdpfjOkp1CUFT5Aojn8wJgZ+zt3Y1uJYHOtocopzVlUhITqFxp+e7qhRXTU=@vger.kernel.org
X-Gm-Message-State: AFuF++lNkXaSCBb+60R/7qE9g3eEuyrcNDI43KBP2rqfwAalXiwnJIGS
	whlUR8SSjmKdtsxtwBubuqA+RgpwgHWCK6StKFT4D5rdL/rHO6IYyirMUnGAaKOGYEBW8qmgmf4
	GHKOMrY1t
X-Gm-Gg: AYBFou3YG8qgBs46vftSFPOIEd7j9t+GGbg12Wym06RSjVnUBbYajoCT0GEC/xyG5gu
	SY1ffVG1K/zRb/aQBSlczC8cDVaACe3yhj3XMhZ8TD3DED6nBt5Jpk3OsUz9g1kjDUQSIdcx09+
	FcRfb+8R8UskDwVW3pYU9SemSChQ+3Yjngbks2lORZj0tnfS85NlgccGzYkSfOov+tJhDZUwFc3
	kKmjZYjSuDaoMRT02ujcJIr53+A/yPPYXJi8gyUemSzVOLcqW+IhbM/qHLWIP2ikRdVkX5MtwsI
	gTGiVQFT3621zL0YVGOF2qqDmvRzT4RxMYEw84AQxABJOanrq4QTfpduNr9qVaSIncvGsEI08py
	s4Fyah4YCLNpNdOJEfa7x1VHsnrvG7XmaW5J+1ps+LSsceULX5R+7M9peV8njfMLhj5YAVBnzVR
	ZhRDfr7k6vUXC5cYR/mUbCbRcUulUAQsxzYaatGNjmr98ebdGD10dHZJxLJSrgNruhbzm4Kiee/
	T293Y/Qm/x1ZUvp
X-Received: by 2002:a17:906:c14f:b0:c26:1648:a066 with SMTP id a640c23a62f3a-c29e5308366mr126288266b.33.1789553473036;
        Wed, 16 Sep 2026 03:11:13 -0700 (PDT)
Received: from google.com ([37.228.200.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de6933e3sm106497566b.61.2026.09.16.03.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:11:12 -0700 (PDT)
Date: Wed, 16 Sep 2026 11:11:10 +0100
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Benjamin =?iso-8859-1?Q?Cab=E9?= <kartben@gmail.com>,
	linux-i2c@vger.kernel.org
Cc: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: tiny-usb: add Zephyr Project VID/PID pair
Message-ID: <aqprPlSgpqkMmWJf@google.com>
References: <20260820213958.41276-1-kartben@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260820213958.41276-1-kartben@gmail.com>

Heya,

On Thu, Aug 20, 2026 at 11:39:46PM +0200, Benjamin Cabé wrote:
> The Zephyr Project ships an i2c-tiny-usb sample with its USB device
> stack, which turns any supported board into a USB-to-I2C bridge. The
> sample implements the same vendor request protocol as the original
> i2c-tiny-usb firmware, exposing a single vendor-specific interface
> with no endpoints, so it can be driven by this driver as-is.
> 
> Zephyr in-tree samples must use the project's own USB vendor ID
> (0x2fe3) rather than a donated or third-party one, and product ID
> 0x0013 is reserved for this sample in the project's VID/PID list.
> Without an entry here, users have to bind the device by hand through
> the driver's dynamic ID sysfs attribute.
> 
> Link: https://github.com/zephyrproject-rtos/zephyr/commit/281b5743d183
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Benjamin Cabé <kartben@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tiny-usb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
> index 73355a56aabf..113af96728dd 100644
> --- a/drivers/i2c/busses/i2c-tiny-usb.c
> +++ b/drivers/i2c/busses/i2c-tiny-usb.c
> @@ -157,11 +157,13 @@ static const struct i2c_algorithm usb_algorithm = {
>  /*
>   * Initially the usb i2c interface uses a vid/pid pair donated by
>   * Future Technology Devices International Ltd., later a pair was
> - * bought from EZPrototypes
> + * bought from EZPrototypes. The Zephyr Project reserved a pid from
> + * its own vid for the i2c-tiny-usb sample of its USB device stack.
>   */
>  static const struct usb_device_id i2c_tiny_usb_table[] = {
>  	{ USB_DEVICE(0x0403, 0xc631) },   /* FTDI */
>  	{ USB_DEVICE(0x1c40, 0x0534) },   /* EZPrototypes */
> +	{ USB_DEVICE(0x2fe3, 0x0013) },   /* Zephyr Project */
>  	{ }                               /* Terminating entry */
>  };

Thanks this makes the Zephyr side sample way easier to use.

Reviewed-by: Fabio Baltieri <fabiobaltieri@chromium.org>

Cheers,
Fabio
