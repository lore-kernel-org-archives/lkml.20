Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A179E3C9EF3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483396; cv=pass; b=kTikogFRp/bODzXsPsa2sVahRm1YmAOK5apo/WhApYTczW2JcW4q1P8Hu42iBryP+u251AtNnYeJkHeAKBdyG7OiHSJ2KDa/Tp2FuafiNwMesgGHF4//pJC7TCCEiqfJ2mZZBh8hoVS5gMeWOVpBjh2+ytuyTIyZrMhagBcyk7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483396; c=relaxed/simple;
	bh=15/+SywPQsJQghdy0lHJz8wGdQwZPe4GOXiZDdhxSII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFpLbKXDtm6cEfwTVKXXnVnXzELZIS0G7sWHjtD3ZunkaSUa0rD+MQfSgMwOOPUBafiUeq7o0qLJdUCTs2j/O8IwlJaP+YrZtHKNTMt9ANhl9TDxatjX46ZLNIUtaBwgNo951UNdcVxY48L++4uc/cpOV+3nY9js5Xjx+ZsLOVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dcLYwy0D; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dcLYwy0D"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6ebso34882496d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483393; cv=none;
        d=google.com; s=arc-20260327;
        b=IXJVDrnXEiZY9C4IrQA9AuhNCCNG/+QqcC/9siAtKKI45aewj5j4Qt40az0bHy2ITG
         3NlhqzZOnuxdTn8lqcZk4Qfqn+dZ1WJUfo1nfKH8yW4fIHyzGSoUmbvGq8MFfrAxPiyM
         4vc//zFvtRdqlOq7T+5m8DlKRn5N0ol2PPNUyP4OdjDKDidkqIW1dmfh0vrOwai+Vj+l
         w1iKNoKI+qllqIILTX5+H6BX8ySvO5cIV244bsDoQUXwgB4wPb8LPKEBJAY0D0oCN82b
         STeH09QEs18vONHHc6SnPmDuNnwW3xM9oz4lNh81k67u+/SvDRY46Gk4p3y3dHog1NRv
         DVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rID0m9JFEu6NHI6Fa/R4Mit9IJeM2Yeqh/iWfm9iBds=;
        fh=s+QFDRZvgp20DkTPHjsCDvI3jdtIkKH9/pvXHCOYI+M=;
        b=gEnsdMmIzYswsaUb3oxfo6N3vIgQHT7q5ntO2b34uYqkh8EAvBx0q5eyq++75Fh30s
         H1p7BGW5ngdjwmrgEHYI/Do6oA44EnaihA3C5E5+s3jEJpwQWSPONNnrtPcNuu2Dx89S
         ywbLHhisF6MmcVeJ0v9PRJFc16im8wak6u8CCJ2dduNB65tK8YBKpV92mBN6utphOJyW
         P7hrAUKIeqsMa916LAyPtnbp1eVS4Vja82F7DCi52HjeiMhtMUcX1pms4YSGYjDvgwoN
         k48YEelG5NaHHIj7iWWwvd+2f8Gdg4u0qw6wXAqcODcsDEkWRw+YCbA6QHdm4JY5R2Bl
         Jk5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789483393; x=1790088193; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rID0m9JFEu6NHI6Fa/R4Mit9IJeM2Yeqh/iWfm9iBds=;
        b=dcLYwy0Dj6xYUFzGAacOg5WoiZ4eBVMxfgWLiPhp4x/xGzIuN/aCL3LClzw9VgImjJ
         qEN0nskYTZ2kkdLcUeHbFIwZsqQ/JoczfTQaDz+y8Ki2IEOJQDogv/RZuuJRM0nUDVnY
         X7Ho16jgb6Xzw6cr229UxDJTG7qYYz7+cx5MxY79A4klE0Iiz0buqG/rLCnWGLAcquA6
         XNcNGX1w/ahJBz9Xh8qa2MpWTp2YYkp7xpIBznTkJ36LdEND7Z3ET+oURVYr7vsQPdVX
         fxp0bUU0rEAE9FYtUaK38GVDDrjMEmCcjDvuu0AbOdUbVoonxVjoluDA7WQsdwBi6nU+
         vX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483393; x=1790088193;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rID0m9JFEu6NHI6Fa/R4Mit9IJeM2Yeqh/iWfm9iBds=;
        b=qHEui2WhkO/q3tEHbanRt+xft6AZnJtVzTweJ1Jqg/A+pCFIDIacXai8SpC/QEBmst
         uLT2G15I+DMk4rrijP9Fut2gHAWAwTnH+fx8YAQGPAtYBTkpYdm/BUf9xR3dnpYzHFGa
         Ih5bWbw3ju9nyLcOf2gmZrbjPQ+J00ao53K2N5jtdyEEHsp465s3jxKJyKOgPzQ4M7rD
         7pD+nWoKjgc5xoUhzvmfSmkDMZR2T9+/dC9t9I14fRI847A8LjGkb8Jc/m7zUiR1Re/R
         HANkuBu+6B4g+tOlxi2jaz1bOj6H6xOCDWaHhTilJyZ3XoRN9TaI5hUNzVkzd0HpYgjS
         Vk0A==
X-Forwarded-Encrypted: i=1; AKwUvBwjh+qQfm1nBXXyU2nbmvVRR/5wAXPMB8IjIbMWj6S3kwEJJFUmW/EcNJ0WF7RdgHTYOiUbWnBbpYrC9tY=@vger.kernel.org
X-Gm-Message-State: AFuF++lhaUoyL+b3jIb4ewTV7t+wcxBCixUStWpG6kttkHWYrwMuznB2
	XCbXsui7vdcjivHxDCZ4DuAx64j5bmPdxz7mSLnwbvMfDUAOr/DXtv9cDs78hV3Yandv2ApkHAx
	TrAHALtuVhkwDdIV+BXwC3/8ZgA4FTpoVofIybLi5hQ==
X-Gm-Gg: AYBFou2xDiE332HfpQlpaWO0M1JW39qNP5O5z+C9K9dugdxRldm0t51xslICPDmrI1t
	PV0Pu9o5AbboXKft9JKJzRRbCmcAVLWzc/v4Wo6ELlEkjcHOsLpk9YCaZ+KHi+zFJ94QfpLbEgt
	LDN5hL4hXSgLArDBmpBWbhAnz6+w+xRbF9VAVtQivLULPh/dUhj+3eV63T1f7MT1vd4VZ3ybJ04
	aXdj3s5+dklHjpzeeNUnx3awf7lx598FUSNyM7lZwKNzznqKfnS4Ug4AC32JLBDoGOUUugoCSXn
	RVrslWX4vlKh5lW5s7D564eniFX/3/m+zYq/DnjO76alHRS1AIDzkO/rtBccs1rWtuDrDq7+C4Z
	W2Qw/VxOUzzGmpuuVEudqVzccoiP7DcFWZ1Y3sLfU8K6MIQyRwOsg16DLSco+No2ZTS3mZR2m
X-Received: by 2002:a05:6214:b63:b0:90e:8cd4:30da with SMTP id
 6a1803df08f44-9122e55ceacmr123209306d6.18.1789483393372; Tue, 15 Sep 2026
 07:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-7-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-7-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 15 Sep 2026 15:42:54 +0100
X-Gm-Features: AcwNN1W1SjWSkd5yJqtH0RgT6TBJ1Go9MLnuWlo9YYy7VousLlRm-tuvUaXNS28
Message-ID: <CAPY8ntABqjqzt9jJLiOpgH7yjpk5GZzhx9rKicd+-Dh-ewZ54A@mail.gmail.com>
Subject: Re: [PATCH 07/10] media: i2c: ov9282: drop redundant vblank field
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> The ov9282 main struct has a dedicated vblank field which was only used
> to duplicate the value of the vblank v4l2 control.
>
> Therefore drop this struct field.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 632184e76b9bd..28f8b05b4c09e 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -193,7 +193,6 @@ struct ov9282_mode {
>   * @again_ctrl: Pointer to analog gain control
>   * @pixel_rate: Pointer to pixel rate control
>   * @flash_duration: Pointer to flash duration control
> - * @vblank: Vertical blanking in lines
>   * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
>   * @cur_mode: Pointer to current selected sensor mode
>   * @code: Mbus code currently selected
> @@ -216,7 +215,6 @@ struct ov9282 {
>         };
>         struct v4l2_ctrl *pixel_rate;
>         struct v4l2_ctrl *flash_duration;
> -       u32 vblank;
>         bool noncontinuous_clock;
>         const struct ov9282_mode *cur_mode;
>         u32 code;
> @@ -646,17 +644,13 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>
>         switch (ctrl->id) {
>         case V4L2_CID_VBLANK:
> -               ov9282->vblank = ov9282->vblank_ctrl->val;
> -
> +               lpfr = ctrl->val + ov9282->cur_mode->height;
>                 dev_dbg(ov9282->dev, "Received vblank %u, new lpfr %u",
> -                       ov9282->vblank,
> -                       ov9282->vblank + ov9282->cur_mode->height);
> +                       ctrl->val, lpfr);
>
>                 ret = __v4l2_ctrl_modify_range(ov9282->exp_ctrl,
>                                                OV9282_EXPOSURE_MIN,
> -                                              ov9282->vblank +
> -                                              ov9282->cur_mode->height -
> -                                              OV9282_EXPOSURE_OFFSET,
> +                                              lpfr - OV9282_EXPOSURE_OFFSET,
>                                                1, OV9282_EXPOSURE_DEFAULT);
>                 if (ret)
>                         return ret;
> @@ -704,7 +698,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                 ret = ov9282_update_exp_gain(ov9282, exposure, analog_gain);
>                 break;
>         case V4L2_CID_VBLANK:
> -               lpfr = ov9282->vblank + ov9282->cur_mode->height;
> +               lpfr = ctrl->val + ov9282->cur_mode->height;
>                 ret = cci_write(ov9282->regmap, OV9282_REG_LPFR, lpfr, NULL);
>                 break;
>         case V4L2_CID_HFLIP:
> @@ -1412,7 +1406,6 @@ static int ov9282_probe(struct i2c_client *client)
>         /* Set default mode to first mode */
>         ov9282->cur_mode = &supported_modes[DEFAULT_MODE];
>         ov9282->code = MEDIA_BUS_FMT_Y10_1X10;
> -       ov9282->vblank = ov9282->cur_mode->vblank;
>
>         ret = ov9282_init_controls(ov9282);
>         if (ret) {
>
> --
> 2.53.0
>
>
