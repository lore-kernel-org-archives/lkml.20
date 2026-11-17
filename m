Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926402;
	b=INaMAxil41At7Eq+JyA6OQebbZU8sYtR4JTGvvnQeQ5d5W1WRQKhhjMhgx6IusqRUTwT
	 8NYE7PwJ6w98Xp2G4l4jqO9HEwSDRrFzCLFmjLXHEo5NkGRltoDvJ7SrargZGzo8Es7dG
	 Zetsb9VL2tSQfMreVFlB8ggNsiGWMb+wMr5/5TGhZnPcXklcOIqMK7HgilpLjiu/Ij7NZ
	 j1HFFLd/tA84h1W/QDU/OywiBTlPqMhER+5KEgTpQEvDIltFV4lng3A/Y7UdXlBhVoTjC
	 3ZUaU1FQrKmIC7C9d7Ae4e/nVAHqs7BB0RxDf/vsbMS6l2U1LMpcmd/ZRJQHoqek6ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926402;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=/UuYqJQTWXtax5s5JvNf+z4bPEvQ+y4lOxlg7yjU+r8=;
	b=eVNVq1JGSLBxBg/JzunmjAPGPHc1YSUgQn2WkI6RTTT4Rb+WRzB4FG5F5OBiyZ1kCdUH
	 FtyjHWimHuC/6kc+zpHqwOPsWjtnBy9L6J7V9QXhlrY8QpT4gkedwMmJzhNaYTAlXj8bX
	 UkWx3mA+wwRV3Uew/Hk7m0pTP0+/xRW66E+WxRIOQvEm/FI3NneN6j8FXvHOkcW2YwIFF
	 pUpmWJZXghs1yX7R0qpzLn9rR5EhC+V4IZVL9+TxJhdOo2P+rnpDrfFFc4ApqYR9JciQv
	 Z5SLaSwrCOMEYizi1aItuwXQJm091H8D6YyNlnEU3zEjuVNAXimBmxxSK600Q3L3uwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=L6jRNYGW;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5807E606A323;
	Tue, 17 Nov 2026 14:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5807E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=L6jRNYGW
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AD0C929;
	Tue, 17 Nov 2026 15:37:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794926252;
	bh=A3oLprRtXxoeEahjSFhcJ7ARIhfuR3XNRwciLjvDSkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L6jRNYGWCzfPnRfYMsgWIhoiG9EXIhrOwUX532ZjXktZvBSGpKksiVkVCZFi1781E
	 qOF1GhOVRU0T6qgjKvX3kw3Lxtx2jshW0njGb0TSdNCDbAIOFjkMVShP7jrpHwdtQX
	 0CFDH6kmxMlQrB2J2RwejTpoPTU2dyvfl00CjTIM=
Date: Tue, 17 Nov 2026 15:39:57 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>, Yusuke Goda <yusuke.goda.sx@renesas.com>, 
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: rcar-isp: ispcore: Add NV12M support
Message-ID: <avxfncW0vkr01pWp@zed>
References: <20261114-v4l2-add-nv12-v2-0-a3f5ecfd48d6@ragnatech.se>
 <20261114-v4l2-add-nv12-v2-4-a3f5ecfd48d6@ragnatech.se>
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
In-Reply-To: <20261114-v4l2-add-nv12-v2-4-a3f5ecfd48d6@ragnatech.se>

Hi Niklas

On Sat, Nov 14, 2026 at 08:55:19PM +0100, Niklas Söderlund wrote:
> It is possible to support NV12M output by only outputting the CbCr plane
> from even or odd lines. Enabling support for it is straightforward but
> one snag around how the DMA-engine works.
>
> When the DMA-engine is configured to only output CbCr data from odd or
> even lines it still outputs blanks pixels to the buffer for the line
> where no data is taken.
>
> To work around this and still produce valid NV12 frames the device needs
> to be configured so all blank pixels written to the buffer are part of
> the line padding. In addition to also keeping the same number of padding
> bytes as the Y plane.

To confirm my understanding:

The Y and CbCr planes have the same strides because:

1) in 2/4 the line stride gets doubled for the Y plane and the stride
is copied to the CbCr plane
2) the CbCr plane needs a doubled line stride  because empty data will
end up being written to the second half of each line

Is this correct ?

>
> The DMA-engine is able to do this as we can set different strides for
> the two planes and haw two DMA-engine lines (one with data + some
> padding and one with only padding) make up a single correctly formatted
> NV12 CbCr line.
>
> For readers comparing the DMA configuration with the datasheet this
> driver takes the CbCr data from even lines, compared to odd lines in the
> datasheet example. The reason for this is that if odd lines are used the
> first even line adds half a NV12 line of padding at the start of the
> CbCr plane. To counter this the CbCr plane would need a padding line at
> the start of the plane which is not supported, or we would need to set
> the plane start address half a line before the buffer actually starts
> and potentially corrupt memory as we write blank bytes outside our
> buffer.

Have you considered the following section of the chip TRM:

(3). Memory image on external memory in YUV420/LUV420 format.

Reading it suggests that the DENSE_LINE_MODE bit of register
DMA_IMAGE_AXI_CONFIG can be used to avoid outputing empty lines when
using YUV420 subsampling.

The documentation says the STRIDE value is halved from what is written
into the register when DENSE mode is used. So you would probably need
to write a 2*stride in the register but you don't actually need
to report a doubled bytesperline in 'struct v4l2_pix_format_mplane`
from risp_io_input_try_format() ?

>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/renesas/rcar-isp/core-io.c | 39 +++++++++++++++++++++-
>  drivers/media/platform/renesas/rcar-isp/core.c    | 40 +++++++++++++++++++++++
>  2 files changed, 78 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
> index 1c63194f6455..d3b302c5b66e 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core-io.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
> @@ -768,6 +768,39 @@ static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
>  	pix->xfer_func = V4L2_XFER_FUNC_SRGB;
>
>  	switch (pix->pixelformat) {
> +	case V4L2_PIX_FMT_NV12M:
> +		pix->quantization = V4L2_QUANTIZATION_LIM_RANGE;
> +		pix->num_planes = 2;
> +		/*
> +		 * The DMA-engine still outputs pixels for the height lines of
> +		 * the CrCb plane. To produce a NV12 frame we must ensure all
> +		 * these blank pixels are in the padding area of the frame.
> +		 *
> +		 * To do this the stride of the CrCb plane need to be half that
> +		 * of the Y plane. The first "DMA-engine line" will write the
> +		 * CrCb data + some blank padding, while the second "DMA-engine
> +		 * line" will only write blank padding bytes. Two "DMA-engine
> +		 * lines" will then create one correct NV12 line in the CrCb
> +		 * plane.
> +		 *
> +		 * All frame data also needs to fits in the first half of the
> +		 * line. The strict DMA flush settings used already ensures
> +		 * this is always the case.
> +		 *
> +		 * Finally the NV12 stride of the Y and CrCb plane must be the
> +		 * same and the R-Car ISP needs the hardware stride to be 256
> +		 * byte aligned. By align the Y plane lines to 512 bytes the
> +		 * CrCb planes hardware stride is always aligned with 256 when
> +		 * cut in half.
> +		 */
> +		pix->plane_fmt[0].bytesperline =
> +			ALIGN(risp_io_capture_bytesperline(pix->width, 1), 512);
> +		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
> +		/* Both planes must have the same length. */
> +		pix->plane_fmt[1].bytesperline = pix->plane_fmt[0].bytesperline;
> +		/* The CrCb plane is half height of the Y plane. */
> +		pix->plane_fmt[1].sizeimage = pix->plane_fmt[1].bytesperline * pix->height / 2;
> +		break;
>  	case V4L2_PIX_FMT_NV16M:
>  		pix->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>  		pix->num_planes = 2;
> @@ -794,9 +827,12 @@ static int risp_io_capture_enum_fmt(struct file *file, void *priv,
>
>  	switch (f->index) {
>  	case 0:
> -		f->pixelformat = V4L2_PIX_FMT_NV16M;
> +		f->pixelformat = V4L2_PIX_FMT_NV12M;
>  		break;
>  	case 1:
> +		f->pixelformat = V4L2_PIX_FMT_NV16M;
> +		break;
> +	case 2:
>  		f->pixelformat = V4L2_PIX_FMT_XBGR32;
>  		break;
>  	default:
> @@ -854,6 +890,7 @@ static int risp_io_capture_enum_framesizes(struct file *file, void *fh,
>  		return -EINVAL;
>
>  	switch (fsize->pixel_format) {
> +	case V4L2_PIX_FMT_NV12M:
>  	case V4L2_PIX_FMT_NV16M:
>  	case V4L2_PIX_FMT_XBGR32:
>  		break;
> diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
> index 5cd21134a2d7..76be90e78420 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> @@ -341,6 +341,45 @@ static int risp_core_config_output(struct rcar_isp_core *core,
>  	/* For all frame capture slots. */
>  	for (unsigned int frame = 0; frame < 4; frame++) {
>  		switch (pix->pixelformat) {
> +		case V4L2_PIX_FMT_NV12M:
> +			risp_core_write(core,
> +					ISPCORE_DMA_IMAGE_FRAME_MODE(index, frame),
> +					1);
> +			risp_core_write(core,
> +					ISPCORE_DMA_IMAGE_FRAME_PIXEL_POSITION(index, frame),
> +					0 << 24 | 0 << 16 | 4 << 8 | 16 << 0);
> +			risp_core_write(core,
> +					ISPCORE_DMA_IMAGE_FRAME_PIXEL_BITWIDTH_MINUS1(index, frame),
> +					0 << 24 | 0 << 16 | 7 << 8 | 7 << 0);
> +			/*
> +			 * Pick CrCb data from even lines.
> +			 *
> +			 * The datasheet suggest taking the odd lines but that
> +			 * would require padding at the start of the buffer to
> +			 * create valid NV12 frame, or start writing outside the
> +			 * buffer potentially corrupting memory.
> +			 */
> +			risp_core_write(core,
> +					ISPCORE_DMA_IMAGE_FRAME_PIXEL_BPP(index, frame),
> +					0 << 28 | 0 << 24 |
> +					0 << 20 | 0 << 16 |
> +					1 << 12 | 0 << 8 |
> +					3 << 4  | 0 << 0);
> +
> +			risp_core_write(core,
> +					ISPCORE_DMA_IMAGE_FRAME_STRIDE_COMP0(index, frame),
> +					pix->plane_fmt[0].bytesperline);
> +			/*
> +			 * Stride of CrCb plane needs be cut in half as the
> +			 * DMA-engine writes blank pixels for the lines not
> +			 * processed.
> +			 *
> +			 * See risp_io_capture_try_format() for details.
> +			 */
> +			risp_core_write(core,
> +					ISPCORE_DMA_IMAGE_FRAME_STRIDE_COMP1(index, frame),
> +					pix->plane_fmt[1].bytesperline / 2);

Ah here it is halved!

We double the Y and CbCr planes stride (in 2/4) to accommodate the
blank pixels (when using !DENSE mode), and here we halve it ? Is this
because with 420 subsampling the CbCr plane is half the height of the
Y plane ? So why doubling the value of pix->plane_fmt[1].bytesperline
and then halve it when writing it to registers ? To over-allocate
half a plane and fill it with blank lines ?

I'm a bit surprised that !DENSE is the default mode, as it effecively
requires to allocate 2 identically-sized planes for Y and CbCr,
effectivelly filling half of the CbCr plane with non valid data.

Do you end up with interleaved valid/non-valid lines in the CbCr plane ?
How do these get discarded when the image is interpreted by userspace ?

> +			break;
>  		case V4L2_PIX_FMT_NV16M:
>  			risp_core_write(core,
>  					ISPCORE_DMA_IMAGE_FRAME_MODE(index, frame),
> @@ -436,6 +475,7 @@ static u32 risp_core_pix2bus(const struct rcar_isp_core_io *io)
>  		return MEDIA_BUS_FMT_SRGGB12_1X12;
>  	case V4L2_PIX_FMT_XBGR32:
>  		return MEDIA_BUS_FMT_RGB888_1X24;
> +	case V4L2_PIX_FMT_NV12M:
>  	case V4L2_PIX_FMT_NV16M:
>  		return MEDIA_BUS_FMT_YUYV12_1X24;
>  	default:
>
> --
> 2.55.0
>
>
