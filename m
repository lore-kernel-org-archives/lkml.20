Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2139360EDE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789704993; cv=pass; b=shEzZWMjfx6FWG78ujBaqEaNrX5hLoy+lQKypPlHTk+Y+lVY3K4pbsMIXZ+FaAWprw2f4mehDOtwHhmfcFXr4nvwozUp8LoqqEs1lvqOR59RyIr+OVG1ojzLdOJeJKxtTHhCveFiGqZvFGdFzKOL/xrYwOF2KdoTjU+gVOKkPGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789704993; c=relaxed/simple;
	bh=Ru2OV2CffCL9NpSNIMTei8TR1QcXxODWTos4dcRwWHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4hdMD7jTCv73cl40xqTuZl7nebu+/CiXh82jRT2SemV6rx86pWSswfi0tcGEiJkBz+oJncW33Hhhbfq3NCsGt2Hw4jdq2Z0FUqoMkdmQorbW6facB4vv4TOIN+I+DLKxaHsS1XK2McfUmRj5HdxhuKtuEpn8xaX4wZk7w3NoIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M5jSN6CV; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M5jSN6CV"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab201f9so310021d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789704989; cv=none;
        d=google.com; s=arc-20260327;
        b=RPt2MED1cJtXyfAko6Xkb5Is22vLD+VRJ33rpc53PXQbEk75+K+ZbH5mVEdvaNSk6m
         NEiqb2WBEukrpRcrDPfhe4v9jJYnHf6Z0vO3hmc8nODQgzpV1glZK48zErvmWaU4CNHl
         RjfL4YSf9luzmGCOHmggAB3d/OFUCIoSiOJL+DJXkiyh3DhA1frDyF3wJSuXCzfi10As
         Qkb9xxRhCIU9xO71rRVXufCFHZqLIyDElLSkGp16050rIXToVNWYrWXIKIxqdzMl0ws1
         Jyy98oYNLpnA55d9p6gDBuvk5aOSohgzgMpvLhjIURZwRNU8F+Xk7Qb5oh9jkS3gNsVH
         6wzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g5DKEYyvWEAWVKejXJm1cVbz3X+KIz29ykH7P6jopns=;
        fh=L2/lhP1WgtAGOp0OvCKkm5OrulmrwwHmjjjWSui85WM=;
        b=b36o4mEeaIys3PzGkHT1nT1OKKd2GNiqolaTmHCvJU6b31hP+NGVot2xbVMkBGAdB2
         ifqru9/o6iNDqDFnTHlaGMjZQyCMhnT3TWHatUKaaixTNPZ5/FQF1bXU2HQRWXqDeK74
         /fl+hQTgw+LQO9wPzcM/JE2Dt/WteUevWIFa/x1v3QzuOhK6oCh7ZpWvNEJFLunHAG7a
         7/9xy+ntxj+4CmTbc3v6h/4aYRPrWiugMq4f5CMj8nmW43V8PrRaU+EKTTQ3T0MzaQ8Q
         iEialPjVtlVVZlKRXr7oq4U+A7PtbkhGoYSN61dXgMnLDgmgIUSDS89Lsu5EuM00uIrX
         Nrtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789704989; x=1790309789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g5DKEYyvWEAWVKejXJm1cVbz3X+KIz29ykH7P6jopns=;
        b=M5jSN6CVQwtcaWLE5zehzEUl3mQl7m/M7NbwZ+Ne9nQLUPG+OjhBEdOOrgDPUEc95J
         Q2Y9hm9AH08NwIm6pgnN3RTbSEYDmnUdeVDuxmMTAGZP6HkevuIFeXihB/PAd2/HiTtO
         VM9wYA80eOkSLKEDrjcvTAzaB8S1OOOzB3Y9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789704989; x=1790309789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5DKEYyvWEAWVKejXJm1cVbz3X+KIz29ykH7P6jopns=;
        b=QQfELX0JTit/yRYEdtYlYK+grcXVpR2V5lUfqynxD9b7jjBSQxzb6H5UHNDrqrwi1l
         45LU2TF+FMQWjhhGehDg4fnQBoEEppvFZD+V4Ud0/TkOw2jmFn4zKTgyurqWEl2x7rlI
         EgSoSiQDphjrpfUOlnblitQwsFXL0uSbTKhE3nYQxgpSP2xv7WgVQvIz7ySdAQGkxy7S
         Bf8+LWwfS4/XWKGwAJcKqHNyu4uh87j/sG/J8fzimD3LS++Oj6+afwASoEqdU93IY2pu
         JVt3z4a48CDC0jajJfa9U4p2wsIPGV2esZtofBHoeVNCnZpl8Y9riRGUmhNN2Bq3PJd0
         HLvA==
X-Forwarded-Encrypted: i=1; AKwUvBzYUkY9AQRjdAquos9Nnj57VR/z6AtA5YbxH1F0lO/OoAcfs26jFpidL7BhuLo1JMoU1JE9br7jGn83xNo=@vger.kernel.org
X-Gm-Message-State: AFuF++nP/a7Uuc0xsrWhLyYxMAQP67aRR9TxOfUBe3oQpOpYgrSthIhT
	BE3mxgZ7Xojx7c7l1XctGLITQliqNa/+ZmXwo6TxQkFW/i1EaiVuSHYsFDxh6+J54ox8jhGRYTG
	wJ2h5VLErOlyun2Fd7t8PUXqI+AN0vFkwVarjNscH
X-Gm-Gg: AYBFou2b6pn1zKuaf9h4gDWH9XCy45fF9hF/6ClTq6j6Gm41UPQUsGqizUIWWIYfKWZ
	X1i4GosffZY+buChTqv4oi+ML5hkp6eb5AyrPOsLqoeOOU4V1C8LeBY1e5ePaZ8xHCEVjICIT0F
	hVFYVAnkBnBo1W3kOZtB2Jfb1wAN5SbDSBgbdvr5AurJ5eSVWG54TKy0aSld7KpfkkV5FLACgol
	GyE04p7F/g+RvEDeqq2JtVXGCuMa/kXMw9cRJ1OOgyotSJ+Dq8vAdn+uts2gvvSPlPkitfPklpl
	SwSWOWM/ghlzGPsUM+V7nzQ8flmXuuL0nxi37m/I6+aBGRg1obphVuoroz96Z6Xp+weRTCXCsAX
	u5hLsxQUyOw==
X-Received: by 2002:a05:690e:809:10b0:671:3141:3832 with SMTP id
 956f58d0204a3-6717fc76ff0mr285169d50.4.1789704988719; Thu, 17 Sep 2026
 21:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916033327.3054126-1-wenst@chromium.org> <20260916033327.3054126-2-wenst@chromium.org>
 <f6ace486-70d8-4e81-89cb-e9d55ad9ac8b@suse.de>
In-Reply-To: <f6ace486-70d8-4e81-89cb-e9d55ad9ac8b@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Sep 2026 12:16:17 +0800
X-Gm-Features: AcwNN1UR3eVFLoBD9oF0TIdnuDNIVRYA94Woweb8vmhnl_ZgpInsWYdL86x54Xk
Message-ID: <CAGXv+5ErgWVNtnRiW+QA7+Mzh=W_Y+HGL_iRa1fOaXCYSoAwMA@mail.gmail.com>
Subject: Re: [PATCH RFT v2 1/5] drm: Split framebuffer pixel offset
 calculation from drm_fb_dma_get_gem_addr()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Liu Ying <victor.liu@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 11:20=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Hi
>
> Am 16.09.26 um 05:33 schrieb Chen-Yu Tsai:
> > Currently drm_fb_dma_get_gem_addr() calculates the offset into the
> > framebuffer memory for the framebuffer's unclipped source coordinates,
> > adds that to the framebuffer's backing storage, and returns the result.
> >
> > We are about to add a variant that uses the clipped source coordinates,
> > so there is already some reuse of code. However, calculating the data
> > offset for a given pixel is not specific to the DMA FB helpers. The
> > offset is only related to the framebuffer.
> >
> > Split out the offset calculation into a new framebuffer helper so that
> > non-DMA users can also reuse the same code.
> >
> > Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: <stable@vger.kernel.org> # dependency for next patch
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - New patch
> > ---
> >   drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
> >   drivers/gpu/drm/drm_framebuffer.c   | 45 ++++++++++++++++++++++++++++=
+
> >   include/drm/drm_framebuffer.h       |  3 ++
> >   3 files changed, 51 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_=
fb_dma_helper.c
> > index fd71969d2fb1..ab0f37d8a5ff 100644
> > --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> > @@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_frame=
buffer *fb,
> >                                  unsigned int plane)
> >   {
> >       struct drm_gem_dma_object *obj;
> > -     dma_addr_t dma_addr;
> > -     u8 h_div =3D 1, v_div =3D 1;
> > -     u32 block_w =3D drm_format_info_block_width(fb->format, plane);
> > -     u32 block_h =3D drm_format_info_block_height(fb->format, plane);
> > -     u32 block_size =3D fb->format->char_per_block[plane];
> > -     u32 sample_x;
> > -     u32 sample_y;
> > -     u32 block_start_y;
> > -     u32 num_hblocks;
> >
> >       obj =3D drm_fb_dma_get_gem_obj(fb, plane);
> >       if (!obj)
> >               return 0;
> >
> > -     dma_addr =3D obj->dma_addr + fb->offsets[plane];
> > -
> > -     if (plane > 0) {
> > -             h_div =3D fb->format->hsub;
> > -             v_div =3D fb->format->vsub;
> > -     }
> > -
> > -     sample_x =3D (state->src_x >> 16) / h_div;
> > -     sample_y =3D (state->src_y >> 16) / v_div;
> > -     block_start_y =3D (sample_y / block_h) * block_h;
> > -     num_hblocks =3D sample_x / block_w;
> > -
> > -     dma_addr +=3D fb->pitches[plane] * block_start_y;
> > -     dma_addr +=3D block_size * num_hblocks;
> > -
> > -     return dma_addr;
> > +     return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane=
,
> > +                                                             state->sr=
c_x >> 16,
> > +                                                             state->sr=
c_y >> 16);
> >   }
> >   EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
> >
> > diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_fr=
amebuffer.c
> > index d32aceb6ca9b..9e1231162047 100644
> > --- a/drivers/gpu/drm/drm_framebuffer.c
> > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > @@ -1208,6 +1208,51 @@ void drm_framebuffer_print_info(struct drm_print=
er *p, unsigned int indent,
> >       }
> >   }
> >
> > +/**
> > + * drm_framebuffer_get_block_offset() - Get offset to start of pixel b=
lock for
> > + * the given framebuffer and coordinates.
> > + * @fb: The framebuffer
> > + * @plane: Which plane
> > + * @x: x coordinate for pixel
> > + * @y: y coordinate for pixel
> > + *
> > + * This function will usually be called from the PLANE callback functi=
ons,
> > + * or from one of the helpers that calculates the framebuffer's DMA ad=
dress.
> > + *
> > + * Return: offset from start of framebuffer to start of pixel block
> > + */
> > +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsig=
ned int plane,
> > +                                  unsigned int x, unsigned int y)
>
> Better use u64 as return type.

To avoid overflow? Not sure who would use crazy large framebuffers, but
doesn't hurt to play it safe.

> > +{
> > +     u8 h_div =3D 1, v_div =3D 1;
> > +     u32 block_w =3D drm_format_info_block_width(fb->format, plane);
> > +     u32 block_h =3D drm_format_info_block_height(fb->format, plane);
> > +     u32 block_size =3D fb->format->char_per_block[plane];
> > +     u32 sample_x;
> > +     u32 sample_y;
> > +     u32 block_start_y;
> > +     u32 num_hblocks;
> > +     u32 offset;
> > +
> > +     offset =3D fb->offsets[plane];
> > +
> > +     if (plane > 0) {
> > +             h_div =3D fb->format->hsub;
> > +             v_div =3D fb->format->vsub;
> > +     }
> > +
> > +     sample_x =3D x / h_div;
> > +     sample_y =3D y / v_div;
> > +     block_start_y =3D (sample_y / block_h) * block_h;
> > +     num_hblocks =3D sample_x / block_w;
> > +
> > +     offset +=3D fb->pitches[plane] * block_start_y;
> > +     offset +=3D block_size * num_hblocks;
>
> User space controls the values in fb->offsets and fb->pitches.  I'm not
> sure how well they have been validated already at this point. Did you
> investigate this?

It wouldn't be worse than before, since this changes is purely code movemen=
t.

There are minimal sanity checks done by drm_internal_framebuffer_create()
in framebuffer_check(), such as offset overflow or pitch size too small,
but that's about it. It would be up to individual drivers to perform more
checks that match their hardware limitations.

What sort of issues are you thinking about?


ChenYu

> Best regards
> Thomas
>
>
> > +
> > +     return offset;
> > +}
> > +EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
> > +
> >   #ifdef CONFIG_DEBUG_FS
> >   static int drm_framebuffer_info(struct seq_file *m, void *data)
> >   {
> > diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffe=
r.h
> > index 38b24fc8978d..c07aea1cc59f 100644
> > --- a/include/drm/drm_framebuffer.h
> > +++ b/include/drm/drm_framebuffer.h
> > @@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuffer =
*fb);
> >   void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
> >   void drm_framebuffer_unregister_private(struct drm_framebuffer *fb);
> >
> > +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsig=
ned int plane,
> > +                                  unsigned int x, unsigned int y);
> > +
> >   /**
> >    * drm_framebuffer_get - acquire a framebuffer reference
> >    * @fb: DRM framebuffer
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
>
>
