Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.185.170.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794836588;
	b=hq9frPJuGG4ymMXhwxvmLXryRF8MvybZtznuahhibMWEQag2fESJVPiKoS2eSVEVz69t
	 WBHSdoDr70T0GHWYcCB6+DFOKhV+T8XpnYw0BalSvGS4PyUc0Hramn6wwj5YI9WDsgLU5
	 1WfpdaXUkRAogNeJrlfq0KjPp7pkzukKaAA6aZVjMoFLIP0ObJV1F75y9DEcZG2r3PfYp
	 IH/BnHUlMLVufBM8SsZqBqPl8s1/JCTMmU2w7fgFOpzhpK/8hp+lJqkp3S5HM60bP4S6D
	 hQz4klE9P4ifbLUeTgm43XqDADLYA6iBYxShh8Bj2hMmhgrOLqhJYj5DCEv17BAtevA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=MpkOdvTRQHpgwMin1v0BhW0RLCGyTdsVaJofSPgtE3Q=;
	b=LDKnubUY22GzGVGkp7QydOf4M3BO0VMaKphb0IEPfUUso3shXhQAgylcCc2WiUeVAGQ7
	 m8YagPK90m/+nuMehRaGmCisk0tFlWqj6+nSbggTZ5EuLOgL4xrgYb0uNI1WBwdi2WOaB
	 kAKghGOZTPnQXqxmbaMytQOj7J3w5GldFSQO+M9VwUGMVP9wGVihQTwi2vTDhoZvNG1Zk
	 Eh6p01YJULqzyDlGhC1rtlr87q5eZqxUB039O6WD+rm9KDCxaZOwNIBBJVSAO/8vpI/Up
	 5PSle/Von5Zkrnxoqv7Apr/7thSBHMzT8zuRYwRFQ8/Cmvnc+C5sF/HvMdOEThODliw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iki.fi;
	spf=pass smtp.mailfrom=iki.fi;
	dkim=pass header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=JPczHudD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.185.170.37
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC751606A31C;
	Mon, 16 Nov 2026 13:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC751606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=JPczHudD
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4jSpvw55QSz49Q3W;
	Mon, 16 Nov 2026 15:42:52 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1794836574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MpkOdvTRQHpgwMin1v0BhW0RLCGyTdsVaJofSPgtE3Q=;
	b=JPczHudDt/l7vkfvIPMbTKzO5+yQnFcmR+c22Dhw9M8CDufLMcY3mcfRMCe8kUDYPrtB8t
	KrEkEuQdyWAjk5FQrUFH7R13UmYmNkXtYR7pFXpvNJkn5765gx+4FqYUhYqaxp6fgG3ant
	+9aHJGPe0SQr+WqXHQWqho7NF+xPM29GmohK8OC8fg7KwsWC0ajxvXGKYYBzm3NAG5M3b+
	VubYPEuI6TD1aZ/PS4M5PLQluAWT+uuImHjedfUKzaoDlOJM4GZgbdef0poaVVfCM1XPHF
	4aV8MnoxMJwlnv/lLWRaddprvM1pwm3PHTffNi0JxdGfs8yOXufBfphVu5NXHw==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1794836574;
	b=EEOdLsLr/nNsSqKua/PRjy9V6dS5W3vgI5xgy2RpB6NpqGczzdBboJw0+7KeF3T1GCaJXZ
	mIVtwvyU+yxs/jIUY4aBfqWCd+EDeTcEQcEhbTKNCxpHQ5/b4C0g1WNk+eRrKHL4HI9tws
	T8/yP9b/4BrgruGlYy0oKHYq10oFbzJdWAJNk06zbcko2KqTgB4Nm1gcT8ion6TtltI+jY
	tm8XMJ6fMaFEau3CSZBj4Wu31Lw7HmPBJFeGCv973eBlGFHXtA+iAaKCJKHCrQvZHnU6Y+
	pMb730MeXht5+VVAaiHeLxhJEbTQdAINlMyQ6nzurUWSLm7ekm+0yQiAnkLY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1794836574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MpkOdvTRQHpgwMin1v0BhW0RLCGyTdsVaJofSPgtE3Q=;
	b=cA1/4KiSrPXzIPHiL7PNa3Q7/aRPFFpAA8OzPaRTcIli+f4SUzPnpOICBkGdXlH1XEdDNY
	Y20X6Y1lhvTM2Rrgv8txJNUjItB1jl6HnGL8aHZlAJC+MtH5MxOdOtrozW2PgdfWAia+zR
	jR2doJ7aiZsjbxZt1LI07laMuhveidGybbeAxRTmU1E68esccQ/Abb2Wf7zKAvYH0KZN8f
	JNwRUsxkKEGbhpK8PAOBa8fI+2lMmjhphSW6fu6mXOOttMbyW+IkT4ru5aZvx1eTY+2EhT
	p32Dd5Ta0VW7JaN5XVdnxPpcp+xhpMtmNPo4WWPJz125tdXL/qLsC0kle/gmXg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3382D634C4E;
	Mon, 16 Nov 2026 15:42:52 +0200 (EET)
Date: Mon, 16 Nov 2026 15:42:52 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/5] media: platform: broadcom: Add bcm2835-isp driver
Message-ID: <avsIXOBDRYvwINiI@valkosipuli.retiisi.eu>
References: <20261112-b4-vchiq-isp-v6-0-711b48378367@ideasonboard.com>
 <20261112-b4-vchiq-isp-v6-4-711b48378367@ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261112-b4-vchiq-isp-v6-4-711b48378367@ideasonboard.com>

Hi Jai, Naush,

On Thu, Nov 12, 2026 at 04:56:32PM +0530, Jai Luthra wrote:
> diff --git a/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-fmts.h b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-fmts.h
> new file mode 100644
> index 000000000000..6f3333d33c4f
> --- /dev/null
> +++ b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-fmts.h
> @@ -0,0 +1,558 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Broadcom BCM2835 ISP driver
> + *
> + * Copyright © 2019-2026 Raspberry Pi (Trading) Ltd.
> + *
> + * Author: Naushir Patuck (naush@raspberrypi.com)
> + *
> + */
> +
> +#ifndef BCM2835_ISP_FMTS
> +#define BCM2835_ISP_FMTS
> +
> +#include <linux/videodev2.h>
> +#include <linux/raspberrypi/mmal-encodings.h>
> +
> +struct bcm2835_isp_fmt {
> +	u32 fourcc;
> +	int depth;
> +	int bytesperline_align;
> +	u32 mmal_fmt;
> +	int size_multiplier_x2;
> +	u32 colorspace_mask;
> +	enum v4l2_colorspace colorspace_default;
> +	unsigned int step_size;
> +};
> +
> +#define V4L2_COLORSPACE_MASK(colorspace) BIT(colorspace)

The V4L2 prefix shouldn't be used for declaring macros in drivers. Please
use a driver specific prefix instead.

> +
> +#define V4L2_COLORSPACE_MASK_JPEG V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_JPEG)
> +#define V4L2_COLORSPACE_MASK_SMPTE170M V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_SMPTE170M)
> +#define V4L2_COLORSPACE_MASK_REC709 V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_REC709)
> +#define V4L2_COLORSPACE_MASK_SRGB V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_SRGB)
> +#define V4L2_COLORSPACE_MASK_RAW V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_RAW)
> +
> +/*
> + * All three colour spaces JPEG, SMPTE170M and REC709 are fundamentally sRGB
> + * underneath (as near as makes no difference to us), just with different YCbCr
> + * encodings. Therefore the ISP can generate sRGB on its main output and any of
> + * the others on its low resolution output. Applications should, when using both
> + * outputs, program the colour spaces on them to be the same, matching whatever
> + * is requested for the low resolution output, even if the main output is
> + * producing an RGB format. In turn this requires us to allow all these colour
> + * spaces for every YUV/RGB output format.
> + */
> +#define V4L2_COLORSPACE_MASK_ALL_SRGB (V4L2_COLORSPACE_MASK_JPEG |	\
> +				       V4L2_COLORSPACE_MASK_SRGB |	\
> +				       V4L2_COLORSPACE_MASK_SMPTE170M |	\
> +				       V4L2_COLORSPACE_MASK_REC709)

...

> diff --git a/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-params.c b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-params.c
> new file mode 100644
> index 000000000000..21206eff3cc5
> --- /dev/null
> +++ b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-params.c

...

> +struct bcm2835_isp_params *
> +bcm2835_isp_params_register(struct v4l2_device *v4l2_dev, struct device *dev,
> +			    struct vchiq_mmal_instance *mmal_instance,
> +			    struct vchiq_mmal_port *port, int video_nr)
> +{
> +	struct mmal_parameter_isp_parameters mmal_param = { 0 };
> +	struct bcm2835_isp_params *params;
> +	struct video_device *vdev;
> +	struct vb2_queue *q;
> +	int ret;
> +
> +	params = devm_kzalloc(dev, sizeof(*params), GFP_KERNEL);
> +	if (!params)
> +		return ERR_PTR(-ENOMEM);
> +
> +	params->dev = dev;
> +	params->v4l2_dev = v4l2_dev;
> +	params->mmal_instance = mmal_instance;
> +	params->port = port;
> +
> +	/* Test if the firmware supports a combined parameter buffer */
> +	ret = vchiq_mmal_port_parameter_set(params->mmal_instance,
> +					    params->port,
> +					    MMAL_PARAMETER_ISP_SETTINGS,
> +					    &mmal_param, sizeof(mmal_param));
> +	if (ret) {
> +		dev_err(dev, "Please update to the latest firmware\n"
> +			"\tMMAL_PARAMETER_ISP_SETTINGS failed with err %d\n",
> +			ret);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	mutex_init(&params->lock);
> +
> +	/* Initialize vb2 queue */
> +	q = &params->queue;
> +	q->type = V4L2_BUF_TYPE_META_OUTPUT;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
> +	q->drv_priv = params;
> +	q->ops = &bcm2835_isp_params_vb2_ops;
> +	q->mem_ops = &vb2_dma_contig_memops;
> +	q->buf_struct_size = sizeof(struct bcm2835_isp_params_buffer);
> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	q->dev = dev;
> +	q->lock = &params->lock;
> +
> +	ret = vb2_queue_init(q);
> +	if (ret) {
> +		dev_err(dev, "Failed to init params vb2 queue\n");
> +		mutex_destroy(&params->lock);
> +		return ERR_PTR(ret);
> +	}
> +
> +	/* Initialize video device */
> +	vdev = &params->vdev;
> +	vdev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING;
> +	vdev->fops = &bcm2835_isp_params_fops;
> +	vdev->ioctl_ops = &bcm2835_isp_params_ioctl_ops;
> +	vdev->minor = -1;
> +	vdev->release = video_device_release_empty;
> +	vdev->queue = q;
> +	vdev->lock = &params->lock;
> +	vdev->v4l2_dev = v4l2_dev;
> +	vdev->vfl_dir = VFL_DIR_TX;
> +	snprintf(vdev->name, sizeof(vdev->name), "%s", BCM2835_ISP_PARAMS_NAME);
> +
> +	params->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&vdev->entity, 1, &params->pad);
> +	if (ret) {
> +		vb2_queue_release(q);
> +		mutex_destroy(&params->lock);
> +		return ERR_PTR(ret);
> +	}
> +
> +	video_set_drvdata(vdev, params);
> +
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, video_nr);
> +	if (ret) {
> +		dev_err(dev, "Failed to register params device node\n");
> +		media_entity_cleanup(&vdev->entity);
> +		vb2_queue_release(q);
> +		mutex_destroy(&params->lock);
> +		return ERR_PTR(ret);
> +	}
> +
> +	v4l2_info(v4l2_dev, "Params device node registered as /dev/video%d\n",

v4l2_dbg() would seem more appropriate.

> +		  vdev->num);
> +
> +	return params;
> +}
> +
> +void bcm2835_isp_params_unregister(struct bcm2835_isp_params *params)
> +{
> +	if (!video_is_registered(&params->vdev))
> +		return;
> +
> +	v4l2_info(params->v4l2_dev, "Unregistering params device node\n");

Ditto.

> +
> +	vb2_video_unregister_device(&params->vdev);
> +	media_entity_cleanup(&params->vdev.entity);
> +	mutex_destroy(&params->lock);
> +}

...

> diff --git a/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-v4l2-isp.c b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-v4l2-isp.c
> new file mode 100644
> index 000000000000..729ab05d8154
> --- /dev/null
> +++ b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-v4l2-isp.c
> +static const struct bcm2835_isp_fmt *get_fmt(u32 mmal_fmt)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(supported_formats); i++) {

i can be declared here.

> +		if (supported_formats[i].mmal_fmt == mmal_fmt)
> +			return &supported_formats[i];
> +	}
> +	return NULL;
> +}
> +
> +static const
> +struct bcm2835_isp_fmt *find_format_by_fourcc(unsigned int fourcc,
> +					      struct bcm2835_isp_node *node)
> +{
> +	const struct bcm2835_isp_fmt *fmt;
> +	unsigned int i;
> +
> +	for (i = 0; i < node->num_supported_fmts; i++) {

Ditto. Same elsewhere, too.

> +		fmt = node->supported_fmts[i];
> +		if (fmt->fourcc == fourcc)
> +			return fmt;
> +	}
> +
> +	return NULL;
> +}
> +
> +static const
> +struct bcm2835_isp_fmt *find_format(struct v4l2_format *f,
> +				    struct bcm2835_isp_node *node)
> +{
> +	return find_format_by_fourcc(node_is_stats(node) ?
> +				     f->fmt.meta.dataformat :
> +				     f->fmt.pix.pixelformat,
> +				     node);
> +}
> +
> +/* vb2_to_mmal_buffer() - converts vb2 buffer header to MMAL
> + *
> + * Copies all the required fields from a VB2 buffer to the MMAL buffer header,
> + * ready for sending to the VPU.
> + */
> +static void vb2_to_mmal_buffer(struct mmal_buffer *buf,
> +			       struct vb2_v4l2_buffer *vb2)
> +{
> +	u64 pts;
> +
> +	buf->mmal_flags = 0;
> +	if (vb2->flags & V4L2_BUF_FLAG_KEYFRAME)
> +		buf->mmal_flags |= MMAL_BUFFER_HEADER_FLAG_KEYFRAME;
> +
> +	/* Data must be framed correctly as one frame per buffer. */
> +	buf->mmal_flags |= MMAL_BUFFER_HEADER_FLAG_FRAME_END;
> +
> +	buf->length = vb2->vb2_buf.planes[0].bytesused;
> +	/*
> +	 * Minor ambiguity in the V4L2 spec as to whether passing in a 0 length
> +	 * buffer, or one with V4L2_BUF_FLAG_LAST set denotes end of stream.
> +	 * Handle either.
> +	 */
> +	if (!buf->length || (vb2->flags & V4L2_BUF_FLAG_LAST))
> +		buf->mmal_flags |= MMAL_BUFFER_HEADER_FLAG_EOS;
> +
> +	/* vb2 timestamps in nsecs, mmal in usecs */
> +	pts = vb2->vb2_buf.timestamp;
> +	do_div(pts, 1000);

How about div_u64()?

> +	buf->pts = pts;
> +	buf->dts = MMAL_TIME_UNKNOWN;
> +}
> +
> +static void mmal_buffer_cb(struct vchiq_mmal_instance *instance,
> +			   struct vchiq_mmal_port *port, int status,
> +			   struct mmal_buffer *mmal_buf)
> +{
> +	struct bcm2835_isp_buffer *q_buf;
> +	struct bcm2835_isp_node *node = port->cb_ctx;
> +	struct bcm2835_isp_dev *dev = node_get_dev(node);
> +	struct vb2_v4l2_buffer *vb2;
> +
> +	q_buf = container_of(mmal_buf, struct bcm2835_isp_buffer, mmal);
> +	vb2 = &q_buf->vb;
> +	v4l2_dbg(2, debug, &dev->v4l2_dev,
> +		 "%s: port:%s[%d], status:%d, buf:%p, dmabuf:%p, length:%lu, flags %u, pts %lld\n",
> +		 __func__, node_is_output(node) ? "input" : "output", node->id,
> +		 status, mmal_buf, mmal_buf->dma_buf, mmal_buf->length,
> +		 mmal_buf->mmal_flags, mmal_buf->pts);
> +
> +	if (status) {
> +		/* error in transfer */
> +		if (vb2) {
> +			/* there was a buffer with the error so return it */
> +			vb2_buffer_done(&vb2->vb2_buf, VB2_BUF_STATE_ERROR);
> +		}
> +		return;
> +	}
> +
> +	/* vb2 timestamps in nsecs, mmal in usecs */
> +	vb2->vb2_buf.timestamp = mmal_buf->pts * 1000;
> +	vb2->sequence = node->sequence++;
> +	vb2_set_plane_payload(&vb2->vb2_buf, 0, mmal_buf->length);
> +	vb2_buffer_done(&vb2->vb2_buf, VB2_BUF_STATE_DONE);
> +
> +	if (!port->enabled)
> +		complete(&dev->frame_cmplt);
> +}
> +
> +struct colorspace_translation {
> +	enum v4l2_colorspace v4l2_value;
> +	u32 mmal_value;
> +};
> +
> +static u32 translate_color_space(enum v4l2_colorspace color_space)
> +{
> +	static const struct colorspace_translation translations[] = {
> +		{ V4L2_COLORSPACE_DEFAULT, MMAL_COLOR_SPACE_UNKNOWN },
> +		{ V4L2_COLORSPACE_SMPTE170M, MMAL_COLOR_SPACE_ITUR_BT601 },
> +		{ V4L2_COLORSPACE_SMPTE240M, MMAL_COLOR_SPACE_SMPTE240M },
> +		{ V4L2_COLORSPACE_REC709, MMAL_COLOR_SPACE_ITUR_BT709 },
> +		/* V4L2_COLORSPACE_BT878 unavailable */
> +		{ V4L2_COLORSPACE_470_SYSTEM_M, MMAL_COLOR_SPACE_BT470_2_M },
> +		{ V4L2_COLORSPACE_470_SYSTEM_BG, MMAL_COLOR_SPACE_BT470_2_BG },
> +		{ V4L2_COLORSPACE_JPEG, MMAL_COLOR_SPACE_JPEG_JFIF },
> +		/*
> +		 * We don't have an encoding for SRGB as such, but VideoCore
> +		 * will do the right thing if it gets "unknown".
> +		 */
> +		{ V4L2_COLORSPACE_SRGB, MMAL_COLOR_SPACE_UNKNOWN },
> +		/* V4L2_COLORSPACE_OPRGB unavailable */
> +		/* V4L2_COLORSPACE_BT2020 unavailable */
> +		/* V4L2_COLORSPACE_RAW unavailable */
> +		/* V4L2_COLORSPACE_DCI_P3 unavailable */
> +	};
> +

Extra newline.

> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(translations); i++) {
> +		if (color_space == translations[i].v4l2_value)
> +			return translations[i].mmal_value;
> +	}
> +
> +	return MMAL_COLOR_SPACE_UNKNOWN;
> +}
> +
> +static void setup_mmal_port_format(struct bcm2835_isp_node *node,
> +				   struct vchiq_mmal_port *port)
> +{
> +	struct bcm2835_isp_q_data *q_data = &node->q_data;
> +
> +	port->format.encoding = q_data->fmt->mmal_fmt;
> +	/* Raw image format - set width/height */
> +	port->es.video.width = (q_data->bytesperline << 3) / q_data->fmt->depth;
> +	port->es.video.height = q_data->height;
> +	port->es.video.crop.width = q_data->width;
> +	port->es.video.crop.height = q_data->height;
> +	port->es.video.crop.x = 0;
> +	port->es.video.crop.y = 0;
> +	port->es.video.color_space = translate_color_space(q_data->colorspace);
> +};
> +
> +static int setup_mmal_port(struct bcm2835_isp_node *node)
> +{
> +	struct bcm2835_isp_dev *dev = node_get_dev(node);
> +	unsigned int enable = 1;
> +	int ret;
> +
> +	v4l2_dbg(2, debug, &dev->v4l2_dev, "%s: setup %s[%d]\n", __func__,
> +		 node->name, node->id);
> +
> +	vchiq_mmal_port_parameter_set(dev->mmal_instance, node->port,
> +				      MMAL_PARAMETER_ZERO_COPY, &enable,
> +				      sizeof(enable));
> +	setup_mmal_port_format(node, node->port);
> +	ret = vchiq_mmal_port_set_format(dev->mmal_instance, node->port);
> +	if (ret < 0) {
> +		v4l2_dbg(1, debug, &dev->v4l2_dev,
> +			 "%s: vchiq_mmal_port_set_format failed\n",
> +			 __func__);
> +		return ret;
> +	}
> +
> +	if (node->q_data.sizeimage < node->port->minimum_buffer.size) {
> +		v4l2_err(&dev->v4l2_dev,
> +			 "buffer size mismatch sizeimage %u < min size %u\n",
> +			 node->q_data.sizeimage,
> +			 node->port->minimum_buffer.size);

Is this a driver bug or a user error? In the latter case this should be
v4l2_dbg().

> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int bcm2835_isp_mmal_buf_cleanup(struct mmal_buffer *mmal_buf)
> +{
> +	mmal_vchi_buffer_cleanup(mmal_buf);
> +
> +	if (mmal_buf->dma_buf) {
> +		dma_buf_put(mmal_buf->dma_buf);
> +		mmal_buf->dma_buf = NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int bcm2835_isp_node_queue_setup(struct vb2_queue *q,
> +					unsigned int *nbuffers,
> +					unsigned int *nplanes,
> +					unsigned int sizes[],
> +					struct device *alloc_devs[])
> +{
> +	struct bcm2835_isp_node *node = vb2_get_drv_priv(q);
> +	unsigned int size;
> +
> +	if (setup_mmal_port(node))
> +		return -EINVAL;
> +
> +	size = node->q_data.sizeimage;
> +	if (size == 0) {
> +		v4l2_info(&node_get_dev(node)->v4l2_dev,
> +			  "%s: Image size unset in queue_setup for node %s[%d]\n",
> +			  __func__, node->name, node->id);
> +		return -EINVAL;
> +	}
> +
> +	if (*nplanes)
> +		return sizes[0] < size ? -EINVAL : 0;
> +
> +	*nplanes = 1;
> +	sizes[0] = size;
> +
> +	node->port->current_buffer.size = size;
> +
> +	if (*nbuffers < node->port->minimum_buffer.num)
> +		*nbuffers = node->port->minimum_buffer.num;
> +
> +	node->port->current_buffer.num = *nbuffers;
> +
> +	v4l2_dbg(2, debug, &node_get_dev(node)->v4l2_dev,
> +		 "%s: Image size %u, nbuffers %u for node %s[%d]\n",
> +		 __func__, sizes[0], *nbuffers, node->name, node->id);
> +	return 0;
> +}
> +
> +static int bcm2835_isp_buf_init(struct vb2_buffer *vb)
> +{
> +	struct bcm2835_isp_node *node = vb2_get_drv_priv(vb->vb2_queue);
> +	struct bcm2835_isp_dev *dev = node_get_dev(node);
> +	struct bcm2835_isp_buffer *buf =
> +		to_bcm2835_isp_buffer(to_vb2_v4l2_buffer(vb));
> +
> +	v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: vb %p\n", __func__, vb);
> +
> +	buf->mmal.buffer = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> +	buf->mmal.buffer_size = vb2_plane_size(&buf->vb.vb2_buf, 0);
> +	mmal_vchi_buffer_init(dev->mmal_instance, &buf->mmal);
> +	return 0;
> +}
> +
> +static int bcm2835_isp_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct bcm2835_isp_node *node = vb2_get_drv_priv(vb->vb2_queue);
> +	struct bcm2835_isp_dev *dev = node_get_dev(node);
> +	struct vb2_v4l2_buffer *vb2 = to_vb2_v4l2_buffer(vb);
> +	struct bcm2835_isp_buffer *buf = to_bcm2835_isp_buffer(vb2);
> +	struct dma_buf *dma_buf;
> +	int ret = 0;
> +
> +	v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: type: %d ptr %p\n",
> +		 __func__, vb->vb2_queue->type, vb);

Is this still appropriate after development time?

> +
> +	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> +		if (vb2->field == V4L2_FIELD_ANY)
> +			vb2->field = V4L2_FIELD_NONE;
> +		if (vb2->field != V4L2_FIELD_NONE) {
> +			v4l2_err(&dev->v4l2_dev,
> +				 "%s field isn't supported\n", __func__);

This looks like v4l2_dbg().

> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (vb2_plane_size(vb, 0) < node->q_data.sizeimage) {
> +		v4l2_err(&dev->v4l2_dev,
> +			 "%s data will not fit into plane (%lu < %u)\n",
> +			 __func__, vb2_plane_size(vb, 0),
> +			 node->q_data.sizeimage);

Ditto. There are probably similar cases elsewhere, too.

> +		return -EINVAL;
> +	}
> +
> +	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
> +		vb2_set_plane_payload(vb, 0, node->q_data.sizeimage);
> +
> +	switch (vb->memory) {
> +	case VB2_MEMORY_DMABUF:
> +		dma_buf = dma_buf_get(vb->planes[0].m.fd);
> +
> +		if (dma_buf != buf->mmal.dma_buf) {
> +			/*
> +			 * dmabuf either hasn't already been mapped, or it has
> +			 * changed.
> +			 */
> +			if (buf->mmal.dma_buf) {
> +				v4l2_err(&dev->v4l2_dev,
> +					 "%s Buffer changed - why did the core not call cleanup?\n",
> +					 __func__);
> +				bcm2835_isp_mmal_buf_cleanup(&buf->mmal);
> +			}
> +
> +			buf->mmal.dma_buf = dma_buf;
> +		} else {
> +			/*
> +			 * Already have a reference to the buffer, so release it
> +			 * here.
> +			 */
> +			dma_buf_put(dma_buf);
> +		}
> +		break;
> +	case VB2_MEMORY_MMAP:
> +		/*
> +		 * We want to do this at init, but vb2_core_expbuf checks that
> +		 * the index < q->num_buffers, and q->num_buffers only gets
> +		 * updated once all the buffers are allocated.
> +		 */
> +		if (!buf->mmal.dma_buf) {
> +			buf->mmal.dma_buf =
> +				vb2_core_expbuf_dmabuf(vb->vb2_queue, vb, 0,
> +						       O_CLOEXEC);
> +			v4l2_dbg(3, debug, &dev->v4l2_dev,
> +				 "%s: exporting ptr %p to dmabuf %p\n",
> +				 __func__, vb, buf->mmal.dma_buf);
> +
> +			if (IS_ERR(buf->mmal.dma_buf)) {
> +				ret = PTR_ERR(buf->mmal.dma_buf);
> +				v4l2_err(&dev->v4l2_dev,
> +					 "%s: Failed to expbuf idx %d, ret %d\n",
> +					 __func__, vb->index, ret);
> +				buf->mmal.dma_buf = NULL;
> +			}
> +		}
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}

...

> +static int bcm2835_isp_enum_framesizes(struct file *file, void *priv,
> +				       struct v4l2_frmsizeenum *fsize)
> +{
> +	struct bcm2835_isp_node *node = video_drvdata(file);
> +	struct bcm2835_isp_dev *dev = node_get_dev(node);
> +	const struct bcm2835_isp_fmt *fmt;
> +
> +	if (node_is_stats(node) || fsize->index)
> +		return -EINVAL;
> +
> +	fmt = find_format_by_fourcc(fsize->pixel_format, node);
> +	if (!fmt) {
> +		v4l2_err(&dev->v4l2_dev, "Invalid pixel code: %x\n",
> +			 fsize->pixel_format);

Indeed.

> +		return -EINVAL;
> +	}
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise.min_width = MIN_DIM;
> +	fsize->stepwise.max_width = MAX_DIM;
> +	fsize->stepwise.step_width = fmt->step_size;
> +
> +	fsize->stepwise.min_height = MIN_DIM;
> +	fsize->stepwise.max_height = MAX_DIM;
> +	fsize->stepwise.step_height = fmt->step_size;
> +
> +	return 0;
> +}

...

> +/*
> + * Register a device node /dev/video<N> to go along with one of the ISP's input
> + * or output nodes.
> + */
> +static int bcm2835_isp_register_node(struct bcm2835_isp_dev *dev,
> +				     unsigned int instance,
> +				     struct bcm2835_isp_node *node, int index)
> +{
> +	struct video_device *vfd;
> +	struct vb2_queue *queue;
> +	bool is_rgb;
> +	int ret;
> +
> +	mutex_init(&node->lock);
> +	mutex_init(&node->queue_lock);
> +
> +	node->dev = dev;
> +	vfd = &node->vfd;
> +	queue = &node->queue;
> +	queue->type = index_to_queue_type(index);
> +	/*
> +	 * Setup the node type-specific params.
> +	 */
> +	switch (queue->type) {
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +		vfd->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
> +		node->id = index;
> +		node->vfl_dir = VFL_DIR_TX;
> +		node->name = "output";
> +		if (node->id >= ARRAY_SIZE(dev->component->input))
> +			return -EINVAL;
> +		node->port = &dev->component->input[node->id];
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +		vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +		/* First Capture node starts at id 0, etc. */
> +		node->id = index - BCM2835_ISP_NUM_OUTPUTS;
> +		node->vfl_dir = VFL_DIR_RX;
> +		node->name = "capture";
> +		if (node->id >= ARRAY_SIZE(dev->component->output))
> +			return -EINVAL;
> +		node->port = &dev->component->output[node->id];
> +		break;
> +	case V4L2_BUF_TYPE_META_CAPTURE:
> +		vfd->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
> +		node->id = index - BCM2835_ISP_NUM_OUTPUTS;
> +		node->vfl_dir = VFL_DIR_RX;
> +		node->name = "stats";
> +		if (node->id >= ARRAY_SIZE(dev->component->output))
> +			return -EINVAL;
> +		node->port = &dev->component->output[node->id];
> +		break;
> +	}
> +
> +	ret = bcm2835_isp_get_supported_fmts(node);
> +	if (ret)
> +		return ret;
> +
> +	/* Initialise the video node. */
> +	vfd->vfl_type	= VFL_TYPE_VIDEO;
> +	vfd->fops	= &bcm2835_isp_fops;
> +	vfd->ioctl_ops	= &bcm2835_isp_node_ioctl_ops;
> +	vfd->minor	= -1;
> +	vfd->release	= video_device_release_empty;
> +	vfd->queue	= &node->queue;
> +	vfd->lock	= &node->lock;
> +	vfd->v4l2_dev	= &dev->v4l2_dev;
> +	vfd->vfl_dir	= node->vfl_dir;
> +
> +	node->q_data.fmt = get_default_format(node);
> +	node->q_data.width = DEFAULT_DIM;
> +	node->q_data.height = DEFAULT_DIM;
> +	node->q_data.bytesperline =
> +		get_bytesperline(DEFAULT_DIM, node->q_data.fmt);
> +	node->q_data.sizeimage = node_is_stats(node) ?
> +				 node->port->recommended_buffer.size :
> +				 get_sizeimage(node->q_data.bytesperline,
> +					       node->q_data.width,
> +					       node->q_data.height,
> +					       node->q_data.fmt);
> +	node->q_data.colorspace = node->q_data.fmt->colorspace_default;
> +	node->q_data.ycbcr_enc =
> +		V4L2_MAP_YCBCR_ENC_DEFAULT(node->q_data.colorspace);
> +	node->q_data.xfer_func =
> +		V4L2_MAP_XFER_FUNC_DEFAULT(node->q_data.colorspace);
> +	is_rgb = node->q_data.colorspace == V4L2_COLORSPACE_SRGB ||
> +		node->q_data.colorspace == V4L2_COLORSPACE_RAW;
> +	node->q_data.quantization = V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb,
> +								  node->q_data.colorspace,
> +								  node->q_data.ycbcr_enc);
> +
> +	queue->io_modes = VB2_MMAP | VB2_DMABUF;
> +	queue->drv_priv = node;
> +	queue->ops = &bcm2835_isp_node_queue_ops;
> +	queue->mem_ops = &vb2_dma_contig_memops;
> +	queue->buf_struct_size = sizeof(struct bcm2835_isp_buffer);
> +	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	queue->dev = dev->dev;
> +	queue->lock = &node->queue_lock;
> +
> +	ret = vb2_queue_init(queue);
> +	if (ret < 0) {
> +		v4l2_info(&dev->v4l2_dev, "vb2_queue_init failed\n");

v4l2_err(). Please check the printk level of the rest, too.

> +		return ret;
> +	}
> +
> +	/* Define the device names */
> +	snprintf(vfd->name, sizeof(node->vfd.name), "%s-%s%d", BCM2835_ISP_NAME,
> +		 node->name, node->id);
> +
> +	node->pad.flags = node_is_output(node) ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
> +	ret = media_entity_pads_init(&node->vfd.entity, 1, &node->pad);
> +	if (ret)
> +		goto queue_cleanup;
> +
> +	ret = video_register_device(vfd, VFL_TYPE_VIDEO, video_nr[instance]);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev,
> +			 "Failed to register video %s[%d] device node\n",
> +			 node->name, node->id);
> +		goto queue_cleanup;
> +	}
> +
> +	node->registered = true;
> +	video_set_drvdata(vfd, node);
> +
> +	v4l2_info(&dev->v4l2_dev,
> +		  "Device node %s[%d] registered as /dev/video%d\n",
> +		  node->name, node->id, vfd->num);
> +
> +	return 0;
> +
> +queue_cleanup:
> +	vb2_queue_release(&node->queue);
> +	return ret;
> +}

...

> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 17ba1ae70735..1449de2b64b5 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1490,6 +1490,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
>  	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
>  	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
> +	case V4L2_META_FMT_BCM2835_ISP_STATS: descr = "BCM2835 ISP Image Statistics"; break;
> +	case V4L2_META_FMT_BCM2835_ISP_PARAMS: descr = "BCM2835 ISP Config Parameters"; break;

What's the status of the documentation for these? Do we have something
beyond the headers?

>  
>  	default:
>  		/* Compressed formats */
> diff --git a/include/linux/raspberrypi/mmal-parameters.h b/include/linux/raspberrypi/mmal-parameters.h
> index 6ae5a7a1932c..f0e2ec025b70 100644
> --- a/include/linux/raspberrypi/mmal-parameters.h
> +++ b/include/linux/raspberrypi/mmal-parameters.h
> @@ -23,6 +23,8 @@
>  #define MMAL_PARAMETERS_H
>  
>  #include <linux/math.h>
> +#include <linux/stddef.h>
> +#include <uapi/linux/bcm2835-isp.h>
>  
>  /** Common parameter ID group, used with many types of component. */
>  #define MMAL_PARAMETER_GROUP_COMMON		(0 << 16)
> @@ -279,8 +281,14 @@ enum mmal_parameter_camera_type {
>  	MMAL_PARAMETER_DPC,
>  		/**< Tales a @ref MMAP_PARAMETER_GAMMA_T */
>  	MMAL_PARAMETER_GAMMA,
> +
> +	/* 0x60 */
>  		/**< Takes a @ref MMAL_PARAMETER_CDN_T */
>  	MMAL_PARAMETER_CDN,
> +		/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
> +	MMAL_PARAMETER_JPEG_IJG_SCALING,
> +		/**< Takes a @ref MMAL_PARAMETER_ISP_SETTINGS_T */
> +	MMAL_PARAMETER_ISP_SETTINGS,
>  };
>  
>  enum mmal_parameter_camera_config_timestamp_mode {
> @@ -819,20 +827,143 @@ enum mmal_parameter_ls_gain_format_type {
>  	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_DUMMY  = 0x7FFFFFFF
>  };
>  
> -struct mmal_parameter_lens_shading_v2 {
> -	u32 enabled;
> -	u32 grid_cell_size;
> -	u32 grid_width;
> -	u32 grid_stride;
> -	u32 grid_height;
> -	u32 mem_handle_table;
> -	u32 ref_transform;
> -	u32 corner_sampled;
> -	enum mmal_parameter_ls_gain_format_type gain_format;
> -};
> -
>  struct mmal_parameter_crop {
>  	struct vchiq_mmal_rect rect;
>  };
>  
> +struct mmal_parameter_isp_parameters {
> +	struct {
> +		/* Black level */
> +		u32 update;
> +
> +		struct_group(payload,
> +			u32 enable;
> +			u16 black_level_r;
> +			u16 black_level_g;
> +			u16 black_level_b;
> +			u8 padding[2];
> +		);
> +	} black_level;
> +
> +	struct {
> +		/* GEQ */
> +		u32 update;
> +
> +		struct_group(payload,
> +			u32 enable;
> +			u32 offset;
> +			struct bcm2835_isp_rational slope;
> +			u8 padding[4];
> +		);
> +	} green_eq;
> +
> +	struct {
> +		/* Gamma */
> +		u32 update;
> +
> +		struct_group(payload,
> +			u32 enable;
> +			u16 X[BCM2835_NUM_GAMMA_PTS];
> +			u16 Y[BCM2835_NUM_GAMMA_PTS];
> +		);
> +	} gamma;
> +
> +	struct {
> +		/* Denoise */
> +		u32 update;
> +
> +		struct_group(payload,
> +			u32 enable;
> +			u32 constant;
> +			struct bcm2835_isp_rational slope;
> +			struct bcm2835_isp_rational strength;
> +			u8 padding[4];
> +		);
> +	} denoise;
> +
> +	struct {
> +		/* Sharpen */
> +		u32 update;
> +
> +		struct_group(payload,
> +			u32 enable;
> +			struct bcm2835_isp_rational threshold;
> +			struct bcm2835_isp_rational strength;
> +			struct bcm2835_isp_rational limit;
> +		);
> +	} sharpen;
> +
> +	struct {
> +		/* Defective Pixel Correction */
> +		u32 update;
> +
> +		struct_group(payload,
> +			u32 enable;
> +			u32 strength;
> +			u8 padding[4];
> +		);
> +	} dpc;
> +
> +	struct {
> +		/* Colour denoise */
> +		u32 update;
> +
> +		struct_group(payload,
> +			u32 enable;
> +			u32 mode;
> +			u8 padding[4];
> +		);
> +	} colour_denoise;
> +
> +	struct {
> +		/* CCM */
> +		u32 update;
> +
> +		struct_group(payload,
> +			u32 enable;
> +			struct bcm2835_isp_ccm ccm;
> +			u8 padding[4];
> +		);
> +	} ccm;
> +
> +	struct {
> +		/* Lens shading */
> +		u32 update;
> +
> +		struct_group(payload,
> +			u32 enabled;
> +			u32 grid_cell_size;
> +			u32 grid_width;
> +			u32 grid_stride;
> +			u32 grid_height;
> +			u32 mem_handle_table;
> +			u32 ref_transform;
> +			u32 corner_sampled;
> +			enum mmal_parameter_ls_gain_format_type gain_format;
> +			u8 padding[4];
> +		);
> +	} lens_shading;
> +
> +	struct {
> +		/* AWB Gains */
> +		u32 update;
> +
> +		struct_group(payload,
> +			struct bcm2835_isp_rational r_gain;
> +			struct bcm2835_isp_rational b_gain;
> +			u8 padding[4];
> +		);
> +	} awb_gains;
> +
> +	struct {
> +		/* Digital Gain */
> +		u32 update;
> +
> +		struct_group(payload,
> +			struct bcm2835_isp_rational value;
> +			u8 padding[4];
> +		);
> +	} digital_gain;
> +};
> +
>  #endif
> diff --git a/include/uapi/linux/bcm2835-isp.h b/include/uapi/linux/bcm2835-isp.h
> new file mode 100644
> index 000000000000..d15a4ed18404
> --- /dev/null
> +++ b/include/uapi/linux/bcm2835-isp.h
> @@ -0,0 +1,530 @@
> +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR BSD-3-Clause) */
> +/*
> + * bcm2835-isp.h
> + *
> + * BCM2835 ISP driver - user space header file.
> + *
> + * Copyright © 2019-2026 Raspberry Pi (Trading) Ltd.
> + *
> + * Author: Naushir Patuck (naush@raspberrypi.com)
> + *
> + */
> +
> +#ifndef __BCM2835_ISP_H_
> +#define __BCM2835_ISP_H_
> +
> +#include <linux/media/v4l2-isp.h>
> +
> +/*
> + * All structs below are directly mapped from struct
> + * mmal_parameter_isp_parameters in include/linux/raspberrypi/mmal-parameters.h
> + * for convenience.
> + */
> +
> +/**
> + * struct bcm2835_isp_rational - Rational value type.
> + *
> + * @num:	Numerator.
> + * @den:	Denominator.
> + */
> +struct bcm2835_isp_rational {
> +	__s32 num;
> +	__u32 den;
> +};
> +
> +/**
> + * struct bcm2835_isp_ccm - Colour correction matrix.
> + *
> + * @ccm:	3x3 correction matrix coefficients.
> + * @offsets:	1x3 correction offsets.
> + */
> +struct bcm2835_isp_ccm {
> +	struct bcm2835_isp_rational ccm[3][3];
> +	__s32 offsets[3];
> +};
> +
> +/**
> + * struct bcm2835_isp_custom_ccm - Custom CCM configuration.
> + *
> + * @enabled:	Enable custom CCM.
> + * @ccm:	Custom CCM coefficients and offsets.
> + */
> +struct bcm2835_isp_custom_ccm {
> +	__u32 enabled;
> +	struct bcm2835_isp_ccm ccm;
> +};
> +
> +/**
> + * enum bcm2835_isp_gain_format - format of the gains in the lens shading
> + *				  tables.
> + *
> + * @GAIN_FORMAT_U0P8_1:		Gains are u0.8 format, starting at 1.0
> + * @GAIN_FORMAT_U1P7_0:		Gains are u1.7 format, starting at 0.0
> + * @GAIN_FORMAT_U1P7_1:		Gains are u1.7 format, starting at 1.0
> + * @GAIN_FORMAT_U2P6_0:		Gains are u2.6 format, starting at 0.0
> + * @GAIN_FORMAT_U2P6_1:		Gains are u2.6 format, starting at 1.0
> + * @GAIN_FORMAT_U3P5_0:		Gains are u3.5 format, starting at 0.0
> + * @GAIN_FORMAT_U3P5_1:		Gains are u3.5 format, starting at 1.0
> + * @GAIN_FORMAT_U4P10:		Gains are u4.10 format, starting at 0.0
> + */
> +enum bcm2835_isp_gain_format {
> +	GAIN_FORMAT_U0P8_1 = 0,
> +	GAIN_FORMAT_U1P7_0 = 1,
> +	GAIN_FORMAT_U1P7_1 = 2,
> +	GAIN_FORMAT_U2P6_0 = 3,
> +	GAIN_FORMAT_U2P6_1 = 4,
> +	GAIN_FORMAT_U3P5_0 = 5,
> +	GAIN_FORMAT_U3P5_1 = 6,
> +	GAIN_FORMAT_U4P10  = 7,
> +};
> +
> +/**
> + * struct bcm2835_isp_lens_shading - Lens shading tables.
> + *
> + * @enabled:		Enable lens shading.
> + * @grid_cell_size:	Size of grid cells in samples (16, 32, 64, 128 or 256).
> + * @grid_width:		Width of lens shading tables in grid cells.
> + * @grid_stride:	Row to row distance (in grid cells) between grid cells
> + *			in the same horizontal location.
> + * @grid_height:	Height of lens shading tables in grid cells.
> + * @dmabuf:		dmabuf file handle containing the table.
> + * @ref_transform:	Reference transform - unsupported, please pass zero.
> + * @corner_sampled:	Whether the gains are sampled at the corner points
> + *			of the grid cells or in the cell centres.
> + * @gain_format:	Format of the gains (see enum &bcm2835_isp_gain_format).
> + */
> +struct bcm2835_isp_lens_shading {
> +	__u32 enabled;
> +	__u32 grid_cell_size;
> +	__u32 grid_width;
> +	__u32 grid_stride;
> +	__u32 grid_height;
> +	__s32 dmabuf;
> +	__u32 ref_transform;
> +	__u32 corner_sampled;
> +	__u32 gain_format;
> +};
> +
> +/**
> + * struct bcm2835_isp_black_level - Sensor black level configuration.
> + *
> + * @enabled:		Enable black level.
> + * @black_level_r:	Black level for red channel.
> + * @black_level_g:	Black level for green channels.
> + * @black_level_b:	Black level for blue channel.
> + * @padding:		Unused padding.
> + */
> +struct bcm2835_isp_black_level {
> +	__u32 enabled;
> +	__u16 black_level_r;
> +	__u16 black_level_g;
> +	__u16 black_level_b;
> +	__u8 padding[2]; /* Unused */
> +};
> +
> +/**
> + * struct bcm2835_isp_geq - Green equalisation parameters.
> + *
> + * @enabled:	Enable green equalisation.
> + * @offset:	Fixed offset of the green equalisation threshold.
> + * @slope:	Slope of the green equalisation threshold.
> + */
> +struct bcm2835_isp_geq {
> +	__u32 enabled;
> +	__u32 offset;
> +	struct bcm2835_isp_rational slope;
> +};
> +
> +#define BCM2835_NUM_GAMMA_PTS 33
> +
> +/**
> + * struct bcm2835_isp_gamma - Gamma parameters.
> + *
> + * @enabled:	Enable gamma adjustment.
> + * @x:		X values of the points defining the gamma curve.
> + *		Values should be scaled to 16 bits.
> + * @y:		Y values of the points defining the gamma curve.
> + *		Values should be scaled to 16 bits.
> + */
> +struct bcm2835_isp_gamma {
> +	__u32 enabled;
> +	__u16 x[BCM2835_NUM_GAMMA_PTS];
> +	__u16 y[BCM2835_NUM_GAMMA_PTS];
> +};
> +
> +/**
> + * enum bcm2835_isp_cdn_mode - Mode of operation for colour denoise.
> + *
> + * @CDN_MODE_FAST:		Fast (but lower quality) colour denoise
> + *				algorithm, typically used for video recording.
> + * @CDN_MODE_HIGH_QUALITY:	High quality (but slower) colour denoise
> + *				algorithm, typically used for stills capture.
> + */
> +enum bcm2835_isp_cdn_mode {
> +	CDN_MODE_FAST = 0,
> +	CDN_MODE_HIGH_QUALITY = 1,
> +};
> +
> +/**
> + * struct bcm2835_isp_cdn - Colour denoise parameters.
> + *
> + * @enabled:	Enable colour denoise.
> + * @mode:	Colour denoise operating mode (see enum &bcm2835_isp_cdn_mode)
> + */
> +struct bcm2835_isp_cdn {
> +	__u32 enabled;
> +	__u32 mode;
> +};
> +
> +/**
> + * struct bcm2835_isp_denoise - Denoise parameters.
> + *
> + * @enabled:	Enable denoise.
> + * @constant:	Fixed offset of the noise threshold.
> + * @slope:	Slope of the noise threshold.
> + * @strength:	Denoise strength between 0.0 (off) and 1.0 (maximum).
> + */
> +struct bcm2835_isp_denoise {
> +	__u32 enabled;
> +	__u32 constant;
> +	struct bcm2835_isp_rational slope;
> +	struct bcm2835_isp_rational strength;
> +};
> +
> +/**
> + * struct bcm2835_isp_sharpen - Sharpen parameters.
> + *
> + * @enabled:	Enable sharpening.
> + * @threshold:	Threshold at which to start sharpening pixels.
> + * @strength:	Strength with which pixel sharpening increases.
> + * @limit:	Limit to the amount of sharpening applied.
> + */
> +struct bcm2835_isp_sharpen {
> +	__u32 enabled;
> +	struct bcm2835_isp_rational threshold;
> +	struct bcm2835_isp_rational strength;
> +	struct bcm2835_isp_rational limit;
> +};
> +
> +/**
> + * enum bcm2835_isp_dpc_mode - defective pixel correction (DPC) strength.
> + *
> + * @DPC_MODE_OFF:		No DPC.
> + * @DPC_MODE_NORMAL:		Normal DPC.
> + * @DPC_MODE_STRONG:		Strong DPC.
> + */
> +enum bcm2835_isp_dpc_mode {
> +	DPC_MODE_OFF = 0,
> +	DPC_MODE_NORMAL = 1,
> +	DPC_MODE_STRONG = 2,
> +};
> +
> +/**
> + * struct bcm2835_isp_dpc - Defective pixel correction (DPC) parameters.
> + *
> + * @enabled:	Enable DPC.
> + * @strength:	DPC strength (see enum &bcm2835_isp_dpc_mode).
> + */
> +struct bcm2835_isp_dpc {
> +	__u32 enabled;
> +	__u32 strength;
> +};
> +
> +/**
> + * struct bcm2835_isp_awb_gains - AWB gains configuration.
> + *
> + * @r_gain:	Red channel AWB gain.
> + * @b_gain:	Blue channel AWB gain.
> + */
> +struct bcm2835_isp_awb_gains {
> +	struct bcm2835_isp_rational r_gain;
> +	struct bcm2835_isp_rational b_gain;
> +};
> +
> +/**
> + * struct bcm2835_isp_digital_gain - Digital gain configuration.
> + *
> + * @gain:	Digital gain value.
> + */
> +struct bcm2835_isp_digital_gain {
> +	struct bcm2835_isp_rational gain;
> +};
> +
> +/*
> + * BCM2835 ISP extensible parameters buffer definitions.
> + *
> + * The extensible parameters mechanism allows userspace to submit ISP
> + * configuration parameters as a buffer containing a series of tagged
> + * blocks rather than individual V4L2 controls. This enables atomic
> + * application of multiple parameters in a single operation.
> + */
> +
> +/**
> + * enum bcm2835_isp_param_buffer_version - BCM2835 ISP parameters buffer version
> + *
> + * @BCM2835_ISP_PARAM_BUFFER_V1: First version of parameters buffer format
> + */
> +enum bcm2835_isp_param_buffer_version {
> +	BCM2835_ISP_PARAM_BUFFER_V1 = V4L2_ISP_PARAMS_VERSION_V1,
> +};
> +
> +/**
> + * enum bcm2835_isp_param_block_type - BCM2835 ISP parameter block types
> + *
> + * This enumeration defines the types of parameters blocks that can be
> + * included in the extensible parameters buffer. Each block type corresponds
> + * to a specific ISP processing block configuration.
> + *
> + * @BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL: Black level configuration
> + * @BCM2835_ISP_PARAM_BLOCK_GEQ: Green equalisation configuration
> + * @BCM2835_ISP_PARAM_BLOCK_GAMMA: Gamma curve configuration
> + * @BCM2835_ISP_PARAM_BLOCK_DENOISE: Denoise configuration
> + * @BCM2835_ISP_PARAM_BLOCK_SHARPEN: Sharpening configuration
> + * @BCM2835_ISP_PARAM_BLOCK_DPC: Defective pixel correction configuration
> + * @BCM2835_ISP_PARAM_BLOCK_CDN: Colour denoise configuration
> + * @BCM2835_ISP_PARAM_BLOCK_CC_MATRIX: Colour correction matrix configuration
> + * @BCM2835_ISP_PARAM_BLOCK_LENS_SHADING: Lens shading table configuration
> + * @BCM2835_ISP_PARAM_BLOCK_AWB_GAINS: AWB gains configuration
> + * @BCM2835_ISP_PARAM_BLOCK_DIGITAL_GAIN: Digital gain configuration
> + */
> +enum bcm2835_isp_param_block_type {
> +	BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL,
> +	BCM2835_ISP_PARAM_BLOCK_GEQ,
> +	BCM2835_ISP_PARAM_BLOCK_GAMMA,
> +	BCM2835_ISP_PARAM_BLOCK_DENOISE,
> +	BCM2835_ISP_PARAM_BLOCK_SHARPEN,
> +	BCM2835_ISP_PARAM_BLOCK_DPC,
> +	BCM2835_ISP_PARAM_BLOCK_CDN,
> +	BCM2835_ISP_PARAM_BLOCK_CC_MATRIX,
> +	BCM2835_ISP_PARAM_BLOCK_LENS_SHADING,
> +	BCM2835_ISP_PARAM_BLOCK_AWB_GAINS,
> +	BCM2835_ISP_PARAM_BLOCK_DIGITAL_GAIN,
> +};
> +
> +/**
> + * struct bcm2835_isp_params_black_level - Black level parameters block
> + *
> + * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL)
> + * @black_level: Black level configuration
> + */
> +struct bcm2835_isp_params_black_level {
> +	struct v4l2_isp_params_block_header header;
> +	struct bcm2835_isp_black_level black_level;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_geq - Green equalisation parameters block
> + *
> + * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_GEQ)
> + * @geq: Green equalisation configuration
> + */
> +struct bcm2835_isp_params_geq {
> +	struct v4l2_isp_params_block_header header;
> +	struct bcm2835_isp_geq geq;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_gamma - Gamma parameters block
> + *
> + * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_GAMMA)
> + * @gamma: Gamma curve configuration
> + */
> +struct bcm2835_isp_params_gamma {
> +	struct v4l2_isp_params_block_header header;
> +	struct bcm2835_isp_gamma gamma;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_denoise - Denoise parameters block
> + *
> + * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_DENOISE)
> + * @denoise: Denoise configuration
> + */
> +struct bcm2835_isp_params_denoise {
> +	struct v4l2_isp_params_block_header header;
> +	struct bcm2835_isp_denoise denoise;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_sharpen - Sharpen parameters block
> + *
> + * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_SHARPEN)
> + * @sharpen: Sharpening configuration
> + */
> +struct bcm2835_isp_params_sharpen {
> +	struct v4l2_isp_params_block_header header;
> +	struct bcm2835_isp_sharpen sharpen;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_dpc - Defective pixel correction parameters block
> + *
> + * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_DPC)
> + * @dpc: DPC configuration
> + */
> +struct bcm2835_isp_params_dpc {
> +	struct v4l2_isp_params_block_header header;
> +	struct bcm2835_isp_dpc dpc;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_cdn - Colour denoise parameters block
> + *
> + * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_CDN)
> + * @cdn: Colour denoise configuration
> + */
> +struct bcm2835_isp_params_cdn {
> +	struct v4l2_isp_params_block_header header;
> +	struct bcm2835_isp_cdn cdn;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_cc_matrix - Colour correction matrix parameters block
> + *
> + * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_CC_MATRIX)
> + * @ccm: Colour correction matrix configuration
> + */
> +struct bcm2835_isp_params_cc_matrix {
> +	struct v4l2_isp_params_block_header header;
> +	struct bcm2835_isp_custom_ccm ccm;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_lens_shading - Lens shading parameters block
> + *
> + * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_LENS_SHADING)
> + * @ls: Lens shading configuration (includes dmabuf fd for table data)
> + */
> +struct bcm2835_isp_params_lens_shading {
> +	struct v4l2_isp_params_block_header header;
> +	struct bcm2835_isp_lens_shading ls;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_awb_gains - AWB gains parameters block
> + *
> + * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_AWB_GAINS)
> + * @awb_gains: AWB gains configuration
> + */
> +struct bcm2835_isp_params_awb_gains {
> +	struct v4l2_isp_params_block_header header;
> +	struct bcm2835_isp_awb_gains awb_gains;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_digital_gain - Digital gain parameters block
> + *
> + * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_DIGITAL_GAIN)
> + * @digital_gain: Digital gain configuration
> + */
> +struct bcm2835_isp_params_digital_gain {
> +	struct v4l2_isp_params_block_header header;
> +	struct bcm2835_isp_digital_gain digital_gain;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * define BCM2835_ISP_PARAMS_MAX_SIZE - Maximum size of all ISP parameters

How about adding a build-time check to the driver the size remains
unchanged? There are quite a few different fields there.

I might do the same for the statistics.

This can be all fixed on top though and doesn't affect the UAPI.

> + *
> + * This defines the maximum size needed to accommodate all possible parameter
> + * blocks in a single buffer. Drivers use this to allocate appropriately
> + * sized buffers.
> + */
> +#define BCM2835_ISP_PARAMS_MAX_SIZE					\
> +	(sizeof(struct bcm2835_isp_params_black_level) +		\
> +	 sizeof(struct bcm2835_isp_params_geq) +			\
> +	 sizeof(struct bcm2835_isp_params_gamma) +			\
> +	 sizeof(struct bcm2835_isp_params_denoise) +			\
> +	 sizeof(struct bcm2835_isp_params_sharpen) +			\
> +	 sizeof(struct bcm2835_isp_params_dpc) +			\
> +	 sizeof(struct bcm2835_isp_params_cdn) +			\
> +	 sizeof(struct bcm2835_isp_params_cc_matrix) +			\
> +	 sizeof(struct bcm2835_isp_params_lens_shading) +		\
> +	 sizeof(struct bcm2835_isp_params_awb_gains) +			\
> +	 sizeof(struct bcm2835_isp_params_digital_gain))
> +
> 

-- 
Regards,

Sakari Ailus
