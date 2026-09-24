Received: from mail-yx2-f36.google.com (mail-yx2-f36.google.com [74.125.224.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932314AD4D7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278717; cv=pass; b=Ap8e5a2lLtJO7LcOsnHERS6nyQB1KwSe3P/Ku7Ze/rvqwPe224wOKy/lgOYM3NcfuaewMIBSg2t5Lz7hD6hAa5f3jjHGGXfQ0x+XYx5Z+hsGz4xrUzkq/wx0INWUEb+xLGIr6Ika9AAnkIh1y5Kx30tf+leWGNcRZnyT0GvHCfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278717; c=relaxed/simple;
	bh=kRmPVZ4kecfhKStpwP/qseJ7BCFTN/An8sItpAF8EtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AW2B0rh+9oQOFGv+KhdUVZpcEofRWWovUJvRYrQYyIuDAtsrCTWP6z6MEl6iUyaAfZN2Mq5/vW/5atAoLJyLplyBJVZK3w52G/a1ZG/g6iBez68jfx03V9Wg6EnruW0CfGssTMJwyCnDi61fRtPd3CQqhIRirnYjVVlhQJIB1mM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fGFTbzFk; arc=pass smtp.client-ip=74.125.224.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fGFTbzFk"
Received: by mail-yx2-f36.google.com with SMTP id 956f58d0204a3-66e4aaf2ecfso310995d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:38:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790278708; cv=none;
        d=google.com; s=arc-20260327;
        b=mubcY+yZggardJcv2KxSdtzwQupBuJ5DsqlfbH1jFv8WMQUVi5Cv8lUBAAillm2W8e
         iKsKtThUURBx+rJyUsHtAc5VHusfMeSdOYdiZIkxMk0Hx1PoGLBJ6dfm2rUwBvT2Nd56
         rUSh/Ma2XoqGMjZDBEnHyNqn0OqLEbk6LK+4Yr1wVLxIqt9c5hceoOnEKPOKR1hBa/vD
         lUy6ZGzXx5toE+oQG4armTdOozZA1IX5Vlx0+L9u9QkKgaw3ehiTwiGLsTRjlbwewecD
         Ot1uEUuMDk+n4VgvTAry9THWBN8whmlM+SSqatR1M/IpA8m+VhWpDVSUO0eXZTOllIp7
         J8kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NVqptNo8neXdqpn4T2EkAUKxv7O1l9NSFa3yzxG78T4=;
        fh=BrYeGFayUEqvgfeo8EqQwiRbp7XpVmYF03QufyGJ9fk=;
        b=pGDVbqZDc1OUNGxA/8NZWfnlTO9igQrZzqEsZOuX6LgXKJrBIw9Ee9SM3hPGANswVf
         I67ZU8mMxe8xQP5f5TIKHe63cwyEYiU+Y4evvBPgHd9hOXUb2FRqioRUx6xfLuiu66Zp
         bs+Yf/WIb5JgFRANTmyvPq3cP3JNg5KWJ7rGtVYxclcOlaMZRbXjRx8mlIPsA45AYsaB
         DSEhFmyU4twmJKcTAQG0+7X2K21laetBDKlKVc2RK9JBZzHSWO7YswAQbVH/24iAvJ/O
         FzNy1f1IROcOfRF5Fa4PKWEQbRrd6UVEvFUcbn4JJMK11Fxn7nmwjSQ3U2N556kGk+8D
         afyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790278708; x=1790883508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVqptNo8neXdqpn4T2EkAUKxv7O1l9NSFa3yzxG78T4=;
        b=fGFTbzFkD2vohgWY7lcS4JIlpogquzpzQWX9qpvL7OPbZs8Akb3FxfbeSc1MhCSPMT
         TolFECnrfA/rzVaXnfQh8ggSJbez6gD6t1qLOYDR5JwkUmBRKEXoLbRvofqGA2rjywp7
         Y40YHBYkP1vt8sRaywet6uEgRAMocR6pX1O44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278708; x=1790883508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVqptNo8neXdqpn4T2EkAUKxv7O1l9NSFa3yzxG78T4=;
        b=AQ5gqG9OGDhwj42lHV9DwO8+hhKBHIcFqTZnOh2icGvge0hG2pGqXV6C6FASB3k1Jy
         miBggj8q8/lJNfXdmDKQO2OH/pS2O5eZHvKgEQ25hY82R0i/GI9bNw2rCasSYIjYo0Zi
         Hx4BwfjhtmZOGE60ZVOUdz/HgjixwRCEWLiOsAfANzHN5wL9rpL0tPDmaDPNgp3jg+rn
         GHZvjSQLjsB0twFyBlnl0Fo8wviqLsyG/281/10tkuOuoYFPVBTMZtIurYxOkgUO6AFL
         lBdfl5QJc3YFJqMz4liwjw5HthOC9lkrOHukctxus4EyLYZtN01XAgdYDPFRoafzyPkM
         rTew==
X-Forwarded-Encrypted: i=1; AKwUvBzEL8Y6JZ0TeB+nOXkqDazlcA0vSgs+PD06r/xIYcLlds/l9vP62TG4wFbdg6RiqVRYzKuG8RdZdvvd2eg=@vger.kernel.org
X-Gm-Message-State: AFuF++mwqU4l1Lo1vDqG9dpedwWynSPyKV7M6YTDu+oVfHFYPJBxNOZ6
	DAxEX4uDewC/PqqoYpJGoCbWZLt9olsE8VTn7JP1/f3FMINcQzg/JlX76i6WBiTUbUabPEWtlXy
	oYN4eJPXkBnPXrOPqhjXRtbNk9inrwakqJvCYKvVqAg==
X-Gm-Gg: AYBFou2ZZgppd2wNByyO8QTIRZL+sNQdoobUnqsUM427nmJj07GzPS0LKKbFxBw5Pvr
	1htxHTMrJ4HK7aTUrvHS2jp9oEetAbM+3vF6X8YfVofZLn2U1kaxrpD7PVD+uJm8SzXCMI+RZqF
	mF2136mpNigjK8Vne+a2xbSbWqvoF47FlzGevMg5fSdqrsWjiC+/RG6yDGecSpx3yBOixmbgjLr
	Kycx6uB7Hx2a+vcGsuiU7zwi1Bl8Ci+YWuqTCW0EOpqmaXFnU/xcj2Kyvos1SwniJHpQbJVP9RG
	4tkaUJSGeVDXkBA/aOPrWS+oONDippalj7VuU+UzKYEyQhXFW1+TNjwHbKDRa1HyJ8GEbvyTOUv
	jpi1U8mTliA==
X-Received: by 2002:a05:690e:d56:b0:671:4d9c:91bc with SMTP id
 956f58d0204a3-672ed3b8549mr1938576d50.78.1790278708232; Thu, 24 Sep 2026
 12:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
 <arQxC3DmDyVIGdqq@collins> <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
 <arVnQmik-CveaAkY@collins>
In-Reply-To: <arVnQmik-CveaAkY@collins>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 24 Sep 2026 21:38:16 +0200
X-Gm-Features: AclHuK_bBSWqL6tBSki95SII0DxHlrmdAk4MDI9hfl1lTZlay91QzSspJUrifKY
Message-ID: <CAOf5uw=K5tWiodM0SEP_nFn0vBv3=YRFWrY1Bd-1jPmZtM7G4A@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, devicetree <devicetree@vger.kernel.org>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Paul

On Thu, Sep 24, 2026 at 8:09=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi Michael,
>
> Le Thu 24 Sep 26, 07:30, Michael Nazzareno Trimarchi a =C3=A9crit :
> > I have added your patch to gstreamer
> >
> > v4l2codecs: add the stateless H.264 and VP8 encoder elements
> >
> > Backport of the encoder work from the branch v4l2codecs/h264enc of
> > https://github.com/paulkocialkowski/gstreamer (commit f59de5779ef1, bas=
ed
> > on release 1.26.0) onto the gstreamer1.0-plugins-bad 1.28.5 this build
> > uses.
>
> Yes this is the right gstreamer branch to use here.
>
> > Generate the right element and encode stream:
> >
> > gst-launch-1.0 videotestsrc num-buffers=3D100 !
> > video/x-raw,width=3D720,height=3D576 !  v4l2slh264enc ! h264parse !
> > matroskamux ! filesink location=3D/tmp/t2.mkv
> >
> > And playback over Wayland.
> >
> > Solve some problem. I have implemented:
> >
> > const struct hantro_variant px30_vpu_variant =3D {
> >         .enc_offset =3D 0x0,
> >         .enc_fmts =3D rockchip_vpu_enc_fmts,
> >         .num_enc_fmts =3D ARRAY_SIZE(rockchip_vpu_enc_fmts),
> >         .dec_offset =3D 0x400,
> >         .dec_fmts =3D rockchip_vdpu2_dec_fmts,
> >         .num_dec_fmts =3D ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
> >         .codec =3D HANTRO_JPEG_ENCODER | HANTRO_H264_ENCODER |
> >                  HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
> >                  HANTRO_H264_DECODER,
> >         .codec_ops =3D px30_vpu_codec_ops,
> >         .irqs =3D rockchip_vpu2_irqs,
> >         .num_irqs =3D ARRAY_SIZE(rockchip_vpu2_irqs),
> >         .init =3D rk3036_vpu_hw_init,
> >         .clk_names =3D rockchip_vpu_clk_names,
> >         .num_clocks =3D ARRAY_SIZE(rockchip_vpu_clk_names)
> > };
> >
> > I have advertised the:
> >
> >        {
> >                 .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> >                 .codec_mode =3D HANTRO_MODE_H264_ENC,
> >                 .max_depth =3D 2,
> >                 .header_size =3D H264_ENC_HEADER_SIZE,
> >                 .frmsize =3D {
> >                         .min_width =3D FMT_MIN_WIDTH,
> >                         .max_width =3D FMT_FHD_WIDTH,
> >                         .step_width =3D MB_DIM,
> >                         .min_height =3D FMT_MIN_HEIGHT,
> >                         .max_height =3D FMT_FHD_HEIGHT,
> >                         .step_height =3D MB_DIM,
> >                 },
> >         },
> >
> > Create the rockchip_vpu_hw_h264_enc.c. I need to test this on rk3399
>
> Then I guess this is using register configuration from the earlier H.264
> encoding work that I've done at Bootlin, adapted for the new stateless

I need to check mpp code too

> encode helpers? That part is probably not quite trivial, which is why I
> was a bit surprised.
>

I would like to clean up the patches before sending, and check all the code=
 to
not make trivial mistakes. I'm not persistent, so if we aren't, one of
my colleagues will take over.

> > I have a small change only in the common part. Hope that it's a bit cle=
ar.
>
> Yes in comparison to the register configuration code, the platform
> changes are rather small indeed.
>

I wrote this email to state that this change would be impossible
without your work.
I'm currently working on other things, but I had some spare time. Now
apart from that,
I would like to ask about the status of the entire proposal and uapi change=
.

Michael

> All the best,
>
> Paul
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.
