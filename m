Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0540F3B7A8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788844648; cv=pass; b=Cb+j4FK6aW4mJ2oeADKniPfs9zb6IVuWIgkPuPFbqOk+X8HoTEHIGwHakO8uzVkr4IlUBkzubMXAaSMeAvmZZ5lobaTyS8Bd8mA7lVqPTCUCgp5t+qoyHnWaeN4ZEH5lumElzDEyNSK18HazAkp/dLuOjWYEvhdyMk+zyV9siic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788844648; c=relaxed/simple;
	bh=jj8iZbJ39WK9flKdG5MjPLxzl/UYfk7onXSn9gYx1lE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tFY+ou1YarFSHn/JaZBVVtrVR+LNyEfD8WTDg98ozs1PfK31A7+xl/6YEui34evtmASL2KaRzb8T7jWSGuSvS/NQvue5Hz0jnKtFOGzxtYnggxpVEtnl75Gooisd6Bdv2oyKa27iLlnAk3MVnM4uHVd8xeusxDYjt5Ce9EiYwnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j8WkMTuH; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j8WkMTuH"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66fc7196ca0so2389672d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788844645; cv=none;
        d=google.com; s=arc-20260327;
        b=BjfDUQi5/K48eia03sgSzUzlUk7RlCTPwIMChyKM+hgwWP0TC806oBIHiT4zKNJ9Aw
         hkEQuFAInMiTBnqyoO9a5ZbwICinPOeocvTCBP94qpVEsEhZp1PPFjBOiztXTU60xTjP
         KvCptY3+ujdGGbXRl9BrH4QXYbvWCQyNsvwiStlLhicuqkN7Vpboq9aX9W2qlIw3dyVG
         W3xVYPNUSLDXoDhrhEBY1eBCzFVGsgh7rGVpgwcYQbs/QHVlq0r0vbqSqONxmZ1wJp+2
         F3GBoBU1Q0ZUgeN7QVJ677XvOC4sMnZOaXsTR85OZlYFlKZJVU1KHJYTTsi4a642o5u2
         GxKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7FCFgCrO8nYxa4w36rz8tfzjeCQplkAjHhgkmQ0tkA8=;
        fh=1+7femOmfcDJu85mwq5GdUhK7fdBZAHdtM94GCB+Zk4=;
        b=SwJfO8TSTJh9Z1yWPFLUsZ3fSKXf5tRwo0iaU8aokYDQei/Bu0JuSzIArsq+4AsTCv
         t8qjcUFSi8ytOKHSC85ERUyJg1c69A+UT3vS3+fAbpceLzWJjredhYHnqFQ7DMtR3O1e
         G+aI6M9FQF7RGoy/vmuIFfbIewVoThR3YhLsPLJbpi0WQK41xx8ro87xjLWIZkRE+9nE
         eTulW2a24iWP9BGG+gL0gd3X5QIvVIVxrDPv6Q4TZ2B4RtqyGr08b7BYxfLSJt+Qd+1d
         Tw8ZA81bZ2UOUs/sltYPenjorY2Nui3ll24k/WWl6hdaX348jPRi9xgwY+8jrYXJEodQ
         rtZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788844645; x=1789449445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7FCFgCrO8nYxa4w36rz8tfzjeCQplkAjHhgkmQ0tkA8=;
        b=j8WkMTuHaZLXUR9ejUNzFG6MGQWCzM3SubBbWCGnb5P+ZZ+6NLcnxxmtEr47Emgtpi
         RycBnQ11/a4M0LsCPadrX1kHSmKOglXrV2xSSF5f1XTKn775nkyfI7S+pE7KxVXZvcMe
         uHf4OY5AlZtvOwPT2kz73WM0bmkFc9/t/ov9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788844645; x=1789449445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7FCFgCrO8nYxa4w36rz8tfzjeCQplkAjHhgkmQ0tkA8=;
        b=DntHSdTZpsVNuVIBT0P2q4jwsVAPhZ9QcuiWMEx7IQKVX8iTmXhc58eNw7FrGt3W9h
         CbcnApwMwIkorpLX/nZHEcTQbQZ3oNwVpOc/DTNpuCTyEtb71h66rqv1HWsfOdMwnQPV
         AHVU8ACqOaheH+iISfUsOe/qscs/JXQznk0TnlsUhPm31+1NjwofG8sT2LeNcKcN/fAn
         fr6lOKbyKjjIBVocClotQN6SxWA/sjrnefcRuppDyPeuae3d5VxsweV+4wiZK4UCDEVy
         A1E+SnPQ//a50PrOra2pjpiQiMoQVNAbFGOLEW2LLFbUdUzpDGLJNkunuckZMGljx2AU
         z8BA==
X-Forwarded-Encrypted: i=1; AKwUvBz2q9DZjrQYHkDdNEYJQWYwXbxIuAZGtySSWfGdA+WKNYz6pz4+yFZqHiO+BpJ93yoi+C81RSPNw5CqP98=@vger.kernel.org
X-Gm-Message-State: AFuF++lDXqtL+376MWJVjQa9+F9B+75N4pBGl7cYSxi+0AtWVx3QmjgW
	Csds5Yrcj4j1oVdxzzuXQPkLJviyDDWY7RABYOTmj6MEqSUQReR0IwiNK4nw7u1jwTkEA5PRxxG
	f07Hd3ftZKKZgvS4PlLCVoqk8pdCICkmLlG2KwbkTOVuIZr9x+1A=
X-Gm-Gg: AYBFou20VDCl5DzjlxW9VTv0npWry0/jxa32HOHNPXc+ZQJDOPIB0A0c9uFbNEKU0OK
	MR6XRPd7CyxeLfmf82mlSy/xRTXuSzcGpA7ZN3zQpD3OfAwNqjVKvKkEun9cGbDwYQ+a1W889/g
	DJMTTIVEs7juRefAqMWChxaIkpPzNtqjUCpqotGmOo0hs8MmHNGxIMLR2VItgIELJUAfqQjtVrm
	pzIshD4y6g6nhMfPoBWrxmHVk3N19V7PxNKBoJA9V7RB+c0LCxro1JpJ08Ymsrd7goFOKuVZSF8
	clCi0h04pcW3tGzGvQXGY/qp//74zM6lzpVZCnj/s6l6UnJ9osVccDX2Hq37G3r1CxNGVuXXDFs
	=
X-Received: by 2002:a05:690e:d49:b0:66f:c1bc:87db with SMTP id
 956f58d0204a3-66fc1bc8991mr4871587d50.52.1788844645029; Mon, 07 Sep 2026
 22:17:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908050229.754977-1-wenst@chromium.org>
In-Reply-To: <20260908050229.754977-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Sep 2026 13:17:13 +0800
X-Gm-Features: AcwNN1UvbZam4KMBF7rri3O2usHHuyHcUFKj6A3hEX1XxQedM-d5CJUALYS2SIM
Message-ID: <CAGXv+5FjHY36sHc+osF2ENjpz9Y97WDCzFEE0c+unXtyxR23Dw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/sun4i: Align VI buffer addresses for subsampled formats
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 1:02=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
> get display memory") dropped the code to calculate the framebuffer's DMA
> address in favor of drm_fb_dma_get_gem_addr().
>
> This turned out to be wrong in a couple ways. The hardware can handle
> pixel offsets within a sub-sampling block, but the buffer address must
> start at the beginning of the subsampled block for all planes. The
> hardware then does the interpolation internally. However the helper
> gives the address exact pixel for luma, which messes up the result.
>
> Instead of reverting the commit, calculate the intra-block offset and
> adjust the buffer address so that it points to the start of the block.
>
> Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to=
 get display memory")
> Cc: <stable@vger.kernel.org> # 7.1+
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Please ignore this one. As Sashiko pointed out, this could underflow the
buffer address.

Instead this should be sent along with another fix I have that switches
this back to the clipped buffer address.


Sorry for the noise.

> ---
> This is an alternative to Jernej's original revert:
> https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785=
772659.git.jernej.skrabec@gmail.com/
> ---
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index 2e9cda45c04e..185e9e5211c1 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -207,6 +207,20 @@ static void sun8i_vi_layer_update_buffer(struct sun8=
i_layer *layer,
>                 /* Get the start of the displayed memory */
>                 dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i);
>
> +               /*
> +                * The mixer can handle odd offsets into sub-sampled YUV
> +                * planes, but needs the address of the first pixel in ea=
ch
> +                * sub-sampled block. Adjust the luma buffer address back=
wards.
> +                */
> +               if (i =3D=3D 0) {
> +                       u32 x_diff, y_diff;
> +
> +                       x_diff =3D (state->src.x1 >> 16) & (format->hsub =
- 1);
> +                       y_diff =3D (state->src.y1 >> 16) & (format->vsub =
- 1);
> +                       dma_addr -=3D y_diff * fb->pitches[i];
> +                       dma_addr -=3D x_diff * format->cpp[i];
> +               }
> +
>                 /* Set the line width */
>                 DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
>                                  i + 1, fb->pitches[i]);
> --
> 2.55.0.979.g7e5102b832-goog
>
