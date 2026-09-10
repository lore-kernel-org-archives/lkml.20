Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334F83C3459
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029751; cv=none; b=sUI66SPxbMInBKN1RDgFrfwGqKIaD3PPMF2XlC+VU3KSNcBYavQiuC9FFcR7wjXWIEH30nzHoR6vNEapZga7J4Wbv9Bdvkdjgr5Qf3luf/IJ15A5GGBZf4Tg1EwaGA3DsOeylYgc6vMYpO4J5Vxott+umflU63N3JyZlhHAESCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029751; c=relaxed/simple;
	bh=JNl0zh8BnEuuCh7htFUt6zpVfviGIeCDSQw3Nu79xh8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D3mI4qNOnXTsLb1AYBW7qobgqvs46HwKWSZH0eX6JN1jPbTRuW75FZQeMB4zfRc1ndjK9pHCVyNx64EcbBmbndCjE7G/J8dBLEJofTYjW6GmYRFX5oR5hPd3o9ARj7YrTJP1kn5JPOvBBIqVFsK3lVTzGLsSW1FYIaEaCpLE/+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.66])
	by APP-01 (Coremail) with SMTP id qwCowAA3Cu5tbaJqvaeXBw--.20048S2;
	Thu, 10 Sep 2026 16:42:21 +0800 (CST)
Message-ID: <70931e5e69ba1a9db5f391792ec4c8b5124e670f.camel@iscas.ac.cn>
Subject: Re: [PATCH 1/2] drm/verisilicon: set blend mode for the primary
 plane
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Thu, 10 Sep 2026 16:42:20 +0800
In-Reply-To: <e61e51fb-9e29-46c9-888d-5ad377a89311@suse.de>
References: <20260901171703.1161592-1-zhengxingda@iscas.ac.cn>
	 <35cf76a67f7473d5ef86d01c812d680abc41687e.camel@iscas.ac.cn>
	 <e2a2f02f-13c4-4919-9344-db7afcd3368b@suse.de>
	 <d36bc08a7f954be25b0d3e0fe649698b3944f98a.camel@iscas.ac.cn>
	 <e61e51fb-9e29-46c9-888d-5ad377a89311@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:qwCowAA3Cu5tbaJqvaeXBw--.20048S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr4UCrW5Xr45Wr43Zr4rGrg_yoW5Wry7pF
	sIyFWqyFWrArn7JryUtw4UtFWaya1rG3Z7Wr15XwnrX3yDtr15uF48JrZxuFWkJr4kWr1Y
	qrs3JF9rur1UCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5k9NDUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-09-10=E5=9B=9B=E7=9A=84 10:31 +0200=EF=BC=8CThomas Zimmerman=
n=E5=86=99=E9=81=93=EF=BC=9A
> Hi
>=20
> Am 10.09.26 um 10:00 schrieb Icenowy Zheng:
> > =E5=9C=A8 2026-09-10=E5=9B=9B=E7=9A=84 09:58 +0200=EF=BC=8CThomas Zimme=
rmann=E5=86=99=E9=81=93=EF=BC=9A
> > > Hi
> > >=20
> > > Am 10.09.26 um 09:09 schrieb Icenowy Zheng:
> > > > =E5=9C=A8 2026-09-02=E4=B8=89=E7=9A=84 01:17 +0800=EF=BC=8CIcenowy =
Zheng=E5=86=99=E9=81=93=EF=BC=9A
> > > > > Blend modes are now required to expose pixel formats w/
> > > > > alpha.
> > > > >=20
> > > > > As it's the primary plane and blending is explicitly
> > > > > disabled,
> > > > > just
> > > > > expose PIXEL_NONE blend mode.
> > > > Gently ping for reviews.
> > > What do these alpha formats do?=C2=A0 Are they a hardware feature?=C2=
=A0 It
> > > looks
> > > like they are programmable, but don't differ from XRGB at all.
> > I think they're for consistency with overlay planes.
>=20
> But there are no overlay planes in this driver, are there?
>=20
> What I want to get at is that it might be preferable to remove ARGB=20
> entirely from the primary plane if it does not to serve a purpose.
> But=20
> if the driver can do something useful with these formats, it might be
> worth exposing that instead.

The device has overlay planes, but they're currently not supported.

The manual for MA35D1 does list formats with alpha for
DcregFrameBufferConfig0 register, and the hardware can properly handle
these format values (by ignoring the A bits).

Thanks,
Icenowy
>=20
> In pl111, we now remove the ARGB foramts because the hardware does
> not=20
> handle them at all. The situation seems less clear in verisilicon.
>=20
> Best regards
> Thomas
>=20
>=20
> >=20
> > Thanks,
> > Icenowy
> >=20
> > > Best regards
> > > Thomas
> > >=20
> > > > Thanks,
> > > > Icenowy
> > > >=20
> > > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > > ---
> > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/verisilicon/vs_primary_plane.c =
| 3 +++
> > > > > =C2=A0=C2=A0=C2=A01 file changed, 3 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > > > > b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > > > > index 1f2be41ae496c..8d58682d88ef8 100644
> > > > > --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > > > > +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > > > > @@ -7,6 +7,7 @@
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0#include <drm/drm_atomic.h>
> > > > > =C2=A0=C2=A0=C2=A0#include <drm/drm_atomic_helper.h>
> > > > > +#include <drm/drm_blend.h>
> > > > > =C2=A0=C2=A0=C2=A0#include <drm/drm_crtc.h>
> > > > > =C2=A0=C2=A0=C2=A0#include <drm/drm_fourcc.h>
> > > > > =C2=A0=C2=A0=C2=A0#include <drm/drm_framebuffer.h>
> > > > > @@ -179,5 +180,7 @@ struct drm_plane
> > > > > *vs_primary_plane_init(struct
> > > > > drm_device *drm_dev, struct vs_dc
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0	drm_plane_helper_add(plane,
> > > > > &vs_primary_plane_helper_funcs);
> > > > > =C2=A0=C2=A0=20
> > > > > +	drm_plane_create_blend_mode_property(plane,
> > > > > +				=09
> > > > > BIT(DRM_MODE_BLEND_PIXEL_NONE));
> > > > > =C2=A0=C2=A0=C2=A0	return plane;
> > > > > =C2=A0=C2=A0=C2=A0}

