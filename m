Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322563C3F7C;
	Thu, 10 Sep 2026 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025135; cv=none; b=lhgu9K39T46FMbMDOOVovcP5vTQ3Ad+U2tf1e6X/zRnrvUhG92tLWqF/Ok/VY9YXwxZbWS+EXSyZEiqdlNo4i2ULB/VdX+gPkIDL0s+bk+dpHGEDr7bSI4gGQM4DG0zYQpQvhB89WJPs/E0cjR4dFIMGZY3XMa4JDcU2pKJ/Vuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025135; c=relaxed/simple;
	bh=ahUWNle7AF59lnBCQJ26/yG8CqCC1fFevRF8kCaZL0c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NyqpjSb6CfcgepcyAfv+eYWZiORVgOQAuaAuXTRIa9eDeJAFRwfahH0T1R3qc7dd4iKwDYmsffm70zkrivhNd3JCtn42IkX2hxaBO/QNThsXGsrVMzB7ierD5hCKKtWJqFyuM3YAqBuLReN1a/HqLK9jWMVvbC5Hkw7bK+8/pTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.66])
	by APP-01 (Coremail) with SMTP id qwCowAD3y+9cW6JqR4qWBw--.18774S2;
	Thu, 10 Sep 2026 15:25:17 +0800 (CST)
Message-ID: <e66fdb299d87ffdfea1c871cfeab88eeed7755ce.camel@iscas.ac.cn>
Subject: Re: [PATCH v6 4/6] drm/verisilicon: add DC8000 (DCUltraLite)
 display controller support
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Joey Lu <a0987203069@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 10 Sep 2026 15:25:16 +0800
In-Reply-To: <20260908092840.225220-5-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
	 <20260908092840.225220-5-a0987203069@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:qwCowAD3y+9cW6JqR4qWBw--.18774S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFyfCFW5Ar1fJF18tryxXwb_yoWxGw45pF
	4jyay8WrWUXay29r97tFy8tF90kw1xtw4fGrZ7G34avrn8tF98WFW8XFyUZaykWrZrJF12
	vFs2gr47Cr42v3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU2wIDUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-09-08=E4=BA=8C=E7=9A=84 17:28 +0800=EF=BC=8CJoey Lu=E5=86=99=
=E9=81=93=EF=BC=9A
> The Verisilicon DC IP family also ships in a DCUltraLite (DC8000
> generation) configuration that lacks the DC8200's CONFIG_EX staging
> registers and PANEL_START sync register, and exposes its VSYNC
> interrupt through a differently laid out status/enable register pair.
>=20
> Add a vs_dc_funcs implementation for the DC8000 generation in
> vs_dc8000.c: framebuffer updates are latched directly through
> FB_CONFIG's enable/reset/valid bits instead of a staging commit,
> panel
> output starts as soon as PANEL_CONFIG.RUNNING is set with no separate
> sync register to arm, and the VSYNC interrupt is acknowledged through
> DISP_IRQ_STA/DISP_IRQ_EN.=C2=A0 Select this vtable in the probe path base=
d
> on the chip identity's generation field.
>=20
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Thanks,
Icenowy

> ---
> =C2=A0drivers/gpu/drm/verisilicon/Makefile=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/verisilicon/vs_dc.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 5 +-
> =C2=A0drivers/gpu/drm/verisilicon/vs_dc.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
> =C2=A0drivers/gpu/drm/verisilicon/vs_dc8000.c | 92
> +++++++++++++++++++++++++
> =C2=A04 files changed, 98 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c
>=20
> diff --git a/drivers/gpu/drm/verisilicon/Makefile
> b/drivers/gpu/drm/verisilicon/Makefile
> index 9d4cd16452fa1..d2fd8e4dff242 100644
> --- a/drivers/gpu/drm/verisilicon/Makefile
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -1,6 +1,6 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> =C2=A0
> -verisilicon-dc-objs :=3D vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
> vs_drm.o vs_hwdb.o \
> +verisilicon-dc-objs :=3D vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
> vs_dc8000.o vs_drm.o vs_hwdb.o \
> =C2=A0	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
> =C2=A0
> =C2=A0obj-$(CONFIG_DRM_VERISILICON_DC) +=3D verisilicon-dc.o
> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
> b/drivers/gpu/drm/verisilicon/vs_dc.c
> index 9729b693d360e..3e9e2c0264f5d 100644
> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
> @@ -134,7 +134,10 @@ static int vs_dc_probe(struct platform_device
> *pdev)
> =C2=A0	dev_info(dev, "Found DC%x rev %x customer %x\n", dc-
> >identity.model,
> =C2=A0		 dc->identity.revision, dc->identity.customer_id);
> =C2=A0
> -	dc->funcs =3D &vs_dc8200_funcs;
> +	if (dc->identity.generation =3D=3D VSDC_GEN_DC8200)
> +		dc->funcs =3D &vs_dc8200_funcs;
> +	else
> +		dc->funcs =3D &vs_dc8000_funcs;
> =C2=A0
> =C2=A0	if (port_count > dc->identity.display_count) {
> =C2=A0		dev_err(dev, "too many downstream ports than HW
> capability\n");
> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h
> b/drivers/gpu/drm/verisilicon/vs_dc.h
> index 825f5dd6bf174..ac96ad7011994 100644
> --- a/drivers/gpu/drm/verisilicon/vs_dc.h
> +++ b/drivers/gpu/drm/verisilicon/vs_dc.h
> @@ -66,5 +66,6 @@ struct vs_dc {
> =C2=A0};
> =C2=A0
> =C2=A0extern const struct vs_dc_funcs vs_dc8200_funcs;
> +extern const struct vs_dc_funcs vs_dc8000_funcs;
> =C2=A0
> =C2=A0#endif /* _VS_DC_H_ */
> diff --git a/drivers/gpu/drm/verisilicon/vs_dc8000.c
> b/drivers/gpu/drm/verisilicon/vs_dc8000.c
> new file mode 100644
> index 0000000000000..df7bd5bdd7f2a
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_dc8000.c
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Joey Lu <yclu4@nuvoton.com>
> + */
> +
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "vs_crtc_regs.h"
> +#include "vs_dc.h"
> +#include "vs_drm.h"
> +#include "vs_primary_plane_regs.h"
> +
> +static void vs_dc8000_panel_enable_ex(struct vs_dc *dc, unsigned int
> output)
> +{
> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			VSDC_FB_CONFIG_RESET);
> +}
> +
> +static void vs_dc8000_panel_disable_ex(struct vs_dc *dc, unsigned
> int output)
> +{
> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			=C2=A0 VSDC_FB_CONFIG_RESET);
> +}
> +
> +static void vs_dc8000_crtc_begin(struct vs_dc *dc, unsigned int
> output)
> +{
> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			VSDC_FB_CONFIG_VALID);
> +}
> +
> +static void vs_dc8000_crtc_flush(struct vs_dc *dc, unsigned int
> output)
> +{
> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			=C2=A0 VSDC_FB_CONFIG_VALID);
> +}
> +
> +static void vs_dc8000_crtc_enable_ex(struct vs_dc *dc, unsigned int
> output)
> +{
> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			VSDC_FB_CONFIG_ENABLE);
> +}
> +
> +static void vs_dc8000_crtc_disable_ex(struct vs_dc *dc, unsigned int
> output)
> +{
> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			=C2=A0 VSDC_FB_CONFIG_ENABLE);
> +}
> +
> +static void vs_dc8000_enable_vblank(struct vs_dc *dc, unsigned int
> output)
> +{
> +	regmap_set_bits(dc->regs, VSDC_DISP_IRQ_EN,
> +			VSDC_DISP_IRQ_VSYNC(output));
> +}
> +
> +static void vs_dc8000_disable_vblank(struct vs_dc *dc, unsigned int
> output)
> +{
> +	regmap_clear_bits(dc->regs, VSDC_DISP_IRQ_EN,
> +			=C2=A0 VSDC_DISP_IRQ_VSYNC(output));
> +}
> +
> +static u32 vs_dc8000_irq_ack(struct vs_dc *dc)
> +{
> +	u32 hw_irqs, unified =3D 0, known =3D 0;
> +	unsigned int i;
> +
> +	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &hw_irqs);
> +
> +	for (i =3D 0; i < VSDC_MAX_OUTPUTS; i++) {
> +		known |=3D VSDC_DISP_IRQ_VSYNC(i);
> +		if (hw_irqs & VSDC_DISP_IRQ_VSYNC(i))
> +			unified |=3D VSDC_IRQ_VSYNC(i);
> +	}
> +
> +	drm_WARN_ONCE(&dc->drm_dev->base, hw_irqs & ~known,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Unknown hardware IRQ bits: %#x\n", hw_=
irqs &
> ~known);
> +
> +	return unified;
> +}
> +
> +const struct vs_dc_funcs vs_dc8000_funcs =3D {
> +	.panel_enable_ex	=3D vs_dc8000_panel_enable_ex,
> +	.panel_disable_ex	=3D vs_dc8000_panel_disable_ex,
> +	.crtc_begin		=3D vs_dc8000_crtc_begin,
> +	.crtc_flush		=3D vs_dc8000_crtc_flush,
> +	.crtc_enable_ex		=3D vs_dc8000_crtc_enable_ex,
> +	.crtc_disable_ex	=3D vs_dc8000_crtc_disable_ex,
> +	.enable_vblank		=3D vs_dc8000_enable_vblank,
> +	.disable_vblank		=3D vs_dc8000_disable_vblank,
> +	.irq_ack		=3D vs_dc8000_irq_ack,
> +};

