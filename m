Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91108362138;
	Sat, 19 Sep 2026 06:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789800562; cv=none; b=EknnBTNEjYCmZqyR86Q90TOWSm5clEXYkdDcHBSQfiPjH4fQHsxsBGZ/4yEWL7+zY2zO6AA/u4WL51yVAwh32UkAzXTNCKrOJn0yyrI1SAcXNkeh3EjINvjsryXXPawbomqP95pE8iJgvfBWigPLUoLosniNH0qDY2InreqwAXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789800562; c=relaxed/simple;
	bh=0MBvERAL3Kvad9gTTVxOwSPpa0WkY+tM1QbiFkHHxPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kaCBszff/BgEsNBYOzfsU/QnoqJpwmhYUmy5OO66LqGJ0p4KColRcIvW2x3nLNmh+wftNNt4LAXwJYzzTxCDXh+192SSMhXdhYhEWYvO/oTjG1zsUIjDBBuv4ViKEvUM/NQcwjVnlfNe8eTNTriTPE8Jo1zSt0DIoDjp3Yy1KSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADqnrieB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADqnrieB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAE51F000FF;
	Sat, 19 Sep 2026 06:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789800560;
	bh=7wSFVEb/qvFvmVslGx2TKkNhLPM/cz0FAaOhojj2SBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ADqnrieBup6KLISd5MIkwVbpCpWAh9xYE9c1INQMp2aWFK6nCuk/EK54JwFUhlIHw
	 r2uhlTTABwoQdUYex7GJrzRoIJLSecTb7MvWfP8I4cpYXtleYmEs+J9PAhZM1HoDcn
	 Uk9GZBSkSL7M7pDtSh8K/gB1+ZLMa9oeCYomX4+TsNTldfXjVXjO/dS6yE+lXiWCDE
	 LArKd8551vDWNjvQze3Nep38I8Na2Elje6YdlafqsyMlYQBWpjm3Ru/rgJhV9LROyu
	 uyxbIUt/jKUbaUg22g1ZGTG7y67UbcPOpM+BxjX6li3IA8NmaWCElHTDHaywqbHuX7
	 UK/qBsdq3i3Qg==
Message-ID: <3f541ef3-45ff-4800-b91f-0dfc8954f1f0@kernel.org>
Date: Sat, 19 Sep 2026 08:49:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] media: apple: add avd driver
To: Sofus Forstreuter <sofus.c@icloud.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-10-49977931f455@icloud.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260918-avd-v1-10-49977931f455@icloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/09/2026 15:15, Sofus Forstreuter wrote:
> Add the AVD (Apple Video Decoder) driver with V4L2 M2M stateless
> support based largely on rockchips implementation.
> 
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>

You order patches very odd, making it more difficult for maintainers to
review and handle. First media patch, then DTS, then again media? No,
DTS goes to the end, see submitting patches for DT.

> ---
>  MAINTAINERS                                 |   1 +
>  drivers/media/platform/Kconfig              |   1 +
>  drivers/media/platform/Makefile             |   1 +
>  drivers/media/platform/apple/Kconfig        |   5 +
>  drivers/media/platform/apple/Makefile       |   3 +
>  drivers/media/platform/apple/avd/Kconfig    |  16 +
>  drivers/media/platform/apple/avd/Makefile   |   4 +
>  drivers/media/platform/apple/avd/avd-drv.c  | 817 ++++++++++++++++++++++++++++
>  drivers/media/platform/apple/avd/avd-hw.c   | 127 +++++
>  drivers/media/platform/apple/avd/avd-inst.h | 218 ++++++++
>  drivers/media/platform/apple/avd/avd-v4l2.c | 752 +++++++++++++++++++++++++
>  drivers/media/platform/apple/avd/avd.h      | 273 ++++++++++
>  12 files changed, 2218 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3c7c5fe3f0bc..6903baa15955 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2676,6 +2676,7 @@ F:	drivers/input/touchscreen/apple_z2.c
>  F:	drivers/iommu/apple-dart.c
>  F:	drivers/iommu/io-pgtable-dart.c
>  F:	drivers/irqchip/irq-apple-aic.c
> +F:	drivers/media/platform/apple/*
>  F:	drivers/mfd/macsmc.c
>  F:	drivers/nvme/host/apple.c
>  F:	drivers/nvmem/apple-efuses.c
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 2c7699b6610b..280a9db25935 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -66,6 +66,7 @@ source "drivers/media/platform/allegro-dvt/Kconfig"
>  source "drivers/media/platform/amd/Kconfig"
>  source "drivers/media/platform/amlogic/Kconfig"
>  source "drivers/media/platform/amphion/Kconfig"
> +source "drivers/media/platform/apple/Kconfig"
>  source "drivers/media/platform/arm/Kconfig"
>  source "drivers/media/platform/aspeed/Kconfig"
>  source "drivers/media/platform/atmel/Kconfig"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index d47c47d817da..aa82e189936b 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -9,6 +9,7 @@ obj-y += allegro-dvt/
>  obj-y += amd/
>  obj-y += amlogic/
>  obj-y += amphion/
> +obj-y += apple/
>  obj-y += arm/
>  obj-y += aspeed/
>  obj-y += atmel/
> diff --git a/drivers/media/platform/apple/Kconfig b/drivers/media/platform/apple/Kconfig
> new file mode 100644
> index 000000000000..43c0a56c36a8
> --- /dev/null
> +++ b/drivers/media/platform/apple/Kconfig
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +comment "Apple media platform drivers"
> +
> +source "drivers/media/platform/apple/avd/Kconfig"
> diff --git a/drivers/media/platform/apple/Makefile b/drivers/media/platform/apple/Makefile
> new file mode 100644
> index 000000000000..d502cab93970
> --- /dev/null
> +++ b/drivers/media/platform/apple/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-y += avd/
> diff --git a/drivers/media/platform/apple/avd/Kconfig b/drivers/media/platform/apple/avd/Kconfig
> new file mode 100644
> index 000000000000..3c41006f3a02
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config VIDEO_APPLE_AVD
> +	tristate "Apple Silicon Video Decoding driver"
> +	depends on VIDEO_DEV
> +	depends on MEDIA_CONTROLLER
> +	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)

Why this cannot be compile tested on every arch?

> +	depends on OF_ADDRESS
> +	depends on V4L_PLATFORM_DRIVERS
> +	select V4L2_MEM2MEM_DEV
> +	select VIDEOBUF2_DMA_CONTIG
> +	help
> +	  Support for hardware video decoding on Apple Silicon devices using
> +	  the Apple Video Decoder (AVD).
> +          To compile this driver as a module, choose M here: the module will
> +          be called apple-avd.
> diff --git a/drivers/media/platform/apple/avd/Makefile b/drivers/media/platform/apple/avd/Makefile

Misindented.


> new file mode 100644
> index 000000000000..bcf912cfea3d
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +apple-avd-y := avd-drv.o avd-v4l2.o avd-hw.o
> +obj-$(CONFIG_VIDEO_APPLE_AVD) += apple-avd.o
> diff --git a/drivers/media/platform/apple/avd/avd-drv.c b/drivers/media/platform/apple/avd/avd-drv.c
> new file mode 100644
> index 000000000000..f6a5145c7038
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-drv.c
> @@ -0,0 +1,817 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Apple Video Decoder driver
> + *
> + * Copyright (C) 2026 The Asahi Linux Contributors
> + * Copyright (C) 2026 Sofus Forstreuter <sofus.c@icloud.com>
> + *
> + * Based on rkvdec driver by Collabora, Ltd.
> + * Copyright (C) 2019 Collabora, Ltd.
> + * Based on rkvdec driver by Google LLC. (Tomasz Figa <tfiga@chromium.org>)
> + * Based on s5p-mfc driver by Samsung Electronics Co., Ltd.
> + * Copyright (C) 2011 Samsung Electronics Co., Ltd.


> + */
> +
> +#include <linux/pm_runtime.h>
> +#include <linux/iommu.h>
> +#include <linux/reset.h>
> +#include <linux/delay.h>
> +
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "avd.h"
> +#include "avd-inst.h"
> +
> +static void calc_tile_meta(u32 w, u32 h, u32 bpb, u32 tile_dim,
> +			   u32 meta_hdr_bytes, u32 *tile, u32 *meta)
> +{
> +	u32 tiles_width, tiles_height, meta_tile_w, meta_tile_h, tile_bytes;
> +
> +	tiles_width = DIV_ROUND_UP(w, tile_dim);
> +	tiles_height = DIV_ROUND_UP(h, tile_dim);
> +	tile_bytes = tile_dim * tile_dim * DIV_ROUND_UP(bpb, 8);
> +	*tile = ALIGN(tiles_width * tiles_height * tile_bytes, 16);
> +
> +	meta_tile_w = roundup_pow_of_two(tiles_width);
> +	meta_tile_h = roundup_pow_of_two(tiles_height);
> +
> +	*meta = ALIGN(meta_tile_w * meta_tile_h * meta_hdr_bytes, 16);
> +}
> +
> +void fill_comp(struct avd_comp *comp, enum avd_image_fmt image_fmt, u32 width,
> +	       u32 height)
> +{
> +	u32 y_meta, y, uv_meta, uv;
> +	int bit_depth, vdiv, hdiv = 2;
> +
> +	switch (image_fmt) {
> +	case AVD_IMG_FMT_420_10BIT:
> +	case AVD_IMG_FMT_422_10BIT:
> +		bit_depth = 10;
> +		break;
> +	default:
> +		bit_depth = 8;
> +		break;
> +	}
> +
> +	switch (image_fmt) {
> +	case AVD_IMG_FMT_420_10BIT:
> +	case AVD_IMG_FMT_420_8BIT:
> +		vdiv = 2;
> +		break;
> +	default:
> +		vdiv = 1;
> +		break;
> +	}
> +
> +	/* y has 32x32 tiles and 32 bytes of metadata per tile */
> +	calc_tile_meta(width, height, bit_depth, 32, 32, &y, &y_meta);
> +	/* uv has 16x16 tiles and 8 bytes of metadata per tile */
> +	calc_tile_meta(width / vdiv, height / hdiv, bit_depth * 2, 16, 8, &uv,
> +		       &uv_meta);
> +
> +	/* output like DCP driver expects */
> +	comp->offsets[0] = y;
> +	comp->offsets[1] = 0;
> +	comp->offsets[2] = y + y_meta + uv;
> +	comp->offsets[3] = y + y_meta;
> +
> +	comp->size = y_meta + y + uv_meta + uv;
> +}
> +
> +int avd_buf_alloc(struct avd_dev *avd, struct avd_buf *buf, size_t size)
> +{
> +	if (!buf->cpu && size < buf->size)
> +		return 0;
> +	else if (buf->cpu)
> +		avd_buf_free(avd, buf);
> +
> +	if (size <= 0)
> +		return -ENOMEM;
> +
> +	buf->size = size;
> +	buf->cpu =
> +		dma_alloc_coherent(avd->dev, buf->size, &buf->addr, GFP_KERNEL);
> +	return buf->cpu ? 0 : -ENOMEM;
> +}
> +
> +void avd_buf_free(struct avd_dev *avd, struct avd_buf *buf)
> +{
> +	if (buf->cpu)
> +		dma_free_coherent(avd->dev, buf->size, buf->cpu, buf->addr);
> +	memset(buf, 0, sizeof(*buf));
> +}
> +
> +struct avd_decoded_buffer *
> +avd_get_ref_buf(struct avd_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp)
> +{
> +	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> +	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
> +	struct vb2_buffer *buf;
> +
> +	/*
> +	 * If a ref is unused or invalid, address of current destination
> +	 * buffer is returned.
> +	 */
> +	buf = vb2_find_buffer(cap_q, timestamp);
> +	if (!buf)
> +		buf = &dst->vb2_buf;
> +
> +	return vb2_to_avd_decoded_buf(buf);
> +}
> +
> +static int avd_wait_submission_queue(struct avd_ctx *ctx, int vp)
> +{
> +	struct avd_dev *avd = ctx->dev;
> +	u32 max = readl_relaxed(avd->ctrl +
> +				avd->variant->submit_queue_max_offset + vp * 4);
> +	u32 cur = readl_relaxed(avd->ctrl +
> +				avd->variant->submit_queue_status_offset + vp * 4);
> +
> +	if (cur == max) {
> +		dev_err(avd->dev, "instruction que full! %d/%d", cur, max);
> +		return 1;
> +	}
> +
> +	if (cur >= max / 2) {
> +		/* TODO: to high? low? Has weird side effects??? */
> +		usleep_range(500, 650);
> +	}
> +	return 0;
> +}
> +
> +int avd_init_job(struct avd_ctx *ctx, enum avd_codec codec, size_t segments)
> +{
> +	int ret = 0;
> +	struct avd_job *job = &ctx->job;
> +
> +	job->codec = codec;
> +	job->num = 0;
> +	job->segments = kzalloc_objs(*job->segments, segments, GFP_KERNEL);
> +	if (!job->segments)
> +		ret = -ENOMEM;
> +	return ret;
> +}
> +
> +int avd_submit_job(struct avd_ctx *ctx)
> +{
> +	struct avd_dev *avd = ctx->dev;
> +	struct avd_job *sub = &ctx->job;
> +	struct avd_segment *seg;
> +	int i, idx = 0, vp = 0;
> +	void __iomem *reg;
> +	u32 exec_mask = sub->codec == AVD_CODEC_VP9 &&
> +					avd->variant->revision == 3 ?
> +				AVD_OP_EXEC_REV3_VP9_MASK :
> +				0;
> +	u32 exec_rev_flag =
> +		AVD_OP_EXEC_FLAG_START_REV4(avd->variant->revision == 4) |
> +		AVD_OP_EXEC_FLAG_START_REV3(avd->variant->revision == 3);
> +
> +	ctx->fifo_idx = 0;
> +	for (i = 0; i < sub->codec; i++)
> +		vp += avd->variant->vp_slots[i];
> +
> +	schedule_delayed_work(&ctx->watchdog_work, msecs_to_jiffies(2000));
> +	avd->variant->configure_stream(avd, ctx->inst.addr, ctx->fifo_idx, vp);
> +	reg = avd->ctrl + avd->variant->vp_slot_offset + vp * 4;
> +
> +	/* the first segment is always the header (needs special handling) */
> +
> +	writel(AVD_OP_EXEC | exec_mask | exec_rev_flag |
> +		       AVD_OP_EXEC_FIFO_IDX(ctx->fifo_idx),
> +	       reg);
> +	seg = &sub->segments[idx++];
> +	for (i = 0; i < seg->num; i++)
> +		writel(seg->instructions[i], reg);
> +	for (; idx <= sub->num; idx++) {
> +		seg = &sub->segments[idx];
> +		for (i = 0; i < seg->num; i++)
> +			writel(seg->instructions[i], reg);
> +		if (avd_wait_submission_queue(ctx, vp))
> +			break;
> +		writel(AVD_OP_EXEC | exec_mask |
> +			       AVD_OP_EXEC_FLAG_END(idx == sub->num),
> +		       reg);
> +	}
> +
> +	kfree(sub->segments);
> +	sub->segments = NULL;
> +	return 0;
> +}
> +
> +static int avd_reset(struct avd_dev *avd)
> +{
> +	int ret = 0;
> +
> +	ret = pm_runtime_resume_and_get(avd->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = reset_control_reset(avd->rstc);
> +	if (ret)
> +		dev_err(avd->dev, "reset: failed: %d", ret);
> +
> +	if (avd->empty_domain) {
> +		iommu_attach_device(avd->empty_domain, avd->dev);
> +		iommu_detach_device(avd->empty_domain, avd->dev);
> +	}
> +
> +	ret = avd_boot(avd);
> +	if (ret)
> +		dev_err(avd->dev, "reset: failed to boot");
> +
> +	pm_runtime_put_autosuspend(avd->dev);
> +
> +	return ret;
> +}
> +
> +static void avd_watchdog_func(struct work_struct *work)
> +{
> +	struct avd_dev *avd;
> +	struct avd_ctx *ctx;
> +	int ret;
> +
> +	ctx = container_of(to_delayed_work(work), struct avd_ctx,
> +			   watchdog_work);
> +	if (!ctx)
> +		return;
> +
> +	avd = ctx->dev;
> +
> +	dev_err(avd->dev, "Frame processing timed out!");
> +
> +	writel(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
> +	ret = avd_reset(avd);
> +	if (ret)
> +		dev_err(avd->dev, "failed to reset: %d", ret);
> +
> +	avd_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +}
> +
> +static irqreturn_t avd_irq_handler(int irq, void *data)
> +{
> +	struct avd_dev *avd = data;
> +	struct avd_ctx *ctx = v4l2_m2m_get_curr_priv(avd->m2m_dev);
> +	enum vb2_buffer_state state;
> +	u32 status;
> +
> +	if (!ctx)
> +		return IRQ_HANDLED;
> +
> +	status = readl(avd->mbox + AVD_REG_MBOX1_RETRIEVE);
> +
> +	writel(AVD_MBOX1_NOT_EMPTY, avd->mbox + AVD_REG_MBOX_IRQ_CLR);
> +
> +	if (status & 0x10000) { /* dbg */
> +		dev_warn(avd->dev, "no handler for IRQ: %3d",
> +			 status & ~0x10000);
> +		writel_relaxed(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (status & 0x1000) {
> +		/* pp is done ! we are done */
> +		state = VB2_BUF_STATE_DONE;
> +	} else if (status & 0x100) {
> +		/* a vp is done, kick the pp and hope for the best */
> +		if (ctx->coded_fmt_desc->ops->submit)
> +			ctx->coded_fmt_desc->ops->submit(ctx);
> +		goto done;
> +	} else {
> +		dev_err(avd->dev, "H%d error", status);
> +		/* let watchdog handle */
> +		goto done;
> +	}
> +
> +	/* if the watchdog_work has run the work has already been submitted */
> +	if (cancel_delayed_work(&ctx->watchdog_work))
> +		avd_job_finish(ctx, state);
> +
> +done:
> +	return IRQ_HANDLED;
> +}
> +
> +static void avd_device_run(void *priv)
> +{
> +	struct avd_ctx *ctx = priv;
> +	struct avd_dev *avd = ctx->dev;
> +	const struct avd_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> +	int ret;
> +
> +	if (WARN_ON(!desc))
> +		return;
> +
> +	ret = pm_runtime_resume_and_get(avd->dev);
> +	if (ret < 0) {
> +		avd_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
> +		return;
> +	}
> +
> +	ret = desc->ops->run(ctx);
> +	if (ret)
> +		avd_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +}
> +
> +static int avd_queue_init(void *priv, struct vb2_queue *src_vq,
> +			  struct vb2_queue *dst_vq)
> +{
> +	struct avd_ctx *ctx = priv;
> +	int ret;
> +
> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	src_vq->drv_priv = ctx;
> +	src_vq->ops = &avd_queue_ops;
> +	src_vq->mem_ops = &vb2_dma_contig_memops;
> +
> +	src_vq->dma_attrs = 0;
> +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->lock = &ctx->dev->vdev_lock;
> +	src_vq->dev = ctx->dev->v4l2_dev.dev;
> +	src_vq->supports_requests = true;
> +
> +	ret = vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	dst_vq->bidirectional = true;
> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
> +	dst_vq->dma_attrs = 0;
> +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	dst_vq->drv_priv = ctx;
> +	dst_vq->ops = &avd_queue_ops;
> +	dst_vq->buf_struct_size = sizeof(struct avd_decoded_buffer);
> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->lock = &ctx->dev->vdev_lock;
> +	dst_vq->dev = ctx->dev->v4l2_dev.dev;
> +
> +	return vb2_queue_init(dst_vq);
> +}
> +
> +static int avd_open(struct file *filp)
> +{
> +	struct avd_dev *avd = video_drvdata(filp);
> +	struct avd_ctx *ctx;
> +	int ret;
> +
> +	ctx = kzalloc_obj(*ctx, GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->dev = avd;
> +
> +	ret = avd_buf_alloc(avd, &ctx->inst, AVD_FIFO_SIZE);
> +	if (ret)
> +		goto err_free_ctx;
> +
> +	ret = avd_buf_alloc(avd, &ctx->pipe_state, 512);
> +	if (ret)
> +		goto err_free_ctx;
> +
> +	INIT_DELAYED_WORK(&ctx->watchdog_work, avd_watchdog_func);
> +
> +	avd_reset_coded_fmt(ctx);
> +	avd_reset_decoded_fmt(ctx);
> +
> +	v4l2_fh_init(&ctx->fh, video_devdata(filp));
> +
> +	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(avd->m2m_dev, ctx, avd_queue_init);
> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		ret = PTR_ERR(ctx->fh.m2m_ctx);
> +		goto err_free_ctx;
> +	}
> +
> +	ret = avd_init_ctrls(ctx);
> +	if (ret)
> +		goto err_cleanup_m2m_ctx;
> +
> +	v4l2_fh_add(&ctx->fh, filp);
> +
> +	return 0;
> +
> +err_cleanup_m2m_ctx:
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +
> +err_free_ctx:
> +	avd_buf_free(avd, &ctx->pipe_state);
> +	avd_buf_free(avd, &ctx->inst);
> +	kfree(ctx);
> +	return ret;
> +}
> +
> +static int avd_release(struct file *filp)
> +{
> +	struct avd_ctx *ctx = file_to_ctx(filp);
> +
> +	v4l2_fh_del(&ctx->fh, filp);
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> +	v4l2_fh_exit(&ctx->fh);
> +	avd_buf_free(ctx->dev, &ctx->inst);
> +	avd_buf_free(ctx->dev, &ctx->pipe_state);
> +	kfree(ctx);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations avd_fops = {
> +	.owner = THIS_MODULE,
> +	.open = avd_open,
> +	.release = avd_release,
> +	.poll = v4l2_m2m_fop_poll,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap = v4l2_m2m_fop_mmap,
> +};
> +
> +static const struct v4l2_m2m_ops avd_m2m_ops = {
> +	.device_run = avd_device_run,
> +};
> +
> +static const struct media_device_ops avd_media_ops = {
> +	.req_validate = vb2_request_validate,
> +	.req_queue = v4l2_m2m_request_queue,
> +};
> +
> +static int avd_v4l2_init(struct avd_dev *avd)
> +{
> +	int ret;
> +
> +	ret = v4l2_device_register(avd->dev, &avd->v4l2_dev);
> +	if (ret) {
> +		dev_err(avd->dev, "Failed to register V4L2 device\n");
> +		return ret;
> +	}
> +
> +	avd->m2m_dev = v4l2_m2m_init(&avd_m2m_ops);
> +	if (IS_ERR(avd->m2m_dev)) {
> +		v4l2_err(&avd->v4l2_dev, "Failed to init mem2mem device\n");
> +		ret = PTR_ERR(avd->m2m_dev);
> +		goto err_unregister_v4l2;
> +	}
> +
> +	avd->mdev.dev = avd->dev;
> +	strscpy(avd->mdev.model, "avd", sizeof(avd->mdev.model));
> +	strscpy(avd->mdev.bus_info, "platform:avd", sizeof(avd->mdev.bus_info));
> +	media_device_init(&avd->mdev);
> +	avd->mdev.ops = &avd_media_ops;
> +	avd->v4l2_dev.mdev = &avd->mdev;
> +
> +	avd->vdev.lock = &avd->vdev_lock;
> +	avd->vdev.v4l2_dev = &avd->v4l2_dev;
> +	avd->vdev.fops = &avd_fops;
> +	avd->vdev.release = video_device_release_empty;
> +	avd->vdev.vfl_dir = VFL_DIR_M2M;
> +	avd->vdev.device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
> +	avd->vdev.ioctl_ops = &avd_ioctl_ops;
> +	video_set_drvdata(&avd->vdev, avd);
> +	strscpy(avd->vdev.name, "avd", sizeof(avd->vdev.name));
> +
> +	ret = video_register_device(&avd->vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		v4l2_err(&avd->v4l2_dev, "Failed to register video device\n");
> +		goto err_cleanup_mc;
> +	}
> +
> +	ret = v4l2_m2m_register_media_controller(avd->m2m_dev, &avd->vdev,
> +						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
> +	if (ret) {
> +		v4l2_err(&avd->v4l2_dev,
> +			 "Failed to initialize V4L2 M2M media controller\n");
> +		goto err_unregister_vdev;
> +	}
> +
> +	ret = media_device_register(&avd->mdev);
> +	if (ret) {
> +		v4l2_err(&avd->v4l2_dev, "Failed to register media device\n");
> +		goto err_unregister_mc;
> +	}
> +
> +	return 0;
> +
> +err_unregister_mc:
> +	v4l2_m2m_unregister_media_controller(avd->m2m_dev);
> +
> +err_unregister_vdev:
> +	video_unregister_device(&avd->vdev);
> +
> +err_cleanup_mc:
> +	media_device_cleanup(&avd->mdev);
> +	v4l2_m2m_release(avd->m2m_dev);
> +
> +err_unregister_v4l2:
> +	v4l2_device_unregister(&avd->v4l2_dev);
> +	return ret;
> +}
> +
> +static void avd_v4l2_cleanup(struct avd_dev *avd)
> +{
> +	media_device_unregister(&avd->mdev);
> +	v4l2_m2m_unregister_media_controller(avd->m2m_dev);
> +	video_unregister_device(&avd->vdev);
> +	media_device_cleanup(&avd->mdev);
> +	v4l2_m2m_release(avd->m2m_dev);
> +	v4l2_device_unregister(&avd->v4l2_dev);
> +}
> +
> +static const struct avd_variant avd_t8103_variant = {
> +	.vp_slots = {
> +		[AVD_CODEC_HEVC] = 2, /* no sure */
> +		[AVD_CODEC_H264] = 1,
> +		[AVD_CODEC_VP9] = 1,
> +	},
> +	.fifo_slots = 7,
> +	.capabilities = AVD_CAPABILITY_HEVC |
> +			AVD_CAPABILITY_H264 |
> +			AVD_CAPABILITY_VP9,
> +	.configure_stream = t8103_configure_stream,
> +	.fw_name = "apple/avd-fw-v2-t0.bin",
> +	.revision = 3,
> +	.quirks = AVD_QUIRK_LSR | AVD_QUIRK_NO_PIPE_STATE,
> +	.vp_slot_offset = 0x4004,
> +	.submit_offset = 0x4014,
> +	.submit_queue_max_offset = 0x4018,
> +	.submit_queue_status_offset = 0x402c, /* (vp slots + 1) * 4 */
> +};
> +
> +static const struct avd_variant avd_t6000_variant = {
> +	.vp_slots = {
> +		[AVD_CODEC_HEVC] = 4,
> +		[AVD_CODEC_H264] = 4,
> +		[AVD_CODEC_VP9] = 1,
> +	},
> +	.fifo_slots = 15,
> +	.capabilities = AVD_CAPABILITY_HEVC |
> +			AVD_CAPABILITY_H264 |
> +			AVD_CAPABILITY_VP9,
> +	.configure_stream = t8112_configure_stream,
> +	.fw_name = "apple/avd-fw-v3-t0.bin",
> +	.revision = 4,
> +	.quirks = AVD_QUIRK_LSR | AVD_QUIRK_NO_PIPE_STATE,
> +	.vp_slot_offset = 0xc,
> +	.submit_offset = 0x30,
> +	.submit_queue_max_offset = 0x34,
> +	.submit_queue_status_offset = 0x5c,
> +};
> +
> +static const struct avd_variant avd_t8112_variant = {
> +	.vp_slots = {
> +		[AVD_CODEC_HEVC] = 4,
> +		[AVD_CODEC_H264] = 4,
> +		[AVD_CODEC_VP9] = 1,
> +	},
> +	.fifo_slots = 15,
> +	.capabilities = AVD_CAPABILITY_HEVC |
> +			AVD_CAPABILITY_H264 |
> +			AVD_CAPABILITY_VP9,
> +	.configure_stream = t8112_configure_stream,
> +	.fw_name = "apple/avd-fw-v3-t1.bin",
> +	.revision = 4,
> +	.quirks = AVD_QUIRK_LSR,
> +	.vp_slot_offset = 0xc,
> +	.submit_offset = 0x30,
> +	.submit_queue_max_offset = 0x34,
> +	.submit_queue_status_offset = 0x5c,
> +};
> +
> +static const struct avd_variant avd_t6020_variant = {
> +	.vp_slots = {
> +		[AVD_CODEC_HEVC] = 4,
> +		[AVD_CODEC_H264] = 4,
> +		[AVD_CODEC_VP9] = 1,
> +	},
> +	.fifo_slots = 15,
> +	.capabilities = AVD_CAPABILITY_HEVC |
> +			AVD_CAPABILITY_H264 |
> +			AVD_CAPABILITY_VP9,
> +	.configure_stream = t8112_configure_stream,
> +	.fw_name = "apple/avd-fw-v3-t1.bin",
> +	.revision = 4,
> +	.vp_slot_offset = 0xc,
> +	.submit_offset = 0x30,
> +	.submit_queue_max_offset = 0x34,
> +	.submit_queue_status_offset = 0x5c,
> +};
> +
> +static const struct avd_variant avd_t8122_variant = {
> +	.vp_slots = {
> +		[AVD_CODEC_HEVC] = 4,
> +		[AVD_CODEC_H264] = 4,
> +		[AVD_CODEC_VP9] = 1,
> +		[AVD_CODEC_AV1] = 2,
> +	},
> +	.fifo_slots = 15,
> +	.configure_stream = t8122_configure_stream,
> +	.capabilities = AVD_CAPABILITY_HEVC |
> +			AVD_CAPABILITY_H264 |
> +			AVD_CAPABILITY_VP9 |
> +			AVD_CAPABILITY_AV1,
> +	.fw_name = "apple/avd-fw-v4-t0.bin",
> +	.revision = 4,
> +	.vp_slot_offset = 0xc,
> +	.submit_offset = 0x40,
> +	.submit_queue_max_offset = 0x44,
> +	.submit_queue_status_offset = 0x7c,
> +};
> +
> +static const struct avd_variant avd_t8140_variant = {
> +	/* This is filled in using the tunables, what vp/pp to use? */
> +	.vp_slots = {
> +		[AVD_CODEC_HEVC] = 2,
> +		[AVD_CODEC_H264] = 1,
> +		[AVD_CODEC_VP9] = 1,
> +		[AVD_CODEC_AV1] = 1,
> +	},
> +	.fifo_slots = 7,
> +	.configure_stream = t8122_configure_stream,
> +	.capabilities = AVD_CAPABILITY_HEVC |
> +			AVD_CAPABILITY_H264 |
> +			AVD_CAPABILITY_VP9 |
> +			AVD_CAPABILITY_AV1,
> +	.fw_name = "apple/avd-fw-v5-t0.bin",
> +	.revision = 4,
> +	.vp_slot_offset = 0xc,
> +	.submit_offset = 0x40,
> +	.submit_queue_max_offset = 0x44,
> +	.submit_queue_status_offset = 0x7c,
> +};
> +
> +static const struct avd_variant avd_t8132_variant = {
> +	.vp_slots = {
> +		[AVD_CODEC_HEVC] = 4,
> +		[AVD_CODEC_H264] = 4,
> +		[AVD_CODEC_VP9] = 1,
> +		[AVD_CODEC_AV1] = 3,
> +	},
> +	.fifo_slots = 15,
> +	.configure_stream = t8122_configure_stream,
> +	.capabilities = AVD_CAPABILITY_HEVC |
> +			AVD_CAPABILITY_H264 |
> +			AVD_CAPABILITY_VP9 |
> +			AVD_CAPABILITY_AV1,
> +	.fw_name = "apple/avd-fw-v5-t1.bin",
> +	.revision = 4,
> +	.vp_slot_offset = 0xc,
> +	.submit_offset = 0x40,
> +	.submit_queue_max_offset = 0x44,
> +	.submit_queue_status_offset = 0x7c,
> +};
> +
> +/* can also be derived from a version register */
> +static const struct of_device_id avd_of_match[] = {
> +	{ .compatible = "apple,t8103-avd", .data = &avd_t8103_variant },
> +	{ .compatible = "apple,t6000-avd", .data = &avd_t6000_variant },
> +	{ .compatible = "apple,t8112-avd", .data = &avd_t8112_variant },
> +	{ .compatible = "apple,t6020-avd", .data = &avd_t6020_variant },
> +	{ .compatible = "apple,t8122-avd", .data = &avd_t8122_variant },
> +	{ .compatible = "apple,t8132-avd", .data = &avd_t8132_variant },
> +	{ .compatible = "apple,t8140-avd", .data = &avd_t8140_variant },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, avd_of_match);
> +
> +static int avd_probe(struct platform_device *pdev)
> +{
> +	struct avd_dev *avd;
> +	const struct of_device_id *match;
> +	int ret, irq;
> +
> +	avd = devm_kzalloc(&pdev->dev, sizeof(*avd), GFP_KERNEL);
> +	if (!avd)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, avd);
> +	avd->dev = &pdev->dev;
> +	avd->pdev = pdev;
> +
> +	mutex_init(&avd->vdev_lock);
> +
> +	match = of_match_node(avd_of_match, pdev->dev.of_node);
> +	avd->variant = match->data;

Just use the helper to get match data.

Best regards,
Krzysztof
