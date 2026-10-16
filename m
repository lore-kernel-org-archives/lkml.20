Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C624037AA70;
	Fri, 16 Oct 2026 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166802; cv=none; b=D/luiHY6H1opakge82fgMvpteKwOD6coj/98UqLxUNEZ9k+5V7ttQlKLlaS73i3WUUzO47+o4PYZUczsYpvdusuXbN8qulC5HiEP08mrEh+/BZIRvnHvavtXBH9HvxXtk8KH0AKXYJ3GWu5NNTuNuoQpUInGZ18Pi6T8+uSaAiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166802; c=relaxed/simple;
	bh=Gj2vT77qywjWijWUBZKh0xwscUmjoNzCGgaKlTRt3QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATJW6P3KD2++hle+XDoAg/hov7EF2/01p5fyoA1UW1r0A2FFnZlF12+4Soju18FJEbX0vP+R47eY7vxg591zWsgHdu61xhpU0b9PdnxrXQf5LLKmgBuxuzQ4eISWRfeU0dRJ6XWvKsTvIul2HYSAQhUAKOUanh8rJZV8VyxtTes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xHkS0-0000000086I-3HYE;
	Fri, 16 Oct 2026 16:06:32 +0000
Date: Fri, 16 Oct 2026 17:06:29 +0100
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
Subject: Re: [PATCH v3 2/5] media: rkisp2: Add parameters output video node
Message-ID: <atJLhTeuvukW4XFx@makrotopia.org>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
 <20260827-rkisp2-v3-2-e91ff0a604d6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-rkisp2-v3-2-e91ff0a604d6@ideasonboard.com>

On Thu, Aug 27, 2026 at 07:48:31PM +0900, Paul Elder wrote:
> Implement support for setting parameters on the ISP by queueing
> parameter buffers to rkisp2.
[...]

Hi Paul,

A few comments from running this on the RV1126; the RK3588 statements
are by code inspection.

[...]
> +++ b/Documentation/userspace-api/media/v4l/metafmt-rkisp2.rst
[...]
> +The configuration parameters are passed to the :ref:`rkisp2_params
> +<rkisp2_params>` metadata output video node, using the

There is no rkisp2_params label anywhere under Documentation/ (rkisp1
defines its labels in admin-guide/media/rkisp1.rst), so Sphinx warns
about an undefined label. The same holds for rkisp2_stats in patch 3.

[...]
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-params.c
[...]
> +static void rkisp2_params_goc(struct rkisp2_params *params,
[...]
> +	if (arg->mode == RKISP2_ISP_GOC_MODE_EQUIDISTANT)
> +		control = ISP3X_GAMMA_OUT_CTRL_MODE_EQUIDISTANT;
> +	if (arg->mode == RKISP2_ISP_GOC_SEGMENTS_48)
> +		control |= ISP3X_GAMMA_OUT_CTRL_SEGMENTS_48;

The second test is meant for arg->segments. As
RKISP2_ISP_GOC_SEGMENTS_48 and RKISP2_ISP_GOC_MODE_EQUIDISTANT are both
1, equidistant mode always gets the 48 segment layout and the segments
member of the uapi is dead.

[...]
> +static void rkisp2_params_crop_init(struct rkisp2_params *params)
> +{
> +	struct rkisp2_device *rkisp2 = params->rkisp2;
> +
> +	/* Create an initial crop configuration to configure */
> +	struct rkisp2_params_crop arg = {
> +		.header.type = RKISP2_PARAMS_BLOCK_CROP,
> +		.header.flags = 0,
> +		.header.size = sizeof(struct rkisp2_params_crop),
> +		.crop_en = RKISP2_ISP_CROP_ENABLE_MAIN | RKISP2_ISP_CROP_ENABLE_SELF,
> +
> +		.mp_crop.h_offs = 0,
> +		.mp_crop.v_offs = 0,
> +		.mp_crop.h_size = rkisp2->resizer_devs[0].source_size.width,
> +		.mp_crop.v_size = rkisp2->resizer_devs[0].source_size.height,

Without a params buffer at stream start this crops a window of the
output size at the top left corner, so a 1920x1080 capture from a
3864x2192 sensor shows that corner only. The sink size (what the CROP
block uses when it is disabled), scaled by the resizer, is what rkisp1
does and what a plain v4l2-ctl capture expects.

[...]
> +static void rkisp2_params_configure(struct rkisp2_params *params,
[...]
> +	/* update shadow register immediately */
> +	rkisp2_param_set_bits(params, RKISP2_CIF_ISP_CTRL,
> +			      RKISP2_CIF_ISP_CTRL_ISP_CFG_UPD);
> +
> +	if (prio == RKISP2_PARAMS_CONFIG_PRIO_NONE)
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +}
[...]
> +void rkisp2_params_pre_configure(struct rkisp2_params *params,
[...]
> +	spin_lock_irq(&params->buf_lock);
> +	buf = list_first_entry_or_null(&params->params,
> +				       struct rkisp2_params_buffer, queue);
> +	spin_unlock_irq(&params->buf_lock);
> +
> +	if (!buf) {
> +		/*
> +		 * Initialize crop in the event that are no pre-queued
> +		 * parameter buffers
> +		 */
> +		rkisp2_params_crop_init(params);
> +		return;
> +	}
> +
> +	rkisp2_params_configure(params, buf, RKISP2_PARAMS_CONFIG_PRIO_PRE);

When a buffer is queued but carries no CROP block, neither path
programs the dual crop and the resizer, so they keep the state of the
previous stream (the IRCL pulse in rkisp2_isp_stop() resets the ISP
and MIPI blocks only) or the reset state. With a capture size that
differs from the sink size the MI is then fed frames of the wrong
size. Running rkisp2_params_crop_init() first and letting a CROP block
override it covers both cases.

> +}
> +
> +void rkisp2_params_post_configure(struct rkisp2_params *params)
> +{
> +	struct rkisp2_params_buffer *buf;
> +
> +	spin_lock_irq(&params->buf_lock);
> +	buf = list_first_entry_or_null(&params->params,
> +				       struct rkisp2_params_buffer, queue);
> +	if (buf)
> +		list_del(&buf->queue);
> +	spin_unlock_irq(&params->buf_lock);
> +
> +	if (!buf)
> +		return;
> +
> +	rkisp2_params_configure(params, buf, RKISP2_PARAMS_CONFIG_PRIO_POST);
> +}

The buffer is taken off the list here and configured with PRIO_POST,
which does not complete it (see above), so a params buffer queued
before STREAMON never comes back from DQBUF; at STREAMOFF vb2 warns
that stop_streaming left a buffer in active state and releases it
itself. rkisp1_params_post_configure() completes the buffer after the
LSC group; vb2_buffer_done() belongs here after the POST pass.

[...]
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		dev_err(rkisp2->dev,
> +			"failed to register %s, ret=%d\n", vdev->name, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +
> +err_media:
> +	media_entity_cleanup(&vdev->entity);
> +	mutex_destroy(&node->vlock);
> +	return ret;

goto err_media here as well. Neither path releases the vb2 queue that
was initialised above.

[...]
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-resizer.c
[...]
> +void rkisp2_resizer_configure(struct rkisp2_resizer *rsz,
[...]
> +	if (crop->width == rsz->source_size.width && crop->height == rsz->source_size.height)
> +		rkisp2_resizer_disable_rsz(rsz);
> +	else
> +		rkisp2_resizer_config_rsz(rsz, crop,
> +					  &rsz->source_size,
> +					  &rsz->source_format);

The bypass test compares the luma size only. The ISP delivers 4:2:2,
and rkisp2_resizer_config_rsz() handles the chroma subsampling when it
runs, but an unscaled 4:2:0 stream (crop equal to the output size)
disables the resizer and the MI gets one chroma row per luma row. On
the RV1126 main path the chroma plane offset wraps halfway through the
frame and the chroma of the lower half lands on the upper half
(displaced colour ghosts and neutral halos). rkisp1_rsz_config()
bypasses only when the size and the subsampling are both unchanged;
the same test here fixed it for me. I do not know whether the 3.0 MI
subsamples on its own in the ISP32_MI_OUTPUT_YUV420 mode; if it does
not, this applies to the RK3588 too.

Best regards,
Daniel
