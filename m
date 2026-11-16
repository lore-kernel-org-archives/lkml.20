Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831690;
	b=lkwpTLuehvMuXST15eSnxEcdVOJ6scH3HFMpAPcd6RDqvlnB2H2nkzz1kbVX4Z9eqUH5
	 RLvUJ74EY4E0CyJh9WveMpJLB30aE64cYUK267gPSjD4kj1ywWdsxVZ0pgQf+dzCdEZQ9
	 dh9H4w5KN6IEC0KNmezsG87X+hUnH8khvFtzMHr42LA6RAP/y/UcI0DrI42OK4gFf1Vla
	 wgI4sPh/m4hvezF1U+WLKGxxvEBKqqoAb4j6tnH8yKUH7Lon3fW5PtagbYUkk3dGAmqOR
	 u95Or8E4zg2PMXNMa7QTh94e1zjjNlUNL0Qxx9fTvtWFVef/aeFahiOOAbgNNlj3Zow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831690;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=vxKMxVz4RTUXEWLAe5atYGQv2NleEVOnfsqKpIZG1EU=;
	b=qeLhf1Uut/BqD9RZM4OtIHeSTMYbuPNLNbcmiJPggXXqP35i2WNkXZvtfLZho94ZhZXR
	 lTuVOuJEYLSI6y2wNC4trUb9R+aLH8BxqLQDlZ+kdPXOndN3NrzrtTkZT6jZaCNmrmhV1
	 8laxeORgiG8tA0LgyNsR0IzifajwOOEX2ywt4VGAX0hmuwhuJPBFW7AZBeZXGF5d9Es3b
	 Sf7mjXqdS7lUDXU6v+gToBpnLZy5a1zPp0t2e9Y0ULtajilmtj5qTBzwSxk+FU+blukXf
	 g1X975lV5oipUayhepDtGERJHTojwNbghJ7FygGCeIPPzbmxnLh82P/tAm+ZQAKpa8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=rMauBFg4;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110CD606A31C;
	Mon, 16 Nov 2026 12:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 110CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=rMauBFg4
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF45B175;
	Mon, 16 Nov 2026 13:19:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794831540;
	bh=fsw/hAXRRGs6HflXWSb6KSaOYqdKWbKQ4ODUu8fHjbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rMauBFg4xBEnavMZC09+ywXPvnAcJPTwqA08kpkjYVE+S9/yhqesF/hF3psWs4Vjd
	 Ps27b2ZqufIDAFckespscrhW4DPayDQ/d47bBvKuzNLI3Xe/dscvGzS7foiA6eRFhh
	 0R9eaqxgEtruXZup7cCRYTdGP4kqBXEnST1SXU0o=
Date: Mon, 16 Nov 2026 13:21:24 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>, Yusuke Goda <yusuke.goda.sx@renesas.com>, 
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: rcar-isp: ispcore: Update image data flush
 settings
Message-ID: <avrtuJWtbEdnoQqu@zed>
References: <20261114-v4l2-add-nv12-v2-0-a3f5ecfd48d6@ragnatech.se>
 <20261114-v4l2-add-nv12-v2-2-a3f5ecfd48d6@ragnatech.se>
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
In-Reply-To: <20261114-v4l2-add-nv12-v2-2-a3f5ecfd48d6@ragnatech.se>


On Sat, Nov 14, 2026 at 08:55:17PM +0100, Niklas Söderlund wrote:
> Later versions of the datasheet have an updated chapter on how the image

I'm looking at revision R19UH0259EJ0040 Rev.0.40
Are we on the same page ?

> out flush settings depends on proper stride settings. Update the bytes
> per line calculation and flush out settings to match the datasheet
> clarification.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Fix spelling of capture.
> ---
>  drivers/media/platform/renesas/rcar-isp/core-io.c | 32 +++++++++++++++++++----
>  drivers/media/platform/renesas/rcar-isp/core.c    |  2 +-
>  2 files changed, 28 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
> index cc538e984aa1..1c63194f6455 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core-io.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
> @@ -727,12 +727,34 @@ static const struct v4l2_pix_format_mplane risp_io_capture_default_format = {
>  	.num_planes = 1,
>  	.plane_fmt = {
>  		[0] = {
> -			.bytesperline = ALIGN(1920 * 4, 256),
> -			.sizeimage = ALIGN(1920 * 4, 256) * 1080,
> +			.bytesperline = 15872, /* See risp_io_capture_bytesperline() */

not looking into the calculations yet, I just wonder if this value
can't be calculated (by calling risp_io_capture_bytesperline())
instead of hard-coded ?

> +			.sizeimage = 15872 * 1080,
>  		},
>  	},
>  };
>
> +static unsigned int risp_io_capture_bytesperline(unsigned int width, unsigned int bpp)
> +{
> +	/*
> +	 * The datasheet specifies strict alignment and padding rules to be able
> +	 * to flush out all the pixels. Each line must be 256 byte aligned and

Interestingly I read:

"When using flush out setting"

do you know if flush out has to be used unconditionally ?

> +	 * at the end of the frame at least one extra line of space must be
> +	 * available.
> +	 *
> +	 * As we can't extend the buffer with one extra line we need to work
> +	 * with stride setting to satisfy both constraints. Fortunately the
> +	 * datasheet gives us a calculation for this.
> +	 *
> +	 *   FLUSH[pixels] = ALIGN(WIDTH[pixels], 256)
> +	 *
> +	 *   PADDING[bytes] = ALIGN(BPP[bytes] * WIDTH[pixels], 256) - BPP[bytes] * WIDTH[pixels] + BPP[bytes] * FLUSH[pixels]
> +	 */
> +	unsigned int data = bpp * width;
> +	unsigned int padding = ALIGN(data, 256) - data + bpp * ALIGN(width, 256);

isn't this the additional space for a whole line where flush data
end up being written to ?

Assume 'data' is already 256-aligned, then we can remove
`ALIGN(data, 256) - data` from the calculation of padding.

What's left is

        padding = bpp * ALIGN(width, 256)

which is a full line length in bytes aligned to 256 pixels

> +
> +	return ALIGN(data + padding, 256);

Then here you add to the line length in bytes (`data`) the padding
(which is a full line itself).

As I presume this works when tested, where did I get lost ?

... a few minutes later ...

And now I've read Barnabas' comment on v1. We're here basically
doubling the line length then ?

I think the comment here is a bit mis-leading as I thought the idea
was to add to each line stride enough space to accommodate an additional
line at the end of the full frame.

And to get back to your reply to Barnabas in v1, I'm not sure I
understand why the additional padding lines (if unconditionally
needed) can't be added to sizeimage ?

> +}
> +
>  static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
>  				       struct v4l2_pix_format_mplane *pix)
>  {
> @@ -749,16 +771,16 @@ static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
>  	case V4L2_PIX_FMT_NV16M:
>  		pix->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>  		pix->num_planes = 2;
> -		pix->plane_fmt[0].bytesperline = ALIGN(pix->width, 256);
> +		pix->plane_fmt[0].bytesperline = risp_io_capture_bytesperline(pix->width, 1);
>  		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
> -		pix->plane_fmt[1].bytesperline = ALIGN(pix->width, 256);
> +		pix->plane_fmt[1].bytesperline = pix->plane_fmt[0].bytesperline;
>  		pix->plane_fmt[1].sizeimage = pix->plane_fmt[1].bytesperline * pix->height;
>  		break;
>  	default:
>  		pix->pixelformat = V4L2_PIX_FMT_XBGR32;
>  		pix->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>  		pix->num_planes = 1;
> -		pix->plane_fmt[0].bytesperline = ALIGN(pix->width * 4, 256);
> +		pix->plane_fmt[0].bytesperline = risp_io_capture_bytesperline(pix->width, 4);
>  		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
>  		break;
>  	}
> diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
> index 586a5adbedfa..8908496c734e 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> @@ -398,7 +398,7 @@ static int risp_core_config_output(struct rcar_isp_core *core,
>
>  	/* Set image out flush EOF. */
>  	risp_core_write(core, ISPCORE_DMA_IMAGE_FLUSH_OUT_REG(index),
> -			pix->plane_fmt[0].bytesperline <<
> +			ALIGN(pix->width, 256) <<
>  			ISPCORE_DMA_IMAGE_FLUSH_OUT_PADDING_PIXEL_EOF_SHIFT);
>
>  	/* Enable DMA and set burst length. */
>
> --
> 2.55.0
>
>
