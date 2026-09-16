Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEA04BA1CB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552897; cv=none; b=HNPvDrrzd2YnM/Qwlrw4F86Fu8oK8QzEsaEEgcZPO2bAcRVK0Z3shvkZf6bbxVBI0PYrYygxuVmMGzk4eC1HHuwEJ2kYbvXCyE7pSV6RpPKMv8b45PVELfTbwFUW6Wqw3p8ilPEoI0dn8gXG1mnXIdHe2n9ER60NG1IQkzqQb/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552897; c=relaxed/simple;
	bh=5YFvNeYLgOcLiShSUq1QjPx9Xi/y8+FTllXNRVNT5xI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jloRePdLVPXBR+m7iXMiGS3/VJitEGkQ2Uo8EGYr3LnDBxOtpkSTRTh0VgTlTR5fs03woWuA5bW1HtKwt9zso8ybGxw7H/+MKxzOSXBcwFrFRr/gzLMIOtaK86uot34MMzAAcc9G4f5O2WM2ecT/yq8v47cBdNf28yU5JfcX8Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.44])
	by APP-05 (Coremail) with SMTP id zQCowAA3pD7caKpqW6tnCA--.15049S2;
	Wed, 16 Sep 2026 18:01:00 +0800 (CST)
Message-ID: <83c63bc0e24cf0187e55105559237c77025353b8.camel@iscas.ac.cn>
Subject: Re: [PATCH 1/2] drm/verisilicon: add primary modifier for format
 tables
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 16 Sep 2026 18:01:00 +0800
In-Reply-To: <20260910095000.3505878-1-zhengxingda@iscas.ac.cn>
References: <20260910095000.3505878-1-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:zQCowAA3pD7caKpqW6tnCA--.15049S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1DAFW3ArW8Ww15ZF4rAFb_yoW5Kry3pa
	1xAryqyFWrAw45tFy7JayUKay5C3Z7Xas2grnxuw17urn8Kr15WFW5Kr9IkFZ8KrWxAw17
	trnYkry7uFW2yrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8SdgJUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-09-10=E5=9B=9B=E7=9A=84 17:49 +0800=EF=BC=8CIcenowy Zheng=E5=
=86=99=E9=81=93=EF=BC=9A
> Currently the format tables are only used for the primary plane.
>=20
> Add primary modifiers to names related to the tables.
>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Applied (the whole patchset) onto drm-misc-fixes.

Thanks,
Icenowy

> ---
> =C2=A0drivers/gpu/drm/verisilicon/vs_hwdb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++------
> =C2=A0drivers/gpu/drm/verisilicon/vs_hwdb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0drivers/gpu/drm/verisilicon/vs_primary_plane.c |=C2=A0 4 ++--
> =C2=A03 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c
> b/drivers/gpu/drm/verisilicon/vs_hwdb.c
> index 2a0f7c59afa3a..56aa450443068 100644
> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
> @@ -10,7 +10,7 @@
> =C2=A0#include "vs_dc_top_regs.h"
> =C2=A0#include "vs_hwdb.h"
> =C2=A0
> -static const u32 vs_formats_array_no_yuv444[] =3D {
> +static const u32 vs_primary_formats_array_no_yuv444[] =3D {
> =C2=A0	DRM_FORMAT_XRGB4444,
> =C2=A0	DRM_FORMAT_XBGR4444,
> =C2=A0	DRM_FORMAT_RGBX4444,
> @@ -44,7 +44,7 @@ static const u32 vs_formats_array_no_yuv444[] =3D {
> =C2=A0	/* TODO: non-RGB formats */
> =C2=A0};
> =C2=A0
> -static const u32 vs_formats_array_with_yuv444[] =3D {
> +static const u32 vs_primary_formats_array_with_yuv444[] =3D {
> =C2=A0	DRM_FORMAT_XRGB4444,
> =C2=A0	DRM_FORMAT_XBGR4444,
> =C2=A0	DRM_FORMAT_RGBX4444,
> @@ -79,13 +79,13 @@ static const u32 vs_formats_array_with_yuv444[] =3D
> {
> =C2=A0};
> =C2=A0
> =C2=A0static const struct vs_formats vs_formats_no_yuv444 =3D {
> -	.array =3D vs_formats_array_no_yuv444,
> -	.num =3D ARRAY_SIZE(vs_formats_array_no_yuv444)
> +	.primary_array =3D vs_primary_formats_array_no_yuv444,
> +	.primary_num =3D
> ARRAY_SIZE(vs_primary_formats_array_no_yuv444)
> =C2=A0};
> =C2=A0
> =C2=A0static const struct vs_formats vs_formats_with_yuv444 =3D {
> -	.array =3D vs_formats_array_with_yuv444,
> -	.num =3D ARRAY_SIZE(vs_formats_array_with_yuv444)
> +	.primary_array =3D vs_primary_formats_array_with_yuv444,
> +	.primary_num =3D
> ARRAY_SIZE(vs_primary_formats_array_with_yuv444)
> =C2=A0};
> =C2=A0
> =C2=A0static struct vs_chip_identity vs_chip_identities[] =3D {
> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.h
> b/drivers/gpu/drm/verisilicon/vs_hwdb.h
> index 2065ecb730437..616076d931a57 100644
> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.h
> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.h
> @@ -10,8 +10,8 @@
> =C2=A0#include <linux/types.h>
> =C2=A0
> =C2=A0struct vs_formats {
> -	const u32 *array;
> -	unsigned int num;
> +	const u32 *primary_array;
> +	unsigned int primary_num;
> =C2=A0};
> =C2=A0
> =C2=A0struct vs_chip_identity {
> diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> index 1f2be41ae496c..8e94491693019 100644
> --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> @@ -168,8 +168,8 @@ struct drm_plane *vs_primary_plane_init(struct
> drm_device *drm_dev, struct vs_dc
> =C2=A0
> =C2=A0	plane =3D drmm_universal_plane_alloc(drm_dev, struct
> drm_plane, dev, 0,
> =C2=A0					=C2=A0=C2=A0 &vs_primary_plane_funcs,
> -					=C2=A0=C2=A0 dc->identity.formats-
> >array,
> -					=C2=A0=C2=A0 dc->identity.formats-
> >num,
> +					=C2=A0=C2=A0 dc->identity.formats-
> >primary_array,
> +					=C2=A0=C2=A0 dc->identity.formats-
> >primary_num,
> =C2=A0					=C2=A0=C2=A0 NULL,
> =C2=A0					=C2=A0=C2=A0 DRM_PLANE_TYPE_PRIMARY,
> =C2=A0					=C2=A0=C2=A0 NULL);

