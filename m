Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BB53EA968
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790874254; cv=pass; b=XYK5Gn0xHkvnfG074XNbuZ85sgQ7+gNgvEnZLCMlSSd0HTQe5jUTTClOlziwfD5lXliRFTzbXXfIUcaMwlBZEbfYbQFmuKiU0jZ1n+ROJeLi9VRRzKj+ZrDo9JdtjPGNl9FlFxuE1FtSCBbieKxpdlQyaR0MlRC47ecbFFO24aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790874254; c=relaxed/simple;
	bh=byLBT7HDFqr69hS5GMj7sfJ5ssvj5rFdRAKLw+o47Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSqUF8vthwXnetFQ3kG3csMNV+ESwvQP72DzfB5DnMhwkDMnUzf+7rqlxNvfNyt5Y//v+yuvHb6VQGlwpXN02RHeZLVwOWk5WpmiFEitGJMh6q7QKAVa2hUOxjPlp0D36aZ8ubLnP2QC4DF3p6FC4CwzaPA4hxl81J1cF4SI6lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=GTSMN0Dx; arc=pass smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GTSMN0Dx"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e667873c38so2700165b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:04:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790874237; cv=none;
        d=google.com; s=arc-20260327;
        b=pdbsQmukIFaFVEI6Ag8a6CpPZ8kowtOVK5UWVqxlEUozfqKr7LKAMX3uQaIhLgkTEF
         gcF0gtSk+3hFvIJxyeWvliM+PP69b4Bkvzg08RSGHf+FM00wvkqf+zQlBHGo2pjq+O9m
         7LfqsuO+UBuUbQCeGT0/JVIHns6ac+dNGdDAL8hcPNjRWYMY1oTQj9MhrGKiy36W2d4q
         omBwIFYQqE+FYhG9Of0Z7IXV8vz8JJG69JDAySyubRBBUiGPINSaWhlCpdpozc/AQD4o
         ODcnFj5qPzScDcnpgyBlXEm0QUTI3e/xVbHEQgmq7pMZm2wB+w/sM5CjQ6ZNB+J76JQO
         fy7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WKwlZwjH4KajUILUoFDyW1MJ1Fouv/7qeX0q4t9PILM=;
        fh=QO0OxpTJjHT/78nACHcIkCW9Fnkc9f9GG1z9ZZO/uTE=;
        b=hy/wq9p+cN3KGOcOsQEWfLEgIQcpLnbUe5QIuAW2SdHM/8QE8kDEnX7wLuWgrbT7sf
         C/1tdo1PWtro/1KYylMgiKehpGQQOaC5okv7P8O5m8FGgydhYdBmcXdGLNdATAuLSD7S
         GRtMUeln9BZ36eWYJxnn52zd65oOpNlNWAlydgYYoT9SmfnzQMC9pWLPCYEVKYdrV+ZA
         l5GlEsbEZSZVA3+K7d+PZ9XkhDGy9KwyfY4dwzsjYrx9WLjtvQbEvrFOYXRJgM/s+2i5
         Bt0sb62KIHX0OIebw+TxfvYjzNsmjhIH1J5zh/z+ipGCm8ovIB+os3KO5U5Mm/8fZd2+
         Nm7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790874237; x=1791479037; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKwlZwjH4KajUILUoFDyW1MJ1Fouv/7qeX0q4t9PILM=;
        b=GTSMN0Dx4OncnqOS3he8BCTk9mEx5zN+bxfVgtfAmpmprNrbhPnrTMS6vUpiLOfHSP
         n5pHKiQFC5v4328MbdBYsmUIBKSzr/STkwLbtJB9e6GYLS6lGGj4UZpddw2yXBlLhuRq
         DPBG9h2PDZdLR3K+e3q9ocUZ+gGNnRBvvPfQzqd38WetlfXx3cPQebuFjB+vAE56GlHu
         TKZoLdyeJMBgTvM3dhdqQg2tbdbIHOji0lR5/c8lMU18WT0Cq8fplhk9jba5Jgagfq8Q
         Bds4XUYyugk9HGPLCNCZDpX9nv3TuHPatmBs1ncvrBdFZMElF1AaWOjn49R7otWLIYSC
         7SmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790874237; x=1791479037;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WKwlZwjH4KajUILUoFDyW1MJ1Fouv/7qeX0q4t9PILM=;
        b=tBY+j4EjXK2UBINXgzTeV6WON5hbGB5dyH2qfZqnpurRJTjPBbEaCdvURlDwAM38EL
         NibozWFEZgBpGiQ3DqlK0Ud7+7ItjjGFOg4FKMkn9Qro/99Z2ry4KG2C7KIdht/ckKSC
         9GzWBSuY4Bjg2MRdPFWIT3jsyVd0V+Y66a5XRivUER9z+UhAA3UVWtXIMFoUiNEMgMKO
         ZI+WfP1skf+i4brTxdehZUbg8zpnY63bpkWT/ewLx7dLNLjz7taPdsufIhg8Lo35ggrK
         eWpq/D85u+7XZmRjTrw/4IjtXIWiSdNvTKGc/fSf0rzip1uKgVTSvuLYpSQCoYfuTZ/R
         Hstw==
X-Forwarded-Encrypted: i=1; AKwUvByQBvkF+VeYy+BsJRAiT7g+NXY0wVOIUBPAlXuvw25iQGcOMBHzL7fBFQe9aT6JBivQMJ2B0nAkPpPYojk=@vger.kernel.org
X-Gm-Message-State: AFuF++nCc/8FwvRqNOQtpSvJfBkL5KPJsRpXCW6ndExH/GHitCp56po4
	YJNrdwGL3ObSVkc59QJ33QVPjq2nWl6GdZJ2tFHN+tBVpY46FCk+y0P2B7pUVGqAAZkdcxJ8dAY
	n4fWk6PttgLy3hydtlwklfLpzYW5f+LivKrXzAuOcd2imjjS7HYnEJNw=
X-Gm-Gg: AYBFou1rHFy9COghx1IuvF0qpQjimSmVSuBH47Zv10VwZXPmRqzG4qLOfNFGYNXQVLi
	OjjM+SFIrZWELntM9wyhAsBE2XFl4aCGOJQ6ftXWYMrP14P2aKu3zmmHpUn2huS8VoQ0kUJzF0Y
	9VX2r4EuB+Y33uDACXPIL825EBbTaR6qguTWNNU7oDPC9qcHajaJOPYTvPFApTRl2hZZnEabEpe
	cqAnMzpCtS46/Zh8sCPsV3wHPlk77jQVDIZtZ+ZF42yBMpP+NQJEmw7NtL5EqwAD+in96k4PQof
	cjXok00hgO5MvmOMa78hX+YwSk0yoCSX20ajLhN4CeeoHIA867aKDz9k8jWPXrMBsYPXdVAdqth
	DA9a5ZpJVI3g+qdg716YBl03g+ghyrnVkXp+/Abl53oISYA3PygLZsiptEyoQxwRxuZ0u/9qX
X-Received: by 2002:a05:6808:191a:b0:4f4:fac9:cb8f with SMTP id
 5614622812f47-4f4fac9ea96mr415336b6e.57.1790874236734; Thu, 01 Oct 2026
 10:03:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org> <20261001-v4l2-sensor-detect-v1-1-a45993be17b8@kernel.org>
In-Reply-To: <20261001-v4l2-sensor-detect-v1-1-a45993be17b8@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 1 Oct 2026 18:03:40 +0100
X-Gm-Features: AclHuK8fyk69sMKVWToykLdi6kR3HB27CJAYMnIp5EXpxK-M1DJf-LTrlx8MAwI
Message-ID: <CAPY8ntDXoLr3KO5sRKR=AOs603m2NWHYBZHu-ag8R+wYs+pYzQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] media: imx219: Move LP-11 state switch to power_on()
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mattijs

On Thu, 1 Oct 2026 at 13:55, Mattijs Korpershoek
<mkorpershoek@kernel.org> wrote:
>
> During probe(), we write the IMX219_MODE_STREAMING register to
> transition from streaming -> standby to force LP-11 state.
>
> This should be done at each power-up of the sensor, but is only
> done *once* for the driver lifecycle (at probe).
>
> Move the LP-11 sequence to power_on() to ensure that it's always put
> into standby mode whenever the pm framework detects it's a power up.

Actually this is an interesting one for the Renesas folks to answer as
they added this.

Yes the sensor powers up with the MIPI lanes in LP00, transitioning to
LP10, then LP11, and finally to HS when starting streaming.
On stopping streaming, the MIPI lanes remain in LP11 until the XCLR
reset line is dropped.

If their hardware wants to see LP11, then how does it keep working if
the sensor has the reset line wired up which would take it back to
LP00? What phase exactly is it that needs this, and how long does LP11
need to be held for?
Do they have power gating such that the CSI receiver block ever gets
powered off and needs to go through the loop again?

I'm not against the patch, but it'd be nice to understand what the
requirements actually are. The sensor goes through LP11 even without
this, so it's something sensitive in a state machine somewhere.

  Dave

> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---
>  drivers/media/i2c/imx219.c | 44 ++++++++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 9571f3622d2d..7978fee5f4a2 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1056,8 +1056,32 @@ static int imx219_power_on(struct device *dev)
>         usleep_range(IMX219_XCLR_MIN_DELAY_US,
>                      IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);
>
> +       /*
> +        * Sensor doesn't enter LP-11 state upon power up until and unless
> +        * streaming is started, so upon power up switch the modes to:
> +        * streaming -> standby
> +        */
> +       ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
> +                       IMX219_MODE_STREAMING, NULL);
> +       if (ret < 0)
> +               goto gpio_off;
> +
> +       usleep_range(100, 110);
> +
> +       /* put sensor back to standby mode */
> +       ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
> +                       IMX219_MODE_STANDBY, NULL);
> +       if (ret < 0)
> +               goto gpio_off;
> +
> +       usleep_range(100, 110);
> +
>         return 0;
>
> +gpio_off:
> +       gpiod_set_value_cansleep(imx219->reset_gpio, 0);
> +       clk_disable_unprepare(imx219->xclk);
> +
>  reg_off:
>         regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
>
> @@ -1240,26 +1264,6 @@ static int imx219_probe(struct i2c_client *client)
>         if (ret)
>                 goto error_power_off;
>
> -       /*
> -        * Sensor doesn't enter LP-11 state upon power up until and unless
> -        * streaming is started, so upon power up switch the modes to:
> -        * streaming -> standby
> -        */
> -       ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
> -                       IMX219_MODE_STREAMING, NULL);
> -       if (ret < 0)
> -               goto error_power_off;
> -
> -       usleep_range(100, 110);
> -
> -       /* put sensor back to standby mode */
> -       ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
> -                       IMX219_MODE_STANDBY, NULL);
> -       if (ret < 0)
> -               goto error_power_off;
> -
> -       usleep_range(100, 110);
> -
>         ret = imx219_init_controls(imx219);
>         if (ret)
>                 goto error_power_off;
>
> --
> 2.55.0
>
