Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0993151CF77
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907166; cv=pass; b=u6XiETT6HQUNY1dtr/Z2LzONFyA9TDCs0cVMPKBRCHMJJ9crUX49ryNy4aVWmM43GVmKZQ4g8ObkcWoWd49i6dYEoCl4r0Ra8Yo+YMegtg0lEdh+9awt5qmn0bPStLME66Eb0FvcgfosW1GHmk5FZEOZHj1EEp0d+AOEa2Azk3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907166; c=relaxed/simple;
	bh=2oCtNeP+a7K50p/DwARzr4Cfozk9bHgkVxng+Fzd15A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CiYtr7A/pQw9XiRwDYBEvwJexGhwCttiRm85czY+5LON9MezrmCVK/o/sUDXTnJgHoABOBsDM+7/09hXxYBNGMCensDoEWj8kXUnfRrHf3U1FKUbJHe3XBkmwazYvvgd5vQ98BWDoREir0saq6M1WpvWVo+ew3h8qNs89GA8eqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Pm0e79Sr; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Pm0e79Sr"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6f8a519e215so1281408eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791907164; cv=none;
        d=google.com; s=arc-20260327;
        b=IuWisDOuyhzGTtGzKCjp8PXCdxTeUN5K+o1Ojw2oH4eRFrzsq4FD8QT54HhXAVFm8R
         bZaallhWyzS9g8j3TJL+ePsEsX+Rqr9GidpHQJnFNbpcZGa6xt+EiDc/CXP4MRhvl107
         dK+9Y11F0XU9KPGEgZGzbJfdbEyJA1WBVdq43n9kOp/QSYEjQyi+w8fywJQ/M73lRfsa
         0ilG5MgJ44WcPjnMHGbSSNBvydIlROd7YGWShwEjlSTVzQolt5VEqfLr3g7WB0crjqd+
         9Pc/vODDXVPQhweWgvgmjGcuEo6LDUYdAfNQV8TllKnHyk3cdegHAonjBiVhB9/E1SBN
         2w0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=471AP+JUSNenBEdZwpiD4vRzIzL42+r3rsOryeaTPFo=;
        fh=wp/EdqDlhk2+nooqioR80/pDfcxkAOteVRB2+nnEasE=;
        b=Dfk36FKSYYAF0zZngU+JjDKh7o7CeWKMoSdGZbp6+egkTo0t5hagLSXl8rEwxD2bHr
         8LnXH3RQ/LrKdKbQ1A3oORh93KYpCwIyrhCUZtNBW6EjqKPZBBtWrtg72DIu9YRq3inS
         chyiYTQft+7XC6BDVo2DGq/h+NTYli3Sfuvt19bAYRyremBd8mEsFzQaG8Ftemd5T5Dk
         7ubBt2ZPLul7P78CrmHj6ctxz4uHk0KGuyIGrA5hlMNJZAxk6uAQR1FIqax2PlN4LIgc
         CTT5+lT3VEGWQJPyLLnD0eYEhLpbhtKEc7j4K5S9P0YYh7PoOUTreD8yo5Ua9zelrwL3
         0LSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791907164; x=1792511964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=471AP+JUSNenBEdZwpiD4vRzIzL42+r3rsOryeaTPFo=;
        b=Pm0e79Srst9tNA2VUSQftH0fcb8xhVoh8TN9PecwK/+QPkiOnICf2SeVB4Q3ZCUimY
         fOb/SGNIFuTHUj7bKvLSRf6CstHnZCm6e9RPY/diJ1KZD+EsEG+ld8MXiKvrDooNNLGw
         y6egBryNAYKDJieAgvUrcvuDozWX3txvMHHS9vIX3YExTPEzbeMciP9q0xOpc9G5/wtY
         bd3SvAlQs6IbsyFLGzuUXeXEBN1XAgzQaezshe/mid08brmxPLrBmZJDuHsCq885q9KY
         kwJbSrFdI67a2DrjTX8fjSk/qag+paAazRovKBiEEayifTuRa5aKIhiRqdIEDDahJiex
         VFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791907164; x=1792511964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=471AP+JUSNenBEdZwpiD4vRzIzL42+r3rsOryeaTPFo=;
        b=bWg9TqKh6wLhsHAgtJYCQnioxSwZE3U2vzzwfHlFHmcrboEskShl+ZwR4Cqb9O87cw
         tmRJmqsEhokP5sNFQTud6hKhto9Aw20sEAo4DxN/Vn+tfTQ4SbfRXtmAV77brw3Slwuw
         CQk1r1nNyTnS9MuShB+hZKoo2sIYNzp/UX7YM4liu0fDLIOhk1TAEPcO94eE9lmvLjjB
         f/9Iy1ML2PncRwMYeKhXBopu3DqwAEV9IGDFWCAUJcXGRO2uvzy4p9ADtbRm25JjhLkB
         lPs6pm8pPpwAwc4U5EGLypbG1wa1dtRE9dy/SptKhontZGS8IIFBIOGA8juqGv4Pb7cT
         2SEA==
X-Forwarded-Encrypted: i=1; AKwUvBzHOJiucEIuFdmoOt1Jk4KPAOro9yTcGCkAPwkbrE4ySAXFjTjPxP9yU7Mw7crRG0nwbBLA/nRnhNsAsNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZQI0tTHxZTOO27O07VZqVamTbEmsU1xvCqsr+kqQ/b2l1Te1o
	kiRooVUYN2dmlXsFrh5svmlpumeazKQKpg1c1/KIeS7kELVsIVsiiu8cTW4tpoLpbPcfWSauj59
	f5xT1jvokVcSy+wqtxRB8CNpYvGAlgP5rdUnQaHbp0Q==
X-Gm-Gg: AYBFou2/Gnk7J+SVMGLQiTbERa+GSxyBRp8CtZ/60V7qX4JSsdKecfpquFa0Nds09hM
	taBLZ1VK/fIer/vALZdXAaYpgnyoAhQvKgXfA3/GbJz0h3CLPX5DLQJPdKSCZJV2Vk+P0duXPA2
	QUKy0LRGxNRq4Db5FGoWDsdAcBN9D6ze4cQYgZhg4wThqS38ly5thrtuvYwsewJEF7pfIw3hL5w
	FXnHrVE+47E7Ok+31eErlxDyEgF9VHYZy6v7/wpBw9C2UI/GEkSjXA0z+DG8gXFzBU+avjoTJC6
	0VoQwBd5Iw7kdm/8lUSQae75JEpDGw37O8Q1kX7OVcInBLnNak4ayiUm5j0ZZ/hbPbtS/vFr9AJ
	AUh00rS+q7zyPKB+8W4c9uvncSi+n7ey/dXXohmh4xl+onMCGAGYQ6kQidLctLQfaBBRt5LLD
X-Received: by 2002:a05:6820:81c6:b0:6b6:5bf3:e22e with SMTP id
 006d021491bc7-6eee1a3dfe1mr7406315eaf.10.1791907163856; Tue, 13 Oct 2026
 08:59:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-vc4-common-scramb-v2-0-a41d15e131ad@collabora.com>
 <20261013-vc4-common-scramb-v2-2-a41d15e131ad@collabora.com> <682b6dc0-0b9f-4b2c-afd5-459e3f669130@collabora.com>
In-Reply-To: <682b6dc0-0b9f-4b2c-afd5-459e3f669130@collabora.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:59:07 +0100
X-Gm-Features: AclHuK8hoDKY44EJ0rfjetH_v24c2VlTouopa1nFQCxRREJQjwG_yJTlNInvPgI
Message-ID: <CAPY8ntBFT_R1HbzzCvdvJ01SV8db0Cz7HcuRE7HaoyJ3-1FATQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] drm/vc4: hdmi: Bump BCM2835 max pixel clock to 165 MHz
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cristian

On Tue, 13 Oct 2026 at 01:16, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Hi Dave,
>
> On 10/13/26 1:37 AM, Cristian Ciocaltea wrote:
> > Historically, the HSM clock for BCM2835 was fixed at 163.7 MHz.  Since
> > the pixel clock had to be at least 1% below the HSM clock, it was cappe=
d
> > at 162 MHz.
> >
> > Since commit cd4cb49dc5bb ("drm/vc4: hdmi: Adjust HSM clock rate
> > depending on pixel rate"), the HSM clock rate is set to pixel clock *
> > 101 / 100.  For a 165 MHz pixel clock, this gives an HSM rate of 166.65
> > MHz, which, per Dave Stevenson, the hardware can handle without issues.
> >
> > Increase the max pixel clock to 165 MHz, which matches the maximum TMDS
> > character rate of HDMI 1.0 through 1.2.
>
> It seems this will cause CEC register corruption:
>
> https://sashiko.dev/#/patchset/20261013-vc4-common-scramb-v2-0-a41d15e131=
ad@collabora.com?part=3D2
>
> We can easily address this by clamping the CEC clock divider to its regis=
ter
> field width:
>
> -       clk_cnt =3D cec_rate / CEC_CLOCK_FREQ;
> +       clk_cnt =3D min_t(unsigned long, cec_rate / CEC_CLOCK_FREQ,
> +                       VC4_HDMI_CEC_DIV_CLK_CNT_MASK >>
> +                       VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
>
> The consequence is that the CEC clock would run slightly faster than the =
nominal
> 40 kHz, i.e. (165000 =C3=97 101/100) / (2^12 - 1) =3D 40.6959 kHz.
>
> I think this is still within the CEC bit-timing tolerances and shouldn't =
cause
> any issues.  Could you please confirm?

My reading of the CEC spec agrees.

All the timings have tolerance of +/- 0.2ms on values up to 4.5ms, so
that would allow up to a 4.3% tolerance on frequency.
The error from clipping the clock divider is 1.74%, so fairly
comfortably within tolerance.

It's only video modes with clocks in the range 162-165MHz that will
have any inaccuracy, so pretty limited in scope anyway.

Working backwards, achieving a 40kHz output with the max divider works
out to be a 163.8MHz HSM clock, so that would appear to be why the
limit was introduced in the first place.

Thanks
  Dave

> Regards,
> Cristian
>
> >
> > Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index 8e4623ccc4f8..e61f1b694dbe 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -1507,7 +1507,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(s=
truct drm_encoder *encoder,
> >        * users are able to use pixel clocks closer to HSM's, namely for
> >        * 1920x1200@60Hz. So it was decided to have leave a 1% margin be=
tween
> >        * both clocks. Which, for RPi0-3 implies a maximum pixel clock o=
f
> > -      * 162MHz.
> > +      * 165MHz.
> >        *
> >        * Additionally, the AXI clock needs to be at least 25% of
> >        * pixel clock, but HSM ends up being the limiting factor.
> > @@ -3363,7 +3363,7 @@ static const struct vc4_hdmi_variant bcm2835_vari=
ant =3D {
> >       .encoder_type           =3D VC4_ENCODER_TYPE_HDMI0,
> >       .debugfs_name           =3D "hdmi_regs",
> >       .card_name              =3D "vc4-hdmi",
> > -     .max_pixel_clock        =3D 162000000,
> > +     .max_pixel_clock        =3D HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ,
> >       .registers              =3D vc4_hdmi_fields,
> >       .num_registers          =3D ARRAY_SIZE(vc4_hdmi_fields),
> >
> >
