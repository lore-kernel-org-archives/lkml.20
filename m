Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793285690;
	b=G5+CxRZ9FKB6LpOshM3Z+KWcFHxKo/0gI/QDJ90UliTB3KatbzIOV5xlIWL0RIykoUpG
	 UBj3LPKsz63TgUileYk+4MWQaO8PyzTSPT44icHP1JHvRca2dDCJ5L/qFD5I64+d3LR7u
	 KuY3uiJXDiTY1BEohzpLnGZOK/45To7vU6MjE9qNjMvSW0Hp6prlFXgRXgtPqCrPvcY/4
	 qap7HE21akvSvrf4pzgnbyEwYvGJbh2Q4mOo1QoYVuBJ5NsHbQ5w/bKWFDIYq6NHYxHGC
	 bGqBC5DL3ZMDtNBC2j6VaMGCH/d6vrzq4Uoo0lzBCaxPkyuUEJXyouIw6tHRIaMXo4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jZf3jjTodnM7qc1wo9plUNoH8ssRvL1DxBE038OooOQ=;
	b=p9fgKzHGYIXiRbkhTMWVWNqTSBb9nuSTMz7PD7XcmdUmgWEbWNse7UxhntnC/tkjaMgv
	 Re39st/VUgsH/E7r55ZekHgPJTAmIRZ5jb9MihzpVoWEBq+SuTbcYkK8rMjUWoKfJG2tr
	 CjqbiOGO059e0ternppbwfmte0rs7Br9dlezxKOCWFK2e19KuZzqnFvILj/V9SkGFX9tp
	 jBU3k2rB+vMCggcbilkSqtx8GcG4aVoe5lw1sWIvveq5SwUtl4H91MgdX1Lf3XhLdhu+1
	 CWXfLqpOKBPyj11GLt+IPTHdw26vlNiwk7XSZZqZHuj8F5ec+R5Wc67o4v+nRnvnlNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b="Rlq737/y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E952606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E952606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Rlq737/y
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-48ed0b68895so1275027fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793285688; cv=none;
        d=google.com; s=arc-20260327;
        b=srOrYVKYnp/+QJtkj98yYnhxEpq79Ei9QpFiw3ewkSSpCDgqX8plJ5oVdEiUfxrhJb
         pkj9GBdzE0zI9Uw/iwLoiVpCZbdbT1BdwlSgW0M5GT+KjySkpX4x6nz5xj7wekk3M2Ca
         6/FahnX6u8g1Q6ngqqvFelwPXYsVJaAliI1IyRI9BYOHLQ0XxMiwakU63XjQ5aduvJ5r
         ys06xMNYKm1dSwzbbjvsi6LfGs9EIfCi81LmcHML0HHR0Rsxjjr9EUMX6vjo4q2bGOiK
         M4CLZNqPP2TqAs1bLzd6LvQ7GSakpKhJep1oMdze2tI3pzvzFNoMW5tD1rv2LLgA240L
         vRMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jZf3jjTodnM7qc1wo9plUNoH8ssRvL1DxBE038OooOQ=;
        fh=tq01M4PYrc3WW0Y8vXz820P9/iBxthPTpc47WwZN4Ug=;
        b=sWM9M84dhPjUw8dUhEvlXMxlBmafLa8EePZr/IlkeRDU2NjNHtV9ehe9p7zi4Y2gDd
         If+DZ8uZsAv61TquQeLbumqOs+IU9m3deQjAqrhhhb3XmOe+27rsWd6wGfK2Cm1psRSS
         h0U7yfM3AxSEwTDZIUDpg9u4lZiXoA/9UgM5Gemxrt10uh+NMthfZa50UCp/Rl9gvLXC
         Umn4Szn4u4meAbhDAueZCKvqOf6hhCQxTkZy7DFSvcDq2Xd3clNWjyQKNFYc0/zTR4Z8
         bGaHjHYrG3TaJ2wUuKpqsvckUb68GoAu4bUSkhcBfMc+wppBuNcUEXzwg0yXKS2wPvnp
         G4jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793285688; x=1793890488; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZf3jjTodnM7qc1wo9plUNoH8ssRvL1DxBE038OooOQ=;
        b=Rlq737/yw9y59C+5F9yht1LHNkLvTUU8EY9Zv4CqfWn8wkp+QpjKh1HxZwqlMBYdcG
         oZoJE304EjTAOTyhFCE66H6FE1ocYOxvW6c3bhkpbfg7yREaQVYPxA5IGfD0/NgNPzt+
         yjj9TB9S10m1ZBC8O+1hXmmGX9+gUCp9Z/xK0/OKxtkJ080+y9RAsBkSV07rvQANnrFg
         u2FmEnEjzgHLg59clH8eEzy0q5nqYpkkxTMgHSr0gM9uI/8ug+sMt7puTq1cWJNmkleD
         X/F9UyYNOZBkcUVa88DNEFcIEEknHraT1inWTX1+Yul+mgYNWdpjen+rGq3MOCdmW6ma
         H43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285688; x=1793890488;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jZf3jjTodnM7qc1wo9plUNoH8ssRvL1DxBE038OooOQ=;
        b=QrAd0ndh0kmAaZvH2Phy2Z5JqR6ai+9i2xADorXwrjbUeRptMUHx+A6L5OJzpstcJ1
         f3s5GTX5HjRgtM/yqNFoPAouVzkXtzdG1WtSvHogsHHcppLAUx7N6sLfxF/7M/zg1i7f
         JlKHTRxHRMuhqNx1CQJbgpDGrc7JIpl0bkXhMyRG4xo7NdOhfd669oD1PE/Duw8IPj6H
         J4o4QYiRwZ2uwhDux/bzCZknNIam7kdFrozAK/kLYAWu6m3JLMzJyNKCs/kSBBEZh0NT
         9h0Lp1Q8TUlHF9HsEIiUhXVQa1tbO17kq8reMFB6m5Qp+O4z7vAY3X2CEC6W83sDkrBB
         eQyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiQwh+pcs3ZAeznhA+148VcoYUPndaVkYOfLJdssR7XmdyyHdUcL++wcJvqO0ORy0/qA063NaVUwao3kY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKB7zO9VEY3PKTHoa5Ig8+J5mIqqt5egOTMmeYTzyILi8+L8w5V
	JGcL3t9jAjYrM3B8PhLv8hJovSJkwdfViHYttmyqzM6Qrqgc+5llRJDfyj5mBTVRNV2Y3hLTJzm
	tC7FuMEoUC9LQPDIMB8UFNb4ZypCqrhQSgCn2o2sjDA==
X-Gm-Gg: AYBFou0sjARkr1IarK+UE/AXnWpUdFELftuosapsx5QUmkfq/cvYLwNwihMet3y/D8s
	Us36mQX0RUh3RlvLWox3UDku5nGWmFY18tOiQ2ofNE5/711Q+31Qw1rhyHPa48oCrbcefS4FSl2
	dGavLZ0jcc6R8KnK2DGvbQFupZr3fFMWGzqfcIK4KjL/BLt9w2NbP5LQfg1e3N6ZjupRsawDndd
	KvHrMKi/S3Pp0MCJCcEaB5gLzeaiqILY+jYTNDVdXdAgc+oxx2H7PcElBjSy558Uj7wQLoVq9od
	0rs3AtWsz4TxjECzFRjPWiWJdolgxKAI5xUerjPMTzupIq0Rgo+Xc9pTyDbcSoZuahfV7py2eox
	pzE71pPOiOsiTKcfIM4UGjbGh47bcqO//pD+l4epJELJR/NY4V8DCl9shWQVMtHr3hrHouoHh1n
	UwcVcjCtdjGKHHWkphVYY6qmQnfb3Jv+m9UPergDHIpRnDA4UtVTNFAQ==
X-Received: by 2002:a05:6870:8a09:b0:47c:4f69:3f1f with SMTP id
 586e51a60fabf-4a8bb4595e8mr4158986fac.14.1793285688482; Thu, 29 Oct 2026
 07:54:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-ov9282-fixes-v2-0-3bb376d8b1a9@linux.dev> <20261014-ov9282-fixes-v2-4-3bb376d8b1a9@linux.dev>
In-Reply-To: <20261014-ov9282-fixes-v2-4-3bb376d8b1a9@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:54:32 +0000
X-Gm-Features: AclHuK9PiAlyIOE9H6TgjFTZyWCGr5hpHVaWb1aHCZKckP8QEuz-8cMUmUpjv44
Message-ID: <CAPY8ntDNa8xuVRS6on=WoVghzJj_An3EydpEb=RwNDE1tmO9Kg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] media: i2c: ov9282: fix flash duration range calculation
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Martina Krasteva <martinax.krasteva@intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 07:49, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> The flash_duration range calculation was broken. The maximum was
> calculated from the current exposure time. This limited the hardware
> without a strong reason. The minimum was fixed to 0, although the
> hardware treats register values 0 and 1 equally for the strobe_duration.
> The default value was never calculated from the raw register value to
> actual microseconds.
>
> Furthermore the flash_duration range update sat inside
> ov9282_update_exp_gain(), which ov9282_set_ctrl() only reaches after
> the pm_runtime_get_if_in_use() early return.

only reaches if pm_runtime_get_if_in_use() doesn't return early.

>  So with the sensor idle
> the range kept whatever value it had when it last streamed.
>
> Fix those issues by correctly calculating the values on line time changes
> (i.e. HBLANK updates) as this is the "time base" for the register value.
>
> The maximum is chosen to be S32_MAX microseconds. This was done to keep
> the code short and avoid additional back-and-forth conversions. As the
> hardware allows strobe durations from 1 up to U32_MAX line times, S32_MAX
> microseconds is always in this range. Line times for the supported
> modes, hblank values and pixel rates may vary between ~7.5 and ~205
> microseconds.
>
> Fixes: b95d8058a2786 ("media: i2c: ov9282: implement try_ctrl for strobe_duration")
> Fixes: df60764ea5210 ("media: i2c: ov9282: dynamic flash_duration maximum")
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 41 +++++++++++++++++++++++++++++++----------
>  1 file changed, 31 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index e2a1f875160b9..e6920e18b7818 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -514,6 +514,26 @@ static u32 ov9282_us_to_lines(struct ov9282 *ov9282, u32 duration)
>                             ov9282_line_time_ns(ov9282));
>  }
>
> +/**
> + * ov9282_update_ctrl_flash_duration() - Update flash_duration control range
> + * @ov9282: pointer to ov9282 device
> + *
> + * As the actual microseconds value of the flash_duration range (default,
> + * minimum, maximum) are dependent on the line time recalculate and apply them
> + * to the v4l2 property in this function.
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int ov9282_update_ctrl_flash_duration(struct ov9282 *ov9282)
> +{
> +       u32 fd_min_us = ov9282_lines_to_us(ov9282, 1);
> +       u32 fd_def_us = ov9282_lines_to_us(ov9282,
> +                                          OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +
> +       return __v4l2_ctrl_modify_range(ov9282->flash_duration, fd_min_us,
> +                                       S32_MAX, 1, fd_def_us);
> +}
> +
>  /**
>   * ov9282_update_controls() - Update control ranges based on streaming mode
>   * @ov9282: pointer to ov9282 device
> @@ -577,12 +597,6 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>                 goto error_release_group_hold;
>
>         ret = cci_write(ov9282->regmap, OV9282_REG_AGAIN, gain, NULL);
> -       if (ret)
> -               goto error_release_group_hold;
> -
> -       ret = __v4l2_ctrl_modify_range(ov9282->flash_duration,
> -                                      0, exposure_us, 1,
> -                                      OV9282_STROBE_FRAME_SPAN_DEFAULT);
>
>  error_release_group_hold:
>         ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
> @@ -616,6 +630,11 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                 if (ret)
>                         return ret;
>                 break;
> +       case V4L2_CID_HBLANK:
> +               ret = ov9282_update_ctrl_flash_duration(ov9282);
> +               if (ret)
> +                       return ret;
> +               break;
>         }
>
>         /* Set controls only if sensor is in power on state */
> @@ -1190,8 +1209,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>         const struct ov9282_mode *mode = ov9282->cur_mode;
>         struct v4l2_fwnode_device_properties props;
>         u32 hblank_min;
> -       u32 exposure_us;
>         u32 lpfr;
> +       u32 fd_min;
> +       u32 fd_def;
>         int ret;
>
>         ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> @@ -1260,11 +1280,12 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>         v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
>                           V4L2_CID_FLASH_STROBE_OE, 0, 1, 1, 0);
>
> -       exposure_us = ov9282_lines_to_us(ov9282, OV9282_EXPOSURE_DEFAULT);
> +       fd_min = ov9282_lines_to_us(ov9282, 1);
> +       fd_def = ov9282_lines_to_us(ov9282, OV9282_STROBE_FRAME_SPAN_DEFAULT);
>         ov9282->flash_duration =
>                 v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
> -                                 V4L2_CID_FLASH_DURATION, 0, exposure_us, 1,
> -                                 OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +                                 V4L2_CID_FLASH_DURATION, fd_min, S32_MAX, 1,
> +                                 fd_def);

Observation that this changes the default from
OV9282_STROBE_FRAME_SPAN_DEFAULT to ov9282_lines_to_us(ov9282,
OV9282_STROBE_FRAME_SPAN_DEFAULT);. I won't quibble over that though
as any sane user will be setting their desired duration.

Ideally with the commit text fixed:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

>
>         ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>         if (!ret) {
>
> --
> 2.53.0
>
>
