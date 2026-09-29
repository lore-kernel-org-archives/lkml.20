Received: from mail-qk2-f5.google.com (mail-qk2-f5.google.com [74.125.230.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A95153C3A4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710502; cv=none; b=W4pssK6KUbNwdp4ajt92EXkJSU2cU3z43SIiLRgWzVJnzP+/+iCgtXNqdzYehtYVmoMTgP6LK+CCRV0UioGgsp373eX9VH1IjzOf6wBGQTUsrZ/Uy4sd5ugcWgAPQ+qXJOj3rJINwnfxE+mh+D6H6RCCRKUGG1V7Qh5lQPUUflg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710502; c=relaxed/simple;
	bh=o53exGi8gg2iYezoC/nTHvNaV9cNDGpywggNH9u6+es=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RTeAgRdTIf/YkbwOh7N5QFXVg5r5gW3YGgAUm/jgAoVqlIABRAJipvWYzIhwQ9tgUnqTF/psDruMaD0pLi+L6nSuRs/ZTwde0jm1t8jX2uC5lhnR1HAY/iraKWbgXQtdrUXe7UcMASUmEd7pxJ8DVUMIBH9begZSFouGZPoaQKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=uP2BMI4L; arc=none smtp.client-ip=74.125.230.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="uP2BMI4L"
Received: by mail-qk2-f5.google.com with SMTP id af79cd13be357-9392f49a01eso316229085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790710499; x=1791315299; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayjPnwN3HqP7T0l2HJPneqSGhWsdxu4NXADnhmQjpQg=;
        b=uP2BMI4LpOBCTgNTP3CDF9r6l3MgyCX+7Cqd2VFp0VFxgt6V/Y3KiFLvRLZjWw64Ta
         jlV4zL45YCchkjz3Yqm0W3SvYFQjxfzD1HlUsI4DbKPLPtA98Lc7UiQhxs0cBl0OiKUd
         yxTY7rBfZ8J2ES+KpX75oXdI+45HwLyqfnN+EzzAVQeCbL6dck3BEONZb6B6hfmsjgUu
         im5GPzoRG5cDHV8kqzbw1JcrLrSYzxCVS12feLQBTlltBUrLjf0u38n9w6UsbrgcHuDG
         H+//v6bljAd8JNyxLdyyK50mWkkBkGLyNhXy3ISjlIkHjm5Ff/w1txKAkzolWSIrjYGM
         G48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710499; x=1791315299;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayjPnwN3HqP7T0l2HJPneqSGhWsdxu4NXADnhmQjpQg=;
        b=loqJtYhIouyq6VfKiM1vgLbh+Ys9I+YtGNs/d9NzcM0cHa8qIXuN/99B/vTa+rgdhQ
         p0qhRBR7Fm4zRsF6s7u6M7ws9z8fi9wWDhFb2SgBQcyqU/H1SCpSphbJaS8J6Qp4dC+3
         N3wguDc+wUrpfVXtcCLaIFUmYNs9/StZ9d3nFyrdlFEyTtwFp15W0cD4vgVDkTqkvOon
         Ct4U+7S8fHzMYfUvcgGw7JW+Ut37yWKygT2lKfi5Jlp8VOuSpa3661mMU5TqswMMKI4c
         V3hD/mkmWYZtYzkyMQ8kWMm2lxffDq1A+MGwlvxXEJDR8epAKUwgRJOh+a63oVRXszoj
         b3mg==
X-Forwarded-Encrypted: i=1; AKwUvBwLZzIDpdx20j26S9x8SNlb74MTJHlLD9tf4qn5RBOzsKGuAiXFWX3aDMzfgradjAU+zeuPOG0ZyLlKZlM=@vger.kernel.org
X-Gm-Message-State: AFuF++meLMPTvAdTilxAAmAyIclWbMeUTYxsywgCTor1prZz8APRBjQM
	Ys4BsgSYLBgCpIkTM5BhrU8AV3Ii8GuAuBAiCUDnYYW8lMR4MceGXakjacc7BCJrjEI=
X-Gm-Gg: AYBFou3Alm0OK3htuIytq7if+VKeR2wP2NRVusTLPMGWDeu57YaRJ+Wu8bn6vmtqxUG
	v9vf6ND0i+Fvbwc5Wnfeji7RB7n8sAN2KAZVUcHIPwnCcSRDJ/YnfJJkJ5XnZ+kIRb2SYaYcfIb
	ihosQox1RNI+Ay4pLzOiq4im782BYxIvgPAmYN/qohmwuAIg+96jmKP+FZhbX2OSCtla3C2rBet
	XoM9Xep3P1vEMlwdTC1AXY70zQJECm7LG3L7IVh0g7b2HTyUeMRVQoisqkLBizHHiZ3bvv74sQ4
	NxNGrqhRSjtnnskteBVMd/oTfU8bFgqKZoR9+nTl+Amd41hSGU49YG0UZmt5TulKYJTgTFo5E+y
	CObQG74Tz9p/8eOjIhx3rfxxq02CWJZZz/ZHvPBSN9DXdA/SwTWKrslNr9rj4ED01PvWyu1VU9J
	4sJ0/w+tn6hQftN1uClrG2odbMYAlYv43aQ0U01E10QPlnnqxwYUYridY5hXcuOyxF+KMUHzCGw
	t+YVRrlyj06W/k2J51CkBCQ
X-Received: by 2002:a05:620a:4709:b0:939:8855:5535 with SMTP id af79cd13be357-93c9fa172f4mr116286985a.45.1790710498633;
        Tue, 29 Sep 2026 12:34:58 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f576569sm42575985a.47.2026.09.29.12.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:34:57 -0700 (PDT)
Message-ID: <c28b782fd2de05f4e1fdaa1df96a57f04640f4df.camel@ndufresne.ca>
Subject: Re: [PATCH v5 2/4] media: rockchip: Add JPEG decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
	 <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 15:34:55 -0400
In-Reply-To: <97676b94-47f9-4937-a1aa-69e8bbd527df@pengutronix.de>
References: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
	 <20260925-rockchip-jpegdec-v5-2-30658833cb68@pengutronix.de>
	 <8a559d812623457381e65e0e62699ba043de7861.camel@ndufresne.ca>
	 <97676b94-47f9-4937-a1aa-69e8bbd527df@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-e0QK1iLo/RR+fN85m10x"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-e0QK1iLo/RR+fN85m10x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 28 septembre 2026 =C3=A0 14:23 +0000, Sascha Hauer a =C3=A9crit=C2=
=A0:
> On 2026-09-25 10:31, Nicolas Dufresne wrote:
> > > +++ b/drivers/media/platform/rockchip/rkjpegd/Kconfig
> > > @@ -0,0 +1,16 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +config VIDEO_ROCKCHIP_JPEGD
> > > +	tristate "Rockchip JPEG decoder driver"
> > > +	depends on V4L_MEM2MEM_DRIVERS
> > > +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> > > +	depends on VIDEO_DEV
> > > +	depends on PM
> > > +	select MEDIA_CONTROLLER
> > > +	select V4L2_JPEG_HELPER
> > > +	select V4L2_MEM2MEM_DEV
> > > +	select VIDEOBUF2_DMA_CONTIG
> > > +	help
> > > +	  Support for the JPEG decoder Rockchip integrates into a number of
> > > +	  its SoCs, decoding JPEG and MJPEG frames to NV12.
> >=20
> > nit: Should this help contains reference to the exact model ? (e.g. VDP=
U720)
>=20
> Yes, will add.
>=20
> > > +
> > > +#define RKJPEGD_NAME "rockchip-jpegd"
> > > +
> > > +/*
> > > + * The reference manual gives 48x48 to 65536x65536, but a 32 bit siz=
eimage
> > > + * wraps well before the top of that range.  Cap at four times 4K in=
 each
> > > + * direction and hold both the coded format and the bitstream to it.
> > > + */
> > > +#define RKJPEGD_MIN_WIDTH	48
> > > +#define RKJPEGD_MIN_HEIGHT	48
> > > +#define RKJPEGD_MAX_SIZE	16384
> >=20
> > Seems quite strict and miss-leading, since you can't support stuff like
> > 65536x160, which is barely 10MB / image. Can't you semantically filter =
it, or
> > let the allocation fails ?
>=20
> I had some trouble with possible integer overflows when allowing the
> full 64k size, so I took the easy way of limiting to 16k which doesn't
> overflow. I changed to use 64bit math which allows us to drop this
> limitation.
>=20
> > > +/**
> > > + * struct rkjpegd_dev - the decoder device
> > > + *
> > > + * @ref:		held by the binding, dropped by devres after every
> > > + *			other devres resource is released, and by the video
> > > + *			device, dropped from its release callback.
> > > + * @v4l2_dev:		V4L2 device.
> > > + * @mdev:		media device.
> > > + * @vdev:		video device.
> > > + * @m2m_dev:		mem2mem device.
> > > + * @dev:		driver model device.
> > > + * @clocks:		clocks named by @rkjpegd_clk_names.
> > > + * @resets:		the block's reset lines, as one array control.
> > > + * @regs:		register window.
> > > + * @irq:		the block's interrupt, masked while the watchdog has
> > > + *			the hardware to itself.
> > > + * @vdev_lock:		serialises ioctls and the videobuf2 queues.
> > > + * @drain_lock:		serialises the mem2mem drain state between
> > > + *			V4L2_DEC_CMD_STOP/START and the completion of a job,
> > > + *			which runs from the interrupt handler and the
> > > + *			watchdog without @vdev_lock.
> > > + * @watchdog_work:	fires when a job does not complete in time.
> > > + * @needs_reset:	the block ended a job in error or without
> > > + *			%VDPU720_SOFT_RST_RDY and has to be reset before
> > > + *			the next one is programmed.  Set from the
> > > + *			interrupt handler, consumed by rkjpegd_vdpu720_run();
> > > + *			the reset itself sleeps and cannot be done in either
> > > + *			the interrupt handler or anywhere else atomic.
> > > + */
> > > +struct rkjpegd_dev {
> > > +	struct kref ref;
> > > +	struct v4l2_device v4l2_dev;
> > > +	struct media_device mdev;
> >=20
> > What do you use this media device for ?
>=20
> Turns out not at all. I'll drop it.
>=20
> > > +static void rkjpegd_reset_fmts(struct rkjpegd_ctx *ctx)
> > > +{
> > > +	u32 width =3D ALIGN(RKJPEGD_MIN_WIDTH, RKJPEGD_RAW_STEP);
> > > +	u32 height =3D ALIGN(RKJPEGD_MIN_HEIGHT, RKJPEGD_RAW_STEP);
> > > +
> > > +	rkjpegd_fill_coded_fmt(&ctx->src_fmt, width, height, 0);
> > > +	rkjpegd_set_default_colorimetry(&ctx->src_fmt);
> > > +
> > > +	mutex_lock(&ctx->fmt_lock);
> >=20
> > Have you considered using guard ?
>=20
> Will do, in case the lock actually survives this review.
>=20
> > > +static int rkjpegd_decoder_cmd(struct file *file, void *priv,
> > > +			       struct v4l2_decoder_cmd *cmd)
> > > +{
> > > +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(file);
> > > +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> > > +	bool source_change, stopped;
> > > +	unsigned long flags;
> > > +	int ret;
> > > +
> > > +	ret =3D v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	if (!vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)))
> > > +		return 0;
> > > +
> > > +	if (cmd->cmd =3D=3D V4L2_DEC_CMD_STOP) {
> > > +		spin_lock_irqsave(&jpegd->drain_lock, flags);
> > > +		ret =3D v4l2_m2m_ioctl_decoder_cmd(file, priv, cmd);
> > > +		stopped =3D v4l2_m2m_has_stopped(ctx->fh.m2m_ctx);
> > > +		spin_unlock_irqrestore(&jpegd->drain_lock, flags);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +
> > > +		if (stopped)
> > > +			v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	/* Resumes after a drain or a resolution change alike. */
> > > +	mutex_lock(&ctx->fmt_lock);
> > > +	source_change =3D ctx->source_change;
> > > +	mutex_unlock(&ctx->fmt_lock);
> > > +
> > > +	/* A drain the resolution change interrupted carries on. */
> > > +	spin_lock_irqsave(&jpegd->drain_lock, flags);
> > > +	if (!source_change || !ctx->fh.m2m_ctx->is_draining)
> > > +		ret =3D v4l2_m2m_ioctl_decoder_cmd(file, priv, cmd);
> >=20
> > With guard, you could simply return here, and your could not need the r=
et
> > variable.
>=20
> Yes.
>=20
> > > +static int vdpu720_fill_chroma(struct rkjpegd_ctx *ctx,
> > > +			       struct vb2_v4l2_buffer *dst_buf)
> > > +{
> > > +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> > > +	struct vb2_buffer *vb =3D &dst_buf->vb2_buf;
> > > +	u32 y_size, size;
> > > +	void *dst_cpu;
> > > +	int ret;
> > > +
> > > +	mutex_lock(&ctx->fmt_lock);
> >=20
> > I keep seeing this fmt lock over and over and can't get my head around =
why you
> > would need that. There is implicit locking in the VIDIOC system that do=
 protect
> > these. Again, can you in your own word explain your choices ?
>=20
> It comes with dynamic resolution support. The check for a new resolution
> has to be done in device_run() to make sure the resolution change takes
> place on that exact frame. Doing it in buf_queue() would mean we get the
> frames still in the queue wrong. We can't take vdev_lock in
> device_run() which is why sashiko continuously stumbled upon missing
> locking of ctx->dst_fmt.
>=20
> I cannot judge how propable an actual race or how serious this missing
> locking is. But yes, the fmt_lock is a direct result of my LLM fighting
> against Sashiko.
>=20
> So I could drop dynamic resolution support (which I don't need
> currently), or we could ignore Sashiko here.

That's the tougher one to solve I suppose. This is probably the first jpeg
decoder implementing DYN_RESOLUTION, which is valid, just a feature more re=
cent
then most jpeg decoders today.

I was mostly triggered by the fact  called fmt lock, since device_run() onl=
y
occurs while the device is streaming, and the format cannot change while
streaming.

On dynamic resolution change, to avoid the need for this locking, I believe=
 you
want to delay the update of the dst_fmt to when the draining have completed=
 and
userspace stop streaming. Only then it is safe, as in order to resume decod=
ing,
userspace will have to call streamon, which will fail if the allocated buff=
ers
are too small. There is no other validation of the buffer size in place, so
otherwise you can just do CMD_START and let the HW write all over the place=
.

> >=20
> > > +	y_size =3D ctx->dst_fmt.plane_fmt[0].bytesperline * ctx->dst_fmt.he=
ight;
> > > +	size =3D ctx->dst_fmt.plane_fmt[0].sizeimage;
> > > +	mutex_unlock(&ctx->fmt_lock);
> > > +
> > > +	dst_cpu =3D vb2_plane_vaddr(vb, 0);
> > > +	if (!dst_cpu) {
> > > +		dev_err_ratelimited(jpegd->dev,
> > > +				    "JPEG capture buffer has no kernel mapping\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ret =3D rkjpegd_begin_cpu_access(vb, DMA_TO_DEVICE);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	memset(dst_cpu + y_size, 0x80, size - y_size);
> > > +
> > > +	rkjpegd_end_cpu_access(vb, DMA_TO_DEVICE);
> >=20
> > This had no place here, should be done by the io ops.
>=20
> I'll switch to a single plane output format as you suggested.
>=20
>=20
> > > +	dma_sync_single_for_device(jpegd->dev, ctx->table_base.dma,
> > > +				   ctx->table_base.size, DMA_TO_DEVICE);
> > > +
> > > +	/*
> > > +	 * STRM_BASE must be 16-byte aligned, so split the address and reco=
rd
> > > +	 * the sub-block start byte.  Both come from the start of the plane=
,
> > > +	 * not the payload: videobuf2 lets data_offset carry arbitrary low
> > > +	 * bits, which STRM_BASE has no way to encode.
> > > +	 */
> > > +	strm_off        =3D data_offset + hdr->ecs_offset;
> > > +	hw_strm_off     =3D strm_off & ~0xfU;
> > > +	strm_start_byte =3D strm_off & 0xfU;
> > > +	strm_len_blks   =3D (ALIGN(payload - hw_strm_off, 16) - 1) >> 4;
> > > +
> > > +	ret =3D vdpu720_fill_regs(ctx, hdr, ctx->table_base.dma,
> > > +				src_dma + hw_strm_off, strm_start_byte,
> > > +				strm_len_blks, dst_dma);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (hdr->frame.num_components =3D=3D 1) {
> > > +		ret =3D vdpu720_fill_chroma(ctx, dst_buf);
> >=20
> > That seems crazy expensive. If the HW does not fill the chroma, why do =
you pick
> > a multi-plane format in the first place. Use a Y only format instead.
>=20
> That's a better approach for sure.
>=20
> >=20
> > Fixing that should let you skip kernel mapping of the destination buffe=
r
> > perhaps.
>=20
> Yes.
>=20
> >=20
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	rkjpegd_arm_watchdog(jpegd);
> > > +
> > > +	/*
> > > +	 * A frame whose entropy data ends early runs the decoder off the e=
nd
> > > +	 * of the stream, and with the condition masked it waits instead of
> > > +	 * reporting.  VDPU720_ERR_MASK already covers the status.
> > > +	 */
> > > +	rkjpegd_write(jpegd,
> > > +		      VDPU720_DEC_E | VDPU720_TIMEOUT_E | VDPU720_BUF_EMPTY_E,
> > > +		      VDPU720_REG_INT);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static irqreturn_t rkjpegd_vdpu720_irq(int irq, void *dev_id)
> > > +{
> > > +	struct rkjpegd_dev *jpegd =3D dev_id;
> > > +	enum vb2_buffer_state state;
> > > +	irqreturn_t ret =3D IRQ_NONE;
> > > +	u32 status;
> > > +
> > > +	/* The registers are only clocked while the device is runtime activ=
e. */
> > > +	if (pm_runtime_get_if_active(jpegd->dev) <=3D 0)
> > > +		return IRQ_NONE;
> >=20
> > Was that sashiko asking you to do that ?
>=20
> Yes, several times:
>=20
>   =E2=96=8E [High] The interrupt handler reads hardware registers without=
 checking if the device is active via=20
>   =E2=96=8E pm_runtime, leading to crashes on spurious interrupts.
>=20
>=20
>   =E2=96=8E [Severity: High]
>   =E2=96=8E This reads the VDPU720_REG_INT register unconditionally upon =
entry. If a spurious interrupt or an=20
>   =E2=96=8E irqpoll event occurs while the device is in a runtime-suspend=
ed state (with clocks and power domains=20
>   =E2=96=8E gated off), will this read trigger a synchronous external abo=
rt on ARM? Should it use=20
>   =E2=96=8E pm_runtime_get_if_active() to verify the power state first?
>=20
>   =E2=96=8E If a spurious interrupt fires while the IP block is held in r=
eset, the rkjpegd_vdpu720_irq() handler=20
>   =E2=96=8E will run. Because PM runtime is still active, pm_runtime_get_=
if_active() will succeed, and the handler
>   =E2=96=8E will try to read from the hardware (VDPU720_REG_INT), which c=
an cause a bus stall or kernel panic.
>=20
> > To start with, if you clock off the
> > device, you won't get the IRQ. If you clock off the device between the =
start of
> > this function and here in a race, you have some bigger problems in your=
 driver.
> >=20
> > This type of IP is not free-running, its trigger based. When its trigge=
red, it
> > should be busy and a PM ref should be held. Be careful with sashiko rem=
arks, it
> > does not differentiate free-running IP from triggered IP.
> >=20
> > I'm also a little worried that maybe you don't actually understand this=
, since
> > its quite possible you simply fed sashiko into your llm to produce this=
 v5.
>=20
> Ok, shows I have to think a bit more before taking Sashiko things for
> granted.

Yes, though I was off a little, what I mean is that for triggered devices l=
ike
this, which don't have known spurious IRQ hw bugs, you want the PM runtime =
to be
held for the duration of job, which imply it will be running on IRQ. The me=
thod
you have now would be useful if there was a shared IRQ or some known hardwa=
re
bugs to deal with.

>=20
> >=20
> > > +
> > > +	status =3D rkjpegd_read(jpegd, VDPU720_REG_INT);
> > > +
> > > +	/* First phase of the IRQ clear, see VDPU720_IRQ_CLR_KEEP. */
> > > +	rkjpegd_write(jpegd, status & VDPU720_IRQ_CLR_KEEP, VDPU720_REG_INT=
);
> > > +
> > > +	if (!(status & VDPU720_IRQ_RAW))
> > > +		goto out_put;
> > > +
> > > +	rkjpegd_write(jpegd, 0, VDPU720_REG_INT);
> > > +
> > > +	state =3D (status & VDPU720_ERR_MASK) ?
> > > +		VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
> >=20
> > nit: Sometimes its nice to set the payload size to zero, to signal that=
 this is
> > not minor data corruption but a complete decode failure. Looking below,=
 most
> > err_info imply this. Its not a bug in your implementation though.
>=20
> Yes, will do.
>=20
> > > +/**
> > > + * rkjpegd_abort_job() - take a running job away from the hardware
> > > + * @jpegd:	device whose current job is to be ended
> > > + *
> > > + * Resets the block and hands the frame back as an error even if it =
did
> > > + * complete: the reset went through underneath it and cleared the in=
terrupt
> > > + * that would have said so.  The interrupt is masked across the sequ=
ence so a
> > > + * completion arriving in the middle cannot finish the job a second =
time.
> > > + *
> > > + * The caller must have stopped the watchdog from firing first.  Whi=
ch of the
> > > + * two completes a job is decided by the cancel_delayed_work() in
> > > + * rkjpegd_irq_done(), so a watchdog that is still armed makes this =
racy.
> > > + */
> > > +static void rkjpegd_abort_job(struct rkjpegd_dev *jpegd)
> > > +{
> > > +	struct rkjpegd_ctx *ctx;
> > > +
> > > +	disable_irq(jpegd->irq);
> >=20
> > That is not needed for triggered IP, drop.
>=20
> Ok.
>=20
> > > +static void rkjpegd_device_run(void *priv)
> > > +{
> > > +	struct rkjpegd_ctx *ctx =3D priv;
> > > +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> > > +	struct vb2_v4l2_buffer *src, *dst;
> > > +	int ret;
> > > +
> > > +	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > > +	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > > +	if (WARN_ON(!src) || WARN_ON(!dst))
> > > +		return;
> >=20
> > I don't think m2m framework will call run unless this condition is met,=
 so this
> > si likely redundant, please verify.
>=20
> Right, will remove.
>=20
> > > +/**
> > > + * rkjpegd_has_eoi() - look for the end of image marker of a frame
> > > + * @data:	the frame
> > > + * @start:	offset of the entropy coded data in @data
> > > + * @len:	length of @data
> > > + *
> > > + * v4l2_jpeg_parse_header() never looks behind the start of scan, so=
 a
> >=20
> > If there is something about the common parser, fix the common parser. W=
e don't
> > want every driver to implement its own parsing. JPEG decoders are alrea=
dy the
> > exception, this is why we have stateless decoders for everything that w=
as made
> > later.
>=20
> I introduced it because it happened that for large resolutions userspace
> passed buffers that couldn't fit a whole frame into them. Then decoding
> stopped in the middle of a frame and the next buffer started at that
> place inside a frame, so the buffers desynchronized with the frames.
>=20
> The hardware has a BUF_EMPTY_E interrupt which should catch this. I
> think by handling this properly we can get rid of this has_eoi check.
>=20
> > > +static void rkjpegd_buf_queue(struct vb2_buffer *vb)
> > > +{
> > > +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > > +	struct rkjpegd_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> > > +
> > > +	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type)) {
> > > +		if (vb2_is_streaming(vb->vb2_queue) &&
> > > +		    v4l2_m2m_dst_buf_is_last(ctx->fh.m2m_ctx)) {
> > > +			rkjpegd_last_buffer_done(ctx, vbuf);
> > > +			v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
> > > +			v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
> > > +			return;
> > > +		}
> > > +
> > > +		v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> > > +		return;
> > > +	}
> > > +
> > > +	rkjpegd_parse_src_buf(ctx, vb);
> >=20
> > This function can fail, its not clear once you ignore the return value =
how the
> > error will propagade to device_run() and produce a matching error dst b=
uffer.
>=20
> The error travels through src_buf->parsed and rkjpegd_vdpu720_run()
> bails out with an error when the frame couldn't be parsed. I can make
> that clearer by returning an error from rkjpegd_parse_src_buf() and
> setting the variable here instead.

Not sure I completely followed, but the main point is either drop
rkjpegd_parse_src_buf() return value and related code if not needed, or use=
 the
return value to propagate the error.

>=20
> > > +static void rkjpegd_stop_streaming(struct vb2_queue *vq)
> > > +{
> > > +	struct rkjpegd_ctx *ctx =3D vb2_get_drv_priv(vq);
> > > +	struct vb2_v4l2_buffer *vbuf;
> > > +
> > > +	for (;;) {
> > > +		if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > > +			vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > > +		else
> > > +			vbuf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > > +		if (!vbuf)
> > > +			break;
> > > +		if (V4L2_TYPE_IS_CAPTURE(vq->type))
> > > +			vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
> > > +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> > > +	}
> > > +
> > > +	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, vq);
> > > +
> > > +	/* A seek also ends a drain a resolution change had cut short. */
> > > +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > > +		ctx->fh.m2m_ctx->last_src_buf =3D NULL;
> > > +	else
> > > +		rkjpegd_resume_drain(ctx);
> > > +
> > > +	if (V4L2_TYPE_IS_OUTPUT(vq->type) &&
> > > +	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
> > > +		v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
> >=20
> > That is strange, STREAMOFF will flush the queues, so adding an event to=
 the
> > event queue seems odd, I never seen that before.
>=20
> The same pattern is in the vicodec since [1], was added to mxc-jpeg in
> [2] and went into this driver from there.
>=20
> Sending EOS here is deprecated anyway:
>=20
>       For backwards compatibility, the decoder will signal a ``V4L2_EVENT=
_EOS``
>       event when the last frame has been decoded and all frames are ready=
 to be
>       dequeued. It is a deprecated behavior and the client must not rely =
on it.
>       The ``V4L2_BUF_FLAG_LAST`` buffer flag should be used instead.
>=20
> Maybe we can just drop it for a new driver.

But that's different, its about sending EOS event when the LAST buffer is q=
ueued
into the capture pool. Driver that strictly want to implement this backward
compatibility must resort to queuing an empty LAST buffer. Doing this in
streamoff seems odd, I would need to further dig into. I must admit, I neve=
r
seen that event being used, so I don't really know how it was historically =
used.

You can always leave it, I'm just not convince of the usefulness, as we sho=
uld
be flushing the queues when we stop streaming.

>=20
>=20
> [1] d4d137de5f31 ("media: vicodec: use v4l2-mem2mem draining, stopped and=
 next-buf-is-last states handling"
> [2] 4911c5acf935 ("media: imx-jpeg: Implement drain using v4l2-mem2mem he=
lpers")
>=20
> > > +static int rkjpegd_open(struct file *filp)
> > > +{
> > > +	struct rkjpegd_dev *jpegd =3D video_drvdata(filp);
> > > +	struct rkjpegd_ctx *ctx;
> > > +	int ret;
> > > +
> > > +	ctx =3D kzalloc_obj(*ctx);
> >=20
> > There is scope function to automatically free this on return.
>=20
> Yes, will change to that.
>=20
> > > +
> > > +static struct platform_driver rkjpegd_driver =3D {
> > > +	.probe =3D rkjpegd_probe,
> > > +	.remove =3D rkjpegd_remove,
> > > +	.driver =3D {
> > > +		.name =3D RKJPEGD_NAME,
> > > +		.of_match_table =3D of_rkjpegd_match,
> > > +		.pm =3D pm_ptr(&rkjpegd_pm_ops),
> > > +	},
> > > +};
> > > +module_platform_driver(rkjpegd_driver);
> > > +
> > > +MODULE_DESCRIPTION("Rockchip JPEG decoder driver");
> > > +MODULE_AUTHOR("Lucas Sinn <lucas.sinn@wolfvision.net>");
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_IMPORT_NS("DMA_BUF");
> >=20
> >=20
> > Looking forward your feedback, I'm quite surprised of "your" choices, a=
nd how
> > you possibly have needed this complexity.
>=20
> Thanks for the thorough and honest review.
>=20
> When I first worked with v4l2_m2m many years ago I was excited how easy
> it has become to write such an m2m driver. I am also shocked to see how
> many possible races sashiko found and through which hoops I had to go to
> make sashiko happy (I still haven't accomplished that it seems).
>=20
> Much of the complexity comes from two things: The watchdog and the
> dynamic resolution handling.
>=20
> Sashiko claims the watchdog has to protect itself against a race with
> the irq handler. That of course misses that the watchdog only triggers
> because the IRQ doesn't come which makes it quite unlikely that the IRQ
> comes in the precise moment the watchdog triggers.

That should be solved using the watchdog API alone. On a theoretical basis
(cause I don't program this every day):

irq_func()
{
  if (!cancel_delayed_work(&dev->watchdog_work))
		return IRQ_HANDLED;
  ...
}

watchdog_func()
{
  reset_so_that_no_possible_irq_occures_passed_this_line();
  return;
}

So in the IRQ handler, you use the delayed work API to guaranty that your
whatchdog won't be called. If its being called, or has been called, then it=
 does
an early return.

For the watchdog, the delayed worker code ensures that once called,
cancel_delayed_work() will return false. You have to make sure you synchron=
ously
guaranty that no more IRQ will occur, hense why we operate a HW reset. Its =
also
usually the only way to recover a wedged IP.

>=20
> I explained the complexity added with the resolution changes inline above=
.

The resolution changes, drain flow and seek flow (see the state machine [0]=
) is
effectively very complex, with legacy behaviour built-in, I totally give th=
at to
you. Neil did a pass to improve the helpers, but it is still too complex an=
d
confusing. In fact, we did a great job, as we totally confused Sashiko, mea=
ning
neither human or machine can reliably review. I suggest to do a lot of test=
ing
in general for sure.

[0]
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-decoder.=
html#state-machine

Nicolas

--=-e0QK1iLo/RR+fN85m10x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwS3wAKCRDZQZRRKWBy
9AV8AP9dNfnDOCVzEVsl1zA9N195QFS01NTTiQUw/BExWiWI8QEA6/bbJ/FzV3EQ
QHLItqFsU5d8zcqLgXaWuegVCwp2xgg=
=IFxD
-----END PGP SIGNATURE-----

--=-e0QK1iLo/RR+fN85m10x--
