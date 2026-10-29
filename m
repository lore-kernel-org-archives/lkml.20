Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286632;
	b=w/NJQlCUgSglZNhmLI+c7PRRRukJ4vOMcppL+14ezXN56Lz+SQzCuuJGWY0TZ0LEy4vE
	 c2lBlVmmvSpg8J0xeN4H/bTm/G5/okWKQQRHmIdx5HbV62ff1jSFYlPfj9u8gyc5Xmv5Y
	 FhY2R29SAHGLe9gyiWb5nPofcEnLg4nfwmeImfzvSW+CTKMrjOiBc8XNBOIuuOtRLOhIO
	 KWQOQ+1I78cVcf4769bXRO8dMFcjPO87273fDXbutA1lSbtUBLDWwMBs3Ze6rZWul1NqL
	 1RUeKLxJYwNJDhzyED4vdcgNsOiofeBsaxsoN8qursqYT90s6oxwvxsruwX35de0Y5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=2b3vVP1vEHIm/JW4JfzuulbZR3cusd4/fTQxKoNUz94=;
	b=mgR4ukJl+WrZ4dlXIBs7X3A4L15DKnf0cMI3OAZuT34uLtJY/tBU97WdWv6wxhAEIEku
	 RNQxo7xLoAG0SxEjg1GMwljWXtvKo2KK60ZwUVKew4g75JL9FTfMYZWqkoDMGpn0ivED9
	 uAFvdC4HWoIThvFGWYlimLIuHQ4gY7D0Zcu8WoYEODBZKcVBa78trq6+hmRno86l+l/YO
	 VI8fT8/AecQCumK3+ZQYQE/2TjKPuPBpJd+cMO0h5mmC9ZIn253tUdiwk7i4zQNDg+b4P
	 wjoe38TCzfNQ4xB4Nv16O52UmtPkVr4HZ1iU0TzsuAmLLY43PaOT44DSsDvBvNKFJWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=t0HEKi3J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD75606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=t0HEKi3J
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4a76f63b243so770950fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793286625; cv=none;
        d=google.com; s=arc-20260327;
        b=Ny1F6niG+WzTZkXS6YaruO05KisDtBBnddKaCRse36KHtqd2AVcMuUilwdgLIY6ftY
         7NpTxTOb18INj4jGMWyOtc20Gqm9TKGn7z+wq62ektb19zQfZTTqxXfxw1HDNUrWF6Z2
         kmaW4C3LsxhUEkzXKC66zXK/W6ufbXNne47dvQBerxkOT606irNTHjfPXFezY30ay8An
         V8bEgtTpozcqriEQ8cvNQTF0tA3pRxBqCbAVZ3Xu8rsI+iPXhltaEh3Yt/A2zxC5Hjva
         W6f7PZJUPrbgljqiUbpXtdnJi2JXOiOinUq5Q4uhib1cdN3wPp5cIPUlJO9z5glhWIom
         Gi8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2b3vVP1vEHIm/JW4JfzuulbZR3cusd4/fTQxKoNUz94=;
        fh=ct6wuZfxEhYDnsqyMSsGfIMwGrfsyElx25GjJl5MoAE=;
        b=l2L5T0UGU0Hxw1AV37EEZ8B9VByRoAP18tIhQsIwD0/4jKNkvJDhx5ftsPtC84NKzP
         sbtcGIZPC/G1IjLM3rgwQqhwdxOrUSwfHv4bsCGlWzwLNxIfSboT4Cfchc7TyXWeFZcL
         sFfGPFFZw5Wt5DUEAOxtdwrzuHt+a1/cIEByr842fKYPf/46f/gmHAZWfRWC4SVkXnyu
         MLMXuxIu4QGI7bB7/Qgk7b26STr/Rb+Ab0v2a7G8oB4hxJEqqvn2WEH0ic94oCIbQpgI
         0jeUWHEKheLzq1Fektap7jxtv5mhfyLq3xeMGK0Bm2voP6M9eS4TzKfY98RE9o5OtltG
         n6TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793286625; x=1793891425; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2b3vVP1vEHIm/JW4JfzuulbZR3cusd4/fTQxKoNUz94=;
        b=t0HEKi3JEuYusOJQ2BlME+lteEzd9dpBkx0PYrvDTF6m0Gk0Q+n2i1EUE9nTUzuobE
         jgmDRB3BuFqDIcfk3pKSMf2ZVBNUYhnBJi4AQOlRU1v3BE8YfrL4dMUtUtwXzB/LkkKh
         W7hTXlaauGp2j3cYctzuHfnaObEhfhmydvxsoNvTEELOKG/xAuPZi8zu3cSrRxrthG9T
         avMlZ8RsvJk4iVIODKrTJFIFU/7bXBHJevI9/zHVtmfcpFhc6TuQMMeYsurZ/VZCOEbo
         gau2V+U2q/NGCK5o+dlwIHFTFBtIjsuOXnSt/D3Csq8dhKQoq2F4U0glozDN4haqHNSm
         PwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286625; x=1793891425;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2b3vVP1vEHIm/JW4JfzuulbZR3cusd4/fTQxKoNUz94=;
        b=fTxkmcwiTRh+CHnMFQS6htWbADHUkXmF0lSN4kRsMhUuwKu12QkMcTDGIIl3B8RxSk
         dVSGwOYQdKDytTx4tEhU7ZvBAUIhvKHdnAdpucBaSNGMNujPoWmsjj76yGo4CeY0YF0q
         dR/d3l+lot6v1b+0R5r4NysWrxghrGsPqnkX8Us4qepGE39xuSMivebiCVCYTP5Dmxca
         TMt8uY/Xp/CelOwxg9GzsUWBFS36Z3W0jd1ghvEqpAqn8cCAxRkF2soZxYWhxVGCbrSd
         9j7HBMHvZlaGYQOAmHYO5HprEj5DU/T2VULzgxP8dgCOhfmpZA387WPutkqvjXvMKFXt
         4XqA==
X-Forwarded-Encrypted: i=1; AKwUvBy8cJ2sDzZyoADsh3dfjnHkW8XXxKmY4dGlc/V1cszlUso2WwboeH9HF/2029ozo19eQ2OrjMDFHJKdh6k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQN93vX/NMGH+WpoUXqyhJhOHnoSsHChxriniDFkrHu9GAa541
	CIAlFcYRdbZPgHS2dbVm53PJTBF8bT56PUE2H488/N3+Gs5VSAtxfR77G9yV0U/nlqZLNicSTj7
	/e31EWMxyTWiGrijai6Tr50gco8lhAVmacqFEwHWlwA==
X-Gm-Gg: AYBFou0xyzXz/83faGcsG/5hqEps6XOI/CzJliMF00lc4svWrSbuYo6vy+Hf7EZbcfY
	jmAcAvXtd2Hr0GxbNEQ6tXaNhaghiJbmzVyU3oOW+QEGOXfEq8mnxnkMHGq8I5WhcyfChu6xDiE
	TkDOnrmf+0/FWW11smG7joiQQCX7L5aNonErenMeZ/1liD4oAT2nZx3iyHogwEPqxZWi/6/0xRa
	iqE9l+nDkykduMcgRMKymH7WSw+OFlD0bfJS2y+Y5AKlE/Flkusndw/NEIOmIoDN6uzHrYpNdM9
	g8Rs2brMHu/AwzbgzIFW/yT6eanbMxLJj4C3nFHhPfc74VPU6ua/KBWjXDrzoTXAIcTNzfA4YTD
	LB4+EPGjYqN+pRFbOgBG1Jp15x4s60k7zzsOms2iEaCaPlU6xcdNdjUkGpjnek+yN3pT5/Do/e6
	yzOWEXiy+mQUfjl7+5L7fqa3E3d1ig3F+Nz4rxx83T6Qva/kXnu8KIfQ==
X-Received: by 2002:a05:6871:2102:b0:49e:33ff:6bda with SMTP id
 586e51a60fabf-4a8e06a7791mr1577014fac.16.1793286625298; Thu, 29 Oct 2026
 08:10:25 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-ov9282-fixes-v2-0-3bb376d8b1a9@linux.dev> <20261014-ov9282-fixes-v2-6-3bb376d8b1a9@linux.dev>
In-Reply-To: <20261014-ov9282-fixes-v2-6-3bb376d8b1a9@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 15:10:09 +0000
X-Gm-Features: AclHuK-NCoRP1AFBwcEcpT9lZOpueGQS9GFk1YygW8gcMAFUBjXyhMvfoBBBJz0
Message-ID: <CAPY8ntC1G0Q=MFGkLNSC+bCq-iJh+estq1FeDgE7aV4UksyuyQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] media: i2c: ov9282: recalculate strobe span on
 HBLANK change
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
> When HBLANK changes the line time changes. This means the time base for
> the strobe duration calculation changed. This results in the v4l2
> strobe_duration control value and the strobe_span register value being
> out of sync.
>
> Fix this by recalculating the strobe_span register value on HBLANK
> writes using the currently configured strobe_duration. This results in
> the strobe_duration configured by userspace being kept, but the
> underlying register value being changed. To ensure the values are
> applied on the same frame guard the writes with OV9282_REG_HOLD.

Group hold will do what is intended, but if control updates from
userspace for eg gain and exposure generally get too widely spread
then, we've got much bigger problems.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Fixes: 84ec7597ae1af ("media: i2c: ov9282: add strobe_duration v4l2 control")
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index b48c959b9c908..5114fbf28a26c 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -625,6 +625,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>         u32 exposure;
>         u32 lpfr;
>         int ret;
> +       int ret_hold;
>
>         switch (ctrl->id) {
>         case V4L2_CID_VBLANK:
> @@ -677,8 +678,14 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                                       OV9282_FLIP_BIT, ctrl->val ? OV9282_FLIP_BIT : 0, NULL);
>                 break;
>         case V4L2_CID_HBLANK:
> -               ret = cci_write(ov9282->regmap, OV9282_REG_TIMING_HTS,
> -                               (ctrl->val + ov9282->cur_mode->width) >> 1, NULL);
> +               ret = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0x01, NULL);
> +               cci_write(ov9282->regmap, OV9282_REG_TIMING_HTS,
> +                         (ctrl->val + ov9282->cur_mode->width) >> 1, &ret);
> +               cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME_SPAN,
> +                         ov9282_us_to_lines(ov9282, ov9282->flash_duration->cur.val),
> +                         &ret);
> +               ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
> +               ret = ret ? ret : ret_hold;
>                 break;
>         case V4L2_CID_FLASH_STROBE_OE:
>                 ret = cci_update_bits(ov9282->regmap, OV9282_REG_OUTPUT_ENABLE6,
>
> --
> 2.53.0
>
>
