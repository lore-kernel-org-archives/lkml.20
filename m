Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510F1519E02
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173007; cv=pass; b=r3Dv4OJvw4yxtqagbWDXUCMaNlvfXhZrirjalxfUntALHEktocf3cbgI6HfJ8zrKd7SyQTM4JG+TLl9ZDgc/VcHvEPdWw672lIXWZl0RlWmq76qRXCOL8C16HxhRFW6UQHa/zEWJkof4OE6Hg0OqEPHSNJZeQAuE3wnUg2qEBlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173007; c=relaxed/simple;
	bh=FS6lJ3PtLm08vjSBoIe7H4TwoYiMkgHt62cTjrYT4xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lI1xqDgmeYCllyhrDNnu9SRoAHaserDGiX0+D+ozL6jf2OcdoNtaUTo4bhApKbgXcnCVu+vacO4sEyNRkNRtu+l1d6ijz/jpBrEM/u5YUfQXb6ifOM7GPphDomHwZUDsvKVI5XyqIbnIKo4DxWGMP0aYIsAsG5JDZNUFm18YkW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OL4p5HRA; arc=pass smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OL4p5HRA"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6d33d80855eso315952eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790173004; cv=none;
        d=google.com; s=arc-20260327;
        b=DA9/sce+dI1qbBTUGGvaCUjck3f2K0fNqlPRSrNJbi/x+5KeMtwk4XbAueDgXCXEwS
         qe0gd855cxaJT3gvDIcsKiATPKNMDgbUpFWGmKvIMZUC7eVY2N08pIZMIcBrqCyLUvmf
         QIJMclKBt188ArV62k+USBCW7g1LrVmX0y83wW965tYeaxqMh0vO690bKbSQmz6NJWkO
         gXMlYMI/Q9/SB+bRqwnxpmNFS1wEcS9jGsAy+69sav+YtXMmNrHCplEYBa3cb7JskhtP
         er1m1EhRUdobB+NogKBpnaMsKlX1dVMpR5Kt6c0Z/d4rHDczC8YR6A6GnYE1O6385xrc
         Pqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HyPsodE6QAaKDtgJIc9QxauDNUkZzlbmvKbNhaarvmg=;
        fh=eiYO3knEcDqOR+As9raQUm1tNe08LVEr8f0t1PCi0pE=;
        b=Q+UyXkfHvLO0x4TMSdyeKyjKzDm2eI2gM98Dn3KBFGGY2Db1cu8YYjTsvrc8+wm8NO
         N880pa7UZK8MFKrvemeK4RdlW91RcU/K3rBhylhv9nbng6UVEKekverNaq+jyp1wppmG
         svB8AsXl38Utjf9I4fdPlyP+rmQoX57U3TC/sKZu0fUE2K/p7RyqU/omzcQonQyp43cq
         a+3FoSbFq2c11wGXtsd0iTti7XbcqEnd8Zpxgobk+SPywVvByzt31YHfWKkjjQtRFjxz
         LCIQSI9Wn4+ay6voX9R98YEM4K4/QoKRPqWpXq/LeZqvx5BtKZeTgojZgZE1W9hDA8Ln
         VkqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790173004; x=1790777804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HyPsodE6QAaKDtgJIc9QxauDNUkZzlbmvKbNhaarvmg=;
        b=OL4p5HRAdGRMuZdtfjOSOutJFHVuLpU0D8FWgYcm1+VY5p2AzX9J6KpGCPmhXrglAF
         5QO0Ki0KLhiUjYt1cmNcmRqc6AtIp2Agri86dMYWEFFHpdoO4nD9Gs4R6jAUZ0uaG/Ot
         hR/sZSNa5g4RoXfYdJa83dWFOPBbrQkKT4l0ac7Apv6IEBaH6XF3Im5RliYEXnAXRT9R
         vyZU/lvbD3j6o+v1SF83YWk3fOmcEMhYD6VWc28ibrdIElzW6GhzpDZoXU/v7W/74lyj
         TOQPflZQNw8BA/UmUq/lF6kDUF9s6lWQPDnz880363FTZgB/FUEWnvjb4ffjq3M8E16C
         HvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173004; x=1790777804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HyPsodE6QAaKDtgJIc9QxauDNUkZzlbmvKbNhaarvmg=;
        b=1GKuyHhvnnvG8TlRXmddeQ0tyulpPqvIHzB6uTKx1ecEtELGEfDerGU3pAweTWSnQA
         WxwRznxVXDNrsuS/bIJ3VjJECEG5k8xNraFnY/sSriOKySFvlnRgPClTnNZ6yr1NPbZX
         sOW/b+ZqdvUTi6BIbPGMIJehoh+7e/JfALO4DHyGUTPmkbw1mKAHcohgPRLMjKxfZqc3
         0MSmBPGBFXOoZ/wrpc0ZXA4NUilR57CtEw2HS02mFMp5DSj6QlGqu29L250r1mG2ME3D
         5DhIfcmsy6woLJ/+0zRw+Z9bzI5+l+rFHdj/MjssHNU1W7ZYAsom/A0sAnBbqv3RGsdo
         Xlkw==
X-Forwarded-Encrypted: i=1; AKwUvBxsTJ0FmGqeuG6Lhv5gLXGzsZ9jwQ+2PI8teW9y2YGFmNYlzNpsNRacEPYHgGCgTO+/KeT1EBYxjlUOhBo=@vger.kernel.org
X-Gm-Message-State: AFuF++kRJQP8fnBYUr0aoBa8XBwudMo5fnzbO3Vdznsue2rw72nQxLRK
	u+lDcKCH2KkGQiHo/YpkeCpMar34d1pG2FSggrGev8f/mmwjnDmfrgLxsKFpxgj4vgIp9kbwrFw
	VVp/J7YtNL7LtjQ1mXGTmvKlNTwgUCqfq2qJ+6oLyKg==
X-Gm-Gg: AYBFou23AV0jzW5SDqOYPw9dlTpnbHjCcmhQsjEUk7tDNDACQZ31TufysUOjX4VggCy
	DLwADmaj7yvZ7IHtRHUTte0Zzw3fP5bJ+Hkds3ZrIKRzC0jSmjqVOfl79WYKmC4E/caJcmXAjdx
	E1k5d16UoHBKpB+gc3TlVmABJps0Qx0kxMbxTKvmhCEmtItWDavk1z3TZ+7oKmmAJACjElt1s2k
	X6xbXYCnvhJaby+mBnMvp87oHehOQKy+8B9yMFsLtCd/KYsw8KlHsTPxPiIeVIYMsCWzMmfoHRd
	iN52NH7/1GePlF36mEvh4u2Rei/vm6voXwvd9zhehnJQgjhnbA3gvCv3l9KCfNrdTEk3ZqSpBdc
	XYxaDx8TA9vU3dEIRvHNXq+Vy0o3UeB0OkRaokpybjp1P203w+SJa48dqyU5DaCmeEzbYhG4PLU
	tSouT2LBA=
X-Received: by 2002:a05:6820:160c:b0:6c9:80d8:a208 with SMTP id
 006d021491bc7-6d2d2621218mr2667331eaf.69.1790173004100; Wed, 23 Sep 2026
 07:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-2-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-2-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Sep 2026 15:16:27 +0100
X-Gm-Features: AclHuK85j1iihFqHzwDk0it4LC2GOSDRVIxZLiQQ06VTey-4VmPaz28Or5uQf_U
Message-ID: <CAPY8ntBUtZ3zkJrekAuXamMH-M+4gcS9vEid3DFrLgrwg2jQmw@mail.gmail.com>
Subject: Re: [PATCH 02/10] media: i2c: ov9282: fix line time and exposure time calculation
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> ov9282_exposure_to_us() divided the line length by the pixel rate control=
,
> which is the MIPI rate and not the clock HTS is counted in.

It really shouldn't be. PIXEL_RATE is the pixel array and LINK_FREQ is
the MIPI rate. Many drivers do conflate the two.

However I did notice a couple of weeks back that pixel_rate is
incorrect for 8bit readout on ov9282 [1]. (It's correct for 10bit
readout).

<quote> Actually I see the problem. In the hardware the pixel rate for 8 bi=
t
is scaled by the change of PLL2 multiplier from 0x50 to 0x60 =3D x1.2.
The pixel rate control is scaled from /10 to /8 or x1.25. 1.2/1.25 =3D
0.96, so my 96% of speed would be spot on. The use of link frequency
in computing pixel rate is totally bogus as they are on independent
PLLs </quote>

If you correct OV9282_PIXEL_RATE_8BIT to being 192000000 (instead of
the current 200000000), does that solve your problem without
recomputing things?

  Dave

[1] https://lore.kernel.org/linux-media/CAPY8ntBaSHjztuSLTOtv9KYvEbmcbinSMJ=
78ZDg+0sZg-1fz3Q@mail.gmail.com/
The original reporter did come back to me and acknowledge he was using
the downstream Rockchip driver which is doing the wrong thing.

> The right
> clock is PLL2's system clock. With the PLL2 dividers left at their reset
> values the chain
>
> SYS_CLK =3D XVCLK  / pre_div0 / pre_div * loop_div / sys_pre_div / sys_di=
v
>         =3D    24  /    1     /    3    * loop_div /     4       /    2
>
> collapses to SYS_CLK =3D loop_div MHz.
>
> Fix this by introducing a new static function to calculate the current
> line time and use it in ov9282_exposure_to_us().
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 46 +++++++++++++++++++++++++++++++++++++---=
------
>  1 file changed, 37 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index c10b2e205834e..3f83a6cf338d8 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -10,10 +10,12 @@
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/math.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/time64.h>
>
>  #include <media/v4l2-cci.h>
>  #include <media/v4l2-ctrls.h>
> @@ -472,6 +474,41 @@ static inline struct ov9282 *to_ov9282(struct v4l2_s=
ubdev *subdev)
>         return container_of(subdev, struct ov9282, sd);
>  }
>
> +/**
> + * ov9282_line_time_ns() - Calculate duration of one sensor line.
> + * @ov9282: pointer to ov9282 device
> + *
> + * The line time and therefore OV9282_REG_TIMING_HTS and the strobe fram=
e span
> + * are counted in PLL2's system clock. We assume the PLL2 dividers are a=
t their
> + * reset values, so the formula reduces to SYS_CLK =3D loop_div MHz.
> + *
> + * Return: line time in nanoseconds.
> + */
> +static u32 ov9282_line_time_ns(struct ov9282 *ov9282)
> +{
> +       u32 hts =3D ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> +       u32 sclk_rate_mhz =3D ov9282->code =3D=3D MEDIA_BUS_FMT_Y10_1X10 =
?
> +               OV9282_PLL_CTRL_0D_RAW10 : OV9282_PLL_CTRL_0D_RAW8;
> +
> +       /*
> +        * OV9282_REG_TIMING_HTS counts 2-pixel units
> +        */
> +       return DIV_ROUND_CLOSEST(hts * (u32)NSEC_PER_USEC, 2 * sclk_rate_=
mhz);
> +}
> +
> +/**
> + * ov9282_exposure_to_us() - Convert an exposure register value to micro=
seconds
> + * @ov9282: pointer to ov9282 device
> + * @exposure: exposure register value to convert
> + *
> + * Return: microsecond represenation of the given exposure register valu=
e.
> + */
> +static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
> +{
> +       return div_u64((u64)exposure * ov9282_line_time_ns(ov9282),
> +                      NSEC_PER_USEC);
> +}
> +
>  /**
>   * ov9282_update_controls() - Update control ranges based on streaming m=
ode
>   * @ov9282: pointer to ov9282 device
> @@ -510,15 +547,6 @@ static int ov9282_update_controls(struct ov9282 *ov9=
282,
>                                         mode->vblank_max, 1, mode->vblank=
);
>  }
>
> -static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
> -{
> -       /* calculate exposure time in =C2=B5s */
> -       u32 frame_width =3D ov9282->cur_mode->width + ov9282->hblank_ctrl=
->val;
> -       u32 trow_us =3D frame_width / (ov9282->pixel_rate->val / 1000000U=
L);
> -
> -       return exposure * trow_us;
> -}
> -
>  /**
>   * ov9282_update_exp_gain() - Set updated exposure and gain
>   * @ov9282: pointer to ov9282 device
>
> --
> 2.53.0
>
>
