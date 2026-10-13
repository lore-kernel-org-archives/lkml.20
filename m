Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F74E4F5DE1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893880; cv=pass; b=gk3oYT8obbjvN5b7a/Lg2V990H02pgfJuPigPhr3gz8U0qeYnHM9XFqakMHUbMNlNGl0bAGQJZSj8DC/ELRlxQXdC33nRMdzbPH2Xvk7U04HPvhKj4Rkzjk7Ls61MQXMxgKKJGd1EWvgGQH4HDaueUEYRPTipIBlaHyuT+v00XE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893880; c=relaxed/simple;
	bh=asZFhkA/F92uT/Dx7HrnQYhK7MgHcTMQa33ppTAg7LU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cL4aCmLI2qc1Ks3vsRByb/484eCJhCmV2dCxkByUzMMj6UxfN0S9ZALzEUJ7X3rhQ6yfOd8Z4NXUyMMUI/7N8XI2zt4QQr43SOGpggyS9IoBlZNowYAStpMtWAhxkDZTrfAP8Zd6mxESfo8paD21nIIQCobmGDVr2ptP5ubpE2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APcSRWV6; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APcSRWV6"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-43bf9548df4so2535699fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791893878; cv=none;
        d=google.com; s=arc-20260327;
        b=b4CQqIEEypjHxITIRgEn1Xsn1sXGEhT6g1y46H9ZYibL+g4eXb0L2X94n5hYdkU2Ah
         N6r1Hk4qFbS5FqdLME7p7LQBVVmRKQixkuccQD4VsbwQhgaj1YB9ufHybMkAPjP3ktNV
         ovnxau5hiEW5BILTIfClTuoVC5ou96idPp/TQPXDbY+azqThyMzv9CBNUiDvXyW6Gd+A
         TuTDZNJZ/oCKIid4OZNcqhDgDyHsQqUG8JDqO722YfvV4TFmPf8O7g3rhcUY2Tocu+Gv
         fAX0SfPpi4S9NHdxgs4cdhfdIx24y9NZEGz1pPw1dI07mNpKbcLwo3Ithok3FaU8yPZR
         nhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=52ntJQgHaqpg/GYORpwG/F/SvrAHAVug+tTyg9y3aII=;
        fh=bZ5yqVWc//WlkswfNqHV0RJVKl6RnZGwhTrLbfTx3VY=;
        b=ZqwgF9V0CsesmkYfJZkReTcXQe+q2bcRE0mKdzhJgV/YkvUMhgZza8Y0ZauNc0K/5c
         2KkoFrRDDFvKl5t8APiF78EqXGBTROwZb/gOBSJyKD4dCtHEy9l7SrDCCQZCd2h4DPPh
         GeglR5z0WhQfR2wdm2xccSwvsTrDhKZJMotk5SDRoFuzbPwpr1Tfs9YkG6W30KmR4v2E
         lpp2z6wfn/5F+A9SDldkWJppUxl9dcnJZTmASi70/1nyjtQbI0Oli+Q0PWNcBjS88tkV
         clCJer+4mEFtxXObJIz+wpaUGz8QlgNfX7mcyN9sH+YPGCg9dqq2baokiMQerXCLTZzw
         bt1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791893878; x=1792498678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=52ntJQgHaqpg/GYORpwG/F/SvrAHAVug+tTyg9y3aII=;
        b=APcSRWV6qEjnQIyhCOIKNlYTyCIAN1nDwlWTqO5cyVNWC6ULCs2SiyiXymy3SCFfpV
         JRmMeTtjAsRYtp1S7JPEpt0YIXzO7LP+rHSzOw5+JEQWdqjmyZcnBCVaIXvMGxSCstvL
         WJtqcIvnMsl56/L1jWAc1opj9Pf0v49PLW0kO8jGyZbKGiO4ARjh7P8l5lq0hobYXHpj
         p5DpusRCkuM6hMLYTE3co41ahPGiyBQgVaJdnpRtIfNGElTijjXUBuNkCGEQHLxzvc60
         +2763uSNZXpvQn5mFrMxmC9g/Ioef6dDcUjLiionQdRz0dXAdhKrFT78FJNphrqYBOcH
         DXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791893878; x=1792498678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52ntJQgHaqpg/GYORpwG/F/SvrAHAVug+tTyg9y3aII=;
        b=zaN9VXHy7IYKfie8Jg7ZEaaybPlVQRmCV34LoksCMNBCxGl0jMnR47ZFcO34EcOmqm
         awxhIr9eljYcHS6ZrOdu/aOk26gNOfILmYK+H+wUubjsafEDMdbhoe9TZpKG1WVpgxZu
         IeVdI3JYv6DHztwIa3qWW6sKHrQ0vsiAbKZ0R41WCFRRNqTRocBBA/YpXK82wk70XH26
         p2CY84Yl9vDzFZtpm7FN5LvcyCBt+FrciGzxGzdYNsi0WtB/m/ChWrmC0IqlvyMxu+hz
         qpiv286Sgdn9qhxrANAmc2siY7udNjAV3xQP8l5+b2PCO6Y+Og8j1Sk/a0942G3OPLom
         K2Ow==
X-Forwarded-Encrypted: i=1; AKwUvByl1qgvZvACO6V5NuaXusxlT32/ZhIkknkz0wuKp6n3PDYL5Z6Q6BhwtpeL+dQ4k93fuCEY3pun23vd2AA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsxUWNYRj1kOr6+9eVNi+M1XEm3U3myJU4birg59N0J7s/eyht
	mb5UUpKjNkPF2NdsEmOcc4XEX9aUXmdYLJiW03I9vHNrSQtqxMlUnGKLJP9YcqdKjla0o4JkB9e
	cXSHTLtsAL64RJAyb1XmutlDMGlAYCSs=
X-Gm-Gg: AYBFou0U/CLsRIIfDRuYOti0ynaGS1IcvrFs5ZBQTGQkqT1Mw6wAB7EH+tWdKFkfBuu
	UDkVkbvSwgNvOwQFYcSxebN7pjdUrV+/H9BDO267WG6L3J0tHwYJoOD/Act+KO8ZHYgRtkAnwO3
	9+Vq04gEmbnbQAHB/CdHa8zWT26yVsmGd/OupEsG/lF+P48K7sivn2tI6GCUt9aM6PKoN9foX7g
	ZolBfpR7b2rL4oQODHmFHfxvRZJFWkvR63J3ktBzO5S85rUt4wt2GuGrmcM6naYNLRFNcXIlCm7
	XNUf5TBah4owZ6TMMmKQDhaB+sidNT54VfeEYG5Fd36T96vshWx8P3rc7AWbpG0m1VxRPBIMGyc
	C+MHea5GNetgf9Q==
X-Received: by 2002:a05:6871:c8db:b0:49d:e4ee:659e with SMTP id
 586e51a60fabf-4a2a8a00708mr10063849fac.30.1791893878393; Tue, 13 Oct 2026
 05:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012170857.199561-1-hjf3108@gmail.com> <64707239-eac7-4259-a8ff-7ec43d13860e@suse.de>
In-Reply-To: <64707239-eac7-4259-a8ff-7ec43d13860e@suse.de>
From: Jie Feng <hjf3108@gmail.com>
Date: Tue, 13 Oct 2026 20:17:22 +0800
X-Gm-Features: AclHuK_mJZ03myM_AtOCYvoNr5sOjN6GcRZmHXgY4Oy3jSRdKK8mjAhisQLh4IY
Message-ID: <CABOQOSXgG2kBzs2sBEE69mmPcO0cKVgjyk_6DG5RST_4uL2+sg@mail.gmail.com>
Subject: Re: [PATCH] drm/format-helper: Add XRGB8888 to UYVY conversion
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Oct 2026 at 15:11, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>
> Hi
>
> Am 12.10.26 um 19:08 schrieb Ho Jie Feng:
> > Add a helper for devices that use packed UYVY but accept XRGB8888
> > framebuffers.
>
> Is there a description of UYVY available somewhere?
This is for a reverse engineered usb display adapter, which accepts
input in bytes of U, Y, V, Y in that order. I'm not sure what
counts as a description, apart from it matching DRM_FORMAT_UYVY?

This patch is meant to move this out of the driver:
https://github.com/rhgndf/ms912x/blob/main/ms912x_transfer.c#L153

> >
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> > This is used for a driver, ms912x that I will be submitting. It only
> > supports uyvy framebuffers.
>
> Please resubmit as part of the driver series. We're not going to merge
> it without callers anyway.
> ...
> For naming, please follow the conventions used by the other helpers in
> this file.
Will send the driver in with this patch and its fixes, thanks for the revie=
w.

> ...
> > +             v =3D drm_pixel_rgb2_to_v_bt601(r, g, b);
> > +             u =3D drm_pixel_rgb2_to_u_bt601(r, g, b);
> > +
> > +             transfer_buffer[dst_offset++] =3D u;
> > +             transfer_buffer[dst_offset++] =3D y1;
> > +             transfer_buffer[dst_offset++] =3D v;
> > +             transfer_buffer[dst_offset++] =3D y2;
>
> Rather that writing bytes individually, use put_unaligned_le32() or a
> similar helper.  Byte order within a pixel is little endian, although
> I'm not sure what this means for UYVY.
This is meant to be sent over a usb transfer, so byte order needs to be
the same on both little and big endian systems.

> > ...
> > +static inline u32 drm_pixel_rgb_to_y_bt601(u32 r, u32 g, u32 b)
> > +{
> > +     const u32 luma =3D (16U << 16) + 16829 * r + 33039 * g + 6416 * b=
 + 32768;
> > +
> > +     return luma >> 16;
> > +}
> > +
> > +static inline u32 drm_pixel_rgb2_to_u_bt601(u32 r2, u32 g2, u32 b2)
> > +{
> > +     const u32 u =3D (128U << 17) - 9714 * r2 - 19071 * g2 + 28784 * b=
2 + 65536;
> > +
> > +     return u >> 17;
> > +}
> > +
> > +static inline u32 drm_pixel_rgb2_to_v_bt601(u32 r2, u32 g2, u32 b2)
> > +{
> > +     const u32 v =3D (128U << 17) + 28784 * r2 - 24103 * g2 - 4681 * b=
2 + 65536;
> > +
> > +     return v >> 17;
> > +}
> > +
>
> These helpers seem too fine-grained. IMHO it would be better to have a
> helper like  drm_pixel_rgb_to_uyvy() that takes two RGB values and
> returns the assembled 16-bit UYVY value.
Makes sense.

> Best regards
> Thomas
>
> >   /*
> >    * Conversion from ARGB8888
> >    */
> > diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_h=
elper.h
> > index 2b5c1aef80b0e..e50f96e07484c 100644
> > --- a/include/drm/drm_format_helper.h
> > +++ b/include/drm/drm_format_helper.h
> > @@ -136,4 +136,8 @@ void drm_fb_xrgb8888_to_gray2(struct iosys_map *dst=
, const unsigned int *dst_pit
> >                             const struct iosys_map *src, const struct d=
rm_framebuffer *fb,
> >                             const struct drm_rect *clip, struct drm_for=
mat_conv_state *state);
> >
> > +void drm_fb_xrgb8888_to_uyvy(struct iosys_map *dst, const unsigned int=
 *dst_pitch,
> > +                          const struct iosys_map *src, const struct dr=
m_framebuffer *fb,
> > +                          const struct drm_rect *clip, struct drm_form=
at_conv_state *state);
> > +
> >   #endif /* __LINUX_DRM_FORMAT_HELPER_H */
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Stefan Gaiser, Jochen Jaser, Abhinav Puri, (HRB 36809, AG N=C3=BCrnbe=
rg)
>
>
