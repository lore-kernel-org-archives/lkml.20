Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503889;
	b=J6KjQPT3Ii6NNm/HyerDYyxCRWRvC/eS6w9ksgA1IN9/A0QkOmrO7Uox+nD5Vs1L0Wqy
	 Fhy9hH5SxUduzY/p/32Ym8pScwYj2NW7qoNoK6t6te3EaEojLqJfRnqMgrca+GBB1GLS8
	 s24GQ9PlQzgBb8V0jksB+ug331ezoHheeElnjA/JTxBx1OOtNRcp6XPc5tBC2KEnRdteg
	 PaRgcmBcqBVeF/sKRMfQq3IaxE/p3J36ZF5sjzBIc9OG1IeXB7HI4VE5qCbXNrb4xo1k5
	 2hSFoQEdSzMuCF+zwnXv87G680donsaSF+hN+LR9i40kPx+Cqg0LMl0XjWHorASgdOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503889;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=7sFqYPku9IMCaAgjb1BHGg9OMs1Jn2kXfjeeNqqIfW4=;
	b=w4qnW1V8fhST4g4hgJp2pv0hdDN/p9axTuGA9Qe0s/fXBsP8Sv+XgmgRuX3bY5JsAxhz
	 IuUVaRU9MC0HrI9RkewB1G1TYCbdu9c1d8PTG1LWudJuTzwhxhXCcXC/SWA91zpuQgret
	 eYqHEhd7PyzDA21DWex7eOvHdw759bDwBWEbzjq2M5iqbeWGzfSLeWRBLh6E9AUfGuiFg
	 jbRxukXCRRvw8+FSxvjHJ5XaIKAL6pOjDA3ssBIn70By9GG488cKb3Ip7DqV93sSnk8r1
	 lk0lxBa5g7ZLBHosb2X+AYH+rnB5LMdpoIMlp79hmWX0GW4wBtd+V4rhz4rgk8sUn6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=Azw65VhM;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=o7Ae6oBD;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB89606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB89606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=Azw65VhM;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=o7Ae6oBD
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C60DF1400128
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:44:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 20 Oct 2026 09:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792503887;
	 x=1792590287; bh=7sFqYPku9IMCaAgjb1BHGg9OMs1Jn2kXfjeeNqqIfW4=; b=
	Azw65VhMY29Q5fqTJy/B/ERFesM94CIXQfuf1QNF+KlAe3GVPs4G4H1d+m/72BSu
	rNpUylzVIpHuLZxHy6jLsI90mSWwX9PjWKcbo8ta/P/k3Gl8cNqJPBqcq6MpzKpz
	Z8NbTUir+JU2o7WX6/oyJCGSW1tywCsLSW/vCL+He6wWSEqYpeBiKvXsuEjzZU56
	QejeR/yTBML1obHIWWNffMI3yXhDpJjUkpf7MzxPSHG6bPvi4k0YqJg4VYD5p/Zm
	wyZVnpU2yFid2HLovNiQep0oCRfS+Z4t/VFXnYqsEDKl235QN+0oTfuLghC+KA7u
	nI4iP5fXaQahnkJ6ByvRPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792503887; x=
	1792590287; bh=7sFqYPku9IMCaAgjb1BHGg9OMs1Jn2kXfjeeNqqIfW4=; b=o
	7Ae6oBDo74Z8A56wSzQSlQ11NhVK3ZiU+yRe8GIpSuktQvXGQzfWVwT9DzDXbfgP
	xfDnCNPPHyvJu1NeFRcZzM/GpbffW5X7FT0ymYE2GLDAMBo19t+tgVzyZ10tVCfD
	egDBHZPrrwfI2It4OHDnYs8JrBKrU79bSBOfx/Mg6v25sFN+AJmztw+WBKiftigb
	p/8rEConEfTgogo3R2iu/S7yVnaTQFGFPe9hZy8XhMx+IGjwAT9TektwbBrJZs36
	eIxaP9FYT7mhaVdRC9eBw23k56Mai1LaTSLTz5bjw9xaVz7KRLa3B8YkgiLWK/pS
	JKC0Y0Jgdxl9fBUbmOo3Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792503887; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:gxSdyZWZXvgmVuVLatj369C7pmV1Vv3Jd85H9RfJMXzJa5H
	zc6YQPq1WIueFfuQ6xzlorC+B+NWUARFNz482cejj+bI8AbQaD6JfpuvkOdQYfg7
	pJwEOzPwr53SkkMJEZDqPRVdeGkJ+u7LkhkQO0QsWAGjMmXWeq3vAT/dw3bx4kGp
	PmezaPpr47sb6BrG+xH0cryTHSmdumEYC9XuQcL56g94SX1VzJCCcHkBGPhZ0MjC
	mlJe0Xa1hrR02MsdNRuhJ+qlUEXYGonPPcptGDe7ScVcRvruUGd1yXDGiV6qjw1S
	Z9/afc+mpEeAEKoLBTfTzq9dp0OZqzsZh/r5xvA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:IeknNZlS48ZgPlaDg9w+WYE+IXDLDzMZ8dlg4l8Q0UQ=:SBzfYmoygIRTYjuunMl4N8cUIjWvhkSILabDTFdYnZU=;
X-ME-Sender: <xms:T3DXauoazgYSH4FcNxN3eRbUWtPnn6ixt0AbQK_1eIbku8JD3MkAFg>
    <xme:T3DXakyDpvhA-MgMURwdi6JDAnN1IkKtpizMe1It0fabOkN91tJwZSpR7gJ7LhOdG
    qy9lTvJIBLi9r3pMM8EytLKRzg8BBtzkCcC9ZsfMCQHccPNwdFv73jC>
X-ME-Received: <xmr:T3DXais9hTTl99HJ4uBkgAE8c71HhsxEFIyEQIohCDoH4TWWL15BtI3zynMJ6sNvDb4buBFLio5iVhUU8CMl__o9Q1LmU7M>
X-ME-Proxy-Cause: dmFkZTFIg3lKdUyp26TRMc44J7IZ/m5v61+2X4w0llVDhQsWoMpOuaqnFv8z1H3n3YbuMg
    4j2P5cQ3PYMTvpNF0s0HI1l9d7YYvvBWLG0M2jdVqikgQjqckR1pyaijHJjLG5ZBv5dm8Q
    DM86YskcEFVqyu5+GkXcLICIUi5UOFPXGubhBMhSzrJPYfXBkwDHpF0U15QNP//kE6VGII
    s1SNFLszlrytpJHzmCi/7CTXOcWjhbbzPd5N58vaPmwpVy19NuIbeolNhWHRmZdjANLCmn
    39oBAtVxXqF7fHSKOJzhp0it+Uuja9Mhj+mZF+1GX3Bhy/bkyt4NNkPyOKEufgvIg59qrr
    JlL1o2Zi1MRP1EXMZ7zJmQ+Ea9oISlEIB5tvRHE9wav0CkxE4e4Ax6Sayv79hGk2y0ivlI
    Yc5TFwaolnno239jDwTbarIk+5LzD6gEoLzZFqu6ypdCdgp010Y6xqO+/7Qgj7btJRuNnk
    Xq2YWwGqF7wGTfSumHnc94wvbjxhotlZT0txDpTjJv/HMof5zPfAZPyXmV6jHUnH2h/JqA
    +h6/PFhuaFLlxnQgbYjJNyW3/wPfyGK+ZVAYcLB+wmhp1PeUVGgJrAQaZc5x3sR5BUj+av
    ba1ujUUuQH7qe98Mw0XiuOPKmJ8j4Fu9PLIPxrPlxe+Fi9PtfbyzHOf5uFAg
X-ME-Proxy: <xmx:T3DXat0rvhFvXZRavha9VKdASLzD8fovHxs12Sv2_YoRIzg969oWLQ>
    <xmx:T3DXaqBcDfwrwX3-1yjLh_nRzKRCgFJ45VdyhCzXmZssBc0b8xXF3g>
    <xmx:T3DXarDP1dt2849R7Ji_csARzez1OrxeTtkI_BqzAGqtgh1ilBJDMg>
    <xmx:T3DXarmYy2HbAsJ8rTPv5uH9QYHa7O0J7McJ2le4R-hIJDl1AZXc5Q>
    <xmx:T3DXarAOYE-YRvvjmEicKEFTJX7omJfCr5z6TvOtnn-dDUHtrz_D9tYi>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Oct 2026 09:44:46 -0400 (EDT)
Date: Tue, 20 Oct 2026 15:44:44 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>,
	Yusuke Goda <yusuke.goda.sx@renesas.com>,
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] media: rcar-isp: ispcore: Honour requested
 bytesperline on RAW input
Message-ID: <20261020134444.GC1172387@ragnatech.se>
References: <20261019-v4l2-add-nv12-v1-0-4a84736803b6@ragnatech.se>
 <20261019-v4l2-add-nv12-v1-1-4a84736803b6@ragnatech.se>
 <6c8e77c9-c0a2-40c6-8e7f-7e2d51c71740@ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c8e77c9-c0a2-40c6-8e7f-7e2d51c71740@ideasonboard.com>

Hi Barnabás,

Thanks for your review.

On 2026-10-20 11:36:04 +0200, Barnabás Pőcze wrote:
> Hi
> 
> 2026. 10. 19. 21:35 keltezéssel, Niklas Söderlund írta:
> > From: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
> > 
> > The RAW input video device always overwrote the bytesperline requested
> > by userspace with width * bpp. The input buffers are however shared with
> > the VIN, which may use a larger line stride (for example 3296 instead of
> > 3280 bytes for a 1640 pixel wide 10 bit image). The dmabuf exported by
> > the ISP was then smaller than the VIN buffer size, and queueing it to
> > the VIN failed with -EINVAL:
> > 
> >    __prepare_dmabuf: invalid dmabuf length 4042752 for plane 0,
> >    minimum length 4060672
> > 
> > Use the requested bytesperline if it is larger than the minimum.
> > 
> > Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
> > [Niklas: Use max(min(..)) instead of if statement]
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >   drivers/media/platform/renesas/rcar-isp/core-io.c | 11 ++++++++++-
> >   1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
> > index b60b91f43d42..badde72352c1 100644
> > --- a/drivers/media/platform/renesas/rcar-isp/core-io.c
> > +++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
> > @@ -5,6 +5,8 @@
> >    * Copyright (C) 2026 Ragnatech AB
> >    */
> > +#include <linux/sizes.h>
> > +
> >   #include <media/v4l2-ctrls.h>
> >   #include <media/v4l2-event.h>
> >   #include <media/v4l2-ioctl.h>
> > @@ -335,6 +337,7 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
> >   				     struct v4l2_pix_format_mplane *pix)
> >   {
> >   	unsigned int bpp = 0;
> > +	unsigned int bpl;
> >   	v4l_bound_align_image(&pix->width, RISP_MIN_WIDTH, RISP_MAX_WIDTH, RISP_SIZE_ALIGNMENT,
> >   			      &pix->height, RISP_MIN_HEIGHT, RISP_MAX_HEIGHT, RISP_SIZE_ALIGNMENT,
> > @@ -352,11 +355,17 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
> >   		bpp = risp_io_input_formats[0].bpp;
> >   	}
> > +	/*
> > +	 * Honour the line stride requested by userspace, the buffers are
> > +	 * shared with the VIN which may use a larger stride than the minimum.
> > +	 */
> > +	bpl = max(pix->width * bpp, min(pix->plane_fmt[0].bytesperline, SZ_64K));
> 
>   clamp(pix->plane_fmt[0].bytesperline, pix->width * bpp, SZ_64K)

Good idea.

> 
> ?
> 
> And does the device really accept any value between these two limits?

The stride register where this is programmed is 16 bit wide.

> 
> 
> > +
> >   	pix->field = V4L2_FIELD_NONE;
> >   	pix->colorspace = V4L2_COLORSPACE_RAW;
> >   	pix->num_planes = 1;
> > -	pix->plane_fmt[0].bytesperline = pix->width * bpp;
> > +	pix->plane_fmt[0].bytesperline = bpl;
> >   	pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
> >   }
> > 
> 

-- 
Kind Regards,
Niklas Söderlund
