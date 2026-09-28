Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6050E4D1787
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603276; cv=pass; b=A1W5WTxkTWICYx7cRleyiG/EQyln68qB0OdRoShcYVAb2eku3+NWO3JEn6UxTfBj2OK1i3qz0k+TX73PWFJsSmWgLoVKeDpsSqPulTDN6l4+4ExUE9pKN7R7GpOcuhZOT0jFFmdqjCNWc2PLby7WUVUGhNTkBfCvTyBpVB5nq58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603276; c=relaxed/simple;
	bh=vqwrq4AvcZJ2abX6krO6C4SuPYik1iuIHeJAHjg/rEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbFaoTkvQveCuVvyfQZ85DC5BCJOkV0UpCtmSXaSMn3wGxwqsf+zpJEB1UNvcM0ZFLJ8Wj/KaH1CgVxICTb/4EQMvUS6zVSDSHqd6a/rAKAiJNLCYb/KCgB6u14MMSlMpXVuPH08u6WaeLKIjtxOKoRTNJw7KEB3iNMsEnHOjak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=URSdom+1; arc=pass smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="URSdom+1"
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6d7530420abso1143482eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790603273; cv=none;
        d=google.com; s=arc-20260327;
        b=VVMtH3TxZbPwPlZ4AgWZM2KAZvzoIM2OL7sDirGMfu8IGSXHdHsLgasQrSi2Sj+WmS
         QVKzX15LmnqAon610P605pnQ8Z8sNTlQ/HL8CE3V8+O5yZxsGgSIlOCcwad7L8C7j7lR
         J+CFY+oxsat6F5/0qzAv3bV/Vvhf4dhHQGTR4AZ+1koRjXGJuhxCTyfzYP804/hrKz3+
         SsRpwg2Vf8rgbBi9QQnySQgJOvxfbGEI3iBEp37qcbXZLQ0GqvMaZd4m+b8+TEKVLh8o
         3X83PAIXI5Hi4mSV4XQdcE3s8dcQQSDjJC5hRnTw7eNc5NmxZaN/qTpGdLtp+x66u7do
         MfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dZ9Tkd5ktyo3J81zP2ExpIdndNhoj9/lF2//YUfachQ=;
        fh=xIW6w1K2cxs0OvrOyKc9mst2o/n/rFpVh61Om8RT3tM=;
        b=AB6vpa50MIAK14n6ZkabRgLHsZTZa5pd9tmousIXzjHnJm8zxEQlARb+G306DxMiqs
         k14Ch/7bxrOyxgaMnvvB/4p62lTqBU702BCnzziEhFjgALo67UIAb21Zf5LITMlgQvs6
         SnuwmOkXSXcojBO44RnRN3BbdnDdYmDYRQbuCQNdCsON+/MKZ3nFuR9EZWc41bqDacP2
         mWXJqGlYxFL7obLLopD2ZMd7oxs/Se/+et5PzhatcPt0FJjOVw/0zAIzorLEARjRvGub
         i3b7mdhrFNmPp5k2emWZPK/maMlMYxKLIbQI2V6GrnqwRsgTl41Lor678sCwsajEJghE
         O42w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790603273; x=1791208073; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZ9Tkd5ktyo3J81zP2ExpIdndNhoj9/lF2//YUfachQ=;
        b=URSdom+1yNGeeLBc/n1R3F3hAPY7VAytnggUjiW5JWlTHjpjngAm+FsjTUMS8Wylq+
         kHZr+WGdZsS18Od3Y81p9hs3f1x6LHigcmrEbkBnSjiP/XWzpBmIuCLX/2dn9Axx9t6m
         myZaIVssuhO5AJZ9v+sN4t6zMOB+GM6WlKlLnEuITF017L1CuHDB0MXW5RPVJqtE0Plw
         k+ztNV54xvnVxQOvLMMTG8anDzfzdgQAw0kOEe7n0CHPAW6FWrIYqh/VFFpyeBH1H/l/
         YDrQzrLkAlizSEU5tTKi6jZsLF7cl97kWlaneF0vulqx/egDgmsyU0oC2wq4ejN8cFur
         f3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603273; x=1791208073;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dZ9Tkd5ktyo3J81zP2ExpIdndNhoj9/lF2//YUfachQ=;
        b=qFMVXmjV2lFwGKs7DunPWpi9Uj3FFr905uB4N00azOuzmGwvtH2/WqaZIluIQmg7oA
         sPi2umLIs1Bhf7GfTJkxtXh3cmqd9ThwJcpAOCGs/k6FYULprkYij0JjKuqInqZHa5xq
         CNeC1mxyZpvjqwl02Ae0WLV9VZby09fcTwCvJVU8ZQ6P/2cLVBpjiDGTeVDuikixRMds
         byRFtTl9JHxMMYEZ8jolBohWbCi/mNyoi2hV4+4vnEw8mhCcxIxVqHaW/DzS4TY4J4QV
         rxrCxqzaqpwW+Rx1N7p3TidLCPGTcI2WD/RIPCQ40OhR9fZteRP3NzO131KFS7Q1lkDD
         xIpg==
X-Forwarded-Encrypted: i=1; AKwUvBzqlbX22YXCbp5+mP96e7ORWdJNjOwq6+jm0dEebyfuuOdn1vrlf9FfI1cMOC4xdSR3q2Fl/vQwSx6W2mg=@vger.kernel.org
X-Gm-Message-State: AFuF++kL/5tJraMKXQC2d7ibGJE43p1bMwt9fmjOE01txvejzbcA9lem
	lWZE/PomnflLiPUZv4bYrNxC4LkD7s9GaDoaqWVkQi42MoB2geM/m96ytqhft8dl1KoJ5o+NEEb
	TE+crFA7pWC6A1XVyVIwIqP3b6kM78ODCG8GrK+R4Jg==
X-Gm-Gg: AYBFou29CiLFMXZ3DJUq8PnP+fdoy2WVzMSNOBbg6T033vp7olcZtZrrtkqrdTCznYX
	eSBwpks0dNHG1sS0fC7rJHU9VtD0E5Fl3VIo6MXdJVZJeZtOclnxlseuyPQjluSJ50Taj4fHcBH
	axtZLsNEkwVAWAKSjIctM9k5Ggp+BkEk+vtBsTu7GiO/TFH6juJhwtuUOP0dfUi5+crXGYeeY+L
	QSjxdT9Lt7bPki2t+BI8rNoHTsIwjKoqryVeJyUQ0XK5gjYzQuBLr3RAiKtDLc2yE+V7dlTvDzA
	12xXrsciDsqVZ+RstQ6BashGMrNnLONIdmzEl4k0Dcxo9dPm8bGqxQFTMq7x1fc+0iAhohXk+XD
	BmyORRsE0K4UWGFSo2CESsScz9H028I/0lixceK49jpcdovUXfx+Dw6NcYTcz7cVQSwkI0nM=
X-Received: by 2002:a05:6820:4b8b:b0:6c7:af50:b2f2 with SMTP id
 006d021491bc7-6d43ff69b7dmr12278487eaf.45.1790603272980; Mon, 28 Sep 2026
 06:47:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-9-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-9-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Sep 2026 14:47:36 +0100
X-Gm-Features: AclHuK8pf6-cx8P7G1yInVrVxs_aGDLokGG09KZxdH-V88I3QFPMTofnHPAuxCw
Message-ID: <CAPY8ntAk1z-BuftZufd-qPwP9fDf9NQ0nwJn8XMV6pGKLfrFKA@mail.gmail.com>
Subject: Re: [PATCH 09/10] media: i2c: ov9282: fix flash duration control range
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
> When updating the flash_duration range ensure the ceiling is at least as
> long as the exposure time is. This may cause the calculated
> flash_duration register value to be rounded up.
>
> This is done by introducing a new
> ov9282_update_ctrl_range_flash_duration() function and using them
> wherever possible.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 47 +++++++++++++++++++++++++++-------------------
>  1 file changed, 28 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index f728709fcf0a6..be38ecfad8c82 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -541,6 +541,29 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
>                                 NSEC_PER_USEC);
>  }
>
> +/**
> + * ov9282_update_ctrl_range_flash_duration() - Update flash_duration control range
> + * @ov9282: pointer to ov9282 device
> + *
> + * This may round up the ceiling to the microseconds representation of the
> + * next flash_duration register value to make sure one can illuminate the whole
> + * exposure time long.
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int ov9282_update_ctrl_range_flash_duration(struct ov9282 *ov9282)
> +{
> +       u32 exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> +       u32 fd_max = ov9282_us_to_flash_duration(ov9282, exposure_us);
> +       u32 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max);
> +
> +       if (fd_max_us < exposure_us)
> +               fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max + 1);

Reading the driver for how it handles flash duration, it all gets a
bit convoluted. I see part of it comes from the units being usecs
whilst natively it is in lines, but we've got this slightly odd calc
and adding 1, and rounding in try_ctrl to get closest to the absolute
value.
Seeing as this is the max flash_duration, is it actually limited by
the exposure, or by the frame duration? The difference between those
is a minimum of 25 lines (OV9282_EXPOSURE_OFFSET), which I think gives
you up to another 9usecs to play with. That covers any of this
rounding stuff. You can afford to always round that one down and never
clip the range below the exposure time.

There is reference in the docs to a different behaviour if "the
vertical blanking period is long", but with a bit to set to give
stable behaviour (0x3017 bit 1).

You've far more experience with how this sensor handles the strobe
outputs though.

  Dave

> +
> +       return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, fd_max_us,
> +                                       1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +}
> +
>  /**
>   * ov9282_update_controls() - Update control ranges based on streaming mode
>   * @ov9282: pointer to ov9282 device
> @@ -555,7 +578,6 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>  {
>         u32 hblank_min;
>         s64 pixel_rate;
> -       u32 exposure_us;
>         u32 lpfr;
>         int ret;
>
> @@ -590,9 +612,7 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>         if (ret)
>                 return ret;
>
> -       exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> -       return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, exposure_us,
> -                                       1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +       return ov9282_update_ctrl_range_flash_duration(ov9282);
>  }
>
>  /**
> @@ -605,11 +625,9 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>   */
>  static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>  {
> -       u32 exposure_us = ov9282_exposure_to_us(ov9282, exposure);
>         int ret, ret_hold;
>
> -       dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
> -               exposure, exposure_us, gain);
> +       dev_dbg(ov9282->dev, "Set exp %u, analog gain %u", exposure, gain);
>
>         ret = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0x01, NULL);
>         if (ret)
> @@ -623,9 +641,7 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>         if (ret)
>                 goto error_release_group_hold;
>
> -       ret = __v4l2_ctrl_modify_range(ov9282->flash_duration,
> -                                      0, exposure_us, 1,
> -                                      OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +       ret = ov9282_update_ctrl_range_flash_duration(ov9282);
>
>  error_release_group_hold:
>         ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
> @@ -660,11 +676,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                  * Ensure the flash duration range is also updated on powered
>                  * down sensors.
>                  */
> -               ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
> -                                              ov9282_exposure_to_us(ov9282,
> -                                                                    ctrl->val),
> -                                              1,
> -                                              OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +               ret = ov9282_update_ctrl_range_flash_duration(ov9282);
>                 if (ret)
>                         return ret;
>                 break;
> @@ -674,10 +686,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                  * duration. Therefore recalculate the flash duration range
>                  * here.
>                  */
> -               exposure = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> -               ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
> -                                              exposure, 1,
> -                                              OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +               ret = ov9282_update_ctrl_range_flash_duration(ov9282);
>                 if (ret)
>                         return ret;
>                 break;
>
> --
> 2.53.0
>
>
