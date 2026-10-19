Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5139A488231
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395284; cv=pass; b=VkF1hBqckNugZzgN9R9trWNFhzAYXgPuyS4+3rIi1tjJiiwFnM7r8WKNGEiPo5Dc1CCh2zlRY+XMXbrD21ajPNz1Eo+q0TV1l0usvhSCQ8boQdJ5K9jKzlDYxFWlq9wq+OJPQHlHo1VGLzF36C3XJAusjI9UPiFyyohPIhFnl/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395284; c=relaxed/simple;
	bh=zzSBJEbQ3D9kyu8uohCICPb5V7tAUfamh/FCwHx6Zig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B11xiTP0uG6HRvfxJLv+RYgXKIUg5iw7JAVq8k16njo8g9FcnWJryLuV8lV/PP7foMgwgDDn/ctMNUpMeERn6zMvmFcmPyQs64K+5yvhuoZRZHesHkquMLer34ZgziHK0ugBQDN2NlNEDPavTHJSfGBAJiYTtKI/mGWMkBBDX3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=XwUSu697; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="XwUSu697"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c263415982eso195191166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792395280; cv=none;
        d=google.com; s=arc-20260327;
        b=TgCPuUGr/AHRl2Er2v3aP9upIs5zThMN7bgCsYNSmW/h5VfVpX/2Wme97NiiLWl3uA
         jlIc4Olw9JqFzOlZrG00xyPdRB0cpUBoFwzmwqeH0ABN49TivsAiLLQCuB+OV3wH4JwG
         78M2QGFyhVgqVfxE1OlmV8VK141Fn38FzpfXc8Ijmx1KxL0oaZ+Yo2ELx+P1ozJxwhMA
         rHr1lchmGebrOrkYiBzOGlChTEH5etyCoBNFLaUKWmOoE1k8baF3POGgqYujvuth8fp1
         fFNFTULAscBk62Oyj116MX8GSO3Oc1aJlPNb4A8AR67QST1ZvHZevUef4zu1ymkScmMz
         fpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QuLQGTBq/GHWEdWfb6Pl6kV6ni5j9Kr3GuQHGNwnH7k=;
        fh=HMOySx8KiBSLdQNzmRJvqrR2QCbWhkxbrf946l3EQsU=;
        b=bXeTbuvrqA9VMLbeKGetza8MTgyt+GFGWmHgL3I174S7GqJ1AiFEp/3dda3cKmmUOy
         sUIFvCe92H/PpHLHfgAZLhrg72fhwceF+MwdwnOLlNzthPCMhdhrd76n3fUPi06PPNpx
         oiP1Zmc448TLojvfYBKckRZodOIaBX3KXd/Hl48f0EVPuMgfZI5n2qAHbwJADE/22/2A
         3DvbQaJNhcOAKvTWHzyQ2rKg/CgL+2Ztw0wLB4Zx0tUQPANAAUUVGGTON4giV37v4qPR
         43W91OSnDwefvk7F6ligXgdp79HZYQUWwvSoh8sM1uuzEZQf0HABFouXwPy4U/h4nzKT
         qF5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1792395280; x=1793000080; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuLQGTBq/GHWEdWfb6Pl6kV6ni5j9Kr3GuQHGNwnH7k=;
        b=XwUSu697Lv9ee6OEmMvJgkz2ewk8k1NOLtAhirHxyYwO8wHogzkd7KkKXDGq2f0XxA
         xNTbesQmT5UCzFFtErfsO6q+XU/ZJO/QztLo45yuVEkcV7SjS0eff1YFa4B4QRNJSPl8
         Ky1UM6QccI2zF+OXG6k+cDRHxhmzrc6QzjXX6dly5DEor2hLLQsLoYAHBc4s3sSpC33F
         dxO/hqNSLhci7kD42ZLQuZc114RnVSHm2A2pUDJrvOWsGSdKY2zwe+OyP0gNJKR0sDbw
         hvc7lNeflrzCEvDQMyrFkiDvvir9TcpNJ3r6PY2B2+3x1FNQbQgjTmNYq/e83a0g3P0l
         9vBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395280; x=1793000080;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QuLQGTBq/GHWEdWfb6Pl6kV6ni5j9Kr3GuQHGNwnH7k=;
        b=pgMrOdTV2fgnLXfKWxqM3MuXMUHOM5AeCAkjU+fyJL7N/qKx1F2yK/QOAX1IWcVb0t
         Y7q1RcZzni4qZ+5qDzJXhLLIoWBGq2t+62dR1MqBoCei6zApt9pJqEI9r1p/UPwvdlS5
         e08EaJBOgYrU2nDG2V4ghfFUVsRZ8rwYKUe/+irTSsxkruylOGH4ViqXLr1dr2ffAeQF
         Upc21uszV7VP7+2z+SmmtzDQNPBvIB38URh8zQSrD/GJExhwySJPr9uflKMzrJx52xNM
         KnpbT7b1lNOmIlU5L+1alIyCasJ2mcbd1yN8rNK/d+6j7hvNZA8vE0f0wa7YGD+gS4kP
         7NaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzf6U+Pv/QELqCx5fZ/+dBeeVayOXNRI68kB1P04OG1NpUrnmYwx5lv7Z/DvfzaXCvFVbcT8m5looKYBH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbX07mqKwb8igL+Aehth3lXM2LI7gG2NRNKfUSKS4bO3WwS8Gb
	aqRellRzeRBHm7hBzNk9uoJq8xkYc5sCXc1h0U/Ge5ebWsAy67J6TwERKFu5Tgw8TD1BRIDZ28w
	oY/ZkzHKsLgFg8aTIadcbwc1uiKuHIkINydg9EeQ8
X-Gm-Gg: AYBFou1xOiS+eYNh9RbjcvMGCzFiC8MGWwk0FvIp8K0y3uXJ6jGycrSMN03ox+yAxoX
	c9YzNHa01PTRq64Ee3HeV9QK89JxX8uPyEuB9h6rQr1Afjhr1j7lDyp2TB/GE+Q+gPcMfDrB17I
	cYiUyYMFzznWmdjNC/QYWQzSoaBX+quqtciCH2MnJVUIkqHevMANZYSx0q898/xCrSoG0UUuuzi
	FMa9m3sjZLDUGYUNBvbFtOGtgKuREuQcD3PKy590AWTObAW18CatPB9o3BY9tXFEeew+UxpG43P
	4vURJs40EayCm28w/gXXpaFVwy+HWegm7Rf5cLNCRk7dHL+GnmS5
X-Received: by 2002:a17:907:96ab:b0:c40:38b5:d784 with SMTP id
 a640c23a62f3a-c419e23dccdmr466129766b.22.1792395280534; Mon, 19 Oct 2026
 00:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917110121.631587-1-salah.triki@gmail.com>
 <CAKv63utdoBrCFiw8vkGsMhY9PrWX0DWdxqP5szvTGpdmfSQh5A@mail.gmail.com>
 <aqvoH9ohxkJ6iPei@pc> <20261019040135.1da889ec@jic23-hlaptop>
In-Reply-To: <20261019040135.1da889ec@jic23-hlaptop>
From: Crt Mori <cmo@melexis.com>
Date: Mon, 19 Oct 2026 09:34:04 +0200
X-Gm-Features: AclHuK8Qhha2TFYgLBfys_ZMbGLsTyM3cX7mEN5gt3EskW5QE0v2YufftZFcLiY
Message-ID: <CAKv63usdo_QdcRyFrUvym_=_203CXLK55irpiPyVeipRNw1nEg@mail.gmail.com>
Subject: Re: [PATCH] iio: temperature: mlx90614: Fix dual channel probe
 condition check
To: Jonathan Cameron <jic23@kernel.org>
Cc: Salah Triki <salah.triki@gmail.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
No objections, but I wanted to test it and can't find the time for
this sorry. I don't think I have seen a single channel MLX90614 when I
wrote a driver, so maybe that is something that came with 90615
patches or later.

Best regards,
Crt

On Mon, 19 Oct 2026 at 05:01, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Thu, 17 Sep 2026 14:16:15 +0100
> Salah Triki <salah.triki@gmail.com> wrote:
>
> > Hi Crt,
> >
> > Thanks for your feedback.
> >
> > Actually, the patch primarily fixes the behavior for the MLX90614.
> >
> > In the current codebase, MLX90614 has `chip_info->dual_channel = true`.
> > Because `mlx90614_probe_num_ir_sensors()` checks
> > `if (chip_info->dual_channel)`, it returns 0 immediately for MLX90614
> > without reading the EEPROM CONFIG1 register. As a result, dual-channel
> > MLX90614 sensors are incorrectly registered as single-channel devices.
> >
> > For MLX90615 (`dual_channel = false`), the condition was bypassed, causing
> > an unnecessary SMBus read to EEPROM CONFIG1, even though MLX90615 only
> > supports a single object channel.
> >
> > By changing the check to `if (!chip_info->dual_channel)`, we fix both
> > issues:
> > 1. MLX90614 correctly reads EEPROM CONFIG1 to detect whether it operates
> > in single or dual channel mode.
> > 2. MLX90615 skips the EEPROM read entirely.
> >
> > I don't have physical hardware to test this on; this bug was spotted via
> > code inspection.
>
> Explanation makes sense to me and as Crt hasn't come back with
> a reply, I'll assuming Crt has no objections (shout if not!)
>
> Applied and marked stable
>
> Thanks,
>
> Jonathan
>
> >
> > Best regards,
> > Salah
> >
> > On Thu, Sep 17, 2026 at 01:27:48PM +0200, Crt Mori wrote:
> > > So this fix is for the MLX90615, which is registered as single channel
> > > operation? Did you test on 90614 as well?
> > >
> > > Best regards,
> > > Crt
> > >
> > > Crt Mori
> > >
> > > Melexis Technologies NV
> > > Transportstraat 1
> > > 3980 Tessenderlo
> > >
> > > Mobile: +32 492 46 22 15
> > > E-mail: cmo@melexis.com
> > > Website: www.melexis.com
> > >
> > > ----------------------------------------------------------
> > > The contents of this e-mail are CONFIDENTIAL AND PROPRIETARY. Please
> > > read our disclaimer at http://www.melexis.com/mailpolicy
> > >
> > >
> > > On Thu, 17 Sept 2026 at 13:01, Salah Triki <salah.triki@gmail.com> wrote:
> > > >
> > > > In mlx90614_probe_num_ir_sensors(), the check on chip_info->dual_channel
> > > > is inverted.
> > > >
> > > > Currently, if dual_channel is true (MLX90614), the function returns 0
> > > > immediately without checking op_eeprom_config1. This forces all MLX90614
> > > > devices to be registered as single sensor (num_channels = 2), making the
> > > > second object temperature channel inaccessible.
> > > >
> > > > Conversely, if dual_channel is false (MLX90615), the function skips the
> > > > early return and performs an unnecessary SMBus read on EEPROM CONFIG1 even
> > > > though MLX90615 does not support dual channel operation.
> > > >
> > > > Fix this by negating the condition so that single-channel chips return
> > > > early with 0, while dual-channel capable chips (MLX90614) proceed to read
> > > > the EEPROM configuration register to detect whether 1 or 2 object channels
> > > > are present.
> > > >
> > > > Fixes: 3d5ead238bc8 ("iio: mlx90614: Factor our register IO and constants into model specific descriptor")
> > > > Assisted-by: LLM
> > > > Signed-off-by: Salah Triki <salah.triki@gmail.com>
> > > > ---
> > > >  drivers/iio/temperature/mlx90614.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/iio/temperature/mlx90614.c b/drivers/iio/temperature/mlx90614.c
> > > > index 27d6ab5f5d7a..4f79da1f905e 100644
> > > > --- a/drivers/iio/temperature/mlx90614.c
> > > > +++ b/drivers/iio/temperature/mlx90614.c
> > > > @@ -565,7 +565,7 @@ static int mlx90614_probe_num_ir_sensors(struct i2c_client *client)
> > > >         const struct mlx_chip_info *chip_info = data->chip_info;
> > > >         s32 ret;
> > > >
> > > > -       if (chip_info->dual_channel)
> > > > +       if (!chip_info->dual_channel)
> > > >                 return 0;
> > > >
> > > >         ret = i2c_smbus_read_word_data(client, chip_info->op_eeprom_config1);
> > > > --
> > > > 2.43.0
> > > >
>
