Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C22C499F0E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216520; cv=none; b=YVtbnu00+k29AnCsFLMs7+pLVWhfHSULFWviTi3pWoMr78Oe6p0pSn+bYZFAR6L1FmGrxQ+NXSBmAtac9vWVspxMDZvFu50Y/X43PqZ+pCaErNvgfm1FqzOv20pb46hUWLsKfZ1qO/SbB+9zkA0t5OI11Uqw1ooCI+As38qBXb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216520; c=relaxed/simple;
	bh=HGg3vTFwT9cs3xra0Fdacg6LFkzkpZ0eEPl0PzLPJsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGVrafuYfe9/iiCX6PO8gPvE6XD9EqDFG5Jpu7r9+XGvxBFsFCm8EOxNQS4QBP7y45Z+LVWgw8mxvTqkKccEQvUnacUiyrpTwH9vMkjfJfzNQWV+90iP1WBVIFTQ2Hfv8Hc0iMbcpEXzaaLYi4NktQp/maWyvc2z3Wv0VcFBTek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=YVY0B1WW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A0ro46Hc; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="YVY0B1WW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A0ro46Hc"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 32C52EC091A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:08:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 05 Oct 2026 12:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791216517;
	 x=1791302917; bh=u2CmOWw6YQCImPNSkhIO4WX/l034UQ2ZOYIj4264qHs=; b=
	YVY0B1WWsRH91/b/X+KPYhiUsf9DZJ1Y8ZfuB+hBmqHi4voCyBrEVCzTAzcnqqJ+
	xweWbYlSZ+PZnhTmJ3JhxvuRro2Iml/GmrcNFVxSZL5AcmeEUjxG66is42fCHL56
	/lIFf4axF6Vtqb6ie445lx+YMO8gLkhshzRD2yiVW0/e0tHH0h8LkoYgMs3PvNWL
	adBX9Nw2YMN11IqpE1XZGqVoKxHd5wVZTQXOmIYOHAXTj3jfiN4OzNgCeNUStGUN
	tOfv2nzraiB8O1CkFJRIceT9n2S5qYMtVfaIGImNnLYUzUHdZag0D4zGacxUGpxc
	x4x95tLDGJGdJTjKM4Zp8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791216517; x=
	1791302917; bh=u2CmOWw6YQCImPNSkhIO4WX/l034UQ2ZOYIj4264qHs=; b=A
	0ro46HcYIRQnOHuepcitLupojocReZd3H6bcLPKttkTG6cDqobmX3058UHpWM+U2
	lGOPln3HEuQZIO2bVnl8rGIIafz+9K/IJ8e3KAezMKF2TJbrJNL0FLlPZlFJ1OuO
	eam6CMq5N6HvxQFC4H7H3nqC81ZN4vUVr+wjUvp4j2jow3FMzbW3shkyTYuVFu2q
	5XaCaoMyD9ZVGtHteXFdXzWiMAYjwHe+DbFFCDdOWn6VHw15Tgle/0G0594tkmbu
	Dd3JSjaIbB11Rr574+Wq5lawtBwmlbIkZZOP77iMGyq5yQ/mZAPRiq7p8ZJ9PRNv
	6k1ONqZYU5bpd35x40dCw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791216517; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:oNYwqXE/dViIeNz47qIJLS4yNxXma00t4fbC4qzx8VZ4GBq
	VbBAKQ7yGhQjT/VBggUEl47eEhNZbBYI9SQtWL3PyFR0KF6eLY8jE3hsr6M1h/KM
	Bjh/jqgrJsdNmikdvDAg29awDYdojtMfeIhiUshU29uoTT7FSq4tBqemMTivh1Da
	S29PO/Tnv/JQKiPLjV9f6BMdLwZiUJF9FhrZAJ4s2rF3TCQkfcfdRc2KJ8QiHgeM
	Kl1pdNXUeNtnbeIVvI2/+EXZIzbzfJdDpx/E4/Xy6pEt1FfCES+KKYi5LBOU8VOq
	Nuak4iTwGx3gE0ZCWjOPn2E3YYBA+nG+DvFDKCQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:iA6wwhB8tKDaU4UCn0XNx1K55ruGkX8hpu3bQCvG7io=:HGg3vTFwT9cs3xra0Fdacg6LFkzkpZ0eEPl0PzLPJsk=;
X-ME-Sender: <xms:hMvDaoytEeT2olvWEwLdwJx_Pyng208iSQa12GYLclBHnryS3o-vrA>
    <xme:hMvDake99CRE0QWQGdo-urUXwPjj5uJYjc8hawIAzLMiHFQRpzxxNmgmGoU_Ihmwo
    LhkQX5gEtMe9zX0RgNAEifrkiwDbw53ce-R7gfWScf2R_5qKoN1Hco>
X-ME-Received: <xmr:hMvDal4jMTfJ8s_TE0WuJFhcsYVGee5G30vSJ3HO_jHpIpicWOIo6tXKNcalqjLU40Na4jmFDnt5LOtY8KICs0OxNfX2YEg>
X-ME-Proxy-Cause: dmFkZTEe/uWcROJxRt3zO8jNocSwmVFJ5uPbz41vUYEWE+TUmS238r+h2WpJh52laQKGvX
    1YKxt5ljwfLSQ3JZdtFZBCyC/5SNa59sSKzPvJvRgMuGW9UJKKK/jg8uf9C1lO6vAEdcXs
    scFnRyp4V/HJov7uDxt/+E4NBs4RSshGzIIgzmCXUFsRsFdyLpU0bhWgbwVJ1KxaMadG7y
    diQatgwvyMhF7aScITKogHJSgpA9GsnKigGpoFotF2svSTs3RgCq2y0SRgPPmHyafeYuoZ
    XKZbFJQ1iYJYK96f0anGkzWZwRrdwug2qYqN55rmvffCHlLJ7dQbsX1LuUeNda92nEToFp
    LrzpjzK2Gok2ty6RbhtrUlRn0Rn4bIJBJmf3vVBvv3bwyh5SXfYdKGUJEoc4Zs4q4YkqWc
    MVvf4+3qHAS+62g+bSgJu6AwNL+Q1XoCdyNo909eCcyCqMRDDHFDDU9BiGFxocH7USPMHr
    Qc5U4jXjZv2ehMkz0Gqh/PVQfUk6ySPsubrgFv+2Dnuh+bmcsCC4hbNbHMRaTJJlDzlqxA
    9uLuwUaHX24QfswaYP/VJJVnOtqxBn6MAbkTnhDhG62GC6XyM5O6Z+WIUXEB9UXr0yenTG
    nMYa4Z9nP9vgGKzR+2+Es2B6eThiB8NvMi1834efgAd14ZDDL0g+VEU2y8vQ
X-ME-Proxy: <xmx:hMvDahIJ0yadXp4XvQDiqTs4CnXKOiD-L705PNbNo9G_im8N_7V10A>
    <xmx:hMvDalxM5xF7vjgZXnD_fhOGAYwIBFQCopHv3zqlgy-Ilv2Zrrb0Kw>
    <xmx:hMvDahL-ypFWOwe_LC0J21QkMSr9sk9VWOm_qj0B4uHqNTHvio9xpg>
    <xmx:hMvDasV0FRh1ArmstVtBqi8mlpqkAgS8ViR1V0rGDD-BoZt42KKlVw>
    <xmx:hcvDavaqsJEoMr_aRS6Mwj_-pXm29n6bAJKtP_9Cjt6SjY4LJHXgoSGq>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Oct 2026 12:08:35 -0400 (EDT)
Date: Mon, 5 Oct 2026 18:08:33 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: rcar-isp: ispcore: Fix inconsistent step sizes
Message-ID: <20261005160833.GA3658258@ragnatech.se>
References: <20261001085130.84565-1-barnabas.pocze+renesas@ideasonboard.com>
 <asIXMIVjbusYLbaR@zed>
 <58f364aa-0960-4ae1-95e6-1313b9d08bdd@ideasonboard.com>
 <asNsjkhHv9OoMjqm@zed>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asNsjkhHv9OoMjqm@zed>

On 2026-10-05 11:24:14 +0200, Jacopo Mondi wrote:
> Hi Barnabás
> 
> On Mon, Oct 05, 2026 at 10:55:00AM +0200, Barnabás Pőcze wrote:
> > 2026. 10. 04. 11:14 keltezéssel, Jacopo Mondi írta:
> > > Hi Barnabás
> > >
> > > On Thu, Oct 01, 2026 at 10:51:30AM +0200, Barnabás Pőcze wrote:
> > > > `risp_io_{input,capture}_enum_framesizes()` sets the horizontal and vertical
> > > > step size to 2. However, `risp_io_{input,capture}_try_format()` passes 2
> > > > to `v4l_bound_align_image()`, which corresponds to a step size of 2^2 = 4.
> > > >
> > > > So move these constants into macros to avoid the repetition, and with that,
> > > > use 4 as the step size everywhere.
> > >
> > > Why 4 ?
> > >
> > > I can't find any such limit in documentation.
> > >
> > > For input I don't find alignment constraints nor in CS or VSPX
> > > documentation.
> > >
> > > For output I only see a requirement that the stride is 256 bits
> > > aligned, something that is enforced by risp_io_capture_try_format()
> > > already.
> > >
> > > I see Niklas has reviewed the patch, so he might have found somewhere
> > > in the long documentation where the alignment for both input and
> > > capture nodes is described.
> >
> > My primary goal was to remove the inconsistency between the reported and applied
> > step sizes. So I went with 4 because that was the applied step size, so with that,
> 
> Let's first clarify if the 4 was intentional or is the API of
> v4l_bound_align_image() that confused us.
> 
> Niklas: any recollection here ?

I think this was picked/discovered early when we where debuggin the 
issues in the DMA from the VSPX and never re-evaluated. I acked the 
packed as it do the correct thing, expose the limit we enforce in 
TRY_FORMAT to the enumeration of frame sizes which was inconsistent.

> 
> > it's quite certain that nothing that has worked will break.
> >
> > Admittedly I do not know if that is the correct number, but I think that can
> > be considered a separate issue.
> >
> >
> >
> > >
> > > >
> > > > Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
> > > > Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> > > > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > ---
> > > > changes in v2:
> > > >    * fix typo
> > > >
> > > > v1: https://lore.kernel.org/linux-media/20260929133020.342677-2-barnabas.pocze+renesas@ideasonboard.com
> > > > ---
> > > >   .../media/platform/renesas/rcar-isp/core-io.c | 40 +++++++++++--------
> > > >   1 file changed, 24 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
> > > > index 820af506f896c..b60b91f43d42d 100644
> > > > --- a/drivers/media/platform/renesas/rcar-isp/core-io.c
> > > > +++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
> > > > @@ -15,6 +15,12 @@
> > > >
> > > >   #include "risp-core.h"
> > > >
> > > > +#define RISP_MIN_WIDTH 128
> > > > +#define RISP_MAX_WIDTH 5120
> > > > +#define RISP_MIN_HEIGHT 128
> > > > +#define RISP_MAX_HEIGHT 4096
> > > > +#define RISP_SIZE_ALIGNMENT 2 /* 2^2 = 4 */
> > >
> > > The fact that 2 means 2^2 is only because of how
> > > v4l_bound_align_image() is implemented
> > >
> > > > +
> > > >   #define risp_io_err(d, fmt, arg...)         dev_err((d)->core->dev, fmt, ##arg)
> > > >
> > > >   static struct risp_buffer *risp_io_vb2buf(struct vb2_v4l2_buffer *vb)
> > > > @@ -330,8 +336,9 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
> > > >   {
> > > >   	unsigned int bpp = 0;
> > > >
> > > > -	v4l_bound_align_image(&pix->width, 128, 5120, 2,
> > > > -			      &pix->height, 128, 4096, 2, 0);
> > > > +	v4l_bound_align_image(&pix->width, RISP_MIN_WIDTH, RISP_MAX_WIDTH, RISP_SIZE_ALIGNMENT,
> > > > +			      &pix->height, RISP_MIN_HEIGHT, RISP_MAX_HEIGHT, RISP_SIZE_ALIGNMENT,
> > >
> > > Should we maybe use 1 here, unless it is documented that 4 is a
> > > requirement ?
> > >
> > > My suspicion is that we originally meant '2' everywhere, but
> > > v4l_bound_align_image() is weird and if you pass '2' in it means
> > > '2^2' and this went unnoticed.
> > >
> > > > +			      0);
> > > >
> > > >   	for (unsigned int i = 0; i < ARRAY_SIZE(risp_io_input_formats); i++) {
> > > >   		if (risp_io_input_formats[i].fourcc == pix->pixelformat) {
> > > > @@ -423,13 +430,13 @@ static int risp_io_input_enum_framesizes(struct file *file, void *fh,
> > > >
> > > >   	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> > > >
> > > > -	fsize->stepwise.min_width = 128;
> > > > -	fsize->stepwise.max_width = 5120;
> > > > -	fsize->stepwise.step_width = 2;
> > > > +	fsize->stepwise.min_width = RISP_MIN_WIDTH;
> > > > +	fsize->stepwise.max_width = RISP_MAX_WIDTH;
> > > > +	fsize->stepwise.step_width = 1u << RISP_SIZE_ALIGNMENT;
> > > >
> > > > -	fsize->stepwise.min_height = 128;
> > > > -	fsize->stepwise.max_height = 4096;
> > > > -	fsize->stepwise.step_height = 2;
> > > > +	fsize->stepwise.min_height = RISP_MIN_HEIGHT;
> > > > +	fsize->stepwise.max_height = RISP_MAX_HEIGHT;
> > > > +	fsize->stepwise.step_height = 1u << RISP_SIZE_ALIGNMENT;
> > > >
> > > >   	return 0;
> > > >   }
> > > > @@ -720,8 +727,9 @@ static const struct v4l2_pix_format_mplane risp_io_capture_default_format = {
> > > >   static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
> > > >   				       struct v4l2_pix_format_mplane *pix)
> > > >   {
> > > > -	v4l_bound_align_image(&pix->width, 128, 5120, 2,
> > > > -			      &pix->height, 128, 4096, 2, 0);
> > > > +	v4l_bound_align_image(&pix->width, RISP_MIN_WIDTH, RISP_MAX_WIDTH, RISP_SIZE_ALIGNMENT,
> > > > +			      &pix->height, RISP_MIN_HEIGHT, RISP_MAX_HEIGHT, RISP_SIZE_ALIGNMENT,
> > > > +			      0);
> > > >
> > > >   	pix->field = V4L2_FIELD_NONE;
> > > >   	pix->colorspace = V4L2_COLORSPACE_SRGB;
> > > > @@ -824,13 +832,13 @@ static int risp_io_capture_enum_framesizes(struct file *file, void *fh,
> > > >
> > > >   	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> > > >
> > > > -	fsize->stepwise.min_width = 128;
> > > > -	fsize->stepwise.max_width = 5120;
> > > > -	fsize->stepwise.step_width = 2;
> > > > +	fsize->stepwise.min_width = RISP_MIN_WIDTH;
> > > > +	fsize->stepwise.max_width = RISP_MAX_WIDTH;
> > > > +	fsize->stepwise.step_width = 1u << RISP_SIZE_ALIGNMENT;
> > > >
> > > > -	fsize->stepwise.min_height = 128;
> > > > -	fsize->stepwise.max_height = 4096;
> > > > -	fsize->stepwise.step_height = 2;
> > > > +	fsize->stepwise.min_height = RISP_MIN_HEIGHT;
> > > > +	fsize->stepwise.max_height = RISP_MAX_HEIGHT;
> > > > +	fsize->stepwise.step_height = 1u << RISP_SIZE_ALIGNMENT;
> > > >
> > > >   	return 0;
> > > >   }
> > > > --
> > > > 2.55.0
> > > >
> > > >
> >

-- 
Kind Regards,
Niklas Söderlund
