Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9CD4B7A24
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003776; cv=pass; b=BsdsjqFMQ+1bfw54UkjN00alpw5tosQHd7QTE2oZh+ogiAiWTGJGYLrKSFPVasgRGSS4m+9gXxYte0JwUBm3ioZvq/VutzoTWAVAYG+P0Aev5Q3qxoZUC9lnxGlRk+ejpdv61IGFsAUQxsFAPD/kFJnvk6N7fGKBtrRL8b8ewXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003776; c=relaxed/simple;
	bh=XHPO43iPwGf/8rDqm86qoTqT4DK9heTLxM81CKZvxYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKn0fBQKYDiBO3orMSqsuHD0n6glfY5Kslk+nAJ/PY8Mxd5JJOHnWt4hjcCYLfHZjiJBVao+QlvDNyVCnfToMNMcY04XIpXSD3yhmrwq+mmRec5AJ4ie/ph4AZrSPwqZLUzEbN8sNNkQYxM1CBCjYZs3ci7QIFP52ksOUjUh7R8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=MlAuWMAw; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="MlAuWMAw"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso5332469a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790003772; cv=none;
        d=google.com; s=arc-20260327;
        b=HT6NE64xTE44BzLk+dyWc05GUMXaXvBoSWHfKmwAhyu92W5kj3D4S8ozmzv6lEagnb
         modiVJnzzGVlx8xbtzCMye1CR0VV6n2WMfpl4TA6fB00coiX/2UD0NixTdEyj9tpQ6hT
         Cqh7VA/nAw7dxWQZKoizcZUGl2BINEUu8UAthVkdcjw2WWBAgbftmckQjQxGMduyBfZ9
         42HDNcCbvQSyzd/j9kWvPDkIIRlqYov7bTlxY/jWXA7PRpkDJ3Hf4Fq/ymEkfhanBISs
         hodX92FUi7ouHlN/we5NbWCholusbOfUelauviW5+42r8ZnurQCMoZUHks4WNaBnVVxd
         Jgxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HX8wdI5S2tl2VsV0b3cC7CFvQKR8NtMSXQBbxVkBhOM=;
        fh=/mpZIZAD6hyDdVCWw1/plMnYVqAOxEI/LEwaOihISSs=;
        b=m6jzMDvFc5+wiIG3CNNehzKiSrmL3Yg6GZOEcIRF67TExgkqMUdJI8XD3E802cFvgV
         J1TyF43f62BipEm14gCwm8n1Q73UtSV6HNzNVXaZ2LiWXTRDNK4Ys8Htt/OJ1JYEmPJc
         FLDU7Q2HyuGs7k4f3nToxfHQR8hNWshw/RadHvIVzBSFuIOOjH9BOWgk5D/P7vsSX6O7
         tNt/UtCFbhgenCKNaNMi88UsgxJOoiFT8v519+Apk6xXCHejpZczwQrGynw28UHfBkYs
         7ry/e1WN6DubTi9xUiCXR9WrQOAFWdoD6mDnZAVfHZfBCM2R8cbJAGdFW8XOcmlVFtAC
         DGzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1790003772; x=1790608572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HX8wdI5S2tl2VsV0b3cC7CFvQKR8NtMSXQBbxVkBhOM=;
        b=MlAuWMAwbjpYzJtw6TBu52HvGXYbcslY8xaCfxUrYPzU9bDyOjDbHfqEDIRVacsDeM
         /tFHlhXgsaAHLTTlwW7qwpnV+mXH0JoJFS11M4+u1Qk6N+/T2VW4aNM1Q/Zt5E75Vs76
         lEaufwQgwsnvCEJtKfNGrtVb6H2pOmFnQP8V9g497VHGXsdCBlOnWgUlka1Yuoz0/j4t
         iSINgCEg3C2FvVOlvEyHlNYjkyszX75D0C4LdyZrBfZDK8rIZKwFfeBTZ8vKTa6Ejg9A
         1RF+io1ZIWhI764yfnveupU0Gn+H5XYZF1GKyHO74vOyfszv4mHxOKzmaycIchooOZ1i
         08GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003772; x=1790608572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HX8wdI5S2tl2VsV0b3cC7CFvQKR8NtMSXQBbxVkBhOM=;
        b=bfnuscYTkJLF182LpfmCIeZFpAWrh5W6JN6sCOm296k5ufUPGs8+nSnTWlyZf5ABzT
         P0SIeJb8jC2p+yFkG1BM6EujYCfSCptQYG3BfReoSBLGa+MJtLc/ViYH3cYxynfI75/e
         Gkk51acy9hVfxBDkr5CxQTJc/9ftLpUP+bg9dVq/85jbtV7BQadW3CVP6/9Vozm/fCSe
         NbtZ56b48cB3PiFluU55Gpsib/PkwPcXfYV/SR4B0fWkTKBKCk5HlpemnN4lxWsSesJp
         UlV3hR2n89EHHdD5l0KdfCHOzJunva8uoUnwP6gUbHP40PL5z/8Se7ZNSuDAEGBNsPs1
         XEJA==
X-Forwarded-Encrypted: i=1; AKwUvByrKotQp7J17abr+S30SvBPRhBAD9mUhI9Z99zETU0E/TSEk9HV8P7Bpr7uVboNE9+jD3dxA8Pa9N6Qpz0=@vger.kernel.org
X-Gm-Message-State: AFuF++lxydbfNP+3XD23cTQn2xwsyoWqDFP/PgTLtaC86nF22UaipXip
	tTfAAcAckGZ5vO8q4TiXOTE4kd3V7tMgyZAMzZsoAL/ojir494BWLThePHVMrIx+UgH8ZI8Imvd
	dfztqeJJkqRXdbZDsFbWZ/7KvNdQUSg6HNqZTOqRB
X-Gm-Gg: AYBFou0yJQSvsbSs06mD8v1M5K59KPbLlCrhCaSY0aHc1Ky1nxmWAg/IZ4pxM0YoRQm
	k60phhE5d5IFhTeocl58y+NV3OIlIoWwcvBw/807S9xXFRrA/6e3RsmJ+xgu3J57u1ucKGKNWH8
	KSdindECJklr9evizCwekUAvbbFIzzu3YjMR0xv3gbmUGaJBEOhNswiGpYhEQ1NqaPDM1+9dx/g
	OLkRJ7Yr/MnPWFcNbJ0BVqSnbtawE1zwMzx5h5OljkXmszkQYL+b5Z7A+X1GA7LxoJ6pPiBEiE5
	r7R4MXww0QXx30LfvPY00iPvxsArvv5vq7BdAJsYjahqxtJcz+X8Ww==
X-Received: by 2002:a05:6402:4382:b0:6a9:6944:57f2 with SMTP id
 4fb4d7f45d1cf-6aa564ce3c7mr7698906a12.10.1790003772167; Mon, 21 Sep 2026
 08:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919171100.90430-1-kmehltretter@gmail.com> <20260919171100.90430-2-kmehltretter@gmail.com>
In-Reply-To: <20260919171100.90430-2-kmehltretter@gmail.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 21 Sep 2026 11:15:59 -0400
X-Gm-Features: AcwNN1XBrxH6m24bVAE90lwMgAyLcIq43xhby1tZife3cbQ2oW2ZxE_IChsMK9A
Message-ID: <CADL8D3bOOK0ER+rk3kGLaRKH0LBpTYj64SX57OCzZo4WeTZCHg@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: tps65219: Fix GPIO input value reads
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jerome Neanne <jneanne@baylibre.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Shree Ramamoorthy <s-ramamoorthy@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 1:11=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> TPS65219_MFP_GPIO_STATUS_MASK is already BIT(4). Passing it to BIT()
> again tests bit 16, which cannot be set in the 8-bit MFP_CTRL register,
> so GPIO0 is always reported low when configured as an input.
>
> Test the register value with the mask directly.
>
> Fixes: 57e30e00bd5b ("gpio: tps65219: add GPIO support for TPS65219 PMIC"=
)
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Testing:
>
>   - A temporary KUnit test instantiated the driver with a RAM-backed
>     regmap under x86_64 QEMU 10.2.1.  The TPS65219 input-high test
>     failed on the base commit and passes with this series.
>   - This has not been tested on real hardware; testing on affected
>     hardware is welcome.
>
>  drivers/gpio/gpio-tps65219.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
> index 457fd8a589e89..b25c6f7277680 100644
> --- a/drivers/gpio/gpio-tps65219.c
> +++ b/drivers/gpio/gpio-tps65219.c
> @@ -79,7 +79,7 @@ static int tps65219_gpio_get(struct gpio_chip *gc, unsi=
gned int offset)
>         if (ret)
>                 return ret;
>
> -       ret =3D !!(val & BIT(TPS65219_MFP_GPIO_STATUS_MASK));
> +       ret =3D !!(val & TPS65219_MFP_GPIO_STATUS_MASK);
>         dev_warn(dev, "GPIO%d =3D %d, MULTI_DEVICE_ENABLE, not a standard=
 GPIO\n", offset, ret);
>
>         /*
> --
> 2.53.0

Makes sense to me, our hardware has this pin connected as an input so
I must not have tested this case.
Reviewed-by: Jonathan Cormier <jcormier@criticallink.com>


--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211
