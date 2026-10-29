Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793285021;
	b=IPB6k7H/qNGRf3UG4S9JC9d+KuJlUMT54N2AifAxOIQkYcojpHXi0Rqh1I7zjbMgXgrd
	 FtUmRY755PGHfnEE+JCAuLQmxnD/pSbvm4iGyUPUf7ueR+xQTaacVHVls7NDOQ84nAFfp
	 s0k7AKXJ6IeZwd4RVkeCm8eg7eTLfeOqIVrkJ7g+X3CVFkiK4v/Wi/J13HZDIEEHUq/bx
	 8Y9Nre8rv3uFL57ymXUc5bP8xhjFJ13USq70zmEEEAcDZ4fXDIiPgwCU3JvYRvO8Ki7Dj
	 NY0eZ08O+igrjN1JS90vWF/zK9BsOBwGqFWwpdB4PKdqJ6iPRH5HaPhXo5sbQTHHzbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z145znUTSRyPKtFzUaXDyFLwmD4HnEY3Xx0IIr8udHg=;
	b=nGNnMKo1W9E9vS25hW7ZILCsBTWfsBENuSTAOq53FJeMoYkYBhuIe6B0jZKhO+IqSnu6
	 tJQ6hvR/Zk1RFkakikveDCbPDInuUGyCyWF4pmW8EWVYTC1OQnDrpxBS5Kax9vM3nrZ1R
	 LFxhbacscA6TIvql5iQ54/Z5qyTR10KLIbKRzPwaQMlrBa5ucayWwBo7AgEiRE92fb9A6
	 axf+GQcvx06OsSYF3qH+mor94i1z5R2LIYNVSdTqtD13Wghcnc7WNuToaG5pwgJIYHp3O
	 iWMMUE1Azng5vGTYbKXehWLchzDKRjElDeRWkZ7dTMYANqZyxkrmkMaTuQy7jcE8wwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=LGEsOJ3Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08082606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08082606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=LGEsOJ3Q
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-53a448f86e0so1419012b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793285019; cv=none;
        d=google.com; s=arc-20260327;
        b=CsET3k728ipV7/Npp2V5TYWZP6taV1SUNpXVk78zu/YfjTFMzE6RPPsyqzhQM6qDit
         oqjf4prMHGq6kazk+ygV+8yHUTMLKcaJBso2MZXXalLzOS2OX7tW9qfsJ2mDOCaOJVsz
         WaeO294WfC6c/4TTIs6tcsoz6NY8EYn7oc/37fmkpukNqXluZhgcENZ+dX1y0q6fjGcZ
         w/JuVG8zKR/x6LMRlpRTg4t1jM9v4sHhprr+sOvVddr8AWbAbVifPe4HSwmdz1Lk1G+q
         awetQYkwS7QS/2q+zZ6tbDqDBa14XEchAuJPHmHeemWyWO8xpG/UDDnLsMmAHuFkuoUE
         U9zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z145znUTSRyPKtFzUaXDyFLwmD4HnEY3Xx0IIr8udHg=;
        fh=X2WYEZ2Wg0uTkrCElqF6A3xOedMkIgx6iep/K1zTToM=;
        b=AAu3w45FsuRV2ECz0Y7mnd2paglVeKTFijp2e0TfHaRzBTyEqNZpWptWrgLyRXmOR1
         w9RTLyJvZumDZldJbSe0oA8Imvl+87DZxvkT2WXLYurN3pGwE7Ajm7W3GQujjfpoeTnu
         OogB66W9f4n1eB1S49EHk5eTbe7q9p9ga88F5WebypzPGArVI/j5ZoX7/uqSosjuy2bg
         sOZAyKzLPe+cxIQIdoleMKiIV+uOAKGUOgxqfDlspcnREAImJ4kJhUFwLLivcOg7ekUQ
         VkU4XfsCq147miasihjINYAX1NJVjVeJW0AzVB0iQgaQXKUYRzPTILBRMVomfgJ4Rqiu
         o2Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793285019; x=1793889819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z145znUTSRyPKtFzUaXDyFLwmD4HnEY3Xx0IIr8udHg=;
        b=LGEsOJ3QYduacOrB/GeiIi+kGiHmrU2C3iF7B1awE1Dxal4fLPMbrVAp2a4cqhHbxx
         Xjef6gflgHBeMfGxI+ZqH/fGiW2/JLFtbN3eH5AhqNtDtN3FWNE539F6uKXq1WX+QjId
         T420BEGt3MfUYC1T5Dyal3j6uqFetxosTOYAbTHyJpDZVWtW+pC9phgVaH/xNEcPhpYP
         Re+V3KI0CiQWZ6ZnvsA1LnNL82fpeTK8EN1dj+wfdiuX6S+Zh8GHua7/Yoe8FTZoEJgL
         ic23LAiArCbcF2OGAR61ZMazg864Uy46AWwsA6BhFi39En3yWkJyj7NLVY/NHU+cx62c
         rSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285019; x=1793889819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z145znUTSRyPKtFzUaXDyFLwmD4HnEY3Xx0IIr8udHg=;
        b=OLY3DKF07Xn4UqLBhN7fctFxtdD/6VF3s/DC/y2WSP8QLlycdHv11LzQc6+qxg1/6T
         ppfRckab/DR1myMWzTB/F5TjQ5eMRf3FHNRH6vZ2wk6lplTq2aFsdQ+bCYE1o6YR1q6u
         UGym8yasniAnwRi8hhoMzrrbW5Z62rmzZ2vgBbZ56e7uScOK7pc44eXfzxvbc1rht0oE
         sCpI+IAwwl2LYZlyjj9dER7S6SNR6oUuvfErmyy7+l2hhx3xU7S5heeIBOCjXAmzNyuP
         tJ2sZNgDenMwEIQS937Fz70y+GtKBAfUIJlb1VefjGELmmKew5+VGHhEGR/zjJ6sXMB2
         e8nQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXL8s/vxSS6VYY21UPzOH8Qivit4JwgGx9ol3/Svm1kl7YpDxKRInyBMhXiEsSI+lLxNQjMFkOGaKfsiw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+exwsB+HJ4dT52jctZv1elJAXmUB9Po8BCr4neUuBOG00lPLW
	yF//z0iNRw638vsjqmuDP6Gbx/4p/xGbyjLUcTmOelTW/x1BApo5lKEK3oSH5cc+qIXFr6xpDca
	DBENxEA+FRLCfFhMbkCxrcD//tvhbfiApmq/dYpz6AA==
X-Gm-Gg: AYBFou0dN+G2ynaHsRI25c1q/2pNAUsMvGFEkuG9aoJcZXPvPyjZ6ZhKcEkRZaCiplY
	sxGGzJQkyUZXhXL3hvvKN0cAwO5CY+D38UIpaAvd88nkokNuXs+AyjzACA6+xqByPn58b24K85/
	/tgBgWVI/SbFw43yWzvg1lkuAJkj6RMGZxcZaxa838TfynO0dJajFpZRgXlRyVWI39Z82nnjG+9
	cMEJfEfNAxHO9Sw02IrgwCW1v2Xj8vrIYtr0Ge2YEAfak3a0jQC7Eq7XhtCDrexDMYpIs4wNvQx
	oHj+kAO243wMIEyJoApr9f2trgKCTMr1gy4JIywJHE7fUgA8/rZHcKBGEktIgwRjW+UU1TkL/T/
	nyLGRkrgs40RR1LEcfq/oQyvOtTIP5LWNlmN8AMLZVDr/yEqURj81dWqcmV7FKp7ArNbjhdjZnN
	oh9e+TFoceOdwvpDPL8f4WfNQbQ4Wx8Au78aNQzCv8mcPUZXrLgkPxhg==
X-Received: by 2002:a05:6808:16a8:b0:4c1:5614:acab with SMTP id
 5614622812f47-56382d81203mr3829523b6e.37.1793285018819; Thu, 29 Oct 2026
 07:43:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-ov9282-fixes-v2-0-3bb376d8b1a9@linux.dev> <20261014-ov9282-fixes-v2-3-3bb376d8b1a9@linux.dev>
In-Reply-To: <20261014-ov9282-fixes-v2-3-3bb376d8b1a9@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:43:22 +0000
X-Gm-Features: AclHuK8HEINmU3r1FVIqsPNHE0UWIKCBJ0QrPdQvofVLfeWv7-01NAJbHLdiNlE
Message-ID: <CAPY8ntCP80YX7mkOVhjXhOSaZ_EFW-JKP=GBjrQYu1ciBQusew@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] media: i2c: ov9282: fix flash duration to/from
 microseconds conversion
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
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Oct 2026 at 07:49, Richard Leitner <richard.leitner@linux.dev> w=
rote:
>
> Currently the flash duration is converted to/from microseconds using a
> fixed OV9282_STROBE_SPAN_FACTOR constant. This is inaccurate as it was
> found that the "step width of shift and span" (which is not documented
> further in the datasheet) scales with the line, so the span is counted
> in lines. This was verified by comparing the stobe pulses measured on
> the camera module against the calculated line times.
>
> As this is the same conversion as for the exposure: rename those function=
s
> to a more generic ov9282_us_to_lines/ov9282_lines_to_us and use them also
> for the flash/strobe duration.
>
> Fixes: b95d8058a2786 ("media: i2c: ov9282: implement try_ctrl for strobe_=
duration")
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 65 +++++++++++++++++-----------------------=
------
>  1 file changed, 24 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 5907f57b34523..e2a1f875160b9 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -136,8 +136,6 @@
>  #define OV9282_REG_MIN         0x00
>  #define OV9282_REG_MAX         0xfffff
>
> -#define OV9282_STROBE_SPAN_FACTOR      192
> -
>  static const char * const ov9282_supply_names[] =3D {
>         "avdd",         /* Analog power */
>         "dovdd",        /* Digital I/O power */
> @@ -491,18 +489,31 @@ static u32 ov9282_line_time_ns(struct ov9282 *ov928=
2)
>  }
>
>  /**
> - * ov9282_exposure_to_us() - Convert an exposure register value to micro=
seconds
> + * ov9282_lines_to_us() - Convert a number of lines to microseconds
>   * @ov9282: pointer to ov9282 device
> - * @exposure: exposure register value to convert
> + * @lines: line count to convert
>   *
> - * Return: microsecond representation of the given exposure register val=
ue.
> + * Return: microsecond representation of the given line count.
>   */
> -static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
> +static u32 ov9282_lines_to_us(struct ov9282 *ov9282, u32 lines)
>  {
> -       return div_u64((u64)exposure * ov9282_line_time_ns(ov9282),
> +       return div_u64((u64)lines * ov9282_line_time_ns(ov9282),
>                        NSEC_PER_USEC);
>  }
>
> +/**
> + * ov9282_us_to_lines() - Convert =C2=B5s to line count
> + * @ov9282: pointer to ov9282 device
> + * @duration: microseconds value to convert
> + *
> + * Return: number of lines fitting into the given duration
> + */
> +static u32 ov9282_us_to_lines(struct ov9282 *ov9282, u32 duration)
> +{
> +       return DIV_ROUND_UP((u64)duration * NSEC_PER_USEC,
> +                           ov9282_line_time_ns(ov9282));
> +}
> +
>  /**
>   * ov9282_update_controls() - Update control ranges based on streaming m=
ode
>   * @ov9282: pointer to ov9282 device
> @@ -551,7 +562,7 @@ static int ov9282_update_controls(struct ov9282 *ov92=
82,
>   */
>  static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u=
32 gain)
>  {
> -       u32 exposure_us =3D ov9282_exposure_to_us(ov9282, exposure);
> +       u32 exposure_us =3D ov9282_lines_to_us(ov9282, exposure);
>         int ret, ret_hold;
>
>         dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
> @@ -579,34 +590,6 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9=
282, u32 exposure, u32 gain)
>         return ret ? ret : ret_hold;
>  }
>
> -static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
> -{
> -       /*
> -        * Calculate "strobe_frame_span" increments from a given value (=
=C2=B5s).
> -        * This is quite tricky as "The step width of shift and span is
> -        * programmable under system clock domain.", but it's not documen=
ted
> -        * how to program this step width (at least in the datasheet avai=
lable
> -        * to the author at time of writing).
> -        * The formula below is interpolated from different modes/framera=
tes
> -        * and should work quite well for most settings.
> -        */
> -       u32 frame_width =3D ov9282->cur_mode->width + ov9282->hblank_ctrl=
->val;
> -
> -       return value * OV9282_STROBE_SPAN_FACTOR / frame_width;
> -}
> -
> -static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> -{
> -       /*
> -        * Calculate back to microseconds from "strobe_frame_span" increm=
ents.
> -        * As the calculation in ov9282_us_to_flash_duration uses an inte=
ger
> -        * divison round up here.
> -        */
> -       u32 frame_width =3D ov9282->cur_mode->width + ov9282->hblank_ctrl=
->val;
> -
> -       return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTO=
R);
> -}
> -
>  static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct ov9282 *ov9282 =3D
> @@ -672,7 +655,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         case V4L2_CID_FLASH_DURATION:
>                 ret =3D cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME=
_SPAN,
> -                               ov9282_us_to_flash_duration(ov9282, ctrl-=
>val), NULL);
> +                               ov9282_us_to_lines(ov9282, ctrl->val), NU=
LL);
>                 break;
>         default:
>                 dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> @@ -691,11 +674,11 @@ static int ov9282_try_ctrl(struct v4l2_ctrl *ctrl)
>
>         if (ctrl->id =3D=3D V4L2_CID_FLASH_DURATION) {
>                 u32 us =3D ctrl->val;
> -               u32 fd =3D ov9282_us_to_flash_duration(ov9282, us);
> +               u32 fd =3D ov9282_us_to_lines(ov9282, us);
>
>                 /* get nearest strobe_duration value */
> -               u32 us0 =3D ov9282_flash_duration_to_us(ov9282, fd);
> -               u32 us1 =3D ov9282_flash_duration_to_us(ov9282, fd + 1);
> +               u32 us0 =3D ov9282_lines_to_us(ov9282, fd);
> +               u32 us1 =3D ov9282_lines_to_us(ov9282, fd + 1);
>
>                 if (abs(us1 - us) < abs(us - us0))
>                         ctrl->val =3D us1;
> @@ -1277,7 +1260,7 @@ static int ov9282_init_controls(struct ov9282 *ov92=
82)
>         v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
>                           V4L2_CID_FLASH_STROBE_OE, 0, 1, 1, 0);
>
> -       exposure_us =3D ov9282_exposure_to_us(ov9282, OV9282_EXPOSURE_DEF=
AULT);
> +       exposure_us =3D ov9282_lines_to_us(ov9282, OV9282_EXPOSURE_DEFAUL=
T);
>         ov9282->flash_duration =3D
>                 v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
>                                   V4L2_CID_FLASH_DURATION, 0, exposure_us=
, 1,
>
> --
> 2.53.0
>
>
