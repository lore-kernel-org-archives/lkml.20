Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ABF318EC7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435473; cv=pass; b=PfJFPrV+UqHcFQ5M6/rn0IdUzpHTM2YTc/Hlc/GDdu4Yrk9+JYTURU54RAJYTMZ+Syp+YsCA6+E9t5rSkyvd46Y9uXhHc1P30GCLWBUm8Xvui2td8YDiwdJ5blnFFJWuTMqKKBrA2oRk2YAT8TZeAb05Fx+/DOrXzbkhaaYnPMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435473; c=relaxed/simple;
	bh=dEdzdraQ8e1FJjlgNNKbv0UpkqZqqFvCuPQNVi2/Eds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXJBkxNpZAVT96BBjB3jh8JbrCCr5rXdrXnFTuHXvC/ktBNxnUut2NtKX1xPGpp8kxaK0DFA8vYxgqWNFCeBj1rOwdDV54Ts3mo/adf93Dt8iXydE3aw+5SMxUx6zT1D3KrRL87h+UrKUbzcKSuzQ31EiBlV5OmaNDtfNjr33z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+ZaIgDX; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+ZaIgDX"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4d64bcea5so2496307a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:24:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789435471; cv=none;
        d=google.com; s=arc-20260327;
        b=hxxwGoZc62z4Rg6uYR6pBDVcWpeVEjael2JFk776E/0esAfhgcxqsrPlbwSHjnz5Il
         T49NzdrQxRkR/aCXV6/xYh543ihTwQd3NVIx8AWp/p/u1Mbh67tx+SUHXDbHKETptMJ9
         rXmjwc9axSkQx8EZSTZaJbD1/AVuYxGmNbFDUA0Xt/+oxGl53f4zILX37Ulu4kNsTvIN
         sdMcMYFMwzoGvjRC1f1PkbHIta0Q3tEmmH6u5Vxh5Vl/ss58vwIh5JwFjhaExUOt6Y92
         Qh7C7f5CTHxt9ZG4XiRcR+6PrJYLrba+pGEO/PVUW/As60WKLiy+nYxJj1NLma/1Td/r
         Zq+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nj9AuGJ3R4rBf2c5qZk9ZmLjhMDoMpxuJOp7rXF1jN0=;
        fh=ZlGNUwdQWARaOB9xViaK1ueF3RBzsl3m6PTzwAw7qpw=;
        b=Is7D41OmQV6lxJNlxDvz2v7uNCXmcCGAa24coUcfYnJ1X1wggLWp4nnASWjnKpNI3I
         DEJFutUPErEKtlizrVwMTD9PFNgp8B8oXWRLm9A2ctxhA1yIrvW4FhX2RgBwc7rRAAoO
         OZxZC2Wwo0XzuuHxVX0MJQzuVK/aPb1nKTguMZYtfy2XnDyVfeniFAMwhkD5vDWWcKkJ
         YUwYqFzv/MIVjBDpoCfAG7G1mNynYnO0zEZWttZ+l4mkpUhZSgg5QmQkT6lnskXvq5r6
         NTZAPPMgE8oEAkF+qtwUak3gMjgYFXN1NRdo/38woXtWlfPAy5UfGK4V38HgdljcPX2L
         mSxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435471; x=1790040271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nj9AuGJ3R4rBf2c5qZk9ZmLjhMDoMpxuJOp7rXF1jN0=;
        b=H+ZaIgDXR1OOh9z9s7gtWQMr+4hsfPs/nWxz6zdZo9NzeJ1qKzAj5/MNvFqdo97axS
         ALap//yKjSjZ2zVD0bqczCGUBlqFTD11RlME6vWd8YR47dTVVZvbCe/7L8VPg9g/CJ/t
         +JdNbTyl58QN4NPGUVWlJ+IBKwZZHoCVQL9jPogegNIVNK1gk3PD07bHXWVfOK4xBW8R
         YyA4AQvOnGQqV2lvVO+iZM3nXDo9x7diQPGqAGAsYcGrucyANK7+47VQ+K5q33v9Uin7
         iaxkBKhaRW2wVnMMnTBzuTvQgg7Fn0Zj57atv1X9cb0y/y7SE7qVZxEbNUZyXIEmRe5l
         Ajsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435471; x=1790040271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nj9AuGJ3R4rBf2c5qZk9ZmLjhMDoMpxuJOp7rXF1jN0=;
        b=hY7eFiMv0dGDGmhvaxMCK233SroJanmSfBJPleDC0zf08+haGRUrddai/9nApUfe6E
         x9N5AKdqroIB+5cUvOL5IfNDwdxAHJtgfPy8EQhIWOagU+nSwCmQSBY46aJ+UBWJUCw7
         OUEXy8Teio5vNy8EPvoOQO7rH60JU5orj7ApFji9d8zMU188skEMEA4I2bg4TtvmTmmD
         /5f1foyPeCB4ve23czrk+7pZO385HLHF4+A6qoWGq/WnRGF6dP+200++kiAmkTffauOU
         P0k4tHjmIvmoxl76Y88tnsiv6dJjqy9lM6Fg9RqaG8i/s3LziP1rolmI2CpxOGUh+cXm
         oLFg==
X-Forwarded-Encrypted: i=1; AKwUvByyihjmSIclfAtMVHSedMcPlG/zcFvHYJsFDVouWVpj6oiyepRc/NAxOhSN8KkTKcx/HbXhD8YX8YwAYvg=@vger.kernel.org
X-Gm-Message-State: AFuF++l+KkHXHLSrXTnnpP3dYaB/yNxKXtOTYJ6j10vzvRYrqU6MG/Td
	7S01wiC3r/g34tSQOqZCsak6JXRGAkxja5DaCZPr1S9RGHFp1bj1eJTvG5qx/LUVBzTOXBIQjlH
	4Xr/O0EPYk/9v0InFRKLNzl+FGX9pkg==
X-Gm-Gg: AYBFou0yP0tZL0sVRawi+fd0Z554gK2h36WE6CkqtA3p3TiBVxi3pB6BtI8nY62f21N
	4YP1ulRPBZpe3JC3oTaxb87lmm9XqCAWYhfYugFyU0YF7qR3pV5TTrMpkSQZp6tS3Gexpljt67O
	2VXuiVCnaY8a1TGtGeiWIEij3PANmluDcCjxTKCHCtdePAY9+z9cysEAWMAb9m/WlaMHP8RmLYA
	AYI24mn7VoEY2umVKNG19nYTeJMv7NxqeZnwN5K2KhF4D3itdvwnA3bsTLGRAoZVZ+/tylYBJxH
	nBIrujEA0YUMq6XuXYZq/hPb05miiVqz4qMO5Ifmt4dguJyctofTRHA/OMr4aH/Q8PqlQZDE0lv
	QVbCBMdd7oz4iO3n/ToWi/SBfqC8x0+84oj5xeP69LASeGi0fVpvR1t38XAXATVBU0x6x
X-Received: by 2002:a05:6a20:ce4a:b0:3cc:92d9:80cb with SMTP id
 adf61e73a8af0-3db4046c09bmr11645431637.12.1789435471071; Mon, 14 Sep 2026
 18:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524155735.13865-1-mhun512@gmail.com> <CAMeQTsYVf_YRyuXx2XpBG822N=nMhnRbKnUNRu8OrsSthzrMrg@mail.gmail.com>
In-Reply-To: <CAMeQTsYVf_YRyuXx2XpBG822N=nMhnRbKnUNRu8OrsSthzrMrg@mail.gmail.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 14 Sep 2026 21:24:14 -0400
X-Gm-Features: AcwNN1XGN3vWYnZMelCtuY0mzPxTvaG2W81_3N9COhlxDNULIMfbhXD5Z_s9EoM
Message-ID: <CAGEsz8E6oZRuLS2kXTw6bnYBCAmg_OvLDrhqXBDUC--qV-5x8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: clean up modeset on backlight init failure
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Patrik,

Thanks for the feedback. I'll address this and submit v2.

Thanks,
Myeonghun

2026=EB=85=84 6=EC=9B=94 1=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 5:50, Pa=
trik Jakobsson <patrik.r.jakobsson@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
>
> On Sun, May 24, 2026 at 5:57=E2=80=AFPM Myeonghun Pak <mhun512@gmail.com>=
 wrote:
> >
> > psb_driver_load() initializes KMS polling before it attempts to
> > initialize backlight support. If gma_backlight_init() fails, the
> > function returns directly and skips psb_driver_unload(), leaving
> > drm_kms_helper_poll_fini() uncalled.
> >
> > Use the existing error path so the partially initialized modeset state
> > is unwound before probe fails.
>
> Hi,
> Yes the existing code is faulty but calling psb_driver_unload() to
> unwind the init could call backlight_device_unregister() on an ERR_PTR
> backlight_device which is guaranteed to fail.
>
> The correct fix would be to convert psb_driver_load() to use devm
> and/or goto unwind pattern.
>
> -Patrik
>
> >
> > This issue was identified during our ongoing static-analysis research w=
hile
> > reviewing kernel code.
> >
> > Fixes: 1f90b1232773 ("drm/gma500: Refactor backlight support (v2)")
> > Cc: stable@vger.kernel.org
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >  drivers/gpu/drm/gma500/psb_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/=
psb_drv.c
> > index 005ab7f535..7218026fe2 100644
> > --- a/drivers/gpu/drm/gma500/psb_drv.c
> > +++ b/drivers/gpu/drm/gma500/psb_drv.c
> > @@ -406,7 +406,7 @@ static int psb_driver_load(struct drm_device *dev, =
unsigned long flags)
> >         drm_connector_list_iter_end(&conn_iter);
> >
> >         if (ret)
> > -               return ret;
> > +               goto out_err;
> >         psb_intel_opregion_enable_asle(dev);
> >
> >         return devm_add_action_or_reset(dev->dev, psb_device_release, d=
ev);
> > --
> > 2.47.1
> >
