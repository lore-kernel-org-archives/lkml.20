Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490743;
	b=OYiJKtiN4jgL4L6wXXVrHRRV3Vnr99Ql1fDYf3w85YiqN4UJKfgvGgEocJzAaTD8RvsQ
	 n6FMNz71iwSg6GM9kbmNDZmQp2GAf8T7MLJwdfBD+FlDdbpwzrP4tvTA7BdvDloar/nKV
	 aEbjUkr/pNyx8elAOctCTZE7kQHcyBj6PPjQySGYNA6uEhmNy6LRqLpC/KDOon1NgWmyu
	 /1b8HaGyHxjob8ga45gjjihrZN6N1SqOZ71Ehm3TYZpteE5PuSSdB3bNHkTNYfCBIKoN4
	 55qczfRdWcTkK2co74JZDkDdT4uT3S64aag98It6m6obcke6jJ4l2+HkwS2mNliYzUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490743;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5E96vR2/z7uzLsG+hU8CSVS3ZZYuTwlRc4mXU95aTIo=;
	b=0F2ksjOuTvTc/35Cy+nkroVQ1yfbDwsHksK3yg0/qgERocNzdx9v7PopFLFxZvA+pdB9
	 CIw4uJcrcU7K/m5s4ZxUgm0mjlIQR0aBS/09SlzBS7E4JgdVXaL5+wQWc7IXR983Lvc7t
	 R1G4OLBMsOWjtALEPXiovaTj+OAkHlD3ieVOYA9wR1VJZ2Evf5qyaVtAjwTJlqpRgUx0M
	 ovbbyE4DfEpwqwT4nBHSLoNimQ6hm18JBL19DU724s7lMfwqw3K5ZW80qkvLsRPH/6Pvc
	 3lKIWVQkCenfgivHiKm57MfVfiTXzMrr0fTnIKm3KoOuVVUy8VqjkBOyPM6RBLnyLdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WGzX0ky6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7039A606A31C;
	Thu, 12 Nov 2026 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WGzX0ky6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B961F00A05;
	Thu, 12 Nov 2026 13:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490743;
	bh=5E96vR2/z7uzLsG+hU8CSVS3ZZYuTwlRc4mXU95aTIo=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=WGzX0ky64L6W96kDXj05vmDzkgcDb9HFsYnaWbcYfroEHci8pPPPkV/mvLJgAY/CN
	 I8y8nC8e5SyTwNksN5wt+FWOu7ezt0vXp7XgL6vPHxp2le2lAd7r4RJAxW49Iwvtru
	 wB+lcoqsju4q/DzG68Wpj+e/lWJSZE9pm3cCRFSTDLJF76Zd1/m09QGNKdfkk+pp0N
	 rLoyhLvjf6xGVGNJDSzb8nW43ISA9+cV4RZGD/A6iMzDWV9Ri4Q/YVNP9p5QdXM8lH
	 5OTqxnlMbRRhiG9pxmRyU/Ddw/rhIZyceNuYImcSCRwZVocpOrmGZq/w2a26V8uGNu
	 D6fD3YsL2NBtQ==
Message-ID: <1b63100c-673f-403c-aa37-4e9088a1a042@kernel.org>
Date: Thu, 12 Nov 2026 14:39:00 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: cx231xx: fix August VGB100 video and VBI capture
To: =?UTF-8?B?U2luacWhYSBEb8WhZW4=?= <snsdosen@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012103657.28574-1-snsdosen@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20261012103657.28574-1-snsdosen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Siniša,

On 12/10/2026 12:36, Siniša Došen wrote:
> Devices sold as the August VGB100 exist in at least two hardware
> revisions, although both use USB ID 1f4d:0102. The Windows driver INF
> also contains separate entries for two VGB100 revisions. The unit tested
> here reports bcdDevice 0x4002.
> 
> Linux support for this USB ID was originally added for the Geniatech
> OTG102/EZGrabber2. A later patch fixed S-Video capture on an August
> VGB100 by correcting the input routing from the VGB100 and OTG102
> Windows INF files. That profile provides working video on an older
> VGB100 unit, but it does not initialize the 0x4002 revision correctly.
> The older unit also showed URB errors and could become unresponsive when
> capturing raw VBI.
> 
> On the 0x4002 revision the generic profile leaves the analog front end
> with the wrong reference tuning, so the decoder cannot lock reliably to
> a PAL signal. Once that is corrected, cx25840 reports 720x572 while the
> bridge delivers complete 720x576 frames, causing applications to reject
> the captured buffers.
> 
> Raw VBI capture also exposes two bugs in the common cx231xx code. The
> parser stops making progress after discarding a surplus VBI line, which
> leaves readers waiting indefinitely despite continuing USB traffic. VBI
> URBs can also remain active while their vb2 buffers are returned during
> stream shutdown.
> 
> This change adds a board profile for bcdDevice 0x4002 while leaving the
> existing OTG102 profile as the fallback for the older revision. It uses
> the AFE reference tuning and frame geometry required by the new hardware,
> corrects the raw VBI parser state, stops URBs before returning buffers,
> and avoids reinitializing the analog path when userspace reselects the
> active input.
> 
> The result was tested on the 0x4002 VGB100 with 720x576 YUYV video at
> 25 fps and raw PAL VBI capture at 1440 samples over 36 lines per frame.

This patch is mixing three things: adding a new board, and fixing two
vbi bugs.

Can you split this in three patches? That's much cleaner.

Also, regarding the addition of cx231xx_uninit_vbi_isoc(): in the corresponding
stop_streaming in cx231xx-video.c, nothing similar is happening. Instead this
is done in cx231xx_close. It's not clear to me why cx231xx_uninit_vbi_isoc needs
to be called in vbi_stop_streaming. When vbi_start_streaming is called, that in
turn calls cx231xx_init_vbi_isoc which calls cx231xx_uninit_vbi_isoc in the very
beginning. Which seems reasonable?

Thank you!

Regards,

	Hans

> 
> Signed-off-by: Siniša Došen <snsdosen@gmail.com>
> ---
>  drivers/media/usb/cx231xx/cx231xx-avcore.c | 14 +++++++++++++
>  drivers/media/usb/cx231xx/cx231xx-cards.c  | 24 ++++++++++++++++++++++
>  drivers/media/usb/cx231xx/cx231xx-vbi.c    | 18 ++++++++++++----
>  drivers/media/usb/cx231xx/cx231xx-video.c  | 12 +++++++++--
>  drivers/media/usb/cx231xx/cx231xx.h        |  1 +
>  5 files changed, 63 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx-avcore.c b/drivers/media/usb/cx231xx/cx231xx-avcore.c
> index 0a5c635..fb71e39 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-avcore.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-avcore.c
> @@ -348,6 +348,7 @@ int cx231xx_afe_update_power_control(struct cx231xx *dev,
>  	case CX231XX_BOARD_HAUPPAUGE_USB2_FM_PAL:
>  	case CX231XX_BOARD_HAUPPAUGE_USB2_FM_NTSC:
>  	case CX231XX_BOARD_OTG102:
> +	case CX231XX_BOARD_AUGUST_VGB100:
>  		if (avmode == POLARIS_AVMODE_ANALOGT_TV) {
>  			while (afe_power_status != (FLD_PWRDN_TUNING_BIAS |
>  						FLD_PWRDN_ENABLE_PLL)) {
> @@ -932,6 +933,18 @@ int cx231xx_set_decoder_video_input(struct cx231xx *dev,
>  		status = vid_blk_write_word(dev, OUT_CTRL1, value);
>  	}
>  
> +	/*
> +	 * The generic setup derives TUNE1 from the reference clock and leaves
> +	 * 0x42 here.  The VGB100 40.02 analogue front end requires 0xbe;
> +	 * otherwise its decoder never acquires horizontal sync.
> +	 */
> +	if (dev->model == CX231XX_BOARD_AUGUST_VGB100 &&
> +	    pin_type == CX231XX_VMUX_COMPOSITE1) {
> +		status = afe_write_byte(dev, SUP_BLK_TUNE1, 0xbe);
> +		if (status < 0)
> +			return status;
> +	}
> +
>  	return status;
>  }
>  
> @@ -1729,6 +1742,7 @@ int cx231xx_dif_set_standard(struct cx231xx *dev, u32 standard)
>  	case CX231XX_BOARD_CNXT_VIDEO_GRABBER:
>  	case CX231XX_BOARD_HAUPPAUGE_EXETER:
>  	case CX231XX_BOARD_OTG102:
> +	case CX231XX_BOARD_AUGUST_VGB100:
>  		func_mode = 0x03;
>  		break;
>  	case CX231XX_BOARD_CNXT_RDE_253S:
> diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
> index 69b2420..7ce160d 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-cards.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
> @@ -685,6 +685,28 @@ struct cx231xx_board cx231xx_boards[] = {
>  			}
>  		},
>  	},
> +	[CX231XX_BOARD_AUGUST_VGB100] = {
> +		.name = "August VGB100",
> +		.tuner_type = TUNER_ABSENT,
> +		.decoder = CX231XX_AVDECODER,
> +		.output_mode = OUT_MODE_VIP11,
> +		.ctl_pin_status_mask = 0xFFFFFFC4,
> +		.agc_analog_digital_select_gpio = 0x0c,
> +		.gpio_pin_status_mask = 0x4001000,
> +		.norm = V4L2_STD_PAL,
> +		.no_alt_vanc = 1,
> +		.external_av = 1,
> +		.input = {{
> +			.type = CX231XX_VMUX_COMPOSITE1,
> +			.vmux = CX231XX_VIN_2_1,
> +			.amux = CX231XX_AMUX_LINE_IN,
> +		}, {
> +			.type = CX231XX_VMUX_SVIDEO,
> +			.vmux = CX231XX_VIN_1_1 |
> +				(CX231XX_VIN_3_2 << 8),
> +			.amux = CX231XX_AMUX_LINE_IN,
> +		} },
> +	},
>  	[CX231XX_BOARD_HAUPPAUGE_930C_HD_1113xx] = {
>  		.name = "Hauppauge WinTV 930C-HD (1113xx) / HVR-900H (111xxx) / PCTV QuatroStick 521e",
>  		.tuner_type = TUNER_NXP_TDA18271,
> @@ -1061,6 +1083,8 @@ struct usb_device_id cx231xx_id_table[] = {
>  	 .driver_info = CX231XX_BOARD_ICONBIT_U100},
>  	{USB_DEVICE(0x0fd9, 0x0037),
>  	 .driver_info = CX231XX_BOARD_ELGATO_VIDEO_CAPTURE_V2},
> +	{USB_DEVICE_VER(0x1f4d, 0x0102, 0x4002, 0x4002),
> +	 .driver_info = CX231XX_BOARD_AUGUST_VGB100},
>  	{USB_DEVICE(0x1f4d, 0x0102),
>  	 .driver_info = CX231XX_BOARD_OTG102},
>  	{USB_DEVICE(USB_VID_TERRATEC, 0x00a6),
> diff --git a/drivers/media/usb/cx231xx/cx231xx-vbi.c b/drivers/media/usb/cx231xx/cx231xx-vbi.c
> index 338e101..63db257 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-vbi.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-vbi.c
> @@ -234,6 +234,8 @@ static void vbi_stop_streaming(struct vb2_queue *vq)
>  {
>  	struct cx231xx *dev = vb2_get_drv_priv(vq);
>  
> +	/* Stop URB callbacks before returning their destination buffers. */
> +	cx231xx_uninit_vbi_isoc(dev);
>  	return_all_buffers(dev, VB2_BUF_STATE_ERROR);
>  }
>  
> @@ -499,8 +501,12 @@ u32 cx231xx_copy_vbi_line(struct cx231xx *dev, struct cx231xx_dmaqueue *dma_q,
>  		cx231xx_reset_vbi_buffer(dev, dma_q);
>  	}
>  
> -	if (dma_q->current_field != field_number)
> +	if (dma_q->current_field != field_number) {
> +		/* Drop any incomplete surplus line from the previous field. */
>  		dma_q->lines_completed = 0;
> +		dma_q->bytes_left_in_line = _line_size;
> +		dma_q->is_partial_line = 0;
> +	}
>  
>  	/* get the buffer pointer */
>  	buf = dev->vbi_mode.bulk_ctl.buf;
> @@ -514,9 +520,13 @@ u32 cx231xx_copy_vbi_line(struct cx231xx *dev, struct cx231xx_dmaqueue *dma_q,
>  
>  	if (dma_q->lines_completed >= dma_q->lines_per_field) {
>  		dma_q->bytes_left_in_line -= bytes_to_copy;
> -		dma_q->is_partial_line =
> -		    (dma_q->bytes_left_in_line == 0) ? 0 : 1;
> -		return 0;
> +		if (dma_q->bytes_left_in_line == 0) {
> +			dma_q->bytes_left_in_line = _line_size;
> +			dma_q->is_partial_line = 0;
> +		} else {
> +			dma_q->is_partial_line = 1;
> +		}
> +		return bytes_to_copy;
>  	}
>  
>  	dma_q->is_partial_line = 1;
> diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
> index 70aa99f..4fd31ab 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-video.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-video.c
> @@ -912,6 +912,10 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
>  	call_all(dev, pad, set_fmt, NULL, &format);
>  	v4l2_fill_pix_format(&f->fmt.pix, &format.format);
>  
> +	/* The DMA engine keeps the requested 576-line PAL geometry. */
> +	if (dev->model == CX231XX_BOARD_AUGUST_VGB100)
> +		vidioc_g_fmt_vid_cap(file, priv, f);
> +
>  	return rc;
>  }
>  
> @@ -1065,13 +1069,17 @@ int cx231xx_s_input(struct file *file, void *priv, unsigned int i)
>  {
>  	struct cx231xx *dev = video_drvdata(file);
>  
> -	dev->mode_tv = 0;
> -
>  	if (i >= MAX_CX231XX_INPUT)
>  		return -EINVAL;
>  	if (0 == INPUT(i)->type)
>  		return -EINVAL;
>  
> +	/* Reapplying the vendor profile disturbs an active raw VBI stream. */
> +	if (dev->model == CX231XX_BOARD_AUGUST_VGB100 &&
> +	    i == dev->video_input)
> +		return 0;
> +
> +	dev->mode_tv = 0;
>  	video_mux(dev, i);
>  
>  	if (INPUT(i)->type == CX231XX_VMUX_TELEVISION ||
> diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
> index 19f5036..1cb08ec 100644
> --- a/drivers/media/usb/cx231xx/cx231xx.h
> +++ b/drivers/media/usb/cx231xx/cx231xx.h
> @@ -70,6 +70,7 @@
>  #define CX231XX_BOARD_THE_IMAGING_SOURCE_DFG_USB2_PRO 25
>  #define CX231XX_BOARD_HAUPPAUGE_935C 26
>  #define CX231XX_BOARD_HAUPPAUGE_975 27
> +#define CX231XX_BOARD_AUGUST_VGB100 28
>  
>  /* Limits minimum and default number of buffers */
>  #define CX231XX_MIN_BUF                 4

