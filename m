Received: from outbound.pv.icloud.com (pv-2002k-snip4-2.eps.apple.com [57.103.64.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC2B47207E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789814959; cv=none; b=HMjQPi9EPKeSzhe++d8PLFqarYqA3UNYcZi0CjPWGS1XGebWuzRMxxhmLUCaH780jE9V7F41ETAIPXRwBtlgTLRi0DITCFX4C2lOfAzN4XGb3/ytGpg6InnQe2joYA2JGs9LmaJ5ZdlDBqS01ZcSLKmHxkul9HjhYZZLtjb2cHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789814959; c=relaxed/simple;
	bh=LMNkxThkIbf0moHGBy3WpI7XpVG8IxNdZE7eLCp5QT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtLqEt2tjjQofOnO98Sv9vI/+lP5Go9JhHJchofvmCfMkc/AvVVg3jwfwEb16h52E9j5eGsFYoB2Augu1pnj/qf6HqvoxiacBxiMUbsQE/nyf/dKJdhAn0foJjpdq6jn0FrOF9J5E5h7fSMju8yrT4PHPakv0r+NWmaYYCOw5yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=oRBVJ8y6; arc=none smtp.client-ip=57.103.64.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="oRBVJ8y6"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPS id B0B4C1801030;
	Sat, 19 Sep 2026 10:49:13 +0000 (UTC)
X-ICL-RepId: 01a0b948-d6b5-76e4-b2ab-c46c3c6db639
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRtEXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJCldTAQwXXB9jX2cbUEpEI2g+ch0KRhMZThtXTVAbXwJCDw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789814957; x=1792406957; bh=13jzL88KIKbF6+zInCJIZZZyVKr0mBlcmPTBdOFV7RM=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=oRBVJ8y6VCibf7y9zXBLid9M7P6QaT6aS/j0kLeUT7fWfuNjYKtVKyWhqa7xo5bYWYLdSrLZeVkzc9VZqUIu+JgkZcM3mUkRomTcBPkALAsAq9+8VpEuxv2DvpgWkzYNG5s8GpVZhX4SS5GSvX8pB2mdjLMS2ne1mfITsBa2ikXZ757IaY/wqRAYwCaEJT+UTguC5vfwglbaRHp/jLV1z214TjC1M7o3nEcmwe5BmqH9TWl0mwm7OaGdb8aJy90QczKEp7oWJiqXLwlM/ABsjmIZXAHYY1D+chZawsWEQ23m74aTvk7dYOY7/mGZHlswQsyConw+IRe1Jur4CCyEBw==
Received: from m3 (unknown [17.156.192.29])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPSA id 1A3A6180009C;
	Sat, 19 Sep 2026 10:49:09 +0000 (UTC)
Date: Sat, 19 Sep 2026 12:49:06 +0200
From: Sofus Forstreuter <sofus.c@icloud.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 10/14] media: apple: add avd driver
Message-ID: <aq5oorT4Uki2wN_U@m3>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-10-49977931f455@icloud.com>
 <3f541ef3-45ff-4800-b91f-0dfc8954f1f0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f541ef3-45ff-4800-b91f-0dfc8954f1f0@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDE1NiBTYWx0ZWRfX/zsKOZQewPLV
 8Xh7O4rJStMmKpeJIk+45fJnciqBgxmttg+7bVpjVOX1rcms1Dlz+GnM98Q3g1OuzcFIDaZPg/0
 OFMEWP18Nlb08+v3Mp9HIqv89qukNweKgaVfYp5Md4Y+oRF2L5RcUW14NZMqbmuc3uLsyrJTev4
 Jpje7UD3EG1snarr4SZ9q3nINhoumrsvJCdrZpmU9PR0Bn5otbgX3bhSOwkfS9G0kw8MfXXznik
 dGPgQzqc/vh1U/DSQP6HCbscKDHlMp3yU+t7G5hbMyY7XBUkN3BcKodaVfs3ahL3y+5ckWCedMm
 kH08DB0VfJhJFvJtMd5UX0GFS7Wkol27rIUAQuteJ/5PVhsqVSwUbLwcY59fGU=
X-Authority-Info-Out: v=2.4 cv=WYEBqkhX c=1 sm=1 tr=0 ts=6aae68aa
 cx=c_apl:c_pps:t_out a=aW9mcIavGNWWFvFFKOxBSA==:117
 a=aW9mcIavGNWWFvFFKOxBSA==:17 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=cm27Pg_UAAAA:8 a=OwpecaDxsXQD9S_tCzYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: -7q-FWrCCrErOM3o8JL_XbhxTcSiUf9l
X-Proofpoint-GUID: -7q-FWrCCrErOM3o8JL_XbhxTcSiUf9l
X-JNJ: AAAAAAABmyfXYEJ/yXIxxkorMVtInvHGjcjVULvaDtuUKkI7V2dkiKUMJnkKMLVye5GWPdLvWfypZLD7V8Gc/bNaMsj5QfGJxX4IfashfEUhjzjBFgzFarOqowgMTxygvpNggIqMv8OyCF6Xv/0YdnxJlJPotCTQGBb9O7p594DFUPF1nyRN3KHmEnL6ybRtxCdIVQ5blWK3PxVd1erOQFDl87eB8MLwla5CP68hgPuXhOWm5Y20c9xD54LI5wNPEvTPTrnLKXz1khQeXa70gxlSY3kMrpGyp+cqU4kLGxt1lyccPTcCb+4jQn4TyYqDjQ8V6rAFqIFUSufptO5Yy+yXJ9N0DtrZlA3UQEqd7bqGytmbW1Stojbu49rmMfyzVLNdVSmC7HwybOIppfM9UM1G7LzCimzjOlxUTPenq16v4TAhg/uuzIEx7jMM0U9ubKDP/PHKdrM4Oq6FqpJbd3S16tT529Y8ijsEjOfwuxbXeviEm5n0F4+weLTOwALX6FevdjuydxolF6ZatjGfEW/rIRqtkVZU90gBdb8ryVEUWV9ZpMLiR+SlyqNJrxrTMdaastCK66s9Xna3mj8cLiNoL3A/fM272nFgN5Ap8dkUDd8sMNL2vOvfa3/n47C1p/B0vTibN4WVcb291HBCzlJWDTU3+LwLj8B7FC881lWlLQz3Rv8dmwPcERQJccIxRjeDKWpGhh3qQAQv1gY/ZJlJXnaHOwugLRU7fV6kIwQ7r0UqKWDzYSXINvnbI3mEDOleKKxEEjHCXGn2WQNdsYUMviTeaSWxDKFVHHY8t5bA8RK/uCgHzKOs14siE6K6St28x61U8VpxUZ+He+8IUVIaY/s49X3giX7yRWsOaptkKPSidIxtPvgWEiwGalCdMEQDrg7FD8KlmSL/7vlehRYYO8IUxYoch0Qkgz0hQdcHHVlnsiFTKauSE0hgMHRyq8RgJ6WbrPsFV3wDktVXe0SLvmDYPMZ
 xnz3rap2AbSq0OXor499menBVDL932xcbNXltPEw6tkOh9vwpQmR4XIgpXbCICneMKCDAb6COmh8H3zLJvMSDMJjxzHUNJs11LaBujuMcwoEL5RMjp9nrCpTtFtWcjf3P3TmVuG/yCTH+uUO9rmkwKV49S/8b45k5RpbyYkuMZx1xoZYE79ExQSLuyYKaZ7iEHZ/Prg0/Eo9YBC8IpXtEdeujTZCHimMOhjJozHGWTJoHCukzwWXR3Exgt9KV7W1EZiLHace+VojEBI+Q8scPiytgt35PCpwgCM0NqvMJSsW9LElgmt5wBnfMcZOx1/WXaXBKwSYMc6skJH/ux7pZowJden5jzBEWuBF+ta0mPPoZKbsRR4gctFWr/h9cspXP9OBdaDcoj58Kv5l2aYCmDZQ5+KNnegifZ1g8qw==

Hi Krzysztof,

Thanks for the very quick review!

On Sat, Sep 19, 2026 at 08:49:13AM +0200, Krzysztof Kozlowski wrote:
> On 18/09/2026 15:15, Sofus Forstreuter wrote:
> > Add the AVD (Apple Video Decoder) driver with V4L2 M2M stateless
> > support based largely on rockchips implementation.
> > 
> > Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> 
> You order patches very odd, making it more difficult for maintainers to
> review and handle. First media patch, then DTS, then again media? No,
> DTS goes to the end, see submitting patches for DT.
> 

Sorry v2 will have the correct order: DT bindings, media and then DTS.

> > ---
> >  MAINTAINERS                                 |   1 +
> >  drivers/media/platform/Kconfig              |   1 +
> >  drivers/media/platform/Makefile             |   1 +
> >  drivers/media/platform/apple/Kconfig        |   5 +
> >  drivers/media/platform/apple/Makefile       |   3 +
> >  drivers/media/platform/apple/avd/Kconfig    |  16 +
> >  drivers/media/platform/apple/avd/Makefile   |   4 +
> >  drivers/media/platform/apple/avd/avd-drv.c  | 817 ++++++++++++++++++++++++++++
> >  drivers/media/platform/apple/avd/avd-hw.c   | 127 +++++
> >  drivers/media/platform/apple/avd/avd-inst.h | 218 ++++++++
> >  drivers/media/platform/apple/avd/avd-v4l2.c | 752 +++++++++++++++++++++++++
> >  drivers/media/platform/apple/avd/avd.h      | 273 ++++++++++
> >  12 files changed, 2218 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3c7c5fe3f0bc..6903baa15955 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2676,6 +2676,7 @@ F:	drivers/input/touchscreen/apple_z2.c
> >  F:	drivers/iommu/apple-dart.c
> >  F:	drivers/iommu/io-pgtable-dart.c
> >  F:	drivers/irqchip/irq-apple-aic.c
> > +F:	drivers/media/platform/apple/*
> >  F:	drivers/mfd/macsmc.c
> >  F:	drivers/nvme/host/apple.c
> >  F:	drivers/nvmem/apple-efuses.c
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index 2c7699b6610b..280a9db25935 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -66,6 +66,7 @@ source "drivers/media/platform/allegro-dvt/Kconfig"
> >  source "drivers/media/platform/amd/Kconfig"
> >  source "drivers/media/platform/amlogic/Kconfig"
> >  source "drivers/media/platform/amphion/Kconfig"
> > +source "drivers/media/platform/apple/Kconfig"
> >  source "drivers/media/platform/arm/Kconfig"
> >  source "drivers/media/platform/aspeed/Kconfig"
> >  source "drivers/media/platform/atmel/Kconfig"
> > diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> > index d47c47d817da..aa82e189936b 100644
> > --- a/drivers/media/platform/Makefile
> > +++ b/drivers/media/platform/Makefile
> > @@ -9,6 +9,7 @@ obj-y += allegro-dvt/
> >  obj-y += amd/
> >  obj-y += amlogic/
> >  obj-y += amphion/
> > +obj-y += apple/
> >  obj-y += arm/
> >  obj-y += aspeed/
> >  obj-y += atmel/
> > diff --git a/drivers/media/platform/apple/Kconfig b/drivers/media/platform/apple/Kconfig
> > new file mode 100644
> > index 000000000000..43c0a56c36a8
> > --- /dev/null
> > +++ b/drivers/media/platform/apple/Kconfig
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +comment "Apple media platform drivers"
> > +
> > +source "drivers/media/platform/apple/avd/Kconfig"
> > diff --git a/drivers/media/platform/apple/Makefile b/drivers/media/platform/apple/Makefile
> > new file mode 100644
> > index 000000000000..d502cab93970
> > --- /dev/null
> > +++ b/drivers/media/platform/apple/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +obj-y += avd/
> > diff --git a/drivers/media/platform/apple/avd/Kconfig b/drivers/media/platform/apple/avd/Kconfig
> > new file mode 100644
> > index 000000000000..3c41006f3a02
> > --- /dev/null
> > +++ b/drivers/media/platform/apple/avd/Kconfig
> > @@ -0,0 +1,16 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config VIDEO_APPLE_AVD
> > +	tristate "Apple Silicon Video Decoding driver"
> > +	depends on VIDEO_DEV
> > +	depends on MEDIA_CONTROLLER
> > +	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
> 
> Why this cannot be compile tested on every arch?
> 

I will fix this in v2 by casting to u64 when shifting right by 32.

> > +	depends on OF_ADDRESS
> > +	depends on V4L_PLATFORM_DRIVERS
> > +	select V4L2_MEM2MEM_DEV
> > +	select VIDEOBUF2_DMA_CONTIG
> > +	help
> > +	  Support for hardware video decoding on Apple Silicon devices using
> > +	  the Apple Video Decoder (AVD).
> > +          To compile this driver as a module, choose M here: the module will
> > +          be called apple-avd.
> > diff --git a/drivers/media/platform/apple/avd/Makefile b/drivers/media/platform/apple/avd/Makefile
> 
> Misindented.
> 

Ack

> 
> > new file mode 100644
> > index 000000000000..bcf912cfea3d
> > --- /dev/null
> > +++ b/drivers/media/platform/apple/avd/Makefile
> > @@ -0,0 +1,4 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +apple-avd-y := avd-drv.o avd-v4l2.o avd-hw.o
> > +obj-$(CONFIG_VIDEO_APPLE_AVD) += apple-avd.o
> > diff --git a/drivers/media/platform/apple/avd/avd-drv.c b/drivers/media/platform/apple/avd/avd-drv.c
> > new file mode 100644
> > index 000000000000..f6a5145c7038
> > --- /dev/null
> > +++ b/drivers/media/platform/apple/avd/avd-drv.c
> > @@ -0,0 +1,817 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Apple Video Decoder driver
> > + *
> > + * Copyright (C) 2026 The Asahi Linux Contributors
> > + * Copyright (C) 2026 Sofus Forstreuter <sofus.c@icloud.com>
> > + *
> > + * Based on rkvdec driver by Collabora, Ltd.
> > + * Copyright (C) 2019 Collabora, Ltd.
> > + * Based on rkvdec driver by Google LLC. (Tomasz Figa <tfiga@chromium.org>)
> > + * Based on s5p-mfc driver by Samsung Electronics Co., Ltd.
> > + * Copyright (C) 2011 Samsung Electronics Co., Ltd.
> 
> 
> > + */
> > +
> > +#include <linux/pm_runtime.h>
> > +#include <linux/iommu.h>
> > +#include <linux/reset.h>
> > +#include <linux/delay.h>
> > +
> > +#include <media/videobuf2-dma-contig.h>
> > +#include <media/videobuf2-v4l2.h>
> > +
> > +#include "avd.h"
> > +#include "avd-inst.h"
> > +
> > +static void calc_tile_meta(u32 w, u32 h, u32 bpb, u32 tile_dim,
> > +			   u32 meta_hdr_bytes, u32 *tile, u32 *meta)
> > +{
> > +	u32 tiles_width, tiles_height, meta_tile_w, meta_tile_h, tile_bytes;
> > +
> > +	tiles_width = DIV_ROUND_UP(w, tile_dim);
> > +	tiles_height = DIV_ROUND_UP(h, tile_dim);
> > +	tile_bytes = tile_dim * tile_dim * DIV_ROUND_UP(bpb, 8);
> > +	*tile = ALIGN(tiles_width * tiles_height * tile_bytes, 16);
> > +
> > +	meta_tile_w = roundup_pow_of_two(tiles_width);
> > +	meta_tile_h = roundup_pow_of_two(tiles_height);
> > +
> > +	*meta = ALIGN(meta_tile_w * meta_tile_h * meta_hdr_bytes, 16);
> > +}
> > +
> > +void fill_comp(struct avd_comp *comp, enum avd_image_fmt image_fmt, u32 width,
> > +	       u32 height)
> > +{
> > +	u32 y_meta, y, uv_meta, uv;
> > +	int bit_depth, vdiv, hdiv = 2;
> > +
> > +	switch (image_fmt) {
> > +	case AVD_IMG_FMT_420_10BIT:
> > +	case AVD_IMG_FMT_422_10BIT:
> > +		bit_depth = 10;
> > +		break;
> > +	default:
> > +		bit_depth = 8;
> > +		break;
> > +	}
> > +
> > +	switch (image_fmt) {
> > +	case AVD_IMG_FMT_420_10BIT:
> > +	case AVD_IMG_FMT_420_8BIT:
> > +		vdiv = 2;
> > +		break;
> > +	default:
> > +		vdiv = 1;
> > +		break;
> > +	}
> > +
> > +	/* y has 32x32 tiles and 32 bytes of metadata per tile */
> > +	calc_tile_meta(width, height, bit_depth, 32, 32, &y, &y_meta);
> > +	/* uv has 16x16 tiles and 8 bytes of metadata per tile */
> > +	calc_tile_meta(width / vdiv, height / hdiv, bit_depth * 2, 16, 8, &uv,
> > +		       &uv_meta);
> > +
> > +	/* output like DCP driver expects */
> > +	comp->offsets[0] = y;
> > +	comp->offsets[1] = 0;
> > +	comp->offsets[2] = y + y_meta + uv;
> > +	comp->offsets[3] = y + y_meta;
> > +
> > +	comp->size = y_meta + y + uv_meta + uv;
> > +}
> > +
> > +int avd_buf_alloc(struct avd_dev *avd, struct avd_buf *buf, size_t size)
> > +{
> > +	if (!buf->cpu && size < buf->size)
> > +		return 0;
> > +	else if (buf->cpu)
> > +		avd_buf_free(avd, buf);
> > +
> > +	if (size <= 0)
> > +		return -ENOMEM;
> > +
> > +	buf->size = size;
> > +	buf->cpu =
> > +		dma_alloc_coherent(avd->dev, buf->size, &buf->addr, GFP_KERNEL);
> > +	return buf->cpu ? 0 : -ENOMEM;
> > +}
> > +
> > +void avd_buf_free(struct avd_dev *avd, struct avd_buf *buf)
> > +{
> > +	if (buf->cpu)
> > +		dma_free_coherent(avd->dev, buf->size, buf->cpu, buf->addr);
> > +	memset(buf, 0, sizeof(*buf));
> > +}
> > +
> > +struct avd_decoded_buffer *
> > +avd_get_ref_buf(struct avd_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp)
> > +{
> > +	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> > +	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
> > +	struct vb2_buffer *buf;
> > +
> > +	/*
> > +	 * If a ref is unused or invalid, address of current destination
> > +	 * buffer is returned.
> > +	 */
> > +	buf = vb2_find_buffer(cap_q, timestamp);
> > +	if (!buf)
> > +		buf = &dst->vb2_buf;
> > +
> > +	return vb2_to_avd_decoded_buf(buf);
> > +}
> > +
> > +static int avd_wait_submission_queue(struct avd_ctx *ctx, int vp)
> > +{
> > +	struct avd_dev *avd = ctx->dev;
> > +	u32 max = readl_relaxed(avd->ctrl +
> > +				avd->variant->submit_queue_max_offset + vp * 4);
> > +	u32 cur = readl_relaxed(avd->ctrl +
> > +				avd->variant->submit_queue_status_offset + vp * 4);
> > +
> > +	if (cur == max) {
> > +		dev_err(avd->dev, "instruction que full! %d/%d", cur, max);
> > +		return 1;
> > +	}
> > +
> > +	if (cur >= max / 2) {
> > +		/* TODO: to high? low? Has weird side effects??? */
> > +		usleep_range(500, 650);
> > +	}
> > +	return 0;
> > +}
> > +
> > +int avd_init_job(struct avd_ctx *ctx, enum avd_codec codec, size_t segments)
> > +{
> > +	int ret = 0;
> > +	struct avd_job *job = &ctx->job;
> > +
> > +	job->codec = codec;
> > +	job->num = 0;
> > +	job->segments = kzalloc_objs(*job->segments, segments, GFP_KERNEL);
> > +	if (!job->segments)
> > +		ret = -ENOMEM;
> > +	return ret;
> > +}
> > +
> > +int avd_submit_job(struct avd_ctx *ctx)
> > +{
> > +	struct avd_dev *avd = ctx->dev;
> > +	struct avd_job *sub = &ctx->job;
> > +	struct avd_segment *seg;
> > +	int i, idx = 0, vp = 0;
> > +	void __iomem *reg;
> > +	u32 exec_mask = sub->codec == AVD_CODEC_VP9 &&
> > +					avd->variant->revision == 3 ?
> > +				AVD_OP_EXEC_REV3_VP9_MASK :
> > +				0;
> > +	u32 exec_rev_flag =
> > +		AVD_OP_EXEC_FLAG_START_REV4(avd->variant->revision == 4) |
> > +		AVD_OP_EXEC_FLAG_START_REV3(avd->variant->revision == 3);
> > +
> > +	ctx->fifo_idx = 0;
> > +	for (i = 0; i < sub->codec; i++)
> > +		vp += avd->variant->vp_slots[i];
> > +
> > +	schedule_delayed_work(&ctx->watchdog_work, msecs_to_jiffies(2000));
> > +	avd->variant->configure_stream(avd, ctx->inst.addr, ctx->fifo_idx, vp);
> > +	reg = avd->ctrl + avd->variant->vp_slot_offset + vp * 4;
> > +
> > +	/* the first segment is always the header (needs special handling) */
> > +
> > +	writel(AVD_OP_EXEC | exec_mask | exec_rev_flag |
> > +		       AVD_OP_EXEC_FIFO_IDX(ctx->fifo_idx),
> > +	       reg);
> > +	seg = &sub->segments[idx++];
> > +	for (i = 0; i < seg->num; i++)
> > +		writel(seg->instructions[i], reg);
> > +	for (; idx <= sub->num; idx++) {
> > +		seg = &sub->segments[idx];
> > +		for (i = 0; i < seg->num; i++)
> > +			writel(seg->instructions[i], reg);
> > +		if (avd_wait_submission_queue(ctx, vp))
> > +			break;
> > +		writel(AVD_OP_EXEC | exec_mask |
> > +			       AVD_OP_EXEC_FLAG_END(idx == sub->num),
> > +		       reg);
> > +	}
> > +
> > +	kfree(sub->segments);
> > +	sub->segments = NULL;
> > +	return 0;
> > +}
> > +
> > +static int avd_reset(struct avd_dev *avd)
> > +{
> > +	int ret = 0;
> > +
> > +	ret = pm_runtime_resume_and_get(avd->dev);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = reset_control_reset(avd->rstc);
> > +	if (ret)
> > +		dev_err(avd->dev, "reset: failed: %d", ret);
> > +
> > +	if (avd->empty_domain) {
> > +		iommu_attach_device(avd->empty_domain, avd->dev);
> > +		iommu_detach_device(avd->empty_domain, avd->dev);
> > +	}
> > +
> > +	ret = avd_boot(avd);
> > +	if (ret)
> > +		dev_err(avd->dev, "reset: failed to boot");
> > +
> > +	pm_runtime_put_autosuspend(avd->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static void avd_watchdog_func(struct work_struct *work)
> > +{
> > +	struct avd_dev *avd;
> > +	struct avd_ctx *ctx;
> > +	int ret;
> > +
> > +	ctx = container_of(to_delayed_work(work), struct avd_ctx,
> > +			   watchdog_work);
> > +	if (!ctx)
> > +		return;
> > +
> > +	avd = ctx->dev;
> > +
> > +	dev_err(avd->dev, "Frame processing timed out!");
> > +
> > +	writel(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
> > +	ret = avd_reset(avd);
> > +	if (ret)
> > +		dev_err(avd->dev, "failed to reset: %d", ret);
> > +
> > +	avd_job_finish(ctx, VB2_BUF_STATE_ERROR);
> > +}
> > +
> > +static irqreturn_t avd_irq_handler(int irq, void *data)
> > +{
> > +	struct avd_dev *avd = data;
> > +	struct avd_ctx *ctx = v4l2_m2m_get_curr_priv(avd->m2m_dev);
> > +	enum vb2_buffer_state state;
> > +	u32 status;
> > +
> > +	if (!ctx)
> > +		return IRQ_HANDLED;
> > +
> > +	status = readl(avd->mbox + AVD_REG_MBOX1_RETRIEVE);
> > +
> > +	writel(AVD_MBOX1_NOT_EMPTY, avd->mbox + AVD_REG_MBOX_IRQ_CLR);
> > +
> > +	if (status & 0x10000) { /* dbg */
> > +		dev_warn(avd->dev, "no handler for IRQ: %3d",
> > +			 status & ~0x10000);
> > +		writel_relaxed(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	if (status & 0x1000) {
> > +		/* pp is done ! we are done */
> > +		state = VB2_BUF_STATE_DONE;
> > +	} else if (status & 0x100) {
> > +		/* a vp is done, kick the pp and hope for the best */
> > +		if (ctx->coded_fmt_desc->ops->submit)
> > +			ctx->coded_fmt_desc->ops->submit(ctx);
> > +		goto done;
> > +	} else {
> > +		dev_err(avd->dev, "H%d error", status);
> > +		/* let watchdog handle */
> > +		goto done;
> > +	}
> > +
> > +	/* if the watchdog_work has run the work has already been submitted */
> > +	if (cancel_delayed_work(&ctx->watchdog_work))
> > +		avd_job_finish(ctx, state);
> > +
> > +done:
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static void avd_device_run(void *priv)
> > +{
> > +	struct avd_ctx *ctx = priv;
> > +	struct avd_dev *avd = ctx->dev;
> > +	const struct avd_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> > +	int ret;
> > +
> > +	if (WARN_ON(!desc))
> > +		return;
> > +
> > +	ret = pm_runtime_resume_and_get(avd->dev);
> > +	if (ret < 0) {
> > +		avd_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
> > +		return;
> > +	}
> > +
> > +	ret = desc->ops->run(ctx);
> > +	if (ret)
> > +		avd_job_finish(ctx, VB2_BUF_STATE_ERROR);
> > +}
> > +
> > +static int avd_queue_init(void *priv, struct vb2_queue *src_vq,
> > +			  struct vb2_queue *dst_vq)
> > +{
> > +	struct avd_ctx *ctx = priv;
> > +	int ret;
> > +
> > +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> > +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> > +	src_vq->drv_priv = ctx;
> > +	src_vq->ops = &avd_queue_ops;
> > +	src_vq->mem_ops = &vb2_dma_contig_memops;
> > +
> > +	src_vq->dma_attrs = 0;
> > +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> > +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > +	src_vq->lock = &ctx->dev->vdev_lock;
> > +	src_vq->dev = ctx->dev->v4l2_dev.dev;
> > +	src_vq->supports_requests = true;
> > +
> > +	ret = vb2_queue_init(src_vq);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dst_vq->bidirectional = true;
> > +	dst_vq->mem_ops = &vb2_dma_contig_memops;
> > +	dst_vq->dma_attrs = 0;
> > +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> > +	dst_vq->drv_priv = ctx;
> > +	dst_vq->ops = &avd_queue_ops;
> > +	dst_vq->buf_struct_size = sizeof(struct avd_decoded_buffer);
> > +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > +	dst_vq->lock = &ctx->dev->vdev_lock;
> > +	dst_vq->dev = ctx->dev->v4l2_dev.dev;
> > +
> > +	return vb2_queue_init(dst_vq);
> > +}
> > +
> > +static int avd_open(struct file *filp)
> > +{
> > +	struct avd_dev *avd = video_drvdata(filp);
> > +	struct avd_ctx *ctx;
> > +	int ret;
> > +
> > +	ctx = kzalloc_obj(*ctx, GFP_KERNEL);
> > +	if (!ctx)
> > +		return -ENOMEM;
> > +
> > +	ctx->dev = avd;
> > +
> > +	ret = avd_buf_alloc(avd, &ctx->inst, AVD_FIFO_SIZE);
> > +	if (ret)
> > +		goto err_free_ctx;
> > +
> > +	ret = avd_buf_alloc(avd, &ctx->pipe_state, 512);
> > +	if (ret)
> > +		goto err_free_ctx;
> > +
> > +	INIT_DELAYED_WORK(&ctx->watchdog_work, avd_watchdog_func);
> > +
> > +	avd_reset_coded_fmt(ctx);
> > +	avd_reset_decoded_fmt(ctx);
> > +
> > +	v4l2_fh_init(&ctx->fh, video_devdata(filp));
> > +
> > +	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(avd->m2m_dev, ctx, avd_queue_init);
> > +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> > +		ret = PTR_ERR(ctx->fh.m2m_ctx);
> > +		goto err_free_ctx;
> > +	}
> > +
> > +	ret = avd_init_ctrls(ctx);
> > +	if (ret)
> > +		goto err_cleanup_m2m_ctx;
> > +
> > +	v4l2_fh_add(&ctx->fh, filp);
> > +
> > +	return 0;
> > +
> > +err_cleanup_m2m_ctx:
> > +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> > +
> > +err_free_ctx:
> > +	avd_buf_free(avd, &ctx->pipe_state);
> > +	avd_buf_free(avd, &ctx->inst);
> > +	kfree(ctx);
> > +	return ret;
> > +}
> > +
> > +static int avd_release(struct file *filp)
> > +{
> > +	struct avd_ctx *ctx = file_to_ctx(filp);
> > +
> > +	v4l2_fh_del(&ctx->fh, filp);
> > +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> > +	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> > +	v4l2_fh_exit(&ctx->fh);
> > +	avd_buf_free(ctx->dev, &ctx->inst);
> > +	avd_buf_free(ctx->dev, &ctx->pipe_state);
> > +	kfree(ctx);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_file_operations avd_fops = {
> > +	.owner = THIS_MODULE,
> > +	.open = avd_open,
> > +	.release = avd_release,
> > +	.poll = v4l2_m2m_fop_poll,
> > +	.unlocked_ioctl = video_ioctl2,
> > +	.mmap = v4l2_m2m_fop_mmap,
> > +};
> > +
> > +static const struct v4l2_m2m_ops avd_m2m_ops = {
> > +	.device_run = avd_device_run,
> > +};
> > +
> > +static const struct media_device_ops avd_media_ops = {
> > +	.req_validate = vb2_request_validate,
> > +	.req_queue = v4l2_m2m_request_queue,
> > +};
> > +
> > +static int avd_v4l2_init(struct avd_dev *avd)
> > +{
> > +	int ret;
> > +
> > +	ret = v4l2_device_register(avd->dev, &avd->v4l2_dev);
> > +	if (ret) {
> > +		dev_err(avd->dev, "Failed to register V4L2 device\n");
> > +		return ret;
> > +	}
> > +
> > +	avd->m2m_dev = v4l2_m2m_init(&avd_m2m_ops);
> > +	if (IS_ERR(avd->m2m_dev)) {
> > +		v4l2_err(&avd->v4l2_dev, "Failed to init mem2mem device\n");
> > +		ret = PTR_ERR(avd->m2m_dev);
> > +		goto err_unregister_v4l2;
> > +	}
> > +
> > +	avd->mdev.dev = avd->dev;
> > +	strscpy(avd->mdev.model, "avd", sizeof(avd->mdev.model));
> > +	strscpy(avd->mdev.bus_info, "platform:avd", sizeof(avd->mdev.bus_info));
> > +	media_device_init(&avd->mdev);
> > +	avd->mdev.ops = &avd_media_ops;
> > +	avd->v4l2_dev.mdev = &avd->mdev;
> > +
> > +	avd->vdev.lock = &avd->vdev_lock;
> > +	avd->vdev.v4l2_dev = &avd->v4l2_dev;
> > +	avd->vdev.fops = &avd_fops;
> > +	avd->vdev.release = video_device_release_empty;
> > +	avd->vdev.vfl_dir = VFL_DIR_M2M;
> > +	avd->vdev.device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
> > +	avd->vdev.ioctl_ops = &avd_ioctl_ops;
> > +	video_set_drvdata(&avd->vdev, avd);
> > +	strscpy(avd->vdev.name, "avd", sizeof(avd->vdev.name));
> > +
> > +	ret = video_register_device(&avd->vdev, VFL_TYPE_VIDEO, -1);
> > +	if (ret) {
> > +		v4l2_err(&avd->v4l2_dev, "Failed to register video device\n");
> > +		goto err_cleanup_mc;
> > +	}
> > +
> > +	ret = v4l2_m2m_register_media_controller(avd->m2m_dev, &avd->vdev,
> > +						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
> > +	if (ret) {
> > +		v4l2_err(&avd->v4l2_dev,
> > +			 "Failed to initialize V4L2 M2M media controller\n");
> > +		goto err_unregister_vdev;
> > +	}
> > +
> > +	ret = media_device_register(&avd->mdev);
> > +	if (ret) {
> > +		v4l2_err(&avd->v4l2_dev, "Failed to register media device\n");
> > +		goto err_unregister_mc;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_unregister_mc:
> > +	v4l2_m2m_unregister_media_controller(avd->m2m_dev);
> > +
> > +err_unregister_vdev:
> > +	video_unregister_device(&avd->vdev);
> > +
> > +err_cleanup_mc:
> > +	media_device_cleanup(&avd->mdev);
> > +	v4l2_m2m_release(avd->m2m_dev);
> > +
> > +err_unregister_v4l2:
> > +	v4l2_device_unregister(&avd->v4l2_dev);
> > +	return ret;
> > +}
> > +
> > +static void avd_v4l2_cleanup(struct avd_dev *avd)
> > +{
> > +	media_device_unregister(&avd->mdev);
> > +	v4l2_m2m_unregister_media_controller(avd->m2m_dev);
> > +	video_unregister_device(&avd->vdev);
> > +	media_device_cleanup(&avd->mdev);
> > +	v4l2_m2m_release(avd->m2m_dev);
> > +	v4l2_device_unregister(&avd->v4l2_dev);
> > +}
> > +
> > +static const struct avd_variant avd_t8103_variant = {
> > +	.vp_slots = {
> > +		[AVD_CODEC_HEVC] = 2, /* no sure */
> > +		[AVD_CODEC_H264] = 1,
> > +		[AVD_CODEC_VP9] = 1,
> > +	},
> > +	.fifo_slots = 7,
> > +	.capabilities = AVD_CAPABILITY_HEVC |
> > +			AVD_CAPABILITY_H264 |
> > +			AVD_CAPABILITY_VP9,
> > +	.configure_stream = t8103_configure_stream,
> > +	.fw_name = "apple/avd-fw-v2-t0.bin",
> > +	.revision = 3,
> > +	.quirks = AVD_QUIRK_LSR | AVD_QUIRK_NO_PIPE_STATE,
> > +	.vp_slot_offset = 0x4004,
> > +	.submit_offset = 0x4014,
> > +	.submit_queue_max_offset = 0x4018,
> > +	.submit_queue_status_offset = 0x402c, /* (vp slots + 1) * 4 */
> > +};
> > +
> > +static const struct avd_variant avd_t6000_variant = {
> > +	.vp_slots = {
> > +		[AVD_CODEC_HEVC] = 4,
> > +		[AVD_CODEC_H264] = 4,
> > +		[AVD_CODEC_VP9] = 1,
> > +	},
> > +	.fifo_slots = 15,
> > +	.capabilities = AVD_CAPABILITY_HEVC |
> > +			AVD_CAPABILITY_H264 |
> > +			AVD_CAPABILITY_VP9,
> > +	.configure_stream = t8112_configure_stream,
> > +	.fw_name = "apple/avd-fw-v3-t0.bin",
> > +	.revision = 4,
> > +	.quirks = AVD_QUIRK_LSR | AVD_QUIRK_NO_PIPE_STATE,
> > +	.vp_slot_offset = 0xc,
> > +	.submit_offset = 0x30,
> > +	.submit_queue_max_offset = 0x34,
> > +	.submit_queue_status_offset = 0x5c,
> > +};
> > +
> > +static const struct avd_variant avd_t8112_variant = {
> > +	.vp_slots = {
> > +		[AVD_CODEC_HEVC] = 4,
> > +		[AVD_CODEC_H264] = 4,
> > +		[AVD_CODEC_VP9] = 1,
> > +	},
> > +	.fifo_slots = 15,
> > +	.capabilities = AVD_CAPABILITY_HEVC |
> > +			AVD_CAPABILITY_H264 |
> > +			AVD_CAPABILITY_VP9,
> > +	.configure_stream = t8112_configure_stream,
> > +	.fw_name = "apple/avd-fw-v3-t1.bin",
> > +	.revision = 4,
> > +	.quirks = AVD_QUIRK_LSR,
> > +	.vp_slot_offset = 0xc,
> > +	.submit_offset = 0x30,
> > +	.submit_queue_max_offset = 0x34,
> > +	.submit_queue_status_offset = 0x5c,
> > +};
> > +
> > +static const struct avd_variant avd_t6020_variant = {
> > +	.vp_slots = {
> > +		[AVD_CODEC_HEVC] = 4,
> > +		[AVD_CODEC_H264] = 4,
> > +		[AVD_CODEC_VP9] = 1,
> > +	},
> > +	.fifo_slots = 15,
> > +	.capabilities = AVD_CAPABILITY_HEVC |
> > +			AVD_CAPABILITY_H264 |
> > +			AVD_CAPABILITY_VP9,
> > +	.configure_stream = t8112_configure_stream,
> > +	.fw_name = "apple/avd-fw-v3-t1.bin",
> > +	.revision = 4,
> > +	.vp_slot_offset = 0xc,
> > +	.submit_offset = 0x30,
> > +	.submit_queue_max_offset = 0x34,
> > +	.submit_queue_status_offset = 0x5c,
> > +};
> > +
> > +static const struct avd_variant avd_t8122_variant = {
> > +	.vp_slots = {
> > +		[AVD_CODEC_HEVC] = 4,
> > +		[AVD_CODEC_H264] = 4,
> > +		[AVD_CODEC_VP9] = 1,
> > +		[AVD_CODEC_AV1] = 2,
> > +	},
> > +	.fifo_slots = 15,
> > +	.configure_stream = t8122_configure_stream,
> > +	.capabilities = AVD_CAPABILITY_HEVC |
> > +			AVD_CAPABILITY_H264 |
> > +			AVD_CAPABILITY_VP9 |
> > +			AVD_CAPABILITY_AV1,
> > +	.fw_name = "apple/avd-fw-v4-t0.bin",
> > +	.revision = 4,
> > +	.vp_slot_offset = 0xc,
> > +	.submit_offset = 0x40,
> > +	.submit_queue_max_offset = 0x44,
> > +	.submit_queue_status_offset = 0x7c,
> > +};
> > +
> > +static const struct avd_variant avd_t8140_variant = {
> > +	/* This is filled in using the tunables, what vp/pp to use? */
> > +	.vp_slots = {
> > +		[AVD_CODEC_HEVC] = 2,
> > +		[AVD_CODEC_H264] = 1,
> > +		[AVD_CODEC_VP9] = 1,
> > +		[AVD_CODEC_AV1] = 1,
> > +	},
> > +	.fifo_slots = 7,
> > +	.configure_stream = t8122_configure_stream,
> > +	.capabilities = AVD_CAPABILITY_HEVC |
> > +			AVD_CAPABILITY_H264 |
> > +			AVD_CAPABILITY_VP9 |
> > +			AVD_CAPABILITY_AV1,
> > +	.fw_name = "apple/avd-fw-v5-t0.bin",
> > +	.revision = 4,
> > +	.vp_slot_offset = 0xc,
> > +	.submit_offset = 0x40,
> > +	.submit_queue_max_offset = 0x44,
> > +	.submit_queue_status_offset = 0x7c,
> > +};
> > +
> > +static const struct avd_variant avd_t8132_variant = {
> > +	.vp_slots = {
> > +		[AVD_CODEC_HEVC] = 4,
> > +		[AVD_CODEC_H264] = 4,
> > +		[AVD_CODEC_VP9] = 1,
> > +		[AVD_CODEC_AV1] = 3,
> > +	},
> > +	.fifo_slots = 15,
> > +	.configure_stream = t8122_configure_stream,
> > +	.capabilities = AVD_CAPABILITY_HEVC |
> > +			AVD_CAPABILITY_H264 |
> > +			AVD_CAPABILITY_VP9 |
> > +			AVD_CAPABILITY_AV1,
> > +	.fw_name = "apple/avd-fw-v5-t1.bin",
> > +	.revision = 4,
> > +	.vp_slot_offset = 0xc,
> > +	.submit_offset = 0x40,
> > +	.submit_queue_max_offset = 0x44,
> > +	.submit_queue_status_offset = 0x7c,
> > +};
> > +
> > +/* can also be derived from a version register */
> > +static const struct of_device_id avd_of_match[] = {
> > +	{ .compatible = "apple,t8103-avd", .data = &avd_t8103_variant },
> > +	{ .compatible = "apple,t6000-avd", .data = &avd_t6000_variant },
> > +	{ .compatible = "apple,t8112-avd", .data = &avd_t8112_variant },
> > +	{ .compatible = "apple,t6020-avd", .data = &avd_t6020_variant },
> > +	{ .compatible = "apple,t8122-avd", .data = &avd_t8122_variant },
> > +	{ .compatible = "apple,t8132-avd", .data = &avd_t8132_variant },
> > +	{ .compatible = "apple,t8140-avd", .data = &avd_t8140_variant },
> > +	{},
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, avd_of_match);
> > +
> > +static int avd_probe(struct platform_device *pdev)
> > +{
> > +	struct avd_dev *avd;
> > +	const struct of_device_id *match;
> > +	int ret, irq;
> > +
> > +	avd = devm_kzalloc(&pdev->dev, sizeof(*avd), GFP_KERNEL);
> > +	if (!avd)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, avd);
> > +	avd->dev = &pdev->dev;
> > +	avd->pdev = pdev;
> > +
> > +	mutex_init(&avd->vdev_lock);
> > +
> > +	match = of_match_node(avd_of_match, pdev->dev.of_node);
> > +	avd->variant = match->data;
> 
> Just use the helper to get match data.
> 

Ack

Thanks,
Sofus
