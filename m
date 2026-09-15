Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2650C389E1A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484130; cv=pass; b=XtTqXmaWpFA+yOyE7+LhunlbUUyqthUDDh3TrL/NXJmjPk1tTDpok6flKqJwh+psxuaM0FGIPEzRvaMP71Hd2dkyF872ZbOnVrAdLHa0jpYwQctKcRRUtsWFX/0gK0qcIMGTOCz/xhGlgVQ4gubE6+let0xhjyo+jIObgrNzjT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484130; c=relaxed/simple;
	bh=IQOVHgvKNMsV2dpQitqyeqDC65v1umIV6EK+mzQp5cE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4dnwtdRjpFY5znxT075zxhX/LSITkEy+52ZE4E8YfwkiiHQITyjW8EYp+3F87Jgd4zZ7vGyhOW5nd3yTiqMBbksDEM276XL8zXXc00e5PMtrw5Dj9T2iaCqlemv51zVE6yNI6OFKQHRpcNst3SFa/Ko2BKV5YbMYskOWuo2DD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=UBdYAUdt; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="UBdYAUdt"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91205165f71so2179016d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789484119; cv=none;
        d=google.com; s=arc-20260327;
        b=NRFQxlQogQQhF9lEx/S9xx9Mj2cpJXxkTnMhCIvaR7+u5mTGApejyCtzLQobn0Ydv3
         YfHQSNBDuJMXFiSMOkvaeyngDaSn7JghLdcrYUF2AijI9D/hIH/8m2G4e9NmkRfbgBn6
         6FlEGh4k4r5bjjJPFRYc50AX1ETXFyovCLO76/khXQX8gpogPqpcKN+Rs1xPmJyvGZCB
         9yDgqtmEYdTjHdJ4fTMM7E0Oxfp5Ier7qKUmdSeUdgEs9tBJ7zCDYLwVg1q4tANthKnx
         mxnKc46Q467eIoD0ZDlUtoL18S+EcWG4MaeOGMLrEUPEObNXRhUmfBoA7dR2VLEozvW1
         ry2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YkDpn1JCbSK0XZcKlenB4zRb1JTQeGLgWK+EJPOwUG8=;
        fh=7R98PAosI+bB7AjbNGUOTLbY5laJHbrTokC9YufP68c=;
        b=RR7VgBLyC186H2QTI0Eew7O3BEb1jgNTr+sXkcTFfbygS+U0XAYlUrmKuZb4SBHGpg
         JEpWSHyi9uzY7/eq1L36Yfu91QiusGTOcM68DYKdAgxoADFCTcVAV+66ZdLs/jx7EdG/
         IlLZRVkwzYFJ4jNEPXAa67ufxuchsmDJYXxfMaUoxmc2zTIMMqCm4bWPCOJpqrTTn7j3
         iMm6K2Rh27BNzKB68uJVFl0p32UEXHus3TyojlcofiIh5V2oQDhzTVr+rCJFPCS06+vA
         N9LoT0aglMTRK/n8vVo0yESTTVARYL4ozV+q/oZLjQt+AfVQL51grRwnsbGRgehCIKG5
         YzYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789484119; x=1790088919; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YkDpn1JCbSK0XZcKlenB4zRb1JTQeGLgWK+EJPOwUG8=;
        b=UBdYAUdtVuF1rLO5biBHrUPXGibqLC8D0ggCw166/LgkYrJnhy1amStf0bhL9McmQ8
         hAPn+xPXi3qTrXLrg7Y2+DmnQmeezczqXr28Zhu61Iq5r5036d0oMEpCF/5pbXcNGMY+
         jb71BiodQiqdtvOC8Ri/vlurTZHaK6Ehxpyu0aoJBjp35w/t8xYtpluH6DJCirjdSOD0
         0IlmZeVGxCNidXA0+4Hi5dU0j251h6KXt34gXLz/w3L1lNx4/jhVp24nhynYKX6IiIgM
         nwIvtqLJw7QCLPcau4BqMxyQGe6f+m8GVFuceIuhKlYRJgfuGC4sled2ApY3Kaki0On2
         vpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484119; x=1790088919;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YkDpn1JCbSK0XZcKlenB4zRb1JTQeGLgWK+EJPOwUG8=;
        b=D84Cv2g3NSsaSAT+idap3b3gM0FKHGQEGsGXSxvGfkR4Dahg/4D0CBgnPnUq2ftuc/
         1zFUoZhyahqRHCNLF55xcY6gVs3+JridRevt2fyJuplSSMeW4AFGOhLV8tNWd2VJliYt
         1SaMHuNQM+V5qEf69zSqZT5DwuG7PQ/7q7MhL+flz9gatN2SL1w0sKCo3o9CZsTe+vQo
         Fc6UcGLKCr4qrxFdQxwqKltNEoqESRJ5T16ZjsR4C/WghgvWwbjtdTOMAMXqUpqunfZg
         G6B3JEse1KECFuu77HFGtoexz5Ljfiox/mB1daPuxJPJdRS2z9raSFrC3sdmM/rsZZq0
         7gjA==
X-Forwarded-Encrypted: i=1; AKwUvBzi3rmQoEnDMo0q04b4XVtpnzrZJBAul4HXHo6P80abzMvj3FDI8SQZaKfcfv2OO/0CjTLUGpJEb+xWskI=@vger.kernel.org
X-Gm-Message-State: AFuF++k71Lx6sgbbXVmFOJvU4h124g9lzxIAlEDi8n57krg8+68x+GzN
	zd0vIwgzo3wDzSSw0c+Hu2jAhQlL8gUhwwtlC415ca9x2jQFLZxC2zWs0TdSRbEEbsv3k8UynVs
	JuVAG0xADnUpeX5iUEbPokPKJ/BjycnkcVY+6+yNihQ==
X-Gm-Gg: AYBFou0DKAiLwslWfjMFfNb+zVyERwAc+AjEOuofcddYgXvPeollcZwm+t8dWZsxsYD
	ao6Nwh8/qeyzoBqauCzplcAJyqwYFHDLsoK9Vgx6jMqUt1RQqiV6IHnYZnX7ckR2SfiiwsEUP7d
	H1ACuYRJgYGqUmkwxKRIGh9vzdiZZ3vO7PV4/t14k7lWXfndtxcvHs/PhJjhqsGyz8n8SK4HpbP
	Wnm31pBm8KWssaWFvRCz0n4S57KQC9r6S9+7cRBGtGh54t8HmmtGdebWa1j9ieyIcJM2NWLBUNO
	a0qFoODDd4rO5EH3uKN9zAEFRz8uKVFN2pjgCam5jmSs3SznTPZ+dWWT0hRzMn4Vek7nwS7+Tu3
	l0NVasYFxLqf9usxtV9fTzqPWCSvEYeAZkRZabPnOirsodn0GqQdWBqRCiogdEkeuyPqyxTVJ
X-Received: by 2002:a05:6214:4890:b0:90e:9dea:82f0 with SMTP id
 6a1803df08f44-9123a453bfemr21659816d6.15.1789484118558; Tue, 15 Sep 2026
 07:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-8-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-8-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 15 Sep 2026 15:55:01 +0100
X-Gm-Features: AcwNN1XJ97RRaChz_Ari5H04vXbpih7jQTNs_yqFVO4YUf8A61DtI85agIxDfRM
Message-ID: <CAPY8ntB-vJR-Z-x3NV18NHueVGuo6zd8J7Mf6GQDYgZuJq8LDw@mail.gmail.com>
Subject: Re: [PATCH 08/10] media: i2c: ov9282: harmonize dev_err_probe usage
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> Use dev_err_probe() for all error messages during probing. This ensures
> there's a common "look-and-feel" in the drivers source code as well as
> the system log.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 38 ++++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 28f8b05b4c09e..f728709fcf0a6 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1109,26 +1109,25 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>         ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
>                                                      GPIOD_OUT_LOW);
>         if (IS_ERR(ov9282->reset_gpio)) {
> -               dev_err(ov9282->dev, "failed to get reset gpio %pe",
> -                       ov9282->reset_gpio);
> -               return PTR_ERR(ov9282->reset_gpio);
> +               return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->reset_gpio),
> +                                    "failed to get reset gpio");
>         }
>
>         /* Get sensor input clock */
>         ov9282->inclk = devm_v4l2_sensor_clk_get(ov9282->dev, NULL);
>         if (IS_ERR(ov9282->inclk))
>                 return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->inclk),
> -                                    "could not get inclk\n");
> +                                    "could not get inclk");

My understanding is that dev_err_probe should always have the \n on
the end of the log text.
Admittedly "failed to get reset gpio %pe" above is missing it, but
removing it off all the other instances seems to be the wrong fix.

Otherwise the patch looks fine.

  Dave

>
>         ret = ov9282_configure_regulators(ov9282);
>         if (ret)
>                 return dev_err_probe(ov9282->dev, ret,
> -                                    "Failed to get power regulators\n");
> +                                    "Failed to get power regulators");
>
>         rate = clk_get_rate(ov9282->inclk);
>         if (rate != OV9282_INCLK_RATE) {
> -               dev_err(ov9282->dev, "inclk frequency mismatch");
> -               return -EINVAL;
> +               return dev_err_probe(ov9282->dev, -EINVAL,
> +                                    "inclk frequency mismatch");
>         }
>
>         ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> @@ -1144,16 +1143,15 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>                 bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
>
>         if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV9282_NUM_DATA_LANES) {
> -               dev_err(ov9282->dev,
> -                       "number of CSI2 data lanes %d is not supported",
> -                       bus_cfg.bus.mipi_csi2.num_data_lanes);
> -               ret = -EINVAL;
> +               ret = dev_err_probe(ov9282->dev, -EINVAL,
> +                                   "number of CSI2 data lanes %d is not supported",
> +                                   bus_cfg.bus.mipi_csi2.num_data_lanes);
>                 goto done_endpoint_free;
>         }
>
>         if (!bus_cfg.nr_of_link_frequencies) {
> -               dev_err(ov9282->dev, "no link frequencies defined");
> -               ret = -EINVAL;
> +               ret = dev_err_probe(ov9282->dev, -EINVAL,
> +                                   "no link frequencies defined");
>                 goto done_endpoint_free;
>         }
>
> @@ -1382,14 +1380,14 @@ static int ov9282_probe(struct i2c_client *client)
>
>         ret = ov9282_parse_hw_config(ov9282);
>         if (ret) {
> -               dev_err(ov9282->dev, "HW configuration is not supported");
> -               return ret;
> +               return dev_err_probe(ov9282->dev, ret,
> +                                    "HW configuration is not supported");
>         }
>
>         ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
>         if (IS_ERR(ov9282->regmap))
>                 return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
> -                                    "Failed to init CCI\n");
> +                                    "Failed to init CCI");
>
>         ret = ov9282_power_on(ov9282->dev);
>         if (ret)
> @@ -1399,7 +1397,7 @@ static int ov9282_probe(struct i2c_client *client)
>         /* Check module identity */
>         ret = ov9282_detect(ov9282);
>         if (ret) {
> -               dev_err(ov9282->dev, "failed to find sensor: %d", ret);
> +               dev_err_probe(ov9282->dev, ret, "failed to find sensor");
>                 goto error_power_off;
>         }
>
> @@ -1409,7 +1407,7 @@ static int ov9282_probe(struct i2c_client *client)
>
>         ret = ov9282_init_controls(ov9282);
>         if (ret) {
> -               dev_err(ov9282->dev, "failed to init controls: %d", ret);
> +               dev_err_probe(ov9282->dev, ret, "failed to init controls");
>                 goto error_power_off;
>         }
>
> @@ -1422,14 +1420,14 @@ static int ov9282_probe(struct i2c_client *client)
>         ov9282->pad.flags = MEDIA_PAD_FL_SOURCE;
>         ret = media_entity_pads_init(&ov9282->sd.entity, 1, &ov9282->pad);
>         if (ret) {
> -               dev_err(ov9282->dev, "failed to init entity pads: %d", ret);
> +               dev_err_probe(ov9282->dev, ret, "failed to init entity pads");
>                 goto error_handler_free;
>         }
>
>         ov9282->sd.state_lock = ov9282->ctrl_handler.lock;
>         ret = v4l2_subdev_init_finalize(&ov9282->sd);
>         if (ret < 0) {
> -               dev_err_probe(ov9282->dev, ret, "failed to init subdev\n");
> +               dev_err_probe(ov9282->dev, ret, "failed to init subdev");
>                 goto error_media_entity;
>         }
>
>
> --
> 2.53.0
>
>
