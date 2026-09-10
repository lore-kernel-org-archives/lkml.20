Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F983DE450
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030973; cv=none; b=tSv7lCFPDTAQxKXQ4Svg1clP1d/dyj/Kusf4U2GLjxaBB4uvEgHk8J4ohzrTYgeM9P16uR7AqeibR9thQgWQcsabhEB90zRLiK0zewqq+NRrGvwZJc6Q5KwzVou2D/tmn6rHoJ7J16Raq3Qjt7Zs3cBQZBYhcGqSt71wUoaBwDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030973; c=relaxed/simple;
	bh=3/iokgdjLiyXfwlt0qdIDv7p5B3UZ2b5oxBrnfoUuW8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bf/Wor5vX62lCSoHmn3V6EjH6Lm/wEoxYcn70uCQhshv2eY//oBAAPBnCx0bPGdP3AlDqsuzDoB95JRDJzIUO6HA30YTDvmqtY9thpCKocA2/5Kez4nv7aNLuaYXlWe6GTamYa0T09CsZHLV4B01JaiNM802bU8ntGng/NPMoHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.66])
	by APP-01 (Coremail) with SMTP id qwCowADXqOwycqJqDeuXBw--.35125S2;
	Thu, 10 Sep 2026 17:02:43 +0800 (CST)
Message-ID: <76f48282eb5deb217dd1c8b6dc547e4a058580ad.camel@iscas.ac.cn>
Subject: Re: [PATCH 1/2] drm/verisilicon: set blend mode for the primary
 plane
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Thu, 10 Sep 2026 17:02:42 +0800
In-Reply-To: <924e1372-6fe2-42ae-a57a-d44d3cf08f5a@suse.de>
References: <20260901171703.1161592-1-zhengxingda@iscas.ac.cn>
	 <35cf76a67f7473d5ef86d01c812d680abc41687e.camel@iscas.ac.cn>
	 <e2a2f02f-13c4-4919-9344-db7afcd3368b@suse.de>
	 <d36bc08a7f954be25b0d3e0fe649698b3944f98a.camel@iscas.ac.cn>
	 <e61e51fb-9e29-46c9-888d-5ad377a89311@suse.de>
	 <0f79f3bd5175285de4b2112e6419a8f373b0ff81.camel@iscas.ac.cn>
	 <924e1372-6fe2-42ae-a57a-d44d3cf08f5a@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:qwCowADXqOwycqJqDeuXBw--.35125S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFy8Xry7Wr43Wry3JryDtrb_yoWrCw15pF
	WDAFWUKFZ5Jrn7AryUtw1UtFyava1rG3WkWr15J3W7XrZ8tr17AFWUJr98uFykJr48Wr15
	trs8JF9rZr1UCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07bYYLPUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-09-10=E5=9B=9B=E7=9A=84 10:56 +0200=EF=BC=8CThomas Zimmerman=
n=E5=86=99=E9=81=93=EF=BC=9A
> Hi
>=20
> Am 10.09.26 um 10:45 schrieb Icenowy Zheng:
> > =E5=9C=A8 2026-09-10=E5=9B=9B=E7=9A=84 10:31 +0200=EF=BC=8CThomas Zimme=
rmann=E5=86=99=E9=81=93=EF=BC=9A
> > > Hi
> > >=20
> > > Am 10.09.26 um 10:00 schrieb Icenowy Zheng:
> > > > =E5=9C=A8 2026-09-10=E5=9B=9B=E7=9A=84 09:58 +0200=EF=BC=8CThomas Z=
immermann=E5=86=99=E9=81=93=EF=BC=9A
> > > > > Hi
> > > > >=20
> > > > > Am 10.09.26 um 09:09 schrieb Icenowy Zheng:
> > > > > > =E5=9C=A8 2026-09-02=E4=B8=89=E7=9A=84 01:17 +0800=EF=BC=8CIcen=
owy Zheng=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > Blend modes are now required to expose pixel formats w/
> > > > > > > alpha.
> > > > > > >=20
> > > > > > > As it's the primary plane and blending is explicitly
> > > > > > > disabled,
> > > > > > > just
> > > > > > > expose PIXEL_NONE blend mode.
> > > > > > Gently ping for reviews.
> > > > > What do these alpha formats do?=C2=A0 Are they a hardware
> > > > > feature?=C2=A0 It
> > > > > looks
> > > > > like they are programmable, but don't differ from XRGB at
> > > > > all.
> > > > I think they're for consistency with overlay planes.
> > > But there are no overlay planes in this driver, are there?
> > >=20
> > > What I want to get at is that it might be preferable to remove
> > > ARGB
> > > entirely from the primary plane if it does not to serve a
> > > purpose.
> > > But
> > > if the driver can do something useful with these formats, it
> > > might be
> > > worth exposing that instead.
> > On DC8000 display controllers (support for them is WIP by Joey Lu)
> > there seem to be no way to control the blend behavior of the
> > primary
> > plane.
> >=20
> > On DC8200 display controllers the primary plane does have a
> > blending
> > register, although it seems to be blending with pure black.
>=20
> IIRC there's a background-color property for the CRTC.=C2=A0 So it might
> be=20
> possible to expose this as read-only property. (Not sure.)

The hardware has a "background color" per plane, but it seems that this
is only for the colorkey (punching out special color values) feature,
not for alpha blending.

>=20
> >=20
> > Maybe it's viable to just remove the ARGB formats now, and re-
> > introduce
> > them when overlays are being implemented (and only expose them for
> > the
> > overlay)?
>=20
> I see. Thanks for digging through this. I've meanwhile acked the
> patches=20
> as there's at least some support in hardware.

As the DC8000 support is being developed (a new revision of that
patchset just appeared on this Tuesday), and on that hardware the A
channel has no meaning except for being ignored (no blend configuration
register for the primary plane), maybe I still need to remove alpha
formats (at least for DC8000)?

Although in such case, when the overlay support is going to be
introduced, two format tables need to be present -- one with alpha and
one without.

Thanks,
Icenowy

>=20
> Best regards
> Thomas
>=20
>=20
> >=20
> > Thanks,
> > Icenowy
> >=20
> > > In pl111, we now remove the ARGB foramts because the hardware
> > > does
> > > not
> > > handle them at all. The situation seems less clear in
> > > verisilicon.
> > >=20
> > > Best regards
> > > Thomas
> > >=20
> > >=20
> > > > Thanks,
> > > > Icenowy
> > > >=20
> > > > > Best regards
> > > > > Thomas
> > > > >=20
> > > > > > Thanks,
> > > > > > Icenowy
> > > > > >=20
> > > > > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > > > > ---
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/verisilicon/vs_primar=
y_plane.c | 3
> > > > > > > +++
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A01 file changed, 3 insertions(+)
> > > > > > >=20
> > > > > > > diff --git
> > > > > > > a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > > > > > > b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > > > > > > index 1f2be41ae496c..8d58682d88ef8 100644
> > > > > > > --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > > > > > > +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > > > > > > @@ -7,6 +7,7 @@
> > > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0#include <drm/drm_atomic.h>
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0#include <drm/drm_atomic_helper.h>
> > > > > > > +#include <drm/drm_blend.h>
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0#include <drm/drm_crtc.h>
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0#include <drm/drm_fourcc.h>
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0#include <drm/drm_framebuffer.h>
> > > > > > > @@ -179,5 +180,7 @@ struct drm_plane
> > > > > > > *vs_primary_plane_init(struct
> > > > > > > drm_device *drm_dev, struct vs_dc
> > > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	drm_plane_helper_add(plane,
> > > > > > > &vs_primary_plane_helper_funcs);
> > > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > > +	drm_plane_create_blend_mode_property(plane,
> > > > > > > +				=09
> > > > > > > BIT(DRM_MODE_BLEND_PIXEL_NONE));
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	return plane;
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0}

