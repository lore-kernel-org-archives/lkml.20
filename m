Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009763B4EA1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058795; cv=pass; b=ckMxji8A21XH8r5iFaPN6D5sm3m0SdFb1Aw0f4GsX2zs+5a0YVQyegimge5ywRrQV/ndBEMcE0vc15ZwlIV9nHSU8QaxetbRrh/soGRJC3TqHb/Zmf7AQcX0oR9puCkxdEYF7v5PYjYhtFYGpt8Dx08tKZIpH5QhBpiHbd8ouBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058795; c=relaxed/simple;
	bh=L3NFksDD7QUSPd3S/z0I+3+EX9IvKIW4aGMytpkFHq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myJ3zCgINikwKqTZIU5BgTFfrCDoxOrCln16FwU+V5fw7G569WnZYmTuNUQ/y/c4fGP1Hto8uvWyb/teaEUoMCnYBXux7oCR4R9E7WsiDeSILKf/m6s3GYT8Yi8FsyLRjNnLlRQ47jOUJC/wQmC1iyH/Ljqu/0VHHgO8dcGtLZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OlGNyYPQ; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OlGNyYPQ"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-910316a2fc9so89858746d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789058789; cv=none;
        d=google.com; s=arc-20260327;
        b=m9tMfJZF9ULTicCaRcLvPz0ili5I/7c0+qjo0EISiK+Jee5p6AwJliXlmJswmhyBkK
         DizqUQDGk8D3as/STsDMqiHK8oxugzPFrW+j/0P85ZnFkriFHSeX0h5GdiQ8XROVP0w3
         nVS9Oz85bglcCY/o7J8DlVWT4drz2h+9ix9EchXMlk0bt7YD1JSE747WXGRTLRIODFi8
         tao5oSZl7rT81mxeRlILqUh09COF2D2K85DzzVZB90YFGvshKC4KihuAqwmR5fT0hd0M
         Od5VDMIICLfN/HxgN0CaFjPh1nRkanfgSHoeKug6lEtkhXPsIMCKxWFNar4vUT8Pp6SK
         4l6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dW3a3eYBFlUL8UXrgQaev8bdrBqkG2D9k/Qll/Jwu24=;
        fh=HDtpwV3sH/7M3mCV/GWyJI4v2J/UvwSbur5yHslyuIQ=;
        b=WMOPPnCA9JMWgfQ0rBcDhJjON49HaGipQLis5gGoXmLv01XIJy+enwD8t2WtdgpUJv
         QLpw8BrGPYdjHBpnPKP/+on3zcCIm/1G2Q+bsHjCkNbRlpF0pY64GM/xlzn77DXcr7jh
         BwYlgX1D30xJ7ebch4orRNQOHSJyy42wg3qs1jwwuZXQKVqdI+ChQjCOglXut7ttNrxL
         o4lSUBge0z1lYrtCBgt2Pi2SPLyligP7iy2O+Xn236sjOG0mA+n+xf9Nxhg8mqlQz5nK
         1EaF0ItXvcWOsn4OJ0uBrjkQNAEBU/VydLpzxd8HUl4ISR9AbxNFgnpMGy9vXQBGYXSZ
         bBxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789058789; x=1789663589; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dW3a3eYBFlUL8UXrgQaev8bdrBqkG2D9k/Qll/Jwu24=;
        b=OlGNyYPQ4eMJ7yIWgauFspPeJNtvd+O9q3CvD+M8HdPEs95+nT5as1tgqlPCw1w7Ih
         SB2u+WkHes9LZBVlDVMGaqhUNFV+7J++JsUHGzoUTkFYnV8vo42kG+EeoKWTlusfDpLk
         vQKKQTiEEOhMWKHUjVRHYxoL+iraiDUKh00X3FmugMDiHHesCg0KKOzWCPj8h9utzZ0c
         fGocNtwO82vTJn9h+eIrbikv3dyZLa2q+DbfXUqk+y+EAMH2kx9bNixVL60PO381GByt
         YPirzT28h0VzSoMhjm4xqDNwgRFltLfhgXlUDQgcqxlg3EYv7tL+UAjz5y5CLsMIflUK
         1U0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058789; x=1789663589;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dW3a3eYBFlUL8UXrgQaev8bdrBqkG2D9k/Qll/Jwu24=;
        b=JZqA8kxTW4K/g/DBdHb4TxQDq3/W0xoFrC9boC9ITeav2kBD21MRt8l8hYEnByDAqH
         uproNAX0x6piuJYOngvE3uwuSpQ4Bo+89Vzo9hPnZLl72jSPaUtlf0eS45pb7evzFVuz
         DbAOdsnykmOuexBmsvgfswI48fuW1QpcDBzOYVcyw4O22Sf40ZbeoO5g1U1b/Ernlse5
         4JV26nCIufOHmXLQ40Mw8UptQps+hTzln+vplLLtBZJa/F8dyhTfjjqzKpB7Ne/F4qKL
         a3eQvQPPOo4Nwp7wF9lODOh62VfpI8cZi3NBD31/XxKL/gjnClRU5ELaEuObbAD8YZaY
         QUQg==
X-Forwarded-Encrypted: i=1; AKwUvByQwWqkr0kH8M3hCxU8l+CG/LW5yEAkmLsrSveP+VbzJOvg8qOzadq80/JwOkWgoeI/jMqESpLT7r7Np4g=@vger.kernel.org
X-Gm-Message-State: AFuF++mewIhIw40HauOsohykdOxgpPtCDCVH2B/cpBsUI25JLxC73BqZ
	AoYvN2Q9H8s5Th8UtY3U05m9JgHYKNEoMoe18BFF4Qq/ewb46v+iVNOu/p295yPXnZZGzwFtZzf
	MBaqbXfLsWMD9xHZD9nU2digHwslRT3E/UjQ5K9Yrlg==
X-Gm-Gg: AYBFou1Tc9AaPpUTG0BIiMQu3gHOE5+ph8uzdPlMxWxv5vkQF4dMBByHrkorufvIByM
	0k8qHOeXFZu4HkNiX1skqLWHzj/jkaGvusbCKGLj8R8s90Gy8DoeRN7sVgIAXCYnVhKIbsV8E1J
	yqp/gPPfcMw2v50m86JNcV1I4UFM5NEILmeuk92cQNLrRmYA8QmWNFd4hUKitg1f5+/3hzzsc9c
	rutHjggARv3plwx/b4pNAkjn8+5Fn5+sfm3IST9cyxcYXRUpEWiyZWtJ4IrrWPLVtNacIzYJ+qt
	mb1pG60T5ifSLuBHESce5opoZ4ghWQ9tCFeyULMdkhcoMYpkalAFfxcYkBrW9ZzsjDYR1V21WQZ
	KxdbfWrM2HBcpBmUP6MuM0xJIkSWJewh8d9Q1lU1UCkkVRL56bzohzGYXWraQk1H/vBVKEvkG
X-Received: by 2002:a05:6214:5195:b0:907:c025:e4 with SMTP id
 6a1803df08f44-9103ef2dd58mr532150606d6.13.1789058788659; Thu, 10 Sep 2026
 09:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
 <20260717-b4-vchiq-isp-v3-4-fb8235e15c68@ideasonboard.com>
 <178815780973.1005982.10544870677125118283@neptunite.rasen.tech> <178904987755.11722.4550283822602391871@freya>
In-Reply-To: <178904987755.11722.4550283822602391871@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 10 Sep 2026 17:46:11 +0100
X-Gm-Features: AcwNN1UtOoh3OaA0_SgLtxNriYeBdNNXPUKlpJI3A-U73eH3dRlhkhbW05S55Wc
Message-ID: <CAPY8ntDJKggr3cKhE=mfrAhhSwt5h+KbH=saXPiPj-JKngKGNA@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] platform/raspberrypi: vchiq-mmal: Support bayer
 and gray formats
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Paul Elder <paul.elder@ideasonboard.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Stefan Wahren <wahrenst@gmx.net>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Paul and Jai

On Thu, 10 Sept 2026 at 15:18, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Paul,
>
> Thank you for your review.
>
> Quoting Paul Elder (2026-08-31 12:00:09)
> > Quoting Jai Luthra (2026-07-17 20:04:19)
> > > Raw camera sensors often send data as packed or unpacked bayer and gray
> > > formats, which needs to be processed by the ISP.
> > >
> > > Add macros to support bayer and gray format FOURCCs in the MMAL layer.
> > >
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > ---
> > >  include/linux/raspberrypi/mmal-encodings.h | 64 ++++++++++++++++++++++++++++++
> > >  1 file changed, 64 insertions(+)
> > >
> > > diff --git a/include/linux/raspberrypi/mmal-encodings.h b/include/linux/raspberrypi/mmal-encodings.h
> > > index eadf2e981408..1e13ebbaebf6 100644
> > > --- a/include/linux/raspberrypi/mmal-encodings.h
> > > +++ b/include/linux/raspberrypi/mmal-encodings.h
> > > @@ -69,6 +69,70 @@
> > >   */
> > >  #define MMAL_ENCODING_OPAQUE           MMAL_FOURCC('O', 'P', 'Q', 'V')
> > >
> > > +/**
> > > + * Bayer formats
> > > + * FourCC values copied from V4L2 where defined.
> >
> > Is this matching a requirement? I've noticed that 12-bit packed and SBGGR16
> > don't match the v4l2 fourcc, but the ones that you defined are nicer.

No requirement.
That comment comes from 2015 / 2017 when the firmware support was
being added/extended, and V4L2 was handy to copy where applicable.
https://github.com/raspberrypi/userland/blame/master/interface/mmal/mmal_encodings.h#L110
(10 years ago! I've been doing this job too long!)

> I believe these are what the VC4 firmware expects as the fourcc values. I
> don't know the historic reason why these were chosen, but we do use
> standard v4l2 fourcc here when dealing with userspace applications.
>
> I don't know if it's worth it to change these to match V4L2 fourcc,
> especially because we want to avoid breaking changes to the firmware.

I'm not intending to make any changes to the firmware for ISP support
as it would create a breaking change and a world of pain.

Drop the comment.
These defines are for the MMAL API, and that is to all intents and
purposes fixed now. Similarities to V4L2 are just similarities.

  Dave

> Thanks,
> Jai
>
> >
> > Paul
> >
> > > + */
> > > +/* 8 bit per pixel Bayer formats. */
> > > +#define MMAL_ENCODING_BAYER_SBGGR8     MMAL_FOURCC('B', 'A', '8', '1')
> > > +#define MMAL_ENCODING_BAYER_SGBRG8     MMAL_FOURCC('G', 'B', 'R', 'G')
> > > +#define MMAL_ENCODING_BAYER_SGRBG8     MMAL_FOURCC('G', 'R', 'B', 'G')
> > > +#define MMAL_ENCODING_BAYER_SRGGB8     MMAL_FOURCC('R', 'G', 'G', 'B')
> > > +
> > > +/* 10 bit per pixel packed Bayer formats. */
> > > +#define MMAL_ENCODING_BAYER_SBGGR10P   MMAL_FOURCC('p', 'B', 'A', 'A')
> > > +#define MMAL_ENCODING_BAYER_SGRBG10P   MMAL_FOURCC('p', 'g', 'A', 'A')
> > > +#define MMAL_ENCODING_BAYER_SGBRG10P   MMAL_FOURCC('p', 'G', 'A', 'A')
> > > +#define MMAL_ENCODING_BAYER_SRGGB10P   MMAL_FOURCC('p', 'R', 'A', 'A')
> > > +
> > > +/* 12 bit per pixel packed Bayer formats. */
> > > +#define MMAL_ENCODING_BAYER_SBGGR12P   MMAL_FOURCC('p', 'B', '1', '2')
> > > +#define MMAL_ENCODING_BAYER_SGRBG12P   MMAL_FOURCC('p', 'g', '1', '2')
> > > +#define MMAL_ENCODING_BAYER_SGBRG12P   MMAL_FOURCC('p', 'G', '1', '2')
> > > +#define MMAL_ENCODING_BAYER_SRGGB12P   MMAL_FOURCC('p', 'R', '1', '2')
> > > +
> > > +/* 14 bit per pixel packed Bayer formats. */
> > > +#define MMAL_ENCODING_BAYER_SBGGR14P   MMAL_FOURCC('p', 'B', 'E', 'E')
> > > +#define MMAL_ENCODING_BAYER_SGBRG14P   MMAL_FOURCC('p', 'G', 'E', 'E')
> > > +#define MMAL_ENCODING_BAYER_SGRBG14P   MMAL_FOURCC('p', 'g', 'E', 'E')
> > > +#define MMAL_ENCODING_BAYER_SRGGB14P   MMAL_FOURCC('p', 'R', 'E', 'E')
> > > +
> > > +/* 16 bit per pixel Bayer formats. */
> > > +#define MMAL_ENCODING_BAYER_SBGGR16    MMAL_FOURCC('B', 'G', '1', '6')
> > > +#define MMAL_ENCODING_BAYER_SGBRG16    MMAL_FOURCC('G', 'B', '1', '6')
> > > +#define MMAL_ENCODING_BAYER_SGRBG16    MMAL_FOURCC('G', 'R', '1', '6')
> > > +#define MMAL_ENCODING_BAYER_SRGGB16    MMAL_FOURCC('R', 'G', '1', '6')
> > > +
> > > +/* 10 bit per pixel unpacked (16bit) Bayer formats. */
> > > +#define MMAL_ENCODING_BAYER_SBGGR10    MMAL_FOURCC('B', 'G', '1', '0')
> > > +#define MMAL_ENCODING_BAYER_SGRBG10    MMAL_FOURCC('B', 'A', '1', '0')
> > > +#define MMAL_ENCODING_BAYER_SGBRG10    MMAL_FOURCC('G', 'B', '1', '0')
> > > +#define MMAL_ENCODING_BAYER_SRGGB10    MMAL_FOURCC('R', 'G', '1', '0')
> > > +
> > > +/* 12 bit per pixel unpacked (16bit) Bayer formats */
> > > +#define MMAL_ENCODING_BAYER_SBGGR12    MMAL_FOURCC('B', 'G', '1', '2')
> > > +#define MMAL_ENCODING_BAYER_SGRBG12    MMAL_FOURCC('B', 'A', '1', '2')
> > > +#define MMAL_ENCODING_BAYER_SGBRG12    MMAL_FOURCC('G', 'B', '1', '2')
> > > +#define MMAL_ENCODING_BAYER_SRGGB12    MMAL_FOURCC('R', 'G', '1', '2')
> > > +
> > > +/* 14 bit per pixel unpacked (16bit) Bayer formats */
> > > +#define MMAL_ENCODING_BAYER_SBGGR14    MMAL_FOURCC('B', 'G', '1', '4')
> > > +#define MMAL_ENCODING_BAYER_SGBRG14    MMAL_FOURCC('G', 'B', '1', '4')
> > > +#define MMAL_ENCODING_BAYER_SGRBG14    MMAL_FOURCC('G', 'R', '1', '4')
> > > +#define MMAL_ENCODING_BAYER_SRGGB14    MMAL_FOURCC('R', 'G', '1', '4')
> > > +
> > > +/* MIPI packed monochrome images */
> > > +#define MMAL_ENCODING_GREY    MMAL_FOURCC('G', 'R', 'E', 'Y')
> > > +#define MMAL_ENCODING_Y10P    MMAL_FOURCC('Y', '1', '0', 'P')
> > > +#define MMAL_ENCODING_Y12P    MMAL_FOURCC('Y', '1', '2', 'P')
> > > +#define MMAL_ENCODING_Y14P    MMAL_FOURCC('Y', '1', '4', 'P')
> > > +#define MMAL_ENCODING_Y16     MMAL_FOURCC('Y', '1', '6', ' ')
> > > +
> > > +/* Unpacked monochrome formats (16bit per sample, but only N LSBs used) */
> > > +#define MMAL_ENCODING_Y10     MMAL_FOURCC('Y', '1', '0', ' ')
> > > +#define MMAL_ENCODING_Y12     MMAL_FOURCC('Y', '1', '2', ' ')
> > > +#define MMAL_ENCODING_Y14     MMAL_FOURCC('Y', '1', '4', ' ')
> > > +
> > >  /** An EGL image handle
> > >   */
> > >  #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')
> > >
> > > --
> > > 2.54.0
> > >
> > >
