Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286758;
	b=4J1c1uMzkF4ntvGtG5oAIaSQwvqhBQo3JEMTAisKyEkdeowHzLNYyCY41Ea3AmD6CRcb
	 WhpaNqGLsB9qdhDsVgaxlYEQpYxAgYV1tadSJGz6GTl3shDxCkWwvDwyo6bjUZxeV/JWL
	 hz63NqX/HPrRwWCEKOaUrkb+Yjx4V/qKyeJbWC+EB+S5L9wezpscixTvbNyZK9kFT/V3D
	 ZfZgPRzuDoxGz0bJ5Vzp6l+pgDM7LSzisvGa41bb7vUymi4XdLGYDJRGZhzycdYt5Zp/K
	 cpVv5B5kaHmyZIP8pESyVmdGoMzzUjPtHZ/+F6anA9OkuSEItVFTSYL+rb7ubQWuRgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VpLpdA+yCrDrK4tzoP5LaLfSg6uFoDAIq4N1ZuvvpEw=;
	b=DgqzcEhH3AiAq+nJQzO2vAV0Tpxu0Qghm7Vos0zix8CqxXysn3qi77k3FhcKhl1PLHAU
	 flPvrS8ZPWySdB+rkgxP4TPFoiLjme5o9lwu7h1xnyh+iSf3d779dEXccDz/TnVHlB1B0
	 mQLH8r+lMWM2ZCPy/WASuGjsHbOzCE+m9qYmYMuC3TLno+aF1O7+OX/HVEIutCGZwVH8u
	 7bRzmpXMWgzPZzRzNkIDTHWTjMGhhvBnYv3OjSQGtfB2fg7IXTdN+zNrmHMNWMyfQk2zp
	 AMLj77+/H8DduEJGujB1KWrKz81AgoeoAeipI6nL3AXQHZwqLVzBGAgeeOJm7KgI+zQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=QJ1PuZIJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0635606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0635606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=QJ1PuZIJ
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9440304604aso93918985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793286756; cv=none;
        d=google.com; s=arc-20260327;
        b=NbiunLt14oiQAJzadKpGnB2+giof5pDrfEghiTqJKSfQZLK3YoMwpIBuDjWo9tRyoL
         4Vt5cUDKt2z/rZoooZY+8BfuS3fZ06RRnjwQOqqhgX7+Hj3xjcxRJZ3XkVY16O1v+4VQ
         oKwzT6gQ6SRC1GxuuqrzKz8l3Pln1Q/tczcE5pVIV2uTNuqqUcPC0D9Dykip3ViP+ULz
         CFsOLfctc8D4m/xtYHH1JujBddtXPV9DQqv7qt+q4D9fDQHqbAqeZirfFoI5bGDZdo3I
         VQ0x/FGt4pFfBurZi8p81ox/Ggw4JG6MiM8sxR7OHpmo46Ce4y/FflX6RrOor2kvFgcX
         9vBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VpLpdA+yCrDrK4tzoP5LaLfSg6uFoDAIq4N1ZuvvpEw=;
        fh=S2189CmWPybrQVseazHT0Ggltdgrv5Syd6EXThBYsHs=;
        b=e/FxXkKzIXtXTxYmtwEejJdC//BSVXUhojIXMaRUCFX+iSg7kalj6NG2m8OBJ8W9hN
         7J526C4BpNuybh/3R4GXIZmLJGur1j8mmIwScTJEIxf+SM7S1B2h/oUDIHyMV98UUMta
         8tVBf4EJk4iL1xEkUrA4pB1QqKi1jSWZ1sroqugm81osbNUJLcjGGerYR/V/QZ+guYr2
         tyzJ1nPiYxa9lQKeCgJNyIf6UC4ACHPRhqO0atXrzhqwEzkn/2zuLAUXLIWv+z6sjW4T
         bm4F87WHmsSXC6vJxjg8mPq/x1szbMWEeuyXnMuXVXDWDn2ZdvHq/UBminETQeVofhIW
         S/wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793286756; x=1793891556; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpLpdA+yCrDrK4tzoP5LaLfSg6uFoDAIq4N1ZuvvpEw=;
        b=QJ1PuZIJLWdMBXB20D11/pW68AEffCEZP0jC5HvR/4LAIyPKqEYKmk2GV4gXi5OuWV
         nduYlh40ec0IXb8Q/+bhffsj0v6WHrymaZViiBHHP4xdGYu0zj4O6AJB83RY5cMrjqKl
         s9/dJn4APLOlerpSdceYhotqJxOtP4u2BMA5207mnIIZpqEMlkuvwunItfiyr/nD3r9A
         1lWWpiKUd8haObDhrH6LdTTpyj3Ib6IBUwk6CT2Ra31tORapyLETRFk8+PD7wH2R0waO
         RtVLFcGhW0PA647M04h8X/tpW26M3ESXdgD7gUBvYy7rROo2jU8yHgDMgsIPaOGaV4z5
         l+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286756; x=1793891556;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VpLpdA+yCrDrK4tzoP5LaLfSg6uFoDAIq4N1ZuvvpEw=;
        b=t8IkctlC1hBPcHqiES9qffu2yYZnceBJK6yLWKAu3kYe3jf+BiZ50u5E0EAM+WVcAQ
         vyLijXYH2shLP3hOmv+j0PtCThxKbWHG7FSJj4vPFA5J+t0kO4Z1bHgP53uv8riKkgYP
         UGEx2n+t3tXdYcBa7ivnAemBaW2SWhO51ON+4geGPsVr6v9lymXZ67seAwYmFMXA+bZO
         Gp+agg4l0Yt9w5Grfy9ZzkIGrvQKwlRSjMnao3y2rJYRixYJK1FM9qJW3HasDU5z+Vx4
         QajKTI/ASBC/GasOOhh14/jW8CaYTBuFFye+SSAouQtHpO6Zs6VIcZ4z0Ld+dzCX2srS
         COjA==
X-Forwarded-Encrypted: i=1; AKwUvBzIRkhmc58kMIfqdrauVsAsgdcS00Gr23rGC37M493hOFrS+QN8HTe0YXDKqhFK5kC0ySLiwTi0s+04YLE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu2OpdR5yV7dl8IN8G/ZKUcrBN5xYWSoLYYAwsw9leDlS56fya
	rUdiF8YUh3RjVd/60lhyjIzJt2qB/jGj9+L+34uNBNOIhcn1r0n+KYoaLhjfKgO1d3w/6VBvWed
	3F3gB4bnaip+T/zhg0e7mJfCvE2dudQYnhhzRQNiN5A==
X-Gm-Gg: AYBFou1VMoehiRh9l8O8ABjFhxkuui94LKZZRsl8CgycULUjpcZZHLeLDtXX0CNvG6a
	qQQ14lDdoYwTXYRj1+4JN2i2ZtA7sZgN/59Lzql+xt7NlGe8O7YPij6CVGekJnlOBLOKuCHKxrq
	lY1swZjJ4rZ2iY6hikYeyo7C7H0MBDs34qXNreGmXSwN0SJuvr/drqM2LhwYfnxA3XPyKop+qPp
	ZGAvPMP9B7pWPIIQFufUMGHeDCbffblz/jk6emLdb0t10UDQ3iXNTSfsVhl86AhpGHxEEecRI0Y
	iz4G+YMKg1n5qYB2N1R3JLKLvUxDwZoTq3ukQCnq0lg6gkFcdNDZdcdt9aelxwZNuZBYPgBlsyt
	JsIVRXkjgLULf12URbLqPID+55VmhLKue+IHtWp8KvUzS785La1ICVqYDrW4vWYvY/d7/ORtUeA
	bIQ9PWr/fL0eFX4IJVca67KoTtjhHYhq2IucKU9y1RAuZByIlA5zoGB2sU+A9eLs9QU1NV6OsMy
	vk=
X-Received: by 2002:a05:620a:4052:b0:93c:290e:9e9c with SMTP id
 af79cd13be357-9441337e6c2mr427309985a.16.1793286756364; Thu, 29 Oct 2026
 08:12:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-ov9282-fixes-v2-0-3bb376d8b1a9@linux.dev> <20261014-ov9282-fixes-v2-8-3bb376d8b1a9@linux.dev>
In-Reply-To: <20261014-ov9282-fixes-v2-8-3bb376d8b1a9@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 15:12:17 +0000
X-Gm-Features: AclHuK-uUWfGkjzNpPgxkc9h9-DVCMS05G89F7iEGV7DilP91VXl08Uhulon7tc
Message-ID: <CAPY8ntAYERfaKFs5ub9xpu0Ds45dFz6+aABGsdmzZMay+LT-gw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] media: i2c: ov9282: harmonize dev_err_probe usage
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Martina Krasteva <martinax.krasteva@intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 07:49, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> Use dev_err_probe() for all error messages during probing. This ensures
> there's a common "look-and-feel" in the drivers source code as well as
> the system log.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index f877cb9e78c38..8b01d9d43f0df 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1077,9 +1077,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>         ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
>                                                      GPIOD_OUT_LOW);
>         if (IS_ERR(ov9282->reset_gpio)) {
> -               dev_err(ov9282->dev, "failed to get reset gpio %pe",
> -                       ov9282->reset_gpio);
> -               return PTR_ERR(ov9282->reset_gpio);
> +               return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->reset_gpio),
> +                                    "failed to get reset gpio\n");
>         }
>
>         /* Get sensor input clock */
> @@ -1095,8 +1094,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>
>         rate = clk_get_rate(ov9282->inclk);
>         if (rate != OV9282_INCLK_RATE) {
> -               dev_err(ov9282->dev, "inclk frequency mismatch");
> -               return -EINVAL;
> +               return dev_err_probe(ov9282->dev, -EINVAL,
> +                                    "inclk frequency mismatch\n");
>         }
>
>         ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> @@ -1112,16 +1111,15 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>                 bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
>
>         if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV9282_NUM_DATA_LANES) {
> -               dev_err(ov9282->dev,
> -                       "number of CSI2 data lanes %d is not supported",
> -                       bus_cfg.bus.mipi_csi2.num_data_lanes);
> -               ret = -EINVAL;
> +               ret = dev_err_probe(ov9282->dev, -EINVAL,
> +                                   "number of CSI2 data lanes %d is not supported\n",
> +                                   bus_cfg.bus.mipi_csi2.num_data_lanes);
>                 goto done_endpoint_free;
>         }
>
>         if (!bus_cfg.nr_of_link_frequencies) {
> -               dev_err(ov9282->dev, "no link frequencies defined");
> -               ret = -EINVAL;
> +               ret = dev_err_probe(ov9282->dev, -EINVAL,
> +                                   "no link frequencies defined\n");
>                 goto done_endpoint_free;
>         }
>
> @@ -1352,8 +1350,8 @@ static int ov9282_probe(struct i2c_client *client)
>
>         ret = ov9282_parse_hw_config(ov9282);
>         if (ret) {
> -               dev_err(ov9282->dev, "HW configuration is not supported");
> -               return ret;
> +               return dev_err_probe(ov9282->dev, ret,
> +                                    "HW configuration is not supported\n");
>         }
>
>         ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
> @@ -1364,12 +1362,12 @@ static int ov9282_probe(struct i2c_client *client)
>         ret = ov9282_power_on(ov9282->dev);
>         if (ret)
>                 return dev_err_probe(ov9282->dev, ret,
> -                                    "failed to power-on the sensor");
> +                                    "failed to power-on the sensor\n");
>
>         /* Check module identity */
>         ret = ov9282_detect(ov9282);
>         if (ret) {
> -               dev_err(ov9282->dev, "failed to find sensor: %d", ret);
> +               dev_err_probe(ov9282->dev, ret, "failed to find sensor\n");
>                 goto error_power_off;
>         }
>
> @@ -1379,7 +1377,7 @@ static int ov9282_probe(struct i2c_client *client)
>
>         ret = ov9282_init_controls(ov9282);
>         if (ret) {
> -               dev_err(ov9282->dev, "failed to init controls: %d", ret);
> +               dev_err_probe(ov9282->dev, ret, "failed to init controls\n");
>                 goto error_power_off;
>         }
>
> @@ -1392,7 +1390,7 @@ static int ov9282_probe(struct i2c_client *client)
>         ov9282->pad.flags = MEDIA_PAD_FL_SOURCE;
>         ret = media_entity_pads_init(&ov9282->sd.entity, 1, &ov9282->pad);
>         if (ret) {
> -               dev_err(ov9282->dev, "failed to init entity pads: %d", ret);
> +               dev_err_probe(ov9282->dev, ret, "failed to init entity pads\n");
>                 goto error_handler_free;
>         }
>
>
> --
> 2.53.0
>
>
