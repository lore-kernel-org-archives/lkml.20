Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286167;
	b=i4RbFOtZlxI+uumlPMJ/6WJrRc+dFj1VK2yd2b2tPRX/t/pOcs/4mK7l15nJoiVAYBGs
	 Sd6ATXU6WXHU3jviAr1kpsY4Mnpoj1TNt7Ft093KxHrAw75FKYYDww4ROeTtAwDQWBhYB
	 FO/gCwxVTPpVrgH7fM51C2gZdl+AGNX45VBsi5oDPxX9u2SHvptHUUomJyp39dXUwQHGx
	 8m6lrvZKsN34lsYjx1oUJlCVSbDKg0gnwn4N7wo8LuChmq40pedGx88mlCqeLBJ0i6Iy7
	 oCrW4YeCl4tNpz0FLIybTn05seFiy+r9wNshj+2Z+kixGhGeXYYAk5NSJ9m1M87IVeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VBauCSbAO1bslF2MHSEVL1Kj61L1QueFoV/lHBHEYSQ=;
	b=Gh9hXWgyf5DThs1ajsFHyRFrT5bSpmFSLO/eruApIyxRFaoBc2473MTW7RkvLKMiF4C9
	 7jxUfZXdp5hgl2m80ohc5BVtyKUUr4ilRmmRB/s6A9EzzcAbIG2QHEFdHELorialRiVab
	 j2zjjv3tKsu44WB0+IEFE0RdDew3bCkg5colzIEsocCuBUo0j1DSPMYYw9Xe68SDIErzt
	 BvYELVjCRYSCwyaOzHZ3RbtIf8BbvQJi42Rug8kfVSOHERovrJqBuTzaKKWDNu0ndINZP
	 AEaC+WdrvPrJc6ggtztj3kpFAo3PfHdoA/0wZr7yFmgoMeMrxBi+vnMRX95jYMje1EQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=kUptFaBE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E57D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E57D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=kUptFaBE
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-43bf9548df4so1986683fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793286165; cv=none;
        d=google.com; s=arc-20260327;
        b=jJGaFwSmopIb6S4XHLTu80vCIUToME7ldYcQWw51pxLZIu62qKxydYxbKcetmRwuig
         5/w4xPLcTqKwCm148uRFvqEU2Dplkj3fJ0yqi3VXPPz3GegXyee6A/xlJz6y9jXANiH6
         DY8ubk85SfGKrVMbRcT7tjZM+Z5wk1ZVpl32psNZZm33mFuaRTqSVWznVVAyWOt2nxsG
         fKVqO4yy6qugoxZkRk3JkaVa/yFayRofs07bgBdHBKqY+q1vfuqsAQCv5bKVarmjMWfN
         mzhuoc6Bj9Fuj0lk2PtN+l6GiHwZiiGYTnPo3YxmI1cE+rbjq5+8QfrGFEjVCE9YZbx7
         UiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VBauCSbAO1bslF2MHSEVL1Kj61L1QueFoV/lHBHEYSQ=;
        fh=rWf9VQF2S3oFJJ/ZoVGTvvGwqJcwpQtpSyswgLwEaZI=;
        b=Lv9Dt+nbnut7Fi2hFD5pgiBYvR0yRpOQsm80s2kk22kP9XVZLf7fj86g91OG0hHd1Q
         +rtSjtZ+An2oL8/vE/tj/r5iJUYlCXCq6cH4gztFBtREZ2dMuPa1vf5rg2J4Cjxicm9X
         csvkFxSU/6vOl+n7Fq9WpVnlECZi9caKkSvgej9NYupvLp5FFkm3rlNHSkd3l8sVIFHa
         Xd8w4NE5zsKR1MxprKpmkEsNJY3uBq0Chk44FgecobHq2n7YgZFoWRqLcBM6Y9kD6V86
         qf5gN9vdY3gHjYywwNnvBkJ4A6gMdFE2HIOdXuvdQUXlAOUeVNcgdbUF58LhkisiJrxi
         gjnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793286165; x=1793890965; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBauCSbAO1bslF2MHSEVL1Kj61L1QueFoV/lHBHEYSQ=;
        b=kUptFaBExjtmignbdxt1LEDnztQBGVfbv/M45YWor7b4iidSbjXJeQadLYQ+Rs6f13
         UahaoMLT+piO8QQ+ypRM1Tr3MsYpi6glJ5p9YaSaFON4VaZRkpObl4vmnv7sns98U3rp
         XdolxfrwbkCywumJd+8B6mnNC5KkPOG4uNPhMCtxZF9yuFsQ0J32qEtj2PgmKqO9/Ydk
         osv5fWFDUjfHsooz1uYRX8gTTGCqePBInTcQk+peDAOWkvkjz8S2Xig+lZK0SNdFIEQs
         Zwdt9xNANFYfHMyYnK50RyMfvkGUj9bdJLJdu0KgD2KcY+D5SBI7hxUT6p2xUkZo0Y4S
         bo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286165; x=1793890965;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VBauCSbAO1bslF2MHSEVL1Kj61L1QueFoV/lHBHEYSQ=;
        b=F+LxwHrEGgm08idxLWxvfC0RBnDL2SvhDrOeXGxvx+QfiSTkhA+ex3/CIxU4Yt4Op3
         dcllbXh/BIqG0spooON7Rz/6by50Bxpw5jmxQ/4GHGftXgh8cdOIxWIc9ndPnUs3DmVY
         3L+JIO3rBHw4AcGwMMxBOneJCFEzaJP8mvfMx3hZijFTdfO151e1RZX1TQDXtnlJixz8
         Z8QtsGCv+Zbmxcv4/bgL8QPnoUA3OiQRb3Q+GdkR6yZuos/vOfEYTXM+olHfO8yfzKou
         LwtVywREv8ua5c26/GTCjijqZoM3kOTM1bYP6fjAHjfx8Ucw7TQuGeb6elYvBp4ad8sA
         SRjg==
X-Forwarded-Encrypted: i=1; AKwUvBwfx6FTH8+D1hm4IzD4uVIgokryPn+FARkY3SeogM2SPYmW6ChUr4yBCKUT8ASYCLARr47F6PU2jI0Otkc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1fjVbUZCKxyaB+P4BksIRyixwlY8+DNs5KimX7TWKfQRGu+Ct
	0e7N/OO3OYLKuAYIDV552GX+MHGXizn6qpA4upGNLbfDrnRplBT9MWI/So1tTC5wrZYS438xRrX
	2B4Krb1Ah6G9/ULky0ejs0mzwjNx4P/mldb+uNcF/dA==
X-Gm-Gg: AYBFou1DtTNzJK/kbo5OgHfLNYNgsxRRr6OkSE1hcx2KFZ/+Ys1mlHQ4mglt8NCa56R
	I026/M2r+JGrckl4sfFWakgrXMYfAMYWQhxR44OB8uwxwgs+LkcS52EADh5Lfps3+VY495k4chs
	nUPKvI+uieG2/jclpAhtd/7czpcD9GJkDVGyODwylITnMgsu7cyzg4fIVjeWIgAxGIEb/1rdn4q
	MTYgDQLFZQqRduXaexlp3RLAWtPNHCEmPmcffAyzzQoMSFATygeBqfzMA/Gt0KHsRgD9NWDQWAu
	Agk9nUPowLlx5QJCkRzRvxtbweu1RcvxXh1516AojHstmC/I9ia8YOrHBpmB6Tdao0MraMHAM8S
	ykamjmS5hDCdIcUwsshe6uXMMxVAAOMnXd/ZNYwBmK4NsFVFiCTulVC8BCsxLxa8fKUwpf/JmIi
	CsaFkt5JL8jYmX2eBd/gsneJKJJRl1K/kbjcNocK22ubuKwqI1TK4fP3pGKnmzqMoHNT7JUF83P
	o4=
X-Received: by 2002:a05:6871:2102:b0:486:a82a:a204 with SMTP id
 586e51a60fabf-4a8bb21dc71mr4339383fac.5.1793286164997; Thu, 29 Oct 2026
 08:02:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-ov9282-fixes-v2-0-3bb376d8b1a9@linux.dev> <20261014-ov9282-fixes-v2-5-3bb376d8b1a9@linux.dev>
In-Reply-To: <20261014-ov9282-fixes-v2-5-3bb376d8b1a9@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 15:02:28 +0000
X-Gm-Features: AclHuK8voSOcP2Yc93--NhJD3VRIP_1eHNKLU2iJ4Kl10Q7R5Gjav4eSoB_tiWQ
Message-ID: <CAPY8ntDPj06a_fa+fJRUmn_8z2jxBXgFtf-PyHw7n34Qy9zeig@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] media: i2c: ov9282: add refresh of additional
 ranges on a mode change
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
> ov9282_update_controls() updates the pixel rate, hblank and vblank, but
> currently misses the exposure range and flash_duration, which are
> dependent on the frame height and therefore vblank.

This ends up being the opposite of my comment on v1 which claimed
"Both are dependent on the line time and therefore the pixel format."

exposure control range is dependent on height and vblank.
flash_duration control range is dependent on width and hblank.

Just omit the dependency comment.

With that:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Refresh both, and commit cur_mode and code in ov9282_set_pad_format()
> before the call so the refresh and any nested s_ctrl see the incoming
> format.
>
> Fixes: 14ea315bbeb75 ("media: i2c: Add ov9282 camera sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 36 +++++++++++++++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index e6920e18b7818..b48c959b9c908 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -548,6 +548,7 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>  {
>         u32 hblank_min;
>         s64 pixel_rate;
> +       u32 lpfr;
>         int ret;
>
>         ret = __v4l2_ctrl_s_ctrl(ov9282->link_freq_ctrl, mode->link_freq_idx);
> @@ -568,8 +569,20 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>         if (ret)
>                 return ret;
>
> -       return __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
> -                                       mode->vblank_max, 1, mode->vblank);
> +       ret = __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
> +                                      mode->vblank_max, 1, mode->vblank);
> +       if (ret)
> +               return ret;
> +
> +       lpfr = ov9282->vblank_ctrl->val + mode->height;
> +       ret = __v4l2_ctrl_modify_range(ov9282->exp_ctrl, OV9282_EXPOSURE_MIN,
> +                                      lpfr - OV9282_EXPOSURE_OFFSET,
> +                                      OV9282_EXPOSURE_STEP,
> +                                      OV9282_EXPOSURE_DEFAULT);
> +       if (ret)
> +               return ret;
> +
> +       return ov9282_update_ctrl_flash_duration(ov9282);
>  }
>
>  /**
> @@ -832,10 +845,23 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>                 framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
>                 *framefmt = fmt->format;
>         } else {
> +               const struct ov9282_mode *old_mode = ov9282->cur_mode;
> +               u32 old_code = ov9282->code;
> +
> +               /*
> +                * Commit before refreshing the ranges. ov9282_update_controls()
> +                * and the nested ov9282_set_ctrl() calls it triggers derive the
> +                * frame length and the line time from cur_mode and code, so
> +                * they have to describe the incoming format, not the outgoing
> +                * one.
> +                */
> +               ov9282->cur_mode = mode;
> +               ov9282->code = code;
> +
>                 ret = ov9282_update_controls(ov9282, mode, fmt);
> -               if (!ret) {
> -                       ov9282->cur_mode = mode;
> -                       ov9282->code = code;
> +               if (ret) {
> +                       ov9282->cur_mode = old_mode;
> +                       ov9282->code = old_code;
>                 }
>         }
>
>
> --
> 2.53.0
>
>
