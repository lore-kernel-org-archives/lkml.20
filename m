Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC9330ACF6;
	Thu, 10 Sep 2026 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049888; cv=none; b=SjNPWsh0S54R0ffHPdJq5tknIWvoeSZkS3mK49y7LT3MT5/6SXYH9m1P9L86Oj1AhpOl8MwhBHXwRiWnBGsb9b/QuYXnzcXwbPfM8T49assno40hS9PaeRSzfrMXAM19P834ZaNt0hkGrXs5DK7GJfoPAudX1uwL/J2u66ma42k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049888; c=relaxed/simple;
	bh=0X62Ko2Z3XleyDxT7v1GHO7duqsxFgOEktywbeCnn4A=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=P+A1grCC3ZZu3Q7t46rMb97xywf3KeeKdFdIgTmYNRWyDdMQtiM639pSsasIwAZl04sm8+4unwmvdkyGq8fXpfB+CHWxGUCOqnAtzoXXvtvUrHImkPVth5hOSgJ0uz1Rz44OD3hV/Pw8AU4w9QvOe6xXyMql0N8jFRbCzD6Lzic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J1d52+7R; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J1d52+7R"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:42c8:e78d:2576:d7c8:5aa9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D46CB5B3;
	Thu, 10 Sep 2026 16:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789049786;
	bh=0X62Ko2Z3XleyDxT7v1GHO7duqsxFgOEktywbeCnn4A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=J1d52+7RqWGlX5yzICMOsjU0ACnhWuGu9XXY5zipwv/grGAdPSoQD9RVXOnaPxX9c
	 nptw+Yrq6JgdycPFngd6v2o+0B8mJn1RIJiDyLCPTmBw4iNq+M+EyRDKeqzCSx7wOc
	 q9FkzpfcCTBxXgvm+6/95H/4BLKwtpKzu6+3b2IE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <178815780973.1005982.10544870677125118283@neptunite.rasen.tech>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com> <20260717-b4-vchiq-isp-v3-4-fb8235e15c68@ideasonboard.com> <178815780973.1005982.10544870677125118283@neptunite.rasen.tech>
Subject: Re: [PATCH v3 4/9] platform/raspberrypi: vchiq-mmal: Support bayer and gray formats
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Florian Fainelli <florian.fainelli@broadcom.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Elder <paul.elder@ideasonboard.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Thu, 10 Sep 2026 19:47:57 +0530
Message-ID: <178904987755.11722.4550283822602391871@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Paul,

Thank you for your review.

Quoting Paul Elder (2026-08-31 12:00:09)
> Quoting Jai Luthra (2026-07-17 20:04:19)
> > Raw camera sensors often send data as packed or unpacked bayer and gray
> > formats, which needs to be processed by the ISP.
> >=20
> > Add macros to support bayer and gray format FOURCCs in the MMAL layer.
> >=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  include/linux/raspberrypi/mmal-encodings.h | 64 ++++++++++++++++++++++=
++++++++
> >  1 file changed, 64 insertions(+)
> >=20
> > diff --git a/include/linux/raspberrypi/mmal-encodings.h b/include/linux=
/raspberrypi/mmal-encodings.h
> > index eadf2e981408..1e13ebbaebf6 100644
> > --- a/include/linux/raspberrypi/mmal-encodings.h
> > +++ b/include/linux/raspberrypi/mmal-encodings.h
> > @@ -69,6 +69,70 @@
> >   */
> >  #define MMAL_ENCODING_OPAQUE           MMAL_FOURCC('O', 'P', 'Q', 'V')
> > =20
> > +/**
> > + * Bayer formats
> > + * FourCC values copied from V4L2 where defined.
>=20
> Is this matching a requirement? I've noticed that 12-bit packed and SBGGR=
16
> don't match the v4l2 fourcc, but the ones that you defined are nicer.
>=20

I believe these are what the VC4 firmware expects as the fourcc values. I
don't know the historic reason why these were chosen, but we do use
standard v4l2 fourcc here when dealing with userspace applications.

I don't know if it's worth it to change these to match V4L2 fourcc,
especially because we want to avoid breaking changes to the firmware.

Thanks,
Jai

>=20
> Paul
>=20
> > + */
> > +/* 8 bit per pixel Bayer formats. */
> > +#define MMAL_ENCODING_BAYER_SBGGR8     MMAL_FOURCC('B', 'A', '8', '1')
> > +#define MMAL_ENCODING_BAYER_SGBRG8     MMAL_FOURCC('G', 'B', 'R', 'G')
> > +#define MMAL_ENCODING_BAYER_SGRBG8     MMAL_FOURCC('G', 'R', 'B', 'G')
> > +#define MMAL_ENCODING_BAYER_SRGGB8     MMAL_FOURCC('R', 'G', 'G', 'B')
> > +
> > +/* 10 bit per pixel packed Bayer formats. */
> > +#define MMAL_ENCODING_BAYER_SBGGR10P   MMAL_FOURCC('p', 'B', 'A', 'A')
> > +#define MMAL_ENCODING_BAYER_SGRBG10P   MMAL_FOURCC('p', 'g', 'A', 'A')
> > +#define MMAL_ENCODING_BAYER_SGBRG10P   MMAL_FOURCC('p', 'G', 'A', 'A')
> > +#define MMAL_ENCODING_BAYER_SRGGB10P   MMAL_FOURCC('p', 'R', 'A', 'A')
> > +
> > +/* 12 bit per pixel packed Bayer formats. */
> > +#define MMAL_ENCODING_BAYER_SBGGR12P   MMAL_FOURCC('p', 'B', '1', '2')
> > +#define MMAL_ENCODING_BAYER_SGRBG12P   MMAL_FOURCC('p', 'g', '1', '2')
> > +#define MMAL_ENCODING_BAYER_SGBRG12P   MMAL_FOURCC('p', 'G', '1', '2')
> > +#define MMAL_ENCODING_BAYER_SRGGB12P   MMAL_FOURCC('p', 'R', '1', '2')
> > +
> > +/* 14 bit per pixel packed Bayer formats. */
> > +#define MMAL_ENCODING_BAYER_SBGGR14P   MMAL_FOURCC('p', 'B', 'E', 'E')
> > +#define MMAL_ENCODING_BAYER_SGBRG14P   MMAL_FOURCC('p', 'G', 'E', 'E')
> > +#define MMAL_ENCODING_BAYER_SGRBG14P   MMAL_FOURCC('p', 'g', 'E', 'E')
> > +#define MMAL_ENCODING_BAYER_SRGGB14P   MMAL_FOURCC('p', 'R', 'E', 'E')
> > +
> > +/* 16 bit per pixel Bayer formats. */
> > +#define MMAL_ENCODING_BAYER_SBGGR16    MMAL_FOURCC('B', 'G', '1', '6')
> > +#define MMAL_ENCODING_BAYER_SGBRG16    MMAL_FOURCC('G', 'B', '1', '6')
> > +#define MMAL_ENCODING_BAYER_SGRBG16    MMAL_FOURCC('G', 'R', '1', '6')
> > +#define MMAL_ENCODING_BAYER_SRGGB16    MMAL_FOURCC('R', 'G', '1', '6')
> > +
> > +/* 10 bit per pixel unpacked (16bit) Bayer formats. */
> > +#define MMAL_ENCODING_BAYER_SBGGR10    MMAL_FOURCC('B', 'G', '1', '0')
> > +#define MMAL_ENCODING_BAYER_SGRBG10    MMAL_FOURCC('B', 'A', '1', '0')
> > +#define MMAL_ENCODING_BAYER_SGBRG10    MMAL_FOURCC('G', 'B', '1', '0')
> > +#define MMAL_ENCODING_BAYER_SRGGB10    MMAL_FOURCC('R', 'G', '1', '0')
> > +
> > +/* 12 bit per pixel unpacked (16bit) Bayer formats */
> > +#define MMAL_ENCODING_BAYER_SBGGR12    MMAL_FOURCC('B', 'G', '1', '2')
> > +#define MMAL_ENCODING_BAYER_SGRBG12    MMAL_FOURCC('B', 'A', '1', '2')
> > +#define MMAL_ENCODING_BAYER_SGBRG12    MMAL_FOURCC('G', 'B', '1', '2')
> > +#define MMAL_ENCODING_BAYER_SRGGB12    MMAL_FOURCC('R', 'G', '1', '2')
> > +
> > +/* 14 bit per pixel unpacked (16bit) Bayer formats */
> > +#define MMAL_ENCODING_BAYER_SBGGR14    MMAL_FOURCC('B', 'G', '1', '4')
> > +#define MMAL_ENCODING_BAYER_SGBRG14    MMAL_FOURCC('G', 'B', '1', '4')
> > +#define MMAL_ENCODING_BAYER_SGRBG14    MMAL_FOURCC('G', 'R', '1', '4')
> > +#define MMAL_ENCODING_BAYER_SRGGB14    MMAL_FOURCC('R', 'G', '1', '4')
> > +
> > +/* MIPI packed monochrome images */
> > +#define MMAL_ENCODING_GREY    MMAL_FOURCC('G', 'R', 'E', 'Y')
> > +#define MMAL_ENCODING_Y10P    MMAL_FOURCC('Y', '1', '0', 'P')
> > +#define MMAL_ENCODING_Y12P    MMAL_FOURCC('Y', '1', '2', 'P')
> > +#define MMAL_ENCODING_Y14P    MMAL_FOURCC('Y', '1', '4', 'P')
> > +#define MMAL_ENCODING_Y16     MMAL_FOURCC('Y', '1', '6', ' ')
> > +
> > +/* Unpacked monochrome formats (16bit per sample, but only N LSBs used=
) */
> > +#define MMAL_ENCODING_Y10     MMAL_FOURCC('Y', '1', '0', ' ')
> > +#define MMAL_ENCODING_Y12     MMAL_FOURCC('Y', '1', '2', ' ')
> > +#define MMAL_ENCODING_Y14     MMAL_FOURCC('Y', '1', '4', ' ')
> > +
> >  /** An EGL image handle
> >   */
> >  #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')
> >=20
> > --=20
> > 2.54.0
> >=20
> >
