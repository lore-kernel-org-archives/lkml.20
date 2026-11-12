Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508385;
	b=Z571KXH4IicV+kAbm0UTXYtfox5BP84xgOC8x/NCJ9vGjOUHgEMP2/gdaZyZKFZ/C9b2
	 gmDUTOBgUEzIJsJvNuCQt02ttlDY2+CpTDRSb9wpEphV93AFWABaO9ZqwYxPPZyYx4yCy
	 FwAUIII/zQaubX1vQHg8apFNd/EFPmD3JnxLY56Q+hyARYqxzBcSbSN7j6F/EvxddWm5M
	 NA4/BVfWkbnXhLCviZV4JoB1ychPQIhhSmzAfXhN417BVyxaFlEN+2x6y5mjVprnfc5oK
	 OGyAIbcig2pk1DevHNxTErN+gyVd2bIYIV+IwxyY+4W0tiBDsZ9/9gKdnb0qchvohFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508385;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=a3kR5aSprsOvsSB6jtfz8pJCYG2a8mJAvssRixW51s0=;
	b=OAuaiElvg6c98hC9RpjekUOTjgd6FC18SdUTBfjKnd6SUKyoLCm7UpsNSZGfBV4lXDAn
	 DnHZfm+a15FbLxTkgwc2IBabGqJ5qX+trhLzkeuGih7o/Qg4luMTcKYUIdPvit3iHPT7I
	 4jjZ9YCs/L4F/fes3AXVOBjqFFm2cjtrar972CzhmoIEQK08WgkBzqF0j6dj/Za8FhhEt
	 wx+JGKPV4fBwz6f9mYnN+Qh0JsgLcWmITuAT2HTLhrurJ6E7ppEQmjBJSuzeGsA6O9CKT
	 MkbiXlD2vkqar98Rh6QjSdDfS3d1rJ6uHUgrapwrKSzvIDy012aCAc2t+HK/U8AVeHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="h9D1t/tV";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5D4606A32E;
	Thu, 12 Nov 2026 18:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB5D4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=h9D1t/tV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794508381;
	bh=J17oRMoi6ob0lSLmzFxK5h1G3Xi9bfUxHRz31OYU1ds=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=h9D1t/tVpd9KunIqy3Q42pAKjRFZY2KMeRHCTpjVpz0Jfv8z3edvIxT/pVaj4ypvH
	 HisZ7e72ekaMNx551qi+pJ2DByXGnFzMTfEG2qtNq85NkX85kz0fk70TPPSn1DmLGB
	 8k3PkccFe6kCuwKiPb+b1ZkCYSsps/0S+3J6G2C3Dx3mF3SwxmsTqyBpzAMI2/PXgE
	 RDieGhzoajXVUUOI8/yT8VWqv73KpxvZlQZZsCndfu2ynWyg9eeHlyJ4oaZBKVnUOR
	 NcjDB9wHLctkGP9QEnYnGaKvqNTGAGZ1QMMMg+io1epsk4eWgA8OsDUDR8eF6FJRyA
	 NPEwochSEB5rg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 189EA17E00E8;
	Thu, 12 Nov 2026 19:32:59 +0100 (CET)
Message-ID: <efdc99694c36ed26c8475e31c4e90773c8b0f53f.camel@collabora.com>
Subject: Re: [PATCH v12 4/6] decoder: Add V4L2 stateless H.264 decoder driver
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: zhentao.guo@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl	 <martin.blumenstingl@googlemail.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org
Date: Thu, 12 Nov 2026 13:32:58 -0500
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-4-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
	 <20261022-b4-s4-vdec-upstream-v12-4-616240978792@amlogic.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-X5FFK7Wmrpw/F4m44IPk"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-X5FFK7Wmrpw/F4m44IPk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 22 octobre 2026 =C3=A0 13:27 +0800, Zhentao Guo via B4 Relay a =C3=
=A9crit=C2=A0:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
>=20
> Add initial support for V4L2 stateless video decoder
> driver on Amlogic S4(S805X2) platform. In phase 1,
> it supports 8bit H.264 bitstreams decoding. Currently
> only progressive streams are supported.
>=20
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>  MAINTAINERS                                        |    7 +
>  drivers/media/platform/amlogic/Kconfig             |    1 +
>  drivers/media/platform/amlogic/Makefile            |    1 +
>  drivers/media/platform/amlogic/vdec/Kconfig        |   18 +
>  drivers/media/platform/amlogic/vdec/Makefile       |    4 +
>  drivers/media/platform/amlogic/vdec/TODO           |    7 +
>  drivers/media/platform/amlogic/vdec/aml_vdec.c     |  846 ++++++++
>  drivers/media/platform/amlogic/vdec/aml_vdec.h     |   33 +
>  drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  260 +++
>  drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  168 ++
>  drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  570 +++++
>  drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  161 ++
>  .../platform/amlogic/vdec/aml_vdec_platform.c      |   81 +
>  .../platform/amlogic/vdec/aml_vdec_platform.h      |   46 +
>  .../media/platform/amlogic/vdec/aml_vdec_tee_fw.c  |  249 +++
>  .../media/platform/amlogic/vdec/aml_vdec_tee_fw.h  |   27 +
>  drivers/media/platform/amlogic/vdec/h264.c         | 2209 ++++++++++++++=
++++++
>  drivers/media/platform/amlogic/vdec/h264.h         |  299 +++
>  drivers/media/platform/amlogic/vdec/reg_defines.h  |  177 ++
>  19 files changed, 5164 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 149bc44003bd..58df555ae864 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1458,6 +1458,13 @@ S:=09Maintained
>  F:=09Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
>  F:=09drivers/spi/spi-amlogic-spisg.c
> =20
> +AMLOGIC VDEC DRIVER
> +M:=09Zhentao Guo <zhentao.guo@amlogic.com>
> +L:=09linux-media@vger.kernel.org
> +S:=09Maintained
> +F:=09Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> +F:=09drivers/media/platform/amlogic/vdec/
> +
>  AMPHENOL CHIPCAP 2 DRIVER
>  M:=09Javier Carrasco <javier.carrasco.cruz@gmail.com>
>  L:=09linux-hwmon@vger.kernel.org
> diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platf=
orm/amlogic/Kconfig
> index 458acf3d5fa8..7c541ac0d0c3 100644
> --- a/drivers/media/platform/amlogic/Kconfig
> +++ b/drivers/media/platform/amlogic/Kconfig
> @@ -4,3 +4,4 @@ comment "Amlogic media platform drivers"
> =20
>  source "drivers/media/platform/amlogic/c3/Kconfig"
>  source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
> +source "drivers/media/platform/amlogic/vdec/Kconfig"
> diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/plat=
form/amlogic/Makefile
> index c744afcd1b9e..7409de674c0b 100644
> --- a/drivers/media/platform/amlogic/Makefile
> +++ b/drivers/media/platform/amlogic/Makefile
> @@ -2,3 +2,4 @@
> =20
>  obj-y +=3D c3/
>  obj-y +=3D meson-ge2d/
> +obj-y +=3D vdec/
> diff --git a/drivers/media/platform/amlogic/vdec/Kconfig b/drivers/media/=
platform/amlogic/vdec/Kconfig
> new file mode 100644
> index 000000000000..2c5dd8452962
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +config VIDEO_AMLOGIC_VDEC
> +    tristate "Amlogic Video Decoder Driver"
> +    depends on ARCH_MESON || COMPILE_TEST
> +    depends on VIDEO_DEV
> +    depends on V4L_MEM2MEM_DRIVERS
> +    depends on TEE
> +    depends on MESON_SM
> +    select VIDEOBUF2_DMA_CONTIG
> +    select V4L2_H264
> +    select V4L2_MEM2MEM_DEV
> +    select MESON_CANVAS
> +    help
> +      This is a v4l2 driver for Amlogic video decoder driver.
> +      This driver is designed to support V4L2 M2M STATELESS
> +      interface.
> +      To compile this driver as a module choose m here.
> diff --git a/drivers/media/platform/amlogic/vdec/Makefile b/drivers/media=
/platform/amlogic/vdec/Makefile
> new file mode 100644
> index 000000000000..f752716cbf9e
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +aml-vdec-drv-objs :=3D aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_=
platform.o h264.o aml_vdec_tee_fw.o\
> +
> +obj-$(CONFIG_VIDEO_AMLOGIC_VDEC) +=3D aml-vdec-drv.o
> diff --git a/drivers/media/platform/amlogic/vdec/TODO b/drivers/media/pla=
tform/amlogic/vdec/TODO
> new file mode 100644
> index 000000000000..54c60145770e
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/TODO
> @@ -0,0 +1,7 @@
> +TODO list for Amlogic V4L2 stateless decoder driver:
> +
> +1. Support decoding for HEVC, VP9, AV1, and MPEG-2.
> +2. Support more SoCs, including the new T7/S7 series and legacy SoCs (e.=
g., GXL, SM1, G12B).
> +3. Support 10-bit decoding and P010 output.
> +   Note: P010 output requires hardware support.
> +4. Support interlaced stream decoding for H.264, HEVC, and MPEG-2.
> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/med=
ia/platform/amlogic/vdec/aml_vdec.c
> new file mode 100644
> index 000000000000..e65ebb2ce311
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
> @@ -0,0 +1,846 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "aml_vdec.h"
> +#include "aml_vdec_hw.h"
> +#include "aml_vdec_platform.h"
> +#include "aml_vdec_tee_fw.h"
> +
> +#define VCODEC_DRV_NAME "aml-vdec-drv"
> +
> +static const struct aml_vdec_v4l2_ctrl controls[] =3D {
> +=09{
> +=09=09.codec_type =3D CODEC_TYPE_H264,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_STATELESS_H264_DECODE_PARAMS,
> +=09=09},
> +=09}, {
> +=09=09.codec_type =3D CODEC_TYPE_H264,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_STATELESS_H264_SPS,
> +=09=09},
> +=09}, {
> +=09=09.codec_type =3D CODEC_TYPE_H264,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_STATELESS_H264_PPS,
> +=09=09},
> +=09}, {
> +=09=09.codec_type =3D CODEC_TYPE_H264,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_STATELESS_H264_SCALING_MATRIX,
> +=09=09},
> +=09}, {
> +=09=09.codec_type =3D CODEC_TYPE_H264,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_STATELESS_H264_DECODE_MODE,
> +=09=09=09.min =3D V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +=09=09=09.def =3D V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +=09=09=09.max =3D V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +=09=09},
> +=09}, {
> +=09=09.codec_type =3D CODEC_TYPE_H264,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> +=09=09},
> +=09}, {
> +=09=09.codec_type =3D CODEC_TYPE_H264,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_STATELESS_H264_START_CODE,
> +=09=09=09.min =3D V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> +=09=09=09.def =3D V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> +=09=09=09.max =3D V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> +=09=09},
> +=09}, {
> +=09=09.codec_type =3D CODEC_TYPE_H264,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +=09=09=09.min =3D V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +=09=09=09.max =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +=09=09=09.def =3D V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
> +=09=09},
> +=09}
> +};
> +
> +static const struct aml_dec_type dec_type_name[] =3D {
> +=09{
> +=09=09.codec_type =3D CODEC_TYPE_H264,
> +=09=09.name =3D "H264",
> +=09},
> +};
> +
> +static const char *dec_type_to_name(unsigned int type)
> +{
> +=09int i;
> +=09int size =3D ARRAY_SIZE(dec_type_name);
> +
> +=09for (i =3D 0; i < size; i++) {
> +=09=09if (dec_type_name[i].codec_type =3D=3D type)
> +=09=09=09return dec_type_name[i].name;
> +=09}
> +
> +=09return "ERR";
> +}
> +
> +int aml_vdec_ctrls_setup(struct aml_vdec_ctx *ctx)
> +{
> +=09int i;
> +=09int ret;
> +=09int ctrls_size =3D ARRAY_SIZE(controls);
> +
> +=09v4l2_ctrl_handler_init(&ctx->ctrl_handler, ctrls_size);
> +=09for (i =3D 0; i < ctrls_size; i++) {
> +=09=09v4l2_ctrl_new_custom(&ctx->ctrl_handler, &controls[i].cfg, NULL);
> +=09=09if (ctx->ctrl_handler.error) {
> +=09=09=09dev_info(&ctx->dev->plat_dev->dev, "add ctrl for (%d) failed%d\=
n",
> +=09=09=09=09 controls[i].cfg.id, ctx->ctrl_handler.error);
> +=09=09=09v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +=09=09=09return ctx->ctrl_handler.error;
> +=09=09}
> +=09}
> +=09ctx->fh.ctrl_handler =3D &ctx->ctrl_handler;
> +
> +=09ret =3D v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
> +=09if (ret)
> +=09=09v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +
> +=09return ret;
> +}
> +
> +static void m2mops_vdec_device_run(void *m2m_priv)

Namespaces are inconsistant since the start of this patch.=20

> +{
> +=09struct aml_vdec_ctx *ctx =3D (struct aml_vdec_ctx *)m2m_priv;
> +=09struct aml_vdec_dev *dev =3D ctx->dev;
> +=09struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +=09struct media_request *src_req;
> +=09int ret =3D 0;
> +
> +=09src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +=09dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +=09dev_dbg(&dev->plat_dev->dev, "device run : src buf : %d dst buf %d\n"=
,
> +=09=09src_buf->vb2_buf.index, dst_buf->vb2_buf.index);
> +=09if (WARN_ON_ONCE(!ctx->codec_ops->run))

It looks like a BUG_ON to me, any reason they may happen and would require =
fail-
safety ?

> +=09=09goto err_cancel_job;
> +
> +=09src_req =3D src_buf->vb2_buf.req_obj.req;
> +=09if (src_req)
> +=09=09v4l2_ctrl_request_setup(src_req, &ctx->ctrl_handler);
> +
> +=09/*
> +=09 * Claim the hardware initialization window: curr_ctx has a
> +=09 * strictly per-frame lifecycle (set by the codec run callback,
> +=09 * cleared when the frame completes) and cannot cover the
> +=09 * bring-up below. The claim tells a concurrent aml_h264_exit()
> +=09 * from another instance to leave the hardware alone; it is
> +=09 * handed over to curr_ctx when the frame starts.
> +=09 */
> +=09mutex_lock(&dev->dec_hw->ctx_mutex);
> +=09dev->dec_hw->init_ctx =3D ctx->codec_priv;
> +=09mutex_unlock(&dev->dec_hw->ctx_mutex);

Sounds like "the claim" refer to some sashiko report ? Might be nice to
reference it, but also, I don't understand a thing here. How is init_ctx po=
inter
safer because you copied codec_priv under a mutex? Normally, to fix such a
lifetime issue, we'd opt for kref.

> +
> +=09dos_enable(dev->dec_hw);
> +=09/* incase of bus hang in stop_streaming */
> +=09ctx->dos_clk_en =3D 1;

The code in aml_h264_exit() uses mutex, which hint that it is maybe running=
 in a
concurrent thread and so dos_enable() + setting dos_clk_en should be serial=
ized
under the ctx_mutex. The race might not exist in practice, but the locking =
seems
to be an after thought, make it safe by design, you always pay the cost.

> +=09ctx->curr_frm_err_flag =3D 0;
> +
> +=09if (ctx->curr_dec_type =3D=3D CODEC_TYPE_H264)
> +=09=09aml_vdec_reset_core(dev->dec_hw);
> +
> +=09if (load_firmware(dev->dec_hw, ctx->curr_dec_type) < 0)
> +=09=09goto err_load_fw;
> +
> +=09ret =3D ctx->codec_ops->run(ctx);

We encourage not doing this synchronously, as this introduce an extra conte=
xt
switch from the threaded IRQ to here. Only handle synchronous failures (lik=
e bad
parameters) in the lower part, finish the job in the threaded IRQ. Its not
invalid, just not optimal.

> +
> +=09v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> +=09if (src_req)
> +=09=09v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
> +=09if (ret < 0 || ctx->curr_frm_err_flag)
> +=09=09goto err_cancel_job;
> +=09v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
> +=09=09=09=09=09 VB2_BUF_STATE_DONE);
> +=09return;
> +
> +err_load_fw:
> +=09mutex_lock(&dev->dec_hw->ctx_mutex);
> +=09dev->dec_hw->init_ctx =3D NULL;
> +=09mutex_unlock(&dev->dec_hw->ctx_mutex);
> +=09if (src_req)
> +=09=09v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
> +err_cancel_job:
> +=09v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
> +=09=09=09=09=09 VB2_BUF_STATE_ERROR);

There is clear cases, like err_load_fw where nothing has been written in th=
e
CAPTURE buffer. And ret < 0 might be another one ? In these cases, which ar=
e
unlike missing slices or missing references, set the payload size to 0. Thi=
s
will tell userspace this is a frame to be discarded. I'm working on GStream=
er
fix for failed frame discard, and corrupted frame marking, other implementa=
tion
such as chromium have it.

> +}
> +
> +const struct v4l2_m2m_ops aml_vdec_m2m_ops =3D {
> +=09.device_run =3D m2mops_vdec_device_run,
> +};
> +
> +static int vidioc_vdec_querycap(struct file *file, void *priv,
> +=09=09=09=09struct v4l2_capability *cap)
> +{
> +=09strscpy(cap->driver, VCODEC_DRV_NAME, sizeof(cap->driver));
> +=09strscpy(cap->card, "platform:" VCODEC_DRV_NAME, sizeof(cap->card));
> +
> +=09return 0;
> +}
> +
> +static int vidioc_vdec_enum_fmt(struct aml_vdec_ctx *ctx,
> +=09=09=09=09struct v4l2_fmtdesc *f, bool is_output)
> +{
> +=09struct aml_vdec_dev *dev =3D ctx->dev;
> +=09const struct aml_video_fmt *fmt;
> +=09int i =3D 0, j =3D 0;
> +
> +=09for (; i < dev->pvdec_data->num_fmts; i++) {
> +=09=09fmt =3D &dev->pvdec_data->dec_fmt[i];
> +=09=09if (is_output && fmt->type !=3D AML_FMT_DEC)
> +=09=09=09continue;
> +=09=09if (!is_output && fmt->type !=3D AML_FMT_FRAME)
> +=09=09=09continue;
> +
> +=09=09if (j =3D=3D f->index) {
> +=09=09=09f->pixelformat =3D fmt->fourcc;
> +=09=09=09strscpy(f->description, fmt->name,
> +=09=09=09=09sizeof(f->description));
> +=09=09=09return 0;
> +=09=09}
> +=09=09++j;
> +=09}
> +=09return -EINVAL;
> +}
> +
> +static const struct aml_video_fmt *aml_vdec_get_video_fmt(struct aml_vde=
c_dev
> +=09=09=09=09=09=09=09  *dev, u32 format)
> +{
> +=09const struct aml_video_fmt *fmt;
> +=09unsigned int k;
> +
> +=09for (k =3D 0; k < dev->pvdec_data->num_fmts; k++) {
> +=09=09fmt =3D &dev->pvdec_data->dec_fmt[k];
> +=09=09if (fmt->fourcc =3D=3D format)
> +=09=09=09return fmt;
> +=09}
> +
> +=09return NULL;
> +}
> +
> +static int aml_vdec_init_dec_inst(struct aml_vdec_ctx *ctx)
> +{
> +=09struct aml_vdec_dev *dev =3D ctx->dev;
> +=09struct aml_video_fmt *fmt_out =3D &ctx->dec_fmt[AML_FMT_SRC];
> +=09int ret =3D -1;
> +
> +=09ctx->codec_ops =3D &dev->pvdec_data->codec_ops[fmt_out->codec_type];
> +=09/*
> +=09 * The codec instance is only released when both queues are
> +=09 * streamed off: do not allocate a new one (leaking the previous
> +=09 * instance) when the output queue is restarted while the
> +=09 * capture queue is still streaming.
> +=09 */
> +=09if (ctx->codec_ops->init && !ctx->codec_priv) {
> +=09=09ret =3D ctx->codec_ops->init(ctx);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +=09}
> +=09ctx->curr_dec_type =3D fmt_out->codec_type;

That's not much symmetrical. My worry now is that maybe we endup with
curr_dec_type not matching the codec_priv, which will lead to memory corrup=
tion.

> +=09dev_info(&dev->plat_dev->dev, "%s set curr_dec_type %s\n",
> +=09=09 __func__, dec_type_to_name(ctx->curr_dec_type));
> +
> +=09return ret;
> +}
> +
> +static void set_pic_info(struct aml_vdec_ctx *ctx,
> +=09=09=09 struct v4l2_pix_format_mplane *pix_mp,
> +=09=09=09 enum v4l2_buf_type type)

This is used once, either fold or move next to its users which is not
vidioc_vdec_enum_framesizes().

> +{
> +=09if (V4L2_TYPE_IS_OUTPUT(type)) {
> +=09=09ctx->pic_info.output_pix_fmt =3D pix_mp->pixelformat;
> +=09=09ctx->pic_info.coded_width =3D ALIGN(pix_mp->width, 64);
> +=09=09ctx->pic_info.coded_height =3D ALIGN(pix_mp->height, 64);

The coded size alignment in H.264 is 16 steps, this isn't a coded width/hei=
ght
you store here, but a padded_width/height.

> +=09=09ctx->pic_info.fb_size[0] =3D
> +=09=09    ctx->pic_info.coded_width * ctx->pic_info.coded_height;
> +=09=09ctx->pic_info.fb_size[1] =3D ctx->pic_info.fb_size[0] / 2;

All this is duplication of the dst_fmt. Size should be pixel format depende=
nt,
not hard coded to NV12 (which is not even commented here). Check other driv=
er,
but basically, s_fmt should fait if the capture queue is busy, and reset th=
e
dst_fmt to a valid value otherwise. The calculation of NV12 stride and size=
s
should not be open coded but use v4l2_common. This means using
v4l2_apply_frmsize_constraints() and v4l2_fill_pixfmt_mp().

> +=09}
> +}
> +
> +static int vidioc_vdec_enum_framesizes(struct file *file, void *priv,
> +=09=09=09=09       struct v4l2_frmsizeenum *fsize)
> +{
> +=09const struct aml_video_fmt *fmt;
> +=09struct aml_vdec_dev *dev =3D video_drvdata(file);
> +
> +=09if (fsize->index !=3D 0)
> +=09=09return -EINVAL;
> +
> +=09fmt =3D aml_vdec_get_video_fmt(dev, fsize->pixel_format);
> +=09if (!fmt)
> +=09=09return -EINVAL;
> +
> +=09fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> +=09fsize->stepwise =3D fmt->stepwise;
> +
> +=09return 0;
> +}
> +
> +static int vdec_try_fmt_mp(struct aml_vdec_ctx *ctx, enum v4l2_buf_type =
type,
> +=09=09=09   struct v4l2_pix_format_mplane *pix_mp,
> +=09=09=09   const struct aml_video_fmt *dec_fmt)
> +{
> +=09int i, align;
> +
> +=09pix_mp->field =3D V4L2_FIELD_NONE;
> +=09align =3D dec_fmt->align;
> +
> +=09if (V4L2_TYPE_IS_OUTPUT(type)) {
> +=09=09pix_mp->num_planes =3D dec_fmt->num_planes;
> +=09=09pix_mp->pixelformat =3D dec_fmt->fourcc;
> +=09=09if (!pix_mp->plane_fmt[0].sizeimage)
> +=09=09=09pix_mp->plane_fmt[0].sizeimage =3D
> +=09=09=09    (pix_mp->height * pix_mp->width * 3) / 2;

Comment that this is bitstream default size.

> +=09=09pix_mp->height =3D ALIGN(pix_mp->height, align);
> +=09=09pix_mp->width =3D ALIGN(pix_mp->width, align);

Why do you need this, you call v4l2_apply_frmsize_constraints() right below=
. If
you configured the stepwise properly, it would just work.

> +=09} else {
> +=09=09pix_mp->height =3D ctx->pix_fmt[AML_FMT_SRC].height;
> +=09=09pix_mp->width =3D ctx->pix_fmt[AML_FMT_SRC].width;
> +=09}
> +
> +=09v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
> +=09=09=09=09       &dec_fmt->stepwise);
> +=09dev_dbg(&ctx->dev->plat_dev->dev,
> +=09=09"%s type %d four_cc %d pix_mp->width %d pix_mp->height %d\n",
> +=09=09__func__, type, dec_fmt->fourcc, pix_mp->width, pix_mp->height);
> +
> +=09v4l2_fill_pixfmt_mp(pix_mp, dec_fmt->fourcc, pix_mp->width,
> +=09=09=09    pix_mp->height);
> +
> +=09for (i =3D 0; i < pix_mp->num_planes; i++)
> +=09=09memset(&pix_mp->plane_fmt[i].reserved[0], 0x0,
> +=09=09       sizeof(pix_mp->plane_fmt[0].reserved));
> +
> +=09memset(pix_mp->reserved, 0x0, sizeof(pix_mp->reserved));
> +=09pix_mp->flags =3D 0;

Drop this, should be filled by the core already.

> +
> +=09dev_dbg(&ctx->dev->plat_dev->dev,
> +=09=09"%s type %d fmt %d num_plane %d sizeimage0 %d sizeimage1 %d\n",
> +=09=09__func__, type, pix_mp->pixelformat, pix_mp->num_planes,
> +=09=09pix_mp->plane_fmt[0].sizeimage, pix_mp->plane_fmt[1].sizeimage);

This is all traced by the code and application can enable/disable this, ple=
ase
drop.

> +
> +=09return 0;
> +}
> +
> +static int vdec_s_fmt_output(struct aml_vdec_ctx *ctx, struct v4l2_forma=
t *f)
> +{
> +=09struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +=09struct v4l2_pix_format_mplane *cap_fmt =3D &ctx->pix_fmt[AML_FMT_DST]=
;
> +=09const struct aml_video_fmt *out_fmt;
> +=09struct vb2_queue *vq, *peer_vq;
> +=09int ret;
> +
> +=09vq =3D v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLAN=
E);
> +=09if (vb2_is_busy(vq) &&
> +=09    pix_mp->pixelformat !=3D ctx->pix_fmt[AML_FMT_SRC].pixelformat)
> +=09=09return -EBUSY;
> +
> +=09/*
> +=09 * Since s_fmt output will reset the width and height in the capture =
queue,
> +=09 * s_fmt_output with resolution change should not take effect when ca=
pture
> +=09 * queue is busy.
> +=09 */
> +=09peer_vq =3D v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE=
_MPLANE);
> +=09if (vb2_is_busy(peer_vq) &&
> +=09    (pix_mp->width !=3D cap_fmt->width ||
> +=09    pix_mp->height !=3D cap_fmt->height))

As a future precaution, add fmt compare too.

> +=09=09return -EBUSY;
> +
> +=09out_fmt =3D aml_vdec_get_video_fmt(ctx->dev, pix_mp->pixelformat);
> +=09if (out_fmt && out_fmt->type !=3D AML_FMT_DEC)
> +=09=09out_fmt =3D NULL;
> +=09if (out_fmt) {
> +=09=09ctx->dec_fmt[AML_FMT_SRC] =3D *out_fmt;
> +=09} else {
> +=09=09out_fmt =3D &ctx->dec_fmt[AML_FMT_SRC];
> +=09=09dev_dbg(&ctx->dev->plat_dev->dev,
> +=09=09=09"%s fmt %d not supported, use default\n", __func__,
> +=09=09=09pix_mp->pixelformat);
> +=09}
> +
> +=09ret =3D vdec_try_fmt_mp(ctx, f->type, pix_mp, out_fmt);
> +=09set_pic_info(ctx, pix_mp, f->type);

Check other driver, what I'm trying to suggest it to store the src/dst_fmt,=
 and
reset the dst_fmt instead of duplicating things with the pic info.

> +
> +=09ctx->pix_fmt[AML_FMT_SRC] =3D *pix_mp;
> +=09cap_fmt->width =3D pix_mp->width;
> +=09cap_fmt->height =3D pix_mp->height;
> +=09v4l2_fill_pixfmt_mp(cap_fmt, ctx->dec_fmt[AML_FMT_DST].fourcc,
> +=09=09=09    cap_fmt->width, cap_fmt->height);
> +=09cap_fmt->colorspace =3D pix_mp->colorspace;
> +=09cap_fmt->quantization =3D pix_mp->quantization;
> +=09cap_fmt->ycbcr_enc =3D pix_mp->ycbcr_enc;
> +=09cap_fmt->xfer_func =3D pix_mp->xfer_func;
> +
> +=09return ret;
> +}
> +
> +static int vdec_s_fmt_capture(struct aml_vdec_ctx *ctx, struct v4l2_form=
at *f)
> +{
> +=09struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +=09const struct aml_video_fmt *cap_fmt;
> +=09struct vb2_queue *vq;
> +=09int ret;
> +
> +=09vq =3D v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLA=
NE);
> +=09if (vb2_is_busy(vq))
> +=09=09return -EBUSY;
> +
> +=09cap_fmt =3D aml_vdec_get_video_fmt(ctx->dev, pix_mp->pixelformat);
> +=09if (cap_fmt && cap_fmt->type !=3D AML_FMT_FRAME)
> +=09=09cap_fmt =3D NULL;
> +=09if (cap_fmt) {
> +=09=09ctx->dec_fmt[AML_FMT_DST] =3D *cap_fmt;
> +=09} else {
> +=09=09cap_fmt =3D &ctx->dec_fmt[AML_FMT_DST];
> +=09=09dev_dbg(&ctx->dev->plat_dev->dev,
> +=09=09=09"%s fmt %d not supported, use default\n", __func__,
> +=09=09=09pix_mp->pixelformat);
> +=09}
> +
> +=09ret =3D vdec_try_fmt_mp(ctx, f->type, pix_mp, cap_fmt);
> +
> +=09ctx->pix_fmt[AML_FMT_DST] =3D *pix_mp;
> +
> +=09return ret;
> +}
> +
> +static int vdec_try_fmt_output(struct aml_vdec_ctx *ctx, struct v4l2_for=
mat *f)
> +{
> +=09struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +=09const struct aml_video_fmt *out_fmt;
> +=09int ret;
> +
> +=09out_fmt =3D aml_vdec_get_video_fmt(ctx->dev, pix_mp->pixelformat);
> +=09if (out_fmt && out_fmt->type !=3D AML_FMT_DEC)
> +=09=09out_fmt =3D NULL;
> +=09if (!out_fmt) {
> +=09=09out_fmt =3D &ctx->dec_fmt[AML_FMT_SRC];
> +=09=09dev_dbg(&ctx->dev->plat_dev->dev,
> +=09=09=09"%s fmt %d not supported, use default\n", __func__,
> +=09=09=09pix_mp->pixelformat);
> +=09}
> +
> +=09ret =3D vdec_try_fmt_mp(ctx, f->type, pix_mp, out_fmt);
> +
> +=09return ret;
> +}
> +
> +static int vdec_try_fmt_capture(struct aml_vdec_ctx *ctx, struct v4l2_fo=
rmat *f)
> +{
> +=09struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +=09const struct aml_video_fmt *cap_fmt;
> +=09int ret;
> +
> +=09cap_fmt =3D aml_vdec_get_video_fmt(ctx->dev, pix_mp->pixelformat);
> +=09if (cap_fmt && cap_fmt->type !=3D AML_FMT_FRAME)
> +=09=09cap_fmt =3D NULL;
> +=09if (!cap_fmt) {
> +=09=09cap_fmt =3D &ctx->dec_fmt[AML_FMT_DST];
> +=09=09dev_dbg(&ctx->dev->plat_dev->dev,
> +=09=09=09"%s fmt %d not supported, use default\n", __func__,
> +=09=09=09pix_mp->pixelformat);
> +=09}
> +
> +=09ret =3D vdec_try_fmt_mp(ctx, f->type, pix_mp, cap_fmt);
> +
> +=09return ret;
> +}
> +
> +static void reset_output_fmts(struct aml_vdec_ctx *ctx)
> +{
> +=09struct aml_vdec_dev *dev =3D ctx->dev;
> +=09const struct aml_video_fmt *out_fmt;
> +=09struct v4l2_pix_format_mplane fmt;
> +
> +=09/* reset default output fmt to V4L2_PIX_FMT_H264_SLICE */
> +=09out_fmt =3D aml_vdec_get_video_fmt(dev, V4L2_PIX_FMT_H264_SLICE);
> +=09if (!out_fmt)
> +=09=09return;
> +
> +=09ctx->dec_fmt[AML_FMT_SRC] =3D *out_fmt;
> +
> +=09memset(&fmt, 0, sizeof(struct v4l2_pix_format_mplane));
> +
> +=09fmt.height =3D out_fmt->stepwise.min_height;
> +=09fmt.width =3D out_fmt->stepwise.min_width;
> +=09/* reset bytesperline to 0 for output fmts */
> +=09fmt.plane_fmt[0].bytesperline =3D 0;
> +=09fmt.colorspace =3D V4L2_COLORSPACE_DEFAULT;
> +=09fmt.ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> +=09fmt.quantization =3D V4L2_QUANTIZATION_DEFAULT;
> +=09fmt.xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> +=09vdec_try_fmt_mp(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, &fmt,
> +=09=09=09out_fmt);
> +
> +=09ctx->pix_fmt[AML_FMT_SRC] =3D fmt;
> +}
> +
> +static void reset_capture_fmts(struct aml_vdec_ctx *ctx)
> +{
> +=09struct aml_vdec_dev *dev =3D ctx->dev;
> +=09const struct aml_video_fmt *cap_fmt;
> +=09struct v4l2_pix_format_mplane fmt;
> +
> +=09/* reset default output fmt to V4L2_PIX_FMT_NV12 */
> +=09cap_fmt =3D aml_vdec_get_video_fmt(dev, V4L2_PIX_FMT_NV12);
> +=09if (!cap_fmt)
> +=09=09return;
> +
> +=09ctx->dec_fmt[AML_FMT_DST] =3D *cap_fmt;
> +
> +=09memset(&fmt, 0, sizeof(struct v4l2_pix_format_mplane));
> +
> +=09fmt.height =3D cap_fmt->stepwise.min_height;
> +=09fmt.width =3D cap_fmt->stepwise.min_width;

Don't hardcode this, derive from the coded src_fmt (OUTPUT format). This wa=
y you
can properly implement reset on s_fmt(OUTPUT).

> +=09fmt.colorspace =3D V4L2_COLORSPACE_DEFAULT;
> +=09fmt.ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> +=09fmt.quantization =3D V4L2_QUANTIZATION_DEFAULT;
> +=09fmt.xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> +=09vdec_try_fmt_mp(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, &fmt,
> +=09=09=09cap_fmt);
> +
> +=09ctx->pix_fmt[AML_FMT_DST] =3D fmt;
> +}
> +
> +void aml_vdec_reset_fmts(struct aml_vdec_ctx *ctx)
> +{
> +=09ctx->m2m_ctx->q_lock =3D &ctx->v4l2_intf_lock;
> +=09reset_output_fmts(ctx);
> +=09reset_capture_fmts(ctx);

Resetting output imply resetting capture, you can embed them.

> +}
> +
> +static int vdec_g_fmt(struct aml_vdec_ctx *ctx, struct v4l2_format *f)
> +{
> +=09struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +
> +=09if (V4L2_TYPE_IS_OUTPUT(f->type))
> +=09=09*pix_mp =3D ctx->pix_fmt[AML_FMT_SRC];
> +=09else
> +=09=09*pix_mp =3D ctx->pix_fmt[AML_FMT_DST];

I personally prefer to not use an array, and have src_fmt and dst_dmt. It w=
ill
also make other code path easier to read.

> +
> +=09dev_dbg(&ctx->dev->plat_dev->dev,
> +=09=09"%s fmt %d num planes %d\n", __func__, pix_mp->pixelformat,
> +=09=09pix_mp->num_planes);
> +
> +=09return 0;
> +}
> +
> +static int vidioc_try_fmt_cap_mplane(struct file *file, void *priv,
> +=09=09=09=09     struct v4l2_format *f)
> +{
> +=09struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> +
> +=09return vdec_try_fmt_capture(ctx, f);
> +}
> +
> +static int vidioc_try_fmt_out_mplane(struct file *file, void *priv,
> +=09=09=09=09     struct v4l2_format *f)
> +{
> +=09struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> +
> +=09return vdec_try_fmt_output(ctx, f);
> +}
> +
> +static int vidioc_vdec_s_fmt_out_mplane(struct file *file, void *priv,
> +=09=09=09=09=09struct v4l2_format *f)
> +{
> +=09struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> +
> +=09return vdec_s_fmt_output(ctx, f);
> +}
> +
> +static int vidioc_vdec_s_fmt_cap_mplane(struct file *file, void *priv,
> +=09=09=09=09=09struct v4l2_format *f)
> +{
> +=09struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> +
> +=09return vdec_s_fmt_capture(ctx, f);
> +}
> +
> +static int vidioc_vdec_g_fmt_out_mplane(struct file *file, void *priv,
> +=09=09=09=09=09struct v4l2_format *f)
> +{
> +=09struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> +
> +=09return vdec_g_fmt(ctx, f);
> +}
> +
> +static int vidioc_vdec_g_fmt_cap_mplane(struct file *file, void *priv,
> +=09=09=09=09=09struct v4l2_format *f)
> +{
> +=09struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> +
> +=09return vdec_g_fmt(ctx, f);
> +}
> +
> +static int vidioc_vdec_enum_fmt_out_mplane(struct file *file,
> +=09=09=09=09=09   void *priv, struct v4l2_fmtdesc *f)
> +{
> +=09struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> +
> +=09return vidioc_vdec_enum_fmt(ctx, f, 1);
> +}
> +
> +static int vidioc_vdec_enum_fmt_cap_mplane(struct file *file,
> +=09=09=09=09=09   void *priv, struct v4l2_fmtdesc *f)
> +{
> +=09struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> +
> +=09return vidioc_vdec_enum_fmt(ctx, f, 0);
> +}
> +
> +const struct v4l2_ioctl_ops aml_vdec_ioctl_ops =3D {
> +=09.vidioc_querycap =3D vidioc_vdec_querycap,
> +=09.vidioc_enum_framesizes =3D vidioc_vdec_enum_framesizes,
> +
> +=09.vidioc_enum_fmt_vid_cap =3D vidioc_vdec_enum_fmt_cap_mplane,
> +=09.vidioc_try_fmt_vid_cap_mplane =3D vidioc_try_fmt_cap_mplane,
> +=09.vidioc_s_fmt_vid_cap_mplane =3D vidioc_vdec_s_fmt_cap_mplane,
> +=09.vidioc_g_fmt_vid_cap_mplane =3D vidioc_vdec_g_fmt_cap_mplane,
> +
> +=09.vidioc_enum_fmt_vid_out =3D vidioc_vdec_enum_fmt_out_mplane,
> +=09.vidioc_try_fmt_vid_out_mplane =3D vidioc_try_fmt_out_mplane,
> +=09.vidioc_s_fmt_vid_out_mplane =3D vidioc_vdec_s_fmt_out_mplane,
> +=09.vidioc_g_fmt_vid_out_mplane =3D vidioc_vdec_g_fmt_out_mplane,
> +
> +=09.vidioc_reqbufs =3D v4l2_m2m_ioctl_reqbufs,
> +=09.vidioc_querybuf =3D v4l2_m2m_ioctl_querybuf,
> +=09.vidioc_qbuf =3D v4l2_m2m_ioctl_qbuf,
> +=09.vidioc_dqbuf =3D v4l2_m2m_ioctl_dqbuf,
> +=09.vidioc_prepare_buf =3D v4l2_m2m_ioctl_prepare_buf,
> +=09.vidioc_create_bufs =3D v4l2_m2m_ioctl_create_bufs,
> +
> +=09.vidioc_expbuf =3D v4l2_m2m_ioctl_expbuf,
> +
> +=09.vidioc_decoder_cmd =3D v4l2_m2m_ioctl_stateless_decoder_cmd,
> +=09.vidioc_try_decoder_cmd =3D v4l2_m2m_ioctl_stateless_try_decoder_cmd,
> +
> +=09.vidioc_subscribe_event =3D v4l2_ctrl_subscribe_event,
> +=09.vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
> +
> +=09.vidioc_streamon =3D v4l2_m2m_ioctl_streamon,
> +=09.vidioc_streamoff =3D v4l2_m2m_ioctl_streamoff,
> +};
> +
> +static void aml_vdec_release_instance(struct aml_vdec_ctx *ctx)
> +{
> +=09if (ctx->codec_ops && ctx->codec_ops->exit)
> +=09=09ctx->codec_ops->exit(ctx);
> +}
> +
> +static int vb2ops_vdec_queue_setup(struct vb2_queue *vq,
> +=09=09=09=09   unsigned int *nbuffers,
> +=09=09=09=09   unsigned int *nplanes,
> +=09=09=09=09   unsigned int sizes[],
> +=09=09=09=09   struct device *alloc_devs[])
> +{
> +=09struct aml_vdec_ctx *ctx =3D vb2_get_drv_priv(vq);
> +=09struct v4l2_pix_format_mplane *pix_fmt;
> +=09unsigned int i;
> +
> +=09if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +=09=09pix_fmt =3D &ctx->pix_fmt[AML_FMT_SRC];
> +=09else
> +=09=09pix_fmt =3D &ctx->pix_fmt[AML_FMT_DST];
> +
> +=09if (*nplanes) {
> +=09=09if (*nplanes !=3D pix_fmt->num_planes)
> +=09=09=09return -EINVAL;
> +
> +=09=09for (i =3D 0; i < *nplanes; i++) {
> +=09=09=09if (sizes[i] < pix_fmt->plane_fmt[i].sizeimage) {
> +=09=09=09=09dev_err(&ctx->dev->plat_dev->dev,
> +=09=09=09=09=09"not supported sizeimage\n");
> +=09=09=09=09return -EINVAL;
> +=09=09=09}
> +=09=09=09alloc_devs[i] =3D &ctx->dev->plat_dev->dev;
> +=09=09}
> +=09} else {
> +=09=09if (vq->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +=09=09=09*nplanes =3D pix_fmt->num_planes;
> +=09=09else if (vq->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +=09=09=09*nplanes =3D 1;
> +
> +=09=09for (i =3D 0; i < *nplanes; i++) {
> +=09=09=09alloc_devs[i] =3D &ctx->dev->plat_dev->dev;
> +=09=09=09sizes[i] =3D pix_fmt->plane_fmt[i].sizeimage;
> +=09=09}
> +=09}
> +
> +=09if (*nplanes) {
> +=09=09dev_dbg(&ctx->dev->plat_dev->dev,
> +=09=09=09"type: %d, plane: %d, buf cnt: %d, size: [Y: %u, C: %u]\n",
> +=09=09=09vq->type, *nplanes, *nbuffers, sizes[0], sizes[1]);
> +=09=09return 0;
> +=09}
> +
> +=09return -EINVAL;
> +}
> +
> +static int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
> +{
> +=09struct aml_vdec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +=09struct v4l2_pix_format_mplane *pix_fmt;
> +=09unsigned int sizeimage =3D 0;
> +=09int i;
> +
> +=09if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
> +=09=09pix_fmt =3D &ctx->pix_fmt[AML_FMT_SRC];
> +=09else
> +=09=09pix_fmt =3D &ctx->pix_fmt[AML_FMT_DST];
> +
> +=09for (i =3D 0; i < pix_fmt->num_planes; i++) {
> +=09=09sizeimage =3D pix_fmt->plane_fmt[i].sizeimage;
> +=09=09if (vb2_plane_size(vb, i) < sizeimage)
> +=09=09=09return -EINVAL;
> +
> +=09=09if (V4L2_TYPE_IS_CAPTURE(vb->type)) {
> +=09=09=09vb2_set_plane_payload(vb, i,
> +=09=09=09=09=09      pix_fmt->plane_fmt[i].sizeimage);
> +=09=09=09dev_dbg(&ctx->dev->plat_dev->dev,
> +=09=09=09=09"%s type: %d set plane: %d, sizeimage: %d\n",
> +=09=09=09=09__func__, vb->vb2_queue->type, i,
> +=09=09=09=09pix_fmt->plane_fmt[i].sizeimage);
> +=09=09}
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int vb2_ops_vdec_buf_init(struct vb2_buffer *vb)
> +{
> +=09return 0;
> +}
> +
> +static void vb2_ops_vdec_buf_queue(struct vb2_buffer *vb)
> +{
> +=09struct aml_vdec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +=09struct vb2_v4l2_buffer *vb2_v4l2 =3D to_vb2_v4l2_buffer(vb);
> +
> +=09v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vb2_v4l2);
> +}
> +
> +static void vb2_ops_vdec_buf_finish(struct vb2_buffer *vb)
> +{
> +}
> +
> +static int vb2ops_vdec_start_streaming(struct vb2_queue *q, unsigned int=
 count)
> +{
> +=09struct aml_vdec_ctx *ctx =3D vb2_get_drv_priv(q);

You seem to be missing:
=09v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);

> +
> +=09if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +=09=09struct vb2_v4l2_buffer *src_buf;
> +
> +=09=09if (aml_vdec_init_dec_inst(ctx) < 0) {
> +=09=09=09while ((src_buf =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
> +=09=09=09=09v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_QUEUED);
> +=09=09=09return -EINVAL;
> +=09=09}
> +=09=09ctx->is_output_streamon =3D 1;

Are these state really needed ? Looks like vb2_is_streaming() will do the s=
ame.

> +=09} else {
> +=09=09ctx->is_cap_streamon =3D 1;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> +{
> +=09struct aml_vdec_ctx *ctx =3D vb2_get_drv_priv(q);
> +=09struct vb2_v4l2_buffer *src_buf =3D NULL, *dst_buf =3D NULL;
> +=09
> +=09if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +=09=09while ((src_buf =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
> +=09=09=09v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);

P.s. once your driver is async, you'll also have to call
v4l2_ctrl_request_complete().

> +=09=09ctx->is_output_streamon =3D 0;

This seems redundant with vb2.

> +=09} else {
> +=09=09while ((dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx)))
> +=09=09=09v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
> +=09=09ctx->is_cap_streamon =3D 0;
> +=09}
> +
> +=09if (!ctx->is_output_streamon && !ctx->is_cap_streamon)
> +=09=09aml_vdec_release_instance(ctx);

You seem to be missing something like this (picked from Hantro as an exampl=
e):

    20   =E2=94=82       v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_c=
tx, q);
    21   =E2=94=82
    22   =E2=94=82       if (V4L2_TYPE_IS_OUTPUT(q->type) &&               =
    =20
    23   =E2=94=82           v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
    24   =E2=94=82       =E2=94=82       v4l2_event_queue_fh(&ctx->fh, &han=
tro_eos_event);

> +}
> +
> +static int vb2ops_vdec_out_buf_validate(struct vb2_buffer *vb)
> +{
> +=09struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +=09vbuf->field =3D V4L2_FIELD_NONE;
> +=09return 0;
> +}

Add a fixme comment, or just implement interlace.

> +
> +static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
> +{
> +=09struct aml_vdec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +
> +=09v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_handler);
> +}
> +
> +static const struct vb2_ops aml_vdec_vb2_ops =3D {
> +=09.queue_setup =3D vb2ops_vdec_queue_setup,
> +=09.start_streaming =3D vb2ops_vdec_start_streaming,
> +=09.stop_streaming =3D vb2ops_vdec_stop_streaming,
> +
> +=09.buf_init =3D vb2_ops_vdec_buf_init,
> +=09.buf_prepare =3D vb2ops_vdec_buf_prepare,
> +=09.buf_out_validate =3D vb2ops_vdec_out_buf_validate,
> +=09.buf_queue =3D vb2_ops_vdec_buf_queue,
> +=09.buf_finish =3D vb2_ops_vdec_buf_finish,
> +=09.buf_request_complete =3D vb2ops_vdec_buf_request_complete,
> +};
> +
> +int aml_vdec_queue_init(void *priv, struct vb2_queue *src_vq,
> +=09=09=09struct vb2_queue *dst_vq)
> +{
> +=09struct aml_vdec_ctx *ctx =3D (struct aml_vdec_ctx *)priv;
> +=09struct aml_vdec_dev *dev =3D ctx->dev;
> +=09int ret =3D 0;
> +
> +=09src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +=09src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +=09src_vq->mem_ops =3D &vb2_dma_contig_memops;
> +=09src_vq->drv_priv =3D ctx;
> +=09src_vq->ops =3D &aml_vdec_vb2_ops;
> +=09src_vq->lock =3D &ctx->v4l2_intf_lock;
> +=09src_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +=09src_vq->supports_requests =3D true;
> +=09src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +=09ret =3D vb2_queue_init(src_vq);
> +=09if (ret) {
> +=09=09v4l2_info(&dev->v4l2_dev,
> +=09=09=09  "Failed to initialize videobuf2 queue(output)");
> +=09=09return ret;
> +=09}
> +
> +=09dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +=09dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +=09dst_vq->drv_priv =3D ctx;
> +=09dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> +=09dst_vq->ops =3D &aml_vdec_vb2_ops;
> +=09dst_vq->lock =3D &ctx->v4l2_intf_lock;
> +=09dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +=09dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +=09ret =3D vb2_queue_init(dst_vq);
> +=09if (ret) {
> +=09=09v4l2_info(&dev->v4l2_dev,
> +=09=09=09  "Failed to initialize videobuf2 queue(capture)");
> +=09=09vb2_queue_release(src_vq);
> +=09}
> +
> +=09return ret;
> +}
> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.h b/drivers/med=
ia/platform/amlogic/vdec/aml_vdec.h
> new file mode 100644
> index 000000000000..32f7fa245f7e
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + */
> +
> +#ifndef _AML_VDEC_H_
> +#define _AML_VDEC_H_
> +
> +#include "aml_vdec_drv.h"
> +
> +/**
> + * struct aml_vdec_v4l2_ctrl - helper type to declare supported ctrls
> + * @codec_type: codec id this control belong to (CODEC_TYPE_H264, etc.)
> + * @cfg: control configuration
> + */
> +struct aml_vdec_v4l2_ctrl {
> +=09unsigned int codec_type;
> +=09struct v4l2_ctrl_config cfg;
> +};
> +
> +struct aml_dec_type {
> +=09unsigned int codec_type;
> +=09const char *name;
> +};
> +
> +extern const struct v4l2_m2m_ops aml_vdec_m2m_ops;
> +extern const struct v4l2_ioctl_ops aml_vdec_ioctl_ops;
> +
> +int aml_vdec_ctrls_setup(struct aml_vdec_ctx *ctx);
> +int aml_vdec_queue_init(void *priv, struct vb2_queue *src_vq,
> +=09=09=09struct vb2_queue *dst_vq);
> +void aml_vdec_reset_fmts(struct aml_vdec_ctx *ctx);
> +#endif
> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c b/drivers=
/media/platform/amlogic/vdec/aml_vdec_drv.c
> new file mode 100644
> index 000000000000..1870d56659cf
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
> @@ -0,0 +1,260 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +
> +#include "aml_vdec.h"
> +#include "aml_vdec_hw.h"
> +#include "aml_vdec_platform.h"
> +
> +#define AML_VDEC_DRV_NAME "aml-vdec-drv"
> +
> +static int fops_vcodec_open(struct file *file)
> +{
> +=09struct aml_vdec_dev *dec_dev =3D video_drvdata(file);
> +=09struct aml_vdec_ctx *ctx =3D NULL;
> +=09int ret =3D 0;
> +
> +=09ctx =3D kzalloc_obj(*ctx, GFP_KERNEL);
> +=09if (!ctx)
> +=09=09return -ENOMEM;
> +
> +=09mutex_lock(&dec_dev->dev_mutex);

Why?

> +=09ctx->dev =3D dec_dev;
> +=09v4l2_fh_init(&ctx->fh, video_devdata(file));

hmm.
=09v4l2_fh_init(&ctx->fh, dec_dev);

> +=09file->private_data =3D &ctx->fh;

Why ?

> +=09v4l2_fh_add(&ctx->fh, file);
> +=09mutex_init(&ctx->v4l2_intf_lock);
> +=09init_waitqueue_head(&ctx->queue);

I believe this goes away once device_run() is asynchronous.

> +=09ctx->int_cond =3D 0;
> +
> +=09ctx->m2m_ctx =3D v4l2_m2m_ctx_init(dec_dev->m2m_dev_dec, ctx,
> +=09=09=09=09=09 &aml_vdec_queue_init);
> +=09if (IS_ERR(ctx->m2m_ctx)) {
> +=09=09ret =3D PTR_ERR((__force void *)ctx->m2m_ctx);
> +=09=09v4l2_err(&dec_dev->v4l2_dev, "Failed to v4l2_m2m_ctx_init() (%d)",=
 ret);
> +=09=09goto err_m2m_ctx_init;
> +=09}
> +
> +=09ctx->fh.m2m_ctx =3D ctx->m2m_ctx;
> +=09ret =3D aml_vdec_ctrls_setup(ctx);
> +=09if (ret) {
> +=09=09v4l2_err(&dec_dev->v4l2_dev, "Failed to init all ctrls (%d)", ret)=
;
> +=09=09goto err_ctrls_setup;
> +=09}
> +
> +=09aml_vdec_reset_fmts(ctx);
> +=09mutex_unlock(&dec_dev->dev_mutex);

Everything in this function is modifying ctx only, dev_dec have to have a
lifetime guarantied by the caller (holding on dev and its private data unti=
l the
open call have complete). I don't see a reason, from a driver point of view=
 why
we'd need that mutex here. If there is a real issue here, it would need fix=
ing
elsewhere.

> +
> +=09return ret;
> +
> +err_ctrls_setup:
> +=09v4l2_m2m_ctx_release(ctx->m2m_ctx);
> +err_m2m_ctx_init:
> +=09v4l2_fh_del(&ctx->fh, file);
> +=09v4l2_fh_exit(&ctx->fh);
> +=09kfree(ctx);
> +=09mutex_unlock(&dec_dev->dev_mutex);
> +
> +=09return ret;
> +}
> +
> +static int fops_vcodec_release(struct file *file)
> +{
> +=09struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> +
> +=09v4l2_m2m_ctx_release(ctx->m2m_ctx);
> +=09v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +=09v4l2_fh_del(&ctx->fh, file);
> +=09v4l2_fh_exit(&ctx->fh);
> +=09kfree(ctx);
> +
> +=09return 0;
> +}
> +
> +static const struct v4l2_file_operations aml_vdec_fops =3D {
> +=09.owner        =3D THIS_MODULE,
> +=09.open        =3D fops_vcodec_open,
> +=09.release    =3D fops_vcodec_release,
> +=09.poll        =3D v4l2_m2m_fop_poll,
> +=09.unlocked_ioctl    =3D video_ioctl2,
> +=09.mmap        =3D v4l2_m2m_fop_mmap,
> +};
> +
> +static const struct video_device dec_dev =3D {
> +=09.name =3D "aml_dev_drv",
> +=09.fops =3D &aml_vdec_fops,
> +=09.ioctl_ops =3D &aml_vdec_ioctl_ops,
> +=09.release =3D video_device_release,
> +=09.vfl_dir =3D VFL_DIR_M2M,
> +=09.device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
> +};
> +
> +static const struct media_device_ops aml_m2m_media_ops =3D {
> +=09.req_validate =3D vb2_request_validate,
> +=09.req_queue =3D v4l2_m2m_request_queue,
> +};
> +
> +static int aml_vdec_drv_probe(struct platform_device *pdev)
> +{
> +=09struct aml_vdec_dev *dev;
> +=09struct video_device *vfd_dec;
> +=09struct aml_vdec_hw *hw;
> +=09int ret =3D 0;
> +
> +=09dev =3D devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +=09if (!dev)
> +=09=09return -ENOMEM;
> +
> +=09dev->plat_dev =3D pdev;
> +=09mutex_init(&dev->dev_mutex);
> +
> +=09/*
> +=09 * The decoder hardware registers take 32-bit addresses only;
> +=09 * make sure DMA allocations (bitstream buffers, frame buffers
> +=09 * and firmware workspaces) stay below 4GB.
> +=09 */
> +=09ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +=09if (ret)
> +=09=09return dev_err_probe(&pdev->dev, ret,
> +=09=09=09=09     "Failed to set 32-bit DMA mask\n");
> +
> +=09ret =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> +=09if (ret)
> +=09=09return dev_err_probe(&pdev->dev, ret, "v4l2_device_register err\n"=
);
> +
> +=09vfd_dec =3D video_device_alloc();
> +=09if (!vfd_dec) {
> +=09=09v4l2_err(&dev->v4l2_dev, "Failed to allocate video device\n");
> +=09=09ret =3D -ENOMEM;
> +=09=09goto err_device_alloc;
> +=09}
> +=09*vfd_dec =3D dec_dev;
> +=09vfd_dec->v4l2_dev =3D &dev->v4l2_dev;
> +=09vfd_dec->lock =3D &dev->dev_mutex;
> +=09video_set_drvdata(vfd_dec, dev);
> +=09dev->vfd =3D vfd_dec;
> +=09platform_set_drvdata(pdev, dev);
> +
> +=09hw =3D devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
> +=09if (!hw) {
> +=09=09ret =3D -ENOMEM;
> +=09=09goto err_dec_mem_init;
> +=09}
> +=09dev->dec_hw =3D hw;
> +
> +=09dev->pvdec_data =3D of_device_get_match_data(&pdev->dev);
> +=09if (!dev->pvdec_data) {
> +=09=09dev_err(&pdev->dev, "no match data for this device\n");
> +=09=09ret =3D -ENODEV;
> +=09=09goto err_hw_init;
> +=09}
> +
> +=09ret =3D dev->pvdec_data->req_hw_resource(dev);
> +=09if (ret < 0)
> +=09=09goto err_hw_init;
> +
> +=09dev->m2m_dev_dec =3D v4l2_m2m_init(&aml_vdec_m2m_ops);
> +=09if (IS_ERR(dev->m2m_dev_dec)) {
> +=09=09v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem dec device\n");
> +=09=09ret =3D PTR_ERR((__force void *)dev->m2m_dev_dec);
> +=09=09goto err_m2m_dev_init;
> +=09}
> +
> +=09ret =3D video_register_device(vfd_dec, VFL_TYPE_VIDEO, -1);
> +=09if (ret) {
> +=09=09v4l2_err(&dev->v4l2_dev, "Failed to register video device");
> +=09=09goto err_vid_dev_register;
> +=09}
> +
> +=09dev->mdev.dev =3D &pdev->dev;
> +=09strscpy(dev->mdev.model, AML_VDEC_DRV_NAME, sizeof(dev->mdev.model));
> +=09media_device_init(&dev->mdev);
> +=09dev->mdev.ops =3D &aml_m2m_media_ops;
> +=09dev->v4l2_dev.mdev =3D &dev->mdev;
> +
> +=09ret =3D v4l2_m2m_register_media_controller(dev->m2m_dev_dec, vfd_dec,
> +=09=09=09=09=09=09 MEDIA_ENT_F_PROC_VIDEO_DECODER);
> +=09if (ret) {
> +=09=09v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\=
n");
> +=09=09goto error_m2m_mc_register;
> +=09}
> +
> +=09ret =3D media_device_register(&dev->mdev);
> +=09if (ret) {
> +=09=09v4l2_err(&dev->v4l2_dev, "Failed to register media device");
> +=09=09goto err_media_dev_register;
> +=09}
> +=09vdec_enable(dev->dec_hw);
> +=09return 0;
> +
> +err_media_dev_register:
> +=09v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +error_m2m_mc_register:
> +=09media_device_cleanup(&dev->mdev);
> +=09video_unregister_device(dev->vfd);
> +=09/* video_unregister_device() has released the video_device,
> +=09 * set the vfd_dec to NULL to avoid double free in err_dec_mem_init
> +=09 */
> +=09vfd_dec =3D NULL;
> +err_vid_dev_register:
> +=09v4l2_m2m_release(dev->m2m_dev_dec);
> +err_m2m_dev_init:
> +=09dev->pvdec_data->destroy_hw_resource(dev);
> +err_hw_init:
> +=09dev->dec_hw =3D NULL;
> +err_dec_mem_init:
> +=09/* In case of double-freeing the video_device from error_m2m_mc_regis=
ter */
> +=09if (vfd_dec)
> +=09=09video_device_release(vfd_dec);
> +err_device_alloc:
> +=09v4l2_device_unregister(&dev->v4l2_dev);
> +=09return ret;
> +}
> +
> +static void aml_vdec_drv_remove(struct platform_device *pdev)
> +{
> +=09struct aml_vdec_dev *dev =3D platform_get_drvdata(pdev);
> +
> +=09/*
> +=09 * The IRQ is devm-managed and only released after remove()
> +=09 * returns: mask it and wait for any in-flight threaded handler
> +=09 * before powering off the VDEC domain, otherwise the handler
> +=09 * could access powered-down registers.
> +=09 */
> +=09disable_irq(dev->dec_hw->dec_irq);
> +=09vdec_disable(dev->dec_hw);
> +=09media_device_unregister(&dev->mdev);
> +=09v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +=09video_unregister_device(dev->vfd);
> +=09media_device_cleanup(&dev->mdev);
> +
> +=09v4l2_m2m_release(dev->m2m_dev_dec);
> +=09dev->pvdec_data->destroy_hw_resource(dev);
> +=09v4l2_device_unregister(&dev->v4l2_dev);
> +}
> +
> +static const struct of_device_id aml_vdec_match[] =3D {
> +=09{ .compatible =3D "amlogic,s4-vdec", .data =3D &aml_vdec_s4_pdata },
> +=09{ }
> +};
> +
> +static struct platform_driver aml_vcodec_dec_driver =3D {
> +=09.probe    =3D aml_vdec_drv_probe,
> +=09.remove   =3D aml_vdec_drv_remove,
> +=09.driver   =3D {
> +=09=09.name    =3D AML_VDEC_DRV_NAME,
> +=09=09.of_match_table =3D aml_vdec_match,
> +=09},
> +};

Breaking my review here. Note on the best way to be reviewer friendly is to
split the low level driver helpers in its own patch. This way we can sort o=
ut
the HW access and give you an RB on it, and focus on the v4l2 part. It make=
s
respinning patch set and reviewing revision a lot faster. An example of pat=
chset
for you could have been:

1. Core loadable driver, resource allocation, IRQ registration, PM, etc.
2. Low level common helpers (non codec specifics)
3. V4L2 implementation and codec specific ops interface
4. H.264 implementation

Patches must build, it does not have to fully work until the full set is
applied. But it is very good habit to use the split to cover error handling
testing.

You may notice not getting a lot of human review, you spun a lot of revisio=
n,
and each time you endup at the bottom of the maintainer human review queue,=
 as
you patch is seen like in active development. I think its explain how you e=
nded
in v12 so quickly with so much work left to do.

I have a lot of comments coming on the H.264 implementation, including bug
report I have received from individual. I will come back tomorrow with thes=
e.
Meanwhile I wanted to highlight this big one, which imply a large amount of
unrorted conformance failure (you forget about JVT-FR-EXT existance it seem=
s).

> +
> +=09ctrls->scaling =3D
> +=09=09(struct v4l2_ctrl_h264_scaling_matrix *)aml_h264_get_ctrl(&ctx->ct=
rl_handler,
> +=09=09=09V4L2_CID_STATELESS_H264_SCALING_MATRIX);
> +=09if (WARN_ON(!ctrls->scaling))
> +=09=09return -EINVAL;

This is being set but not used. Its not covered by JVT-AVC_V1, but JVT-FR-E=
XT
do. The following test (420 only) are likely failing for you due to this bu=
g.
Please address in v13.

      brcm_freh3
      brcm_freh4
      brcm_freh5
      brcm_freh6
      brcm_freh8
      brcm_freh9
      brcm_freh10
      brcm_freh11
      freh1_b
      freh2_b
      freh7_b
      freh12_b
      FREXT01_JVC_D
      FREXT02_JVC_C
      FRExt1_Panasonic_D
      FRExt2_Panasonic_C
      FRExt3_Panasonic_E
      FRExt4_Panasonic_B
      FRExt_MMCO4_Sony_B
      HCAFF1_HHI_B
      HCAFR1_HHI_C
      HCAFR2_HHI_A
      HCAFR3_HHI_A
      HCAFR4_HHI_A
      HCAMFF1_HHI_B
      HPCADQ_BRCM_B
      HPCALQ_BRCM_B
      HPCAMAPALQ_BRCM_B
      HPCAMOLQ_BRCM_B
      HPCAQ2LQ_BRCM_B
      HPCVMOLQ_BRCM_B
      HVLCFI0_Sony_B
      HVLCMFF0_Sony_B
      HVLCPFF0_Sony_B

I would also like to mention that I notice the presence of per-slice refere=
nce
list calculation. This tells me you might have implemented the wrong decodi=
ng
mode. All this driver code is not required if you implement:

- V4L2_CID_STATELESS_H264_SLICE_PARAMS
- V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED

As an alternative, we have that for HEVC but not yet for H264, is to requir=
e
V4L2_CID_STATELESS_H264_SLICE_PARAMS in MODE_FRAME_BASED, though you'll end=
up
with a bit more friction with existing userspace implementation. For that
reason, I would not recommend, and suggest to follow the cedrus driver.

Nicolas

--=-X5FFK7Wmrpw/F4m44IPk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavYGWgAKCRDZQZRRKWBy
9Dm0AP0ZOJKWciYAUBtATNFFcxlcsTBhQth8NZbFh4llDvjPsgD9GiANbHKpBCVH
nNWDCRsYRWMQ/dAPWliXDnXdFeN/WAY=
=wbB3
-----END PGP SIGNATURE-----

--=-X5FFK7Wmrpw/F4m44IPk--
