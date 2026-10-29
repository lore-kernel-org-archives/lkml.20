Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284850;
	b=WxBTeCUWmnS6pbWS8BKlru9q3C5LKdFW6EZAyFqW3v7r6g8u/2JLK2KinW+dA349qd5n
	 quh9iKcHdXx6RymN3hlLgzNg3slUuwQWAJMhEpN24YZo4FxeLmLB7Cx4sjdWcy81HHfqP
	 +cE65c7W6uzNlOCPyMqwd6XNCoZjiNskgOmplbyoewUHqIfBPCbOuVR9ldYXz1FuZ5To+
	 b6pnfqDxlUL4SFpslaRnyzXQroTAPhHQSPPYfk3T+4VU14ULfe7VRUIRI6U39SdhHZz3L
	 i+10nTPtX3TiZzBALFcXMOE7dMYsnFRhFpWr6fiz3mkzUG2aZ7VB1lxWKV53QuUR6QA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UpLR92yvazEzYcMkjgQMdu/DL7UIZCfUmYSsebhADbI=;
	b=TekhfvP69ofG0b4j1308UlBwcE9fWaUDZVsrl0R20pD2WWEUMIZuTwMNWFgE6d2v+d/5
	 0SuZEvrXOXFj6P9KhIZOAAejyr+0ICSpbq737T1Am6LqhEBh76ZabNBBkD7xHtr9UaXIe
	 KDDx4gMmV5VNzdassgZYPQnFR9FfNNZU+wtoKhGkw0B/xDTQho4VqZV4XsA6CnTO6Jwut
	 QduM2cobk87yeyQqo3YlZjBsIM9ktUa5ArVuOUdAR01ZOT1et2/gPgWhCzc2pCxoKGiSa
	 vrLHVY+Gwjphxu0q2IiclBMx/7BKxdfOmZ2xG8hGaIHvEHwSlrSacrNiryvYOC4pxFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8BA606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C8BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-48ed188ee81so1091432fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284843; cv=none;
        d=google.com; s=arc-20260327;
        b=jtU1BuWgLXXk6UgmNXmlT/KnCx8r6CgFzXWCO8lvaEAM5ckL0/B0V99sbnu9d8X0dX
         MzrgCnIYfyxO6Hz9IudK2Tj6wXbdh67klL4ugjX5OZBSORfOnMe1ajkSgo5lt02XCI88
         r+aJb85a18GT/4t/9hkO3zyfH2q+/uzoxFSajUxCa25Iznc64vKC+crHMyOp2xb+sRTI
         Q4hvHX9yKVaooma/UU2iLEHGvMWlwCRNPxp6jywC56PsGu7rIXHC/YlCefRHSrDcnZbR
         PEFPAqbh70noSg2sCvHDAQEkaVeW9HaQa7SFSRDSmzOtRsWAI67DJ7QntQaElEm7F6iM
         7Mag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UpLR92yvazEzYcMkjgQMdu/DL7UIZCfUmYSsebhADbI=;
        fh=3fHhF43sQth/UQKynd4buR+YPWCC8O8UiR43XvcdkgU=;
        b=rnZnPV/E27WH5ilVCAl4brnUjGOl8/RqhhbkPg0O84xjBD5dF4a0Chb2ICMokleHiC
         AzP2jy1z8310yMssDLWYghsbnhOGyYJjpzV340S0jCVEL1SZUZFNPGAVH2j36EG/Jg9r
         mvR5ywrPjvtAxlz/25I7/1qOJndVrUlg35SCaoBP+raY24bNv31QjoVpbC/s/xYbhiR1
         fOlgDUFP11SysxlajO6JyuvQYAZ3b1wx/PVHQGEcwGl+a4lIvAq5GLAY7YSYR90Kji5i
         w09MGPbLE+0jCFrG6OjOkQRrEtQcCz+Rqag8myGgD+SAsiquOLz2h9gt6TCea3Pv+qm8
         KKsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793284843; x=1793889643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UpLR92yvazEzYcMkjgQMdu/DL7UIZCfUmYSsebhADbI=;
        b=Xb/1Iab+QgqcujhXdJyn6dLqo8XyrBoDPSjoAB0wuGBJ/YQNDYb8yzKZrbJaDUkzP1
         kg49UF4YKogpBfbzxaKgDYeSkhMxcaLWNfNSnD3SU2PnUuEjhHHvt3PzUKyMb9dHmfTQ
         ktQBOMnFeutICvOi6pY2MY3RIwvyW5i0TjbbqNQtRM3uHxnx3pGglwVg5kkOFvUrEd5H
         w7E+nq/sMVn+AqJ+J5wIEi8wEkJtLNa9Dys9Goflj6y8AC30dOnm1UtoXSxVwsmrs9Fa
         o7LSPlCveVaLcbgfv3a9B7zGkBaIdRvz5xj4mNqiHjCBJzAjV5j3UV/pfqDJoTA6v3qn
         HFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284843; x=1793889643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpLR92yvazEzYcMkjgQMdu/DL7UIZCfUmYSsebhADbI=;
        b=sjQJA2FFcosW7jqehQVrESS44aXvmMx86chryZywgfp2VtPPMusq1Kq9GnUWZ7clDM
         VvN+erd+kgX7skn4G/P2mBPplpCtR55F5BBg1sf0lkrcf81wlKf6nF0FNEIYSG/J6b65
         g8V+Wk8yqHPkmbSR4fYRhmZqu7hOkbC7iqvBJWpM96SLTwS5pbJX6Wv/0mWOc6+d8OLF
         BPcJy2BChGG/jPa7D41zM2rQddL9RZO0b7XIl7fvYWOd4YwDELUj6+JNj7+1o2Dm5pdO
         JggGCx6FDwU1LIppwsvwOts1ngQydkJ0Jp65ji+BBZGWa4jEIECAOLD1pxKLnvnijbJo
         FhVg==
X-Forwarded-Encrypted: i=1; AKwUvBxG7kTwfFbhkCB5+yCfLUFnnLHrr/BetXcy/hg78up1qwWp1AvBtNcf3hHT4Y94WrhpbPmmmsRI/63pck0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrCLucw8qrGcnRqzwvJkpr0+943p77QJ2jT6Z+Uk2Uyvkea7Ks
	fBAtZW15Fh2TbfzsJs8niBa2IBz0oDgZZK+y05rillSSuD8Wc5U6XQbRo9doDf3Ir/T3ADRjmW5
	GD1PRenYYDHFFmZHt6x3SZvJzaVs4aPJs3OzWerJmQg==
X-Gm-Gg: AYBFou10pmg/KNraErBFlfXaJPu74llAeAWf7NcJ9MguJ6q4W857Om77xM7mppc7qgX
	/amq3aJSmb/sdZk5K3oq3/vVDMLCEgvUuS6PBVCPzfGzipwQFK6fJ9o6nvvBtPCKRDrPKZM4+Gq
	bVqK6zM040vgy5x83q5VMxIWS1oHGQgVG8ckSGAV+kj9CqBZvnA9IN+qZWZ8WG44SzrObROkOzX
	htO4g8ZxiNDWO3IsYbjr956GacJG0V+ACOAlXh0zGDeeFEfWg4IV83cKTo6iSnRH5E72pCeBjZ9
	DXXMoU8cLLwmHkwG30ICb375LB2q7hJtm+2/E/UtYKm/zxEGATh4ICEvCJ69Va3ubGBCBp2WRT3
	qpwk40ZWqdmhNyur/MD6T/KGLp3dL1rxZMTOSsEDaBKScSYPQ0wCF+Vkh0Bx7CHqsmF8EBoEQg5
	PZh/KJEK6DN/bBPMA2Ru9etMIj0sDhagWeuxFaGb0b22q5p/wPw4B9rzIu6svN2SQMibfwuIfTa
	rM=
X-Received: by 2002:a05:6870:1408:b0:4a8:5c86:20bd with SMTP id
 586e51a60fabf-4a8bb5a3fe0mr4334153fac.14.1793284843148; Thu, 29 Oct 2026
 07:40:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-ov9282-fixes-v2-0-3bb376d8b1a9@linux.dev> <20261014-ov9282-fixes-v2-2-3bb376d8b1a9@linux.dev>
In-Reply-To: <20261014-ov9282-fixes-v2-2-3bb376d8b1a9@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:40:26 +0000
X-Gm-Features: AclHuK9aWEHtDyHMrF09cYcyP1s_VnFKtV14syxMLcpu9Ygt6KIgxBSI2jLY9YI
Message-ID: <CAPY8ntCKPLt9zfBRemqG=nuwUBB2gcO7bO_4Zk6TfwB0nzP=tQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] media: i2c: ov9282: fix pixel rate and line time calculation
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
> The OV9282_PIXEL_RATE_8BIT is calculated incorrectly from the
> OV9282_LINK_FREQ. The hardware scales the pixel rate by changing the
> multiplier from 0x50 (for 10 bit) to 0x60 (for 8 bit). Resulting in a
> x1.2 factor.
>
> The current OV9282_PIXEL_RATE_8BIT calculation scales from /10
> (for 10 bit) to /8 (for 8 bit). This results in a x1.25 factor.
>
> As all the inputs to the pixel rate calculation are constant in this
> driver also define the OV9282_PIXEL_RATE_{8,10}BIT as constants.
> Additionally introduce a new function to calculate the current
> line time in nanoseconds and use it in ov9282_exposure_to_us().
>
> Kudos to Dave Stevenson for pointing me into the right direction!
>
> Link: https://lore.kernel.org/linux-media/CAPY8ntBaSHjztuSLTOtv9KYvEbmcbi=
nSMJ78ZDg+0sZg-1fz3Q@mail.gmail.com/
> Fixes: df60764ea5210 ("media: i2c: ov9282: dynamic flash_duration maximum=
")
> Fixes: 43ac0cac18f41 ("media: i2c: ov9282: Add support for 8bit readout")
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 50 +++++++++++++++++++++++++++++++++-------=
------
>  1 file changed, 36 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index c10b2e205834e..5907f57b34523 100644
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
> @@ -111,11 +113,14 @@
>  #define OV9282_LINK_FREQ       400000000
>  #define OV9282_NUM_DATA_LANES  2
>
> -/* Pixel rate */
> -#define OV9282_PIXEL_RATE_10BIT                (OV9282_LINK_FREQ * 2 * \
> -                                        OV9282_NUM_DATA_LANES / 10)
> -#define OV9282_PIXEL_RATE_8BIT         (OV9282_LINK_FREQ * 2 * \
> -                                        OV9282_NUM_DATA_LANES / 8)
> +/*
> + * Pixel rate: Derived from the PLL2 clock tree.
> + * For 10 bit it's exactly the same as the sample PLL configuration.
> + * For 8 bit the PLL2 multiplier (REG_PLL_CTRL_0D) is changed 0x50 -> 0x=
60,
> + * which results in x1.2 and therefore 160 MHz x 1.2 =3D 192 MHz.
> + */
> +#define OV9282_PIXEL_RATE_10BIT        160000000
> +#define OV9282_PIXEL_RATE_8BIT 192000000
>
>  /*
>   * OV9282 native and active pixel array size.
> @@ -472,6 +477,32 @@ static inline struct ov9282 *to_ov9282(struct v4l2_s=
ubdev *subdev)
>         return container_of(subdev, struct ov9282, sd);
>  }
>
> +/**
> + * ov9282_line_time_ns() - Calculate duration of one sensor line.
> + * @ov9282: pointer to ov9282 device
> + *
> + * Return: line time in nanoseconds.
> + */
> +static u32 ov9282_line_time_ns(struct ov9282 *ov9282)
> +{
> +       u64 hts =3D ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> +
> +       return div_u64(hts * NSEC_PER_SEC, *ov9282->pixel_rate->p_cur.p_s=
64);
> +}
> +
> +/**
> + * ov9282_exposure_to_us() - Convert an exposure register value to micro=
seconds
> + * @ov9282: pointer to ov9282 device
> + * @exposure: exposure register value to convert
> + *
> + * Return: microsecond representation of the given exposure register val=
ue.
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
> @@ -510,15 +541,6 @@ static int ov9282_update_controls(struct ov9282 *ov9=
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
