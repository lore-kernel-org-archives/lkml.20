Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9EF4DD3D4;
	Mon, 28 Sep 2026 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605427; cv=pass; b=XUZXA8LooVNbSKCsnkJoivEUPuB76/f5z76aTS9bFqTxpe2qNt7ZdgzThJoRIqtRfHIAQh4B1H49V6SsCNTiNlWpGngeBva8VaZ1Iw7EUnSzyrmE2lvOoFK0yvTPnsN1Q5z/xVFFIZTXYc91I8Fx3dakItqc3vZ1JaXq0TO7v+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605427; c=relaxed/simple;
	bh=syVJXXky7Vf99XmjAq503du9P6MlA+JGeGE0ifXrrf4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=GarTXFfPE5Oq5xFCTROX4NrHL9qPrHOvkqEKsb9yl0DBkaShB/T/3UnT8tgpHHWsgEQBWGK377kUX2vqH+d/1OAVEr0wc670/hQll+FBh0ux059Mm+No6ivsp78z4siY7UTOr+OIwJjaW/4JKond4DUUTeGbbVig8iaX+uinys0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=OhPvoMTG; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="OhPvoMTG"
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5A653201E30;
	Mon, 28 Sep 2026 16:23:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790605419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDbYInZcYItsaSdA5N/JPrSpFCGeWb2y6Uv+tBN/tfw=;
	b=OhPvoMTGchpmBpPgONHLp6L0gfu3PEfwkeZMrS0MuswERRQkJ6P3RjLdNUWJO3T6cWroDZ
	NDSBQXPCwhARKXzy5QV9YRwgzuCu6EsZL2RmWzOSq+tVdTiJ97vq4oht+hhKTQARQNnNXj
	7BTR3VT6t6SsC6SS7j9SPgpvFz9IoBjaUDUwSjZ7yLLqaRPxHUdov2/GMdn2GwQmnyaejv
	dEQbOCIoruGlSzPK/tX6KxCCZdHkkDvGCjNgwfNvhnFSxB9VPQCCpUiJBRHDb4Yr574GNq
	M7BKr6YxLBulJU3s0wvWgoCPtUYYltS6G2i4Vgbw5hEkcMfc/iAhH9Ec6T7NPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790605419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDbYInZcYItsaSdA5N/JPrSpFCGeWb2y6Uv+tBN/tfw=;
	b=FSufx7oeE1uQoqb6jfybVykZY9sFLuEDOHcXdo0nbt322M+wPcfaXkDjmhMz+gbb7S0Fi5
	9R26RGnjmr+zGr6q6FQyQ4tT5MD5n5UyFiD5+BtJapkcLPnjgohRVUV/n2bRlHKNpLXqXi
	uaN+CrXZdy7pbqj6qqUlSmMKGzzsx6uNmU66F9VG2RQQN0HqhsC02Mmdt4Ow7ylzzCt74C
	bMLZ31Tavk3KUiE9EEcxBko/TNyMmzAEtq23HxN+hQyHSYGIOgJ4d4YIdOY9ubjWY5JexK
	9IoKFKzGjNbkUNDC+R5JrKwN3rsr8Z1BiDg+c0WBfWDTMo9Mf28pJ7DRNutaEg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790605419; a=rsa-sha256;
	cv=none;
	b=QYQn3EQTuscFiV1LHEzIueH9F0vXw2BeXsOAYm+nVsY8MYixbUMADy7vqGPxdt6X8eR4tM
	igO1yBppPmCDQfmjMpfY9aVhpQIGgIZ1Loa7PcFkj6ITnpQ4rZaxrsXhv/L7xQTxD6X69F
	T2I2gkph9lIuVL6TCh8xALIJ4KdJcOX/hFAirhKrj5CwU5fE2nxHpmgwkOX/tNr8HXy4uo
	xNGx34eqtrSuiakAiL8TCUEreSZQvn6NTZ7i0A+MI+Xeov/iz/NDyhRP/BkFTeyqqAWg46
	bOxAteH1Vodtbht4FLhKbeJa5bZxg7h43YQ0ChUa09Jku1BSNseW3IE2wZwcXA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
Message-ID: <97676b94-47f9-4937-a1aa-69e8bbd527df@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v5 2/4] media: rockchip: Add JPEG decoder driver
To: "Nicolas Dufresne" <nicolas@ndufresne.ca>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, "Lucas Sinn" <lucas.sinn@wolfvision.net>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <8a559d812623457381e65e0e62699ba043de7861.camel@ndufresne.ca>
References: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
 <20260925-rockchip-jpegdec-v5-2-30658833cb68@pengutronix.de>
 <8a559d812623457381e65e0e62699ba043de7861.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 14:23:38 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On 2026-09-25 10:31, Nicolas Dufresne wrote:
> > +++ b/drivers/media/platform/rockchip/rkjpegd/Kconfig
> > @@ -0,0 +1,16 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +config VIDEO_ROCKCHIP_JPEGD
> > +	tristate "Rockchip JPEG decoder driver"
> > +	depends on V4L_MEM2MEM_DRIVERS
> > +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> > +	depends on VIDEO_DEV
> > +	depends on PM
> > +	select MEDIA_CONTROLLER
> > +	select V4L2_JPEG_HELPER
> > +	select V4L2_MEM2MEM_DEV
> > +	select VIDEOBUF2_DMA_CONTIG
> > +	help
> > +	  Support for the JPEG decoder Rockchip integrates into a number of
> > +	  its SoCs, decoding JPEG and MJPEG frames to NV12.
>=20
> nit: Should this help contains reference to the exact model ? (e.g. VDPU7=
20)

Yes, will add.

> > +
> > +#define RKJPEGD_NAME "rockchip-jpegd"
> > +
> > +/*
> > + * The reference manual gives 48x48 to 65536x65536, but a 32 bit sizei=
mage
> > + * wraps well before the top of that range.  Cap at four times 4K in e=
ach
> > + * direction and hold both the coded format and the bitstream to it.
> > + */
> > +#define RKJPEGD_MIN_WIDTH	48
> > +#define RKJPEGD_MIN_HEIGHT	48
> > +#define RKJPEGD_MAX_SIZE	16384
>=20
> Seems quite strict and miss-leading, since you can't support stuff like
> 65536x160, which is barely 10MB / image. Can't you semantically filter it=
, or
> let the allocation fails ?

I had some trouble with possible integer overflows when allowing the
full 64k size, so I took the easy way of limiting to 16k which doesn't
overflow. I changed to use 64bit math which allows us to drop this
limitation.

> > +/**
> > + * struct rkjpegd_dev - the decoder device
> > + *
> > + * @ref:		held by the binding, dropped by devres after every
> > + *			other devres resource is released, and by the video
> > + *			device, dropped from its release callback.
> > + * @v4l2_dev:		V4L2 device.
> > + * @mdev:		media device.
> > + * @vdev:		video device.
> > + * @m2m_dev:		mem2mem device.
> > + * @dev:		driver model device.
> > + * @clocks:		clocks named by @rkjpegd_clk_names.
> > + * @resets:		the block's reset lines, as one array control.
> > + * @regs:		register window.
> > + * @irq:		the block's interrupt, masked while the watchdog has
> > + *			the hardware to itself.
> > + * @vdev_lock:		serialises ioctls and the videobuf2 queues.
> > + * @drain_lock:		serialises the mem2mem drain state between
> > + *			V4L2_DEC_CMD_STOP/START and the completion of a job,
> > + *			which runs from the interrupt handler and the
> > + *			watchdog without @vdev_lock.
> > + * @watchdog_work:	fires when a job does not complete in time.
> > + * @needs_reset:	the block ended a job in error or without
> > + *			%VDPU720_SOFT_RST_RDY and has to be reset before
> > + *			the next one is programmed.  Set from the
> > + *			interrupt handler, consumed by rkjpegd_vdpu720_run();
> > + *			the reset itself sleeps and cannot be done in either
> > + *			the interrupt handler or anywhere else atomic.
> > + */
> > +struct rkjpegd_dev {
> > +	struct kref ref;
> > +	struct v4l2_device v4l2_dev;
> > +	struct media_device mdev;
>=20
> What do you use this media device for ?

Turns out not at all. I'll drop it.

> > +static void rkjpegd_reset_fmts(struct rkjpegd_ctx *ctx)
> > +{
> > +	u32 width =3D ALIGN(RKJPEGD_MIN_WIDTH, RKJPEGD_RAW_STEP);
> > +	u32 height =3D ALIGN(RKJPEGD_MIN_HEIGHT, RKJPEGD_RAW_STEP);
> > +
> > +	rkjpegd_fill_coded_fmt(&ctx->src_fmt, width, height, 0);
> > +	rkjpegd_set_default_colorimetry(&ctx->src_fmt);
> > +
> > +	mutex_lock(&ctx->fmt_lock);
>=20
> Have you considered using guard ?

Will do, in case the lock actually survives this review.

> > +static int rkjpegd_decoder_cmd(struct file *file, void *priv,
> > +			       struct v4l2_decoder_cmd *cmd)
> > +{
> > +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(file);
> > +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> > +	bool source_change, stopped;
> > +	unsigned long flags;
> > +	int ret;
> > +
> > +	ret =3D v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (!vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)))
> > +		return 0;
> > +
> > +	if (cmd->cmd =3D=3D V4L2_DEC_CMD_STOP) {
> > +		spin_lock_irqsave(&jpegd->drain_lock, flags);
> > +		ret =3D v4l2_m2m_ioctl_decoder_cmd(file, priv, cmd);
> > +		stopped =3D v4l2_m2m_has_stopped(ctx->fh.m2m_ctx);
> > +		spin_unlock_irqrestore(&jpegd->drain_lock, flags);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		if (stopped)
> > +			v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
> > +
> > +		return 0;
> > +	}
> > +
> > +	/* Resumes after a drain or a resolution change alike. */
> > +	mutex_lock(&ctx->fmt_lock);
> > +	source_change =3D ctx->source_change;
> > +	mutex_unlock(&ctx->fmt_lock);
> > +
> > +	/* A drain the resolution change interrupted carries on. */
> > +	spin_lock_irqsave(&jpegd->drain_lock, flags);
> > +	if (!source_change || !ctx->fh.m2m_ctx->is_draining)
> > +		ret =3D v4l2_m2m_ioctl_decoder_cmd(file, priv, cmd);
>=20
> With guard, you could simply return here, and your could not need the ret
> variable.

Yes.

> > +static int vdpu720_fill_chroma(struct rkjpegd_ctx *ctx,
> > +			       struct vb2_v4l2_buffer *dst_buf)
> > +{
> > +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> > +	struct vb2_buffer *vb =3D &dst_buf->vb2_buf;
> > +	u32 y_size, size;
> > +	void *dst_cpu;
> > +	int ret;
> > +
> > +	mutex_lock(&ctx->fmt_lock);
>=20
> I keep seeing this fmt lock over and over and can't get my head around wh=
y you
> would need that. There is implicit locking in the VIDIOC system that do p=
rotect
> these. Again, can you in your own word explain your choices ?

It comes with dynamic resolution support. The check for a new resolution
has to be done in device_run() to make sure the resolution change takes
place on that exact frame. Doing it in buf_queue() would mean we get the
frames still in the queue wrong. We can't take vdev_lock in
device_run() which is why sashiko continuously stumbled upon missing
locking of ctx->dst_fmt.

I cannot judge how propable an actual race or how serious this missing
locking is. But yes, the fmt_lock is a direct result of my LLM fighting
against Sashiko.

So I could drop dynamic resolution support (which I don't need
currently), or we could ignore Sashiko here.

>=20
> > +	y_size =3D ctx->dst_fmt.plane_fmt[0].bytesperline * ctx->dst_fmt.heig=
ht;
> > +	size =3D ctx->dst_fmt.plane_fmt[0].sizeimage;
> > +	mutex_unlock(&ctx->fmt_lock);
> > +
> > +	dst_cpu =3D vb2_plane_vaddr(vb, 0);
> > +	if (!dst_cpu) {
> > +		dev_err_ratelimited(jpegd->dev,
> > +				    "JPEG capture buffer has no kernel mapping\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret =3D rkjpegd_begin_cpu_access(vb, DMA_TO_DEVICE);
> > +	if (ret)
> > +		return ret;
> > +
> > +	memset(dst_cpu + y_size, 0x80, size - y_size);
> > +
> > +	rkjpegd_end_cpu_access(vb, DMA_TO_DEVICE);
>=20
> This had no place here, should be done by the io ops.

I'll switch to a single plane output format as you suggested.


> > +	dma_sync_single_for_device(jpegd->dev, ctx->table_base.dma,
> > +				   ctx->table_base.size, DMA_TO_DEVICE);
> > +
> > +	/*
> > +	 * STRM_BASE must be 16-byte aligned, so split the address and record
> > +	 * the sub-block start byte.  Both come from the start of the plane,
> > +	 * not the payload: videobuf2 lets data_offset carry arbitrary low
> > +	 * bits, which STRM_BASE has no way to encode.
> > +	 */
> > +	strm_off        =3D data_offset + hdr->ecs_offset;
> > +	hw_strm_off     =3D strm_off & ~0xfU;
> > +	strm_start_byte =3D strm_off & 0xfU;
> > +	strm_len_blks   =3D (ALIGN(payload - hw_strm_off, 16) - 1) >> 4;
> > +
> > +	ret =3D vdpu720_fill_regs(ctx, hdr, ctx->table_base.dma,
> > +				src_dma + hw_strm_off, strm_start_byte,
> > +				strm_len_blks, dst_dma);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (hdr->frame.num_components =3D=3D 1) {
> > +		ret =3D vdpu720_fill_chroma(ctx, dst_buf);
>=20
> That seems crazy expensive. If the HW does not fill the chroma, why do yo=
u pick
> a multi-plane format in the first place. Use a Y only format instead.

That's a better approach for sure.

>=20
> Fixing that should let you skip kernel mapping of the destination buffer
> perhaps.

Yes.

>=20
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	rkjpegd_arm_watchdog(jpegd);
> > +
> > +	/*
> > +	 * A frame whose entropy data ends early runs the decoder off the end
> > +	 * of the stream, and with the condition masked it waits instead of
> > +	 * reporting.  VDPU720_ERR_MASK already covers the status.
> > +	 */
> > +	rkjpegd_write(jpegd,
> > +		      VDPU720_DEC_E | VDPU720_TIMEOUT_E | VDPU720_BUF_EMPTY_E,
> > +		      VDPU720_REG_INT);
> > +
> > +	return 0;
> > +}
> > +
> > +static irqreturn_t rkjpegd_vdpu720_irq(int irq, void *dev_id)
> > +{
> > +	struct rkjpegd_dev *jpegd =3D dev_id;
> > +	enum vb2_buffer_state state;
> > +	irqreturn_t ret =3D IRQ_NONE;
> > +	u32 status;
> > +
> > +	/* The registers are only clocked while the device is runtime active.=
 */
> > +	if (pm_runtime_get_if_active(jpegd->dev) <=3D 0)
> > +		return IRQ_NONE;
>=20
> Was that sashiko asking you to do that ?

Yes, several times:

  =E2=96=8E [High] The interrupt handler reads hardware registers without c=
hecking if the device is active via=20
  =E2=96=8E pm_runtime, leading to crashes on spurious interrupts.


  =E2=96=8E [Severity: High]
  =E2=96=8E This reads the VDPU720_REG_INT register unconditionally upon en=
try. If a spurious interrupt or an=20
  =E2=96=8E irqpoll event occurs while the device is in a runtime-suspended=
 state (with clocks and power domains=20
  =E2=96=8E gated off), will this read trigger a synchronous external abort=
 on ARM? Should it use=20
  =E2=96=8E pm_runtime_get_if_active() to verify the power state first?

  =E2=96=8E If a spurious interrupt fires while the IP block is held in res=
et, the rkjpegd_vdpu720_irq() handler=20
  =E2=96=8E will run. Because PM runtime is still active, pm_runtime_get_if=
_active() will succeed, and the handler
  =E2=96=8E will try to read from the hardware (VDPU720_REG_INT), which can=
 cause a bus stall or kernel panic.

> To start with, if you clock off the
> device, you won't get the IRQ. If you clock off the device between the st=
art of
> this function and here in a race, you have some bigger problems in your d=
river.
>=20
> This type of IP is not free-running, its trigger based. When its triggere=
d, it
> should be busy and a PM ref should be held. Be careful with sashiko remar=
ks, it
> does not differentiate free-running IP from triggered IP.
>
> I'm also a little worried that maybe you don't actually understand this, =
since
> its quite possible you simply fed sashiko into your llm to produce this v=
5.

Ok, shows I have to think a bit more before taking Sashiko things for
granted.

>
> > +
> > +	status =3D rkjpegd_read(jpegd, VDPU720_REG_INT);
> > +
> > +	/* First phase of the IRQ clear, see VDPU720_IRQ_CLR_KEEP. */
> > +	rkjpegd_write(jpegd, status & VDPU720_IRQ_CLR_KEEP, VDPU720_REG_INT);
> > +
> > +	if (!(status & VDPU720_IRQ_RAW))
> > +		goto out_put;
> > +
> > +	rkjpegd_write(jpegd, 0, VDPU720_REG_INT);
> > +
> > +	state =3D (status & VDPU720_ERR_MASK) ?
> > +		VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
>=20
> nit: Sometimes its nice to set the payload size to zero, to signal that t=
his is
> not minor data corruption but a complete decode failure. Looking below, m=
ost
> err_info imply this. Its not a bug in your implementation though.

Yes, will do.

> > +/**
> > + * rkjpegd_abort_job() - take a running job away from the hardware
> > + * @jpegd:	device whose current job is to be ended
> > + *
> > + * Resets the block and hands the frame back as an error even if it did
> > + * complete: the reset went through underneath it and cleared the inte=
rrupt
> > + * that would have said so.  The interrupt is masked across the sequen=
ce so a
> > + * completion arriving in the middle cannot finish the job a second ti=
me.
> > + *
> > + * The caller must have stopped the watchdog from firing first.  Which=
 of the
> > + * two completes a job is decided by the cancel_delayed_work() in
> > + * rkjpegd_irq_done(), so a watchdog that is still armed makes this ra=
cy.
> > + */
> > +static void rkjpegd_abort_job(struct rkjpegd_dev *jpegd)
> > +{
> > +	struct rkjpegd_ctx *ctx;
> > +
> > +	disable_irq(jpegd->irq);
>=20
> That is not needed for triggered IP, drop.

Ok.

> > +static void rkjpegd_device_run(void *priv)
> > +{
> > +	struct rkjpegd_ctx *ctx =3D priv;
> > +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> > +	struct vb2_v4l2_buffer *src, *dst;
> > +	int ret;
> > +
> > +	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > +	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > +	if (WARN_ON(!src) || WARN_ON(!dst))
> > +		return;
>=20
> I don't think m2m framework will call run unless this condition is met, s=
o this
> si likely redundant, please verify.

Right, will remove.

> > +/**
> > + * rkjpegd_has_eoi() - look for the end of image marker of a frame
> > + * @data:	the frame
> > + * @start:	offset of the entropy coded data in @data
> > + * @len:	length of @data
> > + *
> > + * v4l2_jpeg_parse_header() never looks behind the start of scan, so a
>=20
> If there is something about the common parser, fix the common parser. We =
don't
> want every driver to implement its own parsing. JPEG decoders are already=
 the
> exception, this is why we have stateless decoders for everything that was=
 made
> later.

I introduced it because it happened that for large resolutions userspace
passed buffers that couldn't fit a whole frame into them. Then decoding
stopped in the middle of a frame and the next buffer started at that
place inside a frame, so the buffers desynchronized with the frames.

The hardware has a BUF_EMPTY_E interrupt which should catch this. I
think by handling this properly we can get rid of this has_eoi check.

> > +static void rkjpegd_buf_queue(struct vb2_buffer *vb)
> > +{
> > +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > +	struct rkjpegd_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> > +
> > +	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type)) {
> > +		if (vb2_is_streaming(vb->vb2_queue) &&
> > +		    v4l2_m2m_dst_buf_is_last(ctx->fh.m2m_ctx)) {
> > +			rkjpegd_last_buffer_done(ctx, vbuf);
> > +			v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
> > +			v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
> > +			return;
> > +		}
> > +
> > +		v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> > +		return;
> > +	}
> > +
> > +	rkjpegd_parse_src_buf(ctx, vb);
>=20
> This function can fail, its not clear once you ignore the return value ho=
w the
> error will propagade to device_run() and produce a matching error dst buf=
fer.

The error travels through src_buf->parsed and rkjpegd_vdpu720_run()
bails out with an error when the frame couldn't be parsed. I can make
that clearer by returning an error from rkjpegd_parse_src_buf() and
setting the variable here instead.

> > +static void rkjpegd_stop_streaming(struct vb2_queue *vq)
> > +{
> > +	struct rkjpegd_ctx *ctx =3D vb2_get_drv_priv(vq);
> > +	struct vb2_v4l2_buffer *vbuf;
> > +
> > +	for (;;) {
> > +		if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > +			vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > +		else
> > +			vbuf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > +		if (!vbuf)
> > +			break;
> > +		if (V4L2_TYPE_IS_CAPTURE(vq->type))
> > +			vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
> > +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> > +	}
> > +
> > +	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, vq);
> > +
> > +	/* A seek also ends a drain a resolution change had cut short. */
> > +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > +		ctx->fh.m2m_ctx->last_src_buf =3D NULL;
> > +	else
> > +		rkjpegd_resume_drain(ctx);
> > +
> > +	if (V4L2_TYPE_IS_OUTPUT(vq->type) &&
> > +	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
> > +		v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
>=20
> That is strange, STREAMOFF will flush the queues, so adding an event to t=
he
> event queue seems odd, I never seen that before.

The same pattern is in the vicodec since [1], was added to mxc-jpeg in
[2] and went into this driver from there.

Sending EOS here is deprecated anyway:

      For backwards compatibility, the decoder will signal a ``V4L2_EVENT_E=
OS``
      event when the last frame has been decoded and all frames are ready t=
o be
      dequeued. It is a deprecated behavior and the client must not rely on=
 it.
      The ``V4L2_BUF_FLAG_LAST`` buffer flag should be used instead.

Maybe we can just drop it for a new driver.


[1] d4d137de5f31 ("media: vicodec: use v4l2-mem2mem draining, stopped and n=
ext-buf-is-last states handling"
[2] 4911c5acf935 ("media: imx-jpeg: Implement drain using v4l2-mem2mem help=
ers")

> > +static int rkjpegd_open(struct file *filp)
> > +{
> > +	struct rkjpegd_dev *jpegd =3D video_drvdata(filp);
> > +	struct rkjpegd_ctx *ctx;
> > +	int ret;
> > +
> > +	ctx =3D kzalloc_obj(*ctx);
>=20
> There is scope function to automatically free this on return.

Yes, will change to that.

> > +
> > +static struct platform_driver rkjpegd_driver =3D {
> > +	.probe =3D rkjpegd_probe,
> > +	.remove =3D rkjpegd_remove,
> > +	.driver =3D {
> > +		.name =3D RKJPEGD_NAME,
> > +		.of_match_table =3D of_rkjpegd_match,
> > +		.pm =3D pm_ptr(&rkjpegd_pm_ops),
> > +	},
> > +};
> > +module_platform_driver(rkjpegd_driver);
> > +
> > +MODULE_DESCRIPTION("Rockchip JPEG decoder driver");
> > +MODULE_AUTHOR("Lucas Sinn <lucas.sinn@wolfvision.net>");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS("DMA_BUF");
>=20
>=20
> Looking forward your feedback, I'm quite surprised of "your" choices, and=
 how
> you possibly have needed this complexity.

Thanks for the thorough and honest review.

When I first worked with v4l2_m2m many years ago I was excited how easy
it has become to write such an m2m driver. I am also shocked to see how
many possible races sashiko found and through which hoops I had to go to
make sashiko happy (I still haven't accomplished that it seems).

Much of the complexity comes from two things: The watchdog and the
dynamic resolution handling.

Sashiko claims the watchdog has to protect itself against a race with
the irq handler. That of course misses that the watchdog only triggers
because the IRQ doesn't come which makes it quite unlikely that the IRQ
comes in the precise moment the watchdog triggers.

I explained the complexity added with the resolution changes inline above.

Sascha


--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

