Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE59221FD4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790227839; cv=pass; b=R7bzKlehYwAmZ4X6PwpgPN5SihTLKOpKEr5kG+miPzbJHY+Xdt62HGu88TAlz6synx1s/IToA6qQfELZj2CO1hVAo7LeH36RDvFk09qcERfbiesOQ9eV+wjsQGn15UsumgixHCGLIARe3BuRnImDI6+2aMJUJUOWfNc2q/stTYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790227839; c=relaxed/simple;
	bh=Y6lfdMzfxBrctx+JVGwRqRWinjsXPeJStQCGnizzDN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WqcFRFEiRSeR+hhRWs/mBIGyrytWrUim4L2JaaLydNr0UrlT4ZordGnc8QxsmAMySyICN9saW9foqRyRbsiVqnD/LxMVR1fc2YGMtEENrejT/bW5j+knbp+CuPwu46wY5l9TMVRIbYLyJ+N/ZLPw7Syp4c8/WaTIGjx5RNyu6I4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ifYHo7Oq; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ifYHo7Oq"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664ef791so1126033eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790227837; cv=none;
        d=google.com; s=arc-20260327;
        b=IPgYwyF2OsbTUG5kOzS7kRtCgnvtLAKV9esyiqliuax18tw4qvtc5B1aXI9JsItK6k
         tB4JYnGUZ3KK7Z2sreydMTefgeig8gfMMblLNNu51GSh8cWvAdKSaEtKXxZqgP0lpEoR
         v3hc3HXSNY+1y3ozNyLR681jMn5V2IcbUWIqUFhH1MRsIDJritwwjB9wEsmtsKdx/xKM
         kEHE587NKmd0pIHNmZrdxcL+TIyLJR4Zk2pRvHSQvPBWnISi0YUcW0VDM2BXkLTN70L3
         VmBSUKPY9Q2rDPTUGyA6MU05iCbJELcDegXmENM25/nIwCHnKMvZ9PK9hApM2MsRQ2U6
         BIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        fh=+uSwHk3UmfUciZterQiM69yvf6gn6Chmp53qnoUsq04=;
        b=lLGBRukjriNpAGXBQvcNStER2V5CrvDEbxudfIhSFt9GAlxC+s0ybVOb2M4wYSXZtA
         PzUYwjVc+veFikpZgEax/KW5sUSEG2jNeQFm9Ox59SYgbpbadaJhyGQj1qtgn/IB4i5w
         RfjJ+h+rbOmvN+Zta5XMYvbKKTuOt9TcEsOmYxg7RV4F3uvhbj6gsYIpJliQZFR0bI1a
         Q5TgAMzpturfdtlwgY797xWhOwKNF6Bij3vz9Rq2GBqe+mscvvsipqJbZSIES3Bii8wj
         Ta4WwNoq0x85RpmKE8nOhgZIEUpd/1XRyZcwYfA9g9qEUkdXkIMxQWyNs8mTEGWigGI3
         OwSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790227837; x=1790832637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        b=ifYHo7Oq6uFAkFywUqKOjS0eehgIpuWxPWbkGAO6yM26P79mFbG6w6hF428mk8XBmi
         awriAvFYV+D5ry4KB0sm++jGiU+Rq5xvct1QU9DLWoIvCooPZ1ZPsF9zRW5fmHS+SKu2
         dj6M8z4uRbS7SEkpSXOjg96rY9q4nFwUFnrFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790227837; x=1790832637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        b=MT069BVYIEfFVEMGdhAyWsaNZcD0GQqGYhELPdbW7S0m6ZQCWBQJg4nnE/cRKB5L2r
         aZNDtTD1BYpLFgcGbOOq2JfMS5fe6abM6Hx+LxMyX0oXYquzVyQ/xPitsjkgijHymoum
         v/cIX0PX79/IhaMDewZAv9GKYWGmn+E9ENUBc3Wr01gWaFOQAaFsmOwBP61uL6fw2rHO
         Q/MwpicmUm19RKYhDC3pv0vX0KKVDHyV6mWDiDRyPHkog0Hac93KJAlWFJSdBYxZbfhg
         0TzvdhsUtgv17MiXoOPUPKzyG9eqwnGOY+5SAckpg97lVB5p2wZy33E1CqKMMTJ0J+BZ
         tv2A==
X-Forwarded-Encrypted: i=1; AKwUvBxPblG8rq5qCOiPfTsyOFdfQeYvvqpiQgf8o7yImKzbANYxOyN+690TnWMLTAkE4j13NDf3UiAVLrAeoro=@vger.kernel.org
X-Gm-Message-State: AFuF++lj5y0O5+HUHiXeM6r3KvzDk23Wn6VQ+c/OVJSh8+XIhATWtsv3
	8x/8ifWoDqWfrTxFnTGc93IBBmeEPCe5Fwr5l3RpfMVfKSh1dQRH6IwSeu/brwSA2cBalXPr/9Z
	jH+xlASMfvaHBEzI5NFd6TLArJ2A0is5bm8ihMDTApQ==
X-Gm-Gg: AYBFou3b1t0n8TG6kX6FVIkmkZ+csvhbLjC/+n194mASlpNsWanSMG4E3wGenEBSJLd
	KJXJFggDTOghHWYfs9WyDzZKnXVI6vZs9hUF7LfK54pHUfhgCSOIXfO8dFv/rUXtrj+uabJs4XU
	oHTOUg0Uc+YBkd/vzI2vxC/RAf9fmQYTh8uSF6i4uneUVmU/jE432xVeSVupi3t+NYwqoo40CVg
	rknhOXCwo1Zfz5hazvmIgIoaJ/xn2vrlFVWmytdX0978J2yBWpQkh3xsXPMzgphl9qywjZ6qMMy
	+/P6Rj5odUtcUAc8kTdzQGxkEM+/2vyolmTM4yH9NmJgvGgZQFTus4r1hGIR6Mh06gfRq2+0NuB
	OQqreVoe0gg==
X-Received: by 2002:a05:7300:8d14:b0:33b:e264:362a with SMTP id
 5a478bee46e88-34004a89a19mr1123625eec.13.1790227832039; Wed, 23 Sep 2026
 22:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com> <arQxC3DmDyVIGdqq@collins>
In-Reply-To: <arQxC3DmDyVIGdqq@collins>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 24 Sep 2026 07:30:20 +0200
X-Gm-Features: AclHuK9fIcxWA7Sv69t_uK1zMqbihMAU90hONvsInRjWG6YY9lFMwau8XYvA7qg
Message-ID: <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
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

Hi Paul


On Wed, Sep 23, 2026 at 10:05=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
>
> Hi Michael,
>
> Le Wed 23 Sep 26, 14:10, Michael Nazzareno Trimarchi a =C3=A9crit :
> > I tested on px30 and achieved working H.264 encoding with some small ch=
anges
>
> That is a bit surprising, the Rockchip PX30 should come with a Hantro H1
> (using a modified register layout) while this driver is for the
> Hantro VC8000E, which is a newer generation with very different registers=
.
>
> Maybe you ended up using CPU-based decoding when testing?

Using
>
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

I have added your patch to gstreamer

v4l2codecs: add the stateless H.264 and VP8 encoder elements

Backport of the encoder work from the branch v4l2codecs/h264enc of
https://github.com/paulkocialkowski/gstreamer (commit f59de5779ef1, based
on release 1.26.0) onto the gstreamer1.0-plugins-bad 1.28.5 this build
uses.

Generate the right element and encode stream:

gst-launch-1.0 videotestsrc num-buffers=3D100 !
video/x-raw,width=3D720,height=3D576 !  v4l2slh264enc ! h264parse !
matroskamux ! filesink location=3D/tmp/t2.mkv

And playback over Wayland.

Solve some problem. I have implemented:

const struct hantro_variant px30_vpu_variant =3D {
        .enc_offset =3D 0x0,
        .enc_fmts =3D rockchip_vpu_enc_fmts,
        .num_enc_fmts =3D ARRAY_SIZE(rockchip_vpu_enc_fmts),
        .dec_offset =3D 0x400,
        .dec_fmts =3D rockchip_vdpu2_dec_fmts,
        .num_dec_fmts =3D ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
        .codec =3D HANTRO_JPEG_ENCODER | HANTRO_H264_ENCODER |
                 HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
                 HANTRO_H264_DECODER,
        .codec_ops =3D px30_vpu_codec_ops,
        .irqs =3D rockchip_vpu2_irqs,
        .num_irqs =3D ARRAY_SIZE(rockchip_vpu2_irqs),
        .init =3D rk3036_vpu_hw_init,
        .clk_names =3D rockchip_vpu_clk_names,
        .num_clocks =3D ARRAY_SIZE(rockchip_vpu_clk_names)
};

I have advertised the:

       {
                .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
                .codec_mode =3D HANTRO_MODE_H264_ENC,
                .max_depth =3D 2,
                .header_size =3D H264_ENC_HEADER_SIZE,
                .frmsize =3D {
                        .min_width =3D FMT_MIN_WIDTH,
                        .max_width =3D FMT_FHD_WIDTH,
                        .step_width =3D MB_DIM,
                        .min_height =3D FMT_MIN_HEIGHT,
                        .max_height =3D FMT_FHD_HEIGHT,
                        .step_height =3D MB_DIM,
                },
        },

Create the rockchip_vpu_hw_h264_enc.c. I need to test this on rk3399

I have a small change only in the common part. Hope that it's a bit clear.

Michael
