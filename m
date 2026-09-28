Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9FD49D5BC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593652; cv=pass; b=aTnnEC+dc1Db+kZM80tg9UAGxu6zlxs90POuGKAJFz3V/3qwkH7vbH6gDzwQD6rsBWj+ky0ZuXMOHb9jSgKrCRvvRRWrsqGt03D2smOTHEpQhTsveKtG2WpzbII/UNjJOfxgljoy0M0EqlbLGqgG4ltZwXOmuji1jc5Fo70X+78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593652; c=relaxed/simple;
	bh=SfAnFz5JOmRc/oUFq/CdplF5E+SFaJU0kO2gyOAb214=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3E14taBY9ZcGYOT0o++T7Nif1NPqf6Mii7Q4K20kIlAbl5saBcJQwZMTXwq6VZsvqohYKG0myTMxqfCditAF/Ya2L2OimBCJy/2HqLEaJlUmpkJ7A9R2V/Z+pvc6nH4Ls18V1XT3KhGDUA/285i8MjyAhTZIaFLgeLTiw6iXM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=iMGbybvm; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="iMGbybvm"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4678d3e490bso2730029fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790593649; cv=none;
        d=google.com; s=arc-20260327;
        b=ZSgk/5ujthqVSe85+tiCOU1qoZ3PN3nUGXQwFB3O/zJ2WT4crBd534LWlq4aRCfrtJ
         nrRlsOCwP8gs07rul2y4mHL8+ao68pe2JzrRT55EcVvnbjurl05TrOU/aaukNhIUvUd/
         /cFNwHgcElf0BtOUedFR7gfvokDHZEyJ6J+2HDLzZ6BSvqds/aX/NAi7RJPf5Agb2cAD
         VNUIllU4UH6pPOj4KQdShUyE0NRZzuDb+CrtCqSUxyaCV1oM07Mtn2GHw1D6KAAaFm/A
         RjJ9Cscz+iq+tGOQjWw8FJPU0rxMIm/bnzTlYF+Hx/03AtSa8sTpI6U8g4mQtIEoA6SL
         46Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sIpyHcifBhbNKOevvGAhBQ1aKd6xNGYYy1X2lYwtlRg=;
        fh=0j5Hb1mEPZ445zGkRwI1OYxJgi3/bQ5QX+8qCr8nMU0=;
        b=YiyC+X1IdnCbvu190yUJ42qwcGu9vaGooGU9ZUnsGerAnvutVr57tsE0n3V9Gdgi4x
         ZhOZbhRhuvrN84DFLV3K3TkzPjkbZ6535gNu1gsJ9pwgjUYGTEJkxPec+Tlr8OviH8pT
         M/pX4d9r5wKFiAsS/L8xti0l1VIhsHF6odguF5RAWJYhzm/sAHrIQKMSwAiWj2wqZZ9C
         k6DFQ0bJJQARM+ZKTgJGhoQ0Pzxxd8xdAOrewj6mkBWRMThVq+YtSytgVTCsXovfZEiT
         RQDCphyembeh3SCDDAG5xQWLls/b5ZImxVw6llUFn/27kMG9/HIIjpXmdzY+AIOURHul
         eT+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790593649; x=1791198449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sIpyHcifBhbNKOevvGAhBQ1aKd6xNGYYy1X2lYwtlRg=;
        b=iMGbybvmG/zCTdDDjgRWIen34GuYdiQcg5ue0WEwvSr8WfK6dzmcVE8ZU1AetostU4
         SeTbvJYlZOXP3jQtZL2Z2jWpffRkimE+IWqvjFBvn1cL6C853w0z19bRYR0vuTRarp9E
         XrHtboMC+casl0h2uknCE5r9Zxl4aymn9S9b5jFaNp1ZRyEXspd7xmv+bE4wnUxmT2b8
         W3z/K62a6I4TwrlOQorht4SPemN7+zvvvwprYyjq4AAKZqq5h1gf8EyrTeczjHV+WvTz
         VBHol0VvgphEfNbM0vY0eRF2Iun6D4kXHBm1fBz+Rb4ahWrCuf9kZhEVZFxw96a0AtJ+
         Lg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593649; x=1791198449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIpyHcifBhbNKOevvGAhBQ1aKd6xNGYYy1X2lYwtlRg=;
        b=hXPAHhlNNYFDs8wHX2bh5HAVrNquS0VHbjN1XrqtF9AGT4NoqxETPVmE1ZdD2/5tjh
         P2EMJVdUcMXeFDNTDmEZCQgo8u23wFPBs6kDReZLOJwF84okHhduUYwReytd1lJ1MQsm
         zZvZbg0nJvRMpThtDNQiKjH/H+fUpTuLiwyM+t5Iy7KLgerOkzbscmisYqUslxAxbFN3
         ARfVhPpvHOIzqbGkUOvso4Iggwi0oWyEx2NpbSvlN0z2FTSa6dQNshu02oDss4jiruXT
         SP0lIN+/mTKhEMOrYjlnN9JZq50kjWjnbnHhGny9gIWr2gdBV5xkVqA1jT4Mi/Cj53q+
         1a8g==
X-Forwarded-Encrypted: i=1; AKwUvBzZAeiu2zbRmrUyJpoYHaUMtsuY25AYpSy+q53grbSuYgKHmfBrkW7/4udj9rR6Vs9lHDtKN3cmaOaZWnM=@vger.kernel.org
X-Gm-Message-State: AFuF++m6OgWf6wA/h2rhQoxhRGBl87TO27GM6YbAKkISl3Sb3lhubxF/
	4pgo6hDJupjDFg+gevPz8AznPHZiJgn3MiNt6seU+LQ86PfvIvVHCpeixcDxFDJ0dQHoV5gI0ah
	si9POYe2DCH5giE2F7vQHdBgiCRfzAut0dZBnvWgIFQ==
X-Gm-Gg: AYBFou28NxFBFnVN1lzhZ5rDyE6zlbkzdOU5iz+uXjiEknOXFOHdM1BAvyhNDhCu9IT
	C1KWYTwtNBX9SXCLm/suKjH8RpiNE0/a6ahmBR3B5itDqB4lYo1mp2b+n7UwRr30xqXG6frnemZ
	U7+8BhXIoEVrI6kEMes+eYO+GJ0Z5You6xULRHJcAc4H2YSfC3Fnn/DbaM6grKjXFiotYAHJrHv
	B2esp0WACKwfiVT8UiqnVs78D95fJ38Ll+LjU1tXcKje5Y3q0yY5+SJw40jLBKESjUlptjAHFTg
	I4TOEEbfTVH6UMHUDYiDgtF+yIHWpsndDSyDGE/XsWHCUREW+eaTZj2rYydU0K7Um0gQHE+qkUv
	JhuklvDwPmdfJZTPnzbqsZtMIByEc4zzzCIYSayhVKeDcUzzHKoPEBkmAY7k6BvRKG89CGLEK
X-Received: by 2002:a05:6870:d288:b0:470:e97e:8f7f with SMTP id
 586e51a60fabf-491e98625bemr9701368fac.15.1790593649534; Mon, 28 Sep 2026
 04:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-3-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-3-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Sep 2026 12:07:13 +0100
X-Gm-Features: AclHuK_UqKRjeowcIuqYWdTMhpiwhU89uBcQw44CeEXOA6E1zfE3LpwIwTiHb-g
Message-ID: <CAPY8ntBrN-GHT6+Nd+wu6Np2CEbsT5PGG-RjVcB2H3+8wSNoKg@mail.gmail.com>
Subject: Re: [PATCH 03/10] media: i2c: ov9282: fix flash duration to/from
 microseconds conversion
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
> Currently the flash duration is converted to/from microseconds using a
> fixed OV9282_STROBE_SPAN_FACTOR constant. This is inaccurate as it was
> found that the "step width of shift and span" (which is not documented
> further in the datasheet) scales with the line, so the span is counted
> in lines.
>
> Fix the conversion by dropping the constant factor and using the
> previously introduced ov9282_line_time_ns() helper instead.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 66 +++++++++++++++++++++++++---------------=
------
>  1 file changed, 36 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 3f83a6cf338d8..90a0fe542ce4a 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -133,8 +133,6 @@
>  #define OV9282_REG_MIN         0x00
>  #define OV9282_REG_MAX         0xfffff
>
> -#define OV9282_STROBE_SPAN_FACTOR      192
> -

I'd been scratching my head over this one of where this magic number
had come from previously. I've now just clocked that it's the
(corrected) 8bit pixel rate.
Using the updated version of ov9282_line_time_ns we've discussed in
2/10, this should therefore give the correct numbers.

I'll hold off on giving an R-b until I can see it in-situ with the
other updates, but it looks like it should be correct.

  Dave

>  static const char * const ov9282_supply_names[] =3D {
>         "avdd",         /* Analog power */
>         "dovdd",        /* Digital I/O power */
> @@ -509,6 +507,42 @@ static u32 ov9282_exposure_to_us(struct ov9282 *ov92=
82, u32 exposure)
>                        NSEC_PER_USEC);
>  }
>
> +/**
> + * ov9282_us_to_flash_duration() - Convert =C2=B5s to flash duration reg=
ister value
> + * @ov9282: pointer to ov9282 device
> + * @value: microseconds value to convert
> + *
> + * Calculate "strobe_frame_span" increments from a given value (=C2=B5s)=
. According
> + * to the datasheet "The step width of shift and span is programmable un=
der
> + * system clock domain.", but this is not documented further. Nonetheles=
s the
> + * step width was found empirically to scale with the line length, so th=
e span
> + * is counted in lines.
> + *
> + * Return: flash duration register value
> + */
> +static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
> +{
> +       return div_u64((u64)value * NSEC_PER_USEC, ov9282_line_time_ns(ov=
9282));
> +}
> +
> +/**
> + * ov9282_flash_duration_to_us() - Convert flash duration register value=
 to =C2=B5s
> + * @ov9282: pointer to ov9282 device
> + * @value: flash duration register value to convert
> + *
> + * Convert a given "strobe_frame_span" increment value to microseconds. =
For an
> + * explanation regarding conversion factor see the documentation of
> + * ov9282_us_to_flash_duration. As the calculation there uses an integer
> + * division round up here.
> + *
> + * Return: microseconds
> + */
> +static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> +{
> +       return DIV_ROUND_UP_ULL((u64)value * ov9282_line_time_ns(ov9282),
> +                               NSEC_PER_USEC);
> +}
> +
>  /**
>   * ov9282_update_controls() - Update control ranges based on streaming m=
ode
>   * @ov9282: pointer to ov9282 device
> @@ -585,34 +619,6 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9=
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
>
> --
> 2.53.0
>
>
