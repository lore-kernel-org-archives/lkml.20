Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3E643BDA7;
	Mon,  5 Oct 2026 09:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192268; cv=none; b=PL557lSa0Sg8vISRQS3feXcvnjLmQrL/FC6u5WHnFXCTn98stJ/6i1xFqXmYXpfbAcAl0Io4NGVY0JZ+4jtXPMeOsiaTamq6vGgXTOac/P2L0/wBHrS1dtCmPG03HKtqcoXmWfIUhzkCC0dDTrq/13f98cP/C7GnTnXTLHZ6mg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192268; c=relaxed/simple;
	bh=U4N7Uoho8EEs57T1hMidYG126Frn7XTAr/XTRAMt98c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLjYUDfczlvNhkqygMKrMIJvdwkqDHLEisYZO2Si1HRgnJ1wxkgEqIruduLZmElTRMFpCVAiFsH7ChurH7UTntV9OSD0meJQO3zK/ADp8uqO851zHpfQCExtEYL2X+qex8Oz1EbS0pKuAJhNM13m6KjjLe5BVJT4b1U8zQvs+xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ens7dtQc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ens7dtQc"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9AFD63C;
	Mon,  5 Oct 2026 11:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791192141;
	bh=U4N7Uoho8EEs57T1hMidYG126Frn7XTAr/XTRAMt98c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ens7dtQcXi0L1aeo/Al+rAk4+2MOzXQzG+TGoolT2kBmY4Q4mzYOg0B1vDEXelenl
	 xBeE59C0zT7mk1dFFy4cuMPKhLWxqhgsUBK+CNY9FrFmnU0bK9ZfXzaSbqqtNPpxns
	 vAz9GiAkYbZfpd1FB2eBRwfKHtwCN8ypsp5J7G50=
Date: Mon, 5 Oct 2026 11:24:14 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: rcar-isp: ispcore: Fix inconsistent step sizes
Message-ID: <asNsjkhHv9OoMjqm@zed>
References: <20261001085130.84565-1-barnabas.pocze+renesas@ideasonboard.com>
 <asIXMIVjbusYLbaR@zed>
 <58f364aa-0960-4ae1-95e6-1313b9d08bdd@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58f364aa-0960-4ae1-95e6-1313b9d08bdd@ideasonboard.com>

Hi Barnabás

On Mon, Oct 05, 2026 at 10:55:00AM +0200, Barnabás Pőcze wrote:
> 2026. 10. 04. 11:14 keltezéssel, Jacopo Mondi írta:
> > Hi Barnabás
> >
> > On Thu, Oct 01, 2026 at 10:51:30AM +0200, Barnabás Pőcze wrote:
> > > `risp_io_{input,capture}_enum_framesizes()` sets the horizontal and vertical
> > > step size to 2. However, `risp_io_{input,capture}_try_format()` passes 2
> > > to `v4l_bound_align_image()`, which corresponds to a step size of 2^2 = 4.
> > >
> > > So move these constants into macros to avoid the repetition, and with that,
> > > use 4 as the step size everywhere.
> >
> > Why 4 ?
> >
> > I can't find any such limit in documentation.
> >
> > For input I don't find alignment constraints nor in CS or VSPX
> > documentation.
> >
> > For output I only see a requirement that the stride is 256 bits
> > aligned, something that is enforced by risp_io_capture_try_format()
> > already.
> >
> > I see Niklas has reviewed the patch, so he might have found somewhere
> > in the long documentation where the alignment for both input and
> > capture nodes is described.
>
> My primary goal was to remove the inconsistency between the reported and applied
> step sizes. So I went with 4 because that was the applied step size, so with that,

Let's first clarify if the 4 was intentional or is the API of
v4l_bound_align_image() that confused us.

Niklas: any recollection here ?

> it's quite certain that nothing that has worked will break.
>
> Admittedly I do not know if that is the correct number, but I think that can
> be considered a separate issue.
>
>
>
> >
> > >
> > > Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
> > > Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> > > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > > changes in v2:
> > >    * fix typo
> > >
> > > v1: https://lore.kernel.org/linux-media/20260929133020.342677-2-barnabas.pocze+renesas@ideasonboard.com
> > > ---
> > >   .../media/platform/renesas/rcar-isp/core-io.c | 40 +++++++++++--------
> > >   1 file changed, 24 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
> > > index 820af506f896c..b60b91f43d42d 100644
> > > --- a/drivers/media/platform/renesas/rcar-isp/core-io.c
> > > +++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
> > > @@ -15,6 +15,12 @@
> > >
> > >   #include "risp-core.h"
> > >
> > > +#define RISP_MIN_WIDTH 128
> > > +#define RISP_MAX_WIDTH 5120
> > > +#define RISP_MIN_HEIGHT 128
> > > +#define RISP_MAX_HEIGHT 4096
> > > +#define RISP_SIZE_ALIGNMENT 2 /* 2^2 = 4 */
> >
> > The fact that 2 means 2^2 is only because of how
> > v4l_bound_align_image() is implemented
> >
> > > +
> > >   #define risp_io_err(d, fmt, arg...)         dev_err((d)->core->dev, fmt, ##arg)
> > >
> > >   static struct risp_buffer *risp_io_vb2buf(struct vb2_v4l2_buffer *vb)
> > > @@ -330,8 +336,9 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
> > >   {
> > >   	unsigned int bpp = 0;
> > >
> > > -	v4l_bound_align_image(&pix->width, 128, 5120, 2,
> > > -			      &pix->height, 128, 4096, 2, 0);
> > > +	v4l_bound_align_image(&pix->width, RISP_MIN_WIDTH, RISP_MAX_WIDTH, RISP_SIZE_ALIGNMENT,
> > > +			      &pix->height, RISP_MIN_HEIGHT, RISP_MAX_HEIGHT, RISP_SIZE_ALIGNMENT,
> >
> > Should we maybe use 1 here, unless it is documented that 4 is a
> > requirement ?
> >
> > My suspicion is that we originally meant '2' everywhere, but
> > v4l_bound_align_image() is weird and if you pass '2' in it means
> > '2^2' and this went unnoticed.
> >
> > > +			      0);
> > >
> > >   	for (unsigned int i = 0; i < ARRAY_SIZE(risp_io_input_formats); i++) {
> > >   		if (risp_io_input_formats[i].fourcc == pix->pixelformat) {
> > > @@ -423,13 +430,13 @@ static int risp_io_input_enum_framesizes(struct file *file, void *fh,
> > >
> > >   	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> > >
> > > -	fsize->stepwise.min_width = 128;
> > > -	fsize->stepwise.max_width = 5120;
> > > -	fsize->stepwise.step_width = 2;
> > > +	fsize->stepwise.min_width = RISP_MIN_WIDTH;
> > > +	fsize->stepwise.max_width = RISP_MAX_WIDTH;
> > > +	fsize->stepwise.step_width = 1u << RISP_SIZE_ALIGNMENT;
> > >
> > > -	fsize->stepwise.min_height = 128;
> > > -	fsize->stepwise.max_height = 4096;
> > > -	fsize->stepwise.step_height = 2;
> > > +	fsize->stepwise.min_height = RISP_MIN_HEIGHT;
> > > +	fsize->stepwise.max_height = RISP_MAX_HEIGHT;
> > > +	fsize->stepwise.step_height = 1u << RISP_SIZE_ALIGNMENT;
> > >
> > >   	return 0;
> > >   }
> > > @@ -720,8 +727,9 @@ static const struct v4l2_pix_format_mplane risp_io_capture_default_format = {
> > >   static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
> > >   				       struct v4l2_pix_format_mplane *pix)
> > >   {
> > > -	v4l_bound_align_image(&pix->width, 128, 5120, 2,
> > > -			      &pix->height, 128, 4096, 2, 0);
> > > +	v4l_bound_align_image(&pix->width, RISP_MIN_WIDTH, RISP_MAX_WIDTH, RISP_SIZE_ALIGNMENT,
> > > +			      &pix->height, RISP_MIN_HEIGHT, RISP_MAX_HEIGHT, RISP_SIZE_ALIGNMENT,
> > > +			      0);
> > >
> > >   	pix->field = V4L2_FIELD_NONE;
> > >   	pix->colorspace = V4L2_COLORSPACE_SRGB;
> > > @@ -824,13 +832,13 @@ static int risp_io_capture_enum_framesizes(struct file *file, void *fh,
> > >
> > >   	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> > >
> > > -	fsize->stepwise.min_width = 128;
> > > -	fsize->stepwise.max_width = 5120;
> > > -	fsize->stepwise.step_width = 2;
> > > +	fsize->stepwise.min_width = RISP_MIN_WIDTH;
> > > +	fsize->stepwise.max_width = RISP_MAX_WIDTH;
> > > +	fsize->stepwise.step_width = 1u << RISP_SIZE_ALIGNMENT;
> > >
> > > -	fsize->stepwise.min_height = 128;
> > > -	fsize->stepwise.max_height = 4096;
> > > -	fsize->stepwise.step_height = 2;
> > > +	fsize->stepwise.min_height = RISP_MIN_HEIGHT;
> > > +	fsize->stepwise.max_height = RISP_MAX_HEIGHT;
> > > +	fsize->stepwise.step_height = 1u << RISP_SIZE_ALIGNMENT;
> > >
> > >   	return 0;
> > >   }
> > > --
> > > 2.55.0
> > >
> > >
>
