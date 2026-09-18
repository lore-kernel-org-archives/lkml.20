Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC7838BF6A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715848; cv=pass; b=TLoJ0YPOwBGYZwf/hNEKdqCY1pIGA3YcB1WSurTb8Gf2zsXzSJK+DlbJyykTyTFyNPayXDu2x7NOAIB2DHcXiu2AGzXUyRHG8wFEGKypJKkbwq2YAQvzX+epgirN3A5axd4U82U8cLRit4bpvQdp5IIPw7Dw6k57waDvDJXFmlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715848; c=relaxed/simple;
	bh=2Bm3gAwazjbLTUFW3jtpTEj1rRnxPSASuhBdBF/Mong=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=En3UI5snrHhmqu6stfKtOgm9+/aIkzyM5VettQuZScjX8FRZVZ4RvyMr3FoHkd8D7xhp/C7trF8Mn3xpxmbEo6fjgllvhXLzDaIAuRe5FgxGRQ13mv5qZid/rL8hotO9cqXSUexNIJeLg+uY6Qrue8ieJdYtZnGijaDyO6beK80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HGPXu1aA; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HGPXu1aA"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66f7f72a284so373277d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789715844; cv=none;
        d=google.com; s=arc-20260327;
        b=eHHzxiZOkeed5ZdhLBx3ixeoT9/LvK9IMBxEJXpuHBLPQTwGEIGOlwzCjh4O3ofi+p
         OPKHxtDii/bWtEAiKHeuatZhnxBbnZAuexdVVBFlb14ZpEyzU6lKT+ja9n078eB1EfEI
         HRdDGTbeQS5+494oaqwKmIKuv2t1aohiz7G2BR3ieEwErEi86/iKDxeyRIWGphc0fEhP
         Ut3rqawKCZ90azONu5uFOmAz73o05jIy01mk4DMMgsjPUYYLSI8TvNJ2HRbaA7lRhB7/
         ePHZCAInxSqyxEuyNYxIFzyEtXXTC/prIgTrV5RmO+9pojIA7JZEFOLfzhbbDeaLd//4
         v9ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITqNY912hHAbwc9T2h8ninUwVl/brEY9TWjcH5XDilY=;
        fh=QY1P7UDhYXB0irUJWePPla2JxLguo3/8UeglWZ00wR4=;
        b=XBhdN7xKhoQuPg5rBGbTlyldzWKijwmIx6J6nx3pCqI4w6szXtXFzjoxHIS+GVRiB1
         EYL1EWYYhSq6JkAeBZpUgXvldRG44PMlHiDoVdIZdE96hSzicWvtfka8j7V52Q5Kn0tE
         q4K5CTTKXF7GAYv28ZBRoUhNtvRkWAaK4qm07rEpMouV+tyIgEmeUsQhy9VmNNGqef4z
         ERs6WrgMuldW8bau6A0C3hCiIfTpXTT4cJpaJ0T/UsZD48WTwsGTUDFeo7QDlHlGKfFD
         65bdFL10B7Fg4CtMlTgq+ZkK4tGYyyTPweBGp169hxgIQxw5zfG4VnafvA9DBcUuks+D
         f54g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789715844; x=1790320644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITqNY912hHAbwc9T2h8ninUwVl/brEY9TWjcH5XDilY=;
        b=HGPXu1aA2c9NKqJZH2dQnmh4gojs6EcsgYRcJAT95un/mPNE+b7PYgm4IoE09r2+wj
         pjUxzG27t2Iqj5b/YJ9uHmo63LI0btERqb/6dZPPzyMvW0DA7vwAgYQ3h2zG7XnezkZy
         ww0rBJJcUSDmfScKqcKb/RHYKiwPsCxaqutyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715844; x=1790320644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITqNY912hHAbwc9T2h8ninUwVl/brEY9TWjcH5XDilY=;
        b=zyazp8W47P7XvQ9aBPMjSnUjJ9ZeFc6ItlT8c0Ev48DZP3z3/vYzlm8/d6gqJS66Ux
         4bO0b2iVoyPThX/DavbQ7i86lKQDJWI2Jw1/vVv9H1C4JDU7onmTElGzuLYqrqY8lUW0
         MY8TCXOxfcxfW3rESxkWXCpN8sEa7jRXXOWTO30BayLUxlwMJZFQxYuMNhEGged/8Rtd
         YSicseJtzNRAcFrf8YmO1mRtPVg62D71GW+89SRZRtEf8F2nkXRWkxBO7W4gH5NJ8IkO
         b+1pQekxoco7CouGj8aSJz3EftRrUkFgOHs9LQU8WntsTvVcMAp0VB22rjgOXEoyjor/
         dKxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkKiYRd/Fh97+SLffgjQswnL3xM9rIg9PH1TLtEsrJQ76bThW10xPPYrcQqfLRosOVkfCts48XrFbUrdA=@vger.kernel.org
X-Gm-Message-State: AFuF++mbHPOzK5qNjSp1Hazz4CfVwxSBPWkXfznHoO0l2rWEu7i6CmYM
	xGZnzEapfqYMgWwdNaoFOfp9TFztjlSl0tHg3j2BoJmC02i+X16gSw4P04ajmMEWNt9i8G8Dsf/
	QF1QhXVfERHi/pF+qBa4kpmJY+34kIhPgau/sGIxH
X-Gm-Gg: AYBFou3ROTInkqT2z47mmRhmn4aPMCyOanVUNuBjGIGkM6Xa4mXX1RVg6hZp4D/VFKo
	HSAbmvfpYs1gxcL/qUrP0fFdoOLDB27IVOwrZWF4dOZvAKGz4GdhF6geFV/pMa/PFHxDqjy4XwL
	XtxqGTIJuHGxGV76vfcbt7ERFN7NDzihl4tGNrX/AGfdHNlwyqU/yfUe51EzVum1TIn0JxcZtmm
	e6vbhECzUa/Q2f40+p+kcE+lVjT5m0qu5ex/rdSpHpJb6J2/FKtMcrc8TkGh/3cdA6HSG3Rhjk0
	Z7t4KTz+jUUULi4YF57XLAqo3+qO7loSrTzKnhdByGyDWySsKqs8F4o4n3KnjmPlGEWOxomOQ1e
	MyxVJOrvsHg==
X-Received: by 2002:a05:690e:1244:b0:667:ba34:51e2 with SMTP id
 956f58d0204a3-6717fc73f18mr528044d50.13.1789715844017; Fri, 18 Sep 2026
 00:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916033327.3054126-1-wenst@chromium.org> <20260916033327.3054126-2-wenst@chromium.org>
 <f6ace486-70d8-4e81-89cb-e9d55ad9ac8b@suse.de> <CAGXv+5ErgWVNtnRiW+QA7+Mzh=W_Y+HGL_iRa1fOaXCYSoAwMA@mail.gmail.com>
 <f7fa4c4c-bc59-4822-94bb-6e9d68f8f0ca@suse.de> <CAGXv+5GNjKxzHuBn28PbRtbFA1yuJ7h02xDpght4add3emuKJg@mail.gmail.com>
In-Reply-To: <CAGXv+5GNjKxzHuBn28PbRtbFA1yuJ7h02xDpght4add3emuKJg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Sep 2026 15:17:12 +0800
X-Gm-Features: AcwNN1VfNznx-wGfs8r_CeKKtrEj641j8sqUrt8qB1yK2OIkZ-fPkbPmzPQcswY
Message-ID: <CAGXv+5FOB9Y3HCt=ydrcUPdo7S92MiJRqsjXAZiW99-3NfYECQ@mail.gmail.com>
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

On Fri, Sep 18, 2026 at 3:06=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Fri, Sep 18, 2026 at 2:41=E2=80=AFPM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
> >
> > Hi
> >
> > Am 18.09.26 um 06:16 schrieb Chen-Yu Tsai:
> > > On Thu, Sep 17, 2026 at 11:20=E2=80=AFPM Thomas Zimmermann <tzimmerma=
nn@suse.de> wrote:
> > >> Hi
> > >>
> > >> Am 16.09.26 um 05:33 schrieb Chen-Yu Tsai:
> > >>> Currently drm_fb_dma_get_gem_addr() calculates the offset into the
> > >>> framebuffer memory for the framebuffer's unclipped source coordinat=
es,
> > >>> adds that to the framebuffer's backing storage, and returns the res=
ult.
> > >>>
> > >>> We are about to add a variant that uses the clipped source coordina=
tes,
> > >>> so there is already some reuse of code. However, calculating the da=
ta
> > >>> offset for a given pixel is not specific to the DMA FB helpers. The
> > >>> offset is only related to the framebuffer.
> > >>>
> > >>> Split out the offset calculation into a new framebuffer helper so t=
hat
> > >>> non-DMA users can also reuse the same code.
> > >>>
> > >>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> > >>> Cc: <stable@vger.kernel.org> # dependency for next patch
> > >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > >>> ---
> > >>> Changes since v1:
> > >>> - New patch
> > >>> ---
> > >>>    drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
> > >>>    drivers/gpu/drm/drm_framebuffer.c   | 45 +++++++++++++++++++++++=
++++++
> > >>>    include/drm/drm_framebuffer.h       |  3 ++
> > >>>    3 files changed, 51 insertions(+), 25 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/=
drm_fb_dma_helper.c
> > >>> index fd71969d2fb1..ab0f37d8a5ff 100644
> > >>> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> > >>> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> > >>> @@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_f=
ramebuffer *fb,
> > >>>                                   unsigned int plane)
> > >>>    {
> > >>>        struct drm_gem_dma_object *obj;
> > >>> -     dma_addr_t dma_addr;
> > >>> -     u8 h_div =3D 1, v_div =3D 1;
> > >>> -     u32 block_w =3D drm_format_info_block_width(fb->format, plane=
);
> > >>> -     u32 block_h =3D drm_format_info_block_height(fb->format, plan=
e);
> > >>> -     u32 block_size =3D fb->format->char_per_block[plane];
> > >>> -     u32 sample_x;
> > >>> -     u32 sample_y;
> > >>> -     u32 block_start_y;
> > >>> -     u32 num_hblocks;
> > >>>
> > >>>        obj =3D drm_fb_dma_get_gem_obj(fb, plane);
> > >>>        if (!obj)
> > >>>                return 0;
> > >>>
> > >>> -     dma_addr =3D obj->dma_addr + fb->offsets[plane];
> > >>> -
> > >>> -     if (plane > 0) {
> > >>> -             h_div =3D fb->format->hsub;
> > >>> -             v_div =3D fb->format->vsub;
> > >>> -     }
> > >>> -
> > >>> -     sample_x =3D (state->src_x >> 16) / h_div;
> > >>> -     sample_y =3D (state->src_y >> 16) / v_div;
> > >>> -     block_start_y =3D (sample_y / block_h) * block_h;
> > >>> -     num_hblocks =3D sample_x / block_w;
> > >>> -
> > >>> -     dma_addr +=3D fb->pitches[plane] * block_start_y;
> > >>> -     dma_addr +=3D block_size * num_hblocks;
> > >>> -
> > >>> -     return dma_addr;
> > >>> +     return obj->dma_addr + drm_framebuffer_get_block_offset(fb, p=
lane,
> > >>> +                                                             state=
->src_x >> 16,
> > >>> +                                                             state=
->src_y >> 16);
> > >>>    }
> > >>>    EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
> > >>>
> > >>> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/dr=
m_framebuffer.c
> > >>> index d32aceb6ca9b..9e1231162047 100644
> > >>> --- a/drivers/gpu/drm/drm_framebuffer.c
> > >>> +++ b/drivers/gpu/drm/drm_framebuffer.c
> > >>> @@ -1208,6 +1208,51 @@ void drm_framebuffer_print_info(struct drm_p=
rinter *p, unsigned int indent,
> > >>>        }
> > >>>    }
> > >>>
> > >>> +/**
> > >>> + * drm_framebuffer_get_block_offset() - Get offset to start of pix=
el block for
> > >>> + * the given framebuffer and coordinates.
> > >>> + * @fb: The framebuffer
> > >>> + * @plane: Which plane
> > >>> + * @x: x coordinate for pixel
> > >>> + * @y: y coordinate for pixel
> > >>> + *
> > >>> + * This function will usually be called from the PLANE callback fu=
nctions,
> > >>> + * or from one of the helpers that calculates the framebuffer's DM=
A address.
> > >>> + *
> > >>> + * Return: offset from start of framebuffer to start of pixel bloc=
k
> > >>> + */
> > >>> +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, u=
nsigned int plane,
> > >>> +                                  unsigned int x, unsigned int y)
> > >> Better use u64 as return type.
> > > To avoid overflow? Not sure who would use crazy large framebuffers, b=
ut
> > > doesn't hurt to play it safe.
> >
> > I'd be worried about a malicious user space that tries to access OOB.
> >
> > Apart from that, we use u64 for other framebuffer-related sizes like
> > pitch calculations or dma addresses. Using u64 here would keep that
> > consistent.
>
> Indeed. It seemed weird that the helper originally used u32. Maybe it
> was carried over from CMA on ARMv7, which predominantly only had
> 32-bit address space data busses?
>
> >
> > >
> > >>> +{
> > >>> +     u8 h_div =3D 1, v_div =3D 1;
> > >>> +     u32 block_w =3D drm_format_info_block_width(fb->format, plane=
);
> > >>> +     u32 block_h =3D drm_format_info_block_height(fb->format, plan=
e);
> > >>> +     u32 block_size =3D fb->format->char_per_block[plane];
> > >>> +     u32 sample_x;
> > >>> +     u32 sample_y;
> > >>> +     u32 block_start_y;
> > >>> +     u32 num_hblocks;
> > >>> +     u32 offset;
> > >>> +
> > >>> +     offset =3D fb->offsets[plane];
> > >>> +
> > >>> +     if (plane > 0) {
> > >>> +             h_div =3D fb->format->hsub;
> > >>> +             v_div =3D fb->format->vsub;
> > >>> +     }
> > >>> +
> > >>> +     sample_x =3D x / h_div;
> > >>> +     sample_y =3D y / v_div;
> > >>> +     block_start_y =3D (sample_y / block_h) * block_h;
> > >>> +     num_hblocks =3D sample_x / block_w;
> > >>> +
> > >>> +     offset +=3D fb->pitches[plane] * block_start_y;
> > >>> +     offset +=3D block_size * num_hblocks;
> > >> User space controls the values in fb->offsets and fb->pitches.  I'm =
not
> > >> sure how well they have been validated already at this point. Did yo=
u
> > >> investigate this?
> > > It wouldn't be worse than before, since this changes is purely code m=
ovement.
> > >
> > > There are minimal sanity checks done by drm_internal_framebuffer_crea=
te()
> > > in framebuffer_check(), such as offset overflow or pitch size too sma=
ll,
> > > but that's about it. It would be up to individual drivers to perform =
more
> > > checks that match their hardware limitations.
> >
> > Right, makes sense. Looking through the framebuffer validation, a
> > buffer-size check could be done in framebuffer_check().  But that's
> > another patch series.
>
> That's further covered by drm_gem_fb_init_with_funcs(), which
> drm_gem_fb_create*() goes into. I didn't check all the drivers that
> implemented their own .fb_create callback though.
>
> - rockchip uses the GEM FB helpers
> - MSM reimplements the GEM FB helpers, but does have proper size checks
> - nouveau has size checks
> - omap has size checks

Side note: it seems that the drivers that reimplement
drm_gem_fb_init_with_funcs() do so because they need to do additional
checks on the (sub-classed) GEM objects. Perhaps exporting drm_gem_fb_init(=
)
or deconstructing drm_gem_fb_init_with_funcs() could allow more of them
to use common helpers for things like size checks.

> > >
> > > What sort of issues are you thinking about?
> >
> > Again, I'm thinking of malicious user space that crafts these values to
> > force an OOB access.
>
> I think we're covered.
>
>
> Thanks
> ChenYu
>
> > Best regards
> > Thomas
> >
> >
> > >
> > >
> > > ChenYu
> > >
> > >> Best regards
> > >> Thomas
> > >>
> > >>
> > >>> +
> > >>> +     return offset;
> > >>> +}
> > >>> +EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
> > >>> +
> > >>>    #ifdef CONFIG_DEBUG_FS
> > >>>    static int drm_framebuffer_info(struct seq_file *m, void *data)
> > >>>    {
> > >>> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_frameb=
uffer.h
> > >>> index 38b24fc8978d..c07aea1cc59f 100644
> > >>> --- a/include/drm/drm_framebuffer.h
> > >>> +++ b/include/drm/drm_framebuffer.h
> > >>> @@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuf=
fer *fb);
> > >>>    void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
> > >>>    void drm_framebuffer_unregister_private(struct drm_framebuffer *=
fb);
> > >>>
> > >>> +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, u=
nsigned int plane,
> > >>> +                                  unsigned int x, unsigned int y);
> > >>> +
> > >>>    /**
> > >>>     * drm_framebuffer_get - acquire a framebuffer reference
> > >>>     * @fb: DRM framebuffer
> > >> --
> > >> --
> > >> Thomas Zimmermann
> > >> Graphics Driver Developer
> > >> SUSE Software Solutions Germany GmbH
> > >> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> > >> GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
> > >>
> > >>
> >
> > --
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> > GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
> >
> >
