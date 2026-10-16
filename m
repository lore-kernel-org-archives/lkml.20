Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0407F4F55A6;
	Fri, 16 Oct 2026 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166795; cv=none; b=kXv/DHTQXAjJjmqaJYLQo1/Fs3ePViDuQjPyDAcaHNTtDEyBM3DUwKO+Koha8lV/nbwIuwiRTIunwA/XA87d83zEJCRPQx4utSrI1PgS+S/kx3CLW3JnedEHqQmFQvU48T2WaDje2EOvvKL+mAQTauFtWgfJRxARUKiZQq2xxag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166795; c=relaxed/simple;
	bh=lEnwP/3dbjnKuNF4/YMp4Fz5Mf/k4H4JPCNzEaJs5YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbbEjCAbp3qlMnzrguL0qqfXXw9UWaY7PbP1RdA5RT30uwBqLC/yjMVVNRZDmqHjU9B3MANSAkIY6x3NlnFlszt4j9f/uR7IAN78qJTxmtdpthd2Ozszs3+XTlSUH8cnteXGcXPAAp65oxfntsydXkb1pDANcZljGfXpKnPE6A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xHkRr-00000000864-1MpA;
	Fri, 16 Oct 2026 16:06:23 +0000
Date: Fri, 16 Oct 2026 17:06:20 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, michael.riesch@collabora.com,
	stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com,
	xuhf@rock-chips.com, zyc@rock-chips.com, dalong.deng@rock-chips.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/5] media: rockchip: rkisp2: Add rkisp2 driver
Message-ID: <atJLfEgkbd2tEGEJ@makrotopia.org>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
 <20260827-rkisp2-v3-1-e91ff0a604d6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-rkisp2-v3-1-e91ff0a604d6@ideasonboard.com>

On Thu, Aug 27, 2026 at 07:48:30PM +0900, Paul Elder wrote:
> From: Xu Hongfei <xuhf@rock-chips.com>
>
> This patch adds the rkisp2 driver, which aims to support all Rockchip
> ISP 2.x and 3.x versions. This initial version only supports the version
> of the ISP on the RK3588, which is a 3.0.
[...]

Hi Paul,

I have been running this on the RV1126 (ISP 2.0) for a while; the
comments below are the ones that apply to the code as posted and not
only to the 2.0. Everything about the RK3588 is by code inspection, I
do not have one.

[...]
> +++ b/drivers/media/platform/rockchip/rkisp2/Kconfig
[...]
> +config VIDEO_ROCKCHIP_ISP2
> +	tristate "Rockchip Image Signal Processing v2 Unit driver"
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on VIDEO_DEV && OF
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_VMALLOC
> +	select V4L2_FWNODE
> +	select GENERIC_PHY_MIPI_DPHY

Patches 2 and 3 call the v4l2-isp helpers
(v4l2_isp_params_validate_buffer(), v4l2_isp_stats_init_block()), and
V4L2_ISP is a hidden symbol, so this needs "select V4L2_ISP" like
rkisp1 has; in a configuration where this driver is the only user the
module does not link. V4L2_FWNODE and GENERIC_PHY_MIPI_DPHY are
selected, but nothing in the driver uses either.

[...]
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-capture.c
[...]
> +	/* yuv420 */
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV21,
> +		.uv_swap = 1,
> +		.write_format = RKISP2_MI_CTRL_MP_WRITE_YUV_SPLA,
> +		.output_format = ISP32_MI_OUTPUT_YUV420,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_NV12,
> +		.uv_swap = 0,
> +		.write_format = RKISP2_MI_CTRL_MP_WRITE_YUV_SPLA,
> +		.output_format = ISP32_MI_OUTPUT_YUV420,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> +	}, {

The ISP source pads only offer YUYV8_2X8 (rkisp2_formats[] has no
YUYV8_1_5X8 entry) and rkisp2_capture_link_validate() compares the pad
code with fmt->mbus, so NV21, NV21M, NV12M, YUV420 and YVU420 fail link
validation on both paths; NV12 passes only because its entry carries
the code of the pad. The ISP produces the same 4:2:2 data for every
YUV output and the resizer and MI do the conversion, so I used
YUYV8_2X8 for all YUV entries of both tables.

[...]
> +static void rkisp2_mp_config(struct rkisp2_capture *cap)
[...]
> +	u32 mask = ISP3X_MPFBC_FORCE_UPD | ISP3X_MP_YUV_MODE;
> +
> +	reg = rkisp2_read(rkisp2, ISP3X_MPFBC_CTRL) & ~mask;
> +	if (pixm->pixelformat == V4L2_PIX_FMT_NV21 ||
> +	    pixm->pixelformat == V4L2_PIX_FMT_NV12 ||
> +	    pixm->pixelformat == V4L2_PIX_FMT_NV21M ||
> +	    pixm->pixelformat == V4L2_PIX_FMT_NV21M ||
> +	    pixm->pixelformat == V4L2_PIX_FMT_YVU420)
> +		reg |= ISP3X_SEPERATE_YUV_CFG;
> +	else
> +		reg |= ISP3X_SEPERATE_YUV_CFG | ISP3X_MP_YUV_MODE;

NV21M is listed twice and NV12M and YUV420 are missing, so those two
get ISP3X_MP_YUV_MODE set unlike the other 4:2:0 formats. The list in
rkisp2_sp_config() has the same slip.

[...]
> +static void rkisp2_set_next_buf(struct rkisp2_capture *cap)
[...]
> +		rkisp2_write(cap->rkisp2, cap->config->mi.y_base_ad_init,
> +			     buff_addr[RKISP2_PLANE_Y]);
> +		/*
> +		 * In order to support grey format we capture
> +		 * YUV422 planar format from the camera and
> +		 * set the U and V planes to the dummy buffer
> +		 */
> +		if (cap->pix.cfg->fourcc == V4L2_PIX_FMT_GREY) {
> +			rkisp2_write(cap->rkisp2,
> +				     cap->config->mi.cb_base_ad_init,
> +				     cap->buf.dummy.dma_addr);
> +		} else {
> +			rkisp2_write(cap->rkisp2,
> +				     cap->config->mi.cb_base_ad_init,
> +				     buff_addr[RKISP2_PLANE_CB]);
> +		}
> +	} else {
> +		/*
> +		 * Use the dummy space allocated by dma_alloc_coherent to
> +		 * throw data if there is no available buffer.
> +		 */
> +		rkisp2_write(cap->rkisp2, cap->config->mi.y_base_ad_init,
> +			     cap->buf.dummy.dma_addr);
> +		rkisp2_write(cap->rkisp2, cap->config->mi.cb_base_ad_init,
> +			     cap->buf.dummy.dma_addr);
> +	}

mi.cr_base_ad_init is never written, in neither branch, although
rkisp2_vb2_buf_init() computes (and for uv_swap swaps)
buff_addr[RKISP2_PLANE_CR]. For the three-plane formats (YUV422P,
YVU422M, YUV420, YVU420, and GREY on the self path, which writes YUV422
planar) the MI writes the CR plane to the reset value of the register
or to whatever the previous stream left there. By code inspection this
is what the "YUV422 and YVU422 need some debugging" note refers to.
rkisp1_set_next_buf() writes all three (and the dummy for CR on GREY).

[...]
> +static int rkisp2_pipeline_stream_enable(struct rkisp2_capture *cap)
[...]
> +	/*
> +	 * If the other capture is streaming, isp and sensor nodes are already
> +	 * enabled, skip them.
> +	 */
> +	if (rkisp2->pipe.start_count > 1)
> +		return 0;
> +
> +	ret = v4l2_subdev_call(&rkisp2->isp.sd, video, s_stream, true);

The raw readback nodes call video_device_pipeline_start() on the same
rkisp2->pipe and never start the ISP themselves, so start_count counts
them too. Starting rawrd0 first and then the main path gives
start_count 2 here, the ISP is never configured or enabled, no frame
is produced, and the stop waits out the 1 s timeout in
rkisp2_cap_stream_disable(). I ran into this on the RV1126 when
libcamera started the readback node first; by the code it holds for
every model. rkisp2_pipeline_stream_disable() makes the opposite
assumption (start_count < (source ? 2 : 3)) and does count the
readback node. Tracking whether the ISP is running, or counting only
the capture nodes, would make this independent of the start order.

[...]
> +	memset(&pixm, 0, sizeof(pixm));
> +	pixm.pixelformat = V4L2_PIX_FMT_YUYV;

YUYV is in neither format table, so rkisp2_try_fmt() silently turns
the default into UYVY. The first table entry would say what happens.

[...]
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h
[...]
> +irqreturn_t rkisp2_mipi_isr(int irq, void *ctx);

Declared, but neither defined nor used.

[...]
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-debug.c
[...]
> +		RKISP2_DEBUG_REG(MI_MP_Y_SIZE_INIT),
> +		RKISP2_DEBUG_REG(MI_MP_Y_SIZE_INIT),

Listed twice.

[...]
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c
[...]
> +	v4l2_async_nf_unregister(&rkisp2->notifier);
> +	v4l2_async_nf_cleanup(&rkisp2->notifier);

The notifier is never initialised or registered in probe; both
helpers tolerate the zeroed structure, so this is dead code until the
inline mode arrives.

[...]
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-dmarx.c
[...]
> +		if (done)
> +			vb2_buffer_done(&done->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +
> +		dev_dbg(rkisp2->dev, "%s: %s buffer %pad done\n",
> +			__func__, chan->cfg->name, &done->buff_addr[0]);

done can be NULL here; %pad then prints "(efault)". This belongs under
the if.

[...]
> +static void rkisp2_rawrd_stop_streaming(struct vb2_queue *queue)
[...]
> +	mutex_lock(&rkisp2->stream_lock);
> +	chan->streaming = false;
> +	rkisp2_rawrd_return_all_buffers(chan, VB2_BUF_STATE_ERROR);
> +
> +	/*
> +	 * TODO Use stream counter to stop/start all video nodes when all are
> +	 * started / one is stopped
> +	 * We only need to clear BIT(30) but we write just BIT(30) anyway so
> +	 * writing 0 is ok for now
> +	 */
> +	rkisp2_write(rkisp2, MI_RD_CTRL2, 0);

When the readback node is stopped while the main path keeps streaming,
curr_buf (the frame the engine may be reading) is returned and the vb2
buffers are freed right after; the CSI2RX stays enabled and nothing
waits for the read in progress, while the capture side waits for the
shadow disable at the next frame end. Is there something on the 3.0
that guarantees the read has finished at this point? On the RV1126 I
had to wait for the ISP frame completion before releasing the buffers.

[...]
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-isp.c
[...]
> +	val = RKISP2_CIF_SWS_MIPI_DROP_FRM_DIS	| RKISP2_CIF_SWS_ACK_FRM_PRO_DIS;
> +	rkisp2_write(rkisp2, ISP3X_SWS_CFG, val);

This and rkisp2_runtime_resume() replace the whole register. On the
2.0 the reset value has further bits set (the DDR read enables of the
TMO, WDR and DHAZ blocks) and ACK_FRM_PRO_DIS does not exist, so I set
the drop bit on top of the current value there. Does the 3.0 hold
anything in SWS_CFG at reset that this write should keep?

[...]
> +		if (format->quantization != V4L2_QUANTIZATION_DEFAULT)
> +			src_fmt->quantization = format->quantization;

A full range request is accepted here but nothing acts on it: the
CSM_Y_FULL_ENA and CSM_C_FULL_ENA bits of ISP_CTRL are never set and
the CSM parameters block has no range field, so with full range
coefficients in the CSM block the picture stays limited range (seen on
the RV1126 with the sYCC configuration of the libcamera IPA).
rkisp1_csm_config() sets the two bits from the pad quantization; doing
the same in rkisp2_config_isp() fixed it for me.

[...]
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -207,6 +207,7 @@ enum rkisp1_cif_isp_version {
>  	RKISP1_V12,
>  	RKISP1_V13,
>  	RKISP1_V_IMX8MP,
> +	RKISP1_V30,
>  };

Nothing uses this; rkisp2 has its own enum rkisp2_isp_version with
RKISP3_V0. It changes the uapi of another driver for no reason.

Best regards,
Daniel
