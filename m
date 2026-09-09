Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F892DCF74
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788989709; cv=none; b=bzfQESRj+u0zCw/3PtCDseki5oRQIG3+MhceitBvUWhml9J31i3Lerl0eczjM8g88vLRIhhov/fNRXT2cNDD42K6+UpwKBMV/ECNHvp/FNBCHzTk1zZIpJslAnZqloU/HLKo5h3dvhDr3ZAK2Z79q/sDodscr6Uz10XeX/GT0Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788989709; c=relaxed/simple;
	bh=JM0o61Y6ltMUDCEIGTB8aYG4/lxWHsy/P9VIG/tnMQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNnsKErxcLuEmIwNnMFUKkfPJvOTI0TFvCC0+MSb9on9lTsK/PuBs8dzCLF6HdPn6NmpfxAk0KDwmaqqKYSGj5bsYCnIrrVF37gX9dYV4oqPhuhkXzsi/Ix3q4AzEWgG43y+7DWL45/uSZfBDRZ4wk9WWRnbJKarGYLm6kp00g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CyLfGmTf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CyLfGmTf"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15e2dab83eso1121321566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788989696; x=1789594496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sMS1hbLMg1gsIduehGePlq8QcJPEKyefk4+J94QrxTY=;
        b=CyLfGmTfY6NlaBxvKiuOvMJbdO/2j8jasUbtw+vR8AzBYZcX2IGHbndts0fVVYgIpt
         XpAsJtnWXSvpnJfBULJ5uVVR8foRT3J004Q8u/2zzJAk7wSKzVC3Ibe4XJH7sbtF75D8
         3SuZpuvdLMJ1moyfmHa1F5LTJ8XvFrdG7nGNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788989696; x=1789594496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMS1hbLMg1gsIduehGePlq8QcJPEKyefk4+J94QrxTY=;
        b=ZmmWWs8Rj3OPizPcd1MJ4DgSaSAlXJBbU98YuWVvGCSxJI2q+wKvmdHWUvAdotiLbS
         c18uOn3DMM+VW5vcaD7JXgB8x3+V6gkHjpcdLad54HAr961VBtsRiIS/YwoEJ7i+td1w
         ebZv9wjMU1QJ+aHyqQbDWI2uVbE2lCFKNHY2nAK5HyEr0weAskEVcB2E0jWPawrw7uh6
         7t4A64PdmBiH8QgemzVcKwEmnjNQPYSssXCWEId4UwHwEfyiCgQpZwH2XRbHT9FUw0Qv
         dS4Mg3fBP/Uv+8oNZwftnaktQR6J7K71Y4XJf0iBIaWg1LP2i8fCsQQxQEINs3Brr6/u
         t46Q==
X-Forwarded-Encrypted: i=1; AKwUvBysVArAZ+vNKaudOaHNlwAlyaPzjfNn7kgPkXe9+CkNUfR+oGd/5MkjL6DpVZLk+o19+d2FEga1ANBA+VE=@vger.kernel.org
X-Gm-Message-State: AFuF++nOlK6+lEUtCtZ4yOJ4TBp48ahN6R3IZHn5kfajekm+xWjgmSYv
	G7vgCKV2Qf+0gnWr3u2xmHQYwhXvwoVLx6UwmBEwPnMItoQJDXvTvBOaZ98oIPQaGweEyAveZ51
	0joLj7A==
X-Gm-Gg: AYBFou3ipwXYsd8pVoADqzkeW9UGq2AnDXZlwdcCGIDOuvhLkSOBQSLNIbkAkBQkzLz
	UXDyMf5ConYWjsfSqBQzelQWTOVKNrK0LsieykR/lcRvr2YvhKmJRpXxjwMtP+kt8Sdc96kyJZp
	CKXKL2WlPvWzSK+sJDwHDG5edrpC8P0GG9Gjd8z/NdAxlo+z6S8zyUf26ZX7Ji7D6QQf2hDYhit
	5fZhh5fB3vVREDwxnhO0dB9QKavZmxUF395Y4ESG5Ei69LkdJLQORkCCSMfnAY5oGsQAAmgUnRF
	MUaUicXxipjJ1WldNQDaPCbWZlCENPOQJuEfisVHhtzjLRW5PP+xVSUOYZQq8HNgz3Stxdssq14
	8b8yefI9vB7slQQU+SiRNxQ/XQ7qlysIS5m2Xzn0xap7uAgY1sTJkHdhpQWos4rFWySQCe/ePTT
	igMp6Ea35LHJMJZwMmqIULdB2YaEO6+fINVoreGA7oX8yZ7e2LgL3Fl5Rl0R3BXByZ3TAVwSm/4
	4jRkcrQB++QAG2iuT7VdaBbdmkPzAnzjtWQWQ==
X-Received: by 2002:a17:907:72c7:b0:c26:30fa:7cf2 with SMTP id a640c23a62f3a-c2630fa7fb2mr1112429366b.13.1788989696477;
        Wed, 09 Sep 2026 14:34:56 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm852179266b.58.2026.09.09.14.34.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 14:34:55 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4957eefd361so50377745e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxwIpLRD7eAle9wBoO75a2d/ovopice5/Upz5S6X5pK7QMMfNx6kf+TE5n30AsIILgqUa1FXFiOT4X8cqU=@vger.kernel.org
X-Received: by 2002:a05:600d:640e:20b0:49c:fc6e:a3e1 with SMTP id
 5b1f17b1804b1-49cfc6ea77dmr253931435e9.32.1788989693915; Wed, 09 Sep 2026
 14:34:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908013843.368364-1-justin.yeh@mediatek.com>
In-Reply-To: <20260908013843.368364-1-justin.yeh@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Sep 2026 14:34:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ui1XYRXb6ZqmAgWqF3TZaAcGqfsV6KodqPbk-sGqHdaQ@mail.gmail.com>
X-Gm-Features: AcwNN1UfpgY7Rw4Gy4MtVJB0f5LgowF3gCGJtAAU-5vzKs2VDiX_yyNNYapd3c4
Message-ID: <CAD=FV=Ui1XYRXb6ZqmAgWqF3TZaAcGqfsV6KodqPbk-sGqHdaQ@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: Unfollow the panel on shutdown
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 7, 2026 at 6:38=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:
>
> i2c_hid_core_shutdown() sends SET_POWER(SLEEP) even for panel followers,
> but nothing in device_shutdown() guarantees whether the panel, and hence
> our own power, is still on by the time we get there.
>
> Do what i2c_hid_core_remove() does and just unfollow the panel.
> drm_panel_remove_follower() calls panel_unpreparing() only while the
> panel is still prepared, which powers us down properly; if it is already
> unprepared no transfer is attempted at all. On MT8196 the panel is
> unprepared long before us, so this also drops the ~2s i2c bus timeout
> from every reboot.
>
> Fixes: 96a37bfd232a ("HID: i2c-hid: Support being a panel follower")
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> ---
> Changes in v2:
> - Unfollow the panel instead of just skipping SET_POWER, so we no longer
>   depend on the panel having been unprepared before us (Doug).
> - Link to v1: https://lore.kernel.org/all/20260904035009.4114363-1-justin=
.yeh@mediatek.com/
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c=
-hid-core.c
> index 0ff07fdab442..c7e46004f513 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -1355,7 +1355,16 @@ void i2c_hid_core_shutdown(struct i2c_client *clie=
nt)
>  {
>         struct i2c_hid *ihid =3D i2c_get_clientdata(client);
>
> -       i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
> +       /*
> +        * Like in i2c_hid_core_remove(): if we're a follower, the act of
> +        * unfollowing will cause us to be powered down. Otherwise we nee=
d to
> +        * manually do it.
> +        */
> +       if (ihid->is_panel_follower)
> +               drm_panel_remove_follower(&ihid->panel_follower);
> +       else
> +               i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);

This seems right to me. One note is for panel followers if the panel
_hasn't_ been powered off by now, the drm_panel_remove_follower() call
will cause "i2c_hid_core_suspend(ihid, true)" to be called. That does
quite a bit more than just "i2c_hid_set_power(ihid,
I2C_HID_PWR_SLEEP)". ...but I think that's fine. I would expect most
systems would be powering off the panel at shutdown time anyway.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
